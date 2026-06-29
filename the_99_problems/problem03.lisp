#|
    3. (*) Find the K'th element of a list.
    The first element in the list is number 1.
    Example:
    * (element-at '(a b c d e) 3)
    C
|#

(defvar pos 3)

(defun my-element-at (my-list position)
  (let ((head (car my-list))
        (tail (cdr my-list)))
        (if (eq position 1)
            head
            (my-element-at tail (- position 1)))))

(print
 (format nil "My element at ~D is ~D" pos (my-element-at '(A B C D E) pos)))
