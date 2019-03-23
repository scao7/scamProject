(define (square n)
	(* n n)
)

(define (S f n)
	(define i 0 )
	;(define sum 0.0)
	(define (iter sum i)
		(if(<= i n)
			(iter (+ sum (f i)) (+ i 1))
			sum
		)
	)
	(iter (f i) (+ i 1))
)

(define (w f n)
	(define i n)
	(cond 
		((= i 0 )(define result ( f i ) ))
		(else 
		(define a (S f i))
		(define b (S f (- i 1)))
		(define c (S f (+ i 1)))
		(define result (/(-(* c b) (square a)) (+(- c (* 2 a)) b)))
		)
	)
	result
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (eval (readExpr) this))
	(define arg1 (readExpr))
	
	(println "(S " arg " " arg1 ") is " (fmt "%.15f" (S arg arg1)))
	(println "(w " arg " "arg1 ") is " (fmt "%.15f" (w arg arg1)))
)
