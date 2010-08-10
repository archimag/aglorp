;;;; packages.asd
;;;;
;;;; This file is part of the AGLORP library, released under Lisp-LGPL.
;;;; See file COPYING for details.
;;;;
;;;; Author: Moskvitin Andrey <archimag@gmail.com>


(defpackage #:aglorp
  (:use #:cl #:iter)
  (:export #:class-sql-table))