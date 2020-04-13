//This is old chomp code that will need updating to re-add to our game.
//CHOMPedit: Shuttle 3, Sif-bound exploration shuttle for the exploration outpost, Hangar 3, and the wilderness.
//Created so pilots stop stealing the autopilot shuttles and making station-planet travel more burdensome.

/obj/machinery/computer/shuttle_control/web/shuttle3
	name = "shuttle control console"
	shuttle_tag = "Shuttle 3"
	req_access = list(access_pilot)

/datum/shuttle/autodock/web_shuttle/shuttle3
	name = "Shuttle 3"
	warmup_time = 0
	shuttle_area = /area/shuttle/shuttle3/start
	current_location = "exphangar_1"
	docking_controller_tag = "shuttle3_shuttle"
	web_master_type = /datum/shuttle_web_master/shuttle3

/datum/shuttle_web_master/shuttle3
	destination_class = /datum/shuttle_destination/shuttle3
	starting_destination = /datum/shuttle_destination/shuttle3/root

/datum/shuttle_destination/shuttle3/root
	name = "Exporation Hangar One"
	my_landmark = "exphangar_1"
	preferred_interim_tag = "shuttle3_transit"

	radio_announce = 1
	announcer = "Southern Cross Docking Computer"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/sif_orbit = 5 SECONDS
	)

/datum/shuttle_destination/shuttle3/root/get_arrival_message()
	return "Attention, [master.my_shuttle.visible_name] has arrived to Exploration Hangar One."

/datum/shuttle_destination/shuttle3/root/get_departure_message()
	return "Attention, [master.my_shuttle.visible_name] has departed Exploration Hangar One."

/datum/shuttle_destination/shuttle3/sif_orbit
	name = "Sif Orbit"
	my_landmark = "shuttle3_orbit"
	preferred_interim_tag = "shuttle3_transit"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/sky = 25 SECONDS,
		/datum/shuttle_destination/shuttle3/outside_SC = 25 SECONDS
	)

/datum/shuttle_destination/shuttle3/outside_SC
	name = "Outside of NLS Southern Cross"
	my_landmark = "shuttle3_seconddeck"
	preferred_interim_tag = "shuttle3_transit"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/stationhangar3 = 0 SECONDS
	)

/datum/shuttle_destination/shuttle3/stationhangar3
	name = "Southern Cross Hangar Three"
	my_landmark = "hangar_3"
	preferred_interim_tag = "shuttle3_transit"

	radio_announce = 1
	announcer = "Southern Cross Docking Computer"

/datum/shuttle_destination/shuttle3/stationhangar3/get_arrival_message()
	return "Attention, [master.my_shuttle.visible_name] has arrived to Hangar Three."

/datum/shuttle_destination/shuttle3/stationhangar3/get_departure_message()
	return "Attention, [master.my_shuttle.visible_name] has departed Hangar Three."

/datum/shuttle_destination/shuttle3/sky
	name = "Skies of Sif"
	my_landmark = "shuttle3_sky"
	preferred_interim_tag = "shuttle3_sky_transit"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/mining_base = 10 SECONDS
	)

/datum/shuttle_destination/shuttle3/mining_base
	name = "Wilderness Landing Site "
	my_landmark = "shuttle3_mining"
	preferred_interim_tag = "shuttle3_sky_transit"

	radio_announce = 1
	announcer = "Outpost Automated ATC"

/datum/shuttle_destination/shuttle3/mining_base/get_arrival_message()
	return "Attention, [master.my_shuttle.visible_name] has arrived to the Wilderness Area."

/datum/shuttle_destination/shuttle3/mining_base/get_departure_message()
	return "Attention, [master.my_shuttle.visible_name] has departed the Wilderness Area."