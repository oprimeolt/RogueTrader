/obj/item/gun/energy/laser
	name = "laser carbine"
	desc = "A Hephaestus Industries G40E carbine, designed to kill with concentrated energy blasts."
	icon = 'icons/obj/guns/laser_carbine.dmi'
	icon_state = "laser"
	item_state = "laser"
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	force = 10
	one_hand_penalty = 2
	bulk = GUN_BULK_RIFLE
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_STEEL = 2000)
	projectile_type = /obj/item/projectile/beam/midlaser
	wielded_item_state = "laser-wielded"

/obj/item/gun/energy/laser/mounted
	self_recharge = 1
	use_external_power = 1
	one_hand_penalty = 0 //just in case
	has_safety = FALSE

/obj/item/gun/energy/laser/practice
	name = "practice laser carbine"
	desc = "A modified version of the HI G40E, this one fires less concentrated energy bolts designed for target practice."
	icon_state = "laserp"
	projectile_type = /obj/item/projectile/beam/practice
	charge_cost = 10 //How much energy is needed to fire.

/obj/item/gun/energy/laser/practice/proc/hacked()
	return projectile_type != /obj/item/projectile/beam/practice

/obj/item/gun/energy/laser/practice/emag_act(remaining_charges, mob/user, emag_source)
	if(hacked())
		return NO_EMAG_ACT
	to_chat(user, SPAN_WARNING("You disable the safeties on [src] and crank the output to the lethal levels."))
	desc += " Its safeties are disabled and output is set to dangerous levels."
	projectile_type = /obj/item/projectile/beam/midlaser
	charge_cost = 20
	max_shots = rand(3,6) //will melt down after those
	return 1

/obj/item/gun/energy/laser/practice/handle_post_fire(mob/user, atom/target, pointblank=0, reflex=0)
	..()
	if(hacked())
		max_shots--
		if(!max_shots) //uh hoh gig is up
			to_chat(user, SPAN_DANGER("\The [src] sizzles in your hands, acrid smoke rising from the firing end!"))
			desc += " The optical pathway is melted and useless."
			projectile_type = null

/obj/item/gun/energy/retro
	name = "retro laser"
	icon = 'icons/obj/guns/retro_laser.dmi'
	icon_state = "retro"
	item_state = "retro"
	desc = "An older model of the basic lasergun. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	fire_delay = 10 //old technology, and a pistol

/obj/item/gun/energy/captain
	name = "antique laser gun"
	icon = 'icons/obj/guns/caplaser.dmi'
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "A rare weapon, handcrafted by a now defunct specialty manufacturer on Luna for a small fortune. It's certainly aged well."
	force = 5
	slot_flags = SLOT_BELT //too unusually shaped to fit in a holster
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	max_shots = 5 //to compensate a bit for self-recharging
	one_hand_penalty = 1 //a little bulky
	self_recharge = 1

/obj/item/gun/energy/lasercannon
	name = "laser cannon"
	desc = "With the laser cannon, the lasing medium is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core. This incredible technology may help YOU achieve high excitation rates with small laser volumes!"
	icon_state = "lasercannon"
	icon = 'icons/obj/guns/laser_cannon.dmi'
	item_state = null
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	slot_flags = SLOT_BELT|SLOT_BACK
	one_hand_penalty = 6 //large and heavy
	w_class = ITEM_SIZE_HUGE
	projectile_type = /obj/item/projectile/beam/heavylaser
	charge_cost = 40
	max_shots = 6
	accuracy = 2
	fire_delay = 15
	wielded_item_state = "gun_wielded"

/obj/item/gun/energy/lasercannon/mounted
	name = "mounted laser cannon"
	self_recharge = 1
	use_external_power = 1
	recharge_time = 10
	accuracy = 0 //mounted laser cannons don't need any help, thanks
	one_hand_penalty = 0
	has_safety = FALSE

/obj/item/gun/energy/xray
	name = "x-ray laser carbine"
	desc = "A high-power laser gun capable of emitting concentrated x-ray blasts, that are able to penetrate laser-resistant armor much more readily than standard photonic beams."
	icon = 'icons/obj/guns/xray.dmi'
	icon_state = "xray"
	item_state = "xray"
	slot_flags = SLOT_BELT|SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ESOTERIC = 2)
	projectile_type = /obj/item/projectile/beam/xray/midlaser
	one_hand_penalty = 2
	w_class = ITEM_SIZE_LARGE
	charge_cost = 15
	max_shots = 10
	wielded_item_state = "gun_wielded"
	combustion = 0

/obj/item/gun/energy/xray/pistol
	name = "x-ray laser gun"
	icon = 'icons/obj/guns/xray_pistol.dmi'
	icon_state = "oldxray"
	item_state = "oldxray"
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ESOTERIC = 2)
	projectile_type = /obj/item/projectile/beam/xray
	one_hand_penalty = 1
	w_class = ITEM_SIZE_NORMAL
	fire_delay = 5

/obj/item/gun/energy/sniperrifle
	name = "marksman energy rifle"
	desc = "The HI DMR 9E is an older design of Hephaestus Industries. A designated marksman rifle capable of shooting powerful ionized beams, this is a weapon to kill from a distance."
	icon = 'icons/obj/guns/laser_sniper.dmi'
	icon_state = "sniper"
	item_state = "laser"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/sniper
	one_hand_penalty = 5 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.
	slot_flags = SLOT_BACK
	charge_cost = 60
	max_shots = 8
	fire_delay = 12
	force = 10
	w_class = ITEM_SIZE_HUGE
	accuracy = -1 //shooting at the hip
	scoped_accuracy = 5
	scope_zoom = 2
	wielded_item_state = "gun_wielded"

/obj/item/gun/energy/sniperrifle/on_update_icon()
	..()
	item_state_slots[slot_back_str] = icon_state //so that the on-back overlay uses the different charged states

// WARHAMMER 40k


/obj/item/gun/energy/lasgun
	name = "Kantrael M36 Lasgun"
	desc = " Of Cadian design, it is one of the most common and less unique Lasguns that can be found throughout the Imperial Arsenal due to its cheap price and reliability. The Planet broke before the guard did."
	icon = 'icons/obj/guns/40k.dmi'
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_BELT
	w_class = ITEM_SIZE_LARGE
	force = 14
	one_hand_penalty = 2
	fire_delay = 5
	accuracy = 0
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/lasgun
	charge_cost = 20
	cell_type = /obj/item/cell/device/high/laspack
	wielded_item_state = "lasgun-wielded"
	sales_price = 30

	firemodes = list(
		list(mode_name="single", projectile_type=/obj/item/projectile/beam/lasgun, charge_cost=20, burst=1, burst_delay=2),
		list(mode_name="overcharge", projectile_type=/obj/item/projectile/beam/lasgun/overcharge, charge_cost=30, burst=1, burst_delay=3),
		list(mode_name="burst", projectile_type=/obj/item/projectile/beam/lasgun, charge_cost=20, burst=3, burst_delay=2)
		)

/obj/item/gun/energy/lasgun/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.1
	slowdown_per_slot[slot_belt] = 0.15
	slowdown_per_slot[slot_r_hand] = 0.15
	slowdown_per_slot[slot_l_hand] = 0.15

/obj/item/gun/energy/lasgun/triplex
	name = "Triplex Pattern Lasgun"
	desc = " A highly versatile refined lasgun used by the Mordian Iron Guard ."
	icon = 'icons/obj/guns/40k.dmi'
	color = COLOR_GUNMETAL
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_BELT
	w_class = ITEM_SIZE_LARGE
	force = 12
	one_hand_penalty = 3
	fire_delay = 5
	accuracy = 0
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/lasgun
	charge_cost = 18
	cell_type = /obj/item/cell/device/high/laspack
	wielded_item_state = "lasgun-wielded"
	sales_price = 35

	firemodes = list(
		list(mode_name="single", projectile_type=/obj/item/projectile/beam/lasgun, charge_cost=18, burst=1, burst_delay=2),
		list(mode_name="undercharge", projectile_type=/obj/item/projectile/beam/lasgun/weak, charge_cost=13, burst=1, burst_delay=1),
		list(mode_name="overcharge", projectile_type=/obj/item/projectile/beam/lasgun/overcharge, charge_cost=27, burst=1, burst_delay=3),
		list(mode_name="underburst", projectile_type=/obj/item/projectile/beam/lasgun/weak, charge_cost=18, burst=3, burst_delay=1),
		list(mode_name="burst", projectile_type=/obj/item/projectile/beam/lasgun, charge_cost=18, burst=3, burst_delay=2)
		)

/obj/item/gun/energy/lasgun/catachan
	name = "Mark IV Lascarbine"
	desc = "The Mark IV lascarbine is a special lascarbine used by the Catachan Jungle Fighters. Excellent for warfare in jungle environments due to it's bayonet and light frame"
	icon_state = "lascarbine"
	item_state = "lascar"
	icon = 'icons/obj/guns/40k.dmi'
	slot_flags = SLOT_BACK|SLOT_BELT
	w_class = ITEM_SIZE_LARGE
	force = 17
	one_hand_penalty = 1.5
	fire_delay = 4
	accuracy = -0.5
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/lasgun
	charge_cost = 20
	cell_type = /obj/item/cell/device/high/laspack/hotshot
	wielded_item_state = "lasgun-wielded"
	sales_price = 45

	firemodes = list(
		list(mode_name="single", projectile_type=/obj/item/projectile/beam/lasgun, charge_cost=20, burst=1, burst_delay=1.5),
		list(mode_name="overcharge", projectile_type=/obj/item/projectile/beam/lasgun/overcharge, charge_cost=30, burst=1, burst_delay=2.5),
		list(mode_name="burst", projectile_type=/obj/item/projectile/beam/lasgun, charge_cost=20, burst=3, burst_delay=1.5)
		)

/obj/item/gun/energy/lasgun/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.1
	slowdown_per_slot[slot_belt] = 0.15
	slowdown_per_slot[slot_r_hand] = 0.15
	slowdown_per_slot[slot_l_hand] = 0.15

/obj/item/gun/energy/lasgun/shitty
	name = "Grim Lasrifle"
	desc = "The Grim or Scrap Lasrifle is the name given to the many unsanctioned patterns of lasrifles produced in the underhives of the imperium, often sewn together with blackmarket components and stolen machinery."
	icon_state = "semir"
	item_state = "semir"
	slot_flags = SLOT_BACK|SLOT_BELT
	w_class = ITEM_SIZE_LARGE
	force = 13
	one_hand_penalty = 1.5
	fire_delay = 5
	accuracy = 0
	charge_cost = 22
	wielded_item_state = "semir"
	charge_meter = FALSE
	cell_type = /obj/item/cell/device/standard
	projectile_type = /obj/item/projectile/beam/lasgun/weak
	sales_price = 7


/obj/item/gun/energy/lasgun/lucius
	name = "Lucius No.98 Lasgun"
	desc = "A Lucius-made Lasgun, unlike STC-based Lasgun, the No.98 operates in a higher than average 21 megathoule while using a standard Power cell, resulting in a more powerful shot than other pattern lasguns."
	icon_state = "lucius"
	item_state = "luscius"
	slot_flags = SLOT_BACK|SLOT_BELT
	w_class = ITEM_SIZE_LARGE
	force = 16
	one_hand_penalty = 1.2
	fire_delay = 5.5
	accuracy = 0
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/lasgun/lucius
	charge_cost = 25
	cell_type = /obj/item/cell/device/high/laspack
	wielded_item_state = "luscius-wielded"
	sales_price = 40

	firemodes = list(
		list(mode_name="single", projectile_type=/obj/item/projectile/beam/lasgun/lucius, charge_cost=25, burst=1, burst_delay=2.2),
		list(mode_name="overcharge", projectile_type=/obj/item/projectile/beam/lasgun/lucius/overcharge, charge_cost=35, burst=1, burst_delay=3.3),
		list(mode_name="burst", projectile_type=/obj/item/projectile/beam/lasgun/lucius, charge_cost=25, burst=3, burst_delay=2.2)
		)

/obj/item/gun/energy/lasgun/accatran
	name = "Accatran Mark VI Pattern Lasgun"
	desc = "The Accatran Patterns are bullpup in design, affording them similar damage to that of a laspistol but with the capacity of a typical lasrifle and with a very high rate of fire for a lasgun. The choice pattern of the Elite Elysian Droptroopers."
	icon_state = "accatran"
	item_state = "lascar"
	slot_flags = SLOT_BACK|SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	force = 13
	one_hand_penalty = 0.7
	fire_delay = 3.5
	accuracy = 0.1
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/lasgun/weak
	charge_cost = 13
	cell_type = /obj/item/cell/device/high/laspack
	wielded_item_state = "lascar-wielded"
	sales_price = 35

	firemodes = list(
		list(mode_name="single", projectile_type=/obj/item/projectile/beam/lasgun/weak, charge_cost=13, burst=1, burst_delay=1),
		list(mode_name="overcharge", projectile_type=/obj/item/projectile/beam/lasgun, charge_cost=19, burst=1, burst_delay=1.9),
		list(mode_name="burst", projectile_type=/obj/item/projectile/beam/lasgun/weak, charge_cost=13, burst=3, burst_delay=1)
		)

/obj/item/gun/energy/lasgun/hotshot
	name = "Ryza Pattern Hot-Shot Lasgun"
	desc = "The favored standard weapon of Tempestus Scions, reknowned for its damage and penetration."
	icon_state = "hotshotgun"
	item_state = "lascar"
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	force = 14
	one_hand_penalty = 1.7
	fire_delay = 4.5
	accuracy = 0.1
	self_recharge = 1
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 4)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/lasgun/hotshot
	charge_cost = 35
	cell_type = /obj/item/cell/device/high/laspack/hotshot
	wielded_item_state = "lascar-wielded"
	sales_price = 100

	firemodes = list(
		list(mode_name="single", projectile_type=/obj/item/projectile/beam/lasgun/hotshot, charge_cost=35, burst=1, burst_delay=2.2),
		list(mode_name="overcharge", projectile_type=/obj/item/projectile/beam/lasgun/hotshot/overcharge, charge_cost=45, burst=1, burst_delay=3.3),
		list(mode_name="burst", projectile_type=/obj/item/projectile/beam/lasgun/hotshot, charge_cost=35, burst=3, burst_delay=2.2)
		)


/obj/item/gun/energy/lasgun/hotshot/New()
	..()
	slowdown_per_slot[slot_back] = 0.1
	slowdown_per_slot[slot_wear_suit] = 0.2
	slowdown_per_slot[slot_belt] = 0.2
	slowdown_per_slot[slot_r_hand] = 0.25
	slowdown_per_slot[slot_l_hand] = 0.25

////////Laser Tag////////////////////

/obj/item/gun/energy/lasertag
	name = "laser tag gun"
	icon = 'icons/obj/guns/lasertag.dmi'
	icon_state = "bluetag"
	item_state = "laser"
	desc = "Standard issue weapon of the Imperial Guard."
	origin_tech = list(TECH_COMBAT = 1, TECH_MAGNET = 2)
	self_recharge = 1
	matter = list(MATERIAL_STEEL = 2000)
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	var/required_vest

/obj/item/gun/energy/lasertag/special_check(mob/living/carbon/human/M)
	if(ishuman(M))
		if(!istype(M.wear_suit, required_vest))
			to_chat(M, SPAN_WARNING("You need to be wearing your laser tag vest!"))
			return 0
	return ..()

/obj/item/gun/energy/lasertag/blue
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	required_vest = /obj/item/clothing/suit/bluetag

/obj/item/gun/energy/lasertag/red
	icon_state = "redtag"
	item_state = "redtag"
	projectile_type = /obj/item/projectile/beam/lastertag/red
	required_vest = /obj/item/clothing/suit/redtag
