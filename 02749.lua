--WriteRoleValue( Thief , EM_RoleValue_Register1 , FlowerNpc ) --讓花賊記住花精靈
--WriteRoleValue( FlowerNpc , EM_RoleValue_Register2 , 1 ) --花精靈開始演出的標記
--step = ReadRoleValue( FlowerNpc , EM_RoleValue_Register1 ) --讓花精靈紀錄現在表演的階段
--key = ReadRoleValue( FlowerNpc , EM_RoleValue_Register3 ) --讓花精靈紀錄是否要開啟各階段表演，0開啟，1關閉
--PlayerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register4 ) --讓花精靈記住現場玩家人數
--FlowerNpc = ReadRoleValue( ObjID , EM_RoleValue_Register5 ) --花精靈記住自己
--FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --紀錄花精靈身上花的數量剩多少
--FlowerNpcAttacked=ReadRoleValue( FlowerNpc , EM_RoleValue_Register7 ) --紀錄花精靈被攻擊次數

function Lua_jiyi_test_Flower_motion() --花精靈的物件產生劇情
	local FlowerNpc = OwnerID() --花精靈
	local RoomID = ReadRoleValue( FlowerNpc , EM_RoleValue_RoomID )
	local GameFlag = { 547321 , 547322 , 547354 } --TEST_已報名旗標、TEST_活動進行中、TEST_已領過獎勵
	local Buff = { 623896 , 623704 , 623922 } --給活動技能 , 仙人掌變身藥水 , 收集祝褔的自願者
	local Reg2 = ReadRoleValue( FlowerNpc , EM_RoleValue_Register2 ) --標記花精靈是否要表演
	local time = 6
	local NPC = ReadRoleValue( FlowerNpc , EM_RoleValue_Register8 ) --花精靈記住的賈斯特
	local HideBox = LuaFunc_SearchNPCbyOrgID( NPC , 121720 , 300 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	if z2FlowerNpc121654 == nil then
		z2FlowerNpc121654 = {} --設全域變數TABLE
	end
	z2FlowerNpc121654[RoomID] = {} --清空區域內全域變數
	NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_02]") --呵呵，我要準備分享花神的祝福給大家
	SetModeEx( FlowerNpc , EM_SetModeType_Move , false )--移動
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register2 , 0 ) --寫入花精靈正在表演值
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register6 , 999 ) --寫入花的數量共999朵
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register5 , FlowerNpc ) --讓花精靈記住自己	
	Sleep(30)

	local AllPlayer = SearchRangePlayer( FlowerNpc , 150 ) --搜尋花精靈範圍150內的玩家
	for i = 0 , #AllPlayer do --檢查範圍內所有的玩家
--		Say( FlowerNpc , "player-"..i )
		if CheckFlag( AllPlayer[i] , GameFlag[3] ) == false then --當玩家沒有已領過獎勵旗標
			if CheckFlag( AllPlayer[i] , GameFlag[1] ) == true then --當玩家有已報名旗標
				if CheckBuff( AllPlayer[i] , Buff[3] ) == true then--當玩家有報名BUFF
					if CheckBuff( AllPlayer[i] , Buff[2] ) == false then
						DW_CancelMount( AllPlayer[i] ) --進入遊戲不可騎乘
						SetFlag( AllPlayer[i] , GameFlag[2] , 1 ) --打開TEST_活動進行中旗標
						CancelBuff( AllPlayer[i] , Buff[3] ) --刪除已經報名BUFF
						AddBuff( AllPlayer[i] , Buff[1] , 0 , -1 ) --給予活動用技能
						AddBuff( AllPlayer[i] , Buff[2] , 0 , -1 ) --給予仙人掌變身藥水
						CallPlot( AllPlayer[i] , "Lua_jiyi_test_Flower_motion3" , AllPlayer[i] , FlowerNpc ) --同時執行檢查玩家和花精靈之間的範圍中控器	
						table.insert( z2FlowerNpc121654 , AllPlayer[i] ) -- 將活動中的玩家放入#z2FlowerNpc121654中
					--	table.remove( AllPlayer , 1 ) -- 將活動中的玩家從#AllPlayer中移除
					end
				end	
			end
		end
	end
	Sleep(30)

	if Reg2 == 0 then 
		local HideBox = SearchRangeNPC( NPC , 400 )
		local OrgID = 121720	--隱藏物件
		for i = 0 , table.getn(HideBox) do
			if ReadRoleValue( HideBox[i] , EM_RoleValue_OrgID ) == OrgID then
				DelObj( HideBox[i] ) --刪除隱藏物件 
			end
		end
		SAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_03]" ) --有了護花使者，我可以放心的發放[121715]了
		SetModeEx( FlowerNpc , EM_SetModeType_Move , true )--移動
		WriteRoleValue( FlowerNpc , EM_RoleValue_IsWalk , 1 ) 
		CallPlot( FlowerNpc , "Lua_jiyi_test_Flower_motion2" , FlowerNpc , Reg2 )--接花精靈的表演劇情
	end
end
--====================================================================
--			花精靈的表演劇情
--====================================================================
function Lua_jiyi_test_Flower_motion2( FlowerNpc , Reg2 ) --花精靈表演劇情
	WriteRoleValue( FlowerNpc , EM_RoleValue_IsWalk , 1 ) 
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register2 , 1 ) --花精靈開始演出的標記
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 0 ) --讓花精靈紀錄現在表演的階段
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) --讓花精靈紀錄是否要開啟各階段表演，0開啟，1關閉
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register7 , 10 ) --寫入花精靈可以被攻擊10次
	local RoomID = ReadRoleValue( FlowerNpc , EM_RoleValue_RoomID ) --讀取分流ID
	while true do
		local FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --紀錄花精靈身上花的數量剩多少
		local FlowerNpcAttacked=ReadRoleValue( FlowerNpc , EM_RoleValue_Register7 ) --紀錄花精靈被攻擊次數
		local step = ReadRoleValue( FlowerNpc , EM_RoleValue_Register1 ) --階段
		local key = ReadRoleValue( FlowerNpc , EM_RoleValue_Register3 ) --是否開啟各階段表演
		local Thief = 121711
		Lua_jiyi_Flower_PlayerCount_2() --檢查當下的玩家數量
		local PlayerCount = ReadRoleValue( FlowerNpc , EM_RoleValue_Register4 )
	--	DebugMsg( 0 , 0 , "PlayerCount 2 ="..PlayerCount )

		if PlayerCount == 0 then
			break
		elseif FlowerNpcAttacked <= 0 then --當被攻擊10次時
			NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_04]") --這些可惡的[121711]，看我用花風暴趕走你們
			SysCastSpellLv( FlowerNpc ,FlowerNpc , 850539 , 0 )  --花精靈對自己施放粉沙暴技能擊退花賊
			Sleep(20)
--			NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_05]")--討厭[121711]，我不發[121715]了
			Sleep(30)
			break					
		elseif step == 0 then --第一段表演
			if key == 0 then --開啟表演
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 1 ) --關閉階段表演
				DW_MoveToFlag( FlowerNpc , 781188 , 1 , 0 , 1) --依據顯像旗子編碼走到定點
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_06]" )--[121711]怎麼出現了，快幫我趕走他們
				PlayMotion( FlowerNpc , 260 ) --走到定點編碼後執行灑花動作
				CallPlot( FlowerNpc , "Lua_jiyi_CreateFlower_ByPlayerCount" , FlowerNpc , PlayerCount ) --執行產生祝福之花的劇情
		--		Say( FlowerNpc , "FlowerNum="..FlowerNum )
				CallPlot( FlowerNpc , "Lua_jiyi_Round_Npc" , FlowerNpc , Thief , 3 , 50 )-- 產生花賊劇情(參考物件、建立物件的ID、建立物件的數量、圓的半徑)
				Sleep(10)
				CallPlot( FlowerNpc , "Lua_jiyi_Flower_Check_FlowerThief" , FlowerNpc , step , key )--檢查採花賊數量
			end
		elseif step == 1 then --第二段表演
			if key == 0 then
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 1 ) --關閉階段表演
				DW_MoveToFlag( FlowerNpc , 781188 , 2 , 0 , 1) --依據顯像旗子編碼走到定點
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_07]" ) --[121711]又出現了，好可怕，快趕走他們
				PlayMotion( FlowerNpc , 260 ) --走到定點編碼後執行灑花動作
				CallPlot( FlowerNpc , "Lua_jiyi_CreateFlower_ByPlayerCount" , FlowerNpc , PlayerCount ) --執行產生祝福之花的劇情
		--		Say( FlowerNpc , "FlowerNum2="..FlowerNum )
				CallPlot( FlowerNpc , "Lua_jiyi_Round_Npc" , FlowerNpc , Thief , 3 , 50 )-- 產生花賊劇情(參考物件、建立物件的ID、建立物件的數量、圓的半徑)
				Sleep(10)
				CallPlot( FlowerNpc , "Lua_jiyi_Flower_Check_FlowerThief" , FlowerNpc , step , key )--檢查採花賊數量
			end
		elseif step == 2 then --第三段表演
			if key == 0 then
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 1 ) --關閉階段表演
				DW_MoveToFlag( FlowerNpc , 781188 , 3 , 0 , 1) --依據顯像旗子編碼走到定點
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_07]" ) --[121711]又出現了，好可怕，快趕走他們
				PlayMotion( FlowerNpc , 260 ) --走到定點編碼後執行灑花動作
				CallPlot( FlowerNpc , "Lua_jiyi_CreateFlower_ByPlayerCount" , FlowerNpc , PlayerCount ) --執行產生祝福之花的劇情
		--		Say( FlowerNpc , "FlowerNum3="..FlowerNum )
				CallPlot( FlowerNpc , "Lua_jiyi_Round_Npc" , FlowerNpc , Thief , 3 , 50 )-- 產生花賊劇情(參考物件、建立物件的ID、建立物件的數量、圓的半徑)
				Sleep(10)
				CallPlot( FlowerNpc , "Lua_jiyi_Flower_Check_FlowerThief" , FlowerNpc , step , key )--檢查採花賊數量
			end
		else
			break		
		end
	Sleep(10)
	end
	Say( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_08]" ) --呵呵，看來我該離開了
	local FlowerTable = SearchRangeNPC( FlowerNpc , 100 )
	local Flowers = 121715
	for j = 0 , #FlowerTable do
		if ReadRoleValue( FlowerTable[j] , EM_RoleValue_OrgID ) == Flowers then
			DelObj( FlowerTable[j] ) --刪除祝福之花
		end
	end				
	z2FlowerNpc121654 = {} --清除全域變數TABLE
	z2FlowerNpc121654[RoomID] = {} --清空區域內全域變數
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register2 , 0 ) --標記花精靈表演結束	
	DelObj( FlowerNpc ) --花精靈刪除自己
end
--================================================================================
--					花精靈產生多少祝福之花
--================================================================================
function Lua_jiyi_CreateFlower_ByPlayerCount( FlowerNpc , PlayerCount ) --花精靈依據現場玩家人數決定撒多少花
	local FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --紀錄花精靈身上花的數量剩多少
	Sleep(10)
	if PlayerCount <= 5 then --玩家數量少於5
		Lua_CreateObjToRandownPos( FlowerNpc , 121715 , 5 , 50 , true ) --在周圍50的範圍內隨機產生祝福之花
		AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -5 )
	elseif PlayerCount > 5 and PlayerCount <= 10 then --玩家數量大於5少於10
		Lua_CreateObjToRandownPos( FlowerNpc , 121715 , 10 , 50 , true ) --在周圍50的範圍內隨機產生祝福之花
		AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -10 )
	else
		Lua_CreateObjToRandownPos( FlowerNpc , 121715 , 15 , 50 , true ) --在周圍50的範圍內隨機產生祝福之花
		AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -15 )		
	end
end				 	
--==================================================================================
--					花精靈檢查玩家數量
--==================================================================================
function Lua_jiyi_Flower_PlayerCount_2()
	local FlowerNpc = OwnerID()
	local count = 0
	local AllPlayer = SearchRangePlayer( FlowerNpc , 100 ) --搜尋花精靈範圍100內的玩家
	for i = 0 , #AllPlayer  do --檢查範圍內所有的玩家
		if CheckBuff( AllPlayer[i] , 623704 ) == true then --當玩家有變身狀態
			count = count + 1		
		end
	end
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register4 , count )
	local PlayerCount = ReadRoleValue( FlowerNpc , EM_RoleValue_Register4 )
--	Say( FlowerNpc , "PlayerCount="..PlayerCount )		
end
--===============================================================
--				掛在玩家身上檢查玩家是否還在活動中的迴圈
--===============================================================
function Lua_jiyi_test_Flower_motion3( player , FlowerNpc )	--掛在玩家身上檢查玩家狀態的活動中控
	while true do
		local Buff = { 623704 , 623896 } --護花使者狀態 , 給活動技能		
		local dis = GetDistance( FlowerNpc , player ) --檢查player和花精靈之間的距離
		if CheckBuff( player , Buff[1] ) == false or CheckBuff( player , Buff[2] ) == false then --玩家沒有變身狀態buff或活動技能就失去資格
			break
		elseif CheckID( FlowerNpc ) == false then
			break		
		elseif dis >= 150 then --當距離超過150就失去資格
			ScriptMessage( FlowerNpc , player , 1 , "[SC_2013FLOWERS_NPC_121654_10]" , C_SYSTEM )--警告訊息
			break	
		elseif dis >= 100 and dis < 150 then --當距離100~150時
			ScriptMessage( FlowerNpc , player , 1 , "[SC_2013FLOWERS_NPC_121654_09]" , C_SYSTEM )--距離太遠了，快回[121654]身邊保護她吧		
		end
	Sleep(10)	
	end
	Sleep(10)
	--跳出迴圈就刪除活動技能
	CancelBuff( player , 623896 ) --刪除活動技能
	CancelBuff( player , 623704 ) --刪除變身
	CancelBuff( Player , 623921 ) --刪除額外技能
	for k = 1 , table.getn(z2FlowerNpc121654) do
		if z2FlowerNpc121654[k] == Player then
			table.remove( z2FlowerNpc121654 , k ) -- 將活動中的玩家從#z2FlowerNpc121654中移除
		end	
	end
--	DebugMsg( 0 , 0 , "z2FlowerNpc121654="..table.getn(z2FlowerNpc121654) )
	ScriptMessage( player , player , 2 , "[SC_2013FLOWERS_NPC_121654_13]" , C_SYSTEM )--活動結束，請把花之祝福交給[121383]	
end
--==================================================================
--				花精靈檢查採花賊數量劇情		
--==================================================================
function Lua_jiyi_Flower_Check_FlowerThief( FlowerNpc , step , key ) --檢查採花賊數量
	while true do 
		local SearchThief = SearchRangeNPC( FlowerNpc , 100 )
		local Fairy = 121711
		local ThiefNpc = {}
 	
		for i = table.getn( SearchThief ) , 0 , -1 do
			if ReadRoleValue( SearchThief[i] , EM_RoleValue_OrgID ) == Fairy then
				table.insert( ThiefNpc , SearchThief[i] ) --是花賊就放入#ThiefNpc中
				table.remove( SearchThief , i ) --從#SearchThief中移除花賊
			end
		end
		local Num = table.getn( ThiefNpc )
	--	DebugMsg( 0 , 0 , "Num ="..Num )						
		if Num == 0 then		
			if step == 0 then
				Sleep(10)
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_11]" ) --沒有[121711]真好，我要往下一站前進了
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 1 ) --讓花精靈改寫現在表演階段=1
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) --讓花精靈紀錄開啟下階段表演
				break
			elseif step == 1 then
				Sleep(10)
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_11]" ) --沒有[121711]真好，我要往下一站前進了
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 2 ) --讓花精靈改寫現在表演階段=2
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) ---讓花精靈紀錄開啟下階段表演
				break
			elseif step == 2 then
				Sleep(10)
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_11]" ) --沒有[121711]真好，我要往下一站前進了
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 3 ) --讓花精靈改寫現在表演階段=3
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) ---讓花精靈紀錄開啟下階段表演
				break
			elseif step == 3 then
				Sleep(10)
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_12]" ) --[121715]發送完了，我要回去和花神補充一些才行
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 4 ) --讓花精靈改寫現在表演階段=4
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) ---讓花精靈紀錄開啟下階段表演
				break
			end
		end
	Sleep(10)
	end				
end	
--========================================================
--				採花賊產生劇情
--========================================================
function Lua_jiyi_Round_Npc( ObjID , CreateID , CreateCount , Distance ) --產生採花賊劇情，改編至"Lua_Hao_Round_wall"
-- 參考物件、建立物件的ID、建立物件的數量、圓的半徑
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local BaseX = ReadRoleValue( ObjID , EM_RoleValue_X )
	local BaseY = ReadRoleValue( ObjID , EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( ObjID , EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	local FlowerNpc = ReadRoleValue( ObjID , EM_RoleValue_Register5 ) --花精靈記住自己	
	local CreateID = CreateID -- 建立物件的ID
	local Polygon = CreateCount -- 建立物件的數量
	local dis = Distance -- 距離圓心的距離
	local Count = 1
	local NewCoount = {}

	for i = 1 , Polygon , 1 do
		NewCoount[i] = CreateObj( CreateID , BaseX-dis*math.cos(math.pi*2*(i/Polygon)) , BaseY , BaseZ+dis*math.sin(math.pi*2*(i/Polygon)) , BaseDir , 1 )
		SetModeEx( NewCoount[i] , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( NewCoount[i] , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( NewCoount[i] , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( NewCoount[i] , EM_SetModeType_Mark , true )--標記
		SetModeEx( NewCoount[i] , EM_SetModeType_Move , true )--移動
		SetModeEx( NewCoount[i] , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( NewCoount[i] , EM_SetModeType_HideName , true )--名稱
		SetModeEx( NewCoount[i] , EM_SetModeType_ShowRoleHead , true )--頭像框
		SetModeEx( NewCoount[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( NewCoount[i] , EM_SetModeType_Drag , false )--阻力
		SetModeEx( NewCoount[i] , EM_SetModeType_Show , true )--顯示
		AdjustFaceDir( NewCoount[i] , ObjID , 0 ) 	-- 讓建立物件面向參考物件
		AddToPartition( NewCoount[i] , RoomID )
		WriteRoleValue( NewCoount[i] , EM_RoleValue_IsWalk , 0 ) 
		WriteRoleValue( NewCoount[i] , EM_RoleValue_Register1 , FlowerNpc ) --讓花賊記住花精靈
		local step = ReadRoleValue( FlowerNpc , EM_RoleValue_Register1 ) --活動階段
		local key = ReadRoleValue( FlowerNpc , EM_RoleValue_Register3 ) --是否開啟各階段表演
		local Attack = ReadRoleValue( NewCoount[i] , EM_RoleValue_Register2 ) --用來記錄花賊被攻擊的次數
		if step == 0 then
			WriteRoleValue( NewCoount[i] , EM_RoleValue_Register2 , 2 ) --寫入花賊可以被攻擊次數3次
		elseif step == 1 then
			WriteRoleValue( NewCoount[i] , EM_RoleValue_Register2 , 4 ) --寫入花賊可以被攻擊次數5次
		elseif step == 2 then
			WriteRoleValue( NewCoount[i] , EM_RoleValue_Register2 , 9 ) --寫入花賊可以被攻擊次數10次
		end
		CallPlot( NewCoount[i] , "Lua_jiyi_Flower_Test_FlowerThief" , NewCoount[i] )
	end
end

function Lua_jiyi_Flower_Test_FlowerThief( Thief ) --採花賊的產生劇情
	local FlowerNpc = ReadRoleValue( Thief , EM_RoleValue_Register1 ) --讓花賊記住花精靈
	local Attack = ReadRoleValue( Thief , EM_RoleValue_Register2 ) --用來記錄花賊被攻擊的次數
	local Distan = GetDistance( Thief , FlowerNpc ) --檢查採花賊和花精靈之間的距離
	local X = ReadRoleValue( Thief , EM_RoleValue_X )
	local Y = ReadRoleValue( Thief , EM_RoleValue_Y )
	local Z = ReadRoleValue( Thief , EM_RoleValue_Z )
	local D = ReadRoleValue( Thief , EM_RoleValue_Dir )
	local timer = 0
	while true do
		timer = timer +1
		if Distan < 300 then
			if CheckID( FlowerNpc ) == true then
				if timer%(6+Rand(2)) == 0 then   -- 每5秒跑一次
					CastSpell( Thief , FlowerNpc , 850538 ) --讓花賊對花精靈施放調戲技能
				else
					local Range = 20 +  rand(5) --亂數移動範圍
					sleep(10) 
					MoveDirect( Thief , X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )
				end
			end
	
			if Attack == 0 or CheckID( FlowerNpc ) == false then
				DelObj( Thief ) --刪除花賊
			end
		end
	Sleep(10)
	end
end  	