;;;; weblocks-prototype-js.asd

(asdf:defsystem #:weblocks-jquery-js
  :serial t
  :description "Weblocks JavaScript backend for jQuery"
  :author "Olexiy Zamkoviy <olexiy.z@gmail.com>"
  :license "LLGPL"
  :version "0.0.3"
  :depends-on (#:weblocks #:weblocks-utils)
  :components ((:file "package")
               (:file "weblocks-jquery-js" :depends-on ("package"))))

