(define (problem h5)
    (:domain hanoi)
    (:objects
        k1 k2 k3 k4 k5 - disc
    )

    (:init
        (= (size k1) 1)
        (= (size k2) 2)
        (= (size k3) 3)
        (= (size k4) 4)
        (= (size k5) 5)

        (on-peg k5 x)
        (on-peg k4 x)
        (on-peg k3 x)
        (on-peg k2 x)
        (on-peg k1 x)

        (on-disc k1 k2)
        (on-disc k2 k3)
        (on-disc k3 k4)
        (on-disc k4 k5)
    )

    (:goal
        (and
            (on-peg k5 z)
            (on-peg k4 z)
            (on-peg k3 z)
            (on-peg k2 z)
            (on-peg k1 z)
        )
    )
)