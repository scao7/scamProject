
;task 7
; returns a number that is twice n
(define (double n) (+ n n))
;(define (halve x)

;	(define (outer d i)
;		(define ( inner a b)
;			;(inspect a)
			;(inspect b)
;			(if(and (!= a x) (!= a (- x 1)) (!= a (- x 2)))
;				(inner (- a 2) ( - b 1)) 
;				b
;			)
;		)
;		i
;		(if(< d x) 
;			(outer (double d) (+ i i))
;			(inner (- d 2) (- i 1))
;		)
;		
;	)
;	(outer 2 1)
;)
 ;(define (halve x)
;	(/ x 2)
; )
(define (halve a)
	(define (getPower power val)
		(cond 
			(( < (double val) a) (getPower (+ power 1) ( double val)))
			(else val)
		)
	)
	
	(define (iter val)
		(cond 
			((= (double val) a) val)
			((= (double val) (- a 1)) val)
			(else (iter (- val 1)))
		)
	)
	(iter (getPower 0 1))

)


(define (div2? n) (= (halve n) (halve (+ n 1))))

(define (ethiop a b)
(define (iter a b store)
    (cond
        ((= b 1) (+ store a))
        ((and (div2? b) #t) (iter (double a) (halve b) store))
        (else (iter (double a) (halve b) (+ a store)))
        )
    )
	(iter a b 0)
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(define arg2 (readExpr))
	
	(println "(halve " arg1 ") is " (halve arg1))
	(println "(double " arg1 ") is " (double arg1))
	(println "(div2? " arg1 ") is " (div2? arg1))
	(println "(ethiop " arg1 " " arg2 ") is " (ethiop arg1 arg2))
)

