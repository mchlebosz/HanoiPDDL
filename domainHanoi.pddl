(define (domain hanoi)

    (:requirements :strips :adl :negative-preconditions :fluents)

    (:types
        peg disc
    )
    (:constants
        x y z - peg
    )

    (:predicates
        (on-disc ?x ?y - disc)
        (on-peg ?x - disc ?y - peg)
    )

    (:functions
        (size ?d - disc)
    )

    (:action move-disc-to-disc
        :parameters (?from ?to - peg ?disc1 ?disc2 ?disc3 - disc)
        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc1 ?disc2))
            (not (= ?disc2 ?disc3))
            (not (= ?disc2 ?disc3))

            (on-disc ?disc1 ?disc3)

            (forall
                (?d - disc)
                (not (on-disc ?d ?disc2))
            )

            (on-peg ?disc1 ?from)
            (on-peg ?disc3 ?from)

            (on-peg ?disc2 ?to)
            (< (size ?disc1) (size ?disc2))
        )
        :effect (and

            (not(on-disc ?disc1 ?disc3))
            (on-disc ?disc1 ?disc2)
            (not (on-peg ?disc1 ?from))
            (on-peg ?disc1 ?to)

        )
    )

    (:action move-empty-to-disc
        :parameters (?from ?to - peg ?disc1 ?disc2 - disc)
        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc1 ?disc2))

            (forall
                (?d - disc)
                (not (on-disc ?d ?disc2))
            )

            (forall
                (?d - disc)
                (not (on-disc ?d ?disc1))
            )

            (forall
                (?d - disc)
                (not (on-disc ?disc1 ?d))
            )

            (on-peg ?disc1 ?from)
            (on-peg ?disc2 ?to)
            (< (size ?disc1) (size ?disc2))

        )
        :effect (and
            (not (on-peg ?disc1 ?from))
            (on-disc ?disc1 ?disc2)
            (on-peg ?disc1 ?to)
        )
    )

    (:action move-to-empty
        :parameters (?from ?to - peg ?disc1 ?disc2 - disc)
        :precondition (and
            (not (= ?from ?to))
            (not (= ?disc1 ?disc2))

            (forall
                (?d - disc)
                (not (on-peg ?d ?to))
            )

            (on-peg ?disc1 ?from)
            (on-peg ?disc2 ?from)

            (on-disc ?disc1 ?disc2)

        )
        :effect (and

            (not (on-peg ?disc1 ?from))
            (on-peg ?disc1 ?to)
            (not (on-disc ?disc1 ?disc2))

        )
    )

)