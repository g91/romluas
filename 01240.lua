--�H�ǦѤj�Ҵ��Ѫ��禡�\�ର�D�Өϥ�
--�� WritePQValue(val , A) �ȥN�N val �g�J�ƭ� A
--�� ReadPQValue(A) �ȥNŪ�X�ƭ� A
--�� ShowPQValue(A) �ȥN�q�X�ƭ� A

--�s�@��k���b�a�ϤW�ةǨå[�J�S����l�@��

function LuaAI_ControlCenter_Zone11PQ() --��l�ȳ]�w�H�ζ��q�������
	--------------��l�ưѼ�------------------
	Zone11PQ_ValueGroup_Drama = {}
	Zone11PQ_ValueGroup_Drama["State"] = 3
	Zone11PQ_ValueGroup_Drama["Mob"] = 0
	Zone11PQ_ValueGroup_Drama["Elite"] = 0
	Zone11PQ_ValueGroup_Drama["Boss"] = 0
	Zone11PQ_ValueGroup_Drama["Time"] = 0
	Zone11PQ_ValueGroup_Drama["LastHero"] =  "[SC_ZONE11_PQ_10]"
	local Timer = 0
	-------------------------------------------
	sleep( 180 )
	Zone11PQ_ValueGroup_Drama["State"] = 0
	Yell( OwnerID() , "[SC_ZONE11_PQ_9]" , 5 ) --/*ĵ�١I�o�{�W�����H�����������Iĵ�١Iĵ�١I
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE11_PQ_8]" , 0 ) --/*[ZONE_SERGARTH POINT]������W�����H�������I
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_ZONE11_PQ_8]" , 0 )
	-------------------------------------------
	while 1 do
		Timer = Zone11PQ_ValueGroup_Drama["Time"]
		--------�Ĥ@���q�p�Ʀ����p��----------------------------------------
		if Zone11PQ_ValueGroup_Drama["Mob"] >= 200 and Zone11PQ_ValueGroup_Drama["State"] == 0 then
			Zone11PQ_ValueGroup_Drama["State"] = 1
			Yell( OwnerID() , "[SC_ZONE11_PQ_0]" , 5 ) --/*��N�I�W�����H���ԯT��L�ӤF�I
--			ShowPQValue("Now Is State : " , "State")
			Zone11PQ_ValueGroup_Drama["Time"] = 0	--���s�p��
			Timer = 0 
		end
		--------�ĤG���q�p��----------------------------------------
		if Zone11PQ_ValueGroup_Drama["Elite"] >= 30 and Zone11PQ_ValueGroup_Drama["State"] == 1 then
			sleep( 30 )
			Yell( OwnerID() , "[SC_ZONE11_PQ_1]" , 5 ) --/*�o�{[101791]�I�o�{[101791]�I�j�a�ƾԡI
			sleep( 20 )
			Zone11PQ_ValueGroup_Drama["State"] = 2
			Yell( OwnerID() , "[SC_ZONE11_PQ_1]" , 5 ) --/*�o�{[101791]�I�o�{[101791]�I�j�a�ƾԡI
--			ShowPQValue("Now Is State : " , "State")
			Zone11PQ_ValueGroup_Drama["Time"] = 0	--���s�p��
			Timer = 0 
		end
		--------�ĤG���q�p��-----------------------------------------
		if Zone11PQ_ValueGroup_Drama["State"] == 1 and Timer == 600 then
--			ScriptMessage( OwnerID() , -1 , 1 ," Time Over", 0 )
			Zone11PQ_ValueGroup_Drama["Time"] = 0	--���s�p��
			Timer = 0 
			Zone11PQ_ValueGroup_Drama["State"] = 2
		end
		--------�ĤT���q�p��----------------------------------------
		if Zone11PQ_ValueGroup_Drama["Boss"] >= 1 and Zone11PQ_ValueGroup_Drama["State"] == 2 then
			sleep( 50 )
			local Str = "[SC_ZONE11_PQ_7][$SETVAR1="..Zone11PQ_ValueGroup_Drama["LastHero"].."]"
			Yell( OwnerID() , str , 5 )
			Zone11PQ_ValueGroup_Drama["State"] = 3
--			ShowPQValue("Now Is State : " , "State")
			Zone11PQ_ValueGroup_Drama["Time"] = 0	--���s�p��
			Timer = 0 
		end
		--------�ĤT���q�p��-----------------------------------------
		if Zone11PQ_ValueGroup_Drama["State"] == 2 and Timer > 570 and Timer <= 590 and math.floor(Timer/10 ) == Timer/10 then
			Yell( OwnerID() , "[SC_ZONE11_PQ_2]" , 5 ) --/*�A���@�|�I�e�ֺ̧M�h�F�I
		end
		if Zone11PQ_ValueGroup_Drama["State"] == 2 and Timer > 590 and Timer < 600 and math.floor(Timer/3 ) == Timer/3 then
			Yell( OwnerID() , "[SC_ZONE11_PQ_3]" , 5 ) --/*�A����@�U�I�e�̴N�n�M�h�F�I
		end
		if Zone11PQ_ValueGroup_Drama["State"] == 2 and Timer == 600 then
--			ScriptMessage( OwnerID() , -1 , 1 ," Time Over", 0 )
			Yell( OwnerID() , "[SC_ZONE11_PQ_4]" , 5 ) --/*�L�̺M�h�F�I�L�̺M�h�F�I
			Zone11PQ_ValueGroup_Drama["State"] = 3
		end
		--------���m���q-----------------------------------------�� 100 ���᭫�m�Ҧ��Ѽ�
		if Zone11PQ_ValueGroup_Drama["State"] == 3 then
			sleep( 18000 )
			Zone11PQ_ValueGroup_Drama["State"] = 0
			Zone11PQ_ValueGroup_Drama["Mob"] = 0
			Zone11PQ_ValueGroup_Drama["Elite"] = 0
			Zone11PQ_ValueGroup_Drama["Boss"] = 0
			Zone11PQ_ValueGroup_Drama["Time"] = 0
			Timer = 0 
			Yell( OwnerID() , "[SC_ZONE11_PQ_9]" , 5 ) --/*ĵ�١I�o�{�W�����H�����������Iĵ�١Iĵ�١I
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE11_PQ_8]" , 0 ) --/*[ZONE_SERGARTH POINT]������W�����H�������I
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_ZONE11_PQ_8]" , 0 )
		end
		-----------------------------------------------------------
		sleep( 10 )
		if Zone11PQ_ValueGroup_Drama["State"] ~= 0 then
			Zone11PQ_ValueGroup_Drama["Time"] = Timer + 1
		end
	end
end

function LuaI_Zone11PQ_BornControl()	--���b�Ǫ����W����l�@���A�������q
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = 0
	-----------�H����s���@�����ޭȡA�᭱���s�����Ӫ������X�{�����q----------
	local MobMap = {[101789] = 0 , [101790] = 1 , [101791] = 2 ,[102359] = 0}	
	--------------------------------------------------------------------------
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Type = 0
	Hide( OwnerID() )	--�]���U�観�����㹳���A�A���F�� Client �㹳���`�A�]���n�� HIDE �A���ܧ�����A Show
	sleep( 10 )	--���@��O���F���ݱ���߽T��N�Ѽ��k�s
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
	SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true )
	SetModeEx( OwnerID() , EM_SetModeType_Show , false )
	Show( OwnerID() , RoomID )
	SetPosByFlag( OwnerID(), 780299 , 1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	if Zone11PQ_ValueGroup_Drama["State"] ~= nil then 
		State = Zone11PQ_ValueGroup_Drama["State"]	--Ū���ثe�����q�A�p�GŪ�����ѫh State �� 0
	end

	if MobMap[OrgID] == nil then
		Show( OwnerID() , RoomID )
		return
	end

	while 1 do
		if ReadPQValue("State") ~= nil then
			State = ReadPQValue("State")	--Ū���ثe���q
		end

		if State >= MobMap[OrgID] and State < 3 and Type == 0 then --Type �� 0 �����ä�
			Hide( OwnerID() )
			SetModeEx( OwnerID() , EM_SetModeType_Show , true )
			SetModeEx( OwnerID() , EM_SetModeType_Mark , true )
			SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )
			SetModeEx( OwnerID() , EM_SetModeType_Move , true )
			SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )
			SetModeEx( OwnerID() , EM_SetModeType_Fight , true )
			SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false )

			Show( OwnerID() , RoomID )
			if State == MobMap[OrgID] then
				SetPlot( OwnerID() , "dead" , "LuaI_Zone11PQ_DeadControl" , 0 ) --�p�ƥΦ��`�@��
			end
			if OrgID == 101791 then
				SetModeEx( OwnerID() , EM_SetModeType_Strikback , false)
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
				SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
				SetFlag( OwnerID() , 540820 , 0 )
				Hide( OwnerID() )
				Show( OwnerID() , RoomID)
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE11_PQ_5]" , 0 ) --/*[101791]���bŧ��[ZONE_SERGARTH POINT]�I
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_ZONE11_PQ_5]" , 0 )
			end
			Type = 1
		end
		--���ˬd���q�~�٭n�ˬd�O�_���`�A�@��ӻ����`��|�۰ʰ���W�� Script�A�o�̬O�O�I�_���ӥ[�J�ˬd
		if ( State < MobMap[OrgID] or State >= 3 ) and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 and Type == 1 then --Type �� 1 ����ܤ�
			Lua_CancelAllBuff( OwnerID() ) --�M���Ҧ�buff
			SetStopAttack( OwnerID() )	--�j�����}�԰�
			ClearHateList( OwnerID() , -1 )	--�M������C��
			if OrgID == 101791 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE11_PQ_6]" , 0 ) --/*[101791]����[ZONE_SERGARTH POINT]�������ӺM�h�F�I
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_ZONE11_PQ_6]" , 0 )
			end
			Type = 0
			break
		end
		sleep( 10 )
	end
	LuaFunc_ResetObj( OwnerID() )
end

function LuaI_Zone11PQ_DeadControl()	--�p�ƥΦ��`�@���A�������q
	local State = 0 
	if ReadPQValue("State") ~= nil then
		State = ReadPQValue("State")
	end
	local MobMap = {[101789] = 0 , [101790] = 1 , [101791] = 2 ,[102359] = 0}	
	local RecordMap = {[0] = "Mob" , [1] = "Elite" , [2] = "Boss" , [3] = "State" }
	local Counter = ReadPQValue(RecordMap[State])
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	if  MobMap[OrgID] ~= nil and MobMap[OrgID] == State then	--�p�G���`���ɭԬO�Ӷ��q�n�p�ƪ���~����
		----------�D�n�O�o�̦b�W�[�p��---------
		Counter = Counter + 1
		WritePQValue(Counter , RecordMap[State])
		----------�H�U�O������ܩ� Client ���T��---------
--		ShowPQValue("Now Is State : " , "State")
--		ShowPQValue("Mob Be Killed : " , RecordMap[State])
	end
	if OrgID == 101791 then
		local Str 
		local Killer = HateListInfo(OwnerID() ,0 , EM_HateListInfoType_GItemID )
		if CheckID( Killer ) == false or ReadRoleValue( Killer , EM_RoleValue_IsPlayer ) == 0 then
			Str = "[SC_ZONE11_PQ_7][$SETVAR1=[SC_ZONE11_PQ_10]]"
			Zone11PQ_ValueGroup_Drama["LastHero"] = "[SC_ZONE11_PQ_10]"
		else
			Str = "[SC_ZONE11_PQ_7][$SETVAR1="..GetName(Killer).."]"
			Zone11PQ_ValueGroup_Drama["LastHero"] = GetName(Killer)
		end
		ScriptMessage( OwnerID() , -1 , 2 , Str , 0 ) --/*[101791]�Q���ѤF�I
		ScriptMessage( OwnerID() , -1 , 0 , Str , 0 )
	end
	return true
end

function WritePQValue(val , pry)
	Zone11PQ_ValueGroup_Drama[pry] = val
end

function ReadPQValue(pry)
	return Zone11PQ_ValueGroup_Drama[pry]
end

function ShowPQValue(str , pry)
	local Num = Zone11PQ_ValueGroup_Drama[pry]
--	local Show = "[str][$SETVAR1="..pry.."]"
	local Show = Str..Num
	ScriptMessage( OwnerID() , -1 , 1 , Show , 0 )
end

function LuaI_Zone11PQ_BornControl_G()	--���b�u�è��W����l�@���A�������q
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = 0
	-----------�H����s���@�����ޭȡA�᭱���s�����Ӫ������X�{�����q----------
--	local MobMap = {[101797] = 0 , [101798] = 0 , [101799] = 1 , [101800] = 1}	
	local MobMap = {[101799] = 1 , [101800] = 1}	
	--------------------------------------------------------------------------
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Type = 0
	Hide( OwnerID() )	--�]���U�観�����㹳���A�A���F�� Client �㹳���`�A�]���n�� HIDE �A���ܧ�����A Show
	sleep( 10 )	--���@��O���F���ݱ���߽T��N�Ѽ��k�s
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
	SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true )
	SetModeEx( OwnerID() , EM_SetModeType_Show , false )
	Show( OwnerID() , RoomID )
	if Zone11PQ_ValueGroup_Drama["State"] ~= nil then 
		State = Zone11PQ_ValueGroup_Drama["State"]	--Ū���ثe�����q�A�p�GŪ�����ѫh State �� 0
	end

	if MobMap[OrgID] == nil then --�p�Gnpc���b MobMap ���A�N return
		Show( OwnerID() , RoomID )
		return
	end

	while 1 do
		if ReadPQValue("State") ~= nil then
			State = ReadPQValue("State")	--Ū���ثe���q
		end

		if State >= MobMap[OrgID] and State < 3 and Type == 0 then
			SetModeEx( OwnerID() , EM_SetModeType_Show , true )
			SetModeEx( OwnerID() , EM_SetModeType_Mark , true )
			SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )
			SetModeEx( OwnerID() , EM_SetModeType_Move , true )
			SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )
			SetModeEx( OwnerID() , EM_SetModeType_Fight , true )
			SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false )
			Hide( OwnerID() )
			Show( OwnerID() , RoomID )
			if State == MobMap[OrgID] then
				SetPlot( OwnerID() , "dead" , "LuaI_Zone11PQ_DeadControl" , 0 ) --�p�ƥΦ��`�@��
			end
			Type = 1
		end
		--���ˬd���q�~�٭n�ˬd�O�_���`�A�@��ӻ����`��|�۰ʰ���W�� Script�A�o�̬O�O�I�_���ӥ[�J�ˬd
		if (State < MobMap[OrgID] or State >= 3 ) and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 and Type == 1 then 
			Lua_CancelAllBuff( OwnerID() ) --�M���Ҧ�buff
			SetStopAttack( OwnerID() )	--�j�����}�԰�
			ClearHateList( OwnerID() , -1 )	--�M������C��
			Type = 0
			break
		end
		sleep( 10 )
	end
	LuaFunc_ResetObj( OwnerID() )
end

function LuaP_Zone11PQ()
	MoveToFlagEnabled( OwnerID() , false )
end

function LuaS_Zone11PQ_Record()
	local State = Zone11PQ_ValueGroup_Drama["State"] 
	LoadQuestOption( OwnerID() )
	if State == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_112619_A]" ,"LuaS_Zone11PQ_Record_0",  0 ) --/*�d�\�ثe�Ԫp
	elseif State == 1 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_112619_A]","LuaS_Zone11PQ_Record_1",  0 ) --/*�d�\�ثe�Ԫp
	elseif State == 2 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_112619_A]","LuaS_Zone11PQ_Record_2",  0 ) --/*�d�\�ثe�Ԫp
	else
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_112619_A]" ,"LuaS_Zone11PQ_Record_3",  0 ) --/*�d�\�ثe�Ԫp
	end
end
function LuaS_Zone11PQ_Record_0()
	local Mob = Zone11PQ_ValueGroup_Drama["Mob"]
	local Count = 200
	local Str = "[SC_112619_0][$SETVAR1="..Mob.."][$SETVAR2="..Count.."]"
	 --/*�ثe����������A�w����[<s>101789]�G[$VAR1]/[$VAR2]
	SetSpeakDetail( OwnerID(), Str)
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_Zone11PQ_Record",  0 )
end
function LuaS_Zone11PQ_Record_1()
	local Elite = Zone11PQ_ValueGroup_Drama["Elite"] 
	local Time = Zone11PQ_ValueGroup_Drama["Time"] 
	local Count = 30
	local TimeLimit = 600 - Time
	local Str = "[SC_112619_1][$SETVAR1="..Elite.."][$SETVAR2="..Count.."][$SETVAR3="..TimeLimit.."]" 
	 --/*�ثe����������A�w����[<s>101790]�G[$VAR1]/[$VAR2]�A���p�A�g�L [$VAR3] �� [101791] �N�X�{
	SetSpeakDetail( OwnerID(), Str)
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_Zone11PQ_Record",  0 )
end
function LuaS_Zone11PQ_Record_2()
	local Time = Zone11PQ_ValueGroup_Drama["Time"]
	local TimeLimit = 600 - Time 
	local Str = "[SC_112619_2][$SETVAR1="..TimeLimit.."]"
	--/*�{�b������[101791]�������A���p�A�g�L [$VAR1] �� [101791] �N�M�h
	SetSpeakDetail( OwnerID(), Str)

	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_Zone11PQ_Record",  0 )
end
function LuaS_Zone11PQ_Record_3()
	local Hero = Zone11PQ_ValueGroup_Drama["LastHero"] 
	local Str = "[SC_112619_3][$SETVAR1="..Hero.."]"
	--/*�ثe�S���o�;԰��C
	--/*�W���԰���[$VAR1]��ɧڭ���o�ӧQ�C
	SetSpeakDetail( OwnerID(), Str)
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_Zone11PQ_Record",  0 )
end
function LuaI_Zone11PQ_Record_Counter()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	local State = 0
	local Str  = ""
	local Mob = 0
	local Elite = 0
	local Count = 0
	local Time = 0
	local TimeLimit  = 0
	sleep( 30 )
	while 1 do
		if Zone11PQ_ValueGroup_Drama["State"] ~= nil then
			State =Zone11PQ_ValueGroup_Drama["State"] 
		end
		if State == 0 then
			Mob = Zone11PQ_ValueGroup_Drama["Mob"]
			Count = 200
			Str = "[SC_112619_0][$SETVAR1="..Mob.."][$SETVAR2="..Count.."]"
			Yell( OwnerID() , str , 3 )
		elseif State == 1 then
			Elite = Zone11PQ_ValueGroup_Drama["Elite"] 
			Time = Zone11PQ_ValueGroup_Drama["Time"] 
			Count = 30
			TimeLimit = 600 - Time
			Str = "[SC_112619_1][$SETVAR1="..Elite.."][$SETVAR2="..Count.."][$SETVAR3="..TimeLimit.."]" 
			Yell( OwnerID() , str , 3 )
		elseif State == 2 then
			Time = Zone11PQ_ValueGroup_Drama["Time"]
			TimeLimit = 600 - Time 
			Str = "[SC_112619_2][$SETVAR1="..TimeLimit.."]"
			Yell( OwnerID() , str , 3 )
		end
		sleep( 600 )
	end
end

function LuaP_101791_0()
	if CheckFlag( OwnerID() , 540820 ) == false then
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		SetModeEx( OwnerID() , EM_SetModeType_Strikback , true)
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )
		SetFlag( OwnerID() , 540820 , 1 )
		Hide( OwnerID() )
		Show( OwnerID() , RoomID )
	end
end