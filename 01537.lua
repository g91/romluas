function Lua_mika_BeerWaiter_talkclose()
	DisableQuest(OwnerID() , true)
end

function Lua_mika_BeerWaiter_Action()
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_11]"   )  --露天啤酒吧店長台詞
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_06]" , "Lua_mika_BeerWaiter_About", 0 ) --關於 服務生的一天
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_12]" , "Lua_mika_BeerWaiter_Ready", 0 ) --我要參加
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_About()
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT04C]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_BeerWaiter_Action", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_Ready() 
	local today= CheckFlag(OwnerID()  , 543323) -- 今天參加過
	local ticket = CountBodyItem(OwnerID(), 205940)  --參加券

	if today == true then
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_13]"   )  --你今天已經參加過了
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_BeerWaiter_Action", 0 ) --回到上一層
	elseif CheckBuff( OwnerID() ,504627  ) == true then
			CloseSpeak( OwnerID() )  
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_60]" , C_SYSTEM )  -- 這個活動已在進行中
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_60]" , C_SYSTEM )  -- 這個活動已在進行中
	else
		CloseSpeak( OwnerID() )  
		WriteRoleValue(OwnerID() , EM_RoleValue_Register, 0 )   
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+5, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+6, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+7, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0 )
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_14]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_14]" , C_SYSTEM )  
		sleep(10)	
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_15]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_15]" , C_SYSTEM )    
		sleep(10)
		ScriptMessage( OwnerID() ,  OwnerID(),  1, " 3 ! " , C_SYSTEM )  
		Sleep(10)
		ScriptMessage( OwnerID() ,  OwnerID(),  1, " 2 ! " , C_SYSTEM )  
		Sleep(10)
		ScriptMessage( OwnerID() ,  OwnerID(),  1, " 1 ! " , C_SYSTEM )  
		Sleep(10)
		Beginplot(OwnerID(),"Lua_mika_BeerWaiter_game", 0)
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_game() --啤酒大師給予Buff   --OwnerID 玩家  --TargetID 任務NPC
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_16]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_16]" , C_SYSTEM )  
	sleep(10)
	AddBuff( OwnerID() , 504627 , 1, -1)
	sleep(1)	
	AddBuff( OwnerID() , 504637 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() , 504638 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() , 504639 , 1, -1)
	sleep(1)	
	AddBuff( OwnerID() , 504663 , 1, -1) --X
	sleep(10)
	SetSmallGameMenuType( OwnerID() , 4 , 1 ) --開啟介面 
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	SetSmallGameMenuStr( OwnerID() , 4 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
	SetSmallGameMenuStr( OwnerID() , 4 , 2 , "[SC_BEERDAY_49][$SETVAR1="..score.."]"  ) -- Change grade (++String數字"))  數字
	ClockOpen( OwnerID() ,EM_ClockCheckValue_7, 180 ,180,0,"Lua_mika_beerwaiter_close","Lua_mika_beerwaiter_clockclose") --倒數計時器  (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")

end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_beerwaiter_cust1()  --10
	while true do
		sleep(50)
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  0 )     --清空NPC的題目
		sleep(50)
		local RANDOWN = rand(3)			
		if RANDOWN == 0 then  
			sleep(10)
		--	Say(OwnerID(), "[SC_BEERDAY_17]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_17]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  1 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 1 then 
			sleep(20)
		--	Say(OwnerID(), "[SC_BEERDAY_19]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_19]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  3 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 2 then 
			sleep(30)
	--		Say(OwnerID(), "[SC_BEERDAY_18]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_18]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  2 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 3 then 
			sleep(50)
		--	Say(OwnerID(), "[SC_BEERDAY_20]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_20]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  4 )     --給題目
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_beerwaiter_cust2()    --13
	while true do
		sleep(50)	 
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  0 )     --清空NPC的題目
		sleep(70)
		local RANDOWN = rand(3)			
		if RANDOWN == 0 then  
			sleep(50)
		--	Say(OwnerID(), "[SC_BEERDAY_20]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_20]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  4 )     --給題目
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 1 then 
			sleep(30)
		--	Say(OwnerID(), "[SC_BEERDAY_17]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_17]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  1 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 2 then 
			sleep(20)
		--	Say(OwnerID(), "[SC_BEERDAY_19]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_19]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  3 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 3 then 
			sleep(10)
		--	Say(OwnerID(), "[SC_BEERDAY_18]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_18]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  2 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 

		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_beerwaiter_cust3()   --18
	while true do
		sleep(50)
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  0 )     --清空NPC的題目
		sleep(100)
		local RANDOWN = rand(3)			
		if RANDOWN == 0 then  
			sleep(10)
		--	Say(OwnerID(), "[SC_BEERDAY_20]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_20]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  4 )     --給題目
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 1 then 
			sleep(30)
		--	Say(OwnerID(), "[SC_BEERDAY_18]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_18]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  2 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 2 then 
			sleep(20)
		--	Say(OwnerID(), "[SC_BEERDAY_19]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_19]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  3 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 3 then 
			sleep(50)
		--	Say(OwnerID(), "[SC_BEERDAY_17]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_17]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  1 )     --給題目
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Beerservice_check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local CustID = {111657, 111658, 111677 ,113464, 113465, 113466, 113608, 113609 ,113610, 113611, 113612, 113613}

	if ( CheckID( TargetID() ) == false ) then  --沒有對象
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC03]" , C_SYSTEM )	--請對活動對象的客人使用。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC03]"  , C_SYSTEM )	--請對活動對象的客人使用。
		return false
	else

		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC03]" , C_SYSTEM )	--請對活動對象的客人使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC03]"  , C_SYSTEM )	--請對活動對象的客人使用。
			return false
		else  --不是玩家
			for i = 1 , 12  do
				if ( OrgID == CustID[i] ) then  --對象不是那6個npc
					return true
				end
			end
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC03]" , C_SYSTEM )	--請對活動對象的客人使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC03]"  , C_SYSTEM )	--請對活動對象的客人使用。
			return false
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_service1()--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 1 ) -- 記題目是 
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+1 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 )
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	if CheckBuff(TargetID(), 504617) == false then  -- npc沒在喝酒buff狀態
		if  Q == A  then --如果題目與答案相同
			AddBuff(TargetID(), 504617, 1 , 5) --給npc喝酒buff
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_21]")
			PlayMotion( TargetID(), 118) --Cast表演
			AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , 1 ) -- 在玩家身上記分數+1
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --分數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--現在分數：[$VAR1] 分
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String數字"))  數字
		else
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_22]")
			PlayMotion( TargetID(), 101) --Cast表演
			if  score > 0 then
				AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , -1 ) -- 在玩家身上記分數-1
			end
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --分數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--現在分數：[$VAR1] 分
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String數字"))  數字
		end
	else --有buff
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_61]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_61]"  , C_SYSTEM )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_service2()--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 2 ) -- 記答案
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+1 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 )
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	if CheckBuff(TargetID(), 504617) == false then  -- npc沒在喝酒buff狀態
		if  Q == A  then --如果題目與答案相同
			AddBuff(TargetID(), 504617, 1 , 5) --給npc喝酒buff
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_21]")
			PlayMotion( TargetID(), 118) --Cast表演
			AddRoleValue ( OwnerID() , EM_RoleValue_Register+6, 1 ) -- 在玩家身上記分數+1
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --分數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--現在分數：[$VAR1] 分
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String數字"))  數字
		else
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_22]")
			PlayMotion( TargetID(), 101) --Cast表演
			if  score > 0 then
				AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , -1 ) -- 在玩家身上記分數-1
			end
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --分數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--現在分數：[$VAR1] 分
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String數字"))  數字
		end
	else --有buff
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_61]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_61]"  , C_SYSTEM )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_service3()--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 3 ) -- 記答案
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+1 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 )
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	if CheckBuff(TargetID(), 504617) == false then  -- npc沒在喝酒buff狀態
		if  Q == A  then --如果題目與答案相同
			AddBuff(TargetID(), 504617, 1 , 5) --給npc喝酒buff
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_21]")
			PlayMotion( TargetID(), 118) --Cast表演
			AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , 1 ) -- 在玩家身上記分數+1
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --分數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--現在分數：[$VAR1] 分
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String數字"))  數字
		else
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_22]")
			PlayMotion( TargetID(), 101) --Cast表演
			if  score > 0 then
				AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , -1 ) -- 在玩家身上記分數-1
			end
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --分數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--現在分數：[$VAR1] 分
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String數字"))  數字
		end
	else --有buff
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_61]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_61]"  , C_SYSTEM )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_service4()--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 4 ) -- 記答案
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+1 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 )
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	if CheckBuff(TargetID(), 504617) == false then  -- npc沒在喝酒buff狀態
		if  Q == A  then --如果題目與答案相同
			AddBuff(TargetID(), 504617, 1 , 5) --給npc喝酒buff
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_21]")
			PlayMotion( TargetID(), 103) --Cast表演
			AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , 1 ) -- 在玩家身上記分數+1
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --分數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--現在分數：[$VAR1] 分
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String數字"))  數字
		else
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_22]")
			PlayMotion( TargetID(), 101) --Cast表演
			if  score > 0 then
				AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , -1 ) -- 在玩家身上記分數-1
			end
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --分數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--現在分數：[$VAR1] 分
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- 一日服務生
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String數字"))  數字
		end
	else --有buff
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_61]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_61]"  , C_SYSTEM )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_beerwaiter_clockclose()--x
	ClockClose( OwnerID() )
	SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- 關閉介面
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_23]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_23]" , C_SYSTEM )  
	local totalscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..totalscore.."]" , C_SYSTEM )	--你的總分是：[$VAR1] 分
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..totalscore.."]"  , C_SYSTEM )
	if totalscore >= 31 then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_28]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_28]" , C_SYSTEM )  
		GiveBodyItem(OwnerID(), 205941, 2)
		GiveBodyItem(OwnerID(), 205899, 5) --酒
		--給道具1
	elseif totalscore <31 and totalscore >= 21 then  --31-40
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_27]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_27]" , C_SYSTEM )  
		GiveBodyItem(OwnerID(), 205941, 1)
		GiveBodyItem(OwnerID(), 205899, 3) --酒
		--給道具1
	elseif totalscore <21 and totalscore >= 11 then  --11-30
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_26]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_26]" , C_SYSTEM )  
		GiveBodyItem(OwnerID(), 205941, 1)
		GiveBodyItem(OwnerID(), 205899, 1) --酒
		--給道具1
	elseif totalscore <11 then  
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_25]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_25]" , C_SYSTEM )  
		GiveBodyItem(OwnerID(), 205899, 1) --酒
		--給道具1
	end
	--給道具2
	SetFlag(OwnerID(), 543323, 1 ) --給今天已參加啤酒大師 Flag
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6, 0 )      --清空玩家的分數
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )      --清空玩家的答案
	CancelBuff( OwnerID() , 504663 ) 	
	CancelBuff( OwnerID() , 504639 )
	CancelBuff( OwnerID() , 504638 )
	CancelBuff( OwnerID() , 504637 )
	CancelBuff( OwnerID() , 504627 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+6, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+7, 0 )
end


function Lua_mika_beerwaiter_close()--x
	ClockClose( OwnerID() )
	CancelBuff( OwnerID() , 504663 ) 	
	CancelBuff( OwnerID() , 504639 )
	CancelBuff( OwnerID() , 504638 )
	CancelBuff( OwnerID() , 504637 )
	CancelBuff( OwnerID() , 504627 )
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_23]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_23]" , C_SYSTEM )  
	sleep(20)
	SetFlag(OwnerID(), 543323, 1 ) --給今天已參加啤酒大師 Flag
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6, 0 )      --清空玩家的分數
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )      --清空玩家的題目
	SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- 關閉介面
end

-----------------
function Lua_mika_BeerWaiter_Clearvalue()
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, 0 )   
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+5, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+6, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+7, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0 )
end

function Lua_mika_BeerWaiter_sayvalue() --show出現在r值各個值為何
	Say(OwnerID(),  ReadRoleValue(OwnerID() , EM_RoleValue_Register ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+2 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+4 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+5 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+8 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+9 ))
end
