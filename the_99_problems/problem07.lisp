#|
    7. (**) Flatten a nested list structure.

    Transform a list, possibly holding lists as elements into a `flat' list by replacing
    each list with its elements (recursively).

    Example:
    * (my-flatten '(a (b (c d) e)))
    (A B C D E)
|#

;; TODO: Impl this
(defun my/flatten ()
  )

(defun test-07 (struc)
  (print
   (format nil "Structure before: ~S is flatten to: ~S" struc (my/flatten struc))))

(test-07 '(a (b (c d) e)))
