(define
	(domain hanoi)
	(:requirements :adl)
	(:predicates
		(on-top ?x)
		(smaller ?x ?y)
		(on-rod ?x ?y)
		(on-disc ?x ?x)
	)

	; przesuń paczkę na inną paczkę
	(:action move
		:parameters (?from ?to ?disc ?disc_from ?disc_to)
		:precondition
		(and
		    (smaller ?disc ?disc_to)
		    (smaller ?disc ?disc_from)
		    
			(on-top ?disc)
			(on-top ?disc_to)
			
			(on-rod ?disc ?from)
			(on-rod ?disc_from ?from)
			
			(on-rod ?disc_to ?to)
			(on-disc ?disc ?disc_from)
		)
		:effect
		(and
			(not (on-top ?disc_to))
			
			(on-top ?disc_from)
			
			(not (on-rod ?disc ?from))
			(not (on-disc ?disc ?disc_from))
			(on-rod ?disc ?to)
			(on-disc ?disc ?disc_to)
		)
	)

)




