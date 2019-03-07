;task 7
; returns a number that is twice n
(define (double n) (+ n n))
(define (pow2 n)
	(cond 
	((= n 0 ) 1)
	(else
	(define (iter total i)
		(if(< (+ i 1) n)
			(iter (+ total total) (+ i 1))
			total
		)
	)
	(iter 2 0)
	)
	)
)
(define (halve x)
	(define (outer d i)
		(define ( inner a b)
			;(inspect a)
			;(inspect b)
			(if(and (!= a x) (!= a (- x 1)))
				(inner (- a 2) ( - b 1)) 
				b
			)
		)
		i
		(if(< d x) 
			(outer (double d) (+ i i))
			(inner (- d 2) (- i 1))
		)
		
	)
	(outer 2 1)
)

(define (div2? n) (= (halve n) (halve (+ n 1))))

(define (ethiop x y)
  (define (iter total a b)  
    (if (>= b 1)             
      (iter (+ total (if (even? b) 0 a) )                   
        (double a)           
        (halve b)            
      )
      total
    )
  )
    (iter 0 x y)
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(define arg2 (readExpr))
	;(inspect (pow2 3))
	;(inspect (halve 960))
	(println "(halve " arg1 ") is " (halve arg1))
	(println "(double " arg1 ") is " (double arg1))
	(println "(div2? " arg1 ") is " (div2? arg1))
	(println "(ethiop " arg1 " " arg2 ") is " (ethiop arg1 arg2))
)
