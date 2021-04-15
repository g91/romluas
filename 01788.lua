function Lua_Hao_Taiwan_Frog_Clock() -- 時間宣告

	Hao_Frog_Hour = 0	-- 時
	Hao_Frog_Min = 0	-- 分
	local Step = 0
	local Hour = GetSystime(1)
	local Min = GetSystime(2)
	local BronID = 100292 --產生怪物ID
	local Flag = 780321 --青蛙王子旗子編號
	local Monster = 0

	while true do -- 時間處理
		Hour = GetSystime(1)
		Min = GetSystime(2)

		if Hao_Frog_Hour ~= nil and Hao_Frog_Min ~= nil then

			if Hao_Frog_Hour == 0 and Hao_Frog_Min == 0 then
				--
			else
				Hour = GetSystime(1) + Hao_Frog_Hour
				Min = GetSystime(2) + Hao_Frog_Min

				if Hour >23 then
					Hour = Hour - 24
				end

				if Min > 59 then
					Min = Min - 60
				end
			end
		end
		--Say(OwnerID(), "hour = "..hour.."min = "..min )
		--Say(OwnerID(), Step )
		if Step ~= Hour then
		--	if CheckID(Monster) == true then
		--		DelObj(Monster)
		--	end
			local X = rand(10) -- 0 ~ 9
		--	Say(OwnerID() , "X="..X )
		--	Say(OwnerID() , "Step="..Step )
			if X >= 5 then -- 5 ~ 9
				Monster = CreateObjByFlag( BronID, Flag , rand((GetMoveFlagCount(Flag)-1)) , 1 )
				--( ObjID 模板代號 , FlagObjID 參照的旗子代號 , FlagID 參照的旗子編碼 , count 物件的數量 )
				-- GetMoveFlagCount(xxxxx) 取得 FlagGroup 旗子群組編號
				SetModeEx( Monster , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( Monster , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Monster , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Monster , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( Monster , EM_SetModeType_Gravity, false )--重力
				SetModeEx( Monster , EM_SetModeType_Move, false )--移動
				SetModeEx( Monster , EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( Monster , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Monster , EM_SetModeType_Show , false ) --不顯示
				SetModeEx( Monster , EM_SetModeType_Mark, false )--標記
				AddToPartition( Monster , 0 )
				BeginPlot( Monster , "Lua_Hao_Taiwan_Frog_Act", 0 )
			end
			Step = Hour
		--	Say(OwnerID() , "Hour="..Step )
		end
		sleep(100)
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_CheckTime() -- 查詢目前前進了多久的時間
	Say(OwnerID() , Hao_Frog_Hour )
	Say(OwnerID() , Hao_Frog_Min )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_Gobackto0() -- 將前進的時間 小時與分 歸零
	Hao_Frog_Hour = 0
	Hao_Frog_Min = 0
end
-------------------------------------------------------------------------------------------------------------------
--? pcall Lua_Hao_Taiwan_Frog_SetHour(hour) 「 ( ) 」 內的hour 代表你想要前進的小時數量  範圍只能是0~23 亂設的人後果自負...
function Lua_Hao_Taiwan_Frog_SetHour(hour)

	if hour >= 48 then

	else
		if hour >= 24 then
			Hao_Frog_Hour = hour - 24
		else
			Hao_Frog_Hour = hour
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
--? pcall Lua_Hao_Taiwan_Frog_SetMin(min) 「 ( ) 」 內的min 代表你想要前進的分鐘數量  範圍只能是0~59 亂設的人後果自負...
function Lua_Hao_Taiwan_Frog_SetMin(min)

	if min >= 120 then

	else
		if min >= 60 then
			Hao_Frog_Min = min - 60
		else
			Hao_Frog_Min = min
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_Act() -- 掛在隱型物件上的起始劇情

	--	Say( OwnerID() , "1" )	-- 無
	--	Say( TargetID() , "2" )	-- 青蛙計時物件

	BeginPlot( OwnerID() , "Lua_Hao_Taiwan_Frog_End" , 0 ) -- 掛在隱形物件上的結束劇情

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流

--	if ZoneID <= 999 then
		if Zone == 1 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_06]" ) -- 嚎叫山麓的某處出現了一群搗蛋的青蛙
		elseif Zone == 2 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_07]" ) -- 銀湧之野的某處出現了一群搗蛋的青蛙
		elseif Zone == 6 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_08]" ) -- 塵荒峽谷的某處出現了一群搗蛋的青蛙
		elseif Zone == 8 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_09]" ) -- 原生之地的某處出現了一群搗蛋的青蛙
		elseif Zone == 49 then
			RunningMsg( OwnerID() , 1 , "Test Msg : Zone49 Frog Begin ... KERO KERO KERO" ) -- 一群搗蛋的青蛙出現在49區，KERO星人來拉！
		end
--	end

	local Frogfreak  = {}

	if FrogDeadCount == nil then
		FrogDeadCount = {}
	end
	
	FrogDeadCount[Zone] = 0
--	Frogfreak = Lua_Davis_BornByMultilateral( 103960 , 10 , 50 )	-- 物件、邊型數量、半徑

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 103960 -- 青蛙
	local X = 10 -- 幾邊型
	local dis = 50 -- 距離圓心的距離

	for i = 1 , X do
		MonsterGroup[i] =CreateObj( MonsterID , BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
	end
	for i = 1, table.getn(MonsterGroup) do
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--可重生
		AddToPartition( MonsterGroup[i] , RoomID )
		SetAttack( MonsterGroup[i] , TargetID() )
		SetRandMove( MonsterGroup[i] , 50 , 20 , 25 ) -- ID、距離、亂數移動間隔的時間 10為1秒、最大移動距離
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_End() -- 掛在隱型物件上的結束劇情

	Sleep(18000) -- 活動持續30分鐘

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流
	local Count = SetSearchAllNPC(RoomID) -- 搜索區域內的所有NPC ，回傳值為其數量
	local Obj

	if Zone == 1 or Zone == 2 or Zone == 6 or Zone == 8 or Zone == 49 then -- 砍掉全分流的青蛙
		for i = 1 , Count , 1 do
			local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
			Obj = Role:New( ID ) -- 等同於 ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = 資料庫內的ID
			if Obj:IsNPC() == true then --IsNPC = 是不是npc
				local MustDel = ReadRoleValue( ID , EM_RoleValue_OrgID )
				if MustDel == 103960 or MustDel == 103961 then
					DelObj( ID )
				--	DelObj( OwnerID() )
				end 
			end
		end 
	end

--	if ZoneID <= 999 then -- 對各Zone的第一分流廣播
		if Zone == 1 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_10]" ) -- 位於嚎叫山麓某處的青蛙們至別處搗蛋了
		elseif Zone == 2 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_11]" ) -- 位於銀湧之野某處的青蛙們至別處搗蛋了
		elseif Zone == 6 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_12]" ) -- 位於塵荒峽谷某處的青蛙們至別處搗蛋了
		elseif Zone == 8 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_13]" ) -- 位於原生之地某處的青蛙們至別處搗蛋了
		elseif Zone == 49 then
			RunningMsg( OwnerID() , 1 , "Test Msg : Zone49 Frog End...KERO KERO KERO" ) -- 49區的KERO星人們偷偷閃拉！KERO、KERO。
		end

	Beginplot( OwnerID() , "Lua_Hao_Taiwan_Frog_End_02" , 0 )

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_End_02() -- 掛在隱型物件上的結束劇情

	DelObj( OwnerID() )

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_CheckCount()	-- 怪物的招喚劇情

	-- Zone 1	嚎叫山麓
	-- Zone 2	銀湧之野
	-- Zone 6	塵荒峽谷
	-- Zone 8	原生之地

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流
	local Count = SetSearchAllNPC(RoomID) -- 搜索區域內的所有NPC ，回傳值為其數量
	local Obj
	local Amount = 0 -- 103960 的數量
	local Monster

	if Zone == 1 or Zone == 2 or Zone == 6 or Zone == 8 or Zone == 49 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
			Obj = Role:New( ID ) -- 等同於 ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = 資料庫內的ID
			if Obj:IsNPC() == true then --IsNPC = 是不是npc
				if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 103960 then
					Amount = Amount + 1
				--	Say( ID , Amount ) -- 說出青蛙總數量
				end 
			end
		end 
		local A = Amount
		if A <= 25 then	-- 如果103960怪物總數量小於25，則亂數重生1~3隻。
			local Obj = Role:new( OwnerID() ) 
			local BaseX = Obj : X()
			local BaseY = Obj : Y()
			local BaseZ = Obj : Z()
			local BaseDir = Obj : Dir()
			local BaseRoom = Obj : RoomID()
			local NewObjGUID = nil
			local Random = Rand(2)+1

			for i = 1 , Random , 1 do
				NewObjGUID = CreateObj( 103960 , BaseX , BaseY , BaseZ , BaseDir , 1 )		
				SetModeEx( NewObjGUID , EM_SetModeType_Revive , false )--不可重生
				AddToPartition( NewObjGUID , RoomID )
				SetAttack( NewObjGUID , TargetID() )
		--		SetPlot( NewObjGUID , "dead" , "Lua_Hao_Taiwan_Frog_Act_01" , 0 )
		--		Say( NewObjGUID , Random )
			end

		--	Monster = Createobjbyobj( 103960 , OwnerID() , Random )
		--	SetPlot( Monster , "dead" , "Lua_Hao_Taiwan_Frog_Act_01" , 0 )
		--	Say( Monster , Random)
		else
		--	Say( TargetID() , "too much" )
			return false
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_MCount()	-- 怪物的死亡劇情

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流

	if FrogDeadCount == nil then
		FrogDeadCount = {}
	end

	FrogDeadCount[Zone] = FrogDeadCount[Zone] + 1

	local Count = FrogDeadCount[Zone]

	if Count >= 10 then
			Boss = Createobjbyobj( 103961 , OwnerID() , 1  )
			AddToPartition( Boss , RoomID )
			SetAttack( Boss , TargetID() )
			FrogDeadCount[Zone] = 0	-- 將死亡次數清空
		--	Say( TargetID() , Count )	-- 玩家說出死亡次數

	elseif Count < 10 then
		--	Say( TargetID() , Count )	-- 玩家說出死亡次數
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_SayCount() -- 說出場面上死亡的怪物數量 - 每超過10次歸零

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流

	local Count = FrogDeadCount[Zone]

	Say( OwnerID() , Count )

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_TCount()	-- 測試場上的怪物數量

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流

	if FrogDeadCount == nil then
		FrogDeadCount = {}
	end
	FrogDeadCount[Zone] = FrogDeadCount[Zone] + 1
	local Count = FrogDeadCount[Zone]
	Say( TargetID() , Count )	-- 玩家說出死亡次數
end
-------------------------------------------------------------------------------------------------------------------
function LuaI_207258()	--黃金王冠的劇情
	ClearBorder( OwnerID())	--初始化石碑介面
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	AddBorderPage( OwnerID(), GetQuestDetail( 423080 , 1  ) )
	ShowBorder( OwnerID() , 423080 ,str ,"ScriptBorder_Texture_Paper" )

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GiveNameTITLE()	-- 給予稱號

	local Title01 = 530493		-- 掃除青蛙好夥伴 ( 完成任務2次
	local Title02 = 530494		-- 青蛙王子又怎樣 ( 完成任務4次
	local Title03 = 530495		-- 擊敗邪惡青蛙帝國 ( 完成任務6次

	local Day = ReadRoleValue( TargetID() ,  EM_LuaValueFlag_UseItem8 )

	PlayMotion( OwnerID() , 251 )	-- 行禮
	AdjustFaceDir( OwnerID() , TargetID() , 0 ) --面向

	if Day == 0 then	-- 第1次
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 1 )
	elseif Day == 1 then	-- 第2次
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 2 )
		GiveBodyItem( TargetID() , Title01 , 1 )  --給稱號  掃除青蛙好夥伴
	elseif Day == 2 then	-- 第3次
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 3 )
	elseif Day == 3 then	-- 第4次
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 4 )  
		GiveBodyItem( TargetID() , Title02 , 1 )  --給稱號  青蛙王子又怎樣
	elseif Day == 4 then	-- 第5次
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 5 )
	elseif Day == 5 then	-- 第6次
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 6 )
		GiveBodyItem( TargetID() , Title03 , 1 )  --給稱號  擊敗邪惡青蛙帝國
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_ResetNameTITLE()	-- 清除稱號&將UseItem8值歸零

	local Title01 = 530493		-- 掃除青蛙好夥伴 ( 完成任務2次
	local Title02 = 530494		-- 青蛙王子又怎樣 ( 完成任務4次
	local Title03 = 530495		-- 擊敗邪惡青蛙帝國 ( 完成任務6次

	DelBodyItem( OwnerID() , Title01 , 1 )  --給稱號  掃除青蛙好夥伴
	DelBodyItem( OwnerID() , Title02 , 1 )  --給稱號  青蛙王子又怎樣
	DelBodyItem( OwnerID() , Title03 , 1 )  --給稱號  擊敗邪惡青蛙帝國
	WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 0 )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_NPC_Begin() -- NPC初始劇情

--	Say( OwnerID() , "1" ) -- 玩家
--	Say( TargetID() , "2" ) -- NPC

	BeginPlot( TargetID() , "Lua_Hao_Taiwan_Frog_NPC_Range" , 0 ) -- 距離超過50即關閉對話視窗
--	PlayMotion( TargetID() , 116 ) -- 再見
--	PlayMotion( TargetID() , 107 ) -- 搖手說不
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
--	SetSpeakDetail( OwnerID() , "[SC_TAIWAN_FROG_00]" ) -- （身著華麗服飾的少女正皺著眉低聲哭泣，她看起來非常的傷心，也許你該詢問她有什麼心事？）
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_TAIWAN_FROG_01]" ,  "Lua_Hao_Taiwan_Frog_NPC_Begin_02",  0 ) -- 請問，妳有什麼心事嗎？
	PlayMotion( TargetID() , 105 ) -- 哭泣
	LoadQuestOption( OwnerID() )  --載入任務模板
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_NPC_Begin_02() -- NPC初始劇情

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 112 ) -- 說話
	SetSpeakDetail( OwnerID() , "[SC_TAIWAN_FROG_02]" ) -- 幾天前的一個美好早晨...
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_TAIWAN_FROG_03]" ,  "Lua_Hao_Taiwan_Frog_NPC_Begin_03",  0 ) -- 別擔心，我一定會幫助妳的。
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_NPC_Begin_03() -- NPC初始劇情

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 106 ) -- 拜託
	CloseSpeak( OwnerID() )
	ScriptMessage( OwnerID() , OwnerID() , 1 ,"[SC_TAIWAN_FROG_04]", C_SYSTEM)  -- 多注意周邊的情報，對你或許有所幫助。
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_NPC_Range() -- 距離超過50即關閉對話視窗

--	say(OwnerID() , "3" ) --NPC
--	say(TargetID() , "4" ) --玩家

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- 面向
			PlayMotion( OwnerID() , 116 ) -- 再見
		--	if CountBodyItem( TargetID() , 207258 ) >= 1 then
		--		tell( TargetID() , OwnerID() ,"[SC_TAIWAN_FROG_05]" ) --　...你身上的王冠，怎麼好像我被青蛙搶走的那頂王冠呢？
		--	end
			break
		end
		sleep(5)
	end
end

-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_Make_BOX() -- 佈置各Zone劇情盒子

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local Monster
	local MonsterID = 114998 -- 隱形劇情物件

	Monster = CreateObj( MonsterID , BaseX , BaseY , BaseZ , BaseDir , 1 )	

	SetModeEx( Monster , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Monster , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( Monster , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
	SetModeEx( Monster , EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( Monster , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Monster , EM_SetModeType_Move , false )--移動
	SetModeEx( Monster , EM_SetModeType_ShowRoleHead , false )--頭像框
	SetModeEx( Monster , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Monster , EM_SetModeType_Show , true ) --不顯示
	SetModeEx( Monster , EM_SetModeType_Mark , false )--標記
	AddToPartition( Monster , RoomID) -- 建立物件

	Beginplot( Monster , "Lua_Hao_Taiwan_Frog_Clock" , 0 )
	
end