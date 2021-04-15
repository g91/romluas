



-------------------------------------------------
function LuaS_422717_0() --掛在加諾多斯的對話劇情
-------------------------------------------------
--已經完成任務的人
--水龍還沒進入沉睡
	if	CheckCompleteQuest(OwnerID(),422717)	and
		Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)]==0	and
		CountBodyItem(OwnerID(),205836)	== 0	then
		SetSpeakDetail( OwnerID(),"[SC_422717_0]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422717_1]","LuaS_422717_1", 0 )
	else
--未完成就依照流程去跑
		LoadQuestOption(OwnerID())
	end
end

-------------------------------------------------
function LuaS_422717_1()
-------------------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422717_2]")
	GiveBodyItem(OwnerID(),205836,1)
end
-------------------------------------------------
function LuaS_422717_2() -- 物品的檢查劇情
-------------------------------------------------
DeBugMSG(0,0,"UseItem:Start")
--如果目標不是雷特費提
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102623	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[EM_201167_3]", 0 )
		return false
	end
--檢查身上是否有不得使用的buff
	if	CheckBuff(OwnerID(),504310)	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SYS_GAMEMSGEVENT_107]", 0 )
		return false
	end
--檢查此王的階段
	if	Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] ~= 0	then
		return false
	end
--DeBugMSG(0,0,"UseItem:End".."^^Gloabl = "..Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)])
--如果沒有以上情形
	return true
end
-------------------------------------------------
function LuaS_422717_3() -- 物品的執行劇情
--------------------------------------------------
--寫入物品的冷卻時間
	local ColdownType
	local ColdownTime
	ColdownType = GameObjInfo_Int( 494294 ,"ColdownType")
	ColdownTime = GameObjInfo_Int( 494294 ,"ColdownTime") 
	WriteRoleValue(OwnerID(),EM_RoleValue_Coldown_Job + ColdownType,ColdownTime)

--若是在初期使用則進入簡單模式
--判斷血量95%以上 & 未進入簡單模式
--DeBugMSG(0,0,"Register = "..ReadRoleValue(TargetID(),EM_RoleValue_Register1).."HP/MAXHP="..ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP))
	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) > 0.95	and
		ReadRoleValue(TargetID(),EM_RoleValue_Register1)==0	 then
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,1)
		BeginPlot(TargetID(),"LuaS_422717_8",0)
	end
--DeBugMSG(0,0,"Gloabl = "..Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)])
	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) < 0.5	then
--改變全域變數 表示劇情開演
		if	Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] == 0	then
			Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] = 1
--命令雷特費提演戲
			BeginPlot(TargetID(),"LuaS_422717_4",0)	
		end
	else
		if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) <=	0.95	and
			ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) >=	0.5	then
			WriteRoleValue(TargetID(),EM_RoleValue_Register2,ReadRoleValue(TargetID(),EM_RoleValue_Register2)+1)
			ScriptMessage( OwnerID(), OwnerID() , 2, "[SC_102623_2]", 0 )
		end
--如果血高於50% 必定會產生法術
		CallPlot(OwnerID(),"LuaS_422717_9",TargetID())
	end
end

-------------------------------------------------
function LuaS_422717_4()--雷特費提演戲
-------------------------------------------------
	local TempID
--掃描仇恨列表 並判斷是否符合取得稱號的資格
--從來沒有使用過水晶球才能通過檢查
--DeBugMSG(0,0,"Register="..ReadRoleValue(OwnerID(),EM_RoleValue_Register2))
	if	ReadRoleValue(OwnerID(),EM_RoleValue_Register2)==0	then
		for i=0,HateListCount(OwnerID())-1,1 do
			TempID = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
--DeBugMSG(0,0,"TempID="..TempID.."##IsPlayer??  I am "..ReadRoleValue(TempID,EM_RoleValue_IsPlayer))
			if	ReadRoleValue(TempID,EM_RoleValue_IsPlayer)==1	then
				GiveBodyItem(TempID,530384,1)
			end
		end
	end
	for i=0,HateListCount(OwnerID())-1,1 do
		TempID = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
--給予任務旗標
		if	CheckAcceptQuest(TempID,422717)	then
			SetFlag(TempID,543269,1)
		end
	end
--改變攻擊狀態
--上不可攻擊的buff
	MoveToFlagEnabled(OwnerID(), false)
	SetFightMode ( OwnerID(),0,1,0,0 )
	Lua_CancelAllBuff(OwnerID())
	SetRoleCamp(OwnerID(),"Visitor")
	AddBuff(OwnerID(),504113,1,120)
	SetStopAttack(OwnerID())
	sleep(20)
--進入沉睡
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_SLEEP_LOOP)
	Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] = 2
	ScriptMessage( OwnerID(), -1, 2, "[SC_102623_5]", 0 )
end

-------------------------------------------------
function LuaS_422717_5() --掛在加諾多斯的出生劇情
-------------------------------------------------
--該room全域變數初始化
	Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] = 0
end


-- _6 和 _7被用掉了



-------------------------------------------------
function LuaS_422717_8()--演戲更改模式
-------------------------------------------------
--產生幻影
	local Shadow = Lua_DW_CreateObj("flag",113581,780088,1)
	DisableQuest(Shadow,true)
	Say(Shadow,"[SC_102623_3]")
	sleep(20)
--施法 播放特效
	if	CastSpell(Shadow,OwnerID(),494220)	then
		AddBuff(OwnerID(),504610,1,-1)
		Say(Shadow,"[SC_102623_4]")
--播放完成更改暫存值
		sleep(20)
		DelObj(Shadow)
	end
end

-------------------------------------------------
function LuaS_422717_9(TargetID)--施放法術
-------------------------------------------------
--實際效果
	SysCastSpellLv(OwnerID(),TargetID,493893,1)
--特效
	CastSpell(OwnerID(),TargetID,494224)
end