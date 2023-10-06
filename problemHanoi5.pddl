(define (problem h5)
    (:domain hanoi)
    (:objects
        k1 k2 k3 k4 k5 - disc
    )

    (:init
        (smaller k1 k2)
        (smaller k1 k3)
        (smaller k1 k4)
        (smaller k1 k5)

        (smaller k2 k3)
        (smaller k2 k4)
        (smaller k2 k5)

        (smaller k3 k4)
        (smaller k3 k5)

        (smaller k4 k5)

        (clear-peg z)
        (clear-peg y)

        (on-peg k5 x)
        (on-peg k4 x)
        (on-peg k3 x)
        (on-peg k2 x)
        (on-peg k1 x)

        (on-disc k1 k2)
        (on-disc k2 k3)
        (on-disc k3 k4)
        (on-disc k4 k5)

        (top-disc k1)

    )

    (:goal
        (and
            (on-peg k5 z)
            (on-peg k4 z)
            (on-peg k3 z)
            (on-peg k2 z)
            (on-peg k1 z)

            (on-disc k1 k2)
            (on-disc k2 k3)
            (on-disc k3 k4)
            (on-disc k4 k5)
        )
    )
)