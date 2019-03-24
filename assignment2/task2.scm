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
  (define (f x y z) (+ x y z))
    (define a 1)
    (define b 2)
    (define c 3)

    
)
