-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   �Ĥ@����Zone19�@�ɤ��аѦ�\\nas3\�ӤH�u�@��\~����\[����]-�\�ͧ�\z19_boss_object.lua   ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
---------------�p�j�諸ai---------------------------------------------
CZ19_BodyGuard={}
-----------------------------------------------
CZ19_BodyGuard.IdleState={}
-----------------------------------------------
function  CZ19_BodyGuard.SearchPlayer(ThisObj)
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local BossTarget = ReadRoleValue( Monter, EM_RoleValue_AttackTargetID ) 
	local PlayerList = SearchRangePlayer ( ThisObj.MonID , 1000 )
	local ps=table.getn(PlayerList);	
	if (ps==0 ) then
		return
	end
	local AttackTarget=ThisObj.Attack_Target;	
	if (AttackTarget==0) then
		AttackTarget=PlayerList[0]
	end	
	local maxdist=-10000;
	for i=0 ,  ps-1, 1 do	
		local playerID= PlayerList[i]		
		local Count = BuffCount (playerID)
		local Web=false;
		for j = 0 , Count do
			local BuffID = BuffInfo( playerID , j , EM_BuffInfoType_BuffID )
			if (BuffID == 508083) then
				Web=true;
				break;
			end
		end		
		if (Web==false) then 
			local dist=GetDistance( ThisObj.MonID,playerID);
			if (dist> maxdist) then
				maxdist=dist
				AttackTarget = playerID
			end 
		end
	end
	ThisObj.Attack_Target=AttackTarget;	
end
-----------------------------------------------
function  CZ19_BodyGuard.SelectTarget(ThisObj)

	local target=ThisObj.Attack_Target;

	if (target) then
		
		local dead=ReadRoleValue( target , EM_RoleValue_IsDead);
		if (dead>0) then
				target=HateTargetID();
				if (target==nil) then
					CZ19_WorldBoss.SearchPlayer(ThisObj)
					target=ThisObj.Attack_Target
				end
		else
			return
		end	
	end
	ThisObj.Attack_Target=target;
end
---------------�p�G�����b�԰���--------------------------------
function CZ19_BodyGuard.IsMonFight(ThisObj)
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local MonterObj =Zone_WorldBoss[Monter];
	if (MonterObj~=nil) then
		if (MonterObj.nowState~="IDLE") then
			return true;
		end
	end	
	return false;
end
-------------���H����----------------------------------
function CZ19_BodyGuard.FllowMon(ThisObj)
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local OrgParent = Role:new( Monter )
	local X=ReadRoleValue(ThisObj.MonID,EM_RoleValue_Register);
	local Z=ReadRoleValue(ThisObj.MonID,EM_RoleValue_Register+1);
	Move(ThisObj .MonID,OrgParent:X()+X,OrgParent:Y(),OrgParent:Z()+Z)
end	
	---------------------------------------------
function CZ19_BodyGuard.HaveMon(ThisObj)
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local MonterObj =Zone_WorldBoss[Monter];
	if (MonterObj~=nil) then
		return true;
	end
	return false;
end
---------------����欰-----------------------------------------------
function CZ19_BodyGuard.IdleState.update(ThisObj)
	local BossTarget = ReadRoleValue( ThisObj.MonID, EM_RoleValue_Register+2) 
	if (BossTarget~=0) then
		local dead=ReadRoleValue(BossTarget , EM_RoleValue_IsDead);
		if (dead==0 ) then
			ThisObj.Attack_Target=BossTarget;
			return "FireBall";
		end
	end
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_IsAttackMode)==1 then
		local target=ReadRoleValue(ThisObj.MonID,EM_RoleValue_AttackTargetID)	
		local ISGM = ReadRoleValue( target, EM_RoleValue_VOC)
		if (ISGM==0) then
			return 
		end
		if (CZ19_BodyGuard.IsMonFight(ThisObj)==false)then
			local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
			local MonterObj =Zone_WorldBoss[Monter];
			if (MonterObj~=nil) then
				ThisObj.Attack_Target=target
				MonterObj.Attack_Target=target
				FSM_DoTransion(MonterObj,"Battle_A1")
				return "Battle_A1";
			end
		end
	end
	if (CZ19_BodyGuard.HaveMon(ThisObj)==true) then
		if (CZ19_BodyGuard.IsMonFight(ThisObj)==true) then--�p�G�����b�԰���	
			CZ19_BodyGuard.FllowMon(ThisObj) --���H����--
		end
	else
		return "Battle_End";
	end
end
-----------------------------------------------
function CZ19_BodyGuard.IdleState.enter(ThisObj)
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, false )--����
end
-----------------------------------------------
function CZ19_BodyGuard.IdleState.leave(ThisObj)
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, true )--����
end
-----------------------------------------------
CZ19_BodyGuard.Battle_A1={}
-----------------------------------------------
function CZ19_BodyGuard.Battle_A1.update(ThisObj)
	if (CZ19_BodyGuard.HaveMon(ThisObj)==false) then
		return "Battle_End";
	end	
	if (ReadRoleValue(ThisObj.MonID,EM_RoleValue_IsAttackMode)==0) then		
		return "IDLE";
	end	
end
-----------------------------------------------
function CZ19_BodyGuard.Battle_A1.enter(ThisObj)
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local BossTarget = ReadRoleValue( Monter, EM_RoleValue_AttackTargetID ) 
	ThisObj.Attack_Target=BossTarget;
end
-----------------------------------------------
CZ19_BodyGuard.FireBall={}
-----------------------------------------------
function CZ19_BodyGuard.FireBall.update(ThisObj)
	local dead=ReadRoleValue( ThisObj.Attack_Target , EM_RoleValue_IsDead);
	if (dead==0) then	
		local dist=GetDistance( ThisObj.MonID,ThisObj.Attack_Target);
		if (dist< 100) then
			local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
			local MonterObj =Zone_WorldBoss[Monter];
			CastSpell(  ThisObj.MonID,ThisObj.Attack_Target , 496506 )--�U�N���y
			Sleep(50)--496506�A�I��3����@
			CZ19_WorldBoss.brun_Web(MonterObj,ThisObj.Attack_Target)
		else
			local Org = Role:new(  ThisObj.Attack_Target )	
			Move(ThisObj.MonID,Org:X(),Org:Y(),Org:Z())
		end
	else
		WriteRoleValue( ThisObj.MonID, EM_RoleValue_Register+2,0) 
		return "IDLE";
	end	
end
-----------------------------------------------
function CZ19_BodyGuard.FireBall.enter(ThisObj)
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--����	
	AddBuff( ThisObj.MonID , 507899 ,0,-1)	
	CastSpell(  ThisObj.Attack_Target,ThisObj.MonID,  496266 )--�J��
	SetAttack(ThisObj.MonID,ThisObj.Attack_Target);
	local Org = Role:new(  ThisObj.Attack_Target )	
	Move(ThisObj.MonID,Org:X(),Org:Y(),Org:Z())
end
function CZ19_BodyGuard.FireBall.leave(ThisObj)

	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--����	
	CancelBuff( ThisObj.MonID , 507899 )
end
CZ19_BodyGuard.Battle_End={}
function CZ19_BodyGuard.Battle_End.enter(ThisObj)
	ThisObj.bUpdate=false;
end
CZ19_BodyGuard.Dead={}
function CZ19_BodyGuard.Dead.enter(ThisObj)
	ThisObj.bUpdate=false;
end
function CZ19_BodyGuard.Create()
	local State={}
	State["IDLE"]=CZ19_BodyGuard.IdleState;
	State["Battle_A1"]=CZ19_BodyGuard.Battle_A1;
	State["FireBall"]=CZ19_BodyGuard.FireBall;
	State["Battle_End"]=CZ19_BodyGuard.Battle_End;
	State["Dead"]=CZ19_BodyGuard.Dead;
	local ID=OwnerID();
	local ThisObj=FSM_Initial(ID,State);
	return ThisObj;
end
function Lua_Zone19_BodyGuard_Kill()
	local ID=OwnerID();
	local ThisObj =Zone_WorldBoss[ID];
	if (ThisObj~=nil) then    
		FSM_DoTransion(ThisObj,"Dead")
		local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
		local MonterObj =Zone_WorldBoss[Monter];
		if (MonterObj~=nil) then
			CZ19_WorldBoss.removeSpider(MonterObj,ID)
		end
	end	
	Zone_WorldBoss[ID]=nil;
	DelObj(ID);
	return true
end

function Lua_Zone19_BodyGuard_Ctrl()
	local ID =OwnerID();
	local ThisObj =CZ19_BodyGuard.Create();	
	Zone_WorldBoss[ID]=ThisObj;
	ThisObj.SearchPlayer=CZ19_BodyGuard.SearchPlayer;
	FSM_DoTransion(ThisObj,"IDLE")

	ThisObj.bUpdate=true;
	while ThisObj.bUpdate==true	do 
		FSM_Update(ThisObj);
		sleep(5)
	end	
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local MonterObj =Zone_WorldBoss[Monter];	
	if (MonterObj~=nil) then
		CZ19_WorldBoss.removeSpider(MonterObj,ID)
	end	
	Zone_WorldBoss[ID]=nil;
	DelObj(ID);
end
CZ19_WorldBoss_Web={}
CZ19_WorldBoss_Web.liftTime=60;
CZ19_WorldBoss_Web.HITSDEF=5;
function CZ19_WorldBoss_Web.ByHit(ThisObj)
	local MAXHP=ReadRoleValue( ThisObj.MonID , EM_RoleValue_MaxHP);
	local nowHP=ReadRoleValue( ThisObj.MonID , EM_RoleValue_HP);
	
	ThisObj.hits=ThisObj.hits-1;
	local retDMG=MAXHP/ThisObj.HITS_MAX
	nowHP=ThisObj.hits*retDMG;	
	if (ThisObj.hits<=0) then
		nowHP=0;
	end
	WriteRoleValue( ThisObj.MonID , EM_RoleValue_HP,nowHP);
	return retDMG;
end
CZ19_WorldBoss_Web.IdleState={}
function CZ19_WorldBoss_Web.IdleState.update(ThisObj)
	ThisObj.count=ThisObj.count-1;
	if (ThisObj.count<=0) then
		return "Battle_End";
	end
end
function CZ19_WorldBoss_Web.IdleState.enter(ThisObj)
	SetPlot( ThisObj.MonID,"Range","Lua_Z19_Web_Touching",20)
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Fight , true )
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )
	SetModeEx( ThisObj.MonID   , EM_SetModeType_SearchenemyIgnore, true )
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Mark, true )
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, false )
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, false )
	SetModeEx( ThisObj.MonID   , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( ThisObj.MonID   , EM_SetModeType_HideName, true )
	ThisObj.count=CZ19_WorldBoss_Web.liftTime;
end
CZ19_WorldBoss_Web.Battle_A1={}
function CZ19_WorldBoss_Web.Battle_A1.update(ThisObj)
	ThisObj.count=ThisObj.count-1;
	if (ThisObj.count<=0) then
		return "Battle_End";
	end
end
function CZ19_WorldBoss_Web.Battle_A1.enter(ThisObj)
	AddBuff(ThisObj.MonID,508082,0,-1);
	ThisObj.count=CZ19_WorldBoss_Web.liftTime;
end
CZ19_WorldBoss_Web.Battle_A2={}
function CZ19_WorldBoss_Web.Battle_A2.update(ThisObj)
	ThisObj.count=ThisObj.count-1;
	if (ThisObj.count<=0) then
		return "Battle_End";
	end
end
function CZ19_WorldBoss_Web.Battle_A2.enter(ThisObj)
	AddBuff(ThisObj.MonID,508094,0,-1);
	ThisObj.count=10
end
CZ19_WorldBoss_Web.Battle_End={}
function CZ19_WorldBoss_Web.Battle_End.enter(ThisObj)
	ThisObj.bUpdate=false;
end
CZ19_WorldBoss_Web.Dead={}
function CZ19_WorldBoss_Web.Dead.update(ThisObj)
	return "Battle_End";
end
function Lua_Z19_Web_Touching()
	local palyer=OwnerID()
	local dead=ReadRoleValue( palyer , EM_RoleValue_IsDead);
	if (dead==1) then
		return
	end
	local ID=TargetID()
	local ThisObj =Zone_WorldBoss[ID]
	if (ThisObj~=nil) then
		ThisObj.Attack_Target=palyer
		FSM_DoTransion(ThisObj,"Battle_A1")
	end	
end
function CZ19_WorldBoss_Web.Create()
	local State={}
	State["IDLE"]=CZ19_WorldBoss_Web.IdleState;
	State["Battle_A1"]=CZ19_WorldBoss_Web.Battle_A1;
	State["Battle_A2"]=CZ19_WorldBoss_Web.Battle_A2;
	State["Battle_End"]=CZ19_WorldBoss_Web.Battle_End;
	State["Dead"]=CZ19_WorldBoss_Web.Dead;
	local ID=OwnerID();
	local ThisObj=FSM_Initial(ID,State);
	local count= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_Register)
	ThisObj.hits=count;
	ThisObj.HITS_MAX=count;
	return ThisObj;
end
function Lua_Zone19_Web_Dead()	
	local ID=OwnerID();
	
	local ThisObj =Zone_WorldBoss[ID];
	if (ThisObj~=nil) then               
		CZ19_WorldBoss_Web.ByHit(ThisObj); 
		if(ThisObj.hits<=0 and ThisObj.nowState~="Dead" and ThisObj.nowState~="Battle_End" ) then
			local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
			local MonterObj =Zone_WorldBoss[Monter];
			if (MonterObj~=nil) then
				CZ19_WorldBoss.removeWeb(MonterObj,ID)
			end
			Zone_WorldBoss[ID]=nil;
			DelObj(ID);
		end
	end
	return false;
end
function Lua_Zone19_Web_Ctrl()
	local ID =OwnerID();
	local ThisObj =CZ19_WorldBoss_Web.Create();	
	Zone_WorldBoss[ID]=ThisObj;
	FSM_DoTransion(ThisObj,"IDLE")
	ThisObj.bUpdate=true;
	while ThisObj.bUpdate==true	do 
		FSM_Update(ThisObj);
		sleep(10)
	end
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local MonterObj =Zone_WorldBoss[Monter];
	if (MonterObj~=nil) then
		CZ19_WorldBoss.removeWeb(MonterObj,ID)
	end	
	Zone_WorldBoss[ID]=nil;
	DelObj(ID);
end
CZ19_WorldBoss={Webs=15,WebID=104917,POISON_NUM=496569}
function CZ19_WorldBoss.SearchWeb(ThisObj)
	local WebList={}
	local count=table.getn(ThisObj.WebList);--
	for i=1,count,1 do
		local WebID=ThisObj.WebList[i]
		local PlayerList = SearchRangePlayer (WebID , 30 )
		if (table.getn(PlayerList)>0) then
			local aalive=false;
			for k=0,table.getn(PlayerList)-1,1 do
				palyerID=PlayerList[k]
				local dead=ReadRoleValue( palyerID , EM_RoleValue_IsDead);
				if (dead==0) then
					aalive=true;
					break
				end
			end
			if (aalive==true) then
				table.insert (WebList,WebID);
			end
		end
	end	
	return WebList;
end
function CZ19_WorldBoss.throwWeb(ThisObj,X,Y,Z,BaseDir,BaseRoom,Hits)
	local count=CZ19_WorldBoss_Web.HITSDEF;
	
	if (Hits~=nil)then
	
		count=Hits
	end
	--DeBugMSG(0,0,"throwWeb.count"..count)
	local WebObj= CreateObj(CZ19_WorldBoss.WebID,X , Y, Z, BaseDir, 1 )
	AddToPartition( WebObj, BaseRoom)	
	WriteRoleValue(WebObj,EM_RoleValue_PID,ThisObj.MonID)
	WriteRoleValue(WebObj,EM_RoleValue_Register,count)
	return WebObj
end
function CZ19_WorldBoss.GetRandPos(ThisObj,OrgParent,Dis,Cal)	
	local p={};
	local RDis=Dis+DW_RAND(20);
	local RX=DW_Rand(150)-55;
	local RZ=DW_Rand(150)-55;
	p.X = OrgParent:X() +(RDis*math.cos(Cal)+RX)
	p.Z = OrgParent:Z() - (RDis*math.sin(Cal)+RZ)
	p.Y  = GetHeight( p.X , OrgParent:Y() , p.Z  );	
	if CheckLine( ThisObj.MonID , p.X , p.Y , p.Z  ) == false then
		p.X = OrgParent:X() +20*math.cos(Cal)
		p.Z = OrgParent:Z() -20*math.sin(Cal)
		p.Y= GetHeight( p.X ,  OrgParent:Y() ,p.Z )
	end
	return p;
end
--------------------------------------------------------
function CZ19_WorldBoss.CalDistByTab(pos,posTab,dist)
	local count=table.getn(posTab)
	for i = 1 , count , 1 do
		local wpos=posTab[i];
		local tdis=math.sqrt((wpos.X-pos.X)^2 + (wpos.Z-pos.Z)^2)
		if (dist>tdis) then
		     return false
		end
	end
	return true
	 
end
-----------------------------------------------
--������j���
------------------------------------------------------------------
function CZ19_WorldBoss.throwWebs(ThisObj)
	local Dis = 80
	local OrgParent = Role:new( ThisObj.MonID )
	local Pos = {}
	local Dir = OrgParent:Dir()	
	local BaseDir=0	
	local Cal
	local PlayerList = SearchRangePlayer ( ThisObj.MonID , 300 )
	local ti=0;
	local BaseRoom = OrgParent:RoomID()
	local BaseDir=0

	local angle=(math.pi/180)*(360/CZ19_WorldBoss.Webs );
	for i = 1 , CZ19_WorldBoss.Webs , 1 do 		
		local p={};
		Cal = angle *i;		
		local OK=false
		while OK~=true do
			p=CZ19_WorldBoss.GetRandPos(ThisObj,OrgParent,Dis,Cal)    
			if (CZ19_WorldBoss.CalDistByTab(p,Pos,30)) then
				OK=true
			end
		end		
		if (DW_Rand(2)>0) then
			if ( ti<table.getn(PlayerList)) then
				local Org = Role:new( PlayerList[ ti] )
				local px={};
				px.X=Org:X();
				px.Y=Org:Y();
				px.Z=Org:Z();
				if (CZ19_WorldBoss.CalDistByTab(px,Pos,Dis)) then
					p=px;
				end
				ti= ti+1;
			end
		end
		table.insert(Pos,p)		
		local WebObj=CZ19_WorldBoss.throwWeb(ThisObj,Pos[i].X,Pos[i].Y,Pos[i].Z,BaseDir,BaseRoom)
		table.insert (ThisObj.WebList,WebObj)
	end
end
----------------------------------------------------------------
--��ܥؼ�
-------------------------------------------------------------------
function CZ19_WorldBoss.SelectTarget(ThisObj)
	local target=ThisObj.Attack_Target;
	if (target) then	
		if (ReadRoleValue( target , EM_RoleValue_IsPlayer)==1) then		
			local dead=ReadRoleValue( target , EM_RoleValue_IsDead);
			if (dead>0) then
				target=nil
			else
				return
			end	
		else
			target=nil
		end
	end
	if (target==nil) then
		target=HateTargetID();
		if (target==nil) then
			CZ19_WorldBoss.SearchPlayer(ThisObj)
			target=ThisObj.Attack_Target
		end
	end	
	ThisObj.Attack_Target=target;
end
----------------------------------------------------------------
--SearchPlayer
-------------------------------------------------------------------
function CZ19_WorldBoss.SearchPlayer(ThisObj)
	local PlayerList = SearchRangePlayer ( ThisObj.MonID , 1000 )
	local ps=table.getn(PlayerList);	
	if (ps==0 ) then
		return
	end
	local AttackTarget=ThisObj.Attack_Target;	
	if (AttackTarget==0) then
		AttackTarget=PlayerList[0]
	end	
	local maxdist=-10000;
	for i=0 ,  ps-1, 1 do	
		local playerID= PlayerList[i]		
		local Count = BuffCount (playerID)
		local Web=false;
		for j = 0 , Count do
			local BuffID = BuffInfo( playerID , j , EM_BuffInfoType_BuffID )			
			if (BuffID == 508083) then			
				Web=true;
				break;
			end
		end		
		if (Web==false) then 
			local dist=GetDistance( ThisObj.MonID,playerID);
			if (dist> maxdist) then
				maxdist=dist
				AttackTarget = playerID		
			end 
		end
	end
	ThisObj.Attack_Target=AttackTarget;
end

-------------------------------------------------------------------
------------------------------------
CZ19_WorldBoss.IdleState={}

CZ19_WorldBoss.WEBCD=300;
-------------------------------------
function CZ19_WorldBoss.IdleState.enter(ThisObj)
	
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)

	--�]100�d��@��Ĳ�o A1
	SetPlot( ThisObj.MonID,"Range","Lua_Z19_WorldBoss_Fight",120)
	if ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID)==107187 then
		Lua_DW_WBGUIDRecord(1);
	else
		SetPlot(ThisObj.MonID,"dead","LuaS_103580_6",0);
	end

	SetModeEx( ThisObj.MonID   , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true  )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, false )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_HideName, true )--�W��
	CZ19_WorldBoss.CreateSpider(ThisObj,10)
	
end
-------------------------------------
function CZ19_WorldBoss.IdleState.update(ThisObj)
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_IsAttackMode)==1 then
		Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
		return "Battle_A1";
	end

end
--------------------------------------------------------
function CZ19_WorldBoss.IdleState.leave(ThisObj)
--�����d��@�� �קK����Ĳ�o
	SetPlot( ThisObj.MonID,"Range", "" , 0 )
	--
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_NORMAL)
	Sleep(5);
	--�����X�ʧ@
	Zone_WorldBoss.SayToRangePlayer(ThisObj,400, 2, "[SC_104705_0]", 0);
	PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_SPAWN_BEGIN )	
	Sleep(25)
	SetDefIdleMotion(thisobj.monid,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	local OrgParent = Role:new( ThisObj.MonID )

	local flag = CreateObj( 116392, OrgParent:X(), OrgParent:Y(), OrgParent:Z(), OrgParent:Dir(), 1 )
	
	SetModeEx(  flag    , EM_SetModeType_Mark, false) 
	SetModeEx(  flag    , EM_SetModeType_HideName, true) 
	SetModeEx(  flag    , EM_SetModeType_ShowRoleHead, false) 
	SetModeEx(  flag    , EM_SetModeType_NotShowHPMP, true )
	SetModeEx(  flag  , EM_SetModeType_Strikback, false) 
	SetModeEx(  flag  , EM_SetModeType_Searchenemy, false )	
	SetModeEx( flag   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( flag   , EM_SetModeType_Move, false )--����
	SetModeEx( flag   , EM_SetModeType_Show, false )--���
	AddToPartition( flag, OrgParent:RoomID())

	--�����԰��ʧ@	
	--���������i�J���ؼ�	
		--�}�Ҿ԰�
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( ThisObj.MonID   , EM_SetModeType_HideName, false )--�W��
	--
	ThisObj.Skill=
	{	
		{ok=false,cd=CZ19_WorldBoss.WEBCD,count=CZ19_WorldBoss.WEBCD},--{ok=false,cd=300,count=300},���l
		{ok=false,cd=150,count=150},
		{ok=false,cd=60,count=60},
		{ok=false,cd=300,count=0},
		{ok=false,cd=150,count=150},
		{ok=false,cd=50,count=50},
		{ok=false,cd=100,count=100}
	}
	ThisObj.Postion=flag
	ThisObj.HunterTab={}
	AddBuff ( ThisObj.MonID , 509278, 0, -1 )
	--DeBugMSG(0,0,"Battle_A1.enter")
end
-----------------------------------------------
CZ19_WorldBoss.Battle_A1={}
function CZ19_WorldBoss.CreateSpiderForFire(ThisObj,posID,Target)

	local OrgParent = Role:new( ThisObj.MonID )
	local posID = Role:new( posID )
	local tposID = Role:new( Target )
	local SmallSpider;
	if ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID)==107187 then
		SmallSpider=107189;
	else
		SmallSpider=104916;
	end
	local spider = CreateObj( SmallSpider, posID:X(), posID:Y(), posID:Z(), posID:Dir(), 1 )
	AddToPartition( spider,tposID:RoomID())	
	WriteRoleValue(spider,EM_RoleValue_PID,ThisObj.MonID)
	WriteRoleValue(spider,EM_RoleValue_Register+2,Target)
	
	BeginPlot(spider , "Lua_Zone19_BodyGuard_Ctrl" , 0)		
	table.insert(ThisObj.BodyGuard,spider)
	--local WebObj=CZ19_WorldBoss.throwWeb(ThisObj,tposID:X(),tposID:Y(),tposID:Z(),tposID:Dir(),tposID:RoomID(),10000)
	--table.insert (ThisObj.WebList,WebObj)

end

function CZ19_WorldBoss.CreateSpider(ThisObj,count)

	local face = 0
	local Dis = 80
	local OrgParent = Role:new( ThisObj.MonID )
	local Pos = {}
	local Dir = OrgParent:Dir()
	
	local Cal
	if face == nil or Type( face) ~= "number" then
		face = 0
	end
	if (count==nil) then
	count=6
	end

	local angle=(math.pi/180)*(360/count );
	for i = 1 , count , 1 do
		local p={};
		Cal = angle *i;
	
		p.X = OrgParent:X() +(Dis*math.cos(Cal))
		p.Z = OrgParent:Z() - (Dis*math.sin(Cal))
		p.Y  = GetHeight( p.X , OrgParent:Y() , p.Z  );
	
		if CheckLine( ThisObj.MonID , p.X , p.Y , p.Z  ) == false then
			p.X = OrgParent:X() +(Dis*math.cos(Cal))*(count-i)/count
			p.Z = OrgParent:Z() -(Dis*math.sin(Cal))*(count-i)/count
			p.Y= GetHeight( p.X ,  OrgParent:Y() ,p.Z )
		
		end

		Pos[i]=p;
	end
	local BaseRoom = OrgParent:RoomID()
	local BaseDir=0
	
	local x
	local z
	local SmallSpider;
	if ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID)==107187 then
		SmallSpider=107189;
	else
		SmallSpider=104916;
	end
	for i=1,count,1 do
		Cal = angle *i;
		x=Dis*math.cos(Cal)
		z=Dis*math.sin(Cal)
		local spider = CreateObj( SmallSpider, Pos[i].X, Pos[i].Y, Pos[i].Z, BaseDir, 1 )
		AddToPartition( spider, BaseRoom)	
		WriteRoleValue(spider,EM_RoleValue_PID,ThisObj.MonID)
		WriteRoleValue(spider,EM_RoleValue_Register,x)
		WriteRoleValue(spider,EM_RoleValue_Register+1,z)
		BeginPlot(spider , "Lua_Zone19_BodyGuard_Ctrl" , 0)		
		table.insert(ThisObj.BodyGuard,spider)
	end
end
-----------------------------------------------

function CZ19_WorldBoss.Battle_A1.enter(ThisObj)	
	
	CZ19_WorldBoss.SelectTarget(ThisObj)
	if (ThisObj.Attack_Target~=nil) then
		SetAttack( ThisObj.MonID,ThisObj.Attack_Target)
	end
end
--------------------------------------------
function CZ19_WorldBoss.CheckBodyGuard(ThisObj)
	-- 2013/3/28 ���B�ק�G�W�[�ˬdThisObj.BodyGuard�̪�guid�O�_�٦s�b�M���`�A�p�G�w�g���s�b�Φ��`�N�����C
	for index, spider in pairs(ThisObj.BodyGuard) do
		if CheckID(spider) == false or 
		   ReadRoleValue(spider, EM_RoleValue_IsDead) == 1 or 
		   ReadRoleValue(spider, EM_RoleValue_IsNPC) == 0 then
			DelObj(spider)
			table.remove(ThisObj.BodyGuard, index)
		end
	end
--	DebugMsg(0, 0, table.print(ThisObj.BodyGuard))

	local count=table.getn(ThisObj.BodyGuard)
	if (count<10) then
		return false;
	end	
	return true;
end

function CZ19_WorldBoss.ShootSpider(ThisObj)

	local count=table.getn(ThisObj.BodyGuard)
	for i=1,count,1 do
		local MonID=ThisObj.BodyGuard[i];
		local spider=Zone_WorldBoss[MonID]
		if (spider.nowState=="IDLE") then
			spider.Attack_Target=ThisObj.Attack_Target
			SetAttack( MonID,ThisObj.Attack_Target)
			FSM_DoTransion(spider,"Battle_A1")
			return ;
		end
	end
end

function CZ19_WorldBoss.CheckWebBuff(ThisObj)
	local playerID=ThisObj.Attack_Target;
	if (playerID) then		
		local dead=ReadRoleValue( playerID , EM_RoleValue_IsDead);
		local Count = BuffCount (playerID)
		for j = 0 , Count do
			local BuffID = BuffInfo( playerID , j , EM_BuffInfoType_BuffID )
			if (BuffID == 508096) then
				return true;
			end
		end
	end
	return false;
end

function CZ19_WorldBoss.HaveBuff(playerID,buff)
	local bCount = BuffCount (playerID)
	for j = 0 , bCount do
		local BuffID = BuffInfo( playerID , j , EM_BuffInfoType_BuffID )
		if (BuffID == buff) then
			return true;
		end
	end
	return false;	
end

function CZ19_WorldBoss.ShootAllSpider(ThisObj)
	local Count = HateListCount(ThisObj.MonID)
	local HateList=star_HateListSort(ThisObj.MonID);
	local n=1
	local count=table.getn(ThisObj.BodyGuard)
	local noBuff=false;
	for i=1,count,1 do
		local MonID=ThisObj.BodyGuard[i];
		local spider=Zone_WorldBoss[MonID]
		if (spider~=nil) then
			if (spider.nowState~="FireBall") then
				local carry=true
				while carry do
					if n>table.getn(HateList)then
						n=1
						noBuff=true
					end
					playerID=HateList[n]
					if (CZ19_WorldBoss.HaveBuff(playerID,508096)==false or noBuff) then
						spider.Attack_Target=ThisObj.Attack_Target
						SetAttack( MonID,playerID)
						FSM_DoTransion(spider,"Battle_A1")	
						carry=false;
					end
					n=n+1;
				end
			end
		end
	end
end

-----------------------------------------------
function CZ19_WorldBoss.Battle_A1.update(ThisObj)

	if	Zone_WorldBoss.IsExitFight(ThisObj)	then
		return "Battle_End";
	end
	
	local dist=GetDistance(  ThisObj.MonID,ThisObj.Postion);
	if (dist>350) then
		--DeBugMSG(0,0,"Battle_End dist="..dist)
		return "Battle_End";
	end	
	-- 2013/3/18 ���B�ק�Ghard Boss�~����Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
	if ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID)==107187 then
		Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
	end
	if (table.getn(ThisObj.HunterTab)>0) then
		return "HunterTime";
	end	
	if (ThisObj.Skill[7].ok==true) then	
		local ps,PlayerList=Lua_Zone19_SearchNearAllPlayer(ThisObj,450)
		if (ps==true) then
			local tab={}
			local tab2={}
			local tab3={}
			local count=3;
			for i=1,table.getn(PlayerList),1 do
				local playerID=PlayerList[i];
				local dist=GetDistance( ThisObj.MonID,playerID);
				local dist2=GetDistance( playerID,ThisObj.Postion);
				local info={};
				info.dis=dist;
				info.id=playerID;
				local insert=false;
				if (dist2<350) then
					if (dist>50) then
						if (dist<350 ) then
							for j=1,table.getn(tab),1 do
								if (dist>tab[j].dis) then
									table.insert(tab,j,info);
									insert=true;
									break
								end
							end
						end
					else
						table.insert(tab2,info);
						insert=true;
					end
				else
					table.insert( tab3,info);
					insert=true;
				end
				if (insert==false) then
					table.insert(tab,info);
				end
			end
			local t3=table.getn(tab3);
			for i=1,t3,1 do
				CZ19_WorldBoss.CreateSpiderForFire(ThisObj,ThisObj.MonID,tab3[i].id)
				--SysCastSpellLv(ThisObj.MonID,tab3[i].id,CZ19_WorldBoss.POISON_NUM,0)  
				--DeBugMSG(0,0,"CreateSpiderForFire id="..tab3[i].id)
			end
			local t2=table.getn(tab2);
			for i=1,t2,1 do
			    local a=DW_RAND(t2);
				local b=DW_RAND(t2);
				local tmp=tab2[a];
				tab2[a]=tab2[b];
				tab2[b]=tmp;
			end
			local t1=count-table.getn(tab);
			if (t1>t2) then
				t1=t2;
			end
			if (t1>0) then
				for i=1,t1,1 do
					SysCastSpellLv(ThisObj.MonID,tab2[i].id,CZ19_WorldBoss.POISON_NUM,0)  
				end
			end			
			for i=1,table.getn(tab),1 do
				SysCastSpellLv(ThisObj.MonID,tab[i].id,CZ19_WorldBoss.POISON_NUM,0)  
				if (i>=count) then
					break;
				end
			end
			ThisObj.Skill[7].ok=false;
		end
	end
	-------------------------------------
	if (ThisObj.Skill[6].ok==true) then		
		CZ19_WorldBoss.ShootAllSpider(ThisObj);
		ThisObj.Skill[6].ok=false;	
	end
	--�ˬd�֩�10�Ӻ�  ��
	if (ThisObj.Skill[1].ok==true) then
		local count=table.getn(ThisObj.WebList);
		if (count<10) then
			return "SpellWebs";
		end
	end

	if (ThisObj.Skill[2].ok==true ) then	
		local ps,PlayerList=Lua_Zone19_SearchNearAllPlayer(ThisObj,50)		
		if (ps==true) then
			if (ThisObj.Attack_Target~=PlayerList[1]) then
				SetHateListPoint( ThisObj.MonID , ThisObj.Attack_Target , 1 )
			end
		end
		if (ps==true) then
			return "SpellFires";
		end
	end	

	if (ThisObj.Skill[5].ok==true) then
		return "FireBall";
	end	

	if (ThisObj.Skill[4].ok==true) then	
		if (CZ19_WorldBoss.CheckBodyGuard(ThisObj)==false) then
			return "HealSpider";
		end
	end

	if (ThisObj.Skill[3].ok==true) then
	
		if (CZ19_WorldBoss.CheckWebBuff(ThisObj)==false) then
			ThisObj.Skill[3].ok=false;
			CZ19_WorldBoss.ShootSpider(ThisObj);		
		end
	end
end
CZ19_WorldBoss.Battle_End={}
-----------------------------------------------
function CZ19_WorldBoss.Battle_End.enter(ThisObj)
	CZ19_WorldBoss.ClearAll(ThisObj);
	Lua_Zone19_WorldBossClearAllNPC( ThisObj.MonID,CZ19_WorldBoss.WebID);
	Lua_Zone19_WorldBossClearAllNPC( ThisObj.MonID,104916);
	Lua_Zone19_WorldBossClearAllNPC( ThisObj.MonID,104989)
	Lua_Zone19_WorldBossClearAllNPC(  ThisObj.MonID,107188);
	Lua_Zone19_WorldBossClearAllNPC( ThisObj.MonID,107189)
	DelFromPartition( ThisObj.MonID )
	Sleep(70);
	--ReSetNPCInfo( ThisObj.MonID ) 	-- ���]NPC���	
	Lua_CancelAllBuff(ThisObj.MonID);	--�M���Ҧ����A

	-- 2013/3/18 ���B�ק�G�����԰��j��N���a�^���I
	-- 2013/3/27 ���B�ק�G�����԰��j��N���a�^���I(�N���I�����b�����ܼ�CZ19_WorldBoss.origin_position)
--	SetPos(ThisObj.MonID, ReadRoleValue(ThisObj.Postion, EM_RoleValue_X), ReadRoleValue(ThisObj.Postion, EM_RoleValue_Y), ReadRoleValue(ThisObj.Postion, EM_RoleValue_Z), ReadRoleValue(ThisObj.Postion, EM_RoleValue_Dir))
	SetPos(ThisObj.MonID, CZ19_WorldBoss.origin_position.x, CZ19_WorldBoss.origin_position.y, CZ19_WorldBoss.origin_position.z, CZ19_WorldBoss.origin_position.dir)
	Sleep(30);
	AddToPartition( ThisObj.MonID, 0 ) 	-- ���s�[�J���ΰ�
	
	
	DelObj(ThisObj.Postion)
	ThisObj.Postion=0;

	-- 2013/3/18 ���B�ק�GState["Battle_End"]������^�_State["IDLE"]
	FSM_DoTransion(ThisObj,"IDLE")
end
-----------------------------------------------
CZ19_WorldBoss.Dead={}
-----------------------------------------------
function CZ19_WorldBoss.Dead.enter(ThisObj)
	local Boss=ThisObj.MonID;
	SetModeEx(Boss,EM_SetModeType_Searchenemy,false);
	SetModeEx(Boss,EM_SetModeType_Strikback,false);
	SetModeEx(Boss,EM_SetModeType_Fight,false);
	SetStopAttack(Boss);
	ThisObj.bUpdate=false;
	CZ19_WorldBoss.ClearAll(ThisObj);
end
-----------------------------------------------s

