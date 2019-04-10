(define (Stack)
	(cons 0 nil)
)

(define (push s val)
	(cons (+ (car s) 1) (cons val (cdr s)))
)

(define (pop s)
	(cons (- (car s) 1) (cdr (cdr s)))
)

(define (speek s)
	(car (cdr s))
)

(define (ssize s)
	(car s)
)


(define (Queue)
	(cons (cons 0 '()) '())
)


(define (enqueue q val)
	(define tmp (cons val '())) 
	(if (= (caar q) 0)
		(cons (cons 1 tmp) tmp)	
		(cons (cons (+ (car (car q)) 1) (cons val (cdr (car q)))) (cdr q))
	)
)

(define (iter s i q)
	(cond
		((= i 0) q)
		((> i 0) (iter (cdr s)(- i 1) (cons (car s) q)))
	)
)
(define (dequeue s)
	(if (null? (cdr (cdr s)))
		(cons (cons (- (caar s) 1) (cdr (car s))) (iter (cdr (car s)) (- (caar s) 1) '()))
		(cons 	(cons 	(- (caar s) 1)	(cdr(car s)))(cdr(cdr  s)))
	)
)


(define (qpeek q)
	(car (cdr q))
)

(define (qsize q)
	(car (car q))
)


(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define env this)
	(define (iter expr)
		(if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
	)
	(iter (readExpr))
)
