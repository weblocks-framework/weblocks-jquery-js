;;;; weblocks-prototype-js.lisp

(in-package #:weblocks-jquery-js)


(defmethod get-js-backend-dependencies (app (backend (eql :jquery)))
  (list (make-instance 'weblocks:script-dependency
                       :url "/pub/scripts/jquery-1.8.2.js")
        (make-instance 'weblocks:script-dependency
                       :url "/pub/scripts/jquery-seq.js")
        (make-instance 'weblocks:script-dependency
                       :url "/pub/scripts/weblocks-jquery.js")))


(defmethod initialize-js-backend ((self weblocks-webapp) (backend (eql :jquery)))
  (log:debug "Initializing jquery js backend")

  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/jquery/1.8.2/"
    :webapp self)
  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/jquery-seq/0.0.3/"
    :webapp self)
  (weblocks-utils:require-assets 
    "https://raw.github.com/html/weblocks-assets/master/weblocks-jquery/0.2.0/"
    :webapp self))

