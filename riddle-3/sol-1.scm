;The prime factors of 13195 are 5, 7, 13 and 29.

;What is the largest prime factor of the number 600851475143 ?


(define (is-prime-iter count n)
    (if (< count (sqrt n)) 
        (if (= (remainder n count) 0) #f
            (is-prime-iter (+ count 1) n)) #t)) 



(define (is-prime n) (is-prime-iter 2 n))



(define (next-prime-iter n)
    (if (is-prime n) n (next-prime-iter (+ n 1))))



(define (next-prime n) (next-prime-iter (+ n 1)))



(define (find-prime-factors-iter count xs n)
    (if (> n 1) 
        (if (= (remainder n count) 0)
            (find-prime-factors-iter (next-prime count) (cons count xs) (quotient n count)) 
            (find-prime-factors-iter (next-prime count) xs n)) xs))  


(define (find-prime-factors n) (find-prime-factors-iter 2 '() n))

(display reduce (lambda (x y) (if (> x y) x y)) () (find-prime-factors 600851475143))





