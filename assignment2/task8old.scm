(define (node value left right)
    (define (display) (print value))
    this)

(define (newBST value)
    ; (inspect value)
    (node value nil nil))

(define (displayBST root)
    (define (iter root indent)
        (if (valid? root)
            (begin
                (iter (root'right) (string+ indent "    "))
                (print indent)
                ((root'display))
                (println)
                (iter (root'left) (string+ indent "    ")))))
    (iter root ""))

(define (insertBST node val)
    (cond ((null? node) (newBST val))
          ((> (get 'value node) val)
              (begin
                  (set 'left (insertBST (get 'left node) val) node)
                  node
                ))
          (else
              (begin
                (set 'right (insertBST (get 'right node) val) node)
                node))))
    ;       ((> (node'value) val) (node (node'value) (insertBST (node'left) val) (node'right)))
    ;       (else (node (node'value) (node'left) (insertBST (node'right) val)))))

          
          
          
; (define t0 (newBST 5))
; (define t1 (insertBST t0 2))
; (define t2 (insertBST t1 8))
; (displayBST t2)

(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
    (define (iter expr)
         (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
         )
    (iter (readExpr))


)