(define (function dict inter final)
	(define (iter2 level dict-iter2 inter2)
		(
	)

	(define (iter i dict-iter inter)
		(inspect i)
		
		(if( < i (length dict))
			(iter (+ i 1) (cdr dict-iter) (cons (cons (car dict-iter) '()) inter))
			inter

		)
	)	
	(iter 0 dict '() )
	(iter2 0 dict '())
)
(define (main)

	(define s '(s e a t))
	(inspect (function s '() '() ))
)
