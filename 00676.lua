function LuaI_110989_0()
	SetPlot( OwnerID() , "Range" , "LuaI_110989_1" ,150)
end
function LuaI_110989_MSG()
	if a==ok then
	while 1 do
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		
		if GetSystime(1) == 11 and  GetSystime(2) == 30 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_1") ) --�Z��R���س]���ʱN��30������}�l�C
			end
		end 
		if GetSystime(1) == 11 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_2") ) --�Z��R���س]���ʱN��10������}�l�C
			end
		end 
		if GetSystime(1) == 11 and  GetSystime(2) == 55 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_3") ) --�Z��R���س]���ʱN��5������}�l�C
			end
		end 
		if GetSystime(1) == 12 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_4") ) --�Z��R���س]���ʤw�}�l�A�ЦV�Z��R���������߻�ǳ��W�C
			end
		end 
		if GetSystime(1) == 12 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_5") ) --�Z��R���س]���ʱN��10�����ᵲ���A�Х������̺ɳt�^��Z��R�����C
			end
		end
		if GetSystime(1) == 13 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_6") ) --�Z��R���س]���ʤw�g�����C
			end
		end 

		if GetSystime(1) == 19 and  GetSystime(2) == 30 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_1") ) 
			end
		end 
		if GetSystime(1) == 19 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_2") ) 
			end
		end 
		if GetSystime(1) == 19 and  GetSystime(2) == 55 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_3") ) 
			end
		end 
		if GetSystime(1) == 20 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_4") ) 
			end
		end 
		if GetSystime(1) == 20 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_5") ) 
			end
		end
		if GetSystime(1) == 21 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
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
	
	if TimeCheck == "OPEN" then --�ŦX���W�ɶ����ԭz
		LoadQuestOption( OwnerID()) 
	elseif TimeCheck == "OVERTIME" then --�W�L���W�ɶ����ԭz
		SetSpeakDetail( OwnerID(), GetString("ST_110989_4")   ) 
	else --���b���W�ɶ����ԭz
		SetSpeakDetail( OwnerID(), GetString("ST_110989_0")   ) 
	end

	if CountBodyItem( OwnerID() , 200007 ) == 0 and TimeCheck == "OPEN" and CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_2") , "LuaS_110989_2", 0 ); --/*�ڭn�B�q
	elseif CountBodyItem( OwnerID() , 200007 ) > 0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_1") , "LuaS_110989_1", 0 ) --/*�ڷQ���B�q
	end

end

function LuaS_110989_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110989_1")   ) --�n���A�o�ǬO�A������A�Ц��U�C --�Ʊ�U���A��ѥ[�C

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
	
	if TimeCheck == "OPEN" and CountBodyItem( OwnerID() , 200007 ) > 0 then --�ŦX���W�ɶ����ԭz
		LoadQuestOption( OwnerID()) 
	elseif TimeCheck == "OVERTIME" and CountBodyItem( OwnerID() , 200007 ) > 0 then --�W�L���W�ɶ����ԭz
		SetSpeakDetail( OwnerID(), GetString("ST_110990_0")   ) 
	else --���b���W�ɶ����ԭz
		SetSpeakDetail( OwnerID(), GetString("ST_110990_1")   ) 
	end

	if CountBodyItem( OwnerID() , 200007 ) > 0 and CheckBuff(OwnerID() , 501603 ) == false and CheckBuff(OwnerID() , 502168 ) == false and CheckBuff(OwnerID() , 502169 ) == false and CheckBuff(OwnerID() , 502170 ) == false and CheckBuff(OwnerID() , 502171 ) == false and CheckBuff(OwnerID() , 502172 ) == false and CheckBuff(OwnerID() , 502173 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110990_1") , "LuaS_110990_1", 0 ) --/*�ڭn�B�q
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
	local String = "[QUESTPK_MSG_MINE_KILLER_A][$SETVAR1="..Dead.."][$SETVAR2="..Killer.."]" -- �B�e���q���Q  ���m�ܤF�I
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( TargetID() , 2 , String )
	end
		if CheckBuff( OwnerID() ,501603 ) == true then
			CancelBuff( OwnerID() , 501603 ) --����BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 3000 )
		elseif CheckBuff( OwnerID(),502168) ==true then
			CancelBuff( OwnerID() , 502168 ) --����BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 3600 )
		elseif CheckBuff( OwnerID(),502169) ==true then
			CancelBuff( OwnerID() , 502169 ) --����BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 4200 )
		elseif CheckBuff( OwnerID(),502170) ==true then
			CancelBuff( OwnerID() , 502170 ) --����BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 4800 )
		elseif CheckBuff( OwnerID(),502171) ==true then
			CancelBuff( OwnerID() , 502171 ) --����BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 5400 )
		elseif CheckBuff( OwnerID(),502172) ==true then
			CancelBuff( OwnerID() , 502172 ) --����BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 6000 )
		elseif CheckBuff( OwnerID(),502173) ==true then
			CancelBuff( OwnerID() , 502173 ) --����BUFF
			AddRoleValue(TargetID() , EM_RoleValue_Money , 7200 )
		else
		end	
	end
	CancelBuff( OwnerID() , 501603 ) --����BUFF
	CancelBuff( OwnerID() , 502168 ) --����BUFF
	CancelBuff( OwnerID() , 502169 ) --����BUFF
	CancelBuff( OwnerID() , 502170 ) --����BUFF
	CancelBuff( OwnerID() , 502171 ) --����BUFF
	CancelBuff( OwnerID() , 502172 ) --����BUFF
	CancelBuff( OwnerID() , 502173 ) --����BUFF
end