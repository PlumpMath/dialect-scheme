
(module my-lib
  *
  (import scheme chicken))

(define-syntax prog1
  (syntax-rules ()
    ((_ e1 e2 ...)
      (let
          ((result e1))
        (begin e2 ...)
        (result)))))

(define my-sum
  (lambda (numbers)
    (prog1
      (apply + numbers)
      (display "my-sum used one more time!")
      (newline))))