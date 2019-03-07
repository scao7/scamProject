;re 8
(define (ecfr n)
  (define (helper depth)               
    (if (<= depth n)                    
      (/ 1 (+ 1  (/ 1 (+ (* 2 depth) (/ 1 (+ 1 (helper (+ depth 1 ))))))))
      0                               
    )
  )
	(cond 
		(( = n 0) 2.0)
		(else 
		(+ 2 (helper 1.0))
		)
	)
  )
  
(define (main)
  	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(println "(ecfr " arg ") is " (fmt "%.25f" (ecfr arg)))
)
