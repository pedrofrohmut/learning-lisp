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

(format t "If not ->~%")
(if (not (>= *age* 18))
  (format t "You can't vote~%")
  (format t "You can vote~%"))

(format t "If and ->~%")
(if (and (>= *age* 14) (< *age* 67))
  (format t "Time for work~%")
  (format t "Work if you want~%"))

(defvar *num* 2)
(defvar *num-2* 2)
(defvar *num-3* 2)

(format t "Progn ->~%")
(if (= *num* 2)
  ;; progn - To execute multiple statements in the if condition (make it like a block of statements)
  (progn
    (setf *num-2* (* *num-2* 2))
    (setf *num-3* (* *num-3* 3))
    (format t "It is equal to 2~%"))
  (format t "Not equal to 2~%"))

(defvar *age-2* 18)

;; Case expression
(format t "Case ->~%")
(defun get-school (age)
  (case age
    (5 (format t "Kindergarten~%"))
    (6 (format t "First grade~%"))
    (otherwise (format t "Middle school~%"))))

(get-school *age-2*)

;; Insert new line
(format t "Terpri ->~%")
(terpri) ;; prints a new line to stdout

;; when - If condition without the else block
(format t "When ->~%")
(when (= *age-2* 18)
  (setf *num-3* 18)
  (format t "Go to college you are ~d~%" *num-3*))

;; unless - Same of when but the opposite
(format t "Unless ->~%")
(unless (>= *age-2* 18)
  (setf *num-3* 24)
  (format t "You cannot drink alcohol~%"))

;; Cond
(format t "Cond ->~%")
(defvar *age-3* 18)
(defvar *college-ready* nil)
(cond ((>= *age-3* 18)
       (setf *college-ready* 'yes)
       (format t "Ready for college.~%"))
      ((< *age-3* 18)
       (setf *college-ready* 'no)
       (format t "Not ready for college.~%"))
      (t ;; Default case
       (format t "Unreachable~%")))

;; Loop for counter in a range 1 to n
(format t "Loop for  -> ")
(loop for x from 1 to 30 do
  (format t " ~d" x))
(terpri)

;; Loop with increment counter and when escape condition
(format t "Loop when -> ")
(setq x 1)
(loop
  (format t " ~d" x)
  (setq x (+ x 1))
  (when (> x 30)
    (return x)))
(terpri)

;; Loop a list of elements
(format t "Loop a list -> ")
(loop for x in '(Peter Paul Mary) do
  (format t " ~s" x))
(terpri)

;; Dotimes - simpler and not verbose way of doing something n times
(format t "Dotimes ->")
(dotimes (x 15)
  (format t " ~d" x)) ;; prints 0 to 14
(terpri)

(format t "~S~%~S~%~S~%"
        ;; Create a list
        (list 'superman 'batman 'flash)
        ;; Prepend to list
        (cons 'superman 'batman)
        (cons 'aquaman '(superman batman)))

(defvar *heroes* '(superman batman flash aquaman))

;; Car - Gets the first element of the list
(format t "Car (head) -> ~a~%" (car *heroes*))

;; Cdr - gets a list with the rest of the initial list
(format t "Cdr (tail) -> ~a~%" (cdr *heroes*))

;; Listp - checks if it is a list
(format t "Listp -> ~a~%" (listp *heroes*))

;; Member - checks if an element is member of a list
(format t "if Member  -> ~a~%" (if (member 'flash *heroes*) t nil))
(format t "if Member2 -> ~a~%" (if (member 'supergirl *heroes*) t nil))

;; Append - can append a list to another list
(format t "Append -> ~s~%" (append *heroes* '(green-lantern)))

;; Push - push value to the front of a list
(format t "Push  -> ~s~%" (push 'batgirl *heroes*))

;; Nth - get element n of list starting with 1
(format t "Nth -> ~s~%" (nth 2 *heroes*))

;; Plist - list with symbols to describe the data inside of it
(defvar superman (list :name "Superman" :secret-id "Clark Kent"))
(defvar *my-heroes* nil)
(push superman *my-heroes*) ;; Add superman to my heroes list

;; Dolist - like a foreach for lists
(dolist (hero *my-heroes*)
  ;; Trick to get things out of the list to print
  (format t "~{~a : ~a~}~%" hero))

;; Association list
(defparameter *heroes2* '((Superman (Clark Kent) (6ft 3 in) (230 lbs))
                          (Batman   (Bruce Wayne) (6ft 0 in) (190 lbs))
                          (Flash    (Barry Allen) (6ft 2 in) (210 lbs))))

;; Get the list of superman
(format t "Superman Data: ~a~%" (assoc 'superman *heroes2*))

;; Get secret id from the Association list
(format t "Superman Data: ~a~%" (car (cdr (assoc 'superman *heroes2*))))

;; Define a function called hello
(defun hello ()
  (format t "Hello, World!")
  (terpri))

;; Invokes the function hello with no arguments
(hello)

;; Define a function with arguments
(defun get-avg (n1 n2)
  (setq avarage (/ (+ n1 n2) 2))
  (format t "Avarage of ~d and ~d is ~d~%" n1 n2 avarage))

(get-avg 15 25)

;; Define a function with optional arguments
(defun my/print-list (x y &optional z w)
  (format t "List -> ~S~%" (list x y z w)))

(my/print-list 1 2)
(my/print-list 1 2 3)
(my/print-list 1 2 3 4)

;; Defun with &rest to accept a variable number of arguments as a list
(defun my/sum (&rest nums)
  (setq total 0)
  (dolist (n nums)
    (setq total (+ total n)))
  (format t "Sum: ~d~%" total))

(my/sum 1 2 3 4 5)
(my/sum 35 34)
(my/sum 12 1)

(defun fact (n)
  (when (< n 1)
    (return-from fact 666))
  (when (= n 1)
    (return-from fact 1))
  (* n (fact(- n 1)))
  )

(format t "Fact: ~d~%" (fact 0))
(format t "Fact: ~d~%" (fact 1))
(format t "Fact: ~d~%" (fact 5))

(defun fact2 (n)
  (cond
    ((< n 0) "Error: n must be a positive number")
    ((<= n 1) 1)
    (t (* n (fact2 (- n 1))))
    )
  )

(format t "Fact2: ~d~%" (fact2 -1))
(format t "Fact2: ~d~%" (fact2 0))
(format t "Fact2: ~d~%" (fact2 1))
(format t "Fact2: ~d~%" (fact2 5))


;; Using keys to id the parameters
(defun my/print-list2 (&optional &key x y z)
  (format t "List: ~s~%" (list x y z)))

;; In this case they are all optional and if you using the symbols the order doesnt matter
(my/print-list2)
(my/print-list2 :x 3)
(my/print-list2 :x 3 :y 2)
(my/print-list2 :z 1 :x 3)
(my/print-list2 :x 3 :y 5 :z 18)
(my/print-list2 :z 18 :y 5 :x 3)

;; Return-from - can be used to return from a functional
(defun my/diff (n1 n2)
  (return-from my/diff (- n1 n2)))

(let ((n1 5)
      (n2 18))
  (format t "My/diff ~d - ~d =  ~d~%" n1 n2 (my/diff n1 n2)))

;; Association list
(defparameter *heroes3* '((Superman (Clark Kent) (6ft 3 in) (230 lbs))
                          (Batman   (Bruce Wayne) (6ft 0 in) (190 lbs))
                          (Flash    (Barry Allen) (6ft 2 in) (210 lbs))))

;; Quasi Quoting - you use ` to treat code as data and , to execute some code inside the data
(defun get-hero-data (size)
  (format t "~a~%"
          `(,(caar size) is ,(caddar size) and ,(cdddar size))))

(get-hero-data *heroes3*)

;; Mapcar - runs a function in the items of a list
(let ((my-list '(1 2 3 a b)))
  ;; You nest let here so that you can use the value of 'my-list'
  (let ((result (mapcar #'numberp my-list)))
    (format t "Mapcar -> in ~a what is a number ~a~%" my-list result)))

;; Flet - You can use flet to declare a local function that exists only inside the flet scope
;; * flet functions cannot see each other
;; * flet functions cannot call themselves and cannot be recursive
(flet
    ((double-it (n)
       (* n 2))
     (triple-it (n)
       (* n 3))
     )

  (let*
      ((my-list '(1 2 3 4 5))
       (result-double (mapcar #'double-it my-list))
       (result-triple (mapcar #'triple-it my-list))
       )

    (progn
      (format t "Flet -> in ~a the double of it is ~a~%" my-list result-double)
      (format t "Flet -> in ~a the triple of it is ~a~%" my-list result-triple)
      )
    )
  )

;; Labels - Defines local functions that exists only inside the body.
;; * labels is like flet but the functions can see each other so you can use recursion
(labels
    ((print-result (n result)
       (if (not result)
           nil
           (format t "Labels -> The result of factorial of ~a is ~a~%" n result)))

     (factorial (n)
       (cond
         ((< n 0)
          (format t "Error: factorial must be a positive number. ~d is invalid.~%" n)
          nil)

         ((< n 2)
          1)

         (t
          (* n (factorial (- n 1)))))) ;; Labels allows recursion
     )

  (print-result -1 (factorial -1))
  (print-result  0 (factorial  0))
  (print-result  1 (factorial  1))
  (print-result  5 (factorial  5))
  )

;; Defining a function that can return multiple values
(defun squares (n)
  (values (expt n 2) (expt n 3)))

;; Bind multiple values at once
(multiple-value-bind (a b) (squares 2)
  (format t "2 ^ 2 = ~d and 2 ^ 3 = ~d~%" a b))

(defun times-3 (x) (* x 3))
(defun times-4 (x) (* x 4))

;; Funcall - Using higher-order functions
(defun multiples (mult-func max-num)
  (dotimes (x max-num)
    (format t " ~d => ~d" x (funcall mult-func x))
    (when (< x (- max-num 1))
      (format t ", "))
    )
  (terpri)
  )

;; To pass a function is a convention to prepend it with a #
;; It would work without, but using # make it clear it a function
(format t "Multiples times-3:")
(multiples #'times-3 10)
(format t "Multiples times-4:")
(multiples #'times-4 10)

;; * Mapcar - applies a function to the elements of a list. Returns a list of the
;; result elements
;; * Lambda - defines a anonymus function. A function to be used as a normal function
;; but that wont have a name. Useful when defining a function to single use on the spot
(format t "Mapcar Lambda ->")
(mapcar
 (lambda (x) (format t " ~d" (* x 2)))
 (list 1 2 3 4 5 6)
 )
(terpri)
