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

    (:action move-to-disc
        :parameters (?from ?to - peg ?disc1 ?disc2 - disc)
        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc1 ?disc2))

            (not
                (exists
                    (?d - disc)
                    (on-disc ?d ?disc1)
                )
            )
            (not
                (exists
                    (?d2 - disc)
                    (on-disc ?d2 ?disc2)
                )
            )

            (on-peg ?disc1 ?from)
            (on-peg ?disc2 ?to)
            (smaller ?disc1 ?disc2)
        )
        :effect (and

            (forall
                (?d - disc)
                (not(on-disc ?disc1 ?d))
            )

            (on-disc ?disc1 ?disc2)

            (not (on-peg ?disc1 ?from))
            (on-peg ?disc1 ?to)

        )
    )
    (:action move-to-empty
        :parameters (?from ?to - peg ?disc1 - disc)
        :precondition (and
            (not (= ?from ?to))

            (not
                (exists
                    (?d - disc)
                    (on-disc ?d ?disc1)
                )
            )

            (not
                (exists
                    (?d - disc)
                    (on-peg ?d ?to)
                )
            )
            (on-peg ?disc1 ?from)
        )
        :effect (and

            (forall
                (?d - disc)
                (not(on-disc ?disc1 ?d))
            )
            (not (on-peg ?disc1 ?from))
            (on-peg ?disc1 ?to)

        )
    )

)