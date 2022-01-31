/datum/unit_test/component_duping
	name = "DCS: Component duplication"

/datum/unit_test/component_duping/start_test()
	var/list/bad_dms = list()
	var/list/bad_dts = list()
	for(var/t in typesof(/datum/component))
		var/datum/component/comp = t
		if(!isnum(initial(comp.dupe_mode)))
			bad_dms += t
		var/dupe_type = initial(comp.dupe_type)
		if(dupe_type && !ispath(dupe_type))
			bad_dts += t
	if(length(bad_dms) || length(bad_dts))
		fail("Components with invalid dupe modes: ([bad_dms.Join(",")]) ||| Components with invalid dupe types: ([bad_dts.Join(",")])")

	return TRUE
/datum/unit_test/bespoke_id
	name = "DCS: Bespoke elements are configured with a proper id_arg_index"

/datum/unit_test/bespoke_id/start_test()
	var/datum/element/base = /datum/element
	var/base_index = initial(base.id_arg_index)

	for(var/i in subtypesof(/datum/element))
		var/datum/element/faketype = i
		if((initial(faketype.element_flags) & ELEMENT_BESPOKE) && initial(faketype.id_arg_index) == base_index)
			fail("A bespoke element was not configured with a proper id_arg_index: [faketype]")

	return TRUE
