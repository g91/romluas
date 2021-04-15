
function Lua_Z23_RageBrigade_Controller()
	Z23_RageBrigade_Situation = 0
	Z23_RageBrigade_State = 0
	Z23_RageBrigade_InsideAnt=0;
	Z23_RageBrigade_Controller = OwnerID();
	Z23_RageBrigade_ArchRival={};
	local AttackPositionAnt,PreparePositionAnt = {},{};	--�|�H�}�a�վ�ƶq���ƧL�}�C
	local RegularPatrolAnt,DepthPatrolAnt = {},{};		--�T�w�ƶq���ƧL�}�C
	local PatrolMaxNum,PositionMaxNum,AntInterval = 1,5,18;		
	local ElfGuard,GuardTotal,DragonGuard,MaleElf,FemaleElf,Teleporter,PeggyNPC,DisBall = {},4	
	local ElfGuardOrgList = {106897,106898,106897,106898};
	local DefensePlant,CampSize,PlantTotal = {},70,8;	--�Ӫ������͸��
	local x,y,z,dir,PiSN;
	local Shadow,ShadowInterval,ShadowMax = {},6,4	--�t�v��Ȱ}�C
	local TimeBasis = 0	--�ɶ��з�
	local FieldWork,OnDuty = {},{}	--���Ⱥ޲z��(�~��,�ȯZ) -- FieldWork���Ǹ��W�h ���Ӫ� �A���
	for i=1,PlantTotal do
		FieldWork[i]=0;
	end
-----------------------------------------------------------------------------------------------
	Z23_RageBrigade_FunctionTable = {}
	Z23_RageBrigade_FunctionTable.FlagCreateAnt =  function (FlagID)	--���ͷs����
		local x,y,z,dir;
		if FlagID==780086 then
			x,y,z,dir = DW_Location(FlagID,1);--�S�ҡA�u�q�_�I�ͥX(�t�X���ȻݨD
		else
			x,y,z,dir = DW_Location(FlagID,DW_Rand(GetMoveFlagCount(FlagID)-1));
		end
		local Ant = CreateObj(106726,x,y,z,dir,1);
		AddToPartition(Ant,0);
		WriteRoleValue(Ant,EM_RoleValue_IsWalk,0);
		WriteRoleValue(Ant,EM_RoleValue_Register1,1)
		WriteRoleValue(Ant,EM_RoleValue_Register2,1);
		SetFlag(Ant,544801,1);
		return Ant;
	end
	Z23_RageBrigade_FunctionTable.SieveAnt = function (AntSet,PositionMaxNum,TimeBasis,Flag)	--�ʱ����ƪ����A(�}�C����)
		local TempAntTotal = 0
		local AntTable = AntSet;
		for SN=PositionMaxNum,1,-1 do
			TempAnt = AntTable[SN];
			if	TempAnt~=nil then
				if CheckID(TempAnt)==true and ReadRoleValue(TempAnt,EM_RoleValue_IsDead)==0 then
					if HateListCount(TempAnt)==0 then
						if	ReadRoleValue(TempAnt,EM_RoleValue_NpcOnMove)==0	then
							local Limit = GetMoveFlagCount(Flag)-1;
							Z23_RageBrigade_FunctionTable.RandMove(TempAnt,Flag,ReadRoleValue(TempAnt,EM_RoleValue_Register1),Limit);
						end
					end
					TempAntTotal = TempAntTotal + 1;
					local x,y,z=DW_Location(TempAnt);
					if CheckMapID( x,y,z,372)==true then
						if DW_CheckDis(TempAnt,780088,12,200)==false then     --780086 third flag
							Z23_RageBrigade_InsideAnt=Z23_RageBrigade_InsideAnt+1;
						end
					end
				else
					table.remove(AntTable,SN);
				end
			end
		end
		if	TimeBasis%AntInterval==0	then
			if	TempAntTotal<PositionMaxNum	then
				table.insert(AntTable,Z23_RageBrigade_FunctionTable.FlagCreateAnt(Flag))
			end
		end
		return AntTable;
	end
	Z23_RageBrigade_FunctionTable.PatrolAlongFlag = function (GUID,Flag,Spot,Vary,Limit)	--���ޱ���
		--EM_RoleValue_Register1=>�O���ؼ��I
		--EM_RoleValue_Register2=>�O�����e�Ω���
		local NewSpot = Spot + Vary;
		if	NewSpot>=Limit or NewSpot<=0	then
			WriteRoleValue(GUID,EM_RoleValue_Register2,Vary*(-1));
			WriteRoleValue(GUID,EM_RoleValue_Register1,Spot-Vary);
			local x,y,z,dir=DW_Location(Flag,Spot-Vary);
			Move(GUID,x-15+DW_Rand(30),y,z-15+DW_Rand(30))
		else
			WriteRoleValue(GUID,EM_RoleValue_Register1,NewSpot);
			local x,y,z,dir=DW_Location(Flag,NewSpot);
			Move(GUID,x-15+DW_Rand(30),y,z-15+DW_Rand(30))
		end
	end
	Z23_RageBrigade_FunctionTable.RandMove = function (GUID,Flag,Spot,Limit)	--�H������
		--EM_RoleValue_Register1=>�O���ؼ��I
		MoveToFlagEnabled(GUID, false)
		if DW_CheckDis(GUID,Flag,Spot,60)==true	then--��s���I�e�i
			local NewSpot = DW_Rand(Limit);
			local x,y,z,dir=DW_Location(Flag,NewSpot);
			Move(GUID,x-20+DW_Rand(40),y,z-20+DW_Rand(40));
			WriteRoleValue(GUID,EM_RoleValue_Register1,NewSpot)
		else
			local x,y,z,dir=DW_Location(Flag,Spot);
			Move(GUID,x-20+DW_Rand(40),y,z-20+DW_Rand(40));
		end
	end
	Z23_RageBrigade_FunctionTable.SieveShadow = function (FieldWork,OnDuty,Shadow,Flag,ShadowMax,TimeBasis,IdlePoint,OccupiedPoint,PlantTotal)	--�ʱ���Ȫ����A(�}�C����)�A�N�ݭn�B�z����ȰO�U
		local ShadowTotal,TempShadow=0;
		local Execution,Available = FieldWork,OnDuty
		for SN=ShadowMax,1,-1 do
			TempShadow = Shadow[SN];
			if	TempShadow~=nil then
				if CheckID(TempShadow)==true and ReadRoleValue(TempShadow,EM_RoleValue_IsDead)==0 then--�B�z��Ȫ�����
					if	HateListCount(TempShadow)==0	then
						if	ReadRoleValue(TempShadow,EM_RoleValue_NpcOnMove)==0	then
							Z23_RageBrigade_FunctionTable.CommandShadow(TempShadow,DefensePlant,Flag);
						end
					else
						if Execution[SN+PlantTotal]==nil then
							if Available[1]~=nil then
								if ReadRoleValue(TempShadow,EM_RoleValue_SpellMagicID)==499297 then
									local Commissioner=Available[1];
									MagicInterrupt(Commissioner);
									SysCastSpellLv(TempShadow,Commissioner,499110,1);	--���몺�q�n���@�I(5000)
									Execution[SN+PlantTotal]=Commissioner;
									table.remove(Available,1);
								end
							end
						end
					end
				else
					table.insert(IdlePoint,OccupiedPoint[SN]);
					OccupiedPoint[SN]=nil;
					Shadow[SN]=nil;

					table.insert(Available,Execution[SN+PlantTotal]);
					Execution[SN+PlantTotal]=nil;
				end
			end
		end
		for a,b in pairs(Shadow) do
			ShadowTotal=ShadowTotal+1;
		end
		if	TimeBasis%ShadowInterval==0	then	--���ͨ�ȡA���o�b�P�@�I�W
			if	ShadowTotal<ShadowMax	then
				local NewSpot = DW_Rand(#IdlePoint);
				local NewSpotVar = IdlePoint[NewSpot];
				table.insert(OccupiedPoint,NewSpotVar);
				table.remove(IdlePoint,NewSpot);
				local x,y,z,dir = DW_Location(Flag,NewSpotVar);
				local ShadowOrgID;
				if DW_Rand(100)<31 then
					ShadowOrgID=106723;
				else
					ShadowOrgID=106722;
				end
				local NewShadow = CreateObj(ShadowOrgID,x,y,z,dir,1);
				AddToPartition(NewShadow,0);
				WriteRoleValue(NewShadow,EM_RoleValue_IsWalk,0);
				WriteRoleValue(NewShadow,EM_RoleValue_Register1,NewSpotVar);
				SetFlag(NewShadow,544801,1);
				table.insert(Shadow,NewShadow);
				MoveToFlagEnabled(NewShadow, false)
			end
		end
		return Execution,Available,Shadow,IdlePoint,OccupiedPoint;
	end
	Z23_RageBrigade_FunctionTable.CommandShadow = function(TempShadow,DefensePlant,Flag) --������ȧ����Ӫ�or����
		local State = ReadRoleValue(TempShadow,EM_RoleValue_Register2);
		local x,y,z,dir;
		if State==2 then
			for SN=1,PlantTotal do
				local TempPlant = DefensePlant[SN];
				if TempPlant~=nil then
					if CheckID(TempPlant)==true and ReadRoleValue(TempPlant,EM_RoleValue_IsDead)==0 then
						x,y,z,dir=DW_Location(TempPlant);
						x,y,z=DW_Relative(TempShadow,x,y,z,30);
						Move(TempShadow,x,y,z);
						MoveToFlagEnabled(TempShadow, false);
						return;
					end
				end
				if SN==PlantTotal then
					local x,y,z,dir=DW_Location(Flag,1);
					Move(TempShadow,x-10+DW_Rand(20),y,z-10+DW_Rand(20))
				end
			end
		elseif State<2 then
			local Spot = ReadRoleValue(TempShadow,EM_RoleValue_Register1);
			local x,y,z,dir=DW_Location(Flag,Spot);
			Move(TempShadow,x-25+DW_Rand(50),y,z-25+DW_Rand(50))
			WriteRoleValue(TempShadow,EM_RoleValue_Register2,State+1);
		end
	end
	Z23_RageBrigade_FunctionTable.ArrangementMission = function(FieldWork,OnDuty,DefensePlant,PlantTotal,Flag,CampSize)--��s�ͭx�����ȧǦC,���s���ʹӪ�(For �Ӫ�)
		local Execution,Available = FieldWork,OnDuty
		for TargetSN,Commissioner in pairs(Execution) do
			if Commissioner~=0  and TargetSN<=PlantTotal then	--�u�B�z�Ӫ�������
				if ReadRoleValue(Commissioner,EM_RoleValue_Register1)==1 then
					WriteRoleValue(Commissioner,EM_RoleValue_Register1,0);
					local x,y,z,dir = DW_Location(Flag,1);
					local PiSN = math.pi*(TargetSN/PlantTotal*2);
					DefensePlant[TargetSN] = CreateObj(106867,x+CampSize*math.cos(PiSN),y,z+CampSize*math.sin(PiSN),(TargetSN*(360/PlantTotal)),1);
					local TempPlant =DefensePlant[TargetSN];
					AddToPartition(TempPlant,0);
					SetModeEx(TempPlant,EM_SetModeType_ShowRoleHead,false) ;
					SetModeEx(TempPlant,EM_SetModeType_Mark,false);
					SetModeEx(TempPlant,EM_SetModeType_Strikback,false)
					SetFlag(TempPlant,544801,1);
					AddBuff(TempPlant,502707,0,-1);
					table.insert(Available,Commissioner)
					Execution[TargetSN]=0;
				end
			end
		end
		return Execution,Available;
	end
	Z23_RageBrigade_FunctionTable.SievePlant = function(FieldWork,OnDuty,DefensePlant,PlantTotal,Flag,CampSize) --�L�o�Ӫ������p�A�N�ݭn�B�z���Ӫ��O�U
		local FinePlant = 0
		local Execution,Available = FieldWork,OnDuty
		for SN=1,PlantTotal do
			local TempPlant=DefensePlant[SN];
			local CommissionerState=nil;
			if TempPlant~= nil then	--�T�{�Ӫ����A
				if CheckID(TempPlant)==true and ReadRoleValue(TempPlant,EM_RoleValue_IsDead)==0 then
					if CheckBuff(TempPlant,622299)==true then
						CommissionerState="Heal";
					end
				else
					CommissionerState="Revive"
				end
			else
				CommissionerState="Revive";
			end
			if Execution[SN]==0 then	--�T�{�M��
				if Available[1]~=nil then
					if CommissionerState~=nil then
						local Commissioner=Available[1];
						Execution[SN]=Commissioner;
						table.remove(Available,1);
					end
				end
			else
				if CommissionerState==nil then
					table.insert(Available,Execution[SN]);
					Execution[SN]=0
				end
			end
			local Commissioner=Execution[SN];
			if Commissioner~=0 then	--�B�m�@��
				if ReadRoleValue(Commissioner,EM_RoleValue_NpcOnMove)==0 then
					if CommissionerState=="Revive" then
						local x,y,z,dir = DW_Location(Flag,1);
						local PiSN = math.pi*(SN/PlantTotal*2);
						y = GetHeight( x,y,z); 
						CastSpellPos(Commissioner,x+CampSize*math.cos(PiSN),y,z+CampSize*math.sin(PiSN),499293,1);
					elseif CommissionerState=="Heal" then
						SetStopAttack(Commissioner);
						CastSpellLV(Commissioner,TempPlant,499298,4);
					end
				end
			end
		end
		if	FinePlant==PlantTotal	then
			if Flag==780087 then
				Z23_RageBrigade_State = 2;
			else
				Z23_RageBrigade_State = 4;
			end
		end
		return Execution,Available;
	end
	Z23_RageBrigade_FunctionTable.IdleBehavior = function(FieldWork,OnDuty,DefensePlant,PlantTotal,Shadow) --�B�z���m���u��
		local NoOnDuty;
		local Execution,Available = FieldWork,OnDuty
		if Available[1]~=nil then
			for TargetSN,Commissioner in pairs(Execution) do
				for i=1,#Available do
					if TargetSN>PlantTotal then
						SysCastSpellLv(Shadow[TargetSN-PlantTotal],Available[i],495751,0)
						NoOnDuty=NoOnDuty or true
					end
				end
			end
			if NoOnDuty==nil then
				if DW_Rand(100)>70 then
					local SN=1
					for i=1,#DefensePlant do
						if Execution[i]==0 then
							if Available[SN]~=nil then
								CastSpell(Available[SN],DefensePlant[i],499299);
								SN=SN+1;
							else
								break;
							end
						end
					end
				end
			end
		end
	end
-----------------------------------------------------------------------------------------------
	local DoomAnt = function (AttackPositionAnt,PreparePositionAnt,RegularPatrolAnt,DepthPatrolAnt)	--�R���Ʊ�
		for SN,ID in pairs(AttackPositionAnt) do
			DelObj(ID);
		end
		for SN,ID in pairs(PreparePositionAnt) do
			DelObj(ID);
		end
		for SN,ID in pairs(RegularPatrolAnt) do
			DelObj(ID);
		end
		for SN,ID in pairs(DepthPatrolAnt) do
			DelObj(ID);
		end
	end
	local DoomElf = function (DefensePlant,ElfGuard,DragonGuard,MaleElf,FemaleElf,Teleporter,PeggyNPC,DisBall)	--�R���a�������
		for SN,ID in pairs(DefensePlant) do
			DelObj(ID);
		end
		for SN,ID in pairs(ElfGuard) do
			DelObj(ID);
		end
		DelObj(DragonGuard);
		DelObj(MaleElf);
		DelObj(FemaleElf);
		DelObj(Teleporter);
		DelObj(PeggyNPC);
		DelObj(DisBall);
	end
	local ChangePlayerPocision = function(StandardNPC,Range,FlagID,FlagNum) --�⪱�a�ǰe��t�~�@��
		local PlayerList=SearchRangePlayer ( StandardNPC , Range );
		local x,y,z,dir=DW_Location(FlagID,FlagNum);
		for Pos=0,#PlayerList do
			local Player=PlayerList[Pos];
			if Player==-1 then break; end	--�̫�@�Ӥ��B�z
			local Newx,Newz=x+50-DW_Rand(100),z+50-DW_Rand(100);
			local Newy=GetHeight(NewX,y,Newz);
			SetPos(Player,Newx,Newy,Newz,dir);
		end
	end
	Z23_RageBrigade_State = 1;
	while	true	do
		--�Ĥ@���q�G�M�h�ܷǳƦ�m
			
		DisBall=Lua_RageBrigade_MovingNote(780092,1);
		for SN,Ant in pairs(PreparePositionAnt) do
			StopMove(Ant,false);
			CallPlot(Ant,"DW_Move","flag",Ant,780089,1,30,true,true);
			CallPlot(Ant,"LuaFunc_Obj_Suicide",200);
		end
		PreparePositionAnt={};
		sleep(10);
		x,y,z,dir = DW_Location(780089,GuardTotal+1);	--�X�l780089�C
		DragonGuard=CreateObj(106899,x,y,z,dir,1);
		AddToPartition(DragonGuard,0);
		SetModeEx(DragonGuard,EM_SetModeType_Move,false) ;
		SetFlag(DragonGuard,544801,1);
		table.insert(OnDuty,DragonGuard);
		if	PreparePositionAnt[GuardTotal+1]~=nil	then
			SysCastSpellLv(PreparePositionAnt[GuardTotal+1],DragonGuard,495751,1);
		end
		for GuardSN=1,GuardTotal do
			x,y,z,dir = DW_Location(780089,GuardSN);	--�X�l780089�C�ǳƦ�m���n���X��
			ElfGuard[GuardSN] = CreateObj(ElfGuardOrgList[GuardSN],x,y,z,dir,1);
			AddToPartition(ElfGuard[GuardSN],0);
			SetModeEx(ElfGuard[GuardSN],EM_SetModeType_Move,false) ;
			SetFlag(ElfGuard[GuardSN],544801,1);
			table.insert(OnDuty,ElfGuard[GuardSN]);
		end
		x,y,z,dir = DW_Location(780089,GuardTotal+2);	--�X�l780089�C
		MaleElf=CreateObj(121026,x,y,z,dir,1);
		x,y,z,dir = DW_Location(780089,GuardTotal+3);	--�X�l780089�C
		FemaleElf=CreateObj(119111,x,y,z,dir,1);
		x,y,z,dir = DW_Location(780089,GuardTotal+4);	--�X�l780089�C
		Teleporter=CreateObj(119110,x,y,z,dir,1);
		x,y,z,dir = DW_Location(780089,GuardTotal+5);	--�X�l780089�C
		PeggyNPC=CreateObj(120574,x,y,z,dir,1);
		AddToPartition(MaleElf,0);
		AddToPartition(FemaleElf,0);
		AddToPartition(Teleporter,0);
		AddToPartition(PeggyNPC,0);
		DW_UnFight(MaleElf,false);
		DW_UnFight(FemaleElf,false);
		SetModeEx(MaleElf,EM_SetModeType_Move,false) ;
		SetModeEx(FemaleElf,EM_SetModeType_Move,false) ;
		table.insert(OnDuty,MaleElf);
		table.insert(OnDuty,FemaleElf);
		Lua_RageBrigade_Prepare(FemaleElf,ElfGuard)--���ǳƦ�m����t
		while	true	do
			sleep(10);
			local ElfTruce,DragonTruce = false;
			for GuardSN=1,GuardTotal do
				if	HateListCount(ElfGuard[GuardSN])~=0	then
					break;
				end
				if GuardSN==GuardTotal	then
					ElfTruce=true;
				end
			end
			if	ElfTruce==true	then
				if HateListCount(DragonGuard)==0 then
					break;
				end
			end
		end
		CastSpell(MaleElf,MaleElf,499299);
		CastSpell(FemaleElf,FemaleElf,499299);
		sleep(30)
		x,y,z,dir = DW_Location(780087,1);
		for PlantSN=1,PlantTotal do
			PiSN = math.pi*(PlantSN/PlantTotal*2);
			DefensePlant[PlantSN] = CreateObj(106867,x+CampSize*math.cos(PiSN),y,z+CampSize*math.sin(PiSN),dir+(PlantSN*(360/PlantTotal)),1);
			local TempPlant = DefensePlant[PlantSN];
			SetModeEx(TempPlant,EM_SetModeType_ShowRoleHead,false) ;
			SetModeEx(TempPlant,EM_SetModeType_Mark,false);
			SetModeEx(TempPlant,EM_SetModeType_Strikback,false);
			AddToPartition(TempPlant,0);
			SetFlag(TempPlant,544801,1);
			AddBuff(TempPlant,502707,0,-1);
		end
		--�ĤG���q�G�b�ǳƦ�m�g��
			
		Z23_RageBrigade_Situation = Z23_RageBrigade_Situation or 0
		local Limit = GetMoveFlagCount(780083)-1;
		local IdlePoint,OccupiedPoint = {},{};
		for i=2,Limit do
			IdlePoint[i-1] = i;
		end
		Z23_RageBrigade_State = 2;
		while true do
			local SingleAnt=0;
			for SN,Ant in pairs(PreparePositionAnt) do
				if CheckID(Ant)==true and ReadRoleValue(Ant,EM_RoleValue_IsDead)==0 then
					if ReadRoleValue(Ant,EM_RoleValue_NpcOnMove)==0 then
						if SN==1 then
							Z23_RageBrigade_FunctionTable.PatrolAlongFlag(Ant,780083,ReadRoleValue(Ant,EM_RoleValue_Register1),ReadRoleValue(Ant,EM_RoleValue_Register2),Limit);
						else
							CallPlot(Ant,"DW_Move","flag",Ant,780089,1,50,true,true);
						end
					end
					SingleAnt=SingleAnt+1;
				else
					PreparePositionAnt[SN]=nil;
				end
			end
			if SingleAnt==0 then
				if	TimeBasis%AntInterval==0	then
					local NewAnt = Z23_RageBrigade_FunctionTable.FlagCreateAnt(780083);
					table.insert(PreparePositionAnt,NewAnt)
				end
			end
			Z23_RageBrigade_InsideAnt=0;
			AttackPositionAnt = Z23_RageBrigade_FunctionTable.SieveAnt(AttackPositionAnt,PositionMaxNum,TimeBasis,780084);--������5��
			RegularPatrolAnt = Z23_RageBrigade_FunctionTable.SieveAnt(RegularPatrolAnt,5,TimeBasis,780081);--�~���5��
			DepthPatrolAnt = Z23_RageBrigade_FunctionTable.SieveAnt(DepthPatrolAnt,5,TimeBasis,780086);--�`�J��5��
			FieldWork,OnDuty = Z23_RageBrigade_FunctionTable.ArrangementMission(FieldWork,OnDuty,DefensePlant,PlantTotal,780087,CampSize);
			FieldWork,OnDuty,Shadow,IdlePoint,OccupiedPoint = Z23_RageBrigade_FunctionTable.SieveShadow(FieldWork,OnDuty,Shadow,780083,ShadowMax,TimeBasis,IdlePoint,OccupiedPoint,PlantTotal);	--���5��
			FieldWork,OnDuty = Z23_RageBrigade_FunctionTable.SievePlant(FieldWork,OnDuty,DefensePlant,PlantTotal,780087,CampSize);
			Z23_RageBrigade_FunctionTable.IdleBehavior(FieldWork,OnDuty,DefensePlant,PlantTotal,Shadow);
			if	Z23_RageBrigade_Situation==-10	then
				for SN,GUID in pairs(Shadow) do
					CallPlot(GUID,"LuaFunc_Obj_Suicide",1);
				end
				DoomAnt(AttackPositionAnt,PreparePositionAnt,RegularPatrolAnt,DepthPatrolAnt);
				DoomElf(DefensePlant,ElfGuard,DragonGuard,MaleElf,FemaleElf,Teleporter,PeggyNPC,DisBall);
				Z23_RageBrigade_Situation = nil;
				Z23_RageBrigade_FunctionTable = nil;
				return;
			elseif	Z23_RageBrigade_Situation==60	then
				Z23_RageBrigade_Situation = 0
				break;
			else
				Z23_RageBrigade_Situation = Z23_RageBrigade_Situation + 1
			end

			if	TimeBasis==30	then
				TimeBasis=0
			else
				TimeBasis=TimeBasis + 2;
			end
			sleep(20);
		end
		Lua_RageBrigade_AttackDrama(MaleElf,FemaleElf,Teleporter)--�q�ǳƦ�m��԰���m����t
		CastSpell(Teleporter,Teleporter,495735)
		SysCastSpellLv(Teleporter,MaleElf,495735,0)
		SysCastSpellLv(Teleporter,FemaleElf,495735,0)
		SysCastSpellLv(Teleporter,DragonGuard,495735,0)
		SysCastSpellLv(Teleporter,PeggyNPC,495735,0)
		for GuardSN=1,GuardTotal do
			SysCastSpellLv(Teleporter,ElfGuard[GuardSN],495735,0);
		end
		
		sleep(5)
		for GuardSN=1,GuardTotal do
			DelObj(ElfGuard[GuardSN]);
		end
		ChangePlayerPocision(MaleElf,80,780092,1);	--���ܪ��a��m
		DelObj(DisBall);
		DelObj(MaleElf);
		DelObj(FemaleElf);
		DelObj(DragonGuard);
		DelObj(Teleporter);
		DelObj(PeggyNPC);
		for SN=1,PlantTotal do
			DelObj(DefensePlant[SN])
			--WriteRoleValue(DefensePlant[SN],EM_RoleValue_LiveTime,20);
		end
		Z23_RageBrigade_State = 3;
		for SN,GUID in pairs(Shadow) do
			CallPlot(GUID,"LuaFunc_Obj_Suicide",200);
			StopMove(GUID,false);
			CallPlot(GUID,"DW_Move","flag",GUID,780089,1,30,true,true);
		end
		if PreparePositionAnt[1]~=nil then CallPlot(PreparePositionAnt[1],"LuaFunc_Obj_Suicide",200); end
		Shadow = {};
		FieldWork,OnDuty = {},{}
		for i=1,PlantTotal do
			FieldWork[i]=0;
		end
		--�ĤT���q�G���������m
			
		DisBall=Lua_RageBrigade_MovingNote(780089,1);
		for SN,Ant in pairs(AttackPositionAnt) do
			StopMove(Ant,false);
			CallPlot(Ant,"DW_Move","flag",Ant,780092,1,30,true,true);
			CallPlot(Ant,"LuaFunc_Obj_Suicide",200);
		end
		AttackPositionAnt={};
		sleep(10);
		x,y,z,dir = DW_Location(780092,GuardTotal+1);	--�X�l780092�C
		DragonGuard=CreateObj(106899,x,y,z,dir,1);
		AddToPartition(DragonGuard,0);
		SetModeEx(DragonGuard,EM_SetModeType_Move,false) ;
		SetFlag(DragonGuard,544801,1);
		table.insert(OnDuty,DragonGuard);
		if	AttackPositionAnt[GuardTotal+1]~=nil	then
			SysCastSpellLv(AttackPositionAnt[GuardTotal+1],DragonGuard,495751,1);
		end
		for GuardSN=1,GuardTotal do
			x,y,z,dir = DW_Location(780092,GuardSN);	--�X�l780092�C������m���n���X��
			ElfGuard[GuardSN] = CreateObj(ElfGuardOrgList[GuardSN],x,y,z,dir,1);
			AddToPartition(ElfGuard[GuardSN],0);
			SetModeEx(ElfGuard[GuardSN],EM_SetModeType_Move,false) ;
			SetFlag(ElfGuard[GuardSN],544801,1);
			table.insert(OnDuty,ElfGuard[GuardSN]);
		end
		x,y,z,dir = DW_Location(780092,GuardTotal+2);	--�X�l780092�C
		MaleElf=CreateObj(121027,x,y,z,dir,1);
		x,y,z,dir = DW_Location(780092,GuardTotal+3);	--�X�l780092�C
		FemaleElf=CreateObj(119112,x,y,z,dir,1);
		x,y,z,dir = DW_Location(780092,GuardTotal+4);	--�X�l780092�C
		Teleporter=CreateObj(119110,x,y,z,dir,1);
		x,y,z,dir = DW_Location(780092,GuardTotal+5);	--�X�l780092�C
		PeggyNPC=CreateObj(120705,x,y,z,dir,1);
		AddToPartition(MaleElf,0);
		AddToPartition(FemaleElf,0);
		AddToPartition(Teleporter,0);
		AddToPartition(PeggyNPC,0);
		DW_UnFight(MaleElf,false);
		DW_UnFight(FemaleElf,false);
		SetModeEx(MaleElf,EM_SetModeType_Move,false) ;
		SetModeEx(FemaleElf,EM_SetModeType_Move,false) ;
		table.insert(OnDuty,MaleElf);
		table.insert(OnDuty,FemaleElf);
		Z23_RageBrigade_State = 4;
		Lua_RageBrigade_Attack(DragonGuard,MaleElf)--��������m����t
		while	true	do
			sleep(10);
			local ElfTruce,DragonTruce = false;
			for GuardSN=1,GuardTotal do
				if	HateListCount(ElfGuard[GuardSN])~=0	then
					break;
				end
				if GuardSN==GuardTotal	then
					ElfTruce=true;
				end
			end
			if	ElfTruce==true	then
				if HateListCount(DragonGuard)==0 then
					break;
				end
			end
		end
		CastSpell(MaleElf,MaleElf,499299);
		CastSpell(FemaleElf,FemaleElf,499299);
		sleep(30)
		x,y,z,dir = DW_Location(780088,1);
		for PlantSN=1,PlantTotal do
			PiSN = math.pi*(PlantSN/PlantTotal*2);
			DefensePlant[PlantSN] = CreateObj(106867,x+CampSize*math.cos(PiSN),y,z+CampSize*math.sin(PiSN),dir+(PlantSN*(360/PlantTotal)),1);
			local TempPlant = DefensePlant[PlantSN];
			SetModeEx(TempPlant,EM_SetModeType_ShowRoleHead,false) ;
			SetModeEx(TempPlant,EM_SetModeType_Mark,false);
			SetModeEx(TempPlant,EM_SetModeType_Strikback,false) ;
			AddToPartition(TempPlant,0);
			SetFlag(TempPlant,544801,1);
			AddBuff(TempPlant,502707,0,-1);
		end
		--�ĥ|���q�G�b������m�g��
			
		Z23_RageBrigade_Situation = Z23_RageBrigade_Situation or 0
		local Limit = GetMoveFlagCount(780085)-1;
		local IdlePoint,OccupiedPoint = {},{};
		for i=2,Limit do
			IdlePoint[i-1] = i;
		end
		while true do
			local SingleAnt=0;
			for SN,Ant in pairs(AttackPositionAnt) do
				if CheckID(Ant)==true and ReadRoleValue(Ant,EM_RoleValue_IsDead)==0 then
					if ReadRoleValue(Ant,EM_RoleValue_NpcOnMove)==0 then
						if SN==1 then
							Z23_RageBrigade_FunctionTable.PatrolAlongFlag(Ant,780085,ReadRoleValue(Ant,EM_RoleValue_Register1),ReadRoleValue(Ant,EM_RoleValue_Register2),Limit);
						else
							CallPlot(Ant,"DW_Move","flag",Ant,780092,1,30,true,true);
						end
					end
					SingleAnt=SingleAnt+1;
				else
					AttackPositionAnt[SN]=nil;
				end
			end
			if SingleAnt==0 then
				if	TimeBasis%AntInterval==0	then
					local NewAnt = Z23_RageBrigade_FunctionTable.FlagCreateAnt(780085);
					table.insert(AttackPositionAnt,NewAnt)
				end
			end
			Z23_RageBrigade_InsideAnt=0;
			PreparePositionAnt = Z23_RageBrigade_FunctionTable.SieveAnt(PreparePositionAnt,PositionMaxNum,TimeBasis,780082);--�ǳư�5��
			RegularPatrolAnt = Z23_RageBrigade_FunctionTable.SieveAnt(RegularPatrolAnt,5,TimeBasis,780081);--�~���5��
			DepthPatrolAnt = Z23_RageBrigade_FunctionTable.SieveAnt(DepthPatrolAnt,5,TimeBasis,780086);--�`�J��5��
			FieldWork,OnDuty = Z23_RageBrigade_FunctionTable.ArrangementMission(FieldWork,OnDuty,DefensePlant,PlantTotal,780088,CampSize);
			FieldWork,OnDuty,Shadow,IdlePoint,OccupiedPoint = Z23_RageBrigade_FunctionTable.SieveShadow(FieldWork,OnDuty,Shadow,780085,ShadowMax,TimeBasis,IdlePoint,OccupiedPoint,PlantTotal);	--���5��
			FieldWork,OnDuty = Z23_RageBrigade_FunctionTable.SievePlant(FieldWork,OnDuty,DefensePlant,PlantTotal,780088,CampSize);
			Z23_RageBrigade_FunctionTable.IdleBehavior(FieldWork,OnDuty,DefensePlant,PlantTotal,Shadow);
			if	Z23_RageBrigade_Situation==-10	then
				for SN,GUID in pairs(Shadow) do
					CallPlot(GUID,"LuaFunc_Obj_Suicide",1);
				end
				DoomAnt(AttackPositionAnt,PreparePositionAnt,RegularPatrolAnt,DepthPatrolAnt);
				DoomElf(DefensePlant,ElfGuard,DragonGuard,MaleElf,FemaleElf,Teleporter,PeggyNPC,DisBall);
				Z23_RageBrigade_Situation = nil;
				Z23_RageBrigade_FunctionTable = nil;
				return;
			elseif	Z23_RageBrigade_Situation==60	then
				Z23_RageBrigade_Situation = 0
				break;
			else
				Z23_RageBrigade_Situation = Z23_RageBrigade_Situation + 1
			end

			if	TimeBasis==30	then
				TimeBasis=0
			else
				TimeBasis=TimeBasis + 2;
			end
			sleep(20);
		end
		Lua_RageBrigade_RetreatDrama(DragonGuard,MaleElf,FemaleElf,Teleporter)--�q�԰���m��ǳƦ�m����t
		CastSpell(Teleporter,Teleporter,495735)
		SysCastSpellLv(Teleporter,MaleElf,495735,0)
		SysCastSpellLv(Teleporter,FemaleElf,495735,0)
		SysCastSpellLv(Teleporter,DragonGuard,495735,0)
		SysCastSpellLv(Teleporter,PeggyNPC,495735,0)
		for GuardSN=1,GuardTotal do
			SysCastSpellLv(Teleporter,ElfGuard[GuardSN],495735,0);
		end
		
		sleep(5)
		for GuardSN=1,GuardTotal do
			DelObj(ElfGuard[GuardSN]);
		end
		ChangePlayerPocision(MaleElf,80,780089,1);	--���ܪ��a��m
		DelObj(DisBall);
		DelObj(MaleElf);
		DelObj(FemaleElf);
		DelObj(DragonGuard);
		DelObj(Teleporter);
		DelObj(PeggyNPC);
		for SN=1,PlantTotal do
			DelObj(DefensePlant[SN])
			--WriteRoleValue(DefensePlant[SN],EM_RoleValue_LiveTime,20);
		end
		Z23_RageBrigade_State = 1;
		for SN,GUID in pairs(Shadow) do
			CallPlot(GUID,"LuaFunc_Obj_Suicide",200);
			StopMove(GUID,false);
			CallPlot(GUID,"DW_Move","flag",GUID,780092,1,30,true,true);
		end
		if AttackPositionAnt[1]~=nil then CallPlot(AttackPositionAnt[1],"LuaFunc_Obj_Suicide",200); end
		Shadow = {};
		FieldWork,OnDuty = {},{}
		for i=1,PlantTotal do
			FieldWork[i]=0;
		end
	end
end


function Lua_Z23_RageBrigade_BackDoor(Num)--�M�����
	Z23_RageBrigade_Situation = Num;
end

function Lua_Z23_RageBrigade_AntInitialPlot()--�����ƪ���l�@��
	local Ant = OwnerID()
	SetPlot(Ant,"range","Lua_Z23_AntRangePlot",100);
	SetPlot(Ant,"dead","Lua_425351_NPCDead",0);
	Cl_ZoneMonster_RandBuff();
end

function Lua_Z23_AntRangePlot()--�����ƪ��d��@��Ĳ�o����
	local Player,Ant = OwnerID(),TargetID();
	if CountBodyItem(Player,209465)>0 then
		return true;
	end
	local PlayerOnAttackCamp = DW_CheckDis(Player,780088,1,70);
	local PlayerOnPrePareCamp = DW_CheckDis(Player,780087,1,70);
	local AntDecideResult
	if PlayerOnAttackCamp then
		if Z23_RageBrigade_State==4 then
			AntDecideResult=false;
		else
			AntDecideResult=true;
		end
	elseif PlayerOnPrePareCamp then
		if Z23_RageBrigade_State==2 then
			AntDecideResult=false;
		else
			AntDecideResult=true;
		end
	else
		AntDecideResult=true;
	end
	if AntDecideResult==true then
		StopMove(Ant,false);
		SetAttack(Ant,Player);
		return true
	end
end

function Lua_Z23_RageBrigade_NewPlantMark()--�إX�s�Ӫ��򥻪k�N����@��
	local NewObj,Caster = OwnerID(),TargetID();
	SetModeEx(NewObj,EM_SetModeType_HideName,true);
	SetModeEx(NewObj,EM_SetModeType_Mark,false) 
	SetModeEx(NewObj,EM_SetModeType_ShowRoleHead,false) 
	WriteRoleValue(Caster,EM_RoleValue_Register1,1);
end
-------------------------�D�u����--------------------------------------
--424023 
	
function Lua_424023_TriggerInitial()
	local Box = OwnerID();
	SetPlot(Box,"range","Lua_424023_TriggerPlot",50)
end
function Lua_424023_TriggerPlot()
	local Player,Box = OwnerID(),TargetID();
	if CheckAcceptQuest(Player,424023)==true and CheckFlag(Player,542197)==false then
		if HateListCount(Player)==0 then
			if CountBodyItem(Player,209465)>0 then
				ScriptMessage( Player, Player, 0, "[SC_424023_A]", C_YELLOW );
				SetFlag(Player,542197,1);
			else
				ScriptMessage( Player, Player, 1, "[SC_424023_B]", 0 );
			end
		else
			ScriptMessage( Player, Player, 1, "[SC_424023_C]", 0 );
		end
	end
end
--424024
	
function Lua_424024_ClickQuestObject()--�����I������
	local Player,QuestObject = OwnerID(),TargetID();
	DW_QietKillOne(Player,101300);
	KillID(Player,QuestObject);
	return true;
end
function Lua_424024_FeedingBox_Initial()--���i��������l�@��
	Lua_424023_TriggerInitial()
	local Pool=OwnerID();
	local x,y,z,dir=DW_Location(Pool);
	local Egg1=CreateObj(121030,x+5,y,z-5,dir,1);
	local Egg2=CreateObj(121030,x-5,y,z+5,dir,1);
	local EggSetting=function(EggID)--�]�w��ͥX�Ӫ��ƧZ
		SetModeEx(EggID,EM_SetModeType_Mark,false) ;
		SetModeEx(EggID,EM_SetModeType_ShowRoleHead,false) ;
		SetModeEx(EggID,EM_SetModeType_Gravity,false) ;
		AddToPartition(EggID,0);
	end
	EggSetting(Egg1);
	EggSetting(Egg2);
	WriteRoleValue(Pool,EM_RoleValue_Register1,Egg1);
	WriteRoleValue(Pool,EM_RoleValue_Register2,Egg2);
	SetPlot(Pool,"dead","Lua_424024_FeedingBox_Dead",0);
end
function Lua_424024_FeedingBox_Dead()--���i���������`�@��
	local Pool=OwnerID();
	local x,y,z,dir=DW_Location(Pool);
	local BrokenPool=CreateObj(121105,x,y,z,dir,1);
	AddToPartition(BrokenPool,0);
	SysCastSpellLv(BrokenPool,BrokenPool,494640,1)
	DelObj(ReadRoleValue(Pool,EM_RoleValue_Register1));
	DelObj(ReadRoleValue(Pool,EM_RoleValue_Register2));
	WriteRoleValue(Pool,EM_RoleValue_Register3,BrokenPool);	--�N��������ID�s�b�o��
	CallPlot(Pool,"Lua_424024_StayForRevive",50,0); 
	return false;
end
function Lua_424024_FeedingBox_NPC()--���U�ƧZ�����@�̨��޼@��
	local Gardian=OwnerID();
	MoveToFlagEnabled(Gardian, false);	--�����
	local SearchTable=SearchRangeNPC ( Gardian , 70 );
	local TempID,OrgID
	local Pool,BrokenPool
	for SN=0,#SearchTable do
		TempID=SearchTable[SN];
		if TempID==-1 then
			break;
		end
		OrgID=ReadRoleValue(TempID,EM_RoleValue_OrgID);
		if OrgID==121104 then
			Pool=TempID;
		elseif OrgID==121105 then
			BrokenPool=TempID;
		end
	end
	if BrokenPool~=nil then
		if HateListCount(Gardian)==0 then
			CastSpell(Gardian,BrokenPool,850215);
			PlayMotion(Gardian,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
			sleep(20);
			--���|�����a�F
			WriteRoleValue(BrokenPool,EM_RoleValue_Register4,1);	--�ܼƷ��q:�ߨ�_��
		end
	else
		if Pool~=nil then
			if HateListCount(Gardian)==0 then
				--�����n�����|����
				local Egg1,Egg2=ReadRoleValue(Pool,EM_RoleValue_Register1),ReadRoleValue(Pool,EM_RoleValue_Register2);
				CastSpell(Gardian,Egg1,850215);
				PlayMotion(Gardian,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
				sleep(20);
				if HateListCount(Gardian)==0 then
					CastSpell(Gardian,Egg2,850215);
					PlayMotion(Gardian,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
					sleep(20);
				end
			end
		end
	end
	MoveToFlagEnabled(Gardian, true);
end
function Lua_424024_StayForRevive(WaitTime,RoomID)--���ݭ��ͮɶ��A�M��_��
	local Pool=OwnerID();
	DelFromPartition(Pool)
	ReSetNPCInfo(Pool);
	local IsRevived=false;
	local BrokenPool=ReadRoleValue(Pool,EM_RoleValue_Register3);
	for Sec=1,WaitTime/10 do
		sleep(10);
		if ReadRoleValue(BrokenPool,EM_RoleValue_Register4)==1 then
			WriteRoleValue(BrokenPool,EM_RoleValue_Register4,0);
			IsRevived=true;
			break;
		end
	end
	DelFromPartition(BrokenPool)	--���e�N��������ID�s�b�o��
	AddToPartition(Pool,RoomID);
	if IsRevived==true then
		CastSpell(Pool,Pool,494221);
	end
end
--424025
	
function Lua_424025_UseItemPlot()--�ϥΪ��~�A�I�s�u�s��ŧ(�ˬd)
	local Player=OwnerID();
	local x,y,z,dir=DW_Location(Player);
	if CheckBuff(Player,622302)==false then
		if CheckMapID( x,y,z,372)==true then
			if ReadRoleValue(Z23_RageBrigade_Controller,EM_RoleValue_Register1)==0 then	--�|���Ұʭ˼�
				ScriptMessage( Player, Player, 2, "[SC_424025_A]", 0 );--�e������
				ScriptMessage( Player, Player, 0, "[SC_424025_B]", C_YELLOW );--���U�踨����
				AddBuff(Player,622302,0,120);
				WriteRoleValue(Z23_RageBrigade_Controller,EM_RoleValue_Register1,1);
				CallPlot(Z23_RageBrigade_Controller,"Lua_424025_MeasureProcession",Player);
			else										--�w�b�˼Ƥ�
				local Result= (Z23_RageBrigade_Reciprocal==nil)or(Z23_RageBrigade_Reciprocal<25)
				if  Result~=false then							--�p�G�b25���[�J
					ScriptMessage( Player, Player, 2, "[SC_424025_A]", 0 );--�e������
					ScriptMessage( Player, Player, 0, "[SC_424025_B]", C_YELLOW );--���U�踨����
					table.insert(Z23_RageBrigade_PlayerTable,Player);
					AddBuff(Player,622302,0,120);
				else
					ScriptMessage( Player, Player, 1, "[SC_424025_D]", 0 );--�e������
				end
			end
		else
			ScriptMessage( Player, Player, 1, "[SC_424025_C]", 0 );--�e������
		end
	else
		ScriptMessage( Player, Player, 1, "[SC_424025_E]", 0 );--�e������
	end
end
function Lua_424025_MeasureProcession(Player)--�I�s�u�s��ŧ(����)�A�������
	local Controller=OwnerID();
	local RemoveProcess=function()--�M�ť����ܼơA�H�ΰO����
		WriteRoleValue(Z23_RageBrigade_Controller,EM_RoleValue_Register1,0);
		for SN,GUID in pairs(Z23_RageBrigade_PlayerTable) do
			CancelBuff_NoEvent(GUID,622302);
		end
		Z23_RageBrigade_Reciprocal=nil;
		Z23_RageBrigade_PlayerTable=nil;
	end
	local AreaMessage_424025=function(Controller , Type , String , Color )--��i����Ȫ����a�o��
		for SN,GUID in pairs(Z23_RageBrigade_PlayerTable) do
			if CheckID(GUID)==true then
				--DeBugMSG(0,0,SN.."\\"..GUID.."\\"..Type.."\\"..String.."\\"..Color)
				ScriptMessage(Controller,GUID,Type ,String,Color);
			end
		end
	end
	Z23_RageBrigade_Reciprocal=0
	Z23_RageBrigade_PlayerTable={};
	table.insert(Z23_RageBrigade_PlayerTable,Player);
	local MissionDuration=60;
	local TotalPlayer=0
	for i=1,MissionDuration/2 do
		Z23_RageBrigade_Reciprocal=i;
		sleep(20);
		for SN,GUID in pairs(Z23_RageBrigade_PlayerTable) do
			if CheckID(GUID)==true then
				if CheckBuff(GUID,622302)==false then
					table.remove(Z23_RageBrigade_PlayerTable,SN);
				else
					TotalPlayer=TotalPlayer+1;
				end
			end
		end
		if TotalPlayer==0 then
			ScriptMessage(  Controller,-1, 0, "[SC_424025_F]", C_YELLOW );	--���U�踨����
			RemoveProcess();
			return;
		end
		if i%7==0 then--�C14��T�{���A
			if Z23_RageBrigade_InsideAnt~=0 then
				AreaMessage_424025( Controller, 1, "[SC_424025_G]", 0 );--�e���������r
			else
				AreaMessage_424025( Controller, 1, "[SC_424025_H]", C_YELLOW );--���U�踨����
			end
		end
	end
	if Z23_RageBrigade_InsideAnt<=0 then--���ȹF��;�e���ȡG0
		for SN,GUID in pairs(Z23_RageBrigade_PlayerTable) do
			if CheckID(GUID)==true then
				if CheckBuff(GUID,622302)==true then
					if DW_CheckQuestAccept("or",GUID,424025,425362,425376,425390)==true then
						DW_QietKillOne(GUID,101301);
						DelBodyItem(GUID,241644,CountBodyItem(GUID,241644));--�R�����z����
					end
					CancelBuff_NoEvent(GUID,622302)
				end
			end
		end
		AreaMessage_424025(  Controller, 2, "[SC_424025_I]", 0 );--�}�l�F��
		local x,y,z,dir=DW_Location(780078,1);
		y=y+50;
		local Dragon=CreateObj(106868,x,y,z,dir,1);
		SetModeEx(Dragon,EM_SetModeType_Gravity,false);
		DW_UnFight(Dragon,true);
		SetDefIdleMotion(Dragon,ruFUSION_MIME_FLY_LOOP)
		SetModeEx(Dragon,EM_SetModeType_Drag,true) ;
		AddBuff(Dragon,506984,10,-1);
		WriteRoleValue(Dragon,EM_RoleValue_IsWalk,0);
		AddToPartition(Dragon,0);
		MoveToFlagEnabled(Dragon, false);
		ReCalculate(Dragon);
		x,y,z=DW_Location(780078,2);
		sleep(20)
		CastSpellPos(Dragon,x,y,z,499292,0)
		sleep(30);
		
		local MoveProcess=function(FlagNum,SleepTime,HighMore)
			SetDefIdleMotion(Dragon,ruFUSION_MIME_SPIRAL_LOOP)
			SetModeEx(Dragon,EM_SetModeType_Drag,false) ;
			local x,y,z,dir=DW_Location(780078,FlagNum);
			sleep(Move(Dragon,x,y+HighMore,z));
			SetDefIdleMotion(Dragon,ruFUSION_MIME_FLY_LOOP)
			SetModeEx(Dragon,EM_SetModeType_Drag,true) ;
			FaceFlag(Dragon,780078,FlagNum+1);
			local x,y,z=DW_Location(780078,FlagNum+1);
			CastSpellPos(Dragon,x,y,z,499292,0);
			sleep(SleepTime)
		end

		MoveProcess(3,40,50);
		MoveProcess(5,40,50);
		MoveProcess(7,40,50);

		x,y,z,dir=DW_Location(780078,9);
		SetModeEx(Dragon,EM_SetModeType_Drag,false) ;
		Move(Dragon,x,y+800,z);
		sleep(10);
		SetDefIdleMotion(Dragon,ruFUSION_MIME_SPIRAL_LOOP)
		sleep(10);
		AreaMessage_424025(  Dragon, 3, "[SC_424025_K]", C_YELLOW );--���\�P��
		DelObj(Dragon);
	else
		AreaMessage_424025(  Controller, 1, "[SC_424025_J]", 0 );--����
	end
	RemoveProcess();
end
function Lua_424025_FXAffect()--�u�R���S�w�ؼСAIDList
	local Caster,Target = OwnerID(),TargetID();
	local OrgID=ReadRoleValue(Target,EM_RoleValue_OrgID);
	local IDList = {121102,121104}
	for SN,Org in pairs(IDList) do
		if OrgID==Org then
			NPCSay(Target,"Hitted!")
			return true;
		end
	end
	return false;
end