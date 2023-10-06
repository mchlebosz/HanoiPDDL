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
        :parameters (?from ?to - peg ?disc1 ?disc2 - disc)
        ;move ?from ?to. ?disc1 is on ?disc2
        :precondition (and
            (not (= ?from ?to)) ; these are different pegs
            (not (= ?disc1 ?disc2)) ; these are different discs

            (not (exists
                    (?disc3 - disc)
                    (on-peg ?disc3 ?to)
                )
            )
            ; there is no disc on ?to peg

            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc3 ?disc1)
                )
                ;a ?disc3 cannot be on ?disc1
            )
            ; there is no disc on ?disc1

            (on-disc ?disc1 ?disc2)
            ; the ?disc1 lays on ?disc2

            (on-peg ?disc1 ?from)
            (on-peg ?disc2 ?from)
            ; and both of them are on same ?from peg

        )
        :effect (and
            (not (on-disc ?disc1 ?disc2))
            ; remove ?disc1 from ?disc2

            (not (on-peg ?disc1 ?from))
            ; remove ?disc1 from ?from peg
            (on-peg ?disc1 ?to)
            ; it is now alone on ?to peg

        )
    )
    (:action move-last-disc
        :parameters (?from ?to - peg ?disc1 ?disc2 - disc)
        ;nothing below ?disc1
        ;a ?disc2 is top on ?to

        :precondition (and
            (not (= ?from ?to)) ; these are different pegs
            (not (= ?disc1 ?disc2)) ; these are different discs

            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc3 ?disc1)
                )
                ;a ?disc3 cannot be on ?disc1
            )
            ;there is no disc on ?disc1
            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc3 ?disc2)
                )
                ;a ?disc3 cannot be on ?disc2
            )
            ;there is no disc on ?disc2

            (on-peg ?disc1 ?from)
            ;the ?disc1 is on ?from peg
            (on-peg ?disc2 ?to)
            ;the ?disc2 is on ?to peg

            (smaller ?disc1 ?disc2)
            ;the ?disc1 is smaller then ?disc2

            (not
                (exists
                    (?disc3 - disc)
                    (on-disc ?disc1 ?disc3)
                )
                ;a ?disc3 cannot be under ?disc1
            )
            ;there is no other disc under ?disc1
        )
        :effect (and
            (on-disc ?disc1 ?disc2)
            ; we put ?disc1 on ?disc2

            (not (on-peg ?disc1 ?from))
            ; we remove ?disc1 from ?from peg
            (on-peg ?disc1 ?to)
            ; and assign it on ?to peg

        )
    )
    (:action move
        :parameters (?from ?to - peg ?disc1 ?disc2 ?disc3 - disc)
        ; a ?disc1 on top of ?disc2
        ; we place disc on ?disc3
        :precondition (and
            (not (= ?from ?to)); these are different pegs
            (not (= ?disc1 ?disc2)) ; these are different discs
            (not (= ?disc1 ?disc3)) ; these are different discs
            (not (= ?disc2 ?disc3)) ; these are different discs

            (not
                (exists
                    (?disc4 - disc)
                    (on-disc ?disc4 ?disc3)
                )
                ;a ?disc4 cannot be on ?disc3
            )
            ;there is no disc on ?disc3

            (on-peg ?disc3 ?to)
            ;and ?disc3 is on ?to peg

            (not
                (exists
                    (?disc4 - disc)
                    (on-disc ?disc4 ?disc1)
                )
                ;a ?disc4 cannot be on ?disc1
            )
            ;there is no other disc on ?disc1
            (smaller ?disc1 ?disc3)
            ; the ?disc1 is smaller than ?disc3

            (on-disc ?disc1 ?disc2)
            ;the ?disc1 lays on ?disc2

        )
        :effect (and
            (not (on-disc ?disc1 ?disc2))
            ;we remove ?disc1 from ?disc2

            (not (on-peg ?disc1 ?from))
            ;and get it out of ?from peg

            (on-peg ?disc1 ?to)
            ;we move it on ?to peg

            (on-disc ?disc1 ?disc3)
            ;and put on ?disc3 disc
        )
    )

)