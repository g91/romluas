--以灰老大所提供的函式功能為主來使用
--用 WritePQValue(val , A) 暫代將 val 寫入數值 A
--用 ReadPQValue(A) 暫代讀出數值 A
--用 ShowPQValue(A) 暫代秀出數值 A

--製作方法為在地圖上種怪並加入特殊的初始劇情

function LuaAI_ControlCenter_Zone11PQ() --初始值設定以及階段的控制者
	--------------初始化參數------------------
	Zone11PQ_ValueGroup_Drama = {}
	Zone11PQ_ValueGroup_Drama["State"] = 3
	Zone11PQ_ValueGroup_Drama["Mob"] = 0
	Zone11PQ_ValueGroup_Drama["Elite"] = 0
	Zone11PQ_ValueGroup_Drama["Boss"] = 0
	Zone11PQ_ValueGroup_Drama["Time"] = 0
	Zone11PQ_ValueGroup_Drama["LastHero"] =  "[SC_ZONE11_PQ_10]"
	local Timer = 0
	-------------------------------------------
	sleep( 180 )
	Zone11PQ_ValueGroup_Drama["State"] = 0
	Yell( OwnerID() , "[SC_ZONE11_PQ_9]" , 5 ) --/*警戒！發現獨眼巨人的攻擊部隊！警戒！警戒！
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE11_PQ_8]" , 0 ) --/*[ZONE_SERGARTH POINT]正受到獨眼巨人的攻擊！
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_ZONE11_PQ_8]" , 0 )
	-------------------------------------------
	while 1 do
		Timer = Zone11PQ_ValueGroup_Drama["Time"]
		--------第一階段計數但不計時----------------------------------------
		if Zone11PQ_ValueGroup_Drama["Mob"] >= 200 and Zone11PQ_ValueGroup_Drama["State"] == 0 then
			Zone11PQ_ValueGroup_Drama["State"] = 1
			Yell( OwnerID() , "[SC_ZONE11_PQ_0]" , 5 ) --/*住意！獨眼巨人的戰狼攻過來了！
--			ShowPQValue("Now Is State : " , "State")
			Zone11PQ_ValueGroup_Drama["Time"] = 0	--重新計時
			Timer = 0 
		end
		--------第二階段計數----------------------------------------
		if Zone11PQ_ValueGroup_Drama["Elite"] >= 30 and Zone11PQ_ValueGroup_Drama["State"] == 1 then
			sleep( 30 )
			Yell( OwnerID() , "[SC_ZONE11_PQ_1]" , 5 ) --/*發現[101791]！發現[101791]！大家備戰！
			sleep( 20 )
			Zone11PQ_ValueGroup_Drama["State"] = 2
			Yell( OwnerID() , "[SC_ZONE11_PQ_1]" , 5 ) --/*發現[101791]！發現[101791]！大家備戰！
--			ShowPQValue("Now Is State : " , "State")
			Zone11PQ_ValueGroup_Drama["Time"] = 0	--重新計時
			Timer = 0 
		end
		--------第二階段計時-----------------------------------------
		if Zone11PQ_ValueGroup_Drama["State"] == 1 and Timer == 600 then
--			ScriptMessage( OwnerID() , -1 , 1 ," Time Over", 0 )
			Zone11PQ_ValueGroup_Drama["Time"] = 0	--重新計時
			Timer = 0 
			Zone11PQ_ValueGroup_Drama["State"] = 2
		end
		--------第三階段計數----------------------------------------
		if Zone11PQ_ValueGroup_Drama["Boss"] >= 1 and Zone11PQ_ValueGroup_Drama["State"] == 2 then
			sleep( 50 )
			local Str = "[SC_ZONE11_PQ_7][$SETVAR1="..Zone11PQ_ValueGroup_Drama["LastHero"].."]"
			Yell( OwnerID() , str , 5 )
			Zone11PQ_ValueGroup_Drama["State"] = 3
--			ShowPQValue("Now Is State : " , "State")
			Zone11PQ_ValueGroup_Drama["Time"] = 0	--重新計時
			Timer = 0 
		end
		--------第三階段計時-----------------------------------------
		if Zone11PQ_ValueGroup_Drama["State"] == 2 and Timer > 570 and Timer <= 590 and math.floor(Timer/10 ) == Timer/10 then
			Yell( OwnerID() , "[SC_ZONE11_PQ_2]" , 5 ) --/*再撐一會！牠們快撤退了！
		end
		if Zone11PQ_ValueGroup_Drama["State"] == 2 and Timer > 590 and Timer < 600 and math.floor(Timer/3 ) == Timer/3 then
			Yell( OwnerID() , "[SC_ZONE11_PQ_3]" , 5 ) --/*再堅持一下！牠們就要撤退了！
		end
		if Zone11PQ_ValueGroup_Drama["State"] == 2 and Timer == 600 then
--			ScriptMessage( OwnerID() , -1 , 1 ," Time Over", 0 )
			Yell( OwnerID() , "[SC_ZONE11_PQ_4]" , 5 ) --/*他們撤退了！他們撤退了！
			Zone11PQ_ValueGroup_Drama["State"] = 3
		end
		--------重置階段-----------------------------------------休息 100 分後重置所有參數
		if Zone11PQ_ValueGroup_Drama["State"] == 3 then
			sleep( 18000 )
			Zone11PQ_ValueGroup_Drama["State"] = 0
			Zone11PQ_ValueGroup_Drama["Mob"] = 0
			Zone11PQ_ValueGroup_Drama["Elite"] = 0
			Zone11PQ_ValueGroup_Drama["Boss"] = 0
			Zone11PQ_ValueGroup_Drama["Time"] = 0
			Timer = 0 
			Yell( OwnerID() , "[SC_ZONE11_PQ_9]" , 5 ) --/*警戒！發現獨眼巨人的攻擊部隊！警戒！警戒！
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE11_PQ_8]" , 0 ) --/*[ZONE_SERGARTH POINT]正受到獨眼巨人的攻擊！
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_ZONE11_PQ_8]" , 0 )
		end
		-----------------------------------------------------------
		sleep( 10 )
		if Zone11PQ_ValueGroup_Drama["State"] ~= 0 then
			Zone11PQ_ValueGroup_Drama["Time"] = Timer + 1
		end
	end
end

function LuaI_Zone11PQ_BornControl()	--掛在怪物身上的初始劇情，不分階段
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = 0
	-----------以物件編號作為索引值，後面的編號為該物件應出現的階段----------
	local MobMap = {[101789] = 0 , [101790] = 1 , [101791] = 2 ,[102359] = 0}	
	--------------------------------------------------------------------------
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Type = 0
	Hide( OwnerID() )	--因為下方有改變顯像狀態，為了讓 Client 顯像正常，因此要先 HIDE 再改變完之後再 Show
	sleep( 10 )	--停一秒是為了等待控制中心確實將參數歸零
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
	SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true )
	SetModeEx( OwnerID() , EM_SetModeType_Show , false )
	Show( OwnerID() , RoomID )
	SetPosByFlag( OwnerID(), 780299 , 1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	if Zone11PQ_ValueGroup_Drama["State"] ~= nil then 
		State = Zone11PQ_ValueGroup_Drama["State"]	--讀取目前的階段，如果讀取失敗則 State 為 0
	end

	if MobMap[OrgID] == nil then
		Show( OwnerID() , RoomID )
		return
	end

	while 1 do
		if ReadPQValue("State") ~= nil then
			State = ReadPQValue("State")	--讀取目前階段
		end

		if State >= MobMap[OrgID] and State < 3 and Type == 0 then --Type 為 0 時隱藏中
			Hide( OwnerID() )
			SetModeEx( OwnerID() , EM_SetModeType_Show , true )
			SetModeEx( OwnerID() , EM_SetModeType_Mark , true )
			SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )
			SetModeEx( OwnerID() , EM_SetModeType_Move , true )
			SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )
			SetModeEx( OwnerID() , EM_SetModeType_Fight , true )
			SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false )

			Show( OwnerID() , RoomID )
			if State == MobMap[OrgID] then
				SetPlot( OwnerID() , "dead" , "LuaI_Zone11PQ_DeadControl" , 0 ) --計數用死亡劇情
			end
			if OrgID == 101791 then
				SetModeEx( OwnerID() , EM_SetModeType_Strikback , false)
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
				SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
				SetFlag( OwnerID() , 540820 , 0 )
				Hide( OwnerID() )
				Show( OwnerID() , RoomID)
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE11_PQ_5]" , 0 ) --/*[101791]正在襲擊[ZONE_SERGARTH POINT]！
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_ZONE11_PQ_5]" , 0 )
			end
			Type = 1
		end
		--除檢查階段外還要檢查是否死亡，一般來說死亡後會自動停止身上的 Script，這裡是保險起見而加入檢查
		if ( State < MobMap[OrgID] or State >= 3 ) and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 and Type == 1 then --Type 為 1 時顯示中
			Lua_CancelAllBuff( OwnerID() ) --清除所有buff
			SetStopAttack( OwnerID() )	--強制離開戰鬥
			ClearHateList( OwnerID() , -1 )	--清除仇恨列表
			if OrgID == 101791 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE11_PQ_6]" , 0 ) --/*[101791]放棄對[ZONE_SERGARTH POINT]的攻擊而撤退了！
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_ZONE11_PQ_6]" , 0 )
			end
			Type = 0
			break
		end
		sleep( 10 )
	end
	LuaFunc_ResetObj( OwnerID() )
end

function LuaI_Zone11PQ_DeadControl()	--計數用死亡劇情，不分階段
	local State = 0 
	if ReadPQValue("State") ~= nil then
		State = ReadPQValue("State")
	end
	local MobMap = {[101789] = 0 , [101790] = 1 , [101791] = 2 ,[102359] = 0}	
	local RecordMap = {[0] = "Mob" , [1] = "Elite" , [2] = "Boss" , [3] = "State" }
	local Counter = ReadPQValue(RecordMap[State])
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	if  MobMap[OrgID] ~= nil and MobMap[OrgID] == State then	--如果死亡的時候是該階段要計數物件才執行
		----------主要是這裡在增加計數---------
		Counter = Counter + 1
		WritePQValue(Counter , RecordMap[State])
		----------以下是改變顯示於 Client 的訊息---------
--		ShowPQValue("Now Is State : " , "State")
--		ShowPQValue("Mob Be Killed : " , RecordMap[State])
	end
	if OrgID == 101791 then
		local Str 
		local Killer = HateListInfo(OwnerID() ,0 , EM_HateListInfoType_GItemID )
		if CheckID( Killer ) == false or ReadRoleValue( Killer , EM_RoleValue_IsPlayer ) == 0 then
			Str = "[SC_ZONE11_PQ_7][$SETVAR1=[SC_ZONE11_PQ_10]]"
			Zone11PQ_ValueGroup_Drama["LastHero"] = "[SC_ZONE11_PQ_10]"
		else
			Str = "[SC_ZONE11_PQ_7][$SETVAR1="..GetName(Killer).."]"
			Zone11PQ_ValueGroup_Drama["LastHero"] = GetName(Killer)
		end
		ScriptMessage( OwnerID() , -1 , 2 , Str , 0 ) --/*[101791]被擊敗了！
		ScriptMessage( OwnerID() , -1 , 0 , Str , 0 )
	end
	return true
end

function WritePQValue(val , pry)
	Zone11PQ_ValueGroup_Drama[pry] = val
end

function ReadPQValue(pry)
	return Zone11PQ_ValueGroup_Drama[pry]
end

function ShowPQValue(str , pry)
	local Num = Zone11PQ_ValueGroup_Drama[pry]
--	local Show = "[str][$SETVAR1="..pry.."]"
	local Show = Str..Num
	ScriptMessage( OwnerID() , -1 , 1 , Show , 0 )
end

function LuaI_Zone11PQ_BornControl_G()	--掛在守衛身上的初始劇情，不分階段
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = 0
	-----------以物件編號作為索引值，後面的編號為該物件應出現的階段----------
--	local MobMap = {[101797] = 0 , [101798] = 0 , [101799] = 1 , [101800] = 1}	
	local MobMap = {[101799] = 1 , [101800] = 1}	
	--------------------------------------------------------------------------
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Type = 0
	Hide( OwnerID() )	--因為下方有改變顯像狀態，為了讓 Client 顯像正常，因此要先 HIDE 再改變完之後再 Show
	sleep( 10 )	--停一秒是為了等待控制中心確實將參數歸零
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
	SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true )
	SetModeEx( OwnerID() , EM_SetModeType_Show , false )
	Show( OwnerID() , RoomID )
	if Zone11PQ_ValueGroup_Drama["State"] ~= nil then 
		State = Zone11PQ_ValueGroup_Drama["State"]	--讀取目前的階段，如果讀取失敗則 State 為 0
	end

	if MobMap[OrgID] == nil then --如果npc不在 MobMap 內，就 return
		Show( OwnerID() , RoomID )
		return
	end

	while 1 do
		if ReadPQValue("State") ~= nil then
			State = ReadPQValue("State")	--讀取目前階段
		end

		if State >= MobMap[OrgID] and State < 3 and Type == 0 then
			SetModeEx( OwnerID() , EM_SetModeType_Show , true )
			SetModeEx( OwnerID() , EM_SetModeType_Mark , true )
			SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )
			SetModeEx( OwnerID() , EM_SetModeType_Move , true )
			SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )
			SetModeEx( OwnerID() , EM_SetModeType_Fight , true )
			SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false )
			Hide( OwnerID() )
			Show( OwnerID() , RoomID )
			if State == MobMap[OrgID] then
				SetPlot( OwnerID() , "dead" , "LuaI_Zone11PQ_DeadControl" , 0 ) --計數用死亡劇情
			end
			Type = 1
		end
		--除檢查階段外還要檢查是否死亡，一般來說死亡後會自動停止身上的 Script，這裡是保險起見而加入檢查
		if (State < MobMap[OrgID] or State >= 3 ) and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 and Type == 1 then 
			Lua_CancelAllBuff( OwnerID() ) --清除所有buff
			SetStopAttack( OwnerID() )	--強制離開戰鬥
			ClearHateList( OwnerID() , -1 )	--清除仇恨列表
			Type = 0
			break
		end
		sleep( 10 )
	end
	LuaFunc_ResetObj( OwnerID() )
end

function LuaP_Zone11PQ()
	MoveToFlagEnabled( OwnerID() , false )
end

function LuaS_Zone11PQ_Record()
	local State = Zone11PQ_ValueGroup_Drama["State"] 
	LoadQuestOption( OwnerID() )
	if State == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_112619_A]" ,"LuaS_Zone11PQ_Record_0",  0 ) --/*查閱目前戰況
	elseif State == 1 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_112619_A]","LuaS_Zone11PQ_Record_1",  0 ) --/*查閱目前戰況
	elseif State == 2 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_112619_A]","LuaS_Zone11PQ_Record_2",  0 ) --/*查閱目前戰況
	else
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_112619_A]" ,"LuaS_Zone11PQ_Record_3",  0 ) --/*查閱目前戰況
	end
end
function LuaS_Zone11PQ_Record_0()
	local Mob = Zone11PQ_ValueGroup_Drama["Mob"]
	local Count = 200
	local Str = "[SC_112619_0][$SETVAR1="..Mob.."][$SETVAR2="..Count.."]"
	 --/*目前正受到攻擊，已擊敗[<s>101789]：[$VAR1]/[$VAR2]
	SetSpeakDetail( OwnerID(), Str)
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_Zone11PQ_Record",  0 )
end
function LuaS_Zone11PQ_Record_1()
	local Elite = Zone11PQ_ValueGroup_Drama["Elite"] 
	local Time = Zone11PQ_ValueGroup_Drama["Time"] 
	local Count = 30
	local TimeLimit = 600 - Time
	local Str = "[SC_112619_1][$SETVAR1="..Elite.."][$SETVAR2="..Count.."][$SETVAR3="..TimeLimit.."]" 
	 --/*目前正受到攻擊，已擊敗[<s>101790]：[$VAR1]/[$VAR2]，估計再經過 [$VAR3] 秒 [101791] 將出現
	SetSpeakDetail( OwnerID(), Str)
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_Zone11PQ_Record",  0 )
end
function LuaS_Zone11PQ_Record_2()
	local Time = Zone11PQ_ValueGroup_Drama["Time"]
	local TimeLimit = 600 - Time 
	local Str = "[SC_112619_2][$SETVAR1="..TimeLimit.."]"
	--/*現在正受到[101791]的攻擊，估計再經過 [$VAR1] 秒 [101791] 將撤退
	SetSpeakDetail( OwnerID(), Str)

	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_Zone11PQ_Record",  0 )
end
function LuaS_Zone11PQ_Record_3()
	local Hero = Zone11PQ_ValueGroup_Drama["LastHero"] 
	local Str = "[SC_112619_3][$SETVAR1="..Hero.."]"
	--/*目前沒有發生戰鬥。
	--/*上次戰鬥由[$VAR1]領導我們獲得勝利。
	SetSpeakDetail( OwnerID(), Str)
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_Zone11PQ_Record",  0 )
end
function LuaI_Zone11PQ_Record_Counter()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	local State = 0
	local Str  = ""
	local Mob = 0
	local Elite = 0
	local Count = 0
	local Time = 0
	local TimeLimit  = 0
	sleep( 30 )
	while 1 do
		if Zone11PQ_ValueGroup_Drama["State"] ~= nil then
			State =Zone11PQ_ValueGroup_Drama["State"] 
		end
		if State == 0 then
			Mob = Zone11PQ_ValueGroup_Drama["Mob"]
			Count = 200
			Str = "[SC_112619_0][$SETVAR1="..Mob.."][$SETVAR2="..Count.."]"
			Yell( OwnerID() , str , 3 )
		elseif State == 1 then
			Elite = Zone11PQ_ValueGroup_Drama["Elite"] 
			Time = Zone11PQ_ValueGroup_Drama["Time"] 
			Count = 30
			TimeLimit = 600 - Time
			Str = "[SC_112619_1][$SETVAR1="..Elite.."][$SETVAR2="..Count.."][$SETVAR3="..TimeLimit.."]" 
			Yell( OwnerID() , str , 3 )
		elseif State == 2 then
			Time = Zone11PQ_ValueGroup_Drama["Time"]
			TimeLimit = 600 - Time 
			Str = "[SC_112619_2][$SETVAR1="..TimeLimit.."]"
			Yell( OwnerID() , str , 3 )
		end
		sleep( 600 )
	end
end

function LuaP_101791_0()
	if CheckFlag( OwnerID() , 540820 ) == false then
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		SetModeEx( OwnerID() , EM_SetModeType_Strikback , true)
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )
		SetFlag( OwnerID() , 540820 , 1 )
		Hide( OwnerID() )
		Show( OwnerID() , RoomID )
	end
end