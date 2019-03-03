;task 7
; returns a number that is twice n
(define (double n) (+ n n))

; returns a number that is one half n
;(define (halve n)
  ;(define (iter subs total)
    ;(if (>= total 2)
      ;(iter (+ subs 1) (- total 2))
      ;subs
      ;)
    ;)
 ; (iter 0 n) 
	;(define result n)
	;(define count 0)
	;(define (iter result)
		
;		(set! result(- result 2))
		;(set! count (+ count 1))
		;(if (>= result 2)
	;		(iter result)
;		)
;	)
;	count
	;(/ n 2)
  ;)
  
  
  (define (halve x)
    (define (worker x c t)
        (cond
            ( (<= (- x c) 0)
                t
                )
            ( (> (double (double c)) x)
                (worker (- x (double c)) 1 (+ t c))
                )
            ( (< (double c) x)
                (worker x (double c) t)
                )
            )
        )
        (worker x 1 0)
    )

(define (div2? n) (= (halve n) (halve (+ n 1))))

;(define (ethiop x y)
;  (define (iter total a b) 
;    (if (>= b 1)              
;      (iter                   
;        (+ total            
;          (if (div2? b) 0 a) 
;          )                   
;        (double a)           
 ;       (halve b)             
 ;       )
 ;     total ;
 ;     )
 ;   )
 
;    (iter 0 x y)
;  )

(define (ethiop x y )
	(define i 0)
	(define result 0)
	(define (iter a b)
		(set! result (+ result (if (div2? b) 0 a)))
		(set! a (double a))
		(set! b (halve b))
		;(println " 1 ")
		(if(>= b 1)
		(iter a b)
		)
		;(println " 2 ")
	)
	(iter x y)
	result
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