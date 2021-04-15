--EM_ClockCheckValue_20 -- 計時器
--Lua_Deadkeep --讓npc停止動作（死亡）
--INSTANCE_STATE_11 全民升火趣
--EM_RoleValue_Register+1  玩家in題目
--EM_RoleValue_Register+2  火堆in變動值
--EM_RoleValue_Register+3  玩家in火堆NPC
--EM_RoleValue_Register+4  火堆in火焰NPC（火焰動後，要馬上更改此值，以防要刪時，刪不到東西）
--EM_RoleValue_Register+5  火堆in玩家


function Lua_fireday_ev1_npc()	
	SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_EV1_01") ) --哈哈哈，又要來挑選明年升火祭壇的高手了~~
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_02") , "lua_fireday_background", 0 ) --聽取詠火節的由來
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_EV1_06") , "lua_fireday_ev1_rule", 0 ) --聽取遊戲規則
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_06") , "lua_fireday_changegoods", 0 ) --獎勵兌換
	if CheckFlag(OwnerID(), 544702 ) == true and CheckFlag(OwnerID(), 544728 ) == false then 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_EV1_21") , "lua_fireday_ev1_end", 0 ) --領取獎勵
	elseif CheckFlag(OwnerID(), 544702 ) == false then
		if CheckFlag(OwnerID(), 544703 ) == false  and CheckFlag(OwnerID(), 544707 ) == false then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_EV1_07") , "lua_fireday_firekey", 0 ) --我準備好要升火了
		end
	end
end

--------------------------------升火遊戲規則、由來、資格-----------------------------------------
function lua_fireday_ev1_rule() 
	SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_EV1_03") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "Lua_fireday_ev1_npc", 0 ) --回上一頁
end

function lua_fireday_background() 
	SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_01") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "Lua_fireday_ev1_npc", 0 ) --回上一頁
end

function lua_fireday_firekey()   
	--Say(OwnerID(), "37")
	--Say(TargetID(), "38") --NPC
	if CheckFlag(OwnerID(), 544702 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_EV1_05") ) --很抱歉，你今天已經玩過了，請明天再來吧！
	else  
		local c = rand(31) + 70 --火焰溫度為70~100
		SetSpeakDetail( OwnerID(), "[SC_FIREDAY_EV1_08][$SETVAR1="..c.."]" ) --點擊我旁邊的火堆開始吧！溫度是…
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, c ) 
		setflag(OwnerID(), 544703, 1 )  --給啟動券		
	end
end

--------------------------------給技能、計時器------------------------------------------
Function lua_fireday_clock01() --掛在物件產出SCRIPT
	SetPlot( OwnerID() , "touch" , "lua_fireday_clockbuff" , 30 );	--後面數字是能點擊的範圍
end

function lua_fireday_clockbuff() 
	--Say(OwnerID(), "55")  --player
	--Say(TargetID(), "56")  --火堆
	local firepid = readRoleValue( targetID(), EM_RoleValue_PID )
	local NPC = WriteRoleValue( OwnerID() , EM_RoleValue_Register+3, TargetID() ) --把值寫入NPC
	if firepid == 0 then
		if CheckFlag(OwnerID(), 544703 ) == true and CheckFlag(OwnerID(), 544707 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0  then
			WriteRoleValue( targetID() , EM_RoleValue_PID ,  1 )
			--say(targetid(), firepid)
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FIREDAY_EV1_10]" , C_SYSTEM )  --升火開始！
			ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FIREDAY_EV1_10]" , C_SYSTEM )  
			AddBuff( OwnerID() , 508657 , 1, -1) --不能移動
			sleep(1)
			AddBuff( OwnerID() , 508489 , 1, -1) --給技能buff水
			sleep(1)	
			AddBuff( OwnerID() , 508490 , 1, -1) --給技能buff火
			sleep(1)
			setflag(OwnerID(), 544707, 1 )  --不能重複點火堆
			setflag(OwnerID(), 544703, 0 ) 	
			local target = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) --讀記在玩家上的值
			--Say( OwnerID(), target)
			WriteRoleValue(TargetID() , EM_RoleValue_Register+2, 0 ) 
			local now = ReadRoleValue ( targetID() , EM_RoleValue_Register+2)
			SetSmallGameMenuType(  OwnerID() , 11 , 1 ) --記分板，填1為創造，填2為關閉
			SetSmallGameMenuStr( OwnerID() , 11 , 1 , "[SC_FIREDAY_EV1_16][$SETVAR1="..target.."]"  ) --欲達到溫度目標（畫面中）
			SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..now.."]"  ) --目前溫度
			ClockOpen( OwnerID() ,EM_ClockCheckValue_20, 60,60, 0,"lua_fireday_ev1_zone", "lua_fireday_ev1_timeover") --倒數計時器  (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
			beginplot(TargetID(), "lua_fireday_ev1_infire", 0) --呼叫
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) == 0 then
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FIREDAY_EV1_20]" , C_SYSTEM )  --請先跟升火負責人接取任務！
			ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FIREDAY_EV1_20]" , C_SYSTEM )  
			setflag(OwnerID(), 544703, 0 )
			--say(OwnerID(), "88")
			--say(TargetID(), "89")
		end
	elseif checkflag(ownerid(), 544707) == true then
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FIREDAY_EV1_22]" , C_SYSTEM ) --不能重複點擊火堆
	--say(OwnerID(), "83")
	--say(TargetID(), "84")
	elseif firepid ==1 then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FIREDAY_EV1_23]" , C_SYSTEM ) --火堆正在使用中
		--say(OwnerID(), "93")
		--say(TargetID(), "94")
	end
end

--------------------------------時間到、換區、清值----------------------------------------------------
function lua_fireday_ev1_timeover()
	--Say( NPC , "101" )  --NPC
	--Say(OwnerID(), "102")  --player
	--Say(TargetID(), "103")  -- player
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_FIREDAY_EV1_15]" , C_SYSTEM )  --時間到！
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FIREDAY_EV1_15]" , C_SYSTEM )  
	ClockClose( OwnerID() )
	CancelBuff( OwnerID() , 508489 ) 	--清除技能buff
	CancelBuff( OwnerID() , 508490 )
	CancelBuff( OwnerID() , 508657 )
	SetFlag(OwnerID(), 544702, 1 ) --給今天已參加全民升火樂的 Flag
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) --火堆NPC
	local fireplayer = ReadRoleValue ( NPC , EM_RoleValue_Register+2 )  -- ans
	local fireq = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 )   --question
	--Say(OwnerID(), fireplayer)  
	--Say( TargetID(), "NPC"..firenpc) 
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_FIREDAY_EV1_25][$SETVAR1="..fireq.."][$SETVAR2="..fireplayer.."]" , C_SYSTEM )
	ScriptMessage( OwnerID() , OwnerID(), 0, "[SC_FIREDAY_EV1_25][$SETVAR1="..fireq.."][$SETVAR2="..fireplayer.."]" , C_SYSTEM )
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,fireplayer)
	sleep(50)
	local fireNPC = ReadRoleValue( NPC , EM_RoleValue_Register+4 ) 
	DelObj( fireNPC )
	SetSmallGameMenuType( OwnerID() , 11 ,2 ) -- 關閉介面 (2為關閉)
	WriteRoleValue( NPC , EM_RoleValue_PID ,  0 ) --火堆的IP歸0
	WriteRoleValue( NPC , EM_RoleValue_Register+4 , 0 ) 
end

function lua_fireday_ev1_firere()
	local firetime = 60
	while firetime >0 do
	--	say(TargetID(), "firere="..firetime)
		firetime = firetime -1
		sleep(10)
	end
	local t = ReadRoleValue(  TargetID() , EM_RoleValue_Register+4 )
	DelObj( t )
	WriteRoleValue(  TargetID() , EM_RoleValue_PID ,  0 ) --火堆的PID歸0
	WriteRoleValue(  TargetID() , EM_RoleValue_Register+2 ,  0 )
end

function lua_fireday_ev1_zone() --換區
	--Say(OwnerID(), "137")  --player
	--Say(TargetID(), "139")  -- player
	ClockClose( OwnerID() )
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_FIREDAY_EV1_17]" , 0)
	ScriptMessage( OwnerID() , OwnerID(), 0, "[SC_FIREDAY_EV1_17]" , C_SYSTEM )
	CancelBuff( OwnerID() , 508489 ) 	--清除技能buff
	CancelBuff( OwnerID() , 508490 )
	CancelBuff( OwnerID() , 508657 )
	SetFlag(OwnerID(), 544731, 0 )
	SetSmallGameMenuType( OwnerID() , 11 ,2 ) -- 關閉介面 (2為關閉)
	local firenpc2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )
	local firenpc3 = ReadRoleValue( firenpc2 , EM_RoleValue_Register+4 ) 
	DelObj( firenpc3 )
	WriteRoleValue(  firenpc2 , EM_RoleValue_PID ,  0 ) --火堆的IP歸0
	WriteRoleValue(  OwnerID(), EM_RoleValue_Register+1 , 0 ) 
	WriteRoleValue(  OwnerID(), EM_RoleValue_Register+3 , 0 ) 
end

function lua_fireday_ev1_leavefire() --離線
	--Say(OwnerID(), "137")  --player
	--Say(TargetID(), "139")  -- player
	local firenpc2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )
	local firenpc3 = ReadRoleValue( firenpc2 , EM_RoleValue_Register+4 ) 
	DelObj( firenpc3 )
	WriteRoleValue(  firenpc2 , EM_RoleValue_PID ,  0 ) --火堆的IP歸0
end

--------------------------------技能指定------------------------------------------------
function Lua_fireday_ev1_checknpc()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --讀誰身上的ID
--	say ( OwnerID () ,"161" ) --player
--	say ( TargetID () , OrgID ) --火堆
	if ( CheckID( TargetID() ) == false ) then  --沒有對象
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_26]" , 0 )	
	--	Say(OwnerID(),"166  no ok")
		return false
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_26]" , 0 )	
			return false
		else  --不是玩家
			if OrgID == 117254 then  
			--	Say(OwnerID(),"ok")
				return true
			else
			--	Say(OwnerID(),"177 no ok")
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_26]" , 0 )		
				return false
			end
		end
	end
end

--------------------------------來了一陣風or雨------------------------------------------
function lua_fireday_ev1_infire() --種火焰
	--Say(OwnerID(), "131") --火堆
	--Say(TargetID(), "132")  --玩家
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --參照火堆位址
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , TargetID() ) --設進玩家的值
--	say(playerID,"0000")
	local Obj = Role:new( OwnerID() )  -- 取得火堆 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local fireNPC = CreateObj( 117265, BaseX, BaseY+10, BaseZ, BaseDir, 1 ) --創立火焰高度10
	SetModeEx( fireNPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( fireNPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( fireNPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( fireNPC, EM_SetModeType_Mark, false )--標記
	SetModeEx( fireNPC, EM_SetModeType_Move, false )--移動
	SetModeEx( fireNPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( fireNPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( fireNPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( fireNPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( fireNPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( fireNPC, EM_SetModeType_Gravity, false )--重力
	SetModeEx( fireNPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( fireNPC , RoomID ) -- 建立物件
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4, fireNPC ) --把值寫入NPC
	Beginplot( fireNPC, "lua_fireday_ev1_change" , 0 ) --在建立前執行才會成功
	Beginplot( OwnerID() , "lua_fireday_ev1_firere" , 0 )--倒數
end

function lua_fireday_ev1_change()
	--Say(OwnerID(), "159")  --中火
	--Say(TagetID(), "160")  -- 火堆
	local newvalue , playerID , firevalue
	local time = 60
	while true do
		if time >= 4 and time <= 50 then --10秒後開始迴圈
			while true do
				--Say( OwnerID() , "time ="..time )
				newvalue = ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
				playerID = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 )
				firevalue = ReadRoleValue (  playerID, EM_RoleValue_Register+1 )
				if newvalue > 0 then
					local a = rand(11)
					if a >= 0 and a <= 5  then-- 0~ 5
						local b = (rand(21)+30) * 0.5
						local newvalue = ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
						newvalue  = math.floor ( newvalue + b +0.5)  --四捨五入
						--say( OwnerID(), b)
						ScriptMessage( playerID, playerID, 1, "[SC_FIREDAY_EV1_09]" , C_SYSTEM )  --忽然刮起一陣風讓火勢更旺了！
						ChangeObjID( OwnerID(), 117256 ) --變大火
						WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , OwnerID() )
						WriteRoleValue( TargetID() , EM_RoleValue_Register+2, newvalue )
						local n =  ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
						SetSmallGameMenuStr( playerID , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..n.."]"  ) --更新為目前溫度
						--say( TargetID(), "173")
						--say(OwnerID(), "174")
					elseif a >= 6 and a <= 10 then -- 6 ~ 10
						local b = (rand(21)+30) * 0.5
						local newvalue = ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
						newvalue  = math.floor ( newvalue - b +0.5) 
						--say( TargetID(), newvalue)
						if newvalue < 0 then
							newvalue = 0
							ChangeObjID( OwnerID(), 117255 ) --變小火
							WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , OwnerID() )
							SetSmallGameMenuStr( playerID, 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..newvalue.."]"  )
						else
							ScriptMessage( playerID,  playerID, 1, "[SC_FIREDAY_EV1_12]" , C_SYSTEM )  --忽然下起一陣雨讓火勢衰弱了！
							ChangeObjID( OwnerID(), 117255 ) --變小火
							WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , OwnerID() )
							WriteRoleValue( TargetID() , EM_RoleValue_Register+2, newvalue )
							local n =  ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
							SetSmallGameMenuStr( playerID, 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..n.."]"  ) --更新為目前溫度
							--say(OwnerID(), "183")
							--say(TargetID(), "184")
						end
					end
				end
				local g = (rand( 5 ) *10)+15
				time = time - g/10
				if time <= 4 then --小於4秒時停止迴圈
					return time				
				end
			sleep( g )
			end 
		else 
			time = time -1			
		end
	sleep(10)
	end

end 

-------------------------------技能潑水、催化--------------------------------------------
function lua_fireday_ev1_waterbuff()
	--Say(OwnerID(), "192")  --player
	--Say(TargetID(), "193")  -- 火堆
	local w =  ReadRoleValue ( targetID() , EM_RoleValue_Register+2 )
	local fireNPC = ReadRoleValue ( TargetID() , EM_RoleValue_Register+4)
	local x = rand(15)+1
	if w < x then
		w = 0
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_24]" , C_SYSTEM )  --威力過低，快催化
		SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..w.."]"  )
	elseif w >= x then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_19][$SETVAR1="..x.."]" , C_SYSTEM ) --降了？度
		w = w - x
		SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..w.."]"  )
	end

	ChangeObjID( fireNPC, 117265 ) --變中火
	WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , fireNPC )
	WriteRoleValue(TargetID() , EM_RoleValue_Register+2, w )
	local w =  ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
	SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..w.."]"  ) --更新為目前溫度
end

function lua_fireday_ev1_firebuff()
	--Say(OwnerID(), "207")  --player
	--Say(TargetID(), "208") --火堆
	local f = ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
	local fireNPC = ReadRoleValue ( TargetID() , EM_RoleValue_Register+4)
	local x = rand(15)+1
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_18][$SETVAR1="..x.."]", C_SYSTEM  ) -- 升了？度

	ChangeObjID( fireNPC, 117265 ) --變中火
	WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , fireNPC )
	f = f + x
	WriteRoleValue(TargetID() , EM_RoleValue_Register+2, f )
	local f =  ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
	SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..f.."]"  ) --更新為目前溫度
end

-------------------------------頒獎--------------------------------------------------
function lua_fireday_ev1_end()
	--Say(OwnerID(), "222")  --player
	--Say(TargetID(), "223") --升火負責人
	--Say(OwnerID(), fireplayer)  
	--Say( TargetID(), "NPC"..firenpc) 
	local firenpc4 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) --火堆NPC
	local fireplayer = ReadRoleValue ( OwnerID(), EM_RoleValue_Register+2 )  -- ans
	local fireq = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 )   --question
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		if fireq>0 then
			if fireplayer > (fireq-4) and fireplayer < (fireq+4) then  
				SetSpeakDetail( OwnerID(), "[SC_FIREDAY_EV1_04]" ) --真是做得太好了，看來你很有機會被選為明年的升火執行者啊！拿去吧，這是你應得的獎勵。
				GiveBodyItem(OwnerID(),725654, 1) --給獎
				GiveBodyItem(OwnerID(), 208918, 1)
				SetFlag(OwnerID(), 544728, 1 )
			else   
				SetSpeakDetail( OwnerID(), "[SC_FIREDAY_EV1_14]" ) --雖然結果差強人意，但你很努力，明天再加油吧！
				GiveBodyItem(OwnerID(), 208918, 1) --給獎
				SetFlag(OwnerID(), 544728, 1 ) --不能重複領
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_FIREDAY_EV1_27]" ) --活動失敗無法領獎
			SetFlag(OwnerID(), 544728, 1 )
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
	end
	WriteRoleValue( firenpc4 , EM_RoleValue_Register+2, 0 )        --清空答案
	WriteRoleValue(  OwnerID(), EM_RoleValue_Register+3 , 0 ) 
	WriteRoleValue(  OwnerID(), EM_RoleValue_Register+1 , 0 ) 
end