;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     shell-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     go
     rust
     php
     sql
     yaml
     javascript
     html
     ivy
     better-defaults
     emacs-lisp
     auto-completion
     git
     markdown
     org
     prodigy
     python
     syntax-checking
     ranger
     ;; ycmd
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-term-shell "/usr/bin/fish")
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t) ;
     themes-megapack
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ripgrep projectile-ripgrep vlf vue-mode yasnippet-snippets company-lsp)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile firebelly-theme niflheim-theme pastels-on-dark-theme zonokai-theme tronesque-theme anaconda-mode anaconda-eldoc-mode company-anaconda)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 7)
                                (todos . 7)
                                (projects . 7)
                                (agenda . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(material)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state nil
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Iosevka Term"
                               :size 15
                               :weight medium
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; ;; Anaconda mode
  ;; (spacemacs/set-leader-keys-for-major-mode 'python-mode
  ;;   "hh" 'anaconda-mode-show-doc
  ;;   "ga" 'anaconda-mode-find-assignments
  ;;   "gb" 'anaconda-mode-go-back
  ;;   "gu" 'anaconda-mode-find-references
  ;;   "gd" 'anaconda-mode-find-definitions)

  ;; Pytest
  (setq python-test-runner 'pytest)

  ;; Enable flycheck globally
  (global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'html-tidy 'web-mode)
    (flycheck-add-mode 'javascript-eslint 'web-mode)
    (flycheck-add-mode 'javascript-eslint 'vue-mode)
    (flycheck-add-mode 'javascript-eslint 'vue-html-mode))

  ;; Disable smartparens
  (add-hook 'python-mode-hook 'turn-off-smartparens-mode)
  (add-hook 'python-mode-hook 'turn-off-show-smartparens-mode)
  (setq sp-max-pair-length 2)
  (remove-hook 'prog-mode-hook #'smartparens-mode)
  (spacemacs/toggle-smartparens-globally-off)

  ;; pytest module keybind
  (define-key global-map (kbd "M-p") 'pytest-module)
  (define-key global-map (kbd "M-P") 'pytest-directory)

  ;; VLF
  (require 'vlf-setup)

  ;; Ivy configuration
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")

  ;; Company mode
  (define-key evil-insert-state-map (kbd "C-SPC") 'company-complete-common)
  (define-key evil-normal-state-map (kbd "C-SPC") 'company-complete-common)
  (setq company-idle-delay 0.5)

  (setq company-backends-python-mode '(company-lsp))


  ;; Extra python paths
  ;; (require 'anaconda-mode)
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/agent/src/linux/library")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/agent/src/linux/tests")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/agent/src/linux/plugins")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/models")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/thirdparty")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/controlpanel")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/aggregator")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/metricpoller")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/dashboards_v2")

  ;; ;; Company Python backends
  ;; (setq company-backends-python-mode '((company-anaconda)
  ;;                                      (company-dabbrev-code company-keywords)
  ;;                                      company-files company-dabbrev))


  ;; Browser
  (setq browse-url-browser-function 'browse-url-chrome)

  (setq org-agenda-files '("~/Dropbox/Org/inbox.org"
                           "~/Dropbox/Org/gtd.org"
                           "~/Dropbox/Org/tickler.org"))

  ;; Org Mode Configuration
  (setq org-capture-templates '(("t" "TODO [inbox]" entry
                                 (file+headline "~/Dropbox/Org/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/Dropbox/Org/tickler.org" "Tickler")
                                 "* %i%? \n %U")))

  (setq org-refile-targets '(("~/Dropbox/Org/gtd.org" :maxlevel . 3)
                             ("~/Dropbox/Org/someday.org" :maxlevel . 1)
                             ("~/Dropbox/Org/tickler.org" :maxlevel . 2)))

  (setq org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(i)" "|" "DONE(d)" "CANCELLED(c)")))

  (setq org-agenda-custom-commands
        '(("c" "Simple agenda view"
           ((tags "PRIORITY=\"A\""
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "High-priority unfinished tasks:")))
            (agenda "")
            (alltodo "")))))

  ;; Prodigy
  (define-key prodigy-mode-map (kbd "T") 'prodigy-display-process)

  (setq pythonpath '(("PYTHONPATH" "/home/cllamach/Panopta/classic/src/")))

  ;; Prodigy Services Configuration
  (prodigy-define-service
    :name "Controlpanel"
    :command "python"
    :args '("start-ControlPanel.py" "controlpanel.cfg")
    :cwd "/home/cllamach/Panopta/classic/src/controlpanel"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "controlpanel"))
    )

  (prodigy-define-service
    :name "CP uWSGI"
    :command "uwsgi"
    :args '("--http-socket" ":8000" "-w" "cpwsgi" "--buffer-size" "65535")
    :cwd "/home/cllamach/Panopta/classic/src/controlpanel"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "controlpanel"))
    )

  (prodigy-define-service
   :name "WidgetEngine"
   :command "python"
   :args '("WidgetEngine.py" "-c" "widgets_engine.cfg")
   :cwd "/home/cllamach/Panopta/classic/src/dashboards_v2/widgets_handler"
   :stop-signal 'sigkill
   :env pythonpath
   :init (lambda () (pyvenv-workon "widget_engine"))
   )

  (prodigy-define-service
    :name "DisplayEngine"
    :command "python"
    :args '("DisplayEngine.py" "-c" "display_engine.cfg")
    :cwd "/home/cllamach/Panopta/classic/src/dashboards_v2/dashboard_piper"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "display_engine"))
    )

  (prodigy-define-service
    :name "ResultHarvester"
    :command "python"
    :args '("ResultHarvester.py" "-c" "harvester.conf")
    :cwd "/home/cllamach/Panopta/classic/src/resultharvester"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "controlpanel"))
    )

  (prodigy-define-service
    :name "Checker"
    :command "python"
    :args '("Checker.py" "-c" "checker.conf")
    :cwd "/home/cllamach/Panopta/classic/src/checker"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "checker279"))
    )
  (prodigy-define-service
    :name "Checker1"
    :command "python"
    :args '("Checker.py" "-c" "checker_1.conf")
    :cwd "/home/cllamach/Panopta/classic/src/checker"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "checker279"))
    )
  (prodigy-define-service
    :name "Checker2"
    :command "python"
    :args '("Checker.py" "-c" "checker_2.conf")
    :cwd "/home/cllamach/Panopta/classic/src/checker"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "checker279"))
    )
  (prodigy-define-service
    :name "Checker3"
    :command "python"
    :args '("Checker.py" "-c" "checker_3.conf")
    :cwd "/home/cllamach/Panopta/classic/src/checker"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "checker279"))
    )

  (prodigy-define-service
    :name "NotifyEngine"
    :command "python"
    :args '("NotifyEngine.py" "-c" "notifyengine2.conf")
    :cwd "/home/cllamach/Panopta/classic/src/notifyengine2"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "notify-env")))

  (prodigy-define-service
    :name "Aggregator"
    :command "python"
    :args '("aggregator.py" "-c" "aggregator_config.py")
    :cwd "/home/cllamach/Panopta/classic/src/aggregator"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "aggregator-env")))

  (prodigy-define-service
    :name "JS Compile Watcher"
    :command "watchify"
    :args '("-vde" "src/assets/scripts/main.js" "-o" "/home/cllamach/Panopta/classic/src/controlpanel/ControlPanel/static/assets/newux/scripts/app.js")
    :cwd "/home/cllamach/Panopta/classic/src/controlpanel/ControlPanel/static/ui-components"
    :stop-signal 'sigkill)

  (prodigy-define-service
    :name "Python Dev Agent"
    :command "python"
    :args '("run_agent.py")
    :cwd "/home/cllamach/Panopta/agent/src/linux"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "agent")))

  (prodigy-define-service
    :name "Status Pages"
    :command "python"
    :args '("application.py")
    :cwd "/home/cllamach/Panopta/classic/src/reports"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "aggregator-env")))

  (prodigy-define-service
    :name "Metric Poller"
    :command "python"
    :args '("MetricPoller.py" "-c" "metricpoller.conf")
    :cwd "/home/cllamach/Panopta/classic/src/metricpoller"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "controlpanel")))

  (prodigy-define-service
    :name "Celery Worker"
    :command "celery"
    :args '("worker" "--app" "celeryapp" "--loglevel=INFO")
    :cwd "/home/cllamach/Panopta/classic/src/tasks"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "controlpanel")))

  (prodigy-define-service
    :name "Panopta CRM"
    :command "python"
    :args '("application.py" "-c" "crm_config.py")
    :cwd "/home/cllamach/Panopta/classic/src/crm"
    :stop-signal 'sigkill
    :env pythonpath
    :init (lambda () (pyvenv-workon "crm")))
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "42b8102c1234a9f680722953161c1127cc59ec68ad8d5c710af60d68c3b6e6ef" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "ecb9fe1d5b165a35499191a909b2b5710a52935614058b327a39bfbbb07c7dc8" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "f64c9f8b4241b680b186f4620afb9c82fa2a76cf4498a7431f90db59bb1892eb" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (lsp-python-ms transient ht lsp-ui company-lsp lsp-mode ripgrep spinner skewer-mode simple-httpd json-snatcher json-reformat js2-mode hydra parent-mode haml-mode fringe-helper git-gutter+ git-gutter pos-tip let-alist iedit anzu autothemer pkg-info epl web-completion-data tern go-mode bind-map anaconda-mode pythonic s avy auto-complete popup insert-shebang fish-mode company-shell yasnippet-snippets zenburn-theme yapfify white-sand-theme which-key web-mode vue-mode vue-html-mode use-package scss-mode rebecca-theme persp-mode org-mime mwim monokai-theme live-py-mode linum-relative js2-refactor hy-mode flx-ido exotica-theme eshell-prompt-extras dumb-jump diff-hl define-word counsel-projectile counsel swiper color-theme-sanityinc-tomorrow auto-compile anti-zenburn-theme ample-theme alect-themes ace-window dash-functional company smartparens highlight evil goto-chg flycheck helm helm-core ivy markdown-mode alert org-plus-contrib magit magit-popup git-commit ghub with-editor async yasnippet php-mode projectile f rust-mode powerline dash zen-and-art-theme yaml-mode xterm-color ws-butler winum wgrep web-beautify volatile-highlights vlf vi-tilde-fringe uuidgen unfill undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme ssass-mode sql-indent spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode shell-pop seti-theme sass-mode reverse-theme restart-emacs request ranger rainbow-delimiters railscasts-theme racer pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode projectile-ripgrep professional-theme prodigy popwin planet-theme pip-requirements phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el paradox packed orgit organic-green-theme org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mustang-theme multiple-cursors multi-term move-text monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum log4e livid-mode link-hint light-soap-theme less-css-mode json-mode js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme inkpot-theme info+ indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-make hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gnuplot gntp gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flycheck-rust flycheck-pos-tip flx flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z esh-help emmet-mode elisp-slime-nav edit-indirect drupal-mode dracula-theme django-theme diminish darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-go company-anaconda column-enforce-mode color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-key badwolf-theme auto-yasnippet auto-highlight-symbol apropospriate-theme ample-zen-theme aggressive-indent afternoon-theme adaptive-wrap ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
