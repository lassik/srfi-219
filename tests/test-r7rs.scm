(import (except (scheme base) define) (srfi 64) (srfi 219))

(test-begin "srfi-219")

(let ()
  (define ((greet/prefix prefix) suffix)
    (string-append prefix " " suffix))
  (let ((greet (greet/prefix "Hello")))
    (test-equal "Hello there!" (greet "there!"))))

(let ()
  (define ((append-to . a) . b)
    (apply append (append a b)))
  (test-equal '()
    ((append-to '()) '()))
  (test-equal '(1 2 3 4 5 6 7 8)
    ((append-to '(1 2) '(3 4)) '(5 6) '(7 8))))

(let ()
  (define (((jenga a b) c d))
    (list a b c d))
  (test-equal '(1 2 3 4)
    (((jenga 1 2) 3 4))))

(test-end)
