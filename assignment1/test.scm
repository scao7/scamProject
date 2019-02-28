(define pi 3.141592653589793238462643383279502884197169)

(define (cym val)
     ; calls cyan, yellow, magenta then returns their values as string with #
        (string+ "#" (hex (cyan val)) (hex (yellow val)) (hex (magenta val))); add hex calls
	   )

(define (cyan val)
     ; unModVal = cos((val*200/pi))
        ; return unModVal *255
	   (int (* 255 (cos (/ (* (real val) pi) 200))))
	      )

(define (yellow val)
     ; unModVal = -sin(x) + 1
        (int (* 255 (+ 1 (* -1 (sin (* pi .01 val))))))
	   )

(define (magenta val)
     ; unModVal = cos(x) + 1 
        (int (/ (* 255 (+ 1 (cos (/ (* 3 pi (real val)) 200)))) 2))
	   )

(define (run3) 
     (exprTest (cym 0) "#FFFFFF")
        (exprTest (cym 100) "#00FF7F") 
	   )

(define hexConv "0123456789ABCDEF")

(define (hex function)
     ; this function calls cyan, yellow, or magenta and then converts the return value to hex
        ; and returns a 2 digit string of that hex
	   (string+ (getElement hexConv (int (/ function 16))) 
		                (getElement hexConv (int (% function 16))))
	      )
(define (main) 
     (println(cym 0) "#FFFFFF")
        (println (cym 100) "#00FF7F") 
	   )
