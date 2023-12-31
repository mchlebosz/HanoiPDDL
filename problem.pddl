(define (problem p1)
	(:domain hanoi)
	(:objects
		x y z k1 k2 k3 k4 k5 k_inf1 k_inf2 k_inf3
	)
	(:init
		(on-rod k_inf1 x)
		(on-rod k_inf2 y)
		(on-rod k_inf3 z)

		(smaller k1 k2)
		(smaller k1 k3)
		(smaller k1 k4)
		(smaller k1 k5)
		(smaller k1 k_inf1)
		(smaller k1 k_inf2)
		(smaller k1 k_inf3)

		(smaller k2 k3)
		(smaller k2 k4)
		(smaller k2 k5)
		(smaller k2 k_inf1)
		(smaller k2 k_inf2)
		(smaller k2 k_inf3)

		(smaller k3 k4)
		(smaller k3 k5)
		(smaller k3 k_inf1)
		(smaller k3 k_inf2)
		(smaller k3 k_inf3)

		(smaller k4 k5)
		(smaller k4 k_inf1)
		(smaller k4 k_inf2)
		(smaller k4 k_inf3)

		(smaller k5 k_inf1)
		(smaller k5 k_inf2)
		(smaller k5 k_inf3)

		(on-rod k5 x)
		(on-rod k4 x)
		(on-rod k3 x)
		(on-rod k2 x)
		(on-rod k1 x)

		(on-disc k1 k2)
		(on-disc k2 k3)
		(on-disc k3 k4)
		(on-disc k4 k5)
		(on-disc k5 k_inf1)

		(on-top k1)
		(on-top k_inf2)
		(on-top k_inf3)
	)
	(:goal
		(and
			(not (on-rod k5 y))
			(on-disc k5 k_inf3)
			(on-rod k5 z)
			(on-rod k4 z)
			(on-rod k3 z)
			(on-rod k2 z)
			(on-rod k1 z)
			(on-top k1)
		)
	)
)