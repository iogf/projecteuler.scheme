    


(define (is-prime? n)
        (let ((sq (round (sqrt n))))
             (define (iter c)
                     (if (<= c sq)
                         (if (zero? (remainder n c))
                             #f
                             (iter (+ c 2)))
                         #t))
    
            (cond  ((= n 2) #t)
                   ((zero? (remainder n 2)) #f)
                   (else (iter 3))))) 
  
   
(define (find-sum max)
        (define (iter c sum)
                 (if (< c max)
                     (if (is-prime? c) 
                         (iter (+ c 2) (+ c sum)) 
                         (iter (+ c 2) sum))
                     sum))
        (iter 3 0))



(+ 2 (find-sum 2000000))



