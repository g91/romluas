--z25_02 ��u�BPE�B�e�U=======================================
--=======================================
--425860 ����
---------------------------------------------------------------------------
function LuaPG_425860_Touch()
	local Dra = OwnerID()
	SetCursorType( Dra , 23)							----�����I�����ϥ�
	SetPlot( Dra, "touch", "LuaPG_425860_Touch_02", 10 )
end

function LuaPG_425860_Touch_02()
	local Player = OwnerID()
	local Dra = TargetID()

	DW_CancelTypeBuff(68,Player)						----�����M�����A
	if DW_CheckQuestAccept("or",Player,425860)==true	and		--�p�G����ŦX
	CountBodyItem(Player, 242146)>0			then
			if 	BeginCastBarEvent( Player, Dra ,"[SC_Z24Q425860_03]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_425860_Touch_03" ) ~= 1 then
										----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player, Player, 1,"[SC_Z24Q425860_06]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_Z24Q425860_06]", "0xffbf0b2b" )
			end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
	end
end

function LuaPG_425860_Touch_03(Player, CheckStatus)
	local Dra = TargetID()
	EndCastBar( Player, CheckStatus)
	if (CheckStatus ~= 0) then
		if (CheckStatus>0) then
			PlayMotion(Dra, ruFUSION_ACTORSTATE_EMOTE_EAT)
			DelBodyItem(Player, 242146, 1)
			DW_QietKillOne(Player,107570)						 --�R�R�������ǡA�e�̱�����̡A0�N�����a
		else
			EndCastBar( Player, CheckStatus)
		end
	end
end

function LuaPG_425860_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425860)==true	and
	CountBodyItem(Player, 242146)==0			then
		AddSpeakOption(Player,NPC, "[SC_Z24Q425860_02]", "LuaPG_425860_Retake_02", 0 )
	end
end

function LuaPG_425860_Retake_02()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242146, 1)
end

--�����᪺�t��
---------------------------------------------------------------------------
--Flag:781257  NO.12��14
--Actor:121886 �N�R�B121885 ���˪��s�~
--BUFF:623516
function LuaPG_425860_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local WalkFlag = 781257
	local BUFF = 623516
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		AddBuff( Player,623516,0, 20)
		CallPlot(NPC, "LuaPG_425860_Complete_02" , NPC, Player, WalkFlag, BUFF)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425860_Complete_02(NPC, Player, WalkFlag, BUFF)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO

	local Geep = Lua_DW_CreateObj("obj" , 121886, NPC,0)
	ks_ActSetMode( Geep )
	local Dra = Lua_DW_CreateObj("flag",121885, WalkFlag, 12)
	ks_ActSetMode( Dra )
	Sleep(10)
	PlayMotion(Dra, ruFUSION_ACTORSTATE_HURT_NORMAL)
	DW_MoveDirectToFlag(Dra, WalkFlag, 13, 0, 1) 
	ScriptMessage( Player, Player, 1,"[SC_Z24Q425860_04]", "0xffbf0b2b" )
	Sleep(10)
	PlayMotion(Geep, ruFUSION_ACTORSTATE_BUFF_INSTANT)
	NPCSAY(Geep, "[SC_Z24Q425860_05]")
	DelObj(Dra)
	Sleep(25)
	DW_MoveToFlag( Geep, WalkFlag, 14, 0, 1)
	DelObj(Geep)

	CancelBuff(Player, BUFF)
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
end



--=======================================
--425876 ���˪��U��
---------------------------------------------------------------------------
function LuaPG_425876_Drunk()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player,425876)== true	and
	CountBodyItem(Player, 242181)>0		and
	CheckFlag(Player, 547528)==false		then
		AddSpeakOption( Player, NPC, "[SC_Z24Q425876_01]", "LuaPG_425876_Drunk_02", 0 )
	end
end

function LuaPG_425876_Drunk_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local BuffCheck=Lua_BuffPosSearch( Player ,624020)					--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--�T�{BUFF�h��
	if BuffLv<4		then
		AddBuff(Player,624020,0,20)
		SetSpeakDetail(Player, "[SC_Z24Q425876_02]")
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425876_06]", "0xffbf0b2b" )
	elseif BuffLv>=4	then
		SetSpeakDetail(Player, "[SC_Z24Q425876_03]")
		DelBodyItem(Player, 242181, 1)
		SetFlag(Player, 547528, 1)							--���X��
		CancelBuff(Player,624020)
	end
end


--=======================================
--425877 �Q���f���u��
---------------------------------------------------------------------------
function LuaPG_425877_Truth()
	local Player = OwnerID()
	local NPC = TargetID()
	if CheckAcceptQuest( Player,425877)== true	and
	CheckFlag(Player, 547529)==false		then
		SetSpeakDetail(Player, "[SC_Z24Q425877_02]")
		AddSpeakOption( Player, NPC, "[SC_Z24Q425877_01]", "LuaPG_425877_Truth_02(1)", 0 )
	elseif CheckAcceptQuest( Player,425876)== true	and
	CountBodyItem(Player, 242181)==0		and
	CheckFlag(Player, 547528)==false		then
		SetSpeakDetail(Player, "[SC_Z24Q425876_04]")
		AddSpeakOption( Player, NPC, "[SC_Z24Q425876_05]", "LuaPG_425876_Retake_02(2)", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425877_Truth_02(OPTION)
	local Player = OwnerID()
	if OPTION==1		then
		CloseSpeak(Player)
		SetFlag(Player, 547529, 1)
	elseif OPTION==2	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 242181, 1)	
	end
end

---------------------------------------------------------------------------
--�����᪺�t��
---------------------------------------------------------------------------
--Flag:781257  NO.6~7
--Actor:121840 ����
--BUFF:509332
function LuaPG_425877_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local WalkFlag = 781257
	local BUFF = 509332
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		AddBuff( Player,509332,0, 20)
		CallPlot(NPC, "LuaPG_425877_Complete_02" , NPC, Player, WalkFlag, BUFF)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425877_Complete_02(NPC, Player, WalkFlag, BUFF)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO

	local New_Cat = Lua_DW_CreateObj("obj" , 121840, NPC,0)		----���ͺt�����p��
	ks_ActSetMode( New_Cat )
	WriteRoleValue(New_Cat , EM_RoleValue_IsWalk , 0)
	PlayMotion(New_Cat, ruFUSION_ACTORSTATE_EMOTE_CRY)
	Sleep(15)
	NPCSAY(New_Cat, "[SC_Z25Q425877_1]")
	DW_Move("flag",New_Cat,WalkFlag,7)
	DelObj(New_Cat)

	CancelBuff(Player, BUFF)	
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
end



--=======================================
--425878 �V�U������
---------------------------------------------------------------------------
function LuaPG_425878_Take()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player,425878)== true	and
	CountBodyItem(Player, 242142)==0		then
		AddSpeakOption( Player, NPC, "[SC_Z24Q425878_01]", "LuaPG_425878_Take_02", 0 )
	end
end

function LuaPG_425878_Take_02()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(), 242142, 1)
end



--=======================================
--425879 ���F�A���ۨ�
---------------------------------------------------------------------------
function LuaPG_425879_Take()
	local Player = OwnerID()
	local NPC = TargetID()
	if CheckAcceptQuest( Player,425879)== true	and
	CountBodyItem(Player, 242143)==0		then
		SetSpeakDetail(Player, "[SC_Z24Q425879_01]")
		AddSpeakOption( Player, NPC, "[SC_Z24Q425879_02]", "LuaPG_425879_Take_02(1)", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425879_Take_02(OPTION)
	local Player = OwnerID()
	local NPC = TargetID()
	if OPTION==1		then
		SetSpeakDetail(Player, "[SC_Z24Q425879_03]")
		AddSpeakOption( Player, NPC, "[SC_Z24Q425879_04]", "LuaPG_425879_Take_02(2)", 0 )
	elseif OPTION==2	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 242143, 1)
	end
end

---------------------------------------------------------------------------
--���U�᪺�t��
---------------------------------------------------------------------------
--Flag:781257  NO.8��11
--Actor:121840 �����B121852 �e�}�S
--BUFF:623516
function LuaPG_425879_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local WalkFlag = 781257
	local BUFF = 623516
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		AddBuff( Player,BUFF,0, 15)
		CallPlot(NPC, "LuaPG_425879_Accept_02" , NPC, Player, WalkFlag, BUFF)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425879_Accept_02(NPC, Player, WalkFlag, BUFF)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO

	local Cat = Lua_DW_CreateObj("obj" , 121840, NPC,0)			----���ͺt�����p��
	ks_ActSetMode( Cat )
	local Friend = Lua_DW_CreateObj("flag",121851, WalkFlag, 9)		----���ͺt��������
	ks_ActSetMode( Friend )
	Sleep(10)
	SetDefIdleMotion(Friend, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(Friend, "[SC_Z24Q425879_05]")
	Sleep(10)
	PlayMotion(Cat, ruFUSION_ACTORSTATE_EMOTE_CRY)
	NPCSAY(Cat, "[SC_Z24Q425879_05]")
	DW_MoveDirectToFlag(Cat, WalkFlag, 10, 0, 1) 
	DW_MoveToFlag( Friend, WalkFlag, 11, 0, 1)
	DelObj(Cat)
	DelObj(Friend)

	CancelBuff(Player, BUFF)	
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
end


--=======================================
--425883 �ޱ�����
---------------------------------------------------------------------------
function LuaPG_425883_Touch()
	local Stone = OwnerID()
	SetCursorType( Stone , 23)						----�����I�����ϥ�
	SetPlot( Stone, "touch", "LuaPG_425883_Destroy", 10 )
end

function LuaPG_425883_Destroy()		--�IĲ�@��
	local Player = OwnerID()
	local Stone = TargetID()
	DW_CancelTypeBuff(68,Player)						----�����M�����A
	if DW_CheckQuestAccept("or",Player,425883,426054,426055)==true	then		--�p�G����ŦX
			if 	BeginCastBarEvent( Player, Stone ,"[SC_Z24Q425883_01]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_425883_Destroy_01" ) ~= 1 then
										----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player, Player, 1,"[SC_Z24Q425883_02]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_Z24Q425883_02]", "0xffbf0b2b" )
			end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
	end	
end

function LuaPG_425883_Destroy_01(Player, CheckStatus)
	local Stone = TargetID()
	EndCastBar( Player, CheckStatus)
	if (CheckStatus ~= 0) then
		if (CheckStatus>0) then
			CallPlot(Stone, "LuaPG_425883_Destroy_02", Stone,Player)			--Ĳ�o�@��
			DW_QietKillOne(Player,107629)						 --�R�R�������ǡA�e�̱�����̡A0�N�����a
		else
			EndCastBar( Player, CheckStatus)
		end
	end
end

function LuaPG_425883_Destroy_02(Stone,Player)
	AddBuff(Stone,621170,0,10)
	Hide( Stone)
	Sleep(200)
	Show(Stone, 0)
end



--=======================================
--425882 �����٤�
---------------------------------------------------------------------------
function LuaPG_425882_Punch()	--���Ĳ�o
	local Player = OwnerID()
	local NPC = TargetID()
	local BuffCheck=Lua_BuffPosSearch( Player ,624063)			--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )	--�T�{BUFF�h��
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player,425882)== true	and
	BuffLv<2					then
		AddSpeakOption( Player, NPC, "[SC_Z24Q425882_01]", "LuaPG_425882_Punch_02", 0 )
	end
end

function LuaPG_425882_Punch_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local Num = ReadRoleValue(NPC, EM_RoleValue_Register1)
	CloseSpeak(Player)
	if Num == 0	then
		DebugMsg( 0 , 0 , "6" )
		WriteRoleValue(NPC, EM_RoleValue_Register1, 1)			--�ΨӧP�_���S���Q���
		CallPlot(NPC,"LuaPG_425882_Punch_03",Player,NPC)
	end
end

function LuaPG_425882_Punch_03(Player,NPC)
	CallPlot(NPC,"LuaPG_425882_Punch_Reset",Player,NPC)
	local Num02 = ReadRoleValue(NPC, EM_RoleValue_Register3)
	local x,y,z,dir = DW_Location( NPC )
	local Punch_Man = CreateObj( 107642,x,y,z,dir,1)
	local WalkFlag = 781257
	local BUFFForCheck = 624063

	WriteRoleValue(NPC, EM_RoleValue_Register2, Punch_Man)		--�⥴�H���Ӽg�i�h�I�s����
	Hide(NPC)
	SetModeEx(Punch_Man, EM_SetModeType_Fight, false)			--�i����n�ı�
	AddToPartition(Punch_Man,0)
	for i=1,8 do
		AddBuff(Punch_Man, 506984, 10, -1)
		SetAttack(Punch_Man, Player)
		CallPlot(NPC, "LuaPG_425882_Punch_05", Player,NPC,Punch_Man,Num02)	--�ˬd�O�_�����H
		CallPlot(NPC, "LuaPG_425882_Punch_04", Player,NPC,Punch_Man,Num02)	--�ˬd�Z��
		Sleep(10)
	end
	--Sleep(80)
	--DebugMsg( 0 , 0 , "1" )
	WriteRoleValue(NPC, EM_RoleValue_Register3, 1)				--�ΨӧP�_���S���i�J��t
	local x1,y1,z1,dir1 = DW_Location( Punch_Man )
	DelObj(Punch_Man)
	local Calm_Down = CreateObj( 121900,x1,y1,z1,dir1,1)
	AddToPartition(Calm_Down,0)
	NPCSAY(Calm_Down, "[SC_Z24Q425882_02]")
	Sleep(25)
	NPCSAY(Calm_Down, "[SC_Z24Q425882_03]")
	DW_Move("flag",Calm_Down,WalkFlag,18)
	DelObj(Calm_Down)
	DW_QietKillOne(Player,107621)
	AddBuff(Player, BUFFForCheck, 0, -1)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
	Sleep(150)
	CallPlot(NPC,"LuaFunc_ResetObj",NPC)
end

function LuaPG_425882_Punch_04(Player,NPC,Punch_Man,Num02)
--	while 1 do
		Num02 = ReadRoleValue(NPC, EM_RoleValue_Register3)
		if CheckDistance( NPC, Player, 80)==false	and			--�Z���ӻ�
		Num02 ==0				then
			--DebugMsg( 0 , 0 , "2" )
			ScriptMessage( Player, Player, 1,"[SC_Z24Q425882_04]", "0xffbf0b2b" )
			ScriptMessage( Player, Player, 0,"[SC_Z24Q425882_04]", "0xffbf0b2b" )
			WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
			return
		end
		--DebugMsg( 0 , 0 , "3" )
--		Sleep(10)
--	end
end

function LuaPG_425882_Punch_05(Player,NPC,Punch_Man,Num02)			--�ˬd���S���b����
--	for i=1,8 do
--		sleep(10)
		--DebugMsg( 0 , 0 , "7" )
		Num02 = ReadRoleValue(NPC, EM_RoleValue_Register3)
		if HateListCount(Punch_Man)==0	and
		Num02==0				then
			--DebugMsg( 0 , 0 , "4" )
			WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
			return
		end
--	end
end

function LuaPG_425882_Punch_Reset(Player,NPC)
	local Num
	local Punch_Man = ReadRoleValue(NPC, EM_RoleValue_Register2)
	for i = 1,8 do
		Num = ReadRoleValue(NPC, EM_RoleValue_Register1)
		if Num == 0	then
			--DebugMsg( 0 , 0 , "5" )
			DW_Move("obj",Punch_Man,NPC)
			DelObj(Punch_Man)
			CallPlot(NPC,"LuaFunc_ResetObj",NPC)			--�������m
			return
		end
		Sleep(10)
	end
end

function LuaPG_425882_Buff_Check()
	local Player = OwnerID()
	if CheckAcceptQuest( Player,425882)== false	then
		CancelBuff(Player, 624063)
	end
end


--=======================================
--425970 ����Q��쪺�d��
---------------------------------------------------------------------------
function LuaPG_425970_Complete()
	local Player = TargetID()
	local NPC =OwnerID()
	ScriptMessage( Player, Player, 1,"[SC_Z24Q425970_01]", "0xffbf0b2b" )
	ScriptMessage( Player, Player, 0,"[SC_Z24Q425970_01]", "0xffbf0b2b" )	
end

--=======================================
--425971 �g�ɪ��s�~
---------------------------------------------------------------------------
function LuaPG_425971_Check()
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	if CheckAcceptQuest(Player, 425971) == true and CheckFlag(Player, 547577)==false then
		if OrgID==121907	then	--�ˬd�ϥΥؼСA�p�G�O�s�~
			return true
		else
			ScriptMessage( Player, Player, 1,"[SC_204425_1]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_204425_1]", 0 )	
			return false
		end
	else
		return false
	end
end

function LuaPG_425971_Use()
	local Player = OwnerID()
	local NPC = TargetID()
	local Num = ReadRoleValue(NPC, EM_RoleValue_Register2)
	SetFlag(Player, 547577, 1)
	if Num ==0	then
		CallPlot(NPC, "LuaPG_425971_Down", Player,NPC)
	end
end

function LuaPG_425971_Down(Player,NPC)
	local RoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local NpcRe2 = 0
	WriteRoleValue(NPC, EM_RoleValue_Register2, 999)
	AddBuff(Player, 624043, 0, 10)
	local Dra = LuaFunc_CreateObjByObj ( 121908 , NPC ) 
	AddToPartition(Dra ,RoomID); 
	Sleep(20)
	SetDefIdleMotion(Dra , ruFUSION_MIME_DEATH_DOWN)
	ScriptMessage( Player, Player, 1,"[SC_Z24Q425971_01]", 0 )	
	ScriptMessage( Player, Player, 0,"[SC_Z24Q425971_01]", 0 )
	DelObj(Dra)
	CancelBuff(Player, 624043)
	WriteRoleValue(NPC, EM_RoleValue_Register2, 0)
end

function LuaPG_425971_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425971)==true	and
	CountBodyItem(Player, 242212)==0			and
	CheckFlag(Player, 547577)==false			then
		AddSpeakOption(Player,NPC, "[SC_Z24Q425971_02]", "LuaPG_425971_Retake_02(1)", 0 )
	elseif CheckAcceptQuest( Player,425984)== true		and
	CountBodyItem(Player, 242215)==0			then
		AddSpeakOption( Player, NPC, "[SC_Z24Q425984_01]", "LuaPG_425971_Retake_02(2)", 0 )
	end
end

function LuaPG_425971_Retake_02(OPTION)
	local Player = OwnerID()
	local NPC = TargetID()
	if OPTION==1		then	
		CloseSpeak(Player)
		GiveBodyItem(Player, 242212, 1)
	elseif OPTION==2	then
		SetSpeakDetail(Player, "[SC_Z24Q425984_02]")
		GiveBodyItem(Player, 242215, 1)
	end
end


--=======================================
--425972 ���P�l
---------------------------------------------------------------------------
function LuaPG_425972_Take()
	local Player = OwnerID()
	local NPC = TargetID()
	if CheckAcceptQuest( Player,425879)== true	and
	CountBodyItem(Player, 242213)==0		then
		SetSpeakDetail(Player, "[SC_Z24Q425972_01]")
		AddSpeakOption( Player, NPC, "[SC_Z24Q425972_02]", "LuaPG_425972_Take_02(1)", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425972_Take_02(OPTION)
	local Player = OwnerID()
	local NPC = TargetID()
	if OPTION==1		then
		SetSpeakDetail(Player, "[SC_Z24Q425972_03]")
		AddSpeakOption( Player, NPC, "[SC_Z24Q425972_04]", "LuaPG_425972_Take_02(2)", 0 )
	elseif OPTION==2	then
		SetSpeakDetail(Player, "[SC_Z24Q425972_05]")
		GiveBodyItem(Player, 242213, 1)
	end
end

---------------------------------------------------------------------------
--�������t��
---------------------------------------------------------------------------
--Flag:781257  NO.15~17
--Actor:121910 �p�s�~�B121916 �w�R�����s�~
--BUFF:624047
function LuaPG_425972_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local WalkFlag = 781257
	local BUFF = 624047
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		AddBuff( Player,BUFF,0, 15)
		CallPlot(NPC, "LuaPG_425972_Complete_02" , NPC, Player, WalkFlag, BUFF)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425972_Complete_02(NPC, Player, WalkFlag, BUFF)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO

	local Big_Dra = Lua_DW_CreateObj("flag",121916, WalkFlag, 15)		----���ͺt�����j�s�~
	ks_ActSetMode( Big_Dra )
	local Little_Dra = Lua_DW_CreateObj("flag",121910, WalkFlag, 16)		----���ͺt�����p�s�~
	ks_ActSetMode( Little_Dra )
	Sleep(10)
	SetDefIdleMotion(Big_Dra, ruFUSION_MIME_DEATH_UP)
	PlayMotion(Big_Dra,ruFUSION_ACTORSTATE_CAST_INSTANT)
	NPCSAY(Big_Dra, "[SC_Z24Q425972_06]")
	Sleep(10)
	PlayMotion(Little_Dra,ruFUSION_ACTORSTATE_CAST_INSTANT)
	NPCSAY(Little_Dra, "[SC_Z24Q425972_06]")
	DW_MoveToFlag( Big_Dra, WalkFlag, 17, 0, 1)
	DW_MoveToFlag( Little_Dra, WalkFlag, 17, 0, 1)
	DelObj(Big_Dra)
	DelObj(Little_Dra)

	CancelBuff(Player, BUFF)	
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
end



--=======================================
--425874 �A���]�n�ӪM����
---------------------------------------------------------------------------
function LuaPG_425874_Check()
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local Num = ReadRoleValue(NPC, EM_RoleValue_Register1)
	DW_CancelTypeBuff(68,Player)						--�����M�����A
	if Num>0	then
		ScriptMessage( Player, Player, 1,"[SC_Z25Q425874_4]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z25Q425874_4]", 0 )		
		return false
	end
	if CountBodyItem(Player, 242219)==0	then
		ScriptMessage( Player, Player, 1,"[SC_Z25Q425874_1]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z25Q425874_1]", 0 )
		return false		
	end
	if DW_CheckQuestAccept("or",Player, 425874) == true	then
		if OrgID==121923				then		--�ˬd�ϥΥؼ�
			return true
		else
			ScriptMessage( Player, Player, 1,"[SC_204425_1]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_204425_1]", 0 )	
			return false
		end
	end
end

function LuaPG_425874_Drink_Use()
	local Player = OwnerID()
	local NPC = TargetID()
	WriteRoleValue(NPC,EM_RoleValue_Register1, 999)
	DW_QietKillOne(Player,107668)
	ScriptMessage( Player, Player, 1,"[SC_Z25Q425874_2]", "0xffffff80" )	
	ScriptMessage( Player, Player, 0,"[SC_Z25Q425874_2]", "0xffffff80" )
	CallPlot(Npc,"LuaPG_425874_Drink_Lock" , NPC)	
end

function LuaPG_425874_Drink_Lock(NPC)
	Sleep(100)
	WriteRoleValue(NPC,EM_RoleValue_Register1, 0)
end

function LuaPG_425874_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player, 425874,425961,425872) == true	and
	CountBodyItem(Player, 242219)==0					then
		AddSpeakOption(Player,NPC, "[SC_Z25Q425874_3]", "LuaPG_425874_Retake_02", 0 )
	end
end

function LuaPG_425874_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242219, 10)
end

function LuaPG_425874_Accept()
	local Player = TargetID()
	if CountBodyItem(Player, 242219)==0	then
		GiveBodyItem(Player, 242219, 10)
	end
end


--=======================================
--425999 �̦X�A���ū�
---------------------------------------------------------------------------
function LuaPG_425999_Put_Check()
	local Player = OwnerID()
	local NPC = TargetID()
	if DW_CheckQuestAccept("or",Player, 425999,425964,425963) == true	and
	CountBodyItem(Player, 242221)>0					then
		return true
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", 0 )
		return false
	end
end

function LuaPG_425999_Put_After()
	local Player = OwnerID()
	local NPC = TargetID()
	CallPlot(NPC, "LuaPG_425999_Put_After_02" , NPC, Player)	
	DelBodyItem(Player, 242221, 1)
	DW_QietKillOne(Player,107643)
	return 1
end

function LuaPG_425999_Put_After_02(NPC, Player)
--	DebugMsg(0,0,"in")
	local x,y,z,dir=DW_Location(NPC)
	local Point = CreateObj(121955, x, y, z , dir, 1 )
	SetModeEx( Point , EM_SetModeType_Mark , false )		-- �аO
--	SetModeEx( Point , EM_SetModeType_ShowRoleHead , false )	-- �Y����
	SetModeEx(Point, EM_SetModeType_Move,FALSE)
--	SetModeEx( Point , EM_SetModeType_HideName , true )
	AddToPartition(Point, 0)
	CastSpell(Point, Point, 850639)
	Sleep(30)
	ScriptMessage( Player, Player, 1,"[SC_Z24Q425999_02]", "0xffffff80" )
	DelObj(Point)
end

function LuaPG_425999_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player, 425999,425964,425963) == true	and
	CountBodyItem(Player, 242221)==0					then
		AddSpeakOption(Player,NPC, "[SC_Z24Q425999_03]", "LuaPG_425999_Retake_02", 0 )
	end
end

function LuaPG_425999_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242221, 10)
end

function LuaPG_425999_Accept()
	local Player = TargetID()
	if CountBodyItem(Player, 242221)==0	then
		GiveBodyItem(Player, 242221, 10)
	end
end