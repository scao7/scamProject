(define (gcd m n)
  (if (= n 0)
  	m
	(println m)
	(gcd n (% m n))
	)
  m
  ;(println "end" )
  )

(define (main)
  (inspect (gcd 10 5))
  ;(println (gcd 13 1))
  )
