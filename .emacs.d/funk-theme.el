;;; Theme source structure borrows from misterioso and funk themes
(deftheme funk
  "Funk theme")

(defgroup funk-theme nil
  "Funk theme."
  :group 'faces
  :prefix "funk-"
  :link '(url-link :tag "GitHub" "")
  :tag "Funk theme")

;;;###autoload
(defcustom funk-override-colors-alist '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist."
  :group 'funk-theme
  :type '(alist
          :key-type (string :tag "Name")
          :value-type (string :tag " Hex")))

(defvar funk-default-colors-alist
  '(("funk-fg-1"     . "#656555")
    ("funk-fg-05"    . "#989890")
    ("funk-fg"       . "#DCDCCC")
    ("funk-fg+1"     . "#FFFFEF")
    ("funk-fg+2"     . "#FFFFFD")
    ("funk-bg-2"     . "#000000")
    ("funk-bg-1"     . "#0d0d0d")
    ("funk-bg-08"    . "#141414")
    ("funk-bg-05"    . "#1f1f1f")
    ("funk-bg"       . "#282828")
    ("funk-bg+05"    . "#292929")
    ("funk-bg+1"     . "#303030")
    ("funk-bg+2"     . "#3b3b3b")
    ("funk-bg+3"     . "#4a4a4a")
    ("funk-red-6"    . "#301016")
    ("funk-red-5"    . "#45171f")
    ("funk-red-4"    . "#521d26")
    ("funk-red-3"    . "#63222d")
    ("funk-red-2"    . "#752a37")
    ("funk-red-1"    . "#8f3847")
    ("funk-red"      . "#a64253")
    ("funk-red+1"    . "#b54c5e")
    ("funk-red+2"    . "#d15a6e")
    ("funk-orange"   . "#ff7700")
    ("funk-yellow-2" . "#c78a02")
    ("funk-yellow-1" . "#ffcc00")
    ("funk-yellow"   . "#ffb000")
    ("funk-green-5"  . "#04632a")
    ("funk-green-4"  . "#018c39")
    ("funk-green-3"  . "#02a845")
    ("funk-green-2"  . "#04c451")
    ("funk-green-1"  . "#00de59")
    ("funk-green"    . "#00ff66")
    ("funk-green+1"  . "#38ff88")
    ("funk-green+2"  . "#73ffab")
    ("funk-green+3"  . "#82ffb4")
    ("funk-green+4"  . "#94ffbf")
    ("funk-cyan"     . "#00afff")
    ("funk-blue-5"   . "#093875")
    ("funk-blue-4"   . "#274f82")
    ("funk-blue-3"   . "#274f82")
    ("funk-blue-2"   . "#395a85")
    ("funk-blue-1"   . "#456287")
    ("funk-blue"     . "#748cab")
    ("funk-blue+1"   . "#84a0c4")
    ("funk-blue+2"   . "#95b5de")
    ("funk-blue+3"   . "#accefa")
    ("funk-magenta"  . "#DC8CC3"))
  "List of Funk colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defvar funk-use-variable-pitch nil
  "When non-nil, use variable pitch face for some headings and titles.")

(defvar funk-scale-org-headlines nil
  "Whether `org-mode' headlines should be scaled.")

(defvar funk-scale-outline-headlines nil
  "Whether `outline-mode' headlines should be scaled.")

(defcustom funk-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'funk-theme
  :package-version '(funk . "2.6"))

(defcustom funk-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'funk-theme
  :package-version '(funk . "2.6"))

(defcustom funk-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'funk-theme
  :package-version '(funk . "2.6"))

(defcustom funk-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'funk-theme
  :package-version '(funk . "2.6"))

(defcustom funk-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'funk-theme
  :package-version '(funk . "2.6"))

(defmacro funk-with-color-variables (&rest body)
  "`let' bind all colors defined in `funk-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append funk-default-colors-alist
                           funk-override-colors-alist))
         (z-variable-pitch (if funk-use-variable-pitch
                               'variable-pitch 'default)))
     ,@body))

;;; Theme Faces
(funk-with-color-variables
  (custom-theme-set-faces
   'funk
   ;; Ensure sufficient contrast on 256-color xterms.
   `(default ((((class color) (min-colors 4096))
               (:background ,funk-bg :foreground ,funk-fg))
              (,class
               (:background ,funk-bg :foreground ,funk-fg))))
   `(cursor ((,class (:background ,funk-green))))
   ;; Highlighting faces
   `(fringe ((,class (:background ,funk-bg+1))))
   `(highlight ((,class (:background ,funk-bg+1 :foreground ,funk-fg))))
   `(region ((,class (:background ,funk-bg+3 :foreground ,funk-fg))))
   `(isearch ((,class (:background ,funk-yellow :foreground ,funk-bg-2))))
   `(lazy-highlight ((,class (:background ,funk-bg+3))))
   `(trailing-whitespace ((,class (:background ,funk-red))))
   ;; Mode line faces
   `(mode-line ((,class (:background ,funk-bg :foreground ,funk-fg+1))))
   `(mode-line-inactive
     ((,class (:background ,funk-fg-05 :foreground ,funk-fg))))
   `(header-line ((,class (:background ,funk-bg+1 :foreground ,funk-fg+2))))
   ;; Escape and prompt faces
   `(minibuffer-prompt ((,class (:foreground ,funk-blue :weight bold))))
   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,funk-blue))))
   `(font-lock-comment-face ((,class (:foreground ,funk-green-4))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,funk-green))))
   `(font-lock-constant-face ((,class (:foreground ,funk-blue))))
   `(font-lock-doc-face ((t (:foreground ,funk-green+2))))
   `(font-lock-function-name-face
     ((,class (:foreground ,funk-cyan :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,funk-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,funk-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,funk-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,funk-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,funk-green :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,funk-orange))))
   `(font-lock-type-face ((,class (:foreground ,funk-red))))
   `(font-lock-variable-name-face ((,class (:foreground ,funk-blue))))
   `(font-lock-warning-face ((,class (:foreground ,funk-red :weight bold))))
   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
   ;;;;; woman
   '(woman-bold   ((t (:inherit font-lock-keyword-face))))
   '(woman-italic ((t (:inherit (font-lock-string-face italic)))))
   ;; Buttons and links
   `(button ((,class (:underline t))))
   `(link ((,class (:foreground ,funk-cyan :underline t))))
   `(link-visited ((,class (:foreground ,funk-red :underline t))))
   ;; Gnus faces
   `(gnus-group-news-1 ((,class (:foreground ,funk-red :weight bold))))
   `(gnus-group-news-1-low ((,class (:foreground ,funk-red))))
   `(gnus-group-news-2 ((,class (:foreground ,funk-blue :weight bold))))
   `(gnus-group-news-2-low ((,class (:foreground ,funk-blue))))
   `(gnus-group-news-3 ((,class (:foreground ,funk-cyan :weight bold))))
   `(gnus-group-news-3-low ((,class (:foreground ,funk-cyan))))
   `(gnus-group-news-4 ((,class (:foreground ,funk-green :weight bold))))
   `(gnus-group-news-4-low ((,class (:foreground ,funk-green))))
   `(gnus-group-news-5 ((,class (:foreground ,funk-yellow :weight bold))))
   `(gnus-group-news-5-low ((,class (:foreground ,funk-yellow))))
   `(gnus-group-news-low ((,class (:foreground ,funk-cyan))))
   `(gnus-group-mail-1 ((,class (:foreground ,funk-red :weight bold))))
   `(gnus-group-mail-1-low ((,class (:foreground ,funk-red))))
   `(gnus-group-mail-2 ((,class (:foreground ,funk-blue :weight bold))))
   `(gnus-group-mail-2-low ((,class (:foreground ,funk-blue))))
   `(gnus-group-mail-3 ((,class (:foreground ,funk-cyan  :weight bold))))
   `(gnus-group-mail-3-low ((,class (:foreground ,funk-cyan))))
   `(gnus-group-mail-low ((,class (:foreground ,funk-blue-4))))
   `(gnus-header-content ((,class (:weight normal :foreground ,funk-yellow))))
   `(gnus-header-from ((,class (:foreground ,funk-yellow-1 :weight bold))))
   `(gnus-header-subject ((,class (:foreground ,funk-fg))))
   `(gnus-header-name ((,class (:foreground ,funk-blue))))
   `(gnus-header-newsgroups ((,class (:foreground ,funk-yellow-1))))
   ;; Message faces
   `(message-header-name ((,class (:foreground ,funk-yellow :weight bold))))
   `(message-header-cc ((,class (:foreground ,funk-yellow-1))))
   `(message-header-other ((,class (:foreground ,funk-yellow-1))))
   `(message-header-subject ((,class (:foreground ,funk-fg+1))))
   `(message-header-to ((,class (:foreground ,funk-blue))))
   `(message-cited-text ((,class (:foreground ,funk-green))))
   `(message-separator ((,class (:foreground ,funk-cyan))))

;;;;; helm
   `(helm-header
     ((t (:foreground ,funk-green
                      :background ,funk-bg
                      :underline nil
                      :box nil
                      :extend t))))
   `(helm-source-header
     ((t (:foreground ,funk-yellow
                      :background ,funk-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)
                      :extend t))))
   `(helm-selection ((t (:background ,funk-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,funk-bg+1))))
   `(helm-visible-mark ((t (:foreground ,funk-bg :background ,funk-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,funk-green+4 :background ,funk-bg-1))))
   `(helm-separator ((t (:foreground ,funk-red :background ,funk-bg))))
   `(helm-time-zone-current ((t (:foreground ,funk-green+2 :background ,funk-bg))))
   `(helm-time-zone-home ((t (:foreground ,funk-red :background ,funk-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,funk-orange :background ,funk-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,funk-magenta :background ,funk-bg))))
   `(helm-bookmark-info ((t (:foreground ,funk-green+2 :background ,funk-bg))))
   `(helm-bookmark-man ((t (:foreground ,funk-yellow :background ,funk-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,funk-magenta :background ,funk-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,funk-red :background ,funk-bg))))
   `(helm-buffer-process ((t (:foreground ,funk-cyan :background ,funk-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,funk-fg :background ,funk-bg))))
   `(helm-buffer-size ((t (:foreground ,funk-fg-1 :background ,funk-bg))))
   `(helm-ff-directory ((t (:foreground ,funk-cyan :background ,funk-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,funk-fg :background ,funk-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,funk-green+2 :background ,funk-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,funk-red :background ,funk-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,funk-yellow :background ,funk-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,funk-bg :background ,funk-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,funk-cyan :background ,funk-bg))))
   `(helm-grep-file ((t (:foreground ,funk-fg :background ,funk-bg))))
   `(helm-grep-finish ((t (:foreground ,funk-green+2 :background ,funk-bg))))
   `(helm-grep-lineno ((t (:foreground ,funk-fg-1 :background ,funk-bg))))
   `(helm-grep-match ((t (:foreground ,funk-fg :background ,funk-bg :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,funk-red :background ,funk-bg))))
   `(helm-match ((t (:foreground ,funk-orange :background ,funk-bg-1 :weight bold))))
   `(helm-moccur-buffer ((t (:foreground ,funk-cyan :background ,funk-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,funk-fg-1 :background ,funk-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,funk-fg :background ,funk-bg))))
   ))

  (provide-theme 'funk)
