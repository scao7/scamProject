;assue iterative way is allow to use while loop
(define (ramanujani depth)
	(define i depth)
	;(define result 0.0)
	(define (iter result i) 
		;(>= i 0)	
		;(set! result )
		;(set! i (- i 1))
		(if (>= i 0)
			(iter (* (sqrt (+ result (+ 6 i) )) (+ i 1)) (- i 1))
			result
		)
		;result
	)
	(iter 0.0 depth)
)                  

(define(main) 
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(println "(ramanujani " arg ") is " (fmt "%.25f" (ramanujani  arg)))
	
	;change format to pass test case
)
