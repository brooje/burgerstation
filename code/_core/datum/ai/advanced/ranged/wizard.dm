/ai/advanced/wizard

	var/list/turf/teleport_locations = list()

	left_click_chance = 70

/ai/advanced/wizard/New(var/desired_loc,var/mob/living/desired_owner)
	. = ..()

	for(var/obj/marker/boss/wizard/W in world)
		teleport_locations += get_turf(W)

/ai/advanced/wizard/handle_attacking()

	. = ..()

	if(objective_attack && owner.attack_next - 3 >= world.time)
		var/turf/desired_location = pick(teleport_locations)
		new /obj/effect/temp/phase/out(get_turf(owner))
		owner.force_move(desired_location)
		new /obj/effect/temp/phase(desired_location)


