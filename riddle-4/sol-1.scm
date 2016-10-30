



;A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

;Find the largest palindrome made from the product of two 3-digit numbers.


(define (base-order-iter c n)
    (let ((q (quotient n 10)))
        (if (= q 0) c (base-order-iter (+ c 1) q))))



(define (base-order n) (base-order-iter 0 n))

;(base-order 2302)

(define (reverse-number-iter c v n) 
    (if (= n 0) v (reverse-number-iter (- c 1) (+ (* (remainder n 10) (expt 10 c)) v) (quotient n 10))))


(define (reverse-number n) (reverse-number-iter (base-order n) 0 n))


;(reverse-number 10)


(define (is-palindrome n)
    (if (= (reverse-number n) n) #t #f))




(define (largest-palindrome-iter a b c)
    (let ((n (if (is-palindrome (* a b)) (if (> (* a b) c) (* a b) c) c)))
    (if (<= a 999)
        (if (< b 990) (largest-palindrome-iter a 
                                              (+ b 1) 
                                              n)
                     (largest-palindrome-iter (+ a 1) 1 n)) c)))
                        




(define (largest-palindrome) (largest-palindrome-iter 1 1 1))
(largest-palindrome)

;result 906609









