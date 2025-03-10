;; Consciousness Level Certification Contract - Simplified

(define-map certifications
  { entity: principal }
  {
    level: uint,
    score: uint
  }
)

(define-public (certify-consciousness (entity principal) (score uint))
  (let ((level (if (>= score u500) u2 u1)))
    (map-set certifications
      { entity: entity }
      {
        level: level,
        score: score
      }
    )
    (ok level)
  )
)

(define-read-only (get-certification (entity principal))
  (map-get? certifications { entity: entity })
)

