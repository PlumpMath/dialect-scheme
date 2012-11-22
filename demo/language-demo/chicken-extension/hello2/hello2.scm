
(print "Hello, ")
(for-each
  (lambda (x)
    (print "~A " x))
  (command-line-arguments))

(print "!")