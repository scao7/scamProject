(define (range start end step)
  (list start)
    (if (< (+ start step) end) (cons start (range (+ start step) end step))
      (list start)
 	)
  )

(define (for-loop arguments function)
  (cond
    ((null? arguments) nil)
    (else
	(begin
      (function (car arguments))
      (for-loop (cdr arguments) function)
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
