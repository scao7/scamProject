(define (pred churchNumeral)
        (lambda (f)
            (lambda (x)
                (((churchNumeral (lambda (g) (lambda (h) (h (g f))))) (lambda (u) x)) (lambda (u) u))
            )
        )
)

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

(define (create num)
	(define (help church i)
		;(inspect church)
		;(inspect i)
		(if (< i num)
			(help (add-1 church) (+ i 1))
			church
		)
	)
	(help zero 0)
	
)

(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
    (define (iter expr)
         (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
         )
    (iter (readExpr))


  )

