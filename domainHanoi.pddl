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
        (smaller ?x ?y - disc)
    )

    (:action move-to-empty-peg
        :parameters (?from ?to - peg ?disc ?disc2 - disc)
        ;a ?disc is on ?disc2
        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc ?disc2))

            (not (exists
                    (?disc3 - disc)
                    (on-peg ?disc3 ?to)
                )
            )

            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc3 ?disc)
                )
                ;a ?disc3 cannot be on ?disc
            )

            (on-disc ?disc ?disc2)

            (on-peg ?disc ?from)
            (on-peg ?disc2 ?from)

        )
        :effect (and
            (not (on-disc ?disc ?disc2))

            (not (on-peg ?disc ?from))
            (on-peg ?disc ?to)

        )
    )
    (:action move-last-disc
        :parameters (?from ?to - peg ?disc ?disc2 - disc)
        ;nothing below ?disc
        ;a ?disc2 is top on ?to

        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc ?disc2))

            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc3 ?disc)
                )
                ;a ?disc3 cannot be on ?disc
            )
            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc3 ?disc2)
                )
                ;a ?disc3 cannot be on ?disc2
            )

            (on-peg ?disc ?from)
            (on-peg ?disc2 ?to)

            (smaller ?disc ?disc2)

            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc ?disc3)
                )
                ;a ?disc3 cannot be under ?disc
            )
        )
        :effect (and
            (on-disc ?disc ?disc2)

            (not (on-peg ?disc ?from))
            (on-peg ?disc ?to)

        )
    )
    (:action move
        :parameters (?from ?to - peg ?disc ?disc2 ?disc3 - disc)
        ; a ?disc on top of ?disc2
        ; we place disc on ?disc3
        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc ?disc2))
            (not (= ?disc ?disc3))
            (not (= ?disc2 ?disc3))

            (not
                (exists
                    (?disc4 - disc)
                    (on-disc ?disc4 ?disc3)
                )
                ;a ?disc4 cannot be on ?disc3
            )
            (on-peg ?disc3 ?to)

            (not
                (exists
                    (?disc4 - disc)
                    (on-disc ?disc4 ?disc)
                )
                ;a ?disc4 cannot be on ?disc
            )
            (smaller ?disc ?disc3)

            (on-disc ?disc ?disc2)
            (on-peg ?disc ?from)
            (on-peg ?disc2 ?from)

        )
        :effect (and
            (not (on-disc ?disc ?disc2))

            (not (on-peg ?disc ?from))
            (on-peg ?disc ?to)

            (on-disc ?disc ?disc3)
        )
    )

)