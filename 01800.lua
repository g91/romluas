
function xun_maid( id )

	local script = id;
	script = script  .. " SAY";
	script = script  .. " C_HOUSESERVANT_1000_1_TEST";

	ClientEvent_Range(  OwnerID(), 99, script );

end


