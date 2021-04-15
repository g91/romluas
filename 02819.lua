--====================================
--			測試NPC給報名旗標
--====================================
function Lua_jiyi_2013Fire_121743_SignUp()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --NPC
	local FireFlag = { 547369 , 547370 , 547375 , 547385 , 547386 }  --領過獎勵、已報名衝鋒、已參加活動、A路線旗標、B路線旗標
	local GameBuff = { 623869 , 623702 }	--烈焰聖火(計時BUFF) , 聖火的餘溫
	local BuffLv =  FN_CountBuffLevel( Player , 623702 ) --檢查玩家身上聖火的餘溫BUFF
	local RanNum = DW_Rand(10)

	if CheckFlag( Player , FireFlag[1] ) == true then --有當日已領獎旗標時
		SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_01]" )  --我代表城裡的人們感謝你不懼艱辛，為大家點燃聖火的保護網。
	elseif CheckFlag( Player , FireFlag[3] ) == true then --有已參加活動(已報名活動尚未領獎前)旗標時
		if BuffLv >= 0 then --如果有點燃火台了	
			SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_02]" )  --已經點燃聖火台了嗎？
			AddSpeakOption( Player , Npc , "[SC_2013FIRE_PLAYER_121743_01] " , "Lua_jiyi_2013Fire_121743_reward" , 0 )  --是的，我成功點燃聖火台了。
		elseif BuffLv < 0 then --如果一個火台都沒點燃
			if CheckBuff ( Player , GameBuff[1] ) == true then --有聖火的餘苗(計時BUFF) 時		
				SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_04]" )  --請至少點燃一個火台			
			elseif CheckFlag ( Player , FireFlag[2] ) ==  true then --當玩家有已報名衝鋒旗標
				SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_02]" )  --已經點燃聖火台了嗎？
				AddSpeakOption( Player , Npc , "[SC_2013FIRE_PLAYER_121743_02]" , "Lua_jiyi_2013Fire_121743_reward" , 0 )  --我有去嘗試點燃聖火台了。			
			end
		end		
	else			
		SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_05]" )  --聖火台還沒點燃
		AddSpeakOption( Player , Npc , "[SC_2013FIRE_PLAYER_121743_03]" , "Lua_jiyi_2013Fire_121743_SignUp2" , 0 )  --發生甚麼事了嗎？
	end	
end	

function Lua_jiyi_2013Fire_121743_SignUp2()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --NPC
	CloseSpeak( Player )	--關閉對話視窗
	SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_06]" )  --活動說明
	AddSpeakOption( Player , Npc , "[SC_2013FIRE_PLAYER_121743_04]", "Lua_jiyi_2013Fire_121743_SignUp3" , 0 )  --好啊，我試試看。
end	

function Lua_jiyi_2013Fire_121743_SignUp3()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --NPC
	local FireFlag = { 547370 , 547375 , 547385 , 547386 }  --已報名衝鋒、已參加活動、A路線旗標、B路線旗標
	local Buff = { 623869 , 623893 }	--烈焰聖火(計時BUFF)、可點火BUFF
	local RanNum = DW_Rand(10)
	if RanNum == 1 or RanNum == 3 or RanNum == 5 or RanNum == 7 or RanNum == 9 then
		SetFlag( Player , FireFlag[3] , 1 ) --開啟A路線旗標
	else
		SetFlag( Player , FireFlag[4] , 1 ) --開啟B路線旗標
	end		
	DesignLog( Player , 121743 , " 2013Firegame Light A Fire event STAR" )	--記錄參加人次
	SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_07]" )  --趁[623869]還沒消失前，快去操控[107560]，沿路點燃聖火台吧。
	AddBuff( Player , Buff[1] , 0 , 60 )	--烈焰聖火(計時BUFF)
	AddBuff( Player , Buff[2] , 9 , 180 )	--可點火BUFF	
	SetFlag( Player , FireFlag[1] , 1 ) --開啟報名旗標
	SetFlag( Player , FireFlag[2] , 1 ) --開啟已參加活動旗標
end

function Lua_jiyi_2013Fire_Create() --掛在NPC身上產生載具劇情
	local Npc = OwnerID()
	local RoomID = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local Vehicle = {}
	AddBuff( Npc , 503217 , 1 , -1 ) --節慶符號
	Lua_jiyi_2013Fire_CancelVehicle() --先刪除場上所有載具再生成新的載具
	for j = 0 , 2 do
		Vehicle[j] = CreateObjByFlag( 107560 , 781258 , j , 1 ) --產生載具
		WriteRoleValue( Vehicle[j] , EM_RoleValue_PID , j ) --載具寫入自己的PID值
		SetModeEx( Vehicle[j] , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( Vehicle[j] , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( Vehicle[j] , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( Vehicle[j] , EM_SetModeType_Mark , true )--標記
		SetModeEx( Vehicle[j] , EM_SetModeType_Move , true )--移動
		SetModeEx( Vehicle[j] , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( Vehicle[j] , EM_SetModeType_HideName , true )--名稱
		SetModeEx( Vehicle[j] , EM_SetModeType_ShowRoleHead , true )--頭像框
		SetModeEx( Vehicle[j] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Vehicle[j] , EM_SetModeType_Drag , false )--阻力
		SetModeEx( Vehicle[j] , EM_SetModeType_Show , true )--顯示
		AddToPartition( Vehicle[j] , RoomID )
	end
end

function Lua_jiyi_2013Fire_BuffHide() --掛在玩家身上的法術時間到觸發劇情
	local Player = OwnerID() --玩家
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Vehicle = ReadRoleValue( Player , EM_RoleValue_PID )
	local VehiclePID = ReadRoleValue( Vehicle , EM_RoleValue_PID )
	local NewCar = CreateObjByFlag( 107560 , 781258 , VehiclePID , 1 ) --產生載具
	WriteRoleValue( NewCar , EM_RoleValue_PID , VehiclePID ) --載具寫入自己的PID值
	SetModeEx( NewCar , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( NewCar , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
	SetModeEx( NewCar , EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( NewCar , EM_SetModeType_Mark , true )--標記
	SetModeEx( NewCar , EM_SetModeType_Move , true )--移動
	SetModeEx( NewCar , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( NewCar , EM_SetModeType_HideName , true )--名稱
	SetModeEx( NewCar , EM_SetModeType_ShowRoleHead , true )--頭像框
	SetModeEx( NewCar , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NewCar , EM_SetModeType_Drag , false )--阻力
	SetModeEx( NewCar , EM_SetModeType_Show , true )--顯示
	AddToPartition( NewCar , RoomID )
	DelObj(Vehicle)	
end

function Lua_jiyi_2013Fire_BuffHide2() --掛在玩家身上的法術BUFF消失劇情
	local Player = OwnerID() --玩家
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Vehicle = ReadRoleValue( Player , EM_RoleValue_PID )
	local VehiclePID = ReadRoleValue( Vehicle , EM_RoleValue_PID )
	local NewCar = CreateObjByFlag( 107560 , 781258 , VehiclePID , 1 ) --產生載具
	WriteRoleValue( NewCar , EM_RoleValue_PID , VehiclePID ) --載具寫入自己的PID值
	SetModeEx( NewCar , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( NewCar , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
	SetModeEx( NewCar , EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( NewCar , EM_SetModeType_Mark , true )--標記
	SetModeEx( NewCar , EM_SetModeType_Move , true )--移動
	SetModeEx( NewCar , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( NewCar , EM_SetModeType_HideName , true )--名稱
	SetModeEx( NewCar , EM_SetModeType_ShowRoleHead , true )--頭像框
	SetModeEx( NewCar , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NewCar , EM_SetModeType_Drag , false )--阻力
	SetModeEx( NewCar , EM_SetModeType_Show , true )--顯示
	AddToPartition( NewCar , RoomID )
end

function Lua_jiyi_2013Fire_CancelVehicle()  --刪除載具劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 107560 }
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID )
					end
				end
			end
		end
	end
end

function Lua_jiyi_2013Fire_121743_reward() --領獎勵
	local Player = OwnerID() --玩家
	local FireFlag = { 547369 , 547370 , 547375  , 547385 , 547386 }  --領過獎勵、已報名衝鋒、已參加活動、A路線旗標、B路線旗標
	local GameBuff = { 623869 , 623702 }	--烈焰聖火(計時BUFF) , 聖火的餘溫(計分)
	local BuffLv =  FN_CountBuffLevel( Player , 623702 ) --檢查玩家身上聖火的餘溫BUFF
	local Reward = { 208918 , 725654 , 240995 , 240377 } --詠火節獎券、畢爾汀藥水、火焰符文、壁壘魔藥
	CloseSpeak( Player )	--關閉對話視窗
	if BuffLv <= 0 then --BuffLv顯示1
		CancelBuff( Player , GameBuff[2] )
		GiveBodyItem( Player , Reward[2] , 1 ) --給藥水
	elseif BuffLv >= 1 and BuffLv <= 3 then --BuffLv2~4
		CancelBuff( Player , GameBuff[2] )
		GiveBodyItem( Player , Reward[1] , 1 ) --給一張活動獎券
	elseif BuffLv >= 4 and BuffLv <= 5  then --BuffLv5~6
 		CancelBuff( Player , GameBuff[2] )
		GiveBodyItem( Player , Reward[1] , 1 ) --給1張活動獎券
		GiveBodyItem( Player , Reward[4] , 1 ) --給1個壁壘魔藥
	elseif BuffLv >= 6  then 
 		CancelBuff( Player , GameBuff[2] )
		GiveBodyItem( Player , Reward[1] , 2 ) --給2張活動獎券
		GiveBodyItem( Player , Reward[4] , 1 ) --給1個壁壘魔藥	
	end
	Lua_jiyi_2013Fire_testlua()	--刪除活動用的旗標、BUFF
	GiveBodyItem( Player , Reward[3] , 2 ) --給2個火焰符文
	SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_03]" ) --謝謝你的協助，請收下我們為你準備的謝禮。
	SetFlag( Player , FireFlag[1] , 1 )	-- 已經領取過獎勵
	Lua_Festival_01_All(Player)  --全勤獎
	DesignLog( Player , 1217431 , " 2013Firegame Light A Fire event OVER" )	--記錄完成人次
end
--==================================
--		載具劇情
--==================================
function Lua_jiyi_test_vehicle() --上載具檢查劇情
	local own = OwnerID()
	local tar = TargetID() --玩家
	local Flag = { 547375 , 547364 } --已參加活動、上下載具旗標
	local Buff = 623869
	if CheckBuff( tar , Buff ) == true and CheckFlag( tar , Flag[2] ) == false then 
		local secondseat = Lua_Mounts_Copilot( tar )--有無騎乘雙人座騎
		if secondseat == false then --有在後座
			ScriptMessage( tar , tar , 1 , "[SC_2012_TEACATODO_WARNING6]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
			return false
		else
			return true
		end
	else 
		ScriptMessage( tar , tar , 1 , "[SC_2013FIRE_NPC_107560_01]" , 0 )--系統告知"無法使用"
		return false
	end
end

function Lua_jiyi_test_vehicle2() --測試用清除載具檢查用旗標、強制解除玩家與載具的連結同時刪除載具
	local Own = OwnerID() --玩家
	local Flag = 547364 --上下載具旗標
	WriteRoleValue( Own , EM_RoleValue_Register5 , 0 ) --將玩家身上記值歸0
	DetachObj( Own ) --刪除玩家與載具的連結
	SetFlag( Own , Flag , 0 ) --清除上載具旗標
end	

function Lua_jiyi_test_bufftest( seat , UpDown ) --上載具劇情
	local Player = OwnerID() --玩家
	local Vehicle = TargetID() --載具
	local Buff = { 623869  , 623893 }	--烈焰聖火(計時BUFF)、可點火BUFF
	local Flag = { 547364 , 547385 , 547386 , 547390 , 547391 , 547392 , 547393 , 547394 , 547500 , 547501 }  --上下載具旗標、A路線旗標、B路線旗標、火台1、火台2、火台3、火台4、火台5、火台6、火台7
	if UpDown == 1 then --上載具
		SetFlag( Player , Flag[1] , 1 ) --玩家上載具旗標
		AddBuff( Vehicle , 623892 , 0 , -1 )	 --載具產生特效
		AddBuff( Player , 623995 , 0 , 30 )	--判斷載具是否消失BUFF
		WriteRoleValue( Vehicle , EM_RoleValue_Register1 , 1 ) --把載具的值都寫成1
		WriteRoleValue( Player , EM_RoleValue_PID , Vehicle ) --讓玩家記住載具	 
	elseif UpDown == 0 then --下載具
		for i = 1 , 10 do
			SetFlag( Player , Flag[i] , 0 ) --關閉旗標
		end
		CancelBuff( Player , Buff[2] ) --刪除可點火BUFF
		WriteRoleValue( Player , EM_RoleValue_PID , 0 ) --將玩家身上記值歸0
		WriteRoleValue( Player , EM_RoleValue_Register5 , 0 ) --將玩家身上記值歸0
		WriteRoleValue( Player , EM_RoleValue_Register6 , 0 ) --將玩家身上記值歸0		
		CancelBuff( Player , Buff[1] )--刪除烈焰聖火(計時BUFF)	
		ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_02]" , 0 )--系統告知"活動結束，請向[121743]回覆任務。"	
		DelObj( Vehicle ) --刪除載具 		
	end		
end
--============================================
--			火台的觸碰劇情
--=============================================
function Lua_jiyi_A_FireTouch() --沒有火的火台
	local Fire = OwnerID()
	local Player = TargetID()
		
	SetPlot( Fire , "Range" , "Lua_jiyi_A_FireTouch2" , 30 )

end

function Lua_jiyi_A_FireTouch2()
	local Player = OwnerID() --玩家
	local Fire = TargetID() --火台
	local FireFlag = { 547369 , 547370 , 547375 , 547364 , 547385 , 547386 }  --領過獎勵、已報名衝鋒、已參加活動、上下載具旗標、A路線旗標、B路線旗標
	local Flag = { 547390 , 547391 , 547392 , 547393 , 547394 , 547500 , 547501 } --各火台旗標
	local PID = ReadRoleValue( Fire , EM_RoleValue_PID ) --火台PID值
	local Torch = { 121828 , 121830 , 121831 , 121832 , 121833 , 121745 , 121749 } --路線A個火台對應的聖火焰
	local TorchB = { 121829 , 121834 , 121835 , 121836 , 121837 , 121770 , 121838 } --路線B個火台對應的聖火焰	
	local Buff = { 623869 , 623702 , 623870 , 623893 }	--烈焰聖火(計時BUFF)、聖火的餘溫(計分BUFF)、點火特效、可點火BUFF
	local Count = ReadRoleValue( Player , EM_RoleValue_Register6 ) --讓玩家記住自己點了幾個火台
	local BuffLv =  FN_CountBuffLevel( Player , 623893 ) --檢查玩家身上可點火BUFF
	
	if CheckFlag( Player , FireFlag[5] ) == true then --有A路線旗標時
		if CheckFlag( Player , FireFlag[4] ) == true then --有上載具旗標
			if Count == 7 then
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_05]" , 0 )--系統告知
			else	
				if Checkflag(Player, Flag[PID] )  == true then  -- 玩家已點燃此火台
					ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_03]" , 0 )--系統告知前進點燃下一個聖火台吧。	
				else  -- 玩家還沒點過此火台
					SetFlag( Player , Flag[PID] , 1 ) --打開對應的火台旗標
					AddBuff( Player , Buff[2] , 0 , -1 ) --聖火的餘溫(計分BUFF)
					AddBuff( Fire , Buff[3] , 0 , 3 ) --點火的特效						
					AddRoleValue( Player , EM_RoleValue_Register6 , 1 ) --玩家點火台次數+1
					if BuffLv ~= 0 then
						local NewBuffLv = FN_CountBuffLevel( Player , Buff[4] ) --檢查玩家身上可點火BUFF
						CancelBuff( Player , Buff[4] )
						AddBuff( Player , Buff[4] , (NewBuffLv - 1) , -1 ) --可點火BUFF
--					else
--						ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_06]" , 0 )--請先找尋聖火符文柱增加符文能量
					end
				end
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_04]" , 0 )--系統告知請操控[107560]來進行活動。
		end
	end		
end 

function Lua_jiyi_B_FireTouch() --B路線火台
	local Fire = OwnerID()
	local Player = TargetID()
		
	SetPlot( Fire , "Range" , "Lua_jiyi_B_FireTouch2" , 30 )

end

function Lua_jiyi_B_FireTouch2() --B路線火台
	local Player = OwnerID() --玩家
	local Fire = TargetID() --火台
	local FireFlag = { 547369 , 547370 , 547375 , 547364 , 547385 , 547386 }  --領過獎勵、已報名衝鋒、已參加活動、上下載具旗標、A路線旗標、B路線旗標
	local Flag = { 547390 , 547391 , 547392 , 547393 , 547394 , 547500 , 547501 } --各火台旗標
	local PID = ReadRoleValue( Fire , EM_RoleValue_PID ) --火台PID值
	local Torch = { 121828 , 121830 , 121831 , 121832 , 121833 , 121745 , 121749 } --路線A個火台對應的聖火焰
	local TorchB = { 121829 , 121834 , 121835 , 121836 , 121837 , 121770 , 121838 } --路線B個火台對應的聖火焰	
	local Buff = { 623869 , 623702 , 623870 , 623893 }	--烈焰聖火(計時BUFF)、聖火的餘溫(計分BUFF)、點火特效、可點火BUFF
	local Count = ReadRoleValue( Player , EM_RoleValue_Register6 ) --讓玩家記住自己點了幾個火台
	local BuffLv =  FN_CountBuffLevel( Player , 623893 ) --檢查玩家身上可點火BUFF
	
	if CheckFlag( Player , FireFlag[6] ) == true then --有B路線旗標時
		if CheckFlag( Player , FireFlag[4] ) == true then --有上載具旗標
			if Count == 7 then
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_05]" , 0 )--系統告知
			else	
				if Checkflag(Player, Flag[PID] )  == true then  -- 玩家已點燃此火台
					ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_03]" , 0 )--系統告知前進點燃下一個聖火台吧。	
				else  -- 玩家還沒點過此火台
					SetFlag( Player , Flag[PID] , 1 ) --打開對應的火台旗標
					AddBuff( Player , Buff[2] , 0 , -1 ) --聖火的餘溫(計分BUFF)
					AddBuff( Fire , Buff[3] , 0 , 3 ) --點火的特效						
					AddRoleValue( Player , EM_RoleValue_Register6 , 1 ) --玩家點火台次數+1
					if BuffLv ~= 0 then
						local NewBuffLv = FN_CountBuffLevel( Player , Buff[4] ) --檢查玩家身上可點火BUFF
						CancelBuff( Player , Buff[4] )
						AddBuff( Player , Buff[4] , (NewBuffLv - 1) , -1 ) --可點火BUFF
--					else
--						ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_06]" , 0 )--請先找尋聖火符文柱增加符文能量
					end
				end
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_04]" , 0 )--系統告知請操控[107560]來進行活動。
		end
	end		
end 
--=============================================
--			測試指令
--=============================================
function Lua_jiyi_2013Fire_testlua() --刪除所有玩家身上的旗標、BUFF
	local Player = OwnerID()
	local FireFlag = { 547369 , 547370 , 547364 , 547375 , 547385 , 547386 , 547390 , 547391 , 547392 , 547393 , 547394 , 547500 , 547501 }  --領過獎勵、已報名衝鋒、上下載具旗標、已參加活動、A路線旗標、B路線旗標、火台1、火台2、火台3、火台4、火台5、火台6、火台7
	local GameBuff = { 623869 , 623702 , 623893 , 623995 }	--烈焰聖火(計時BUFF) , 聖火的餘溫 , 聖火苗BUFF , 判斷載具是否消失BUFF
	WriteRoleValue( Player , EM_RoleValue_PID , 0 ) --將玩家身上記值歸0
	WriteRoleValue( Player , EM_RoleValue_Register5 , 0 )
	WriteRoleValue( Player , EM_RoleValue_Register6 , 0 )	
	for i = 1 , 13 do
		setflag( Player , FireFlag[i] , 0 ) --關閉所有旗標
	end

	for i = 1 , 4 do
		CancelBuff( Player , GameBuff[i] ) --刪除全部BUFF
	end
end

function Lua_jiyi_2013Fire_testlua2(lv) --測試分數
	local Player = OwnerID()
	AddBuff( Player , 623702 , lv , -1 )
end

function Lua_jiyi_2013Fire_testlua3(lv) --測試可點火BUFF
	local Player = OwnerID()
	AddBuff( Player , 623893 , lv , -1 )
end

