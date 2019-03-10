(define (ethiop-iter a b store)
    (cond
        ((= b 1) (+ store a))
        ((and (div2? b) #t) (ethiop-iter (double a) (halve b) store))
        (else (ethiop-iter (double a) (halve b) (+ a store)))
        )
    )

(define (double x)
    (+ x x)
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

(define (power x num pow)
    (if (< (- x
              (double num)
              )
            0
            )
        num
        (power x (double num) (+ pow 1))
        )
)


(define (iter x y)
    (cond
        ((= (double y) x) y)
        ((= (double y) (- x 1)) y)
        (else (iter x (- y 1)))
        )
)

(define (div2? n) (= (halve n) (halve (+ n 1))))

(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define arg1 (readExpr))
    (define arg2 (readExpr))
	(println "(halve " arg1 ") is " (halve arg1))
	(println "(double " arg1 ") is " (double arg1))
	(println "(div2? " arg1 ") is " (div2? arg1))
	(println "(ethiop " arg1 " " arg2 ") is " (ethiop-iter arg1 arg2 0))
)
