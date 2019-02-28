(define r 0.0)
(define s 0.0)
(define (mandelbrot threshold)
    
    (if ( > (+ (* r r ) (* s s)) 4 ) ;if this always true diverge
        (assign r (-( + (* r r ) (* s s) ) y))
        (assign s (+ (* 2 r s) y))
        (mandelbrot r)
        (mandelbrot s)
    )


    (define (func x y)
    
    )
)

(define (main)
    (mandelbrot 5)
)
