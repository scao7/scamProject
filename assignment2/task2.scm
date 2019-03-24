(define (curry f @)
    (define original @)
    (define (function @)
        (define (buildArgumentList finalList outer inner)
            (cond 
             ((eq? inner nil) (reverse (append outer finalList)))
             ((eq? (car outer) 'MISSING) (buildArgumentList (cons (car inner) finalList)  (cdr outer) (cdr inner)))
             (else (buildArgumentList (cons (car outer) finalList)  (cdr outer) inner))
            )
        )

        (apply f (buildArgumentList nil original @))
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

