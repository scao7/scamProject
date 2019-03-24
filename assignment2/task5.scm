(define (pred churchNumeral)
        (lambda (f)
            (lambda (x)
                (((churchNumeral (lambda (g) (lambda (h) (h (g f))))) (lambda (u) x)) (lambda (u) u))
            )
        )
)

(list "zero" "one")
(define (create num)
  
)
(define (main)

  (define five (lambda (f) (lambda (x) (f (f (f (f (f x))))))))
  (define four (pred five))

  (println ((four (lambda (x) (+ x 1))) 0))
  ;(println (((create 4) (lambda (x) (+ x 1))) 0))
;(println (((pred (create 4)) (lambda (x) (+ x 1))) 0))
)
