;constructor
(define (node inValue inParent inChild)
    (define val inValue)
    (define parent inParent)
    (define child inChild)
    (define (set-parent p) (set 'parent p))
    (define (set-child c) (set 'child c))
    (define (set-val va) (set 'val va))
    (define (get-parent) parent)
    (define (get-child) child)
    (define (get-val) val)
    this
)


(define (deque)
    (define queuelist nil)
    (define size 0)
    (define tail nil)
    (define (enqueueFront val)
        (define n (node val nil nil))
        (if (null? queuelist)
            (begin
                (set 'size 1)
                (set 'queuelist n)
                (set 'tail n)
                )
            (begin
                ((n 'set-child) queuelist)
                ((queuelist 'set-parent) n)
                (set 'queuelist n)
		(set! size (+ size 1))
                )
            )
        val
        )


    (define (enqueueBack val)
        (define n (node val nil nil))
        (if (null? queuelist)
            (begin
                (set 'size 1)
                (set 'queuelist n)
                (set 'tail n)
                )
            (begin
                ((n 'set-parent) tail)
                ((tail 'set-child) n)
                (set 'tail n)
		(set! size (+ size 1))
                )
            )
        val
        )


    (define (enqueueIndex ind val)
        (define (enqueIter src count in va)
            (if (= count in)
                (begin
                    (define c ((src 'get-child)))
                    (define n (node va src c))
                    ((src 'set-child) n)
                    (if (= in size)
                        (set 'tail n)
                        ((c 'set-parent) n)
                        )
                    )
                (enqueIter ((src 'get-child)) (+ count 1) in va)
                )
            )

        (if (= ind 0)
            (enqueueFront val)
            (begin
                (enqueIter queuelist 1 ind val)
		(set! size (+ size 1))
                )
            )
        val
        )


    (define (dequeueFront)
        (define v ((queuelist 'get-val)))
        (set 'queuelist ((queuelist 'get-child)))
	(set! size (- size 1))
        (if (= size 0)
            (set 'tail nil)
            ((queuelist 'set-parent) nil)
            )
        v
        )


    (define (dequeueBack)
        (define v ((tail 'get-val)))
        (set 'tail ((tail 'get-parent)))
	(set! size (- size 1))
        (if (= size 0)
            (set 'queuelist nil)
            ((tail 'set-child) nil)
            )
        v
        )


    (define (dequeueIndex ind)
        (define (displayIter src ind count)
            (if (= ind count)
                (begin
                    (define c ((src 'get-child)))
                    (define p ((src 'get-parent)))
                    (define v ((src 'get-val)))
                    ((c 'set-parent) p)
                    (if (!= count 0)
                        ((p 'set-child) c)
                        (set 'queuelist c)
                        )
                    v
                    )
                (displayIter ((src 'get-parent)) ind (- count 1))
                )
            )
        

        (if (= ind (- size 1))
            (dequeueBack)
            (begin
                (define v (displayIter ((tail 'get-parent)) ind (- size 2)))
		(set! size (- size 1))
                v
                )
            )
        )

    
    (define (display)
        (define (displayIter src)
            (if (not (null? src))
                (begin 
                    (print ((src 'get-val)))
                    (if (not (null? ((src 'get-child))))
                        (begin 
                            (print ",")
                            (displayIter ((src 'get-child)))
                            )
                        )
                    )
                )
            )

        (print "[")
        (displayIter queuelist)
        (print "]")
        )


    (define (peekFront)
        ((queuelist 'get-val))
        )

    
    (define (peekBack)
        ((tail 'get-val))
        )
        

    this
    )


(define (main)
    (define env this)
    (define (iter expr)
         (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
         )
    (setPort (open (getElement ScamArgs 1) 'read))
    (iter (readExpr))
    )
