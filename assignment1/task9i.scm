;assue iterative way is allow to use while loop
(define (ramanujani depth)
	(define i depth)
	(define result 0.0)
	(define (iter i) 
		;(>= i 0)	
		(set! result (+ result (+ 6 i) ) )
		(set! result (sqrt result))
		(set! result (* result (+ i 1)))
		(set! i (- i 1))
		(if (>= i 0)
			(iter i)
		)
	)
	(iter depth)
	result
)                  

(define(main) 
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(println "(ramanujani " arg ") is " (fmt "%.25f" (ramanujani  arg)) ")")
	
	;change format to pass test case
)
