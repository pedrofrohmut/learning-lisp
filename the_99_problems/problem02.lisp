#|
  Find the last but one box of a list.
  Example:
  * (my-but-last '(a b c d))
  (C D)
|#

(defun my-but-last (arg-list)
  (let ((head (car arg-list))
        (tail (cdr arg-list)))
    (if (not (cdr tail))
        (list head (car tail))
        (my-but-last tail))))

(print
 (format nil "My list last two: ~S" (my-but-last '(A B C D E))))
