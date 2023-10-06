(define (domain hanoi)
    (:requirements :adl)

    (:types
        peg disc
    )
    (:constants
        x y z - peg
    )

    (:predicates
        (on-disc ?x ?y - disc)
        (on-peg ?x - disc ?y - peg)
        (top-disc ?x - disc)
        (clear-peg ?x - peg)
        (smaller ?x ?y - disc)
    )

    (:action move-to-empty-peg
        :parameters (?from ?to - peg ?disc ?disc2 - disc) ;?disc is on ?disc2
        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc ?disc2))

            (clear-peg ?to)
            (top-disc ?disc)
            (on-disc ?disc ?disc2)

            (on-peg ?disc ?from)
            (on-peg ?disc2 ?from)

        )
        :effect (and
            (not (on-disc ?disc ?disc2))
            (top-disc ?disc2)

            (not (on-peg ?disc ?from))
            (on-peg ?disc ?to)

            (not (clear-peg ?to))

        )
    )
    (:action move-last-disc
        :parameters (?from ?to - peg ?disc ?disc2 - disc)
        ;nothing below ?disc
        ;a ?disc2 is top on ?to
        ;a ?disc3 cannot be under ?disc

        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc ?disc2))

            (top-disc ?disc2)
            (top-disc ?disc)

            (on-peg ?disc ?from)
            (on-peg ?disc ?to)

            (smaller ?disc ?disc2)

            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc ?disc3)
                )

            )
        )
        :effect (and
            (clear-peg ?from)
            (on-disc ?disc ?disc2)
            (not (top-disc ?disc2))

            (not (on-peg ?disc ?from))
            (on-peg ?disc ?to)

        )
    )
    (:action move
        :parameters (?from ?to - peg ?disc ?disc2 ?disc3 - disc);?disc on top of ?disc2; we place disc on ?disc3
        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc ?disc2))
            (not (= ?disc ?disc3))
            (not (= ?disc2 ?disc3))

            (top-disc ?disc3)
            (on-peg ?disc3 ?to)

            (top-disc ?disc)
            (smaller ?disc ?disc3)

            (on-disc ?disc ?disc2)
            (on-peg ?disc ?from)
            (on-peg ?disc2 ?from)

        )
        :effect (and
            (not (on-disc ?disc ?disc2))
            (top-disc ?disc2)

            (not (on-peg ?disc ?from))
            (on-peg ?disc ?to)

            (on-disc ?disc ?disc3)
            (not (top-disc ?disc3))
        )
    )

)