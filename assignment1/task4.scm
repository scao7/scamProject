;task4
;print the line with the level value
(define (pascal row col left right)
  (cond((< row col) #f)
    	;((or (= 0 col) (= row col)) 1)
		((= col 0) left)
		((= row col )right)
	(else (+ (pascal (- row 1) col left right)
		 (pascal(- row 1)(- col 1) left right )))))
		 
(define (crazyTriangle left right)
  	;(println left right)
	(define a left)
	(define b right)
	(define (pascaltriangle n)
  		(define c )
		(define (for-iter1 i)
			(set! a left)
			(set! b right)
			;(set! c left ) 
			(define (for-iter2 j)
				(if (> j 1)
				(print " ")
				)
		  		(if( <= j (- n i 1))
					(for-iter2 (+ j 1))
				)  
			  )
			(for-iter2 0)
			(define (for-iter3 k)
			;	(print c " " )
				(print (pascal i k left right))
				(if(> i k)
					(print " ")
				)			
	  			(if(< k i)
					(for-iter3 (+ k 1))
			  	)
	 	 	)
			(for-iter3 0)
			(println)
			(if( < i (- n 1))
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
