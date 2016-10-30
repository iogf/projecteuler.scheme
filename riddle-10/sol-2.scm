(define (is-prime? n)
        (define (iter c)
                (let ((q (expt c 2)))
                     (if (< q n)
                         (if (zero? (remainder n c))
                             #f
                             (iter (+ c 2)))
                         (> q n))))
    
        (cond  ((= n 2) #t)
               ((zero? (remainder n 2)) #f) 
               (else (iter 3))))

(define (find-sum max)
        (define (iter c sum)
                 (if (< c max)
                     (if (is-prime? c) 
                         (iter (+ c 2) (+ c sum)) 
                         (iter (+ c 2) sum))
                     sum))
        (iter 3 0))



(+ 2 (find-sum 2000000))


