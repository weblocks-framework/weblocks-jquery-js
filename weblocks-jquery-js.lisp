;;;; weblocks-prototype-js.lisp

(in-package #:weblocks-jquery-js)

(defmethod weblocks-webapp-default-dependencies :around ((self weblocks-webapp))
  (append 
    (when (equal (weblocks:weblocks-webapp-js-backend self) :jquery)
      (weblocks-webapp-dependencies-for-backend self :jquery))
    (call-next-method)))

(defmethod weblocks-webapp-dependencies-for-backend ((self weblocks-webapp) (backend (eql :jquery)))
  (let ((base-path  (weblocks::asdf-system-directory :weblocks-jquery-js)))
    '((:script "jquery-1.8.2" :default t)
      (:script "jquery-seq" :default t)
      (:script "weblocks-jquery" :default t))))

(defmethod weblocks-webapp-init-dependencies-for-backend ((self weblocks-webapp) (backend (eql :jquery)))
  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/jquery/1.8.2/"
    :webapp self)
  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/jquery-seq/0.0.3/"
    :webapp self)
  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/weblocks-jquery/0.2.0/"
    :webapp self))

(defmethod initialize-webapp :after ((self weblocks-webapp))
  (when (equal (weblocks-webapp-js-backend self) :jquery)
    (weblocks-webapp-init-dependencies-for-backend self :jquery)))
