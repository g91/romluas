--活動NPC 124106 玫兒 (給任務)
function Lua_na_2014xmas_124106() --玫兒
	local Owner = OwnerID()
	local Target = TargetID()
	local StartKey = 549354 --接任務旗標
	local EndKey = 549353 --每日旗標	
	AdjustFaceDir(Target , Owner , 0 )
	if  	CheckFlag( Owner , EndKey) == true then
		SetSpeakDetail( Owner , "[SC_2014XMAS_03]" ) --祝福你暖冬節快樂！
	elseif CountBodyItem( Owner , 243286 ) >= 1 then
		SetSpeakDetail( Owner , "[SC_2014XMAS_02]" ) --極冰元素只能維持雪人一個小時左右，所以希望你儘快將它交給我的妹妹茉兒。
	else
		SetFlag( Owner , StartKey, 1)	--給予顯示任務旗標
		LoadquestOption( Owner )
	end
end

function Lua_na_2014xmas_124106_2()
	local Owner = OwnerID() --NPC
	local Target = TargetID() --PLAYER
	SetFlag( Target , 549353 , 1 ) --接受任務用判斷
	ScriptMessage( Target , Target, 2 , "[SC_2014XMAS_05]", 0 ) --（玫兒專注地作著雪人…）
	PlayMotion( Owner , ruFUSION_ACTORSTATE_USE	)
	Sleep(40)
	Tell(Target ,Owner , "[SC_2014XMAS_06]")  --終於完成了！麻煩你幫我送去給茉兒吧！
	ScriptMessage( Target , Target, 2 , "[SC_2014XMAS_07]", 0 ) --（玫兒專注地作著雪人…）
	GiveBodyItem( Target , 243286 , 1 )
	AddBuff( Target , 626280 , 0 , -1 )
end


--區域物件劇情
function Lua_na_2014Xmas_Flag() --控制2014Xmas活動旗標的中控器
	local Owner = OwnerID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local Flag = 781452
	local Flower = {}
	local Ice = {}
	for i = 1 , 10 do --產生10朵花
		Flower[i] = CreateObjByFlag( 124105 , Flag , i , 1 )	
		AddToPartition( Flower[i] , Room)
	end

	local ICE_PLACE = {	[1] = { 11, 12, 13, 14 } , 
				[2] = { 15, 16, 17, 18 } , 
				[3] = { 19, 20, 21, 22 }	}
	for j = 1 , 3 do  --產生3隻極冰元素
		local R = DW_Rand(#ICE_PLACE[j])
		Ice[j] = CreateObjByFlag( 109237 , Flag , ICE_PLACE[j][R] , 1 )
		WriteRoleValue( Ice[j] , EM_RoleValue_PID , j )
		AddToPartition( Ice[j] , Room)
		table.remove( ICE_PLACE[j] , ICE_PLACE[j][R])
	end
end


--極冰元素初始劇情，逃跑
function Lua_na_2014Xmas_ICE()    
	local ID = OwnerID()
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local x,y,z,dir = DW_Location(ID)
	SetModeEx( ID , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( ID , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( ID , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( ID  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( ID  , EM_SetModeType_Move, true )--移動
	SetRandMove( ID , 40, 50 , 30)
	while true do 
		local XX = Rand(40)+30     --距離30~70內
		local Player = SearchRangePlayer( ID , XX ) --判斷附近是否有玩家
		if CheckID( Player[0] ) == true then	--如果附近XX內有玩家
			local Dis = Rand(40)+20 
			AdjustFaceDir(ID, Player[0] , 180 ) --面向 背對
			WriteRoleValue( ID  ,EM_RoleValue_IsWalk , 0  )--用跑的
			sleep(5)
			Lua_MoveLine( ID , Dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
		else
			MoveDirect( ID , x, y, z)
		end
		sleep(10)
	end
end


--掛在極冰元素的死亡劇情
function Lua_na_2014Xmas_Icedie() 
	local Owner = OwnerID()
	local Flag = 781452
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local ICE_PLACE = {	[1] = { 11, 12, 13, 14 } , 
				[2] = { 15, 16, 17, 18 } , 
				[3] = { 19, 20, 21, 22 }	}
	local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
	local R = DW_Rand(#ICE_PLACE[PID])
	local Ice = CreateObjByFlag( 109237 , Flag , ICE_PLACE[PID][R] , 1 )
	WriteRoleValue( Ice , EM_RoleValue_PID , PID )	
	AddToPartition(Ice , Room)
	return true
end


--採小花
function Lua_na_2014xmas_flower()
	local Owner = OwnerID()
	SetPlot( Owner , "touch" , "Lua_na_2014xmas_flower_1" , 10)
end

function Lua_na_2014xmas_flower_1()
	local Owner = OwnerID()
	local Target = TargetID()
	if CountBodyItem( Owner , 243284) >= 5 then
		ScriptMessage( Owner , Owner , 2 , "[SC_423188_1]" , 0 )
		return
	end
	if BeginCastBarEvent( Owner, Target,  "[SC_2014XMAS_01]" , 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_2014xmas_flower_2" ) ~= 1 then --10為bar動作時間，字串"採集花瓣"
	end
end

function Lua_na_2014xmas_flower_2(Owner, CheckStatus)
	local Target = TargetID()
	EndCastBar( Owner, CheckStatus );
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			GiveBodyItem( Owner , 243284 , 1)
			BeginPlot( Target , "Lua_na_2014xmas_flower_3" , 0 )
		end
	end
end

function Lua_na_2014xmas_flower_3()
	local Owner = OwnerID()
	local R = DW_Rand(5)
	Hide( Owner)
	sleep(R*100)
	show(Owner , 0)
end

--羊咩咩掉毛，觸碰劇情
function Lua_na_2014Xmas_sheep()
	local Owner = OwnerID()
	SetPlot( Owner, "touch" , "Lua_na_2014Xmas_sheep2" , 10 )
end

function Lua_na_2014Xmas_sheep2()
	local Owner = OwnerID()
	local Target = TargetID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local R = DW_Rand( 100)
	local wool
	local x, y, z, dir = DW_Location( Target)
	SetPlot( Target, "touch" , "" , 0 )
	if R >= 40 then
		wool = CreateObj( 124108 , x, y, z , dir , 1 )
		AddToPartition( wool , Room)
		ScriptMessage( Target, Owner ,2, "[SC_2014XMAS_10] ", 0 )
	else
		ScriptMessage( Target, Owner, 1 , "[SC_2014XMAS_11] ", 0 )
	end
	AddBuff( Target, 624067, 0 , 3 )
	sleep(30)
	SetPlot( Target, "touch" , "Lua_na_2014Xmas_sheep2" , 10 )
end


--羊毛的觸碰劇情
function Lua_na_2014xmas_wool()
	local Owner = OwnerID()
	AddBuff( Owner , 620015 , 0, -1 ) --亮晶晶特效
	BeginPlot( Owner , "Lua_na_2014Xmas_wool3" , 0 )
	SetPlot( Owner, "touch" , "Lua_na_2014Xmas_wool2" , 10 )
end

function Lua_na_2014Xmas_wool2()
	local Owner = OwnerID()
	local Target = TargetID()
	SetPlot( Target, "touch" , "" , 0 )
	GiveBodyItem( Owner , 243285 , 1 )
	DelObj( Target)
end

function Lua_na_2014Xmas_wool3()
	local Time = 0
	while true do 
		if Time == 15 then
			DelObj(OwnerID() )
		else
			Time = Time + 1
		end
		sleep(10)
	end
end


--茉兒的對話劇情
function Lua_na_2014xmas_124104()
	local Owner = OwnerID()
	local Target = TargetID()
	AdjustFaceDir(Target , Owner , 0 )
	if CountBodyItem( Owner , 243286 ) >= 1 then
		SetSpeakDetail( Owner , "[SC_2014XMAS_08]") --這是玫兒送給我的嗎？
		CancelBuff_NoEvent( Owner, 626280 )
		DelBodyItem( Owner , 243286 , 1 )
		GiveBodyItem( Owner , 203178 , 1 )
	else
		SetSpeakDetail( Owner , "[SC_2014XMAS_09]" ) --暖冬節快樂！
	end		
end


--刪除場上所有相關物件
function Lua_na_2014xmas_DEL() 
	local Owner = OwnerID() --隱藏物件
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local ObjID = {	124105, 109237	}  --需要被刪除寶箱等相關NPC ID 
	local NPC = SearchRangeNPC(Owner , 1500)
--	Say( Owner ,"NPC =".. #NPC)
	for i = 0 , #NPC do 		--刪除所有活動相關NPC
		for j = 1 , #ObjID do
			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == ObjID[j] then
				DelObj( NPC[i] )
			end
		end
	end
end


--雪人消失的時候，刪除玩家身上的訊息BUFF，BUFF觸發提示訊息
function Lua_na_2014Xmas_snowman() 
	local Owner = OwnerID()
	CancelBuff( Owner , 626280)
end 

--雪人融化訊息
function Lua_na_2014Xmas_243286()
	local Owner = OwnerID()
	ScriptMessage( Owner, Owner , 3 , "[SC_2014XMAS_04]" , 0 ) --雪人融化了
	return false
end 

--掃地動作
function Lua_na_2014XMAS_Motion2()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0)
end