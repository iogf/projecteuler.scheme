
;The sum of the squares of the first ten natural numbers is,

; (1^2 + 2^2 + 3^2 + ... + 10^2) = 385

;The square of the sum of the first ten natural numbers is,
;(1 + 2 + ... + 10)^2 = 55^2 = 3025

;Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 \u2212 385 = 2640.

;Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


(define (diff n)
        (- (expt (reduce + 0 (iota (+ n 1) 0)) 2)
           (reduce (lambda (x y) (+ y (expt x 2))) 0 (iota (+ n 1) 0))))

(diff 100)

;Value: 25164150









