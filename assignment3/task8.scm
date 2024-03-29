(define (sdisplay n z)
    (define (iter x m)
        (if (= m 0)  
                (print "...")
            (begin
                (print (stream-car x) ",")
                (iter (stream-cdr x) (- m 1)) 
            )
        )
    )   
    (print "(")
    (iter z n)
    (print ")")
    )   

(define (merge s1 s2 weight)
    (cond
        ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
            (if (<= (weight (stream-car s1)) (weight (stream-car s2)))
                (cons-stream (stream-car s1) (merge (stream-cdr s1) s2 weight))
                (cons-stream (stream-car s2) (merge s1 (stream-cdr s2) weight))
                )
            )
        )
    )


(define (ramanujan)
    (define (stream-map f s)
        (cons-stream
            (f (stream-car s))
            (stream-map f (stream-cdr s))
            )
        )

    (define (add-streams s t)
        (cons-stream
            (+ (stream-car s) (stream-car t))
            (add-streams (stream-cdr s) (stream-cdr t))
            )
        )

    
    (define (cube x) (* x x x))
    (define (weight c) (+ (cube (car c)) (cube (cadr c))))


    (define (w-pairs s t w)
        (cons-stream
            (list (stream-car s) (stream-car t))
            (merge
                (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
                (w-pairs (stream-cdr s) (stream-cdr t) w)
                w
                )
            )
        )
    
    (define ones (cons-stream 1 ones))
    (define ints (cons-stream 1 (add-streams ones ints)))
    (define wps (w-pairs ints ints weight))


    (define (filter pairs)
        (let
            ((a (weight (stream-car pairs)))
             (b (weight (stream-car (stream-cdr pairs)))))
            (if (= a b)
                (cons-stream a (filter (stream-cdr pairs)))
                (filter (stream-cdr pairs))
                )
            )
        )

    (define ram (filter wps))
    )


(define (main)
    (define env this)
    (define (iter expr)
         (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
         )
    (setPort (open (getElement ScamArgs 1) 'read))
    (iter (readExpr))
    )
