;;;; db-storage.lisp
;;;;
;;;; This file is part of the AGLORP library, released under Lisp-LGPL.
;;;; See file COPYING for details.
;;;;
;;;; Author: Moskvitin Andrey <archimag@gmail.com>

(in-package #:aglorp)

(defgeneric class-sql-table (storage class)
  (:documentation "Generate SQL code for create table from class definition"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; default implementation of generic interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod class-sql-table (storage (class symbol))
  (class-sql-table storage (find-class class)))

(defmethod class-sql-table (storage (class class))
  (list :create-table (class-name class)
        (iter (for slot in (closer-mop:class-slots class))
              (collect (list (closer-mop:slot-definition-name slot)
                             :type (closer-mop:slot-definition-type slot))))))

