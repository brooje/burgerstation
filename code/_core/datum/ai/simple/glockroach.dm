
/ai/simple/glockroach/

/ai/simple/glockroach/handle_attacking()

	if(objective_attack && prob(20))
		handle_projectiles()

	return ..()

/ai/simple/glockroach/proc/handle_projectiles()

	if(!objective_attack)
		return FALSE

	play_sound('sound/weapons/canman_shot.ogg',get_turf(owner))
	owner.shoot_projectile(
		owner,
		objective_attack,
		null,
		null,
		/obj/projectile/bullet/firearm/pistol,
		/damagetype/ranged/bullet/pistol_9mm,
		16,
		16,
		0,
		TILE_SIZE*0.5,
		1,
		"#FF4A00",
		0,
		1,
		owner.iff_tag,
		owner.loyalty_tag
	)
	owner.set_dir(get_dir(owner,objective_attack))

	return TRUE