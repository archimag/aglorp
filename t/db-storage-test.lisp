;;;; db-storage-test.lisp
;;;;
;;;; This file is part of the AGLORP library, released under Lisp-LGPL.
;;;; See file COPYING for details.
;;;;
;;;; Author: Moskvitin Andrey <archimag@gmail.com>

(in-package #:aglorp.test)

(deftestsuite db-storage-suite (aglorp-test-suite) ())

(closer-mop:finalize-inheritance
 (defclass user ()
   ((name :initarg :name :type (string 32)))))

(addtest (db-storage-suite)
  class-sql-table-1
  (ensure-same '(:create-table user
                 ((name :type (string 32))))
               (class-sql-table nil 'user)))
               