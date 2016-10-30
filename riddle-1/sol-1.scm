;If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;Find the sum of all the multiples of 3 or 5 below 1000.

;SOLUTION.
;A better solution would be using a closed expression. Although this one works as well.

(define (find-sum-mul-iter count n)
    (if (> n 0) (if (or (= (remainder n 3) 0) (= (remainder n 5) 0)) (find-sum-mul-iter (+ count n) (- n 1)) (find-sum-mul-iter count (- n 1))) count))

(define (find-sum-mul n) (find-sum-mul-iter 0 (- n 1)))

;(find-sum-mul 10)
(find-sum-mul 1000)











