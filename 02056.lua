function LuaS_103120_HPpercent()
	local Owner = OwnerID()
	local MaxHP = ReadRoleValue(Owner,EM_RoleValue_MaxHP)
	local HP
	local PEPhase
	
	while	true	do
		sleep(10)
		HP = ReadRoleValue(Owner,EM_RoleValue_HP) --計算血量的百分比
		PEPhase = PE_GetActivePhaseIndex(1)
		HPpercent_103120 = math.floor((HP*100)/MaxHP) --將血量送進全域變數
		if	PEPhase >99	then
			PE_SetVar("ResidualHP",HPpercent_103120)
		elseif	PEPhase==500	and	CheckBuff(Owner,507407)==false	then
			AddBuff(Owner,507407,1,-1)
		end
	end
end
----------------------------------------------------------------
--安柏瑞爾主體迴圈
function LuaS_103120_AILoop_DW_00()
	local BossID = OwnerID()
	SetPlot(BossID,"dead","LuaS_104761_Dead",0)--不死劇情

	AddBuff(BossID,507590,1,-1) --無法被擊退
	BeginPlot(BossID,"LuaS_103120_HPpercent",0) --隨時處理血量



--建立所有階段
	local State = {}
	State[0] = LuaS_103120_Phase_Fixing
	State[50] = LuaS_103120_Phase_Fixed
--命名規則：
--百位數為階段
--十位數個位數是狀態差異
--00 指的是決定狀態的階段
	State[100] = LuaS_103120_Phase_100
	State[200] = LuaS_103120_Phase_200
	State[300] = LuaS_103120_Phase_300
	State[400] = LuaS_103120_Phase_400

	State[101] = LuaS_103120_Phase_101
	State[102] = LuaS_103120_Phase_102
	State[103] = LuaS_103120_Phase_103

	State[201] = LuaS_103120_Phase_201
	State[202] = LuaS_103120_Phase_202
	State[203] = LuaS_103120_Phase_203
                                          
	State[301] = LuaS_103120_Phase_301
	State[302] = LuaS_103120_Phase_302
	State[303] = LuaS_103120_Phase_303

	State[401] = LuaS_103120_Phase_401
	State[402] = LuaS_103120_Phase_402
	State[403] = LuaS_103120_Phase_403

	State[500] = LuaS_103120_Phase_500

--全域變數區
--宣告  全域變數區
	HPpercent_103120 = 100 --BOSS 血量百分比
	Boss_103120_GetMemory = 0
	Boss_103120_ReferencePoint = {"p_right_foot","p_left_foot","p_right_hand","p_left_hand"}
	Boss_103120_KillerWeaponList = {496384,496385,496386,496387,496388}
	Boss_103120_FireTargetArray = {}
	Boss_103120_EnergyStore ={}
	Boss_103120_EnergyReSet = {}
	Boss_HP = ReadRoleValue(BossID,EM_RoleValue_MaxHP) --記錄Boss的血量
	Sanctions = {} --制裁者管理陣列
	TankSanctions = {}
	LuaS_103120_Array = {}
	SanctionMark = 0--1.採集加速 2.攻擊加強 3.修復加強
	AI_Order_103120 = 0--行動代號
	Boss_103120_BonusCheck = 0
	--900 初始化
	--901 採集模式
	--902 巡狩模式
	--995 修復模式

--建立PE
	LuaS_103120_PE_DW_00()
	BeginPlot(BossID,"LuaS_103120_PE_DW_04",0) --掛機測試迴圈

--初始化傳值動作
	local ThisObj=FSM_Initial(BossID,State);

--AI最初始將從哪一個階段開始執行
	FSM_DoTransion(ThisObj,0)
	LuaS_103120_Array[BossID]=ThisObj
--迴圈執行AI
	while true do
		sleep(10)
		FSM_Update(ThisObj)
	end
end
----------------------------------------------------------------
LuaS_103120_Phase_Fixing = {}
function LuaS_103120_Phase_Fixing.enter(ThisObj)
	CancelBuff(ThisObj.MonID,508005)--解除裝檢光環
	SetPlot(ThisObj.MonID,"range","",0)

	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_HP)<ReadRoleValue(ThisObj.MonID,EM_RoleValue_MaxHP)*0.2	then
		LuaS_103120_BossDrop(ThisObj.MonID)
	end
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_00001]", 0 )--給玩家的訊息

	SetModeEx(ThisObj.MonID,EM_SetModeType_Fight,false) 
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 
	if	Sanctions ~= nil	then   --刪除舊的制裁者
		local Temp
		for i=1,table.getn(Sanctions),1 do
			for k=1,table.getn(Sanctions[i])-3,1 do
				Temp = Sanctions[i][k]
				if	CheckID(Temp)~=false	then
					DW_CheckThenDel(Temp)
				end
			end
		end
		for i=1,table.getn(TankSanctions),1 do
			if	CheckID(TankSanctions[i])~=false	then
				DW_CheckThenDel(TankSanctions[i])
			end
		end
		Sanctions = {}
		TankSanctions = {}
	end
--<<PE起始>>
--數值宣告
	local BValue_0 = FSM_GetState(ThisObj,0)
	BValue_0.EricMan = {} --處理艾力克研究員的id
	BValue_0.EricManNum = GetMoveFlagCount(780082)-1 --艾力克研究員的總數=旗子減去零號旗
	BValue_0.Sanctions = {}
	BValue_0.SanctionNum = GetMoveFlagCount(780083)-1 --維修制裁者總數 = 旗子減去零號旗



--如果有的話刪掉==>每次都更新設備位置
	if	BValue_0.Equipment~= nil	then--防止空值報錯
		for i=1,BValue_0.EquipmentNum,1 do
			DW_CheckThenDel(BValue_0.Equipment[i][1])
		end
	end
--產生煞金帝國的設備
	BValue_0.Equipment = {}
	BValue_0.EquipmentNum = GetMoveFlagCount(780085)-1 --780085
	local Temp--暫存值
	for i=1,BValue_0.EquipmentNum,1 do
		Temp = DW_CreateObjEX("flag",104757,780085,i,1,0)
		SetPlot(Temp,"dead","LuaS_104761_Dead",0)--永不死亡
		SetModeEx(Temp,EM_SetModeType_Move,false) --關閉移動
		DW_UnFight(Temp)--關閉戰鬥
		Lua_ObjDontTouch( Temp )--不開放點擊
		SetModeEx(Temp,EM_SetModeType_Mark,true) 
		AddBuff(Temp,507891,1,-1)--裝死
		AddBuff(Temp,507899,1,-1)--不可近戰
		BValue_0.Equipment[i] = {}
		BValue_0.Equipment[i][1] = Temp --記錄編號

		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_01",40)--回收能源
	end
	Boss_103120_PH303_Time = nil


--播放動作
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_SLEEP_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_BEGIN)

--修復戰術指令
	AI_Order_103120 = 995
	SanctionMark = 3
--制裁者!!!!!!!!!!!!
	BValue_0.Fixer = {}
--產生維修用制裁者
	local Sanc
	for i=1,BValue_0.SanctionNum,1 do
		Sanc= DW_CreateObjEX("flag",104613,780083,i,0,0)--維修用的制裁者
		DW_UnFight(Sanc)--修改屬性
		Lua_ObjDontTouch( Sanc )--修改屬性
		AddToPartition(Sanc,0)

		BValue_0.Sanctions[i] = Sanc --記錄Sanc的ID  Sanc會被用來記錄其他資料
		BeginPlot(Sanc,"LuaS_103120_SanctionAI",0)
	end

	sleep(10)
--在這一區產生佈置用的艾力克研究員&任務用的NPC
	for i=1,BValue_0.EricManNum,1 do
		BValue_0.EricMan[i] = DW_CreateObjEX("flag",104618,780082,i,1,0)
		SetPlot(BValue_0.EricMan[i],"dead","LuaS_104761_Dead",0)
	end

	BValue_0.QNPCData = {} --0是完全無 1是不能點 2是正常種出
	BValue_0.QNPCData[1] = {116698,1,"LuaS_DW_Crafting"}
	BValue_0.QNPCData[2] = {116589,2}
	BValue_0.QNPCData[3] = {116588,2}
	BValue_0.QNPCData[4] = {116702,1,"Lua_DW_Crouch"}
	BValue_0.QNPCData[5] = {116699,0}
	BValue_0.QNPCData[6] = {116592,2}
	BValue_0.QNPCData[7] = {116701,1}
	BValue_0.QNPCData[8] = {116701,1}
	BValue_0.QNPCData[9] = {116698,1}
	BValue_0.QNPCData[10] = {116699,1}
	BValue_0.QNPCData[11] = {116700,1}
	BValue_0.QNPCData[12] = {116702,1}
	BValue_0.QNPCData[13] = {116698,1}
	BValue_0.QNPCData[14] = {116772,1,"Lua_DW_Crouch"}

	local Data = {}
	Data = BValue_0.QNPCData --標記記憶體

	BValue_0.QuestNPC = {}
	for i=1,table.getn(Data),1 do
		BValue_0.QuestNPC[i] = DW_CreateObjEX("flag",Data[i][1],780088,i,1,0) --參照資料建立任務NPC
		Temp = BValue_0.QuestNPC[i]
		if	Data[i][2] == 0	then --禁止互動
			Lua_ObjDontTouch( Temp )
		elseif	Data[i][2] == 1	then --不能點擊
			SetModeEx(Temp,EM_SetModeType_Mark,false) 
		end
		if	Data[i][3]~=nil	then --執行表演劇情
			BeginPlot(Temp,Data[i][3],0)
		end
	end
	BValue_0.QNPCData = nil --釋放記憶體

--產生可以攻擊的怪物
	if	BValue_0.QMonster == nil	then
		BValue_0.QMonster = {}
	end
	Temp = {} --暫時存放 任務要打的怪物的 資料
	for i=1,GetMoveFlagCount(780089),1 do
		Temp[i] = DW_CreateObjEX("flag",104758,780089,i,1,0)
		SetModeEx(Temp[i],EM_SetModeType_Revive,true) 
		MoveToFlagEnabled(Temp[i], false)
		CallPlot(Temp[i],"DW_MobRandMove_outFight","flag",100,780089,i)
	end
	BValue_0.QMonster = Temp
 --釋放記憶體
	Temp = nil
	Data = nil
end

function LuaS_103120_Phase_Fixing.update(ThisObj)
--判斷是否完成修復
	if	PE_GetActivePhaseIndex(1)~=0	then
		return PE_GetActivePhaseIndex(1)
	end
end

function LuaS_103120_Phase_Fixing.leave(ThisObj)
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,BValue_0.SanctionNum,1 do
		DW_CheckThenDel(BValue_0.Sanctions[i])--刪除維修用的制裁者
	end
--改變型態：回閒置動作
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_END)
--改回戰術指令
	AI_Order_103120 = 901
	SanctionMark = 0
	BValue_0 = nil
end
----------------------------------------------------------------
--閒置狀態(未進入戰鬥)
LuaS_103120_Phase_Fixed = {}
function LuaS_103120_Phase_Fixed.enter(ThisObj)
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_HP,ReadRoleValue(ThisObj.MonID,EM_RoleValue_MaxHP))--補滿血
	ScriptMessage( ThisObj.MonID, -1, 2, "[SC_103120_CON_05000]", 0 )--給玩家的訊息
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_05001]", "0xFF98E0E7" )--給玩家的訊息

	AddBuff(ThisObj.MonID,507181,1,-1)--不能被嘲諷
	AddBuff(ThisObj.MonID,502707,1,-1)--戰鬥外不回血

	local BValue_50 = FSM_GetState(ThisObj,50)
	BValue_50.EricTManNum = GetMoveFlagCount(780084)-1 -- 搗亂的艾力克研究團 = 旗子減去零號旗
	BValue_50.EricTMan = {}
--種出T艾力克研究員
	for i=1,BValue_50.EricTManNum,1 do
		local Eric = DW_CreateObjEX("flag",104618,780084,i,1,0)
		SetPlot(Eric,"dead","LuaS_104761_Dead",0)
		BValue_50.EricTMan[i] = Eric
		CallPlot(BValue_50.EricTMan[i],"LuaS_103120_EricTMan",ThisObj.MonID)
	end
	SetModeEx(ThisObj.MonID,EM_SetModeType_Fight,true) --開啟戰鬥
end

function LuaS_103120_Phase_Fixed.update(ThisObj)
--有人攻擊就進入下個階段
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_HP)<ReadRoleValue(ThisObj.MonID,EM_RoleValue_MaxHP)	then
		PE_SetVar("EricTouchAmount",100)
	end
--艾力克研究員觸發任務的時候
	if	PE_GetActivePhaseIndex(1)~=50	then
		return PE_GetActivePhaseIndex(1)
	end
end

function LuaS_103120_Phase_Fixed.leave(ThisObj)
	AddBuff(ThisObj.MonID,507181,1,-1)--不能被嘲諷
	AddBuff(ThisObj.MonID,502707,1,-1)--戰鬥外不回血
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_05002]", "0xFF98E0E7" )--給玩家的訊息
	ScriptMessage( ThisObj.MonID, -1, 2, "[SC_103120_CON_05003]", 0 )--艾力克的廣播訊息

	local BValue_0 = FSM_GetState(ThisObj,0)
	local BValue_50 = FSM_GetState(ThisObj,50)
	for i=1,BValue_50.EricTManNum,1 do
		SysCastSpellLv(BValue_50.EricTMan[i],BValue_50.EricTMan[i],495735,1)
		WriteRoleValue(BValue_50.EricTMan[i],EM_RoleValue_LiveTime,2)
	end
	for i=1,BValue_0.EricManNum,1 do
		SysCastSpellLv(BValue_0.EricMan[i],BValue_0.EricMan[i],495735,1)
		WriteRoleValue(BValue_0.EricMan[i],EM_RoleValue_LiveTime,2)
	end
--產生高密度能源結晶
	if	Boss_103120_EnergyStore ==nil	then
		Boss_103120_EnergyStore = {}
		Boss_103120_EnergyReSet = {}
	else
		LuaS_116726_AllClear(Boss_103120_EnergyStore)
	end
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,true)
--非相關人員清場
	local Temp = BValue_0.QuestNPC --指標
	for i=1,table.getn(Temp),1 do
		SysCastSpellLv(Temp[i],Temp[i],495735,1) --傳送特效
		WriteRoleValue(Temp[i],EM_RoleValue_LiveTime,1) --代替刪除
	end
	BValue_0.QuestNPC = nil --釋放記憶體
	Temp = BValue_0.QMonster
	for i=1,table.getn(Temp),1 do
		DW_CheckThenDel(Temp[i])
	end
	BValue_0.QMonster = nil --釋放記憶體
	Temp = nil

	CallPlot(ThisObj.MonID,"LuaS_103120_LightCercle",ThisObj.MonID) --裝檢光環
end
----------------------------------------------------------------

--階段A
--第一步：亂數決定狀態
LuaS_103120_Phase_100 = {}
function LuaS_103120_Phase_100.enter(ThisObj)
end

function LuaS_103120_Phase_100.update(ThisObj)
	local RandToMode = DW_Rand(3)
--切換到3種狀態其中1種
	return 100+RandToMode
end

function LuaS_103120_Phase_100.leave(ThisObj)

end
----------------------------------------------------------------
--階段B
--第一步：亂數決定狀態
LuaS_103120_Phase_200 = {}
function LuaS_103120_Phase_200.enter(ThisObj)
end

function LuaS_103120_Phase_200.update(ThisObj)
	local RandToMode = DW_Rand(3)
--切換到3種狀態其中1種
	return 200+RandToMode
end

function LuaS_103120_Phase_200.leave(ThisObj)
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_Register8,999)
end
----------------------------------------------------------------
--階段C
--第一步：亂數決定狀態
LuaS_103120_Phase_300 = {}
function LuaS_103120_Phase_300.enter(ThisObj)
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,table.getn(BValue_0.Equipment),1 do
		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_02",40)--停止回收能源
	end
end

function LuaS_103120_Phase_300.update(ThisObj)
	local RandToMode = DW_Rand(3)
--切換到3種狀態其中1種
	return 300+RandToMode
end

function LuaS_103120_Phase_300.leave(ThisObj)

end
----------------------------------------------------------------
--階段D
--第一步：亂數決定狀態
LuaS_103120_Phase_400 = {}
function LuaS_103120_Phase_400.enter(ThisObj)
end

function LuaS_103120_Phase_400.update(ThisObj)
	local RandToMode = DW_Rand(3)
--切換到3種狀態其中1種
	return 400+RandToMode
end

function LuaS_103120_Phase_400.leave(ThisObj)

end
----------------------------------------------------------------
--階段E
--絕對無敵
LuaS_103120_Phase_500 = {}

function LuaS_103120_Phase_500.enter(ThisObj)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_50000]", 0 )--給玩家的訊息
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_50001]", C_Red )--給玩家的訊息
	if	HPpercent_103120>74	then
		AddBuff(ThisObj.MonID,507407,0,-1)
	else
		AddBuff(ThisObj.MonID,507407,1,-1)
	end
	AI_Order_103120 = 901 --修復模式
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_SLEEP_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
end

function LuaS_103120_Phase_500.update(ThisObj)
--檢查當前階段
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=500	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --制裁者控管
--能源結晶產生控管
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)
end

function LuaS_103120_Phase_500.leave(ThisObj)
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_END)

	CancelBuff(ThisObj.MonID,507407)
end

-------------------------------------------------------------
function LuaS_103120_TouchWillDie()
	local Target = TargetID()
	local Owner = OwnerID()
	if	CheckDistance(Owner,Target, 115)	and
		ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	and
		ReadRoleValue(Target,EM_RoleValue_IsDead)==0	and
		ReadRoleValue(Owner,EM_RoleValue_Register8)==999	then
DeBugMSG(0,0,"You Got Killed!!")
		KillID(Target,Target)--自殺
	end
end

--------------------------------------------------------------------------
function LuaS_103120_ForceTouch()
--沒有buff的玩家就是離開力場產生器
	if	CheckBuff(OwnerID(),507775)==false	then
--剛進來的人給他執行劇情
		AddBuff(OwnerID(),507775,1,3)
		CallPlot(OwnerID(),"LuaS_103120_ForceTouch_Execute",TargetID())
	end
end

function LuaS_103120_ForceTouch_Execute(Maker)
	while	true	do
		sleep(10)
--如果力場產生器消失 跳出 解除buff
		if	CheckID(Maker)==false	then
			CancelBuff(OwnerID(),507775)
			break
		end
--如果離力場產生器太遠 跳出 解除buff
--在範圍內就持續上buff
		if	CheckDistance(OwnerID(),Maker, 35)	then
			AddBuff(OwnerID(),507775,1,3)
		else
			CancelBuff(OwnerID(),507775)
			break
		end
	end
end