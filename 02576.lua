function Lua_dupei_fire_fireman()
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) 
--	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流
	local Npc = OwnerID()	--祭壇
	local Hour , Min
	local Fire	-- 讓祭壇想起祭壇上的火焰
	local Box

		while true do
		Hour = GetSystime(1) --取得現在時間：時
		Min = GetSystime(2) --取得現在時間：分

			if Hour ==0 or Hour ==4 or Hour ==8 or Hour ==12 or Hour ==16 or Hour ==20 then
				if Min ==20 then
					if ZoneID < 1000 then --(若ZoneID大於1000則為分流)
					RunningMsgEx( Npc , 2 , 3 , "[SC_FIREDAY_2012_EV1_1]" )  --遺忘者神殿即將要開始升火祈福活動，想成為今年祭壇最高分的挑戰者快來祭壇集合吧
					end			
				local Magic = LuaFunc_CreateObjByObj( 120152 , Npc )	--魔法陣
				WriteRoleValue( Npc , EM_RoleValue_Register+1 , Magic ) -- 讓祭壇在別的函式認起魔法陣

				elseif Min ==30 then
					if ZoneID < 1000 then --(若ZoneID大於1000則為分流)
					RunningMsgEx( Npc , 2 , 3 , "[SC_FIREDAY_2012_EV1_2]" )  --活動開始
					end
					BeginPlot( Npc , "Lua_dupei_fire_furemanobj" , 0 ) -- 生火
					BeginPlot( Npc , "Lua_dupei_fire_fireman_born" , 0 ) -- 生符文

				elseif Min==33 then
					Magic = ReadRoleValue( Npc , EM_RoleValue_Register+1 )   --想起物件做刪除動作
					Fire= ReadRoleValue( Npc , EM_RoleValue_Register+2 )
					Box=ReadRoleValue( Npc , EM_RoleValue_Register+3 )
					DelObj(Magic)
					DelObj(Fire)
					DelObj(Box)	
					WriteRoleValue( Npc , EM_RoleValue_Register+1 , 0 )
					WriteRoleValue( Npc , EM_RoleValue_Register+2 , 0 )
					WriteRoleValue( Npc , EM_RoleValue_Register+3 , 0 )
					BeginPlot (Npc ,  "Lua_dupei_fire_firemandelrune" , 0)
						if ZoneID < 1000 then --(若ZoneID大於1000則為分流)
						RunningMsgEx( Npc , 2 , 3 , "[SC_FIREDAY_2012_EV1_22]" )--時間到，本時段聖火祈福投擲樂活動結束。
						end
				end
			end
		Sleep(600)
		end
end

--------生成區---------------------------------------

function Lua_dupei_fire_furemanobj()	--祭壇生成火堆
	local Npc = OwnerID()	-- 祭壇
--	local Magic = LuaFunc_CreateObjByObj( 120152 , Npc )	--魔法陣
	local X = ReadRoleValue( Npc , EM_RoleValue_X )
	local Y = ReadRoleValue( Npc , EM_RoleValue_Y )
	local Z = ReadRoleValue( Npc , EM_RoleValue_Z )
	local Dir = ReadRoleValue( Npc , EM_RoleValue_Dir )
	local Room = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local Fire = CreateObj( 120156 , X , Y+35 , Z , Dir , 1 )	-- 祭壇上的火
	SetModeEx(  Fire, EM_SetModeType_Show, true )--顯示
	SetModeEx( Fire , EM_SetModeType_Gravity , false )	--重力
	SetModeEx( Fire  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Fire  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Fire  , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Fire  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Fire  , EM_SetModeType_Move, false )--移動
	AddToPartition( Fire , Room ) 	-- 生成祭壇上的火
	WriteRoleValue( Npc , EM_RoleValue_Register+2 , Fire )	-- 讓祭壇在別的函式認得祭壇上的火
	local CheckPlayer = {}
	local Player = SearchRangePlayer( Npc , 185) --搜尋祭壇周圍185所有玩家進table
	local Distance = SetSearchAllPlayer( Room )
	local Gamer = {}

		for i = 0 , table.getn(Player) , 1 do
			if CheckBuff( Player[i] , 621827 ) == true then --有已報名Buff
				AddBuff( Player[i] , 621802 , 0 , 3 ) --給予 檢查_出局判定 Buff
				table.insert( CheckPlayer , Player[i] ) --加入CheckPlayer的table裡
			end
		end

		if Distance > 0 then
			for i = 1 , Distance , 1 do
				Gamer[i] = GetSearchResult()
				if CheckBuff( Gamer[i] , 621827 ) == true and GetDistance( Gamer[i] , Npc ) > 185 then --有已報名Buff
					CancelBuff ( Gamer[i] , 621827 ) --關掉報名證明Buff 621827
					CancelBuff ( Gamer[i] , 621779 )--關掉身上撿起的符文 621779
					CancelBuff ( Gamer[i]  , 621801 )  --關掉出局玩家的範圍爆炸
					ScriptMessage( Gamer[i]  , Gamer[i]  , 1 , "[SC_FIREDAY_2012_EV1_27]" , 0 ) --超出活動範圍外，出局了！
				end
			end
		end

		for i = 1 , 180 , 1 do --重覆這個動作180次,延遲1秒 (也就是會執行180秒)
		 	CheckPlayer = Lua_dupei_fire_firemanDis( CheckPlayer ) --將CheckPlayer的table帶入function
			local Player = SearchRangePlayer( Npc , 185 ) --搜尋BOX周圍185所有玩家進table

			for i = 0 , table.getn(Player) , 1 do
				local BuffType = 0
				local Count = BuffCount( Player[i] )

--				if GetDistance( Player[i] , Npc ) > 185 then
--					CancelBuff ( Player[i] , 621827 ) --關掉報名證明Buff 621827
--					CancelBuff ( Player[i] , 621779 )--關掉身上撿起的符文 621779
--					CancelBuff ( Player[i]  , 621801 )  --關掉出局玩家的範圍爆炸
--					ScriptMessage( Player[i]  , Player[i]  , 1 , "[SC_FIREDAY_2012_EV1_4]" , 0 ) --超出活動範圍外，出局了！
--				end

				for j = 0 , Count  , 1 do
					local BuffID = BuffInfo( Player[i] , j , EM_BuffInfoType_BuffID )
					if GameObjInfo_int( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int( BuffID , "AssistType" )
						break
					end
				end

				if BuffType == 68 then --有騎乘坐騎
				DW_CancelTypeBuff( 68,  Player[i] ) --下馬
				ScriptMessage( Player[i] , Player[i] , 1 , "[SC_THANKS_2011_12]" , 0 )  --活動進行中，此處無法騎乘坐騎！0是紅的  C_SYSTEM是黃色
				end
			end
			Sleep(10)
		end

-- 最後要執行的劇情--
	if table.getn(CheckPlayer) > 0 then
		for i = 1 , table.getn(CheckPlayer) , 1 do
--		SetFlag (CheckPlayer[i] , 546121 , 0 )
		CancelBuff (CheckPlayer[i] , 621779)
		CancelBuff (CheckPlayer[i] , 621781)
		CancelBuff (CheckPlayer[i] , 621800)
		CancelBuff (CheckPlayer[i] , 621802)
		CancelBuff (CheckPlayer[i] , 621827)
		SetFlag ( CheckPlayer[i] , 546121 , 1 ) --開啟完美遊戲證明
		ScriptMessage( Checkplayer[i] , Checkplayer[i] , 1 , "[SC_FIREDAY_2012_EV1_7]" , C_SYSTEM ) --感謝你的參與，歡迎下次再來挑戰！獲得的分數可以向甘舒兌換獎勵。
		end
	end	
end


function Lua_dupei_fire_fireman_born()   -- 生隱藏box 
 	local OID = OwnerID() 
	local TID = TargetID()
	local X = ReadRoleValue( OID , EM_RoleValue_X )
	local Y = ReadRoleValue( OID , EM_RoleValue_Y )
	local Z = ReadRoleValue( OID , EM_RoleValue_Z )
	local Dir = ReadRoleValue( OID , EM_RoleValue_Dir )
	local Room = ReadRoleValue( OID , EM_RoleValue_RoomID )
	local Box = CreateObj( 120159 , X , Y , Z+20 , Dir , 1 )	--  box  要改box的id
	SetModeEx(  Box, EM_SetModeType_Show, false )--顯示
	SetModeEx( Box , EM_SetModeType_Gravity , false )	--重力
	SetModeEx( Box  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Box  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Box  , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Box  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Box  , EM_SetModeType_Move, false )--移動
	SetModeEx( Box  , EM_SetModeType_Searchenemy, false )--索敵
	WriteRoleValue( OID , EM_RoleValue_Register+3 , Box )	-- 讓祭壇在別的函式認得祭壇上的火

	-- 抓報名npc身上人數(register) 
	local npc = LuaFunc_SearchNPCbyOrgID( OID , 120153, 500 , 0)       --找報名npc
	local playercount = ReadRoleValue( npc, EM_RoleValue_Register )  -- 有報名玩家人數
--	say(npc, "playercount  = "..playercount ) --目前先顯示有報名玩家人數
	local runecount 	-- 根據人數決定符文數量
		if playercount <= 5 then
		runecount = 7
		elseif playercount > 5 and playercount <= 8  then
		runecount = 10
		elseif playercount > 8 and playercount <= 12  then
		runecount = 14
		elseif playercount > 12 and playercount <= 18  then
		runecount = 20
		elseif playercount > 18 then
		runecount = 25		
		end

	CallPlot( Box , "lua_dupei_fire_fireman_rune" , runecount )
	AddToPartition( Box , Room ) 	-- 生成隱藏物件Box

	-- 把人數歸零
	WriteRoleValue( npc , EM_RoleValue_Register , 0 ) 
	local playercount = ReadRoleValue( npc, EM_RoleValue_Register )  -- 有報名玩家人數
--	say(npc, "playercount  = "..playercount ) --目前先顯示有報名玩家人數
end


function lua_dupei_fire_fireman_rune(runecount) --隱藏物件Box的生成方程式
	local OID = OwnerID()  -- Box
--	say(OID, "count = "..runecount )
	local FlagObjID = 781070  --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量	
	local Obj = 120157 -- 要種的物件ID
	local ObjNum =  runecount      --math.floor( FlagNum / 4 )   --種植物件數量 
	local resetTime =  10   -- 間隔時間
	local Range = 10 --物件亂數範圍
	local Gravity = true --重力
--	say(OID, "ObjNum = "..ObjNum )
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )--這是定時執行的迴圈
end

--------符文刪除區---------------------------------------

function Lua_dupei_fire_firemandelrune()
	local OID=OwnerID()
	local zone=ReadRoleValue (OID , EM_RoleValue_RoomID)
	local rune=SetSearchAllNPC(zone)
		for i = 1 , rune , 1 do
		local NPC = GetSearchResult() 
		local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
			if OrgID == 120157 then			
			DelObj(NPC)
			end
		end	
end


--------活動範圍---------------------------------------

function Lua_dupei_fire_firemanDis( CheckPlayer )
	local Npc = OwnerID()
	local Newplayer ={}
--	for i , player in pairs(CheckPlayer) do
	for i = 1 , table.getn(CheckPlayer) , 1 do
--		if CheckBuff( player , 621802) then
		if CheckBuff( Checkplayer[i] , 621802) then
		local Distance = GetDistance( Npc , Checkplayer[i] ) 
			if Distance <= 185 then --箱子與玩家距離<185
			AddBuff( Checkplayer[i] , 621802 , 0 , 3 ) --加檢查_閃躲BUFF,等級,秒數
				if Distance > 170 then --箱子與玩家距離 >170
				ScriptMessage( Checkplayer[i] , Checkplayer[i] , 1 , "[SC_FIREDAY_2012_EV1_3]" , 0 ) --你快要超出活動範圍外了！
				end
			end
		table.insert( Newplayer , Checkplayer[i] )
		end
	end
	return Newplayer 
end


--------出局動作劇情---------------------------------------

function Lua_dupei_fire_firemanout() 
	local Player = OwnerID()
	CancelBuff ( Player , 621827 ) --關掉報名證明Buff 621827
	CancelBuff ( Player , 621779 )--關掉身上撿起的符文 621779
	CancelBuff ( Player , 621801 )  --關掉出局玩家的範圍爆炸
--	SetFlag ( player , 546121 , 0 ) --關掉報名證明Keyitem 546121
	ScriptMessage( Player , Player , 1 , "[SC_FIREDAY_2012_EV1_4]" , 0 ) --超出活動範圍外，出局了！
end

--------符文動作劇情---------------------------------------

function Lua_dupei_fire_fireman01() --檢符文
	SetPlot( OwnerID() , "touch" , "Lua_dupei_fire_firemanstone" , 20 );
end

function Lua_dupei_fire_firemanstone() --給予符文BUFF
	SetPlot(TargetID(),"touch","",0)
	local Player = OwnerID()
	local A=CheckBuff( Player , 621827 ) --檢查報名Buff 621827 
--	local B=CheckBuff( Player, 621781 ) --檢查倒數Buff 621781 
	local C=CheckBuff( Player, 621779 ) --檢查符文Buff 621779 
--	local boom = ReadRoleValue(Player , EM_RoleValue_Register9 )
		if A == false then--身上沒有報名票
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_5]" , 0 )--無法拾取。
		SetPlot( TargetID() , "touch" , "Lua_dupei_fire_firemanstone" , 20 );
		return false
--		elseif B == true then
--		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_8]" , 0 )
--		return false
		elseif C == true then --身上有符文
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_5]" , 0 )--無法拾取。
		SetPlot( TargetID() , "touch" , "Lua_dupei_fire_firemanstone" , 20 );
		return false
--		elseif boom ~= 0 then
--		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_8]" , 0 )
--		return false
		else
		AddBuff( Player , 621779 , 0 , -1 )  
		local TID = TargetID()   --符文
		ks_CreateObj_reset( true, TID )-- 告知隱形Box此位置已清空 
		end
end

function lua_dupei_fire_fireman02() --讓符文只能丟祭壇
	local Player = OwnerID() 
	local Target = TargetID()	-- 施放的目標
	local Name = ReadRoleValue( Target , EM_RoleValue_OrgID )
--	DebugMsg( 0 , 0 , "OrgID = "..Name )		
		if Name == 120154 then
--		DebugMsg( 0 , 0 , "OK" )	
		return true
		else
--		DebugMsg( 0 , 0 , "Error" )
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_8]" , 0 )--投擲目標錯誤。
		--目標錯誤
		return false
		end
end


--------丟進祭壇算分劇情---------------------------------------

function Lua_dupei_fire_firemanpoint() --給予分數BUFF
	local Player = OwnerID()
	local Random = Rand(100)+1 --local Random = DW_Rand(100)

	if CheckBuff( player , 621779) == true then
	CancelBuff( Player , 621779 )
		if Random <= 10 then  --10%加兩分
		KORS_buffUpDown( Player , 621780 , 0 , 2 ) -- 0是加, 1是減,最後的數字是層級
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_24]" , C_SYSTEM )--獲得了2分。
 		elseif Random > 10 and Random<=25 then --15%扣分
 		KORS_buffUpDown( Player , 621780 , 1 , 1  )
		local X = ReadRoleValue( Player , EM_RoleValue_X )	
		local Y = ReadRoleValue( Player , EM_RoleValue_Y )
		local Z = ReadRoleValue( Player , EM_RoleValue_Z )
		local Dir = ReadRoleValue( Player , EM_RoleValue_Dir )
		local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
		local Box = CreateObj( 120158 , X , Y , Z , Dir , 1 )	
		SetModeEx(Box ,EM_SetModeType_Show , FALSE)
		AddToPartition( Box , Room ) -- 生成跟屁蟲
		CallPlot( Box , "Lua_dupei_fire_furemancbuff" , Player , 4 ) --叫出倒數時鐘
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_25]" , C_SYSTEM )--催化失敗扣1分，符文開始產生激烈火花，即將爆裂！
		elseif Random > 25 then
			KORS_buffUpDown( Player , 621780 , 0 , 1 ) --75%加1分
			ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_23]" , C_SYSTEM  )--獲得了1分。
		end
	end
end


--------倒數時鐘---------------------------------------

function Lua_dupei_fire_furemancbuff( Player , Sec )
	for i = 1 , 2 , 1 do
	AddBuff ( Player , 621781 , 0 , 1 )	-- 加給 Player 1個buff(621781) , 持續 Sec 秒
	Sleep(Sec*10/2)
	end
	SysCastSpellLv( Player , Player , 498966 , 0 ) --執行爆破法術集合  SysCastSpellLv( 施法者 , 被施法者 , 法術集合 , 法術等級 )
	DelObj ( OwnerID() )
end


--------扣分----------------------------------------------

function Lua_dupei_fire_firemanboom() -- 基本法術執行扣分劇情  
	local Player = OwnerID()
	local Target = TargetID()
	local Ticket = CheckBuff( Player , 621827 )-- 確認玩家是否有報名證明Buff 621827	
		if Player == Target then
		return false
		else
			if Ticket == true then 
			KORS_buffUpDown( Target , 621780 , 1 , 1  )-- 扣分
			ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_26]" , 0 )--遭受到符文迸出的激烈火花影響，扣1分！
			end	
		end
end


--------爆炸時阻擋玩家撿符文-------------------------------------
function Lua_dupei_fire_FMBoomCheck()
	local Player = OwnerID()
	local time = 0
	WriteRoleValue( Player , EM_RoleValue_Register9 , 1 )
		while TRUE do
		time = time +1
			if time == 3 then
			WriteRoleValue( Player , EM_RoleValue_Register9 , 0 )
			break
			end
		Sleep(10)
		end	
end

--------NPC對話劇情----------------------------------------------


function Lua_dupei_fire_firemantalk()
	local oid = OwnerID()
	SetSpeakDetail( oid , "[SC_FIREDAY_2012_EV1_9]") --哈哈哈！詠火節符文升火活動正在熱鬧進行中喔，怎麼樣？要不要參加啊？
	AddSpeakOption(oid , oid , "[SC_FIREDAY_02]" , "Lua_dupei_fire_firemantalk05" , 0) --我想知道由來
	AddSpeakOption(oid , oid , "[SC_RULE]" , "Lua_dupei_fire_firemantalk04" , 0) --規則說明
	AddSpeakOption(oid , oid , "[SC_111576_YU_03]" , "Lua_dupei_fire_firemantalk02" , 0) --我要報名
	AddSpeakOption(oid , oid , "[SC_FIREDAY_2012_EV1_17]" , "Lua_dupei_fire_firemantalk03" , 0) --換獎勵
end


function Lua_dupei_fire_firemantalk02() --NPC報名劇情
	local Time = { 0 , 4 , 8 , 12 , 16 , 20 }
	local TID = TargetID()  -- npc
	local OID=OwnerID() --玩家
	local Room = ReadRoleValue( OID , EM_RoleValue_RoomID )
	local Ticket=CheckBuff ( OID , 621827 )  
	local Day=CheckFlag ( OID , 546122 )
		if Day==true then
			if Ticket==false then	
			SetSpeakDetail( OID,"[SC_FIREDAY_2012_EV1_11]") --你今天已經參加過了喔，請明天再來吧！
			else 
			SetSpeakDetail( OID,"[SC_FIREDAY_2012_EV1_12]") --你已經報名了喔，趕快去<CP>[120152]</CP>內等待活動開始吧！
			end	
		else	
		Hour = GetSystime(1) --取得現在時間：時
		Min = GetSystime(2) --取得現在時間：分
--		DebugMsg( OID , Room , "Data = "..Hour..":"..Min )
			for i = 1 , table.getn(Time) , 1 do
--				DebugMsg( OID , Room , "Time = "..time[i] )
				if Hour ==Time[i] then
					if Min >= 20 and Min < 30 then
--					SetFlag ( OID , 546121 , 1 )
					SetSpeakDetail( OID,"[SC_FIREDAY_2012_EV1_6]") --報名成功！趕快去<CR>[120152]</CR>內等待活動開始吧！你會是這次活動的最高分嗎？
					AddBuff ( OID , 621827, 0 , -1 )--給予報名證明
					SetFlag ( OID , 546122 , 1 ) --給予每日旗標	
	
					local P = ReadRoleValue(TID, EM_RoleValue_Register )
--					Say(TID, "P = "..P )
					AddRoleValue(TID, EM_RoleValue_Register , 1 )
					local P = ReadRoleValue(TID, EM_RoleValue_Register )
--					Say(TID, "P 2= "..P )
					break
					end	
				else
					SetSpeakDetail( OID,"[SC_FIREDAY_2012_EV1_13]") --目前不能報名，請在活動時間前10分再報名。
				end
			end
		end
end


function Lua_dupei_fire_firemantalk03() --換分劇情
	local oid = OwnerID()
	local CheckPoint = FN_CountBuffLevel( oid , 621780 ) 
 	local CheckA = CheckFlag( oid , 546122 )   --每日
 	local CheckB = CheckFlag( oid , 546121 )  --完美遊戲證明
	local CheckC = CheckBuff ( oid , 621827 ) --報名證明
	local CheckD = CheckBuff ( oid , 621780 ) --分數
	if CheckA==true then 
		if CheckB==true then
			if CheckD== true then
				SetSpeakDetail( oid,"[SC_FIREDAY_2012_EV1_15]")
--				if CheckPoint ==0 then
--				GiveBodyItem( oid , 240995 , 1 )
--				GiveBodyItem( oid , 240996 , 1 )			
--				GiveBodyItem( oid , 720310 , 1 )			
--				CancelBuff ( oid , 621780 )--關閉獲得分數
--				SetFlag ( oid , 546121 , 0 ) --關閉完美遊戲證明	
				if CheckPoint >=0 and CheckPoint <=9 then
				GiveBodyItem( oid , 240995 , 1 )
				GiveBodyItem( oid , 240996 , 1 )			
				GiveBodyItem( oid , 208918 , 1 )
				CancelBuff ( oid , 621780 )--關閉獲得分數
				SetFlag ( oid , 546121 , 0 ) --關閉完美遊戲證明
				elseif CheckPoint >9 and CheckPoint <=14 then
				GiveBodyItem( oid , 240995 , 1 )
				GiveBodyItem( oid , 240996 , 1 )			
 				GiveBodyItem( oid , 208918 , 1 )		
				GiveBodyItem( oid , 240378 , 1 )		
				CancelBuff ( oid , 621780 )--關閉獲得分數
				SetFlag ( oid , 546121 , 0 ) --關閉完美遊戲證明
				elseif CheckPoint >14 and CheckPoint <=19 then
				GiveBodyItem( oid , 240995 , 1 )
				GiveBodyItem( oid , 240996 , 1 )
				GiveBodyItem( oid , 208918 , 2 )
				CancelBuff ( oid , 621780 )--關閉獲得分數
				SetFlag ( oid , 546121 , 0 ) --關閉完美遊戲證明
				elseif CheckPoint >19 then
				GiveBodyItem( oid , 240995 , 1 )
				GiveBodyItem( oid , 240996 , 1 )
				GiveBodyItem( oid , 208918 , 2 )
					if CountBodyItem(oid , 530868)==0 then --檢查玩家身上有沒有追分成功頭銜530868
					givebodyitem(oid, 530868, 1)  --給予追分成功稱號
					end
				CancelBuff ( oid , 621780 )--關閉獲得分數
				SetFlag ( OID , 546121 , 0 ) --關閉完美遊戲證明
				end
			elseif CheckD== false then
			SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_14]" )
			GiveBodyItem( oid , 240995 , 1 )
			GiveBodyItem( oid , 240996 , 1 )			
			GiveBodyItem( oid , 720310 , 1 )			
			SetFlag ( oid , 546121 , 0 ) --關閉完美遊戲證明
			end
		else 
			if  CheckC == true then
			SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_12]" )
			elseif CheckPoint > 0 then
			GiveBodyItem( oid , 720310 , 1 ) --璀璨星空煙火
			CancelBuff ( oid , 621780 )			
			SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_14]" )
			else 
			SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_16]" )
			end
		end		
	else
	SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_18]" )
	AddSpeakOption(oid , oid , "[SC_111576_YU_03]" , "Lua_dupei_fire_firemantalk02" , 0) --我要報名
	AddSpeakOption(oid , oid , "[SO_BACK]" , "Lua_dupei_fire_firemantalk" , 0)
	end
end


function Lua_dupei_fire_firemantalk04() --規則說明劇情
	local oid = OwnerID()
	SetSpeakDetail( oid,"[SC_FIREDAY_2012_EV1_10]")
	AddSpeakOption(oid , oid , "[SO_BACK]" , "Lua_dupei_fire_firemantalk" , 0)
end


function Lua_dupei_fire_firemantalk05() --詠火節由來劇情
	local oid = OwnerID()
	SetSpeakDetail( oid, "[SC_FIREDAY_01]")
	AddSpeakOption(oid , oid , "[SO_BACK]" , "Lua_dupei_fire_firemantalk" , 0)
end


--活動宣傳NPC劇情--

function Lua_dupei_fire_firemantalk06() --詠火節宣傳Npc對話
	local oid = OwnerID()
	SetSpeakDetail( oid,"[SC_FIREDAY_2012_EV1_19]")
	AddSpeakOption(oid , oid , "[SC_FIREDAY_02]" , "Lua_dupei_fire_firemantalk08" , 0) --我想知道由來
	AddSpeakOption(oid , oid , "[SC_FIREDAY_2012_EV1_20]" , "Lua_dupei_fire_firemantalk07" , 0) --請傳送我到活動會場
end


function Lua_dupei_fire_firemantalk07() --Npc傳送劇情
	local oid = OwnerID()
	local CheckE = CheckFlag( oid , 546140 )
		if CheckE ==false then
		ChangeZone(oid , 2, -1, 1586.1, -23.7, 9530.2, 237.4)
		SetFlag ( oid , 546140 , 1 ) --打開傳送證明
		else 
		SetSpeakDetail( oid,"[SC_FIREDAY_2012_EV1_21]")
		end	
end

function Lua_dupei_fire_firemantalk08() --詠火節由來劇情
	local oid = OwnerID()
	SetSpeakDetail( oid, "[SC_FIREDAY_01]")
	AddSpeakOption(oid , oid , "[SO_BACK]" , "Lua_dupei_fire_firemantalk06" , 0)
end