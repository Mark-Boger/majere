;;;; majere.lisp

(in-package #:majere)
(defvar *fonts-loaded-p* nil)

(defun init-fonts ()
  (mcclim-truetype::register-all-ttf-fonts (find-port)
                                           (asdf:system-relative-pathname
                                            "majere"
                                            "Fonts/"
                                            :type :directory))
  (setf *fonts-loaded-p* t))

(init-fonts)

(setf mcclim-truetype::*dpi* 196)

(define-application-frame majere ()
  ((current-file
    :accessor current-file
    :initarg :current-file))
  (:menu-bar nil)
  (:panes
   (dice-log
    :application)
   (character-sheet
    (vertically ()
      (1/8 (make-pane 'application-pane :name 'info
                                        :display-function #'display-character-info))
      (7/8 (horizontally ()
             (1/8 (make-pane 'application-pane :name 'stats
                                               :display-function #'display-stats))
             (1/8 (make-pane 'application-pane :name 'skills
                                               :display-function #'display-skills))
             (6/8 (make-pane 'application-pane :name 'hmm)))))))
  (:layouts
   (defualt
       (horizontally ()
         (1/8 dice-log)
         (7/8 character-sheet)))))


(defun min-max-sync (button &key (min -1.0) (max 1.0) (stream *query-io*))
  (declare (ignore button))
  (accepting-values (stream :resynchronize-every-pass t)
    (fresh-line stream)
    (setf min (accept 'real :default min :prompt "Min:" :stream stream))
    (fresh-line stream)
    (setf max (accept 'real :default max :prompt "Max:" :stream stream))
    (when (< max min)
      (rotatef min max)))
  (values min max))

(defmethod display-doc-title ((frame majere) stream)
  (let ((header-size (text-size stream "Document: ")))
    (draw-text* stream "Document: " 10 40)
    (if (slot-boundp frame 'current-file)
        (draw-text* stream (current-file frame) header-size 40)
        (draw-text* stream "Untitled" header-size 40))))

(defmethod display-doc ((frame majere) stream)
  (let ((line-height (line-height frame 'document))
        (line-ascent (text-ascent frame 'document))
        (i 0))
    (do-file (line (current-file frame))
      (draw-text* stream line 0 (+ (* i line-height) line-ascent))
      (incf i))))

(defun line-height (frame pane-name)
  (text-style-height *default-text-style* (get-frame-pane frame pane-name)))

(defun text-ascent (frame pane-name)
  (text-style-ascent *default-text-style* (get-frame-pane frame pane-name)))

(defmacro do-file ((line-variable path &key (key '#'identity)) &body body)
  (let ((str (gensym))
        (var (gensym)))
    `(with-open-file (,str ,path :direction :input)
       (do ((,var (read-line ,str nil)
                  (read-line ,str nil)))
           ((not ,var))
         (let ((,line-variable (funcall ,key ,var)))
           ,@body)))))

(defun run-majere ()
  (unless *fonts-loaded-p*
    (init-fonts))
  (run-frame-top-level (make-application-frame 'majere
                                               :current-file "~/xrandr-right.sh")))
