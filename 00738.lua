function LuaS_Area_List(Area,Flag)
	if Area == 1 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --�ǰe��Z��R����
		end
	end
	if Area == 2 then
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_6") , "LuaS_111256_6", 0 ); --�ǰe����`�ۭn��
		end
		if CheckFlag( OwnerID() , Flag[1] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_1") , "LuaS_111256_1", 0 ); --�ǰe��ù����
		end
		if CheckFlag( OwnerID() , 540191 ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); --�ǰe��祱�S��a
		end
		if CheckFlag( OwnerID() , 540193 ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_111256_13]"  , "LuaS_111256_13", 0 ); --�ǰe���������a
		end
		if	CheckFlag(OwnerID(),546189)==true	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_TRANSTO]".."[ZONE_Z22_OLD_ROJAN_KINGDOM]","DW_AirPortSleepShop(22411)",0); --�ǰe�ܿը��N�w���§}
		end
		if	CheckFlag(OwnerID(),546255)==true	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_TRANSTO]".."[ZONE_Z31_IFANTRISH_CRYPT]","LuaS_111256_31",0) --�ǰe���Z�Z�Ʀa��
		end
	end
	if Area == 3 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --�ǰe��Z��R����
		end
		if CheckFlag( OwnerID() , Flag[7] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_7") , "LuaS_111256_7", 0 ); --�ǰe�쩥����
		end
	end
	if Area == 4 then	
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --�ǰe��Z��R����
		end
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_5") , "LuaS_111256_5", 0 ); --�ǰe�쫢���ҥ����
		end
	end
	if Area == 5 then
		if CheckFlag( OwnerID() , Flag[4] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_4") , "LuaS_111256_4", 0 ); --�ǰe����r��
		end
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_6") , "LuaS_111256_6", 0 ); --�ǰe����`�ۭn��
		end
		if CheckFlag( OwnerID() , Flag[11] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_11") , "LuaS_111256_11", 0 ); --�ǰe��p�J��
		end
	end
	if Area == 6 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --�ǰe��Z��R����
		end
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_5") , "LuaS_111256_5", 0 ); --�ǰe�쫢���ҥ����
		end
		if CheckFlag( OwnerID() , Flag[10] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10") , "LuaS_111256_10", 0 ); --�ǰe��㺸���Ӷ�
		end
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10_1") , "LuaS_111256_10_1", 0 ); --�ǰe��祱�S��a
	end
	if Area == 7 then
		if CheckFlag( OwnerID() , Flag[3] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_3") , "LuaS_111256_3", 0 ); --�ǰe��o�󫰹�
		end
		if CheckFlag( OwnerID() , Flag[8] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_8") , "LuaS_111256_8", 0 ); --�ǰe��񤧶�
		end
	end
	if Area == 8 then
		if CheckFlag( OwnerID() , Flag[7] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_7") , "LuaS_111256_7", 0 ); --�ǰe�쩥����
		end
		if CheckFlag( OwnerID() , Flag[9] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111256_9]" , "LuaS_111256_9", 0 ); --�ǰe��???
		end
	end
	if Area == 9 then
		if CheckFlag( OwnerID() , Flag[8] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111256_8]" , "LuaS_111256_8", 0 ); --�ǰe��񤧶�
		end
	end
	if Area == 10 then
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_6") , "LuaS_111256_6", 0 ); --�ǰe����`�ۭn��
		end
		if CheckFlag( OwnerID() , Flag[11] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_11") , "LuaS_111256_11", 0 ); --�ǰe��p�J��
		end
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10_1") , "LuaS_111256_10_1", 0 ); --�ǰe��祱�S��a
	end
	if Area == 11 then
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_5") , "LuaS_111256_5", 0 ); --�ǰe�쫢���ҥ����
		end
		if CheckFlag( OwnerID() , Flag[10] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10") , "LuaS_111256_10", 0 ); --�ǰe��㺸���Ӷ�
		end
	end
	if Area == 12 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --�ǰe��Z��R����
		end
	end
	if Area == 31 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_TRANSTO]".."[ZONE_VARANAS]" , "LuaS_111256_2", 0 ); --�ǰe��Z��R����
		end
	end
end

function LuaS_111256_ZoneID(ZoneID)
	local Zone = ZoneID - 1000*math.floor( ZoneID / 1000 )
	return Zone
end



function LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	local String = ""
	if CastMoney[Area] == nil or CastMoney[Area] == 0 then
		return -1 
	else
		local B = CastMoney[Area]
		String = "[SC_111256_DIALOG_0][$SETVAR1="..Areaname.."][$SETVAR2="..B.."]" --�ǰe��ù����ݭn�I�O XX ��

	end 
	return String
end