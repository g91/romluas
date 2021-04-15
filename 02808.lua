--===========================================================
--				報名NPC121870對話劇情
--===========================================================
function Lua_jiyi_121870_4th()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --NPC
	local ActiveFlag = { 547574 , 547539 }--當日已領過獎勵、活動進行中
	local ActiveBuff = { 624037 , 623871 , 624009 } --給活動技能 , 得分BUFF , 召喚平台
--	AddBuff( Npc , 503217 , 1 , -1 ) --節慶符號
	if CheckFlag( Player , ActiveFlag[1] ) == true then --當日已領過獎勵
		SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_01]" ) --感謝你幫我抓來一隻623871
	elseif CheckFlag( Player , ActiveFlag[2] ) == true then --當身上有活動進行中旗標時
		if CheckBuff( Player , ActiveBuff[1] ) == true  then --有活動技能、還沒抓到小屁球
			SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_02]" ) --到星空追逐[121865]吧。  			 	
		elseif CheckBuff( Player , ActiveBuff[2] ) == true then --有得分BUFF(完成任務)
			SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_03]" )  --你幫我帶回[623871]了嗎？
			AddSpeakOption( Player , Npc , "[SC_DE_4TH_NPC_121870_04]" , "Lua_jiyi_121870_4th_reward" , 0 )  --我抓到了
		else --小屁球BUFF消失後
			SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_06]" ) --你今天已經捕捉過[121865]了，讓其他人也來試試看吧。
		end  			
	else
		SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_07]" )  --你願意幫助我的星空夢想成真嗎？
		AddSpeakOption( Player , Npc , "[SC_DE_4TH_NPC_121870_08]" , "Lua_jiyi_121870_4th_2" , 0 )  --我該怎麼幫助你呢？
	end		
end

function Lua_jiyi_121870_4th_2()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --Npc
	CloseSpeak( Player )	--關閉對話視窗
	SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_09]" )  --活動說明
	AddSpeakOption( Player , Npc , "[SC_DE_4TH_NPC_121870_10]", "Lua_jiyi_121870_4th_3" , 0 )  --好，我試試看。
end	

function Lua_jiyi_121870_4th_3()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --Npc
	local ActiveFlag = 547539 --活動進行中
	local ActiveBuff = 624037 --給活動技能 
	CloseSpeak( Player )	--關閉對話視窗
	SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_11]" )  --那麼，快到星空追逐[121865]吧。
	AddBuff( Player , ActiveBuff , 0 , -1 ) --給活動技能
	SetFlag( Player , ActiveFlag , 1 ) --打開活動進行中旗標
	DesignLog( Player , 121870 , "4th event STAR" )	--記錄參加人次
	Callplot( Player , "Hao_Check_Cancel_Buff_Distance", Npc , 250 , ActiveBuff , "[SC_DE_4TH_NPC_121870_17]" , 200 , "[SC_DE_4TH_NPC_121870_18]" )	-- 超過距離即刪除 Buff、快超過距離提示
--Hao_Check_Cancel_Buff_Distance( Npc , Range , Buff , Msg , Range2 , Msg2 )
-- 中心點的npc、檢查範圍半徑、刪除Buff、提示訊息字串、檢查範圍半徑2、提示訊息字串2。
end	

function Lua_jiyi_121870_4th_reward()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --npc
	local ActiveFlag = { 547574 , 547539 }--當日已領過獎勵、活動進行中
	local ActiveBuff = { 624037 , 623871 } --給活動技能 , 得分BUFF
	local Reward = 209561  --獎勵：活動獎券
	CloseSpeak( Player )
	if CheckBuff( Player , ActiveBuff[2] ) == true then 
		CancelBuff( Player , ActiveBuff[1] ) --刪除活動技能 
		CancelBuff( Player , ActiveBuff[2] ) --刪除得分BUFF
		GiveBodyItem( Player , Reward , 1 ) 
	end
	SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_05]" ) --這裡有一張[209561]就當作答謝你幫我捉到研究材料的謝禮吧。
	SetFlag( Player , ActiveFlag[2] , 0 ) --關閉活動進行中旗標
	SetFlag( Player , ActiveFlag[1] , 1 ) -- 已經領取過獎勵
	DesignLog( Player , 1218701 , "4th event OVER" )	--記錄完成人次
end

--============================================================
--				NPC貪吃球的物件產生(移動)劇情
--============================================================
function Lua_jiyi_test0128() --貪吃球移動模式
	local Ball = OwnerID()
	local Range = 20
	local BallX = ReadRoleValue( Ball , EM_RoleValue_X )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Y )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Z )
	WriteRoleValue( Ball , EM_RoleValue_Register1 , BallX )
	WriteRoleValue( Ball , EM_RoleValue_Register2 , BallY )
	WriteRoleValue( Ball , EM_RoleValue_Register3 , BallZ )
--	SetModeEx( Ball  , EM_SetModeType_ShowRoleHead , false )--頭像框
	MoveToFlagEnabled( Ball , false )-- 關閉巡邏劇情 	
	Hao_Obj_Mobile( Ball , 3 , Range , 1 ) -- 物件、移動方式、距離、是否會來回
						-- Mobile = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右
end
--==============================================================
--				121866物件產生劇情
--==============================================================
function Lua_jiyi_121866_move()
	local Ball = OwnerID()

	local Range = 20 
	SetModeEx( Ball  , EM_SetModeType_ShowRoleHead , false )--頭像框
	CallPlot( Ball , "Lua_jiyi_121866_4th" , 0 )	
	MoveToFlagEnabled( Ball , false )-- 關閉巡邏劇情 	
	Hao_Obj_Mobile( Ball , 3 , Range , 1 ) -- 物件、移動方式、距離、是否會來回
						-- Mobile = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右、loop為0單次來回=1重複來回
end	

function Lua_jiyi_121866_4th()
	local Ball = OwnerID()
	local OldBall = 121865
	local RoomID = ReadRoleValue( Ball , EM_RoleValue_RoomID )
	local BallX = ReadRoleValue( Ball , EM_RoleValue_Register1 )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Register2 )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Register3 )
	local Time = 0

	for i = 1 , 10 do
		Time = Time + 1
		if Time == 10 then
			Hide( Ball )
			SetPos( Ball , BallX , BallY , BallZ , 0 )
			WriteRoleValue( Ball , EM_RoleValue_IsWalk , 1 )
			Sleep(10)
			ChangeObjID( Ball , OldBall ) --變回貪吃球	
			show( OldBall , RoomID )
		end
	Sleep(10)
	end
end
--==============================================================
--				121867物件產生劇情
--==============================================================
function Lua_jiyi_121867_move()
	local Ball = OwnerID()
	local Range = 5 + rand( 20 ) 
	SetModeEx( Ball  , EM_SetModeType_ShowRoleHead , false )--頭像框
	CallPlot( Ball , "Lua_jiyi_121867_4th" , 0 )	
	MoveToFlagEnabled( Ball , false )-- 關閉巡邏劇情 	
	Hao_Obj_Mobile( Ball , 3 , Range , 1 ) -- 物件、移動方式、距離、是否會來回
						-- Mobile = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右、loop為0單次來回=1重複來回
end	

function Lua_jiyi_121867_4th()
	local Ball = OwnerID()
	local OldBall = 121865
	local RoomID = ReadRoleValue( Ball , EM_RoleValue_RoomID )
	local BallX = ReadRoleValue( Ball , EM_RoleValue_Register1 )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Register2 )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Register3 )
	local Time = 0

	for i = 1 , 10 do
		Time = Time + 1
		if Time == 10 then
			Hide( Ball )
			SetPos( Ball , BallX , BallY , BallZ , 0 )
			WriteRoleValue( Ball , EM_RoleValue_IsWalk , 1 )
			Sleep(10)
			ChangeObjID( Ball , OldBall ) --變回貪吃球	
			show( OldBall , RoomID )
		end
	Sleep(10)
	end
end
--=================================================================
--				捕捉技能執行劇情
--=================================================================
function Lua_jiyi_850559_Germany4() --捕捉技能的檢查LUA
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --讀取目標物品ID
	local Ball = { 121866 , 121867 } --可捕捉的貪吃球ID
	for i = 1 , 2 do
		if TOrgID == Ball[i] then 
			return true
		end
	end
	ScriptMessage( own , own , 1 , "[SC_DE_4TH_NPC_121870_12]" , 0 )--系統告知"非有效目標"
	return false
end

function Lua_jiyi_850559_4th() --捕捉的執行劇情
	local Player = OwnerID() --玩家
	local Ball = TargetID() --貪吃球
	local TOrgID = ReadRoleValue( Ball , EM_RoleValue_OrgID ) --讀取目標物品ID
	local OldBall = 121865
	local NewBall = { 121866 , 121867 } --可捕捉的貪吃球ID
	local ActiveBuff = 624037 --給活動技能
	local RanNum = DW_Rand(10)
	local BallX = ReadRoleValue( Ball , EM_RoleValue_Register1 )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Register2 )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Register3 )
	if TOrgID == NewBall[1] then --甜蜜蜜貪吃球
		ScriptMessage( Player , Player , 1 , "[SC_DE_4TH_NPC_121870_13]" , 0 ) --你捉到[623871]了。
		AddBuff( Player , 623871 , 0 , 600 ) --給得分BUFF10分鐘
		CancelBuff( Player , ActiveBuff )
		ScriptMessage( Player , Player , 2 , "[SC_DE_4TH_NPC_121870_14]" , 0 )--系統告知"活動結束"		
		CallPlot( Ball , "Lua_jiyi_107328_show" , BallX , BallY , BallZ ) --隱藏再顯現	
	elseif TOrgID == NewBall[2] then--火辣辣貪吃球
		if RanNum == 2 or RanNum == 4 or RanNum == 6 or RanNum == 9 then
			ScriptMessage( Player , Player , 1 , "[SC_DE_4TH_NPC_121870_13]" , 0 )--你捉到[121865]了。
			AddBuff( Player , 623871 , 0 , 600 ) --給得分BUFF10分鐘
			CancelBuff( Player , ActiveBuff )
			ScriptMessage( Player , Player , 2 , "[SC_DE_4TH_NPC_121870_14]" , 0 )--系統告知"活動結束"
			CallPlot( Ball , "Lua_jiyi_107328_show" , BallX , BallY , BallZ ) --隱藏再顯現				
		else
			ScriptMessage( Player , Player , 1 , "[SC_DE_4TH_NPC_121870_16]" , 0 ) --[121867]警戒地飛走了。
			WriteRoleValue( Ball , EM_RoleValue_IsWalk , 0 )
		end
	end
end

function Lua_jiyi_107328_show( BallX , BallY , BallZ )
	local Ball = OwnerID()
	local RoomID = ReadRoleValue( Ball , EM_RoleValue_RoomID )	
	local OldBall = 121865
	Hide( Ball )	
	SetPos( Ball , BallX , BallY , BallZ , 0 )
	Sleep(100)
	ChangeObjID( Ball , OldBall ) --變回貪吃球	
	show( OldBall , RoomID )
end
--===================================================================
--				引誘技能執行劇情
--===================================================================
function Lua_jiyi_850556_Germany4() --引誘技能(掛在基本法術)的檢查LUA
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --讀取目標物品ID
	local Ball = 121865--可引誘的貪吃球ID

	if TOrgID == Ball then 
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_DE_4TH_NPC_121870_15]" , 0 )--系統告知"非[850556]使用目標。"
		return false
	end		
end

function Lua_jiyi_850556_4th()
	local Player = OwnerID() --玩家
	local Ball = TargetID() --貪吃球
	local BallX = ReadRoleValue( Ball , EM_RoleValue_Register1 )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Register2 )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Register3 )
	local RanNum = DW_Rand(10)
	AdjustFaceDir( Ball , Player , 0 ) 	--使目標面向自己
	Lua_MoveLine( Ball , RanNum )	--參考物件，向前移動到Dis距離的位置(Dis填負數為向後移動)
	if RanNum == 1 or RanNum == 2 or RanNum == 8 or RanNum == 4 or RanNum == 5 or RanNum == 9 then
		local NewBall = ChangeObjID( Ball , 121867 ) --變火辣辣貪吃球	
	elseif RanNum == 3 or RanNum == 6 or RanNum == 7 or RanNum == 10 then
		local NewBall = ChangeObjID( Ball , 121866 ) --變甜蜜蜜貪吃球
	end				
end
--/gm ? pcall Hao_Germany_4th_Slate(1	1 是 水平 0 是 上下
--Hao_Obj_Mobile(ObjID,Mobile,Distance,Loop) -- 物件、移動方式、距離、是否會來回
-- Mobile = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右 
--MoveToFlagEnabled( ObjID , false )-- 關閉巡邏劇情 
--Hao_Obj_To_Obj_Height(Height)
--在基本法術中的「檢查lua」掛上此Lua，可以偵測施法者與被施法者的高度差距，使用方式是
--如Hao_Obj_To_Obj_Height(15)，如果大於15，就視同此法術無效。
-- AdjustFaceDir( OwnerID(), TargetID(), 0 ) --使自己面向目標
--local Grass = Lua_Hao_NPC_Closest_Search( Sheep , 117052  , 50 )-- 以Owner為中心做范圍搜尋，回傳最接近的物件
--=========================================================================
--					測試指令
--=========================================================================
function Lua_jiyi_4th_testcancel() --刪除所有旗標、BUFF
	local Player = OwnerID()
	local Flag = { 547539 , 547574 } --活動進行中_抓材料, 領過獎勵_抓材料
	local Buff = { 624037, 623871 }  --給活動技能, 羞愧貪吃球
	CancelBuff( Player , Buff[1] )
	CancelBuff( Player , Buff[2] )
	SetFlag( Player , Flag[1] , 0 ) --關閉活動進行中旗標
	SetFlag( Player , Flag[2] , 0 ) --關閉領過獎勵旗標
end		