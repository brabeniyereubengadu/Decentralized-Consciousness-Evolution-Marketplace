;; Mind Expansion Experience Verification Contract - Simplified

(define-map experiences
  { id: uint }
  {
    experiencer: principal,
    type: (string-ascii 50),
    verified: bool
  }
)

(define-data-var next-id uint u1)

(define-public (register-experience (type (string-ascii 50)))
  (let ((id (var-get next-id)))
    (map-set experiences
      { id: id }
      {
        experiencer: tx-sender,
        type: type,
        verified: false
      }
    )
    (var-set next-id (+ id u1))
    (ok id)
  )
)

(define-public (verify-experience (id uint))
  (let ((experience (default-to { experiencer: tx-sender, type: "", verified: false }
                               (map-get? experiences { id: id }))))
    (map-set experiences
      { id: id }
      (merge experience { verified: true })
    )
    (ok true)
  )
)

(define-read-only (get-experience (id uint))
  (map-get? experiences { id: id })
)

