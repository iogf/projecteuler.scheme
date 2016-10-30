



;The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;Find the sum of all the primes below two million.

(use-modules (srfi srfi-1))


(define seqp '(2 3))
(define (is-prime? n)
        (define (iter-i c xs)
                (cond ((= c n) 1)
                      ((> (expt c 2) n) 1)
                      ((zero? (remainder n c)) 0)
                      ((null? xs) -1)
                      (else (iter-i (car xs) (cdr xs)))))

        (define (iter-j c)
                (let ((q (expt c 2)))
                     (if (< q n)
                         (if (zero? (remainder n c))
                             #f
                             (iter-j (+ c 2)))
                         (> q n))))
    
        (define (return)
            (let* ((r (iter-i (car seqp) (cdr seqp))))
                  (cond ((= r -1) (iter-j (+ (last seqp) + 2))) 
                        ((= r 0)  #f)
                        ((= r 1)  #t))))
    
        (let ((value (return)))
             (begin (if value (append! seqp `(,n)))
                    value)))


(define (find-sum max)
        (define (iter c sum)
                 (if (< c max)
                     (if (is-prime? c) 
                         (iter (+ c 2) (+ c sum)) 
                         (iter (+ c 2) sum))
                     sum))
        (iter 5 0))


(define seqp '(2 3))


(+ 2 3 (find-sum 2000000))

;142913828917















