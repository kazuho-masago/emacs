;; メニューバーを消す
(menu-bar-mode -1)
;; スタートアップメッセージを非表示
(setq inhibit-startup-message t)
;; ツールバーの非表示
(if window-system (progn
(tool-bar-mode nil)))
;; font-lock-mode?
(global-font-lock-mode t)
;; transient-mark
(setq-default transient-mark-mode t)
(show-paren-mode 1)
;; バッファ末尾に余計な改行コードを防ぐための設定
(setq next-line-add-newlines nil)
;; 列数表示
(column-number-mode 1)
;; #のバックアップファイルを作成しない
(setq make-backup-files nil)
;; フォント・サイズ指定
(if (eq window-system 'mac) (require 'carbon-font))
;(fixed-width-set-fontset "osaka" 10)
(fixed-width-set-fontset "hiramaru" 10)
;;(setq load-path (cons (expand-file-name "~/.emacs.d") load-path))
(server-start)
; タブの設定
(setq c-tab-always-indent t)
(setq default-tab-width 2)
(setq indent-line-function 'indent-relative-maybe)
; アンチエイリアス
(setq mac-allow-anti-aliasing nil)
; optionボタンをmeta
(setq mac-option-modifier 'meta)
; macキーバイドを使用
(mac-key-mode 1)
; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)
; リターンで改行とインデント
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)  ; 改行
; C-ccで範囲指定コメント
(global-set-key "\C-cc" 'comment-region)
; C-cuで範囲指定コメントを解除
(global-set-key "\C-cu" 'uncomment-region)
(transient-mark-mode t) ; 選択部分のハイライト
(setq require-final-newline t)          ; always terminate last line in file
;(setq default-major-mode 'text-mode)    ; default mode is text mode
(setq completion-ignore-case t) ; file名の補完で大文字小文字を区別しない
(setq partial-completion-mode 1) ; 補完機能を使う
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
;; ファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))
;;Colorテーマの設定
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-calm-forest)))
;;Windowサイズと位置の指定
(if window-system (progn
  (setq initial-frame-alist '((width . 202)(height . 58)(top . 0)(left . 48)))
))
;; 行数表示
(line-number-mode t)
;; シフト + 矢印で範囲選択
1(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)
;; ウィンドウを透明化
(add-to-list 'default-frame-alist '(alpha . (0.95 0.95)))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; http://8-p.info/emacs-javascript.html
(setq-default c-basic-offset 4)
;; JavaScriptモードの別バージョンのjs2の設定 
(when (load "js2" t)
  (setq js2-cleanup-whitespace nil
        js2-mirror-mode nil
        js2-bounce-indent-flag nil)
 
  (defun indent-and-back-to-indentation ()
    (interactive)
    (indent-for-tab-command)
    (let ((point-of-indentation
           (save-excursion
             (back-to-indentation)
             (point))))
      (skip-chars-forward "\s " point-of-indentation)))
 
      (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
      (define-key js2-mode-map "\C-m" nil))
