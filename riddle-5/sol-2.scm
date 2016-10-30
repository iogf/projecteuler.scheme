;2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

;What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?



(define (is-prime  n)
        (let ((max (round (sqrt n))))
             (define (iter c)
                     (if (<= c max)
                         (if (= (remainder n c) 0)
                             #f
                             (iter (+ c 1)))
                         #t))
             (iter 2)))
        

(define (next-prime n) 
        (define (iter c)
                (if (is-prime c)
                    c
                    (iter (+ c 1))))
        (iter (+ n 1)))


(define (factor n) 
        (define (iter xs c q)
                (if (= q 1)
                    xs
                    (if (= (remainder q c) 0)
                        (iter (cons c xs) c (quotient q c))
                        (iter xs (next-prime c) q))))
        (iter '() 2 n))



                

(define (group xs)
        (define (iter ns ms n c)
                (if (null? ms)
                    (cons `(,n ,c) ns)
                    (if (= (car ms) n)
                        (iter ns (cdr ms) n (+ c 1))
                        (iter (cons `(,n ,c) ns) 
                              (cdr ms) 
                              (car ms) 
                              1))))  
         (let ((ms (sort xs <)))
              (iter '() (cdr ms) (car ms) 1)))




(define (compress xs)
        (define (iter ns ms c)
                (if (null? ms)
                    (cons c ns)
                    (if (= (car ms) c)
                        (iter ns (cdr ms) c)
                        (iter (cons c ns) (cdr ms) (car ms)))))
        (let ((ms (sort xs <)))
             (iter '() (cdr ms) (car ms))))
    


(define (get-power xs n)
        (if (null? xs)
            0
            (if (= (car (car xs)) n)
                (car (cdr (car xs)))
                (get-power (cdr xs) n))))
    

(define (get-greatest-power xs n)
        (define (iter xs c)
            (if (null? xs)
                c
                (let ((q (get-power (car xs) n)))
                     (if (< c q)
                         (iter (cdr xs) q)
                         (iter (cdr xs) c)))))
        (iter (cdr xs) (get-power (car xs) n)))
                        


;(define (join-factors xs)
;        (define (iter ns ms)
;                (if (null? ms)
;                    ns
;                    (iter (cons (group (factor (car ms))) 
;                                ns) 
;                          (cdr ms))))
;        (iter '() xs))



(define (join-factors xs)
        (define (iter ns ms zs)
                (if (null? zs)
                    `(,(compress ns) ,ms)
                    (let ((vs (factor (car zs))))
                         (iter (append ns vs) 
                               (cons (group vs) ms) 
                               (cdr zs)))))

        (iter '() '() xs))

(define (pick-up-factors xs)
        (define (iter vs ns ms)
                (if (null? ns)
                    vs
                    (iter (cons `(,(car ns) ,(get-greatest-power ms (car ns))) vs) 
                          (cdr ns) ms)))
    
        (let ((f (join-factors xs)))
              (iter '() (car f) (car (cdr f)))))


(define (find-lcm xs)
        (define (iter ms c)
            (if (null? ms)
                c
                (iter (cdr ms) 
                      (* c (expt (car (car ms)) (car (cdr (car ms))))))))
        (iter (pick-up-factors xs) 1))


(find-lcm (iota 20 2))


; WTF?

;Value: 232792560

