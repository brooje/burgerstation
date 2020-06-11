/proc/get_luck_calc(var/atom/positive,var/positive_luck_mul,var/atom/negative,var/negative_luck_mul)

	var/base_prob = 0

	if(positive && positive_luck_mul)
		if(is_living(positive))
			var/mob/living/L = positive
			var/luck = L.get_attribute_level(ATTRIBUTE_LUCK)
			base_prob += (luck-50)*positive_luck_mul

	if(negative && negative_luck_mul)
		if(is_living(negative))
			var/mob/living/L = negative
			var/luck = L.get_attribute_level(ATTRIBUTE_LUCK)
			base_prob += (luck-50)*negative_luck_mul

	return base_prob

/proc/luck(var/input,var/base_value=50,var/positive=TRUE,var/debug) //Debug should be a string.

	. = 1

	if(islist(input))
		for(var/atom/A in input)
			var/luck_to_use = A ? A.luck : 50
			var/mod = positive ? 0.5 + (luck_to_use/50)*0.5 : 1.5 - (luck_to_use/50)*0.5
			. *= mod
	else
		var/atom/A = input
		var/luck_to_use = A ? A.luck : 50
		var/mod = positive ? 0.5 + (luck_to_use/50)*0.5 : 1.5 - (luck_to_use/50)*0.5
		. *= mod

	if(debug)
		world.log << "Luck for [debug]: [.] x [base_value]."

	return prob(base_value*.)