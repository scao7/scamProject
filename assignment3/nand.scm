(define (nand-gate in1 in2 out)
    (define (logical-nand a b) (if (= (+ a b) 2) 0 1))
    (define (nand-action-procedure)
        (let ((new-value
                (logical-nand (get-signal in1) (get-signal in2))))
            (after-delay 6
                (lambda () (set-signal! out new-value))
                )
            )
        )
    (add-action! in1 nand-action-procedure)
    (add-action! in2 nand-action-procedure)
    'ok
    )
