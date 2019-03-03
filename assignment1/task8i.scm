
(define (ecfi height)
	(define e 2.0)
	(define e0)
	(define fact 1.0)
	(define n 2)
	(define i 0)
	(while (< i height)
		(set! e0 e)
		(set! fact (+ 1 1) )
		(set! e (+ e (/ 1 fact) ))
		(set! i (+ i 1))
	)
	e
)

(define (main)
	(inspect (ecfi 1))
) 