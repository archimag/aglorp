;;;; aglorp.lisp
;;;;
;;;; This file is part of the AGLORP library, released under Lisp-LGPL.
;;;; See file COPYING for details.
;;;;
;;;; Author: Moskvitin Andrey <archimag@gmail.com>


(defpackage #:aglorp.test
  (:use #:cl #:iter #:lift #:aglorp)
  (:export #:run-aglorp-tests))

(in-package #:aglorp.test)

(deftestsuite aglorp-test-suite () ())

(defun run-aglorp-tests (&optional (test 'aglorp-test-suite))
  "Run all aglorp tests"
  (run-tests :suite test :report-pathname nil))

