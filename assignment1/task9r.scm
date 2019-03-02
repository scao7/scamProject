;task 9 recursive
;task 9 iteration
(define (ramanujanr depth)
	(define (h x)
		(if (< (- x 1.0) depth)
			(* x 
				(sqrt
					(+ (+ x 5.0)
						(h (+ x 1.0))
						)
					)
				)
			0.0
			)
		)
	(h 1.0)
	)
	
(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(println "(ramanujanr " arg ") is " (fmt "%.25f" (ramanujanr arg)))
)
	