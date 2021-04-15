-------------------------------Initialization--------------------------------------------
function kg_Z13PE03_Init()
	Lua_Zone13_PE03_GlobalSet()
	Lua_Zone13_PE01_PESet()
end

function Lua_Zone13_PE03_GlobalSet()--變數宣告
	Zone13_PE03_PEIndex = 1303
	Zone13_PE03_PHIndex = { 100, 200, 300 }
	Zone13_PE03_Var_ForgedBox={}--玩家施放的假箱子，每筆箱子紀錄被影響的怪物
	
	Zone13_PE03_Var = {}
	Zone13_PE03_Var["MapID"] = 366
	Zone13_PE03_Var["CheckTime"] = 30
	
	Zone13_PE03_Var["Enemy"] = {	105269,	--恢復良好的亞人
					105270	--依然虛弱的亞人
					--兇猛的古代亞人
					}
	Zone13_PE03_Var["Group"] = {}			--物資掠奪者群組(亞人+貨物)
	Zone13_PE03_Var["Friendly"] = { 105301,	--守備的冒險員
					105316,	--受阻擾的運貨員
					105317	--準備出發的運貨員
					}
	Zone13_PE03_Var["QuestBox"]	= 117583	--被搶奪的貨物
	--Zone13_PE03_Var["QuestCar"] = 105304	--推車
	--Zone13_PE03_Var["QuestArrow"] = 117509 	--箭頭
	Zone13_PE03_Var["FlagID"] = {	780875, 		-- 旗標號碼
					780876
					}
end

function Lua_Zone13_PE03_PESet()--PE功能
	local PE_Name = "SC_PE_ZONE13_03_NAME"					-- 內外交迫的凡蓋德營地
	local PE_Desc = "SC_PE_ZONE13_03_DESC"					-- 在被偷襲失去營地後，凡蓋德小隊長建立了臨時性的據點，在一切還很慌亂的時候，亞人們再次朝這個據點展開攻擊，並試圖搶奪物資！
	local PEIndex = Zone13_PE03_PEIndex
	local PHIndex = Zone13_PE03_PHIndex
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- 新增一個事件
	PE_AddRegion( PEIndex , Zone13_PE03_Var["MapID"] )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
	PE_AddPhase( PEIndex , 10 , "SC_PE_ZONE13_03_PH1_NAME", "SC_PE_ZONE13_03_PH1_DESC", 0 , 1 , 1 , 0 )
	PE_PH_AddObjective_Greater( PEIndex , 10, 10, "", "", "" , 0, 1,  true )
	PE_OB_SetVisible( PEIndex, 10, 10, false )
	PE_SetScoreVisible( PEIndex, false )--不顯示積分
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_Zone13_PE03_Leave" )--離開區域
	PE_Start( PEIndex , 10 )-- 事件啟動
end

function Lua_Zone13_PE03_Leave( PEIndex , Player )
	Lua_Zone13_PE03_ClearPlayerBuff( Player )
end

function LuaPE_kg_GetBuff()
	local Player = TargetID()
	Lua_Zone13_PE03_ClearPlayerBuff( Player )
	CancelBuff(Player , 508745 )
	LuaPE_KS_GetBuff( Player )
end

function LuaPE_kg_CleanBuff()
	local Player = TargetID()
	Lua_Zone13_PE03_ClearPlayerBuff( Player )
	CancelBuff(Player , 508745 )
	LuaPE_KS_CleanBuff( Player )
end

function Lua_Zone13_PE03_ClearPlayerBuff( Player )
	local Buff= { 508736, 508743 , 508744 ,508746 ,508880 }
	for i in pairs(Buff) do
		CancelBuff(Player,Buff[i])
	end
end

function Lua_Zone13_PE03_CtrlInit()--物資掠奪者中控器初始化
	Sleep(10)
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl , EM_RoleValue_Register10 , 0 )	--貨物目前被玩家拿走的數量
	WriteRoleValue( Ctrl , EM_RoleValue_Register9, kg_Rand(4) )	--機密文件搜尋箭頭所在位置
	kg_CtrlInit(Ctrl)
	local Enemy = Zone13_PE03_Var["Enemy"]
	local QuestBox = Zone13_PE03_Var["QuestBox"]
	local TempGroup = SearchRangeNPC( Ctrl , 100 )	--中控器搜索範圍
	local NPCGroup = {}
	NPCGroup["Ctrl"]=Ctrl
	NPCGroup["Enemy"]={}
	NPCGroup["Box"]={}
	for i in pairs(TempGroup) do
		if ReadRoleValue( TempGroup[i],EM_RoleValue_PID )==130304 then 		--物資掠奪者的亞人
			table.insert(NPCGroup["Enemy"] , TempGroup[i])
		end
		if ReadRoleValue( TempGroup[i], EM_RoleValue_OrgID ) == QuestBox  then	--判定OrgID是否為貨物
			table.insert(NPCGroup["Box"] , TempGroup[i])
		end
	end
	local Group = Zone13_PE03_Var["Group"]
	local GroupNum =0
	if  Group[1]==nil then
		GroupNum=1
	else
		GroupNum = table.getn(Group)+1
	end
	Group[GroupNum]=NPCGroup--先插位
	WriteRoleValue( Ctrl , EM_RoleValue_Register1 , GroupNum )			--群組中控器記住自己所屬的群組編號
	for i in pairs(NPCGroup["Enemy"]) do
		WriteRoleValue( NPCGroup["Enemy"][i] , EM_RoleValue_Register1 , GroupNum )	--每個亞人都記住自己所屬的群組編號
		WriteRoleValue( NPCGroup["Enemy"][i] , EM_RoleValue_Register2 , Ctrl )		--每個亞人都記住該群組的中控器
		--Say( NPCGroup["Enemy"][i],"Ready!")
	end
	for i in pairs(NPCGroup["Box"]) do
		WriteRoleValue( NPCGroup["Box"][i] , EM_RoleValue_Register1 , GroupNum )	--每個貨物都記住自己所屬的群組編號
		WriteRoleValue( NPCGroup["Box"][i] , EM_RoleValue_Register2 , Ctrl )		--每個貨物都記住該群組的中控器
		BeginPlot( NPCGroup["Box"][i] , "Lua_Zone13_PE03_QuestBoxInit" , 0 )
	end
	DebugMsg( 0,0,"GroupID = "..table.getn(Group) )
end

function Lua_Zone13_PE03_QuestBoxInit()--貨物初始化
--EM_RoleValue_Register10 貨物被玩家點選綁定中
	local Box = OwnerID()
	WriteRoleValue( Box , EM_RoleValue_Register10, 0 )	--滑鼠點選後鎖定
	WriteRoleValue( Box , EM_RoleValue_Register9, 0 )	--偵測文件箭頭鎖定
	SetModeEx( Box , EM_SetModeType_Mark, TRUE)---可點選
	SetPlot( Box,"touch","Lua_Zone13_PE03_TouchQuestBox",30 )
	SetModeEx( Box , EM_SetModeType_Show, TRUE )--是否繪製出模型
	--Say( Box , "Ready" )
	DebugMsg(0,0,"BoxInit")
end

function Lua_Zone13_PE03_TouchQuestBox()--玩家使用貨物
	local Box = TargetID()
	local Player = OwnerID()
	if CheckBuff(Player,508736)~=TRUE then	--玩家身上沒有偽裝則呼叫同群組的亞人過來
		local GroupID = ReadRoleValue( Box , EM_RoleValue_Register1 )--讀取貨物所在的群組ID
		local Group = Zone13_PE03_Var["Group"][GroupID]
		for i in pairs(Group["Enemy"]) do
			if CheckBuff(Group["Enemy"][i] , 508737)~=true and CheckBuff(Group["Enemy"][i] , 508738)~=true then
				SysCastSpellLv( Player, Group["Enemy"][i] , 496946, 0 )--增加仇恨
			end
		end
	end
	if ReadRoleValue(Box,EM_RoleValue_Register10)==0 and ReadRoleValue(Box,EM_RoleValue_Register9)==0 then--判定是否被玩家鎖定而且箭頭沒出現
		WriteRoleValue(Box,EM_RoleValue_Register10, 1 )	--滑鼠點選後鎖定
		if BeginCastBarEvent( Player, Box , "[SC_PE_ZONE13_03_CASTBARSTRING]", 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 , "Lua_Zone13_PE03_QuestBoxTriger")~=1 then
			ScriptMessage( Box, Player, 0,"[SAY_NPC_BUSY]", 0 )
		end
	elseif ReadRoleValue(Box,EM_RoleValue_Register9)==1 and CheckBuff(Player,508715)==true and ReadRoleValue(Box,EM_RoleValue_Register10)==0 then--這是機密buff
		WriteRoleValue(Box,EM_RoleValue_Register10, 1 )	--滑鼠點選後鎖定
		if BeginCastBarEvent( Player, Box , "[SC_PE_ZONE13_03_CASTBARSTRING]", 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 , "Lua_Zone13_PE03_QuestBoxTriger")~=1 then
			ScriptMessage( Box, Player, 0,"[SAY_NPC_BUSY]", 0 )
		end
	else
		ScriptMessage( Box, Player, 0,"[SAY_NPC_BUSY]", 0 )
	end
end

function Lua_Zone13_PE03_QuestBoxTriger( ObjID, CheckStatus )
	local Player = OwnerID()
	local Box = TargetID()
	if CheckStatus >0  then
		EndCastBar( Player,CheckStatus )
		if CheckBuff(Player,508712)==true then--凡蓋德奪還者
			CallPlot(Box,"Lua_Zone13_PE03_QuestBoxReset",Player )
			ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_03_MESSAGE02]" , C_SYSTEM )--你搶回了被搶奪的物資！
		elseif CheckBuff(Player,508715)==true then--這是機密buff
			if ReadRoleValue(Box,EM_RoleValue_Register9)==1 and  CheckBuff(Player,508880)~=true then--只要玩家看的到箭頭而且有buff都可以拿
				WriteRoleValue( Box,EM_RoleValue_Register10,0)--解除鎖定
				AddBuff( Player,508880,0,-1 )--機密文件
				AddBuff( Player,508746,0,-1 )--格殺勿論
				ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_03_MESSAGE05]" , 0 )--你已經拿到機密文件！快拿回去給撒達里．安吉恩！
			else	--玩家點錯箱子或身上有機密文件
				WriteRoleValue( Box,EM_RoleValue_Register10,0)
				ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_03_MESSAGE03]" , 0 )--你什麼也沒找到。
			end
		else
			WriteRoleValue( Box,EM_RoleValue_Register10,0 )
			ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_03_MESSAGE03]" , 0 )--你什麼也沒找到。
		end
	else
		EndCastBar( Player,CheckStatus)
		WriteRoleValue( Box,EM_RoleValue_Register10,0)
	end
end

function Lua_Zone13_PE03_QuestBoxReset( Player )	--貨物被拿取後進入冷卻狀態，如果整個群組的箱子都被拿就進入倒數冷卻
	local Box = OwnerID()
	ks_QuestKill( Player, 105315, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say(Player,"I Get 1 QuestKey!"  )
	
	Hide(Box)
	SetModeEx( Box , EM_SetModeType_Mark, FALSE)---可點選
	SetModeEx( Box , EM_SetModeType_Show, FALSE )--是否繪製出模型
	Show(Box,0)
	SetPlot( Box,"touch","",30 )
	local Ctrl = ReadRoleValue( Box,EM_RoleValue_Register2 )
	local BoxCount = ReadRoleValue( Ctrl , EM_RoleValue_Register10 )+1
	if BoxCount>=4 then
		local GroupID = ReadRoleValue( Box , EM_RoleValue_Register1 )--讀取貨物所在的群組ID
		local Group = Zone13_PE03_Var["Group"][GroupID]
		for i=1,table.getn(Group["Enemy"]) do--對群組內的亞人加上"失去物資"
			AddBuff(Group["Enemy"][i],508748,0,-1)--失去物資
		end
		--508748
		Sleep(50)--所有貨物的冷卻時間
		DebugMsg(0,0,"BoxReset!")
		for i=1,table.getn(Group["Box"]) do--重生同群組的所有貨物
			BeginPlot( Group["Box"][i] ,"Lua_Zone13_PE03_QuestBoxInit",1 )
		end
		for i=1,table.getn(Group["Enemy"]) do--取消同群組的失去物資狀態
			CancelBuff(Group["Enemy"][i],508748)--失去物資
		end
		WriteRoleValue( Ctrl , EM_RoleValue_Register10 , 0 )--中控器的貨物計量歸零
	else
		WriteRoleValue( Ctrl , EM_RoleValue_Register10 , BoxCount )
	end
end


---------------------------------CheckType----------------------------------------
function Lua_Zone13_PE03_CheckArea01()--搜尋附近是否有被奪走的貨物(其實是找中控器),而且亞人距離要超過某個職以上
	local Oid = OwnerID()--玩家
	--Say(Oid,"Zone13PE03_CheckArea01...")
	local Group =  Zone13_PE03_Var["Group"]
	for i in pairs(Group) do
		local TargetCtrl=Group[i]["Ctrl"]
		--Say(Oid,"SearchCtrl= ".. TargetCtrl.." ,Distance= "..GetDistance( Oid,TargetCtrl ) )
		if GetDistance( Oid,TargetCtrl )<=100 then
			--Say( TargetCtrl , "Yo... "..TargetCtrl )
			local EnemyGroup = Group[i]["Enemy"]
			for j in pairs(EnemyGroup) do
				if GetDistance(EnemyGroup[j],Oid)<=140 and ReadRoleValue(EnemyGroup[j],EM_RoleValue_Register7)==0  then
					ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR02]" , 0 )--技能條件不符
					return false
				end
			end
			--Say(Oid,"No Enemy Here...")
			WriteRoleValue(Oid,EM_RoleValue_Register5,TargetCtrl )--在玩家身上放最近的中控器ID
			return true
		else
			--Say(Oid,"No Ctrl.....")
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR02]" , 0 )--技能條件不符
	return false
end

function Lua_Zone13_PE03_CheckArea02()--搜尋機密文件的區域判定
	local Oid = OwnerID()
	local Group =  Zone13_PE03_Var["Group"]
	if CheckBuff(Oid,508745)==TRUE then
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_MESSAGE04]" , 0 )--你已經找回機密文件！
		return FALSE
	elseif CheckBuff(Oid,508880)==TRUE then
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_MESSAGE05]" , 0 )--你已經拿到機密文件！快拿回去給撒達里．安吉恩！
		return FALSE
	else
		for i=1 , table.getn( Group ) do
			local TargetCtrl=Group[i]["Ctrl"]
			if GetDistance( Oid,TargetCtrl )<=100 then
				DebugMsg(0,0,"Ctrl="..TargetCtrl.." ,Distance="..GetDistance( Oid,TargetCtrl ) )
				local BoxGroup = Group[i]["Box"]
				for i in pairs(BoxGroup) do
					if GetModeEx( BoxGroup[i], EM_SetModeType_Show )==true then
						DebugMsg(0,0,"Box....")
						WriteRoleValue(Oid,EM_RoleValue_Register5,TargetCtrl )--在玩家身上放最近的中控器ID
						return true
					end
				end
				ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
				return false
			end
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return FALSE
end

function Lua_Zone13_PE03_CheckBox()--檢查是否為貨物
	local Oid = OwnerID()--使用者
	local Tid =TargetID()
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )== Zone13_PE03_Var["QuestBox"] then
		return TRUE
	end
	
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone13_PE03_CheckForgedBox()--檢查玩家身上的假木箱
	local Oid = OwnerID()
	local ForgedBox=ReadRoleValue(Oid,EM_RoleValue_Register9 )
	if CheckID(ForgedBox)==TRUE and ReadRoleValue(ForgedBox,EM_RoleValue_OrgID )==117507 and ReadRoleValue(ForgedBox,EM_RoleValue_Register8)==1 then
		return TRUE
	end
	
	ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR01]" , 0 )--你沒有假貨物
	return FALSE
end

function Lua_Zone13_PE03_CheckBuff01()--檢查亞人身上是否有被監視與艾力克標記，標記檢查用
	local Oid =OwnerID()
	local Tid = TargetID()
	local Enemy = Zone13_PE03_Var["Enemy"]
	for i=1, table.getn( Enemy ) do
		if ReadRoleValue( Tid, EM_RoleValue_OrgID ) == Enemy[i] then
			if CheckBuff(Tid,508739)~=TRUE and CheckBuff(Tid,508741)~=TRUE and CheckBuff(Tid,508742)~=TRUE and CheckBuff(Tid,508740 )~=TRUE and KS_InCombat(Tid)~=TRUE then
				return TRUE
			end
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone13_PE03_CheckType01()--檢查是否為亞人
	local Tid = TargetID()--目標
	local Oid = OwnerID()--使用者
	local Enemy = Zone13_PE03_Var["Enemy"]
	for i=1, table.getn( Enemy ) do
		if ReadRoleValue( Tid, EM_RoleValue_OrgID ) == Enemy[i] then
			return true
		end
	end

	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE03_CheckType02()--檢查NPC是否為撒達里．安吉恩
	local Tid = TargetID()--目標
	local Oid = OwnerID()--使用者
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==117508 and CheckBuff(Oid,508880)==TRUE then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone13_PE03_CheckType03()--檢查NPC是否為老練的送貨員
	local Tid = TargetID()--目標
	local Oid = OwnerID()--使用者
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==117510 then
		if CheckBuff(Oid,508745)==true then
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR03]" , 0 )--你已經完成任務了
			return false
		else
			return true
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone13_PE03_CheckType04()--檢查NPC是否為諾德．史托凡
	local Tid = TargetID()--目標
	local Oid = OwnerID()--使用者
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==117511 then
		if CheckBuff(Oid,508745)==true then
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR03]" , 0 )--你已經完成任務了
			return false
		else
			return true
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone13_PE03_CheckType05()--檢查自己是否在送貨員附近且送貨員非戰鬥
	local Oid = OwnerID()--使用者
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if kg_CheckLive(QuestMember)==TRUE and  GetDistance(Oid,QuestMember)<=100  and KS_InCombat(QuestMember)~=TRUE then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR02]" , 0 )--技能條件不符
	return FALSE
end

function Lua_Zone13_PE03_CheckType06()--檢查自己是否在送貨員附近且送貨員戰鬥中
	local Oid = OwnerID()--使用者
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if HateListCount(QuestMember)>0 then --KS_InCombat(QuestMember)==TRUE then
		DebugMsg(0,0,QuestMember)
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return FALSE
end

function Lua_Zone13_PE03_CheckType07()--檢查自己是否在送貨員附近
	local Oid = OwnerID()--使用者
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if kg_CheckLive(QuestMember)==TRUE and  GetDistance(Oid,QuestMember)<=100  then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return FALSE
end

function Lua_Zone13_PE03_CheckType08()--檢查目標是否為死亡之花
	local Tid = TargetID()--目標
	local Oid = OwnerID()--使用者
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==105318 or ReadRoleValue( Tid , EM_RoleValue_OrgID )==105183 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return FALSE
end

function Lua_Zone13_PE03_CheckType09()--檢查目標是否為死亡之花或貨車
	local Tid = TargetID()--目標
	local Oid = OwnerID()--使用者
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==105318 or ReadRoleValue( Tid , EM_RoleValue_OrgID )==105183 or ReadRoleValue( Tid , EM_RoleValue_OrgID )==105304 then
		return TRUE
	end
	return FALSE
end

function Lua_Zone13_PE03_CheckMap()--檢查區域，亞人偽裝使用判定
	local Oid = OwnerID()
	if DW_CheckMap( OID , Zone13_PE03_Var["MapID"] ) == true then
		return true
	end	
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end
------------------------------Born-----------------------------------------
function Lua_Zone13_PE03_Born01()--物資掠奪者亞人初始化
	local Oid = OwnerID()
	SetFlag( Oid, 544801, 1 )--關閉帕奇鼠
	WriteRoleValue(Oid,EM_RoleValue_Register10,0)--惱羞成怒時記住玩家的ID
	WriteRoleValue(Oid,EM_RoleValue_Register7,0)--亞人死亡
	SetPlot( Oid , "DEAD", "Lua_Zone13_PE03_Dead01", 0 )--死亡劇情
	--Say( Oid ,"Ready!" )
end

function Lua_Zone13_PE03_Born02()--守備者群組NPC初始化
	local Oid = OwnerID()
	WriteRoleValue(Oid,EM_RoleValue_PID,130301)
	SetFlag( Oid, 544801, 1 )--關閉帕奇鼠
	SetPlot( Oid , "DEAD", "Lua_Zone13_PE03_Dead02", 0 )--死亡劇情
	AddBuff(Oid,508871,0,-1)--每10S切換法術
	--Say( Oid ,"Ready!" )
end

function Lua_Zone13_PE03_10sChangeBuff()--隱藏Buff每10秒觸發劇情
	math.randomseed(math.random(10000, 99999))
	local Oid =OwnerID()
	local BuffID = { 508750,508751,508752,508753 }
	local randnum = math.random(4)
	if CheckBuff(Oid, 508754 )~=TRUE then
		AddBuff(Oid,BuffID[randnum],0,-1)
		--Say(Oid,"BuffRand= "..randnum )
	end
end
------------------------------Dead----------------------------------------------
function Lua_Zone13_PE03_Dead01()	--亞人死亡，給守護者疲勞
	WriteRoleValue(OwnerID(),EM_RoleValue_Register7,1)--亞人死亡
	local Tid =TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==130301 and CheckBuff(Tid,508876)~=TRUE then--為守護者而且守護者身上沒有疲勞免疫
		AddBuff( Tid , 508749 , 0 , -1 )--疲勞
	end
end

function Lua_Zone13_PE03_Dead02()	----守備者群組NPC死亡
	
end

function Lua_Zone13_PE03_Dead03()	--送貨員死亡
	local QuestMember =OwnerID()
	local QuestCar = ReadRoleValue(QuestMember,EM_RoleValue_Register9)
	DelObj(QuestCar)
end

function Lua_Zone13_PE03_Dead04()	--貨車死亡
	local QuestCar =OwnerID()
	local QuestMember = ReadRoleValue(QuestCar,EM_RoleValue_Register9)
	DelObj(QuestMember)
end
-----------------------------Function-------------------------------
function Lua_Zone13_PE03_SearchArea( Player )--搜尋玩家附近有沒有區域中控器
	local Group =  Zone13_PE03_Var["Group"]
	for i=1 , table.getn( Group ) do
		local TargetCtrl=Group[i]["Ctrl"]
		if GetDistance(Player,TargetCtrl)<=100 then
			DebugMsg(0,0,"Ctrl Find! ")
			return TargetCtrl
		end
	end
	DebugMsg(0,0,"No Ctrl! ")
	return 0
end
-----------------------------------Test-------------------------------------------
function kg_Zone13PE3_PrintGroup()--列出物資掠奪者群組
	local Group = Zone13_PE03_Var["Group"]
	if Group[1]~=nil then
		for i=1 , table.getn(Group) do--群組中的每一筆資料
			DebugMsg(0,0,"===============分隔線===================")
			DebugMsg(0,0,"Ctrl = "..Group[i]["Ctrl"] )
			for j in pairs(Group[i]["Enemy"] ) do
				DebugMsg(0,0,"Enemy_"..j.." = "..Group[i]["Enemy"][j] )
			end
			for k in pairs(Group[i]["Box"] ) do
				DebugMsg(0,0,"Box_"..k.." = "..Group[i]["Box"][k] )
			end
		end
	else
		DebugMsg(0,0,"Group==nil  !!")
	end
end

function kg_Zone13PE3_GetCtrlGroup()--對群組中控器使用，印出該中控器的群組成員
	DebugMsg(0,0,"===============分隔線===================")
	local Ctrl = OwnerID()
	local GroupID = ReadRoleValue(Ctrl,EM_RoleValue_Register1)
	local Group = Zone13_PE03_Var["Group"][GroupID]
	DebugMsg(0,0,"Ctrl = "..Group["Ctrl"] )
	for j in pairs(Group["Enemy"] ) do
		DebugMsg(0,0,"Enemy_"..j.." = "..Group["Enemy"][j] )
	end
	for k in pairs(Group["Box"] ) do
		DebugMsg(0,0,"Box_"..k.." = "..Group["Box"][k] )
	end
end