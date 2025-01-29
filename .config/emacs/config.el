(defvar elpaca-installer-version 0.9)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Install use-package support
(elpaca elpaca-use-package

  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)

  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

;; Block until current queue processed.
(elpaca-wait)

(use-package evil

  ;; Force evil to load first
  :demand t

  ;; Customise evil
  :custom

  ;; This is optional since it's already set to t (true) by default
  (evil-want-integration t)
  (evil-want-keybinding nil)

  ;; Open the new window on the right
  ;; when splitting vertically, just like in vim
  (evil-vsplit-window-right t)

  ;; Open the new window at the bottom
  ;; when splitting horizontally, just like in vim
  (evil-split-window-below t)

  ;; Use Ctrl + u to scroll up
  (evil-want-C-u-scroll t)

  ;; Set "Y" to yank till the end of the line
  (evil-want-Y-yank-to-eol t)

  ;; Make evil-search-word look for symbols rather than word boundaries
  (evil-symbol-word-search t)

  ;; Add the hook to enter insert mode when editing a commit
  :hook (git-commit-mode . evil-insert-state)

  ;; Configure evil mode
  :config

  ;; Set the undo system to Emacs' undo redo
  (evil-set-undo-system 'undo-redo)

  ;; The function to centre the screen on the current cursor position
  (defun centre-screen (&rest _)
    (evil-scroll-line-to-center nil))

  ;; Centre the screen after every jump
  (dolist (func '(evil-search-next
                  evil-search-previous
                  evil-scroll-up
                  evil-scroll-down
                  evil-scroll-page-up
                  evil-scroll-page-down))
    (advice-add func :after #'centre-screen))

  ;; Enable evil mode
  (evil-mode))

(use-package evil-collection

  ;; Load the evil collection after evil
  :after evil

  ;; Force evil collection to load first
  :demand t

  ;; Use z for folds in magit
  :custom (evil-collection-magit-use-z-for-folds t)

  ;; Configure evil collection
  :config

  ;; Initialise the evil collection
  (evil-collection-init))

(use-package evil-goggles

  ;; Configure evil goggles
  :config

  ;; Use diff faces, which will cause deleted text to be highlighted
  ;; with the "diff-removed" face which is typically some red colour
  ;; Other faces such as "diff-added" will be used for other actions
  (evil-goggles-use-diff-faces)

  ;; Activate evil goggles mode
  (evil-goggles-mode))

(use-package evil-nerd-commenter)

(use-package evil-surround :config (global-evil-surround-mode 1))

(use-package evil-anzu

  ;; Initialise Anzu mode
  :init

  ;; Set the search threshold for anzu
  (setq anzu-search-threshold 1000)

  ;; Use anzu mode globally
  (global-anzu-mode t))

(use-package general

  ;; Load general.el immediately to make use of
  ;; the :general use-package keyword
  :ensure (:wait t) :demand t

  ;; Configure general.el
  :config

  ;; Use the evil setup for general.el
  (general-evil-setup)

  ;; Key binds in normal and visual mode
  (general-define-key
   :states '(normal visual)
   :keymaps 'override

   ;; Comment out lines with Ctrl + /
   "C-/" '("Comment out the selected lines" . evilnc-comment-or-uncomment-lines)

   ;; Use Ctrl + hjkl to move between splits
   "C-h" '("Go to the window on the left" . evil-window-left)
   "C-j" '("Go to the window below" . evil-window-down)
   "C-k" '("Go to the window above" . evil-window-up)
   "C-l" '("Go to the window on the right" . evil-window-right)
   )

  ;; Key binds for dired
  (general-define-key
   :states 'normal
   :keymaps 'dired-mode-map
   :major-modes 'dired-mode
   "_" '("Create a file" . find-file)
   )

  ;; Key binds for transient (used by Magit)
  (general-define-key
   :keymaps 'transient-base-map
   "<escape>" 'transient-quit-one
   )

  ;; Create a new definer for the leader keys
  (general-create-definer hanker/leader-keys

    ;; Set the leader key in all modes
    :states '(normal insert visual emacs)
    :keymaps 'override

    ;; Set the leader key to space
    :prefix "SPC"

    ;; Access leader key in insert mode using "Ctrl + Space"
    :global-prefix "C-SPC")

  ;; Key binds for BibTeX files
  (hanker/leader-keys
    :states 'normal
    :keymaps 'bibtex-mode-map
    :major-modes 'bibtex-mode
    "f" '("Format the BibTeX buffer" . bibtex-reformat))




  ;; Function definitions that are used in the key bindings

  ;; Function to use a register with an evil function
  (defun use-register-with-evil-function (register evil-function)
    "A wrapper function to easily use a specified register REGISTER
     with an evil function EVIL-FUNCTION."
    (interactive)
    (let ((evil-this-register register))
      (call-interactively evil-function)))




  ;; Key bindings involving the leader key

  ;; Key binds to copy and paste from the clipboard
  (hanker/leader-keys
    :states 'normal
    "P" '("Paste from the system clipboard before the cursor" .
          (lambda () (interactive) (use-register-with-evil-function ?+ 'evil-paste-before)))
    "pp" '("Paste from the system clipboard after the cursor" .
           (lambda () (interactive) (use-register-with-evil-function ?+ 'evil-paste-after)))
    "y" '("Copy to the system clipboard" .
          (lambda () (interactive) (use-register-with-evil-function ?+ 'evil-yank)))
    "Y" '("Copy till the end of the line to the system clipboard" .
          (lambda () (interactive) (use-register-with-evil-function ?+ 'evil-yank-line)))
    "d" '("Delete to the black hole register" .
          (lambda () (interactive) (use-register-with-evil-function ?_ 'evil-delete)))
    )

  ;; Key binds for buffer management
  (hanker/leader-keys
    :states 'normal
    "l" '("Go to the next buffer" . next-buffer)
    "h" '("Go to the previous buffer" . previous-buffer)
    "x" '("Close the current buffer" . kill-this-buffer)
    )

  ;; Key binds for searching
  (hanker/leader-keys
    :states 'normal
    "pw" '("Open Dired" . dired)
    "pf" '("Search for a file" . find-file)
    )

  ;; Key binds for git
  (hanker/leader-keys
    :states 'normal
    "gs" '("Open Git" . magit-status)
    )

  ;; Key binds for opening specific files
  (hanker/leader-keys
    :states 'normal
    "ec" '("Edit Emacs config" .
           (lambda () (interactive) (find-file "~/.config/emacs/config.org")))
    )

  ;; Key binds in org mode
  (hanker/leader-keys
    :states 'normal
    :keymaps 'org-mode-map
    :major-modes 'org-mode
    "o" '(:ignore t :wk "Org mode keybinds")
    "oe" '("Org export dispatch" . org-export-dispatch)
    "oi" '("Org toggle item" . org-toggle-item)
    "oa" '("Org agenda" . org-agenda)
    "ot" '("Org todo" . org-todo-list)
    "ob" '(:ignore t :wk "Org babel keybinds")
    "obt" '("Org babel tangle" . org-babel-tangle)
    "obe" '("Org babel execute buffer" . org-babel-execute-buffer)
    )

  ;; Key binds to show diagnostics
  (hanker/leader-keys
    :states 'normal
    :keymaps 'flycheck-mode-map
    :major-modes 'flycheck-mode
    "tr" '("List all the errors in the current buffer" . flycheck-list-errors)
    "tb" '("List all the errors in the current buffer" . flycheck-list-errors)
    )

  ;; Key binds for help files.
  ;; I'm using "/" because it is where the question mark is.
  ;; But I don't want to press shift to access the help files.
  (hanker/leader-keys
    :states 'normal
    "/" '(:ignore t :wk "Help")
    "/b" '("Describe bindings" . describe-bindings)
    "/c" '("Describe character under cursor" . describe-char)
    "/d" '(:ignore t :wk "Emacs documentation")
    "/da" '("About Emacs" . about-emacs)
    "/dd" '("View Emacs debugging" . view-emacs-debugging)
    "/df" '("View Emacs FAQ" . view-emacs-FAQ)
    "/dm" '("The Emacs manual" . info-emacs-manual)
    "/dn" '("View Emacs news" . view-emacs-news)
    "/do" '("How to obtain Emacs" . describe-distribution)
    "/dp" '("View Emacs problems" . view-emacs-problems)
    "/dt" '("View Emacs todo" . view-emacs-todo)
    "/dw" '("Show the COPYING file" . describe-no-warranty)
    "/e" '("View echo area messages" . view-echo-area-messages)
    "/f" '("Describe function" . describe-function)
    "/F" '("Describe face" . describe-face)
    "/g" '("Describe the GNU Project" . describe-gnu-project)
    "/i" '("Info" . info)
    "/I" '("Describe input method" . describe-input-method)
    "/k" '("Describe key" . describe-key)
    "/l" '("Display recent keystrokes and commands" . view-lossage)
    "/L" '("Describe language environment" . describe-language-environment)
    "/m" '("Describe mode" . describe-mode)
    "/r" '("Reload Emacs config" . (lambda () (interactive)
                                     (load-file "~/.config/emacs/init.el")
                                     (ignore (elpaca-process-queues))))
    "/t" '("Load theme" . load-theme)
    "/v" '("Describe variable" . describe-variable)
    "/w" '("Prints keybinding for command if set" . where-is)
    "/x" '("Display full documentation for command" . describe-command)
    )

  )

(use-package undo-fu-session :init (undo-fu-session-global-mode))

(use-package vundo

  ;; Lazy load vundo when the command is called
  :commands vundo

  ;; Use pretty unicode glyphs to draw the tree
  :custom (vundo-glyph-alist vundo-unicode-symbols)

  ;; Keybinds for vundo
  :general
  (hanker/leader-keys
    :states 'normal
    "u" '("Open the undo tree window" . vundo)))

(use-package which-key

  ;; Force which key to load immediately on start up
  :demand t

  ;; Customise which key
  :custom
  (which-key-side-window-location 'bottom)
  (which-key-sort-order #'which-key-key-order-alpha)
  (which-key-sort-uppercase-first nil)
  (which-key-add-column-padding 1)
  (which-key-max-display-columns nil)
  (which-key-min-display-lines 6)
  (which-key-side-window-slot -10)
  (which-key-side-window-max-height 0.25)
  (which-key-idle-delay 0.5)
  (which-key-max-description-length 25)
  (which-key-allow-imprecise-window-fit t)
  (which-key-separator " → ")

  ;; Initialise which key
  :init (which-key-mode 1))

(set-face-attribute 'default nil
                    :font "CaskaydiaCove Nerd Font Mono 12"
                    ;; :font "Maple Mono NF CN 12"
                    :weight 'medium)

(set-face-attribute 'fixed-pitch nil
                    :font "CaskaydiaCove Nerd Font Mono 12"
                    ;; :font "Maple Mono NF CN 12"
                    :weight 'medium)

(set-face-attribute 'font-lock-comment-face nil :slant 'italic)

(add-to-list 'default-frame-alist '(font . "CaskaydiaCove Nerd Font Mono 12"))
;; (add-to-list 'default-frame-alist '(font . "Maple Mono NF CN 12"))

(setq inhibit-startup-message t)

(set-fringe-mode 5)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(tooltip-mode -1)

;; Set the fill column to 80
(setq-default fill-column 80)

;; Enable the fill column display in programming mode
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

(setq ring-bell-function 'ignore)

(setq make-backup-files nil)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(dolist (mode '(term-mode-hook
                eshell-mode-hook
                pdf-view-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(column-number-mode)

(setq scroll-margin 8)
(setq scroll-step 1)

(global-visual-line-mode t)

(setq revert-without-query '(".pdf"))

(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)
(setq-default evil-shift-width tab-width)

(electric-pair-mode 1)

(setq dabbrev-case-fold-search nil)

(setq whitespace-style '(

                         ;; Enable highlighting of whitespace
                         face

                         ;; Show tabs
                         tabs

                         ;; Show trailing spaces
                         trailing

                         ;; Show indentation
                         indentation

                         ;; Show mixed indentation
                         space-before-tab
                         space-after-tab

                         ;; Show spaces using a special character
                         space-mark

                         ;; Show tabs using a special character
                         tab-mark

                         ;; Show new lines using a special character
                         newline-mark))

(setq whitespace-display-mappings

      ;; Non-breaking spaces are displayed as ‡
      ;; Fall back to underscores if ‡ cannot be displayed
      '((space-mark ?\xA0 [?‡] [?_])

        ;; New lines are displayed as ↵
        ;; Fall back to the dollar sign symbol if ↵ cannot be displayed
        (newline-mark ?\n [?↵ ?\n] [?$ ?\n])

        ;; Carriage return (Windows) are displayed as ¶
        ;; Fall back to the hash symbol if ¶ cannot be displayed
        (newline-mark ?\r [?¶] [?#])

        ;; Tabs are displayed as ⇥
        ;; Fall back to the greater than symbol if ⇥ cannot be displayed
        (tab-mark ?\t [?⇥ ?\t] [?> ?\t])))

(setq-default show-trailing-whitespace t)

(setq-default whitespace-global-modes
              '(not shell-mode
                    help-mode
                    magit-mode
                    magit-diff-mode
                    ibuffer-mode
                    dired-mode
                    occur-mode
                    elpaca-log-mode
                    elpaca-ui-mode
                    elpaca-ui-live-update-mode
                    fundamental-mode))

(setq-default whitespace-action
              '(cleanup auto-cleanup))

(global-whitespace-mode 1)

(use-package doom-themes

  ;; Customise doom themes
  :custom

  ;; Enable bold and italic fonts for doom themes
  (doom-themes-enable-bold t)
  (doom-themes-enable-italics t)

  ;; Corrects and improves org-mode's native fontification
  :config (doom-themes-org-config))

(use-package auto-dark

  ;; Customise the auto dark package
  :custom

  ;; Set the dark theme and light theme.
  ;; The first theme is when dark mode is active,
  ;; and the second theme is when light mode is active.
  (auto-dark-themes '((doom-bluloco-dark) (doom-bluloco-light)))

  ;; Initialise the auto dark package
  :init (auto-dark-mode))

(use-package doom-modeline :init (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Install the all the icons package
(use-package all-the-icons

  ;; Only load the package if the interface is graphical and not a terminal
  :if (display-graphic-p))

;; Install the all the icons package for dired and enable it in dired mode
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package nerd-icons

  ;; Customise nerd icons
  :custom

  ;; Set the font to Cascadia Code nerd font
  (nerd-icons-font-family "CaskaydiaCove NFM")

  ;; Set the font to Maple Mono NF CN
  ;; (nerd-icons-font-family "Maple Mono NF CN")

  )

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(use-package dired-preview

  ;; Configure dired preview
  :config

  ;; Enable dired preview globally
  (dired-preview-global-mode 1))

(use-package lsp-mode

  ;; Load LSP mode only when the commands below are called
  :commands (lsp lsp-deferred)

  ;; Customise LSP mode
  :custom

  ;; Set the prefix for LSP mode key binds
  (lsp-keymap-prefix "C-;")

  ;; Disable snippet support for LSP mode
  (lsp-enable-snippet nil)

  ;; Initialise LSP mode
  :init

  ;; Functions to set up LSP mode
  (defun lsp-mode-setup ()
    "The function to set up LSP mode"

    ;; Set up the headerline in LSP mode
    (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))

    ;; Enable the headerline
    (lsp-headerline-breadcrumb-mode))

  (defun lsp-completion-mode-setup ()
    "The function to set up LSP completion with Corfu"

    ;; Set up completion with Corfu with the flex configuration
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(flex)))

  ;; The hooks for LSP mode
  :hook

  ;; Run the LSP mode setup function every time LSP mode is started
  (lsp-mode . lsp-mode-setup)

  ;; Run the LSP mode completion setup function every time the
  ;; LSP completion mode is started
  (lsp-completion-mode . lsp-completion-mode-setup)

  ;; Disable LSP mode integration with completion at point functions in text mode.
  ;; This is to get autocompletions with Corfu and Cape working again in text mode.
  (text-mode . (lambda () (setq-local lsp-completion-enable nil)))

  ;; Configure LSP mode
  :config

  ;; Enable which key integration for LSP mode
  (lsp-enable-which-key-integration t)

  ;; Register the efm language server
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "efm-langserver")

                    ;; So far, only Ruff is being used,
                    ;; so only activate the server in Python mode
                    :activation-fn (lsp-activate-on "python")
                    :server-id 'efm))

  ;; Ensure that efm language server is installed
  :ensure-system-package (efm-langserver . "yay -S efm-langserver"))

(use-package lsp-ui

  ;; Start the UI when LSP mode is started
  :hook (lsp-mode . lsp-ui-mode)

  ;; Customise the UI
  :custom

  ;; Set the position of the documentation to be at the cursor position
  (lsp-ui-doc-position 'at-point)

  ;; Keybinds for LSP mode
  :general

  ;; Key binds for normal mode in LSP mode
  (:keymaps 'lsp-mode-map
            :states 'normal
            "K" '("Describe the currently hovered item" . lsp-ui-doc-glance)
            "gd" '("Go to definition" . lsp-ui-peek-find-definitions)
            "gD" '("Go to declaration" . lsp-find-declaration)
            "gi" '("List all implementations" . lsp-ui-peek-find-implementation)
            "go" '("Go to type definition" . lsp-find-type-definition)
            "gr" '("List all references" . lsp-ui-peek-find-references)
            "gs" '("Show signature information" . lsp-signature-activate)
            "<f2>" '("Renames all references to the symbol under the cursor" . lsp-rename)
            "<f3>" '("Formats the buffer using the LSP" . lsp-format-buffer)
            "SPC f" '("Formats the buffer using the LSP" . lsp-format-buffer)
            "<f4>" '("Select a code action" . lsp-execute-code-action)

            :states 'visual
            "<f3>" '("Formats the region using the LSP" . lsp-format-region)
            "SPC f" '("Formats the region using the LSP" . lsp-format-region)
            )
  )

(use-package lua-mode)
(use-package haskell-mode)
(use-package rust-mode

  ;; Initialise the treesitter
  :custom (rust-mode-treesitter-derive t)

  ;; Enable the lsp when in rust mode
  :hook (rust-mode . lsp-deferred))

(use-package lsp-ltex-plus

  ;; Pull the plugin from GitHub
  :ensure (lsp-ltex-plus :host github :repo "emacs-languagetool/lsp-ltex-plus")

  ;; Ensure LTEX+ exists
  :ensure-system-package (ltex-ls-plus . "yay -S ltex-ls-plus-bin")

  ;; Customise LTEX+
  :custom

  ;; Set the language for LTEX+ to British English
  (lsp-ltex-plus-language "en-GB")

  ;; Disable the oxford spelling rule
  (lsp-ltex-plus-disabled-rules '(:en-GB ["OXFORD_SPELLING_Z_NOT_S"]))

  ;; Set the wanted LTEX+ version to the latest version
  (lsp-ltex-plus-version "18.4.0")

  ;; Enable LTEX+ in text mode
  :hook (text-mode . (lambda ()
                       (require 'lsp-ltex-plus)
                       (lsp-deferred))))

(use-package lsp-pyright

  ;; Ensure basedpyright exists
  :ensure-system-package (basedpyright . "yay -S basedpyright")

  ;; Customise lsp-pyright
  :custom

  ;; Use basedpyright
  (lsp-pyright-langserver-command "basedpyright")

  ;; Disable organising imports for lsp-pyright
  (lsp-pyright-disable-organize-imports t)

  ;; Activate lsp-pyright in Python mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

(use-package flycheck :init (global-flycheck-mode))

(use-package vertico

  ;; Include vertico extensions
  :ensure (vertico :host github :repo "minad/vertico" :files (:defaults "extensions/*"))

  ;; Load vertico immediately
  :demand t

  ;; Hooks for vertico
  :hook

  ;; Clean up the file path when typing
  (rfn-eshadow-update-overlay . vertico-directory-tidy)

  ;; Make sure that vertico state is saved
  (minibuffer-setup . vertico-repeat-save)

  ;; Customise vertico
  :custom

  ;; Resize vertico
  (vertico-resize t)

  ;; Cycle from bottom to top
  (vertico-cycle t)

  ;; Extensions customisations

  ;; Customise the grid view
  (vertico-grid-separator "       ")
  (vertico-grid-lookahead 50)

  ;; Customise the buffer display action
  (vertico-buffer-display-action '(display-buffer-reuse-window))

  ;; Set the layouts for vertico in different modes
  (vertico-multiform-categories
   '((file reverse)
     (consult-grep buffer)
     (consult-location)
     (imenu buffer)
     (library reverse indexed)
     (org-roam-node reverse indexed)
     (t reverse)
     ))

  ;; Set the layouts for vertico in different commands
  (vertico-multiform-commands
   '(("flyspell-correct-*" grid reverse)
     (org-refile grid reverse indexed)
     (consult-yank-pop indexed)
     (consult-flycheck)
     (consult-lsp-diagnostics)
     ))

  ;; Configure vertico
  :config

  ;; Start vertico
  (vertico-mode)

  ;; Start vertico multiform mode
  (vertico-multiform-mode))

(use-package marginalia

  ;; Add a key bind to cycle the marginalia annotations
  :general (:keymaps 'minibuffer-local-map
                     "M-a" 'marginalia-cycle)

  ;; Customise marginalia
  :custom

  ;; Never show a relative age
  ;; for the file annotator
  (marginalia-max-relative-age 0)

  ;; Add marginalia at the right side
  (marginalia-align 'right)

  ;; Start marginalia mode
  :init (marginalia-mode))

(use-package nerd-icons-completion

  ;; Load the package after marginalia
  :after marginalia

  ;; Set up nerd icons with marginalia
  :hook (marginalia-mode . nerd-icons-completion-marginalia-setup)

  ;; Start nerd icons completion
  :init (nerd-icons-completion-mode))

(use-package orderless

  ;; Customise orderless
  :custom

  ;; Use basic as a fallback style
  (completion-styles '(orderless basic))

  ;; Get orderless to work with remote files
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult

  ;; Make sure fd and ripgrep are installed
  :ensure-system-package (fd . "sudo pacman -S fd")
  :ensure-system-package (rg . "sudo pacman -S ripgrep")

  ;; Keymaps for consult
  :general

  ;; Key maps
  (:states 'normal
           "<f1>" '("Search the info pages" . consult-info))

  ;; Leader key maps
  (hanker/leader-keys
    :states 'normal
    "/a" '("Search the manpages" . consult-man)
    "/i" '("Search the info pages" . consult-info)
    "/h" '("Search the info pages" . consult-info)
    "pb" '("Search for open buffers" . consult-buffer)
    "pr" '("Search through the registers" . consult-register-load)
    "ps" '("Search for a string within a file" . consult-ripgrep)
    )
  )

(use-package corfu

  ;; Pull the corfu extensions from the repo as well
  :ensure (corfu :host github :repo "minad/corfu" :files (:defaults "extensions/*"))

  ;; Customise corfu
  :custom

  ;; Allows cycling through candidates
  (corfu-cycle t)

  ;; Enable auto completion
  (corfu-auto t)

  ;; Only auto complete when there are 2 letters or more
  (corfu-auto-prefix 2)

  ;; Preselect the first candidate
  (corfu-preselect-first t)

  ;; Stop auto completing when there is a separator like a space
  (corfu-quit-at-boundary 'separator)

  ;; Don't show the documentation for the completion.
  ;; I am using corfu-popupinfo-mode for the documentation instead.
  (corfu-echo-documentation nil)

  ;; Do not preview current candidate
  (corfu-preview-current 'insert)

  ;; Make sure tab doesn't indent when performing a completion
  (tab-always-indent 'complete)

  ;; Disable the return key
  :bind (:map corfu-map ("RET" . nil))

  ;; Initialise corfu
  :init

  ;; Show documentation using the corfu pop up info extension
  (corfu-popupinfo-mode 1)

  ;; Save completion history for better sorting
  (corfu-history-mode 1)
  (savehist-mode 1)
  (add-to-list 'savehist-additional-variables 'corfu-history)

  ;; Function to corfu in the minibuffer
  ;; if other completion plugins are not active
  (defun corfu-enable-always-in-minibuffer ()
    "Enable Corfu in the minibuffer if Vertico/Mct are not active."
    (unless (or (bound-and-true-p mct--active)
                (bound-and-true-p vertico--input)
                (eq (current-local-map) read-passwd-map))

      ;; Disable automatic echo and popup
      (setq-local corfu-echo-delay nil
                  corfu-popupinfo-delay nil)

      ;; Enable corfu
      (corfu-mode 1)))

  ;; Enable corfu everywhere
  (global-corfu-mode)

  ;; Enable corfu in the minibuffer
  ;; if other completion plugins are not active
  :hook (minibuffer-setup . corfu-enable-always-in-minibuffer))

(use-package kind-icon

  ;; Load kind icon after corfu and nerd icons
  :after (corfu nerd-icons)

  ;; Customise corfu
  :custom

  ;; Don't use SVG based icons from kind icons
  (kind-icon-use-icons nil)

  ;; Use nerd font icons instead
  (kind-icon-mapping
   `(
     (array, (nerd-icons-mdicon "nf-md-code_brackets") :face font-lock-type-face)
     (boolean, (nerd-icons-faicon "nf-fa-toggle_off") :face font-lock-builtin-face)
     (class, (nerd-icons-mdicon "nf-md-shape") :face font-lock-type-face)
     (color, (nerd-icons-mdicon "nf-md-palette") :face success)
     (constant, (nerd-icons-mdicon "nf-md-pi") :face font-lock-constant-face)
     (constructor, (nerd-icons-faicon "nf-fae-tools") :face font-lock-function-name-face)
     (enum, (nerd-icons-faicon "nf-fa-arrow_down_a_z") :face font-lock-builtin-face)
     (enummember, (nerd-icons-faicon "nf-fa-arrow_down_a_z") :face font-lock-builtin-face)
     (enum-member, (nerd-icons-faicon "nf-fa-arrow_down_a_z") :face font-lock-builtin-face)
     (event, (nerd-icons-faicon "nf-fa-bolt") :face font-lock-warning-face)
     (field, (nerd-icons-mdicon "nf-md-tag_plus") :face font-lock-variable-name-face)
     (file, (nerd-icons-mdicon "nf-md-file_document") :face font-lock-string-face)
     (folder, (nerd-icons-mdicon "nf-md-folder") :face font-lock-doc-face)
     (function, (nerd-icons-mdicon "nf-md-function") :face font-lock-function-name-face)
     (interface, (nerd-icons-faicon "nf-fa-sitemap") :face font-lock-type-face)
     (keyword, (nerd-icons-mdicon "nf-md-key_chain_variant") :face font-lock-keyword-face)
     (macro, (nerd-icons-faicon "nf-fa-maxcdn") :face font-lock-keyword-face)
     (magic, (nerd-icons-mdicon "nf-md-magic_staff") :face font-lock-builtin-face)
     (method, (nerd-icons-octicon "nf-oct-package") :face font-lock-function-name-face)
     (module, (nerd-icons-mdicon "nf-md-view_module_outline") :face font-lock-preprocessor-face)
     (numeric, (nerd-icons-mdicon "nf-md-numeric") :face font-lock-builtin-face)
     (operator, (nerd-icons-codicon "nf-cod-symbol_operator") :face font-lock-comment-delimiter-face)
     (param, (nerd-icons-mdicon "nf-md-format_title") :face default)
     (property, (nerd-icons-faicon "nf-fa-wrench") :face font-lock-variable-name-face)
     (reference, (nerd-icons-octicon "nf-oct-file_symlink_file") :face font-lock-variable-name-face)
     (snippet, (nerd-icons-faicon "nf-fa-scissors") :face font-lock-string-face)
     (string, (nerd-icons-codicon "nf-cod-case_sensitive") :face font-lock-string-face)
     (struct, (nerd-icons-mdicon "nf-md-database") :face font-lock-variable-name-face)
     (text, (nerd-icons-sucicon "nf-custom-default") :face font-lock-doc-face)
     (typeparameter, (nerd-icons-codicon "nf-cod-symbol_parameter") :face font-lock-type-face)
     (type-parameter, (nerd-icons-codicon "nf-cod-symbol_parameter") :face font-lock-type-face)
     (unit, (nerd-icons-faicon "nf-fa-ruler") :face font-lock-constant-face)
     (value, (nerd-icons-mdicon "nf-md-alphabetical_variant") :face font-lock-builtin-face)
     (variable, (nerd-icons-mdicon "nf-md-variable") :face font-lock-variable-name-face)
     (t, (nerd-icons-faicon "nf-fa-code") :face font-lock-warning-face)

     ;; This is here to follow the Neovim ordering
     (command, (nerd-icons-faicon "nf-fa-terminal") :face default)))

  ;; Have the background be the same as corfu's default
  (kind-icon-default-face 'corfu-default)

  ;; Configure kind icon
  :config

  ;; Enable kind icon with corfu
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape

  ;; Initialise cape and add the wanted completion functions
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-tex)
  (add-hook 'completion-at-point-functions #'cape-rfc1345)
  (add-hook 'completion-at-point-functions #'cape-sgml)
  (add-hook 'completion-at-point-functions #'cape-keyword)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  (add-hook 'completion-at-point-functions #'cape-elisp-symbol)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-line)
  (add-hook 'completion-at-point-functions #'cape-history)
  (add-hook 'completion-at-point-functions #'cape-emoji)
  ;; (add-hook 'completion-at-point-functions #'cape-abbrev)
  ;; (add-hook 'completion-at-point-functions #'cape-dict)
  )

(use-package helpful

  ;; Remap the default Emacs commands to the helpful versions
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(use-package magit :commands (magit magit-status))

;; Update transient, which is a magit dependency
(use-package transient)

(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-enable))

(use-package org-bullets

  ;; Load the package only after org mode
  :after org

  ;; Add hooks to org bullets
  :hook

  ;; Enable org indent and org bullets mode
  (org-mode . org-indent-mode)
  (org-mode . (lambda () (org-bullets-mode 1))))

(electric-indent-mode -1)

(setq org-edit-src-content-indentation 0)

(require 'org-tempo)

(add-hook 'org-mode-hook (lambda ()
                           (setq-local electric-pair-inhibit-predicate
                                       `(lambda (c)
                                          (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(use-package evil-org

  ;; Ensure that evil org is only loaded after org mode
  :after org

  ;; Start evil org when org mode is started
  :hook (org-mode . (lambda () (evil-org-mode)))

  ;; Configure evil org
  :config

  ;; Set the key bindings for org agenda
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(setq org-highlight-latex-and-related '(native))

;; Add the minted LaTeX package
;; to the header of all Org mode LaTeX exports
(add-to-list 'org-latex-packages-alist '("" "minted"))

;; Use the minted LaTeX package for source code blocks
;; instead of the default LaTeX verbatim block
(setq org-latex-listings 'minted)

;; Add the shell escape to the latexmk command
(setq org-latex-pdf-process '("latexmk -shell-escape -f -pdf -%latex -interaction=nonstopmode -output-directory=%o %f"))

(use-package citeproc)

(use-package ox-ipynb
  :ensure (ox-ipynb :host github :repo "jkitchin/ox-ipynb")
  :init (require 'ox-ipynb))

(use-package jupyter

  ;; Load the Jupyter languages
  :init
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (jupyter . t)))

  ;; Hooks for emacs jupyter
  :hook

  ;; Add a hook to redisplay inline images
  ;; after executing a code block
  (org-babel-after-execute . org-redisplay-inline-images))

(setq org-confirm-babel-evaluate nil)

(use-package pdf-tools

  ;; Customise to use PDF tools to open
  ;; LaTeX PDF files
  :custom
  (TeX-view-program-selection '((output-pdf "PDF Tools")))
  (TeX-source-correlate-start-server t)

  ;; Update PDF buffers after successful LaTeX runs
  :init
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

  ;; Install pdf-tools
  :config (pdf-tools-install))

(use-package auctex :defer t
  :ensure (:pre-build (("./autogen.sh")
                        ("./configure"
                         "--without-texmf-dir"
                         "--with-packagelispdir=./"
                         "--with-packagedatadir=./")
                        ("make"))
            :build (:not elpaca--compile-info)
            :files ("*.el" "doc/*.info*" "etc" "images" "latex" "style")
            :version (lambda (_) (require 'auctex) AUCTeX-version))
  :mode (("\\.tex\\'" . LaTeX-mode)))

(use-package evil-tex
  :hook (LaTeX-mode . evil-tex-mode))

(use-package hardtime

  ;; Get hardtime.el from GitHub
  :ensure (hardtime :host github :repo "ichernyshovvv/hardtime.el")

  ;; Define the evil hardtime check command function
  :init
  (defun evil-hardtime-check-command ()
    "Return non-nil if the currently executed command should be checked."
    (memq this-command '( next-line previous-line evil-previous-visual-line
                          right-char left-char left-word right-word
                          evil-forward-char evil-backward-char
                          evil-next-line evil-previous-line)))

  ;; Customise hardtime.el
  :custom

  ;; Set the hardtime period to 1 second
  (hardtime-period 1)

  ;; Use the evil hardtime check command instead
  (hardtime-predicate #'evil-hardtime-check-command)

  ;; Hooks for hardtime mode
  :hook
  (prog-mode . hardtime-mode)
  (org-mode . hardtime-mode)
  (text-mode . hardtime-mode))
