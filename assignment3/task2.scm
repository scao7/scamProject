
(define (replace function old new)
    (define (replaceHelp code)
        (cond
            ((null? code) (list))
            ((and (atom? code) (eq? code old)) new)
            ((atom? code) code)
            ((or (eq? (car code) 'set!) (eq? (car code) 'set-car!) (eq? (car code) 'set-cdr!)) ;(set! + blah)
                (list (car code) (cadr code) (car (replaceHelp (cddr code))))
            )
            (else
                (cons 
                    (if (builtin? (car code))
                        (car code)
                        (replaceHelp (car code))
                    )
                    (replaceHelp (cdr code)))
            )
        )
    )

    (define body (get 'code function))
    (set 'code (replaceHelp body) function)
    function
)

	
(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
    (define (iter expr)
         (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
         )
    (iter (readExpr))
)
