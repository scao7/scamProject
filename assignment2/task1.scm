(define (range start end step) 	
  (list start)
    (if (< (+ start step) end) (cons start (range (+ start step) end step))
      (list start)
 	)
  )
  
(define (for-loop arglist procedure)
  (cond
    ((null? arglist) nil)
    (else 
	(begin
      (procedure (car arglist))
      (for-loop (cdr arglist) procedure)
      ))
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
