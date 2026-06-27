#|
    Find the number of elements of a list
|#

(defun my-len (my-list)
  (defun my-inner-len (in-list in-n)
    (let ((head (car in-list))
          (tail (cdr in-list)))
      (if (not head)
          in-n
          (my-inner-len tail (+ in-n 1)))))
  (my-inner-len my-list 0))

(print
 (let ((my-list '(1 2 3 4 5 6)))
   (format nil "Number of the elements in the list ~S is ~D" my-list (my-len my-list))))
