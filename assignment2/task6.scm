(define (F e T)
  (map
    (lambda (X)
      (cons e X)
      )
    T
    )
  )

(define (powerSet S)
  (cond
    ((null? S) '(()) )
    (else 
      (let ( (T (powerSet (cdr S))) (e (car S)) )
        (merge
          T
          (F e T)
          )
        )
      )
    )
  )

(define (merge a b)
  (define (help f s)
    (cond 
      ((null? f) s)
      ((null? s) f)
      (else
        (cons (car f) (cons (car s) (help (cdr f) (cdr s))))
        )
      )
    )
  (help a b)
  )
(define (main)
(setNilDisplay 'nil)
    (setPort (open (getElement ScamArgs 1) 'read))
         (define env this)
    (define (iter expr)
       (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
   (iter (readExpr))
)

