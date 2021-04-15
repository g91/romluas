
---------------------------------戰鬥階段狀態
LuaS_103120_Phase_101 = {}
--階段A
--狀態1：安柏瑞爾開啟防禦力場
function LuaS_103120_Phase_101.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--改變型態
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_SLEEP_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
--施法驅離太近的玩家
	local BValue_101 = FSM_GetState(ThisObj,101)
	BValue_101.Disperser = DW_CreateObjEX( "obj",104778,ThisObj.MonID,1, 0)--使用制裁者48的暫代物件
	DW_UnFight(BValue_101.Disperser)
	Lua_ObjDontTouch( BValue_101.Disperser )
	SysCastSpellLv(BValue_101.Disperser,BValue_101.Disperser,496277,1)
--戰術調整
	AI_Order_103120 = 995--修復模式
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_10100]", 0 )
end

function LuaS_103120_Phase_101.update(ThisObj)
	local BValue_101 = FSM_GetState(ThisObj,101)
--(數值組)
	if	BValue_101.Lv496278==nil	then
		BValue_101.Lv496278 = 0--擊退附加傷害的比例：496278
	end
	if	ReadRoleValue(BValue_101.Disperser,EM_RoleValue_SpellMagicID)==0	then
		SysCastSpellLv(BValue_101.Disperser,BValue_101.Disperser,496278,BValue_101.Lv496278)
	end
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=100	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)
--釋放記憶體
	BValue_101 = nil
	BValue_0 = nil
	PEindex = nil
end

function LuaS_103120_Phase_101.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--關閉防護力場
	local BValue_101 = FSM_GetState(ThisObj,101)
	DW_CheckThenDel(BValue_101.Disperser)
	BValue_101.Disperser = nil
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_END)
end
----------------------------------------------------------------
LuaS_103120_Phase_102 = {}
--階段A
--狀態2：制裁者採集資源增快
function LuaS_103120_Phase_102.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 901--採集模式
--調整戰術
	SanctionMark = 1--採集加速標記
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_10200]", 0 )
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_10201]", C_Red )
end

function LuaS_103120_Phase_102.update(ThisObj)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=100	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--火力函式
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	BValue_0 = nil
	PEindex = nil
end

function LuaS_103120_Phase_102.leave(ThisObj)
	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
	MoveToFlagEnabled(ThisObj.MonID, false)
--調整戰術
	SanctionMark = 0
end
----------------------------------------------------------------
LuaS_103120_Phase_103 = {}
--階段A
--狀態3：制裁者狂暴攻擊入侵者
function LuaS_103120_Phase_103.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 902--巡狩模式
--調整戰術
	SanctionMark = 2--攻擊加強標記
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_10300]", 0 )
end

function LuaS_103120_Phase_103.update(ThisObj)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=100	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--火力函式

	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	BValue_0 = nil
	PEindex = nil
end

function LuaS_103120_Phase_103.leave(ThisObj)
	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
	MoveToFlagEnabled(ThisObj.MonID, false)
--調整戰術
	SanctionMark = 0
end
----------------------------------------------------------------
LuaS_103120_Phase_201 = {}
--階段B
--狀態1：安柏瑞爾升空以最強火力打擊地面
function LuaS_103120_Phase_201.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 902--巡狩模式
--向上移動
	SetModeEx(ThisObj.MonID,EM_SetModeType_Gravity,false) 
	local x,y,z
	x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
	y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
	z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
	StopMove(ThisObj.MonID,false)
	MoveDirect( ThisObj.MonID, x , 200 , z )
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
--改變型態
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20100]", 0 )--給玩家的訊息
end

function LuaS_103120_Phase_201.update(ThisObj)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=200	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--火力函式
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,1,ThisObj.MonID)
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	BValue_0 = nil
	PEindex = nil
end

function LuaS_103120_Phase_201.leave(ThisObj)
	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
	local x,y,z
	x=ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
	y=ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
	z=ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,false) 
--向下移動
	StopMove(ThisObj.MonID,false)
	MoveDirect( ThisObj.MonID, x , GetHeight( x , y , z ) , z )
	sleep(25)
	SysCastSpellLv(ThisObj.MonID,ThisObj.MonID,496279,20)
--改變型態：回閒置動作
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(15)
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_Register8,0)
end
----------------------------------------------------------------
LuaS_103120_Phase_202 = {}
--階段B
--狀態2：安柏瑞爾升空留下能源吸取 持續以火力打擊
function LuaS_103120_Phase_202.enter(ThisObj)
--戰術調整
	AI_Order_103120 = 902--巡狩模式 能源由能源吸取裝置補充已足夠
--產生能源吸取裝置
	local BValue_202 = FSM_GetState(ThisObj,202)
	BValue_202.TakeEnergy = DW_CreateObjEX("obj",104761,ThisObj.MonID,1,0)
	SetPlot(BValue_202.TakeEnergy,"dead","LuaS_104761_Dead",0)--永不死亡
	SetModeEx(BValue_202.TakeEnergy,EM_SetModeType_Strikback,false) 
	AddBuff(BValue_202.TakeEnergy,507771,1,-1)
--向上移動
	SetModeEx(ThisObj.MonID,EM_SetModeType_Gravity,false) 
	local x,y,z
	x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
	y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
	z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
--改變型態
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_BEGIN)

	StopMove(ThisObj.MonID,false)
	MoveDirect( ThisObj.MonID, x , 200 , z )
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20200]", 0 )--給玩家的訊息
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20201]", C_Red )--給玩家的訊息
	sleep(20)
--能源吸取裝置啟動:要找mine
	BValue_202.Type = "Work"
	SetDefIdleMotion(BValue_202.TakeEnergy,ruFUSION_MIME_CROUCH_LOOP)
	PlayMotion(BValue_202.TakeEnergy,ruFUSION_ACTORSTATE_CROUCH_BEGIN)

end

function LuaS_103120_Phase_202.update(ThisObj)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=200	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--火力函式
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--能源吸取裝置運作
	local BValue_202 = FSM_GetState(ThisObj,202)
	local Zmark = BValue_202.TakeEnergy
	local MaxHP = ReadRoleValue(Zmark,EM_RoleValue_MaxHP)
	local HP = ReadRoleValue(Zmark,EM_RoleValue_HP)
	if	HP/MaxHP > 0.7		and --血足夠
		BValue_202.Type == "Stop"	then -- 未啟動
		SetDefIdleMotion(Zmark,ruFUSION_MIME_CROUCH_LOOP)
		PlayMotion(Zmark,ruFUSION_ACTORSTATE_CROUCH_BEGIN)

		BValue_202.Type = "Work"  --啟動啦!!
		AddBuff(Zmark,507771,1,-1)--產生特效
	elseif	HP/MaxHP < 0.2		and--血不夠
		BValue_202.Type == "Work"	then-- 已啟動
		CancelBuff(Zmark,507771)--取消特效
		SetDefIdleMotion(Zmark,ruFUSION_MIME_IDLE_STAND)
		PlayMotion(Zmark,ruFUSION_ACTORSTATE_CROUCH_END)

		BValue_202.Type = "Stop" --關機
--緩緩回血
	elseif	HP/MaxHP <= 0.7		and -- 血不夠
		BValue_202.Type == "Stop"	then -- 未啟動
		SysCastSpellLv(Zmark,Zmark,496284,999)--制裁者修復(當然沒有制裁者在修)
	else
--開始吸取能源
		PE_AddVar("PastTime",-2000)
	end
--來點能源不穩定的梗=>範圍殺傷!!
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	PEindex = nil
	BValue_202 = nil
	Zmark = nil
	HP = nil
	MaxHP = nil
end

function LuaS_103120_Phase_202.leave(ThisObj)
	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}

	MoveToFlagEnabled(ThisObj.MonID, false)
	local BValue_202 = FSM_GetState(ThisObj,202)
	if	BValue_202.Type == "Work"	then
		local Zmark = BValue_202.TakeEnergy
		SetDefIdleMotion(Zmark,ruFUSION_MIME_IDLE_STAND)
		PlayMotion(Zmark,ruFUSION_ACTORSTATE_CROUCH_END)

		BValue_202.Type = "Stop"
	end
--向下移動
	local x,y,z
	x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
	y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
	z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
	StopMove(ThisObj.MonID,false)
	MoveDirect( ThisObj.MonID, x , GetHeight( x , y , z ) , z )
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,false) 
	sleep(20)
--改變型態：回閒置動作
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_END)


	SysCastSpellLv(ThisObj.MonID,ThisObj.MonID,496279,20)--落地的大範圍法術
	sleep(15)
--刪除能源吸取器
	DW_CheckThenDel(BValue_202.TakeEnergy)
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 

--釋放記憶體
	BValue_202 = nil
	Zmark = nil
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_Register8,0)
end
----------------------------------------------------------------
LuaS_103120_Phase_203 = {}
--階段B
--狀態3：安柏瑞爾升空落下頻繁動作試圖輾壓冒險者
function LuaS_103120_Phase_203.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 902--巡狩模式  玩家要移動  制裁者配合狩獵
	local BValue_203 = FSM_GetState(ThisObj,203)
	BValue_203.BossType = 0

--改變型態
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_BEGIN)


	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20300]", 0 )--給玩家的訊息
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20301]", C_Red )--給玩家的訊息
end

function LuaS_103120_Phase_203.update(ThisObj)
	local BValue_203 = FSM_GetState(ThisObj,203)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=200		and
		BValue_203.BossType==1	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--持續切換空中型態或是地面型態
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_SpellMagicID)==0	then
		if	BValue_203.BossType == 0	then
--升空
--向上移動
			SetModeEx(ThisObj.MonID,EM_SetModeType_Gravity,false) 
			local x,y,z
			x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
			y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
			z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
			StopMove(ThisObj.MonID,false)
			MoveDirect( ThisObj.MonID, x , 200 , z )
--改變火力輸出模式
			sleep(20)
			BValue_203.BossType = 1
		elseif	BValue_203.BossType==1	then
			if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)>175	then
--準備傳送
				CastSpell(ThisObj.MonID,ThisObj.MonID,496283)
				BValue_203.BossType = 2
			end
		elseif	BValue_203.BossType == 2	then
			Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
			for i=1,3,1 do
				LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
				sleep(5)
			end
			LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
			local x,y,z
--檢查是否傳送完成
			if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_SpellMagicID)==0	then
--躍傳
				AddBuff(ThisObj.MonID,507914,1,2)
				local PlayerA = SearchRangePlayer ( ThisObj.MonID , 300 )
				local PlayerChoose
				if	table.getn(PlayerA)>3		and
					DW_CheckDis(ThisObj.MonID,780081,1,200)	then

					PlayerChoose = PlayerA[DW_Rand(table.getn(PlayerA))-1]
					x=ReadRoleValue(PlayerChoose,EM_RoleValue_X)
					y=200
					z=ReadRoleValue(PlayerChoose,EM_RoleValue_Z)
				else
					x=GetMoveFlagValue(780081,1,EM_RoleValue_X)-150+DW_Rand(300)
					y=200
					z=GetMoveFlagValue(780081,1,EM_RoleValue_Z)-150+DW_Rand(300)
				end
				SetPos( ThisObj.MonID, x, y, z , ReadRoleValue(ThisObj.MonID,EM_RoleValue_Dir))
				while	CheckBuff(ThisObj.MonID,507914)==true	do
					sleep(2)
				end
				SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
				BValue_203.BossType=3
--落地行動
				local x,y,z
				x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
				y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
				z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
				StopMove(ThisObj.MonID,false)
				MoveDirect( ThisObj.MonID, x , GetHeight( x , y , z ) , z )--向下移動
			end
		elseif	BValue_203.BossType==3	then
			SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,false) 
--判斷是否到達地面
			if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)<50	then
--火力函式
				Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
				BValue_203.BossType=0--標記為落地ing
				SysCastSpellLv(ThisObj.MonID,ThisObj.MonID,496279,1)--落地的大範圍法術
				for i=1,6,1 do
					sleep(5)
					LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
					LuaS_103120_SanctionHandle() --制裁者控管
				end
				LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
				SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 
			end
		end
	end
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	BValue_50 = nil
	PEindex = nil
	BValue_203 = nil
	PlayerA = nil
end

function LuaS_103120_Phase_203.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--先停止移動
	StopMove(ThisObj.MonID,false)
	local x,y,z
	local BValue_203 = FSM_GetState(ThisObj,203)
	if	BValue_203.BossType >0	then
--準備躍傳回初始位置
		CastSpell(ThisObj.MonID,ThisObj.MonID,496283)
		sleep(5)
		while	ReadRoleValue(ThisObj.MonID,EM_RoleValue_SpellMagicID)~=0	do
			sleep(5)
		end
		x=GetMoveFlagValue(780081,0,EM_RoleValue_X)
		y=200
		z=GetMoveFlagValue(780081,0,EM_RoleValue_Z)
		AddBuff(ThisObj.MonID,507914,1,2)
		SetPos( ThisObj.MonID, x, y, z , ReadRoleValue(ThisObj.MonID,EM_RoleValue_Dir))
		SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
		while	CheckBuff(ThisObj.MonID,507914)==true	do
			sleep(2)
		end
		SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
		StopMove(ThisObj.MonID,false)
--向下移動
		MoveDirect( ThisObj.MonID, x , GetHeight( x , y , z ) , z )
		SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,false) 
		sleep(20)
	end

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}

--改變型態：回閒置動作
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_END)


	SysCastSpellLv(ThisObj.MonID,ThisObj.MonID,496279,20)--落地的大範圍法術
	sleep(15)
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 

--釋放記憶體
	BValue_203 = nil
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_Register8,0)
end

----------------------------------------------------------------
LuaS_103120_Phase_301 = {}
--階段C
--狀態1：煞金帝國的幽魂對場上所有人進行無差別攻擊(不定)
function LuaS_103120_Phase_301.enter(ThisObj)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30100]", 0 )--給玩家的訊息
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30101]", C_Red )--給玩家的訊息
	MoveToFlagEnabled(ThisObj.MonID, false)
--幽魂宣告
	local State={}
	State["Execute"]=LuaS_103120_Ghost_Controler;
	State["Over"]=LuaS_103120_Ghost_Dispear
	local Anball = OwnerID()
	local BValue_301 = FSM_GetState(ThisObj,301)
	BValue_301.TeBall = FSM_Initial(Anball,State);
	FSM_DoTransion(BValue_301.TeBall,"Execute")--從Execute開始執行
--戰術調整
	AI_Order_103120 = 995--修復模式
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
--釋放記憶體
	State = nil
	Anball = nil
end

function LuaS_103120_Phase_301.update(ThisObj)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=300	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
	local BValue_301 = FSM_GetState(ThisObj,301)
	FSM_Update(BValue_301.TeBall)
--火力函式
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	BValue_50 = nil
	PEindex = nil
	BValue_301 = nil
end

function LuaS_103120_Phase_301.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
	local BValue_301 = FSM_GetState(ThisObj,301)
	FSM_DoTransion(BValue_301.TeBall,"Over")
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,table.getn(BValue_0.Equipment),1 do
		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_01",40)--回收能源
	end

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
LuaS_103120_Phase_302 = {}
--階段C
--狀態2：煞金帝國的防衛設備可以啟動(良性)
function LuaS_103120_Phase_302.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 901--採集模式
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
--開啟帝國儀器索敵
	local BValue_0 = FSM_GetState(ThisObj,0)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30200]", 0 )--給玩家的訊息
end

function LuaS_103120_Phase_302.update(ThisObj)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=300	then
		return	PEindex
	end
	local OldMachine
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,BValue_0.EquipmentNum,1 do
		OldMachine = BValue_0.Equipment[i][1]
		if	DW_CheckUse(OldMachine,496389)==0	then --確認蒙諾卡符文散射可以使用
			if	DW_Rand(999)%3==0	then --不一定會放
				CastSpellLv(OldMachine,OldMachine,496389,0) --數值組  --施法
			end
		else
			if	ReadRoleValue(OldMachine,EM_RoleValue_PID)~=0	and
				ReadRoleValue(OldMachine,EM_RoleValue_SpellMagicID)==0	then
				CastSpell(OldMachine,ReadRoleValue(OldMachine,EM_RoleValue_PID),496286)
			end
		end
	end

	LuaS_103120_SanctionHandle() --制裁者控管
--火力函式
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	BValue_0 = nil
	PEindex = nil
	OldMachine = nil
end

function LuaS_103120_Phase_302.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--關閉帝國儀器索敵
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,table.getn(BValue_0.Equipment),1 do
		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_01",40)--回收能源
		AddBuff(BValue_0.Equipment[i][1],504113,3,3) --上不能戰鬥的buff
	end
--釋放記憶體
	BValue_0 = nil

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
LuaS_103120_Phase_303 = {}
--階段C
-- 狀態3：煞金帝國的舊設備錯亂開始產生不同的範圍力場(不定)
function LuaS_103120_Phase_303.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 901--採集模式

	local BValue_0 = FSM_GetState(ThisObj,0)
	if	Boss_103120_PH303_Time==nil	then
		Boss_103120_PH303_Time = 15
		BValue_0.TempSpell = {}

		Boss_103120_PH303_BuffArray = {}
		Boss_103120_PH303_BuffArray[1] = 507776
		Boss_103120_PH303_BuffArray[2] = 507777
		Boss_103120_PH303_BuffArray[3] = 507778
		Boss_103120_PH303_BuffArray[4] = 507875


		Boss_103120_PH303_Spell = {}
		Boss_103120_PH303_Spell[1] = 496371
		Boss_103120_PH303_Spell[2] = 496372
		Boss_103120_PH303_Spell[3] = 496373
		Boss_103120_PH303_Spell[4] = 496374


		Boss_103120_PH303_FX = {}
		Boss_103120_PH303_FX[1] = 507884--紅
		Boss_103120_PH303_FX[2] = 507883--藍
		Boss_103120_PH303_FX[3] = 507924--綠
		Boss_103120_PH303_FX[4] = 507925--白
	else
		Boss_103120_PH303_Time = 15
	end
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)


	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30300]", 0 )--給玩家的訊息
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30301]", C_Red )--給玩家的訊息
end

function LuaS_103120_Phase_303.update(ThisObj)
	local BValue_0 = FSM_GetState(ThisObj,0)

--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=300	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--切換力場:大風吹
	local RandSpell
	if	Boss_103120_PH303_Time >= 12	then
		Boss_103120_PH303_Time = 0--計時歸零
		for i=1,table.getn(BValue_0.Equipment),1 do
			for k=1,table.getn(Boss_103120_PH303_Spell),1 do
				CancelBuff(BValue_0.Equipment[i][1],Boss_103120_PH303_FX[k])
			end
			RandSpell = DW_Rand(table.getn(Boss_103120_PH303_Spell))
			BValue_0.TempSpell[i] = Boss_103120_PH303_Spell[RandSpell]
			AddBuff(BValue_0.Equipment[i][1],Boss_103120_PH303_FX[RandSpell],1,-1)
		end
	else
		Boss_103120_PH303_Time = Boss_103120_PH303_Time + 1
		if	Boss_103120_PH303_Time%3==0	then--定時補充法術
			for i=1,BValue_0.EquipmentNum,1 do
				SysCastSpellLv(BValue_0.Equipment[i][1],BValue_0.Equipment[i][1],BValue_0.TempSpell[i],1)
			end
		end
	end
--火力函式
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)


--釋放記憶體
	BValue_0 = nil
	PEindex = nil
	RandSpell = nil
end

function LuaS_103120_Phase_303.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--消除所有特效
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,table.getn(BValue_0.Equipment),1 do
		for k=1,table.getn(Boss_103120_PH303_Spell),1 do
			CancelBuff(BValue_0.Equipment[i][1],Boss_103120_PH303_FX[k])
		end
	end
	for i=1,table.getn(BValue_0.Equipment),1 do
		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_01",40)--回收能源
	end

--釋放記憶體
	Boss_103120_PH303_Time = nil
	BValue_0 = nil

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
LuaS_103120_Phase_401 = {}
--階段D
--狀態1：黑土盜墓者闖入(第三陣營被動)
function LuaS_103120_Phase_401.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 902--巡狩模式  打起來才精采
--建立演員
	local BValue_0 = FSM_GetState(ThisObj,0)
	local BValue_401 = FSM_GetState(ThisObj,401)
	BValue_401.HeyTwo = {}
	BValue_401.HeyTwoNum=GetMoveFlagCount(780085)-1
	BValue_401.HeyTwoShowTime = 0

	BValue_401.Freezer={}

	for i=1,BValue_401.HeyTwoNum,1 do
		BValue_401.Freezer[i] = DW_CreateObjEX("flag",104618,780085,i,1,170)--產生艾力克研究員
		SetPlot(BValue_401.Freezer[i],"dead","LuaS_104618_DontDie",0)
		SysCastSpellLv(BValue_401.Freezer[i],BValue_401.Freezer[i],495735,1)--傳送特效
		MoveToFlagEnabled(BValue_401.Freezer[i], false)
		CallPlot(BValue_401.Freezer[i],"LuaS_103120_Freezer",BValue_0.Equipment[i][1],BValue_401.Freezer[i] )
	end
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)

	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40100]", 0 )--給玩家的訊息
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40101]", C_Red )--給玩家的訊息
end

function LuaS_103120_Phase_401.update(ThisObj)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=400	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--火力函式
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--控制黑土盜墓者和艾力克研究員
	local BValue_0 = FSM_GetState(ThisObj,0)
	local BValue_401 = FSM_GetState(ThisObj,401)
	if	BValue_401.HeyTwoShowTime<15	then
		if	DW_Rand(2)==1	then
			BValue_401.HeyTwoShowTime = BValue_401.HeyTwoShowTime +1--不固定的登場時機
		end

	elseif	BValue_401.HeyTwoShowTime==15	then
		BValue_401.HeyTwoShowTime = BValue_401.HeyTwoShowTime +1
--產生黑土
		for i=1,BValue_401.HeyTwoNum,1 do
			BValue_401.HeyTwo[i] = DW_CreateObjEX("flag",104758,780085,i,1,170)
			CallPlot(BValue_401.HeyTwo[i],"LuaS_103120_Thief",BValue_0.Equipment[i][1],BValue_401.HeyTwo[i])
			MoveToFlagEnabled(BValue_401.HeyTwo[i] , false)
		end
	end
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	BValue_0 = nil
	BValue_401 = nil
	PEindex = nil
end

function LuaS_103120_Phase_401.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
	local BValue_401 = FSM_GetState(ThisObj,401)
--刪除墨土盜墓者
	for i=1,BValue_401.HeyTwoNum,1 do
		LuaS_103120_SafeDelObj(BValue_401.HeyTwo[i])
	end
--艾力克消失前要秀一下
	local Eric
	for i=1,BValue_401.HeyTwoNum,1 do
		Eric = BValue_401.Freezer[i]
		Say(Eric,"[SC_103120_CON_40106]")
		SysCastSpellLv(Eric,Eric,495735,1)
		WriteRoleValue(Eric,EM_RoleValue_LiveTime,1)
	end
	Eric = nil

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
LuaS_103120_Phase_402 = {}
--階段D
--狀態2：艾力克會開啟部份的安全空間供躲藏(良性)
function LuaS_103120_Phase_402.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 995--修復模式 
--轟炸準備區
	local BValue_402 = FSM_GetState(ThisObj,402)
	BValue_402.Time = 25--轟炸的間隔時間
	BValue_402.SafeSpace = {}
	BValue_402.SafeTime = 5--已開啟防護的時間
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40200]", 0 )--給玩家的訊息
end

function LuaS_103120_Phase_402.update(ThisObj)
	local BValue_402 = FSM_GetState(ThisObj,402)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=400	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管

--先確認秒數是否足夠開啟防護
	if	BValue_402.SafeTime==9	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--開啟防護力場、並執行script
		local Force
		BValue_402.SafeTime = BValue_402.SafeTime + 1--脫離這個數字
		for i=1,GetMoveFlagCount(780086)-1,1 do
			BValue_402.SafeSpace[i] = LuaS_103120_Phase402_ForceSet(DW_CreateObjEX("flag",104760,780086,i,0,180)--隨機點建立力場
											) --先設定 再指定給BValue_402.SafeSpace[i]
		end
	elseif	BValue_402.SafeTime==7	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
		ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40201]",  "0xFF98E0E7" )--給玩家的訊息
		BValue_402.SafeTime = BValue_402.SafeTime + 1

	elseif	BValue_402.SafeTime==13	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
		BValue_402.SafeTime = BValue_402.SafeTime + 1--時間到 開始轟炸
		ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40202]",  C_Red )--給玩家的訊息

	elseif	BValue_402.SafeTime >=20	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--清場時刻
		BValue_402.SafeTime = 0
		for i=1,GetMoveFlagCount(780086)-1,1 do
			DW_CheckThenDel(BValue_402.SafeSpace[i])--消除每個力場
		end


	elseif	BValue_402.SafeTime >=17	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,5,ThisObj.MonID,true)
		BValue_402.SafeTime = BValue_402.SafeTime + 1


	elseif	BValue_402.SafeTime>13	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,5,ThisObj.MonID,true)
		BValue_402.SafeTime = BValue_402.SafeTime + 1--時間到 開始轟炸
	else
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
		if	DW_Rand(999)%2==0	then
			BValue_402.SafeTime = BValue_402.SafeTime + 1
		end
	end
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)
--釋放記憶體
	BValue_402 = nil
	PEindex = nil
end

function LuaS_103120_Phase_402.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--檢查並刪除安全空間
	local BValue_402 = FSM_GetState(ThisObj,402)
	local Force
	for i=1,table.getn(BValue_402.SafeSpace),1 do
		Force = BValue_402.SafeSpace[i]--指定記憶體
		if	Force~=nil	then
			DW_CheckThenDel(Force)
		end
	end
--釋放記憶體
	Force = nil
	BValue_402 = nil

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
--階段D
LuaS_103120_Phase_403 = {}
--狀態3：艾力克傳送爆炸火藥進來突襲(不定)
function LuaS_103120_Phase_403.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--戰術調整
	AI_Order_103120 = 901--採集模式 
--建立轟炸的參考位置
	local BValue_403 = FSM_GetState(ThisObj,403)
	BValue_403.Time = 25--轟炸的間隔時間
	BValue_403.Bomb = {}
	BValue_403.BombNum = GetMoveFlagCount(780085)-1--數量等同旗子數
	local BOM
	for i=1,GetMoveFlagCount(780085)-1,1 do
		BValue_403.Bomb[i]={}
		BValue_403.Bomb[i][0] = 0--[0]記錄產生時間
		BOM= DW_CreateObjEX("flag",104759,780085,i,0,100)--[1]記錄ID
		DW_UnFight(BOM)--改變引爆點的狀態
		Lua_ObjDontTouch( BOM)--改變引爆點的狀態
		AddToPartition(BOM,0)
		AddBuff(BOM,507881,1,-1)--向下箭頭的buff
		BValue_403.Bomb[i][1] = BOM --指定記憶體的值
	end
--改變火力輸出模式
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)

	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40300]",  "0xFF98E0E7" )--給玩家的訊息

	BOM = nil
end

function LuaS_103120_Phase_403.update(ThisObj)
	local BValue_403 = FSM_GetState(ThisObj,403)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=400	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--火力函式
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--倒數
	for i=1,GetMoveFlagCount(780085)-1,1 do
		local BOM
		BOM = BValue_403.Bomb[i][1]
		if	BValue_403.Bomb[i][0]>=6	then
			WriteRoleValue(BOM,EM_RoleValue_LiveTime,1)
			BValue_403.Bomb[i][0] = 0--歸零讀秒
--引爆
			SysCastSpellLv(BOM,BOM,496282,89)
--刪除現在的引爆點 、建立新的、歸零讀秒
			BOM = DW_CreateObjEX("flag",104759,780085,i,0,200)
			DW_UnFight(BOM)--改變引爆點的狀態
			Lua_ObjDontTouch( BOM)--改變引爆點的狀態
			AddToPartition(BOM,0)
			AddBuff(BOM,507881,1,-1)--向下箭頭的buff
			BValue_403.Bomb[i][1] = BOM
		else
--未爆 秒數增加
			if	DW_Rand(999)%2==0	then
				BValue_403.Bomb[i][0] = BValue_403.Bomb[i][0] + 1
			end
		end
	end
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--釋放記憶體
	BValue_403 = nil
	PEindex = nil
end

function LuaS_103120_Phase_403.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
	local BValue_403 = FSM_GetState(ThisObj,403)
--刪除所有引爆點
	for i=1,BValue_403.BombNum,1 do
		DW_CheckThenDel(BValue_403.Bomb[i][1])
	end

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end