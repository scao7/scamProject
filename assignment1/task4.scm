;task4
;print the line with the level value
(define (crazyTriangle left right)
  	(println left right)
	(define a left)
	(define b right)
	(define (pascaltriangle n)
  		(define c )
		(define (for-iter1 i)
			(set! a left)
			(set! b right)
			(set! c left ) 
			(define (for-iter2 j)
				(print " ")
		  		(if( <= j (- n i 1))
					(for-iter2 (+ j 1))
				)  
			  )
			(for-iter2 1)
			(define (for-iter3 k)
			;	(print c " " )
				(print c " ")
				(set! c ( /(* c (- i k))  (+ k 1)))
			;	(set! b ( /(* b (- i k))  (+ k 1)))
			
	  			(if(<= k i)
					(for-iter3 (+ k 1))
			  	)
	 	 	)
			(for-iter3 0)
			(println)
			(if( < i n)
  				(for-iter1 (+ i 1))
			)


 		 )
		(for-iter1 0)
	)
)

(define (main)
	(setPort(open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(define arg2 (readExpr))
	(define arg3 (readExpr))
	((crazyTriangle arg1 arg2 ) arg3)
  )
