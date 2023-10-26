(define (domain hanoi)
	(:requirements :adl :numeric-fluents)
	(:predicates
		(on-top ?x)
		(on-rod ?x ?y)
		(on-disc ?x ?y)
	)

	(:functions
		(size ?x)
	)

	; przesuń paczkę na inną paczkę
	(:action move
		:parameters (?from ?to ?disc ?disc_from ?disc_to)
		:precondition (and

			(< (size ?disc) (size ?disc_to))
			(< (size ?disc) (size ?disc_from))

			(on-top ?disc)
			(on-top ?disc_to)

			(on-rod ?disc ?from)
			(on-rod ?disc_from ?from)

			(on-rod ?disc_to ?to)
			(on-disc ?disc ?disc_from)
		)
		:effect (and
			(not (on-top ?disc_to))

			(on-top ?disc_from)

			(not (on-rod ?disc ?from))
			(not (on-disc ?disc ?disc_from))
			(on-rod ?disc ?to)
			(on-disc ?disc ?disc_to)
		)
	)

)