function GEM_XMAS2012_Q1_ClickCheck()	--任務:溫泉挖掘計畫，點擊(物件)前事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local Dig = 0
	local Flag = 0
	if CheckAcceptQuest(player,425787)==true and CountBodyItem(player,242041)>0 then
		Dig = Dig + 1
	end 
	if CheckAcceptQuest(player,425787)==true and CheckFlag(player,547286)==false  then
		Flag = Flag + 1
	end
	if Dig~=0 and Flag~=0 then
		return true
	elseif Dig==0 then
		ScriptMessage(player,player,1,"[NO_ITEM][$SETVAR1=".."[".."242041".."]".."]",0)	--你沒有特製十字鎬！
		return false
	elseif Flag==0 then
		ScriptMessage(player,player,0,"[GEM_XMAS2012_Q1_2]",0)				--已經不需要再挖掘！
		return false
	end
end

function GEM_XMAS2012_Q1_Click()		--任務:溫泉挖掘計畫，點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local hotspring = 121620  --溫泉編號
	local NpcPid = ReadRoleValue(npc,EM_RoleValue_PID)
	local Randrate = 0
	local WaterPool = 0
	Randrate=DW_RAND(100)
		if NpcPid==1 then
			if Randrate%10 <=3 then
				ScriptMessage(player,player,2,"[GEM_XMAS2012_Q1_1]",0)
				SetFlag(player,547286,1)	
				WaterPool = Lua_DW_CreateObj("obj",hotspring,NPC)
				CastSpell(WaterPool,WaterPool,850490)
				CallPlot(WaterPool,"GEM_XMAS2012_Q1_POOL",WaterPool)
			else
				CastSpell(npc,player,850491)
				ScriptMessage(player,player,1,"[GEM_XMAS2012_COLDWIND]",0)
				AddBuff(player,504458,1,-1)
			end
		elseif NpcPid==2 then
			if Randrate%10 <=5 then
				ScriptMessage(player,player,2,"[GEM_XMAS2012_Q1_1]",0)
				SetFlag(player,547286,1)	
				WaterPool = Lua_DW_CreateObj("obj",hotspring,NPC)
				CastSpell(WaterPool,WaterPool,850490)
				CallPlot(WaterPool,"GEM_XMAS2012_Q1_POOL",WaterPool)
			else
				CastSpell(npc,player,850491)
				ScriptMessage(player,player,1,"[GEM_XMAS2012_COLDWIND]",0)
				AddBuff(player,504458,1,-1)
			end			
		elseif NpcPid==3 then
			if Randrate%10 <=7 then
				ScriptMessage(player,player,2,"[GEM_XMAS2012_Q1_1]",0)
				SetFlag(player,547286,1)	
				WaterPool = Lua_DW_CreateObj("obj",hotspring,NPC)
				CastSpell(WaterPool,WaterPool,850490)
				CallPlot(WaterPool,"GEM_XMAS2012_Q1_POOL",WaterPool)
			else
				CastSpell(npc,player,850491)
				ScriptMessage(player,player,1,"[GEM_XMAS2012_COLDWIND]",0)
				AddBuff(player,504458,1,-1)
			end	
		end
			return true
end

function GEM_XMAS2012_POOL_SET()	--溫泉物件設定
	local Npc = OwnerID()
	AddBuff(Npc,507088,0,-1)
end

function GEM_XMAS2012_Q1_POOL(obj)	--5分鐘後刪除溫泉
	local waitime = 3000
	Sleep(waitime)
	DelObj(obj)
end

function GEM_XMAS2012_Q2_ClickCheck()	--任務:書上的美味，點擊(物件)前事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local emptybucket = 241658
	if CountBodyItem(player,242042)>0 and 
	 CheckAcceptQuest(player,425788)==true then
		return true
	else
		ScriptMessage(player,player,1,"[NO_ITEM][$SETVAR1=".."[".."242042".."]".."]",0)	--你沒有一帶雞蛋！
		ScriptMessage(player,player,0,"[SYS_GAMEMSGEVENT_422]",0)			--使用條件不符！
		return false
	end
end

function GEM_XMAS2012_Q2_Click()		--任務:書上的美味，點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local bagofeggs = 242042
	DelBodyItem(player,bagofeggs,1)
	return true
end

function GEM_XMAS2012_Q2_Eggs()
	local feelcold = 504458 --寒氣逼人
	local player = OwnerID()
	local TBuffPos 
	local TBuffInfo
	TBuffPos = Lua_BuffPosSearch(Player,feelcold)
	TBuffInfo = BuffInfo( Player , TBuffPos , EM_BuffInfoType_Power )
	if TBuffInfo>=5 then
		AddBuff(player,feelcold,-5,-1)		
	else
		CancelBuff(player,feelcold)
	end
end

function GEM_XMAS2012_Q1_finish()		--任務:溫泉挖掘計畫
	local player = TargetID()
	SetFlag(player,547283,0)
	SetFlag(player,547284,1)
	SetFlag( player, 547334, 1 )	--FN添加的全勤獎判斷旗標
 	DesignLog( Player , 121616 , "complete" )
end

function GEM_XMAS2012_Q2_finish()		--任務:書上的美味
	local player = TargetID()
	SetFlag(player,547284,0)
	SetFlag( player, 547335, 1 )	--FN添加的全勤獎判斷旗標
 	DesignLog( Player , 121617 , "complete" )
end