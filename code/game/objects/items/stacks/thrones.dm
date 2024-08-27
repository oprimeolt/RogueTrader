/obj/item/stack/thrones
	name = "Thrones"
	desc = "A golden throne worth ten Scrip. So far from home -- how did you get here little golden coin?"
	singular_name = "Throne"
	icon = 'icons/obj/thrones.dmi'
	icon_state = "throne"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_TINY
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	max_amount = 20
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")
	sales_price = 10

/obj/item/stack/thrones/New()
	..()
	update_icon()

/obj/item/stack/thrones/update_icon()
	if(!amount)//There's no more money here, so delete the handful.
		qdel(src)
		return
	icon_state = "[initial(icon_state)][amount]"//If there is money then we take our initial icon_state and add the ammount of money in the stack to it.



/obj/item/stack/thrones/use()
	. = ..()
	update_icon()

/obj/item/stack/thrones/add()
	. = ..()
	update_icon()

/obj/item/stack/thrones/split()
	. = ..()
	update_icon()

/obj/item/stack/thrones/five
	amount = 5


/obj/item/stack/thrones/ten
	amount = 10

/obj/item/stack/thrones/twenty
	amount = 20

/obj/item/stack/thrones2
	name = "Tau Credit"
	desc = "A silver tau credit -- it's purity and rareness representative of the Tau Empire"
	singular_name = "Credit"
	icon = 'icons/obj/thrones2.dmi'
	icon_state = "throne"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_TINY
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	max_amount = 20
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")
	sales_price = 5

/obj/item/stack/thrones2/New()
	..()
	update_icon()

/obj/item/stack/thrones2/update_icon()
	if(!amount)//There's no more money here, so delete the handful.
		qdel(src)
		return
	icon_state = "[initial(icon_state)][amount]"//If there is money then we take our initial icon_state and add the ammount of money in the stack to it.



/obj/item/stack/thrones2/use()
	. = ..()
	update_icon()

/obj/item/stack/thrones2/add()
	. = ..()
	update_icon()

/obj/item/stack/thrones2/split()
	. = ..()
	update_icon()


/obj/item/stack/thrones2/five
	amount = 5

/obj/item/stack/thrones2/ten
	amount = 10

/obj/item/stack/thrones2/twenty
	amount = 20
