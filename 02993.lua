function Hao_GuildWar_206660()	-- �]�V��
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102485 )
end

function Hao_GuildWar_206661()	-- �q���
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102486 )
end

function Hao_GuildWar_206662()	-- �t����
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102484 )
end

function Hao_GuildWar_206663()	-- �a�A����
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102483 )
end

function Hao_GuildWar_206664()	-- �V���
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102481 )
end

function Hao_GuildWar_206665()	-- ��ı�۹�
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102482 )
end

function Hao_GuildWar_Battle_Tower(TowerID)	-- 2013.06.26 �l��𭫼g�@��

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- ���o���a��e�y��
	local PlayerCamp = GetRoleCampID(Player )	-- ���o���a�}��
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- ���oServer�W Global.ini ���\�����a�̰�����
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	
	local Tower = CreateObj( TowerID , X , Y , Z , Dir , 1 )	-- �إ߹q���
	SetModeEx( Tower , EM_SetModeType_Mark , true )	-- �аO
	SetModeEx( Tower , EM_SetModeType_HideName , true )	-- �W��
	SetModeEx( Tower , EM_SetModeType_ShowRoleHead , true )	-- �Y����
	SetModeEx( Tower , EM_SetModeType_Fight , true )	-- �i�������
	SetModeEx( Tower , EM_SetModeType_Move , false )	-- ����
	SetModeEx( Tower , EM_SetModeType_Obstruct , false )	-- ����
	
	WriteRoleValue( Tower , EM_RoleValue_LV , ServerMaxLv )	-- �N�̰����żg�J�ܶ�
	WriteRoleValue( Tower , EM_RoleValue_Register+1 , 38 )	-- �O�����j���ؿv���A�קK�v��̪����Τۼv�i��������ϥ�
	SetRoleCampID( Tower , PlayerCamp )--�g�J�}��

	-- 2013.07.31 ���E:�ץ����|���Ԫ��~ - �l��N�G�V���(206664)�A�l��X���V���(102481)�L�k�V����q�����D�C(�վ��q���禡�L�k��Npc����A�ҥH�קאּ���a����)
	if TowerID == 102481 then
		CallPlot( Tower , "Hao_GuildWar_Crystal_Extraction_Gem" , Player )	-- �N���a�N�J�ѨV�����檺�@�����C
	end
	--
	SetPlot( Tower , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	-- Ĳ�I�@��
	SetPlot( Tower , "dead" , "Yuyu_GWB_Tower_dead" , 0 )	-- ���`�@��

	-- �H�U�P�_���a�O�_���ǲߨ��m�u�{�����
	local SetA = -1
	local Count = BuffCount(Player)
	for i = 0 , Count , 1 do
		local BuffID = BuffInfo( Player , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505314 then	-- ���a�߱o�����m�u�{����
			local BuffLv = BuffInfo( Player , i , EM_BuffInfoType_Power )	--�ӫؿv�� j ��BUFF������
			SetA = BuffLv
			break
		end
	end

	if SetA > -1 then
		AddBuff( Tower , 505511 , SetA , -1 )	-- �ؿv�������m�u�{����
	end
	AddBuff( Tower , 505921 , 84 , -1 )	-- ��ֳQ���a�ˮ`�q85%
	AddBuff( Tower , 502707 , 0 , -1 )	-- ����۰ʦ^HP�BSP�BMP
	AddToPartition( Tower , Room )
end

function Hao_GuildWar_Place_Tower_Check()	-- �I��e�ˬd

	-- 2013.06.24 ���E:�ϥΪ��~�ɡA�s�W�ˬd�A�p�G�d�򤺦����w����A�h�L�k�إߡC
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Zone = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Voc = ReadRoleValue( Player , EM_RoleValue_VOC )	-- ¾�~
	local Vehicles = CheckFlag( Player , 543769 )	-- ���a�O�_�b����W

	if ( Zone == 402 or Zone >= 900 ) or Voc == 0 then	-- ��ϰ�b���|���Գ��B���հϩ�¾�~�� gm ��..
		if ReadRoleValue( Player , EM_RoleValue_PID ) == 1 then
			ScriptMessage( Player , Player , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )	-- ���L���A�еy�ԦA�աC
			return false
		elseif Vehicles == true then	-- ���a�b����W
			ScriptMessage( Player , Player , 1 , "[SC_YU_GUILDWAR_BUILD_86]" , 0 )	-- ����W�L�k�ϥ�
			ScriptMessage( Player , Player , 0 , "[SC_YU_GUILDWAR_BUILD_86]" , 0 ) 
			return false
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_DAN_111700_37]", C_SYSTEM )	-- �A�L�k�b���ϰ�ϥθӪ��~�I
		ScriptMessage( Player , Player , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
		return false
	end
----[[
--	local Pos = {}
--	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Player)	-- �����a��e�y��
--	Pos["NewY"] = GetHeight( Pos["X"] , Pos["Y"] , Pos["Z"] )	-- ���o�a����
--
--	local SearchNpc = SearchRangeNPC( Player , 120 )
--	
--	local BuildList = {}
--	BuildList[1] = 112916	-- �ǰ|(112916 ~ 112925)	-- �j���ت�(�b�|110)
--	BuildList[2] = 112467	-- ���\(112467 ~ 112476)	-- �j���ت�
--	BuildList[3] = 112703	-- �M��t(112703 ~ 112712)	-- �p���ت�(�b�|55)
--	BuildList[4] = 112688	-- �Ϯ��](112688 ~ 112697)	-- �j���ت�
--	BuildList[5] = 112810	-- �A��(112810 ~ 112819)	-- �p���ت�
--	BuildList[6] = 113141	-- ���t(113141 ~ 113150)	-- �p���ت�
--	BuildList[7] = 112896	-- �ճ�(112896 ~ 112905)	-- �j���ت�
--	BuildList[8] = 112477	-- �u�ö�(112477 ~ 112486)	-- �p���ت�
--	BuildList[9] = 112934	-- �L�u�t(112934 ~ 112943)	-- �j���ت�
--	BuildList[10] = 112906	-- �A������(112906 ~ 112915)	-- �j���ت�
--	BuildList[11] = 113151	-- �[�u�t(113151 ~ 113160)	-- �j���ت�
--
--	local Throne = { 111780 , 120879 , 121242 , 121247 , 121252 , 122264 , 122269 , 122274 }	-- ���|�����y
--	
--	for Count = 0 , #SearchNpc , 1 do
--		local OrgID = ReadRoleValue( SearchNpc[Count] , EM_RoleValue_OrgID )
--		local Distance = GetDistance( Player , SearchNpc[Count] )
--		if OrgID ~= 0 then
--		--	ScriptMessage( Player , Player , 0 , "OrgID = ".."["..OrgID.."]".." , Distance = "..Distance.." , Height = "..Pos["Y"]-Pos["NewY"] , C_SYSTEM )
--		end
--	--	DebugMsg( Player , Room , "OrgID = "..OrgID.." ,  Distance = "..Distance.." Height = "..Pos["Y"]-Pos["NewY"] )
--		for ID = 1 , #BuildList , 1 do
--			if ( OrgID >= BuildList[ID] and OrgID <= BuildList[ID]+10 ) then
--				if Pos["Y"]-Pos["NewY"] >= 5 then
--					ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_UNAVAILABLE]" , C_SYSTEM )	-- �A�L�k�b���|�ؿv�W�ϥΦ����~
--				--	DebugMsg( Player , Room , "Over height" )
--					return false
--				end
--			end
--		end
--		for ID = 1 , #Throne , 1 do
--			if OrgID == Throne[ID] then
--				if Pos["Y"]-Pos["NewY"] >= 5 then
--					ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_UNAVAILABLE]" , C_SYSTEM )	-- �A�L�k�b���|�ؿv�W�ϥΦ����~
--				--	DebugMsg( Player , Room , "Over height" )
--					return false
--				end
--			end
--		end
--	end
----]]	
end

function Hao_GuildWar_Build_Dead_Plot(Range)	-- �����b���|�ؿv�W�A�קK�ؿv���Q�R���ɡA�\��b�ؿv���W���������~�|�B�Ū����D�C

	local Build = OwnerID()
	local SearchNpc = SearchRangeNPC( Build , Range )

	local Tower = {
			102366 ,	-- ���Ԥ��C
			102367 ,	-- ���\����
			102370 , 	-- �u������
			102481 , 	-- �V���
			102482 , 	-- ��ı����
			102483 , 	-- �a�A����
			102484 , 	-- �t����
			102485 , 	-- �]�V��
			102486	-- �q���
					}
	
	for Count = 0 , #SearchNpc , 1 do
		local OrgID = ReadRoleValue( SearchNpc[Count] , EM_RoleValue_OrgID )
		if OrgID ~= 0 then
			for ID = 1 , #Tower , 1 do
				if OrgID == Tower[ID] then
					local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(SearchNpc[Count])	-- ���𪺮y��
					local NewY = GetHeight( X , Y , Z )	-- ���o�a����
				--	ScriptMessage( Build , -1 , 0 , "["..OrgID.."]".." , X = "..X.." , Y = "..Y.." , Z = "..Z.." , NewY = "..NewY , C_SYSTEM )
					if Y-NewY >= 0 then
						CallPlot( SearchNpc[Count] , "Hao_GuildWar_Build_Dead_Plot_SetPos" , SearchNpc[Count] , X , NewY+3.5 , Z , Dir )
					end
				end
			end
		end
	end
end

function Hao_GuildWar_Build_Dead_Plot_SetPos( Tower , X , Y , Z , Dir )

	Sleep(30)
	SetPos( Tower , X , Y , Z , Dir )
	AddBuff( Tower , 621663 , 0 , 2 )	-- �ǰe�S��
end

function Hao_GuildWar_Cast_Check()

	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 1 then
		return true
	else
		return false
	end
end