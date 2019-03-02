 (define (pascal r c) 
      (if (or (= c 1) (= c r)) 
	       1 
	              (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))) 
  
 ;; Testing
(define main
 (println (pascal 1 1)) 
 (pascal 2 2) 
 (pascal 3 2) 
 (pascal 4 2) 
 (pascal 5 2) 
 (pascal 5 3)
 )
