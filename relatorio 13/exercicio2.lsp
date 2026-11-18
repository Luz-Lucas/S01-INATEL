;; Estrutura
(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

;; Retorna texto usando case
(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

;; Retorna texto
(defun descreve-criatura (c)
  (format nil "~a - ~a - ~am - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

;; Filtra usando lambda
(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (x) (> (criatura-profundidade x) metros))
                 catalogo))

;; Lista global
(defparameter *catalogo*
  (list (make-criatura :nome "Peixe-Bolha" :bioma "Recife" :profundidade 20 :perigo :inofensiva)
        (make-criatura :nome "Tubarão-Areia" :bioma "Dunas" :profundidade 120 :perigo :agressiva)
        (make-criatura :nome "Leviatã Fantasma" :bioma "Abismo" :profundidade 600 :perigo :leviata)
        (make-criatura :nome "Peixe Raro" :bioma "Caverna" :profundidade 300 :perigo :desconhecido)))

(defun main ()
  ;; Gera e exibe todos os textos
  (let ((lista (mapcar #'descreve-criatura *catalogo*)))
    (dolist (x lista)
      (format t "~a~%" x)))

  ;; Exibe só os filtrados
  (let ((lista (mapcar #'descreve-criatura (abaixo-de 100 *catalogo*))))
    (dolist (x lista)
      (format t "~a~%" x))
    (format t "Quantidade: ~a~%" (length lista))))

(main)
