
(define (is-prime-iter count n)
    (if (< count (sqrt n)) 
        (if (= (remainder n count) 0) #f
            (is-prime-iter (+ count 1) n)) #t)) 



(define (is-prime? n) (is-prime-iter 2 n))

(define (find-sum max)
        (define (iter c sum)
                 (if (< c max)
                     (if (is-prime? c) 
                         (iter (+ c 2) (+ c sum)) 
                         (iter (+ c 2) sum))
                     sum))
        (iter 3 0))



(+ 2 (find-sum 2000000))



