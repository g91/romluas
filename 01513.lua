function Apon_testmob_103803() ---�@�����^��A���թǪ���
	CastSpellLV( OwnerID() , OwnerID() , 490565 , 1 )
end

function Apon_testmob_103806()---�Q���@���{�M�ξ����A���թǪ���	
	CastSpellLV( OwnerID() , OwnerID() , 490567 , 1 )
end

function Apon_testmob_103808()---�Q�z���M�ξ��A���թǪ���	
	CastSpellLV( OwnerID() , OwnerID() , 490568 , 1 )
end

function Apon_testmob_103812()---�u�|���@�w�M�ξ��A���թǪ���	
	CastSpellLV( OwnerID() , OwnerID() , 490569 , 1 )
end

function Apon_testroom( )

	local Owner = Role:new( OwnerID() ) 

	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local x = 0
	for i = 0 , 14 , 1 do
		GItemID = CreateObj( 103802 + i , BaseX + i * 50 , BaseY , BaseZ , 0 , 1 )
		--x = x+ 1
		--local NewNpc = Role:new( GItemID ) 
		--NewNPC:SetPID( 6396 )
		--local Mode = GetMode( GItemID )
		--Mode = Mode + 524288
		--SetMode( GItemID , Mode )
		AddToPartition( GItemID , 0 )
	end 
end

function AP_test_0412_1()
	SysCastSpellLv( OwnerID(), OwnerID(), 495579 , 1 ) 
end

function Apon_Suitskill_Delskill_1()
	local A0 = ReadRoleValue( OwnerID() , EM_RoleValue_SuitSkill_LeanSkillCount)
	
	for i = 1 , A0-1 ,1 do
		local A1 = ReadRoleValue( OwnerID() , EM_RoleValue_SuitSkill_LeanSkillID+i )
		say(OwnerID(),i.."="..A1)
	end
end

function Apon_Suitskill_Allskill_check()
	WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_LeanSkillCount, 12)
	local A0 = ReadRoleValue( OwnerID() , EM_RoleValue_SuitSkill_LeanSkillCount)
	say(OwnerID(),"All="..A0)
end

function Apon_Suitskill_ADD() --- �ߧY�W�[�Ҧ����M�˧ޯ�
	local All_skill = {495475,495476,495559,495477,495478,495560,495479,495480,495561,495482,495481,495562,495483,495484,495563,
	495485,495486,495564,495487,495488,495565,495489,495490,495566,495491,495492,495494,495713,495714,495715,495716,495717,
	495718,495719,495720,495728,495729,495730,495732,496091,496092,496093,495774,495775,495776,495777,495731,496099,496100,
	496101,496102,496103,496104,496105,496106,496107,496108,496109,496110,497911,497912,497913,497914,497915,497916,497917,
	497918,498338,498339,498340,498341,498342,498343,498344,497796,497797,497798,498345,850884,850891,850877,850876,850879,850892,850882,850880,850874,850870,850868,850869,850871,850867,850872,850873}---�Ҧ��M�˧ޯ઺�C��A����n�s�W
	local All_skill_Counter = table.getn(All_skill)
	WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_LeanSkillCount, All_skill_Counter+1)
	for i = 1 , All_skill_Counter , 1 do
		WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_LeanSkillID+i,All_skill[i])
	end
	local A0 = ReadRoleValue( OwnerID() , EM_RoleValue_SuitSkill_LeanSkillCount)
	--say(OwnerID(),"All="..A0)
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_TEST_1]" , 1 )
end

function Apon_Suitskill_Del()---�ߧY�R���Ҧ����M�˧ޯ�
	local All_counter = ReadRoleValue( OwnerID() , EM_RoleValue_SuitSkill_LeanSkillCount)
	for i = 0 , All_counter , 1 do
		WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_LeanSkillID+i,0)
	end
	--WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_LeanSkillCount, 1)
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_TEST_2]" , 1 )
end

function Apon_Suitskill_Size()
	--say(OwnerID(),"2222222")
	WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_MaxEqSkillCount,0)
	--say(OwnerID(),"22222")
end
--===================== 2013/4/10 �����M�˧ޯ�P�_���a���ŨӶ}��X�檺��X�ƥ� 	========================
--===================== ���F��K�d�\�A�s�g��Script���ʨ�701830 			========================
--�M�˧ޯश���}��ݨD�@��--�}���[1&2]��--���e--
---���a65�ŮɡA�A�[�}�@��
--function Apon_Suitskill_size_1_levelup()
--	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV ) --Ū�����a���D¾����
--	if PlayerLV >= 50 and CheckFlag( TargetID(), 544009 ) == false then
--		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_START]" , 1 )
--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SUITSKILL_START]" , 1 )
--		WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_MaxEqSkillCount,2)
--		SetScriptFlag( OwnerID(), 544009, 1 )
--	----�H�U�� 65 �ŮɡA�W�[1��C
--	elseif PlayerLV >= 65 and CheckFlag( TargetID(), 544970 ) == false and CheckFlag( TargetID(), 544009 ) == true then
--		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_START_65]" , 1 )
--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SUITSKILL_START_65]" , 1 )
--		WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_MaxEqSkillCount,3)
--		SetScriptFlag( OwnerID(), 544970, 1 )
--	end
--end

--function Apon_Suitskill_size_1_login()
--	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV ) --Ū�����a���D¾����
--	local PlayerLV_Sub = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB ) --Ū�����a����¾����
--	if PlayerLV >=50 or PlayerLV_Sub >= 50 then
--		if CheckFlag( OwnerID(), 544009 ) == false then
--			BeginPlot( TargetID(), "Apon_Suitskill_size_1_login_1", 300 )
--		elseif PlayerLV >= 65 and CheckFlag( TargetID(), 544970 ) == false and CheckFlag( TargetID(), 544009 ) == true then
--			BeginPlot( TargetID(), "Apon_Suitskill_size_1_login_65", 300 )
--		end
--	end
--end
--
--function Apon_Suitskill_size_1_login_1() ---���a50�ŮɡA�}��1�B2��M��
--	SetScriptFlag( OwnerID(), 544009, 1 )
--	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_START]" , 1 )
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SUITSKILL_START]" , 1 )
--	WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_MaxEqSkillCount,2)
--end
--
--function Apon_Suitskill_size_1_login_65() ---���a65�ŮɡA�}�ĤT��M��
--	SetScriptFlag( OwnerID(), 544970, 1 )
--	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_START_65]" , 1 )
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SUITSKILL_START_65]" , 1 )
--	WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_MaxEqSkillCount,3)
--end
--===================== 2013/4/10 �����M�˧ޯ�P�_���a���ŨӶ}��X�檺��X�ƥ� ========================

function Lua_AP_HateTargetID( Owner )	-- �� Owner ������Ф����H���@�W
	return HateListInfo( Owner , Rand( HateListCount( Owner ) ) , EM_HateListInfoType_GItemID )
end

function AP_SuitSkill_Key() ---���~�ϥ�


	-- 2013.07.02 �[�J�ϥΪ̬O�_�� GM ���ˬd
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		DebugMsg( OwnerID() , 0 , "GM only" )
		return false
	end
	--

	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
	
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		local Name = {"[SC_SUITSKILL_NPC_1]" , "[SC_SUITSKILL_NPC_2]"}
		--local KeyName = {"OBJ_NPC" , "DEL_NPC"}
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_SUITSKILL_NPC_3]" );	
		for i = 1 , table.getn(Name) do
			DialogSelectStr( OwnerID() , Name[i] );
		end
		
		if( DialogSendOpen( OwnerID() ) == false ) then 
			--��ưe�X�����D
			return;
		end
	
		local n = 0
		local DialogStatus = 0
		while true do
			sleep( 1 )
			n = n + 1
			DialogStatus = DialogGetResult( OwnerID() )
			--Say( OwnerID() , DialogStatus )
			if n > 600 then -- ���L�a�j��A600 = �@����
				ScriptMessage( OwnerID() , OwnerID() , 0, "�L�a�j��ζ��m�L�[", 0 )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			else
				--ScriptMessage( OwnerID() , OwnerID() , 0, "�X�k�j��", 0 )
			end
			if ( DialogStatus == 8 ) or ( DialogStatus == -1 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			--elseif ( DialogStatus == -2 ) then		
			elseif ( DialogStatus == 0 ) then
				local Chose_1 = AP_SuitSkill_Chose_Obj( Name[DialogStatus+1] , DialogStatus+1 )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			elseif ( DialogStatus == 1 ) then
				local Chose_2 = AP_SuitSkill_Chose_Del( Name[DialogStatus+1] , DialogStatus+1 )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );		
	end

end

function AP_SuitSkill_Chose_Obj()--���ͥi�H�����M�˧ޯ઺NPC
	--say(OwnerID(),"11111111111")
	--2013/07/10 ���լ�������~�L�k���T�ϥΡA�ҥH�N�U�C�쥻�̽����\��}��
	--�w�T�{���~�DGM¾�~�L�k�ϥ�
	local NPC_ID = 117740
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local NPC = star_CreateObj( TargetID() , NPC_ID , 20 , 0 , 0 , Room , 0) --�ͥX����Buff��NPC
	--Say(NPC,"I`m here!!")
end

function AP_SuitSkill_Chose_Del()--�N�e�赹���M�˧ޯ�NPC�i��R��
	--say(OwnerID(),"2222222222")
	local Mob_Num = 0
	local Search = {}
	Search = SearchRangeNPC ( OwnerID() , 200 )
	Mob_Num = table.getn(Search)
	--say(OwnerID(),"Mob_Num =="..Mob_Num)
	for i = 1 , Mob_Num , 1 do
		if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 117740 then
			--say(OwnerID(),"KILL !")
			Delobj(Search[i])
		end
	end
end

function AP_SuitSkill_Give() ---�M�˧ޯ൹����NPC
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_SUITSKILL_NPC_4]"  , "AP_SuitSkill_Give_1", 0 ) --�}����
end
	
function AP_SuitSkill_Give_1()
	CloseSpeak( OwnerID() )
	--say(OwnerID(),"1111111")
	--say(TargetID(),"22222222")
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) --Ū�����a���D¾����
	local PlayerLV_Sub = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB ) --Ū�����a����¾����
	if PlayerLV >=65 or PlayerLV_Sub >= 65 then
		SetScriptFlag( OwnerID(), 544970, 1 )
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_START_65]" , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SUITSKILL_START_65]" , 1 )
		WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_MaxEqSkillCount,3)
	elseif PlayerLV >=50 or PlayerLV_Sub >= 50 then
		SetScriptFlag( OwnerID(), 544009, 1 )
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_START]" , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SUITSKILL_START]" , 1 )
		WriteRoleValue( OwnerID(), EM_RoleValue_SuitSkill_MaxEqSkillCount,2)
	elseif PlayerLV <= 49 and PlayerLV_Sub <= 49 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_SUITSKILL_START_NG]" , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SUITSKILL_START_NG]" , 1 )
	end
end