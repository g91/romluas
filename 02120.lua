Zone_WorldBoss={}

------------------------------------------------------------------------

function Zone_WorldBoss.Sleep(ThisObj,timeX)
sleep(timeX);
MING_CooDown(ThisObj,timeX);

end
------------------------------------------------------------------------

function Zone_WorldBoss.SearchRangeAlive(ThisObj,range)

	local AttackTarget=0--ThisObj.Attack_Target
	ThisObj.Attack_Target=0;
	local PlayerList = SearchRangePlayer ( ThisObj.MonID ,range )
	local count=table.getn(PlayerList);
	local alive={}
	for i=0 ,  count-1, 1 do
		local palyer=PlayerList[i];
		local dead=ReadRoleValue( palyer , EM_RoleValue_IsDead);
		if (dead<1) then
			table.insert(alive,palyer);		
		end
	end
	
	local count=table.getn(alive);
	--DeBugMSG(0,0,"SearchRangeAlive count="..count)
	
	if (count>0) then
	
		AttackTarget=alive[DW_RAND(count)];
	
		
	end
	ThisObj.Attack_Target=AttackTarget;
	--DeBugMSG(0,0,"SearchRangeAlive="..AttackTarget)
--	WriteRoleValue( ThisObj.MonID , EM_RoleValue_AttackTargetID,AttackTarget  )
	
end
------------------------------------------------------------------------
function Zone_WorldBoss.SayToRangePlayer(ThisObj,range,msg_type,MSG,Color)
	local PlayerList = SearchRangePlayer(ThisObj.MonID ,range)
	local count=table.getn(PlayerList);
	local alive={}
	for i=0 ,  count-1, 1 do
		local palyer=PlayerList[i];
		local dead=ReadRoleValue( palyer , EM_RoleValue_IsDead);
		if (dead<1) then
			table.insert(alive,palyer);		
		end
	end
	local count=table.getn(alive);
	for j=1 , Count,1 do
		
		ScriptMessage( ThisObj.MonID,alive[j], msg_type, MSG, Color )
	end
end
------------------------------------------------------------------------
function Zone_WorldBoss.SayToHateList(ThisObj,msg_type,MSG,Color)
	local Count = HateListCount(ThisObj.MonID)
	
	for j=1 , Count,1 do
		local ID=HateListInfo( ThisObj.MonID , j-1 , EM_HateListInfoType_GItemID )
		ScriptMessage( ThisObj.MonID, ID, msg_type, MSG, Color )
	end
end
--------------------------------------------------------------------
function Zone_WorldBoss.debug()

	local count=0;
	for index, value in pairs(Zone_WorldBoss) do
		if (type(index)=="number") then
			count=count+1
		end
		
	end
	DeBugMSG(0,0,"Obj count="..count)
end
----------------------------------------------------------------
function Zone_WorldBoss.PushHeteList(ThisObj)
	local Count = HateListCount(ThisObj.MonID)
	--DeBugMSG(0,0,"PushHeteList="..ThisObj.MonID)
	
	local HateList={}
	for j=0 , Count-1 do
		local tab={}
		local ID=HateListInfo( ThisObj.MonID , j , EM_HateListInfoType_GItemID )
		local HateValue1 = HateListInfo( ThisObj.MonID , j , EM_HateListInfoType_HatePoint)
		tab.ID=ID;
		tab.HateValue1=HateValue1;
		table.insert(HateList,tab)
	--	DeBugMSG(0,0,"ID="..ID..",Hate="..HateValue1)
	end
	ThisObj.HateList=HateList;

end
----------------------------------------------------------------
function Zone_WorldBoss.SetHeteList(ThisObj,value)
	local Count = HateListCount(ThisObj.MonID)
	
	for j=0 , Count-1 do
		local ID=HateListInfo( ThisObj.MonID , j , EM_HateListInfoType_GItemID )
	--	DeBugMSG(0,0,"ID="..ID)
		SetHateListPoint( ThisObj.MonID , ID , value )	
	end
	
end
----------------------------------------------------------------
function Zone_WorldBoss.PopHeteList(ThisObj)

	local HateList=ThisObj.HateList;
	for j=1 ,table.getn(HateList,tab),1 do
		local tab=HateList[j];
		SetHateListPoint( ThisObj.MonID , tab.ID , tab.HateValue1 )	
	
	end

end
----------------------------------------------------------------
--戰鬥中?
-----------------------------------------------------------------
function Zone_WorldBoss.IsExitFight(ThisObj)
	--DeBugMSG(0,0,"Now I'm IsExitFight 1")
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_IsAttackMode)==0	or
		HateListCount( ThisObj.MonID)==0				then
		--DeBugMSG(0,0,"Now I'm IsExitFight true")
		return true
	else
		local Target = ReadRoleValue(ThisObj.MonID,EM_RoleValue_AttackTargetID)
		--DeBugMSG(0,0,"Now I'm IsExitFight "..Target)
		local dead=ReadRoleValue( Target , EM_RoleValue_IsDead);
		if (dead>0) then
			ThisObj.SearchPlayer(ThisObj)
			if (ThisObj.Attack_Target==nil) then
			--DeBugMSG(0,0,"Now I'm IsExitFight true")
			
				return true
			end
		end
		
	end
	--DeBugMSG(0,0,"Now I'm IsExitFight false")
	return false
end
--------------------------------------------------------------
function Zone_WorldBoss.SearchPlayerBuff(ThisObj,Buff)

	

	
	local PlayerListX=SearchRangePlayer(ThisObj.MonID,1000)
	--DebugMsg( 0, 0,"PlayerList 2")
	--DebugMsg( 0, 0,"PlayerList = "..table.getn(PlayerListX))
	local ps=table.getn(PlayerListX);
	
	
	local BuffOK={}
	if (ps==0 ) then
		return BuffOK
	end
	
	
	local haveBuffs=0;
	for i=0 ,  ps-1, 1 do
		--DeBugMSG(0,0,"i="..i)
	    local playerID= PlayerListX[i]
		local Count = BuffCount (playerID)
		--DeBugMSG(0,0,"Now Count="..Count.."playerID="..playerID)
		for j = 0 , Count do
			local BuffID = BuffInfo( playerID , j , EM_BuffInfoType_BuffID )
			--DeBugMSG(0,0,"Now ISearchBlood "..BuffID)
			if (BuffID == Buff) then
				haveBuffs=haveBuffs+1
				BuffOK[haveBuffs]= playerID				
				--DebugMsg( 0, 0,"BuffOK = true"..playerID)
			end
		end
	end
	--DebugMsg( 0, 0,"BuffOK = true"..playerID)
	
	return BuffOK;

end
----------------------------------------------------------------
--選擇目標
-------------------------------------------------------------------
function Zone_WorldBoss.SelectTarget(ThisObj)

	local target=ThisObj.Attack_Target;
	--DeBugMSG(0,0,"Now I'm SelectTarget "..target)
	if (target) then
		
		local dead=ReadRoleValue( target , EM_RoleValue_IsDead);
		if (dead>0) then
			
			--	DeBugMSG(0,0,"Now I'm SelectTarget dead"..target)
				target=HateTargetID();
				if (target==nil) then
					ThisObj.SearchPlayer(ThisObj)
					target=ThisObj.Attack_Target
				end
			
		else
			return
		end	
	end
	--DeBugMSG(0,0,"Now I'm Lua_Z18_WorldBoss_Fight "..target)
	ThisObj.Attack_Target=target;
end