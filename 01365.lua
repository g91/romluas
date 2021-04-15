
--種個樹

function LuaS_422274_0()
	local ID
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 112861	then -- 是否為聖土(為了填兩個模版物件所加入的判斷)
		if	CountBodyItem(OwnerID(),204608) < 1	then
			ID = 204608
			local name = "["..ID.."]"
			local Str = "[SC_SYS_0][$SETVAR1="..name.."]"	
			ScriptMessage( OwnerID(), OwnerID(), 1, Str , 0 );	
			return 1
		end
		if	CountBodyItem(OwnerID(),204609) < 1	then
			ID = 204609
			local name = "["..ID.."]"
			local Str = "[SC_SYS_0][$SETVAR1="..name.."]"	
			ScriptMessage( OwnerID(), OwnerID(), 1, Str , 0 );	
			return 1
		end
		BeginPlot(TargetID(),"LuaS_422274_1",0)
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 112872	then 
		DelObj(TargetID())
	end
	return 1
end

function LuaS_422274_1()
	DisableQuest( OwnerID() , true ) --鎖起來
	local Master = TargetID()  --記玩家ID
	local YoungTree = Lua_DW_CreateObj("obj", 112871 , OwnerID()) 
	local Sec = 0
	for i=1,6 do -- 檢查六次
		sleep(20)
		--怕玩家掛了或跑掉
		if	not CheckID(Master)	or
			ReadRoleValue(Master,EM_RoleValue_IsDead) == 1	then
			DelObj(YoungTree)
			DisableQuest( OwnerID() , false )
			return				
		end
		-- 十分之一機率
		if	DW_Rand(100) < 10	then
			ScriptMessage( Master,Master, 1, "[SC_422274_0]", 0 ); -- 給玩家訊息
			i=1 -- 重來六次
			Hide(YoungTree)
			local BadTree = Lua_DW_CreateObj("obj", 112862 , OwnerID())
			SetPlot(BadTree,"touch","LuaS_422274_2",50) -- 給枯樹觸碰澆水的劇情
			while ReadRoleValue(BadTree,EM_RoleValue_PID) < 1 do  --如果沒人碰
				sleep(20)
				--怕玩家掛了或跑掉
				if	not CheckID(Master)	or
					ReadRoleValue(Master,EM_RoleValue_IsDead) == 1	then
					DelObj(BadTree)
					DelObj(YoungTree)
					DisableQuest( OwnerID() , false )
					return				
				end
				Sec = Sec + 1
				if	Sec > 5	then--超過五秒重來
					Sec = 0
					DelObj(BadTree)
					DelObj(YoungTree)
					ScriptMessage( Master,Master, 1, "[SC_422274_1]", 0 );-- 給玩家失敗訊息
					ScriptMessage( Master,Master, 0, "[SC_422274_1]", 0 );-- 給玩家失敗訊息
					DisableQuest( OwnerID() , false )
					return
				end
			end
			--有澆到水
			DelObj(BadTree)
			Show(YoungTree,0)
		end
	end
	--通過六次
	DelObj(YoungTree)
	local GoodTree = Lua_DW_CreateObj("obj",112872,OwnerID()) -- 建個靚樹
	CallPlot(GoodTree,"LuaS_422274_3",Master) -- 10秒後自毀
	ScriptMessage( Master,Master, 1, "[SC_422274_2]", 0 )
	ScriptMessage( Master,Master, 0, "[SC_422274_2]", 0 )
	DisableQuest( OwnerID() , false )

end

function LuaS_422274_2()
	WriteRoleValue(TargetID(),EM_RoleValue_PID,1)
	local Ball = Lua_DW_CreateObj("obj",112399,TargetID())
	Lua_ObjDontTouch(Ball)
	CastSpell(OwnerID(),Ball,493154)
	sleep(30)
	DelObj(Ball)
end

function LuaS_422274_3(Master)
	sleep(100)
	ScriptMessage( Master,Master, 1, "[SC_422274_3]", 0 )
	ScriptMessage( Master,Master, 0, "[SC_422274_3]", 0 )
	DelObj(OwnerID())
end


---蝸牛快跑


function LuaS_422275_0()
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 101922	then
		if	not CheckDistance( OwnerID(), TargetID() , 70 )	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 );
			return false
		end
--檢查是否死亡
		if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
			return false
		end
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_5]", 0 );
		return false
	end
end

function LuaS_422275_1()
	Hide(TargetID())
	local NewBug = Lua_DW_CreateObj("obj",101922,TargetID())
	BeginPlot(NewBug,"LuaS_422275_2",0)
	BeginPlot(NewBug,"LuaS_422275_3",0)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end

function LuaS_422275_2()
	LuaFunc_MoveToFlag( OwnerID(), 780088 , 1 ,0 )
end

function LuaS_422275_3()
	sleep(20)
	SetFlag(TargetID(),542634,1)
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_422275_0]", 0 );
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_422275_0]", 0 );
	DelObj(OwnerID())
end

----蝴蝶亂飛


function LuaS_422279_0()
	DisableQuest( OwnerID() , true ) --鎖起來
	Say(OwnerID(),"[SC_422279_1]")
	local Num = 4
	local Flyer = {}
	for i=1,Num do
		Flyer[i] = Lua_DW_CreateObj("flag",101924,780089,i,0)
		Lua_ObjDontTouch(Flyer[i]) --不可點擊 無頭像
		NPCAttackFlag(Flyer[i]) -- 將戰鬥可能去除
		MoveToFlagEnabled( Flyer[i], false );
		WriteRoleValue(Flyer[i],EM_RoleValue_IsWalk,1)
		AddToPartition( Flyer[i] , 0)
		CallPlot(Flyer[i],"LuaS_422279_1",i)--移動
		BeginPlot(Flyer[i],"LuaS_422279_2",0)
	end
	sleep(30)
	Say(OwnerID(),"[SC_422279_0]")
	sleep(10)
	DisableQuest( OwnerID() , false ) --解鎖
end

function LuaS_422279_1(Flag)
	LuaFunc_MoveToFlag(OwnerID(),780090,Flag,30)
end

function LuaS_422279_2()
	sleep(20)
	CastSpell(OwnerID(),OwnerID(),493123)
	sleep(10)
	DelObj(OwnerID())
end

-----樹人跟著跑
function LuaS_422288_0()  --物品檢查
	if	Lua_ExGetZone( OwnerID() ) ~= 12	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_DAN_111700_37]", 0 );
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 112876	and
		ReadRoleValue(TargetID(),EM_RoleValue_PID) ~= OwnerID()	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421101_0]", 0 );
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 112876	and
		ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 101928	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_5]", 0 );
		return false
	end

--檢查是否死亡
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 101928	and
		CheckBuff(OwnerID(),503365)	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422288_0]", 0 );
		return false
	end

	if	not CheckDistance( OwnerID(), TargetID() , 200 )	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 );
		return false
	end

	return true
end

function LuaS_422288_1() -- 使用物品
	AddBuff(OwnerID(),503365,1,30)
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 112876	then
		BeginPlot(TargetID(),"LuaS_422288_2",0)
	else
		BeginPlot(TargetID(),"LuaS_422288_3",0)
	end
	return true
end

function LuaS_422288_2()
	FaceObj(OwnerID(),TargetID())
	AddBuff(OwnerID(),503365,1,30)
end

function LuaS_422288_3()
	local NewTree = Lua_DW_CreateObj("obj",112876,OwnerID())
	WriteRoleValue(NewTree,EM_RoleValue_PID,TargetID())
	MoveToFlagEnabled( NewTree , false )
--	SetFollow( NewTree, TargetID() )
	BeginPlot(NewTree,"LuaS_422288_2",0)
	BeginPlot(NewTree,"LuaS_422288_4",0)
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end

function LuaS_422288_4()
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while true do
		sleep(10)
		if	not CheckBuff(OwnerID(),503365)	then
			break
		end
		if	not CheckID(Master)	then
			break
		end
		if	not CheckDistance( OwnerID(), Master , 350 )	then
			break
		end
	end
	CancelBuff(Master ,503365)
	DelObj(OwnerID())
end

function LuaS_422288_5()
	SetPlot(OwnerID(),"range","LuaS_422288_6",70)
end

function LuaS_422288_6()
	if	CheckBuff(OwnerID(),503365)	then
		SetFlag(OwnerID(),542637,1)
	end
	local Tree = SearchRangeNPC(OwnerID(),200)
	for i=0,table.getn(Tree)-1	do
		if	ReadRoleValue(Tree[i],EM_RoleValue_OrgID)==112876	then
			if	ReadRoleValue(Tree[i],EM_RoleValue_PID) == OwnerID()	then
				DelObj(Tree[i])
			end
		end
	end
end

------警告
function LuaS_422290_0()
	SetFlag(OwnerID(),542638,1)
	local Master = Lua_DW_CreateObj("flag",112879,780088,2)
	Tell(OwnerID(),Master,"[SC_422290_0]")
	DelObj(Master)
	return 1
end


---變蠑螈


function LuaS_422291_0()
	DisableQuest( OwnerID() , true )
	Say(OwnerID(),"[SC_422291_0]")
	sleep(10)
	Say(OwnerID(),"[SC_422291_1]")
	sleep(10)
	CastSpell(OwnerID(),OwnerID(),493122)
	sleep(10)
	AddBuff(OwnerID(),503366,1,-1)
	Say(OwnerID(),"[SC_422291_2]")
	sleep(10)
	Say(OwnerID(),"[SC_422291_3]")
	BeginPlot(OwnerID(),"LuaS_422291_1",0)
end

function LuaS_422291_1()
	sleep(30)
	DisableQuest( OwnerID() , false )
	LuaFunc_ResetObj( OwnerID() )
end



----對鼠彈琴


function LuaS_422301_0()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)~=101943	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_5]", 0 );
		return false
	end

--檢查是否死亡
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
		return false
	end

	if	not CheckDistance( OwnerID(), TargetID() , 80 )	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 );
		return false
	end

	return true
end

function LuaS_422301_1()
	Hide(TargetID())
	GiveBodyItem(OwnerID(),204647,1)
	local NewMouse = Lua_DW_CreateObj("obj",112877,TargetID())
	SetFollow( NewMouse, OwnerID() )
	BeginPlot(NewMouse,"LuaS_422301_2",0)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end

function LuaS_422301_2()
	sleep(600)
	DelObj(OwnerID())
end