

;A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
;a^2 + b^2 = c^2

;For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.

;There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;Find the product abc.


; a^2 + b^2 = c^2
; a + b + c = 1000
; a = 1000 - b - c
; (1000-c-b)^2 + b^2 = c^2
; (1000-c)^2 - 2(1000-c)b + 2b^2 = c^2
; (1000-c)^2 - c^2 - 2(1000-c)b + 2b^2 = 0
; So, i iterate over the natural numbers, and substituting c
; in the equation, if i find a solution for the formed equation
; then it is our solution. So i calculate the product.

(define (has-root? a b c)
        (let ((d (- (expt b 2) (* 4 a c))))
             (and (positive? d) (integer? (sqrt d)))))


(define (find-root a b c)
        (let ((d (sqrt (- (expt b 2) (* 4 a c)))))
             `(,(/ (+ (* -1 b) d) (* 2 a)) ,(/ (- (* -1 b) d) (* 2 a)))))

(define (search-product max)
        (define (iter i)
                (let ((a 2) 
                     (b (* -1 (* 2 (- 1000 i)))) 
                     (c (- (expt (- 1000 i) 2) (expt i 2))))

                     (if (has-root? a b c)
                         (let* ((r (find-root a b c))
                                (x (car r)) 
                                (y (car (cdr r)))
                                (z (- 1000 (+ x i)))                  
                                (w (- 1000 (+ y i))))
                                (cond ((= (+ (expt z 2) (expt x 2)) (expt i 2)) (* i x z))
                                      ((= (+ (expt w 2) (expt y 2)) (expt i 2)) (* i y z))
                                      (else (iter (+ i 1)))))
                         (iter (+ i 1)))))
        (iter 1))

(search-product 1000)

;31875000.0

