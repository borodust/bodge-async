(cl:in-package :uv)


(autowrap:c-include
 '(bodge-async "bodge_async.h")
 :spec-path '(bodge-async spec)
 :definition-package :%uv
 :sysincludes (append #+unix
                      (list "/usr/lib/gcc/x86_64-pc-linux-gnu/6.3.1/include/")
                      #+windows
                      (list "c:/msys64/mingw64/x86_64-w64-mingw32/include/"
			    "c:/msys64/mingw64/include/"
			    "c:/msys64/usr/local/include/"))
 :exclude-sources (".*\\.h")
 :include-sources ("uv\\.h")
 :include-definitions ("^(__)?(u|u_)?int.{0,2}(ptr)?(_t)?$"

                       "^pthread.*_t$"
                       "^__pthread.*$"
                       "^__jmp_buf$"

                       "addrinfo"
                       "sockaddr(_in.?|_storage)?"
                       "in_port_t$"
                       "in6?_addr"
                       "sa_.*_t$"
                       "^(__)?socklen_t$"
                       "_io_t"
                       "FILE"
                       "gid_t$"
                       "uid_t$"
                       "sem_t$"
                       "size_t$"
                       "mode_t$"
                       "off(64)?_t$"
                       "termios$"
                       "_IO_marker$"
                       "cc_t$"
                       "speed_t$"
                       "tcflag_t$"

                       "^uv_(?!_|buf_init).*$"
                       "^uv__async$"
                       "^uv__work$"
                       "^uv__io"
                       "^uv__async_cb$")
 :exclude-definitions ("^uv_buf_init$")
 :no-accessors t
 :symbol-exceptions (("getaddrinfo" . #.(symbol-name 'platform-getaddrinfo))
                     ("freeaddrinfo" . #.(symbol-name 'platform-freeaddrinfo))
                     ("gid_t" . #.(symbol-name 'platform-gid-t))
                     ("uid_t" . #.(symbol-name 'platform-uid-t))
                     ("sem_t" . #.(symbol-name 'platform-sem-t)))
 :symbol-regex (("(uv|UV)_\\w*" () (lambda (name matches regex)
                                     (declare (ignore matches regex))
                                     (subseq name 3)))))
