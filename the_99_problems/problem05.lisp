#|
    5. (*) Reverse a list
|#

(defun my-rev-aux (my-list acc)
  (let ((head (car my-list))
        (tail (cdr my-list)))
    (if (not head)
        acc
        (let ((new-acc (cons head acc)))
          (my-rev-aux tail new-acc)))))

;; With auxiliar function
(defun my-rev-list (my-list)
  (my-rev-aux my-list '()))

(print
 (let* ((my-list '(1 2 3 4 5 6 7))
        (fmt-str "My list is: ~S and my-rev list is: ~S")
        (my-rev (my-rev-list my-list)))
   (format nil fmt-str my-list my-rev)))

;; Inner function
(defun my-reverse-list (my-list)
  (defun in-rev (in-list acc)
    (let ((head (car in-list))
          (tail (cdr in-list)))
      (if (not head)
          acc
          (let ((new-acc (cons head acc)))
            (in-rev tail new-acc)))))
  (in-rev my-list '()))

(print
 (let* ((my-list '(1 2 3 4 5 6 7))
        (fmt-str "My list is: ~S and my-reverse list is: ~S")
        (my-reverse (my-reverse-list my-list)))
   (format nil fmt-str my-list my-reverse)))
