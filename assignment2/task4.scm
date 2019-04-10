
; (define (parser func)
;     (if (null? func)
;         ()
;         (cons (car func) (parser (cdr func)))))

(define (fst-elems func)
    (if (null? func)
        ()
        (cons (car (car func)) (fst-elems (cdr func)))))

(define (snd-elems func)
    ; (inspect func)
    ; (inspect (car func))
    (if (null? func)
        nil
        (cons (car (cdr (car func))) (snd-elems (cdr func)))))

(define (fst l)
    (car l))

(define (snd l)
    ; (inspect l)
    (cdr l))

(define (parser func)
    (cons (fst-elems func) (list (snd-elems func))))

; (define (left lambdas others)
;     (if (null? lambdas)
;         others
;         (append (list (append `(lambda) (list (car lambdas)))) (left (cdr lambdas) others))))

(define (left lambdas others)
    (if (null? lambdas)
        others ; unreachable
        (append `(lambda) (list (list (car lambdas))))))

(define (right lambdas)
    (if (null? lambdas)
        `()
        (car lambdas)))

(define (next-lambdas lambdas)
    ; (inspect (null? (car lambdas)))
    ; (inspect (fst lambdas))
    ; (inspect (car (snd lambdas)))
    (if (null? (car lambdas))
    nil
    (cons (cdr (fst lambdas)) (list (cdr (car (snd lambdas)))))))

(define (combine lambdas others)
    ; (inspect lambdas)
    ; (inspect lambdas)
    ; (inspect (snd lambdas))
    ; (inspect  (car (snd lambdas)))?
    ; (inspect (cdr (car (snd lambdas))))
    ; (inspect (car (snd lambdas)))
    ; (inspect (cons (cdr (fst lambdas)) (list (cdr (car (snd lambdas))))))
    ; (inspect  (fst lambdas))
    ; (inspect (append (append (append `(lambda) (list (list (car (fst lambdas))))) others) (car (snd lambdas))))
    ; (inspect (fst lambdas))
    ; (inspect (car (snd lambdas)))
    ; (inspect (left (fst lambdas) others))
    ; (inspect (right (car (snd lambdas))))
    ; (inspect others)
    (if (null? (fst lambdas))
    others
    (list (list (append (left (fst lambdas) others) (combine (next-lambdas lambdas) others)) (right (car (snd lambdas)))))
    ; (append (append (left (fst lambdas) others) (combine (next-lambdas lambdas) others)) (right (car (snd lambdas))))
    ; (append (left (fst lambdas) others) (right (car (snd lambdas))))
))
    ; (if (null? lambdas)
    ;     others
    ;     ; (inspect  (snd lambdas))
    ;     (append (append (append `(lambda) (list (list (car (fst lambdas))))) (combine (cons (cdr (fst lambdas)) (list (cdr (car (snd lambdas))))) others))
    ;         (car (snd lambdas)))))

(define (let*->lambdasImpl func)
    ; Combine lambda parameters and others
    (combine (parser (car (cdr func))) (cdr (cdr func))))

(define (let*->lambdas func)
    ; (inspect (eq? (car (car (cdr (cdr func)))) (car `(let*))))
    (if (eq? (car (car (cdr (cdr func)))) (car `(let*))) ; ignote all items before "let*"
        (append (list (car func) (car (cdr func))) (let*->lambdasImpl (car (cdr (cdr func)))))
        func))

; (inspect (let*->lambdas `(define (f x) (let* ((y 2) (z y)) (+ x y z)))))
; (inspect (let*->lambdaImpl `(let* ((y 2) (z y)) (+ x y z))))
; (inspect (fst-elems `((y 2) (z y) (w 7))))
; (inspect (parser `((y 2) (z y))))
; (inspect (parser `((w (+ 2 3)) (z (* 2 w)))))
; (inspect (let*->lambdas '(define (g x y) (let* ((w (+ 2 3)) (z (* 2 w))) (inspect w) (inspect z) (+ x y w z)))))
; (inspect (let*->lambdas '(define (f x) (define y 2) (+ x y))))


(define (main) 
    (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
            (define (iter expr)
                    (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
            )
            (iter (readExpr))
    )
