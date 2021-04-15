function Lua_ying_juice_begin() --活動隱形物件

	local BOX = OwnerID()
	local ZoneID = ReadRoleValue( BOX , EM_RoleValue_RealZoneID ) --讀取隱藏物件位於哪個Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( BOX , 113754 , 500 , 0 ) --以隱藏物件119223為中心，向周圍500碼搜尋NPC范倫鐵恩113754
										       --(最後的0為Type，Type 0 的話會在只找到一個目標時回傳該目標，適用於已知數量目標)
										       --(1 的話則是無論找到幾個，都回傳整個群組，適用於未知數量目標)
	while true do
--		Say( BOX , "begin" )
		local Hour = GetSystime(1) --取得現在時間：時
		local Min = GetSystime(2) --取得現在時間：分

		if Hour == 12 or Hour== 15 or Hour == 18 or Hour == 21 then
--		if Hour == 9 or Hour== 10 or Hour == 11 or Hour == 12 or Hour == 13 or Hour == 14 or Hour == 15 or Hour == 16 or Hour == 17 or Hour == 18 or Hour == 19 then
			if Min == 20 then
--			if Min == 1 or Min == 7 or Min == 13 or Min == 19 or Min == 25 or Min == 31 or Min == 37 or Min == 43 or Min == 49 or Min == 55 then
				if ZoneID < 1000 then --(分流1：21、分流2：2102、分流3：2102，若ZoneID大於1000則為分流)
					RunningMsgEx( BOX , 2 , 3 , "[SC_THANKS_2011_1]" ) --祈願節活動『盡情閃躲吧～』即將在10分鐘後開始，有興趣者請立即前往雷奇夫王國前的多倫大橋哨塔，向范倫鐵恩報名參加
				end
				BeginPlot( BOX , "Lua_ying_juice_magic" , 0 ) --建立魔法陣
				WriteRoleValue( NPC , EM_RoleValue_PID , 1 ) --報名pid=1
--				PID = ReadRoleValue ( NPC , EM_RoleValue_PID )
--				Say( BOX , "PID = "..PID )
			elseif Min == 29 then
--			elseif Min == 2 or Min == 8 or Min == 14 or Min == 20 or Min == 26 or Min == 32 or Min == 38 or Min == 44 or Min == 50 or Min == 56 then
				ScriptMessage( BOX , 0 , 1 , "[SC_THANKS_2011_22]" , C_SYSTEM ) --報名時間剩下1分鐘，請把握時間！
				ScriptMessage( BOX , 0 , 0 , "[SC_THANKS_2011_22]" , C_SYSTEM ) --報名時間剩下1分鐘，請把握時間！
				ScriptMessage( NPC , 0 , 1 , "[SC_THANKS_2011_22]" , C_SYSTEM ) --報名時間剩下1分鐘，請把握時間！
				ScriptMessage( NPC , 0 , 0 , "[SC_THANKS_2011_22]" , C_SYSTEM ) --報名時間剩下1分鐘，請把握時間！
			elseif Min == 30 then
--			elseif Min == 3 or Min == 9 or Min == 15 or Min == 21 or Min == 27 or Min == 33 or Min == 39 or Min == 45 or Min == 51 or Min == 57 then
				BeginPlot( BOX , "Lua_ying_juice_gamebegin" , 0 ) --活動開始
				WriteRoleValue( NPC , EM_RoleValue_PID , 2 ) --活動開始pid=2
--				PID = ReadRoleValue ( NPC , EM_RoleValue_PID )
--				Say( BOX , "PID = "..PID )
			end
		end
		Sleep(600) --1分鐘跑一次迴圈
	end
end
----------活動開始-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_gamebegin()

	local BOX = OwnerID()
	local Player = SearchRangePlayer( BOX , 115 ) --搜尋BOX周圍115所有玩家進table
	local Host = LuaFunc_SearchNPCbyOrgID( BOX , 113754 , 500 , 0 ) --以隱藏物件119223為中心，向周圍500碼搜尋NPC范倫鐵恩113754
	local CheckPlayer = {}
	local NPC = {}

	for i = 0 , table.getn(Player) , 1 do
		if CheckBuff( Player[i] , 509865 ) == true then --有已報名BUFF 
			CancelBuff( Player[i] , 509865 )
			AddBuff( Player[i] , 620791 , 49 , -1 ) --閃躲點數50層
			table.insert( CheckPlayer , Player[i] ) --加入CheckPlayer的table裡
--			Say( BOX , "CheckPlayer = "..Player[i] )
		end	
	end

	for i=1 , 180 , 1 do --3分鐘

		if #CheckPlayer > 0 then
			CheckPlayer = Lua_ying_juice_inplayer( CheckPlayer ) --將CheckPlayer的table帶入function
			local Player = SearchRangePlayer( BOX , 115 ) --搜尋BOX周圍115所有玩家進table

			for i = 0 , table.getn(Player) , 1 do
				local BuffType = 0
				local Count = BuffCount( Player[i] )

				for j = 0 , Count  , 1 do
					local BuffID = BuffInfo( Player[i] , j , EM_BuffInfoType_BuffID )
					if GameObjInfo_int( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int( BuffID , "AssistType" )
						break
					end
				end

				if BuffType == 68 then --有騎乘坐騎
					DW_CancelTypeBuff( 68,  Player[i] ) --下馬
					ScriptMessage( Player[i] , Player[i] , 1 , "[SC_THANKS_2011_12]" , 0 )  --活動進行中，此處無法騎乘坐騎！
				end
			end		
		end

		if i == 1 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			NPC[1] = Lua_ying_juice_creatnpc( 119568 , 0 )
			if  #CheckPlayer > 0 then
				for i = 1 , #CheckPlayer , 1 do
					ScriptMessage( CheckPlayer[i] , CheckPlayer[i] , 1 , "[SC_THANKS_2011_23]" , C_SYSTEM ) --活動開始！
					ScriptMessage( CheckPlayer[i] , CheckPlayer[i] , 0 , "[SC_THANKS_2011_23]" , C_SYSTEM ) --活動開始！
				end
				Yell( NPC[1], "[SC_THANKS_2011_14]" , 2 ) --活動開始囉！大家盡情地閃躲吧～
				PlayMotion( NPC[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話
			end
			CallPlot( NPC[1] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 3 then
			NPC[2] = Lua_ying_juice_creatnpc( 119571 , 1 )
			if  #CheckPlayer > 0 then
				Yell( NPC[2] , "[SC_THANKS_2011_15]" , 2 ) --小心別被我們手中的核桃派砸到了喔～
				PlayMotion( NPC[2] , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話
			end
			CallPlot( NPC[2] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 60 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			NPC[3] = Lua_ying_juice_creatnpc( 119569 , 2 )
			if  #CheckPlayer > 0 then
				Yell( NPC[3] , "[SC_THANKS_2011_16]" , 2 ) --第二階段要來囉～
				PlayMotion( NPC[3] , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話
			end
			CallPlot( NPC[3] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 63 then
			NPC[4] = Lua_ying_juice_creatnpc( 119572 , 3 )
			if  #CheckPlayer > 0 then
				Yell( NPC[4] , "[SC_THANKS_2011_17]" , 2 ) --大家加油！
				PlayMotion( NPC[4] , 103 ) --加油
			end
			CallPlot( NPC[4] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 120 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			NPC[5] = Lua_ying_juice_creatnpc( 119570 , 4 )
			if  #CheckPlayer > 0 then
				Yell( NPC[5] , "[SC_THANKS_2011_18]" , 2 ) --很開心有人能夠撐到最後一波的核桃派攻擊～
				PlayMotion( NPC[5] , 102 ) --拍手
			end
			CallPlot( NPC[5] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 123 then
			NPC[6] = Lua_ying_juice_creatnpc( 119593 , 5 )
			if  #CheckPlayer > 0 then
				Yell( NPC[6] , "[SC_THANKS_2011_19]" , 2 ) --就這樣持續的閃躲到最後吧～GO！
				PlayMotion( NPC[6] , 115 ) --GO
			end
			CallPlot( NPC[6] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 176 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			for i = 1 , #NPC , 1 do 
				WriteRoleValue( NPC[i] , EM_RoleValue_Register+1 , 0 ) --將NPC的 EM_RoleValue_Register+1寫入0
			end
		elseif i == 180 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			local Site ={ 0 , 1 , 2 , 3 , 4 , 5 }

			if #CheckPlayer > 0 then
				for i = 1 , #CheckPlayer , 1 do
					local BuffLV = FN_CountBuffLevel( CheckPlayer[i] , 620791 ) --判斷玩家身上的閃躲點數有多少 --0為遊戲中的1
				
					CancelBuff( CheckPlayer[i] , 621082 ) --刪除檢查BUFF
					CancelBuff( CheckPlayer[i] , 620791 ) --刪除閃躲點數
					if BuffLV <= 10 then --遊戲中1~10
						GiveBodyItem( CheckPlayer[i] , 206266 , 1 ) --祈願節活動獎券
					elseif BuffLV > 11 and BuffLV <= 19 then --11~20
						GiveBodyItem( CheckPlayer[i] , 206266 , 2 )
					elseif BuffLV > 19 and BuffLV <= 29 then --21~30
						GiveBodyItem( CheckPlayer[i] , 206266 , 3 )
					elseif BuffLV > 29 and BuffLV <= 39 then --31~40
						GiveBodyItem( CheckPlayer[i] , 206266 , 4 )
					else --41以上
						GiveBodyItem( CheckPlayer[i] , 206266 , 5 )
					end
					GiveBodyItem( CheckPlayer[i] , 240374 , 1 ) --奧秘藥水
					ScriptMessage( CheckPlayer[i] , CheckPlayer[i] , 1 , "[SC_THANKS_2011_13]" , C_SYSTEM ) --活動結束
					ScriptMessage( CheckPlayer[i] , CheckPlayer[i] , 0 , "[SC_THANKS_2011_13]" , C_SYSTEM ) --活動結束
				end
			end

			BeginPlot( BOX , "Lua_ying_juice_clearmagic" , 0 ) --刪除魔法陣
			WriteRoleValue( Host , EM_RoleValue_PID , 0 ) --活動結束pid=0
--			PID = ReadRoleValue ( Host , EM_RoleValue_PID )
--			Say( BOX , "PID = "..PID )
			for i = 1 , #NPC , 1 do --刪除場上NPC
				if #CheckPlayer > 0 then
					if i == 1 then
						Yell( NPC[1] , "[SC_THANKS_2011_20]" , 2 ) --這場次的活動就到此結束囉！
					elseif i ==2 then
						Yell( NPC[2] , "[SC_THANKS_2011_21]" , 2 ) --大家再見！
					end
				end
				PlayMotion( NPC[i] , 116 ) --揮手
				DW_MoveToFlag( NPC[i] , 781033 , Site[i] , 0 )
--				Say( NPC[i] , "Site ="..Site[i] )
				DelObj( NPC[i] )
			end
		end
		sleep(10)
	end
end
----------砸核桃派----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_Spell( CheckPlayer )

	local NPC = OwnerID()
	local Motion = { 101 , 105 , 112 } --深受打擊.哭.說話
	local String = { 9 , 10 , 11 } --都沒人嗎，好失望…   怎麼都沒有人呢？.  是不是活動太困難了？

	if #CheckPlayer > 0 then --有人參賽
		while #CheckPlayer > 0  do
			local NewArray = {}
			local Reg = ReadRoleValue( NPC , EM_RoleValue_Register+1 )
--			DebugMsg( 0 , 0 , "Reg ="..Reg )
			if Reg == 1 then
				for i , player in pairs(CheckPlayer) do
					if CheckBuff( player , 620791 ) == true then --有閃躲點數buff
						table.insert( NewArray, Player )
--						Say( NPC , "NewArray = "..Player )
					end
				end

				if #NewArray > 0 then --table.getn(NewArray) > 0
					CheckPlayer = NewArray
				else
					return
				end

				local Sec = math.ceil((5/#NewArray)*10) --出手秒數

				if Sec >= 7 then
					Sleep(Sec) --((5/3)*10)秒後出手 --無條件進位(假設CheckPlayer為3人，則為2秒)
				else
					Sleep(7)
				end

				local Target = NewArray[DW_Rand(#NewArray)] --1. 若DW_Rand(3) = rand1~3  2.此處CheckPlayer table不會與上段function同步變動
				local X = ReadRoleValue( Target , EM_RoleValue_X )+math.random(-40 , 40 )
				local Y = ReadRoleValue( Target , EM_RoleValue_Y )
				local Z = ReadRoleValue( Target , EM_RoleValue_Z )+math.random(-40 , 40 )

				CastSpellPos( NPC , X , Y , Z , 498468 , 0 ) --法術集合.砸派
			else
				return
			end
		end
	else
		local Random = DW_Rand(3) --1~3
		
		Say( NPC , "[SC_THANKS_2011_"..String[Random].."]" )
		PlayMotion( NPC , Motion[Random] )
	end
end
-----------被砸中--------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_beerbox_broken()

--	local NPC = OwnerID()
	local Player =  TargetID()
	local BuffLV = FN_CountBuffLevel( Player , 620791 ) --判斷玩家身上的閃躲點數有多少 --0為遊戲中的1
	local Random = DW_Rand(100) --1~100

	if CheckBuff( Player , 620791 ) ==true then --有閃躲點數buff
		if Random <= 30 then --30%
			if BuffLV <= 1 then -- 遊戲中等級1或2
				CancelBuff( Player , 620791 ) --刪除閃躲點數
			else				
				AddBuff( Player , 621079 , 0 , 3 ) --閃避不及
				CancelBuff( Player , 620791 ) --刪除閃躲點數
				AddBuff( Player , 620791 , BuffLV-2 , -1 ) 
			end
		elseif Random > 30 and Random <= 70 then --40%
			if BuffLV <= 0 then -- 遊戲中等級1
				CancelBuff( Player , 620791 ) --刪除閃躲點數
			else				
				AddBuff( Player , 621070 , 0 , 3 ) --緩慢前進
				CancelBuff( Player , 620791 ) --刪除閃躲點數
				AddBuff( Player , 620791 , BuffLV-1 , -1 ) 
			end
 		else --30%
			if BuffLV <= 0 then -- 遊戲中等級1
				CancelBuff( Player , 620791 ) --刪除閃躲點數
			else				
				AddBuff( Player , 621071 , 0 , 3 ) --飛派暈擊
				CancelBuff( Player , 620791 ) --刪除閃躲點數
				AddBuff( Player , 620791 , BuffLV-1 , -1 ) 
			end
		end
	end
end
----------建立丟派NPC------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_creatnpc( NPCID , Site )

	local OrgID = CreateObjByFlag( NPCID , 781033 , Site , 1 ) --參照指定旗子的位置來產生物件(NPC編號、旗子代號、第幾號旗子、物件數量 )

	SetModeEx( OrgID , EM_SetModeType_Mark , false ) --不顯示標記
	SetModeEx( OrgID , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
	AddToPartition( OrgID , 0 )
	WriteRoleValue( OrgID , EM_RoleValue_Register+1 , 1 ) --將NPC的 EM_RoleValue_Register+1寫入1
	MoveToFlagEnabled( OrgID , false ) --關閉巡邏劇情
	CallPlot( OrgID, "LuaFunc_MoveToFlag", OrgID , 781033 , Site+6 , 0 )
	return OrgID
end
----------有參與玩家------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_inplayer( CheckPlayer )

	local BOX = OwnerID()
	local Newplayer ={}

	for i , player in pairs(CheckPlayer) do
		if CheckBuff( player , 620791 ) then --有閃躲點數buff
			local Dis = GetDistance( BOX , player ) 
			if Dis < 115 then --箱子與玩家距離<115
				AddBuff( player, 621082 , 0 , 3 ) --加檢查_閃躲BUFF
				if Dis > 85 then --箱子與玩家距離 >85
					ScriptMessage( player , player , 1 , "[SC_THANKS_2011_6]" , 0 ) --"你快要超出綠色魔法陣外！"
				end
			end
			table.insert( Newplayer , Player )
		end
	end
	return Newplayer --代回Lua_ying_juice_gamebegin
end
----------檢查_閃躲BUFF --刪除閃躲點數buff-----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_del620791()

	local Player = OwnerID()
	local Random = DW_Rand(3) --1~3
	local Gift = {}
	Gift[1] = 206590
	Gift[2] = 206591
	Gift[3] = 206592	

	CancelBuff( Player , 620791 )
	ScriptMessage( Player , Player , 1 , "[SC_THANKS_2011_7]" , C_SYSTEM ) --活動失敗！
	ScriptMessage( Player , Player , 0 , "[SC_THANKS_2011_7]" , C_SYSTEM ) --活動失敗！
	GiveBodyItem( Player , Gift[Random] , 1 )
	GiveBodyItem( Player , 240373 , 1 ) --神秘藥水
end
----------建立魔法陣---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_magic()

	local Obj = Role:new( OwnerID() ) --在"活動隱形物件"原位置，建立新的NPC
	local BaseX = Obj :X() --隱形物件的X軸
	local BaseY = Obj :Y() --隱形物件的Y軸
	local BaseZ = Obj :Z() --隱形物件的Z軸
	local BaseDir = Obj:Dir() --隱形物件的面向
	local Magic

	Magic = CreateObj( 118358 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --建立"魔法陣"
	SetModeEx( Magic , EM_SetModeType_SearchenemyIgnore , false ) --不被搜尋
	SetModeEx( Magic , EM_SetModeType_Obstruct , false ) --不阻擋
	SetModeEx( Magic , EM_SetModeType_Mark , false ) --不標記
	SetModeEx( Magic , EM_SetModeType_Move , false ) --不移動
	SetModeEx( Magic , EM_SetModeType_HideName , false ) --不顯示名稱
	SetModeEx( Magic , EM_SetModeType_ShowRoleHead , false ) --不顯示頭像框
	AddToPartition( Magic , 0 ) --使建立出來的魔法陣出現
end
-----------刪除魔法陣----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_clearmagic()

	local Magic = LuaFunc_SearchNPCbyOrgID( OwnerID() , 118358 , 50 , 0 ) --以隱藏物件119223為中心，向周圍50碼搜尋魔法陣118358

	DelObj( Magic )
end
-----------NPC范倫鐵恩(113754)對話劇情---------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_113754talk()

	local Player = OwnerID()
	local NPC = TargetID()
	local PID = ReadRoleValue ( NPC , EM_RoleValue_PID )

	AdjustFaceDir( NPC , Player , 0 ) --NPC面向玩家
	if PID == 0 then --活動未開始
		LoadQuestOption( Player )
	elseif PID == 1 then --報名
		LoadQuestOption( Player )
		AddSpeakOption( Player , NPC , "[SC_111576_YU_03]" , "Lua_ying_juice_sign" , 0 ) --"我要報名！"選項
	else --活動開始
		SetSpeakDetail( Player , "[SC_THANKS_2011_3]" ) --歡慶祈願節的「盡情閃躲吧～」活動正熱鬧進行中，有興趣參加嗎？今日還未參與過的朋友，記得在活動開始前10分鐘來找我報名參加喔～
	end
	AddSpeakOption( Player , NPC , "[SC_THANKS_2011_2]" , "Lua_ying_juice_game" , 0 ) --關於「盡情閃躲吧～」選項
	AddSpeakOption( Player , NPC , "[SC_THANKSGIVING_04]" , "Lua_Hao_thanksday_about1", 0 ) ---我想知道祈願節的由來
end
-----------關於「盡情閃躲吧～」----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_game()

	local Player = OwnerID()

	SetSpeakDetail( Player , "[SC_THANKS_2011_8]" ) --為了慶賀祈願節的來臨，必爾汀商會於每天的12點30分、15點30分、18點30分及21點30分四個時段，特別在此舉行了歡慶祈願節的活動。
end
-----------我要報名！------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_sign()

	local Player = OwnerID()
	local BUFF = CheckBuff( Player , 509865 ) --已報名BUFF
	local Key = CheckFlag( Player , 545689 ) --已報名key

	if Key  then
		if BUFF  then 
			SetSpeakDetail( Player , "[SC_THANKS_2011_4]" ) --你已經報名完成了！30分的時候活動就會開始，趕快進入綠色魔法陣內，小心不要錯過時間囉～
		else
			SetSpeakDetail( Player , "[SC_THANKS_2011_5]" ) --你今天已經報名參與過此活動囉，請明天再繼續報名吧。
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_WEAVE_2011_06]" , C_SYSTEM ) --你的報名已經申請完成！
		ScriptMessage( Player , Player , 0 , "[SC_WEAVE_2011_06]" , C_SYSTEM ) --你的報名已經申請完成！
		AddBuff( Player , 509865 , 0 , 900 ) --給予報名BUFF
		SetFlag( Player , 545689 , 1 ) --給予報名key
		CloseSpeak( Player )
	end
end
-----------測試指令---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_test_clear() --手動刪除魔法陣

	local Modelnpc = { 119568 , 119571 , 119569 , 119572 , 119570 , 119593 , 118358 , 103007 , 119648 }

	for i = 1 , table.getn(Modelnpc) , 1 do
		Lua_Hao_NPCofAll_Clear( Modelnpc[i] , 300 )
	end
end

function Lua_ying_test_620791add(BuffLV)

	CancelBuff( OwnerID() , 620791 )
	AddBuff( OwnerID() , 620791 , BuffLV-1 , -1 )
end