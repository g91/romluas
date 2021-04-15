--For Trans to New (Directly, No paid)

function LuaS_Area_List_After9(Zone , Area,Flag)
	local PointName = ""
	local Str = ""
	if Zone == 15 then
		if Area == 777 then
			if CheckFlag( OwnerID() , Flag[16][820] ) == true then
				PointName = "[ZONE_SOUTH_JENOTAR_FOREST]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_16_820", 0 )
			end
			if	CheckFlag(OwnerID(),546189)==true or CheckCompleteQuest(OwnerID(),424965)==true	then
				AddSpeakOption(OwnerID(),OwnerID(),"[SC_TRANSTO]".."[ZONE_Z22_OLD_ROJAN_KINGDOM]","DW_AirPortSleepShop(22411)",0) --傳送至諾里吉安國舊址
			end
		end
	end
	if Zone == 16 then
		if Area == 820 then
			if CheckFlag( OwnerID() , Flag[15][777]  ) == true then
				PointName = "[ZONE_DAELANIS]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_15_777", 0 )
			end
			if CheckFlag( OwnerID() , Flag[17][923]  ) == true then
				PointName = "[ZONE_NORTHERN_JANOST_FOREST]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_17_923", 0 )
			end
		end
	end
	if Zone == 17 then
		if Area == 923 then
			if CheckFlag( OwnerID() , Flag[16][820] ) == true then
				PointName = "[ZONE_SOUTH_JENOTAR_FOREST]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_16_820", 0 )
			end
			if CheckFlag( OwnerID() , Flag[18][643]  ) == true then
				PointName = "[ZONE_LYMUN_KINGDOM]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_18_643", 0 )
			end
		end
	end
	if Zone == 18 then
		if Area == 643 then
			if CheckFlag( OwnerID() , Flag[17][923] ) == true then
				PointName = "[ZONE_NORTHERN_JANOST_FOREST]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_17_923", 0 )
			end
			if CheckFlag( OwnerID() , Flag[19][522]  ) == true then
				PointName = "[ZONE_CAMPBELL_TOWNSHIP]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_19_522", 0 )
			end
		end
	end
	if Zone == 19 then
		if Area == 522 then
			if CheckFlag( OwnerID() , Flag[18][643] ) == true then
				PointName = "[ZONE_LYMUN_KINGDOM]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_18_643", 0 )
			end
			if CheckFlag( OwnerID() , Flag[20][222] ) == true then
				PointName = "[ZONE_FIREBOOT_DWARF_FORTRESS]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_20_222", 0 )
			end
		end
	end
	if Zone == 20 then
		if Area == 222 then
			if CheckFlag( OwnerID() , Flag[19][522] ) == true then
				PointName = "[ZONE_CAMPBELL_TOWNSHIP]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_19_522", 0 )
			end
			if CheckFlag( OwnerID() , Flag[21][333] ) == true then
				PointName = "[ZONE_TORAGG_CARAVAN]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_21_333", 0 )
			end
		end
	end
	if Zone == 21 then
		if Area == 333 then
			if CheckFlag( OwnerID() , Flag[20][222] ) == true then
				PointName = "[ZONE_FIREBOOT_DWARF_FORTRESS]"
				Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
				AddSpeakOption( OwnerID(), TargetID(), Str , "LuaS_114353_20_222", 0 )
			end
		end
	end
end