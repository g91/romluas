-------------------------------Initialization--------------------------------------------
function kg_Z14PE01_Init()
	Lua_Zone14_PE01_GlobalSet()
	Lua_Zone14_PE01_PESet()
end

function Lua_Zone14_PE01_GlobalSet()--變數宣告
	Zone14_PE01_PEIndex = 1401
	Zone14_PE01_PHIndex = { 100, 200 }
	Zone14_PE01_Phase = 1
	Zone14_PE01_PowerNPClimit = 5
	Zone14_PE01_NpcDebuffMax={30,4}	--[1]著魔  [2]考慮換人
	Zone14_PE01_BossFailMax=4		--boss 失敗上限

	Zone14_PE01_Var = {}
	Zone14_PE01_Var["BossFail"]=0	--Boss被趕跑的次數
	Zone14_PE01_Var["CurrentDeBuff"]=0	--當等於0時表示亞度妮絲不存在
	Zone14_PE01_Var["GlobalDeBuffID"]={	508965,	--汪洋中的小舟
						508966,	--耐力考驗
						508967,	--雪上加霜
						509104	--瘋狂意志
						}
	Zone14_PE01_Var["NPCBuffID"] = {	508960,	--著魔
						508961,	--卡澤的心腹
						508962,	--考慮換人
						508963,	--亞度尼斯助手
						508964	--亞度尼斯
						}
	Zone14_PE01_Var["MapID"] = 418
	Zone14_PE01_Var["Friend"] = { 	105338,	--冒險者--PID:140101
					105423,	--領隊
					105424,	--有經驗的
					105425,
					105426,	--有經驗的
					105427
					}
	Zone14_PE01_Var["Enemy"] = {	105339,	--村民--PID:140102
					105580,
					105581,
					105582
					}

	Zone14_PE01_Var["PowerFriend"] = {}		--
	Zone14_PE01_Var["PowerEnemy"]={}		--
	Zone14_PE01_Var["PowerBoss"] = 0
	Zone14_PE01_Var["GlobalCtrl"] = 0	--全域中控器
	Zone14_PE01_Var["NPCGroup"] = {}		--對話群組(冒險者+村民)
	Zone14_PE01_Var["TrashNPC"] = {}
end

function Lua_Zone14_PE01_PESet()--PE功能
	local PE_Name = "SC_PE_ZONE14_01_NAME"					-- 內外交迫的凡蓋德營地
	local PE_Desc = "SC_PE_ZONE14_01_DESC"					-- 在被偷襲失去營地後，凡蓋德小隊長建立了臨時性的據點，在一切還很慌亂的時候，亞人們再次朝這個據點展開攻擊，並試圖搶奪物資！
	local PEIndex = Zone14_PE01_PEIndex
	local PHIndex = Zone14_PE01_PHIndex
	local TestID = 1
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- 新增一個事件
	PE_AddRegion( PEIndex , Zone14_PE01_Var["MapID"] )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區

	local PH_Name = {	"SC_PE_ZONE14_01_PH1_NAME",	--潛伏的亞度尼斯
						"SC_PE_ZONE14_01_PH2_NAME"	--亞度尼斯是德莉亞的心腹之一，擅長易容喬裝，在拉索斐亞進行暗中破壞......
					}

	local PH_Desc = {	"SC_PE_ZONE14_01_PH1_DESC",--暗潮洶湧
						"SC_PE_ZONE14_01_PH2_DESC"--不能讓其他的冒險者發現這些情況，使士氣受到打擊，和亞度尼斯的對抗只能在暗地裡進行......
					}
	local PE_FactorName = {	"SC_PE_ZONE14_01_FA1_NAME",	--揭穿亞度尼斯
					"SC_PE_ZONE14_01_FA2_NAME"	--亞度尼斯歸來
					}
	local PE_FactorDesc = {		"SC_PE_ZONE14_01_FA1_DESC",	--想要亞度尼斯無法發揮影響力，就必須先找出他現在的偽裝是什麼。
					"SC_PE_ZONE14_01_FA2_DESC"	--亞度尼斯雖然暫時敗退，但是換張新的面孔用不了他太多的時間。
					}
	--DebugMsg( 0,0,PHIndex[1].." and "..PHIndex[2] )
	PE_AddPhase( PEIndex , PHIndex[1] , PH_Name[1], PH_Desc[1], 0 , 1 , 1 , 0 )
	PE_AddPhase( PEIndex , PHIndex[2] , PH_Name[2], PH_Desc[2], 0 , 1 , 1 , 0 )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[1], PHIndex[1], PE_FactorName[1], PE_FactorDesc[1], "" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[2], PHIndex[2], PE_FactorName[1], PE_FactorDesc[1], "" , 0, 1,  true )
	PE_OB_SetVisible( PEIndex, PHIndex[1], PHIndex[1], false )
	PE_OB_SetVisible( PEIndex, PHIndex[2], PHIndex[2], false )
	PE_SetScoreVisible( PEIndex, false )--不顯示積分
	PE_SetCallBackOnPlayerEnter (PEIndex, "Lua_Zone14_PE01_Enter" )--進入區域
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_Zone14_PE01_Leave" )--離開區域
	PE_Start( PEIndex , PHIndex[1] )-- 事件啟動
end

function Lua_Zone14_PE01_Enter( PEIndex , Player )
	DebugMsg(0,0,GetName(Player).."("..Player..")".." Enter "..PEIndex );
	--ScriptMessage( Player,Player,0,GetName(Player).."("..Player..")".." Enter "..PEIndex , 0 );
	--ChangeZone( Player, ReadRoleValue(Player,EM_RoleValue_ZoneID) ,1, kg_GetPos(Player) );
	if Zone14_PE01_Phase ==1 and Zone14_PE01_Var["PowerBoss"]~=0 then
		AddBuff( Player, Zone14_PE01_Var["GlobalDeBuffID"][ Zone14_PE01_Var["CurrentDeBuff"] ],0,-1)
	end
end

function Lua_Zone14_PE01_Leave( PEIndex ,Player )
	DebugMsg(0,0,GetName(Player).."("..Player..")".." Leave "..PEIndex );
	--ScriptMessage( Player,Player,0,GetName(Player).."("..Player..")".." Leave "..PEIndex , 0 );
	--ChangeZone( Player, ReadRoleValue(Player,EM_RoleValue_ZoneID) ,0, kg_GetPos(Player) );
	local Buff=Zone14_PE01_Var["GlobalDeBuffID"]
	for i in pairs(Buff) do
		CancelBuff(Player,Buff[i])
	end
end

function Lua_Zone14_PE01_JumpPhase( Phase )
	local PEIndex = Zone14_PE01_PEIndex
	local PHIndex = Zone14_PE01_PHIndex
	DebugMsg(0,0,"PEIndex = "..PEIndex.." ,PHIndex= "..PHIndex[Phase] )
	PE_JumpToPhase( PEIndex, PHIndex[Phase] )
	Zone14_PE01_Phase = Phase
	DebugMsg(0,0,"JumpPhase_"..Phase)
end

-------------------------------Controller Initialization--------------------------------------------
function Lua_Zone14_PE01_GloabalCtrl()
	Sleep(60)
	local Ctrl = OwnerID()
	kg_CtrlInit(Ctrl)
	Zone14_PE01_Var["GlobalCtrl"] = Ctrl
	kg_Zone14_PE01_RandPowerBuff( Zone14_PE01_PowerNPClimit )
	local CurrentDeBuff = Zone14_PE01_Var["CurrentDeBuff"]
	CallPlot( Ctrl,"Lua_Zone14_PE01_GloabalCtrl_CheckAllPowerNPC" , Ctrl )
	while 1 do
		if Zone14_PE01_Phase==1 and Zone14_PE01_Var["PowerBoss"]~=0 then
			CurrentDeBuff = Zone14_PE01_Var["CurrentDeBuff"]+1
			if CurrentDeBuff>3 then CurrentDeBuff=1 end
			kg_Zone14_PE01_ChangeDebuff( CurrentDeBuff )
		end
		Sleep(3000)--五分鐘=3000
	end
end

function Lua_Zone14_PE01_GloabalCtrl_CheckAllPowerNPC( Ctrl )--一定時間檢查並補充領導及NPC
	while 1 do
		Sleep(300)
		--DebugMsg(0,0,"Check AllPowerNPC...")
		Lua_Zone14_PE01_CheckAllPowerNPC(0)
		Lua_Zone14_PE01_CheckAllPowerNPC(1)
		if Zone14_PE01_Phase==1  then
			Lua_Zone14_PE01_CheckAllPowerNPC(2)
		end
	end
end

function Lua_Zone14_PE01_CheckAllPowerNPC( Type )--檢查全區NPC並補位  0:冒險者 1:村民  2:Boss
	local PowerFriend = Zone14_PE01_Var["PowerFriend"]
	local PowerEnemy = Zone14_PE01_Var["PowerEnemy"]
	local PowerBoss = Zone14_PE01_Var["PowerBoss"]
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local PowerNPClimit = Zone14_PE01_PowerNPClimit
	if PowerNPClimit>=table.getn(NPCGroup) then PowerNPClimit=table.getn(NPCGroup) end
	if Type ==0 then
		if table.getn(PowerFriend)<PowerNPClimit then
			local Amount = PowerNPClimit-table.getn(PowerFriend)--缺的數量
			for i=1 , Amount do
				kg_Zone14_PE01_SinglePowerBuff( Type )
			end
		else
			--DebugMsg(0,0,"enough PowerFriend")
		end
	elseif Type ==1 then
		if table.getn(PowerEnemy)<PowerNPClimit then
			local Amount = PowerNPClimit-table.getn(PowerEnemy)--缺的數量
			for i=1 , Amount do
				kg_Zone14_PE01_SinglePowerBuff( Type )
			end
		else
			--DebugMsg(0,0,"enough PowerEnemy")
		end
	elseif Type ==2 then
		if PowerBoss==0 then
			kg_Zone14_PE01_SinglePowerBuff( Type )
		else
			--DebugMsg(0,0,"PowerBoss Still Exist")
		end
	end
end

function Lua_Zone14_PE01_GloabalCtrl_JumpPhase2( Boss )
		Lua_Zone14_PE01_JumpPhase( 2 )
		kg_Zone14_PE01_ChangeDebuff( 0 )--清除場上所有Buff
		--重生亞度妮絲
		Sleep(200)
		Lua_Zone14_PE01_JumpPhase( 1 )
		Zone14_PE01_Var["BossFail"]=0
end

function Lua_Zone14_PE01_GroupCtrl()
	--Lua_Zone14_PE01_GlobalSet()
	--Sleep(20)
	Debuglog(2,"Lua_Zone14_PE01_GroupCtrl Start....")
	local Ctrl = OwnerID()
	kg_CtrlInit(Ctrl)
	WriteRoleValue( Ctrl , EM_RoleValue_Register2 , 0 )--是否有強力冒險者
	WriteRoleValue( Ctrl , EM_RoleValue_Register3 , 0 )--是否有強力村民
	WriteRoleValue( Ctrl , EM_RoleValue_Register4 , 0 )--是否有Boss
	local PID  = ReadRoleValue(Ctrl,EM_RoleValue_PID)
	local FlagID = tonumber(string.sub(PID,1,6))
	local StartNum = tonumber(string.sub(PID,-2,-1))
	WriteRoleValue( Ctrl , EM_RoleValue_Register5 , FlagID )--FlagID
	WriteRoleValue( Ctrl , EM_RoleValue_Register6 , StartNum )--路徑起始編號(逆向)
	local EnemyID = Zone14_PE01_Var["Enemy"][math.random( table.getn(Zone14_PE01_Var["Enemy"]) ) ]--亂數抓ID
	local FriendID = Zone14_PE01_Var["Friend"][math.random( table.getn(Zone14_PE01_Var["Friend"]) ) ]--亂數抓ID
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local TempGroup = SearchRangeNPC( Ctrl , 100 )	--中控器搜索範圍
	local Group = {}
	Group["Ctrl"]=Ctrl
	Group["RefObj"]={}--參考物件(生NPC用的參考座標)
	Group["Enemy"]={}--村民
	Group["Friend"]={}--冒險者
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local GroupNum =0
	if  NPCGroup[1]==nil then
		GroupNum=1
	else
		GroupNum = table.getn(NPCGroup)+1
	end
	Zone14_PE01_Var["NPCGroup"][GroupNum]=Group--先卡位
	WriteRoleValue( Ctrl , EM_RoleValue_Register1 , GroupNum )
	for i in pairs(TempGroup) do
		if ReadRoleValue( TempGroup[i],EM_RoleValue_OrgID )==105340 then		--NPC產生點
			table.insert(Group["RefObj"] , TempGroup[i])
			WriteRoleValue(TempGroup[i] ,EM_RoleValue_Register1,GroupNum)
			WriteRoleValue(TempGroup[i] ,EM_RoleValue_Register2,Ctrl)--將中控器記在NPC產生點的reg1
		end
	end
	local RefObj =  Group["RefObj"]
	local RefObjCount =table.getn(RefObj)
	if RefObjCount%2==0 then	--參考物件為偶數
		for i=1,RefObjCount/2 do
			Lua_Zone14_PE01_ReBornNPC( RefObj[i] , 1 )
		end
		for i=1+RefObjCount/2 , RefObjCount do
			Lua_Zone14_PE01_ReBornNPC( RefObj[i] , 0 )
		end
	else	--參考物件非偶數，村民比冒險者多一位
		local middleNum = math.ceil( RefObjCount/2 )
		for i=1,middleNum do
			Lua_Zone14_PE01_ReBornNPC( RefObj[i] , 1 )
		end
		for i=1+middleNum , RefObjCount do
			Lua_Zone14_PE01_ReBornNPC( RefObj[i] , 0 )
		end
	end
	--NPCGroup[GroupNum]=Group
	--DebugMsg(0,0,"GroupNum = "..GroupNum)
	BeginPlot(Ctrl,"Lua_Zone14_PE01_GCtrlMain",0)
	BeginPlot(Ctrl,"Lua_Zone14_PE01_GroupTalk",1)
end

function Lua_Zone14_PE01_GroupTalk()--群組自動聊天--SC_PE_ZONE14_01_NPCTALK01
	local Ctrl =OwnerID()
	local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Ctrl,EM_RoleValue_Register1)]
	local TalkString = { 	"[SC_PE_ZONE14_01_NPCTALK01]",
				"[SC_PE_ZONE14_01_NPCTALK02]",
				"[SC_PE_ZONE14_01_NPCTALK03]",
				"[SC_PE_ZONE14_01_NPCTALK04]",
				"[SC_PE_ZONE14_01_NPCTALK05]",
				"[SC_PE_ZONE14_01_NPCTALK06]",
				"[SC_PE_ZONE14_01_NPCTALK07]",
				"[SC_PE_ZONE14_01_NPCTALK08]",
				"[SC_PE_ZONE14_01_NPCTALK09]",
				"[SC_PE_ZONE14_01_NPCTALK10]", }
	local Turn = 1--該哪個群組說話
	local RandPick = 0
	local FriendCount = 0
	local EnemyCount =0
	while 1 do
		FriendCount = table.getn( Group["Friend"] )
		EnemyCount = table.getn(Group["Enemy"])
		if Turn==0 then--冒險者說話
			if FriendCount>0 and EnemyCount>0 then
				RandPick = math.random( table.getn( Group["Friend"]) )
				if ReadRoleValue(Group["Friend"][RandPick],EM_RoleValue_Register8)==0 and ReadRoleValue(Group["Friend"][RandPick],EM_RoleValue_Register7)==0 then
					PlayMotion( Group["Friend"][RandPick] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					Say( Group["Friend"][RandPick] , TalkString[kg_Rand(1,5)] )
				end
				Turn=1
			end
		else--村民說話
			if FriendCount>0 and EnemyCount>0 then
				RandPick = math.random( table.getn( Group["Enemy"]) )
				if ReadRoleValue(Group["Enemy"][RandPick],EM_RoleValue_Register8)==0  then
					PlayMotion( Group["Enemy"][RandPick] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					Say( Group["Enemy"][RandPick] , TalkString[kg_Rand(6,10)] )
				end
				Turn=0
			end
		end
		Sleep(50)
	end
end

function Lua_Zone14_PE01_GCtrlMain()
	local Ctrl = OwnerID()
	--Say(Ctrl,"MainStart..")
	local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Ctrl,EM_RoleValue_Register1)]
	local BuffID = Zone14_PE01_Var["NPCBuffID"]
	local timer = 0
	while 1 do
		Sleep(50)--每5秒堆疊
		timer =timer+5
		local FriendBuff = ReadRoleValue(Ctrl,EM_RoleValue_Register2)--0:一般冒險者  1:領導級
		local EnemyBuff = ReadRoleValue(Ctrl,EM_RoleValue_Register3)--0:一般村民 1:助手
		local BossBuff = ReadRoleValue(Ctrl,EM_RoleValue_Register4)
		if table.getn(Group["Enemy"])>0 then--有村民
			if table.getn(Group["Friend"])>0 then--有冒險者
				--DebugMsg(0,0,"Timer= "..timer.." Sec")
				for i in pairs( Group["Friend"] ) do
					if EnemyBuff==0 and BossBuff==0 then--附近只有村民
						if CheckBuff(Group["Friend"][i],BuffID[2])~=TRUE and timer%10==0  and FriendBuff ==0 then--非領導級冒險者
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						elseif CheckBuff(Group["Friend"][i],BuffID[2])~=TRUE and FriendBuff ==1 and timer%20==0 then--群組中有領導級冒險者
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						end
					elseif EnemyBuff==1 and BossBuff==0 then--附近只有助手
						if CheckBuff(Group["Friend"][i],BuffID[2])~=TRUE and timer%5==0  and FriendBuff ==0 then--非領導級冒險者,每5秒+1
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						elseif CheckBuff(Group["Friend"][i],BuffID[2])~=TRUE and FriendBuff ==1 and timer%10==0 then--群組中有領導級冒險者,每10秒+1
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						elseif CheckBuff(Group["Friend"][i],BuffID[2])==TRUE and  timer%10==0 then--本身是領導級冒險者
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						end
					elseif BossBuff==1 then--附近有亞度尼斯
						if  timer%10==0 then
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 3 )
						end
					end
				end
				if Lua_Zone14_PE01_CheckFriendState( Group["Friend"]  )==TRUE and timer%10==0 then--群組中有冒險者的疊加進度緩慢
					for i in pairs(Group["Enemy"]) do
						Lua_Zone14_PE01_AddDeBuff(Group["Enemy"][i],BuffID[3],1)
					end
					for i in pairs( Group["Friend"] ) do	--以防冒險者只被降一次著魔 就持續對村民疊加閃人buff
						WriteRoleValue( Group["Friend"][i] , EM_RoleValue_Register10 , ReadRoleValue( Group["Friend"][i] , EM_RoleValue_Register9 ) )
					end
				end
			else	--群組中有村民沒冒險者
				if timer%10==0 then
					for i in pairs( Group["Enemy"] ) do
						if ReadRoleValue( Group["Enemy"][i] , EM_RoleValue_Register10 )==0 then--玩家沒有成功狀態
							Lua_Zone14_PE01_AddDeBuff( Group["Enemy"][i] , BuffID[3] , 1 )
						end
					end
				end
			end
		else	--群組中沒有村民，清除所有冒險者buff
			for i in pairs( Group["Friend"] ) do
				CancelBuff(Group["Friend"][i] , 508960 )
				WriteRoleValue( Group["Friend"][i] , EM_RoleValue_Register9 , 0 )
				WriteRoleValue( Group["Friend"][i] , EM_RoleValue_Register10 , 0 )
			end
		end
		if timer==20 then timer=0 end--每20秒歸零
	end
end

function Lua_Zone14_PE01_CheckFriendState( FriendGroup )--檢查冒險者群組中的著魔情況
	--DebugMsg(0,0,"CheckFriendState...")
	for i in pairs(FriendGroup) do
		local CurrentLV = ReadRoleValue(FriendGroup[i],EM_RoleValue_Register9)
		local BasicLV = ReadRoleValue(FriendGroup[i],EM_RoleValue_Register10)
		if CurrentLV<BasicLV  then
			--DebugMsg(0,0,"CheckFriendState OK..".." CurrentLV = "..CurrentLV.." ,BasicLV = "..BasicLV )
			return TRUE
		elseif CheckBuff(FriendGroup[i] ,508970)==TRUE then
			--DebugMsg(0,0,"Target have 508970...")
			return TRUE
		else
			--DebugMsg(0,0,"CheckFriendStateFail..".." CurrentLV = "..CurrentLV.." ,BasicLV = "..BasicLV )
		end
	end
	return FALSE
end

function Lua_Zone14_PE01_AddDeBuff( Obj , BuffID , AddLV )--增加debuff
	local BuffLevel = 0
	local NPCBuffID = Zone14_PE01_Var["NPCBuffID"]
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)
	local Ctrl = ReadRoleValue(Obj,EM_RoleValue_Register2)
	if Zone14_PE01_Var["CurrentDeBuff"]==1 and PID==140101 then--所有村民著魔速度+1
		BuffLevel = BuffLevel+AddLV+1
	else
		BuffLevel = BuffLevel +AddLV
	end
	if PID==140101 and CheckBuff(Ctrl,509093)==TRUE then--中控器有魅惑等級降低
		BuffLevel = BuffLevel-KS_CheckBuffLV(Ctrl,509093)
		if BuffLevel<=0 then BuffLevel=1 end
	end
	if PID==140101 and CheckBuff(Obj,509103)==TRUE then --每次受到著魔降1
		BuffLevel = BuffLevel-1
		if BuffLevel<0 then BuffLevel=0 end
		--DebugMsg(0,0,"CheckBuff 509103 Success,BuffLevel = "..BuffLevel )
	end
	--Say(Obj,"AddBuffLevel = "..BuffLevel)
	if PID==140101 and CheckBuff(Obj,508970)~=TRUE then	----著魔停止
		if BuffLevel>0 then
			AddBuff(Obj,BuffID,BuffLevel-1,-1)
			local CurrentBuffLevel = BuffLevel + ReadRoleValue(Obj ,EM_RoleValue_Register9 )
			WriteRoleValue(Obj,EM_RoleValue_Register9,CurrentBuffLevel )--紀錄當前著魔數
			local BasicBuffLevel = BuffLevel + ReadRoleValue(Obj ,EM_RoleValue_Register10 )
			WriteRoleValue(Obj,EM_RoleValue_Register10 ,BasicBuffLevel )--紀錄基本著魔數
			--Say( Obj ,"My CurrentDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register9) )
			--Say( Obj ,"My BasicDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register10) )
		elseif BuffLevel==0 then	--當著魔等級被降到0的話，基本層數要增加
			local BasicBuffLevel = ReadRoleValue(Obj ,EM_RoleValue_Register10 )+1
			WriteRoleValue(Obj,EM_RoleValue_Register10 ,BasicBuffLevel )--紀錄基本著魔數
			--Say( Obj ,"My CurrentDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register9) )
			--Say( Obj ,"My BasicDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register10) )
		end
	elseif PID == 140102 then
		AddBuff(Obj,BuffID,BuffLevel-1,-1)
		--Say( Obj ,"My CurrentDeBuffLv = "..KS_CheckBuffLV( Obj, NPCBuffID[3] ) )
	elseif PID==140101 and CheckBuff(Obj,508970)==TRUE  then
		--Say( Obj ,"My BasicDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register10) )
		--Say( Obj ,"Wahahahahaha.." )
	end

	if ReadRoleValue(Obj,EM_RoleValue_Register9) >=Zone14_PE01_NpcDebuffMax[1] and PID==140101 then--冒險者
		Lua_Zone14_PE01_NPCLeave( Obj )
	elseif KS_CheckBuffLV( Obj, NPCBuffID[3] )>=Zone14_PE01_NpcDebuffMax[2] and PID==140102 then--村民 當閃人buff等級超過4時
		Lua_Zone14_PE01_NPCLeave( Obj )
	end
end

function Lua_Zone14_PE01_EnemyDelayLeave( Obj , DelayTime , Success )
	DelayTime = DelayTime or 1
	Success = Success or 0
	WriteRoleValue( Obj ,EM_RoleValue_Register10, Success )--告知村民他成功了
	Sleep(DelayTime)
	Lua_Zone14_PE01_NPCLeave( Obj )
end

function Lua_Zone14_PE01_NPCLeave( Obj , GoAway , DelayTime , RebornWaitTime )	--指定某個NPC馬上走掉就執行這個 ，會依造PID自動判定
	Obj = Obj or OwnerID()
	GoAway = GoAway or 1
	DelayTime = DelayTime or 30
	RebornWaitTime = RebornWaitTime or 100
	if ReadRoleValue(Obj,EM_RoleValue_Register8)==0 then

	WriteRoleValue( Obj , EM_RoleValue_Register8 , 1 )--進入離開階段
	local Ctrl = ReadRoleValue( Obj,EM_RoleValue_Register2 )
	local FlagID = ReadRoleValue(Ctrl,EM_RoleValue_Register5)
	local StartNum = ReadRoleValue(Ctrl,EM_RoleValue_Register6)

	if CheckBuff(Obj, Zone14_PE01_Var["NPCBuffID"][5])==TRUE and ReadRoleValue(Obj,EM_RoleValue_Register10)==0 then--當村民為boss時
		local BossFail = Zone14_PE01_Var["BossFail"]--Boss被趕跑的次數
		local BossFailMax = Zone14_PE01_BossFailMax
		BossFail = BossFail+1
		DebugMsg(0,0,"BossFail = "..BossFail )
		if Zone14_PE01_Var["CurrentDeBuff"]==2 and BossFail>=( math.ceil( (BossFailMax/2)+BossFailMax ) ) then
			--跳階段，移除場上的雅杜妮絲
			Zone14_PE01_Var["BossFail"]=BossFail
			WriteRoleValue(Ctrl,EM_RoleValue_Register4,0)
			Zone14_PE01_Var["PowerBoss"]=0
			Zone14_PE01_Var["CurrentDeBuff"]=0
			CallPlot( Zone14_PE01_Var["GlobalCtrl"] ,"Lua_Zone14_PE01_GloabalCtrl_JumpPhase2",Obj )
		elseif  BossFail>= BossFailMax then
			--跳階段，移除場上的雅杜妮絲
			Zone14_PE01_Var["BossFail"]=BossFail
			WriteRoleValue(Ctrl,EM_RoleValue_Register4,0)
			Zone14_PE01_Var["PowerBoss"]=0
			Zone14_PE01_Var["CurrentDeBuff"]=0
			CallPlot( Zone14_PE01_Var["GlobalCtrl"] ,"Lua_Zone14_PE01_GloabalCtrl_JumpPhase2",Obj )
		else
			Zone14_PE01_Var["BossFail"]=BossFail
			WriteRoleValue(Ctrl,EM_RoleValue_Register4,0)
			Zone14_PE01_Var["PowerBoss"]=0
			Zone14_PE01_Var["CurrentDeBuff"]=0
		end
	elseif CheckBuff(Obj, Zone14_PE01_Var["NPCBuffID"][5])==TRUE and ReadRoleValue(Obj,EM_RoleValue_Register10)==1 then--當Boss成功地離開
		WriteRoleValue(Ctrl,EM_RoleValue_Register4,0)
		Zone14_PE01_Var["PowerBoss"]=0
		Zone14_PE01_Var["CurrentDeBuff"]=0
	end

	--DebugMsg(0,0,Obj.." ganna go.....")
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)
	local GroupID = ReadRoleValue(Obj,EM_RoleValue_Register1)
	local NPCBuffID = Zone14_PE01_Var["NPCBuffID"]
	local BuffID = {}
	BuffID[140101]=NPCBuffID[2]
	BuffID[140102]=NPCBuffID[4]
	local Group = {}
	if PID==140101 then
		Group = Zone14_PE01_Var["NPCGroup"][GroupID]["Friend"]
	elseif PID==140102 then
		Group = Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]
	end
	--DebugMsg(0,0,"GroupMemberCount = "..table.getn(Group) )
	for i in pairs(Group) do
		if Group[i]==Obj then
			if CheckBuff( Obj, BuffID[PID] )==TRUE then--卡澤的心腹 or 亞度尼斯助手
				local Ctrl = ReadRoleValue( Obj,EM_RoleValue_Register2 )
				if PID == 140101 then
					WriteRoleValue(Ctrl,EM_RoleValue_Register2,0)--移除領導級冒險者
					local PowerFriend = Zone14_PE01_Var["PowerFriend"]
					--DebugMsg(0,0,"PowerFriendNum = "..table.getn(Zone14_PE01_Var["PowerFriend"] ) )
					for i in pairs( PowerFriend ) do
						if Obj==PowerFriend[i] then
							table.remove(PowerFriend ,i )
							--DebugMsg(0,0,"PowerFriendNum = "..table.getn(Zone14_PE01_Var["PowerFriend"] ) )
							break
						end
					end
				elseif PID == 140102 then
					WriteRoleValue(Ctrl,EM_RoleValue_Register3,0)--移除助手村民
					local PowerEnemy = Zone14_PE01_Var["PowerEnemy"]
					--DebugMsg(0,0,"PowerEnemyNum = "..table.getn(Zone14_PE01_Var["PowerEnemy"] ) )
					for i in pairs( PowerEnemy ) do
						if Obj==PowerEnemy[i] then
							table.remove(PowerEnemy ,i )
							--DebugMsg(0,0,"PowerEnemyNum = "..table.getn(Zone14_PE01_Var["PowerEnemy"] ) )
							break
						end
					end
				end
			end
			if PID == 140101 and table.getn( Group)==1 and ReadRoleValue(Obj,EM_RoleValue_Register9)>=Zone14_PE01_NpcDebuffMax[1] then
				--冒險者群組只剩一位而且是著魔超過30的
				--DebugMsg(0,0,"Enemy Success and Leave..." )
				local EnemyGroup = Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]
				for i in pairs(EnemyGroup) do
					CallPlot( EnemyGroup[i] , "Lua_Zone14_PE01_EnemyDelayLeave" , EnemyGroup[i] , 50 , 1 )
				end
			end
			table.insert(Zone14_PE01_Var["TrashNPC"],Obj)
			table.remove(Group ,i )
			break
		end
	end
	--DebugMsg(0,0,"Group_"..GroupID.."_FriendNum = "..table.getn(Zone14_PE01_Var["NPCGroup"][GroupID]["Friend"]) )
	--DebugMsg(0,0,"Group_"..GroupID.."_EnemyNum = "..table.getn(Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]) )
	if PID==140102 and ReadRoleValue(Obj,EM_RoleValue_Register10)==0 then
		SysCastSpellLv(Obj,Obj,497254,0)--放範圍法術讓有隱身術的玩家獲得關鍵表現
	end
	if GoAway==1 then	--決定要用走的還是用傳送的
		CallPlot( Obj , "Lua_Zone14_PE01_GoAway" , Obj  , FlagID , StartNum )
	else
		CallPlot(Obj,"Lua_Zone14_PE01_DelAndReborn",DelayTime  , RebornWaitTime )
	end

	else DebugMsg(0,0,Obj.." Already Leave...") end
end

function Lua_Zone14_PE01_GoAway( Obj , FlagID , StartNum )
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)
	WriteRoleValue(Obj,EM_RoleValue_IsWalk, 0 )	--用走的移動
	local Step = StartNum
	local Goal = 0
	Sleep( kg_Rand(1,15) )--隨機等待一段時間，避免NPC路徑重疊
	Say( Obj,"[SC_PE_ZONE14_01_TALK26]".."......" )
	while 1 do
		if Step>=Goal  then
			if DW_CheckDis( Obj, FlagID, step , 60 ) == true and Step>Goal then
				Step = Step -1
			elseif Step==Goal and  DW_CheckDis( Obj, FlagID, step , 30 ) == true  then
				if PID==140101 then
					WriteRoleValue(Obj,EM_RoleValue_Register6,1)--村民已走到村外
					break
				elseif PID==140102 then
					CallPlot(Obj,"Lua_Zone14_PE01_DelAndReborn",1 , 50 )--3秒後消失,10秒後重生
					break
				end
			else
				KS_Move( Obj, 10 , FlagID , Step )
			end
		end
		Sleep(10)
	end
	------------------冒險者另外移動----------------------
	if PID==140101 then
		--Say(Obj,"Outside..")
		FlagID = 780915
		Step = 0
		Goal = GetMoveFlagCount( FlagID )-1
		while 1 do
			if Step<=Goal  and CheckBuff(Obj,508960)==true then
				if DW_CheckDis( Obj, FlagID, step , 60 ) == true and Step<Goal then
					Step = Step +1
				elseif Step==Goal and  DW_CheckDis( Obj, FlagID, step , 30 ) == true  then
					CallPlot(Obj,"Lua_Zone14_PE01_DelAndReborn",1 , 50 )--3秒後消失,10秒後重生
					break
				else
					KS_Move( Obj, 10 , FlagID , Step )
				end
			elseif CheckBuff(Obj,508960)~=true then
				CallPlot(Obj,"Lua_Zone14_PE01_DelAndReborn",1 , 50 )--3秒後消失,10秒後重生
				break
			end
			Sleep(10)
		end
	end
end

function Lua_Zone14_PE01_ReBornNPC( RefObj , Type ,DelayTime )--依造參考物件產生NPC 0冒險者 1村民
	if DelayTime~=nil then
		if DelayTime>0 then
			Sleep(DelayTime)
		end
	end
	local GroupID = ReadRoleValue(RefObj,EM_RoleValue_Register1)
	local Ctrl = ReadRoleValue(RefObj,EM_RoleValue_Register2)
	local EnemyID = Zone14_PE01_Var["Enemy"][math.random( table.getn(Zone14_PE01_Var["Enemy"]) ) ]--亂數抓ID
	local FriendID = Zone14_PE01_Var["Friend"][math.random( table.getn(Zone14_PE01_Var["Friend"]) ) ]--亂數抓ID
	local RoomID = ReadRoleValue(RefObj,EM_RoleValue_RoomID)
	if Type ==0 then
		local Group = Zone14_PE01_Var["NPCGroup"][GroupID]["Friend"]
		local newFriend = kg_GetPos( RefObj , FriendID )
		kg_ActorInit( newFriend )
		WriteRoleValue(newFriend,EM_RoleValue_Register1,GroupID)
		WriteRoleValue(newFriend,EM_RoleValue_Register2,Ctrl)
		WriteRoleValue(newFriend,EM_RoleValue_Register3,RefObj)
		WriteRoleValue(RefObj,EM_RoleValue_Register3,newFriend)
		WriteRoleValue(newFriend,EM_RoleValue_Register6,0)--已走出村外
		WriteRoleValue(newFriend,EM_RoleValue_Register7,0)--正在與玩家對話中
		WriteRoleValue(newFriend,EM_RoleValue_Register8,0)--已進入離開階段
		WriteRoleValue(newFriend,EM_RoleValue_Register9,0)--實際著魔數
		WriteRoleValue(newFriend,EM_RoleValue_Register10,0)--基本著魔數
		WriteRoleValue(newFriend,EM_RoleValue_PID,140101)
		AddToPartition(newFriend,RoomID)
		table.insert(Group,newFriend)
		--DebugMsg(0,0,"Group_"..GroupID.."_FriendNum = "..table.getn(Zone14_PE01_Var["NPCGroup"][GroupID]["Friend"]) )
	elseif Type==1 then
		local Group = Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]
		local newEnemy = kg_GetPos( RefObj , EnemyID )
		kg_ActorInit( newEnemy )
		WriteRoleValue(newEnemy,EM_RoleValue_Register1,GroupID)
		WriteRoleValue(newEnemy,EM_RoleValue_Register2,Ctrl)
		WriteRoleValue(newEnemy,EM_RoleValue_Register3,RefObj)
		WriteRoleValue(RefObj,EM_RoleValue_Register3,newEnemy)
		WriteRoleValue(newEnemy,EM_RoleValue_Register8,0)--已進入離開階段
		WriteRoleValue(newEnemy,EM_RoleValue_Register10,0)--誘惑冒險者成功
		WriteRoleValue(newEnemy,EM_RoleValue_PID,140102)
		AddToPartition(newEnemy,RoomID)
		table.insert(Group,newEnemy)
		--DebugMsg(0,0,"Group_"..GroupID.."_EnemyNum = "..table.getn(Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]) )
	end
	Debuglog(2,"Lua_Zone14_PE01_ReBornNPC End ".."Type="..Type )
end

---------------------------------function----------------------------------------
function Lua_Zone14_PE01_DelNPC(Type )--刪除對話群組:0全部1村民2冒險者
	Zone14_PE01_Var["PowerFriend"] = {}
	Zone14_PE01_Var["PowerEnemy"]={}
	Zone14_PE01_Var["PowerBoss"] = 0
	Zone14_PE01_Var["CurrentDeBuff"]=0
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	for i in pairs(NPCGroup) do
		local Group = NPCGroup[i]
		if Type==0 then
			for j in pairs(Group["Enemy"] ) do
				if Group["Enemy"][j]~=nil then
					DelObj(Group["Enemy"][j])
				end
			end
			Group["Enemy"]={}
			for j in pairs(Group["Friend"] ) do
				if Group["Friend"][j]~=nil then
					DelObj(Group["Friend"][j])
				end
			end
			Group["Friend"]={}
		elseif Type==1 then
			for j in pairs(Group["Enemy"] ) do
				if Group["Enemy"][j]~=nil then
					DelObj(Group["Enemy"][j])
				end
			end
			Group["Enemy"]={}
		elseif Type==2 then
			for j in pairs(Group["Friend"] ) do
				if Group["Friend"][j]~=nil then
					DelObj(Group["Friend"][j])
				end
			end
			Group["Friend"]={}
		end
	end
	for j in pairs(Zone14_PE01_Var["TrashNPC"]) do
		if Zone14_PE01_Var["TrashNPC"][j]~=nil then
			DelObj(Zone14_PE01_Var["TrashNPC"][j])
		end
	end
	Zone14_PE01_Var["TrashNPC"]={}
end

function kg_Zone14_PE01_PrintGroup()--印出全群組的成員
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	if NPCGroup[1]~=nil then
		DebugMsg(0,0,"===============分隔線===================")
		DebugMsg(0,0,"There are "..table.getn(NPCGroup).." Groups.")
		for z in pairs(NPCGroup) do
			local Group = NPCGroup[z]
			DebugMsg(0,0,"Ctrl_"..z.." = "..Group["Ctrl"])
			for i in pairs(Group["RefObj"] ) do
				DebugMsg(0,0,"RefObj_"..i.." = "..Group["RefObj"][i] )
			end
			for j in pairs(Group["Enemy"] ) do
				DebugMsg(0,0,"Enemy_"..j.." = "..Group["Enemy"][j] )
			end
			for k in pairs(Group["Friend"] ) do
				DebugMsg(0,0,"Friend_"..k.." = "..Group["Friend"][k] )
			end
		end
	else
		DebugMsg(0,0,"Group==nil  !!")
	end
end

function kg_Zone14_PE01_GetCtrlGroup()--對群組中控器使用，印出該中控器的群組成員
	DebugMsg(0,0,"===============分隔線===================")
	local Ctrl = OwnerID()
	local GroupID = ReadRoleValue(Ctrl,EM_RoleValue_Register1)
	local Group = Zone14_PE01_Var["NPCGroup"][GroupID]
	DebugMsg(0,0,"Ctrl = "..Group["Ctrl"] )
	for i in pairs(Group["RefObj"] ) do
		DebugMsg(0,0,"RefObj_"..i.." = "..Group["RefObj"][i] )
	end
	for j in pairs(Group["Enemy"] ) do
		DebugMsg(0,0,"Enemy_"..j.." = "..Group["Enemy"][j] )
	end
	for k in pairs(Group["Friend"] ) do
		DebugMsg(0,0,"Friend_"..k.." = "..Group["Friend"][k] )
	end
end

function kg_Zone14_PE01_ChangeDebuff( CurrentDeBuff )--立刻切換全區域debuff
	Zone14_PE01_Var["CurrentDeBuff"] = CurrentDeBuff--強制指定全域變數
	local DeBuff = Zone14_PE01_Var["GlobalDeBuffID"]
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local PE_PlayerCount = PE_GetActivePlayerGUIDCount(Zone14_PE01_PEIndex)
	if CurrentDeBuff==1 then	--對村民統一下debuff
		--DebugMsg(0,0,"AddBuff 汪洋中的小舟")
		for z in pairs(NPCGroup) do
			local Group = NPCGroup[z]
			for i in pairs(Group["Enemy"]) do
				AddBuff(Group["Enemy"][i],DeBuff[4],0,-1)--瘋狂意志
			end
		end
		if PE_PlayerCount>0 then--對所有玩家上Debuff
			for i=1,PE_PlayerCount do
				local Player = PE_GetActivePlayerGUID(Zone14_PE01_PEIndex)
				for i in pairs(DeBuff) do
					CancelBuff(Player,DeBuff[i])
				end
				AddBuff(Player,DeBuff[CurrentDeBuff],0,-1)--汪洋中的小舟
			end
		end
	elseif CurrentDeBuff==2 then
		--DebugMsg(0,0,"AddBuff 耐力考驗")
		for z in pairs(NPCGroup) do	--取消村民的debuff
			local Group = NPCGroup[z]
			for i in pairs(Group["Enemy"]) do
				CancelBuff(Group["Enemy"][i],DeBuff[1])
			end
		end
		if PE_PlayerCount>0 then--對所有玩家上Debuff
			for i=1,PE_PlayerCount do
				local Player = PE_GetActivePlayerGUID(Zone14_PE01_PEIndex)
				for i in pairs(DeBuff) do
					CancelBuff(Player,DeBuff[i])
				end
				AddBuff(Player,DeBuff[CurrentDeBuff],0,-1)
			end
		end
	elseif CurrentDeBuff==3 then
		--DebugMsg(0,0,"AddBuff 雪上加霜")
		for z in pairs(NPCGroup) do
			local Group = NPCGroup[z]
			for i in pairs(Group["Enemy"]) do	--取消村民的debuff
				CancelBuff(Group["Enemy"][i],DeBuff[1])
			end
		end
		if PE_PlayerCount>0 then--對所有玩家上Debuff
			for i=1,PE_PlayerCount do
				local Player = PE_GetActivePlayerGUID(Zone14_PE01_PEIndex)
				for i in pairs(DeBuff) do
					CancelBuff(Player,DeBuff[i])
				end
				AddBuff(Player,DeBuff[CurrentDeBuff],0,-1)
			end
		end
	elseif CurrentDeBuff==0 then
		--DebugMsg(0,0,"清除所有Debuff")
		for z in pairs(NPCGroup) do
			local Group = NPCGroup[z]
			for i in pairs(Group["Enemy"]) do	--取消村民的debuff
				CancelBuff(Group["Enemy"][i],DeBuff[1])
			end
		end
		if PE_PlayerCount>0 then--對所有玩家清除debuff
			for i=1,PE_PlayerCount do
				local Player = PE_GetActivePlayerGUID(Zone14_PE01_PEIndex)
				for i in pairs(DeBuff) do
					CancelBuff(Player,DeBuff[i])
				end
			end
		end
	end
end

function kg_Zone14_PE01_SinglePowerBuff( Type )--補充一位領導級NPC : 0冒險者,1村民,2Boss
	Type = Type or 0
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local GroupCount = table.getn( NPCGroup )
	local NPCBuff = Zone14_PE01_Var["NPCBuffID"]
	local Group = {}
	local randArray = {}
	if Type==0 then
		for i=1 , GroupCount do
			local FriendNum = table.getn(NPCGroup[i]["Friend"])
			if ReadRoleValue( NPCGroup[i]["Ctrl"],EM_RoleValue_Register2 )==0 and FriendNum>0 then--找出沒有冒險者的群組
				table.insert( randArray,i)
			end
		end
		if table.getn(randArray)>0 then
			local randNum = randArray[math.random( table.getn(randArray) ) ]
			Group = NPCGroup[randNum]
			randNum =math.random( table.getn(Group["Friend"]) )
			local PowerFriend = Group["Friend"][randNum]
			WriteRoleValue(Group["Ctrl"] ,EM_RoleValue_Register2,1)
			AddBuff(PowerFriend,NPCBuff[2],0,-1)
			table.insert( Zone14_PE01_Var["PowerFriend"],PowerFriend )
			--DebugMsg(0,0,"PowerFriend Born")
		else
			--DebugMsg(0,0,"No More PowerFriend")
		end
	elseif Type ==1 then
		for i=1 , GroupCount do
			local EnemyNum = table.getn(NPCGroup[i]["Enemy"])
			if ReadRoleValue( NPCGroup[i]["Ctrl"],EM_RoleValue_Register3 )==0 and ReadRoleValue( NPCGroup[i]["Ctrl"],EM_RoleValue_Register4 )==0 and EnemyNum>0 then--找出沒有助手的群組
				table.insert( randArray,i)
			end
		end
		if table.getn(randArray)>0 then
			local randNum = randArray[math.random( table.getn(randArray) ) ]
			Group = NPCGroup[randNum]
			randNum =math.random( table.getn(Group["Enemy"]) )
			local PowerEnemy = Group["Enemy"][randNum]
			WriteRoleValue( Group["Ctrl"] ,EM_RoleValue_Register3,1 )
			AddBuff(PowerEnemy,NPCBuff[4],0,-1)
			table.insert( Zone14_PE01_Var["PowerEnemy"] , PowerEnemy )
			--DebugMsg(0,0,"PowerEnemy Born")
		else
			--DebugMsg(0,0,"No More PowerEnemy")
		end
	elseif Type == 2 and Zone14_PE01_Phase==1 then
		for i=1 , GroupCount do
			local EnemyNum = table.getn(NPCGroup[i]["Enemy"])
			if EnemyNum>0 then--找出有村民的群組
				--DebugMsg(0,0,"Group_"..i.." have "..EnemyNum.." Enemys")
				if EnemyNum==1 and ReadRoleValue( NPCGroup[i]["Ctrl"],EM_RoleValue_Register3 )==1  then--當有助手級村民且村民只有一位時予以排除
					--
				else
					table.insert( randArray,i)
					--DebugMsg(0,0,"Insert Group_"..i )
				end
			end
		end
		if table.getn(randArray)>0 then
			local randNum = 0
			if table.getn(randArray)==1 then
				randNum =1
			else
				 randNum = randArray[math.random( table.getn(randArray) ) ]
			end
			--DebugMsg(0,0,"randNum = "..randNum)
			Group = NPCGroup[randNum]
			local PowerBoss = 0
			for i in pairs(Group["Enemy"]) do
				if CheckBuff( Group["Enemy"][i] , NPCBuff[4] )~=TRUE then
					 PowerBoss = Group["Enemy"][i]
					break
				end
			end
			WriteRoleValue( Group["Ctrl"] ,EM_RoleValue_Register4,1 )
			AddBuff(PowerBoss,NPCBuff[5],0,-1)
			Zone14_PE01_Var["PowerBoss"] = PowerBoss
			kg_Zone14_PE01_ChangeDebuff( 1 )--Boss一出現就更新全場debuff
			--DebugMsg(0,0,"Boss Born")
		else
			--DebugMsg(0,0,"BossBornFail... no more Enemy")
		end
	elseif Type == 2 and Zone14_PE01_Phase==2 then
		--DebugMsg(0,0,"PE1401_Phase=2 , You can't add Boss")
	end
end

function kg_Zone14_PE01_RandPowerBuff( Amount )--隨機對全群組產生領導級冒險者與村民，務必確定每個群組都有冒險者與村民
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local GroupCount = table.getn( NPCGroup )
	if Amount>GroupCount then Amount = GroupCount end	--當全群組的數量大於指定的數量時
	local PowerBoss = Zone14_PE01_Var["PowerBoss"]
	local PowerFriend = Zone14_PE01_Var["PowerFriend"]
	local PowerEnemy = Zone14_PE01_Var["PowerEnemy"]
	local NPCBuff = Zone14_PE01_Var["NPCBuffID"]
	------------------------清除現有的領導級NPC------------------------
	if CheckID(PowerBoss)==TRUE then
		--DebugMsg(0,0,"PowerBoss Clear")
		CancelBuff( PowerBoss,NPCBuff[5] )
		local ParentCtrl = ReadRoleValue(PowerBoss,EM_RoleValue_Register2)
		WriteRoleValue(ParentCtrl,EM_RoleValue_Register4,0)
		Zone14_PE01_Var["PowerBoss"]=0
		Zone14_PE01_Var["CurrentDeBuff"]=0
	end
	if PowerFriend[1]~=nil then
		--DebugMsg(0,0,"PowerFriend Clear")
		for i in pairs(PowerFriend) do
			CancelBuff( PowerFriend[i],NPCBuff[2] )
			local ParentCtrl = ReadRoleValue(PowerFriend[i],EM_RoleValue_Register2)
			WriteRoleValue(ParentCtrl,EM_RoleValue_Register2,0)
		end
		Zone14_PE01_Var["PowerFriend"] = {}
	end
	if PowerEnemy[1]~=nil then
		--DebugMsg(0,0,"PowerEnemy Clear")
		for i in pairs(PowerEnemy) do
			CancelBuff( PowerEnemy[i],NPCBuff[4] )
			local ParentCtrl = ReadRoleValue(PowerEnemy[i],EM_RoleValue_Register2)
			WriteRoleValue(ParentCtrl,EM_RoleValue_Register3,0)
		end
		Zone14_PE01_Var["PowerEnemy"] = {}
	end

	-------------------------------------隨機村民------------------------------------------
	local randArray = {}	-- { 1,2,3.......這個PE的對話群組數量 }
	for i=1 , GroupCount do
		randArray[i]=i
	end
	local randNumber=0
	local Group={}
	for i=1 , Amount do
		randNumber = math.random( table.getn(randArray) )--隨機取一群組
		table.remove(randArray,randNumber)
		Group = NPCGroup[randNumber]
		randNumber = math.random(table.getn(Group["Enemy"]))--隨機抓該群組的村民
		PowerEnemy = Group["Enemy"][randNumber]
		WriteRoleValue(Group["Ctrl"] ,EM_RoleValue_Register3,1)
		AddBuff(PowerEnemy,NPCBuff[4],0,-1)
		table.insert( Zone14_PE01_Var["PowerEnemy"],PowerEnemy )
		--DebugMsg(0,0,"PowerEnemy Born")
	end

	kg_Zone14_PE01_SinglePowerBuff(2)
	-------------------------------------隨機冒險者------------------------------------------
	randArray = {}
	for i=1 , GroupCount do
		randArray[i]=i
	end
	for i=1 , Amount do
		randNumber = math.random( table.getn(randArray) )--隨機取一群組
		table.remove(randArray,randNumber)
		Group = NPCGroup[randNumber]
		randNumber = math.random(table.getn(Group["Friend"]))--隨機抓該群組的冒險者
		PowerFriend = Group["Friend"][randNumber]
		WriteRoleValue(Group["Ctrl"] ,EM_RoleValue_Register2,1)
		AddBuff(PowerFriend,NPCBuff[2],0,-1)
		table.insert( Zone14_PE01_Var["PowerFriend"],PowerFriend )
		--DebugMsg(0,0,"PowerFriend Born")
	end
end

function kg_Zone14_PE01_PrintPowerNPC()--印出所有的特殊領導級NPC
	local PowerBoss = Zone14_PE01_Var["PowerBoss"]
	DebugMsg(0,0,"PowerBoss= "..PowerBoss )
	Say(PowerBoss,"PowerBoss!")
	local PowerFriend = Zone14_PE01_Var["PowerFriend"]
	if PowerFriend[1]~=nil then
		for i in pairs(PowerFriend) do
			DebugMsg(0,0,"PowerFriend= "..PowerFriend[i] )
			Say(PowerFriend[i],"PowerFriend!")
		end
	else
		DebugMsg(0,0,"No PowerFriend" )
	end
	local  PowerEnemy = Zone14_PE01_Var["PowerEnemy"]
	if PowerEnemy[1]~=nil then
		for i in pairs(PowerEnemy) do
			DebugMsg(0,0,"PowerEnemy= "..PowerEnemy[i] )
			Say(PowerEnemy[i],"PowerEnemy!")
		end
	else
		DebugMsg(0,0,"No PowerEnemy" )
	end
end