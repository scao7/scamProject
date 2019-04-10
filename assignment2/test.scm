(setNilDisplay 'nil)

(define (merge lst1 lst2)
	(cond 
		((null? lst1) lst2)
		((null? lst2) lst1)
		((greaterThan? (car lst1) (car lst2))
		 
			(cons (car lst2)(merge lst1 (cdr lst2))))
		(else
			(cons (car lst1) (merge (cdr lst1) lst2))
		)
	)
)

(define (greaterThan? lst1 lst2)
	(if (> (length lst1)(length lst2))
		#t
		#f
	)
)

(define (combinations l n tmp)
(setNilDisplay 'nil)
    ; (inspect tmp)
    ; (inspect (car l))
    (cond ((= n (length tmp)) (list tmp))
          ((null? l ) nil)
          (else (begin
            (define a (combinations (cdr l) n (append tmp (list (car l)))))
            (define b (combinations (cdr l) n tmp))
            (append a b)
            ))))

(define (iter-combs l n)
(setNilDisplay 'nil)
    (if (= 0 n)
        nil
        (append (iter-combs l (- n 1)) (combinations l n `()))))

(define (powerSetImpl l)
(setNilDisplay 'nil)
    ; (inspect (cdr (cdr (list-len 1 l))))
    (if (null? l)
        l
        (iter-combs l (length l))))

(define (powerSet l)
	(setNilDisplay 'nil)

    (cons nil (powerSetImpl l)))

(define (main)
	(setNilDisplay 'nil)

        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
    (define (iter expr)
         (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
         )
    (iter (readExpr))


  )
