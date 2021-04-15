--���B�޲z��2  (�u�ಧ�ʵ��B)

function LuaS_111274_2() -- npc��l�@��
	LoadQuestOption( OwnerID() );  --���J���ȼҪO
	BeginPlot( TargetID() , "lua_mika_merrynpc_range" , 0 )  --�ˬdNPC�P���a���Z��
	local Player = OwnerID()
	local Target = TargetID()
	local Couple1 = GetPartyID( Player , 1 )
	local Couple2 = GetPartyID( Player , 2 )
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --1P�O�Ѥ�
	local IamW = Check_Relation( Couple1, EM_RelationType_Wife )  --1P�O�ѱC
	local UareH = Check_Relation( Couple2 , EM_RelationType_Husband )  --2P�O�Ѥ�
	local UareW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --2P�O�ѱC

	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_01]" , "lua_mika_relationintro_01" , 0 )  --���Y�t�Τ���
	if CheckFlag( OwnerID() , 541320 ) == true then  --���w�ӽе��B��keyitem
		AddSpeakOption( OwnerID(), TargetID(),"[SC_MARRY_36]" , "lua_mika_merryzonego" , 0 )  --�e�����B���a
		AddSpeakOption( OwnerID(), TargetID(),"[SC_MARRY_GIVEUP1]" , "lua_mika_merrygiveup" , 0 )  --�ڷQ���B�åӽ�
	else
		if (IamH ==  false  and UareW  == false) or (IamW  == false and UareH == false ) then  --���賣�S�����B
			AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MARRY_1") , "Marry_Check2" , 0 )	--�ڷQ�n���B
		end
	end
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MARRY_20") , "Marry_Shop" , 0 )		--�ʶR�B�ì������~
end

--�ӽе��B
function Marry_Check2()  
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
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
	CloseSpeak( OwnerID() )			-- ������ܵ���
--	Say(OwnerID(), Relation )
--	Say(OwnerID(), Relation2 )
	local PartyNum = GetPartyID( OwnerID() , -1 )
	if ( PartyNum == 0 ) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_MARRY_3]" , C_SYSTEM )	--�e�������T��  �Х���A�߻�����H�զ���H�p���A�A�ӧ�ڥӽСC
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_MARRY_3]" , C_SYSTEM )	--�T����
	elseif ( PartyNum == 1 ) then
		ScriptMessage( OwnerID(), OwnerID() , 2, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--�e�������T��   �P�A�ӽе��B����H���b�u�W�A�L�k�ӽСC
		ScriptMessage( OwnerID(), OwnerID() , 0, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--�T����
	elseif ( PartyNum == 2 ) then
		if GetDistance( Couple1 , OwnerID() ) <= 200 and GetDistance( Couple2 , OwnerID() ) <= 200 and GetDistance( Couple1 , OwnerID() ) ~= -1 and GetDistance( Couple2 , OwnerID() ) ~= -1 then
			if P1LV  < 18 or P2LV  < 18 then   -- ���� LV18
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , C_SYSTEM )	--�e�������T��  ����Ҧ�¾�~�䤤���@��¾�~���ť����bLV18�H�W
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , C_SYSTEM )	--�e�������T��  ����Ҧ�¾�~�䤤���@��¾�~���ť����bLV18�H�W
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , C_SYSTEM )	--�T����
			elseif P1Sex == 0 and P2Sex == 0 then -- ��Ө��ⳣ�O�k��
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_38]" , C_SYSTEM )	--�e�������T��  �ӽе��B�����訤�⬰�P�ʧO�A�L�k�ӽе��B�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_38]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_38]" , C_SYSTEM )	--�e�������T��  �ӽе��B�����訤�⬰�P�ʧO�A�L�k�ӽе��B�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_38]" , C_SYSTEM )	--�T����
			elseif P1Sex == 1 and P2Sex == 1 then -- ��Ө��ⳣ�O�k��
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_38]" , C_SYSTEM )	--�e�������T��  �ӽе��B�����訤�⬰�P�ʧO�A�L�k�ӽе��B�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_38]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_38]" , C_SYSTEM )	--�e�������T��  �ӽе��B�����訤�⬰�P�ʧO�A�L�k�ӽе��B�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_38]" , C_SYSTEM )	--�T����
			elseif P1_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�T����
			elseif P2_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�T����
			elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- ����Ψ䤤���@���w�B���A
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_28]" , C_SYSTEM )	--�e�������T��  ����Ψ䤤���@���w�B���A�A�L�k�ӽе��B�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_28]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_28]" , C_SYSTEM )	--�e�������T��  ����Ψ䤤���@���w�B���A�A�L�k�ӽе��B�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_28]" , C_SYSTEM )	--�T����
			elseif Relation == -1 and Relation2 == -1 then 	--����S���������Y
			--�i���B
				BeginPlot(OwnerID(), "Marry_Check_step2" , 0)
			else
			--���i���B �T��
				ScriptMessage(  Couple1,  Couple1, 2, "[SC_MARRY_40]" , C_SYSTEM )	--�e�������T��  ����Ψ䤤���@�w���䥦���Y�A�L�k�ӽе��B�C
				ScriptMessage(  Couple1,  Couple1, 0, "[SC_MARRY_40]" , C_SYSTEM )	--�T����
				ScriptMessage(  Couple2,  Couple2, 2, "[SC_MARRY_40]" , C_SYSTEM )	--�e�������T��  ����Ψ䤤���@�w���䥦���Y�A�L�k�ӽе��B�C
				ScriptMessage(  Couple2,  Couple2, 0, "[SC_MARRY_40]" , C_SYSTEM )	--�T����
			end
		else
			ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_42]" , C_SYSTEM )	--�e�������T��   �s���P�s�Q�����b�ڪ�����A�~���z���B�ӽСC
			ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_42]" , C_SYSTEM )	--�T����
			ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_42]" , C_SYSTEM )	--�e�������T��   �s���P�s�Q�����b�ڪ�����A�~���z���B�ӽСC
			ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_42]" , C_SYSTEM )	--�T����
		end
	elseif ( PartyNum >= 3 ) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_MARRY_4]" , C_SYSTEM )	--�e�������T��  �A������H�ƤӦh�A�Хu��A�߻�����H�զ���H�p���A�A�ӧ�ڥӽСC
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_MARRY_4]" , C_SYSTEM )	--�T����
	end
end