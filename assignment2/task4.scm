(define (let*->lambdas sourceCode)
    ;(inspect sourceCode)
    (println sourceCode)

    (define (define? code)
        ;(inspect code)
        (if (and (list? code) (eq? (car code) 'define))
            #t
            #f
        )
    )

    ;buildLambda helper function
    (define (buildLambda code)
        (cond 
            ((define? (car code)) 
                (define formalParam (cadr (car code)))
                (define callExpr (caddr (car code)))
                (list (append (list (cons 'lambda (cons (list formalParam) (buildLambda (cdr code))))) (list callExpr)))
            )
            (else
                 code)
        )
    )

    (append (append (list (car sourceCode)) (list (cadr sourceCode))) (list (car (buildLambda (cddr sourceCode)))))
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define env this)
    	(define (iter expr)
         (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
         )
    (iter (readExpr))	
)



