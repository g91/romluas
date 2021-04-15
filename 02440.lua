function Lua_Zone21_WorldBoss_Initial()
	Lua_DW_WBGUIDRecord(2);
end

function Lua_Zone21_WorldBoss2_Event()
	Lua_DW_WBGUIDRecord(2);
	Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
	local Oid = OwnerID();
	SetPlot( Oid , "dead" , "Lua_Zone21_WorldBoss2_DeadEvent" , 0 );
	BeginPlot( Oid , "Lua_Zone21_WorldBoss2_AI" ,0 );
end

function Lua_Zone21_WorldBoss2_AI()
	local Boss = OwnerID();
	local KeyTime1=12--(6��)�����\Ĳ�o���
	local KeyTime2=8--(4��)�����\���j���
	local KeyTime3
	local HardCore= (ReadRoleValue(Boss,EM_RoleValue_OrgID)==107192);
	local HitedCount,Dot,ParticularNum,DotSpell=623303;
	if HardCore==true then
		Dot=623302;--�x�������i�|99�h
		DotSpell=499641;
		KeyTime3=50;--(25��)
		PlayMotionEX(Boss, ruFUSION_ACTORSTATE_CAST_LOOP , ruFUSION_ACTORSTATE_CAST_LOOP);
		--AddBuff(Boss,HitedCount,0,-1);
		WriteRoleValue(Boss,EM_RoleValue_Register2,10);
		ParticularNum=10;--�]�w�A��t��l��
		LockHP(Boss,ReadRoleValue(Boss,EM_RoleValue_MaxHP)*0.9,"Lua_Zone21_WB2H_MoreSpeed");
	else
		Dot=620526;--²�檩
		DotSpell=499643;
		KeyTime3=80;--(40��)
	end
	local Timer= 1;

	local SeaTear=0;
	local HateList={};
	local AtkTargetCur=ReadRoleValue(Boss,EM_RoleValue_AttackTargetID);
	SysCastSpellLv( AtkTargetCur , Boss, 498368, 9 )--�i�л\���D�]
	local AtkTargetOld = AtkTargetCur;
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	math.randomseed(math.random(1, 99999));

	Sleep(10);
	repeat
		Lua_DW_WBLvCheck_Table(KS_GetHateList( Boss,1 ));
		AtkTargetCur = ReadRoleValue(Boss,EM_RoleValue_AttackTargetID);
		---------------------------------------------------------------------------
--		while true then
			if CheckID( AtkTargetCur ) == false or ReadRoleValue( AtkTargetCur , EM_RoleValue_IsDead) == 1 then
				Lua_Zone21_WorldBoss2_SkillZ3(Boss,AtkTargetCur);
			end
--			Sleep(10);
--		end
		---------------------------------------------------------------------------
		if AtkTargetCur~=AtkTargetOld then--�ثe��w���ؼЦ��`�����u�]�|Ĳ�o
			--DebugMsg(0,0,"TargetChange!!!!!!!!!!");
			SysCastSpellLv( AtkTargetCur , Boss, 498368, 9 )--�i�л\���D�]
			--�ഫ�ؼ�
			AtkTargetOld=AtkTargetCur;
			--�I��Z2
			HateList = KS_GetHateList( Boss,1 );
			for i,Player in pairs(HateList) do
				ScriptMessage( Boss , Player , 2 , "[SC_105894_1]" , C_SYSTEM );
				ScriptMessage( Boss , Player , 0 , "[SC_105894_1]" , C_SYSTEM );
				if KS_CheckBuffLV( Player,Dot )<15 then	--�������ˤ���15�h
					if ReadRoleValue( Player , EM_RoleValue_IsDead )==0 and CheckID(Player)==true and 
					ReadRoleValue(Player,EM_RoleValue_IsAttackMode)==1 then
						AddBuff(Player,Dot,4,-1);
						--SysCastSpellLv(Boss,Player,DotSpell,0);
					end
				else
					if ReadRoleValue( Player , EM_RoleValue_IsDead )==0 and CheckID(Player)==true and 
					ReadRoleValue(Player,EM_RoleValue_IsAttackMode)==1 then
						AddBuff(Player,Dot,0,-1);
						--SysCastSpellLv(Boss,Player,DotSpell,0);
						AddBuff( Player  , 620964 , 0 ,-1 );--�ˮ`�O���C
					end
				end
			end
		end
		if Timer ==KeyTime1 then
			HateList = KS_GetHateList( Boss,1 );
			for i in pairs(HateList) do
				ScriptMessage( Boss , HateList[i] , 2 , "[SC_105894_4]" , C_SYSTEM );
				ScriptMessage( Boss , HateList[i] , 0 , "[SC_105894_4]" , C_SYSTEM );
			end
		end
		if Timer%KeyTime2==0 and Timer>KeyTime1 then--���\
			ParticularNum=ReadRoleValue(Boss,EM_RoleValue_Register2)--��s��t(�קK�W�cŪ��)
			for i =1,2 do
				SeaTear = kg_GetPosRX( Boss , 105911 , math.random(20,200),0,math.random(360) );
				WriteRoleValue( SeaTear , EM_RoleValue_Register1,Boss );
				MoveToFlagEnabled( SeaTear, false )
				SetModeEx( SeaTear , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( SeaTear , EM_SetModeType_Mark, true)	----�i�I��(�_)
				SetModeEx( SeaTear , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
				SetModeEx( SeaTear , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( SeaTear , EM_SetModeType_Fight, false) ---�i���(�_)
				SetModeEx( SeaTear , EM_SetModeType_Searchenemy, false)	---����(�_)
				AddToPartition( SeaTear , RoomID );
				SetCursorType( SeaTear , eCursor_Interact ); --����ܦ� ����
				BeginPlot( SeaTear , "Lua_Zone21_WorldBoss2_SeaTear" ,0 );
			end
		end
		if Timer%KeyTime3==0  then
			kg_WaitSpell(Boss);--����L�k�N��
			--DebugMsg(0,0,"Zone21_WorldBoss2 CastZ3!!");
			CastSpellLv( Boss , AtkTargetCur,496983,0 );--�߫�L�`
			kg_WaitSpell(Boss);
			Lua_Zone21_WorldBoss2_SkillZ3(Boss,AtkTargetCur);--�ؼФ��s�b���ܤ]�|�j����ؼ�
		elseif HardCore==false and ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)==0 then
			CastSpellLv( Boss , AtkTargetCur,496935,0 );--�����Q��
		elseif HardCore==true  and Timer%ParticularNum==0 then
			SysCastSpellLv(Boss,AtkTargetCur,499634,0);--�����Q��
		end
		Sleep(5);
		Timer=Timer+1; --DebugMsg( 0,0,"Zone21_WorldBoss2 Timer = "..Timer );
	until KS_InCombat(Boss)==false
	local npc=ReadRoleValue(Boss,EM_RoleValue_Register9);
	WriteRoleValue(npc,EM_RoleValue_Register9,0);
	DisableQuest(npc,false);
	DelObj(Boss);
end

function Lua_Zone21_WorldBoss2_SkillZ1()
	local Player = TargetID();
	if KS_CheckBuffLV( Player,620526 )>=15 then
		AddBuff( Player , 620964 , 0,-1 );--�����O���C
	end
	AddBuff(Player,620526,0,-1);
	--SysCastSpellLv(OwnerID(),Player,499643,0);--��������
end

function Lua_Zone21_WB2H_SkillZ1()--�x���������e
	local Player = TargetID();
	if KS_CheckBuffLV( Player,623302 )>=15 then
		AddBuff( Player , 620964 , 0,-1 );--�����O���C
	end
	AddBuff(Player,623302,0,-1);
	--SysCastSpellLv(OwnerID(),Player ,499641,0);--��������
end
function Lua_Zone21_WB2H_MoreSpeed()--������V�֡ADot�W�V��
	local Boss = OwnerID();
	local Dot=623302
	local DotSpell=499643;
	local TotalBuff=90--�@�@�n�|�W�h��buff�q
	local Rate=ReadRoleValue(Boss,EM_RoleValue_HP)/ReadRoleValue(Boss,EM_RoleValue_MaxHP)
	local ParticularNum;
	if (Rate*10)%1==0 then
		ParticularNum=math.floor(Rate*10);
	else
		ParticularNum=math.floor(Rate*10)+1;
	end
	WriteRoleValue(Boss,EM_RoleValue_Register2,ParticularNum);
	local HateList={};
	for i=0,HateListCount(Boss)-1 do
		local Temp=HateListInfo(Boss,i , EM_HateListInfoType_GItemID);
		if ReadRoleValue(Temp,EM_RoleValue_IsPlayer)==1 then
			table.insert(HateList,Temp);
		end
	end
	local TotalPlayer=#HateList;
	local BuffAmount=0;
	if TotalBuff%TotalPlayer==0 then
		BuffAmount=TotalBuff/TotalPlayer;
	else
		BuffAmount=math.floor(TotalBuff/TotalPlayer)+1
	end
	for SN,GUID in pairs(HateList) do
		AddBuff(GUID,Dot,BuffAmount-1,-1);
		--SysCastSpellLv(Boss,GUID,DotSpell,0);
	end
	LockHP(Boss,ReadRoleValue(Boss,EM_RoleValue_MaxHP)*(Rate-0.1),"Lua_Zone21_WB2H_MoreSpeed");
end
function Lua_Zone21_WB2H_HitedCount()--�W�[�Q���p�ơA�n���a�������u��buff
	local Boss = OwnerID();
	local HitedSpell=499636;--�W�Q�����ƪ��k�N���X
	local HitedBuff=623306;--�O���Q��������
	local Dot=623302;
	local TotalBuff=90--�@�@�n�|�W�h��buff�q
	local HitedNum=KS_CheckBuffLV( Boss,HitedBuff )
	if HitedNum>=39 then
		local HateList={};
		for i=0,HateListCount(Boss)-1 do
			local Temp=HateListInfo(Boss,i , EM_HateListInfoType_GItemID);
			if ReadRoleValue(Temp,EM_RoleValue_IsPlayer)==1 then
				table.insert(HateList,Temp);
			end
		end
		local TotalPlayer=#HateList;
		local BuffAmount=0;
		if TotalBuff%TotalPlayer==0 then
			BuffAmount=TotalBuff/TotalPlayer;
		else
			BuffAmount=math.floor(TotalBuff/TotalPlayer)+1
		end
		for SN,GUID in pairs(HateList) do
			AddBuff(GUID,Dot,BuffAmount-1,-1);
		end
		CancelBuff(Boss,HitedBuff);--�k�s
		HitedNum=0;
	end
	AddBuff(Boss,HitedBuff,0,-1);
	--SysCastSpellLv(Boss,Boss,HitedSpell,1);
end

function Lua_Zone21_WorldBoss2_SkillZ3( Boss,AtkTargetCur )
	--DebugMsg(0,0,"SkillZ3 Start!!");
	Boss=Boss or OwnerID();
	math.randomseed(math.random(1, 99999));
	local HateList = KS_GetHateList(Boss,1);
	for i in pairs(HateList) do
		ScriptMessage( Boss , HateList[i] , 2 , "[SC_105894_2]" , C_SYSTEM );
		ScriptMessage( Boss , HateList[i] , 0 , "[SC_105894_2]" , C_SYSTEM );
	end
	AtkTargetCur = AtkTargetCur or ReadRoleValue(Boss, EM_RoleValue_AttackTargetID); DebugMsg(0,0,"Zone21_WorldBoss2_SkillZ3_CurrectTarget="..GetName(AtkTargetCur).." ,Gid="..AtkTargetCur );
	for i=1,#HateList do--�ư���e�ؼ�
		if HateList[i]== AtkTargetCur then
			table.remove( HateList , i );
			break
		end
	end
	if table.getn(HateList)>0 then
		local NewTarget = HateList[math.random(#HateList)]; DebugMsg(0,0,"Zone21_WorldBoss2_SkillZ3_NewTarget="..GetName(NewTarget).." ,Gid="..NewTarget );
		SysCastSpellLv( NewTarget , Boss, 498368, 9 )--�i�л\���D�]
	end
end

function Lua_Zone21_WorldBoss2_DeadEvent()
	local Oid =OwnerID();
	if ReadRoleValue(Oid , EM_RoleValue_OrgID)==105894 or ReadRoleValue(Oid , EM_RoleValue_OrgID)==107192 then
		Lua_Zone21_WorldBoss2_isDead = 1;
		Lua_Zone21_WorldBoss2_DeadTimer = kg_GetPosRX( Oid , 117201 );
		BeginPlot( Lua_Zone21_WorldBoss2_DeadTimer, "Lua_Zone21_WorldBoss2_DeadEvent" ,0  );
--������O���@�ɤ��A�����ͪ��ɶ��A�٦����ͪ���H
		DeBugMSG(0,0,"Next will be "..Lua_Z21_WorldBoss_ResetTime(OwnerID()))
		return true
	elseif ReadRoleValue(Oid , EM_RoleValue_OrgID)==117201 then	--�˼ƭp�ɤ�����
		DebugMsg(0,0,"Zone21_WorldBoss2_DeadRecount Start");
		Sleep( 288000 );
		Lua_Zone21_WorldBoss2_DeadTimer=nil;
		Lua_Zone21_WorldBoss2_isDead=0;
		DebugMsg(0,0,"Zone21_WorldBoss2_DeadRecount End");
		Sleep(5); DelObj(Oid);
	elseif ReadRoleValue(Oid , EM_RoleValue_IsPlayer)==1 then
		if Lua_Zone21_WorldBoss2_DeadTimer~=nil then
			DelObj( Lua_Zone21_WorldBoss2_DeadTimer );
		end
		Lua_Zone21_WorldBoss2_isDead=0;
	end
end

function Lua_Zone21_WorldBoss2_SeaTear()
	local SeaTear=OwnerID();
	SetPlot( SeaTear,"touch","Lua_Zone21_WB2_SeaTearTch",30 );
	Sleep(60);
	--�����^��
	local Boss = ReadRoleValue(SeaTear,EM_RoleValue_Register1);
	SysCastSpellLv( SeaTear ,Boss  ,  497381 , 0 );
	local HateList = KS_GetHateList(Boss);
	for i in pairs(HateList) do
		ScriptMessage( SeaTear , HateList[i] , 2 , "[SC_105894_3]" , C_SYSTEM );
		ScriptMessage( SeaTear , HateList[i] , 0 , "[SC_105894_3]" , C_SYSTEM );
	end
	DelObj(SeaTear);
end

function Lua_Zone21_WB2_SeaTearTch()
	local Player= OwnerID();
	local SeaTear=TargetID();
	SysCastSpellLv( Player , ReadRoleValue(SeaTear,EM_RoleValue_Register1) , 497448,0 )--�j���1
	AddBuff( Player, 509379, 0, -1)--�Ѱ����M
	if CheckBuff( Player,620526 )==true then
		CancelBuff( Player,620526 );
		CancelBuff( Player,620964 );
	end
	if CheckBuff(Player,623302)==true then
		CancelBuff( Player,623302 );
		CancelBuff( Player,620964 );
	end
	DelObj( SeaTear );
end