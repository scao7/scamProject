(define (ramanujani depth)
  (define (iter store src)                 ; define an iterator function
    (if (> src 1)                          ; we're working from the depth, up
      (iter                                ; iterate, and: 
        (* src (sqrt (+ (+ src 5.0) store))) ;   calculate new store w/ old store
        (- src 1.0)                          ;   decrease the depth by 1
        )
      store                                ; once we hit min depth, return store
      )
    )
  (iter 0 (+ 1 depth)) ; call iterator with (depth + 1)
  )                    ; (because depth of 0 doesn't make sense to the maths)

(define(main) 
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg (readExpr))
	(println "(ramanujanr " arg ") is " (fmt "%.25f" (ramanujani arg)))
)