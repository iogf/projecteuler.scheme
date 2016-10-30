

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

(define (seek-prime n)
        (define (iter i c)
                (if (is-prime? c)
                    (if (>= i n)
                        c
                        (iter (+ i 1) (+ c 1)))
                    (iter i (+ c 1))))
        (iter 1 2))

(seek-prime 10001)

;Value: 104743






