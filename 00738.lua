function LuaS_Area_List(Area,Flag)
	if Area == 1 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --傳送到凡瑞娜絲城
		end
	end
	if Area == 2 then
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_6") , "LuaS_111256_6", 0 ); --傳送到黑曜石要塞
		end
		if CheckFlag( OwnerID() , Flag[1] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_1") , "LuaS_111256_1", 0 ); --傳送到羅格鎮
		end
		if CheckFlag( OwnerID() , 540191 ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); --傳送到瑞弗特營地
		end
		if CheckFlag( OwnerID() , 540193 ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_111256_13]"  , "LuaS_111256_13", 0 ); --傳送到海爾芬營地
		end
		if	CheckFlag(OwnerID(),546189)==true	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_TRANSTO]".."[ZONE_Z22_OLD_ROJAN_KINGDOM]","DW_AirPortSleepShop(22411)",0); --傳送至諾里吉安國舊址
		end
		if	CheckFlag(OwnerID(),546255)==true	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_TRANSTO]".."[ZONE_Z31_IFANTRISH_CRYPT]","LuaS_111256_31",0) --傳送到伊凡崔希地穴
		end
	end
	if Area == 3 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --傳送到凡瑞娜絲城
		end
		if CheckFlag( OwnerID() , Flag[7] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_7") , "LuaS_111256_7", 0 ); --傳送到岩風村
		end
	end
	if Area == 4 then	
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --傳送到凡瑞娜絲城
		end
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_5") , "LuaS_111256_5", 0 ); --傳送到哈洛夫交易站
		end
	end
	if Area == 5 then
		if CheckFlag( OwnerID() , Flag[4] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_4") , "LuaS_111256_4", 0 ); --傳送到銀瀑村
		end
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_6") , "LuaS_111256_6", 0 ); --傳送到黑曜石要塞
		end
		if CheckFlag( OwnerID() , Flag[11] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_11") , "LuaS_111256_11", 0 ); --傳送到雷克鎮
		end
	end
	if Area == 6 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --傳送到凡瑞娜絲城
		end
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_5") , "LuaS_111256_5", 0 ); --傳送到哈洛夫交易站
		end
		if CheckFlag( OwnerID() , Flag[10] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10") , "LuaS_111256_10", 0 ); --傳送到艾爾恩商隊
		end
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10_1") , "LuaS_111256_10_1", 0 ); --傳送到瑞弗特營地
	end
	if Area == 7 then
		if CheckFlag( OwnerID() , Flag[3] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_3") , "LuaS_111256_3", 0 ); --傳送到廢棄城寨
		end
		if CheckFlag( OwnerID() , Flag[8] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_8") , "LuaS_111256_8", 0 ); --傳送到綠之塔
		end
	end
	if Area == 8 then
		if CheckFlag( OwnerID() , Flag[7] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_7") , "LuaS_111256_7", 0 ); --傳送到岩風村
		end
		if CheckFlag( OwnerID() , Flag[9] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111256_9]" , "LuaS_111256_9", 0 ); --傳送到???
		end
	end
	if Area == 9 then
		if CheckFlag( OwnerID() , Flag[8] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111256_8]" , "LuaS_111256_8", 0 ); --傳送到綠之塔
		end
	end
	if Area == 10 then
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_6") , "LuaS_111256_6", 0 ); --傳送到黑曜石要塞
		end
		if CheckFlag( OwnerID() , Flag[11] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_11") , "LuaS_111256_11", 0 ); --傳送到雷克鎮
		end
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10_1") , "LuaS_111256_10_1", 0 ); --傳送到瑞弗特營地
	end
	if Area == 11 then
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_5") , "LuaS_111256_5", 0 ); --傳送到哈洛夫交易站
		end
		if CheckFlag( OwnerID() , Flag[10] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10") , "LuaS_111256_10", 0 ); --傳送到艾爾恩商隊
		end
	end
	if Area == 12 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --傳送到凡瑞娜絲城
		end
	end
	if Area == 31 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_TRANSTO]".."[ZONE_VARANAS]" , "LuaS_111256_2", 0 ); --傳送到凡瑞娜絲城
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
		String = "[SC_111256_DIALOG_0][$SETVAR1="..Areaname.."][$SETVAR2="..B.."]" --傳送到羅格鎮需要付費 XX 銀

	end 
	return String
end