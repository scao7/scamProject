(define (root-n degree)
  (define(rootNum number)
  (define tolerance 0.0000000000000001)
  (define(good-enough? next guess)
    (< (abs(- next guess)) tolerance)
    )
  (define (improve guess)
    (/ (+ (* (- degree 1) guess) (/ number (expt guess (- degree 1)))) degree)
  )
  (define (root-iter guess)
    (let ((next (improve guess)))
      (if (good-enough? next guess)
	guess
	(root-iter next))))
  (root-iter 1.0)
  )
 )




(define (main)
 (setPort (open (getElement ScamArgs 1) 'read))
  (define arg(readExpr))
  (define arg1(readExpr))
    ;(inspect ((root-n arg) arg1))
    (println "((root-n " arg ") " arg1 ") is " (fmt "%.15f" ((root-n arg)arg1)))
 )
