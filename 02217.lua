
--================================== Init ====================================--

function Lua_Zone13_PE01_GlobalSet()--變數宣告
	Zone13_PE01_PEIndex = 1301
	Zone13_PE01_Phase = 2	--開始階段
	Zone13_PE01_PHIndex = { 100, 200, 300 }
	
	Zone13_PE01_Follow = {}
	
	Zone13_PE01_Var = {}
	Zone13_PE01_Var["MapID"] = 313

	Zone13_PE01_Var["Enemy"] = {	105140,
									105144,
								}
	Zone13_PE01_Var["Friendly"] = {	105194,
									105195,
									105265
								}	
	
	Zone13_PE01_Var["FlagID"] = 780656 -- 旗標號碼
	Zone13_PE01_Var["EnemyNum"] = 0
	Zone13_PE01_Var["FriendlyNum"] = 0		
end

function Lua_Zone13_PE01_PESet()--PE功能
	local PE_Name = "SC_PE_ZONE13_01_NAME"					-- 海上的侵略者
	local PE_Desc = "SC_PE_ZONE13_01_DESC"					-- 北方的海盜對海爾芬營地的豐饒資源有極大興趣！但是銀野冒險者不會讓他們得逞的！到海爾芬營地去找強尼．渥克報到，他有些任務要給你！
	
	local PEIndex = Zone13_PE01_PEIndex
	local PHIndex = Zone13_PE01_PHIndex
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- 新增一個事件
	PE_AddRegion( PEIndex , Zone13_PE01_Var["MapID"] )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
			
	local PH_Name = {	"SC_PE_ZONE13_01_PH1_NAME",	--群涌而上(我方優勢)
						"SC_PE_ZONE13_01_PH2_NAME",	--情勢膠著(敵我均勢)
						"SC_PE_ZONE13_01_PH3_NAME"	--敵眾我寡(我方劣勢)
					}
	
	local PH_Desc = {	"SC_PE_ZONE13_01_PH1_DESC",--北方海盜的人數倍增！
						"SC_PE_ZONE13_01_PH2_DESC",--銀野冒險者和北方海盜的對抗陷入膠著，誰也佔不到上風！
						"SC_PE_ZONE13_01_PH3_DESC"--銀野冒險者絕不會讓海爾芬營地淪陷！
					}

	PE_AddPhase( PEIndex , PHIndex[1] , PH_Name[1], PH_Desc[1], 0 , 1 , 1 , 0 )	
	PE_AddPhase( PEIndex , PHIndex[2] , PH_Name[2], PH_Desc[2], 0 , 1 , 1 , 0 )
	PE_AddPhase( PEIndex , PHIndex[3] , PH_Name[3], PH_Desc[3], 0 , 1 , 1 , 0 )

	PE_PH_AddObjective_Greater( PEIndex , PHIndex[1], PHIndex[1], "", "", "Zone13_PE01_Lock" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[2], PHIndex[2], "", "", "Zone13_PE01_Lock" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[3], PHIndex[3], "", "", "Zone13_PE01_Lock" , 0, 1,  true )
	
	PE_OB_SetVisible( PEIndex, PHIndex[1], PHIndex[1], false )
	PE_OB_SetVisible( PEIndex, PHIndex[2], PHIndex[2], false )
	PE_OB_SetVisible( PEIndex, PHIndex[3], PHIndex[3], false )
	
	PE_SetScoreVisible( PEIndex, false )--不顯示積分
	
	-- 事件啟動
	PE_Start( PEIndex , PHIndex[2] )
end

function Lua_Zone13_PE01_CheckFollow()--固定跟隨
	local Follow = Zone13_PE01_Follow
	while true do
		sleep(50)
		for site in pairs( Follow ) do
			if CheckID(site) == true and KS_InCombat(site) ~= true then
				SetFollow( site, Follow[site] )
			elseif CheckID(site) ~= true then
				table.remove( Follow, site )
			end
		end
		Lua_Zone13_PE01_CheckPhase()--檢查階段
	end
end

function Lua_Zone13_PE01_CheckPhase()--檢查階段
	local PEIndex = Zone13_PE01_PEIndex
	local PHIndex = Zone13_PE01_PHIndex
	local EnemyNum = Zone13_PE01_Var["EnemyNum"]
	local FriendlyNum = Zone13_PE01_Var["FriendlyNum"]
	
	if EnemyNum > math.floor(FriendlyNum*1.2) then
		PE_JumpToPhase( PEIndex, PHIndex[3] )
		Zone13_PE01_Phase = 3
	elseif FriendlyNum > math.floor(EnemyNum*1.2) then
		PE_JumpToPhase( PEIndex, PHIndex[1] )
		Zone13_PE01_Phase = 1
	else
		PE_JumpToPhase( PEIndex, PHIndex[2] )
		Zone13_PE01_Phase = 2
	end
end

--================================== CheckType ====================================--

function Lua_Zone13_PE01_CheckType01()--檢查是否為海盜
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE01_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then		
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE01_CheckType02()--檢查是否為冒險者
	local TID = TargetID()--目標
	local OID = OwnerID()
	local Friendly = Zone13_PE01_Var["Friendly"]
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] then
			return true
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE01_CheckType03()--檢查是否為冒險者且HP低於50%
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Friendly = Zone13_PE01_Var["Friendly"]
	
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] and 
			ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.5 then
			return true
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE01_CheckType04()--檢查是否為海盜且HP低於50%
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE01_Var["Enemy"]
	
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then 
			if ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.5 then
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CASTSPELL_NEED_HP_LOWER]", 0 )--血量太高無法使用
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE01_CheckType05()--檢查是否為冒險者或玩家
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Friendly = Zone13_PE01_Var["Friendly"]
	
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] or ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 then
			return true
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

--================================== skill 1 ====================================--

function Lua_Zone13_PE01_CheckKill01()--檢查75%傷害下是否會死亡
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	if ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.75 > ReadRoleValue( TID, EM_RoleValue_HP ) then
		ks_QuestKill( OID, 105197, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	else
		ks_QuestKill( OID, 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
	return true
end


--================================== skill 2 ====================================--

function Lua_Zone13_PE01_CheckSmith()--檢查是否為工匠
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
		
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 117314 then
		local reg = ReadRoleValue( TID, EM_RoleValue_Register2 )
		if reg == 0 or reg == OID then
			return true
		else
			ScriptMessage( OID, OID, 1 , "[SAY_NPC_BUSY]" , 0 )--目標正在忙碌中
			return false
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE01_PlayerWork()--開始工作
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	local reg = ReadRoleValue( TID, EM_RoleValue_Register2 )
	if reg == 0 and ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 496911 then
		WriteRoleValue( TID, EM_RoleValue_Register2, OID )--註冊
		CallPlot( TID, "Lua_Zone13_PE01_SmithWork", OID )--工匠開始工作
		ScriptMessage( TID, OID, 1 , "[SC_PE_ZONE13_01_WORK]" , "0xffffff00" )--提示訊息
		ScriptMessage( TID, OID, 0 , "[SC_PE_ZONE13_01_WORK]" , "0xffffff00" )--提示訊息		
	elseif reg == OID then
		local type = {	[496878] = 1, 
						[496879] = 2,
						[496880] = 3 }	
		local MID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )--讀取技能
		if type[MID] ~= nil then
			WriteRoleValue( TID, EM_RoleValue_Register4, type[MID] )--註冊工作內容
		end
	end
end

function Lua_Zone13_PE01_SmithWork( player )--工匠工作
	local OID = OwnerID()--工匠
	local count = 0 --成功次數
	
	while true do		
		sleep(25)
		local WorkInfo = ReadRoleValue( OID, EM_RoleValue_Register3 )--工作內容
		local PlayerWork = ReadRoleValue( OID, EM_RoleValue_Register4 )--玩家執行的工作
		if 	WorkInfo == 0 then
			local rnd = rand(3)+1
			AdjustFaceDir( OID, player, 0 ) --面向目標
			WriteRoleValue( Player, EM_RoleValue_Coldown_Job + 382 , 0 )
			WriteRoleValue( OID, EM_RoleValue_Register3, rnd )--註冊工作內容
			ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_01_SMITH0"..rnd.."]" , "0xffffff00" )--提示訊息
			ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_01_SMITH0"..rnd.."]" , "0xffffff00" )--提示訊息
		else
			if PlayerWork == WorkInfo then				
				if count == 3 then
					AdjustFaceDir( OID, player, 0 ) --面向目標
					ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_01_SMITH05]" , "0xffffff00" )--完成訊息
					ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_01_SMITH05]" , "0xffffff00" )--完成訊息					
					ks_QuestKill( player, 105197, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
					sleep(15)
					ks_ResetRegValue()--暫存值重置
					CallPlot( OID, "ks_resetObj", OID, 10 )--60秒後重生
					break
				else
					count = count +1
					WriteRoleValue( OID, EM_RoleValue_Register3, 0 )--清除工作內容					
				end
			else				
				MagicInterrupt( player )--中斷
				AdjustFaceDir( OID, player, 0 ) --面向目標
				ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_01_SMITH04]" , 0 )--失敗訊息
				ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_01_SMITH04]" , 0 )--失敗訊息				
				ks_ResetRegValue()--暫存值重置
				break
			end			
		end
		Sleep(15)
	end
end

--================================== skill 3 ====================================--

function Lua_Zone13_PE01_ConvinceEnemy()--說服
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if CheckBuff( TID, 508582 ) == true or rand(10)>4 then
		ks_QuestKill( OID, 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		BeginPlot( TID, "Lua_Zone13_PE01_FriendlyGoBack", 0 )--跑回家
	else
		SysCastSpellLv( OID, TID, 495767, 0 )--單體最高級挑釁
	end	
end

function Lua_Zone13_PE01_CheckBribe()--檢查是否為海盜且可行賄
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE01_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			if CheckBuff( TID, 508948 ) ~= true then			
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SAY_NPC_BUSY]" , 0 )--忙碌中
			return false			
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE01_BribeEnemy()--收買
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	AddBuff( TID, 508948, 0, -1 )--交涉中
	CallPlot( TID, "Lua_Zone13_PE01_BribeEnemyDo", OID )
end	

function Lua_Zone13_PE01_BribeEnemyDo( player )--開始收買	
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate( player, EM_LuaDialogType_Select, "[SC_PE_ZONE13_01_GOLD]")
	for i=1, 5 do
		DialogSelectStr( player, "[SC_PE_ZONE13_01_GOLD"..i.."]" )
	end

	local times = 0
	local percent = { 7,15,30,60,100 }
	local LessMoney = { 100,200,400,800,1600 }
	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		CancelBuff( Player, 501570 );--
		return
	end

	local FX = ReadRoleValue( Player,EM_RoleValue_X )--檢查當前座標
	local FZ = ReadRoleValue( Player,EM_RoleValue_Z )--檢查當前座標
	
	while true do		--等待玩家點選
		if times == 10 then
			DialogClose( Player )
			CancelBuff( Player, 501570 );--
			CancelBuff( OwnerID(), 508948 )--取消交涉
			return
		end
		times = times + 1
				
		if	DW_CheckMap( player, Zone13_PE01_Var["MapID"] ) ~=true then 
			DialogClose( Player )
			CancelBuff( Player, 501570 );--
			CancelBuff( OwnerID(), 508948 )--取消交涉
			return
		end

		local PX = ReadRoleValue( Player,EM_RoleValue_X )--檢查當前座標
		local PZ = ReadRoleValue( Player,EM_RoleValue_Z )--檢查當前座標
		local Dis = math.floor(( (FX-PX)^2 + (FZ-PZ)^2 )^0.5)--求距離		
		if	Dis > 100	then --若距離超過Range 則強制跳離選單
			DialogClose( Player )
			CancelBuff( Player, 501570 );--
			CancelBuff( OwnerID(), 508948 )--取消交涉
			return
		end
		
		local Result = DialogGetResult( Player )	
		if Result~=nil and Result>-2 then
			if Result >= 0 then
				DialogClose( Player )
				CancelBuff( Player, 501570 );--
				local Money = ReadRoleValue( Player, EM_RoleValue_Money )
				if ( Money - LessMoney[Result+1] ) >= 0 then
					WriteRoleValue( Player, EM_RoleValue_Money, Money - LessMoney[Result+1] )
					if percent[Result+1] > rand(100) then
						Lua_Zone13_PE01_FriendlyGoBack()--跑回家
						ks_QuestKill( Player, 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
					else
						local message = {	"[SC_PE_ZONE13_01_ERROR1]",
										"[SC_PE_ZONE13_01_ERROR2]"
									}
						NPCSay( OwnerID(), message[rand(2)+1])				
					end
				else
					ScriptMessage( Player, Player, 1 , "[SYS_GAMEMSGEVENT_507]" , 0 )--金錢不足
				end
				CancelBuff( OwnerID(), 508948 )--取消交涉
				break
			elseif Result==-1 then
				DialogClose( Player )
				CancelBuff( Player, 501570 );
			end
		end
		Sleep( 10 )
	end
	
end


function Lua_Zone13_PE01_HealEnemy()--治療
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	local MaxHP = ReadRoleValue( TID, EM_RoleValue_MaxHP )
	local HP = ReadRoleValue( TID, EM_RoleValue_HP )
	
	if (4 - math.floor((HP/MaxHP)*5))*30 > rand(100) then
		ks_QuestKill( OID, 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		if rand(10)>3 then
			NPCSay( TID, "[SC_PE_ZONE13_01_SUCCESS]" )
		end
		BeginPlot( TID, "Lua_Zone13_PE01_FriendlyGoBack", 0 )--變成友軍回家
	end
end

function Lua_Zone13_PE01_FriendlyGoBack()--變成友軍回家
	local OID = OwnerID()
	local Change = {	[105140] = 117478,
						[105144] = 117479
					}
	local Friendly = Zone13_PE01_Var["Friendly"]
	local FlagID = Zone13_PE01_Var["FlagID"]
	local Obj = LuaFunc_CreateObjByObj( Change[ReadRoleValue( OID, EM_RoleValue_OrgID )], OID )
	WriteRoleValue( Obj, EM_RoleValue_IsWalk, 0 )
	ks_ActorMode( Obj, true )--設定演戲用NPC	
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, 3 )--X秒後消失
	ks_Move( Obj, 30, FlagID, 1 ) --對象(RoleID)移動到指定位置
	Hide(OID)
	KillID( OID, OID )	
end


--===============================================================================--

--================================== skill 4 ====================================--

function Lua_Zone13_PE01_Rumor()--謠言
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	if rand(10) > 0 then
		AddBuff( TID, 508582, 0, -1 )
		ks_QuestKill( OID, 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
end

function Lua_Zone13_PE01_Roll()--翻滾
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Obj = ks_CreateHideCtrl( TID )--產生隱形中控
	if CheckBuff( TID, 508589 ) ~= true then
		ks_QuestKill( OID, 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
	WriteRoleValue( Obj, EM_RoleValue_Register1, OID )
	BeginPlot( Obj, "Lua_Zone13_PE01_RollDo", 0 )--開始翻滾
end	

function Lua_Zone13_PE01_CheckCamp()--檢查陣營&癢癢
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者	
	local Camp = ReadRoleValue( TID, EM_RoleValue_CampID )
	if Camp ~= 6 then
		if  CheckBuff( TID, 508589 ) ~= true then
			AddBuff( TID, 508589, 0, 60 )--免疫癢癢		
			return true
		end
		if Camp ~= 5 and ReadRoleValue( TID, EM_RoleValue_Register4 ) == 0 then
			local Player = ReadRoleValue( OID, EM_RoleValue_Register1 )
			WriteRoleValue( TID, EM_RoleValue_Register4, Player )--訊息以顯示
			ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_01_NOEFFECT]" , 0 )--沒有效果
		end
		return false
	else
		return false
	end
end

function Lua_Zone13_PE01_RollDo()--開始翻滾
	local OID = OwnerID()--產生者
	for i=1, 5 do
		SysCastSpellLv( OID, OID, 496912, 0 )--散佈毒粉
		sleep(10)
	end
	DelObj(OID)
end

function Lua_Zone13_PE01_CancelRoll()--取消打滾
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	CancelBuff( TID, 508583 )
	ks_QuestKill( OID, 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
end


--===============================================================================--

--================================== skill 5 ====================================--

function Lua_Zone13_PE01_RegHand()--註冊手
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	WriteRoleValue( TID, EM_RoleValue_Register1, OID )--註冊大地之手
	return true
end

function Lua_Zone13_PE01_CooldownHand()--減少手CD
	local OID = OwnerID()--使用者		
	local Type = GameObjInfo_Int( 496891, "ColdownType" )
	local time = ReadRoleValue( OID, EM_RoleValue_Coldown_Job + Type  )
	
	if time > 20 then
		WriteRoleValue( OID, EM_RoleValue_Coldown_Job + Type , time - 20 )
	else
		WriteRoleValue( OID, EM_RoleValue_Coldown_Job + Type , 0 )
	end
end


--===============================================================================--

--================================== skill 6 ====================================--

function Lua_Zone13_PE01_RegAccuser()--註冊控告者
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	WriteRoleValue( TID, EM_RoleValue_Register2, OID )--註冊
	AddBuff( TID, 508707, 0, -1 )
	SetRoleCamp( TID, "WF_D" )
	SysCastSpellLV( TID, TID, 496914, 0 )--範圍挑釁
end

--===============================================================================--

--================================== skill 7 ====================================--

function Lua_Zone13_PE01_BurstMagic()--爆裂魔法
	local OID = OwnerID()--使用者	
	local Obj = LuaFunc_CreateObjByObj( 117453, OID )--魔法陣
	
	ks_TrapMode( obj )--設定陷阱用NPC
	--AddBuff( Obj, 508620, 0, -1 )--無敵盾
	SetRoleCamp( Obj, "SNPC" )
	WriteRoleValue( Obj, EM_RoleValue_Register1, OID )--註冊	
	BeginPlot( Obj, "Lua_Zone13_PE01_StartBurst", 0 )--爆炸吧
end

function Lua_Zone13_PE01_StartBurst()--開始爆裂
	local OID = OwnerID()--產生者
	
	for i=1, 4 do
		SysCastSpellLv( OID, OID, 496916, 0 )--爆裂吧!!
		sleep(20)
	end
	DelObj(OID)	
end

function Lua_Zone13_PE01_CheckKill02()--檢查60%傷害下是否會死亡
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE01_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			if ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.6 > ReadRoleValue( TID, EM_RoleValue_HP ) then
				ks_QuestKill( ReadRoleValue( OID, EM_RoleValue_Register1 ), 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			end
			return true
		end
	end
	
	return false
end

function Lua_Zone13_PE01_Stereotype()--刻版效果
	local OID = OwnerID()--使用者
	
	--while ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 496904 do
		PlayMotion( OID, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		AddBuff( OID, 502662, 0, 1 ) --手發光
		SysCastSpellLV( OID, OID, 496914, 0 )--範圍挑釁
	--	sleep(10)
	--end
end


--===============================================================================--

--================================== skill 8 ====================================--

function Lua_Zone13_PE01_GetSample()--取得樣本
	local OID = OwnerID()--使用者
	AddBuff( OID, 508623, 0, 6 )
end

function Lua_Zone13_PE01_CheckMap01()--是否在海爾芬營地
	local OID = OwnerID()--使用者
	if DW_CheckMap( OID, Zone13_PE01_Var["MapID"] ) == true then
		return true		
	end	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end

function Lua_Zone13_PE01_CheckDevice()--是否有裝置
	local OID = OwnerID()--使用者
	local Obj = SearchRangeNPC( OID, 45 ) --TargetID()	
	for i= 0, table.getn(Obj) do				
		if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 117277 then
			return true
		end
	end
	ScriptMessage( OID, OID, 1 , "[SYS_TOUCH_NOTARGET]" , 0 )--沒有目標
	return false
end

function Lua_Zone13_PE01_PaySample()--繳交樣本
	local OID = OwnerID()--使用者
	CancelBuff( OID, 508623 )
	ks_QuestKill( OID, 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
end


--===============================================================================--

--================================== skill 9 ====================================--

function Lua_Zone13_PE01_RegBuff01()--註冊革命情感
	local OID = OwnerID()--使用者
	local TID = TargetID()--目標
	
	WriteRoleValue( TID, EM_RoleValue_Register1, OID )
	return true
end

function Lua_Zone13_PE01_RegBuff02()--註冊情緒激動
	local OID = OwnerID()--使用者
	local TID = TargetID()--目標	
	local Friendly = Zone13_PE01_Var["Friendly"]
	
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] and CheckBuff( TID, 508628 ) ~= true then
			WriteRoleValue( TID, EM_RoleValue_Register2, OID )
			return true
		end
	end
	return false
end

--===============================================================================--

function Lua_Zone13_PE01_Born01()--冒險者出生
	local OID = OwnerID()
	ks_ResetRegValue()--暫存值重置
	SetFlag( OID, 544801, 1 )--關閉帕奇鼠
	Zone13_PE01_Var["FriendlyNum"] = Zone13_PE01_Var["FriendlyNum"] + 1
	SetPlot( OID, "DEAD", "Lua_Zone13_PE01_Dead01", 0 )--死亡劇情
	
	if Zone13_PE01_Phase == 3 and Zone13_PE01_Var["FriendlyNum"] < 100 and GetModeEx( OID, EM_SetModeType_Revive ) == true then
		local Friendly = Zone13_PE01_Var["Friendly"]
		local Obj = LuaFunc_CreateObjByObj( Friendly[rand(table.getn(Friendly))+1], OID )
		Zone13_PE01_Follow[Obj] = OID
		SetFollow( Obj, OID )
	end
end

function Lua_Zone13_PE01_Born02()--海盜出生
	local OID = OwnerID()
	ks_ResetRegValue()--暫存值重置
	SetFlag( OID, 544801, 1 )--關閉帕奇鼠
	Zone13_PE01_Var["EnemyNum"] = Zone13_PE01_Var["EnemyNum"] + 1
	SetPlot( OID, "DEAD", "Lua_Zone13_PE01_Dead02", 0 )--死亡劇情
	SetRoleCamp( OID, "Monster" )
	
	if Zone13_PE01_Phase == 1 and Zone13_PE01_Var["EnemyNum"] < 100 and GetModeEx( OID, EM_SetModeType_Revive ) == true then
		local Enemy = Zone13_PE01_Var["Enemy"]
		local Obj = LuaFunc_CreateObjByObj( Enemy[rand(table.getn(Enemy))+1], OID )
		Zone13_PE01_Follow[Obj] = OID
		SetFollow( Obj, OID )
	end
end

function Lua_Zone13_PE01_Dead01()--冒險者死亡
	local OID = OwnerID()	
	Zone13_PE01_Var["FriendlyNum"] = Zone13_PE01_Var["FriendlyNum"] - 1
	Hide(OID)
end

function Lua_Zone13_PE01_Dead02()--海盜死亡
	local OID = OwnerID()
	local TID = TargetID()
	local Enemy = Zone13_PE01_Var["Enemy"]
	local Friendly = Zone13_PE01_Var["Friendly"]	
	Zone13_PE01_Var["EnemyNum"] = Zone13_PE01_Var["EnemyNum"] - 1	
	
	if ReadRoleValue( OID, EM_RoleValue_Register3 ) ~= 0 then
		DialogClose( ReadRoleValue( OID, EM_RoleValue_Register3 ) )
		CancelBuff( ReadRoleValue( OID, EM_RoleValue_Register3 ), 501570 );--
	end
	
	if CheckBuff( OID, 508588 ) == true then--大地之手
		--Say( OID, "Die in the hands of the earth " )
		ks_QuestKill( ReadRoleValue( OID, EM_RoleValue_Register1 ), 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
	
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] then
			if CheckBuff( TID, 508627 ) == true then --革命情感
				--Say( OID, "Revolutionary Kill" )
				ks_QuestKill( ReadRoleValue( TID, EM_RoleValue_Register1 ), 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			end
			if CheckBuff( TID, 508628 ) == true then --情緒激動
				--Say( OID, "Emotional Kill" )
				ks_QuestKill( ReadRoleValue( TID, EM_RoleValue_Register2 ), 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			end
			break
		end
	end
	
	for i = 0 , HateListCount( OID )-1 do
		Hate = HateListInfo( OID, i, EM_HateListInfoType_GItemID )
		for i=1, table.getn(Enemy) do
			if ReadRoleValue( Hate, EM_RoleValue_OrgID ) == Enemy[i] then
				AddBuff( Hate, 508593, 0, 5 )--大禍臨頭
				--Say( TID, "Catastrophe Transfer" )
				ks_QuestKill( ReadRoleValue( OID, EM_RoleValue_Register2 ), 105197, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				return true
			end
		end
	end
	
end

function Lua_Zone13_PE01_Test01()
	local OID = OwnerID()
	Say( OID, "Zone13_PE01_Phase = "..Zone13_PE01_Phase )
	Say( OID, " EnemyNum = "..Zone13_PE01_Var["EnemyNum"] .."; FriendlyNum = "..Zone13_PE01_Var["FriendlyNum"] )	
end