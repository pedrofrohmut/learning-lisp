#|
    6. (*) Find out whether a list is a palindrome.
    A palindrome can be read forward or backward; e.g. (x a m a x).
|#

(defun my/is-lists-equal (list1 list2)
  (if (not list1)
      t
      (let ((head1 (car list1))
            (head2 (car list2))
            (tail1 (cdr list1))
            (tail2 (cdr list2)))
        (if (not (= head1 head2))
            nil
            (my/is-lists-equal tail1 tail2)))))

(defun my/is-list-palindrome (my-list)
  (let ((my-rev-list (reverse my-list)))
    (my/is-lists-equal my-list my-rev-list)))

(defun my/test-06 (my-list)
  (print
   (let ((is-palindrome (if (my/is-list-palindrome my-list) "yes" "no"))
         (fmt-str "List1: ~S is a palindrome? ~A"))
     (format nil fmt-str my-list is-palindrome))))

(my/test-06 '(1 2 3 2 1)) ;; yes
(my/test-06 '(1 2 3 4 5)) ;; no
(my/test-06 '(1 2 1)) ;; yes
(my/test-06 '(1 2 3 1)) ;; no
(my/test-06 '(1 2 3 4 5 6 4 3 2 1)) ;; no
(my/test-06 '(1 2 3 4 5 4 3 2 1)) ;; yes
