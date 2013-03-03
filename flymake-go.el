;;; flymake-go.el --- A flymake handler for go-mode files
;;
;; Author: Michael Fellinger <michael@iron.io>
;;         Robert Zaremba <robert.marek.zaremba@wp.eu>
;; Version: 2013.03.02
;; Keywords: Go flymake
;; URL: https://github.com/robert-zaremba/flymake-go
;; Package-Requires: ((flymake "0.4.13"))
;;
;; This file is not part of GNU Emacs.
;;
;; Usage:
;; (require 'flymake-go)
;;
;;; Code:

(require 'flymake)

(defvar flymake-go-executable "go" "The go executable to use for syntax checking")

(defun flymake-go-init ()
  (list flymake-go-executable
        (list "fmt"
              (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))))

(push '(".+\\.go$" flymake-go-init) flymake-allowed-file-name-masks)

(add-hook 'go-mode-hook (lambda () (flymake-mode)))

;;;###autoload
(eval-after-load "go-mode"
  '(require 'flymake-go))

(provide 'flymake-go)

;;; flymake-go.el ends here
