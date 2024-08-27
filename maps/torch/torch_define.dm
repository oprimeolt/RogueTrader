/datum/map/torch
	name = "\improper Torch"
	full_name = "\improper SEV Torch"
	path = "torch"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/torch_config.txt"

	admin_levels  = list(7)
	escape_levels = list(8)
	empty_levels  = list(9)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1,"4"=1,"5"=1,"6"=1,"9"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("torch.ec.scg", "torch.fleet.mil", "freemail.net", "torch.scg")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "\improper The Dauntless"
	station_short = "\improper Dauntless"
	dock_name     = "TBD"
	boss_name     = "Lord Trader"
	boss_short    = "RT"
	company_name  = "The Imperium"
	company_short = "Imperium"

	map_admin_faxes = list(
		"Segmentum Command",
		"Mechanicus - Explorator Fleet",
		"Administratum - Holy Terra",
		"Lord Militant General - Militarum",
		"The Holy Ordos - Code Vermillion"
	)

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The warp engine is now spooling up, prepare for transit through immaterial space. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting into realspace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	num_exoplanets = 0

	away_site_budget = 1
	min_offmap_players = 0

	id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'

	welcome_sound = null

	use_bluespace_interlude = TRUE
