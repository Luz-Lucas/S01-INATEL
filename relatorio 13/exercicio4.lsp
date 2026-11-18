;; Estrutura
(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

;; Retorna o multiplicador usando case
(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

;; Retorna o valor calculado
(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

;; Filtra e transforma em sequência usando let*
(defun rota (lista dificuldade-maxima)
  (let* ((filtrados (remove-if-not
                     (lambda (x) (<= (dominio-dificuldade x) dificuldade-maxima))
                     lista))
         (textos (mapcar
                  (lambda (x)
                    (format nil "~a - ~a mora"
                            (dominio-nome x)
                            (recompensa-final x)))
                  filtrados)))
    textos))

(defun main ()
  (let* ((obj1 (make-dominio :nome "Domínio A" :elemento :pyro :dificuldade 2 :mora 10000))
         (obj2 (make-dominio :nome "Domínio B" :elemento :electro :dificuldade 4 :mora 20000))
         (obj3 (make-dominio :nome "Domínio C" :elemento :hydro :dificuldade 3 :mora 15000))
         (obj4 (make-dominio :nome "Domínio D" :elemento :cryo :dificuldade 5 :mora 30000))
         (obj5 (make-dominio :nome "Domínio E" :elemento :anemo :dificuldade 1 :mora 5000))
         (lista (list obj1 obj2 obj3 obj4 obj5)))

    ;; Exibe a rota
    (dolist (x (rota lista 3))
      (format t "~a~%" x))

    ;; Exibe o total
    (format t "Total: ~a~%" (reduce #'+ (mapcar #'recompensa-final lista)))

    ;; Cópia alterada com setf (o original continua igual)
    (let ((obj6 (copy-dominio obj1)))
      (setf (dominio-mora obj6) 99999)
      (format t "Cópia: ~a~%" (dominio-mora obj6))
      (format t "Original: ~a~%" (dominio-mora obj1)))))

(main)
