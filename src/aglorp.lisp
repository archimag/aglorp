;;;; aglorp.lisp
;;;;
;;;; This file is part of the AGLORP library, released under Lisp-LGPL.
;;;; See file COPYING for details.
;;;;
;;;; Author: Moskvitin Andrey <archimag@gmail.com>

(in-package #:aglorp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; storage interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric storage-persist-object (storage object)
  (:documentation "Add OBJECT in the STORAGE"))

(defgeneric storage-read-objects (storage class &key limit offset)
  (:documentation "Read objects from a class 'CLASS from the STORAGE"))

(defgeneric storage-one-object (storage class &key &allow-other-keys))

(defgeneric storage-count-objects (storage class)
  (:documentation "Number of objects of class 'CLASS in STORAGE"))

(defgeneric storage-object-id (storage object)
  (:documentation "Return object ID"))
  
(defgeneric call-with-storage (storage thunk)
  (:documentation "Call thunk with storage"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; user inteface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *storage*)

(defmacro with-storage ((storage) &body body)
  `(let ((*storage* ,storage))
     (call-with-storage ,storage #'(lambda () ,@body))))

(defun persist-object (object)
  (storage-persist-object *storage* object))

(defun read-objects (class &key limit offset)
  (storage-read-objects *storage* class :limit limit :offset offset))

(defun count-objects (class)
  (storage-count-objects *storage* class))

(defun one-object (class &rest rest &key &allow-other-keys)
  ;;(storage-one-object *storage* class))
  (apply #'storage-one-object *storage* class rest))


(defun oid (object)
  (storage-object-id *storage* object))
