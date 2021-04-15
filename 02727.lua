function Lua_z24q425545_0()	--���
	local Player = OwnerID()
	local King = TargetID()

	if CheckAcceptQuest(Player,425545)==true and CheckFlag(Player,546881)==false then
		SetSpeakDetail(Player, "[SC_Z24Q425545_01]")
		AddSpeakOption(Player,King,"[SC_Z24Q425545_02]","Lua_z24q425545_3",0);			
	else
		LoadQuestOption(Player)
	end
end
function Lua_z24q425545_1()	--���
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425545)==true and CheckFlag(OwnerID(),546881)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_Z24TEST1]","Lua_z24q425545_2",0);
	end
end
function Lua_z24q425545_2()
	SetSpeakDetail( OwnerID(),"[SC_Z24Q425545_01]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24Q425545_02]", "Lua_z24q425545_3", 0 )
end
function Lua_z24q425545_3()	--�I�s��t
	local PlayerList01 = SearchRangePlayer(TargetID(), 200)
	local PlayerList02 = {}
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		Say( TargetID(),"[SC_Z24Q425545_03]" );
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
		CloseSpeak(OwnerID());
	else
		WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )
		for j = 0,#PlayerList01 do
			if CheckAcceptQuest(PlayerList01[j], 425545)==true and			--�L�o�����Ȫ����a
			CheckFlag(PlayerList01[j],546881)==false		then
				table.insert(PlayerList02, PlayerList01[j])
			end
		end
		CallPlot( TargetID(),"Lua_z24q425545_4",PlayerList02 )
		CloseSpeak( OwnerID() );
	end
end
function Lua_z24q425545_4(PlayerList02)
	local O_ID = OwnerID()				--���bNPC���W���t���@��
	local QuestID = 425545				--���Ƚs��
	local FinishFlagID = 546881			--����������o���X��
	local CheckBuffID = 623514			--�ˬd�O�_���b�t����BUFF
	local CheckRange = 200				--�t�����ˬd�d��
	local ActorArray = {}				--(�s���ק�)�t���}�C��
	local FlagID = 781177				--�����flag�G11��15
--	DebugMsg(0,0,"start")
	local Music = 0

	for k=1,#PlayerList02 do	
--		Say(PlayerList02[k],"11")					
		Lua_StopBGM(PlayerList02[k])					--����I������
		Music = PlayMusicToPlayer(PlayerList02[k],"music/zone/022/evil/dark_tales_04_SIV_chaos_club.mp3", false)	--���񭵼�
		WriteRoleValue(PlayerList02[k], EM_RoleValue_Register5, Music)	--�⭵�ּg�J���a���W
	end

		ActorArray[1] = CreateObjByFlag( 121061, FlagID, 2, 1 ) 	 --�H��
		ActorArray[2] = CreateObjByFlag( 121062, FlagID, 12, 1 ) 	--���F
		ActorArray[3] = CreateObjByFlag( 121063, FlagID, 13, 1 ) 	--�ɦ�X�w
		ActorArray[4] =CreateObjByFlag( 121063, FlagID, 14, 1 )	--�ɦ�X�w2
		ActorArray[5] =CreateObjByFlag( 121063, FlagID, 15, 1 )	--�ɦ�X�w3
		CallPlot( O_ID, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--�d������Ϊ��ˬd�禡
		for i=1, 3 do
			AddToPartition( ActorArray[i], 0 )
			ks_ActSetMode( ActorArray[i] )
		end
	--�d������Ϊ��ˬd�禡
		Sleep(20)
		PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_POINT)
		FA_FaceFlagEX( ActorArray[1], FlagID, 13, 0, 0 )
		Yell(ActorArray[1],"[SC_Z24Q425545_04]", 3)	--�S�Q�ӳo�̷M�˧ڭ̶ܡI
		Sleep(25)
		PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
		Yell(ActorArray[1],"[SC_Z24Q425545_05]", 3)
		Sleep(30)
		PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
		Yell(ActorArray[3],"[SC_Z24Q425545_06]", 3)	--�~�����H���A���Ƥߤӭ��F
		Sleep(25)
		PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_POINT)
		Yell(ActorArray[3],"[SC_Z24Q425545_07]", 3)
		Sleep(30)
		DelObj(ActorArray[3])
		AddToPartition(ActorArray[4], 0 )
		PlayMotion(ActorArray[4],ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		Yell(ActorArray[4],"[SC_Z24Q425545_08]", 3)
		FA_FaceFlagEX( ActorArray[1], FlagID, 14, 0, 0 )
		Sleep(25)
		Yell(ActorArray[1],"[SC_Z24Q425545_09]", 3)
		Sleep(15)
		DelObj(ActorArray[4])
		AddToPartition(ActorArray[5], 0 )
		PlayMotion(ActorArray[5],ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
		Yell(ActorArray[5],"[SC_Z24Q425545_10]", 3)
		Sleep(35)
		Yell(ActorArray[5],"[SC_Z24Q425545_11]", 3)
		Sleep(35)
		PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
		Yell(ActorArray[2],"[SC_Z24Q425545_12]", 3)
		Sleep(20)
		DelObj(ActorArray[5])
		ActorArray[3] = CreateObjByFlag( 121063, FlagID, 13, 1 ) 	--�ɦ�X�w
		AddToPartition(ActorArray[3], 0 )
		FA_FaceFlagEX( ActorArray[1], FlagID, 13, 0, 0 )
		PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		Yell(ActorArray[3],"[SC_Z24Q425545_13]", 3)
		Sleep(25)
		ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- �����X��\���~
end

--2012/07/04 425550 �U�_��������
function Lua_z24Q425550_setPlot_touch()
		SetPlot( OwnerID(),"touch","Lua_z24Q425550_after_touch",30 );
end
function Lua_z24Q425550_after_touch()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
		DW_CancelTypeBuff(68,O_ID)	--�U��
		if BeginCastBarEvent( O_ID, T_ID,"[SC_421029_2]", 20, 131, 133, 0, "Lua_z24Q425550_beginCastBar" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
end
function Lua_z24Q425550_beginCastBar(ObjID, CheckStatus)
	local O_ID = TargetID() 	-- ���a
	local T_ID = OwnerID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )		
			CallPlot(O_ID,"Lua_z24Q425550_CreatOBJ",O_ID,T_ID)	--�ͤ���t���ͤ@���Y�W�������z���H
		else
			-- ����
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end	
function Lua_z24Q425550_CreatOBJ()
--	local PID=ReadRoleValue( T_ID , EM_RoleValue_PID )
--	local n=ReadRoleValue( O_ID,EM_RoleValue_Register10 )
	local T_ID = OwnerID()
	local OBJ = LuaFunc_CreateObjByObj( 119825, T_ID )
		SetModeEx( OBJ  , EM_SetModeType_Mark, false )--�аO
		SetModeEx( OBJ  , EM_SetModeType_Revive, false )--����
		SetModeEx( OBJ  , EM_SetModeType_ShowRoleHead, false )	--�Y����
		SetModeEx( OBJ  , EM_SetModeType_HideName, true )		--�W��
		AddBuff(OBJ,621795,0,9)
--		if Lua_z24Q425550_Check( PID,n,T_ID ) then
--			WriteRoleValue( O_ID,EM_RoleValue_Register10,n+PID )
--			n=ReadRoleValue( O_ID,EM_RoleValue_Register10 )
--			Say( O_ID,n)
--		end
end

--�P�_���֬O�_�w�Q�I�L�A1�B2�B5�B9
function Lua_z24Q425550_Check( PID,n,T_ID )
		if PID==1 then
			if n==0 or n==2 or n==5 or n==7 or n==9 or n==11 or n==14 or n==16 then
				return true
			else
				return false
			end
		elseif PID==2 then
			if n==0 or n==1 or n==5 or n==6 or n==9 or n==10 or n==14 or n==15 then
				return true
			else
				return false
			end
		elseif PID==5 then
			if n==0 or n==1 or n==2 or n==3 or n==9 or n==10 or n==11 or n==12 then
				return true
			else
				return false
			end				
		elseif PID==9 then
			if n==0 or n==1 or n==2 or n==3 or n==5 or n==6 or n==7 or n==8 then
				return true
			else
				return false
			end
		else
			WriteRoleValue( OwnerID(),EM_RoleValue_Register10,0 )
			ScriptMessage( T_ID,OwnerID(),2,"[SC_Z24Q425550_02]",0 )
		end
end

function Lua_z24Q425550_ClickandCheck()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()
	local TorchList = {}
	TorchList[121152]=547141
	TorchList[121461]=547142
	TorchList[121547]=547143
	TorchList[121548]=547144
	local OrgID = ReadRoleValue(T_ID, EM_RoleValue_OrgID)

	if CheckFlag(O_ID,TorchList[OrgID])==true	then
		ScriptMessage( O_ID,O_ID,2,"[SC_Z24Q425550_03]",0 )
		return false
	end
	return true
end

function Lua_z24Q425550_ClickandOver()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()
	local OrgID = ReadRoleValue(T_ID, EM_RoleValue_OrgID)
	local TorchList = {}
	TorchList[121152]=547141
	TorchList[121461]=547142
	TorchList[121547]=547143
	TorchList[121548]=547144
--	Say(OwnerID(),"22")
	SetFlag(O_ID, TorchList[OrgID],1)
	DW_QietKillOne( 0,101877 )	--�ֳt����"�U�_�U���������"
	ScriptMessage( O_ID,O_ID,2,"[SC_Z24Q425550_02]",0 )
	BeginPlot(T_ID, "Lua_z24Q425550_CreatOBJ", 0)
	return 1
end

--����½���T�Ӧr��
--SC_Q425548_1
--SC_Q425548_2
--SC_Q425548_3

--��ܼ@��
function lua_Z24Q425548_szScript()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player);
	if CheckAcceptQuest(Player,425548)==true	and
	CheckFlag(Player, 546886)==false		then
		AddSpeakOption( Player,NPC,"[SC_Q425548_1]","lua_Z24Q425548_InitNPC",0 );
	end
end
--�_�l
function lua_Z24Q425548_InitNPC()
	local Player = OwnerID()
	local Nynke = TargetID()
	local RNpc = SearchRangeNPC( Nynke,200 )
	--�o�J��
	if ReadRoleValue( Nynke,EM_RoleValue_Register1 )== 1 then
		ScriptMessage( Player,Player,3,"[SC_424528_3]",0)
	else
		CloseSpeak( Player )
		WriteRoleValue( Nynke,EM_RoleValue_Register1,1 )
		CallPlot( Nynke,"lua_Z24Q425548Start",Nynke )
	end
end
--��t
function lua_Z24Q5548_ShowA(Nynke)
	local x,y,z,dir = DW_Location( Nynke )
	local Nynke2 = 121392
--		Say(Nynke,"$#%$ADFADVAD")
		PlayMotion(Nynke,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
		Sleep(20)
		Nynke2 = CreateObj ( Nynke2 , x,y,z,dir , 1)
		SetDefIdleMotion( Nynke2,ruFUSION_MIME_IDLE_SLEEP )
		AddToPartition( Nynke2,0 )
		CallPlot( Nynke2,"lua_Z24Q425548Start",Nynke )
end
--�j��
function lua_Z24Q425548Start( Nynke )
	Var_Z24Q425548MonsterList = {}
--	local Nynke2 = OwnerID()
	local NpcList = SearchRangeNPC( Nynke,100 );
	local PlayerList = SearchRangePlayer( Nynke,200 );
	local showBuff = 620734	--�ȩw��t��
	local Vine = 121457;	--�ý�
	local tVine = {}
	local Player = {}
	local Quest = 425548;
	local amount = 0;
	local FlagID = 546886 ;
	local time = 0
	local num = 0
--		NpcSay(Nynke,"$#%$ADFADVAD")
		PlayMotion(Nynke,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
		Sleep(20)
		--�O�����a�C��åB�Wbuff
		for i=0,#PlayerList-1 do
			if CheckAcceptQuest( PlayerList[i],Quest ) and	--������s
			   CheckFlag( PlayerList[i],FlagID )==false then	--�S�X��
				local x = PlayerList[i]
				AddBuff( x,showBuff,0,-1 )
				Player[ x ] = true
			end
		end
		--����C��
		for i=0,#NpcList do
			if ReadRoleValue( NpcList[i],EM_RoleValue_OrgID) == Vine then
				local x,y,z,dir = DW_Location( NpcList[i] )
				local tmpTree = CreateObj ( 107426 , x,y,z,dir , 1)
					SetModeEx( tmpTree  , EM_SetModeType_ShowRoleHead, false )--�Y����
					SetModeEx( tmpTree  , EM_SetModeType_HideName, true )--�W��
					SetModeEx( tmpTree  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( tmpTree  , EM_SetModeType_Move, false )--����
					SetModeEx( tmpTree  , EM_SetModeType_Strikback, false )--����
					SetModeEx( tmpTree  , EM_SetModeType_Gravity, false )--���O
					SetModeEx( tmpTree  , EM_SetModeType_Fight , true )--�i���
					SetModeEx( tmpTree  , EM_SetModeType_Mark , false )
				AddToPartition( tmpTree,0 )
				tVine[ tmpTree ] = true
			end
		end
		--�P�w�ΰj��}�l
		while true do
			num = 0
			--�P�_���a�s�b
			for i,v in pairs(Player) do
				if 	CheckAcceptQuest( i,Quest ) == false or	 --�S����
					ReadRoleValue( i,EM_RoleValue_IsDead )==1 or --0�����A1����
				   	CheckFlag( i,FlagID ) == true or		 --���X��
					CheckDistance( i,Nynke,200) ==false or
					CheckID( i ) ==false then			 --�٦b
					CancelBuff( i, showBuff ) 
					Player[i]=nil
				end
				num = num + 1
			end
			if num == 0 then
				--call���Ѫ�t
				lua_Z24Q425548DelMonster()
					for i,v in pairs( tVine ) do
						DelObj(i)
					end
				PlayMotion(Nynke,ruFUSION_ACTORSTATE_SLEEP_END)
				WriteRoleValue( Nynke,EM_RoleValue_Register1,0 )
				DebugMsg(0,0,"-Quest425548,NOPLAYER,FALSE-")
				return
			end
			--�P�_�O�_����, �u�n���@�ʾ𦺤`�Y����
			for i,v in pairs( tVine ) do
				if ReadRoleValue( i,EM_RoleValue_IsDead )==1 or	--0�����A1����
					CheckID( i ) ==false then 
					lua_Z24Q425548DelMonster()
						for i,v in pairs(Player) do
							ScriptMessage(i,i,3,"[SC_Q425548_2]",0)
							CancelBuff( i, showBuff ) 
							Player[i]=nil		
						end
						for i,v in pairs( tVine ) do
							DelObj(i)
						end
					WriteRoleValue( Nynke,EM_RoleValue_Register1,0 )
					PlayMotion(Nynke,ruFUSION_ACTORSTATE_SLEEP_END)
					DebugMsg(0,0,"-Quest425548,NOTREE,FALSE-")
					return
				end
			end
			num = 0
			--�P�w�O�_�X�Ƕ��q
			for i,v in pairs( Var_Z24Q425548MonsterList ) do
				num = num + 1
			end
			if num==0 and time >= 3 then
				amount = amount+1;		--�P�w�X�X�i
				DebugMsg(0,0,"-Quest425548,Monster-"..amount )
				--�P�w�X��
				if amount <= 2 then
					--�{�T��
					for i,v in pairs(Player) do
						ScriptMessage(i,i,3,"[SC_Q425548_3]",0)		
					end
					--call��
					for i,v in pairs( tVine ) do
						CallPlot( i,"lua_Z24Q425548PMonster",0 )
					end
				else
					--call���\
					lua_Z24Q425548DelMonster()
						for i,v in pairs(Player) do
							ScriptMessage(i,i,3,"[SC_Q425548_2]",0)
							CancelBuff( i, showBuff ) 
							SetFlag( i,546886,1 )
							Player[i]=nil		
						end
						for i,v in pairs( tVine ) do
							DelObj(i)
						end
					WriteRoleValue( Nynke,EM_RoleValue_Register1,0 )
					PlayMotion(Nynke,ruFUSION_ACTORSTATE_SLEEP_END)
					--DelObj( Nynke2 )
					DebugMsg( 0,0,"-Quest425548,Success-" )
					return
				end
			end
		Sleep(10)
		time = time +1
		--DebugMsg(0,0,"-Quest425548,Repeat-")
	end
end
--�R���Ҧ��Ǫ�
function lua_Z24Q425548DelMonster()
	if Var_Z24Q425548MonsterList ==nil then return end
	for i,v in pairs(Var_Z24Q425548MonsterList) do
		if Var_Z24Q425548MonsterList[i]==true then
			DelObj(i)
			Var_Z24Q425548MonsterList[i]=nil
		end
	end
	Var_Z24Q425548MonsterList = nil
end
--�e��200�B����
function lua_Z24Q425548PMonster()
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local RoomID = Owner:RoomID();
	local Monster = 107497;
	local amount = 1;
	local dis = 200;
	local Range = 40;
	local ObjTable = {};
	local tmpX = BaseX+dis*math.cos(BaseDir*math.pi/180)
	local tmpZ = BaseZ-dis*math.sin(BaseDir*math.pi/180)
	local tmpY = GetHeight( tmpX,BaseY,tmpZ )
	local tmpDir = BaseDir + 180
		if tmpDir >= 360 then	tmpDir = tmpDir - 360 end
		while #ObjTable < amount do
			local RanNum = math.random(360);
			local X = tmpX -Rand(Range)*math.cos(math.pi/180*RanNum);
			local Z = tmpZ +Rand(Range)*math.sin(math.pi/180*RanNum);
			local Y = GetHeight( X , tmpY , Z );
				if CheckLine( OwnerID() , X,Y,Z ) then
					ObjTable[#ObjTable+1] = CreateObj(Monster,X,Y,Z,tmpDir,1);
				end
		end
		for k,v in pairs(ObjTable) do
			MoveToFlagEnabled( v, false )
			AddToPartition(v,RoomID);
			CallPlot( v,"lua_Z24Q5548MstInitDrama",OwnerID() )
			SetPlot( v,"dead","lua_Z24Q5548MstDeadDrama",0 )
		end
end
--�Ǫ���l�@��
function lua_Z24Q5548MstInitDrama( Obj )
--	Var_Z24Q425548MonsterList = Var_Z24Q425548MonsterList or {}
	Var_Z24Q425548MonsterList[OwnerID()] = true
	SysCastSpellLv( Obj,OwnerID(),496216,1 )
end
--�Ǫ����`�@��
function lua_Z24Q5548MstDeadDrama()
	Var_Z24Q425548MonsterList[OwnerID()] = nil
end