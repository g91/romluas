--�Ť����x�ǰe�B�ǰe�v��ܼ@��
	
function LuaS_120597_TransSpeak()--�ǤW�h�A������NPC(120603)��ܼ@��
	local Player = OwnerID();
	LoadQuestOption(Player);
	AddSpeakOption(Player,Player,"[SC_120597_B]","LuaS_120597_TransPort(1)", 0 )
end
function LuaS_120597_TransPort(Num)
	local Player = OwnerID();
	CloseSpeak(Player);
	local x,y,z,dir = DW_Location(780100,Num);
	SetPos(Player,x,y+20,z,dir);
end
function LuaS_120597_TransDownSpeak()--�ǤU�ӡA������NPC(120604)��ܼ@��
	local Player = OwnerID();
	LoadQuestOption(Player);
	AddSpeakOption(Player,Player,"[SC_120597_C]","LuaS_120597_TransPort(4)", 0 )
end
--����[���x���@��
	
function Lua_Z23_CrystalSetBroken()--�����ܬ��l�a���A
	local Crystal = OwnerID();
	local EnergyExhausted=622291;
	local IsUsing=622296;
	local IsAttacked=622299;
	CancelBuff_NoEvent(Crystal,IsAttacked);--�����Q�������A
	CancelBuff_NoEvent(Crystal,IsUsing);--�����w�����Ȫ��аO
	SetPlot(Crystal,"touch","Lua_Z23_CrystalRestoreCastBar",50);	--�I��Ĳ�o�״_�@��
	SetCursorType(Crystal,eCursor_Enhance);--���]
	DW_UnFight(Crystal,true);
	AddBuff(Crystal,EnergyExhausted,0,-1);	--�ܦ�
end
function Lua_Z23_CrystalRestoreCastBar()--�����״_�I�k�]��
	local Toucher,Crystal =OwnerID(),TargetID();
	CastSpell(Toucher,Crystal,499291);
	BeginCastBarEvent(Toucher,Crystal,"[SC_120597_A]",25, ruFUSION_ACTORSTATE_CAST_BEGIN ,ruFUSION_ACTORSTATE_CAST_LOOP  ,0 ,"Lua_Z23_CrystalRestore")
end
function Lua_Z23_CrystalRestore(Toucher,CheckStatus,ExtraID)--�l�a�����_��
	--DebugMsg(0,0,"Lua_Z23_CrystalRestore")
	local Crystal =ExtraID or TargetID();
	--DebugMsg(0,0,"ToucherOrgID:"..ReadRoleValue(Toucher,EM_RoleValue_OrgID))
	--DebugMsg(0,0,"CrystalOrgID:"..ReadRoleValue(Crystal,EM_RoleValue_OrgID))
	local ToucherIsNPC=false;
	if ReadRoleValue(Toucher,EM_RoleValue_IsPlayer)==0 then
		ToucherIsNPC=true;
	end
	local EnergyExhausted=622291;
	if	(CheckStatus~=0)	then
		EndCastBar(Toucher,CheckStatus);
		if	CheckStatus>0	then
			--DebugMsg(0,0,"Fix Execute")
			--NPCSay(Crystal,"Restore")
			WriteRoleValue(Crystal,EM_RoleValue_HP,ReadRoleValue(Crystal,EM_RoleValue_MaxHP));
			WriteRoleValue(Crystal,EM_RoleValue_PID,100);
			Lua_Z23_CrystalSetNormal(Crystal);
			CancelBuff_NoEvent(Crystal,EnergyExhausted);

			if ToucherIsNPC==false then
				if DW_CheckQuestAccept("or",Toucher,425313,425341,425327)==true then
					DW_QietKillOne(Toucher,101241);
				end
				ScriptMessage( Toucher, Toucher, 1, "[SC_425313_A]", C_YELLOW );--���\�T��
				if CheckAcceptQuest(Toucher,425269)==true then--�f���D�u�A�X�N��
					DW_QietKillOne(Toucher,106802);
					CallPlot(Toucher,"Cl_Z23Quest_425269",Crystal);
				end
			else
				local NPCList=SearchRangeNPC(Toucher,60);
				for SN=0,table.getn(NPCList),1 do
					local ID=NPCList[SN];
					if ReadRoleValue(ID,EM_RoleValue_Y)>900 then
						SysCastSpellLv(ID,Toucher,499110,0);
					end
				end
			end
		else
			SetPlot(Crystal,"touch","Lua_Z23_CrystalRestoreCastBar",50);
		end
	end
end
function Lua_Z23_CrystalSetNormal(Crystal)--�����]�w��l�ơA���`���A
	local EnergyExhausted=622291;
	CancelBuff_NoEvent(Crystal,EnergyExhausted);
	CancelBuff_NoEvent(Crystal,622296);--����IsUsing
	AddBuff(Crystal,502707,0,-1);	--����۰ʦ^��
	AddBuff(Crystal,622295,0,-1);	--������ӻ��O�L�H�r�p
	WriteRoleValue(Crystal,EM_RoleValue_HP,ReadRoleValue(Crystal,EM_RoleValue_MaxHP));
	WriteRoleValue(Crystal,EM_RoleValue_PID,100);
	SetModeEx(Crystal,EM_SetModeType_Move,false);
	SetModeEx(Crystal,EM_SetModeType_Gravity,false);
	SetModeEx(Crystal,EM_SetModeType_Strikback,false);
	SetModeEx(Crystal,EM_SetModeType_Searchenemy,false);
	SetModeEx(Crystal,EM_SetModeType_Fight,true);
	SetModeEx(Crystal,EM_SetModeType_ShowRoleHead,false);
	LockHP( Crystal , 1 , "Lua_Z23_CrystalSetBroken" );
	SetPlot(Crystal,"touch","Lua_Z23_CrystalSetOperated",50);	--�I��Ĳ�o�r�p�@��
	SetCursorType(Crystal,eCursos_Implement);--�r�p
end
function Lua_Z23_CrystalSetOperated()--�����ܬ���ʪ��A
	local Toucher,Crystal = OwnerID(),TargetID();
	local CombineCrystal=622286;
	if	CheckBuff(Toucher,CombineCrystal)==true	then
		return false;
	end
	SetPlot(Crystal,"touch","",0);
	CallPlot(Crystal,"Lua_Z23_CrystalOperatedLoop",Toucher);
end
function Lua_Z23_CrystalOperatedLoop(Toucher)--�����B���ʪ��A�ɪ��ˬd�j��
	local ReferTime = 90;
	local Crystal = OwnerID();
	local x,y,z,dir
	local ToucherIsNPC=false;
	if ReadRoleValue(Toucher,EM_RoleValue_IsPlayer)==0 then
		ToucherIsNPC=true;
	end
	local EnergyExhausted=622291;
	local Spontaneous=622295;
	local IsUsing=622296;
	local CombineCrystal=622286;
	local CrystalShield=622289;
	local DemandCancel=622300;
	local RemainingTime = ReferTime*(ReadRoleValue(Crystal,EM_RoleValue_PID)/100);
	AddBuff(Toucher,CombineCrystal,0,RemainingTime);
	AddBuff(Crystal,IsUsing,0,-1);--�аOIsUsing
	CancelBuff_NoEvent(Toucher,Spontaneous);--�������@���}���аO
	x,y,z,dir = DW_Location(Crystal);
	Dir = ReadRoleValue(Toucher,EM_RoleValue_Dir);
	SetPos( Toucher,x,y,z,Dir);
	DW_UnFight(Crystal,true);
	SysCastSpellLv(Toucher,Toucher,497450,0);--�d�򤳫�

	local IsBroken = false;
	while	true	do
		sleep(5);
		if	CheckID(Toucher)==false	then
			break;
		end
		if	ReadRoleValue(Toucher,EM_RoleValue_IsDead)==1	then
			AddBuff(Crystal,EnergyExhausted,0,-1);
			break;
		end
		if	CheckBuff(Toucher,CombineCrystal)==false	then
			if	CheckBuff(Toucher,Spontaneous)==false	then
				IsBroken = true;
			end
			break;
		end
		if ToucherIsNPC==true then
			if	ReadRoleValue(Toucher,EM_RoleValue_SpellMagicID)==0	then
				if	DW_CheckUse(Toucher,499285)==0	then
					local RemainingTime = BuffInfo(Toucher,Lua_BuffPosSearch(Toucher ,CombineCrystal),EM_BuffInfoType_Time);
					if	RemainingTime<=30	then
						CastSpell(Toucher,Toucher,499285);
					end
				end
				local Target = ReadRoleValue(Toucher,EM_RoleValue_AttackTargetID);
				if Target~=0 then
					if	DW_CheckUse(Toucher,499284)==0	then
						CastSpell(Toucher,Toucher,499284);
					elseif	DW_CheckUse(Toucher,499283)==0	then
						CastSpell(Toucher,Target,499283);
					elseif	DW_CheckUse(Toucher,499282)==0	then
						CastSpell(Toucher,Target,499282);
					end
				end
			end
			if	HateListCount(Toucher)==0	then
				local NPCList=SearchRangeNPC(Toucher,100);
				local IsBreak=false;
				for SN=0,table.getn(NPCList),1 do
					local ID=NPCList[SN];
					if ReadRoleValue(ID,EM_RoleValue_Y)>900 then
						if CheckRelation( ID,Toucher , EM_CheckRelationType_Attackable )==true then
							SysCastSpellLv(ID,Toucher,499110,1);
							break;
						end
					end
					if ID==-1 then
						AddBuff(Toucher,DemandCancel,0,-1);
						AddBuff(Crystal,DemandCancel,0,-1);
						x,y,z,dir=DW_Location(780100,1);
						SetPos(Toucher,x,y,z,dir );
						IsBreak=true;
					end
				end
				if IsBreak then
					break;
				end
			end
		end
	end
	MagicInterrupt(Toucher);
	CancelBuff_NoEvent(Toucher,CrystalShield);
	CancelBuff_NoEvent(Toucher,CombineCrystal)
	if	IsBroken==true	then
		--DebugMsg(0,0,"User:IsBroken")
		BeginPlot(Crystal,"Lua_Z23_CrystalSetBroken",0);
	else
		--DebugMsg(0,0,"User:Spontaneous")
		AddBuff(Toucher,Spontaneous,0,10);
		Lua_Z23_CrystalSetNormal(Crystal);
	end
	if ToucherIsNPC==true then
		EnableNpcAI(Toucher,true);
	end
end
--����[���x�Ǫ��ϥΪ��S��k�N(��%�ƪ�)
	
function Lua_Z23_MobSpellCheckAxis()--���k�N���X(499286)(499289)(499296)
	local Mob,Target = OwnerID(),TargetID();
	local Y_Axis = math.abs(ReadRoleValue(Mob,EM_RoleValue_Y)-ReadRoleValue(Target,EM_RoleValue_Y));
	if	Y_Axis>50	then
		ClearHateList(Mob,Target);
		ClearHateList(Target,Mob);
		return false
	end
	return true
end

function Lua_Z23_MobSpellExecute()--���򥻪k�N(622292)
	local Mob,Target = OwnerID(),TargetID();
	local x,y,z,dir=DW_Location(Target);
	y = GetMoveFlagValue( 780079,1,EM_RoleValue_Y);
	local CombineCrystal=622286;
	local CrystalShield=622289;
	local ReducePower = 29; --499286 ���¤O(�������)
	local IsBuffed = ( CheckBuff(Target,CombineCrystal) and (CheckBuff(Target,CrystalShield)==false) );
	if	IsBuffed==true	then
		local RemainingTime = BuffInfo(Target,Lua_BuffPosSearch(Target ,CombineCrystal),EM_BuffInfoType_Time);
		if	RemainingTime<=ReducePower	then
			x,y,z,dir=DW_Location(780100,1);
			SetPos(Target,x,y,z,dir );
			CancelBuff_NoEvent(Target,CombineCrystal);
		else
			DW_ResetBuff(Target,CombineCrystal,0,RemainingTime-ReducePower);
		end
	else
		local AdjustedValue = 2*(ReadRoleValue(Mob,EM_RoleValue_LV)-ReadRoleValue(Target,EM_RoleValue_LV));
		local PowerLevel = 10+AdjustedValue;--499287���¤O(�ˮ`�ż��H���Ůt�ܤ�=>���ŶV�����V���h�A���ŶV�C���V�h)
		if PowerLevel<4 then PowerLevel=4; end
		SysCastSpellLv(Mob,Target,499287,PowerLevel); 
		if ReadRoleValue(Target,EM_RoleValue_IsPlayer)==0 then
			AddBuff(Target,622299,0,5);--�аOIsAttacked
		end
	end
end
--���a�����B�~�o�쪺�ޯ�(�䴩�\��)
	
function Lua_Z23_CrystalSpellExtendTime()--�W�[���x�@�ήɶ��A���򥻪k�N(622290)
	local Driver,Target = OwnerID(),TargetID();
	local CombineCrystal=622286;
	local ExtendValue = 20; --499285���^�_���(�ثe�O1���1���A�@3��)
	local RemainingTime = BuffInfo(Target,Lua_BuffPosSearch(Target ,CombineCrystal),EM_BuffInfoType_Time);
	DW_ResetBuff(Target,CombineCrystal,0,RemainingTime+ExtendValue);
end
function Lua_Z23_CrystalSpellFinishOperation()--�����ާ@�A���򥻪k�N(622294)
	local Driver,Target = OwnerID();
	local NTable = SearchRangeNPC ( Driver , 20 );
	local CombineCrystal=622286;
	for i=0,table.getn(NTable) do
		Target = NTable[i];
		if	ReadRoleValue(Target,EM_RoleValue_OrgID)==105116	then
			break;
		end
	end
	local RemainingTime = math.floor((BuffInfo(Driver,Lua_BuffPosSearch(Driver ,CombineCrystal),EM_BuffInfoType_Time)/90)*ReadRoleValue(Target,EM_RoleValue_MaxHP));
	WriteRoleValue(Target,EM_RoleValue_HP,RemainingTime);
	AddBuff(Driver,622295,0,10);		--Assign
	CancelBuff_NoEvent(Driver,CombineCrystal);
	local x,y,z,dir = DW_Location(Target);
	y = GetMoveFlagValue( 780079,1,EM_RoleValue_Y);
	SetPos( Driver,  x-20+DW_Rand(10),y,z-20+DW_Rand(10),dir);
end
--���ȡG�Ѩ�����[����
	
function Lua_Z23_ExtrationNPCExample()--NPC���Ѩ��ܽd�A������NPC(120602)���޼@��
	local NPC = OwnerID();
	MoveToFlagEnabled(NPC, false);
	local x,y,z,dir = DW_Location(780100,3);
	CastSpellPos(NPC,x,y,z,499294,1);
	sleep(20);
	for i=1,10 do
		sleep(20);
		if	ReadRoleValue(NPC,EM_RoleValue_SpellMagicID)==0	then
			break;
		end
	end
	MoveToFlagEnabled(NPC, true);
end
function Lua_Z23_ExtrationUseItem()--�Ѩ�����t�O�Ϊk�N�i�檺�A�I�����~�o���@��(209466)
	local Caster = OwnerID();
	if CountBodyItem(Caster,240797)>=30 then
		ScriptMessage( Caster, Caster, 1, "[SC_425117_D]", 0 )--ĵ�i�T���G���~�ϥΥ���
		return false;
	end
	if DW_CheckQuestAccept("or",Caster,425311,425325,425339)==false then
		ScriptMessage( Caster, Caster, 1, "[SC_425105_A]", 0 )--ĵ�i�T���G�A�S�����������ȡI
		return false;
	end
	local FlagTable = {3,6,7}
	if	DW_CheckDis(Caster,780100,5,50)==true	then
		local RandResult = DW_Rand(3)
		local x,y,z,dir = DW_Location(780100,FlagTable[RandResult]);
		CastSpellPos(Caster,x,y,z,499294,1)
		return true;
	else
		if	ReadRoleValue(Caster,EM_RoleValue_IsNPC)==1	then
			PlayMotion(Caster,ruFUSION_ACTORSTATE_EMOTE_STRETCH);
		else
			ScriptMessage( Caster, Caster, 1, "[SC_425311_WRONG_POS]", 0 );
		end
		return false;
	end
end
function Lua_Z23_ExtrationExecutePlot()--�q�Ѩ����h�I�k�A���򥻪k�N(622298) 
	local Extractor,Caster = OwnerID(),TargetID();
	SetModeEx(Extractor,EM_SetModeType_HideName,true) ;
	SetModeEx(Extractor,EM_SetModeType_Show,false);
	SetModeEx(Extractor,EM_SetModeType_Gravity,false) ;
	SetModeEx(Extractor,EM_SetModeType_Move,true) ;
	MoveToFlagEnabled(Extractor, false);
	AddBuff(Extractor,509290,0,-1);
	AddToPartition(Extractor,0);
	local SearchResult = SearchRangeNPC ( Extractor , 50 );
	local OrgID;
	for index,GUID in pairs(SearchResult) do
		OrgID = ReadRoleValue(GUID,EM_RoleValue_OrgID);
		if	OrgID==120600 or OrgID==120601	then
			SysCastSpellLv(Caster,Caster,499296,1);
			Lua_Z23_ExtrationPlayDrama(Extractor,Caster,GUID);
			return true;
		end
	end
	ScriptMessage( Caster, Caster, 1, "Nothing here", 0 )
	DelObj(Extractor);
	return false;
end
function Lua_Z23_ExtrationPlayDrama(Extractor,Caster,Crystal)--����ʧ@�M��t
	local x,y,z,dir = DW_Location(Crystal);
	SetPos(Extractor,x-10,y,z,dir);
	sleep(5);
	if	HateListCount(Caster)>0	then
		ScriptMessage( Caster, Caster, 1, "[SC_425311_WRONG_COMBAT]", 0 )--ĵ�i�T���G�n�Ѩ�����[���ۡA�����n�믫�M�`�~��I
		DelObj(Extractor)
		return
	end
	CastSpell(Caster,Extractor,499295)
	Move( Extractor,x+50,y,z);
	if ReadRoleValue(Caster,EM_RoleValue_IsPlayer)==1 then
		for sec=1,5 do
			GiveBodyItem(Caster,240797,1)
			sleep(10);
		end
	end
	MagicInterrupt(Caster);
	DelObj(Extractor)
end
--NPC �����ä���AI
	
function Lua_Z23_DefenseClear()--����[���x�M��
	local Defense_ClearList={}
	table.insert(Defense_ClearList,114040);
	local Mob={106772,106773};
	for SN,OrgID in pairs(Mob) do
		table.insert(Defense_ClearList,OrgID);
	end
	local Object={105116,106863,106864};
	for SN,OrgID in pairs(Object) do
		table.insert(Defense_ClearList,OrgID);
	end
	Lua_DavisDelObj(Defense_ClearList);
end
function LuaS_Z23_DefenseController()--������
	Z23_CrystalSeries_JillState="Un-Exist";--����A�ŧi�N�઺���A
		
	--�ŧiBuff�t�N
			
	local DemandCancel=622300;
	local CombineCrystal=622286;
	local EnergyExhausted=622291;
	local IsUsing=622296;
	local IsAttacked=622299;
	local PatrolPath,PatrolSpot=780080,GetMoveFlagCount(780080)-1;
	local x,y,z,dir;
	local Controller = OwnerID();
	local CrystalPocision=780079; --���������I
	local TableCrystal,CrystalState,FlagTotal = {},{},GetMoveFlagCount(CrystalPocision)-1;	
	for FlagSN=1,FlagTotal do	--�إ�Crystal
		x,y,z,dir=DW_Location(CrystalPocision,FlagSN);
		TableCrystal[FlagSN] =CreateObj(105116,x,y+15,z,dir,1);
		AddToPartition(TableCrystal[FlagSN],0)
		Lua_Z23_CrystalSetNormal(TableCrystal[FlagSN]);
		CrystalState[FlagSN] ="Normal";
	end
	local TableGuard,GuardState,Reciprocal,Appoint,GuardTotal = {},{},{},{},1
	for GuardSN=1,GuardTotal do	--����Guard
		x,y,z,dir = DW_Location(780100,1);
		TableGuard[GuardSN] =  CreateObj(106864,x+DW_Rand(30),y ,z+DW_Rand(30),DW_Rand(200),1);
		AddToPartition(TableGuard[GuardSN],0)
		MoveToFlagEnabled(TableGuard[GuardSN],false);
		GuardState[GuardSN] ="Available";
		Reciprocal[GuardSN]=4;
		Appoint[GuardSN]=0;
	end
	--�D�j��
	while	true	do
		sleep(10);
		for GuardSN=1,GuardTotal do
			local Guard = TableGuard[GuardSN];
			local InOperationMark,GuardFightMark,IsMoving
			local IsGuardNear,IsBroken,BeAttacked,BeUsing
			local CrystalSN,Crystal
			if	CheckID(Guard)==false or ReadRoleValue(Guard,EM_RoleValue_IsDead)==1	then	--�u�ìO�_�}�`
				GuardState[GuardSN]="Dead"
			end
			if GuardState[GuardSN]~="Dead" then
				InOperationMark = CheckBuff(Guard,CombineCrystal);
				GuardFightMark=(HateListCount(Guard)~=0);
				IsMoving=(ReadRoleValue(Guard,EM_RoleValue_NpcOnMove)==1);
				if Appoint[GuardSN]~=0 then--�u�æ�����
					--DebugMsg(0,0,"HaveAppoint")
					CrystalSN = Appoint[GuardSN];
					Crystal = TableCrystal[CrystalSN];
					IsGuardNear=(GetDistance(Crystal,Guard)<=50);
					IsBroken=CheckBuff(Crystal,EnergyExhausted);
					BeAttacked=CheckBuff(Crystal,IsAttacked);
					BeUsing=CheckBuff(Crystal,IsUsing);
				else
					--DebugMsg(0,0,"UnAppoint")
					GuardState[GuardSN] = "Available";
				end
				if GuardFightMark then
					if InOperationMark then
						--DebugMsg(0,0,"Operation")
						GuardState[GuardSN] = "Operation";
						if Appoint[GuardSN]~=0 then
							CrystalState[CrystalSN]="Full"
						end
					else
						if IsGuardNear then
							--DebugMsg(0,0,"PassToNextBlock")
						else
							if Appoint[GuardSN]~=0 then
								--DebugMsg(0,0,"CancelMisssion")
								GuardState[GuardSN] = "Fight";
								Appoint[GuardSN]=0;
								CrystalState[CrystalSN]="Normal"
							else
								--DebugMsg(0,0,"Pass:UnOperation")
								GuardState[GuardSN] = "Fight";
							end
						end
					end
				end
				if Appoint[GuardSN]~=0 then
					if IsGuardNear then
						if IsBroken then
							if GuardFightMark then
								--DebugMsg(0,0,"PassToNextRound")
								Appoint[GuardSN]=0
								GuardState[GuardSN] = "Fight";
								CrystalState[CrystalSN]="Normal"
							else
								GuardState[GuardSN] = "Casting";
								if ReadRoleValue(Guard,EM_RoleValue_SpellMagicID)==0 then
									StopMove(Guard,true);
									x,y,z,dir=DW_Location(Crystal);
									SetDir(Guard,DW_GetDir(x,y,z,Guard));
									GuardState[GuardSN] = "Fixing";
									--DebugMsg(0,0,"Fixing")
									local IsCastDone=622300
									CastSpell(Guard,Guard,499291);
									for Time=0,30,5 do
										sleep(5)--0.5 Sec
										if CheckBuff(Guard,IsCastDone) then
											CancelBuff(Guard,IsCastDone)
											CallPlot(Guard,"Lua_Z23_CrystalRestore",Guard,1,Crystal);
											break;
										end
									end
								else
									--DebugMsg(0,0,"Pass:SpellMagicID")
								end
							end
						else
							if BeUsing then
								--DebugMsg(0,0,"CrystalFull,BecomeAvailable")
								GuardState[GuardSN] = "Available";
								Appoint[GuardSN]=0;
								CrystalState[CrystalSN]="Full"
							else
								if BeAttacked then
									--DebugMsg(0,0,"CrystalUnderAttack,GetInThere")
									EnableNpcAI(Guard,false);
									GuardState[GuardSN] = "Operation";
									SetPlot(Crystal,"touch","",0);
									CallPlot(Crystal,"Lua_Z23_CrystalOperatedLoop",Guard);
									CrystalState[CrystalSN]="Full"
								else
									--DebugMsg(0,0,"Safe")
									GuardState[GuardSN] = "Available";
									Appoint[GuardSN]=0;
									CrystalState[CrystalSN]="Normal"
								end
							end
						end
					else
						if IsMoving then
							--DebugMsg(0,0,"MoveForTarget")
						else
							--DebugMsg(0,0,"StartMove")
							if ReadRoleValue(Guard,EM_RoleValue_IsWalk)==1 then
								WriteRoleValue(Guard,EM_RoleValue_IsWalk,0);
							end
							x,y,z,dir=DW_Location(CrystalPocision,CrystalSN)
							x,y,z=DW_Relative(Guard,x,y,z,45);
							MoveDirect(Guard,x,y+5,z);
						end
					end
				else
					GuardState[GuardSN] = "Available";
					if IsMoving then
						--DebugMsg(0,0,"IsMoving")
					else
						x,y,z,dir=DW_Location(PatrolPath,DW_Rand(PatrolSpot));
						--DebugMsg(0,0,"Patrol Data:  x="..x.."   y="..y.."   z="..z)
						Move(Guard,x,y,z);
					end
				end
			else
				if	Reciprocal[GuardSN]~=0	then
					--DebugMsg(0,0,"Reciprocal")
					Reciprocal[GuardSN]=Reciprocal[GuardSN]-1;	--Reciprocal
				else
					Reciprocal[GuardSN]=4;	--Reset Reciprocal
					--DebugMsg(0,0,"ReBorn");
					x,y,z,dir = DW_Location(780100,1);
					TableGuard[GuardSN] =  CreateObj(106864,x+DW_Rand(30),y+10 ,z+DW_Rand(30),DW_Rand(200),1);
					AddToPartition(TableGuard[GuardSN],0)
					GuardState[GuardSN] = "Available"
				end
			end
		end
		for CrystalSN=1,FlagTotal,1 do
			local IsBroken,BeAttacked,BeUsing
			local Crystal=TableCrystal[CrystalSN];
			IsBroken=CheckBuff(Crystal,EnergyExhausted);
			BeAttacked=CheckBuff(Crystal,IsAttacked);
			BeUsing=CheckBuff(Crystal,IsUsing);
			if BeUsing then
				--DebugMsg(0,0,"Crystal:BeUsing")
				CrystalState[CrystalSN]="Full"
			else
				if CrystalState[CrystalSN]=="Full" then
					CrystalState[CrystalSN]="Normal";
				end
				if IsBroken then
					--DebugMsg(0,0,"Crystal:IsBroken")
					if CrystalState[CrystalSN]~="Waiting" then
						CrystalState[CrystalSN]="IsBroken"
					end
				else
					if BeAttacked then
						--DebugMsg(0,0,"Crystal:BeAttacked")
						if CrystalState[CrystalSN]~="Waiting" then
							CrystalState[CrystalSN]="BeAttacked"
						end
					else
						--DebugMsg(0,0,"Crystal:NoEnermy")
						CrystalState[CrystalSN]="Normal";
					end
				end
			end
			local AppointNum=0
			if CrystalState[CrystalSN]~="Normal" then
				for GuardSN=1,GuardTotal do
					if GuardState[GuardSN] == "Available" then
						--DebugMsg(0,0,"Crystal:Appoint="..CrystalSN.."ToSave")
						Appoint[GuardSN]=CrystalSN;
						CrystalState[CrystalSN]="Waiting"
						StopMove(TableGuard[GuardSN],false);
						GuardState[GuardSN]="Mission";
						break;
					end
					if CrystalState[CrystalSN]=="Waiting" then
						if Appoint[GuardSN]==CrystalSN then
							AppointNum=AppointNum+1;
						end
						if GuardSN==GuardTotal then
							if AppointNum==0 then
								CrystalState[CrystalSN]="Queue";
							end
						end
					end
				end
			end
		end
	end
end
--���ȧ����@��(��խ��n���~,�e�U���Ȫ���)=>���ө�b���ȧ�������@��
	
function LuaS_Z23_DailyQuestLoop(InputID)
	local QuestNPC,Player = OwnerID(),TargetID();
	local QuestNumber={}
	local GiveKeyItem={}
	local DelKeyItem={}
--��ƫإ�
	QuestNumber[1]={425323,425324};
	GiveKeyItem[1]={546912,546913};
	DelKeyItem[1]={546913,546912};

	for i=1,#QuestNumber do
		for SN,QuestID in pairs(QuestNumber[i]) do
			if QuestID==InputID then
				SetFlag(Player,GiveKeyItem[SN],1);
				SetFlag(Player,DelKeyItem[SN],0);
				return true
			end
		end
	end
end
--�����l�@��
	
function Lua_Z23_Initial_106772()--����[�I���̥X�ͪ�t�@��
	local Obj = OwnerID();
	SetFlag(Obj,544801,1);--�L���_
	Cl_ZoneMonster_RandBuff();
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_COMBAT_UNARMED);
end
function Lua_Z23_Initial_106773()--�w�ǩ_���Ū̥X�ͪ�t�@��
	local Obj = OwnerID();
	AddBuff(Obj,622316,0,-1);
	SetFlag(Obj,544801,1);--�L���_
	SetDefIdleMotion(Obj,ruFUSION_MIME_FLY_LOOP);
	Cl_ZoneMonster_RandBuff();
end
--�d�����޼@��
	
function Lua_Z23_AntPatrol_Ctrl()--��l�����Ʊڪ�����禡
	local Parent=OwnerID();
	local BadPatrolFlag,GoodPatrolFlag=780090,780091;
	local GoodAntTotal=6;--���x�ƶq
	Lua_Z23_BadPatrolAnt_Create(BadPatrolFlag);
	for SN=1,GoodAntTotal do
		Lua_Z23_GoodPatrolAnt_Create(GoodPatrolFlag);
		sleep(60)
	end
end
function Lua_Z23_GoodPatrolAnt_Create(GoodPatrolFlag)--���ͻ\���䴩��
	local Parent=OwnerID();
	local GoodAntOrgID=106866;
	local x,y,z,dir=DW_Location(GoodPatrolFlag,0);
	local GoodAnt=CreateObj(GoodAntOrgID,x+Lua_RandLoc(70),y,z+Lua_RandLoc(70),dir,1);
	WriteRoleValue(GoodAnt,EM_RoleValue_IsWalk,0);
	WriteRoleValue(GoodAnt,EM_RoleValue_Register1,Parent);--�O��֬O����
	WriteRoleValue(GoodAnt,EM_RoleValue_Register2,GoodPatrolFlag);
	WriteRoleValue(GoodAnt,EM_RoleValue_Register3,1);
	AddToPartition(GoodAnt,0);
	LockHP(GoodAnt,1,"Lua_Z23_AntPatrol_Dead");
	BeginPlot(GoodAnt,"Lua_Z23_AntPatrolCommand",0);
	MoveToFlagEnabled(GoodAnt, false);
	return GoodAnt;
end
function Lua_Z23_BadPatrolAnt_Create(BadPatrolFlag)--���ͮw�ǩ_������
	local Parent=OwnerID();
	local BadAntOrgID=106865;
	local x,y,z,dir=DW_Location(BadPatrolFlag,0);
	local BadAnt=CreateObj(BadAntOrgID,x,y,z,dir,1);
	WriteRoleValue(BadAnt,EM_RoleValue_IsWalk,0);
	WriteRoleValue(BadAnt,EM_RoleValue_Register1,Parent);--�O��֬O����
	WriteRoleValue(BadAnt,EM_RoleValue_Register2,BadPatrolFlag);
	WriteRoleValue(BadAnt,EM_RoleValue_Register3,1);
	AddToPartition(BadAnt,0);
	LockHP(BadAnt,1,"Lua_Z23_AntPatrol_Dead");
	BeginPlot(BadAnt,"Lua_Z23_AntPatrolCommand",0);
	MoveToFlagEnabled(BadAnt, false);
	return BadAnt;
end
function Lua_Z23_AntPatrolCommand()--���ޫ��O
	local Ant = OwnerID();
	local DetectDuration=20;--���G10����1��
	local WaitTime;
	local PatrolFlagID=ReadRoleValue(Ant ,EM_RoleValue_Register2);
	local CurrentSN=ReadRoleValue(Ant ,EM_RoleValue_Register3);
	local x,y,z,dir=DW_Location(PatrolFlagID,CurrentSN);
	while true do
		if HateListCount(Ant)~=0  or ReadRoleValue(Ant,EM_RoleValue_NpcOnMove)==1 then--��
			sleep(DetectDuration);
		elseif DW_GetDistance(Ant,x,y,z)<50 then
			if GetMoveFlagCount(PatrolFlagID)-1==CurrentSN then--��a����70
				x,y,z,dir=DW_NewLocation(DW_Rand(359),DW_Rand(70),x,y,z,dir);
				y=GetHeight(x,y,z);
				WaitTime=Move(Ant,x,y,z);
				sleep(WaitTime-10);
			else--���U�@�I
				CurrentSN=CurrentSN+1
				WriteRoleValue(Ant,EM_RoleValue_Register3,CurrentSN);
				x,y,z,dir=DW_Location(PatrolFlagID,CurrentSN);
				x,y,z,dir=DW_NewLocation(DW_Rand(359),DW_Rand(40),x,y,z,dir);
				y=GetHeight(x,y,z);
				WaitTime=Move(Ant,x,y,z);
				sleep(WaitTime);
			end
		else--�~�򥼧��ȳ~
			x,y,z,dir=DW_Location(PatrolFlagID,CurrentSN);
			x,y,z,dir=DW_NewLocation(DW_Rand(359),DW_Rand(40),x,y,z,dir);
			y=GetHeight(x,y,z);
			WaitTime=Move(Ant,x,y,z);
			sleep(WaitTime-10);
		end
		sleep(10)
	end
end
function Lua_Z23_AntPatrol_Dead()--���޿��ƪ��@�P���`�@��
	local Ant,Killer=OwnerID(),TargetID();
	LockHP(Ant,-100,"");
	local Parent=ReadRoleValue(Ant,EM_RoleValue_Register1);
	local OrgID=ReadRoleValue(Ant,EM_RoleValue_OrgID);
	local BadPatrolFlag,GoodPatrolFlag=780090,780091;
	local BadAntOrgID,GoodAntOrgID=106865,106866;
	if OrgID==BadAntOrgID then--�w�ǩ_�����̱M�ݰ϶�
		CallPlot(Parent,"Lua_Z23_BadPatrolAnt_Create",BadPatrolFlag);
	end
	if OrgID==GoodAntOrgID then--�\���䴩�̱M�ݰ϶�
		CallPlot(Parent,"Lua_Z23_GoodPatrolAnt_Create",GoodPatrolFlag);
	end
	KillID(Killer,Ant);
end