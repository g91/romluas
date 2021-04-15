----------240706物品使用檢查(森林的隱憂)---------------------------------------------------------------------------------
function Lua_ying_Q424871_check()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( NPC , EM_RoleValue_MaxHP ) --總血量
	local NowHP = ReadRoleValue( NPC , EM_RoleValue_HP ) --目前血量

	DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬

	if OrgID == 106391 then --林蔭斑豹
		if GetDistance( Player , NPC ) <= 30 then --距離30內
			if CheckID( NPC ) == true and ReadRoleValue( NPC , EM_RoleValue_IsDead ) == 0 then --憤怒的斑豹之魂存在
				if NowHP/MaxHP <= 0.4 then --目前血量<= 40%
					return true
				else
					ScriptMessage( Player , Player , 1 , "[SC_424871_1][$SETVAR1=".."[".."106391".."]".."]" , 0 ) --必須在[林蔭斑豹]失血過多時才可進行採樣！
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[SC_422565_2]" , 0 ) --目標已死亡
				return false
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_424086_8]" , 0 ) --你的距離太遠，請再靠近一點！
			return false
		end
	else
		ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
		return false
	end
end
------使用240706物品--------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424871_use()

	local Monster = TargetID()
	local Player = OwnerID()
	local PID = ReadRoleValue( Monster , EM_RoleValue_PID ) --讀取豹PID

	 if PID == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_424871_2]" , 0 ) --此目標已被採樣過！
	else
		GiveBodyItem( Player , 240032 , 1 ) --給予斑豹的血液樣本
		DelBodyItem( Player , 240706 , 1 ) --採樣用空瓶
		WriteRoleValue( Monster , EM_RoleValue_PID , 1 ) --採樣後PID寫入1
--		BeginPlot( Monster , "Lua_ying_Q424871_leave" , 0 ) 
	end
end
------檢查是否離開戰鬥----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424871_leave()

	local Monster = OwnerID()

	while true do
		if HateListCount( Monster ) ~= 0 then --仇恨表內數量~=0 表示戰鬥中
			Sleep(10) --每秒檢查一次
		else
			WriteRoleValue( Monster , EM_RoleValue_PID , 0 ) --離開戰鬥PID改為0
			break
		end
	end
end
--------620923基本法術-檢查LUA--------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_check()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )

	if OrgID == 119648 then --寧幽蕨草
		return true
	else
		ScriptMessage( Player , Player , 1 , "[SC_102706_13]" , 0 ) --"施法目標不正確"
		return false
	end
end
-------119648寧幽蕨草-物件產生劇情-----------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_pick()

	SetPlot( OwnerID() , "Touch" , "Lua_ying_Q424873_pick01" , 30 )
end
-------採寧幽蕨草119648---------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_pick01()

	local Player = OwnerID()
	local NPC = TargetID()
	local Quest1 = CheckAcceptQuest( Player , 424873 ) --任務：鎮定心靈
	local Quest2 = CheckAcceptQuest( Player , 424880 ) --任務：鎮定心靈
	local Quest3 = CheckAcceptQuest( Player , 424886 ) --任務：鎮定心靈
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local Magic = ReadRoleValue( Player , EM_RoleValue_SpellMagicID )

	if Quest1 == true or Quest2 == true or Quest3 == true then
		if Mount == true then
			DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬
			if Magic == 0 then --目前沒有施放任何法術
				if BeginCastBarEvent( Player , NPC , "[SC_424873_2]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_Q424873_pick02") ~= 1 then -- 摘取寧幽蕨(2秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
--				else --CastBar觸發成功
--					BeginPlot( Player , "Lua_ying_Q424873_breakbar", 0 )
				end
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
		end
	else --未接任務
		ScriptMessage( Player , Player , 1 , "[SC_424873_1]" , C_SYSTEM ) --這株蕨草似乎有些不同…
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_Q424873_breakbar()
--
--	local Player = OwnerID()
--	local Magic = ReadRoleValue( Player , EM_RoleValue_SpellMagicID )
--
--	for  i = 1 , 10 , 1 do
--		local Magic = ReadRoleValue( Player , EM_RoleValue_SpellMagicID )
--		Say( Player , "Magic = "..Magic )
--		if Magic ~= 0 then
--			--EndCastBar( Player , CheckCastBar( Player ) ) --清除施法條
--			MagicInterrupt( Player )
--			break
--		end
--		Sleep(2)
--	end
--end
-------執行採集施法條---------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_pick02( Player , CheckStatus )

	local NPC = TargetID()
	local BUFF = CheckBuff( NPC , 620923 ) --靈氣滿溢

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --檢查背包欄位
				if BUFF == true then
					GiveBodyItem( Player , 240786 , 1 ) --給予寧幽蕨
				else
					GiveBodyItem( Player , 240787 , 1 ) --給予普通蕨葉	
				end
				SetModeEx( NPC , EM_SetModeType_Mark , false ) --隱藏標記
				SetModeEx( NPC , EM_SetModeType_Show , false ) --隱藏寧幽草
				BeginPlot( NPC , "Lua_ying_Q424873_show", 0 ) --顯示寧幽草
				EndCastBar( Player , CheckStatus ) --清除施法條
			else
				EndCastBar( Player , CheckStatus ) --清除施法條
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end
-----------10秒後顯示寧幽草----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_show()

	local NPC = OwnerID()
	Sleep(100) --10秒
	SetModeEx( NPC , EM_SetModeType_Mark , true ) --顯示標記
	SetModeEx( NPC , EM_SetModeType_Show , true ) --顯示寧幽草
end
----------240789物品使用檢查(苦痛靈魂)-------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424874_check()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( NPC , EM_RoleValue_MaxHP ) --總血量
	local NowHP = ReadRoleValue( NPC , EM_RoleValue_HP ) --目前血量
	local PID = ReadRoleValue( NPC , EM_RoleValue_PID )

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckID( NPC ) == true and ReadRoleValue( NPC , EM_RoleValue_IsDead ) == 0 then --憤怒的斑豹之魂存在
		if PID == 0 then
			if OrgID == 106415 then --憤怒的斑豹之魂
				if GetDistance( Player , NPC ) <= 30 then --距離30內
					if NowHP/MaxHP <= 0.3 then --目前血量<= 30%
						return true
					else
						ScriptMessage( Player , Player , 1 , "[SC_424874_1][$SETVAR1=".."[".."106415".."]".."]" , 0 ) --[憤怒的斑豹之魂]依舊充滿著力量，不斷抵抗…
						return false
					end
				else
					ScriptMessage( Player , Player , 1 , "[SC_424086_8]" , 0 ) --你的距離太遠，請再靠近一點！
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
				return false
			end
		else
			ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
			return false
		end
	else --不存在
		ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
		WriteRoleValue( NPC , EM_RoleValue_PID , 1 ) --死亡時PID寫入1
		return false
	end
end
----------憤怒的斑豹之魂-物件產生劇情----------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424874_reset()

	local Monster = OwnerID()
	WriteRoleValue( Monster , EM_RoleValue_PID , 0 )
	ic_MOB_BUFF_22()
end
-----------使用240789物品-----------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424874_use()
	CallPlot( TargetID(), "Lua_ying_Q424874_do", OwnerID() )
end

function Lua_ying_Q424874_do( Player )
	local Monster = OwnerID()
	local Obj = Role:new( Monster ) --在"憤怒的斑豹之魂"原位置，建立新的NPC
	local Ghost
	local Npcid = 106368 --成功減緩靈魂的痛苦

	Hide( Monster )
	KillID( Monster , Monster )
	if DW_Rand(100) <= 70  then
		Ghost = CreateObj( 106416 , Obj :X() , Obj :Y()  , Obj :Z() , Obj:Dir() , 1 ) --建立"平靜的斑豹之魂"
		DW_QietKillOne( Player , Npcid ) --偷偷殺死NPC - 成功減緩靈魂的痛苦
	else
		Ghost = CreateObj( 106417 , Obj :X() , Obj :Y()  , Obj :Z() , Obj:Dir() , 1 ) --建立"發狂的斑豹之魂"
	end
	AddToPartition( Ghost , 0 )
	BeginPlot( Ghost , "Lua_ying_Q424873_move" , 0 ) --走動
	WriteRoleValue( Ghost , EM_RoleValue_LiveTime , 30 ) --生存時間30秒
end
----------使建立出來的魂移動------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_move()

	local Monster = OwnerID()

	WriteRoleValue( Monster , EM_RoleValue_IsWalk , 1  )-- 讓NPC用走的
	Hide( Monster )
	Show( Monster , 0 )

	while TRUE do
		DW_MoveRand( Monster , 140 )  --ObjID 想進行移動的物件   RandRange 想隨機移動的范圍(直徑)
		Sleep(50)
	end
end
---------使用物品240826找土堆119632------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_search()

	local Player = OwnerID()
	local Key = { 545822 , 545823 , 545824 , 545825 , 545826 , 545827 , 545828 , 545829 , 545830 , 545831 }
	--旗標位置 = { 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 }
	local KeyPos = {}
--	local KeyPos = {[545822] = 1;
--			[545823] = 2;
--			[545824] = 3;}
	local HaveKey = {} --假設{ 545823 , 525826 }
	local KeyNum = 0 --計算身上有幾個key

	for j = 1 , 10 , 1 do
		KeyPos[545821+j] = j-1 --KeyPos[545822]=0 , KeyPos[545823]=1 , KeyPos[545824]=2...
	end

	for i = table.getn(Key) , 1 , -1 do --從後往前數 -- i 從 10 數回 1
		if CheckFlag( Player , Key[i] ) == true then --有key
			table.insert( HaveKey , Key[i] ) --第二次執行時，HaveKey會清空為{} ，所以將持有key塞入HaveKey
--			table.remove( Key , i ) --將有的key從Key table 刪除
			KeyNum = KeyNum +1 --有key加1
		end
	end

	if KeyNum < 1 then
		local Random = DW_Rand(#Key)
		SetFlag( Player , Key[Random] , 1 )
		table.insert( HaveKey , Key[Random] )
	end

	local Count = CountBodyItem( Player , 240790 ) --熾熱結晶
	local Dis , Pos

	if Count < 1 then
		local X = HaveKey[1] --545823
		Pos = KeyPos[X] --旗標位置 --KeyPos[545823]=1
		Dis = KS_GetFlagDistance( Player , 781047,  Pos ) --與旗標距離(物件, 旗標ID, 旗標位置) 
	else
		ScriptMessage( Player , Player , 1 , "[SC_424875_5]" , 0 ) --你已經擁有了熾熱結晶！
		return
	end
	
	local String = Math.ceil(Dis / 150) --無條件進位(距離/150)
	--1. 能量的來源位置出現了！ 2. 越來越靠近能量的來源… 3. 這附近似乎有著些微的能量…  4. 完全探測不到任何能量…
	if String == 1 then --距離150內
		Q424875_Soilobj = Q424875_Soilobj or {} --土堆全域變數 --如果 Q424875_Soilobj ~= nil 則 Q424875_Soilobj  會等於 Q424875_Soilobj，如果 Q424875_Soilobj  == nil 則 Q424875_Soilobj  = {}
		if Q424875_Soilobj[Pos] == nil or CheckID( Q424875_Soilobj[Pos] ) == false then --Q424875_Soilobj[Pos] =nil未出現過土堆 , CheckID( Q424875_Soilobj[Pos] ) = false 出現過土堆但刪除
			Q424875_Soilobj[Pos] = CreateObjByFlag( 119632 , 781047 , Pos , 1 ) --參照指定旗子的位置來產生物件(NPC編號、旗子代號、第幾號旗子、物件數量 ) --將產生的GUID紀錄在Q424875_Soilobj[Pos]內
			SetModeEx( Q424875_Soilobj[Pos] , EM_SetModeType_Mark , true ) --顯示標記
			SetModeEx( Q424875_Soilobj[Pos] , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
			AddToPartition( Q424875_Soilobj[Pos] , 0 )
			WriteRoleValue( Q424875_Soilobj[Pos] , EM_RoleValue_Register1 , Pos ) --寫入Register1的Pos值
			BeginPlot( Q424875_Soilobj[Pos] , "Lua_ying_Q424875_delSoil", 0 ) --20秒後刪除土堆
		end
	elseif String > 4 then --距離在450以上
		String = 4
	end
	ScriptMessage( Player , Player , 1 , "[SC_424875_"..String.."]" , C_SYSTEM )
end
----------20秒後刪除土堆-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_delSoil()

	local Soil = OwnerID()
	
	Sleep(200) --20秒
	if CheckFlag( Soil , 545874 ) == true then --檢查是否有人點擊土堆 --true=有
		SetFlag( Soil , 545874 , 0 ) --刪除土堆上的檢查KEY
		Lua_ying_Q424875_delSoil()
	else --沒KEY，沒人點擊
		DelObj( Soil )
	end
end
----------點擊土堆--------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_soilbar()
	
	SetPlot( OwnerID() , "Touch" , "Lua_ying_Q424875_soil01" , 30 )
end
---------讀取施法條前檢查------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_soil01()

	local Player = OwnerID()
	local NPC = TargetID()
	local Key = { 545822 , 545823 , 545824 , 545825 , 545826 , 545827 , 545828 , 545829 , 545830 , 545831 }
	--旗標位置 = { 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 }
	local Pos = ReadRoleValue( NPC , EM_RoleValue_Register1 ) --讀取土堆上的Register1值 --判斷土堆位置Pos
	local Count = CountBodyItem( Player , 240790 ) --熾熱結晶
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local Type = 0 --計次

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if Mount == true then --不在後座
		for i = 1 , #Key , 1 do
			if CheckFlag( Player , Key[i] ) == true then
				if i - 1 == Pos then --key與土堆的pos符合
					if Count < 1 then --玩家身上的熾熱結晶0個
						if BeginCastBarEvent( Player , NPC , "[SC_VALENTINE_2011EV1_08]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_Q424875_pick02") ~= 1 then --挖掘土堆(3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
							ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
						else --CastBar觸發成功
							SetFlag( NPC , 545874 , 1 ) --點擊時給予土堆檢查key
						end
					else --有結晶
						ScriptMessage( Player , Player , 1 , "[SC_424875_5]" , 0 ) --你已經擁有了熾熱結晶！
					end
				else --不符合
					AddBuff( Player , 621220 , 0 , 3 )
					ScriptMessage( Player , Player , 1 , "[SC_424875_6]" , 0 ) --帶有火焰的土堆...
				end
				return
			else --沒有key
				Type = Type + 1
				if Type == #Key then
					AddBuff( Player , 621220 , 0 , 3 )
					ScriptMessage( Player , Player , 1 , "[SC_424875_6]" , 0 ) --帶有火焰的土堆...
				end
			end
		end
	else --在後座
		ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
	end
end
---------(執行者 , 參數)---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_pick02( Player , CheckStatus )

	local NPC = TargetID()
	
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --檢查背包欄位
				GiveBodyItem( Player , 240790 , 1 ) --給予"熾熱結晶"
				EndCastBar( Player , CheckStatus ) --清除施法條
				DelObj( NPC )
			else
				EndCastBar( Player , CheckStatus ) --清除施法條
				SetFlag( NPC , 545874 , 0 ) --刪除土堆上的key
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
			SetFlag( NPC , 545874 , 0 ) --刪除土堆上的key
		end
	end
end
---------完成任務執行----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_delkeyitem()

	local Player = TargetID()
	local Key = { 545822 , 545823 , 545824 , 545825 , 545826 , 545827 , 545828 , 545829 , 545830 , 545831 }

	Lua_ZonePE_3th_GetScore(150)
	for i = 1 , #Key , 1 do
		if CheckFlag( Player , Key[i] ) == true then
			SetFlag( Player , Key[i] , 0 ) --完成任務刪除Key
			return
		end
	end
end

---------完成任務執行----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_delkeyitem_1()

	local Player = TargetID()
	local Key = { 545822 , 545823 , 545824 , 545825 , 545826 , 545827 , 545828 , 545829 , 545830 , 545831 }

--	Lua_ZonePE_3th_GetScore(150)
	for i = 1 , #Key , 1 do
		if CheckFlag( Player , Key[i] ) == true then
			SetFlag( Player , Key[i] , 0 ) --完成任務刪除Key
			return
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_test_cleartable()

	Q424875_Soilobj  = {}
	Say( OwnerID() , "ClearOK" )
end