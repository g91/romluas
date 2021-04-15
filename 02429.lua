function Lua_Zone21_Sinter_SkillLvInfo()
	local SkillLv = {	80,		--����ˮ`
			100,		--�e�记��
			6,		--�I��
			11,		--���
			0,		--�@��
                                 	3,		--�ľW��
                        	      	0,		--��������
                        	      	0,		--��r
			0,		--�P�����Y
			1	};	--�p�ǭI��

	return SkillLv;
end
function Lua_Zone21_Sinter_SkillInfo()
	local SkillList = {	498013,	--����ˮ`
				498014,	--�e�记��
				498015,	--�I��
				498016,	--���
				620102,	--�@��
				498018,	--�ľW��
				498019,	--��������
		                            498020,	--��r
				498021,	--�P�����Y
				498015};	--�p�ǭI��
	return SkillList;
end
function Lua_Zone21_Sinter_isGM()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Job = ReadRoleValue(TargetID(),EM_RoleValue_VOC)
--	DebugMsg( 0, RoomID ,"Job = "..Job);
	if Job == 0 then
--		DebugMsg( 0, RoomID ,"GM No DMG ");
		return false;
	end
	return true;
end
function Lua_Zone21_Sinter_isGM_DOT()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Job = ReadRoleValue(TargetID(),EM_RoleValue_VOC)
--	DebugMsg( 0, RoomID ,"Job = "..Job);
	if Job == 0 then
--		DebugMsg( 0, RoomID ,"GM No DMG ");
		return false;
	end
	KS_ScriptMessage( "[SC_SINTER_SKILL_4_1]" )--���\
	return true;
end
function Lua_Zone21_Sinter_Door()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local ExitDoor = {}
	for i=1,2 do
		if Lua_Zone21_Sinter_Globel[RoomID].Door[i] == nil then
			ExitDoor[i] = CreateObjByFlag( 106012, 780975 , i , 1 )--�X�f���ת�
			DebugMsg( 0, RoomID ,"nil Door lllll..."..i.." ID = "..ExitDoor[i]);
			Lua_Zone21_Sinter_Globel[RoomID].Door = {ExitDoor[1],ExitDoor[2]}
			kg_DoorInit( ExitDoor[i] );
			AddToPartition( ExitDoor[i] , RoomID );
		end
	end
	CallPlot( Lua_Zone21_Sinter_Globel[RoomID].Door[1], "Lua_Zone21_CloseDoor", true,Lua_Zone21_Sinter_Globel[RoomID].GUID )
	CallPlot( Lua_Zone21_Sinter_Globel[RoomID].Door[2], "Lua_Zone21_CloseDoor", false,Lua_Zone21_Sinter_Globel[RoomID].GUID )
	return ExitDoor;
end
function Lua_Zone21_Sinter_Main()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	if Lua_Zone21_Sinter_Globel ==nil then
		Lua_Zone21_Sinter_Globel = {};
	end
	if Lua_Zone21_Sinter_Globel[RoomID] ~=nil then
		local Globel = Lua_Zone21_Sinter_Globel[RoomID];
		if Globel.Door[1]~=nil then Delobj(Globel.Door[1]); end
		if Globel.Door[2]~=nil then Delobj(Globel.Door[2]); end
		Lua_Zone21_Sinter_Globel[RoomID]={GUID=0 ,Cloud={},Flag={},Setp="Nomal",Door={}};
		local trash = {105551,105816,105823,105464,105453,103126,105452,106014};
		Lua_DavisDelObj( trash );
		Lua_Zone21_Sinter_Door();
	else
		Lua_Zone21_Sinter_Globel[RoomID] = {GUID=0 ,Cloud={},Flag={},Setp="Nomal",Door={}};
		Lua_Zone21_Sinter_Door();
	end
	local OID = OwnerID();

	local Distane = 500;
	local Boss = CreateObjByFlag ( 105452 , 780975, 0 ,1 );
	SetPlot(Boss,"dead","Lua_Zone21_Sinter_deadEvent",0)
	--������
	--SetModeEx(  Boss, EM_SetModeType_Show, false );--���
	AddToPartition(Boss,RoomID);
	SetFightMode (  Boss  , 0, 0, 0, 0 );
	AddBuff(Boss,507899,0,-1);--���i����BUFF
	SetPlot( OID , "Collision" , "Lua_Zone21_Sinter_Collision" , 0 );
	Lua_Zone21_Sinter_Globel[RoomID].GUID = Boss;
	SetPosByFlag( Boss , 780975 , 3 )
	PlayMotion( Boss, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	SetDefIdleMotion( Boss, ruFUSION_MIME_IDLE_CROUCH )
	local Fight;
	local Ctrl=0;
	local Clear=0;
	local isDead;
	while 1 do
		Fight = ReadRoleValue(Boss,EM_RoleValue_Register1);
		Ctrl = ReadRoleValue(OID,EM_RoleValue_Register1);
 		isDead = ReadRoleValue(Boss,EM_RoleValue_Register2);
		if isDead == 1 then--���w�{
			break;
		else
			if CheckID(Boss)== true then
--				DebugMsg( 0, RoomID ,"Clear .."..Clear.." Fight = "..Fight);
				if kg_GetDis(Boss,780975,0)>=Distane then
					KS_ScriptMessage("[SC_SINTER_BOSS_TOOFAR]");
					DelObj(Lua_Zone21_Sinter_Globel[RoomID].GUID);--�R��BOSS
					Boss = CreateObjByFlag ( 105452 , 780975, 0 ,1 );
					AddToPartition(Boss,RoomID);
					SetPlot(Boss,"dead","Lua_Zone21_Sinter_deadEvent",0)
					Lua_Zone21_Sinter_Globel[RoomID].GUID = Boss;
					CallPlot( Lua_Zone21_Sinter_Globel[RoomID].Door[2], "Lua_Zone21_CloseDoor", false,Lua_Zone21_Sinter_Globel[RoomID].GUID )
				end
			end
			if Ctrl == 1 and Fight ==1 then --�i�J�԰�
				Clear = 1;
			elseif Clear ==1 and Fight == 0 and Ctrl == 1 then--���}�԰�
				--SetPlot( OID , "Collision" , "Lua_Zone21_Sinter_Collision" , 0 );
				SetPosByFlag( BOSS , 780975 , 0 )
				WriteRoleValue(OID,EM_RoleValue_Register1,0);
				Clear =0;
			end
		end
		Sleep(10);
	end
end
function Lua_Zone21_Sinter_Collision()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Zone21_Sinter_Globel[RoomID].GUID;
	if ReadRoleValue(OwnerID(),EM_RoleValue_VOC)~=0 then
		SetPlot( TargetID() , "Collision" , "" , 0 );
		PlayMotion( BOSS, ruFUSION_ACTORSTATE_CROUCH_END )
		SetDefIdleMotion( BOSS, ruFUSION_MIME_IDLE_STAND )
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,1);--�wĲ�I
		SetModeEx(  BOSS, EM_SetModeType_Show, false );--���
		KS_ScriptMessage("[SC_SINTER_SKILL_START]");
		BeginPlot(TargetID(),"Lua_Zone21_Sinter_Collision_Plot",50);
	end
end
function Lua_Zone21_Sinter_Collision_Plot()--�}�l�t���F
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Zone21_Sinter_Globel[RoomID].GUID;
	local shadow = CreateObjByFlag ( 105452 , 780975, 0 ,1 );
	SetModeEx( shadow  , EM_SetModeType_Strikback, false );--����
	SetModeEx( shadow  , EM_SetModeType_SearchenemyIgnore, false );--�Q�j�M
	SetModeEx( shadow  , EM_SetModeType_Obstruct, false );--����
	SetModeEx( shadow  , EM_SetModeType_Mark, false );--�аO
	SetModeEx( shadow  , EM_SetModeType_Move, false );--����
	SetModeEx( shadow  , EM_SetModeType_Searchenemy, false );--����
	SetModeEx( shadow  , EM_SetModeType_ShowRoleHead, false );--�Y����
	SetModeEx( shadow  , EM_SetModeType_Fight , false );--�i�������
	AddToPartition(shadow,RoomID);
	TempPlayer = SetSearchAllPlayer(RoomID) --���{�b�ӰϤ����Ҧ����a
	ThesePlayer = {}
	--�}�l�t��
	DebugMsg( 0, RoomID ,"Start Fly ..");
	local AttackTarget = {};
	local LastTarget = 0;
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		local job = ReadRoleValue(ThesePlayer[i],EM_RoleValue_VOC);
		if job == 0 then
			DebugMsg( 0, RoomID ,"No Fly .."..i.." , it's GM!! Name=>"..GetName(ThesePlayer[i]));
		else
			DebugMsg( 0, RoomID ,"Will Fly and Stun .."..i.." job is "..Job);
			AddBuff(ThesePlayer[i],500725,0,3);
			table.insert(AttackTarget,1,ThesePlayer[i]);
		end
	end
	DebugMsg( 0, RoomID ,"Not GM => "..table.getn(AttackTarget));
	for i,v in ipairs(AttackTarget) do
		SetPosByObjDis(shadow,v,-10);
		if i == table.getn(AttackTarget) then
			sysCastSpellLv( shadow , v , 498022, 0);
			CastSpellLv( shadow ,v  , 498015, 0);
			LastTarget = v;
			DebugMsg( 0, RoomID ,"Attack .."..i.." it's "..GetName(v));
		else
			sysCastSpellLv( shadow , v , 498022, 0);
		end
		Sleep(10);
	end
	DebugMsg( 0, RoomID ,"End Fly ..");
	DelObj(shadow);
	--�t�������X�{
	SetPosByFlag( BOSS , 780975 , 0 )
	SetModeEx(  BOSS, EM_SetModeType_Show, true );--���
	SetFightMode (  BOSS  , 1, 1, 1, 1 );
	CancelBuff (BOSS,507899);--���i����BUFF
	SetAttack(BOSS,LastTarget);
end
function SetPosByObjDis(Obj,TObj,Dis, face)
	local Org = Role:new( TObj  )
	local Pos = {}
	local Dir = Org:Dir()
	local  NewRole
	local Cal
	if face == nil or Type( face) ~= "number" then
		face = 0
	end
	Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = Org:X() +(Dis*math.cos(Cal))
	Pos["Z"] = Org:Z() - (Dis*math.sin(Cal))
	Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] );
	for i = 1 , 9 , 1 do
		if CheckLine( Obj , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
			Pos["X"] = Org:X() +(Dis*math.cos(Cal))*(10-i)/10
			Pos["Z"] = Org:Z() -(Dis*math.sin(Cal))*(10-i)/10
			Pos["Y"] = GetHeight( Pos["X"] ,  Org:Y() , Pos["Z"] )
		else
			break
		end
	end
	if Dis >= 0 then
		Dir = Dir +180-face
	else
		Dir = Dir + face
	end
	if Dir > 360 then
		Dir = Dir - 360
	end
	if Dir < 0 then
		Dir = Dir + 360
	end
	SetPos ( Obj , Pos["X"]  , Pos["Y"] , Pos["Z"] , Dir )
end


function Lua_Zone21_Sinter_FightEvent()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1) --�}�l�԰�
	KS_ScriptMessage("[SC_SINTER_SKILL_START_1]");
	MoveToFlagEnabled(OwnerID(),false);
	AddBuff(OwnerID(),506700,0,-1);
	BeginPlot(OwnerID(),"Lua_Zone21_Sinter_Fight_Ai",0);
	CallPlot( Lua_Zone21_Sinter_Globel[RoomID].Door[2], "Lua_Zone21_CloseDoor", true,Lua_Zone21_Sinter_Globel[RoomID].GUID )
end
function Lua_Zone21_Sinter_ResetAll()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Zone21_Sinter_Globel[RoomID].GUID;
	WriteRoleValue(BOSS,EM_RoleValue_Register1,0); --���}�԰�
	BeginPlot(BOSS,"Lua_Zone21_Sinter_ResetObj",0);
end
function Lua_Zone21_Sinter_FiEndEvent()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local TempPlayer = SetSearchAllPlayer(RoomID) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	local BuffID = {620107,509617}
	WriteRoleValue(Boss,EM_RoleValue_Register1,0); --���}�԰�
	CallPlot( Lua_Zone21_Sinter_Globel[RoomID].Door[2], "Lua_Zone21_CloseDoor", false,Lua_Zone21_Sinter_Globel[RoomID].GUID )
--	DebugMsg( 0, RoomID ,"Now leave Fight...");
	SetModeEx(  Boss, EM_SetModeType_Show, true );--���
--	SetFightMode (  Boss  , 0, 0, 0, 0 );
--	AddBuff(Boss,507899,0,-1);--���i����BUFF
	CancelBuff(Boss,506700)--�MBUFF
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		for j,v in ipairs(BuffID) do
			CancelBuff(ThesePlayer[i],BuffID[j])--�MBUFF
		end
	end
end
function Lua_Zone21_Sinter_deadEvent()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	--SetModeEx(  OwnerID(), EM_SetModeType_Show, true );--���
	CallPlot( Lua_Zone21_Sinter_Globel[RoomID].Door[1], "Lua_Zone21_CloseDoor", false,Lua_Zone21_Sinter_Globel[RoomID].GUID)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,1);
	KS_ScriptMessage("[SC_SINTER_BOSSDEAD]");
	local ChestID = {100292,105551,105816,105823,105464,105453,106014,117816}
	Lua_DavisDelObj( ChestID );
	return true
end
function Lua_Zone21_Sinter_NomalSkill(AttackTarget,Clock)
	local SkillList = Lua_Zone21_Sinter_SkillInfo();
	local SkillLv = Lua_Zone21_Sinter_SkillLvInfo();
	if Clock[3] % 7 == 0  then
		local AA = DW_rand(2)
		if AA == 1 then
			--����ˮ`
			CastSpellLv( OwnerID() , AttackTarget  , SkillList[1], SkillLv[1]);
		else
			--�e�记��
			CastSpellLv( OwnerID() , AttackTarget  , SkillList[2], SkillLv[2]);
		end
	elseif Clock[3] % 9 == 0 then
		--�I��
		local TT = LuaFunc_GetAnotherPartyPlayer(AttackTarget);
		KS_ScriptMessage( "[SC_SINTER_SKILL_3][$SETVAR1 = "..GetName(TT).."]" );
		Sleep(10);
		CastSpellLv( OwnerID() , TT  , SkillList[3], SkillLv[3]);
	end;
end
function Lua_Zone21_Sinter_WaitSkill(SpellTime)
	SpellTime = SpellTime or 65536
	local OID = OwnerID();
	for i=1, SpellTime do
		if ReadRoleValue( OID , EM_RoleValue_SpellMagicID ) == 0 then
			return 1
		end
		Sleep(10)
	end
	return 0
end
function Lua_Zone21_Sinter_Fight_Ai()
	local BOSS = OwnerID();
	local RoomID= ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	WriteRoleValue (BOSS,EM_RoleValue_Register2,0);--���s�p��
	local FightState = 1;
	local Clock = {0,0,0,0};
	local SkillList = Lua_Zone21_Sinter_SkillInfo();
	local SkillLv = Lua_Zone21_Sinter_SkillLvInfo();
	local AttackTarget;
	local NowCastSpell = 0;
	local HPP = 0;
	local Globel = Lua_Zone21_Sinter_Globel[RoomID];
	local CrazyTime = 4800;
	local Crazy = false;
	local FlagCount = GetMoveFlagCount ( 780912 );
	local Second = 0;
	local MonsterState = 0;
	local MonsterState2 = 0;
	local Msg = "";
	local NewMsg = "";
	while FightState == 1 do
		FightState = ReadRoleValue(BOSS,EM_RoleValue_Register1);		--�O�_�԰���
		MonsterState = ReadRoleValue(BOSS,EM_RoleValue_Register3);	--���������S
		MonsterState2 = ReadRoleValue(BOSS,EM_RoleValue_Register4);	--����
		AttackTarget = ReadRoleValue( BOSS , EM_RoleValue_AttackTargetID );
		NowCastSpell = ReadRoleValue( BOSS , EM_RoleValue_SpellMagicID );
		HPP =math.floor(ReadRoleValue(BOSS,EM_RoleValue_HP)/ReadRoleValue(BOSS,EM_RoleValue_MaxHP)*100);
		NewMsg = "FightState = "..FightState.." MonsterState = "..MonsterState.." it's "..Globel.Setp.." mode. and HPP = "..HPP
		if Msg ~= NewMsg then
			Msg = NewMsg;
			DebugMsg( 0, RoomID ,Msg);
		end
		if NowCastSpell == 0  then
			if Globel.Setp == "Nomal" then
				if Clock[1] >=13 and  HPP >40 then
					--���@��
					AddBuff(BOSS,SkillList[5], SkillLv[5],-1);
					--sysCastSpellLv( BOSS , BOSS  , SkillList[5], SkillLv[5]);
					KS_ScriptMessage( "[SC_SINTER_SKILL_4]" )--���e
					--���
					CastSpellLv( BOSS , BOSS  , SkillList[4], SkillLv[4]);
					if Lua_Zone21_Sinter_WaitSkill(5) == 1 then
						KS_ScriptMessage( "[SC_SINTER_SKILL_4_2]" )--����
					end
					Clock[1] = 0;
				elseif Clock[2] >=45 and HPP >40 then
						--����
						KS_ScriptMessage( "[SC_SINTER_HIDE][$SETVAR1 = [105452]]" );
						SetModeEx(  BOSS, EM_SetModeType_Show, false );--���
						SetFightMode (  BOSS  , 0, 0, 0, 0 );
						AddBuff(BOSS,507899,0,-1);--���i����BUFF
						--��P��
						--�ˬd���X��
						if ReadRoleValue(Globel.GUID,EM_RoleValue_Register3)<9 then	--���W�̦h�E��
							CastSpellLv( BOSS , AttackTarget  , SkillList[9], SkillLv[9]);
							KS_ScriptMessage( "[SC_SINTER_SKILL_9]" );					
						end
						Globel.Setp = "Hide";
						Clock[2] = 0;
						Clock[1] = 0;

				elseif HPP <=40 and Second == 0 then
					Clock[2] = 45;
					Second = 1;
				elseif HPP <=40 and Clock[2] >=45 and Second == 1 then
					--����
					KS_ScriptMessage("[SC_SINTER_HIDE_BLACK]");
					SetModeEx(  BOSS, EM_SetModeType_Show, false );--���
					SetFightMode (  BOSS  , 0, 0, 0, 0 );
					AddBuff(BOSS,507899,0,-1);--���i����BUFF
					Globel.Setp = "Hide";
					Clock[2] = 0;
					Clock[1] = 0;
					--�X5����(105816)
					Globel.Flag =  Lua_Table_GetRdIndex(FlagCount,9);
					local FirstBorn = {Globel.Flag[1],Globel.Flag[2],Globel.Flag[3],Globel.Flag[4],Globel.Flag[5]}
					Globel.Cloud = Lua_Sinter_BornByFlagGroup(BOSS,105816,780912,FirstBorn,RoomID)
					for i,v in ipairs(Globel.Cloud) do AddBuff(v,620517,0,-1); end
					local RAA = math.random(table.getn(Globel.Cloud))
					WriteRoleValue(Globel.Cloud[RAA],EM_RoleValue_Register1,1);--�g�J�������T��l
					WriteRoleValue(BOSS,EM_RoleValue_Register4,5);--�g�J�{�b���X�Ӷ���
				else
					--�S��ޯೣ�S���Ψ�N�񴶳q�ޯ�
					Lua_Zone21_Sinter_NomalSkill(AttackTarget,Clock);
				end;
			elseif Globel.Setp == "Hide" then
				if HPP>40 then
					if MonsterState ~= 0 and Clock[1] < 30 then
						if Clock[2] >=3 then
							--�ľW��
							Lua_Zone21_Sinter_shadowHit(AttackTarget,RoomID);
							KS_ScriptMessage( "[SC_SINTER_SKILL_6]" );
							Clock[2] = 0;
						end;
					else
						--�{��
						KS_ScriptMessage( "[SC_SINTER_SHOW][$SETVAR1 = [105452]]" );
						SetModeEx(  BOSS, EM_SetModeType_Show, true );--���
						SetFightMode (  BOSS  , 1, 1, 1, 1 );	
						CancelBuff(BOSS,507899);--�������i����BUFF
						SetAttack(BOSS,AttackTarget);
						Globel.Setp = "Nomal";
						Clock[1] = 0;
						Clock[2] = 0;
					end;
				else
					if MonsterState2 ~= 0  and Clock[1] < 30 then
						--KS_ScriptMessage( "Clock = "..Clock[1] );
						DebugMsg( 0, RoomID ,"Clock = "..Clock[1]);
					--	if Clock[1] %3 ==0 then
					--		--��������
					--		local HowMuch = table.getn(Globel.Cloud)
					--		local ATT = LuaFunc_GetAnotherPartyNPlayer(AttackTarget,HowMuch)
					--		for i,v in ipairs(Globel.Cloud) do
					--			if ATT[i]== nil then
					--				i=i-HowMuch;
					--			end
					--			CastSpellLv( v , ATT[i]  , SkillList[7], SkillLv[7]);
					--		end
					--		KS_ScriptMessage( "[SC_SINTER_SKILL_8]" );
					--		Clock[2] = 0;
					--	end;
					else
						--�M������
						Lua_DavisDelObj( 105816 );
						Globel.Cloud = {};
						KS_ScriptMessage( "[SC_SINTER_SHOW][$SETVAR1 = [105452]]" );
						--�{��
						SetModeEx(  BOSS, EM_SetModeType_Show, true );--���
						SetFightMode (  BOSS  , 1, 1, 1, 1 );
						CancelBuff(BOSS,507899);--�������i����BUFF
						SetAttack(BOSS,AttackTarget);
						if Clock[1] >= 30 then
							--������a
							local ATT = LuaFunc_GetAnotherPartyPlayer(AttackTarget);
							SetPosByObjDis(BOSS,ATT,-10);
							sysCastSpellLv( BOSS , ATT  ,497587, 0);
						else
							Clock[2] = 0;
						end
						Clock[1] = 0;
						Globel.Setp = "Nomal";
						--Clock[2] = 0;
					end
				end
			end;
		else
--			DebugMsg( 0, RoomID ,"Now Casting...");
		end
		if Clock[4]>=CrazyTime and Crazy == false then
			KS_ScriptMessage("[SC_SINTER_RUSH]");
			AddBuff(BOSS,620276,0,-1);
			Crazy = true;
		end
		Sleep(10);
		for i = 1,table.getn(Clock) do
			Clock[i] = Clock[i] + 1;
		end;
	end;
--	if Globel.Setp == "Hide" then
--		--�{��
--		SetModeEx(  BOSS, EM_SetModeType_Show, true );--���
--		SetFightMode (  BOSS  , 1, 1, 1, 1 );
--	end;
	KS_ScriptMessage( "[SC_SINTER_ALLDEAD]" )--����
	local ChestID = {100292,105551,105816,105823,105464,105453,106014,117816,}
	Lua_DavisDelObj( ChestID );
	BeginPlot(BOSS,"Lua_Zone21_Sinter_ResetObj",0)
end;
function Lua_Zone21_Sinter_ResetObj()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Boss = Lua_Zone21_Sinter_Globel[RoomID].GUID;
	SetModeEx(  Boss, EM_SetModeType_Show, false );--���
	Lua_CancelAllBuff( Boss ); --�M���Ҧ�buff
	-- �]�w����
--	DelFromPartition( OwnerID());
	-- ���]NPC���	
	Sleep( 50 );
	-- ���s�[�J���ΰ�
	local NewBoss = CreateObjByFlag ( 105452 , 780975, 0 ,1 );
	Lua_Zone21_Sinter_Globel[RoomID].GUID = NewBoss;
	AddToPartition( NewBoss, RoomID );
	SetPlot(NewBoss,"dead","Lua_Zone21_Sinter_deadEvent",0);
	SetPosByFlag( NewBoss , 780975 , 0 )
	DelObj(Boss);
end
function Lua_Zone21_Sinter_shadowHit(AttackTarget,RoomID)
	local SkillList = Lua_Zone21_Sinter_SkillInfo();
	local SkillLv = Lua_Zone21_Sinter_SkillLvInfo();
	local TT = LuaFunc_GetAnotherPartyPlayer(AttackTarget);
	local shadow = Lua_CreateObjByDir( TT , 105551 , -70 , 0);
	local shadow2 = Lua_CreateObjByDir( TT , 100292 , 70 , 0);
	SetModeEx( shadow  , EM_SetModeType_Strikback, false );--����
	SetModeEx( shadow  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( shadow  , EM_SetModeType_SearchenemyIgnore, false );--�Q�j�M
	SetModeEx( shadow  , EM_SetModeType_Obstruct, false );--����
	SetModeEx( shadow  , EM_SetModeType_Mark, false );--�аO
	SetModeEx( shadow  , EM_SetModeType_Move, false );--����
	SetModeEx(  shadow  , EM_SetModeType_NotShowHPMP, true )
	SetModeEx( shadow  , EM_SetModeType_Searchenemy, false );--����
	SetModeEx( shadow  , EM_SetModeType_ShowRoleHead, false );--�Y����
	SetModeEx( shadow  , EM_SetModeType_Fight , false );--�i�������
	SetModeEx( shadow2  , EM_SetModeType_Strikback, false );--����
	SetModeEx( shadow2  , EM_SetModeType_SearchenemyIgnore, false );--�Q�j�M
	SetModeEx( shadow2  , EM_SetModeType_Obstruct, false );--����
	SetModeEx( shadow2  , EM_SetModeType_Mark, false );--�аO
	SetModeEx( shadow2  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( shadow2  , EM_SetModeType_Move, false );--����
	SetModeEx( shadow2  , EM_SetModeType_Searchenemy, false );--����
	SetModeEx( shadow2  , EM_SetModeType_ShowRoleHead, false );--�Y����
	SetModeEx( shadow2  , EM_SetModeType_Fight , true );--�i�������
	SetModeEx(  shadow2, EM_SetModeType_Show, false );--���
	AddToPartition(shadow,RoomID);
	MoveToFlagEnabled(shadow,false);
	AddToPartition(shadow2,RoomID);
	MoveToFlagEnabled(shadow2,false);
	CastSpellLv( shadow , shadow2  , SkillList[6], SkillLv[6]);
	BeginPlot(shadow,"Lua_Zone21_Sinter_shadowDead",0);
	BeginPlot(shadow2,"Lua_Zone21_Sinter_shadowDead",0);
end;
function Lua_Zone21_Sinter_shadowDead()
	Sleep(20);
	Delobj(OwnerID());
end;
function Lua_Zone21_Sinter_Poison()--��r�@��
	local RR = Rand(10000);
	if RR > 6666 then
		addbuff ( TargetID() , 509336 , 0 , 120 );
	elseif RR > 3333 then
		addbuff ( TargetID() , 509337 , 0 , 120 );
	else
		addbuff ( TargetID() , 509338 , 0 , 120 );
	end;
end;
function Lua_Zone21_Sinter_BackAttack()--�I��ĪG�@��
	local RR = Rand(10000);
	if RR > 6666 then
		addbuff ( TargetID() , 509291 , 0 , 6 );
	elseif RR > 3333 then
		addbuff ( TargetID() , 509292 , 0 , 6 );
	else
		addbuff ( TargetID() , 620101 , 0 , 6 );
	end;	
end
function Lua_Zone21_Sinter_BackHit()
	local Obj = Role:new( OwnerID() );
	local TargetObj = Role:new( TargetID() );
	local Dir , Dx , Dz;
	Dir = TargetObj:Dir() + 180;
	if Dir > 360 then 
		Dir = Dir - 360;
	end
	Dir = ( 360 - Dir ) / 57.2958;
	for i = 15 , 0 , -5 do
		Dx = math.cos( Dir ) * i
		Dz = math.sin( Dir ) * i
		if  CheckLine( TargetID() , TargetObj:X() + Dx , TargetObj:Y() , TargetObj:Z()+Dz ) == true  then
			break;
		end;
	end;
	SetPos( OwnerID() , TargetObj:X() + Dx , TargetObj:Y() , TargetObj:Z()+Dz , TargetObj:Dir() );
	return true;
end
function Lua_Davis_ResetObj(ObjID,Time)
	-- �]�w����
	DelFromPartition( ObjID)
	-- ���]NPC���	
	local ReviveTime = ReSetNPCInfo( ObjID)
	if ReviveTime*10  < Time then
		Sleep( ReviveTime*10 )
	else
		Sleep( Time )
	end
	-- ���s�[�J���ΰ�
	AddToPartition( ObjID, 0 ) 
end

function Lua_Zone21_Sinter_Throw()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	if ReadRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_Register3)<9 then	--���W�̦h�E��
		local CopyObj = Lua_CreateObjByDir( TargetID() , 105823 , 0 , 0);--���P��
		SetModeEx(  CopyObj  , EM_SetModeType_NotShowHPMP, true )
		AddToPartition(CopyObj,RoomID);
		AddRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_Register3,1);--�[�J�����ƶq
		BeginPlot(CopyObj,"Lua_Zone21_Sinter_CopyObj",10);
	end
end
function Lua_Zone21_Sinter_CopyObj()
	local CopyObj = CreateObjByObj(105453,OwnerID());
	BeginPlot(CopyObj,"Lua_Zone21_Sinter_CopyObj_Ai",0);
	DelObj(OwnerID());
end
function Lua_Zone21_Sinter_CopyObj_Ai()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local SkillList = Lua_Zone21_Sinter_SkillInfo();
	local SkillLv = Lua_Zone21_Sinter_SkillLvInfo();
	local OID = OwnerID();
	local MaxHP = ReadRoleValue(OID,EM_RoleValue_MaxHP)
	--LockHP( OID , MaxHP*0.4 , "" );
	local Clock = 0;
	local AttackTarget;
	local HPP;
	local ADDB =0;
	local OrgID = ReadRoleValue(OID,EM_RoleValue_OrgID)
	while 1 do
		HPP =math.floor(ReadRoleValue(OID,EM_RoleValue_HP)/MaxHP*100);
		AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID );
		if HPP<=40 and ADDB ==0 and OrgID == 105453 then
			AddBuff(OID,620518,0,-1);
			ADDB =1;
		end
		if Lua_Zone21_Sinter_Globel[RoomID].Setp == "Hide" then
			SetModeEx( OID  , EM_SetModeType_ShowRoleHead, true );--�Y����
			SetModeEx( OID  , EM_SetModeType_Fight , true );--�i�������
		elseif Lua_Zone21_Sinter_Globel[RoomID].Setp == "Nomal" then
			SetModeEx( OID  , EM_SetModeType_ShowRoleHead, false );--�Y����
			SetModeEx( OID  , EM_SetModeType_Fight , false );--�i�������
		end
		if hatelistcount(OID)~=0 then
			if Clock % 7 == 0  then
				local AA = rand(2);
				if AA == 1 or OrgID == 106014 then
					--����ˮ`
					CastSpellLv( OID , AttackTarget  , SkillList[1], SkillLv[1]);
				else
					--�e�记��
					CastSpellLv( OID , AttackTarget  , SkillList[2], SkillLv[2]);
				end
			elseif Clock % 9 == 0 then
				--�I��
				local TT = LuaFunc_GetAnotherPartyPlayer(AttackTarget);
				CastSpellLv( OID , TT  , SkillList[10], SkillLv[10]);
			end;
		end
		Clock = Clock +1;
		Sleep(10);
	end
end
function Lua_Zone21_Sinter_CopyObj_dead()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	AddRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_Register3,-1);--��֤����ƶq
	local DOT = 0.03*ReadRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_MaxHP);
	if ReadRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_HP)/ReadRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_MaxHP)>0.02 then
		AddRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_HP,-DOT);--��֤���
	end
	local Throw = CreateObjByObj( 105823,OwnerID() );
	SetModeEx(  Throw  , EM_SetModeType_NotShowHPMP, true )
	SetPlot(Throw,"touch","Lua_Zone21_Sinter_Dagger",40)
	SetCursorType( Throw , eCursor_Interact ); --����ܦ� ����
	return true;
end
function Lua_Zone21_Sinter_CopyObj_dead2()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	AddRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_Register3,-1);--��֤����ƶq
	return true;
end
function Lua_Zone21_Sinter_Dagger()
	if ReadRoleValue(TargetID(),EM_RoleValue_Register1) == 0 then
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,1);
		AddBuff(OwnerID(),620107,0,-1);
	end
	DelObj(TargetID());
end
function Lua_Zone21_Sinter_Throw_Black()
	local ISRIGHT= ReadRoleValue(TargetID(),EM_RoleValue_Register1);
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	local Throw = Lua_CreateObjByDir( TargetID() , 105823 , 0 , 0);
	AddToPartition(Throw,RoomID);
	SetCursorType( Throw , eCursor_Interact ); --����ܦ� ����
	--DebugMsg( 0, RoomID ,"ISRIGHT = "..ISRIGHT);
	SetPlot(Throw,"touch","Lua_Zone21_Sinter_Dagger",40)
	if OrgID == 105816 then
		if ISRIGHT == 1 then--�������T����
			KS_ScriptMessage("[SC_SINTER_SHOW_BLACK]");
			WriteRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_Register4,0);--�Ѱ�����
		else--�������~
			local XX = ReadRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_Register4);--Ū���{�b���X�Ӷ���
			if XX < 9 then	--�̦h�E�Ӷ���
				KS_ScriptMessage("[SC_SINTER_HIDE_ERROR]");
				--�h�ͤ@��
				BeginPlot(TargetID(),"Lua_Zone21_Sinter_BornCloud",30);
			end
		end
	else
		DebugMsg( 0, RoomID ,"Error OrgID = "..OrgID);
	end
end
function Lua_Zone21_Sinter_BornCloud()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local NAA=table.getn(Lua_Zone21_Sinter_Globel[RoomID].Cloud);
	local NewShadow = CreateObjByFlag(105816,780912,Lua_Zone21_Sinter_Globel[RoomID].Flag[NAA+1],1);
	SetModeEx(  NewShadow  , EM_SetModeType_NotShowHPMP, true )
	AddToPartition(NewShadow,RoomID);
	BeginPlot(NewShadow,"Lua_Zone21_Sinter_Cloud_Ai",0);
	AddBuff(NewShadow,620517,0,-1)
	AddRoleValue(Lua_Zone21_Sinter_Globel[RoomID].GUID,EM_RoleValue_Register4,1);--�g�J�{�b���X�Ӷ���
	Lua_Zone21_Sinter_Globel[RoomID].Cloud[NAA+1] = NewShadow;
	--���m����l
	Lua_Zone21_Sinter_ResetShadowPostion();
end
function Lua_Zone21_Sinter_Throw_End()
	CancelBuff(OwnerID(),620107);
end
function Lua_Zone21_Sinter_Shield()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local RR = Rand(30);
	local Shield = Lua_CreateObjByDir( OwnerID() , 105464 , RR , 0);
	SetModeEx(  Shield  , EM_SetModeType_NotShowHPMP, true )
	AddToPartition(Shield,RoomID);
	SetCursorType( Shield , eCursor_Interact ); --����ܦ� ����
	CallPlot( Shield , "Lua_ObjLifeTime" , 15);
	SetPlot(Shield,"touch","Lua_Zone21_Sinter_Shield_touch",40)
end
function Lua_Zone21_Sinter_Shield_touch()
	if ReadRoleValue(TargetID(),EM_RoleValue_Register1) == 0 then
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,1);
		AddBuff(OwnerID(),509617,0,-1);
	end
	DelObj(TargetID());
end
function Lua_Zone21_Sinter_Shield_Use()
	local DBID= ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
--	DebugMsg( 0, RoomID ,"DBID = "..DBID);
	if DBID == 105453 then--��������
		local HPP =math.floor(ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)*100);
	--	Say(OwnerID(),"YES!!HPP = "..HPP);
		if HPP <=40 then
		--	NPCDead( TargetID() , OwnerID() ) ;
			return true;
		end
		KS_ScriptMessage("[SC_SINTER_MAGIC_HIGH]");
	else--�������~
	--	Say(OwnerID(),"NO!!DBID = "..DBID);
		KS_ScriptMessage("[SC_SINTER_MAGIC_ERROR]");
	end
	return false;
end
function Lua_Zone21_Sinter_Shield_End()
	--LockHP( TargetID() , 0 , "" );
	KS_ScriptMessage("[SC_SINTER_MAGIC_KILL]");
	SetPlot(TargetID(),"dead","Lua_Zone21_Sinter_CopyObj_dead",0)
	KillID( OwnerID()  , TargetID() );
	CancelBuff(OwnerID(),509617);
end
function Lua_Sinter_BornByFlagGroup(Boss,ObjID,FlagID,FlagGroup,RoomID)
	local ObjGroup = {}
	local ss = Lua_Table_GetRdIndex(5,3);
	for i,v in ipairs(FlagGroup) do
		--DebugMsg( 0, RoomID ,"i = "..i.."v = "..v);
		ObjGroup[i] = CreateObjByFlag( ObjID , FlagID , v-1 , 1 )
		SetModeEx(  ObjGroup[i]  , EM_SetModeType_NotShowHPMP, true )
		AddToPartition(ObjGroup[i],RoomID)
		BeginPlot(ObjGroup[i],"Lua_Zone21_Sinter_Cloud_Ai",0);
	end
	local AACount = ReadRoleValue(Boss,EM_RoleValue_Register3);
	DebugMsg( 0, RoomID ,"AACount = "..AACount);
	if AACount <9 then	--���W�̦h�E��
		for i,v in ipairs(ss) do
			AddRoleValue(Boss,EM_RoleValue_Register3,1);--�[�J�����ƶq
			local CopyObj = CreateObjByObj(106014,ObjGroup[v]);
			BeginPlot(CopyObj,"Lua_Zone21_Sinter_CopyObj_Ai",0);
			SetPlot(CopyObj,"dead","Lua_Zone21_Sinter_CopyObj_dead2",0)
		end
	end
	return ObjGroup
end
function Lua_Zone21_Sinter_Cloud_Ai()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel = Lua_Zone21_Sinter_Globel[RoomID];
	local SkillList = Lua_Zone21_Sinter_SkillInfo();
	local SkillLv = Lua_Zone21_Sinter_SkillLvInfo();
	local Time = 0;
	Sleep(20);
	while 1 do
		if Time%3 == 0 then
			--��������
			local AttackTarget = ReadRoleValue(Globel.GUID,EM_RoleValue_AttackTargetID);
			local HowMuch = table.getn(Globel.Cloud);
			local ATT = LuaFunc_GetAnotherPartyPlayer(AttackTarget);
			CastSpellLv( OwnerID() , ATT  , SkillList[7], SkillLv[7]);
			--DebugMsg( 0, RoomID ,"ATT = "..ATT);
		end
		SysCastSpellLv(OwnerID(),OwnerID(),498294,0)--�d�����
		Time = Time +1;
		Sleep(10)
	end
end
function Lua_Zone21_Sinter_ResetShadowPostion()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local RAA = math.random(table.getn(Lua_Zone21_Sinter_Globel[RoomID].Cloud))
	for i,v in ipairs(Lua_Zone21_Sinter_Globel[RoomID].Cloud) do
		WriteRoleValue(v,EM_RoleValue_Register1,0);--���]������l
	end
	WriteRoleValue(Lua_Zone21_Sinter_Globel[RoomID].Cloud[RAA],EM_RoleValue_Register1,1);--�g�J���s�����T��l
end