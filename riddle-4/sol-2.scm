
;A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.

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



(define (build-palindrome n)
    (let ((order (base-order n)))
         (+ (* n (expt 10 (+ order 1)))
            (reverse-number-iter order 0 n))))


(define (is-correct-iter c n)
    (if (<= c 999) 
        (if (and (= (base-order (quotient n c)) 
                    2) 
                 (= (remainder n c) 
                    0))
            #t 
            (is-correct-iter (+ c 1) n)) 
        #f)) 

(define (is-correct n) (is-correct-iter 100 n))

(define (largest-palindrome-iter c n)
    (let ((m (build-palindrome c)))
         (if (<= m 998001)
             (if (is-correct m)
                 (largest-palindrome-iter (+ c 1) (if (< m n)
                                                      n
                                                      m))
                 (largest-palindrome-iter (+ c 1) n)) 
             n)))

(largest-palindrome-iter 1 1)







