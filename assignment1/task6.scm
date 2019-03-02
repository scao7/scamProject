(define (w f i)
	(cond 
		((= i 0) (f i))
		(else ( 
			( / 
				( - (*(s f (+ i 1)) (s f (- i 1))) (sqrt (s f i)) )

				(+ (- (s f (+ i 1)) (* 2 (s f i))) ((s f (- i 1))))
				
			)
 		)
	)
)

(define (s f n)
	(define i 0)
	(define (iter i)
		(f i)
		
		(if(<= i n)
			(iter (+ i 1))
		)
	)
	(iter n)
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(inspect (s arg 0))
)