
(define (ecfi height)
	(define e 2.0)
	(define fact 0.0)
	(define n 2)
	(define i 0)
	(while (< i height)
		(set! fact (+ 1 fact))
		(set! fact (/ 1 fact))
		(set! fact (+ fact (* (- height i) 2.0)))
		(inspect (- height i))
		(set! fact ( / 1 fact))
		(set! fact (+ fact 1))
		(set! fact (/ 1 fact))
		;(set! fact (+ fact 1))
		;(set! e (+ e (/ 1 fact) ))
		(set! i (+ i 1))
	)
	(+ e fact)
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(println "(ecfi " arg ") is " (fmt "%.25f" (ecfi arg)))
) 