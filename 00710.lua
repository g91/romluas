--710

--�Où �ұB���v

function LuaS_111282()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	BeginPlot( NPC , "lua_mika_merrynpc_range" , 0 )  --�ˬdNPC�P���a���Z��

	if CheckFlag(Player, 541320) == true then --���ӽйL���B
		AddSpeakOption( Player, Player, GetString("SC_MARRY_2") , "Marry_Start" , 0 )	--�B§�}�l
	end

	AddSpeakOption( Player, Player, "[SC_MERRY_LEAVE]" , "lua_mika_merry_exit01" , 0 )	--���}���B�|��

end

function LuaS_111282_2()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	BeginPlot( NPC , "lua_mika_merrynpc_range" , 0 )  --�ˬdNPC�P���a���Z��

	if CheckFlag(Player, 541320) == true then --���ӽйL���B
		AddSpeakOption( Player, Player, GetString("SC_MARRY_2") , "Marry_Start2" , 0 )	--�B§�}�l
	end

	if CheckBuff(Player, 623790 )  == true then  -- �p�G���|�����ɾ��� �n�����B�~�i�H��
		if CheckFlag(Player, 541321) == true then --���ӽйL���B
			AddSpeakOption( Player, Player, "[SC_MERRY_LEAVE]" , "lua_mika_merry_exit01" , 0 )	--���}���B�|��
		end
	else  -- �@��ӻ��i�H�������}
		AddSpeakOption( Player, Player, "[SC_MERRY_LEAVE]" , "lua_mika_merry_exit01" , 0 )	--���}���B�|��
	end
end

function lua_mika_merrynpc_range()	-- �Z���W�L50�Y������ܵ���
	while true do
	--	Say(OwnerID(), "OwnerID")
	--	Say(TargetID(), "TargetID")
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			break
		end
		sleep(5)
	end
end

--�B§�}�l
function Marry_Start()
	CloseSpeak( OwnerID() )			-- ������ܵ���
--	Say(OwnerID(), "OwnerID") -- Player
--	Say(TargetID(), "TargetID" ) -- npc
	BeginPlot( TargetID() , "Marry_Start_Begin", 1 )
end

function Marry_Start2()
	CloseSpeak( OwnerID() )			-- ������ܵ���
--	Say(OwnerID(), "OwnerID") -- Player
--	Say(TargetID(), "TargetID" ) -- npc
	BeginPlot( TargetID() , "Marry_Start_Begin2", 1 )
end

--�B§�ˬd
function Marry_Start_Begin()
--	Say(OwnerID(), "OwnerID 2") -- npc
--	Say(TargetID(), "TargetID 2" ) -- player
	local PartyNum = GetPartyID(TargetID() , -1 )
	local Couple1 = GetPartyID( TargetID() , 1 )
	local Couple2 = GetPartyID( TargetID() , 2 )
	local Relation = GetRelation(Couple1, Couple2)  --�ˬd�������Y
	local Relation2 = GetRelation(Couple2, Couple1) -- �ˬd�������Y

	local P1LV = ReadRoleValue( Couple1, EM_RoleValue_LV)
	local P2LV = ReadRoleValue( Couple2, EM_RoleValue_LV)
	local P1Sex = ReadRoleValue(Couple1, EM_RoleValue_SEX)
	local P2Sex = ReadRoleValue(Couple2, EM_RoleValue_SEX)

	local P1_DBID = ReadRoleValue(Couple1, EM_RoleValue_DBID ) --1P��DBID
	local P2_DBID = ReadRoleValue(Couple2, EM_RoleValue_DBID ) --2P��DBID
	local P1_online =  CheckOnlinePlayer(P1_DBID )  -- �b���b�u�W
	local P2_online =  CheckOnlinePlayer(P2_DBID )  -- �b���b�u�W

	local IamS = Check_Relation( Couple1 , EM_RelationType_Student )  --1P�OS
	local IamT = Check_Relation( Couple1, EM_RelationType_Teacher )  --1P�OT
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --
	local IamW = Check_Relation( Couple1 , EM_RelationType_Wife  )  --
	local IamL = Check_Relation( Couple1 , EM_RelationType_Lover )  --
	local IamF = Check_Relation( Couple1 , EM_RelationType_Family  )  --
	local IamB = Check_Relation( Couple1 , EM_RelationType_BestFriend  )  --
---------------
	local YouS = Check_Relation( Couple2 , EM_RelationType_Student )  --
	local YouT = Check_Relation( Couple2, EM_RelationType_Teacher )  --
	local YouH = Check_Relation( Couple2 , EM_RelationType_Husband )  --
	local YouW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --
	local YouL = Check_Relation( Couple2 , EM_RelationType_Lover )  --
	local YouF = Check_Relation( Couple2 , EM_RelationType_Family  )  --
	local YouB = Check_Relation( Couple2 , EM_RelationType_BestFriend  )  --

	local P1_POS19_DBID  = GetRelation_DBID( Couple1 , 19 )
	local P2_POS19_DBID  = GetRelation_DBID( Couple2 , 19 )
--------------
--	Say(TargetID(), Relation )
--	Say(TargetID(), Relation2 )
	if ( PartyNum == 0 ) then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_MARRY_7]" , 0 )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_MARRY_7]" , 0 )	--�T����
	elseif ( PartyNum == 1 ) then
		ScriptMessage( TargetID(), TargetID() , 2, "[SC_RELATION_OFFLINE]" , 0 )	--�e�������T��   �P�A�ӽе��B����H���b�u�W�A�L�k�ӽСC
		ScriptMessage( TargetID(), TargetID() , 0, "[SC_RELATION_OFFLINE]" , 0 )	--�T����
	elseif ( PartyNum == 2 ) then
		if GetDistance( Couple1 , OwnerID() ) <= 200 and GetDistance( Couple2 , OwnerID() ) <= 200 and GetDistance( Couple1 , OwnerID() ) ~= -1 and GetDistance( Couple2 , OwnerID() ) ~= -1 then
			if P1LV  < 18 or P2LV  < 18 then   -- ���� LV18
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , 0 )	--�e�������T��  ����Ҧ�¾�~�䤤���@��¾�~���ť����bLV18�H�W
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , 0 )	
			elseif P1_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
			elseif P2_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
			elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- ����Ψ䤤���@���w�B���A
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_39]" , 0 )	--�e�������T��  ����Ψ䤤���@���w�B���A�A�L�k�i��B§�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_39]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_39]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_39]" , 0 )	
			elseif Relation == -1 and Relation2 == -1 then 	--����S���������Y
			--�i���B
				BeginPlot(TargetID(), "Marry_Start_Begin3" , 0)  --���B
			else
			--���i���B �T��
				ScriptMessage(  Couple1,  Couple1, 2, "[SC_MARRY_41]" , 0 )	--�e�������T��  ����Ψ䤤���@�w���䥦���Y�A�L�k�i��B§�C
				ScriptMessage(  Couple1,  Couple1, 0, "[SC_MARRY_41]" , 0 )	
				ScriptMessage(  Couple2,  Couple2, 2, "[SC_MARRY_41]" , 0 )	
				ScriptMessage(  Couple2,  Couple2, 0, "[SC_MARRY_41]" , 0 )	
			end
		else
			ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_8]" , 0 )	--�e�������T��   �s���P�s�Q�����b�ڪ�����A�ڤ~�ର�A���ұB�C
			ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_8]" , 0 )	
			ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_8]" , 0 )	
			ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_8]" , 0 )	
		end
	elseif ( PartyNum >= 3 ) then
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , 0 )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , 0 )	
	end
end

function Marry_Start_Begin3()
--	Say(OwnerID(), "Owner 123") 
--	Say(TargetID(), "Target 456" ) 
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	if CheckFlag( Couple1, 541321) == true or CheckFlag( Couple2, 541321) == true then --���ѵ��L�B
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_TODAY]" , 0 )	--�e�������T��  ����Ψ䤤���@���Ѥw�g�i��L�B§�F�A�Щ��ѦA�ӡC
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_TODAY]" , 0 )	--�T����
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_TODAY]" , 0 )	--�e�������T��  ����Ψ䤤���@���Ѥw�g�i��L�B§�F�A�Щ��ѦA�ӡC
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_TODAY]" , 0 )	--�T����
	else
		if CheckFlag( Couple1 , 541320 ) == true and CheckFlag( Couple2 , 541320 ) == true then  --���w�ӽе��B��keyitem
		--	Say(OwnerID(), "OwnerID4") --npc
		--	Say(TargetID(), "TargetID4") --player
		--	local Couple1 = GetPartyID( TargetID() , 1 )
		--	local Couple2 = GetPartyID( TargetID() , 2 )
		------------- �Ĥ@�Ө��⪺ -----------------------------------------------------------------
			local P1_mallring1 = CountBodyItem( Couple1 , 202543 )  --�ӫ��k��ring
			local P1_mallring2 = CountBodyItem( Couple1 , 202544 )  --�ӫ��k��ring
			local P1_shopring1 = CountBodyItem( Couple1 , 202817 )  --�C���k��ring
			local P1_shopring2 = CountBodyItem( Couple1 , 202818 )  --�C���k��ring
		------------- �ĤG�Ө��⪺ -----------------------------------------------------------------
			local P2_mallring1 = CountBodyItem( Couple2 , 202543 )  --�ӫ��k��ring
			local P2_mallring2 = CountBodyItem( Couple2 , 202544 )  --�ӫ��k��ring
			local P2_shopring1 = CountBodyItem( Couple2 , 202817 )  --�C���k��ring
			local P2_shopring2 = CountBodyItem( Couple2 , 202818 )  --�C���k��ring

					--�[�W�W�h- 
			--���X�ն����H�ݬ��k��A�����ն���ݬ��k��C
			--�k��ݫ����k�ʱB�٨䤤�@��(�ӫ��ιC����)�A�k��ݫ����k�ʱB�٨䤤�@��(�ӫ��ιC����)
			if P1_mallring1 == 0 and  P1_shopring1 == 0 then
				--p1�S���٫�
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY02]" , 0 ) --�e�������T��   �нT�{���X�ն��̬O�_����[202817]��[202543]�A
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY02]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY02]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY02]" , 0 )	
				Sleep(10)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY02_2]" , 0 )	--�e�������T��   �����ն��̬O�_����[202818]��[202544]�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY02_2]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY02_2]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY02_2]" , 0 )	
			else 
				if P1_mallring1 > 0 then  --���ӫ��٫�
					if P2_mallring2 == 0  then
					--p2�S���ӫ��٫�
						ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY04]" , 0 ) --�e�������T��   �����ն��̥�����[202544]
						ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY04]" , 0 )	
						ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY04]" , 0 )	
						ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY04]" , 0 )	
					elseif  P2_mallring2 > 0 then
						Marry_Start_Begin_Combo( Couple1 , Couple2 )
					end
				elseif  P1_shopring1 > 0 then  --���@��٫�
					if P2_shopring2 == 0  then
						ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY03]" , 0 )  --�e�������T��   �����ն��̥�����[202818]
						ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY03]" , 0 )	
						ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY03]" , 0 )	
						ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY03]" , 0 )	
					elseif  P2_shopring2  > 0 then
						Marry_Start_Begin_Combo( Couple1 , Couple2 )
					end
				end
			end
		else
			ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_43]" , 0 ) --�e�������T��  ����Ψ䤤���@����z���B�ӽСA�Х��V�B�ú޲z���ӽЦA�ӧ�ڡC
			ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_43]" , 0 ) 	
			ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_43]" , 0 )
			ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_43]" , 0 ) 	
		end
	end
end
