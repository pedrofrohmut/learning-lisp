#|
    7. (**) Flatten a nested list structure.
    Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

    Example:
    * (my-flatten '(a (b (c d) e)))
    (A B C D E)
|#

;; return head . (my-fun tail)

(defun my/flatten (my-list)

(defun test-07 '(a (b (c d) e)))
