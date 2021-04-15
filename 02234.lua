function Lua_valentine_ying_117234speak00() -- ���b�`�y����NPC�W   �Y�W���Ϥ��лx
	AddBuff(  TargetID(),  503217, 1, -1) 
	SetPlot( OwnerID() , "range" , "Lua_ying_npcrangetalk" , 50 ) --�d��@��	-- �ˬd���a�O�_����d��50�H��
end
-------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_npcrangetalk()
	local A = CheckAcceptQuest( OwnerID(), 423662 )
	local B = CheckAcceptQuest( OwnerID(), 423751 )
	local C = CheckAcceptQuest( OwnerID(), 423859 )
	if A == false and B== false and C == false and CheckFlag( OwnerID() , 544730) == false then
		tell( OwnerID() , TargetID() , "[SC_VALENTINE_2011EV1_02]" ) -- "�ӫ���...�H���H�����U�ڶܡH"
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_117234speak() --NPC���q�X���
--	Say(OwnerID(), "Owner") = ���a
--	Say(TargetID(), "Target") = NPC

	local keyA = CheckFlag( OwnerID(), 544058) --����keyA
	local keyB = CheckFlag( OwnerID(), 544850) --����keyB
	local keyC = CheckFlag( OwnerID(), 544872) --����keyC
	local over = CheckFlag( OwnerID(), 544730 ) -- ���ȧ���

	if over == true then 
		LoadQuestOption( OwnerID()) --Ū�����ȼҪO
	elseif keyA == true or keyB == true or keyC == true then
		LoadQuestOption( OwnerID()) --Ū�����ȼҪO
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_02]" , "Lua_valentine_ying_story", 0 ) --"�ᯫ�`���Ѩ�"�ﶵ
	else
		SetSpeakDetail( OwnerID() , "[SC_VALENTINE_2011EV1_02]" ) -- "�ӫ���...�H���H�����U�ڶܡH"
		AddSpeakOption(  OwnerID() , TargetID() , "[SC_VALENTINE_2011EV1_03]" ,  "Lua_valentine_ying_117234speak01",  0 ) -- "�аݡA������ƻݭn�����ܡH"�ﶵ	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_117234speak01() -- �ﶵ "�аݡA������ƻݭn�����ܡH"
	
	local Lv = ReadRoleValue ( OwnerID(), EM_RoleValue_LV ) --�ˬd���a����
	local X = Rand(15)+1 --Rand(0~14)+1

	if Lv >= 48 then
		if X <= 5 then
			SetFlag( OwnerID() , 544058 , 1 ) --keyA
		elseif X > 5 and X <= 10 then
			SetFlag( OwnerID() , 544850 , 1 ) --key
		else
			SetFlag( OwnerID() , 544872 , 1 ) --keyC
		end
		LoadQuestOption( OwnerID()) --Ū�����ȼҪO
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_02]" , "Lua_valentine_ying_story", 0 ) --"�ᯫ�`���Ѩ�"�ﶵ
	else
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011EV1_01]"   ) -- "�ګܷP�§A���n�N�A�i���A����O���G�٨S����k���W�ڪ���"
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_story() --�ﶵ "�ᯫ�`�Ѩ�"

	SetSpeakDetail( OwnerID(), "[SC_112150_YU_05]"   ) --�ᯫ�`�ѨӤ��e
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_giveuitem01() --��������01����檺Lua
--	Say(OwnerID(), "Owner") --= NPC
--	Say(TargetID(), "Target") --= ���a
	local X = ReadRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 ) --Ū�����a���W��useitem�A�Ĥ@���_�l�Ȭ�0�A�ĤG���_�l�Ȭ�100
	local Y = Rand(5)+1 --Rand(0~4)+1 = 1~5	
	local Z =  X + Y --100+5=105

	if X % 100 == 0 then --(�ˬd�_�l�� / 100��O�_���l�ơA%�����l�� ) �l�Ƶ���0�A��ܷ�饼�����L
		WriteRoleValue( TargetID(), EM_LuaValueFlag_UseItem24 , Z ) --NPC����(�g�J)���a����
--		Say( TargetID() , Z )
	else --�Y 215/100=2...15 �A15 ���l�Ƥ����� 0...�h���g�Juseitem(��ܤw�����L�A�M��S���)
--		Say( TargetID(), X )
--		return
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_giveuitem02() --��������02����檺Lua

	local X = ReadRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 ) --Ū�����a���W��useitem�A�Ĥ@���_�l�Ȭ�0�A�ĤG���_�l�Ȭ�100
	local Y = Rand(5)+6 --Rand(0~4)+6 = 6~10
	local Z =  X + Y --100+10=110

	if X % 100 == 0 then --(�ˬd�_�l�� / 100��O�_���l�ơA%�����l�� ) �l�Ƶ���0�A��ܷ�饼�����L
		WriteRoleValue( TargetID(), EM_LuaValueFlag_UseItem24 , Z ) --NPC����(�g�J)���a����
--		Say( TargetID() , Z )
	else --�Y 215/100=2...15 �A15 ���l�Ƥ����� 0...�h���g�Juseitem(��ܤw�����L�A�M��S���)
--		Say( TargetID(), X )
--		return
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_giveuitem03() --��������03����檺Lua

	local X = ReadRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 ) --Ū�����a���W��useitem�A�Ĥ@���_�l�Ȭ�0�A�ĤG���_�l�Ȭ�100
	local Y =Rand(5)+11 --Rand(0~4)+11 = 11~15
	local Z =  X + Y --100+15=115

	if X % 100 == 0 then --(�ˬd�_�l�� / 100��O�_���l�ơA%�����l�� ) �l�Ƶ���0�A��ܷ�饼�����L
		WriteRoleValue( TargetID(), EM_LuaValueFlag_UseItem24 , Z ) --NPC����(�g�J)���a����
--		Say( TargetID() , Z )
	else --�Y 215/100=2...15 �A15 ���l�Ƥ����� 0...�h���g�Juseitem(��ܤw�����L�A�M��S���)
--		Say( TargetID(), X )
--		return
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_questover() --���ȧ�������檺Lua�A�P�_���a�ثe���������Ȧ���

	SetFlag( TargetID() , 544058, 0 ) --�R������keyA
	SetFlag( TargetID() , 544850, 0 ) --�R������keyB
	SetFlag( TargetID() , 544872, 0 ) --�R������keyC
	SetFlag( TargetID() , 544730, 1 ) --���ȧ����ᵹ�����C�魫�m���n���~
	local X = ReadRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 ) --Ū�����a���W��useitem( �ĤG���쬰101~115 )
	local Y

	if CheckCompleteQuest( TargetID(),423750 ) == true then  -- ���� ����3
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 , 0 )
	else
		X = X + 100 --201~215
		Y = Math.floor( X / 100 ) -- 201~215 / 100 = 2...1~2...15����Ƭ� 2 (�����ĤG��)
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 , Y*100 ) -- 2*100 = 200(�����ĤG����g�J)
		if Y == 3 then --�������ȲĤT��
			SetFlag ( TargetID() , 544848 , 1 ) --�������ȭ��n���~
		elseif Y == 7 then --�������ȲĤC��
			SetFlag ( TargetID() , 544849 , 1 ) --�������ȭ��n���~	
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_questover02() --����423749���������
	
	SetFlag ( TargetID() , 544848 , 0 )
end
---------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_questover03() --����423750���������

	SetFlag ( TargetID() , 544849 , 0 )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_searchbox() --�j�M�p�g��
	local Count = SetSearchRangeInfo( OwnerID() , 600 ) --�ˬd600�d�򤺪��Ҧ�����(�]�t�ۤv)���ƶq
	local NpcID = 117237
	local Uitem = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem24 ) --Ū�����a���W��UseItem�A�ĤG����101~110
	Uitem = Uitem % 100 --�ĤG��Uitem = 101~110 % 100  ( 101~110 / 100 ����l�� = 1~10 )

	for  i = 1 , Count , 1 do
		local NpcGID = GetSearchResult() --�^�Ǫ���GitemID�C(�̧Ǧ^�ǽd�򤺩ҷj�M�쪺����)
		local NpcOID = ReadRoleValue( NpcGID , EM_RoleValue_OrgID ) --�N����GitemID�ରOrgID�C(�̧ǱN�d�򤺪�GitemID�ରOrgID)
--		Say( OwnerID() , "NpcOID ="..NpcOID )
--		Say( OwnerID() , "NpcGID ="..NpcGID )
		if NpcID == NpcOID then
			local NpcPID = ReadRoleValue( NpcGID , EM_RoleValue_PID ) --Ū������PID��
			
			if NpcPID == Uitem then
				local X = GetDistance( OwnerID() , NpcGID ) --���o���a�P���󪺶Z��

				if X <=150 then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_04]" , 0 ) --�d��150�����A�h�i�D���a�A"�M���I�ê��g��F�I"
					SetModeEx( NpcGID , EM_SetModeType_Show , true ) --��ܤg��
					SetModeEx( NpcGID , EM_SetModeType_Mark , true ) --��ܼаO
					BeginPlot(NpcGID , "Lua_ying_HideNpcGID", 0 ) --���äg��
					return
				elseif X >150 and X <= 400 then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_05]" , 0 ) --�d��400�����A�h�i�D���a�A"�A�w�����a��I�æ�m�I"
					return
				elseif X >400 then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_06]" , 0 ) --�j��d��400(400~600��)�A�h�i�D���a�A"�A���I�æ�m�٫ܻ��O�I"
					return
				end
			end
		end
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_07]" , 0 ) --�j�M�d��(600)�L�g��A"������G�S������i�ä��B..."
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_HideNpcGID() --���äg��

--	local X = 1
--	for i = 1 , 10 , 1 do
--		sleep(10)
--	--	Say(OwnerID() , "X ="..X )
--		X = X + 1
--	end
	sleep(200) --20��
	local key = CheckFlag( OwnerID(), 544832) --�ˬd�g��W�O�_��key
	
	if key == true then
		SetFlag( OwnerID(), 544832, 0 ) --�R���g��W��key
		Lua_ying_HideNpcGID()
	--	Say( OwnerID() ,"Answer =".."Ok" )
		return
	else
		SetModeEx( OwnerID() , EM_SetModeType_Show , false ) --���I���g��A�g��20������áC
		SetModeEx( OwnerID() , EM_SetModeType_Mark , false ) --���üаO
	--	Say( OwnerID() ,"Answer =".."Bad" )
		return
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_bgcastbar() --�I���g��

		SetPlot( OwnerID() , "Touch" , "Lua_ying_bgcastbar01" , 30 ) --Ĳ�I�g��@��
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_bgcastbar01() --Ū���g��I�k��
--	Say(OwnerID(), "Owner") = ���a
--	Say(TargetID(), "Target") = �g��
	local Uitem = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem24 ) --Ū�����a���W��UseItem�A�ĤG����101~115
	local NpcPID = ReadRoleValue( TargetID() , EM_RoleValue_PID ) --Ū������PID��
	local X = Uitem % 100 --115/100=1...15���l��15
	local A = CountBodyItem( OwnerID() , 209064 )
	local B = CountBodyItem( OwnerID() , 209068 )
	local C = CountBodyItem( OwnerID() , 209069 )

	DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��

	if NpcPID == X then 
		if A > 0 or B > 0 or C > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_09]" , 0 ) --"�A�w�֦��ӥ��Ȫ��~"
		--	Say(OwnerID() , "Answer =".."Already have" )
		else
			SetFlag( TargetID(), 544832, 1 ) --�����g��key
			if BeginCastBarEvent( OwnerID() , TargetID() , "[SC_VALENTINE_2011EV1_08]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_bgcastbar02") ~= 1 then --�����g��C(3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
			--	Say(OwnerID() , "Answer =".."Busy" )
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_bgcastbar02( Player , CheckStatus) --(�����, �Ѽ�)
--	Say(OwnerID(), "Owner") =���a 
--	Say(TargetID(), "Target") =�g��
	local NpcPID = ReadRoleValue( TargetID() , EM_RoleValue_PID ) --Ū������PID��
	
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
				if NpcPID <= 5 then
					GiveBodyItem( Player , 209064 , 1 ) --����"����p�첰"
				elseif NpcPID > 5 and NpcPID <= 10 then
					GiveBodyItem( Player , 209068 , 1 ) --����"�ȥզⶵ��"
				else
					GiveBodyItem( Player , 209069 , 1 ) --����"���ª�����"
				end
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				SetModeEx( TargetID() , EM_SetModeType_Mark , false ) --���üаO
				SetModeEx( TargetID() , EM_SetModeType_Show , false ) --���äg��
				SetFlag( TargetID(), 544832, 0 ) --�R���g��W��key
			else
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				SetFlag( TargetID(), 544832, 0 ) --�R���g��W��key
				ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
			SetFlag( TargetID(), 544832, 0 ) --�R���g��W��key
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_flower() --���O���S��

	AddBuff( OwnerID() , 506324 , 0 , -1 )
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_valentine_ying_ItemUse() --���b209070���~�W��script�A�۸O����
--	ClearBorder( OwnerID() ) --��l�ƥ۸O�����A�}�Y�@�w�n����
--	AddBorderPage( OwnerID(), "[SC_VALENTINE_2011EV1_10]" ) --�H�󤺮e
--	ShowBorder( OwnerID() , 0 , "[209070]", "ScriptBorder_Texture_Paper" ) --�]�w�۸O����
--end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_ItemUse() --���b209070���~�W��script�A��椶��

	BeginPlot( OwnerID() , "Lua_valentine_ying_ItemUse01" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_ItemUse01() -- �I�����~�}�Ҥ���
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end

	local Time = 0
	local DialogStatus = 0
	local Step = 0
	
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_VALENTINE_2011EV1_10]" )   --NPC������ܪ��A"�H�󤺮e"

	if ( DialogSendOpen(OwnerID() ) == false )  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		CancelBuff( OwnerID(), 501570 );--
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 40 then  -- 20��L�ʧ@�A������ܵ���
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������
			if DialogStatus == -2  then -- ��l��
			
			elseif DialogStatus == -1  then--���_
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--
				Step = 1
			end
		if Step == 1 then
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function LuaI_209067()  --��D�R��§���A�ᯫ�`���y

--	local itemset = {	20,""		,{203038 ,  5 },		--�����ťN��*5	203038 ���v	20/100
--				50,""		,{200151 , 10},		--��¦������*10	200151 ���v	30/100
--				100,""		,{200152 , 10}	}	--��¦�F�P�Ĥ�*10	200152 ���v	50/100

--	return BaseTressureProc(  itemset , 1 )   -- 1 = �ݨD�I�]�Ŷ��A�^��itemset�λݨD�I�]�Ŷ�
--end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_days(Day) --���ի��O�G�g�J�C��useitem
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem24  , Day*100 )
	local UseItem = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem24 )
	Say( OwnerID() , "UseItem = ".. UseItem )
end

function Lua_ying_delflag() --���ի��O�G�Ψӭ��m���w�ѹL���ȣ����X��

	SetFlag( OwnerID() , 544058 , 0 ) 
	SetFlag( OwnerID() , 544850 , 0 )
	SetFlag( OwnerID() , 544872 , 0 )
	SetFlag( OwnerID() , 544730 , 0 )
	SetFlag( OwnerID() , 544848 , 0 ) 
	SetFlag( OwnerID() , 544849 , 0 ) 
end

function lua_ying_flower_value()
	local UseItem = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem24 )
	Say( OwnerID() , "Now UseItem = ".. UseItem )
end