;;;; packages.asd
;;;;
;;;; This file is part of the AGLORP library, released under Lisp-LGPL.
;;;; See file COPYING for details.
;;;;
;;;; Author: Moskvitin Andrey <archimag@gmail.com>


(defpackage #:aglorp
  (:use #:cl #:iter)
  (:export #:*storage*
           ;;
           #:storage-persist-object
           #:storage-read-objects
           #:storage-one-object
           #:storage-count-objects
           #:storage-object-id
           #:call-with-storage
           ;;
           #:with-storage
           #:persist-object
           #:read-objects
           #:one-object
           #:count-objects
           #:oid
           ;;
           #:class-sql-table))