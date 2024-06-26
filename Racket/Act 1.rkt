#lang racket

; 1. Hello World
(define Hello
  "Hello World!\n"
)

(display Hello)


; 2. Grades
(define (grades a b c)
  (if (< (/ (+ a b c) 3) 70)
      "Failed\n"
      "Approved\n"
  )
)

(display "Grades: ")
(display (grades 70 70 70))


; 3. Leap Year
(define (leapYear year)
  (cond
    [(and (= (remainder year 4) 0) (not (= (remainder year 100) 0)))
     true]
    [(= (remainder year 400) 0) true]
    (else false)
    )
)

(display "Leap year: ")
(display (leapYear 2001))


; 4. Largest number
(define (largest a b c)
  (cond 
	[(and (> a b) (> a c)) a]
	[(> b c) b]
        [c]
  )
)

(display "\nLargest number: ")
(display (largest 100 150 30))


; 5. Order list
(define (order a b c)
  (sort (list a b c) <)
)

(display "\nOrdered list: ")
(display (order 2 5 1))


; 6. Operates
(define (operates a b c)
   (case a
	['Sum (+ b c)]
	['Subtract (- b c)]
        ['Multiply (* b c)]
        ['Divide (/ b c)]
   )
)

(display "\nOperations: ")
(display (operates 'Divide 10 5))


; 7. Days
(define (days a)
  (case a
    ['January 31]
    ['February 28]
    ['March 31]
    ['April 30]
    ['May 31]
    ['June 30]
    ['July 31]
    ['August 31]
    ['September 30]
    ['October 31]
    ['November 30]
    ['December 31]
  )
)

(display "\nDays in the month: ")
(display (days 'June))


; 8. Function
(define (function x)
  (cond 
	[(< x -1) (+ x 2)]
	[(< x 0) 1]
        [(>= x 0) (+ 1 (* -1 (expt x 2)))]
  )
)

(display "\nFunction: ")
(display (function 2))


; 9. Distance
(define (euclidean a b)
  (abs (- a b))
)

(display "\nEuclidean distance: ")
(display (euclidean -8 3))





