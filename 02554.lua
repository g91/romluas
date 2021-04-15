------�X���G�����o-���l�S��-----------------------------------------------------------------------------------------------
function Lua_ying_Q425243_addbuff()
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, true )--����Y����
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )--����ܦ��
	AddBuff( OwnerID(), 622314 , 0 , -1 )
end
------������y�~�B�j�Ƨ�y�Ԥh�B��U��y�ԤhPE-����------------------------------------------------------------------
function Lua_ying_Q425259_acceptQ()

	local Player = OwnerID()
	local Key = { 546248 , 546249 , 546250 } --������y�~�B�j�Ƨ�y�Ԥh�B��U��y�Ԥh
	local Step = 0

	if CheckCompleteQuest( Player , 425244 ) == true then--����
		for i = 1 , #key , 1 do
			if CheckFlag( Player , Key[i] ) == false then
				Step = Step + 1
			else
				break
			end
			if Step == 3 then
				local Random = DW_Rand(100)
				if Random >= 1 and Random <= 60 then
					SetFlag( Player , 546248 , 1 )
				elseif Random > 60 and Random <= 90 then
					SetFlag( Player , 546249 , 1 )
				else
					SetFlag( Player , 546250 , 1 )
				end
			end
		end
	end
	LoadQuestOption( Player )
end
------�������Ȱ���-�R��������y�~�B�j�Ƨ�y�Ԥh�B��U��y�ԤhPE-KEY---------------------------------------------------
function Lua_ying_Q425259_delkey()
	local x=0
	local Player = TargetID()
	local Key = { 546248 , 546249 , 546250 } --������y�~�B�j�Ƨ�y�Ԥh�B��U��y�Ԥh
	local Score = { 80 , 200 , 280 } --PE�n��
	for i = 1 , #Key , 1 do
		if CheckFlag( Player , Key[i] ) == true then
			x=Score[i]
			Lua_ZonePE_3th_GetScore( x )
			SetFlag( Player , Key[i] , 0 ) --�R��Key
		end
	end
end
------���é��r���U-�����å��y_�k�N���X_�ϥ��ˬdLUA-------------------------------------------------------------------------------------------
function Lua_ying_Q425245_motion()

	local Player = OwnerID()
	local Type = GameObjInfo_Int( 850030 , "ColdownType" ) -- ��o�Ӫk�N���N�o���O(�k�N���X-�I�k�N�o������)

	if CountBodyItem( Player , 241205 ) < 10 then --���F��<10
		if ReadRoleValue( Player , EM_RoleValue_Coldown_Item+Type ) == 0 then
			CallPlot( Player , "PlayMotion" , Player , ruFUSION_ACTORSTATE_CRAFTING_BEGIN ) --�Ķ��ʧ@
			return true
		end
		return false
	else
		ScriptMessage( Player , Player , 1 , "[SC_425245_1]" , 0 ) --"�A�w�������������F��I"
		return false
	end
end
------���é��r���U-����@��_����F��_�򥻪k�N--------------------------------------------------------------------------------------------------------
function Lua_ying_Q425245_find()

	local Player = OwnerID()

	if KS_GetFlagDistance( Player , 781127,  0 ) <= 120 then --�P�X�жZ��(����, �X��ID, �X�Ц�m)
		local X = GetMoveFlagValue( 781127 , 0 , EM_RoleValue_X )+math.random( -70 , 70 )
		local Y = GetMoveFlagValue( 781127 , 0 , EM_RoleValue_Y )
		local Z = GetMoveFlagValue( 781127 , 0 , EM_RoleValue_Z )+math.random( -70 , 70 )
		local Flower

		Flower = CreateObj( 120288 , X , Y , Z , 0 , 1 ) --���F��
		SetModeEx( Flower , EM_SetModeType_SearchenemyIgnore , false ) --���Q�j�M
		SetModeEx( Flower , EM_SetModeType_Obstruct , false ) --������
		SetModeEx( Flower , EM_SetModeType_Move , false ) --������
		SetModeEx( Flower , EM_SetModeType_HideName , false ) --����ܦW��
		SetModeEx( Flower , EM_SetModeType_ShowRoleHead , false ) --������Y����
		AddToPartition( Flower , 0 ) --�ϫإߥX�Ӫ����F��X�{
		ScriptMessage( Player , Player , 1 , "[SC_425245_2]" , 0 ) --"�å��]�����~�A��ģ�X�F���F��K"
		WriteRoleValue( Flower , EM_RoleValue_LiveTime , 7 ) --�ͦs�ɶ�7��
	else
		ScriptMessage( Player , Player , 1 , "[SC_425245_3]" , 0 ) --"�A�b���B�S���M�����F��K"
	end
end
-------���é��r���U-���F��Ĳ�I�@��------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425245_flower()

	local Flower = OwnerID()
	SetPlot( Flower , "Touch" , "Lua_ying_Q425245_castbar" , 30 )
end
-------���é��r���U-Ū�����F��I�k��------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425245_castbar()

	local Player = OwnerID()
	local Flower = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��	
	if CheckAcceptQuest( Player , 425245 ) == true or CheckAcceptQuest( Player , 425202 ) == true or CheckAcceptQuest( Player , 425262 ) == true then
		if CountBodyItem( Player , 241205 ) < 10 then --���F��<10
			if Mount == true then --���b��y
				if BeginCastBarEvent( Player , Flower , "[SC_425245_4]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_Q425245_castbar01") ~= 1 then --�K�����F��C(3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
				end
			else --�b��y
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_425245_1]" , 0 ) --"�A�w�������������F��I"
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_425245_5]" , 0 ) --���R�����F��l�ޤF�A���إ��K
	end
end
---------(����� , �Ѽ�)--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425245_castbar01( Player , CheckStatus )

	local Flower = TargetID()

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
				GiveBodyItem( Player , 241205 , 1 ) --����"���F��"
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				DelObj( Flower )
			else
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end
--------NPC��ܿﶵ------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425246_npc()

	local Player = OwnerID()
	local NPC = TargetID()	
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local NPCID = { 120285 , 120286 , 120287 } --��ۡB�㥬�ǡB���
	local Key = { 546143 , 546144 , 546145 }
	local Step = 0
	
	if CheckAcceptQuest( Player , 425246 ) == true or CheckAcceptQuest( Player , 425263 ) == true or CheckAcceptQuest( Player , 425203 ) == true then
		for i = 1 , #NPCID , 1 do	
			if OrgID == NPCID[i] then
				if CheckFlag( Player , Key[i] ) == false then
					LoadQuestOption( Player )
					AddSpeakOption( Player , NPC , "[SC_425246_1]" , "Lua_ying_Q425246_npc1" , 0 ) --�ڱa�F���F���ĹL�Ӫv���A����
				else
					SetSpeakDetail( Player , "[SC_425246_2]" ) --��W���ī�ˤf�n�����A����h�F�KXXX�j�H�A�u���n�N��A�ٳ·ЧA�]�o��@��L�ӡA�^�Y�ЧA�]�V120280��F�ڪ��·N�A���§A...
				end
				return
			else
				Step = Step + 1
			end
			if Step == 3 then
				LoadQuestOption( Player )
			end
		end
	else
		LoadQuestOption( Player )
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425246_npc1()

	local Player = OwnerID()
	local NPC = TargetID()	
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local NPCID = { 120285 , 120286 , 120287 } --��ۡB�㥬�ǡB���
	local Key = { 546143 , 546144 , 546145 }

	if CheckAcceptQuest( Player , 425246 ) == true or CheckAcceptQuest( Player , 425263 ) == true or CheckAcceptQuest( Player , 425203 ) == true then
		for i = 1 , #NPCID , 1 do
			if OrgID == NPCID[i] then
				if CountBodyItem( Player , 241206 ) >= 1 then --���F����
					SetSpeakDetail( Player , "[SC_425246_2]" ) --��W���ī�ˤf�n�����A����h�F�KXXX�j�H�A�u���n�N��A�ٳ·ЧA�]�o��@��L�ӡA�^�Y�ЧA�]�V120280��F�ڪ��·N�A���§A...
					SetFlag( Player , Key[i] , 1 )
					DelBodyItem( Player , 241206 , 1 )
				else
					SetSpeakDetail( Player , "[SC_425246_3]" ) --241206�O�H�A�Ӥ��|�˥�F�a�H
				end
				return
			end
		end
	else
		SetSpeakDetail( Player , "[SC_425246_5]" ) --XXX�j�H�A�аݦ�����ƶܡH
	end
end
----------NPC��������(120280)_��ܼ@��------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425246_120280npc()

	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption( Player )	
	if CheckAcceptQuest( Player , 425246 ) == true or CheckAcceptQuest( Player , 425263 ) == true or CheckAcceptQuest( Player , 425203 ) == true then
		if CountBodyItem( Player , 241206 ) == 0 then --���F����
			AddSpeakOption( Player , NPC , "[SC_425246_4]" , "Lua_ying_Q425246_120280npc1" , 0 ) --�ڧ˥�F���W��[241206]�K
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425246_120280npc1()

	local Player = OwnerID()

	if CheckAcceptQuest( Player , 425246 ) == true or CheckAcceptQuest( Player , 425263 ) == true or CheckAcceptQuest( Player , 425203 ) == true then
		SetSpeakDetail( Player , "[SC_425246_6]" ) --�p�ߧO�A�˥��o�K
		GiveBodyItem( Player , 241206 , 3 )
	else
		SetSpeakDetail( Player , "[SC_425246_7]" ) --�A������ݭn����241206�O�H
	end
end
------241188���~�ϥ��ˬd_�����[�I��------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425243_check()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local NPCID = { 120289 , 120270 , 120269 }
	local Key = { 546230 , 546269 , 546270 } --�X�� �Ѩ� ��y
	local Step = 0

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	for  i = 1 , #NPCID , 1 do
		if OrgID == NPCID[i] then
			if CheckFlag( Player , Key[i] ) == false then
				if GetDistance( Player , NPC ) <= 50 then --�Z��50��
					return true
				else
					ScriptMessage( Player , Player , 1 , "[SC_424086_8]" , 0 ) --�A���Z���ӻ��A�ЦA�a��@�I�I
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[SC_425243_1]" , 0 ) --�קK�N�~�o�͡A�٬O���n�A�ˤF�a�H
				return false	
			end
		else
			Step = Step + 1
		end
		if Step == 3 then
			ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
			return false
		end
	end
end
------�ϥΫ����241188_�����[�I��-----------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425243_use()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local NPCID = { 120289 , 120270 , 120269 }
	local Key = { 546230 , 546269 , 546270 } --�X�� �Ѩ� ��y
	
	for i = 1 , #NPCID , 1 do
		if OrgID == NPCID[i] then
			SetFlag( Player , Key[i] , 1 )
			break
		end
	end
end