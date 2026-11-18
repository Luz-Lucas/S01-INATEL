;; Estrutura
(defstruct erva
  nome
  preco-por-grama
  toxicidade)

;; Classifica usando cond
(defun classifica-erva (erva)
  (cond
    ((>= (erva-toxicidade erva) 7) "veneno")
    ((>= (erva-toxicidade erva) 4) "use com cuidado")
    (t "segura")))

;; Retorna o preço
(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

;; Retorna texto
(defun descreve-erva (erva)
  (format nil "~a - R$ ~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

;; Retorna aviso usando if
(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Aviso: Maomao vai testar a erva em si mesma antes."
      "Erva liberada para o paciente."))

(defun main ()
  (let* ((obj1 (make-erva :nome "Cicuta" :preco-por-grama 5.5 :toxicidade 9))
         (obj2 (make-erva :nome "Camomila" :preco-por-grama 1.2 :toxicidade 5))
         (obj3 (make-erva :nome "Hortelã" :preco-por-grama 0.8 :toxicidade 1))
         (lista (list obj1 obj2 obj3)))

    ;; Percorre a lista
    (dolist (x lista)
      (format t "~a~%" (descreve-erva x))
      (format t "~a~%" (aviso x)))

    ;; Exibe o preço da dose
    (format t "Dose: R$ ~,2f~%" (preco-da-dose obj2 10))))

(main)
