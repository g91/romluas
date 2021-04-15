--�ش�NPC 
function LuaN_mika_plant_0() -- �شӪ�lNPC
	local ok = CheckFlag( OwnerID(), 542886 )  -- �ˬd�O�_�w���شӾǮ{���
	local quest_new = CheckFlag( OwnerID(), 543320 )  -- �ˬd�O�_�w�L�شӷs�����
	local alreadyaccept = CheckFlag( OwnerID(), 542890 )  -- �ˬd�O�_�w���L�Ĥ@���شӥ���

	if alreadyaccept == false then
		if quest_new == true then --�w�g�L�شӷs�����
			SetSpeakDetail(OwnerID(), "[SC_PLANT_02]" ) --�̪���شӦ��S����o������F�r�H�p�G��������D�w���H�ɨӧ�ڳ�C(��)
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_01]", "LuaN_mika_plant_start", 0) --�ڭn�p��}�l�شӡH
		else
			if ok == true then --�i���شӷs����Ȫ��A
				LoadQuestOption( OwnerID() )
				AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_01]", "LuaN_mika_plant_start", 0) --�ڭn�p��}�l�شӡH
			elseif ok == false then
				SetSpeakDetail( OwnerID(), "[SC_PLANT_07]" )  --�Q���A���p�ΥR����N�ܡH(��)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_08]", "LuaN_mika_plant_get", 0 ) --�ǲߺشӧޯ� 
			end
		end
	else
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_37]", "Lua_Hao_MagicSeed_change", 0) --�ڸӦp�󭫽ƨ��o�]�ۺؤl?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_01]", "LuaN_mika_plant_start", 0) --�ڭn�p��}�l�شӡH
		LoadQuestOption( OwnerID() )
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_04]" , "LuaN_plantShop_1", 0 )  -- �ʶR�شӪ��~ 
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_newclear() --��quest detail �������ȫ����
	SetFlag( TargetID(), 543320, 1 )	 -- <�������n���~-�w�L�شӷs�����>	
--	SetFlag( OwnerID(), 543320, 1 )	 -- <�������n���~-�w�L�شӷs�����>	
	SetFlag( TargetID(), 542890 , 0 ) 
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_plantnpc2_0() -- �� npc2
	local quest_20 = CheckFlag( OwnerID(), 542887 )  -- �ˬd�O�_�w���o�شӤu�K���
	local already = Checkflag( OwnerID() , 542896 )  -- �ˬd�O�_�w���u�K����

	if  already == false then	
		if quest_20 == true then --�w�g�L�ش�20����
			SetSpeakDetail( OwnerID(), "[SC_PLANT_17]" )  --���ѷQ���պشӫ��˪��Ӫ��O�H
			LoadQuestOption( OwnerID() )
		else
			if ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) == 20 ) then  --�i��20����
				LoadQuestOption( OwnerID() )
			elseif ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) < 20 ) then  --�٤��౵���Ȫ��A
				SetSpeakDetail( OwnerID(), "[SC_PLANT_11]" )  --���o�A���ѷQ�ؤ���˪��Ӫ��O�H�ڳo�̷ǳƤF�@�Ӧ��絹�A�A���L�b�����e�Х��N�A���شӵ��Ŵ��ɨ�<CN>20����</CN>��I
			end
		end
	else 
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_42]", "Lua_Hao_plant_about", 0 ) -- �ڸӦp����o���S�]?
		LoadQuestOption( OwnerID() )
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_18]", "LuaN_plantShop_2", 0 ) -- �ʶR�ؤl
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_plantnpc3_0() -- �� ���`�ۭn��
	local quest_40 = CheckFlag( OwnerID(), 542888 )  -- �ˬd�O�_�w���o�شӱM����
	local already = CheckFlag( OwnerID(), 543534 )  -- �ˬd�O�_�w���M�����
--	2012.12.03 �s�W�A�� Zone 2 Npc �c�� 2 �����~�BZone 6 Npc �c�� 3 �����~
	local PlantShop = { 600156 , 600157 , 600165 , 600352 }	-- �شӤ@���ؤl�B�شӤ@����L�ӫ~�B�شӤG���ؤl&��L�ӫ~�B�شӤT���ؤl&��L�ӫ~
	CloseShop( TargetID() )
--	
	if already == false then	
		if quest_40 == true then --�w�g�L�ش�40����
			LoadQuestOption( OwnerID() )
		else
			if ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) == 40 ) then  --�i��40����
				LoadQuestOption( OwnerID() )
			elseif ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) < 40 ) then  --�٤��౵���Ȫ��A
				SetSpeakDetail( OwnerID(), "[SC_PLANT_29]" )  --��A���شӵ��ŹF��<CN>40</CN>���ɭԡA�O�ѤF�^�ӧ�ڡA���ӯS�O�����祿���ۧA�C
			end
		end
	else
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_31]", "Lua_Hao_plantchange", 0 ) --�ڸӦp�󭫽ƨ��o[203830]�H
		LoadQuestOption( OwnerID() )
	end
--	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_18]", "LuaN_plantShop_3", 0 ) --�ʶR�ؤl
--	2012.12.03 �s�W�A�� Zone 2 Npc �c�� 2 �����~�BZone 6 Npc �c�� 3 �����~
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]", "Planting_Shops_Settings("..PlantShop[3]..")", 0 ) --�ʶR�ؤl
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop[4]..")", 0 ) --�ʶR�ؤl
-- 
end

--------------------------------------------------------------------------------------------------------------------------
-- �شӤT��npc (4.0.1)  [�}�� �s���֮�, �ؤl, ��@���~ , ���Ŷ}��61-80 ]
function luaN_plantnpc4_0() -- �T��NPC��l���

	local Lv = ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Plant )   --���a�ثe�شӵ���
	local Key = CheckFlag( OwnerID() , 542889 )  -- �ˬd�O�_�w���j�v���(���ŤW��80)
	local Detail = { "[SC_PLANT_17]" , "[SC_PLANT_48]" , "[SC_PLANT_49]" , "[SC_PLANT_50]" , "[SC_PLANT_51]" }
 	-- ���o�A���ѷQ�ؤ���˪��Ӫ��O�H
  	-- �ܰ����S�J���A�A������ݭn���������ܡH
  	-- �٦�����ơH�A�T�w�A���O�ӷo�J���H
  	-- ���A���L��欰���x�C
  	-- �ܩ�p�A�ڤw�g���h�F�@�ߡA�S�Ųz�A...
	local Motion = { 112 , 106 , 254 , 102 , 108 }	-- ��e�B�I�Y�B���i�y�B���x�B�j��
	local Buff = 506172
--	2012.12.03 �s�W�A�� Zone 2 Npc �c�� 2 �����~�BZone 6 Npc �c�� 3 �����~
	local PlantShop = { 600156 , 600157 , 600165 , 600352 }	-- �شӤ@���ؤl�B�شӤ@����L�ӫ~�B�شӤG���ؤl&��L�ӫ~�B�شӤT���ؤl&��L�ӫ~
	CloseShop( TargetID() )
--
	

	AdjustFaceDir( TargetID() , OwnerID() , 0 )

	if Key == true then	-- �w���o�شӤj�v
		AddBuff( OwnerID() , Buff , 0 , 5 )
		local Check = Lua_Hao_Return_Buff_Lv( OwnerID() , Buff ) 
		Check = Check + 1
	--	DebugMsg( OwnerID() , 0 , "Check = "..Check )
		if Check >= 5 then
			Check = 5
		end
		for i = 1 , table.getn(Detail) , 1 do
			if Check == i then
				SetSpeakDetail( OwnerID() , Detail[i] )
				PlayMotion( TargetID() , Motion[i] )
			--	DebugMsg( OwnerID() , 0 , "Detail = "..Detail[i].." Motion = "..Motion[i] )
			end
		end
		if Check ~= 5 then
		--	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]" , "LuaN_plantShop_3", 0 ) --�ʶR�ؤl
		--	2012.12.03 �s�W�A�� Zone 2 Npc �c�� 2 �����~�BZone 6 Npc �c�� 3 �����~
			AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]", "Planting_Shops_Settings("..PlantShop[3]..")", 0 ) --�ʶR�ؤl
			AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop[4]..")", 0 ) --�ʶR�ؤl
		--
		end
	else			-- �����o�شӤj�v
		if Lv == 60 then
			SetSpeakDetail( OwnerID() , "[SC_PLANT_44]" )  -- ��l���
			--�ǲߡA�O���F���ͩR����n�C�o�y�ܡA�X�۩�оɧںشӧ޳N���Ѯv�A�{�b�A�ڧ�o�y�ܰe���A�A�A�@�N�ǲߧ󰪲`���شӧޥ��ܡH
		--	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]" , "LuaN_plantShop_3", 0 ) --�ʶR�ؤl
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MARRY_15]", "luaN_plantnpc4_1", 0 ) -- �O���A���@�N�C
		else
			SetSpeakDetail( OwnerID() , "[SC_PLANT_45]" )  -- �A�n�A���ͤH�A���M�ڤ��{�ѧA�A���ڥi�H�Pı�o��A�]���ۤ@���߷R�Ӫ����ߡC��A���شӵ��ŹF��<CN>60</CN>���ɭԡA�O�ѤF�^�ӧ�ڡA�ڱN�޾ɧA���J�󰪲`���شӥ@�ɡC
		--	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]" , "LuaN_plantShop_3", 0 ) --�ʶR�ؤl
		end
		--	2012.12.03 �s�W�A�� Zone 2 Npc �c�� 2 �����~�BZone 6 Npc �c�� 3 �����~
		AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]", "Planting_Shops_Settings("..PlantShop[3]..")", 0 ) --�ʶR�ؤl
		AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop[4]..")", 0 ) --�ʶR�ؤl
		--	
	end
end

function luaN_plantnpc4_1() -- �T��NPC��l���

	local Key = CheckFlag( OwnerID() , 542889 )  -- �ˬd�O�_�w���j�v���(���ŤW��80)
	CloseSpeak( OwnerID())
	AdjustFaceDir( TargetID() , OwnerID() , 0 )

	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		if Key == false then
			GiveBodyItem( OwnerID() , 208650 , 1 )
		end
		Setflag(OwnerID() , 542889 , 1 )  --�����j�v���
		CastSpell( OwnerID() , OwnerID() , 491010 )
		PlayMotion( TargetID() , 102 )
		sleep(5)
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_PLANT_46]", C_SYSTEM ) --�A�w���o�شӤj�v���
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PLANT_47]", C_SYSTEM ) --�T�������T���G�A�w���o�شӤj�v���A�شӵ��ŤW����80�šC
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_111491_DIALOG3]", C_SYSTEM ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_111491_DIALOG3]", C_SYSTEM ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C 
	end
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_plant_about() -- ���o���S�]
	SetSpeakDetail(OwnerID(), "[SC_PLANT_43]" ) --��A���شӵ��Ű����������ؤl����5�ťH�W�ɡA�N�����|�󦬦��ɨ��o<CB>[205084]</CB>�C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_plantnpc2_0", 0 ) --�^��W�@�h	
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_plantchange() -- �I���]�K�ؤl
	SetSpeakDetail(OwnerID(), "[SC_PLANT_32]" ) --[203830]�i�O�۷�öQ���Ӫ��ؤl�A�Q�n���ƨ��o�����I�X�I�N���C�p�G�A�൹��[200239]�B[200298]�B[200342]�U10�ӡA�ڴN���A�@��[203830]�C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_33]", "Lua_Hao_plantchange2", 0 ) --�ڭn�I��[203830]
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_plantchange2() -- �I���]�K�ؤl

	local Item1 =  CountBodyItem( OwnerID() , 200239 ) -- �ջ��q
	local Item2 =  CountBodyItem( OwnerID() , 200298 ) -- �V�C��
	local Item3 =  CountBodyItem( OwnerID() , 200342 ) -- �ڨF�۸���

		if Item1 < 10 or Item2 < 10 or Item3 < 10 then
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" ) --�A�ҫ������~�����C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_plantnpc3_0", 0 ) --�^��W�@�h	
			return false
                	else 
			GiveBodyItem( OwnerID() , 203830 , 1 )	-- ���K�ؤl
			DelBodyItem( OwnerID() , 200239 , 10 )
			DelBodyItem( OwnerID() , 200298 , 10 )
			DelBodyItem( OwnerID() , 200342 , 10 )
			SetSpeakDetail(OwnerID(), "[SC_PLANT_34]" ) --�@�A�ন�\�شӥX���[203839]�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_plantnpc3_0", 0 ) --�^��W�@�h	
		end
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_MagicSeed_change() -- �I���]�ۺؤl
		SetSpeakDetail(OwnerID(), "[SC_PLANT_38]" ) --[205530]�i���O���q���ؤl�A�Q�n���ƨ��o�����ΥI�X�A���V�O�C�p�G�A�൹��[200230]�B[200293]�B[200335]�U10�ӡA�ڴN���A�@��[205530]�C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_39]", "Lua_Hao_MagicSeed_change2", 0 ) --�ڭn�I��[205530]
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_MagicSeed_change2() -- �I���]�ۺؤl

	local Item1 =  CountBodyItem( OwnerID() , 200230 ) -- �����q
	local Item2 =  CountBodyItem( OwnerID() , 200293 ) -- ����
	local Item3 =  CountBodyItem( OwnerID() , 200335 ) -- �s�]����

		if Item1 < 10 or Item2 < 10 or Item3 < 10 then
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" ) --�A�ҫ������~�����C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_0", 0 ) --�^��W�@�h	
			return false
                	else 
			GiveBodyItem( OwnerID() , 205530  , 1 )	-- �]�ۺؤl
			DelBodyItem( OwnerID() , 200230 , 10 )
			DelBodyItem( OwnerID() , 200293 , 10 )
			DelBodyItem( OwnerID() , 200335 , 10 )
			SetSpeakDetail(OwnerID(), "[SC_PLANT_40]" ) --�u�n�n�n���U[205530]�A�N��b�����ɨ��o[205531]�C
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_0", 0 ) --�^��W�@�h	
		end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_get() --���o�شӧޯ�
	CloseSpeak( OwnerID())
	CastSpell( OwnerID() , OwnerID() , 491010 )
	sleep(5)
	SetFlag( OwnerID(), 542886, 1 );	-- <�������n���~-�شӾǮ{>	
 	WriteRoleValue(OwnerID() , EM_RoleValue_MaxPlantCount , 5 ) --�ּƴ��ɬ�5��				   
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_PLANT_09]", C_SYSTEM );--�A�w���o�شӾǮ{���
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_PLANT_10]", C_SYSTEM );--�T�������T���G�A�w���o�شӾǮ{���A�شӵ��ŤW����20�šC
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_LV20give() --�شӥ���lv20�^��
	CloseSpeak( OwnerID())
	SetFlag( TargetID(), 542896, 0 ) -- �R�����n���~
	CastSpell( TargetID() , TargetID() , 491010 )
	sleep(5)
--	SetFlag( TargetID(), 542887, 1 );	-- <�������n���~-�شӤu�K>  ��Υ��ȵ�
 	WriteRoleValue(TargetID() , EM_RoleValue_MaxPlantCount , 10 )  --�ּƴ��ɬ�10��
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_PLANT_15]", C_SYSTEM );--�A�w���o�شӪ�K���
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_PLANT_16]", C_SYSTEM );--�T�������T���G�A�w���o�شӪ�K���A�شӵ��ŤW����40�šC
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_Hao_plant_LV40give() --�شӥ���lv40�^��
	CloseSpeak( OwnerID())
	CastSpell( TargetID() , TargetID() , 491010 )
	sleep(5)
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_PLANT_27]", C_SYSTEM );--�A�w���o�شӱM����
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_PLANT_28]", C_SYSTEM );--�T�������T���G�A�w���o�شӱM����A�شӵ��ŤW����60�šC
	SetFlag(TargetID(), 543534  , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_newquest_recheck()  --�P�_���a�O�_�w�g���L������
	local get = CheckFlag( TargetID(), 542890 )  -- �ˬd�O�_�w�� �w���L�����ȺX��
	if get == false then
		GiveBodyItem( TargetID() , 205532 , 1 )    --�شӾǲߥ]
		SetFlag(TargetID(), 542890 , 1 )  --�� �w���L�����ȺX��
	else
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_PLANT_41]", C_SYSTEM );-- [205530]�u���b�Ĥ@���������ȮɡA�~��K�O����C
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_PLANT_41]", C_SYSTEM );-- [205530]�u���b�Ĥ@���������ȮɡA�~��K�O����C
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_hao_Plant_Lv20_quest_recheck()  --�P�_���a�O�_�w�g���L�شӤu�K

	SetFlag(TargetID(), 542896  , 1 )  --���w�g���L�����ȺX��
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_hao_Plant_Lv40_quest_recheck()  --�P�_���a�O�_�w�g���L�شӱM��
	local get = CheckFlag( TargetID(), 543534 )  -- �ˬd�O�_�w�� �w���L�����ȺX��
	if get == false then
		GiveBodyItem(TargetID() , 203830 , 1 )
		SetFlag(TargetID(), 543534  , 1 )  --���w�g���L�����ȺX��
	elseif  get == true then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_PLANT_30]", C_SYSTEM );--�A���g�����L�o�ӥ��ȡA�K�O��[203830]�u���Ĥ@���~���A�󤣮��g���Ƹ�ڥ洫�H
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_PLANT_30]", C_SYSTEM );--�A���g�����L�o�ӥ��ȡA�K�O��[203830]�u���Ĥ@���~���A�󤣮��g���Ƹ�ڥ洫�H
	--	SetSpeakDetail( OwnerID(), "U r already accept this question" )  --�A�w�g���L�o�ӥ��ȡA�öQ�����K�ؤl�i����յ��C
	--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_plantnpc3_0", 0 ) --�^��W�@�h	
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start() --�ڭn�p��}�l�شӡH --�о�
	SetSpeakDetail( OwnerID(), "[SC_PLANT_05]" )  --�����A�A�ݭn���o�i��شӻݭn�����~�A(��)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_19]", "LuaN_mika_plant_start2", 0) --�ڷQ��F�Ѻش�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_0", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start2() --�ڷQ��F�Ѻش�
	SetSpeakDetail( OwnerID(), "[SC_PLANT_24]" )  --�A�Q�F�ѭ��譱�O�H
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_20]", "LuaN_mika_plant_start20", 0) --��@�׻P�ΨU��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_21]", "LuaN_mika_plant_start21", 0) --���d�׻P������
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_22]", "LuaN_mika_plant_start22", 0) --�����P�Х���

	if ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) >= 6 ) then 
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_23]", "LuaN_mika_plant_start23", 0) --�S����
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start20() --��@�׻P�ΨU��
	SetSpeakDetail( OwnerID(), "[SC_PLANT_20_1]" )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start2", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start21() --���d�׻P������
	SetSpeakDetail( OwnerID(), "[SC_PLANT_21_1]" )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start2", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start22() --���d�׻P������
	SetSpeakDetail( OwnerID(), "[SC_PLANT_22_1]" )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start2", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start23() --���d�׻P������
	SetSpeakDetail( OwnerID(), "[SC_PLANT_23_1]" )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start2", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_plantShop_1() --�ʶR�شӪ��~ 
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
---------------------------------------------
function LuaN_plantShop_2() --�ʶR�ؤl
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
---------------------------------------------
function LuaN_plantShop_3() --�ʶR�G���شӪ��~
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
---------------------------------------------
function LuaN_plantshop_set1() -- �� ���󲣥ͼ@�� --���~	-- �شӤ@�����~
	SetShop(OwnerID() , 600157 , "Test_Shop_Close" ); 
end
---------------------------------------------
function LuaN_plantshop_set2() -- �� ���󲣥ͼ@�� --�ؤl	-- �شӤ@���ؤl
	SetShop(OwnerID() , 600156 , "Test_Shop_Close" ); 
end
---------------------------------------------
function LuaN_plantshop_set3() -- �� ���󲣥ͼ@�� --�ؤl�ӫ~	-- �شӤG���ӫ~
	SetShop(OwnerID() , 600165 , "Test_Shop_Close" ); 
end
---------------------------------------------
--3���شӶ}�� �شӰӤH (4.0.1 )
function LuaN_plantshop_set4() -- �� ���󲣥ͼ@�� --�ؤl�ӫ~	-- �شӤT���ӫ~
	SetShop(OwnerID() , 600352 , "Test_Shop_Close" ); 
end

function Planting_Shops_Settings(ShopGuid)	-- 2012.12.03 �s�W�A�شӰө��ξ�

	local Player = OwnerID()
	local Npc = TargetID()
	SetShop( Npc , ShopGuid , "" )
	CloseSpeak( Player )
	OpenShop()
end
-------------------------------------------------------------------------------
--�شӾǲߥ]  205532      
------------------------------------------------------------------------------
function LuaI_205532box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205532 	--�شӾǲߥ]
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then	
		GiveBodyItem( PlayerID , 203838 , 1 )    --�����شӤj��
		GiveBodyItem( PlayerID , 205530 , 1 )	 --�]�ۺؤl
		GiveBodyItem( PlayerID , 203815 , 30 )    --��@��
		GiveBodyItem( PlayerID , 203823 , 30 )    --���
	end
end

------------------------------------------------------------------------------
--�شӰ��|�]  205533     
----------------------------------------------------------------------------
function LuaI_205533box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205533 	--�شӰ��|�]
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then	
		GiveBodyItem( PlayerID , 204191 , 1 )    --�������ؤl 
		GiveBodyItem( PlayerID , 203994 , 1 )	 --������ؤl  
		GiveBodyItem( PlayerID , 204181 , 1 )    --���úؤl
		GiveBodyItem( PlayerID , 203815 , 50 )    --��@��
		GiveBodyItem( PlayerID , 203823 , 50 )    --���
	end
end
------------------------------------------------------------------------------
--�شӵ׭^�]  205534 
----------------------------------------------------------------------------
function LuaI_205534box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205534 	--�شӰ��|�]
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then	
		GiveBodyItem( PlayerID , 206181 , 1 )  -- �����b�J����
		GiveBodyItem( PlayerID , 203882 , 5 )  -- ���Ŧ����ʤƾ�
		GiveBodyItem( PlayerID , 203885 , 5 )  -- ���Ű��d�ľ�
		GiveBodyItem( PlayerID , 203883 , 3 )  -- ���Ŧ����ʤƾ�
		GiveBodyItem( PlayerID , 203886 , 3 )  -- ���Ű��d�ľ�
	end
end
----------------------------------------------------------------------------
--�شӶǩ_�]  208650
----------------------------------------------------------------------------
function LuaI_208650() -- �شӶǩ_�] 2011/06/21	�شӤT�����y

	local Random , Drop = Rand(3)+1 , 0

	if Random == 1 then
		Drop = 208578	-- ���Źp����
	elseif Random == 2 then
		Drop = 208579	-- �����L���
	else
		Drop = 208577	-- ��w�����
	end	

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208649 , 1 , 208624 , 10 , 208625 , 10 , Drop , 1 } }
	-- �ä[���c���y�d���J*1�B�S�Ŧ����ʤƾ�*10�B���Ű��d�ľ�*10�B���Źp����(�����L��֡B��w�����)*1�C
	return BaseTressureProc(   itemset , 4 )
end
------------------------------------------------------------------------------
function LuaN_mika_plant_test()  --���եΫ��O
	SetFlag(OwnerID(), 542885 , 0 )	-- �ش� �s�����
	SetFlag(OwnerID(), 542886 , 0 )	-- �ش� �Ǯ{
	SetFlag(OwnerID(), 542887 , 0 )	-- �ش� �u�K
	SetFlag(OwnerID(), 542888 , 0 )	-- �ش� �M��
	SetFlag(OwnerID(), 542889 , 0 )	-- �ش� �j�v
	SetFlag(OwnerID(), 543535 , 0 )	-- �ش�-�ǩ_
	SetFlag(OwnerID(), 543610 , 0 )	-- �}��شӧI���ө�
	SetFlag(OwnerID(), 542890 , 0 )	-- �w�����شӾǮ{����
	SetFlag(OwnerID(), 542896 , 0 )	-- �w�����شӤu�K����
	SetFlag(OwnerID(), 543320 , 0 )	-- �w�����شӾǮ{����
	SetFlag(OwnerID(), 543534 , 0 )	-- �w�����شӤu�K����
end
------------------------------------------------------------------------------
function LuaN_mika_plant_test_highlevel()
	SetFlag( OwnerID(), 542886, 1 )	   -- <�������n���~-�شӾǮ{>	
 --	WriteRoleValue(OwnerID() , EM_RoleValue_MaxPlantCount , 5 )
 	WriteRoleValue(OwnerID() , EM_RoleValue_Skill_Plant , 20 ) 
	SetFlag( OwnerID(), 542887, 1 )	  -- <�������n���~-�شӾǮ{>
 	WriteRoleValue(OwnerID() , EM_RoleValue_MaxPlantCount , 10 ) 
end
------------------------------------------------------------------------------
function Lua_Hao_plant_Lv40_60()
	SetFlag(OwnerID() , 542888 , 0 )
end
-----------------------------------------------------------------------------
function Lua_Hao_plant_give()
	GiveBodyItem( OwnerID() , 200239 , 100 )
	GiveBodyItem( OwnerID() , 200298 , 100 )
	GiveBodyItem( OwnerID() , 200342 , 100 )
end
-----------------------------------------------------------------------------
function Lua_Hao_plant_The_End()-- �i�شӬ֮�W����100�A�شӵ��Ŵ�����80

	CastSpell( OwnerID() , OwnerID() , 491010 )	
	sleep(5)
	SetFlag( OwnerID() , 542886 , 1 )	-- <�������n���~-�شӾǮ{>	
	SetFlag( OwnerID() , 542887 , 1 )	-- <�������n���~-�شӪ�K>	
	SetFlag( OwnerID() , 542888 , 1 )	-- <�������n���~-�شӱM��>
	SetFlag( OwnerID() , 542889 , 1 )	-- <�������n���~-�شӤj�v>	
	SetFlag( OwnerID() , 543535 , 1 )	-- <�������n���~-�شӶǩ_>
	SetFlag(OwnerID(), 543610 , 1 )	-- <�������n���~-�}��شӧI���ө�>
	WriteRoleValue( OwnerID() , EM_RoleValue_MaxPlantCount , 100 ) -- �i�جּƴ�����100
	WriteRoleValue( OwnerID() , EM_RoleValue_Skill_Plant , 100 ) -- �شӵ��Ŵ�����100
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_PLANT_LV4_5]", C_SYSTEM ) --�A�w���o�شӶǩ_���C
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PLANT_LV4_6]", C_SYSTEM ) --�T�������T���G�A�w���o�شӶǩ_���A�شӵ��ŤW�����ɬ�100�šC
--	ScriptMessage( OwnerID() , OwnerID(), 1, " ^_^ ", C_SYSTEM )-- ���Ÿ�
end
-----------------------------------------------------------------------------
function Lua_Hao_plant_Game_Over()-- �i�شӬ֮�W���k0�A�شӵ��Ŵ�֬�0

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY ) 
	sleep(5)
	LuaN_mika_plant_test()
	WriteRoleValue( OwnerID() , EM_RoleValue_MaxPlantCount , 0 ) -- �i�جּ����k0
	WriteRoleValue( OwnerID() , EM_RoleValue_Skill_Plant , 0 ) -- �شӵ��ŤW���k0
	ScriptMessage( OwnerID() , OwnerID() , 2 , "Your plant level is already being zero...", C_SYSTEM ) --�A�w�g���F
	ScriptMessage( OwnerID() , OwnerID() , 0 , "Orz" , C_SYSTEM ) --�A�w�g���F
	ScriptMessage( OwnerID() , OwnerID() , 1 , "ToT" , C_SYSTEM ) --�A���شӵ��Ťw�g�k�s
end
-----------------------------------------------------------------------------
function Lua_Hao_Plant_Set_Lv( Value )	-- �C�����]�w�شӵ��šC

	local Key = { 542886 , 542887 , 542888 , 542889, 543535 }	-- �شӾǮ{�B�شӪ�K�B�شӱM��B�شӤj�v, �شӶǩ_
	local Lv = { 1 , 21 , 41 , 61 , 81 }			-- �شӵ���
	local Planting = 0				-- �شӬּ�

	if Value < 0 or Value > 100 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Entry error" , C_SYSTEM ) --  ��J���~
		return false
	end

	for i = 1 , table.getn(Key) , 1 do
		SetFlag( OwnerID() , Key[i] , 0 )
	end

	for i = 1 , table.getn(Lv) , 1 do
		if Value >= Lv[i] then
			SetFlag( OwnerID() , Key[i] , 1 )
		end
	end

	if Value >= 20 then
		Planting = 10
	else
		Planting = 5
	end

	WriteRoleValue( OwnerID() , EM_RoleValue_Skill_Plant , Value ) -- ���ܺشӵ���
	WriteRoleValue( OwnerID() , EM_RoleValue_MaxPlantCount , Planting ) -- ���ܺشӬּ�
	ScriptMessage( OwnerID() , OwnerID() , 1 , "Plant Lv = "..Value , C_SYSTEM )	-- �վ㵥��
end