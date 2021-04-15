--106621
local Zone24_WorldBoss_IdleState={};


local Lua_Zone24_SearchNearAllPlayer=function( ThisObj,range1,range2)
	local aalive=false;
	local PlayerList ={}
	
	local Players = SearchRangePlayer ( ThisObj.MonID , 1000 );
	local Count = table.getn(Players);
	for i=0 ,  ps-1, 1 do	
		local ID=Players[i];
		table.insert(PlayerList,ID)	
	end
	
	--local Count = HateListCount(ThisObj.MonID)
	--for j=1 , Count,1 do
	--	local ID=HateListInfo( ThisObj.MonID , j-1 , EM_HateListInfoType_GItemID )
	--	table.insert(PlayerList,ID)
	--end	
	local tab={}
	--local	ObjCampID	= GetRoleCampID(ThisObj.MonID );
	if (table.getn(PlayerList)>0) then
		for k=1,table.getn(PlayerList),1 do
			local palyerID=PlayerList[k]
			
			local dis=GetDistance( ThisObj.MonID,palyerID);
			local ISGM = ReadRoleValue( palyerID, EM_RoleValue_VOC)
			if (ISGM~=0) then
				local dead=ReadRoleValue( palyerID , EM_RoleValue_IsDead);
				if (dead==0) then
					local att=ReadRoleValue( palyerID , EM_RoleValue_IsAttackMode);
					if (att==0) then
						if (dis>range1) then				
							if (dis<range2)then
							
								table.insert (tab,palyerID);
								aalive=true;
						
							end
						end
					end
				end
			end	
		end		
	end
	return aalive,tab;
end
local Zone24_WorldBoss=
{
	
	TyphoonID=106629,
	CtrlMindID=621910,

	BuffID=621911,
	
	
	CheckBuff=function(ID,buffN)	
		local Count = BuffCount (ID)
		local bFind=false;
		for j = 0 , Count do
			local BuffID = BuffInfo( ID , j , EM_BuffInfoType_BuffID )
			
			if (BuffID == buffN) then
				--DeBugMSG(0,0,"Now CheckBuff playerID="..playerID)
				bFind=true;
				break;
			end
		end
		return bFind;
	end,
	
	
	
	
	----------------------------------------------------------------
	--計算血量
	-----------------------------------------------------------------
	CalHPPar=function(ThisObj)
		local MaxHP = ReadRoleValue( ThisObj.MonID , EM_RoleValue_MaxHP )	--讀取血量
		local NowHP = ReadRoleValue(  ThisObj.MonID , EM_RoleValue_HP )     --讀取目前血量
		local HPPercent =( NowHP / MaxHP	)*100  
		return HPPercent;
	end,
	

	ClearAllNPC =function(ID,ItemID)
		local ret=LuaFunc_SearchNPCbyOrgID( ID,ItemID,1000,1)
		for i=0,table.getn(ret)-1,1 do
			DelObj(ret[i])	
		end
	end,
	SearchPlayer=function(ThisObj)
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
			local playerID=PlayerList[i]
			local dist=GetDistance( ThisObj.MonID,playerID);
			if (dist> maxdist) then
				maxdist=dist
				AttackTarget = playerID		
			end 
		
		end
		ThisObj.Attack_Target=AttackTarget;
	end
}
--
function Zone24_WorldBoss.ClearAllMind(ThisObj)
	local PlayerList = SearchRangePlayer ( ThisObj.MonID , 1000 )
	local Count = table.getn(PlayerList);
	
	--local t1,targetTable=Lua_Zone24_SearchNearAllPlayer(ThisObj,0,1000);
	if (Count>0) then
	
		for j = 0 , Count-1,1 do		
			local palyerID=PlayerList[j];
			if (Zone24_WorldBoss.CheckBuff(palyerID,Zone24_WorldBoss.CtrlMindID)==true) then
				ResetRoleCampID( palyerID ) ;
				CancelBuff( palyerID , Zone24_WorldBoss.CtrlMindID )
			end
		
		end
	
	end
	
	
end
--
function Zone24_WorldBoss.findCtrlMind(ThisObj)
	
	local targetTable=HateListRandom(ThisObj.MonID);
	
	--DeBugMSG(0,0,"findCtrlMind targetTable="..table.getn(targetTable));
	local Count = table.getn(targetTable);
	local mcount=0;
	
	--if (Count>=4) then
		--mcount=2;
	--else
	if (Count>=2) then
		mcount=1;
	end
	local ret={};
	if (mcount>0) then
		for j = 1 , Count,1 do		
			local palyerID=targetTable[j];
			if (Zone24_WorldBoss.CheckBuff(palyerID,Zone24_WorldBoss.CtrlMindID)==false) then
				if (palyerID~=ThisObj.Attack_Target) then
					table.insert (ret,palyerID);
					if ( table.getn(ret)>=mcount) then
						break;
					end
				end
			end
		end
	
	end
	--DeBugMSG(0,0,"findCtrlMind="..table.getn(ret));
	return ret;	
end
local mindskill=
{
	job={},
	selectSkill=function(tab)
		local skillid=tab[1];	
		local rand=DW_Rand(100);		
		if (rand>50) then		
			 skillid=tab[2];				
		end	
		return skillid;
	end,
	
	
	{{skill=499077,target=1},{skill=499078,target=1}},
	{{skill=499079,target=1},{skill=499080,target=1}},
	{{skill=499081,target=1},{skill=499082,target=1}},
	{{skill=499083,target=1},{skill=499084,target=1}},
	{{skill=499085,target=2},{skill=499086,target=1}},
	{{skill=499087,target=2},{skill=499088,target=3}},
	{{skill=499089,target=2},{skill=499090,target=1}},
	{{skill=499091,target=2},{skill=499092,target=2}},
	{{skill=499093,target=2},{skill=499094,target=1}},
	{{skill=499095,target=1},{skill=499096,target=3}}	
}
function mindskill.doFunc(ThisObj,player)	


	local JobTab=mindskill[player.job];
	local skilltab=mindskill.selectSkill(JobTab);
	
	local target=nil;

	if (skilltab.target==1) then
		local ret= Zone24_WorldBoss.findCtrlMind(ThisObj);
		if (table.getn(ret)>0) then
			target=ret[1];
		end
	elseif (skilltab.target==2) then
		target=ThisObj.MonID;
	else
		target=player.playerID;
	end
	return skilltab.skill,target;
end	
function Zone24_WorldBoss.MindCtroll(ThisObj)

	local count=table.getn(ThisObj.minds);
	
	--remove
	
	
	for k,tab in pairs(ThisObj.minds) do	
		
		
		local re=false;
		if (ReadRoleValue( tab.playerID , EM_RoleValue_IsDead )==1) then
			re=true;
		end
		if (tab.count<=0) then
			re=true;			
		end
		if (Zone24_WorldBoss.CheckBuff(tab.playerID,Zone24_WorldBoss.CtrlMindID)==false) then
			re=true;			
		end
		
		if (re==true) then
			--DeBugMSG(0,0,"tab.count="..tab.count.."k="..k);
			ResetRoleCampID( tab.playerID );
			table.remove(ThisObj.minds,k);
		end
	end
	--update
	count=table.getn(ThisObj.minds);
	for j = 1 , count,1 do	
		local tab=ThisObj.minds[j];		
		tab.count=tab.count-5;
		tab.cd=tab.cd-5;
		if (tab.cd<=0) then
			tab.cd=30;
		--	DeBugMSG(0,0,"job="..tab.job);
			
			local s,t=mindskill.doFunc(ThisObj,tab);
			if (t~=nul) then
				CastSpell( tab.playerID, t, s ) --單體
				
			end
		end			
	end
end
function Zone24_ClearMindCtrl()
	local player=OwnerID();	
	--DeBugMSG(0,0,"Lua_Zone24_ClearMindCtrl player="..player);
	ResetRoleCampID( player );
	
	
	
end
----------------------------------------------------------------
function Zone24_WorldBoss.CreateTyphoon(ThisObj,count)


		local t1,t2=Lua_Zone24_SearchNearAllPlayer( ThisObj , 50,300 )
		if (t1==false) then
			return
		end
		local ps=table.getn(t2);	
		if (ps==0 ) then
			return
		end
		local face = 0
		local Dis = 80
		local OrgParent = Role:new( ThisObj.MonID )
		local Pos = {}
		local Dir = OrgParent:Dir()
	
		local Cal
		
		if (count==nil) then
			count=2
		end
		if (count>ps) then
			count=ps;
		end

		local angle=(math.pi/180)*DW_Rand(360);--(math.pi/180)*(360/count );
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
		
		
		
		
	
		for i=1,count,1 do
			local tp=t2[i];
			--DeBugMSG(0,0," CreateObj tp".. tp);
		
			Cal = angle *i;
			x=Dis*math.cos(Cal)
			z=Dis*math.sin(Cal)
			local typhoon = CreateObj( Zone24_WorldBoss.TyphoonID, Pos[i].X, Pos[i].Y, Pos[i].Z, BaseDir, 1 )
			AddToPartition( typhoon, BaseRoom)	
			--WriteRoleValue(  typhoon, EM_RoleValue_AttackTargetID ,tp) 		;
			WriteRoleValue(typhoon,EM_RoleValue_PID,ThisObj.MonID)
			WriteRoleValue(typhoon,EM_RoleValue_Register,x)
			WriteRoleValue(typhoon,EM_RoleValue_Register+1,z)
			BeginPlot(typhoon , "Lua_Zone24_Typhoon_Ctrl" , 0)		
			table.insert(ThisObj.Typhoons,typhoon)
		end
end
-----------------------------------------------
function Zone24_WorldBoss.ShootTyphoons(ThisObj)

	local count=table.getn(ThisObj.Typhoons)
	for i=1,count,1 do
		local MonID=ThisObj.Typhoons[i];
		local typhoon=Zone_WorldBoss[MonID]
		if (typhoon.nowState=="IDLE") then
			typhoon.Attack_Target=ThisObj.Attack_Target
			SetAttack( MonID,ThisObj.Attack_Target)
			FSM_DoTransion(typhoon,"Battle_A1")
			return ;
		end
	end
end
-----------------------------------------------
function Lua_Z24_WorldBoss_Fight()
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
	
	local Attackflag=ReadRoleValue( palyer   , EM_RoleValue_IsAttackMode )--無敵
	if (Attackflag==0) then
		return 
	end	

	local t=GetRoleCampID( palyer ) ;
	local s=GetRoleCampID(ID);
	--DeBugMSG(0,0,"playerID="..t .."s="..s);
	if (s==t) then
		ResetRoleCampID( palyer ) ;
	end
	local ThisObj =Zone_WorldBoss[ID];
	if (ThisObj~=nil) then	
		ThisObj.Attack_Target=palyer;--誰觸發範圍劇情 先吃普攻
		FSM_DoTransion(ThisObj,"Battle_A1")	
	end
end
----------------------------------------------------------------------
function Lua_Zone24_WorldBoss_Kill()
	local ID=OwnerID();
	local ThisObj =Zone_WorldBoss[ID];
	if (ThisObj~=nil) then    	
		if (ThisObj.nowState~="Dead")then
			FSM_DoTransion(ThisObj,"Dead")
		end	
	end
	return true;
end

--------BOSS Dead-------------------------------
function Lua_Z24_WorldBoss_Dead()
	local ID =OwnerID();
	local ThisObj =Zone_WorldBoss[ID];
	ThisObj.bUpdate=false
	return true;
end
----------------------------------------------------------------------

	function Zone24_WorldBoss_IdleState.enter(ThisObj)
		SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
		
		--DeBugMSG(0,0,"IdleState enter");
		--設100範圍劇情觸發 A1
		SetPlot( ThisObj.MonID,"Range","Lua_Z24_WorldBoss_Fight",120)
		SetPlot(ThisObj.MonID,"dead","LuaS_103580_6",0)

		SetModeEx( ThisObj.MonID   , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true  )--反擊
		SetModeEx( ThisObj.MonID   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Mark, true )--標記
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, false )--移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ThisObj.MonID   , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( ThisObj.MonID   , EM_SetModeType_HideName, true )--名稱
	end
	function Zone24_WorldBoss_IdleState.update(ThisObj)
		--DeBugMSG(0,0,"IdleState update");
		if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_IsAttackMode)==1 then
			return "Battle_A1";
		end
	end
	function Zone24_WorldBoss_IdleState.leave(ThisObj)	
		--DeBugMSG(0,0,"IdleState leave");
		--取消範圍劇情 避免重複觸發
		SetPlot( ThisObj.MonID,"Range", "" , 0 )
		--
		SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
		PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_NORMAL)
		Sleep(5);
		--播爬出動作
		Zone_WorldBoss.SayToRangePlayer(ThisObj,400, 2, "[SC_106621_0]", 0);
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
		SetModeEx( flag   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( flag   , EM_SetModeType_Move, false )--移動
		SetModeEx( flag   , EM_SetModeType_Show, false )--顯示
		AddToPartition( flag, OrgParent:RoomID())

		--維持戰鬥動作	
		--攻擊首先進入的目標	
		--開啟戰鬥
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( ThisObj.MonID   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Mark, true )--標記
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, true )--移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( ThisObj.MonID   , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( ThisObj.MonID   , EM_SetModeType_HideName, false )--名稱
	--
		ThisObj.Skill=
		{	--skill={499034,498974,499035,499036,499037,499038,499039},
			{ok=false,cd=30,count=30,skill1=499034,skill2=498974},--3秒2選1施放 單體 前方扇形AE(75)
			{ok=false,cd=70,count=70,skill=499035},--單體遠程攻擊
			{ok=false,cd=130,count=130,skill=499036},--迴旋斬
			{ok=false,cd=3000,count=3000,skill=499037},--必殺技
			{ok=false,cd=150,count=150,skill=499038},--心靈控制499038
			{ok=false,cd=150,count=150,skill=621911},--爆氣
			{ok=false,cd=3600,count=3600,skill=621912}--狂爆
		}
		ThisObj.Postion=flag
		
		ThisObj.Typhoons={};
		ThisObj.stateP=1;
	
		SetAttack(ThisObj.MonID,ThisObj.Attack_Target);
	end
	
----------------------------
local Zone24_WorldBoss_Battle_A1=
{
	enter=function(ThisObj)
	--	DeBugMSG(0,0,"Battle_A1 enter")
	end,
	leave=function(ThisObj)
	--	DeBugMSG(0,0,"Battle_A1 leave")
	end,
	update=function(ThisObj)		
		if	Zone_WorldBoss.IsExitFight(ThisObj)	then
		
			return "Battle_End";
		end	
		local dist=GetDistance(  ThisObj.MonID,ThisObj.Postion);
		if (dist>350) then
	
			return "Battle_End";
		end			
		
		ThisObj.Attack_Target= ReadRoleValue( ThisObj.MonID, EM_RoleValue_AttackTargetID ) 		;
		local tID= GetRoleCampID(ThisObj.MonID );
		
		local sID= GetRoleCampID(ThisObj.Attack_Target );
		if (tID==sID) then
			ThisObj.Attack_Target=nil;
			local t1,t2=Lua_Zone24_SearchNearAllPlayer(ThisObj,0,500);
			if (t1) then
				local count=table.getn(t2);
			
				for j = 0 , count-1,1 do		
					local palyerID=PlayerList[j];
					if (Zone24_WorldBoss.CheckBuff(palyerID,Zone24_WorldBoss.CtrlMindID)==false) then
						SetAttack(ThisObj.MonID,palyerID);
						ThisObj.Attack_Target=palyerID;
					end
		
				end
			end
			if (ThisObj.Attack_Target) then
				return "Battle_End";
			end
			
		
		end
		
		
		
		if (ThisObj.Skill[7].ok==true) then	
			local tab=ThisObj.Skill[7];
			if (Zone24_WorldBoss.CheckBuff(ThisObj.MonID,tab.skill)==false) then
			
			
				--DeBugMSG(0,0,"狂爆");
			
				AddBuff(ThisObj.MonID,tab.skill,0,-1); 
				tab.ok=false;
			end
		end		
		local HPPercent=Zone24_WorldBoss.CalHPPar(ThisObj);
		--爆氣
		if (HPPercent<20) then 
		 --//<20%hp		
			if (Zone24_WorldBoss.CheckBuff(ThisObj.MonID,Zone24_WorldBoss.BuffID)==false) then
				--DeBugMSG(0,0,"爆氣 ");
				if (ThisObj.stateP<3) then
					Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_106621_22]",0)
					ThisObj.stateP=3;
				end
				AddBuff(ThisObj.MonID,Zone24_WorldBoss.BuffID,0,-1); --施放爆氣
			end			
		end		
		
		--	DeBugMSG(0,0,"MindCtrl ");
		
		if(HPPercent<60) then --//2 60%hp		
		
			if (ThisObj.Skill[5].ok==true) then		
				local tab=ThisObj.Skill[5];
				tab.ok=false;
				
				if (ThisObj.stateP<2) then
					Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_106621_21]",0)
					ThisObj.stateP=2;
				end
				return "Battle_A3";
			end		
		end
		
	
		if (ThisObj.Skill[4].ok==true) then	--必殺技
			local tab=ThisObj.Skill[4];
			
	
			tab.ok=false;
			return "Battle_A2";
		end
		
		
		if (ThisObj.Skill[2].ok==true) then	--單體遠程攻擊
		
			local tab=ThisObj.Skill[2];
			tab.ok=false;
			
			return "Skill3"
		
		end
		if (ThisObj.Skill[3].ok==true) then	--迴旋斬
			local t1,t2=Lua_Zone24_SearchNearAllPlayer(ThisObj,50,300);
			if (t1) then
				ThisObj.Skill[4].ok=true;

			
				local tab=ThisObj.Skill[3];
				tab.ok=false;
				return "Skill4"
			end
		end
	
					
		
		
	
	
		
		if (ThisObj.Skill[1].ok==true) then	
			--3秒2選1施放
			
			local tab=ThisObj.Skill[1];
			tab.ok=false;
			
			local rand=DW_Rand(100);
			if (rand>50) then				
				
				local dist=GetDistance(  ThisObj.MonID,ThisObj.Attack_Target);
				if (dist<50 ) then
					return "Skill1"
				end
			else		
				return "Skill2"
			end		
		end
		
	end,


}
local Zone24_WorldBoss_Skill1=
{
	enter=function(ThisObj)
		AddBuff(ThisObj.MonID,507899,0,-1);	
		
	end,
	leave=function(ThisObj)
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , true )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊
		CancelBuff( ThisObj.MonID , 507899 )
	end,
	update=function(ThisObj)
		
		
			PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CHANNEL_BEGIN)  
			SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
			SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
		
			--DeBugMSG(0,0,"單體=".. ThisObj.Skill[1].skill1);
			CastSpell( ThisObj.MonID, ThisObj.Attack_Target, ThisObj.Skill[1].skill1  ) --單體
			Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_106621_2]",0)
			Sleep(10);
	
	
		return "Battle_A1";
	end,


}
local Zone24_WorldBoss_Skill2=
{
	enter=function(ThisObj)
		AddBuff(ThisObj.MonID,507899,0,-1);	
		PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_BUFF_SP01)  
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
		
		--DeBugMSG(0,0,"前方扇形AE".. ThisObj.Skill[1].skill2);
		CastSpell( ThisObj.MonID, ThisObj.Attack_Target, ThisObj.Skill[1].skill2  ) --單體
		Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_106621_1]",0)
	end,
	leave=function(ThisObj)
	
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , true )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊
		CancelBuff( ThisObj.MonID , 507899 )
	end,
	update=function(ThisObj)
	
		PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_LOOP)  
		Sleep(10);
	
		return "Battle_A1";
	end,


}
local Zone24_WorldBoss_Skill3=
{
	enter=function(ThisObj)
	
	
		AddBuff(ThisObj.MonID,507899,0,-1);	
		local targetTable=HateListRandom(ThisObj.MonID);
			
		if (table.getn(targetTable)>0) then
		
			local target=targetTable[1]
			
		--	Yell(target,"[SC_106621_3]",5);
			PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_BUFF_SP02)  
			--DeBugMSG(0,0,"單體遠程攻擊");
			SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
			SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
			CastSpell( ThisObj.MonID,target, ThisObj.Skill[2].skill  ) --單體
			--Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_106621_3]",0)
			ScriptMessage(ThisObj.MonID,target,2,"[SC_106621_3]",0);
		end
		
		
	end,
	leave=function(ThisObj)
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , true )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊
		
		CancelBuff( ThisObj.MonID , 507899 )
	end,
	update=function(ThisObj)
		Sleep(10);
		return "Battle_A1";
	end,


}
local Zone24_WorldBoss_Skill4=
{
	enter=function(ThisObj)
		Zone24_WorldBoss.ClearAllNPC( ThisObj.MonID,Zone24_WorldBoss.TyphoonID);
		AddBuff(ThisObj.MonID,507899,0,-1);	
		PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_BUFF_SP03)  
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
		CastSpell( ThisObj.MonID, ThisObj.Attack_Target, ThisObj.Skill[3].skill  ) --單體
		Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_106621_4]",0)
		--DeBugMSG(0,0,"迴旋斬");
	end,
	leave=function(ThisObj)
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , true )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊
		CancelBuff( ThisObj.MonID , 507899 )
	end,
	update=function(ThisObj)	
	--DeBugMSG(0,0,"迴旋斬");
	
		Zone24_WorldBoss.CreateTyphoon(ThisObj,2);
		Sleep(10);
		return "Battle_A1";
	end,


}

--------------------------------------------
local Zone24_WorldBoss_Battle_A2=
{
	enter=function(ThisObj)
	
		ThisObj.breakCast=0;
		PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN)  
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
		AddBuff(ThisObj.MonID,507899,0,-1);	
		
		Zone_WorldBoss.SayToHateList(ThisObj,2,"[SC_106621_4]",0)
		
	end,
	leave=function(ThisObj)
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , true )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊
		CancelBuff( ThisObj.MonID , 507899 )
	end,
	update=function(ThisObj)
		--Sleep(20)
		--PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_LOOP)  
		
		--Sleep(40)
		--PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_END)  
		--DeBugMSG(0,0,"必殺技");
		
		
		
		CastSpell( ThisObj.MonID, ThisObj.Attack_Target, ThisObj.Skill[4].skill  ) --單體
		return "Battle_A1";
	end,


}
--------------------------------------------
local Zone24_WorldBoss_Battle_A3=
{
	enter=function(ThisObj)
		
		
		AddBuff(ThisObj.MonID,507899,0,-1);	
	end,
	leave=function(ThisObj)
		SetModeEx( ThisObj.MonID , EM_SetModeType_Move , true )--不要移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, true )--反擊
		CancelBuff( ThisObj.MonID , 507899 )
	end,
	update=function(ThisObj)
		PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_BEGIN)  
		local playerList=Zone24_WorldBoss.findCtrlMind(ThisObj);
		local Count = table.getn(playerList);
		
		local	ObjCampID	= GetRoleCampID(ThisObj.MonID );
		for j=1,Count,1 do 				
		
				local playID=playerList[j];
				SetRoleCampID(playID, ObjCampID );
				
			--	Yell(playID,"[SC_106621_5]",5);
				--CastSpell( ThisObj.MonID, playID, ThisObj.Skill[5].skill ) --心靈控制 
				AddBuff(playID, 621910,0,-1); --心靈控制 
				--DeBugMSG(0,0,"心靈控制 "..playID);
				ScriptMessage( ThisObj.MonID, playID, 2, "[SC_106621_6]", 0 )
				local tab={};
				tab.playerID=playID;
				tab.job=ReadRoleValue(playID,EM_RoleValue_VOC);
				tab.count=50;
				tab.cd=0;
				
				table.insert(ThisObj.minds,tab);
		end
		--Sleep(30)
		PlayMotion(ThisObj.MonID , ruFUSION_ACTORSTATE_CAST_LOOP)  
		--Sleep(10)
		return "Battle_A1";
	end,
}

--------------------------------------------
local Zone24_WorldBoss_Battle_End=
{
	enter=function(ThisObj)
		Zone24_WorldBoss.ClearAllMind(ThisObj);
		--DeBugMSG(0,0,"Battle_End enter")
		DelFromPartition( ThisObj.MonID )	
		Sleep(30);
		ReSetNPCInfo( ThisObj.MonID ) 	-- 重設NPC資料	
		Sleep(30);
		AddToPartition( ThisObj.MonID, 0 ) 	-- 重新加入分割區
		
	end,
	


}

--------------------------------------------
local Zone24_WorldBoss_Dead=
{
	enter=function(ThisObj)
		ThisObj.bUpdate=false;
	end,
}
-----------------------------------------------------
function Zone24_WorldBoss.Create()
		local State={};
		State["IDLE"]=Zone24_WorldBoss_IdleState;
		State["Battle_A1"]=Zone24_WorldBoss_Battle_A1;
		State["Battle_A2"]=Zone24_WorldBoss_Battle_A2;
		State["Battle_A3"]=Zone24_WorldBoss_Battle_A3;
		State["Battle_End"]=Zone24_WorldBoss_Battle_End;
		State["Skill1"]=Zone24_WorldBoss_Skill1;
		State["Skill2"]=Zone24_WorldBoss_Skill2;
		State["Skill3"]=Zone24_WorldBoss_Skill3;
		State["Skill4"]=Zone24_WorldBoss_Skill4;
		--State["Skill5"]=Zone24_WorldBoss_Skill5;
		
		
		State["Dead"]=Zone24_WorldBoss_Dead;
		local ID=OwnerID();
		local ThisObj=FSM_Initial(ID,State);
		ThisObj.minds={};
		ThisObj.breakCast=0;
		--DeBugMSG(0,0,"Create Boss");
		return ThisObj;	
end
----------------------------------------------------
function Lua_Zone24_WorldBoss_CastSkill()
	--DeBugMSG(0,0,"Lua_Zone24_WorldBoss_CastSkill")
	local ID=OwnerID();
	local ThisObj =Zone_WorldBoss[ID];
	if (ThisObj~=nil) then    
		if (ThisObj.breakCast>0) then
		
		
		local maxHP=ReadRoleValue( ThisObj.MonID , EM_RoleValue_MaxHP)*0.01;
		local nowHP=ReadRoleValue( ThisObj.MonID , EM_RoleValue_HP);
		
		if (ThisObj.stateP==3) then
			maxHP= maxHP*2;
		end
		if (nowHP<maxHP) then
			maxHP=nowHP;
		end
		WriteRoleValue(ThisObj.MonID  , EM_RoleValue_HP,nowHP-maxHP);
		
		--DeBugMSG(0,0,"中斷必殺技");
			ThisObj.breakCast=0;
			return false;
		end
	end
   return true;
end
	--
	
-----------------------------------------------------------------------------------
local Z24_Typhoon_IdleState=
{
	
	
	
	update=function(ThisObj)
		return "Battle_A1";
	end
	
	
	
}
local Z24_Typhoon_Battle_A1={}

function Z24_Typhoon_Battle_A1.enter(ThisObj)

	--DeBugMSG(0,0,"Z24_Typhoon_Battle_A1 enter")
	CastSpell(  ThisObj.Attack_Target,ThisObj.MonID,  496266 )--嘲諷
	SetAttack(ThisObj.MonID,ThisObj.Attack_Target);
	
end



local  Z24_Typhoon_Battle_End={}
function Z24_Typhoon_Battle_End.update(ThisObj)

	ThisObj.bUpdate=false;
end


local Z24_Typhoon_Dead={}
function Z24_Typhoon_Dead.enter(ThisObj)
	ThisObj.bUpdate=false;
end

local Z24_Typhoon=
{
	Create=function()
		local State={}
		State["IDLE"]= Z24_Typhoon_IdleState;
		State["Battle_A1"]= Z24_Typhoon_Battle_A1;
	
		State["Battle_End"]= Z24_Typhoon_Battle_End;
		State["Dead"]= Z24_Typhoon_Dead;
		local ID=OwnerID();
		local ThisObj=FSM_Initial(ID,State);
		return ThisObj;
	
	end,
	---------------------------------------------------
	SearchPlayer=function(ThisObj)
		
		local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
		local AttackTarget= 0;
		local MonterObj =Zone_WorldBoss[Monter];	
		local t1,t2=Lua_Zone24_SearchNearAllPlayer(MonterObj,50,300);
		if (t1) then
			AttackTarget=t2[1];
		end
	
	
		ThisObj.Attack_Target=AttackTarget;
		 WriteRoleValue(  ThisObj.MonID, EM_RoleValue_AttackTargetID ,ThisObj.Attack_Target) 		
	end,
	
	
}
	function Z24_Typhoon_IdleState.enter(ThisObj)
	
		Z24_Typhoon.SelectTarget(ThisObj);
		
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Move, true )--移動
		SetModeEx( ThisObj.MonID   , EM_SetModeType_Searchenemy, false )--索敵
		AddBuff(ThisObj.MonID,507899,0,-1);	
		--AddBuff(ThisObj.MonID,621908,0,-1);	
		--ThisObj.Attack_Target= ReadRoleValue( ThisObj.MonID, EM_RoleValue_AttackTargetID ) 		
		
		--DeBugMSG(0,0,"Z24_Typhoon_IdleState enter"..ThisObj.Attack_Target)
	end
---------------------------------------------------

---------------------------------------------------
function Z24_Typhoon.SelectTarget(ThisObj)
	local target=ThisObj.Attack_Target;
	if (target) then		
		local dead=ReadRoleValue( target , EM_RoleValue_IsDead);
		if (dead==0) then
			return false;
		end
		target=HateTargetID();
		ThisObj.Attack_Target=target
		 WriteRoleValue(  ThisObj.MonID, EM_RoleValue_AttackTargetID ,target) 	
	end
	
	if (target==nil) then
		Z24_Typhoon.SearchPlayer(ThisObj);
	end
	
	if (ThisObj.Attack_Target==0) then
		return false;
	end
	return true;
end
function Z24_Typhoon.HaveMon(ThisObj)
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local MonterObj =Zone_WorldBoss[Monter];
	if (MonterObj~=nil) then
		return true;
	end
	return false;
end
function Z24_Typhoon.findTarget(ThisObj)
	--DeBugMSG(0,0,"Boom")
	
	
	local dist=GetDistance(  ThisObj.MonID,Zone24_WorldBoss.BossObj.MonID);
	if (dist<50) then
	
		return true;
		
	end
	
	local t1,t2=Lua_Zone24_SearchNearAllPlayer(ThisObj,0,30);
	if (t1==true) then	
		return true;
		--DeBugMSG(0,0,"Boom")
	end
	return false;
end
--------------------------------------------------
function Z24_Typhoon_Battle_A1.leave(ThisObj)
	SetModeEx( ThisObj.MonID , EM_SetModeType_Move , false )--不要移動
	SetModeEx( ThisObj.MonID   , EM_SetModeType_Strikback, false )--反擊
	CastSpell(ThisObj.MonID,ThisObj.MonID,499058);				
	local dist=GetDistance(  ThisObj.MonID,Zone24_WorldBoss.BossObj.MonID);
	if (dist<50) then
		local d=KS_FrontOrBack(Zone24_WorldBoss.BossObj.MonID, ThisObj.MonID);
		--DeBugMSG(0,0,"d="..d)
		if (d< 0) then
			Zone24_WorldBoss.BossObj.breakCast=Zone24_WorldBoss.BossObj.breakCast+1;
		end
	end
end
function Z24_Typhoon_Battle_A1.update(ThisObj)

--	DeBugMSG(0,0,"Z24_Typhoon_Battle_A1 update")
	if (Z24_Typhoon.HaveMon(ThisObj)==false) then
		return "Battle_End";
	end	
	--DeBugMSG(0,0,"Z24_Typhoon_Battle_A1 update1")
	
	--DeBugMSG(0,0,"Z24_Typhoon_Battle_A1 update2")
	if (Z24_Typhoon. SelectTarget(ThisObj)) then
		return "Battle_End";
	end
--	DeBugMSG(0,0,"Z24_Typhoon_Battle_A1 update3")
	local Org = Role:new(  ThisObj.Attack_Target )	
	Move(ThisObj.MonID,Org:X(),Org:Y(),Org:Z())
	
	if (Z24_Typhoon.findTarget(ThisObj)) then
	 
	 	
		--DeBugMSG(0,0,"Boom")
		return "Battle_End";
	
	end
	
end
	
-----------------------------------------------------
function Lua_Zone24_Typhoon_Kill()
	local ID=OwnerID();
	local ThisObj =Zone_WorldBoss[ID];
	if (ThisObj~=nil) then    
		FSM_DoTransion(ThisObj,"Dead")
		local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
		local MonterObj =Zone_WorldBoss[Monter];
		if (MonterObj~=nil) then
			Zone24_WorldBoss.removeTyphoon(MonterObj,ID)
		end
	end	
	Zone_WorldBoss[ID]=nil;
	DelObj(ID);
	return true
end

------------------------------------------------------------
function Zone24_WorldBoss.removeTyphoon(ThisObj,tID)
	local count=table.getn(ThisObj.typhoons);
	for i=1,count,1 do	
		if (ThisObj.typhoons[i]==tID) then		
			table.remove(ThisObj.typhoons,i);	
			return 
		end
	end
end

-------------------------------------------------
function Lua_Zone24_Typhoon_Ctrl()
	local ID =OwnerID();
	local ThisObj =Z24_Typhoon.Create();	
	Zone_WorldBoss[ID]=ThisObj;
	ThisObj.SearchPlayer=Z24_Typhoon.SearchPlayer;
	FSM_DoTransion(ThisObj,"IDLE")

	ThisObj.bUpdate=true;
	while ThisObj.bUpdate==true	do 
		FSM_Update(ThisObj);
		sleep(5)
	end	
	local Monter= ReadRoleValue(ThisObj.MonID ,EM_RoleValue_PID)
	local MonterObj =Zone_WorldBoss[Monter];	
	if (MonterObj~=nil) then
		Zone24_WorldBoss.removeTyphoon(MonterObj,ID)
	end	
	Zone_WorldBoss[ID]=nil;
	DelObj(ID);
end
--
function Lua_Zone24_WorldBoss_Ctrl()

	local ID =OwnerID();
	local ThisObj =Zone24_WorldBoss.Create();	
	Zone24_WorldBoss.BossObj=ThisObj;
	Zone24_WorldBoss.ClearAllNPC( ID,Zone24_WorldBoss.TyphoonID);
	ThisObj.SearchPlayer=Zone24_WorldBoss.SearchPlayer;
	Zone_WorldBoss[ID]=ThisObj;
	FSM_DoTransion(ThisObj,"IDLE")
	ThisObj.bUpdate=true;
		ThisObj.Skill={}
	while ThisObj.bUpdate==true	do 
		Zone24_WorldBoss.MindCtroll(ThisObj);
		FSM_Update(ThisObj);
		sleep(5)
		MING_CooDown(ThisObj,5);
	end	
	Zone24_WorldBoss.ClearAllMind(ThisObj);
	Zone_WorldBoss[ID]=nil;
	Zone24_WorldBoss.ClearAllNPC( ID,Zone24_WorldBoss.TyphoonID);
	
	DelObj(ID);
end