(defun hello (name)
  (print
   (concatenate 'string "Hello, " name "!")))

(defun factorial (n)
  (if (eq n 1)
      1
    (* n (factorial (- n 1)))))

(defun print-factorial (n)
  ;; Using a let* to avoid nesting lets
  (let* ((result (factorial n))
         (output (format nil "Factorial of ~D is ~D" n result)))
    (print output)))

(defun main ()
  (hello "Bob")
  (print-factorial 5))

(main)
