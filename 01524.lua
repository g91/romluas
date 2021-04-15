function Lua_SW_TalkScript()
		SetSpeakDetail( OwnerID(), "[SC_SW_CHOSEONE]" )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_SW_JOINWHITE]" , "Lua_SW_TalkScript1", 0 ) --�ڷQ��1
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_SW_JOINBLACK]" , "Lua_SW_TalkScript2", 0 ) --�ڷQ��2
end
function Lua_SW_TalkScript1()
	--AddBuff(OwnerID(),505765,1,300)
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0)  --�o�ӭȥΨӰO�����a���`��]���ϯ������@�_��������
	SetRoleCampID(OwnerID() , 8)
	CloseSpeak( OwnerID() )
	if ChangeZone( OwnerID(), 354 ,RoomID , 5109, 15, 3582 , 0) == true then
		SetFlag( OwnerID()  , 542176, 1 ) -- �C��X��
	end
end
function Lua_SW_TalkScript2()
	--AddBuff(OwnerID(),505765,1,300)
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0)  --�o�ӭȥΨӰO�����a���`��]���ϯ������@�_��������
	SetRoleCampID(OwnerID() , 9)
	CloseSpeak( OwnerID() )
	if ChangeZone( OwnerID(), 354 ,RoomID , 5109, 15, 3582 , 0) == true then
		SetFlag( OwnerID()  , 542176, 1 ) -- �C��X��
	end
end
function LuaGuildSW_Range()
	SetPlot(OwnerID(),"collision","LuaGuildSW_ReSet",200)
end
function LuaGuildSW_ReSet()
	if PlayerID ==nil then
		PlayerID = {}
	end
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	PlayerID[RoomID]= OwnerID()
	local CampID = GetRoleCampID(OwnerID())
	SetRoleCampID(TargetID() , CampID)
	--Say(OwnerID(),"StartGame")
	SetPlot(TargetID(),"collision","",0)
	DebugMsg( 0, 0, "Player In" )
	BeginPlot(TargetID(),"lua_Guild_smallWarGame",0)
end
--function Lua_SW_PlayerRevive()
--	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) --���a���`��]���ϯ������@�_��������
--	local ZoneID = ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID )
--	if ZoneID == 354 then
--		Addbuff(OwnerID(),505765,0,300)
--		WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, score+1)
--	end
--end

function SW_test()
	AddBuff(OwnerID() ,506485,0,-1)
end

function lua_Guild_smallWarGame()	--���L�ɱN��l�@��
	local PenaltyScore = 0 --�᭱�n�Ψӭp�⦺�`�g�@�Ҧ��a�A��
	local HonorScore = 0
	local Camp =  GetRoleCampID(OwnerID())
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	if WhiteSoldierDead ==nil then
		WhiteSoldierDead = {}	--�էL�������ĭx��
	end
	if BlackSoldierDead ==nil then
		BlackSoldierDead = {}	--�§L�������ĭx��
	end
	if MoveSetpFinish == nil then
		MoveSetpFinish = {}
	end
	MoveSetpFinish[RoomID] = {}
	if Camp ~= 8 and Camp ~= 9 then
		DebugMsg( 0, RoomID ,"ERROR CAMP")
		SetPlot(OwnerID(),"collision","LuaGuildSW_ReSet",200)
		return	--���Owhite�S���Oblack���A�Oԣ�}�}��A���_
	end
	--��������X�m
	local WhiteFlag = CreateObjByFlag( 102652, 780288, 0, 1 );
	DebugMsg( 0, RoomID ,"WhiteFlag="..WhiteFlag)
	SetModeEx( WhiteFlag, EM_SetModeType_Fight, true )--�i�������
	SetModeEx(  WhiteFlag, EM_SetModeType_Strikback, false )--����
	SetModeEx(  WhiteFlag, EM_SetModeType_Mark, true )--�аO
	SetModeEx(  WhiteFlag, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx(  WhiteFlag, EM_SetModeType_Obstruct, false )--����
	SetModeEx(  WhiteFlag, EM_SetModeType_Drag , false )--���O
	SetModeEx(  WhiteFlag, EM_SetModeType_Gravity, false )--���O
	SetModeEx(  WhiteFlag, EM_SetModeType_Move, false )--����
	SetModeEx(  WhiteFlag, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx(  WhiteFlag, EM_SetModeType_Searchenemy, false )--����
	SetModeEx(  WhiteFlag, EM_SetModeType_Show, true )--���
	AddBuff(WhiteFlag,502707,0,-1)
	AddToPartition( WhiteFlag ,  RoomID  )	
	SetRoleCampID(WhiteFlag ,8)
	
	local BlackFlag = CreateObjByFlag( 102653, 780192, 0, 1 );
	DebugMsg( 0, RoomID ,"BlackFlag="..BlackFlag)
	SetModeEx( BlackFlag, EM_SetModeType_Fight, true )--�i�������
	SetModeEx(  BlackFlag, EM_SetModeType_Strikback, false )--����
	SetModeEx(  BlackFlag, EM_SetModeType_Mark, true )--�аO
	SetModeEx(  BlackFlag, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx(  BlackFlag, EM_SetModeType_Obstruct, false )--����
	SetModeEx(  BlackFlag, EM_SetModeType_Drag , false )--���O
	SetModeEx(  BlackFlag, EM_SetModeType_Gravity, false )--���O
	SetModeEx(  BlackFlag, EM_SetModeType_Move, false )--����
	SetModeEx(  BlackFlag, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx(  BlackFlag, EM_SetModeType_Searchenemy, false )--����
	SetModeEx(  BlackFlag, EM_SetModeType_Show, true )--���
	AddBuff(BlackFlag,502707,0,-1)
	AddToPartition( BlackFlag ,  RoomID  )
	SetRoleCampID(BlackFlag ,9)
	--��������D�N
	local WhiteBoss = CreateObjByFlag( 102654, 780288, 1, 1 );
	AddToPartition( WhiteBoss ,  RoomID  )	
	SetRoleCampID(WhiteBoss ,8)
	local BlackBoss = CreateObjByFlag( 102655, 780192, 1, 1 );
	AddToPartition( BlackBoss ,  RoomID  )
	SetRoleCampID(BlackBoss ,9)
	WriteRoleValue( WhiteFlag , EM_RoleValue_PID, WhiteBoss )
	WriteRoleValue( BlackFlag , EM_RoleValue_PID, BlackBoss )
	BeginPlot(WhiteFlag, "LuaGuildSW_HelpFlag",0)
	BeginPlot(BlackFlag, "LuaGuildSW_HelpFlag",0)
	local Winner = "None"
	local CheckTime = 30
	local AllTime = 0
	local SkillList = {	505973,
				505977,
				506095,
				506177,
				506179 }
	local BornObj = {}
	local NN = 1
	WhiteSoldierDead[RoomID] = 0
	BlackSoldierDead[RoomID] = 0
	local AllKill = 0
	SetSmallGameMenuType( PlayerID[RoomID] , 3 , 1 ) --���}����
	--INSTANCE_TIPS_03(���������r��)
	--2014/04/28 ���F�ץ��ϥΥd�I�^���y���г����~�A�ҥH�s�W��BUFF�ӵ��������T�_�ݯd���p������
	AddBuff( PlayerID[RoomID] , 623961 , 0 , -1 )

	if Camp == 8 then
		local Score = AllKill + BlackSoldierDead[RoomID]
		DebugMsg( 0, RoomID ,"ERROR CAMP")
		SetSmallGameMenuStr( PlayerID[RoomID] , 3 , 1 , "[SC_SW_STATE][$SETVAR1="..Score.."]") --Change Stage((++))
		SetSmallGameMenuStr( PlayerID[RoomID], 3 , 2 , "[SC_SW_SCORE][$SETVAR1="..BlackSoldierDead[RoomID].."] ") --Change grade (++String�Ʀr")) 
	elseif Camp == 9 then
		local Score = AllKill + WhiteSoldierDead[RoomID]
		SetSmallGameMenuStr( PlayerID[RoomID] , 3 , 1 , "[SC_SW_STATE][$SETVAR1="..Score.."]") --Change Stage((++))
		SetSmallGameMenuStr( PlayerID[RoomID], 3 , 2 , "[SC_SW_SCORE][$SETVAR1="..WhiteSoldierDead[RoomID].."] ") --Change grade (++String�Ʀr")) 
	else
	end
	ClockOpen( PlayerID[RoomID] , EM_ClockCheckValue_9  , 300 , 300 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H���
	--�����}�l
	
	while 1 do
		--Say(PlayerID[RoomID],"Checking")
		--DebugMsg( 0, RoomID ,"WhiteSoldierDead = "..WhiteSoldierDead[RoomID])
		--DebugMsg( 0, RoomID ,"BlackSoldierDead = "..BlackSoldierDead[RoomID])
		--�ˬd�����p�L�ƥءA�C����10���A�����@�ӷs�ޯ�
		if Camp == 8 then
			if BlackSoldierDead[RoomID] >= 10 then
				--�H�������@�ӧޯ�
				DebugMsg( 0, RoomID ,"CAMP 8")
				AddBuff(PlayerID[RoomID] ,SkillList[Rand(table.getn(SkillList))+1],0,-1)
				Allkill = Allkill + 10
				BlackSoldierDead[RoomID] = BlackSoldierDead[RoomID] -10
			end
			local Score = AllKill + BlackSoldierDead[RoomID]
			SetSmallGameMenuStr( PlayerID[RoomID] , 3 , 1 , "[SC_SW_STATE][$SETVAR1="..Score.."]") --Change Stage((++))
			SetSmallGameMenuStr( PlayerID[RoomID], 3 , 2 , "[SC_SW_SCORE][$SETVAR1="..BlackSoldierDead[RoomID].."] ") --Change grade (++String�Ʀr")) 
		elseif Camp == 9 then
			if WhiteSoldierDead[RoomID] >= 10 then
				--�����@�ӧޯ�
				DebugMsg( 0, RoomID ,"CAMP 9")
				AddBuff(PlayerID[RoomID] ,SkillList[Rand(table.getn(SkillList))+1],0,-1)
				Allkill = Allkill + 10
				WhiteSoldierDead[RoomID] = WhiteSoldierDead[RoomID] -10
			end
			local Score = AllKill + WhiteSoldierDead[RoomID]
			SetSmallGameMenuStr( PlayerID[RoomID] , 3 , 1 , "[SC_SW_STATE][$SETVAR1="..Score.."]") --Change Stage((++))
			SetSmallGameMenuStr( PlayerID[RoomID], 3 , 2 , "[SC_SW_SCORE][$SETVAR1="..WhiteSoldierDead[RoomID].."] ") --Change grade (++String�Ʀr")) 
		else
			DebugMsg( 0, RoomID ,"ERROR CAMP")
			SetPlot(OwnerID(),"collision","LuaGuildSW_ReSet",200)
			return	--���Owhite�S���Oblack���A�Oԣ�}�}��A���_
		end
		if CheckTime >= 20 then
			local LiveMon = 0
			--���ͤp�L
			if BornObj[1] ~= nil then
				for i = 1,table.getn(BornObj) do
					--DebugMsg( 0, RoomID ,i.." for OBJ1 = "..BornObj[i][1])
					--DebugMsg( 0, RoomID ,i.." for OBJ2 = "..BornObj[i][2])
					for j = 1,table.getn(BornObj[i]) do
						if BornObj[i][j] ~= nil then
							if CheckID(BornObj[i][j]) == true then
								LiveMon =  LiveMon + 1
							end
						end
					end
				end
			end
			if LiveMon > 5 then
				DebugMsg( 0, RoomID ,"LiveMon is Full "..LiveMon)
			else
				DebugMsg( 0, RoomID ,"LiveMon = "..LiveMon)
				BornObj[NN] = LuaGuildSW_BornSoldier()
				NN = NN + 1
				CheckTime = 0
			end
		end
		--�ˬd�X�m��q
		if ReadRoleValue( WhiteFlag ,EM_RoleValue_HP) == 0 or ReadRoleValue( WhiteFlag ,EM_RoleValue_IsDead ) == 1 then
			--�¶��ӡB�ն���
			Winner = "Black"
		end
		if ReadRoleValue( BlackFlag ,EM_RoleValue_HP) == 0 or ReadRoleValue( BlackFlag ,EM_RoleValue_IsDead ) == 1 then
			--�ն��ӡB�¶���
			Winner = "White"
		end
		--�ˬd�O�_��ӡH���ѡH
		if AllTime >=300  then
			Winner = "TimeUp"
		end
		if ReadRoleValue( PlayerID[RoomID] , EM_RoleValue_IsDead) == 1 then
			Addbuff(PlayerID[RoomID],506485,0,300)
			Winner = "Die"
		end
		if Winner ~= "None" then
			break
		end
		if ReadRoleValue( PlayerID[RoomID], EM_RoleValue_ZoneID ) ~= 354 then --�ˬd���a�O�_���b�ճ����A�Y�S���h�����ϯ����@
			CancelBuff_NoEvent( PlayerID[RoomID] , 505765 )
			break
		end
		CheckTime = CheckTime + 1
		AllTime = AllTime + 1
		DebugMsg( 0, RoomID ,"AllTime = "..AllTime)
		DebugMsg( 0, RoomID ,"CheckTime = "..CheckTime)
		Sleep(10)
	end
	--�ھھ԰����p�������y�]�ѦҮɶ��B���ļơB���Ӥh�L�ơ^
--	PenaltyScore = ReadRoleValue ( PlayerID[RoomID] , EM_RoleValue_Register1 ) --���a���`��]���ϯ������@�_��������
	PenaltyScore = 0
	if Camp == 8 and Winner == "White" then
		--���a���
		DebugMsg( 0, RoomID ,"Winner1 = "..Camp)
		ScriptMessage( PlayerID[RoomID],  -1, 1, "[SC_SW_WINNER]" , C_SYSTEM )
		ScriptMessage( PlayerID[RoomID],  -1, 0, "[SC_SW_WINNER]" , C_SYSTEM )
		if PenaltyScore >= 350 then
			FN_GuildGame_Honor( PlayerID[RoomID], 50 )
--			AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,50)
--			HonorScore = 50
		else
			FN_GuildGame_Honor( PlayerID[RoomID], (400-PenaltyScore) )
--			AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,400-PenaltyScore)
--			HonorScore = 400
		end
	elseif Camp == 9 and Winner == "Black" then
		--���a���
		DebugMsg( 0, RoomID ,"Winner2 = "..Camp)
		ScriptMessage( PlayerID[RoomID],  -1, 1, "[SC_SW_WINNER]" , C_SYSTEM )
		ScriptMessage( PlayerID[RoomID],  -1, 0, "[SC_SW_WINNER]" , C_SYSTEM )
		if PenaltyScore >= 200 then
			FN_GuildGame_Honor( PlayerID[RoomID], 50 )
--			AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,50)
--			HonorScore = 50
		else
			FN_GuildGame_Honor( PlayerID[RoomID], (250-PenaltyScore) )
--			AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,250-PenaltyScore)
--			HonorScore = 250
		end
	elseif Camp == 8 and Winner == "Black" then
		--���a����
		DebugMsg( 0, RoomID ,"Winner3 = "..Camp)
		ScriptMessage( PlayerID[RoomID],  -1, 1, "[SC_SW_LOSER]" , C_SYSTEM )
		ScriptMessage( PlayerID[RoomID],  -1, 0, "[SC_SW_LOSER]" , C_SYSTEM )
		if PenaltyScore >= 50 then
			FN_GuildGame_Honor( PlayerID[RoomID], 50 )
--			AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,50)
--			HonorScore = 50
		else
			FN_GuildGame_Honor( PlayerID[RoomID], (100-PenaltyScore) )
--			AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,100-PenaltyScore)
--			HonorScore = 100
		end
	elseif Camp == 9 and Winner == "White" then
		--���a����
		DebugMsg( 0, RoomID ,"Winner4 = "..Camp)
		ScriptMessage( PlayerID[RoomID],  -1, 1, "[SC_SW_LOSER]" , C_SYSTEM )
		ScriptMessage( PlayerID[RoomID],  -1, 0, "[SC_SW_LOSER]" , C_SYSTEM )
		if PenaltyScore >= 100 then
			FN_GuildGame_Honor( PlayerID[RoomID], 50 )
--			AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,50)
--			HonorScore = 50
		else
			FN_GuildGame_Honor( PlayerID[RoomID], (150-PenaltyScore) )
--			AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,150-PenaltyScore)
--			HonorScore = 150
		end
	elseif Winner == "TimeUp" then
		--���a����
		DebugMsg( 0, RoomID ,"Winner4 = "..Camp)
		ScriptMessage( PlayerID[RoomID],  -1, 1, "[SC_SW_TIMEUPLOSER]" , C_SYSTEM )	
		ScriptMessage( PlayerID[RoomID],  -1, 0, "[SC_SW_TIMEUPLOSER]" , C_SYSTEM )
		FN_GuildGame_Honor( PlayerID[RoomID], 50 )
--		AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,50)
--		HonorScore = 50
	elseif Winner == "Die" then
		--���a����
		DebugMsg( 0, RoomID ,"Winner4 = "..Camp)
		ScriptMessage( PlayerID[RoomID],  -1, 1, "[SC_SW_LOSER]" , C_SYSTEM )	
		ScriptMessage( PlayerID[RoomID],  -1, 0, "[SC_SW_LOSER]" , C_SYSTEM )
		FN_GuildGame_Honor( PlayerID[RoomID], 50 )
--		AddRoleValue(PlayerID[RoomID],EM_RoleValue_Honor,50)
--		HonorScore = 50
	end
	ClockClose(PlayerID[RoomID])--��������
	--�ǥX�ϰ�
	--StartClientCountDown ( PlayerID[RoomID] , 5, 0, 0, 0, 0, "[SC_TC_BACKTOROOM]" )	--���aClient��ܭ˼�5��
	SetSmallGameMenuType( PlayerID[RoomID] , 3 ,2 ) --��������
	--�R���h�l������
	local TempObj = {102652,102653,102654,102655,102656,102657,102647,113115 }
	for i = 1 ,table.getn(TempObj) do
		Lua_DavisDelObj(TempObj[i])
	end
--	Sleep(50)
	SetPlot(OwnerID(),"collision","LuaGuildSW_ReSet",200)
	CancelBuff_NoEvent( PlayerID[RoomID] , 505765 ) --�����ϯ������@
	CancelBuff_NoEvent( PlayerID[RoomID] , 505973 ) --�����B�~�ޯ�
	CancelBuff_NoEvent( PlayerID[RoomID] , 505977 ) --�����B�~�ޯ�
	CancelBuff_NoEvent( PlayerID[RoomID] , 506095 ) --�����B�~�ޯ�
	CancelBuff_NoEvent( PlayerID[RoomID] , 506177 ) --�����B�~�ޯ�
	CancelBuff_NoEvent( PlayerID[RoomID] , 506179 ) --�����B�~�ޯ�
	SetRoleCampID(PlayerID[RoomID] , 1)
	if Winner ~= "Die" then
--		ScriptMessage( PlayerID[RoomID], PlayerID[RoomID], 0, "[SC_DDR_STRING14]", "0xffffffff" );
--		ScriptMessage( PlayerID[RoomID], PlayerID[RoomID], 0, "[SC_DDR_STRING15]"..HonorScore, "0xffffffff" )
		--2014/04/28 ���F�ץ��ϥΥd�I�^���y���г����~�A�ҥH�s�W��BUFF�ӱj��������T�_���p������
		CancelBuff_NoEvent( PlayerID[RoomID], 623961 ) 
		ChangeZone( PlayerID[RoomID], 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )--�Ǧ^�p�ж�
	end
end
function Lua_Guild_SoldierDeadWhite()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	--�դh�L���`�K�[�����ܼ�
	if TargetID() == PlayerID[RoomID] then
		WhiteSoldierDead[RoomID] = WhiteSoldierDead[RoomID] + 1
	end
end
function Lua_Guild_SoldierDeadBlack()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	--�¤h�L���`�K�[�����ܼ�
	if TargetID() == PlayerID[RoomID] then
		BlackSoldierDead[RoomID] = BlackSoldierDead[RoomID] + 1
	end
end
function LuaGuildSW_Born1Script()
	local MonsterID = 102656
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 8 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )--�]�a
	BeginPlot(OwnerID(),"LuaGuildSW_Moveto288",0)
	LuaGuildSW_SetSoldier(MonsterID)
end
function LuaGuildSW_Born2Script()
	local MonsterID = 102657
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 9 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )--�]�a
	BeginPlot(OwnerID(),"LuaGuildSW_Moveto192",0)
	LuaGuildSW_SetSoldier(MonsterID)
end
function LuaGuildSW_Moveto288()	--�Ǫ��u��288���@��
	MoveToFlagEnabled( OwnerID() , false )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local FlagCount = GetMoveFlagCount ( 780288 ) - 1

	for i = 3 , FlagCount do
		DW_MoveToFlag(OwnerID() , 780288, i, 0)
		if i == (FlagCount-2) then
			MoveSetpFinish[RoomID][OwnerID()] = 1
		end
	end
	SetModeEx(  OwnerID(), EM_SetModeType_Move, false )--����
end
function LuaGuildSW_Moveto192()	--�Ǫ��u��288���@��
	MoveToFlagEnabled( OwnerID() , false )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local FlagCount = GetMoveFlagCount ( 780192 ) - 1
	for i = 3 , FlagCount do
		DW_MoveToFlag(OwnerID() , 780192, i, 0,1)
		if i == (FlagCount-2) then
			MoveSetpFinish[RoomID][OwnerID()] = 1
		end
	end
	SetModeEx(  OwnerID(), EM_SetModeType_Move, false )--����
end
function LuaGuildSW_SetSoldier(MonsterID)
	Sleep(10)
	local CampID = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local OldPos = LuaFun_TeamFollow(20,3)	--���o�@���}�C���⪺��l
	local MonsterGroup = {}
	local DeadNumber = 1
	local DeadList = {}
	local State = "go"
	local Owner = OwnerID()
	MoveSetpFinish[RoomID][Owner] = 0
	--�b�@���}�C���⪺��l�إX�p�L
	for i = 1, table.getn(OldPos) do
		MonsterGroup[i] = CreateObj ( MonsterID , OldPos[i][1]  , OldPos[i][2] , OldPos[i][3] , OldPos[i][4] , 1)
		SetRoleCampID(MonsterGroup[i] , CampID)
		MoveToFlagEnabled(MonsterGroup[i] , false)
		WriteRoleValue( MonsterGroup[i] , EM_RoleValue_IsWalk , 0 )
		AddToPartition(MonsterGroup[i] , RoomID )
		AddBuff(MonsterGroup[i] ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

		--�[�J�¡B�զ��`�@��
		if MonsterID == 102656 then
			SetPlot(MonsterGroup[i],"dead","Lua_Guild_SoldierDeadWhite",0)
		elseif MonsterID == 102657 then
			SetPlot(MonsterGroup[i],"dead","Lua_Guild_SoldierDeadBlack",0)
		end
	end
	--local PosIn = {}
	local AttTarget
	local Xtime = 3
	While 1 do
		local NewPos = {}
		if MoveSetpFinish[RoomID][Owner] == 0 then
			NewPos = LuaFun_TeamFollow(50,3)
			--DebugMsg( 0, RoomID ,"NewPos =  0")
		elseif MoveSetpFinish[RoomID][Owner] == 1 then
			NewPos = LuaFun_TeamFollow(30,3)
			--DebugMsg( 0, RoomID ,"NewPos =  1")
		end
		if State == "Stop" then
			break
		else
			local MoveSetp = 0
			local SSSSS = ""
			for i = 1 ,table.getn(MonsterGroup) do
				if HateListCount( MonsterGroup[i] ) == 0 then
					--�԰����q���a�Y��
					--DebugMsg( 0, RoomID ,MonsterGroup[i].." is in Attack")
					SSSSS = "Nomal"
				else
					--DebugMsg( 0, RoomID ,MonsterGroup[i].." is in Nomal")
					SSSSS = "Attack"
					AttTarget = ReadRoleValue( MonsterGroup[i], EM_RoleValue_AttackTargetID)
					SetModeEx(  OwnerID(), EM_SetModeType_Move, false )--����
					break
				end
			end
			if SSSSS == "Nomal" then
				--DebugMsg( 0, RoomID ,OwnerID().." Nomal")
				for i = 1 ,table.getn(MonsterGroup) do
					local DeadSetp = 0
					--�ˬd���F�X��...
					if MonsterGroup[i] ~= nil then
						if ReadRoleValue( MonsterGroup[i] , EM_RoleValue_IsDead ) == 1 or CheckID(MonsterGroup[i]) == false then
							for j = 1 , table.getn(DeadList) do
								if MonsterGroup[i] == DeadList[j] then
									DeadSetp = 1
									break
								end
							end
							if DeadSetp == 0 then
								DeadList[DeadNumber] = MonsterGroup[i]
								DeadNumber = DeadNumber + 1
								--DebugMsg( 0, RoomID ,MonsterID.." already dead "..(DeadNumber-1))
								table.remove(MonsterGroup,i)
							end
						end
					end
					if (DeadNumber-1) == table.getn(NewPos) then
						--DebugMsg( 0, RoomID ,MonsterID.." AllDead")
						State = "Stop"
						break
					end
				end
				if Xtime >= 3 then
					for i = 1 ,table.getn(MonsterGroup) do
						--���`���ơסץ������H����...�����N�������F..�S���ۤF..�N���A�]������..�����~���ˬd

						--�ˬd���ت��a�h��..�̾ڶZ�����ܶ]�B�B����

						--	PosIn[i] = CreateObj(113072 , NewPos[i][1]  , NewPos[i][2] , NewPos[i][3] , NewPos[i][4],1)
						--	SetModeEx( PosIn[i], EM_SetModeType_Fight, false )--�i�������
						--	SetModeEx(  PosIn[i], EM_SetModeType_Strikback, false )--����
						--	SetModeEx(  PosIn[i], EM_SetModeType_Mark, false )--�аO
						--	SetModeEx(  PosIn[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
						--	SetModeEx(  PosIn[i], EM_SetModeType_Obstruct, false )--����
						--	SetModeEx(  PosIn[i], EM_SetModeType_Drag , false )--���O
						--	SetModeEx(  PosIn[i], EM_SetModeType_Gravity, false )--���O
						--	SetModeEx(  PosIn[i], EM_SetModeType_Move, false )--����
						--	SetModeEx(  PosIn[i], EM_SetModeType_ShowRoleHead, false )--�Y����
						--	SetModeEx(  PosIn[i], EM_SetModeType_Searchenemy, false )--����
						--	SetModeEx(  PosIn[i], EM_SetModeType_Show, true )--���
						--	AddToPartition(PosIn[i] , RoomID )
						--���o�{�b��m
						local NowPos = {}
						NowPos[i] = {}
						NowPos[i][1] =  ReadRoleValue( MonsterGroup[i] , EM_RoleValue_X )
						NowPos[i][2] =  ReadRoleValue( MonsterGroup[i] , EM_RoleValue_Y )
						NowPos[i][3] =  ReadRoleValue( MonsterGroup[i] , EM_RoleValue_Z )
						if MonsterGroup[i] ~= nil and CheckID(MonsterGroup[i] ) == true then
							--DebugMsg( 0, RoomID ,OwnerID().." is GOGOGO")
							if (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2 >= 600^2 then
								SetPos(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3] , NewPos[i][4])
								DebugMsg( 0, RoomID ,MonsterID.." SetPos ")
								Say(MonsterGroup[i],OwnerID().."FLY".." dis = "..math.sqrt((NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2))
							elseif (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2 >=50^2 then
								WriteRoleValue( MonsterGroup[i] , EM_RoleValue_IsWalk , 0 )
								MoveDirect(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3])
								--Say(MonsterGroup[i],OwnerID().."RUN".." dis = "..math.sqrt( (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2))
							elseif (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2 >= 10^2 then
								WriteRoleValue( MonsterGroup[i] , EM_RoleValue_IsWalk , 1 )
								MoveDirect(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3])
								--Say(MonsterGroup[i],OwnerID().."WALK".." dis = "..math.sqrt( (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2))
							else
								--Say(MonsterGroup[i],OwnerID().."STOP".." dis = "..math.sqrt( (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2))
								MoveSetp = MoveSetp +1
							end
							--DebugMsg( 0, RoomID ,OwnerID().." is FINISH")
						end
						--end
						if MoveSetp >= (table.getn(MonsterGroup) - DeadNumber ) then
							SetModeEx(  OwnerID(), EM_SetModeType_Move, true )--����
						end
					end
					Xtime = 0
				end
			else
				--DebugMsg( 0, RoomID ,OwnerID().." Attack")
				if AttTarget ~= 0 then
					for i = 1 ,table.getn(MonsterGroup) do
						SetAttack(MonsterGroup[i],AttTarget)
						--DebugMsg( 0, RoomID ,"Attack "..AttTarget)
					end
				end
			end
		end
		OldPos = NewPos
		Xtime = Xtime + 1
		Sleep(10)
	--	for i = 1, table.getn(PosIn) do
	--		DelObj(PosIn[i])
	--	end
	end
	--	for i = 1, table.getn(PosIn) do
	--		DelObj(PosIn[i])
	--	end
	--�����F�A�S���n�~����H�A��ۤv��F
	DelObj(OwnerID())
	--LuaFunc_ResetObj(OwnerID())
end
function LuaGuildSW_BornSoldier()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local BornObj = {}
	BornObj[1] = CreateObjByFlag( 102398, 780288, 2, 1 );
	BornObj[2] = CreateObjByFlag( 102398, 780192, 2, 1 );
	for i = 1 ,2 do
		SetModeEx( BornObj[i], EM_SetModeType_Fight, false )--�i�������
		SetModeEx(  BornObj[i], EM_SetModeType_Strikback, false )--����
		SetModeEx(  BornObj[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx(  BornObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx(  BornObj[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx(  BornObj[i], EM_SetModeType_Drag , false )--���O
		SetModeEx(  BornObj[i], EM_SetModeType_Gravity, false )--���O
		SetModeEx(  BornObj[i], EM_SetModeType_Move, true )--����
		SetModeEx(  BornObj[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx(  BornObj[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx(  BornObj[i], EM_SetModeType_Show, false )--���
		WriteRoleValue( BornObj[i] , EM_RoleValue_IsWalk , 0 )
		AddToPartition( BornObj[i] ,  RoomID  )
	end
	BeginPlot(BornObj[1],"LuaGuildSW_Born1Script",0)
	BeginPlot(BornObj[2],"LuaGuildSW_Born2Script",0)
	return BornObj
end
function LuaGuildSW_HelpFlag()
	local AttTarget = 0
	local Boss = ReadRoleValue( OwnerID(), EM_RoleValue_PID )	
	while 1 do
		if HateListCount( OwnerID()) == 0 then
		else
			AttTarget = ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID)
			SetAttack( Boss, AttTarget)
		end
		Sleep(10)
	end
end