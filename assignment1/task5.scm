;task5
(define (curry f )
	(define (lambda a)
     (define (lambda b)
             (define (lambda c)
	                (define (lambda d)
			              (f a b c d)))))
						  )
(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (eval (readExpr) this))
	(define arg1 (eval (readExpr) this))
	(define arg2 (eval (readExpr) this))
	(define arg3(eval (readExpr) this))
	(define arg4 (eval (readExpr) this))
	;(inspect arg )
	;(inspect arg1)
	;(inspect arg2)
	;(inspect arg3)
	;(inspect arg4)
	;(inspect(((((curry arg)arg1)arg2)arg3)arg4))
	(println "(((((curry " arg ") " arg1 ") " arg2 ") " arg3 ") " arg4 ")" )
	
  )
