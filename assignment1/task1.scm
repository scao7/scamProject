(define hexConvert "0123456789ABCDEF")
(define (hex function)
	(string+ (getElement hexConvert (int (/ function 16))) 
		 (getElement hexConvert (int (% function 16)))
	)
)

(define (cym in)
	(define pi 3.14159265358979323846)

	(define cyan 
		 (int (*(sin(+(/(* pi in) 200) (/ pi 2))) 255))
	)
		;sin(((pi * in) / 200) * (pi * 2)) * 255 

	(define yellow
		(int(* ( + (sin ( + (/ ( * pi in) 100 ) pi)) 1) 255))
	)

	(define magenta
	  	(int (* ( / (+(sin(+(/(* 3 pi in ) 200) (/ pi 2)))1)2)255))
	)
	(println "(cyan " in ") is " cyan)
	(println "(yellow " in ") is " yellow)
	(println "(magenta " in ") is " magenta)
	(println "(cym "  in ") is #" (hex cyan) (hex yellow) (hex magenta))
)
(define (main)
  	(setPort (open(getElement ScamArgs 1) 'read))
	(define arg (readExpr))
  	(cym arg)
)
