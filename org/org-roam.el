(use-package org-roam
  :ensure t
  :custom
  (org-roam-v2-ack t)
  (org-roam-directory (file-truename "~/Dropbox/notes/"))
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "Default notes" plain
      "%?"
      :if-new (file+head "${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("p" "Notes on physics" plain
      "#+setupfile:~/Dropbox/Templates/physics.org \n* %?"
      :if-new (file+head "${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
   ("m" "Notes on mathematics" plain
    "#+setupfile:~/Dropbox/Templates/mathematics.org \n* %?"
    :if-new (file+head "${slug}.org" "#+title: ${title}\n")
    :unnarrowed t)
  ("c" "Notes on computing" plain
   "#+setupfile:~/Dropbox/Templates/computing.org \n* %?"
   :if-new (file+head "${slug}.org" "#+title: ${title}\n")
   :unnarrowed t)))
:bind (("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n g" . org-roam-graph)
       ("C-c n i" . org-roam-node-insert)
       ("C-c n c" . org-roam-capture)
       ;; Dailies
       ("C-c n j" . org-roam-dailies-capture-today))
:config
(org-roam-db-autosync-mode)
;; If using org-roam-protocol
(require 'org-roam-protocol))

(setq org-roam-v2-ack t)

(use-package websocket
  :ensure t)
(use-package simple-httpd :ensure t)
(add-to-list 'load-path "~/.emacs.d/org-roam-ui")
(load-library "org-roam-ui")
