;;;; aglorp.asd
;;;;
;;;; This file is part of the AGLORP library, released under Lisp-LGPL.
;;;; See file COPYING for details.
;;;;
;;;; Author: Moskvitin Andrey <archimag@gmail.com>


(defsystem aglorp
  :depends-on (#:closer-mop #:postmodern #:iterate)
  :components ((:module "src"
                        :components ((:file "packages")
                                     (:file "aglorp" :depends-on ("packages"))
                                     (:file "db-storage" :depends-on ("packages"))))))

(defmethod perform ((o test-op) (c (eql (find-system 'aglorp))))
  (operate 'load-op 'aglorp)
  (operate 'test-op 'aglorp))


(defsystem aglorp-test
  :depends-on (#:aglorp #:lift)
  :components ((:module "t"
                        :components ((:file "core")
                                     (:file "db-storage-test" :depends-on ("core"))))))

(defmethod perform ((o test-op) (c (eql (find-system 'aglorp-test))))
  (operate 'load-op 'aglorp-test )
  (let* ((test-results (funcall (intern (symbol-name 'run-aglorp-tests) '#:aglorp.test)))
         (errors (funcall (intern (symbol-name 'errors) :lift) test-results))
         (failures (funcall (intern (symbol-name 'failures) :lift) test-results)))
    (if (or errors failures)
        (error "test-op failed: ~A"
               (concatenate 'list errors failures))
        (print test-results))))

