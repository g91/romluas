function MING_CooDown(ThisObj,dtime)

	local count=table.getn(ThisObj.Skill)
--DeBugMSG(0,0,"Now I'm MING_CooDown")
	for i=1,count ,1 do
		local tab=ThisObj.Skill[i]
		if (tab.ok==false) then
			tab.count=tab.count-dtime;
			if (tab.count<=0) then
				tab.count=tab.cd;
				tab.ok=true;
			end
		end	
	end
	--DeBugMSG(0,0,"Now I'm MING_CooDown")
end

--�a�� ����a�n
------------------------------------------------------------------
CZ18_WorldBoss_IdleState={};
------------------------------------------------------------------
function CZ18_WorldBoss_IdleState.enter(ThisObj)

	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_IdleState")
	--�����Ҧ��԰�����
	--�����a�����ʧ@
	--���ܫ��A�G�^���m�ʧ@
	--SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_01)
	
	
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
	--PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_IDLE_END)
	
	--�]200�d��@��Ĳ�o A1
	SetPlot( ThisObj.MonID,"Range","Lua_Z18_WorldBoss_Fight",200 )
	SetPlot(ThisObj.MonID,"dead","LuaS_103580_6",0)
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, false )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_HideName, false )--�W��

end
------------------------------------------------------------------

function CZ18_WorldBoss_IdleState.update(ThisObj)
end
------------------------------------------------------------------
function CZ18_WorldBoss_IdleState.leave(ThisObj)
	
	--�����d��@�� �קK����Ĳ�o
	SetPlot( ThisObj.MonID,"Range", "" , 0 )
	--�����X�ʧ@.
	Zone_WorldBoss.SayToRangePlayer(ThisObj,400, 2, "[SC_103129_0]", 0);
	--ScriptMessage( ThisObj.MonID, 0, 2, "[SC_103129_0]", 0 )
	PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_SPAWN_BEGIN )
	Sleep(25)
	SetDefIdleMotion(thisobj.monid,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_SPAWN_END )
	
	Sleep(25)
	--SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_SPAWN)
	Sleep(5);
	--SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
	
	--PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_NORMAL)
	--�}�Ҿ԰�
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_IdleState-leave")
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_HideName, true )--�W��
end



--�԰�A1
------------------------------------------------------------------
CZ18_WorldBoss_Battle_A1={};
------------------------------------------------------------------
function CZ18_WorldBoss_Battle_A1.enter(ThisObj)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Battle_A1-enter")
	--�����԰��ʧ@	
	--���������i�J���ؼ�	
	
	
	
	--DeBugMSG(0,0,"Now I'm SetAttack "..ThisObj.Attack_Target)
	Zone_WorldBoss.SelectTarget(ThisObj)
	if (ThisObj.Attack_Target~=nil) then
	
		SetAttack( ThisObj.MonID,ThisObj.Attack_Target)
	end
	ThisObj.count=ThisObj.defcount;

end
------------------------------------------------------------------
--A1 ���� 9��� ��j��
------------------------------------------------------------------
function CZ18_WorldBoss_Battle_A1.update(ThisObj)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Battle_A1-update")
	if	Zone_WorldBoss.IsExitFight(ThisObj)	then
		--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Battle_A1-update IDLE")
		return "Battle_End";
	end	
	
	if (DW_CheckDis( ThisObj.MonID,780027,1,480)==false) then
		return "Battle_End";
	end
	
	--DeBugMSG(0,0,"ThisObj.count="..ThisObj.count)
	ThisObj.count=ThisObj.count+1;
	if (ThisObj.count>=18) then --��8�� ������{--	Battle_A2
		--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Battle_A1-update Battle_A2")
		return "Battle_A2";	
	end
end


--�԰�A2
------------------------------------------------------------------
CZ18_WorldBoss_Battle_A2={};
------------------------------------------------------------------
function CZ18_WorldBoss_Battle_A2.enter(ThisObj)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Battle_A2-enter")
end
------------------------------------------------------------------
function CZ18_WorldBoss_Battle_A2.update(ThisObj)

	if	Zone_WorldBoss.IsExitFight(ThisObj)	then
		return "Battle_End";
	end	
	
	if (ThisObj.Skill[1].ok==true) then
		local HPPercent =CZ18_WorldBoss.CalHPPar(ThisObj)
		--��q�C85%����
		--�쥻�I��i�j�M��{�j�����|
		--��30%�Ѧ��k�N���N
		--DeBugMSG(0,0,"HPPercent="..HPPercent)
		 if (HPPercent<85) then
		--if (HPPercent) then
		
			local rand=DW_Rand(100);
			--DeBugMSG(0,0,"rand="..rand)
			-- if (rand<30) then
			if (rand<70) then
				return "Casting_Blood_Fake";	--���ʧ@�j�M��{		
			end
		end
		return "Casting_Blood";--�j�M��{		
	end
end



--�԰�A3
------------------------------------------------------------------
CZ18_WorldBoss_Battle_A3={};

------------------------------------------------------------------
function CZ18_WorldBoss_Battle_A3.enter(ThisObj)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Battle_A3-enter")
Sleep(50);
end
------------------------------------------------------------------

function CZ18_WorldBoss_Battle_A3.update(ThisObj)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Battle_A3-update")
	if Zone_WorldBoss.IsExitFight(ThisObj)	then
		return "Battle_End";
	end	
	
	if (ThisObj.Skill[2].ok==true) then
		local HPPercent =CZ18_WorldBoss.CalHPPar(ThisObj)
		
		--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Battle_A3-HPPercent"..HPPercent)
		if (HPPercent<75) then--��q�C75%����쥻�I��i�s��j�����|
		--	if (HPPercent) then--��q�C75%����쥻�I��i�s��j�����|
			if (DW_Rand(100)<70) then--��30%�Ѧ��k�N���N
				return "Casting_Fear_Fake";--���ʧ@�s��
			end
		end
		return "Casting_Fear";--�s��				
	end
end


--��{
------------------------------------------------------------------
CZ18_WorldBoss_Casting_Blood={};
------------------------------------------------------------------

function CZ18_WorldBoss_Casting_Blood.update(ThisObj)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Casting_Blood.-update")
	local target=ThisObj.Attack_Target;
	Zone_WorldBoss.SearchRangeAlive(ThisObj,120)
	--�I�k�G�j�M��{
	if (ThisObj.Attack_Target~=0) then
		--DeBugMSG(0,0,"�j�M��{1")
		--PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN)  
		--
		--PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_BUFF_SP01)  
		
		
		SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
		--CastSpell(  ID,Target , 496474 )dddd
		
		
		--PlayMotion( ID , ruFUSION_ACTORSTATE_BUFF_SP01)  
		local ret=CastSpell(  ThisObj.MonID,ThisObj.Attack_Target , 496468 )
		if (ret==true) then
			Sleep(10)
		
			Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_103129_6]",0)
		end
		--DeBugMSG(0,0,"����ret="..type(ret))
		Sleep(20)
		
	
	
		
		ThisObj.Skill[1].ok=false;
		--Sleep(20)
	end
	ThisObj.Attack_Target=target;
	
	return "Battle_A3";

end
------------------------------------------------------------------
function CZ18_WorldBoss_Casting_Blood.enter(ThisObj)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Casting_Blood.-enter")
	
	SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--���n����
	AddBuff(ThisObj.MonID,507899,0,-1);
	--DeBugMSG(0,0,"�j�M��{")
	Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_103129_1]",0)
	--PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN)  
	--Sleep(10)
	PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CHANNEL_BEGIN)  
	Sleep(DW_Rand(5)+5)
		
	
	
	
	
	--ThisObj.AttackDelay=ReadRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay )
	
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay , 1000 )			------���𴶧�40��
	
	--PlayMotionEX(ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_BEGIN )--�j�M��{
	--CastSpell( ThisObj.MonID,  ThisObj.MonID, 496467  ) --�j�M��{
	--Sleep(20)
	--[[
	--�j�M�d�򤺪��a
	if	�d�򤺪��a��BUFF�G�y��	then
		��Ӫ��a�I�k�G�٥d����
	end
	]]--

end

function CZ18_WorldBoss_Casting_Blood.leave(ThisObj)
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
	CancelBuff( ThisObj.MonID , 507899 )
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay , ThisObj.AttackDelay)
end

--������{
------------------------------------------------------------------
CZ18_WorldBoss_Casting_Blood_Fake={};
------------------------------------------------------------------

function CZ18_WorldBoss_Casting_Blood_Fake.update(ThisObj)	
	--DeBugMSG(0,0,"Now Blood_Fake.-update")
	--�I�k�G�����j�M��{
	
	
	
	
	--DeBugMSG(0,0,"�����j�M��{")
	Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_103129_1]",0)
	--PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN)  
	--Sleep(5)
	PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CHANNEL_BEGIN)  
	Sleep(DW_Rand(5)+5)
	
	local targetTable=HateListRandom(ThisObj.MonID);
	
	local target=ThisObj.Attack_Target;
	if (table.getn(targetTable)>0) then
		target=targetTable[1]
		--DeBugMSG(0,0,"HateListRandom ="..target)
	end
	SetAttack(ThisObj.MonID,target);
	-- �H������250
	local Obj=DW_CreateObjEX("obj",112118,target,0)
	Lua_ObjDontTouch( Obj )
	DW_UnFight(Obj)
	AddToPartition(Obj,0)
	ThisObj.TargetObj=Obj
	
	
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
	Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_103129_2]",0)
	
	CastSpell(ThisObj.MonID ,ThisObj.TargetObj,496470)	--�ļ�
	--DeBugMSG(0,0,"�ľW")
	Sleep(20);
	
	ThisObj.Skill[1].ok=false;
	
	
	return "Casting_Blood";

end
------------------------------------------------------------------
function CZ18_WorldBoss_Casting_Blood_Fake.enter(ThisObj)

	
	--DeBugMSG(0,0,"Now Blood_Fake.-enter")
	--CZ18_WorldBoss.SearchPlayer(ThisObj,false)
	--CZ18_WorldBoss.SelectTarget(ThisObj)
	
	--ThisObj.AttackDelay=ReadRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay )
	SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--���n����
	AddBuff(ThisObj.MonID,507899,0,-1);
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay , 1000 )			------���𴶧�100��
	Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_103129_1]",0)

end

function CZ18_WorldBoss_Casting_Blood_Fake.leave(ThisObj)
	
	CancelBuff( ThisObj.MonID , 507899 )
	DelObj(ThisObj.TargetObj)
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay ,10)
end

--�s��
------------------------------------------------------------------
CZ18_WorldBoss_Casting_Fear={};
------------------------------------------------------------------

function CZ18_WorldBoss_Casting_Fear.update(ThisObj)

	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Casting_Fear.-update")
	--�I���s��
	
	if (ThisObj.Attack_Target~=0) then
	
	
		local Target = ReadRoleValue( ThisObj.MonID,EM_RoleValue_AttackTargetID)
		PlayMotionEX(ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
		Sleep(10)
		--DeBugMSG(0,0,"�I���s��")
		PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_BUFF_INSTANT)  
		CastSpell( ThisObj.MonID, ThisObj.MonID, 496472  ) --�I���s��
		
		Sleep(20)
		Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_103129_3]",0)
		ThisObj.Attack_Target=Target
		WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackTargetID,Target  )
		ThisObj.Skill[2].ok=false;
		
		ThisObj.defcount=4;
	end
	
	return "Battle_A1";


end

------------------------------------------------------------------
function CZ18_WorldBoss_Casting_Fear.enter(ThisObj)
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay , 1000 )
	AddBuff(ThisObj.MonID,507899,0,-1);
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, false)  
	
	Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_103129_1]",0)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Casting_Fear.-enter")
end

function CZ18_WorldBoss_Casting_Fear.leave(ThisObj)
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
	CancelBuff( ThisObj.MonID , 507899 )
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay ,10)
end

--�����s��
------------------------------------------------------------------
CZ18_WorldBoss_Casting_Fear_Fake={};
------------------------------------------------------------------
--[[
function CZ18_WorldBoss_LineMoveAE(MonID,Skill,Target)
	
	WriteRoleValue( MonID ,EM_RoleValue_IsWalk , 0  ) --�]�w���]�B
	
	
	AdjustFaceDir( MonID, Target, 0 ) 
	AddBuff(MonID,Skill,0,-1);
	sleep(10)
	local Me = Role:new(  Target  )
	local Dis=1000

	local X,Y,Z=Me:X(),Me:Y(),Me:Z();
	DW_MoveRand(MonID,1000,nil,X,Y,Z)
	
	CancelBuff( MonID , Skill )
	SetModeEx( MonID   , EM_SetModeType_Strikback, true )
	WriteRoleValue(MonID ,EM_RoleValue_IsWalk , 1  ) --�]�w������
end
]]--
function CZ18_WorldBoss_Casting_Fear_Fake.update(ThisObj)
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Casting_Fear_Fake.-update")
	
	 -- ����
	 if (ThisObj.SubTarget==0) then
		return "Battle_A1";	
	 end
	 
	 
	 --Zone_WorldBoss.SearchRangeAlive(ThisObj,100)
	 
	 local PlayerList = SearchRangePlayer (  ThisObj.SubTarget, 100 )
	  local count=table.getn(PlayerList);
	 local alive={}
	for i=0 ,  count-1, 1 do
		local palyer=PlayerList[i];
		local dead=ReadRoleValue( palyer , EM_RoleValue_IsDead);
		if (dead<1) then
			table.insert(alive,palyer);		
		end
	end
	
	  count=table.getn(alive);
	 if (count<1) then
		count=1;
	 end
	 
	
	
	--PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_BUFF_INSTANT)  
	Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_103129_5]",0)
--	local Target = ReadRoleValue(ThisObj.MonID,EM_RoleValue_AttackTargetID)
	CastSpellLV( ThisObj.MonID, ThisObj.SubTarget, 496474,(480/count)-1  )-- ����
	--DeBugMSG(0,0,"���� lv="..((480/count)-1).."count="..count)
	
	
	--Sleep(20)
	--ThisObj.Attack_Target=Target
	SetAttack(ThisObj.MonID,ThisObj.Attack_Target);
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackTargetID,Target  )
	ThisObj.Skill[2].ok=false;
	ThisObj.defcount=0;
	return "Battle_A1";	
end
------------------------------------------------------------------
function CZ18_WorldBoss_Casting_Fear_Fake.enter(ThisObj)

	
--	DeBugMSG(0,0,"�����s��")
	AddBuff(ThisObj.MonID,507899,0,-1);
	
	
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay , 1000 )
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, false)  
	--DeBugMSG(0,0,"Now I'm CZ18_WorldBoss_Casting_Fear_Fake.-enter")	
	--�I�k�G�j�M�ؼ�
	--�j�M�d�򤺪��a
	--�R�O�̪񪺪��a��ۤv�I�k�G��w
	--�I�k�G�����s��
	--PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN)  
	--Sleep(15)
	PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CHANNEL_BEGIN)  
	Sleep(10)
	--CZ18_WorldBoss.SearchPlayer(ThisObj,false);
	--local target=ThisObj.Attack_Target;
	--Zone_WorldBoss.SearchRangeAlive(ThisObj,1000)
	local targetTable=HateListRandom(ThisObj.MonID);
	
	ThisObj.SubTarget=0;
	if (table.getn(targetTable)>0) then
	
		ThisObj.SubTarget=targetTable[1];
		SetAttack(ThisObj.MonID,ThisObj.SubTarget);
		Yell(ThisObj.SubTarget,"[SC_103129_7]",5);
		AddBuff(ThisObj.SubTarget,508033,0,4);
		ScriptMessage( ThisObj.MonID, ThisObj.SubTarget, 2, "[SC_103129_4]", 0 )
		SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
		Sleep(40)
	end
	--ThisObj.Attack_Target=target;
end

function CZ18_WorldBoss_Casting_Fear_Fake.leave(ThisObj)
	--WriteRoleValue( ThisObj.MonID ,EM_RoleValue_IsWalk , 1  ) --�]�w���]�B
	
	CancelBuff( ThisObj.MonID , 507899 )
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackDelay , 10)
end

------------------------------------------------------------------
CZ18_WorldBoss_Battle_End={}
------------------------------------------------------------------
--[[
function CZ18_WorldBoss_Battle_End.update(ThisObj)
	--DeBugMSG(0,0,"Now I'CZ18_WorldBoss_Battle_End-update")
end
]]--
------------------------------------------------------------------
function CZ18_WorldBoss_Battle_End.enter(ThisObj)

	--ThisObj.bUpdate=false;
	
	DelFromPartition( ThisObj.MonID )	
	Sleep(30);
	ReSetNPCInfo( ThisObj.MonID ) 	-- ���]NPC���	
	Sleep(30);
	AddToPartition( ThisObj.MonID, 0 ) 	-- ���s�[�J���ΰ�
	
	--BeginPlot(ThisObj.MonID,"Lua_Z18_WorldBoss_Ctrl",0)
	--DeBugMSG(0,0,"Now I'CZ18_WorldBoss_Battle_End-enter")
	
end
------------------------------------------------------------------
CZ18_WorldBoss_Battle_Dead={}
------------------------------------------------------------------
--[[
function CZ18_WorldBoss_Battle_Dead.update(ThisObj)
end
]]--
------------------------------------------------------------------
function CZ18_WorldBoss_Battle_Dead.enter(ThisObj)
	ThisObj.bUpdate=false;
end
------------------------------------------------------------------
--[[
function CZ18_WorldBoss_Battle_Dead.leave(ThisObj)

end
]]--
------------------------------------------------------------------
CZ18_WorldBoss={};

----------------------------------------------------------------
--�üƽd��100���a
----------------------------------------------------------------

--------------------------------------------------------------------
--SearchPlayer
---------------------------------------------------------------------
function CZ18_WorldBoss.SearchPlayer(ThisObj,far)
	local bFar=false;
	if (far==true) then
		bFar=far
	end
	local PlayerList = SearchRangePlayer ( ThisObj.MonID , 1000 )
	local ps=table.getn(PlayerList);
	
	if (ps==0 ) then
		return
	end
	
	local AttackTarget=ThisObj.Attack_Target;
	
	if (AttackTarget==0) then
		AttackTarget=PlayerList[0]
	end
	local maxdist=10000;
	if (bFar==true) then
		maxdist=-10000;--GetDistance( ThisObj.MonID, AttackTarget);
	end
	for i=0 ,  ps-1, 1 do
	
		local playerID= PlayerList[i]
		
		local Count = BuffCount (playerID)
		local blood=false;
		for j = 0 , Count do
			local BuffID = BuffInfo( playerID , j , EM_BuffInfoType_BuffID )
			
			if (BuffID == 508029) then
				--DeBugMSG(0,0,"Now ISearchBlood playerID="..playerID)
				blood=true;
				break;
			end
		end
		
		if (blood==false) then 
			local dist=GetDistance( ThisObj.MonID,playerID);
			if (bFar==true) then
				if (dist> maxdist) then
				maxdist=dist
				AttackTarget = playerID
				--DeBugMSG(0,0,"Now I'm SelectTarget "..AttackTarget)
				end 
			else
				if (dist< maxdist) then
				maxdist=dist
				AttackTarget = playerID
				--DeBugMSG(0,0,"Now I'm SelectTarget "..AttackTarget)
				end 
			end
				
		end
	end
	ThisObj.Attack_Target=AttackTarget;
	--WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackTargetID,AttackTarget  )
	
end



---------------------------------------------------------------
--- IsCoolDownOK
--------------------------------------------------------------


----------------------------------------------------------------
--�p���q
-----------------------------------------------------------------
function CZ18_WorldBoss.CalHPPar(ThisObj)
	local MaxHP = ReadRoleValue( ThisObj.MonID , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue(  ThisObj.MonID , EM_RoleValue_HP )     --Ū���ثe��q
	local HPPercent =( NowHP / MaxHP	)*100  
	return HPPercent;
end

---------------------------
function CZ18_WorldBoss.Create()


	local State={}

	State["IDLE"]=CZ18_WorldBoss_IdleState;--�a�� ����a�n
	State["Battle_A1"]=CZ18_WorldBoss_Battle_A1;--�԰�A1
	State["Battle_A2"]=CZ18_WorldBoss_Battle_A2;--�԰�A2
	State["Battle_A3"]=CZ18_WorldBoss_Battle_A3;--�԰�A3

	State["Battle_End"]=CZ18_WorldBoss_Battle_End;--�԰�End
	State["Casting_Blood"]=CZ18_WorldBoss_Casting_Blood;--��{	
	State["Casting_Blood_Fake"]=CZ18_WorldBoss_Casting_Blood_Fake;--������{
	State["Casting_Fear"]=CZ18_WorldBoss_Casting_Fear;--�s��
	State["Casting_Fear_Fake"]=CZ18_WorldBoss_Casting_Fear_Fake;--�����s��
	State["Dead"]=CZ18_WorldBoss_Dead;--���`

	

	local ID=OwnerID();

	local ThisObj=FSM_Initial(ID,State);
	ThisObj.Skill={{ok=false,cd=60,count=60},{ok=false,cd=60,count=60}}
	ThisObj.defcount=0;
	return ThisObj;
end
----------200�d��@��Ĳ�o----------------------------------------------------------------------------
function Lua_Z18_WorldBoss_Fight()

	local ID=TargetID();
	local palyer=OwnerID();
	--
	local dead=ReadRoleValue( palyer , EM_RoleValue_IsDead);
	if (dead==1) then
		return 
	end
	
	local ISGM = ReadRoleValue( palyer, EM_RoleValue_VOC)
	if (ISGM==0) then
		return 
	end
	
	local ThisObj =Zone_WorldBoss[ID];
	if (ThisObj~=nil) then
	--DeBugMSG(0,0,"Now I'm Lua_Z18_WorldBoss_Fight "..ID.."OwnerID"..OwnerID())
		ThisObj.Attack_Target=OwnerID();--��Ĳ�o�d��@�� ���Y����
		FSM_DoTransion(ThisObj,"Battle_A1")	
	end
end
--[[
function Lua_Z18_WorldBoss_TestSkill()


	local ID=OwnerID();
	
	--DeBugMSG(0,0,"Now Lua_Z18_WorldBoss_TestSkill "..ID)
	local Target = ReadRoleValue( ID,EM_RoleValue_AttackTargetID)

	WriteRoleValue( ID,EM_RoleValue_AttackTargetID,0)
	while 1 do
		WriteRoleValue(ID , EM_RoleValue_AttackDelay , 1000 )			------���𴶧�40��
		CZ18_WorldBoss_LineMoveAE(ID,50833,Target);
		Sleep(5);
	end


end
]]--
--------BOSS ����------------------------------------------------------------------------------
function Lua_Z18_WorldBoss_Dead()
	local ID =OwnerID();
	local ThisObj =Zone_WorldBoss[ID];
	ThisObj.bUpdate=false
	return true;
end
--------BOSS�D�n�^��------------------------------------------------------------------------------
function Lua_Z18_WorldBoss_Ctrl()

	--DeBugMSG(0,0,"Now I'm Lua_Z18_WorldBoss_Ctrl")

	local ID =OwnerID();
	local ThisObj =CZ18_WorldBoss.Create();	
	Zone_WorldBoss[ID]=ThisObj;
	
	ThisObj.SearchPlayer=CZ18_WorldBoss.SearchPlayer;
	
--AI�̪�l�N�q���@�Ӷ��q�}�l����
	FSM_DoTransion(ThisObj,"IDLE")
--�j��ʧ@
	ThisObj.bUpdate=true;
	while ThisObj.bUpdate==true	do 
		FSM_Update(ThisObj);
		sleep(5)
		MING_CooDown(ThisObj,5);
	end
	
	
	Zone_WorldBoss[ID]=nil;
	--DeBugMSG(0,0,"Now I'm Lua_Z18_WorldBoss_Ctrl-end")
	DelObj(ID);
end