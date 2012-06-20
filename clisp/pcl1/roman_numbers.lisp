(defvar *roman-numbers-map* '(("M" 1000)
                              ("CM" 900)
                              ("D" 500)
                              ("CD" 400)
                              ("C" 100)
                              ("XC" 90)
                              ("L" 50)
                              ("XL" 40)
                              ("X" 10)
                              ("IX" 9)
                              ("V" 5)
                              ("IV" 4)
                              ("I" 1)))

(defun to-roman (number &optional roman)
  "Converts integer to Roman numeral"
  (dolist (x *roman-numbers-map*)
    (cond
     ((>= number (cadr x))
        (progn 
          (setq roman (concatenate 'string roman (car x)))
          (decf number (cadr x))
          (return (to-roman number roman))))
     ((= number 0)
        (return roman)))))

(defun prompt-for-number ()
  (format *query-io* "number: ")
  (force-output *query-io*)
  (or (parse-integer (read-line *query-io*) :junk-allowed t) 0))

(format *query-io* "roman: ~a" (to-roman (prompt-for-number)))
