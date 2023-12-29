(defvar elpaca-installer-version 0.6)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
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
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
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

  ;; Install evil if it isn't installed
  :ensure t

  ;; Force evil to load first
  :demand t

  ;; Tweak evil's configuration before loading it
  :init

  ;; This is optional since it's already set to t (true) by default
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)

  ;; Open the new window on the right
  ;; when splitting vertically, just like in vim
  (setq evil-vsplit-window-right t)

  ;; Open the new window at the bottom
  ;; when splitting horizontally, just like in vim
  (setq evil-split-window-below t)

  ;; Use Ctrl + u to scroll up
  (setq evil-want-C-u-scroll t)

  ;; Set "Y" to yank till the end of the line
  (setq evil-want-Y-yank-to-eol t)

  ;; Configure evil mode
  :config

  ;; Set the undo system to Emacs' undo redo
  (evil-set-undo-system 'undo-redo)

  ;; Set the forward-evil-word function to be an alias for forward-evil-symbol instead
  (defalias #'forward-evil-word #'forward-evil-symbol)

  ;; Make evil-search-word look for symbols rather than word boundaries
  (setq-default evil-symbol-word-search t)

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

  ;; Load the evil collection after evil and magit
  :after (evil magit)

  ;; Ensure that the package is always installed
  :ensure t

  ;; Force evil collection to load first
  :demand t

  ;; Configure evil collection
  :config

  ;; Initialise the evil collection
  (evil-collection-init))

(use-package evil-goggles

  ;; Ensure that evil goggles is always installed
  :ensure t

  ;; Configure evil goggles
  :config

  ;; Use diff faces, which will cause deleted text to be highlighted
  ;; with the "diff-removed" face which is typically some red colour
  ;; Other faces such as "diff-added" will be used for other actions
  (evil-goggles-use-diff-faces)

  ;; Activate evil goggles mode
  (evil-goggles-mode))

(use-package evil-nerd-commenter
  :ensure t)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package general

  ;; Configure general.el
  :config

  ;; Use the evil setup for general.el
  (general-evil-setup)

  ;; Key binds in normal and visual mode
  (general-define-key
   :states '(normal visual)
   :keymaps 'override

   ;; Comment out lines with Ctrl + /
   "C-/" '(evilnc-comment-or-uncomment-lines :wk "Comment out the selected lines")

   ;; Use Ctrl + hjkl to move between splits
   "C-h" '(evil-window-left :wk "Go to the window on the left")
   "C-j" '(evil-window-down :wk "Go to the window below")
   "C-k" '(evil-window-up :wk "Go to the window above")
   "C-l" '(evil-window-right :wk "Go to the window on the right")
   )

  ;; Key binds for dired
  (general-define-key
   :states '(normal)
   :keymaps 'dired-mode-map
   "_" '(counsel-find-file :wk "Create a file")
   )

  ;; Set the leader key to the space key
  (general-create-definer hankertrix/leader-keys

    ;; Set the leader key in all modes
    :states '(normal insert visual emacs)
    :keymaps 'override

    ;; Set the leader key to space
    :prefix "SPC"

    ;; Access leader key in insert mode using "Ctrl + Space"
    :global-prefix "C-SPC")




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
  (hankertrix/leader-keys
    "P" '((lambda () (interactive) (use-register-with-evil-function ?+ 'evil-paste-before))
          :wk "Paste from the system clipboard before the cursor")
    "pp" '((lambda () (interactive) (use-register-with-evil-function ?+ 'evil-paste-after))
           :wk "Paste from the system clipboard after the cursor")
    "y" '((lambda () (interactive) (use-register-with-evil-function ?+ 'evil-yank))
          :wk "Copy to the system clipboard")
    "Y" '((lambda () (interactive) (use-register-with-evil-function ?+ 'evil-yank-line))
          :wk "Copy till the end of the line to the system clipboard")
    "d" '((lambda () (interactive) (use-register-with-evil-function ?_ 'evil-delete))
          :wk "Delete to the black hole register")
    )

  ;; Key binds for buffer management
  (hankertrix/leader-keys
    "l" '(next-buffer :wk "Go to the next buffer")
    "h" '(previous-buffer :wk "Go to the previous buffer")
    "x" '(kill-this-buffer :wk "Close the current buffer")
    )

  ;; Key binds for searching
  (hankertrix/leader-keys
    "pw" '(dired :wk "Open Dired")
    "pf" '(counsel-fzf :wk "Search for a file")
    "ps" '(counsel-rg :wk "Search for a term using ripgrep")
    )

  ;; Key binds for git
  (hankertrix/leader-keys
    "gs" '(magit :wk "Open Git"))

  ;; Key binds for opening specific files
  (hankertrix/leader-keys
    "ec" '((lambda () (interactive) (find-file "~/.config/emacs/config.org"))
           :wk "Edit Emacs config")
    )

  ;; Key binds in org mode
  (hankertrix/leader-keys
    "o" '(:ignore t :wk "Org mode keybinds")
    "oe" '(org-export-dispatch :wk "Org export dispatch")
    "ob" '(org-babel-tangle :wk "Org babel tangle")
    "oi" '(org-toggle-item :wk "Org toggle item")
    "oa" '(org-agenda :wk "Org agenda")
    "ot" '(org-todo-list :wk "Org todo")
    )

  ;; Key binds for help files
  ;; I'm using "/" because it is where the question mark is
  ;; But I don't want to press shift to access the help files
  (hankertrix/leader-keys
    "/" '(:ignore t :wk "Help")
    "/a" '(counsel-apropos :wk "Apropos")
    "/b" '(describe-bindings :wk "Describe bindings")
    "/c" '(describe-char :wk "Describe character under cursor")
    "/d" '(:ignore t :wk "Emacs documentation")
    "/da" '(about-emacs :wk "About Emacs")
    "/dd" '(view-emacs-debugging :wk "View Emacs debugging")
    "/df" '(view-emacs-FAQ :wk "View Emacs FAQ")
    "/dm" '(info-emacs-manual :wk "The Emacs manual")
    "/dn" '(view-emacs-news :wk "View Emacs news")
    "/do" '(describe-distribution :wk "How to obtain Emacs")
    "/dp" '(view-emacs-problems :wk "View Emacs problems")
    "/dt" '(view-emacs-todo :wk "View Emacs todo")
    "/dw" '(describe-no-warranty :wk "Describe no warranty")
    "/e" '(view-echo-area-messages :wk "View echo area messages")
    "/f" '(describe-function :wk "Describe function")
    "/F" '(describe-face :wk "Describe face")
    "/g" '(describe-gnu-project :wk "Describe the GNU Project")
    "/i" '(info :wk "Info")
    "/I" '(describe-input-method :wk "Describe input method")
    "/k" '(describe-key :wk "Describe key")
    "/l" '(view-lossage :wk "Display recent keystrokes and commands")
    "/L" '(describe-language-environment :wk "Describe language environment")
    "/m" '(describe-mode :wk "Describe mode")
    "/r" '(:ignore t :wk "Reload")
    "/rr" '((lambda () (interactive)
              (load-file "~/.config/emacs/init.el")
              (ignore (elpaca-process-queues)))
            :wk "Reload Emacs config")
    "/t" '(load-theme :wk "Load theme")
    "/v" '(describe-variable :wk "Describe variable")
    "/w" '(where-is :wk "Prints keybinding for command if set")
    "/x" '(describe-command :wk "Display full documentation for command")
    )

  )

(use-package which-key

  ;; Ensure that which key is installed
  :ensure t

  ;; Force which key to load immediately on start up
  :demand t

  ;; Initialise which key
  :init
  (which-key-mode 1)

  ;; Configure which key
  :config
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.5
        which-key-max-description-length 25
        which-key-allow-imprecise-window-fit t
        which-key-separator " → " ))

(set-face-attribute 'default nil
                    :font "CaskaydiaCove NFM 11"
                    :weight 'medium)

(set-face-attribute 'fixed-pitch nil
                    :font "CaskaydiaCove NFM 11"
                    :weight 'medium)

(set-face-attribute 'font-lock-comment-face nil :slant 'italic)

(add-to-list 'default-frame-alist '(font . "CaskaydiaCove NFM 11"))

(setq inhibit-startup-message t)

(set-fringe-mode 5)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(tooltip-mode -1)

(setq ring-bell-function 'ignore)

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

(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)
(setq-default evil-shift-width tab-width)

(electric-pair-mode 1)

(setq whitespace-style '(

                         ;; Enable highlighting of whitespace
                         face

                         ;; Show trailing spaces
                         trailing

                         ;; Show indentation
                         indentation

                         ;; Show mixed indentation
                         space-before-tab
                         space-after-tab

                         ;; Show hard spaces using a special character
                         space-mark

                         ;; Show new lines using a special character
                         newline-mark))

(setq whitespace-display-mappings

      ;; Hard spaces are displayed as ¤
      ;; Fall back to underscores if ¤ cannot be displayed
      '((space-mark   ?\xA0 [?¤]     [?_])

        ;; New lines are displayed as ↵
        ;; Fall back to the dollar sign symbol if ↵ cannot be displayed
        (newline-mark ?\n   [?↵ ?\n] [?$ ?\n])
        ))

(setq-default show-trailing-whitespace t)

(global-whitespace-mode 1)

(use-package doom-themes

  ;; Ensure that doom themes is always installed
  :ensure t

  ;; Configure doom themes
  :config

  ;; Enable bold and italic fonts for doom themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italics t)

  ;; Load and enable the bluloco dark theme
  (load-theme 'doom-bluloco-dark t)

  ;; Corrects and improves org-mode's native fontification
  (doom-themes-org-config))

(use-package uwu-theme

  ;; Ensure that the uww theme is installed
  :ensure t

  ;; Configure the uwu theme
  :config

  ;; Make the line numbers less distracting
  (setq uwu-distinct-line-numbers 'nil)

  ;; Scale org-mode headlines
  (setq uwu-scale-org-headlines 1)

  ;; Scale outline-mode headlines
  (setq uwu-scale-outline-headlines 1)

  ;; Load and enable the uwu theme
  ;; (load-theme 'uwu t)
  )

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Install the all the icons package
(use-package all-the-icons

  ;; Ensure that the package is installed
  :ensure t

  ;; Only load the package if the interface is graphical and not a terminal
  :if (display-graphic-p))

;; Install the all the icons package for dired and enable it in dired mode
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package nerd-icons

  ;; Ensure that the package is installed
  :ensure t

  ;; Customise nerd icons
  :custom

  ;; Set the font to the Cascadia Code nerd font
  (nerd-icons-font-family "CaskaydiaCove NFM"))

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(setq make-backup-files nil)

(setq revert-without-query '(".pdf"))

;; Install LSP mode
(use-package lsp-mode

  ;; Load LSP mode only when the commands below are called
  :commands (lsp lsp-deferred)

  ;; Customise LSP mode
  :custom

  ;; Set the LSP completion provider to none
  (lsp-completion-provider :none)

  ;; Custom keybindings for LSP mode
  :bind (:map lsp-mode-map
              ("C-; d" . flycheck-list-errors))

  ;; Initialise LSP mode
  :init

  ;; Set the prefix for LSP mode key binds
  (setq lsp-keymap-prefix "C-;")

  ;; Disable snippet support for LSP mode
  (setq lsp-enable-snippet nil)


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

  ;; Disable LSP mode integration with completion at point functions in text mode
  ;; This is to get autocompletions with corfu and cape working again in text mode
  (text-mode . (lambda () (setq-local lsp-completion-enable nil)))

  ;; Configure LSP mode
  :config

  ;; Enable which key integration for LSP mode
  (lsp-enable-which-key-integration t))

(use-package lsp-ui

  ;; Start the UI when LSP mode is started
  :hook (lsp-mode . lsp-ui-mode)

  ;; Customise the UI
  :custom

  ;; Set the position of the documentation to be at the bottom of the screen
  (lsp-ui-doc-position 'bottom))

(use-package lua-mode)
(use-package haskell-mode)

(use-package lsp-ltex

  ;; Enable ltex in text mode
  :hook (text-mode . (lambda ()
                       (require 'lsp-ltex)
                       (lsp-deferred)))

  ;; Initialise ltex
  :init

  ;; Set the language for ltex to British English
  (setq lsp-ltex-language "en-GB")

  ;; Disable the oxford spelling rule
  (setq lsp-ltex-disabled-rules '(:en-GB ["OXFORD_SPELLING_Z_NOT_S"]))

  ;; Set the wanted ltex version to 16.0.0
  (setq lsp-ltex-version "16.0.0"))

(use-package flycheck
  :ensure t
  :defer t
  :init (global-flycheck-mode))

(use-package ivy

  ;; Ensure that ivy is installed
  :ensure t

  ;; Customise ivy
  :custom

  ;; Allow ivy to search closed buffers as ivy will look through closed buffers
  (setq ivy-use-virtual-buffers t)

  ;; Set the dispaly format for the number of matches that ivy has found
  (setq ivy-count-format "(%d/%d) ")

  ;; This allows the execution of minibuffer commands while in the minibuffer
  (setq enable-recursive-minibuffers t)

  ;; Start ivy
  (ivy-mode))

(use-package counsel

  ;; Load counsel only after ivy is loaded
  :after ivy

  ;; Ensure that counsel is installed
  :ensure t

  ;; Configure counsel
  :config

  ;; Don't start searches with ^
  (setq ivy-initial-inputs-alist nil)

  ;; Start counsel mode to replace Emacs commands with ivy enhanced versions
  (counsel-mode))

(use-package ivy-rich

  ;; Load ivy rich after ivy
  :after ivy

  ;; Ensure that marginalia is installed
  :ensure t

  ;; This gives us descriptions in "M-x"
  :init (ivy-rich-mode 1)

  ;; Customise ivy rich
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)

  ;; Configure ivy rich
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

;; Install the all the icons package for ivy rich for nice icons
(use-package all-the-icons-ivy-rich

  ;; Ensure that the package is installed
  :ensure t

  ;; Ensure that the package is loaded after marginalia and all the icons
  :after (ivy-rich all-the-icons)

  ;; Start the all the icons package
  :init (all-the-icons-ivy-rich-mode 1))

(use-package corfu

  ;; Pull the corfu extensions from the repo as well
  :elpaca (corfu :host github :repo "minad/corfu" :files (:defaults "extensions/*"))

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

  ;; Don't show the documentation for the completion
  ;; I am using corfu-popupinfo-mode for the documentation instead
  (corfu-echo-documentation nil)

  ;; Do not preview current candidate
  (corfu-preview-current 'insert)

  ;; Key binds for corfu
  :bind (:map corfu-map
              ("RET" . nil)
              ("C-n" . corfu-next)
              ("C-p" . corfu-previous)
              ("TAB" . corfu-insert)
              ([tab] . corfu-insert))

  ;; Initialise corfu
  :init

  ;; Use corfu everywhere
  (global-corfu-mode)

  ;; Show documentation using the corfu pop up info extension
  (corfu-popupinfo-mode 1)

  ;; Save completion history for better sorting
  (corfu-history-mode 1)
  (savehist-mode 1)
  (add-to-list 'savehist-additional-variables 'corfu-history)

  )

(defun corfu-enable-always-in-minibuffer ()
  "Enable Corfu in the minibuffer if Vertico/Mct are not active."
  (unless (or (bound-and-true-p mct--active)
              (bound-and-true-p vertico--input)
              (eq (current-local-map) read-passwd-map))

    ;; Enable/disable auto completion
    ;; (setq-local corfu-auto nil)

    ;; Disable automatic echo and popup
    (setq-local corfu-echo-delay nil
                corfu-popupinfo-delay nil)
    (corfu-mode 1)))

(add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)

(use-package kind-icon

  ;; Load kind icon after corfu and nerd icons
  :after (corfu nerd-icons)

  ;; Customise kind icon
  :custom

  ;; Don't use SVG based icons from kind icons
  (kind-icon-use-icons nil)

  ;; Use nerd font icons instead
  (kind-icon-mapping
   `(
     (array, (nerd-icons-codicon "nf-cod-symbol_array") :face font-lock-type-face)
     (boolean, (nerd-icons-codicon "nf-cod-symbol_boolean") :face font-lock-builtin-face)
     (class, (nerd-icons-codicon "nf-cod-symbol_class") :face font-lock-type-face)
     (color, (nerd-icons-codicon "nf-cod-symbol_color") :face success)
     (command, (nerd-icons-codicon "nf-cod-terminal") :face default)
     (constant, (nerd-icons-codicon "nf-cod-symbol_constant") :face font-lock-constant-face)
     (constructor, (nerd-icons-codicon "nf-cod-triangle_right") :face font-lock-function-name-face)
     (enummember, (nerd-icons-codicon "nf-cod-symbol_enum_member") :face font-lock-builtin-face)
     (enum-member, (nerd-icons-codicon "nf-cod-symbol_enum_member") :face font-lock-builtin-face)
     (enum, (nerd-icons-codicon "nf-cod-symbol_enum") :face font-lock-builtin-face)
     (event, (nerd-icons-codicon "nf-cod-symbol_event") :face font-lock-warning-face)
     (field, (nerd-icons-codicon "nf-cod-symbol_field") :face font-lock-variable-name-face)
     (file, (nerd-icons-codicon "nf-cod-symbol_file") :face font-lock-string-face)
     (folder, (nerd-icons-codicon "nf-cod-folder") :face font-lock-doc-face)
     (interface, (nerd-icons-codicon "nf-cod-symbol_interface") :face font-lock-type-face)
     (keyword, (nerd-icons-codicon "nf-cod-symbol_keyword") :face font-lock-keyword-face)
     (macro, (nerd-icons-codicon "nf-cod-symbol_misc") :face font-lock-keyword-face)
     (magic, (nerd-icons-codicon "nf-cod-wand") :face font-lock-builtin-face)
     (method, (nerd-icons-codicon "nf-cod-symbol_method") :face font-lock-function-name-face)
     (function, (nerd-icons-codicon "nf-cod-symbol_method") :face font-lock-function-name-face)
     (module, (nerd-icons-codicon "nf-cod-file_submodule") :face font-lock-preprocessor-face)
     (numeric, (nerd-icons-codicon "nf-cod-symbol_numeric") :face font-lock-builtin-face)
     (operator, (nerd-icons-codicon "nf-cod-symbol_operator") :face font-lock-comment-delimiter-face)
     (param, (nerd-icons-codicon "nf-cod-symbol_parameter") :face default)
     (property, (nerd-icons-codicon "nf-cod-symbol_property") :face font-lock-variable-name-face)
     (reference, (nerd-icons-codicon "nf-cod-references") :face font-lock-variable-name-face)
     (snippet, (nerd-icons-codicon "nf-cod-symbol_snippet") :face font-lock-string-face)
     (string, (nerd-icons-codicon "nf-cod-symbol_string") :face font-lock-string-face)
     (struct, (nerd-icons-codicon "nf-cod-symbol_structure") :face font-lock-variable-name-face)
     (text, (nerd-icons-codicon "nf-cod-text_size") :face font-lock-doc-face)
     (typeparameter, (nerd-icons-codicon "nf-cod-list_unordered") :face font-lock-type-face)
     (type-parameter, (nerd-icons-codicon "nf-cod-list_unordered") :face font-lock-type-face)
     (unit, (nerd-icons-codicon "nf-cod-symbol_ruler") :face font-lock-constant-face)
     (value, (nerd-icons-codicon "nf-cod-symbol_field") :face font-lock-builtin-face)
     (variable, (nerd-icons-codicon "nf-cod-symbol_variable") :face font-lock-variable-name-face)
     (t, (nerd-icons-codicon "nf-cod-code") :face font-lock-warning-face)))

  ;; Have the background be the same as corfu's default
  (kind-icon-default-face 'corfu-default)

  ;; Configure kind icon
  :config

  ;; Enable kind icon with corfu
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape

  ;; Initialise cape and add the wanted completion functions
  :init
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-tex)
  ;; (add-to-list 'completion-at-point-functions #'cape-sgml)
  ;; (add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;; (add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;; (add-to-list 'completion-at-point-functions #'cape-symbol)
  ;; (add-to-list 'completion-at-point-functions #'cape-line)
  )

(use-package helpful

  ;; Ensure that helpful is installed
  :ensure t

  ;; Customise helpful
  :custom

  ;; Bind the helpful versions of Emacs commands to counsel
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)

  ;; Remap the default Emacs commands to the helpful versions
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package magit)

;; Force elpaca to update transient
(use-package transient)

(defun +elpaca-unload-seq (e)
  "The funcion to unload the seq package."
  (and (featurep 'seq) (unload-feature 'seq t))
  (elpaca--continue-build e))

(defun +elpaca-seq-build-steps ()
  "The function to unload seq before building the seq package."
  (append (butlast (if (file-exists-p (expand-file-name "seq" elpaca-builds-directory))
                       elpaca--pre-built-steps elpaca-build-steps))
          (list '+elpaca-unload-seq 'elpaca--activate-package)))

;; Force elpaca to update seq
(use-package seq :elpaca `(seq :build ,(+elpaca-seq-build-steps)))

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(electric-indent-mode -1)

(setq org-edit-src-content-indentation 0)

(require 'org-tempo)

(add-hook 'org-mode-hook (lambda ()
                           (setq-local electric-pair-inhibit-predicate
                                       `(lambda (c)
                                          (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

(use-package evil-org

  ;; Ensure that evil org is always installed
  :ensure t

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

(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(use-package citeproc)

(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

(use-package ox-ipynb
  :elpaca (ox-ipynb :host github :repo "jkitchin/ox-ipynb")
  :init (require 'ox-ipynb))

(use-package pdf-tools

  ;; Install pdf-tools
  :config (pdf-tools-install))

(use-package auctex :defer t
  :elpaca ( :pre-build (("./autogen.sh")
                        ("./configure"
                         "--without-texmf-dir"
                         "--with-packagelispdir=./"
                         "--with-packagedatadir=./")
                        ("make"))
            :build (:not elpaca--compile-info)
            :files ("*.el" "doc/*.info*" "etc" "images" "latex" "style")
            :version (lambda (_) (require 'tex-site) AUCTeX-version))
  :mode (("\\.tex\\'" . LaTeX-mode)))

(use-package evil-tex
  :init (add-hook 'LaTeX-mode-hook #'evil-tex-mode))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
