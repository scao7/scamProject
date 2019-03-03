(define (mandelbrot threshold)
  ; takes point (x, y) and checks if it
  ; is within the mandlebrot set with threshold
  ; of certainty
  (lambda (x y)
    ; recursive function to check divergence
    (define (iter r s t)
      ; check for threshold reached
      (if (= t threshold) 
        0
        ; check for divergence
        (if (< 2 (sqrt (+ (* r r) (* s s))))
          ; if diverges, return t (the number of iterations checked)
          t
          ; otherwise, iterate one level deeper
          (iter 
            ; r value
            (+ x (- (* r r) (* s s)))
            ; s value
            (+ y (* r s 2))
            ; t value
            (+ 1 t)
            )
          )
        )
      )
    ; call with default values 0.0 for r and 0.0 for s
    (iter 0.0 0.0 0)
    )
  )

; (0, 0) should yeild 0
(define (main)
  (setPort (open (getElement ScamArgs 1) 'read))
  (define arg (readExpr))
  (define arg1 (readExpr))
  (define arg2 (readExpr))
  (println "((mandelbrot " arg ") " arg1 arg2 ")) is " ((mandelbrot arg) arg1 arg2)) 
  ;(inspect ((mandelbrot arg) arg1 arg2))
  )