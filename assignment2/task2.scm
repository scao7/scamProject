(define (curry @)
    	(define (len) (length (get 'parameters (car arglist))))
        (if (is? (car @) 'CONS)
        (define arglist (car @)) 
        (define arglist @);else 
        )
    	(if (!= (length (cdr arglist)) (len))
        	(lambda (@) (curry (append arglist @))) ;collect arguments
                (apply (car arglist) (cdr arglist));else apply
    	)   
)

(define (main) 
  (setPort (open (getElement ScamArgs 1) 'read))
    (define env this)
        (define (iter expr)
                (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
)
