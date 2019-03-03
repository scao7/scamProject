(define (mandelbrot threshold)
  (lambda (x y)
    (define (iter r s t)
      (if (= t threshold) 
        0
        (if (< 2 (sqrt (+ (* r r) (* s s))))
          t
          (iter 
            (+ x (- (* r r) (* s s)))
            (+ y (* r s 2))
            (+ 1 t)
            )
          )
        )
      )
    (iter 0.0 0.0 0)
    )
  )

(define (main)
  (setPort (open (getElement ScamArgs 1) 'read))
  (define arg (readExpr))
  (define arg1 (readExpr))
  (define arg2 (readExpr))
  (println "((mandelbrot " arg ") " arg1 " " arg2 ") is " ((mandelbrot arg) arg1 arg2)) 
  ;(inspect ((mandelbrot arg) arg1 arg2))
  )