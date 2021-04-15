
--120086 茉凡妮爾
function Lua_na_11xmas_muven_0() --120086茉凡妮爾對話
	local Player = OwnerID()
	local Muven = TargetID()
	local MuvenPID = ReadRoleValue ( Muven, EM_RoleValue_PID )
	AdjustFaceDir( Muven , Player , 0 ) -- 面向
	if MuvenPID == 1 then
		SetSpeakDetail( Player, GetString("SC_2011XMAS_MUVEN") ) --我們是艾力克研究團的天象觀測人員，就在今年入冬的時節，我們注意到一些細微的異象，原本我們不以為意，但是今年的冬季的氣溫卻十分不尋常…
		AddSpeakOption( Player , Muven , GetString("SC_2011XMAS_MUVEN_YES"), "Lua_na_11xmas_muven_YES", 0 ) -- 我準備好了！
		AddSpeakOption( Player , Muven , GetString("SC_2011XMAS_MUVEN_NO"), "Lua_na_11xmas_muven_NO", 0 ) --再讓我考慮一下…
	else
		SetSpeakDetail( Player, GetString("SC_2011XMAS_MUVEN_1") ) --謝謝你的關心，[$playername]！別擔心，我並不是遇難或是受困在這片雪海之中！...
	end
		
end

function Lua_na_11xmas_muven_YES() -- 答應幫忙，傳送到活動區！
	local Owner = OwnerID()
	local Muven = TargetID()
	local MuvenPID = ReadRoleValue( Muven , EM_RoleValue_PID ) 
	CloseSpeak( Owner )
	AdjustFaceDir( Muven , Owner  , 0 ) -- 面向
	if MuvenPID == 1 then
		CastSpell( Muven , Owner   , 498386 ) --傳送至活動區
	else
		SetSpeakDetail( Owner , "[SC_2011XMAS_MUVEN_YES1]" )  --冰凍氣流已經消失，目前無法進入。
	end
end

function Lua_na_11xmas_muven_NO()
	local Player = OwnerID()	
	SetSpeakDetail( Player, GetString("SC_2011XMAS_MUVEN_NO1") ) --如果你不願意我也無法勉強你，還是希望你能夠慎重考慮看看...
end


--給予BUFF

function Lua_na_11xmas_insert_PlayerList()
	local Owner = OwnerID()
	local Target = TargetID()
	if  CheckBuff( Owner , 621731 ) == false then --  如果玩家身上沒有活動BUFF
	--	local DBID = ReadRoleValue( Owner , EM_RoleValue_DBID  )
	--	table.insert ( PlayerList , DBID)
		table.insert ( PlayerList , Owner )
		WriteRoleValue( Owner , EM_RoleValue_Register2 , 0 )
		ScriptMessage( Owner ,  Owner, 1, "[SC_2011XMAS_01]" , C_SYSTEM )  --請拯救日漸寒冷的暖冬節！
		ScriptMessage( Owner ,  Owner, 0, "[SC_2011XMAS_01]" , C_SYSTEM )  --請拯救日漸寒冷的暖冬節！
		sleep(10)
		Addbuff( Owner, 621720 , 2, 14400) --判斷離線傳送用BUFF
		AddBuff( Owner , 621731 , 1, -1) --燃火
		sleep(10)
		local score = ReadRoleValue ( Owner , EM_RoleValue_Register2 )
		local X = table.getn(PlayerList)
	--	Say( Owner , "score= ".. score )
	--	Say( Owner , "player = " .. X )
	end
end


--120085 塔蘭西亞
function Lua_na_tarlencia()--塔蘭西亞的初始劇情
	LuaN_miyon_action02()
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 ) --將塔蘭西亞身上的Register值寫為0，表示活動尚未結束
--	local Reg1 = ReadRoleValue( Owner , EM_RoleValue_Register1)
--	say( Owner , Reg1 ) --檢查NPC身上的值
end
	



function Lua_na_11xmas_npc() --塔蘭西亞對話劇情
--Owner 玩家
--Target 塔蘭西亞
	local Player = OwnerID()
	local Target = TargetID()
	local check = ReadRoleValue( Target , EM_RoleValue_Register1 )
	-- 領獎選項判斷用KEY ---
	local winkeyid  = 546141   -- 打贏boss
	local checkwinkey = Checkflag(Player, winkeyid )

	AdjustFaceDir( Target , Player , 0 ) -- 面向
	if check == 0 then  --如果活動尚未結束
		SetSpeakDetail( Player , "[SC_2011XMAS_02]" ) --[$playername]，你好！我是烈焰侍僕－坦蘭西亞，特地前來協助暖冬節異象的恢復...
		AddSpeakOption( Player , Target, "[SC_2011XMAS_03]" , "Lua_na_11xmas_saintbegin", 0 ) --請讓我成為聖焰使者
		AddSpeakOption( Player , Target ,"[SC_2011XMAS_08]" , "Lua_na_11xmas_leave", 0 ) --我想離開這裡。

	elseif check == 1 then  --場上有使者，隱藏選項
		SetSpeakDetail( Player , "[SC_2011XMAS_02]"  ) -- --[$playername]，你好！我是烈焰侍僕－坦蘭西亞，特地前來協助暖冬節異象的恢復...
		AddSpeakOption( Player , Target , "[SC_2011XMAS_08]" , "Lua_na_11xmas_leave", 0 ) --我想離開這裡。

	else  --活動已經結束
		SetSpeakDetail( Player , "[SC_2011XMAS_07]"  ) --感謝你們的協助，我想這次的危機已經解除了！但是我有預感，暴風雪人還是會再度出現...
		if checkwinkey == true then  -- 有打贏boss 
			AddSpeakOption( Player ,Target , "[SC_FIREDAY_EV1_21]"  , "lua_mika_xmas2011_reward02" , 0)   --  reward
		end
		AddSpeakOption( Player , Target , "[SC_2011XMAS_08]" , "Lua_na_11xmas_leave", 0 ) --我想離開這裡。
	end


	sleep(10)
end


function Lua_na_11xmas_saintbegin() --給予聖焰
--Owner 玩家
--Target 塔蘭西亞
	local Owner = OwnerID()
	local Target = TargetID()
	local check = ReadRoleValue( Target , EM_RoleValue_Register1 )
	if check == 0  then --檢查是否已經有人成為聖焰使者了
		if CheckBuff( Owner , 621727 ) == true then --玩家身上有殘留的聖焰
			ScriptMessage(Owner , Owner , 1 ,  "[SC_2011XMAS_11]", 0 )  --身上還有殘留的聖焰，暫時無法成為聖焰使者。
		else
			CancelBuff( Owner , 621897 ) --刪除目標身上的寒冷值
			AddBuff ( Owner , 621729, 0 , 60 ) --給予聖焰庇護的BUFF
			WriteRoleValue( Target , EM_RoleValue_Register1 , 1 )-- 將塔蘭西亞身上的reg1值寫為1
			local Reg1 = ReadRoleValue(Target , EM_RoleValue_Register1 )
		--	say( Target , Reg1 ) --檢查NPC身上的值
		end
	elseif check == 1 then
		ScriptMessage(Owner , Owner , 1 ,  "[SC_2011XMAS_06]", 0 )  --已經有人成為聖焰使者了
	end
	CloseSpeak( Owner )
end

--function Lua_na_11xmas_firestart()
--	local Owner = OwnerID()
--	if CheckBuff ( Owner , 621731 ) == true then --如果已有燃火BUFF 
--		ScriptMessage(Owner , Owner , 1 ,  "[SC_2011XMAS_13]", 0 )  --你已經擁有此技能了！
--	elseif CheckBuff( Owner, 621729 ) == true then --如果是聖焰使者
--		ScriptMessage(Owner , Owner , 1 ,  "[SC_2011XMAS_14]", 0 )  --你目前是聖焰使者，無法獲得此技能。
--	else
--		table.insert ( PlayerList , Owner ) --將中途離線，重新回到場上的玩家再次寫入TABLE裡
--		AddBuff( Owner , 621731 , 1, -1) --燃火
--	end
--end



function Lua_na_11xmas_addDoor()	-- 產生阻擋門
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --確認伺服器的分流
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 120087 -- 門
	local X = { 40 }-- 幾邊型
	local dis = { 700 } -- 距離圓心的距離
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			MonsterGroup[Count] = CreateObj( MonsterID , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			WriteRoleValue( MonsterGroup[Count] , EM_RoleValue_PID , Count )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( MonsterGroup[i] , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Obstruct , true )--阻擋
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Mark , false )--標記
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Move , false )--移動
		SetModeEx( MonsterGroup[i], EM_SetModeType_Gravity, true )--重力
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( MonsterGroup[i] , EM_SetModeType_HideName , false )--名稱
		SetModeEx( MonsterGroup[i] , EM_SetModeType_ShowRoleHead , false )--頭像框
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Drag , false )--阻力
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Show , true )--顯示
		Sleep(2)
		AdjustFaceDir( MonsterGroup[i] , OwnerID() , 0 ) 
		AddToPartition( MonsterGroup[i] , RoomID )
	end
end



function Lua_na_11xmas_boss_dead()	--王死後的劇情
	local winkeyid  = 546141
	BeginPlot( SaintFire , "Lua_na_11xmas_boss_dead1", 0 )
	WriteRoleValue( Tarlencia , EM_RoleValue_Register1 , 2 ) 
	TarlenReg1 = ReadRoleValue( Tarlencia , EM_RoleValue_Register1 )
	ScriptMessage(Tarlencia , -1 , 1 ,  "[SC_2011XMAS_REWARD]", C_SYSTEM )  --記得與塔蘭西亞領取獎勵唷！
	for i = 1 , table.getn(PlayerList), 1 do
		if CheckID( PlayerList[i]) == true then
			SetFlag( PlayerList[i] , winkeyid , 1)
		else
			DebugMsg( 0, 0 ,"ID = "..PlayerList[i]);
		end
	end
	return true
end

function Lua_na_11xmas_leave()
	local Owner = OwnerID()
	local Target = TargetID()
	CloseSpeak( Owner )

	if CheckBuff( Owner , 621720 ) == false then
		SysCastSpellLv( Owner, Owner ,498968 , 1) 
	--	say( Owner , "TRANS" )
	else
		CancelBuff( Owner , 621720)	
	end
end

function Lua_na_11xmas_boss_dead1()
	BeginPlot( SaintFire, "Lua_na_11xmas_delallbuff", 0 )
	sleep(100)
	BeginPlot( SaintFire, "Lua_na_11xmas_del" ,0 )
end



function Lua_na_11xmas_transZone()
	local Owner = OwnerID()
	local ZoneID = ReadRoleValue( Owner , EM_RoleValue_ZoneID )
	ChangeZone(Owner , 5 , -1 ,  -15292 , 879 , -1849 , 305)
end