function LuaInside_1v1PVP()
--	local UseItem4 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem4)
--	local Played =  CheckFlag( OwnerID()  , 542416 ) --���Ѧ��L�ӹL
--	if Played == false then
--		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem4 , 0 ) 
--		SetFlag(OwnerID(), 542416, 1)
--	end
--	if UseItem4 == 100 then
--		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_PLAY100]" , 0 )	--�A�~�M�b�@�Ѥ��D�ԤF100��!!���ڰe�A�@��§��!
--		GiveBodyItem( OwnerID() ,  201445  , 10 ) --100��§��
--	elseif UseItem4 == 300 then
--		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_PLAY300]" , 0 )	--�A�~�M�b�@�Ѥ��D�ԤF300��!!���ڰe�A�@��§��!
--		GiveBodyItem( OwnerID() ,  201609  , 5 ) --300��§��
--	elseif UseItem4 == 600 then
--		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_PLAY600]" , 0 )	--�A�~�M�b�@�Ѥ��D�ԤF600��!!���ڰe�A�@��§��!
--		GiveBodyItem( OwnerID() ,  201610  , 5 ) --600��§��
--	elseif UseItem4 == 1000 then
--		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_PLAY1000]" , 0 )	--�A�~�M�b�@�Ѥ��D�ԤF1000��!!���ڰe�A�@��§��!
--		GiveBodyItem( OwnerID() ,  201698  , 1 ) --1000��§��
--	end
	SetCrystalID( TargetID(), 410 ); 	--�]�w�޲z���v�޳�
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE1]" , "Lua_1V1PVP_Teach", 0 ) --�ڷQ���W1��1�v�޳�������
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo", 0 ) --�ڷQ���W1��1�v�޳�������
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_2]" , "Lua_1v1PVP_ChangeItem", 0 ) --�ڷQ��100��[203988]�I��[203178]
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_3]" , "Lua_1v1PVP_ChangeItem2", 0 ) --�ڷQ��500��[203988]�I��[202095]
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_4]" , "Lua_1v1PVP_ChangeItem3", 0 ) --�ڷQ��1000��[203988]�I��[203300]
end
function Lua_1V1PVP_Teach()
	SetSpeakDetail( OwnerID(), "[SC_1V1PVPINSIDE_RULE]"   )	--�o�O�@�Ӧ���3�H�q�����ͦs�Գ��A�H�ӤH�[�J��C�A���C���F��6�H�p���ɡA�N�|�H���t�令�T�H�@�լ��ۦP�}��A�ܦ���Ӱ}�窺�r���C 
									--�i�J�Գ���A�|������������ݮɶ��A�p�G��������Ҧ��i�J��C�����a�٨S����A�h�����Գ��A�Ӧ��Գ��S����Ӫ̡C 
									--�C�����@�ӼĤ�}�禨���A�v��W�[100���Գ��n���A���@��}�窺�Գ��n���F��2000���ɡA�h�Ӱ}����ӡA�Գ������C 
									--���`���᪺�����I�b�}��_�l�X�o�I�A���ͮɦ�10���������͵L�ġC
									--��}��Գ��n���F��500�B1000�B1500�ɡA�Ӱ}�窱�a�ҷ|��o50�I�a�A�ȡC 
									--�ͦs�Գ�����Ӱ}�禨���A���׬O�_�w���`�A�ҵo��100�I�a�A�ȡC 
									--���ɶi��ɡA�C3�����|�X�{�]�k�L�O�b���W�C 
end
function Lua_1v1PVP_GetGuildBidInfo()
	CloseSpeak( OwnerID() )
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(410) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--�Գ��٦b�ǳƤ�
	else		
		if Party[0] == 1 then
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SendBGInfoToClient( 410, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		end
	end
--	Say(OwnerID(),"SendBGInfoToClient")
end
function Lua_1v1PVP_ChangeItem()
	local flag = 203988
	local item = 203178
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if CountBodyItem( OwnerID() , flag ) >= 100 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , 100 )
		GiveBodyItem( OwnerID() , item , 1 )
		CloseSpeak( OwnerID() )
		else
		SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG10]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG9]")--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --�^��W�@��	
	end	
end
function Lua_1v1PVP_ChangeItem2()
	local flag = 203988
	local item = 202095
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if CountBodyItem( OwnerID() , flag ) >= 500 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , 500 )
		GiveBodyItem( OwnerID() , item , 1 )
		CloseSpeak( OwnerID() )
		else
		SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG10]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG9]")--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --�^��W�@��	
	end
end

function Lua_1v1PVP_ChangeItem3()
	local flag = 203988
	local item = 203300
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if CountBodyItem( OwnerID() , flag ) >= 1000 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		CloseSpeak( OwnerID() )
		DelBodyItem( OwnerID() , flag , 1000 )
		GiveBodyItem( OwnerID() , item , 1 )
		else
		SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG10]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG9]")--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --�^��W�@��
	end
end


--�v�޳��n����
-- SetArenaScore ( int iRoomID, int iTeamID, int iArenaType, int iIndex, int iValue ) 
-- GetArenaScore ( int iRoomID, int iTeamID, int iArenaType, int iIndex ) 
--iArenaType : 1 = 1v1, 2 = 2v2, 3 = 6v6
--iIndex : 1=�ѥ[���� 2=�n�� 3=���g�ӳ� 4=���g�ѳ� 5=��ӳ� 6=��ѳ� 7=�ӤH�ӳ� 8=�ӤH�ѳ�
function CountPVPScore(WinTeamScore,LoseTeamScore)
	local WinScore = 0
	local LoseScore = 0
	local Count = WinTeamScore - LoseTeamScore
	if WinTeamScore > LoseTeamScore then
		WinScore = 25 - math.abs(Count*.01)*0.5
		LoseScore = 30 - math.abs(Count*.01)*0.6
	else
		WinScore = 25 + math.abs(Count*.01)*0.5
		LoseScore = 30 + math.abs(Count*.01)*0.6
	end

	return WinScore,LoseScore
end

function LuaI_PVPGife( Option )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV ) --Ū�����a���D¾����
	local PlayerID = OwnerID()
	local PackageID = 203988		-- �x�V§����
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
--	Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	200663,	200664,	200808,	200812,	200816,	200820,	204889}
	local ByLv = {	1,	6,	16,	26,	36,	46,	51}
	if ( Option == "CHECK" ) then
--		Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local Fi = 1
		for i=1,table.getn(ByLv) do
			if PlayerLV >= ByLv[i] then
				Fi = i
			end
		end
		GiveBodyItem( PlayerID , Item[Fi] , Rand(3)+1 )
	end
end