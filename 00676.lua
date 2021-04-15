function LuaI_110989_0()
	SetPlot( OwnerID() , "Range" , "LuaI_110989_1" ,150)
end
function LuaI_110989_MSG()
	if a==ok then
	while 1 do
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		
		if GetSystime(1) == 11 and  GetSystime(2) == 30 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_1") ) --凡瑞娜絲建設活動將於30分鐘後開始。
			end
		end 
		if GetSystime(1) == 11 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_2") ) --凡瑞娜絲建設活動將於10分鐘後開始。
			end
		end 
		if GetSystime(1) == 11 and  GetSystime(2) == 55 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_3") ) --凡瑞娜絲建設活動將於5分鐘後開始。
			end
		end 
		if GetSystime(1) == 12 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_4") ) --凡瑞娜絲建設活動已開始，請向凡瑞娜絲城的伊米葳勒報名。
			end
		end 
		if GetSystime(1) == 12 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_5") ) --凡瑞娜絲建設活動將於10分鐘後結束，請未完成者盡速回到凡瑞娜絲城。
			end
		end
		if GetSystime(1) == 13 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_6") ) --凡瑞娜絲建設活動已經結束。
			end
		end 

		if GetSystime(1) == 19 and  GetSystime(2) == 30 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_1") ) 
			end
		end 
		if GetSystime(1) == 19 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_2") ) 
			end
		end 
		if GetSystime(1) == 19 and  GetSystime(2) == 55 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_3") ) 
			end
		end 
		if GetSystime(1) == 20 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_4") ) 
			end
		end 
		if GetSystime(1) == 20 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_5") ) 
			end
		end
		if GetSystime(1) == 21 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_6") ) 
			end
		end 

		
		sleep( 300 )
end
	end
end

function LuaS_110989_0()

	local TimeCheck = "CLOSE"

	if GetSystime( 1 ) == 12 or GetSystime( 1 ) == 20 then
		if GetSystime( 2 ) < 45 then
			TimeCheck = "OPEN"
		else
			TimeCheck = "OVERTIME"
		end
	end
	
	if TimeCheck == "OPEN" then --符合報名時間的敘述
		LoadQuestOption( OwnerID()) 
	elseif TimeCheck == "OVERTIME" then --超過報名時間的敘述
		SetSpeakDetail( OwnerID(), GetString("ST_110989_4")   ) 
	else --不在報名時間的敘述
		SetSpeakDetail( OwnerID(), GetString("ST_110989_0")   ) 
	end

	if CountBodyItem( OwnerID() , 200007 ) == 0 and TimeCheck == "OPEN" and CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_2") , "LuaS_110989_2", 0 ); --/*我要運礦
	elseif CountBodyItem( OwnerID() , 200007 ) > 0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_1") , "LuaS_110989_1", 0 ) --/*我想放棄運礦
	end

end

function LuaS_110989_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110989_1")   ) --好的，這些是你的押金，請收下。 --希望下次你能參加。

	if CountBodyItem( OwnerID() , 200007 ) > 0 then		
		
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 1000*CountBodyItem( OwnerID() , 200007 )  ) 
		DelBodyItem( OwnerID() , 200007 , CountBodyItem( OwnerID() , 200007 )  )
	end

end

function LuaS_110990_0()
	local TimeCheck = "CLOSE"

	if GetSystime( 1 ) == 12 or GetSystime( 1 ) == 20 then
		if GetSystime( 2 ) < 50 then
			TimeCheck = "OPEN"
		else
			TimeCheck = "OVERTIME"
		end
	end
	
	if TimeCheck == "OPEN" and CountBodyItem( OwnerID() , 200007 ) > 0 then --符合報名時間的敘述
		LoadQuestOption( OwnerID()) 
	elseif TimeCheck == "OVERTIME" and CountBodyItem( OwnerID() , 200007 ) > 0 then --超過報名時間的敘述
		SetSpeakDetail( OwnerID(), GetString("ST_110990_0")   ) 
	else --不在報名時間的敘述
		SetSpeakDetail( OwnerID(), GetString("ST_110990_1")   ) 
	end

	if CountBodyItem( OwnerID() , 200007 ) > 0 and CheckBuff(OwnerID() , 501603 ) == false and CheckBuff(OwnerID() , 502168 ) == false and CheckBuff(OwnerID() , 502169 ) == false and CheckBuff(OwnerID() , 502170 ) == false and CheckBuff(OwnerID() , 502171 ) == false and CheckBuff(OwnerID() , 502172 ) == false and CheckBuff(OwnerID() , 502173 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110990_1") , "LuaS_110990_1", 0 ) --/*我要運礦
	end
	
end

function LuaS_110990_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_110990_2" , 0 )
end
function LuaPK_Mine_Killer()
	if CheckID( TargetID() ) then
	local Killer = GetName( TargetID() ) 
	local Dead = GetName( OwnerID() ) 
	local String = "[QUESTPK_MSG_MINE_KILLER_A][$SETVAR1="..Dead.."][$SETVAR2="..Killer.."]" -- 運送的礦產被  給搶奪了！
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( TargetID() , 2 , String )
	end
		if CheckBuff( OwnerID() ,501603 ) == true then
			CancelBuff( OwnerID() , 501603 ) --取消BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 3000 )
		elseif CheckBuff( OwnerID(),502168) ==true then
			CancelBuff( OwnerID() , 502168 ) --取消BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 3600 )
		elseif CheckBuff( OwnerID(),502169) ==true then
			CancelBuff( OwnerID() , 502169 ) --取消BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 4200 )
		elseif CheckBuff( OwnerID(),502170) ==true then
			CancelBuff( OwnerID() , 502170 ) --取消BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 4800 )
		elseif CheckBuff( OwnerID(),502171) ==true then
			CancelBuff( OwnerID() , 502171 ) --取消BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 5400 )
		elseif CheckBuff( OwnerID(),502172) ==true then
			CancelBuff( OwnerID() , 502172 ) --取消BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 6000 )
		elseif CheckBuff( OwnerID(),502173) ==true then
			CancelBuff( OwnerID() , 502173 ) --取消BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 7200 )
		else
		end	
	end
	CancelBuff( OwnerID() , 501603 ) --取消BUFF
	CancelBuff( OwnerID() , 502168 ) --取消BUFF
	CancelBuff( OwnerID() , 502169 ) --取消BUFF
	CancelBuff( OwnerID() , 502170 ) --取消BUFF
	CancelBuff( OwnerID() , 502171 ) --取消BUFF
	CancelBuff( OwnerID() , 502172 ) --取消BUFF
	CancelBuff( OwnerID() , 502173 ) --取消BUFF
end