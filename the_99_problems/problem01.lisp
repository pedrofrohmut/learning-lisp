#|
  1. Find the last box of a list.
  Example:
  * (my-last '(a b c d))
  (D)
|#

(defun my-last (arg-list)
  (let ((head (car arg-list))
        (tail (cdr arg-list)))
    (if (not tail)
        head
        (my-last tail))))

(print
 (format nil "My last: ~D" (my-last '(1 2 3 4 5))))
