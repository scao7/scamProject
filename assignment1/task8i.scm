(define (ecfi n)
	(define L  1)
	(define (iter i)
	
		(if (<= i n)
			(set! L (+ L (iter (+ i 1))))
		)
		L
	)
	(iter 0)


)

(define (main)
	(inspect (ecfi 10));
)