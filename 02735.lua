-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   第一次看Zone19世界王請參考\\nas3\個人工作區\~企劃\[企劃]-俞睿廷\z19_boss_object.lua   ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CZ19_WorldBoss.SpellWebs={}

-----------------------------------------------
function CZ19_WorldBoss.SpellWebs.enter(ThisObj)
	SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
	AddBuff( ThisObj.MonID , 507899 ,0,-1)
end
-----------------------------------------------
function CZ19_WorldBoss.SpellWebs.update(ThisObj)
	Zone_WorldBoss.SayToRangePlayer(ThisObj,400, 2, "[SC_104705_3]", 0);
	PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN)  
	Zone_WorldBoss.Sleep(ThisObj,15)
	PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CHANNEL_BEGIN)  
	CastSpell(  ThisObj.MonID,ThisObj.MonID , 496505 )--瞞天灑網
	Zone_WorldBoss.Sleep(ThisObj,60)
	CZ19_WorldBoss.throwWebs(ThisObj);
	ThisObj.Skill[1].ok=false;
	Zone_WorldBoss.Sleep(ThisObj,10)
	return "Battle_A1";
end
function CZ19_WorldBoss.SpellWebs.leave(ThisObj)
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊	
	CancelBuff( ThisObj.MonID , 507899 )	
end
CZ19_WorldBoss.HealSpider={}

function CZ19_WorldBoss.HealSpider.enter(ThisObj)
	SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊	
	AddBuff( ThisObj.MonID , 507899 ,0,-1)
	CZ19_WorldBoss.ShootAllSpider(ThisObj);
end
function CZ19_WorldBoss.HealSpider.update(ThisObj)
	Zone_WorldBoss.SayToRangePlayer(ThisObj,400, 2, "[SC_104705_5]", 0);
	CZ19_WorldBoss.CreateSpider(ThisObj,5)
	CastSpell(  ThisObj.MonID,ThisObj.MonID , 496508 )--蜘蛛聖印
	Zone_WorldBoss.Sleep(ThisObj,25)
	ThisObj.Skill[4].ok=false;
	
	return "Battle_A1";--找尋被綁的
end

function CZ19_WorldBoss.HealSpider.leave(ThisObj)

	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊
	CancelBuff( ThisObj.MonID , 507899 )

end

CZ19_WorldBoss.SpellFires={}
function CZ19_WorldBoss.SpellFires.enter(ThisObj)
	Zone_WorldBoss.PushHeteList(ThisObj)
	Zone_WorldBoss.SetHeteList(ThisObj,1)

	SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊

	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, false )--索敵	
	AddBuff(ThisObj.MonID,507899,0,-1);	
	CZ19_WorldBoss.CrateTargetFlag(ThisObj);
	ThisObj.count=0;
	
end
-----------------------------------------------
function CZ19_WorldBoss.SpellFires.update(ThisObj)

	local ps=Lua_Zone19_SearchNearAllPlayer(ThisObj,50)	
	if (ps==false) then
		ThisObj.Skill[2].ok=false;
		SetAttack( ThisObj.MonID, ThisObj.Attack_Target );
		return "FireBall";--
	end
	SetHateListPoint( ThisObj.MonID , ThisObj.Attack_Target , 1 )
	local Spell=496507;
	local sleepX=0;
	if (ThisObj.count==0) then
		Spell=497142;
		 sleepX=20;
		Zone_WorldBoss.SayToRangePlayer(ThisObj,400, 2, "[SC_104705_4]", 0);
	end

	ThisObj.count=ThisObj.count+1;
	--Yell(ThisObj.HelpFlag[ThisObj.count],"Fake is me",3)
	local nowHP=ReadRoleValue( ThisObj.MonID , EM_RoleValue_HP);
	WriteRoleValue(ThisObj.HelpFlag[ThisObj.count] , EM_RoleValue_HP,nowHP);
	LockHP(ThisObj.HelpFlag[ThisObj.count],nowHP,"");
	SetAttack( ThisObj.MonID, ThisObj.HelpFlag[ThisObj.count] );
	CastSpell(  ThisObj.HelpFlag[ThisObj.count],ThisObj.MonID,  496216 )--嘲諷
	Zone_WorldBoss.Sleep(ThisObj,5)
	--CastSpell(  ThisObj.MonID,ThisObj.HelpFlag[ThisObj.count] , 496507 )--噴射火焰
	
	
	
	CastSpell(  ThisObj.MonID,ThisObj.MonID , Spell )--噴射火焰
	
	Zone_WorldBoss.Sleep(ThisObj,25+sleepX);
	DelObj(ThisObj.HelpFlag[ThisObj.count]);
	ThisObj.HelpFlag[ThisObj.count]=nil
	if (ThisObj.count>=4) then
		Zone_WorldBoss.Sleep(ThisObj,10)
		return "Battle_A1";--
	end
end
-----------------------------------------------
function CZ19_WorldBoss.SpellFires.leave(ThisObj)
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback,  true )--反擊

	SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy,  true )--索敵
	CancelBuff( ThisObj.MonID , 507899 )

	for i=1,4,1 do 
		if (ThisObj.HelpFlag[i]~=nil) then
			DelObj(ThisObj.HelpFlag[i]);
			ThisObj.HelpFlag[i]=nil;
		end
	end
	ThisObj.HelpFlag=nil;
	Zone_WorldBoss.PopHeteList(ThisObj)
	ThisObj.Skill[2].ok=false;
	SetAttack( ThisObj.MonID, ThisObj.Attack_Target );
end
function CZ19_WorldBoss.CrateTargetFlag(ThisObj,TargetID)
	local OrgParent = Role:new( ThisObj.MonID )
	local ore=DW_RAND(2);
	local Dir = OrgParent:Dir()
	local Dis=20;
	local Pos = {}
	
	local angle=30*(math.pi/180);
	
	local tDis=0
	if (ore==1) then
		tDis=Dir*(math.pi/180)-60*(math.pi/180) ;
	else
		tDis=Dir*(math.pi/180)+60*(math.pi/180) ;
	end
	for i=1,4,1 do 
	
		local p={}
		if (ore==1) then
			tDis = tDis+angle;
		else
			tDis = tDis-angle;
		end
		p.X = OrgParent:X() +(Dis*math.cos(tDis))
		p.Z = OrgParent:Z() - (Dis*math.sin(tDis))
		p.Y  = GetHeight( p.X , OrgParent:Y() , p.Z  );
		Pos[i]=p;
	end
	local BaseRoom = OrgParent:RoomID()
	local BaseDir=0
	ThisObj.HelpFlag={}
	
		local MAXHP=ReadRoleValue( ThisObj.MonID , EM_RoleValue_MaxHP);
	local nowHP=ReadRoleValue( ThisObj.MonID , EM_RoleValue_HP);
	
	local FolkSpider;
	if ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID)==107187 then
		FolkSpider=107188;
	else
		FolkSpider=104989;
	end
	for i=1,4,1 do	
		local flag = CreateObj( FolkSpider, Pos[i].X, Pos[i].Y, Pos[i].Z, BaseDir, 1 )	
		SetModeEx(  flag    , EM_SetModeType_Mark, false) 
		SetModeEx(  flag    , EM_SetModeType_HideName, true) 
		SetModeEx(  flag    , EM_SetModeType_ShowRoleHead, false) 
		SetModeEx(  flag    , EM_SetModeType_NotShowHPMP, true )	
	
		SetModeEx(  flag  , EM_SetModeType_Strikback, false) 
		SetModeEx(  flag  , EM_SetModeType_Searchenemy, false )
		
		SetModeEx( flag   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( flag   , EM_SetModeType_Move, false )--移動
		SetModeEx( flag   , EM_SetModeType_Show, false )--顯示
		WriteRoleValue(flag,EM_RoleValue_PID,ThisObj.MonID)
		WriteRoleValue( flag , EM_RoleValue_MaxHP,MAXHP);
		WriteRoleValue(flag , EM_RoleValue_HP,nowHP);
		
		AddToPartition( flag, BaseRoom)	
		AddBuff(flag,507914,0,-1)
		ThisObj.HelpFlag[i]=flag
		
	end

end
CZ19_WorldBoss.FireBall={}
function CZ19_WorldBoss.brun_Web(ThisObj,target)

	local count=table.getn(ThisObj.WebList);
	for i=1,count,1 do
	
		local webID=ThisObj.WebList[i];
		local web=Zone_WorldBoss[webID]
		
		if (web~=nil and web.nowState~="Battle_A2") then
			local dis=GetDistance( webID,target);
			if (dis<=50) then
				if (web.nowState~="Battle_A1") then
					FSM_DoTransion(web,"Battle_A1")
				end
				
				FSM_DoTransion(web,"Battle_A2")
			end
		end
	end
end

function CZ19_WorldBoss.CreateTarget(ThisObj,Web)

	local Org = Role:new( Web )
	local X=Org:X();
	local Y=Org:Y();
	local Z =Org:Z();
	local BaseDir=Org:Dir();
	local BaseRoom = Org:RoomID()
	local flag = CreateObj( 105137, X, Y, Z, BaseDir, 1 )


	SetModeEx(  flag    , EM_SetModeType_Mark, false) 
	SetModeEx(  flag    , EM_SetModeType_HideName, true) 
	SetModeEx(  flag    , EM_SetModeType_ShowRoleHead, false) 
	SetModeEx(  flag    , EM_SetModeType_NotShowHPMP, true )	
	SetModeEx(  flag  , EM_SetModeType_Strikback, false) 
	SetModeEx(  flag  , EM_SetModeType_Searchenemy, false )
	SetModeEx( flag   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( flag   , EM_SetModeType_Move, false )--移動

	WriteRoleValue(flag,EM_RoleValue_PID,ThisObj.MonID)
	AddToPartition( flag, BaseRoom)	
	
	return flag;
end

function CZ19_WorldBoss.FireBall.update(ThisObj)
	local WebList=CZ19_WorldBoss.SearchWeb(ThisObj)
	if (table.getn(WebList)>0) then
		local web=WebList[1]
		local dis=GetDistance( ThisObj.MonID,web );
		if (dis<500) then	
			SetHateListPoint( ThisObj.MonID , ThisObj.Attack_Target , 1 )	
			ThisObj.FireBallTarget=CZ19_WorldBoss.CreateTarget(ThisObj,web)
			Zone_WorldBoss.SayToRangePlayer(ThisObj,400, 2, "[SC_104705_2]", 0);
	
			CastSpell(  ThisObj.FireBallTarget,ThisObj.MonID,  496216 )--嘲諷
	
	
			SetAttack(ThisObj.MonID,web);
		
			CastSpell(  ThisObj.MonID,ThisObj.FireBallTarget , 496506 )--燃燒火球
			Zone_WorldBoss.Sleep(ThisObj,50)--496506，施放3秒延遲一
			CZ19_WorldBoss.brun_Web(ThisObj,ThisObj.FireBallTarget)
		else
			return
		end
	elseif(ThisObj.WebCount==2) then
		
		local targetTable=HateListRandom(ThisObj.MonID);
		--DeBugMSG(0,0,"target="..type(target))
		if (table.getn(targetTable)>0) then
		
			local target=targetTable[1]
			Zone_WorldBoss.SayToRangePlayer(ThisObj,400, 2, "[SC_104705_1]", 0);
			PlayMotion( ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN)  
			CastSpell(  ThisObj.MonID,target , 496504 )--快速結網
			Zone_WorldBoss.Sleep(ThisObj,15)
			local Org = Role:new( target )
			local X=Org:X();
			local Y=Org:Y();
			local Z =Org:Z();
			local BaseDir=Org:Dir();
			local BaseRoom = Org:RoomID()
			--DeBugMSG(0,0,"throw web"..target)
			local WebObj=CZ19_WorldBoss.throwWeb(ThisObj,X,Y,Z,BaseDir,BaseRoom)
			--FSM_DoTransion(WebObj,"Battle_A1")	
			table.insert (ThisObj.WebList,WebObj)
			ThisObj.WebCount=ThisObj.WebCount-1;
			
			return
			
		end	
	end
	
	
	return "Battle_A1";
end
----------------------------------------------------------
function CZ19_WorldBoss.FireBall.enter(ThisObj)
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, false)  
	AddBuff( ThisObj.MonID , 507899 ,0,-1)
	ThisObj.FireBallTarget=nil;
	ThisObj.WebCount=2;
	Zone_WorldBoss.PushHeteList(ThisObj)
	Zone_WorldBoss.SetHeteList(ThisObj,1)
end
----------------------------------------------------------

function CZ19_WorldBoss.FireBall.leave(ThisObj)
	SetModeEx(ThisObj.MonID , EM_SetModeType_Move, true)  
	CancelBuff( ThisObj.MonID , 507899 )
	if (ThisObj.FireBallTarget~=nil) then
		DelObj(ThisObj.FireBallTarget);
	end
	ThisObj.FireBallTarget=nil
	ThisObj.Skill[5].ok=false;
	Zone_WorldBoss.PopHeteList(ThisObj)
end

----------------------------------------------------------
CZ19_WorldBoss.HunterTime={}
----------------------------------------------------------
function CZ19_WorldBoss.HunterTime.enter(ThisObj)

	ThisObj.HunterID=0;
	if (table.getn(ThisObj.HunterTab)>0) then
		local PlayerID=ThisObj.HunterTab[1];
		if (CZ19_WorldBoss.HaveBuff(PlayerID,503091)) then
		
			AddBuff( ThisObj.MonID , 507899 ,0,-1)
			local dead=ReadRoleValue( PlayerID , EM_RoleValue_IsDead);	
			if (dead==0) then
				SetAttack( ThisObj.MonID,PlayerID);
				local Org = Role:new( PlayerID )
				local X=Org:X();
				local Y=Org:Y();
				local Z =Org:Z();
				local BaseDir=Org:Dir();
				local BaseRoom = Org:RoomID()
				Move(ThisObj.MonID,X,Y,Z)
				ThisObj.HunterID=PlayerID;
			--Zone_WorldBoss.PushHeteList(ThisObj)
			--SetHateListPoint( ThisObj.MonID , ThisObj.Attack_Target , 1 )
				CastSpell(  PlayerID,ThisObj.MonID,  496266 )
			
			--local WebObj=CZ19_WorldBoss.throwWeb(ThisObj,X,Y,Z,BaseDir,BaseRoom,10000)
			--table.insert (ThisObj.WebList,WebObj)
			end
		end
	end
end
----------------------------------------------------------
function CZ19_WorldBoss.HunterTime.update(ThisObj)

	local PlayerID=ThisObj.HunterID;
	if (PlayerID==0) then
		return "Battle_A1";
	end
	local dis2=GetDistance( PlayerID,ThisObj.Postion );
	if (ReadRoleValue( PlayerID , EM_RoleValue_IsDead)==1 or dis2>350) then
		return "Battle_A1";
	end
	Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
	local dis=GetDistance( ThisObj.MonID,PlayerID );
	if (dis<150) then	
		--CancelBuff( ThisObj.MonID , 507899 )
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
		SetAttack( ThisObj.MonID,PlayerID);
		CastSpell(  PlayerID,ThisObj.MonID,  496266 )
		--CastSpell(  ThisObj.MonID,PlayerID , 497182 )--秀
		--Zone_WorldBoss.Sleep(ThisObj,40)
		CastSpell(  ThisObj.MonID,PlayerID , 497143 )--秒殺技		
		Zone_WorldBoss.Sleep(ThisObj,25)
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , true )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )
		--DeBugMSG(0,0,"bisa="..dis.." Kill="..PlayerID)
		return "Battle_A1";
	else
		local Org = Role:new( PlayerID )
		local X=Org:X();
		local Y=Org:Y();
		local Z =Org:Z();
		Move(ThisObj.MonID,X,Y,Z)
		Zone_WorldBoss.Sleep(ThisObj,20)
		
		CastSpell(  PlayerID,ThisObj.MonID,  496266 )
		Zone_WorldBoss.Sleep(ThisObj,10)
		--DeBugMSG(0,0,"Move="..PlayerID)
	end
	
end
----------------------------------------------------------
function CZ19_WorldBoss.HunterTime.leave(ThisObj)

	--Zone_WorldBoss.PopHeteList(ThisObj)
	table.remove(ThisObj.HunterTab,1);
	ThisObj.HunterID=0;
	--[[
	local dead=ReadRoleValue( ThisObj.Attack_Target,EM_RoleValue_IsDead );
	if (dead==1) then	
		local ps,PlayerList=Lua_Zone19_SearchNearAllPlayer(ThisObj,300)
		if (ps==true) then
			ThisObj.Attack_Target=PlayerList[1];
		else
			ThisObj.Attack_Target=0;
		end
	end
	]]--
	--CastSpell(  PlayerID,ThisObj.MonID,  496216 )
	--SetAttack( ThisObj.MonID,ThisObj.Attack_Target);
	CancelBuff( ThisObj.MonID , 507899 )
	
	--DeBugMSG(0,0,"leave=")
end
-----------------------------------------------
function CZ19_WorldBoss.Create()
	local State={}
	State["IDLE"]=CZ19_WorldBoss.IdleState;--帶雞 不能帶鴨
	State["Battle_A1"]=CZ19_WorldBoss.Battle_A1;--戰鬥A1
	State["SpellWebs"]=CZ19_WorldBoss.SpellWebs;--丟15個網	
	State["HealSpider"]=CZ19_WorldBoss.HealSpider;--醫療小蜘蛛
	State["FireBall"]=CZ19_WorldBoss.FireBall;--丟火球
	--State["Poison"]=CZ19_WorldBoss.Poison;--丟毒
	State["HunterTime"]=CZ19_WorldBoss.HunterTime;--死亡
	State["SpellFires"]=CZ19_WorldBoss.SpellFires;--火焰噴射AE 目標的左右轉
	State["Battle_End"]=CZ19_WorldBoss.Battle_End;--戰鬥End	
	State["Dead"]=CZ19_WorldBoss.Dead;--死亡
	local ID=OwnerID();
	local ThisObj=FSM_Initial(ID,State);	
	ThisObj.WebList={}
	ThisObj.BodyGuard={}
	return ThisObj;
end
-----------------------------------------------
function Lua_Z19_WorldBoss_Fight()
	local ID=TargetID();
	local palyer=OwnerID();	
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
		ThisObj.Attack_Target=OwnerID();--誰觸發範圍劇情 先吃普攻
		FSM_DoTransion(ThisObj,"Battle_A1")	
	end
end
------------------------------------------------------------
function CZ19_WorldBoss.removeSpider(ThisObj,WebID)
	local count=table.getn(ThisObj.BodyGuard);
	for i=1,count,1 do	
		if (ThisObj.BodyGuard[i]==WebID) then		
			table.remove(ThisObj.BodyGuard,i);	
			return 
		end
	end
end
function CZ19_WorldBoss.removeWeb(ThisObj,WebID)
	local count=table.getn(ThisObj.WebList);
	for i=1,count,1 do	
		if (ThisObj.WebList[i]==WebID) then		
			table.remove(ThisObj.WebList,i);	
			return 
		end
	end
end
--------BOSS Dead
function Lua_Z19_WorldBoss_Dead()
	local ID =OwnerID();
	local ThisObj =Zone_WorldBoss[ID];
	ThisObj.bUpdate=false
	return true;
end
function CZ19_WorldBoss.SpiderSelectFar(ThisObj)
	local PlayerList = SearchRangePlayer ( ThisObj.MonID , 800 )
	local SortTab={};
	local ps=table.getn(PlayerList);
	for i=1 ,  ps, 1 do
		local sortUint={}
		sortUint.id=PlayerList[i-1];
		sortUint.dis=GetDistance( ThisObj.MonID,sortUint.id );
		local add=false;
		for j=1,table.getn(SortTab),1 do
			if (sortUint.dis>SortTab[j].dis) then
				table.insert (SortTab,j,sortUint)
				add=true;
				break;
			end
		end
		if (add==false) then
			table.insert (SortTab,sortUint)
		end
	end	
	local count=table.getn(ThisObj.BodyGuard);
	local n=1;
	for i=1,count,1 do	
		local MonID=ThisObj.BodyGuard[i]
		local Spider =Zone_WorldBoss[MonID];		
		local carry=true
		while carry do
			if n>table.getn(SortTab)then
				n=1
			end
			local player=SortTab[n]
			Spider.Attack_Target=player.id
			SetAttack( MonID,player.id)
			FSM_DoTransion(Spider,"Battle_A1")	
			carry=false;
			n=n+1;
		end	
	end	
end
-----------------------------------------------
function CZ19_WorldBoss.HealAllSpider(ThisObj)
	local count=table.getn(ThisObj.BodyGuard);
	for i=1,count,1 do
		AddBuff(ThisObj.BodyGuard[i],508086,0,-1)
	end
	CZ19_WorldBoss.SpiderSelectFar(ThisObj);
end
function CZ19_WorldBoss.ClearAll(ThisObj)	
	local count=table.getn(ThisObj.WebList);
	for i=1,count,1 do
		local web=Zone_WorldBoss[ThisObj.WebList[i]]
		if (web.nowState~=nil) then
			FSM_DoTransion(web,"Battle_End")		
		end
	end
	 count=table.getn(ThisObj.BodyGuard);
	for i=1,count,1 do
		local spider=Zone_WorldBoss[ThisObj.BodyGuard[i]]
		if (spider.nowState~=nil) then
			FSM_DoTransion(spider,"Battle_End")
		end
	end
end
function CZ19_WorldBoss.BrunWeb(ThisObj,playerID)
	local Count = BuffCount (playerID)
	local Web=false;
	local lev=1;
	local lev2=0;
	local time_d=-1;
	local time_a=-1;
	for j = 0 , Count do
		local BuffID = BuffInfo( playerID , j , EM_BuffInfoType_BuffID )
		if (BuffID == 508099) then
			lev2=BuffInfo(playerID , j , EM_BuffInfoType_Power)
			time_d=BuffInfo(playerID , j , EM_BuffInfoType_Time)	
		end
		if (BuffID == 508096) then
			Web=true;
			lev=BuffInfo(playerID , j , EM_BuffInfoType_Power)
			time_a=BuffInfo(playerID , j , EM_BuffInfoType_Time)
		end
	end
	if (Web==true)  then
		local t=lev+lev2
		if (t>9) then
			t=9;
		end
		local tq=time_a+time_d
		if (tq<-1) then
			tq=-1;
		end		
		if (tq>60) then
			tq=60;
		end
		CancelBuff( playerID , 508096 )
		AddBuff(playerID,508099,t,tq);
	end
end
------------------------------------------------
function Lua_Zone19_WorldBoss_BrunWeb()
	local ID =OwnerID();
	local player=TargetID();
	local web=Zone_WorldBoss[player]
	local ThisObj =Zone_WorldBoss[ID];

	if ID==player then
		return false;
	end
	if (ThisObj~=nil and ThisObj.WebList~=nil) then
		if (web~=nil) then
			local count=table.getn(ThisObj.WebList);
			local bWeb=false;
			for j = 1 , count,1 do
				local webID=ThisObj.WebList[j];
				if (webID== player) then
					bWeb=true;
				end
			end
			if (bWeb==true )then
				if (web.nowState=="Battle_A1" or web.nowState=="IDLE") then
					FSM_DoTransion(web,"Battle_A1")
					FSM_DoTransion(web,"Battle_A2")
				end
				
			end
			return;
		end
		CZ19_WorldBoss.BrunWeb(ThisObj,player)
	end
end
------------------------------------------------
function Lua_Zone19_WorldBoss_UseHeal()
	local ID =OwnerID();
	local ThisObj =Zone_WorldBoss[ID];
	CZ19_WorldBoss.HealAllSpider(ThisObj)	
end
-----------------------------------------------------------------
function Lua_Zone19_CheckPoison()
	local ID=OwnerID();
	local target=TargetID();
	local Count = BuffCount (target)
	for j = 0 , Count do
		local BuffID = BuffInfo( target , j , EM_BuffInfoType_BuffID )
		if (BuffID == 508838) then
			local lev_a=BuffInfo(target , j , EM_BuffInfoType_Power)+1
			if (lev_a>=3) then
				lev_a=3;
				local ThisObj =Zone_WorldBoss[ID];
			
				AddBuff(target,  503091 ,0,45)
				table.insert(ThisObj.HunterTab,target);
			end		
			CancelBuff(target,508838);
			AddBuff(target,508838,lev_a,40)
			return false
		end
	end	
	return true
end
function CZ19_WorldBoss_CheckGM()
	local ISGM = ReadRoleValue( TargetID(), EM_RoleValue_VOC)
	if (ISGM==0) then
		return false
	end
	return true
end
function Lua_Zone19_CheckWeb()
	local ID=OwnerID();
	local target=TargetID();
	local TargetOrg=ReadRoleValue(target,EM_RoleValue_OrgID);
	if ID==target then
		return false;
	end
	local webs =Zone_WorldBoss[target];
	if (webs~=nil) then
		return false
	end
	if (ReadRoleValue( target , EM_RoleValue_OrgID ) ==116392) then
		return false
	end
	if TargetOrg==107187 or TargetOrg==107188 or TargetOrg==107189 or TargetOrg==104705 or TargetOrg==104916 or TargetOrg==104989 then
		return false;
	end
	local ThisObj =Zone_WorldBoss[ID];
	if (ThisObj~=nil) then    
		for i=1,4,1 do 
			if (ThisObj.HelpFlag~=nil) then
				if (ThisObj.HelpFlag[i]==target) then
					return false
				end
			end
		end	
	end	
	local Count = BuffCount (target)
	for j = 0 , Count do
		local BuffID = BuffInfo( target , j , EM_BuffInfoType_BuffID )
		if (BuffID == 508085) then
			local time_a=BuffInfo(target , j , EM_BuffInfoType_Time)
			local timez=time_a+10
			if (timez>10) then
				timez=10;
			end			
			AddBuff(target,508085,0,timez)
			return false
		end
	end	
	return true
end
function Lua_Zone19_WorldBoss_Kill()
	local Boss=OwnerID();
	local ThisObj =Zone_WorldBoss[Boss];
	for Pos=0,HateListCount(Boss)-1 do
		local Player=HateListInfo(Boss,Pos , EM_HateListInfoType_GItemID)
		if CheckAcceptQuest(Player,423704)==true then
			DW_QietKillOne(Player,102312);
		end
	end
	if (ThisObj~=nil) then    	
		if (ThisObj.nowState~="Dead")then
			FSM_DoTransion(ThisObj,"Dead")
		end	
	end
	return true;
end
function Lua_Zone19_SearchNearAllPlayer( ThisObj,range1,range2)
	local aalive=false;
	local PlayerList ={}
	local Count = HateListCount(ThisObj.MonID)
	for j=1 , Count,1 do
		local ID=HateListInfo( ThisObj.MonID , j-1 , EM_HateListInfoType_GItemID )
		table.insert(PlayerList,ID)
	end	
	local tab={}
	if (table.getn(PlayerList)>0) then
		for k=1,table.getn(PlayerList),1 do
			local palyerID=PlayerList[k]
			local dis=GetDistance( ThisObj.MonID,palyerID);
			local ISGM = ReadRoleValue( palyerID, EM_RoleValue_VOC)
			if (ISGM~=0) then
				local dead=ReadRoleValue( palyerID , EM_RoleValue_IsDead);
				if (dead==0) then
					if (dis <= range1) then		-- 蝌蚪2013/03/15修改。原本完全沒用到range1，會回所有玩家guid。
						if (range2~=nil)then
							if (dis>range2) then
								table.insert (tab,palyerID);
								aalive=true;
							end
						else
							table.insert (tab,palyerID);
							aalive=true;
						end
					end
				end
			end	
		end		
	end
	return aalive,tab;
end
function Lua_Zone19_WorldBossClearAllNPC( ID,ItemID)
	local ret=LuaFunc_SearchNPCbyOrgID( ID,ItemID,1000,1)
	for i=0,table.getn(ret)-1,1 do
		DelObj(ret[i])	
	end
end
function Lua_Zone19_WorldBoss_Ctrl()
--	Debuglog(2, "Lua_Zone19_WorldBoss_Ctrl >>> " .. ReadRoleValue(OwnerID(), EM_RoleValue_OrgID) .. "pos(" .. ReadRoleValue(OwnerID(), EM_RoleValue_X) .. ", " .. ReadRoleValue(OwnerID(), EM_RoleValue_Y) .. ", " .. ReadRoleValue(OwnerID(), EM_RoleValue_Z) .. ")")
	local ID =OwnerID();

	-- 2013/3/18 蝌蚪修改：同一支GUID的蜘蛛祭司指執行一次Lua_Zone19_WorldBoss_Ctrl()
	-- BUG.1：蜘蛛祭司每次脫離戰鬥進入Battle_End狀態後沒有再回復IDLE狀態。(2013/3/18 蝌蚪修正)
	-- BUG.2：Battle_End狀態會重新把蜘蛛祭司加入Partition，這動作會觸發模板的產生劇情。(2013/3/18 蝌蚪修正)
	-- 上面兩個問題會造成循環拖拉蜘蛛祭司後，讓蜘蛛祭司並保持Battle_End狀態不會召怪和技能。
	if Zone_WorldBoss[ID] then return end

	local ThisObj =CZ19_WorldBoss.Create();	
	-- 2013/3/27 蝌蚪修改：紀錄出生點
	CZ19_WorldBoss.origin_position = {}
	CZ19_WorldBoss.origin_position.x = ReadRoleValue(ThisObj.MonID, EM_RoleValue_X)
	CZ19_WorldBoss.origin_position.y = ReadRoleValue(ThisObj.MonID, EM_RoleValue_Y)
	CZ19_WorldBoss.origin_position.z = ReadRoleValue(ThisObj.MonID, EM_RoleValue_Z)
	CZ19_WorldBoss.origin_position.dir = ReadRoleValue(ThisObj.MonID, EM_RoleValue_Dir)

	Lua_Zone19_WorldBossClearAllNPC( ID,CZ19_WorldBoss.WebID);
	Lua_Zone19_WorldBossClearAllNPC(  ID,104916);
	Lua_Zone19_WorldBossClearAllNPC( ID,104989);
	Lua_Zone19_WorldBossClearAllNPC(  ID,107188);
	Lua_Zone19_WorldBossClearAllNPC( ID,107189);
	ThisObj.SearchPlayer=CZ19_WorldBoss.SearchPlayer;
	Zone_WorldBoss[ID]=ThisObj;
	FSM_DoTransion(ThisObj,"IDLE")
	ThisObj.bUpdate=true;
	ThisObj.Skill={}
	while ThisObj.bUpdate==true	do
		--DebugMsg(0, 0, ThisObj.nowState)
		FSM_Update(ThisObj);
		sleep(5)
		MING_CooDown(ThisObj,5);
	end	
	Zone_WorldBoss[ID]=nil;
	Lua_Zone19_WorldBossClearAllNPC( ID,CZ19_WorldBoss.WebID);
	Lua_Zone19_WorldBossClearAllNPC(ID,104916);
	Lua_Zone19_WorldBossClearAllNPC( ID,104989);
	Lua_Zone19_WorldBossClearAllNPC(  ID,107188);
	Lua_Zone19_WorldBossClearAllNPC( ID,107189);
	DelObj(ID);
end

