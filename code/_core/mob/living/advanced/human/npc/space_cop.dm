/mob/living/advanced/npc/space_cop
	name = "space cop"
	desc = "Investigating warcrimes since 2068."

	ai = /ai/advanced/space_cop

	dialogue_id = /dialogue/npc/soldier/

	level = 16



/mob/living/advanced/npc/space_cop/Initialize()

	. = ..()

	var/species/S = SPECIES(species)

	sex = pick(MALE,FEMALE)
	gender = sex

	change_organ_visual("skin", desired_color = pick("#E0BCAA","#BC9E8F","#967F73","#7A675E"))

	var/hair_color = random_color()
	change_organ_visual("hair_head", desired_color = hair_color, desired_icon_state = pick(SSspecies.all_hair_files[S.default_icon_hair]))

	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/space_cop)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/space_cop)

	update_all_blends()

	equip_loadout(/loadout/space_cop)

