function Test_Mika_weddingCard_NPC1()
	local Player = OwnerID()
	local Count = {1, 5, 10 }

	SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC01]")   --�@�ͥu���@�������B��§�A�˪B�n�ͪ����֬O���i�ίʪ��A�ݭn�ʶR�B§�ܽШ�o�e���n�ͶܡH
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[1].."]","test_Mika_weddingCard_NPC2("..Count[1]..")", 0)  -- �ڭn�ʶR�ܽШ�[$VAR1]�i
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[2].."]","test_Mika_weddingCard_NPC2("..Count[2]..")", 0)  
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[3].."]","test_Mika_weddingCard_NPC2("..Count[3]..")", 0)  

end

function test_Mika_weddingCard_NPC2(count)
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- ����Ѿl�ɶ� 25�����H�W�~�i�A�ʶR �J����O20���� 
--	local limit =300  -- ���եήɶ�
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- �ثe�Ѿl�ɶ�

	local money = 5000
	local pay = count*money

	SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC03][$SETVAR1="..count.."][$SETVAR2="..pay.."]")   --�A����ʶR�ܽШ�[$VAR1]�i�A�`�@�O[$VAR2]���A�T�w�n�ʶR�ܡH
	AddSpeakOption( Player, Player, "[SC_GETTITLE_1]" , "test_Mika_weddingCard_NPC3("..pay..")", 0 )  -- �T�w
end

function test_Mika_weddingCard_NPC3(pay)
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- ����Ѿl�ɶ� 25�����H�W�~�i�A�ʶR �J����O20���� 
--	local limit =300  -- ���եήɶ�
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- �ثe�Ѿl�ɶ�

	local money = 5000
	local count = pay/money  -- �Ӽ�
	local SN = ReadRoleValue(NPC, EM_RoleValue_PID )   --- 1 ~ 9 	say(box, "pid = "..pid )
	local itemid = 241977
	local NeedSpace = count  -- �ݭn�I�]�Ŷ���
	local NeedSpaceStatus  = Check_Bag_Space( Player , NeedSpace  )   -- �ˬd��ƬO�_�� true = �� , false = ����

	CloseSpeak(Player)

	if NeedSpaceStatus == true then  -- �I�]�Ŷ��ƶq��
		if ReadRoleValue( Player , EM_RoleValue_Money ) < pay then  -- �������B����
			ScriptMessage( player, player, 1, "[SC_BUY_MONEY]" , 0 )	-- �A�S�������������I
			ScriptMessage( player, player, 0, "[SC_BUY_MONEY]" , 0 )
		else
			Say(Player, "itemid ="..itemid.." , count = "..count.. ", pay = "..pay )
			AddRoleValue( Player , EM_RoleValue_Money , -(pay) ) 
			for i = 1 , count do -- ���ӭӼƶ]����
				GiveBodyItem(Player, itemid, 1 )
			end
		end
	end
end

function mika_testmsg_0925()
	ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_22]".. "|r" , 0 ) --���A�A�A�A��O[101272]�I�A�~�M�Ѱ��F�L���ʦL�I���M���ѥL�����o�D�`�}�������~�A�����U�A�٬O�]�a�I
	ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_22]".. "|r" , 0 ) --���A�A�A�A��O[101272]�I�A�~�M�Ѱ��F�L���ʦL�I���M���ѥL�����o�D�`�}�������~�A�����U�A�٬O�]�a�I
end
