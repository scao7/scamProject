(define (f x)
 	(
	(lambda (y) 
		(
			(lambda (z) 
				(+ x y z)
				(inspect x)
				(inspect y)
				(inspect z)
			)
			 (inspect y)
		)
		
	) 2

	)

)
(define (f2 x) 
	(let* 
		((y 2) (z y)) 
		(+ x y z)
	)

)


(define (main)

	(inspect (f 1))
	(inspect (f2 1))
	
)
