;task 7
; returns a number that is twice n
(define (double n) (+ n n))

; returns a number that is one half n
(define (halve n)
  (define (iter subs total)
    (if (>= total 2)
      (iter (+ subs 1) (- total 2))
      subs
      )
    )
  (iter 0 n) 
  )

(define (div2? n) (= (halve n) (halve (+ n 1))))

(define (ethiop x y)
  (define (iter total a b)  ; define the iterator function
    (if (>= b 1)              ; if b isn't 1
      (iter                   ; iterate to the next step and:
        (+ total              ;   add a to our total if b isn't even
          (if (div2? b) 0 a)  ;   otherwise, just add 0
          )                   ;
        (double a)            ;   double a
        (halve b)             ;   halve b
        )
      total ; if b < 1, return the total we've accrued. this is the answer
      )
    )
    ; call the base iterator with no total, x and y as starting a and b
    (iter 0 x y)
  )

(define (main)
(setPort (open (getElement ScamArgs 1) 'read))
(define arg1 (readExpr))
(define arg2 (readExpr))
(println "(halve " arg1 ") is " (halve arg1))
(println "(double " arg1 ") is " (double arg1))
(println "(div2? " arg1 ") is " (div2? arg1))
(println "(ethiop " arg1 " " arg2 ") is " (ethiop arg1 arg2))
  )