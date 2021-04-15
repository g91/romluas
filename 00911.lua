--�H�U��zone6���F�����ƥ��~���@��
-----------------------------------------------------------------------------------
--�ǰe�W�p�ɾ�
-----------------------------------------------------------------------------------
function LuaS_Davis_Clock_out()
	Davis_DiffHour = 0	--�ŧi�����ܼ�
	Davis_DiffMin = 0
	local Step = "false"
	local Array = {}
	local MonsterID = 100449	--���ͩǪ�ID
	local Flag = 780196		--�X�l�s��
	local HowMuch = 10	--���ͼƶq
	local Evil = 0
	local Train = 0
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	local StartTime1 = GetDBKeyValue( "TempestHeightTime_01" )	-- ���o LogView ��  Special Event ���w���������F�}�Үɶ�1
	local StartTime2 = GetDBKeyValue( "TempestHeightTime_02" )	-- ���o LogView ��  Special Event ���w���������F�}�Үɶ�2

	while true do
		local Hour , Minute = Davis_GetSysTime()	--���o��e�ɶ��]�]�t�ϥδ��ի��O�ק��ɶ��^
		if ( Hour == StartTime1 or Hour == StartTime2 ) and ( Minute >= 0 ) then
			if ( Step == "false" ) then
				--�X�Ǫ�
				Hide( OwnerID() )
				Evil = LuaFunc_CreateObjByObj ( 111390 , OwnerID() )
				for i = 0 , HowMuch do
					local Monster = CreateObjByFlag( MonsterID, Flag , i , 1 )
					AddToPartition( Monster ,  0 )
					SetRandMove( Monster , 30 ,  20 , 30 )
					Array[ i ] = Monster
				end
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 ,  GetString("SC_WIND_EVIL") ) --���`�ۭn�����~�������ǰe�}�Q���c���O�q���V�F�A�E���F�@�s[100449]�C
				end
				Step = "One"	--���ˬW�Q���V���q
				
			elseif ( Step == "One" ) then
				if LuaS_Davis_CheckAlive( Array ) == true then	Step = "Two"	--�ǰe���q
				end
				
			elseif ( Step == "Two" ) then
				--���}�ǰe�}
				Hide( Evil )
				DelObj( Evil )
				Train = LuaFunc_CreateObjByObj ( 111391 , OwnerID() )
				SetPlot( Train , "range" , "Lua_Davis_DiffTrin_Open" , 50 )	--�]�w�ǰe�@��
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 ,  GetString("SC_WIND_CLEAR") ) --�����ǰe�}���䪺���c�O�q�M�������A�����ǰe�}�P��X�{�F�������Ŷ��O���C
				end
				Step = "Three"
			end
		elseif ( Hour ~= StartTime1 ) and ( Hour ~= StartTime2 ) and Step ~= "false" then
			for i = 0 , table.getn( Array ) do
				delobj( Array[ i ] )
			end
			DelObj( Evil )
			DelObj( Train )
			Step = "false"
			--���ˬW��_���
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString( "SC_WIND_NOMAL" ) ) --�����ǰe�}�P�䪺���Ŷ��O�������d�z�A��_�F�쥻���ˤl�C
			end
			Show( OwnerID() , 0 )
		end
		Sleep( 100 )
	end
end

------------------------------------------------
--���o��e�ɶ��]�]�t�ϥδ��ի��O�ק��ɶ��^
------------------------------------------------
function Davis_GetSysTime()
	local Hour = GetSystime( 1 )
	local Minute = GetSystime( 2 )
	
	if 	Davis_DiffHour ~= nil then	Hour = Hour + Davis_DiffHour
		if Hour >23 then	Hour = Hour - 24
		end
	end
	
	if 	Davis_DiffMin ~= nil then	Minute = Minute + Davis_DiffMin
		if Minute > 59 then	Minute = Minute - 60
		end
	end
	
	return Hour , Minute
end

-----------------------------------------------------------------------------------
--�ˬd�Ǫ��M�����p
-----------------------------------------------------------------------------------
function LuaS_Davis_CheckAlive( Array )
	while true do
		local Survivor = 0	--�ŧi�ͦs���ܼ�
		
		--�ˬd�ѴX���Ǫ�
		for i = 0 , table.getn( Array ) do
			if 	CheckID( Array[ i ] ) and
				ReadRoleValue( Array[ i ] , EM_RoleValue_IsDead ) == 0 then
				Survivor = Survivor + 1
			end
		end
		
		--�Ǫ��O���O�����F�H
		if Survivor == 0 then	break
		end
		
		Sleep( 10 )
	end
	return true
end

-----------------------------------------------------------------------------------
--�ǰe�@��
-----------------------------------------------------------------------------------
function Lua_Davis_DiffTrin_Open()
	if CastSpell( OwnerID(),OwnerID(),491916) then
		if ChangeZone( OwnerID() , 302 , 0 , 1261 , 685 , 1223 , 268 ) == true then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	--���o���a����
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )	--���o���a��¾����
			DesignLog( OwnerID() , 302 , "last enter Player Lv is " .. PlayerLV .. " and SubLv is " .. PlayerSUBLV )	--�����i�J�H��
		end
	end
end