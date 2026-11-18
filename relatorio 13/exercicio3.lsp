;; Estrutura
(defstruct garota-magica
  nome
  escuridao
  bruxas)

;; Recursão com null, car e cdr
(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

;; Soma com reduce e mapcar
(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

;; Retorna um objeto novo (o original não muda)
(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((obj1 (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 1))
         (obj2 (make-garota-magica :nome "Sayaka" :escuridao 60 :bruxas 4))
         (obj3 (make-garota-magica :nome "Homura" :escuridao 30 :bruxas 12))
         (lista1 (list obj1 obj2 obj3)))

    ;; Exibe os totais
    (format t "Escuridão total: ~a~%" (escuridao-total lista1))
    (format t "Bruxas derrotadas: ~a~%" (total-de-bruxas lista1))

    ;; Novo objeto na frente da lista (a original continua igual)
    (let* ((obj4 (make-garota-magica :nome "Mami" :escuridao 20 :bruxas 7))
           (lista2 (cons obj4 lista1)))
      (format t "Escuridão total (lista1): ~a~%" (escuridao-total lista1))
      (format t "Escuridão total (lista2): ~a~%" (escuridao-total lista2)))

    ;; Cria um objeto novo a partir de outro
    (let ((obj5 (purifica obj2 25)))
      (format t "Original: ~a~%" (garota-magica-escuridao obj2))
      (format t "Nova: ~a~%" (garota-magica-escuridao obj5)))))

(main)
