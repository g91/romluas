
-------------------------------------------------------
function LuaS_422712_0()--使用觀測水晶的檢查
-------------------------------------------------------
--使用旗子 780093 編號 1
--檢查距離是否夠近
	if	not DW_CheckDis(OwnerID(),780093,1,40)	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422712_0]", 0 )
		return false
	end
	local NPC = {}
--搜尋附近npc
	NPC = SearchRangeNPC ( OwnerID() , 300 )
--比對是否已有水晶存在
	for i=0,table.getn(NPC),1 do
		if	NPC[i] == -1	then
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 113430	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422712_6]", 0 )
			return false
		end
	end
--檢查完成
	return true
end


-------------------------------------------------------
function LuaS_422712_1()--使用觀測水晶執行劇情
-------------------------------------------------------
--使用旗子 780093 編號 2
--創造水晶
--命令它執行呼怪劇情
	local Tester = Lua_DW_CreateObj("flag",113430,780093,2)
	BeginPlot(Tester,"LuaS_422712_2",0)
end

-------------------------------------------------------
function LuaS_422712_2()--水晶呼怪劇情
-------------------------------------------------------
--計次
	local X = 0
--使用旗子 780093 編號 3 4 5 9 10
	local Disco = {}
	local EndBall = 0
--產生特效球
--範圍訊息:水晶開始推算結界邊緣的演變
--對特效球施法
	local StartBall = Lua_DW_CreateObj("flag", 112307 ,780093,9)
	sleep(10)
	ScriptMessage( OwnerID(), 0, 2, "[SC_422712_1]", C_YELLOW )
	ScriptMessage( OwnerID(), 0, 0, "[SC_422712_1]", C_YELLOW )
	sleep(10)
	CastSpell(OwnerID(),StartBall,492681)
	local sec = 0
	for i=1,30,1 do
		sleep(10)
--顯示訊息的步驟 &計數
		sec = sec + 1
		if	sec == 20	then
			ScriptMessage( OwnerID(), 0, 2, "[SC_422712_3]", 0 )
		end
--訊息只秀出一次
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) > 10	and
			X == 0							then
			ScriptMessage( OwnerID(), 0, 2, "[SC_422712_4]", 0 )
			X = 1
		end
--檢查自己是否存活
--用PID記錄生命值
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) > 14	then
--偵測失敗
			ScriptMessage( OwnerID(), 0, 2, "[SC_422712_5]", 0 )
--解散前刪去所有未進入戰鬥的部份
			for i = 1,3,1 do
--未創建則不處理
--戰鬥中的個體給予 離開戰鬥八秒自動消失的指令
--未進入戰鬥的個體直接刪除
				if	Disco[i] ~= nil		then
					if	HateListCount( Disco[i])>0	then
						CallPlot(Disco[i],"LuaFunc_Obj_Suicide",30)
					else
						DelObj(Disco[i])
					end
				end
			end
--刪去產生出來的特效球和自己
			DelObj(StartBall)
			DelObj(OwnerID())
		end
--如果未創建、ID已失效 則隨機判斷產生怪物
--給予怪物行動ai

		for i = 1,3,1 do
			if	Disco[i] ~= nil		then
				if	not CheckID(Disco[i])	then
					if	DW_Rand(100)>23	then
						Disco[i] = Lua_DW_CreateObj("flag",102244,780093, i+2)
						WriteRoleValue(Disco[i],EM_RoleValue_PID,i)
						BeginPlot(Disco[i],"LuaS_422712_3",0)
					end
				else
					if	ReadRoleValue(Disco[i],EM_RoleValue_IsDead)==1	then
						if	DW_Rand(100)>23	then
							Disco[i] = Lua_DW_CreateObj("flag",102244,780093, i+2)
							WriteRoleValue(Disco[i],EM_RoleValue_PID,i)
							BeginPlot(Disco[i],"LuaS_422712_3",0)
						end
					end
				end
			else
				if	DW_Rand(100)>23	then
					Disco[i] = Lua_DW_CreateObj("flag",102244,780093, i+2)
					WriteRoleValue(Disco[i],EM_RoleValue_PID,i)
					BeginPlot(Disco[i],"LuaS_422712_3",0)
				end
			end
		end
	end
--範圍訊息：水晶標示出數年後的結界邊緣
--時間到 水晶完成偵測
--改變施法方向
	AddBuff( OwnerID() ,502383,1 ,1)
	sleep(20)
	EndBall = Lua_DW_CreateObj("flag", 112307 ,780093,10)
	CastSpell(OwnerID(),EndBall,492681)
	ScriptMessage( OwnerID(), 0, 2, "[SC_422712_2]", C_YELLOW )
	ScriptMessage( OwnerID(), 0, 0, "[SC_422712_2]", C_YELLOW )
--搜尋附近的玩家
--有接任務的話 就給予重要物品
	local Player = SearchRangePlayer ( OwnerID() , 100 )
	for i=0,table.getn(Player),1 do
		if	Player[i] ~= -1		then
			if	CheckAcceptQuest(Player[i],422712)	then
				SetFlag(Player[i],543268,1)
			end
		end
	end
	sleep(30)
	DelObj(StartBall)
	DelObj(EndBall)
	for i = 1,3,1 do
--未創建則不處理
--戰鬥中的個體給予 離開戰鬥八秒自動消失的指令
--未進入戰鬥的個體直接刪除
		if	Disco[i] ~= nil		then
			if	HateListCount( Disco[i])>0	then
				CallPlot(Disco[i],"LuaFunc_Obj_Suicide",30)
			else
				DelObj(Disco[i])
			end
		end
	end
--刪去產生出來的特效球和自己
	DelObj(StartBall)
	DelObj(EndBall)
	DelObj(OwnerID())
end


-------------------------------------------------------
function LuaS_422712_3()--守衛的行動ai
-------------------------------------------------------
--使用旗子 780093 編號 6 7 8
--繼承旗號編屬
--走到該到的定點
	local flag = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	DW_MoveToFlag( OwnerID() , 780093 , flag+5,0 , 1  )
--若沒有進入戰鬥  則動手摧毀水晶
	while true do
		if	HateListCount( OwnerID())==0	then
--如果因戰鬥離開太遠 則重新回到可觸及範圍 再進行施法
			if	DW_CheckDis(OwnerID(),780093,flag+5,130)	then
				CastSpell(OwnerID(),TargetID(),493889)
			else
				DW_MoveToFlag( OwnerID() , 780093 , flag+5,0 , 1  )
			end
		end
		sleep(20)
	end
end


-------------------------------------------------------
function LuaS_422712_4()--增加水晶的PID
-------------------------------------------------------
	local PID = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	WriteRoleValue(TargetID(),EM_RoleValue_PID,PID+1)
end