function LuaYU_111813_00()
--�p���y�R
	LuaN_miyon_action01()
	while true do

		PlayMotion( OwnerID(), 123) 
		sleep(40)

	end
end


--�����s��

function LuaYU_111813_0()

	local Key =  CountBodyItem( OwnerID() , 203477 )  --�S��@��Ĳ�o
	local play =  CheckFlag( OwnerID()  , 542245 ) --���Ѥw�g�ӹL
	local play02 =  CheckFlag( OwnerID()  , 542991 ) --����2  OK�X��


	local UseItem3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem3)
	local Jokname =  CountBodyItem( OwnerID() , 530371 ) --�ٸ�
	local Jokname1 =  CountBodyItem( OwnerID() , 530372 ) --�ٸ�
	local Jokname2 =  CountBodyItem( OwnerID() , 530373 ) --�ٸ�
	local RunTime = 0


	if UseItem3 >= 1 and Jokname == 0 then	
		GiveBodyItem( OwnerID() ,  530371  , 1 ) --�ٸ�.
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_38]"   )--���A�A�A�A��A�u�O�F�`�I�~�M�ӧQ�F�I���x�ѴN�A�ӬD�ԧa�I
--���o�ٸ���ܮ�
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530371]]" )
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				return 0
			end
			while true do
				Sleep( 10 )
				RunTime = RunTime + 1
				if RunTime  > 600 then -- ���L�a�j��A600 = �@����
				--	ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end

				DialogStatus = DialogGetResult( OwnerID() )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
				-- DO nothing
				elseif DialogStatus == 0 then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end
			end
		else		
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530371]]", "0xffffff00" );
			ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530371]]", "0xffffff00" );
		end
			--���o�ٸ���ܮ�(�H�W)

	elseif UseItem3 >= 30 and Jokname1 == 0 then	
		GiveBodyItem( OwnerID() ,  530372  , 1 ) --�ٸ�.
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_40]"   )--���A�A�A�A��A�u�O�F�`�I�~�M�����30��...�A...�u���ܷ|����I�D�Ԫ̡I
		--���o�ٸ���ܮ�
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530372]]" )
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				return 0
			end
			while true do
				Sleep( 10 )
				RunTime = RunTime + 1
				if RunTime  > 600 then -- ���L�a�j��A600 = �@����
				--ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end

				DialogStatus = DialogGetResult( OwnerID() )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
					-- DO nothing
				elseif DialogStatus == 0 then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end
			end
			--���o�ٸ���ܮ�(�H�W)
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530372]]", "0xffffff00" );
			ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530372]]", "0xffffff00" );
		end

	elseif UseItem3 >= 100 and Jokname2 == 0 then	
		GiveBodyItem( OwnerID() ,  530373  , 1 ) --�ٸ�.
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_41]"   )--�o���i��I�A...�A�~�M�����100��...�A...���O�a���a�I�H��A�A�A�A��ӼF�`�F�I
--���o�ٸ���ܮ�
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530373]]" )
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				return 0
			end
			while true do
				Sleep( 10 )
				RunTime = RunTime + 1
				if RunTime  > 600 then -- ���L�a�j��A600 = �@����
				--ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end

				DialogStatus = DialogGetResult( OwnerID() )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
					-- DO nothing
				elseif DialogStatus == 0 then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530373]]", "0xffffff00" );
			ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530373]]", "0xffffff00" );
		end

--���o�ٸ���ܮ�(�H�W)

	elseif Key >= 1 then

		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_00]"   )--���A�A�A�A��ڬO���Ը��R�A�Ӧ۰g�ۥ@�ɪ��g�ۤp���A���A�ǳƤF�̰g�۪��_�I�D�ԡA�ӥB�u�n<CS>30�ӥ����ťN��</CS>�A�N��ѥ[�I�A�A�A�A��A�Ҽ{�M���F�ܡH...�_�I�̡I�H
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_01]" , "LuaYU_111813_0_1", 0 ) --�D�ԥͦs�C��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_02]" , "LuaYU_MalaTina2_01", 0 ) --�D�Թ��_�C��

	elseif ( play == false ) or ( play02 == false ) then
		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_00]"    )--
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_01]" , "LuaYU_111813_0_1", 0 ) --�D�ԥͦs�C��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_02]" , "LuaYU_MalaTina2_01", 0 ) --�D�Թ��_�C��
	elseif ( play == true ) and ( play02 == true ) then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]"   )--���A�A�A�A��O�N�S���ɶܡH�C�H�C�ѥu���@�����|��I���ѦA�ӧa�I
	end


end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- �ͦs�C��
function LuaYU_111813_0_1()

	local Key =  CountBodyItem( OwnerID() , 203477 )  --�S��@��Ĳ�o
	local play =  CheckFlag( OwnerID()  , 542245 ) --���Ѥw�g�ӹL
	local UseItem3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem3)
	local Jokname =  CountBodyItem( OwnerID() , 530371 ) --�ٸ�
	local Jokname1 =  CountBodyItem( OwnerID() , 530372 ) --�ٸ�
	local Jokname2 =  CountBodyItem( OwnerID() , 530373 ) --�ٸ�
	local RunTime = 0


	if Key >= 1 then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_01]"   )--���A�A�A�A��A�O...�_�I�̡H�A�A�A�A��p�G...�A�ۻ{��...�A�O�_�I��...����ڷQ�M�A���ӹC��...�@�ӥi�H��o�@���_�áI...�Ϊ̬O...����@�Ӵc�]�I...�Ϊ̬O...�@�ӧY�N���z�����u�����_�C���I���A�A�A�A��u�n��O<CS>30�ӥ����ťN��</CS>�A�N��ѥ[�A�A�Ҽ{�M���F�ܡH...�_�I�̡I�H
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_111813_1", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_03]" , "LuaYU_111813_2", 0 ) --�˰��Sť��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --�^�W�@��

	elseif  Jokname1 == 1 and play == true then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]"   )--���A�A�A�A��O�N�S���ɶܡH�C�H�C�ѥu���@�����|��I���ѦA�ӧa�I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --�^�W�@��

	elseif  UseItem3 < 30 and play == true then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]".."[SC_111813_YU_39]"..UseItem3   )--���A�A�A�A��O�N�S���ɶܡH�C�H�C�ѥu���@�����|��I���ѦA�ӧa�I..���I��F�I�p�G�A�බ�Q������<CB>�Ҧ����a�j</CB>��<CB>�}�ҩҦ����_�c</CB>�W�L<CS>30</CS>���A�ڱN�ᤩ�A�@�Ӵ��@��઺�Y�ΡI�[�o�a�I�A�{�b�F�������ƬO�G

	elseif play == false then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_01]"   )--���A�A�A�A��A�O...�_�I�̡H�u���O...�_�I�̡H�A�A�A�A��p�G...�A�ۻ{��...�A�O�_�I��...����ڷQ�M�A���ӹC��...�A�A�A�A...�@�ӥi�H��o�@���_�áI...�Ϊ̬O...����@�Ӵc�]�I...�Ϊ̬O...����@�ӧY�N���z�����Ī��C���I���A�A�A�A��Ҽ{�M���I�_�I�����ӭn�����F�_�I�M�w�N�L�k�^�Y��ı����A�A�A�A��A...�Q���ܡH...�_�I�̡I�H
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_111813_1", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_03]" , "LuaYU_111813_2", 0 ) --�˰��Sť��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --�^�W�@��

	end

end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_1()
	local Cash =  CountBodyItem( OwnerID() , 203038 )  --�����ťN��
	local Key =  CountBodyItem( OwnerID() , 203477 )  --�S��@��Ĳ�o

	if Key >= 1 then
		BeginPlot( OwnerID() , "LuaYU_111813_4" , 0 )  
	elseif Cash >= 30 then
		BeginPlot( OwnerID() , "LuaYU_111813_4" , 0 )  
	else
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_36]"   )--�A�S�������������ťN��
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_2()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_05]"   )  --���A�A�A�A��S���Y�A���@�j���]�_�M�öQ�����~�N����L�_�I�̨Ӯ��n�F��A�A�A�A��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_111813_1", 0 ) --�����D��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_06]" , "LuaYU_111813_3", 0 ) --�L�ҿ�
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_3()
	CloseSpeak( OwnerID() )                     
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_4()
	CloseSpeak( OwnerID() )      
	ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) --���A�A�A�A��G�M���_�I�̪��i��r��A�A�A�A�㵥���A�O�|���٬O�|���O�H�ڭ����ΫݷQ�ݨ�F�I�A�A�A�A��I
	ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) --���A�A�A�A��G�M���_�I�̪��i��r��A�A�A�A�㵥���A�O�|���٬O�|���O�H�ڭ����ΫݷQ�ݨ�F�I�A�A�A�A��I
	CastSpell( OwnerID(), OwnerID(), 491272)
	sleep(40)
	SetFlag( OwnerID(), 543270 , 0 ) --���mĲ�o�d��@��  2012. 10.22
	-- 2013.08.30 ���E:�ץ����a��Ĳ�I�@���I�k���Q�d�����p�U�ѥ[���Ը��R - �ͦs�C���A�|�L�k����Ĳ�I�a�j�B�_�c���@�������D�C
	Hao_SetPlot_Touch_Reset(OwnerID())
	--
	BeginPlot( OwnerID() , "LuaYU_111813_5" , 0 )  
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_5()
	if ChangeZone( OwnerID(), 351 , -1 , 2519, 9.2, 2593, 290) then   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		DesignLog(OwnerID(),351," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
	end
end


--�ƥ���

function LuaYu_Mala1_reset01() -- �����d�򤺪��a���p�ɾ�   �ƥ������m����
	SetPlot( OwnerID() ,"range",  "LuaYu_Mala1_reset02" , 40 )  
end

function LuaYu_Mala1_reset02() 
	local OID = OwnerID()   -- player

	-- 2012 �N����@�� ����2757

--	if CheckBuff(OID, 623459 )  == false then
--		if  CheckFlag( OID  , 543270 )  == false then	--���ѲĤ@���i�ƥ�   �Ұʭ��m����C
--
--			lua_mika_2012hallow_delall()  -- �R���Ҧ�����
--			BeginPlot( OwnerID()  , "Lua_Clockending" , 0 )
--			SetFlag( OwnerID()  , 543270 , 1 ) --��������Ĳ�o�d��@��
--			local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--			local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 300 , 1)       --�j��
--			PlayMotion( door[0], 133) 
--			SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--����
--			WriteRoleValue( OwnerID() , EM_RoleValue_Register+8 , 0 )   --���O���A���H�O�_�}���F   �O�G99
--		--	say(OwnerID(), "2")
--		end
--	end

end

-- �ƺ���J ��l��ܼ@��
function LuaYU_111814_0()
	local Key =  CountBodyItem( OwnerID() , 203477 )  --�S��@��Ĳ�o
	local playOK =  CheckFlag( OwnerID()  , 542246 ) --�D�ԨM�w
	local play =  CheckFlag( OwnerID()  , 542245 ) --���Ѥw�g�ӹL
	local Cash =  CountBodyItem( OwnerID() , 203038 )  --�����ťN��

	----- 2012 �n�ʸ` ���԰��αM�� -----------------------------------
	local OID = OwnerID()
	local hallowbuff = CheckBuff(OID, 623459 )  -- �ˬd���a�O�_���U�t�`�S����Buff
	local skillbuff = CheckBuff(OID, 623504)  -- �S��ޯ�BUFF

	if skillbuff == True then
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_35]"   ) --���A�A�A�A����I�i�h�a��i������_�I�̡�C
	elseif hallowbuff == true then
		SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_07]"   ) -- SPVer - ���
		AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_08]" , "lua_mika_2012hallow_choc_01", 0 ) -- �W�h����   
		AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_09]" , "lua_mika_2012hallow_choc_02", 0 ) -- �ǳƧ��� 
	else
	----------------------------------------------------------------
		if Key >= 1 then
			SetSpeakDetail( OwnerID(), "[SC_111813_YU_07]"   ) --���A�A�A�A��_�I�̡��w��Ө�...���Ը��R��...�ͦs�C�������A�A�A�A��C
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_111814_1", 0 ) --�W�h����
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_09]" , "LuaYU_111814_2", 0 ) --�ǳƧ���
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --�ڭn���}
		elseif playOK == true then
			SetSpeakDetail( OwnerID(), "[SC_111813_YU_35]"   ) --���A�A�A�A����I�i�h�a��i������_�I�̡�C
		elseif Cash >= 30 then
			SetSpeakDetail( OwnerID(), "[SC_111813_YU_07]"   ) --���A�A�A�A��_�I�̡��w��Ө�...���Ը��R��...�ͦs�C�������A�A�A�A��C
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_111814_1", 0 ) --�W�h����
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_09]" , "LuaYU_111814_2", 0 ) --�ǳƧ���
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --�ڭn���}
		else
			SetSpeakDetail( OwnerID(), "[SC_111813_YU_36]"   )--�A�S�������������ťN��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --�ڭn���}
		end
	end


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_1()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_10_1]" ..  "[SC_111813_YU_10_2]"    )  --���A�A�A�A��b�o�D�j���᭱���@�ӯ��ǡA���������a�j�̮I�äF�\�\�h�h����ߡI���]�\�O�@����]�I�]�\�O�D�`�}�������~�I��...�]�i��O���ݪ��c�]�I�Ϊ̬O...�¤O��H�����u�I���I�A�u��15�������������ɶ��h�ոէA���_�I�B��I���A�A�A�A��I��F�A��󯦫Ǫ����������@���]���A�C�j3�����A�L�|����޲��������X���I�J�̡A�A�A�A�A��A�i�n�p�ߧr���٦�...���Ǫ��|�Ө��������]�k�}�A�i�H�ѧA�k«�Ρ�A�A�A�A�㯬�A�n�B�r�I
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_11]" , "LuaYU_111814_3", 0 ) --��L��ĳ
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_09]" , "LuaYU_111814_2", 0 ) --�ǳƧ��� 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --�ڭn���}
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_2()  --�}�Ҥj�����u�å���* --Owner ���a
	CloseSpeak( OwnerID() )  
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	local play =  CheckFlag( OwnerID()  , 542245 ) --���Ѥw�g�ӹL

--	lua_mika_2012hallow_delall2()        -- 2012. 10. 19 �[�J�R���n�ʸ`���ιC������  

	ScriptMessage( TargetID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_14]".. "|r" , 0 ) --���A�A�A�A�㨺��N�}�l�a...���Ը��R��...�ͦs�C�������A�A�A�A��C
	ScriptMessage( TargetID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_14]".. "|r" , 0 ) 

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  )  
	WriteRoleValue( TargetID() , EM_RoleValue_PID , PlayerLV )   
	WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )   
	SetFlag( OwnerID()  , 542245 , 1 ) -- ���n���~
	SetFlag( OwnerID()  , 542246 , 1 ) -- ���n���~�D�ԨM�w
	DelBodyItem( OwnerID() , 203038 , 30 )
	BeginPlot( TargetID() , "LuaYU_111814_2_1" , 0 )       --��NPC����

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_4()  --�}�Ҥj��NO�u�å���* --Owner ���a
	local goods =  CountBodyItem( OwnerID() , 201141 )  --201141
	local play =  CheckFlag( OwnerID()  , 542245 ) --���Ѥw�g�ӹL

	if goods > 0 then
		CloseSpeak( OwnerID() )      
		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
		local door = LuaFunc_SearchNPCbyOrgID( TargetID() , 101473, 100 , 1)       --�j��

		DelBodyItem( OwnerID() , 201141 , 1 )
		Say( TargetID() , "[SC_111813_YU_32]"   )  --���A�A�A�A��o�ӴN�O<CN>[201141]</CN>�r��A�ӳܬݬݦn�F�����A�A�A�A��
		AddBuff( OwnerID() ,501389 ,1 ,7200 ); --�ܱ�ū        

--		lua_mika_2012hallow_delall2()        -- 2012. 10. 19 �[�J�R���n�ʸ`���ιC������  

		ScriptMessage( TargetID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_14]".. "|r" , 0 ) --���A�A�A�A�㨺��N�}�l�a...���Ը��R��...�ͦs�C�������A�A�A�A��C
		ScriptMessage( TargetID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_14]".. "|r" , 0 )

		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  )  
		WriteRoleValue( TargetID() , EM_RoleValue_PID , PlayerLV )   
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )   
		SetFlag( OwnerID()  , 542245 , 1 ) -- ���n���~
		SetFlag( OwnerID()  , 542246 , 1 ) -- ���n���~�D�ԨM�w
		DelBodyItem( OwnerID() , 203038 , 30 )
		BeginPlot( TargetID() , "LuaYU_111814_4_1" , 0 )        --��NPC����
	else

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_28]"   )  --���A�A�A�A��n�i���r�A�ݨӧA���W�S��[201141]�O��I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_27]" , "LuaYU_111814_2", 0 ) --�����D�� 
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_2_1()  --�}�Ҥj�����u��*

  	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  	
  	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 100 , 1)       --�j��

	local Jok = CreateObjByFlag( 113105, 780235, 21 , 1 );  --�ƺ���J

	SetModeEx( Jok  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Jok  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Jok , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Jok  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Jok   , EM_SetModeType_Move, false )--����
	SetModeEx( Jok  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Jok   , EM_SetModeType_HideName, true )--�W��
	SetModeEx( Jok , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Jok , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Jok  , EM_SetModeType_Show , false ) --�����
	AddToPartition( Jok, RoomID) 
	
	Hide(Jok)
	Show(Jok, RoomID)

	SetFightMode(  Jok , 0, 0, 0, 0 )

	BeginPlot( Jok , "LuaYU_111814_5" , 0 )       --�˼ƭp��
	
 	local staff = CreateObjByFlag( 101472, 780235, 0 , 1 );  --�]��

	SetModeEx( staff    , EM_SetModeType_Mark, false )--�аO
	SetModeEx( staff    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( staff   , EM_SetModeType_ShowRoleHead, false )--�Y����
	AddToPartition( staff, RoomID) 
	SetFightMode(  staff , 0, 0, 0, 0 )

	WriteRoleValue( staff , EM_RoleValue_PID , PlayerLV )   
	WriteRoleValue( staff , EM_RoleValue_Register , Jok )   
	WriteRoleValue( staff , EM_RoleValue_Register+1 , PlayerID )   

	BeginPlot( staff , "LuaYU_101489_0" , 0 )       --�ͥX�a�O
	BeginPlot( staff , "LuaYU_101489_1" , 0 )       --�ͥX�u��
	BeginPlot( staff , "LuaYU_111815_end" , 0 )       --��NPC����

	PlayMotion( door[0], 145) 
	sleep(10)
	SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--����
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_3()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_12]"   )  --���A�A�A�A��ڦ��Ӵ�ĳ�A�@�����A�h�����I�ɶ�����ĳ��A�A�A�A��u�n�A���ڤ@��[201141]�ڴN���A�⯦�ǩP��o�H���u�í̺M���A�Aı�o���ˡH�A�A�A�A��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_13]" , "LuaYU_111814_4", 0 ) --�F����ĳ
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_27]" , "LuaYU_111814_2", 0 ) --�����D�� 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --�ڭn���}
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_4_1() --�}�Ҥj���S���u��*

  		local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 100 , 1)       --�j��


	 	local Jok = CreateObjByFlag( 113105, 780235, 21 , 1 );  --�ƺ���J

		SetModeEx( Jok  , EM_SetModeType_Strikback, false )--����
		SetModeEx( Jok  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Jok , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Jok  , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Jok   , EM_SetModeType_Move, false )--����
		SetModeEx( Jok  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Jok   , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Jok , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Jok , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Jok  , EM_SetModeType_Show , false ) --�����
		AddToPartition( Jok, RoomID) 

		Hide(Jok)
		Show(Jok, RoomID)

		SetFightMode(  Jok , 0, 0, 0, 0 )
		BeginPlot( Jok , "LuaYU_111814_5" , 0 )       --�˼ƭp��

		local staff = CreateObjByFlag( 101472, 780235, 0 , 1 );  --�]��

		SetModeEx( staff    , EM_SetModeType_Mark, false )--�аO
		SetModeEx( staff    , EM_SetModeType_HideName, true )--�W��
		SetModeEx( staff   , EM_SetModeType_ShowRoleHead, false )--�Y����
		AddToPartition( staff, RoomID) 
		SetFightMode(  staff , 0, 0, 0, 0 )

		WriteRoleValue( staff , EM_RoleValue_PID , PlayerLV )   
		WriteRoleValue( staff , EM_RoleValue_Register , Jok )   
		WriteRoleValue( staff , EM_RoleValue_Register+1 , PlayerID )   

		BeginPlot( staff , "LuaYU_101489_0" , 0 )       --�ͥX�a�O
		BeginPlot( staff , "LuaYU_111815_end" , 0 )       --��NPC����

		PlayMotion( door[0], 145) 
		sleep(10)
		SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--����
end

--  �����@��

function LuaYU_111814_5()
                SetPlot( OwnerID(),"range", "LuaYU_111814_6" , 100 )                                      --�]�w�@��
end

function LuaYU_111814_6()
	--OwnerID() ���a
	--TargetID() NPC

	SetPlot( TargetID(),"range","",100 )    
	WriteRoleValue( TargetID() , EM_RoleValue_PID , OwnerID() )   -- �N���a�g�JNPC ��PID
	BeginPlot( TargetID() , "LuaYU_111814_7" , 0 )
end

function LuaYU_111814_7()
--OwnerID() NPC

	local PlayerID = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 300 , 1)       --�j��

	PlayMotion( door[0], 147) 
	sleep(10)
	SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--����
	Hide( door[0] )
	Show( door[0] ,RoomID)

	AddBuff( PlayerID ,503693 ,1 , 1 ); --�ǰe�S��
	SetPosByFlag( PlayerID , 780235 , 21 )--�ǰe�� X ���X�l

	ScriptMessage( OwnerID()  , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_15]".. "|r" , 0 ) --�[�o�o��_�I�̡㭭��15������}�l�I�A�A�A�A��

	ClockOpen( PlayerID ,EM_ClockCheckValue_2,600,600,0,"Lua_Clockending","Lua_Clockending")  -- �}�l�p�ɾ�

	sleep(5990)
	local Pass = ReadRoleValue( PlayerID , EM_RoleValue_Register+8  )  --�O�_�}���A�O�h�Ȭ� 99
	-- 2013.08.30 ���E:�ץ����a�󺿩Ը��R-�ͦs�C���ɡA�b�C���ɶ������S�٦b����Ĳ�I�@���I�k�������p�U�Q�ǥX�C����A�|�L�k�����LĲ�I�@�������D�C
	Hao_SetPlot_Touch_Reset( PlayerID)
	--
	if Pass ~= 99 then
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) --���A�A�A�A��ɶ���X�h�a�I
		sleep(10)

		ChangeZone( PlayerID , 2 , 0 , 4871.9, 104.9, -1885.2, 92 )

		local TIMEMAN = CreateObjByFlag( 100044, 780235, 0 , 1 );  --��������
		AddToPartition( TIMEMAN, RoomID) 
	--	BeginPlot( TIMEMAN , "lua_mika_2012hallow_delall2" , 0 )       --���m

	end

end

--�|�Ӫv¡�y
function LuaYU_111815_1_1()
	SetPlot( OwnerID(),"range", "LuaYU_111815_1_2" , 10 )       
end

function LuaYU_111815_1_2()
	BeginPlot( TargetID() , "LuaYU_111815_1_3" , 0 )     
end

function LuaYU_111815_1_3()
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	ChangeZone( TargetID(), 351 , RoomID , 2392.6, 9.2, 2923.8, 339)

end

---------------------------------------------------------------------------
function LuaYU_111815_2_1()
	SetPlot( OwnerID(),"range", "LuaYU_111815_2_2" , 30 )         -- 6.0.1 Range 10�令30 
end

function LuaYU_111815_2_2()
	CastSpell( TargetID() ,  TargetID() , 492498 )	--�v¡
	sleep(50)
	BeginPlot( TargetID() , "LuaYU_111815_2_3" , 0 )
end

function LuaYU_111815_2_3()
	CastSpell( TargetID() ,  TargetID() , 492498 )	--�v¡
	sleep(50)
	BeginPlot( OwnerID() , "LuaYU_111815_2_2" , 0 )
end

---------------------------------------------------------------------------

function LuaYU_111815_3_1()
                SetPlot( OwnerID(),"range", "LuaYU_111815_3_2" , 30 )       
end

function LuaYU_111815_3_2()
	BeginPlot( TargetID() , "LuaYU_111815_3_3" , 0 )     
end

function LuaYU_111815_3_3()
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	ChangeZone( TargetID(), 351 , RoomID , 2656.4, 9.2, 2826.1, 248)
end

--------------------------------------------------------------------------------
function LuaYU_111815_4_1()
                SetPlot( OwnerID(),"range", "LuaYU_111815_4_2" , 30 )       
end

function LuaYU_111815_4_2()
	CastSpell( TargetID() ,  TargetID() , 492498 )	--�v¡
	sleep(50)
	BeginPlot( TargetID() , "LuaYU_111815_4_3" , 0 ) 
end

function LuaYU_111815_4_3()
	CastSpell( TargetID() ,  TargetID() , 492498 )	--�v¡
	sleep(50)
	BeginPlot( OwnerID() , "LuaYU_111815_4_2" , 0 )
end
---------------------------------------------------------------------------------


--�p�G��������
function LuaYU_111815_end()
  	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  )
	local Room = ReadRoleValue( PlayerID , EM_RoleValue_RoomID )

  	local Opeana = 0
  	local Opeanb = 0
  	local Opeanc = 0
  	local Opeand = 0
  	local Opeane = 0
  	local Opeanf = 0
  	local Opean = 0

	while true do
		sleep(10)

		local floor1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111811, 300 , 1)       --�a�j1
		local floor2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111812, 300 , 1)       --�a�j2
		local CashBox = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111956, 300 , 1)       --�_�c

		Opeana = 0
		Opeanb = 0
		Opeanc = 0
		Opeand = 0
		Opeane = 0
		Opeanf = 0

		for i=0, table.getn(floor1) do

			Opeana = ReadRoleValue( floor1[i] , EM_RoleValue_Register )  
			Opeanb = Opeanb + Opeana


		end

		for g=0, table.getn(floor2) do

			Opeand = ReadRoleValue( floor2[g] , EM_RoleValue_Register )  
			Opeanc = Opeanc + Opeand

		end

		for n=0, table.getn(CashBox) do

			Opeane = ReadRoleValue( CashBox[n] , EM_RoleValue_Register )  
			Opeanf = Opeanf + Opeane

		end

--		sleep(50)

		Opean = Opeanb + Opeanc + Opeanf

--		Say(  OwnerID() ,Opean )
--		Say(  TargetID() ,Opean )

		if Opean == 36 then
-------------------------------------------------2011.05.31 �s�W�����Ŷꨩ���y-------------------------------------------------
-------------------------------------------------2013.03.13 �N�����Ŷꨩ�Ѫ��~�ܧ󬰨��������-------------------------------------------------
			local EndBonus = 30	-- ���������������Ŷꨩ�ƶq
			local PlayerLv = ReadRoleValue( PlayerID , EM_RoleValue_LV )
			if PlayerLv >= 50 then
				Hao_Monetary_Union_240181( PlayerID , EndBonus )
			end
---------------------------------------------------------------------------------------------------------------------------------
			ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_37]".. "|r" , 0 ) --���A�A�A�A��u�O�F�`�r�I�~�M����������}�F�I�ҿױj�̴N�O�p���a�I�A���F�I
			ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_37]".. "|r" , 0 ) --
			AddRoleValue( PlayerID , EM_LuaValueFlag_UseItem3 , 1 )
			GiveBodyItem( PlayerID , 203487 , 1 )--�]���_����q1�I
			WriteRoleValue( PlayerID , EM_RoleValue_Register+8 , 99 )   --���O���A���H�}���F
-------------------------------------------------2011.08.22 �s�W�ٸ������P�_-----------------------------------------------
			local UseItem3 = ReadRoleValue( PlayerID , EM_LuaValueFlag_UseItem3 )
			local TitleKey = CountBodyItem( PlayerID , 530086 )
			if UseItem3 >= 150 and TitleKey < 1 then
				DebugMsg( PlayerID , Room , " UseItem3 = "..UseItem3.." , TitleKey = "..TitleKey.." , Get new title")
				GiveBodyItem( PlayerID , 530086 , 1 )
			else
				DebugMsg( PlayerID , Room , "You already have the title.")
			end
---------------------------------------------------------------------------------------------------------------------------------
			sleep(50)
			BeginPlot(  PlayerID  , "LuaYU_111815_end2" , 0 )  
			break

		end
	end
end

function LuaYU_111815_end2()
	BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )  
	ChangeZone( OwnerID() , 2 , 0 , 4871.9, 104.9, -1885.2, 92)
end

function LuaYU_111815_leave()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_43]"   )  --�A�u���T�w�n���}�H���n�a�H�H���w��A�A�ӬD�ԡI�A�A�A�A��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GETTITLE_1]" , "LuaYU_111815_leaveOK", 0 ) --�T�w
end

function LuaYU_111815_leaveOK()
	CloseSpeak( OwnerID() )
	ChangeZone( OwnerID() , 2 , 0 , 4871.9, 104.9, -1885.2, 92)
end

function Lua_Hao_Test_UseItem3(Num)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Count = ReadRoleValue( Player , EM_LuaValueFlag_UseItem3 )
	WriteRoleValue( Player , EM_LuaValueFlag_UseItem3 , Num )
	local NewCount = ReadRoleValue( Player , EM_LuaValueFlag_UseItem3 )
	DebugMsg( Player , Room , " Count = "..Count.." NewCount = "..NewCount )
	DelBodyItem( Player , 530086 , 1 )
end