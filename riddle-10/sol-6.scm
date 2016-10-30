

(define (xi procedure min max inc)
        (define (iter c)
                (if (< c max)
                    (begin (procedure c)
                           (iter (+ c inc)))))
        (iter min))


(define (sieve ns)
        (let ((len (length ns)))
             (define (iter xs c)
                     (if (null? xs) c
                         (let ((q (car xs)) (v (cdr xs)))
                              (if (= q 0) (iter v c)
                                  (begin (xi (lambda (i) 
                                                     (list-set! ns i 0)) 
                                             (+ q q) len q)
                                         (iter v (+ q c))))))) 
             (iter (cddr ns) 0)))

(define seq (iota 20))
(sieve seq)
;seq





