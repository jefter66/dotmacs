(use-package auctex
  :hook ((latex-mode LaTeX-mode) . lsp)
  :config
  (add-to-list 'texmathp-tex-commands "dmath" 'env-on)
  (texmathp-compile)
  :init
  (setq-default TeX-master 'shared)
  ;; nil is the default; this remains here as a reminder that setting it to
  ;; true makes emacs hang on every save when enabled.
  (setq TeX-auto-save nil)
  (setq TeX-parse-self t))

(setq-default TeX-master nil)
(use-package auctex-latexmk
  :config
  (setq auctex-latexmk-inherit-TeX-PDF-mode t)
  :init
  (auctex-latexmk-setup))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(setq TeX-view-program-selection
      '((output-pdf "PDF Viewer")))

(setq TeX-view-program-list
      '(("PDF Viewer" "xreader %o")))

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("PdfLatex" "pdflatex -interaction=nonstopmode %s" TeX-run-command t t :help "Run pdflatex") t))
