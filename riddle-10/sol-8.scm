;The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;Find the sum of all the primes below two million.


(define (xi procedure min max inc)
        (define (iter c)
                (if (< c max)
                    (begin (procedure c)
                           (iter (+ c inc)))))
        (iter min))


(define (next-non-zero vec start)
        (let ((len (vector-length vec)))
             (define (iter c)
                     (cond ((>= c len) len)
                           ((not (= (vector-ref vec c) 0)) c)
                           ((< c len) (iter (+ c 1)))))    
             (iter start)))


(define (calculate-sum sieve)
        (define (iter i c)
                (let ((q (next-non-zero sieve (+ i 1))))
                     (if (< q MAX)
                         (begin (xi (lambda (x) 
                                            (vector-set! sieve x 0)) 
                                    (+ q q) MAX q) 
                                (iter q (+ c q)))
                          c)))
        (iter 1 0))


(define MAX 2000000)
(define sieve (make-vector MAX))
(xi (lambda (x) (vector-set! sieve x x)) 0 MAX 1)
(calculate-sum sieve)



;142913828922
;real	0m21.645s
;user	0m21.617s
;sys	0m0.016s



