;;;; Describe my program (only time you need 4 ;)

;;; With 3 you have a basic comment

;; Comment indented with your code

; Comment after a line of code

#|
    This is a multiline comment
|#

;;; Capitilize the output. Other options are: :upcase :downcase
(setq *print-case* :capitalize)

;;; The Hello, World! function that starts it all
(defun hello-world ()
  (format t "Hello, World~%"))

;;; Global variables (it is a covention to add ** around it)
(defvar *foo* "bar")
(defvar *name* "")

;; Changing the value of my variable
(defvar *my-number* 0) ;; Defines a global variable
(setf *my-number* 6) ;; Changes the value of my variable

;; ~a - Shows the value
;; ~s - Shows quotes around the value
;; ~10a - Adds 10 spaces for the value with extra spaces to the right
;; ~10@a - Adds 10 spaces for the value with extra spaces to the left
(defun hello ()
  (print "What is your name?~%")
  (setq name (read))
  (print (format nil "Hello, ~A!" name)))

;; (hello)

;; Everything in lisp is a function

(defun random-calcs ()
  (+ 5 9) ;; this is a list [+] [5] [4] [nil]
  (+ 5 (- 6 2)) ;; Stuff can be nested
  )

(defconstant PI 3.141592653589)

;; t as first argument make it print to stdout
(format t "Number with commas: ~:d~%" 1000000)
(format t "PI to 5 characters: ~5f~%" PI) ;; 3.141
(format t "PI to 5 decimals: ~,5f~%" PI)  ;; 3.14159
(format t "10 Percent: ~,,2f~%" .10) ;; 10.0
(format t "10 Dollars: ~$~%" 10) ;; 10.00

;; Random math stuff
(+ 5 4) ;; 9
(- 5 4) ;; 1
(* 5 4) ;; 20
(/ 5 4) ;; 1.25

;; Mod and Rem operations: http://clhs.lisp.se/Body/f_mod_r.htm
(rem 5 4) ;; 1 (reminder: performs the truncate op)
(mod 5 4) ;; 1 (modulus: performs the floor op)
(rem -1 5) ;; -1
(mod -1 5) ;; 4

;; More math stuff
(expt 4 2) ;; 16 (4 ^ 2)
(sqrt 81) ;; 9 (square root)
(exp 1) ;; 2.7182817
(log 1000 10) ;; 3
(eq 'dog 'dog) ;; Equals?
(floor 5.5) ;; 5 (round down)
(ceiling 5.5) ;; 6 (round up)
(max 5 10) ;; 10
(min 5 10) ;; 5
(oddp 5) ;; t (is odd value?)
(evenp 5) ;; nil (is even value?)
(numberp 2) ;; t (is number value?)
(null nil) ;; t

;; 'Pedro here is a symbol
(defparameter *myname* 'Pedro)

;; Use 'eq' to compare with a symbol. For the rest use 'equal'
(format t "(eq *myname* 'Pedro) = ~d~%" (eq *myname* 'Pedro)) ;; nil

(format t "(equal 'car 'truck) = ~d~%" (equal 'car 'truck)) ;; nil
(format t "(equal 10 10) = ~d~%" (equal 10 10)) ;; t
(format t "(equal 5.5 5.3) = ~d~%" (equal 5.5 5.3)) ;; nil

;; You can escape the double quotes with backslash
(format t "(equal \"string\" \"String\") = ~d~%" (equal "string" "String")) ;; nil

(format t "(equal (list 1 2 3) (list 1 2 3)) = ~d~%" (equal (list 1 2 3) (list 1 2 3))) ;; t

(defconstant FOO "foo")
(format t "(defconstant FOO \"foo\") (equal foo \"bar\") ~d~%" (equal FOO "bar")) ;; nil
(format t "(defconstant FOO \"foo\") (equal foo \"foo\") ~d~%" (equal FOO "foo")) ;; t

;; Even though the 1.0 and 1 are different types they are equal
(format t "(equalp 1.0 1) = ~d~%" (equalp 1.0 1)) ;; t

;; Even though the Case is different the result is T
(format t "(equalp \"Derek\" \"derek\") = ~d~%" (equalp "Derek" "derek")) ;; t

;; =============================================================================

(defvar *age* 18)

(if (not (>= *age* 18))
  (format t "You can't vote~%")
  (format t "You can vote~%"))

(if (and (>= *age* 14) (< *age* 67))
  (format t "Time for work~%")
  (format t "Work if you want~%"))

(defvar *num* 2)
(defvar *num-2* 2)
(defvar *num-3* 2)

(if (= *num* 2)
  ;; progn - To execute multiple statements in the if condition (make it like a block of statements)
  (progn
    (setf *num-2* (* *num-2* 2))
    (setf *num-3* (* *num-3* 3))
    (format t "It is equal to 2~%"))
  (format t "Not equal to 2~%"))

(defvar *age-2* 5)

;; Case expression
(defun get-school (age)
  (case age
    (5 (print "Kindergarten"))
    (6 (print "First grade"))
    (otherwise (print "Middle school"))))

(get-school *age-2*)

(terpri) ;; prints a new line to stdout

;; when - If condition without the else block
(when (= *age-2* 18)
  (setf *num-3* 18)
  (format t "Go to college you are ~d~%" *num-3*))

;; unless - Same of when but the opposite
(unless (>= *age-2* 18)
  (setf *num-3* 24)
  (format t "You cannot drink alcohol~%"))
