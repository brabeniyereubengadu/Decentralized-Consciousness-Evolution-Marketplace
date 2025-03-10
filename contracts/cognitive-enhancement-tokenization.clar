;; Cognitive Enhancement Tokenization Contract - Simplified

(define-map enhancements
  { id: uint }
  {
    name: (string-ascii 50),
    creator: principal,
    potency: uint
  }
)

(define-data-var next-id uint u1)

(define-public (create-enhancement (name (string-ascii 50)) (potency uint))
  (let ((id (var-get next-id)))
    (map-set enhancements
      { id: id }
      {
        name: name,
        creator: tx-sender,
        potency: potency
      }
    )
    (var-set next-id (+ id u1))
    (ok id)
  )
)

(define-read-only (get-enhancement (id uint))
  (map-get? enhancements { id: id })
)

