
(define (transpose m)
    (if (null? (car m))
        nil
        (cons (map (lambda (x) (car x)) m) (transpose (map (lambda (x) (cdr x)) m)))))

; (inspect (transpose '((1 2 3 4) (4 5 6 6) (6 7 8 9))))

(define (dot-product a b)
    (if (null? a)
        0
        (+ (* (car a) (car b)) (dot-product (cdr a) (cdr b)))))

(define (matrix-*-vector-internal m v)
    ; (inspect m)
    ; (inspect v)
    (map (lambda (x) (dot-product x v)) m))

(define (matrix-*-vector m v)
    ; (inspect (transpose m))
    ; (inspect (transpose v))
    ; (inspect (matrix-*-vector-internal (transpose m) v))
    (if (null? m)
        nil
        (matrix-*-vector-internal (transpose m) v)))

(define (matrix-*-matrix m1 m2)
    (map (lambda (x) (matrix-*-vector m1 x)) m2))

; (inspect (matrix-*-matrix '((7 4 3) (9 8 9) (5 9 6) (6 2 9) (7 7 7)) '((8 6 3 8 8) (9 3 7 2 4) (8 3 1 2 1) (9 9 5 3 9) (4 3 4 3 0))))

; (inspect (matrix-*-vector-internal '((1 2 3 4) (4 5 6 6) (6 7 8 9)) '(1 2 3 4)))

; (inspect (matrix-*-vector `((1 3) (2 4)) `(5 6)))
; (inspect (transpose (transpose `((1 2 3 4)))))

; (inspect (dot-product '(1 2 3 4) '(5 6 7 8)))

(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
    (define (iter expr)
         (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
         )
    (iter (readExpr))


)