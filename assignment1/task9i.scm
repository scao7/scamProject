;assue iterative way is allow to use while loop
(define (ramanujani depth)
	(define i 0)
	(define result 0.0)
	(while (< i depth)
		(set! result (sqrt (+ 6 i)))
		(set! result (* result (+ i 1)))
		(set! i (+ i 1))
	)
	result
)                  

(define(main) 
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(println "(ramanujani " arg ") is " (fmt "%.25f" (ramanujani (+ arg 1))) ")")
	
	;change format to pass test case
)
