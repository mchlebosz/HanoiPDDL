(define (problem h3)
    (:domain hanoi)
    (:objects
        k1 k2 k3 - disc
    )

    (:init
        (smaller k1 k2)
        (smaller k1 k3)
        (smaller k2 k3)

        (on-peg k3 x)
        (on-peg k2 x)
        (on-peg k1 x)

        (on-disc k1 k2)
        (on-disc k2 k3)
    )

    (:goal
        (and
            (on-peg k3 z)
            (on-peg k2 z)
            (on-peg k1 z)
        )
    )
)