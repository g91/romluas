-------------------------------------------------以下Z26支線劇情
----------------------------------------------------------------426305劇情任務
function Lua_jiyi_Z26_Mobile01()	--活動石板上下移動
	local Slate = OwnerID()
	local Range = 30
	MoveToFlagEnabled( Slate , false )-- 關閉巡邏劇情 
	Hao_Obj_Mobile( Slate , 1 , Range , 1 ) -- 物件、移動方式、距離、是否會來回
						-- Mobile = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右
end

--/gm ? pcall Hao_Germany_4th_Slate(1	1 是 水平 0 是 上下
--Hao_Obj_Mobile(ObjID,Mobile,Distance,Loop) -- 物件、移動方式、距離、是否會來回
-- Mobile = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右 
--MoveToFlagEnabled( ObjID , false )-- 關閉巡邏劇情 

function Lua_jiyi_Z26_Mobile02()	--活動石板左右移動
	local Slate = OwnerID()
	local Range = 30
	MoveToFlagEnabled( Slate , false )-- 關閉巡邏劇情 
	Hao_Obj_Mobile( Slate , 2 , Range , 1 ) -- 物件、移動方式、距離、是否會來回
						-- 移動方式 = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右
end

function Lua_jiyi_Z26_Mobile03()	--活動石板隨機上下移動
	local Slate = OwnerID()
	local Range = 50
	MoveToFlagEnabled( Slate , false )-- 關閉巡邏劇情 
	Hao_Obj_Mobile( Slate , 1 , Range , 1 ) -- 物件、移動方式、距離、是否會來回
						-- Mobile = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右
end

-----------------------------------------------------------------426301劇情任務
function Lua_jiyi_Z26_120775()	--解碼任務對話劇情
	local player = OwnerID()
	local npc = TargetID()
	local Flag = { 548097 , 548098 , 548099 }	--向東尼‧艾羅曼、托爾‧雷森、史帝夫‧卡普森詢問訊息意義
	CloseSpeak( player )	
	if CheckAcceptQuest( player , 426301 )== true then	--判斷玩家有接解碼任務
		if CheckFlag( Player , Flag[1] ) == false then
			PlayMotion( npc , 111 )
			SetSpeakDetail( player , "[SC_Z26Q426301_01]" )	
			SetFlag( Player , Flag[1] , 1 )
		else
			LoadQuestOption(player)		
		end
	else
		LoadQuestOption(player)
	end
end

function Lua_jiyi_Z26_120776()	--解碼任務對話劇情
	local player = OwnerID()
	local npc = TargetID()
	local Flag = { 548097 , 548098 , 548099 }	--向東尼‧艾羅曼、托爾‧雷森、史帝夫‧卡普森詢問訊息意義
	CloseSpeak( player )	
	if CheckAcceptQuest( player , 426301 )== true then	--判斷玩家有接解碼任務
		if CheckFlag( Player , Flag[2] ) == false then
			PlayMotion( npc , 111 )
			SetSpeakDetail( player , "[SC_Z26Q426301_02]" )
			SetFlag( Player , Flag[2] , 1 )
		else
			LoadQuestOption(player)		
		end
	else
		LoadQuestOption(player)
	end
end

function Lua_jiyi_Z26_120777()	--解碼任務對話劇情
	local player = OwnerID()
	local npc = TargetID()
	local Flag = { 548097 , 548098 , 548099 }	--向東尼‧艾羅曼、托爾‧雷森、史帝夫‧卡普森詢問訊息意義
	CloseSpeak( player )	
	if CheckAcceptQuest( player , 426301 )== true then	--判斷玩家有接解碼任務
		if CheckFlag( Player , Flag[3] ) == false then
			PlayMotion( npc , 111 )
			SetSpeakDetail( player , "[SC_Z26Q426301_03]" )
			SetFlag( Player , Flag[3] , 1 )
		else
			LoadQuestOption(player)		
		end
	else
		LoadQuestOption(player)
	end
end
--------------------------------------------------------------以下，屍體的觸碰劇情(426302支線任務)
function Lua_jiyi_Z26_121403_touch()
	local Corpse = OwnerID() 
	local Player = TargetID()	
	SetPlot( Corpse ,"touch" , "Lua_jiyi_Z26_121403" , 30 )
end

function Lua_jiyi_Z26_121403()
	local Player = OwnerID() 
	local Corpse = TargetID()
	local Quest = 426302	--模板任務代號
	local Qitem = 242674
	if CountBodyItem( Player , Qitem ) <= 4 then
		if CheckAcceptQuest( player , Quest ) == true then
			GiveBodyItem( Player , Qitem , 1 )
			SetPlot( Corpse , "touch" , "" , 30 )
			BeginPlot( Corpse , "Lua_jiyi_Z26_121403_Hide" , 0 )
		else
			PlayMotion( Player , 111 )			
			ScriptMessage( player , player , 2 , "[SC_Z26Q426302_02]" , C_SYSTEM )	-- (你向榮耀戰死的戰士敬禮)
		end
	else
		ScriptMessage( player , player , 2 , "[SC_Z26Q426302_01]" , C_SYSTEM )	-- 你無法再拿更多的[242674]…
	end			
end

function Lua_jiyi_Z26_121403_Hide()
	local Corpse = OwnerID()
	hide(Corpse)
	sleep(100)	--消失10秒鐘
	show( Corpse , 0 )
	SetPlot( Corpse , "touch" , "Lua_jiyi_Z26_121403" , 30 )
end
-----------------------------------------------------------------426303劇情任務
-------------------------------------制裁者引力陷阱使用Lua
function Lua_jiyi_Z26_242674check()
	local Player = OwnerID()
	local Sanction = 107725
	local Trap = {}
	local Monster = SearchRangeNPC( Player , 50 )
	local TOrgID = ReadRoleValue( Player , EM_RoleValue_OrgID )	--讀取目標物品ID

	for i = 0 , table.getn(Monster) do
		if ReadRoleValue( Monster[i] , EM_RoleValue_OrgID ) == Sanction then
			table.insert( Trap , Monster[i] )
		end
	end

	if table.getn(Trap) > 0 then
--		Say( Player , "Trap="..table.getn(Trap))
		return true
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z26Q426303_01]" , 0 )
		return false
	end
end

function Lua_jiyi_Z26_242674Use()
	local Player = OwnerID()
	local TrapX = ReadRoleValue( Player , EM_RoleValue_X )
	local TrapY = ReadRoleValue( Player , EM_RoleValue_Y )
	local TrapZ = ReadRoleValue( Player , EM_RoleValue_Z )
	local Sanction = 107725
	local Monster = SearchRangeNPC( Player , 50 )

--	DelBodyItem( Player , 242674 , 1 )
	for i = 0 , table.getn(Monster) do
		if ReadRoleValue( Monster[i] , EM_RoleValue_OrgID ) == Sanction then
		--	Move( Monster[i] , TrapX , TrapY , TrapZ )
			SetPos( Monster[i] , TrapX , TrapY , TrapZ , 0 )
			DW_QietKillOne( 0 , 107461 )	--靜靜的殺死107461怪，前者殺死後者，0代表為玩家
			KillID( Player , Monster[i] )
		end
	end
end
--	Lua_MoveLine( Monster[i] , 100 )	--參考物件，向前移動到Dis距離的位置(Dis填負數為向後移動)		
--local Grass = Lua_Hao_NPC_Closest_Search( Sheep , 117052  , 50 )-- 以Owner為中心做范圍搜尋，回傳最接近的物件	
----------------------------------------------------------------426306支線任務
function Lua_jiyi_Z26_426306Buff()	--接任務後Npc給予玩家活動技能
	local NPC = OwnerID()
	local Player = TargetID()
	local Buff = 620170
	if CountBodyItem( Player , 242685 ) < 1 then
		AddBuff( Player , Buff , 0 , -1 )
	end
end

function Lua_jiyi_426306_Cancel()	--檢查是否有任務，若放棄任務則刪除BUFF
	local Player = OwnerID()
	if DW_CheckQuestAccept( "or" , Player , 426306 ) == false	then
		CancelBuff( Player , 620170 )
	end
end

function Lua_jiyi_Z26_620171Check()	--捕捉技能的檢查LUA
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local Brid = 120268	
	for i = 1 , 2 do
		if TOrgID == Brid then 
			return true
		end
	end
	ScriptMessage( own , own , 1 , "[SC_DE_4TH_NPC_121870_12]" , 0 )--系統告知"非有效目標"
	return false
end

function Lua_jiyi_Z26_620171()	--基本法術執行劇情
	local Player = OwnerID()	--玩家
	local Brid = TargetID()	--鳥
	local TOrgID = ReadRoleValue( Brid , EM_RoleValue_OrgID )	--讀取目標物品ID
	local NewBrid = 120268	
	local QuestBuff = 620170
	local BridX = ReadRoleValue( Brid , EM_RoleValue_Register1 )
	local BridY = ReadRoleValue( Brid , EM_RoleValue_Register2 )
	local BridZ = ReadRoleValue( Brid , EM_RoleValue_Register3 )
	if TOrgID == NewBrid then 
		ScriptMessage( Player , Player , 1 , "[SC_Z26Q426306_01]" , 0 ) --你捉到[623871]了。
		GiveBodyItem( Player , 242685 , 1 )		
		CancelBuff( Player , QuestBuff )
		ScriptMessage( Player , Player , 2 , "[SC_Z26Q426306_02]" , 0 )--系統告知"任務完成，請向[121870]回覆任務。"		
		CallPlot( Brid , "Lua_jiyi_Z26_620171Hide" , BridX , BridY , BridZ ) --隱藏再顯現
	end
end

function Lua_jiyi_Z26_620171Hide( BridX , BridY , BridZ )
	local Brid = OwnerID()
	local RoomID = ReadRoleValue( Brid , EM_RoleValue_RoomID )	
	Hide( Brid )	
--	SetPos( Brid , BridX , BridY , BridZ , 0 )
	Sleep(100)
	local NewBrid = CreateObj( 120268 , BridX , BridY , BridZ , 0 , 1 )
	AddToPartition(NewBrid ,RoomID )
--	show( NewBrid , RoomID )
	DelObj ( Brid )
end

function Lua_jiyi_Z26_620171Move()	--鳥移動模式
	local Brid = OwnerID()
	local Range = 40
	local BridX = ReadRoleValue( Brid , EM_RoleValue_X )
	local BridY = ReadRoleValue( Brid , EM_RoleValue_Y )
	local BridZ = ReadRoleValue( Brid , EM_RoleValue_Z )
	SetModeEx( Brid , EM_SetModeType_ShowRoleHead , true )	--頭像框
	SetModeEx( Brid , EM_SetModeType_Gravity , false )	--取消重力	
	WriteRoleValue( Brid , EM_RoleValue_Register1 , BridX )
	WriteRoleValue( Brid , EM_RoleValue_Register2 , BridY )
	WriteRoleValue( Brid , EM_RoleValue_Register3 , BridZ )
	MoveToFlagEnabled( Brid , false )	-- 關閉巡邏劇情 	
	Hao_Obj_Mobile( Brid , 3 , Range , 1 )	-- 物件、移動方式、距離、是否會來回
							-- Mobile = 1 時，為固定上下移動、2 時為固定左右移動、3時為以一個點為起始點，亂數移動上下左右
end

----------------------------------------------------------------------------能量源的觸碰劇情(暫無使用)
function Lua_jiyi_Z26_116962touch()
	local Energy = OwnerID()
	local Player = TargetID()
	SetPlot( Energy , "touch" , "Lua_jiyi_Z26_116962" , 50 )
end

function Lua_jiyi_Z26_116962()
	local Player = OwnerID() 
	local Energy = TargetID()
	local Quest = { 426305 , 426324 , 426327 }	--模板任務代號
	local Qflag = 548100	--關閉能量供應點
	if CheckFlag( Player , Qflag ) == false then
		for i = 1 , 3 do
			if CheckAcceptQuest( player , Quest[i] ) == true then
				SetFlag( player , Qflag , 1 )
				SetPlot( Energy , "touch" , "" , 30 )
				BeginPlot( Energy , "Lua_jiyi_Z26_116962_Hide" , 0 )
			else			
				ScriptMessage( player , player , 2 , "[SC_Z26Q426305_01]" , C_SYSTEM )	-- 一個周圍充滿異樣能量的水晶體…
			end
		end
	else
		ScriptMessage( player , player , 2 , "[SC_Z26Q426305_02]" , C_SYSTEM )	-- 已經被關閉供應能量的水晶體。
	end			
end

function Lua_jiyi_Z26_116962_Hide()
	local Energy = OwnerID()
	hide(Energy)
	sleep(100)	--消失10秒鐘
	show( Energy , 0 )
	SetPlot( Energy , "touch" , "Lua_jiyi_Z26_116962" , 50 )
end

----------------------------------------------------------------------------------------------------以下，Z26主線任務
---------------------426309憤怒的傷患-----------------------
function Lua_jiyi_Z26_426309_Giddy1()	--蹲著暈眩
	AddBuff( OwnerID() , 620172 , 0 , -1 )
end 

function Lua_jiyi_Z26_426309_Giddy2()	--躺著暈眩
	AddBuff( OwnerID(), 620172 , 0 , -1 )
end 

function Lua_jiyi_Z26_426309_Giddy3()	--坐著暈眩
	AddBuff( OwnerID() , 620172 , 0 , -1 )
end

function Lua_jiyi_Z26_242764check()	--百花精油檢查LUA
	local Player = OwnerID()
--	local TOrgID = TargetID()
	local Injuries = { 120401 , 120402 , 120403 }
	local TOrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )	--讀取目標物品ID

	if TOrgID == Injuries[1] or TOrgID == Injuries[2] or TOrgID == Injuries[3] then
		if CheckBuff( TargetID() , 620172 ) == true then		
			return true
		else
			npcsay( TargetID() , "[SC_Z26Q426309_03]")
			return false						
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z26Q426309_01]" , 0 )
		return false
	end
end

function Lua_jiyi_Z26_242764use()	--百花精油使用LUA
	local Player = OwnerID()
	local Injuries = TargetID()

--	if CheckBuff( Injuries , 620172 ) == true then
		CancelBuff( Injuries , 620172 )
		npcsay( Injuries , "[SC_Z26Q426309_02]")
		DW_QietKillOne( 0 , 107536 )	--靜靜的殺死107536怪，前者殺死後者，0代表為玩家
--	else
--		npcsay( Injuries , "[SC_Z26Q426309_03]")
--	end
end

function Lua_jiyi_Z26_620127()
	BeginPlot( OwnerID(), "Lua_jiyi_Z26_620127_2" , 0 )
end

function Lua_jiyi_Z26_620127_2()
	Sleep(100)
	AddBuff( OwnerID() , 620172 , 0 , -1 )
end
----------------------------425679誰在搞鬼-------------------------
--對話： 詢問被炸傷的聯盟戰士
function Lua_jiyi_Z26_120231speak()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 425679 ) == true and CheckFlag( OwnerID() , 548202 ) == false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z26Q425679_01]","Lua_jiyi_Z26_425679speak(1)" , 0 )
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z26_120232speak()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 425679 ) == true and CheckFlag( OwnerID() , 548201 ) == false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z26Q425679_03]","Lua_jiyi_Z26_425679speak(2)" , 0 )
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z26_120233speak()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 425679 ) == true and CheckFlag( OwnerID() , 548181 ) == false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z26Q425679_02]","Lua_jiyi_Z26_425679speak(3)" , 0 )
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z26_425679speak(num)
	local player = OwnerID()
	CloseSpeak( player )
	if num == 1 then
		SetSpeakDetail( player , "[SC_Z26Q425679_04]" )
		SetFlag( player , 548202 , 1 )		
--		DW_QietKillOne( 0 , 107408 )
	elseif num == 2 then
		SetSpeakDetail( player , "[SC_Z26Q425679_05]" )
		SetFlag( player , 548201 , 1 )			
--		DW_QietKillOne( 0 , 107328 )
	elseif num == 3 then
		SetSpeakDetail( player , "[SC_Z26Q425679_06]" )
		SetFlag( player , 548181 , 1 )
--		DW_QietKillOne( 0 , 107407 )		
	else
		LoadQuestOption( player )
	end
end
----------------------------426317奇襲！聯盟敗退-------------------------
-----------退場	
function Lua_jiyi_Z26_426317_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623910
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
--	CancelBuff( player , 623909 )	--顯示接任務NPC BUFF
 	if Num == 0 then          ----如果暫存值為0
 		 WriteRoleValue(NPC, EM_RoleValue_Register1,999)          
 	 	AddBuff( Player,CliBuff,0, 15)
 	 	CallPlot(NPC, "Lua_jiyi_Z26_426317_Accept2" , NPC, Player, CliBuff)    ----接演戲function      
 	end 
end

function Lua_jiyi_Z26_426317_Accept2(NPC, Player, CliBuff)
	local New_NPC =  DW_CreateObjEX("obj", 121482 , NPC) ----生成演戲
 	local WalkFlag = 781304
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	Yell( New_NPC , "[SC_Z26Q426317_02]" ,  3 )   
--	NPCSAY(New_NPC, "[SC_Z26Q426317_02]")  
--	Hide(NPC)
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , WalkFlag, 0, 0, 1)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
	show( NPC , RoomID )
end

function Lua_jiyi_Z26_426317_Delete()
 	local Player = OwnerID()
 	if DW_CheckQuestAccept("or",Player, 426317) == false then
 		 CancelBuff(Player, 623910)
 	end
end
----------------------------426316封印儀式-------------------------
-------------426317的進場
function Lua_jiyi_Z26_621895_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781304
 	local CliBuff = 621895	--表演用演員顯示BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
 	if Num == 0 then          ----如果暫存值為0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z26_621895_Complete2" , NPC , Player , Flag , CliBuff )    ----接演戲function
    	else
		LoadQuestOption(Player)  
 	end 
end

function Lua_jiyi_Z26_621895_Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 120350 , Flag , 1 , 1 , 1 )     --產生演員 
	ks_ActSetMode( Actor )
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
--	NPCSAY(Actor, "[SC_Z26Q426317_01]")
	Yell( Actor , "[SC_Z26Q426317_01]" ,  4 )      
	DW_MoveToFlag( Actor , Flag , 2 , 0 , 1 ) 
	Sleep(20)
--	AddBuff( player , 623909 , 0 , -1 ) 	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end

function Lua_jiyi_Z26_621895_Delete()
	local Player = OwnerID()
 	if DW_CheckQuestAccept("or",Player, 426317) == false then
 		 CancelBuff(Player, 621895)		
 	end
end