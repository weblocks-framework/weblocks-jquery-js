;;;; weblocks-prototype-js.lisp

(in-package #:weblocks-query-js)

(defmethod weblocks-webapp-default-dependencies :around ((self weblocks-webapp))
  (append 
    (call-next-method)
    (when (equal (weblocks:weblocks-webapp-js-backend self) :jquery)
      (let ((base-path  (weblocks::asdf-system-directory :weblocks-jquery-js)))
        '((:script "jquery-1.8.2" :default t)
          (:script "jquery-seq" :default t)
          (:script "weblocks-jquery" :default t))))))

(defmethod initialize-webapp :after ((self weblocks-webapp))
  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/jquery/1.8.2/"
    :webapp self)
  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/jquery-seq/0.0.3/"
    :webapp self)
  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/weblocks-jquery/0.2.0/"
    :webapp self))
