#|
    4. (*) Find the number of elements of a list
|#

;; With tail call optimization (aka using an accumulator to return at the end
;; instead of reversing all the call stack doing the calculations).
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

;; Without tail call optimization, but also works fine.
(defun my-len2 (my-list)
  (if (not my-list)
    0
    (destructuring-bind (head &rest tail) my-list
      (+ 1 (my-len2 tail)))))

(defun test4 (my-list)
  (print
    (format nil "Number of the elements in the list ~S is ~D" my-list (my-len2 my-list))))

(test4 '(1 2 3 4 5 6 7))
