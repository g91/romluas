--�خ��Ī���k�G�b���ݭn�X�{���a��A����ؤW�h�A���ۺؤp�ǭn�X�{����m�A�кغX�l781254�s��1~3 ���O�ئb3�Ӫ��f(���a�i�q�L��)�A�s��4�O�p�ǳQ�l�X�ӷ|���V����m
--�����Ī���k�A���Ī�AI�O�b�i�J�԰���~�|�QĲ�o�A���}�԰����ķ|���m
--�p�G�n�����ɭԳ����A���R�����ĦA���شN�n
--Boss �y�СG  /gm ? zone 151 0 -1916 3128 1015
function Lua_107228_LuaEvent_BeginAttack()--�i�J�԰��ƥ�
	local Boss=OwnerID();
	BeginPlot(Boss,"Cl_Resist_HackersFightBegin",0);--�禡�s�@�̡G�p��  �i�γ~�G���b�ȡj
	Lua_107228_AreaClosed();--����
	local playerNumber=SetSearchAllPlayer(ReadRoleValue(Boss,EM_RoleValue_RoomID));
	for Num=1,playerNumber,1 do
		ScriptMessage(Boss,GetSearchResult(),2,"[SC_107228_BEGINATTACK]",0);--�r��
	end
	local HpLevel=EM_RoleValue_Register1;
	WriteRoleValue(Boss,HpLevel,80);
	local ProcessCode=EM_RoleValue_Register2
	WriteRoleValue(Boss,ProcessCode,0);
	local IsInvinsible=EM_RoleValue_Register3
	WriteRoleValue(Boss,IsInvinsible,0);
	BeginPlot(Boss,"Lua_107228_CombatMain",0);
	SetPlot(Boss,"dead","Lua_107228_BossDead",0);
end
function Lua_107228_CombatMain()--25�|���԰������D��j��
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local TaskQueue,TargetList={},{};
	local InCombat,PastTime=1,0;
	local ExecuteAI={};
	local TaskList={110,"SlugFall",60,"Whirl",60,"Summon"}
	while InCombat>0 do--�T�{�Ƶ{ + �U�O����{��
		sleep(10);
		local EffectiveNum=0;
		for Pos=0,InCombat-1,1 do
			local ID=HateListInfo(Boss,Pos,EM_HateListInfoType_GItemID);
			if	GetModeEx(ID,EM_SetModeType_Fight)==true and
				ReadRoleValue(ID,EM_RoleValue_IsPlayer)==1 and
				ReadRoleValue(ID,EM_RoleValue_IsDead)==0 then
				EffectiveNum=EffectiveNum+1;
			end
		end
		if EffectiveNum==0 then
			break;
		end

		PastTime=PastTime+1;
		if PastTime>480 then--�g�ɾ���
			local IsFury=EM_RoleValue_Register4;
			if ReadRoleValue(Boss,IsFury)==0 then
				local FuryBuff=623851;
				AddBuff(Boss,FuryBuff,0,-1);WriteRoleValue(Boss, IsFury, 1);
				Lua_SpecificMessage(Boss,2,"[SC_107228_FURY]",0);--�����o�r��
			end
		end

		if ( TaskQueue[1] ~= "RandSkill" ) and PastTime%7==0 then
			table.insert(TaskQueue,1,"RandSkill");
		end
		if PastTime%15==0 then
			BeginPlot(Boss,"Lua_107228_ReduceHP",0);--��������
		end
		
		if TaskQueue[1]==nil then
			for index=1,#TaskList,1 do
				TaskQueue[index]=TaskList[index];
			end
		end
		local ProcessCode=EM_RoleValue_Register2
		if ReadRoleValue(Boss,ProcessCode)==0 then
			local Order=TaskQueue[1];
			if type(Order)=="number" then--����
				table.remove(TaskQueue,1);
				for Sec=0,Order,10 do
					local IsHpRateAccord,Sill=Lua_107228_IsHpRateAccord();
					if IsHpRateAccord==true and Sill<80 then--���ݤ��Q�ʧP�_
						BeginPlot(Boss,"Lua_107228_Summon",0);
						WriteRoleValue(Boss,ProcessCode,1);--�{��1
						break
					end
					sleep(10);
					PastTime=PastTime+1
				end
			else
				if Order=="Summon" then--�ΥD�ʧP�_(����u�����g�Q����80%�H�U)
					local IsHpRateAccord,Sill=Lua_107228_IsHpRateAccord();
					if Sill<80 then
						BeginPlot(Boss,"Lua_107228_Summon",0);
						WriteRoleValue(Boss,ProcessCode,1);--�{��1
						DebugMsg(0,0,"[["..Order);
					end
					table.remove(TaskQueue,1);
				elseif	Order=="Whirl" then
					BeginPlot(Boss,"Lua_107228_Whirl",0);
					WriteRoleValue(Boss,ProcessCode,2);--�{��2
					DebugMsg(0,0,"[["..Order);
					table.remove(TaskQueue,1);
				elseif	Order=="SlugFall" then
					BeginPlot(Boss,"Lua_107228_SlugFall",0);
					WriteRoleValue(Boss,ProcessCode,3);--�{��3
					DebugMsg(0,0,"[["..Order);
					table.remove(TaskQueue,1);
				elseif	Order=="RandSkill" then
					BeginPlot(Boss,"Lua_107228_RandSkill",0);
					WriteRoleValue(Boss,ProcessCode,4);--�{��4
					DebugMsg(0,0,"[["..Order);
					table.remove(TaskQueue,1);
				else
					DebugMsg(0,RoomID,"Order unidentified");
				end
			end
		end
		InCombat=HateListCount(Boss);
	end
	BeginPlot(Boss,"Lua_107228_PrepareLeaveFight",0);
end
function Lua_107228_Summon()--�{��1:�l��p��
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local SummonFlag,ExactNum=781254;
	local CreateTable={1,2,3}
	ExactNum=DW_Rand(#CreateTable);
	ExactNum=CreateTable[ExactNum];
	local x,y,z,dir=DW_Location(SummonFlag,ExactNum);
	local OrgID={};
	
	local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID )
	if ZoneID == 151 then
		OrgID={107542,107543}
	elseif ZoneID == 152 then
		OrgID={107597,107598}
	elseif ZoneID == 153 then
		OrgID={107612,107613}
	else
		OrgID={107612,107613}
	end
	
	local Feeder=OrgID[DW_Rand(2)];
	local Token=CreateObj(Feeder,x,y,z,dir,1);--�s�p��
	SetModeEx( Token, EM_SetModeType_Searchenemy, false );	-- �������H
	WriteRoleValue(Token,EM_RoleValue_IsWalk,1);
	AddtoPartition(Token,RoomID);
	Lua_SpecificMessage(Boss,2,"[SC_107228_SUMMONTOKEN]",0);--�����o�r��
	SetPlot(Token,"dead","Lua_107542_BossDead",0);
	CallPlot(Token,"Lua_107228_TokenRule",Boss);
	local SpaceCenter=4
	x,y,z,dir=DW_Location(SummonFlag,SpaceCenter);
	local waitTime = Move(Token,x,y,z);--�i��
	waitTime = waitTime - 10;
	if waitTime < 5 then waitTime = 5; end	
	Sleep( waitTime );
	SetModeEx( Token, EM_SetModeType_Searchenemy, true );	-- ���H
	if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)==0 then
		local Spell_PretendCast=850509;
		CastSpell(Boss,Boss,Spell_PretendCast);--�I�k3��(��6��)
	else
		DebugMsg(0,RoomID,ReadRoleValue(Boss,EM_RoleValue_SpellMagicID));
	end
	local IsCastSuccess=true;
	for Sec=0,3,1 do
		if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)==0 then
			IsCastSuccess=false;
			break;
		end
		sleep(10);--3���(��6��)
	end
	if IsCastSuccess==true then
		if CheckID(Token)==true and ReadRoleValue(Token,EM_RoleValue_IsDead)==0 then--�Y�����I%�Ʀ^��
			local MaxHP=ReadRoleValue(Boss,EM_RoleValue_MaxHP);
			DW_UnFight(Token,true);
			SetStopAttack(Token);
			x,y,z,dir=DW_Location(Boss);
			local KnockDown=623929;
			AddBuff(Token,KnockDown,0,-1);
			local SpeedBuff=506984;
			AddBuff(Token,SpeedBuff,10,-1);
			SetModeEx(Token,EM_SetModeType_Drag,false);
			SetModeEx(Token,EM_SetModeType_Gravity,false);
			ReCalculate(Token);
			sleep(MoveDirect(Token,x,y+45,z)-5);
			local PureEffect,Lv=850516,1;
			SysCastSpellLv(Token,Boss,PureEffect,Lv);
			WriteRoleValue(Token,EM_RoleValue_LiveTime,1);
			local RecoverRate=0.2;--�^20%
			local RecoverHP=math.floor(MaxHP*RecoverRate);
			AddRoleValue(Boss,EM_RoleValue_HP,RecoverHP);--����
			Lua_SpecificMessage(Boss,2,"[SC_107228_ABSORDTOKEN]",0);--�����o�r��
		end
	end
	local ProcessCode=EM_RoleValue_Register2;
	WriteRoleValue(Boss,ProcessCode,0);
end
function Lua_107228_Whirl()--�{��2:�L�ı���
	local SummonFlag,ExactNum;
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	SetModeEx(Boss,EM_SetModeType_ShowRoleHead,false);--�L�k���(���Y����)�A�קK�ݨ�}��

	local x,y,z,dir=DW_Location(Boss);
	local ImmortalOrgID=107527;
	local InvisibleTarget=CreateObj(ImmortalOrgID,x,y,z,dir,1);	

	SetModeEx(InvisibleTarget,EM_SetModeType_Obstruct,false);
	SetModeEx(InvisibleTarget,EM_SetModeType_Strikback,false);
	SetModeEx(InvisibleTarget,EM_SetModeType_Searchenemy,false);
	SetModeEx(InvisibleTarget,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(InvisibleTarget,EM_SetModeType_Show,false);

	AddtoPartition(InvisibleTarget,RoomID);		
	CallPlot(InvisibleTarget,"Lua_107228_TokenRule",Boss);
	
	local Taunt=496266;
	SysCastSpellLv(InvisibleTarget,Boss,Taunt,0);--Boss��w���βy	
	Addbuff(Boss,622362,0,-1)  --�����
	
	local TargetTable=Lua_107228_CatchTarget(Boss,"Random");
	if TargetTable[1]~=nil then
		x,y,z,dir=DW_Location(TargetTable[1]);
		Move(InvisibleTarget,x,y,z);
	end
	sleep(10);
	local IsInvinsible=EM_RoleValue_Register3;
	WriteRoleValue(Boss,IsInvinsible,1);
	local WhirlBuff=623858;
	AddBuff(Boss,WhirlBuff,0,-1);--����j��
	SetDefIdleMotion(Boss,ruFUSION_MIME_WALKSP_FORWARD);--����j��
	Lua_SpecificMessage(Boss,2,"[SC_107228_BEGINWHIRL]",0);--�����o�r��
	while true do
		for Time=0,3,0.5 do	-- �쥻�O3�A4��K����
			if ReadRoleValue(Boss,IsInvinsible)==0 then--����Q���_����
				Lua_107228_QuitWhirl(Boss,InvisibleTarget);
				return
			end
			sleep(5);
		end
		-- �����ؼ�+�ܤ֤@�Ӫ��a
		local num_player = 0;
		for pos=0, HateListCount(Boss)-1, 1 do
			local h = HateListInfo( Boss, pos, EM_HateListInfoType_GItemID);
			if ReadRoleValue(h, EM_RoleValue_IsPlayer)==1 then
				num_player = num_player + 1;
			end
		end
		if num_player>0 then
			TargetTable = Lua_107228_CatchTarget(Boss,"Random");
			
			if TargetTable[1]~=nil then
				local tar = TargetTable[1];
				-- �P�_ --					
				CastSpellLv( Boss, tar, 850510, 0);	-- �I��S��				
				local count = 0;
				while count < 50 do
					Sleep(1);
					if ( CheckBuff(tar, 624056) == true ) then
						Sleep(1);
						CancelBuff( tar, 624056 );
						sysCastSpellLv( tar, tar, 850649, 0);	-- �����ۤv
						sysCastSpellLv( boss, tar, 850644, 0);	-- �ޯ�ˮ`�B�w���B�d�K��
						count = 50;
					end	
					if ( ReadRoleValue( tar, EM_RoleValue_IsDead ) == 1 ) or ( CheckID(tar) == false ) or
					 ( ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 ) or ( CheckID(Boss) == false ) then
						CancelBuff( tar, 624056 );
						count = 50;
					end						
				end			
				CancelBuff( tar, 624056 );		
				-- �P�_ --	
				TargetTable=Lua_107228_CatchTarget(Boss,"Random");
				if TargetTable[1]~=nil then
					x,y,z,dir=DW_Location(TargetTable[1]);
					Move(InvisibleTarget,x,y,z);
				end
			end
		else
			Lua_107228_QuitWhirl(Boss,InvisibleTarget);
			return
		end
	end
end
function Lua_107228_QuitWhirl(Boss,InvisibleTarget)--��������Ҧ�
	local WhirlBuff=623858;
	
	CancelBuff(Boss,622362);  --�i�H�}��
	CancelBuff(Boss,WhirlBuff);
	SetDefIdleMotion(Boss,ruFUSION_MIME_IDLE_STAND);
	SetModeEx(Boss,EM_SetModeType_ShowRoleHead,true);
	local ProcessCode=EM_RoleValue_Register2;
	WriteRoleValue(Boss,ProcessCode,0);
	DelObj(InvisibleTarget);
end
function Lua_107228_SlugShot_MRPlotName()--�d�U���ݶ� �k�N���X:850644  �򥻪k�N:623859
	local Player,Boss= TargetID(), OwnerID() ;
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(Player);
	local SlugOrgID--�]�K�H��
	local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID )
	if ZoneID == 151 then
		SlugOrgID=107528
	elseif ZoneID == 152 then
		SlugOrgID=107596
	elseif ZoneID == 153 then
		SlugOrgID=107611
	else
		SlugOrgID=107611
	end
	y = GetHeight(x,y,z);
	local Slug=CreateObj(SlugOrgID,x,y,z,dir,1);
	SetModeEx(Slug,EM_SetModeType_Obstruct,false);
	SetModeEx(Slug,EM_SetModeType_HideName,true);
	SetModeEx(Slug,EM_SetModeType_Strikback,false);
	SetModeEx(Slug,EM_SetModeType_Searchenemy,false);
	SetModeEx(Slug,EM_SetModeType_Show,false);
	SetModeEx(Slug,EM_SetModeType_Gravity,false);
	local StopRecover=502707;
	AddBuff(Slug,StopRecover,0,-1);
	local SpeedBuff=506984;
	AddBuff(Slug,SpeedBuff,10,-1);
	MoveToFlagEnabled(Slug,false);
	AddtoPartition(Slug,RoomID);
	SetPlot(Slug,"dead","Lua_107228_SlugDeadPlot",0);
	CallPlot(Slug,"Lua_107228_TokenRule",Boss);
	CallPlot( Slug, "Lua_107228_SlugClearPlot", Boss );--�����j��, ���ݶ��M���@��
	SetModeEx(Slug,EM_SetModeType_Show,true);
end
function Lua_107228_SlugClearPlot( Boss )--�����j��, ���ݶ��M���@��
	local Absorbed=OwnerID();
	local IsInvinsible=EM_RoleValue_Register3;

	while CheckID( Boss ) do
		if ( ReadRoleValue( Boss, IsInvinsible ) == 0 )then 				
			SetPlot( Absorbed, "dead", 0, 0 );
			Sleep(10);	-- ���@�U		
			SetModeEx(Absorbed,EM_SetModeType_Drag,false);
			local x,y,z,dir=DW_Location(Boss);
			local waitTime = MoveDirect(Absorbed,x,y+50,z)-5;
			if ( waitTime < 5 ) then waitTime = 5; end
			sleep(waitTime);
			DelObj(Absorbed);		
		end
		Sleep(20);
	end
end	
function Lua_107228_SlugDeadPlot()--���ݶ����`�@��
	local Slug,Player=OwnerID(),TargetID();
	SetModeEx(Slug,EM_SetModeType_Obstruct,false);
	SetModeEx(Slug,EM_SetModeType_Fight,false);
	SetModeEx(Slug,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(Slug,EM_SetModeType_Mark,false);
	SetModeEx(Slug,EM_SetModeType_Move,false);
	local ZoneID = ReadRoleValue ( Slug , EM_RoleValue_ZoneID )

	local x,y,z,dir=DW_Location(Slug);
	local SpellConter=CreateObj(107544,x,y,z,dir,1);
	SetModeEx(SpellConter,EM_SetModeType_Mark,false);
	SetModeEx(SpellConter,EM_SetModeType_Obstruct,false);	
	SetModeEx(SpellConter,EM_SetModeType_Fight,false);
	SetModeEx(SpellConter,EM_SetModeType_Searchenemy,false);
	SetModeEx(SpellConter,EM_SetModeType_HideName,true);
	SetModeEx(SpellConter,EM_SetModeType_ShowRoleHead,false);
	AddtoPartition(SpellConter,ReadRoleValue(Slug,EM_RoleValue_RoomID));
	local SlugExplode,Lv=850511,0;
	if ZoneID == 151 then
		Lv = 2
	elseif ZoneID == 152 then
		Lv = 3
	elseif ZoneID == 153 then
		Lv = 1
	else
		Lv = 3
	end
	CastSpellLv(SpellConter,SpellConter,SlugExplode,Lv);
	WriteRoleValue(SpellConter,EM_RoleValue_LiveTime,3);
	DelObj(Slug);
	return false
end
function Lua_107228_SlugExplodeCheckUseLua()--850511:�򥻪k�N623867�ˬd
	local Slug,Victim=OwnerID(),TargetID();
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local BossOrgID
	if ZoneID == 151 then
		BossOrgID = 107228
	elseif ZoneID == 152 then
		BossOrgID = 107593
	elseif ZoneID == 153 then
		BossOrgID = 107608
	else
		BossOrgID = 107608
	end
	if Slug==Victim then
		return false;
	end
	local IsInvinsible=EM_RoleValue_Register3;
	if(ReadRoleValue(Victim,EM_RoleValue_OrgID)==BossOrgID)and(ReadRoleValue(Victim,IsInvinsible)==1)then
		WriteRoleValue(Victim,IsInvinsible,0);
		Lua_SpecificMessage(Victim,2,"[SC_107228_WHIRLBREAK]",0);--�����o�r��
		return false;
	end
	return true;
end
function Lua_107228_SlugFall()--�{��3:���ݶ����U
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local TargetTable=Lua_107228_CatchTarget(Boss,"Pick3");
	local x,y,z,dir;
	if TargetTable[1]~=nil then
		local ShadowOrgID=107524;
		local ShadowTable={};
		for Pos=1,#TargetTable do
			x,y,z,dir=DW_Location(TargetTable[Pos]);
			local Shadow=CreateObj(ShadowOrgID,x,y,z,dir,1);
			SetModeEx(Shadow,EM_SetModeType_Obstruct,false);
			SetModeEx(Shadow,EM_SetModeType_Mark,false);
			SetModeEx(Shadow,EM_SetModeType_ShowRoleHead,false);
			SetModeEx(Shadow,EM_SetModeType_HideName, true);				
			AddtoPartition(Shadow,RoomID);
			WriteRoleValue(Shadow,EM_RoleValue_LiveTime,4);
			CallPlot(Shadow,"Lua_107228_TokenRule",Boss);
			table.insert(ShadowTable,Shadow);
		end
		local StealthOrgID;
		local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID )
		local SlugOrgID
		if ZoneID == 151 then
			 StealthOrgID=107525  --���� �I�k��
			 SlugOrgID=107526  --�]�K��
		elseif ZoneID == 152 then
			 StealthOrgID=107594
			 SlugOrgID=107595
		elseif ZoneID == 153 then
			 StealthOrgID=107609
			 SlugOrgID=107610
		else
			 StealthOrgID=107609
			 SlugOrgID=107610
		end
		local SlugStay=DW_Rand(#TargetTable);--�䤤�@�ӯd�U
		local BossWanted;--Boss�n�Y�����ݶ�
		local Stealth = {}; --Boss������ޯ��
		for Pos=1,#TargetTable do
			x,y,z,dir=DW_Location(ShadowTable[Pos]);
			Stealth[Pos]=CreateObj(StealthOrgID,x,y+110,z,dir,1);
			SetModeEx(Stealth[Pos],EM_SetModeType_Obstruct,false);
			SetModeEx(Stealth[Pos],EM_SetModeType_Mark,false);
			SetModeEx(Stealth[Pos],EM_SetModeType_Gravity,false);
			SetModeEx(Stealth[Pos],EM_SetModeType_ShowRoleHead,false);
			SetModeEx(Stealth[Pos],EM_SetModeType_Strikback,false);
			SetModeEx(Stealth[Pos],EM_SetModeType_Searchenemy,false);
			SetModeEx(Stealth[Pos],EM_SetModeType_Fight,false);
			AddtoPartition(Stealth[Pos],RoomID);
			CallPlot(Stealth[Pos],"Lua_107228_TokenRule",Boss);
			if Pos==SlugStay then
				local Slug=CreateObj(SlugOrgID,x,GetHeight(x,y,z),z,dir,1);					
				SetModeEx(Slug,EM_SetModeType_Fight,false);
				SetModeEx(Slug,EM_SetModeType_Obstruct,false);
				SetModeEx(Slug,EM_SetModeType_Gravity,false);
				SetModeEx(Slug,EM_SetModeType_HideName,true);
				SetModeEx(Slug,EM_SetModeType_Strikback,false);
				SetModeEx(Slug,EM_SetModeType_Searchenemy,false);
				SetModeEx(Slug,EM_SetModeType_Show,false);
				AddtoPartition(Slug,RoomID);
				CallPlot(Slug,"Lua_107228_TokenRule",Boss);
				SetPlot(Slug,"dead","Lua_107228_SlugDeadPlot",0);				
				local StopRecover=502707;
				AddBuff(Slug,StopRecover,0,-1);
				local SpeedBuff=506984;
				AddBuff(Slug,SpeedBuff,10,-1);
				BossWanted=Slug;
			end
		end			
		sleep(10);--1���(�I��ˮ`)			
		Lua_SpecificMessage(Boss,2,"[SC_107228_SLUGFALL]",0);--�����o�r��
		local SlugFall,Lv=850515,1;
		for i, stealthObj in ipairs(Stealth) do
			x,y,z,dir=DW_Location(stealthObj);
			CastSpellPos(stealthObj,x,y,z,SlugFall,Lv);
			WriteRoleValue(stealthObj,EM_RoleValue_LiveTime,4);	
		end
		SetModeEx(BossWanted,EM_SetModeType_Fight,true);		
		SetModeEx(BossWanted,EM_SetModeType_Show,true);
		sleep(30);--��3��(�����a��)
		
		local DelaySpell=850512
		Lua_SpecificMessage(Boss,2,"[SC_107228_PREPAREABSORB]",0);--�����o�r��
		CastSpell(Boss,Boss,DelaySpell);--�I�k3��(��5��)
		local IsCastSuccess=true;
		for Sec=1,3,1 do--��3��(��5��)
			if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=DelaySpell or (ReadRoleValue(BossWanted,EM_RoleValue_IsDead)==1 or CheckID(BossWanted)==false) then
				IsCastSuccess=false;
				break;
			end
			sleep(10);
		end
		if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=DelaySpell or (ReadRoleValue(BossWanted,EM_RoleValue_IsDead)==1 or CheckID(BossWanted)==false) then
			IsCastSuccess=false;
		end	
			
		if IsCastSuccess==true then
			MagicInterrupt(Boss);
			local SpeedBuff=506984;
			AddBuff(BossWanted,SpeedBuff,10,-1);
			SetModeEx(BossWanted,EM_SetModeType_Drag,false);
			SetModeEx(BossWanted,EM_SetModeType_Gravity,false);
			x,y,z,dir=DW_Location(Boss);
		
			sleep(MoveDirect(BossWanted,x,y+50,z));					
			
			while CheckID(BossWanted) do	-- �p�G���ħl���]�K���\�A�~�R���]�K�C�Y�԰������h���X�j��
				local refX, refZ = ReadRoleValue( BossWanted, EM_RoleValue_X ), ReadRoleValue( BossWanted, EM_RoleValue_Z );
				if  ( Math.abs(refX - x) < 1) and ( Math.abs(refZ - z) < 1) then
					DelObj(BossWanted);
					break;
				end	
				Sleep(1);
			end
		
			local PowerUpBuf,Sec=623861,11
			AddBuff(Boss,PowerUpBuf,0,Sec);--�����[���A���20%
			Lua_SpecificMessage(Boss,2,"[SC_107228_ABSORBSLUG]",0);--�����o�r��
		else
			DebugMsg(0,0,"CastFailed");
		end
	else
		DebugMsg(0,RoomID,"TargetTable={}")
	end
	
	local ProcessCode=EM_RoleValue_Register2;
	WriteRoleValue(Boss,ProcessCode,0);
end
function Lua_107228_RandSkill()--�{��4:����H��
	local Boss=OwnerID();
	local RandResult=DW_Rand(100);
	if RandResult>50 then
		local TargetTable=Lua_107228_CatchTarget(Boss,"Target");
		if TargetTable[1]==nil then
			DebugMsg(0,ReadRoleValue(Boss,EM_RoleValue_RoomID),"Lua_107228_RandSkill can't get Target, RandResult>50")
		else
			local PenetrateAttack=850513;
			CastSpell(Boss,TargetTable[1],PenetrateAttack)
		end
	else
		local MagicAttack=850514;
		CastSpell(Boss,Boss,MagicAttack);
	end
	local ProcessCode=EM_RoleValue_Register2;
	WriteRoleValue(Boss,ProcessCode,0);
end
function Lua_107228_ShootTargetScript()--�k�N���X850514©������@�����
	local Boss=OwnerID();
	local ZoneID=ReadRoleValue(Boss,EM_RoleValue_ZoneID);
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local TargetTable;
	if ZoneID==152 then--�u���x����3��
		TargetTable=Lua_107228_CatchTarget(Boss,"Pick3");
	else
		TargetTable=Lua_107228_CatchTarget(Boss,"Pick2");
	end
	for SN,Player in pairs(TargetTable) do
		if Player~=nil then
			PushMagicExplodeTarget(Player);
		end
	end
end
function Lua_107228_ReduceHP()--�Ҧ��ĤH�ͩR�W�����1%
	local Boss=OwnerID();
	local ReduceHPBuff=623860;
	for Pos=0,HateListCount(Boss)-1,1 do
		local Victim=HateListInfo(Boss,Pos,EM_HateListInfoType_GItemID);
		if CheckBuff(Victim,ReduceHPBuff)==true then
			local BuffLv=BuffInfo(Victim,Lua_BuffPosSearch(Victim,ReduceHPBuff),EM_BuffInfoType_Power);
			CancelBuff(Victim,ReduceHPBuff);
			AddBuff(Victim,ReduceHPBuff,BuffLv+1,-1);
		else
			AddBuff(Victim,ReduceHPBuff,0,-1);
		end
		ScriptMessage(Boss,Victim,2,"[SC_107228_LIFEOUTFLOW]",0);--�r��
	end
end
function Lua_107228_IsHpRateAccord()--��q�ʱ�,�O�_�����X�۱���H
	local Boss=OwnerID();
	local HpRate;
	HpRate=ReadRoleValue(Boss,EM_RoleValue_HP)/ReadRoleValue(Boss,EM_RoleValue_MaxHP);
	HpRate=HpRate-(HpRate%0.01)--��T�ܤp���I����
	HpRate=HpRate*100--��Ƥ�
	local HpLevel=EM_RoleValue_Register1;
	local Sill=ReadRoleValue(Boss,HpLevel);--���q���e
	if HpRate/Sill<=1 then
		WriteRoleValue(Boss,HpLevel,Sill-20);
		return true,Sill-20;
	end
	return false,Sill;
end
function Lua_107228_AreaClosed()--����
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local x,y,z,dir;
	local PosFlag=781254;
	local DoorOrgID=106237;
	for Pos=5,7,1 do
		x,y,z,dir=DW_Location(PosFlag,Pos);
		local Door=CreateObj(DoorOrgID,x,y,z,dir,1);
		SetModeEx(Door,EM_SetModeType_Obstruct,true);
		SetModeEx(Door,EM_SetModeType_Mark,false);
		SetModeEx(Door,EM_SetModeType_Fight,false);
		SetModeEx(Door,EM_SetModeType_Move,false);
		SetModeEx(Door,EM_SetModeType_Searchenemy,false);
		SetModeEx(Door,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(Door,EM_SetModeType_HideName,true);
		AddtoPartition(Door,RoomID);
		CallPlot(Door,"Lua_107228_TokenRule",Boss);
	end
end
function Lua_107228_PrepareLeaveFight()--���ݲ����԰�
	DebugMsg(0,0,"Lua_107228_PrepareLeaveFight");
	local Boss=OwnerID();
	if ReadRoleValue(Boss, EM_RoleValue_IsDead)==1 then return; end--�YBoss���`�A�h���ݭn�����԰�;  2013/06/20, modified by Ray Poleax
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local ProcessCode=EM_RoleValue_Register2;
	WriteRoleValue(Boss,ProcessCode,0);
	SetStopAttack(Boss);
	DelFromPartition(Boss);
	ReSetNPCInfo(Boss);
	SetDefIdleMotion(Boss,ruFUSION_MIME_IDLE_STAND);
	SetModeEx(Boss,EM_SetModeType_Mark,true);
	SetModeEx(Boss,EM_SetModeType_HideName,false);
	SetModeEx(Boss,EM_SetModeType_ShowRoleHead,true);
	AddtoPartition(Boss,RoomID);
end
function Lua_107228_TokenRule(Boss)--�l�ͪ��W�h�G���}�԰�����
	local Token=OwnerID();
	while true do
		if CheckID(Boss)==false or ReadRoleValue(Boss,EM_RoleValue_IsDead)==1 or HateListCount(Boss)==0 then
			DelObj(Token);
			return;
		end
		sleep(10);
	end
end
function Lua_107228_CatchTarget(Boss,HowCatch)--����ؼ�
	local TargetTable={};
	if HowCatch==nil then
		table.insert(TargetTable,Boss);
	elseif HowCatch=="Target" then
		table.insert(TargetTable,ReadRoleValue(Boss,EM_RoleValue_AttackTargetID));
	elseif HowCatch=="Random" then--������H��
		local Candidate={};
		for Pos=0,HateListCount(Boss)-1 do
			local ID=HateListInfo(Boss,Pos,EM_HateListInfoType_GItemID);
			if ReadRoleValue(ID,EM_RoleValue_IsPlayer)==1 then
				table.insert(Candidate,ID);
			end
		end
		if #Candidate >0 then
			table.insert(TargetTable,Candidate[DW_Rand(#Candidate)]);
		end
	elseif HowCatch=="Pick3" then--�H���D3��
		local Candidate={};--�Կ�H
		for Pos=0,HateListCount(Boss)-1 do
			local ID=HateListInfo(Boss,Pos,EM_HateListInfoType_GItemID);
			if ReadRoleValue(ID,EM_RoleValue_IsPlayer)==1 then
				table.insert(Candidate,ID);
			end
		end
		if #Candidate >0 then
			local PickTime=3;--�쥻���D3��
			if #Candidate<PickTime then
				PickTime=#Candidate;
			end
			for Num=1,PickTime do
				table.insert(TargetTable,table.remove(Candidate,DW_Rand(#Candidate)));
			end
		end
	elseif HowCatch=="Pick2" then--�H���D2��(�ګ��i�A�����Y��ƪ��A�ڴN����Copy�F)
		local Candidate={};--�Կ�H
		for Pos=0,HateListCount(Boss)-1 do
			local ID=HateListInfo(Boss,Pos,EM_HateListInfoType_GItemID);
			if ReadRoleValue(ID,EM_RoleValue_IsPlayer)==1 then
				table.insert(Candidate,ID);
			end
		end
		if #Candidate >0 then
			local PickTime=2;--�쥻���D2��
			if #Candidate<PickTime then
				PickTime=#Candidate;
			end
			for Num=1,PickTime do
				table.insert(TargetTable,table.remove(Candidate,DW_Rand(#Candidate)));
			end
		end
	end
	return TargetTable;
end
function Lua_107228_FlyToBoss(Boss)--����Boss(���O�Q�l�L�h....)
	sleep(50);--��3������ɶ�
	local Absorbed=OwnerID();
	SetModeEx(Absorbed,EM_SetModeType_Drag,false);
	local x,y,z,dir=DW_Location(Boss);
	sleep(MoveDirect(Absorbed,x,y+50,z)-5);
	local PowerUpBuf,Sec=623861,11
	AddBuff(Boss,PowerUpBuf,0,Sec);--�����[���A���20%
	DelObj(Absorbed);
end
function Lua_EffectFilter_IsPlayer()--�k�N�z��A���b�k�N�ˬd������
	if ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer)==1 then
		return true;
	end
	return false;
end
function Lua_SpecificMessage(Sender,MsgType,MsgString,ColorCode)--��������ǰe�T��
	
	for Pos=0,HateListCount(Sender)-1,1 do
		ScriptMessage(Sender,HateListInfo(Sender,Pos,EM_HateListInfoType_GItemID),MsgType,MsgString,ColorCode);
	end
end
function Lua_107228_BossDead()--���`
	local Boss=OwnerID();
	Lua_SpecificMessage(Boss,2,"[SC_107228_DEAD]",0);--��������ǰe�T��
	return true;
end
function Lua_107542_BossDead()--�p�Ǧ��`�@��
	Delobj(OwnerID())  --���`���W�R���ۤv
end

function Lua_Skill_623934_CheckIsPlayer()
	local tar = Role:new( TargetID() );
	return ( tar:IsPlayer() ); 
end