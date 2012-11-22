(print "qqqqq")
(print (+ 1 2))
(define x-y-z 10)
(print x-y-z)
(define %x% 1)
(print %x%)
(define | a b c | 5)
(print | a b c |)
(let
    ((a 5)
    (b 10))
  (print (+ a b)))
(let*
    ((a 5)
    (b (* 2 a)))
  (print (+ a b)))
(define pythagoras
  (lambda (a b)
    (sqrt (+ (* a a) (* b b)))))
(print (pythagoras 4 3))
(define (add-up-to x)
  (if (zero? x) 0
    (+ (add-up-to (sub1 x)) x)))
(print [add-up-to 99])
(define [add-up-to2 x]
  (define [inner x y]
    (if (zero? x) y
      (inner [sub1 x] [+ x y])))
  (inner x 0))
(print [add-up-to2 9])
(print
  (map (lambda (x) (* x x)) '(1 2 3 4 5)))
(print [vector-ref [vector 1 2 3 4] 2])
(print [list-ref [list 1 2 3 4] 2])
(print [list 1 2 3 4])
(print
  (cons 1
    (cons 2
      (cons 3
        (cons 4 '[])))))
(print [car '[1 2 3 4]])
(print
  (car
    (cdr
      (cdr
        (cdr '[1 2 3 4])))))
(use srfi-1)
(print [append '[1 2 3] '[4 5 6]])
(print [map + '[ 1 2 3] '[1 2 3]])
(print [filter even? '[1 2 3 4]])
(print
  (fold
    (lambda (x str) [conc str x])
    ""
    '[1 2 3 4]))
(use regex)
(print
  (string-search "(.)(.)(\\d+)(\\d)" "THX1138."))
(define a
  (quote
      ((foo 1)
      (bar 2)
      (baz 101))))
(print [assoc 'foo a])
(define calculate '[+ 1 2 3 4])
(print
  (eval
    (cons '* [cdr calculate])))