function Lua_FN_Rescue_NPCtalk() --���bNPC�W���}����׳���ܨƥ�
	--Owner�O���a Target�ONPC
	if ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) == 2 then --Register1�ΨӰO�񪱮a�C���i�檬�p�A2���w�g�i��L
		SetSpeakDetail( OwnerID(), "[SC_RESCUE_STRING_FINISH]"  ) --NPC�C��������x��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_Rescue_LEAVE", 0 ) --�ﶵ:���}�շ�
	else
		SetSpeakDetail( OwnerID(), "[SC_RESCUE_STRING_START]"  ) --NPC�}�l�C���e�x��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RULE]"  , "Lua_FN_RESCUE_RULE", 0 ) --�ﶵ:�W�h����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_01]"  , "Lua_FN_RESCUE_Start", 0 ) --�ﶵ:�i��϶˸շ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_RESCUE_LEAVE", 0 ) --�ﶵ:���}�շ�
	end
end

function Lua_FN_RESCUE_RULE() --�C���о�
	SetSpeakDetail( OwnerID(), "[SC_RESCUE_STRING_RULE]"  ) --NPC�x��
end

function Lua_FN_Rescue_LEAVE() --���h --��϶˸շ�2�@��
	CloseSpeak( OwnerID() )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	AddBuff( OwnerID() ,503693 ,1 , 1 )
	sleep(10)
	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)
end

function Lua_FN_RESCUE_Start()
	SetSpeakDetail( OwnerID(), "[SC_RESCUE_STRING_05]"  )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_EASY]"  , "Lua_FN_RESCUE_EASYMODE", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_NORMAL]"  , "Lua_FN_RESCUE_NORMALMODE", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_HARD]"  , "Lua_FN_RESCUE_HARDMODE", 0 )
end

function Lua_FN_RESCUE_EASYMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 3)
	BeginPlot( TargetID(), "Lua_FN_RESCUE_Main", 0 ) --Target�ONPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUE_NORMALMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 6)
	BeginPlot( TargetID(), "Lua_FN_RESCUE_Main", 0 ) --Target�ONPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUE_HARDMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 9)
	BeginPlot( TargetID(), "Lua_FN_RESCUE_Main", 0 ) --Target�ONPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUE_Main()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 2) --�� ���a�w�g�b�i��C��
--	Owner��NPC�ATarget�����a
	local ZoneID = ReadRoleValue(TargetID() , EM_RoleValue_ZoneID)
	local hardlevel = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) --1>²��B2>���q�B3>�x��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local NPCCheck = 0 --Check NPC���A�Ϊ�
	local Score = 0 --�p��
	local Die = 0 --���ѭp��
	local TempTable = {} --�O�����
	local TempGroup1 = {} --�O���f�H
	local TempNumber = 0 --�p��f�H�ƶq
	local TempCount = 0 --�P�_�O�_�ݭn�ɤH�Ϊ�
	local Timer = 0 --�p�ɾ�
	local TempNPC =  SearchRangeNPC ( OwnerID() , 300 ) --�u�O���Ӥ@�}�l�w���
	--
	SetSmallGameMenuType( TargetID() , 9 , 1 ) --�O���O�A��1���гy�A��2������
	SetSmallGameMenuStr( TargetID() , 9 , 1 , "[SC_RESCUE_STRING_STATE][$SETVAR1="..Score.."]" )	--���\�Ϫv
	SetSmallGameMenuStr( TargetID() , 9 , 2 , "[SC_RESCUE_STRING_SCORE][$SETVAR1="..Die.."]" )	--���`�f�w
	-----
	SetFlag (TargetID()  , 542178 , 1 ) -- �϶˸շ�
	--
	AddBuff (TargetID(),506290,1,-1)
	AddBuff (TargetID(),506291,1,-1)
	-----
	Hide(OwnerID())
	-----
	for i=0,table.getn(TempNPC) do
		if ReadRoleValue( TempNPC[i], EM_RoleValue_OrgID  ) == 114963 then
			table.insert (TempTable,TempNPC[i]) --�z��X���A��iTempTable���Y
		end
	end
	--TempTable�O���F�C���Ҧ������
	--for i=1,hardlevel do
		--TempGroup1[1] = Lua_FN_RESCUE_DEBUFF(TempTable[1])
	--end
	ClockOpen( TargetID() , EM_ClockCheckValue_14  , 180 , 180 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H���
	-----�C���D��j��-----
	while true do
		TempCount = 0 --�P�_�ɤH��
		-----
		ZoneID = ReadRoleValue(TargetID() , EM_RoleValue_ZoneID)
		if ZoneID ~= 354 then
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_09]", "0xffffffff" )
			Lua_FN_RESCUE_END(Score,TargetID(),OwnerID(),RoomID,TempGroup1,0,hardlevel)
			break;
		end
		--
		if Timer == 60 then --1����
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_06]", "0xffffffff" )
		elseif Timer == 120 then --2����
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_07]", "0xffffffff" )
		elseif Timer == 180 then --3�����ɶ���
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_08]", "0xffffffff" )
			Lua_FN_RESCUE_END(Score,TargetID(),OwnerID(),RoomID,TempGroup1,1,hardlevel)
			break;
		end
		-----
		for x=1,hardlevel do --�ˬd���S���w�g�Q�B�z�άO�������f�H
			if TempGroup1[x] ~= nil then
				if ReadRoleValue ( TempGroup1[x] , EM_RoleValue_IsDead ) == 1 then
					NPCCheck = 2
				else
					NPCCheck = ReadRoleValue ( TempGroup1[x] , EM_RoleValue_Register1 )
				end
				-- �v���L�O1
				-- ���`�O2
				if NPCCheck ~= 0 then
					if NPCCheck == 1 then
						Score = Score + 1--�[���B�z
						SetSmallGameMenuStr( TargetID() , 9 , 1 , "[SC_RESCUE_STRING_STATE][$SETVAR1="..Score.."]" )	--���\�Ϫv
					else
						Die = Die + 1 --�����B�z
						SetSmallGameMenuStr( TargetID() , 9 , 2 , "[SC_RESCUE_STRING_SCORE][$SETVAR1="..Die.."]" )	--���`�f�w
					end
					TempCount = TempCount +1 --���H�Q�B�z�N��ܭn�ɤH
					DelObj(TempGroup1[x])
					TempGroup1[x] = nil
				end
			else
				TempCount = TempCount +1 --���Ŧ�]��ܭn�ɤH
			end
		end
		-----
		if Die >= 10 then --�P�_�O�_����
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_09]", "0xffffffff" )
			Lua_FN_RESCUE_END(Score,TargetID(),OwnerID(),RoomID,TempGroup1,0,hardlevel)
			break;
		end
		-----
		if Timer%3 == 0 then
			if TempCount > 0 then --�P�_�n���n�ɤH
				while true do
					TempNumber = Rand(hardlevel)+1
					if TempGroup1[TempNumber] == nil then
						TempGroup1[TempNumber] = Lua_FN_RESCUE_DEBUFF(TempTable[TempNumber])
						break
					end
				end
			end
		end
		-----
		Sleep(10)
		Timer = Timer + 1 --���+1
	end
	-----�C���D��j�鵲��-----
end


----------------------------------Game Over----------------------------------
function Lua_FN_RESCUE_END(Score,Player,NPC,RoomID,TempGroup1,Endtype,hardlevel)
	ClockClose(Player)--��������
	local ZoneID = ReadRoleValue(Player , EM_RoleValue_ZoneID)
	--
	for i=1,9 do
		if TempGroup1[i] ~= nil then
			DelObj(TempGroup1[i]) --�R���ѤU���f�H
		end
	end
	--
	Show( NPC,RoomID )
	--
	if Endtype == 1 then --�P�_�O�]�����ؤ覡�����C��
		Say(NPC, "[SC_RESCUE_STRING_NPC06]")
	else
		Say(NPC, "[SC_RESCUE_STRING_NPC07]")
	end
	--
	SetSmallGameMenuType( Player , 9 ,2 )	--�����O���O
	--
	Score = Score*2
	if Endtype == 1 then
		Score = Score + (10*hardlevel)
	End
	Say(NPC, "[SC_RESCUE_STRING_NPC08][$SETVAR1="..Score.."]")
--	ScriptMessage( Player, Player, 0, "[SC_DDR_STRING14]", "0xffFEFF91" )
--	ScriptMessage( Player, Player, 0, "[SC_DDR_STRING15]"..Score, "0xffFEFF91" )
--	AddRoleValue(Player,EM_RoleValue_Honor,Score) -- �W�[�a�A��
	FN_GuildGame_Honor( Player, Score )
	--
	sleep(100)
	CancelBuff( Player,506290)
	CancelBuff( Player,506291)
	--
	if ZoneID == 354 then
		AddBuff( Player ,503693 ,1 , 1 )
		sleep(10)
		ChangeZone( Player, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 ) --�Ǧ^�h
	end
end
----------------------------------�ϥΧޯ�P�_�A�����۹��������}���A----------------------------------
function Lua_FN_RESCUE_506355()  --����"���z�ˮ`"
	--Owner���I�k�̡ATarget���ؼ�
	if CheckBuff( TargetID() , 506281) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506281]]", "0xffffffff" )
		CancelBuff( TargetID(),506281)
		Lua_FN_RESCUE_Skill(TargetID())
	end

end
function Lua_FN_RESCUE_506356() --����"�]�k�ˮ`"
	if CheckBuff( TargetID() , 506282) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506282]]", "0xffffffff" )
		CancelBuff( TargetID(),506282)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506357() --����"�ܩR��"
	if CheckBuff( TargetID() , 506283) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506283]]", "0xffffffff" )
		CancelBuff( TargetID(),506283)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506358() --����"����S"
	if CheckBuff( TargetID() , 506284) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506284]]", "0xffffffff" )
		CancelBuff( TargetID(),506284)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506359() --����"�G���g"
	if CheckBuff( TargetID() , 506285) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506285]]", "0xffffffff" )
		CancelBuff( TargetID(),506285)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506360() --����"�ʹH�f"
	if CheckBuff( TargetID() , 506286) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506286]]", "0xffffffff" )
		CancelBuff( TargetID(),506286)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506381() --����"����"
	if CheckBuff( TargetID() , 506287) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506287]]", "0xffffffff" )
		CancelBuff( TargetID(),506287)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506382() --����"��J"
	if CheckBuff( TargetID() , 506288) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506288]]", "0xffffffff" )
		CancelBuff( TargetID(),506288)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end

function Lua_FN_RESCUE_Skill(NPC)
	WriteRoleValue ( NPC , EM_RoleValue_Register1, 1) --�v���L���f�H�g�J1
	--Hide( TargetID() )
	-----�H�U�O��t�x��-----
	local x = Rand(5)
	if x >= 3 then
		local y = Rand(3)
		if y == 0 then
			Say (NPC,"[SC_RESCUE_STRING_NPC01]")
		elseif y == 1 then
			Say (NPC,"[SC_RESCUE_STRING_NPC02]")
		else
			Say (NPC,"[SC_RESCUE_STRING_NPC03]")
		end
	end
end
----------------------------------�гy�f�w�åB�H���������}���A----------------------------------
function Lua_FN_RESCUE_DEBUFF(NPC)
	local Unit
	local RandUnit = 0
	RandUnit = Rand(4)
	if RandUnit == 0 then --�H���|�سy��
		Unit = CreateObjByObj(101551, NPC ) 
	elseif RandUnit == 1 then 
		Unit = CreateObjByObj(101552, NPC )
	elseif RandUnit == 2 then 
		Unit = CreateObjByObj(102639, NPC )
	elseif RandUnit == 3 then 
		Unit = CreateObjByObj(103070, NPC )
	end
	--SetModeEx( NPC , EM_SetModeType_ShowRoleHead, TRUE ) --�Y����
	SetDefIdleMotion(Unit,ruFUSION_MIME_DEATH_LOOP) --������U�ʧ@
	SetPlot(Unit,"dead","Lua_FN_RESCUE_dead",0) --�����`�@��
	WriteRoleValue ( Unit, EM_RoleValue_Register1, 0) --��X�Ӫ��f�H�g�J0
	-----
	local TempX = Rand(8) --�H��DEBUFF
	if TempX == 0 then
		AddBuff(Unit,506281,1,-1)
	elseif TempX == 1 then
		AddBuff(Unit,506282,1,-1)
	elseif TempX == 2 then
		AddBuff(Unit,506283,1,-1)
	elseif TempX == 3 then
		AddBuff(Unit,506284,1,-1)
	elseif TempX == 4 then
		AddBuff(Unit,506285,1,-1)
	elseif TempX == 5 then
		AddBuff(Unit,506286,1,-1)
	elseif TempX == 6 then
		AddBuff(Unit,506287,1,-1)
	elseif TempX == 7 then
		AddBuff(Unit,506288,1,-1)
	end
	return Unit
end
----------------------------------���檺���`�@��----------------------------------
function Lua_FN_RESCUE_dead()
	-----�H�U�O��t�x��-----
	local x = Rand(5)
	if x >= 3 then
		local y = Rand(2)
		if y == 0 then
			Yell (OwnerID(),"[SC_RESCUE_STRING_NPC04]", 5)
		else
			Yell (OwnerID(),"[SC_RESCUE_STRING_NPC05]", 5)
		end
	end
end
----------------------------���սX-----------------------------------
function FN_RESCUE_TEST1()
	AddBuff(OwnerID(),506289,0,-1)
end

function FN_RESCUE_TEST2()
	AddBuff(OwnerID(),506281,0,-1)
end