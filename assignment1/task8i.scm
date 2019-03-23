
(define (ecfi height)
	(define e 2.0)
	;(define fact 0.0)
	(define n 2)
	(define i 0)
	(define (iter fact i)
		fact
		(if(< i height)
		(iter (/ 1 (+ ( / 1 (+ (/ 1 (+ 1 fact)) (* (- height i) 2.0))) 1)) (+ i 1))
		(+ e fact)
		)
	)
	(iter 0.0 0)
	
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(println "(ecfi " arg ") is " (fmt "%.25f" (ecfi arg)))
	
	;change for test case 
) 
