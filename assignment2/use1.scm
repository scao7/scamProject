(define (let*->lambdas sourceCode)
    ;(println sourceCode)

    ;buildLambda helper function
	(define newCode (list (car sourceCode)(cadr sourceCode)))
	(define code (cdr sourceCode))
	(inspect newCode)
	(inspect code)
	(define (buildLambda code newCode)
		(println "in the loop " newCode)	
		(if (!= code nil)
		(buildLambda (cdr code) (cons newCode (cdr code)))
			newCode
		)
	)
 	
    	(buildLambda code newCode)
)

(define (main)
;	(setPort (open (getElement ScamArgs 1) 'read))
;	(define env this)
 ;   	(define (iter expr)
  ;       (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
   ;      )
   ; (iter (readExpr))

	(inspect (let*->lambdas `(define (f x) (let* ((y 2)) (+ x y)))))
)



