--701618 �a�ϤWNPC

Function Lua_mika_losttreasure_z2npc() --z2NPC
	local tran1 =  CheckFlag( OwnerID() , 543572 )
	LoadQuestOption( OwnerID() )  --Ū������
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_26]"   ) -- �١A�_�I�̡I�A��I�æb�j�N��񪺯��_������ܡH
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_01]" , "Lua_mika_losttreasure_z2npc1", 0 ) --����j�N���_���
	if tran1 == true then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_27]" , "Lua_mika_losttreasure_Z10tran", 0 ) --�ڭn�e��[ZONE_SASCILIA STEPPES][ZONE_SCAR OF DESPAIR]����a
	end
end

Function Lua_mika_losttreasure_gotran() --�����i�ݨ��ǰe�ﶵ���X��  ���b���U���ȫ�
	SetFlag(TargetID(),543572 , 1) 
end

Function Lua_mika_losttreasure_z2npc1() --����j�N���_���
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_05]"   ) -- �I�����e
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "Lua_mika_losttreasure_z2npc2", 0 ) --�W�h����
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_z2npc", 0 )--�^�W�@��
end

Function Lua_mika_losttreasure_z2npc2() --�W�h����
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_06]"   ) -- �W�h�������e
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_z2npc1", 0 )--�^�W�@��
end

function Lua_mika_losttreasure_Z10tran()
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_55]" ) -- �A�T�w�n�e��[ZONE_SCAR OF DESPAIR]����a�H�H�⤣�����t�G�A�@�ѥu�ണ�Ѥ@�������A�ȡA�ХJ�ӦҼ{�C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]"  , "Lua_mika_losttreasure_Z10tran1", 0 ) --�T�w
end

function Lua_mika_losttreasure_Z10tran1()
	local tran =  CheckFlag( OwnerID() , 543490 )
	if tran == false then
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_29]" ,C_SYSTEM  )--�A���۰����e��[ZONE_SCAR OF DESPAIR]����a�C
		ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_29]" ,C_SYSTEM  )
		SetFlag(OwnerID(),543490 , 1) --�w�ϥιL�ǰe
		Sleep(20)
		ChangeZone( OwnerID(), 10 , -1 , -35785.7, 147.5, 5438.2, 213)   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	else
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_28]" ) --�]���H�⤣���A�@�ѥu�ണ�ѧA�@�������A�ȡA�p�G���ݭn�Цۤv�e���C 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_z2npc", 0 )--�^�W�@��
	end
end
--------------------------------------------------------------------------------------------
Function Lua_mika_losttreasure_test01() --�[1
	AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 1 )   --�ٸ��O��
	local passtime = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem5  )   --�ٸ��ֿn����
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--�ثe�D�Ԧ��\���ơG[$VAR1] �C
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_test02()  --�k�s
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 0 )   --�ٸ��O��
	local passtime = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem5  )   --�ٸ��ֿn����
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--�ثe�D�Ԧ��\���ơG[$VAR1] �C
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_test03()  --���Ƭ�50
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 50 )   --�ٸ��O��
	local passtime = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem5  )   --�ٸ��ֿn����
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--�ثe�D�Ԧ��\���ơG[$VAR1] �C
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_test04()  --���Ƭ�100
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 100 )   --�ٸ��O��
	local passtime = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem5  )   --�ٸ��ֿn����
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--�ثe�D�Ԧ��\���ơG[$VAR1] �C
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_test05()  --�R�Ҧ��ٸ�
	DelBodyItem( OwnerID() ,  530385  , 1 ) --�ٸ�1
	DelBodyItem( OwnerID() ,  530386  , 1 ) --�ٸ�2
	DelBodyItem( OwnerID() ,  530387  , 1 ) --�ٸ�3
	DelBodyItem( OwnerID() ,  530388  , 1 ) --�ٸ�4
	DelBodyItem( OwnerID() ,  530391  , 1 ) --�ٸ�5
	Say(OwnerID(),"title is deleted.")
end

------------------------------------------------------------------------------------------------------------------------
Function Lua_mika_losttreasure_NPC0() --�~��NPC
	local UseItem5 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5)
	local rewardtitle1 =  CountBodyItem( OwnerID() , 530385 ) --�ٸ�1
	local rewardtitle2 =  CountBodyItem( OwnerID() , 530386 ) --�ٸ�2
	local rewardtitle3 =  CountBodyItem( OwnerID() , 530387 ) --�ٸ�3
	local rewardtitle4 =  CountBodyItem( OwnerID() , 530388 ) --�ٸ�4
	if UseItem5 >= 1 and rewardtitle1 == 0 then
		GiveBodyItem( OwnerID() ,  530385  , 1 ) --�ٸ�1
	elseif UseItem5 >= 10 and rewardtitle2 == 0 then
		GiveBodyItem( OwnerID() ,  530386  , 1 ) --�ٸ�2
	elseif UseItem5 >= 50 and rewardtitle3 == 0 then
		GiveBodyItem( OwnerID() ,  530387  , 1 ) --�ٸ�3
	elseif UseItem5 >= 100 and rewardtitle4 == 0 then
		GiveBodyItem( OwnerID() ,  530388  , 1 ) --�ٸ�4
	end
	LoadQuestOption( OwnerID() )  --Ū������
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_00]"   ) -- �n�O���Q��F�R�A�ƥ����ǳƬO�ܭ��n���A����o�I�A�ڧƱ�A��O��C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_01]" , "Lua_mika_losttreasure_NPC1", 0 ) --����j�N���_���
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_04]" , "Lua_mika_losttreasure_NPC4", 0 ) --�I�����y
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_21]" , "Lua_mika_losttreasure_NPC5", 0 ) -- �ڷQ���D�ثe���\�D�Ԫ�����
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_03]" , "Lua_mika_losttreasure_NPC3", 0 ) --�ڷQ�D��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_SOUND_IC_04]" , "Lua_mika_losttreasure_NPC6", 0 ) --�ڷQ�^��Z��R����

end

function Lua_mika_losttreasure_NPC6()
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_54]" ) -- �A�T�w�n�^��[SC_ZONE_VANCITY]�H�H�⤣�����t�G�A�@�ѥu�ണ�Ѥ@�������A�ȡA�ХJ�ӦҼ{�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_08]"  , "Lua_mika_losttreasure_NPC61", 0 ) --�T�w
end

function Lua_mika_losttreasure_NPC61()
	local todayBack = CheckFlag(OwnerID(), 548092 )  -- ���Ѥw�ϥιL�ǰe(Z10��Z2)
	if todayBack == false then
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_53]" , C_SYSTEM  )--�A���۰����^��Z��R�����C
		ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_53]" , C_SYSTEM  )
		SetFlag(OwnerID(),548092 , 1) --���Ѥw�ϥιL�ǰe(Z10��Z2)
		Sleep(5) 
		ChangeZone( OwnerID(), 10 , 0 , 5275 , 103 , -2230, 0 )  -- �Z��R���������s���y��
	else
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_28]" ) --�]���H�⤣���A�@�ѥu�ണ�ѧA�@�������A�ȡA�p�G���ݭn�Цۤv�e���C 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC0", 0 )--�^�W�@��
	end
end

Function Lua_mika_losttreasure_NPC1() --����j�N���_���
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_05]"   ) -- �I�����e
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "Lua_mika_losttreasure_NPC2", 0 ) --�W�h����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC0", 0 )--�^�W�@��
end

Function Lua_mika_losttreasure_NPC2() --�W�h����
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_06]"   ) -- �W�h�������e
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC1", 0 )--�^�W�@��
end

Function Lua_mika_losttreasure_NPC4() --�I�����y
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_37]"   ) -- �A�n�A�_�I�̡A���I�i�檺���p�ٶ��Q�ܡH
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_50]" , "Lua_mika_losttreasure_changes", 0 ) --�����S��I��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_38]" , "Lua_mika_losttreasure_change0", 0 ) --�@��I������
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_31]" , "Lua_mika_losttreasure_change1", 0 ) --�I���U��ײz��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_32]" , "Lua_mika_losttreasure_change2", 0 ) --�I���R�B���l�ĪG�d
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_33]" , "Lua_mika_losttreasure_change3", 0 ) --�I���j���_�c
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_34]" , "Lua_mika_losttreasure_change4", 0 ) --�I���B�A�_�c
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_36]" , "Lua_mika_losttreasure_change6", 0 ) --�I���I�]�Ŷ�����Ѩ�
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_35]" , "Lua_mika_losttreasure_change51", 0 ) --�I���j�N���_���լd����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC0", 0 )--�^�W�@��
end

Function Lua_mika_losttreasure_changes() --�����S��I��
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_51]"   ) -- �����S��I��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_52]" , "Lua_mika_losttreasure_changess", 0 ) --�ڭn�I��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
end

Function Lua_mika_losttreasure_changess() --�����S��I�����~
	local coin = CountBodyItem(OwnerID(), 206423) --���ҹ����
	local title = CountBodyItem(OwnerID(), 530391) --�ٸ�- ���ҹ���^��
	if coin >= 30 then 
		if title == 1 then --���ٸ�
			SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_34]"   )   --�A�w�g���o�Ӻٸ��o�I
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
		else  --�٨S���ٸ�
			GiveBodyItem(OwnerID(), 530391 ,1)
			DelBodyItem(OwnerID(), 206423, 30)
			SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_30]"   ) -- �P�§A��ڭ̪����U�A��s�i�פ~�o�H���Q�i��A�o�Ӻٸ���A�A�K�����L�F�I
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- �A�ҫ������~�ƶq�����C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	end
end

Function Lua_mika_losttreasure_change0() --�@��I������
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_39]"   ) -- ���󤺮e
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
end

Function Lua_mika_losttreasure_change1() --�I���U��ײz��   1
	local coin = CountBodyItem(OwnerID(), 206423) --���ҹ����
	if coin >= 1 then 
		GiveBodyItem(OwnerID(), 201967, 1)
		DelBodyItem(OwnerID(), 206423, 1)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- ���U�a�A�Ʊ楦��b�A���_�I�ȵ{�������U�O�C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- �A�ҫ������~�ƶq�����C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	end
end

Function Lua_mika_losttreasure_change2() --�I���R�B���l�ĪG�dX3
	local coin = CountBodyItem(OwnerID(), 206423) --���ҹ����
	if coin >= 3 then 
		GiveBodyItem(OwnerID(), 206425, 3)
		DelBodyItem(OwnerID(), 206423, 3)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- ���U�a�A�Ʊ楦��b�A���_�I�ȵ{�������U�O�C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- �A�ҫ������~�ƶq�����C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	end
end

Function Lua_mika_losttreasure_change3() --�j���_�c  3
	local coin = CountBodyItem(OwnerID(), 206423) --���ҹ����
	if coin >= 3 then 
		GiveBodyItem(OwnerID(), 206428, 1)
		DelBodyItem(OwnerID(), 206423, 3)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- ���U�a�A�Ʊ楦��b�A���_�I�ȵ{�������U�O�C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- �A�ҫ������~�ƶq�����C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	end
end

Function Lua_mika_losttreasure_change4() --�B�A�_�c 5
	local coin = CountBodyItem(OwnerID(), 206423) --���ҹ����
	if coin >= 5 then 
		GiveBodyItem(OwnerID(), 206429, 1)
		DelBodyItem(OwnerID(), 206423, 5)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- ���U�a�A�Ʊ楦��b�A���_�I�ȵ{�������U�O�C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- �A�ҫ������~�ƶq�����C
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	end
end

--Function Lua_mika_losttreasure_change5() --�I���j�N���_���լd����
--	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_47]"   ) -- �A�Q�Τ���ӧI���H
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_41]"  , "Lua_mika_losttreasure_change51", 0 )--��7��[206423]�洫[206426]
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_42]"  , "Lua_mika_losttreasure_change52", 0 )--��1��[202903]�洫[206426]
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
--end

Function Lua_mika_losttreasure_change51() --�I���j�N���_���լd����1
	local coin = CountBodyItem(OwnerID(), 206423) --���ҹ����
	if coin >= 7 then 
		GiveBodyItem(OwnerID(), 206426, 1)
		DelBodyItem(OwnerID(), 206423, 7)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- ���U�a�A�Ʊ楦��b�A���_�I�ȵ{�������U�O�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- �A�ҫ������~�ƶq�����C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	end
end


Function Lua_mika_losttreasure_change6() --�I�]�Ŷ�����Ѩ�
	local coin = CountBodyItem(OwnerID(), 206423) --�I�]�Ŷ�����Ѩ�
	if coin >= 5 then 
		GiveBodyItem(OwnerID(), 206431, 1)
		DelBodyItem(OwnerID(), 206423, 5)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- ���U�a�A�Ʊ楦��b�A���_�I�ȵ{�������U�O�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- �A�ҫ������~�ƶq�����C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--�^�W�@��
	end
end

function Lua_mika_losttreasure_NPC5() --�ڷQ���D�ثe���\�D�Ԫ�����
	CloseSpeak( OwnerID() )    
	local passtime = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5  )   --�ٸ��ֿn����
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--�ثe�D�Ԧ��\���Ƭ��G[$VAR1] ��
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_NPC3() --�ڷQ�D��
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) --Ū�����a���D¾����
	if PlayerLV <= 20  then
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_LV]"   ) -- �̭����]����A�ӻ����G�ӦM�I�F�A�A�h�i�m�@�}�l�A�ӬD�ԧa�C
	else
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_07]"   ) -- �Y�T�w�D�ԧڱN�|���A�}���r���U���j���A�A�T�w�n�D�ԶܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "Lua_mika_losttreasure_NPC_sure", 0 ) --�T�w
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC0", 0 )--�^�W�@��
	end
end

Function Lua_mika_losttreasure_NPC_sure() --�ڽT�w
	local todayjoin  =  CheckFlag( OwnerID()  , 543406 )--���Ѥw�D�ԹL
	if todayjoin == true then  --�w�T�w�D��		
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_09]"   ) -- �A���Ѥw�g�D�ԹL�F�A�Щ��ѦA�ӬD�ԡC
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC3", 0 )--�^�W�@��
	else
		CloseSpeak( OwnerID() )    
		if CountBodyItem( OwnerID(), 203038 ) >= 30 then                            --�����ťN��
			BeginPlot( OwnerID() , "Lua_mika_losttreasure_NPC_enter" , 0 )  
		else
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��  (  *  �@�Φr��   )
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��
		end
	end
end


Function Lua_mika_losttreasure_NPC_enter()  --�i�J�@�� ok
	SetFlag(OwnerID(),543491 , 0) -- �i�J�S�w��1~6
	SetFlag(OwnerID(),543492 , 0)
	SetFlag(OwnerID(),543493 , 0)
	SetFlag(OwnerID(),543494 , 0)
	SetFlag(OwnerID(),543495 , 0)
	SetFlag(OwnerID(),543496 , 0)
	SetFlag(OwnerID(),543487 , 0) --�}����x123
	SetFlag(OwnerID(),543488 , 0)
	SetFlag(OwnerID(),543489 , 0)
	SetFlag(OwnerID(),543573 , 0 ) -- �R �j�N���_�i�椤

	ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_10]" ,0  )--���A�n�B�I
	ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_10]" ,0  )--���A�n�B�I
	local RANDOWN = rand(5)   --0~5
	if RANDOWN == 0 then  -- 1
		SetFlag(OwnerID(),543491 , 1)
--		Say(OwnerID(), "1" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 4271.2, 34.3, 4086.4, 141.2)   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	elseif RANDOWN == 1 then  -- 2
		SetFlag(OwnerID(),543492 , 1)
--		Say(OwnerID(), "2" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 4261.8, 34.3, 3592.3, 220.2)   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	elseif RANDOWN == 2 then  -- 3
		SetFlag(OwnerID(),543493 , 1)
--		Say(OwnerID(), "3" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 3835.3, 34.3, 4327.7, 82.4)   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	elseif RANDOWN == 3 then  -- 4
		SetFlag(OwnerID(),543494 , 1)
--		Say(OwnerID(), "4" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 3847.8, 34.3, 3347.8, 272.0 )   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	elseif RANDOWN == 4 then  -- 5

		SetFlag(OwnerID(),543495 , 1)
--		Say(OwnerID(), "5" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 3416.4, 34.3, 4079.7, 26.2)   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	elseif RANDOWN == 5 then  -- 6
		SetFlag(OwnerID(),543496 , 1)
--		Say(OwnerID(), "6" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 3423.4, 34.3, 3591.3, 325.6)   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	end
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
	local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
	DesignLog(OwnerID(),355," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
end