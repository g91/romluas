--放陷阱夾斷手	422517 任務編號
function LuaS_422517_0() --物品檢查
	local QIN = 6
	local MID = 617
DeBugMSG(0,0,GetDistance(OwnerID(),TargetID()))
	--檢查是否位於魯贊村
--	if	not DW_CheckMap(OwnerID(),MID)	then
--		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422517_2]", 0 )
--		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422517_2]", 0 )
--		return false
--	end
	--是否已經足夠
	if	CountBodyItem(OwnerID(),205524) >= QIN	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422517_3]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422517_3]", 0 )
		return false
	end
	--是否已經用過一次了？
	if	CheckBuff(OwnerID(),503980)	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422517_4]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422517_4]", 0 )
		return false
	end
	--是否在戰鬥中
	if	HateListCount(OwnerID()) > 0	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112093_0]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_0]", 0 )
		return false
	end
end

function LuaS_422517_1() --使用物品
	--種出物品
	local Trap = Lua_DW_CreateObj("obj",113211,OwnerID())
	--給限制狀態
	AddBuff(OwnerID(),503980,1,-1)
	--記錄玩家的ID
	WriteRoleValue(Trap,EM_RoleValue_PID,OwnerID())
	--放loop判斷劇情
	BeginPlot(Trap,"LuaS_422517_2",0)--生存
	BeginPlot(Trap,"LuaS_422517_4",0)--劇情表演
end

function LuaS_422517_2() --loop判斷是否應該消失的劇情
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	--附近是否有目標物


	while true do
		sleep(10)
	--主人是否死亡或下線
		if	not CheckID(Master)	then
			DelObj(OwnerID())
		end
		if	ReadRoleValue(Master,EM_RoleValue_IsDead) == 1	then
			CancelBuff(Master, 503980)
			DelObj(OwnerID())
		end
	--主人是否太遠
		if	not	CheckDistance( OwnerID(), Master , 300 )	then
			CancelBuff(Master, 503980)
			DelObj(OwnerID())
		end
	end
end

function LuaS_422517_3()
--避免重複觸發
	SetPlot(TargetID(),"touch","",0)
--觸碰者是否和PID吻合
	if	OwnerID() ~= ReadRoleValue(TargetID(),EM_RoleValue_PID)	then
		SetPlot(TargetID(),"touch","LuaS_422517_3",50)--不合的話要先補回觸碰劇情
		return
	end
--給出物品
	GiveBodyItem(OwnerID(),205524,1)
--刪除自己
	DelObj(TargetID())
end

function LuaS_422517_4() -- 搜尋引怪的部份
	local NPC,Tar
	local Monster = 102233
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while true do
		sleep(20)
--搜尋附近的NPC
		NPC = SearchRangeNPC (OwnerID(),150)
		for i=0,table.getn(NPC)	do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==Monster	and
				ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode) == 0	then
--發現有符合的怪且不在戰鬥中的話 就先記下ID
				Tar = NPC[i]
--命令重生
				BeginPlot( Tar,"LuaS_421097_2",0)
--建立新的替身	&開啟跑步
				local StandIn = Lua_DW_CreateObj("obj",Monster,Tar)
				WriteRoleValue(StandIn,EM_RoleValue_LiveTime,60)
				WriteRoleValue(StandIn,EM_RoleValue_IsWalk,0)
				Hide(StandIn)
				Show(StandIn,0)
				sleep(20)
				Say(StandIn,"[SC_422517_0]")
--關掉戰鬥
				SetFightMode ( StandIn , 0, 1, 0, 0 )
--叫它走過來
				FaceObj( StandIn, OwnerID() )

--等到它走進30以內
				while	CheckDistance( OwnerID(), StandIn , 25 )==false	do
					sleep(10)
				end
--說台詞
				WriteRoleValue(StandIn,EM_RoleValue_IsWalk,1)
				Hide(StandIn)
				Show(StandIn,0)
				sleep(20)
				PlayMotion ( StandIn, ruFUSION_ACTORSTATE_HURT_NORMAL ) --伊嗲~
				Say(StandIn,"[SC_422517_1]")
--變成可以撿的狀態
				SetPlot(OwnerID(),"touch","LuaS_422517_3",50)
--閱掉玩家的限制狀態
				CancelBuff(Master,503980)
--叫他逃走
				BeginPlot( StandIn,"LuaS_422517_5",0)
				WriteRoleValue(StandIn,EM_RoleValue_LiveTime,3)
				sleep(20)
				DelObj(StandIn)
				return
			end
		end
	end
end

function LuaS_422517_5() 
	DW_MoveToFlag( OwnerID() , 780088 , 1 , 0 ,1)
	DelObj(OwnerID())
end


--拋石引幸運石



function LuaS_422518_0()--使用檢查
	local List = {102230,102231,102232,102233,102234}
	for i = 1,table.getn(List)	do
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == List[i]		then
			--確定OrgID符合
			if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) == 1	then --自己must非戰鬥
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112093_0]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_0]", 0 )
				return false
			end
			if	ReadRoleValue(TargetID(),EM_RoleValue_IsAttackMode) == 1	then --目標must非戰鬥
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204638_3]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204638_3]", 0 )
				return false
			end
			if	not	CheckDistance(TargetID(),OwnerID(),200)	then --must夠近
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204637_2]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204637_2]", 0 )
				return false
			end
			if	CheckBuff(TargetID(),503985)	then -- 適可而止
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422518_2]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422518_2]", 0 )
				return false
			end
			if	CountBodyItem(OwnerID(),205562) > 7	then --請勿濫殺
				return false
			end
			return true
		end
	end
--OrgID不正確
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204425_1]", 0 )
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_1]", 0 )
	return false
end

function LuaS_422518_1()--使用物品
	--播投擲動作
	CastSpell(OwnerID(),TargetID(),493646)
	--命令目標演戲
	BeginPlot(TargetID(),"LuaS_422518_2",0)
end

function LuaS_422518_2() --演戲丟石頭
	sleep(10)
	Say(OwnerID(),"[SC_422518_0]")
	sleep(10)
	CastSpell(OwnerID(),TargetID(),493647)
	AddBuff(OwnerID(),503985,1,-1)
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_422518_1]", 0 )
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_422518_1]", 0 )
	GiveBodyItem(TargetID(),205562,1)
end
