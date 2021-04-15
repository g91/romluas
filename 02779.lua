-- 702779_�s���B§�ˬd����

-- �ˬd��������
function Marry_Money_Check(Player, roomid )
	-- ��x����	
	local coin1 = GetDBKeyValue("WeddingRoomCost_01")	--  �����ťN������
	local coin2 = GetDBKeyValue("WeddingRoomCost_02")	
	local coin3 = GetDBKeyValue("WeddingRoomCost_03")	

	local itemid = 203038
	local coinlist = {coin1, coin1, coin1, coin2, coin2, coin2, coin3, coin3, coin3 }
	local mycoin = CountBodyItem(Player, itemid )  -- �����ťN�������q

	if Mycoin >= coinlist[roomid] then
		return true
	else
		return false
	end
end

function Marry_Apply_Check_1(player)  -- �ˬd�B§�|���ӽб��� -���ʵ��B�� (�u���\����)
	local NPC = TargetID()

	local PartyNum = GetPartyID(player , -1 )
	local Couple1 = GetPartyID( player , 1 )
	local Couple2 = GetPartyID( player , 2 )
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
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  
	local IamW = Check_Relation( Couple1 , EM_RelationType_Wife  )  
	local IamL = Check_Relation( Couple1 , EM_RelationType_Lover )  
	local IamF = Check_Relation( Couple1 , EM_RelationType_Family  )  
	local IamB = Check_Relation( Couple1 , EM_RelationType_BestFriend  )  
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

--	Say(NPC, "NPC" ) -- NPC
--------------
	if ( PartyNum >= 3 ) then
		ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC23]" , 0 )   -- �ӽХ��ѡA�s���P�s�Q����������H�p��
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC23]" , 0 )	
	elseif ( PartyNum <= 0 ) then
		ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC23]" , 0 )  -- �ӽХ��ѡA�s���P�s�Q����������H�p��
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC23]" , 0 )
	elseif ( PartyNum == 1 ) then
		ScriptMessage( player, player , 2, "[SC_RELATION_OFFLINE]" , 0 )	--  �P�A�ӽе��B����H���b�u�W�A�L�k�ӽСC
		ScriptMessage( player, player , 0, "[SC_RELATION_OFFLINE]" , 0 )	
	elseif ( PartyNum == 2 ) then
		if CheckFlag( Couple1, 541321) == true or CheckFlag( Couple2, 541321) == true then --���ѵ��L�B
			ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_TODAY]" , 0 )	--�e�������T��  ����Ψ䤤���@���Ѥw�g�i��L�B§�F�A�Щ��ѦA�ӡC
			ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_TODAY]" , 0 )	--�T����
			ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_TODAY]" , 0 )	--�e�������T��  ����Ψ䤤���@���Ѥw�g�i��L�B§�F�A�Щ��ѦA�ӡC
			ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_TODAY]" , 0 )	--�T����
		else
			if GetDistance( Couple1 , NPC ) <= 200 and GetDistance( Couple2 , NPC ) <= 200 and GetDistance( Couple1 , NPC ) ~= -1 and GetDistance( Couple2 , NPC ) ~= -1 then
				if P1LV  < 18 or P2LV  < 18 then   -- ���� LV18
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , 0 )	-- ����Ҧ�¾�~�䤤���@��¾�~���ť����bLV18�H�W
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , 0 )	
					return false
				elseif P1Sex == 0 and P2Sex == 0 then -- ��Ө��ⳣ�O�k��
					ScriptMessage( Couple1, Couple1, 2, "[SC_2012MARRY_TRANSNPC24]" , 0 )	--  �ӽХ��ѡA�ӽе��B�����訤�⬰�P�ʧO
					ScriptMessage( Couple1, Couple1, 0, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					return false
				elseif P1Sex == 1 and P2Sex == 1 then -- ��Ө��ⳣ�O�k��
					ScriptMessage( Couple1, Couple1, 2, "[SC_2012MARRY_TRANSNPC24]" , 0 )	--  �ӽХ��ѡA�ӽе��B�����訤�⬰�P�ʧO
					ScriptMessage( Couple1, Couple1, 0, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					return false
				elseif P1_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					return false
				elseif P2_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					return false
				elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- ����Ψ䤤���@���w�B���A
					ScriptMessage( Couple1, Couple1, 2, "[SC_2012MARRY_TRANSNPC25]" , 0 )	--  �ӽХ��ѡA����Ψ䤤���@���w�B���A
					ScriptMessage( Couple1, Couple1, 0, "[SC_2012MARRY_TRANSNPC25]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_2012MARRY_TRANSNPC25]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_2012MARRY_TRANSNPC25]" , 0 )
					return false
				elseif Relation == -1 and Relation2 == -1 then 	--����S���������Y
				--�i���B
					return true
				else
				--���i���B �T��
					ScriptMessage(  Couple1,  Couple1, 2, "[SC_MARRY_41]" , 0 )	-- ����Ψ䤤���@�w���䥦���Y�A�L�k�i��B§�C
					ScriptMessage(  Couple1,  Couple1, 0, "[SC_MARRY_41]" , 0 )	
					ScriptMessage(  Couple2,  Couple2, 2, "[SC_MARRY_41]" , 0 )	
					ScriptMessage(  Couple2,  Couple2, 0, "[SC_MARRY_41]" , 0 )	
					return false
				end

			else
				ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_42]" , 0 )	--�e�������T��   �s���P�s�Q�����b�ڪ�����A�~���z�ӽСC
				ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_42]" , 0 )
				ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_42]" , 0 )	
				ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_42]" , 0 )	
			end
		end
	end
end


function Marry_Apply_Check_2(player)  -- �ˬd�B§�|���ӽб��� -�P�ʵ��B�� (�i�P��, �]�i����)
	local NPC = TargetID()

	local PartyNum = GetPartyID(player , -1 )
	local Couple1 = GetPartyID( player , 1 )
	local Couple2 = GetPartyID( player , 2 )
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
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  
	local IamW = Check_Relation( Couple1 , EM_RelationType_Wife  )  
	local IamL = Check_Relation( Couple1 , EM_RelationType_Lover )  
	local IamF = Check_Relation( Couple1 , EM_RelationType_Family  )  
	local IamB = Check_Relation( Couple1 , EM_RelationType_BestFriend  )  
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

--	Say(NPC, "NPC" ) -- NPC
--------------
	if ( PartyNum >= 3 ) then
		ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC23]" , 0 )   -- �ӽХ��ѡA�s���P�s�Q����������H�p��
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC23]" , 0 )
	elseif ( PartyNum <= 0 ) then
		ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC23]" , 0 )  -- �ӽХ��ѡA�s���P�s�Q����������H�p��
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC23]" , 0 )
	elseif ( PartyNum == 1 ) then
		ScriptMessage( player, player , 2, "[SC_RELATION_OFFLINE]" , 0 )	--�e�������T��   �P�A�ӽе��B����H���b�u�W�A�L�k�ӽСC
		ScriptMessage( player, player , 0, "[SC_RELATION_OFFLINE]" , 0 )	
	elseif ( PartyNum == 2 ) then
		if CheckFlag( Couple1, 541321) == true or CheckFlag( Couple2, 541321) == true then --���ѵ��L�B
			ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_TODAY]" , 0 )	--�e�������T��  ����Ψ䤤���@���Ѥw�g�i��L�B§�F�A�Щ��ѦA�ӡC
			ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_TODAY]" , 0 )	--�T����
			ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_TODAY]" , 0 )	--�e�������T��  ����Ψ䤤���@���Ѥw�g�i��L�B§�F�A�Щ��ѦA�ӡC
			ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_TODAY]" , 0 )	--�T����
		else
			if GetDistance( Couple1 , NPC ) <= 200 and GetDistance( Couple2 , NPC ) <= 200 and GetDistance( Couple1 , NPC ) ~= -1 and GetDistance( Couple2 , NPC ) ~= -1 then
				if P1LV  < 18 or P2LV  < 18 then   -- ���� LV18
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , 0 )	--�e�������T��  ����Ҧ�¾�~�䤤���@��¾�~���ť����bLV18�H�W
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , 0 )	
					return false
				elseif P1_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					return false
				elseif P2_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					return false
				elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- ����Ψ䤤���@���w�B���A
					ScriptMessage( Couple1, Couple1, 2, "[SC_2012MARRY_TRANSNPC25]" , 0 )	--  �ӽХ��ѡA����Ψ䤤���@���w�B���A
					ScriptMessage( Couple1, Couple1, 0, "[SC_2012MARRY_TRANSNPC25]" , 0 )
					ScriptMessage( Couple2, Couple2, 2, "[SC_2012MARRY_TRANSNPC25]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_2012MARRY_TRANSNPC25]" , 0 )	
					return false
				elseif Relation == -1 and Relation2 == -1 then 	--����S���������Y
				--�i���B
					return true
				else
				--���i���B �T��
					ScriptMessage(  Couple1,  Couple1, 2, "[SC_2012MARRY_TRANSNPC26]" , 0 )	-- �ӽХ��ѡA����Ψ䤤���@�w���䥦���Y�A�L�k�i��B§�C
					ScriptMessage(  Couple1,  Couple1, 0, "[SC_2012MARRY_TRANSNPC26]" , 0 )
					ScriptMessage(  Couple2,  Couple2, 2, "[SC_2012MARRY_TRANSNPC26]" , 0 )
					ScriptMessage(  Couple2,  Couple2, 0, "[SC_2012MARRY_TRANSNPC26]" , 0 )
					return false
				end

			else
				ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_42]" , 0 )	--�e�������T��   �s���P�s�Q�����b�ڪ�����A�~���z�ӽСC
				ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_42]" , 0 )
				ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_42]" , 0 )
				ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_42]" , 0 )	
			end
		end
	end
end