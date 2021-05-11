;; -*- coding: utf-8; lexical-binding: t; -*-


;; use profile-open-file to profile `open file speed`
(defun profile-open-file ()
  (interactive)
  (profiler-start 'cpu)
  (find-file "/home/dasky92/.emacs.d")
  (profiler-report)
  (profiler-stop))

;; settings for emacs.d configuration
(load-theme 'srcery t)


;; override key-bindings in init-evil.el
;; this following is a sample
;; (with-eval-after-load 'evil
;;   (my-space-leader-def
;;     "ss" 'pwd
;;     "ll" 'pwd
;;     "pp" 'pwd))


;; default input-method is quanpin,
;; you can use this to override it

;;(with-eval-after-load 'pyim
;;  (setq pyim-default-scheme 'xiaohe-shuangpin))
