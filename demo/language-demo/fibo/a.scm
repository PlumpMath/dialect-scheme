
(define (fact n)
  (if (< n 2) 1
    (+
      (fact (- n 1))
      (fact (- n 2)))))

(print (fact 40))