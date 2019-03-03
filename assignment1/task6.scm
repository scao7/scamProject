(define (square n)
	(* n n)
)
(define (w f n)
	(define (iter i)
	(cond 
		((= i 0) (f i))
		(else
			( / 
				( - (*(s f (+ i 1)) (s f (- i 1))) (square (s f i)) )

				(+ (- (s f (+ i 1)) (* 2 (s f i))) ((s f (- i 1))))
				
			)
		)
	)
	(if ( <= i n)
		(iter (+ i 1))
	)
	)
	(iter 0)
)

(define (s f n)
	(define (iter i)
		
		(if(<= i n)
			(iter (+ i 1))
		)
		(+ i (f i))
	)
	(iter 0)
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (eval (readExpr) this))
	(define arg1 (eval (readExpr) this))
	
	(inspect arg)
	(inspect arg1)
	(inspect ((s (lambda (x) (x))) 3))
	(inspect (s arg arg1))
	;(inspect (w arg arg1))
)