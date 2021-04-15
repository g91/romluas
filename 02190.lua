function bk_war1_door0()------第一個門破了npc 不在產生衝車
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local mob = ReadRoleValue(start,EM_RoleValue_register1)
	if mob > 2 then 
	elseif mob <= 2 then 
	WriteRoleValue(start,EM_RoleValue_register1,1)
	end
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx(monster,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(monster,EM_SetModeType_Move, false)--移動
	SetModeEx(monster,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--搜尋敵人
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	WriteRoleValue(monster,EM_RoleValue_register9,targetID())
	AddToPartition( monster, RoomID)
end
function bk_war1_door13_enter()-----一王死出傳送門 傳送們劇情
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	ChangeZone( OwnerID() , 190 , RoomID, -6447.8 , 105 , -2941.7 , 360 )
end
function bk_war1_door13_out()-----一王死出傳送門 傳送們劇情
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	ChangeZone( OwnerID() , 190 , RoomID, 2113.7 , -5 , -2575.2 , 180 )
end
function bk_war1_door2()------門開2王出
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	WriteRoleValue(start,EM_RoleValue_register1,5)
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx(monster,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(monster,EM_SetModeType_Move, false)--移動
	SetModeEx(monster,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--搜尋敵人
	WriteRoleValue(monster,EM_RoleValue_Register9,targetID())
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	AddToPartition( monster, RoomID)
end
function bk_war1_door3()------門開3王出
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local mob = ReadRoleValue(start,EM_RoleValue_register1)
	WriteRoleValue(start,EM_RoleValue_register1,7)
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx(monster,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(monster,EM_SetModeType_Move, false)--移動
	SetModeEx(monster,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--搜尋敵人
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	AddToPartition( monster, RoomID)
end
function bk_war1_car0()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local open = ReadRoleValue(start,EM_RoleValue_register1)----讀取控制器
	local cd1 = 0
	local cd2 = 0
	--local car1 = CreateObjByFlag( 104765 , 780812 , 10 , 1 )
	--SetModeEx(car1,EM_SetModeType_Show, true)
	--SetModeEx(car1,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
	--SetModeEx(car1,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
	--SetModeEx(car1,EM_SetModeType_NotShowHPMP, true)--不顯示血條
	--SetModeEx(car1,EM_SetModeType_Strikback, false)--反擊
	--SetModeEx(car1,EM_SetModeType_Move, true)--移動
	--SetModeEx(car1,EM_SetModeType_Fight, true)--可砍殺攻擊
	--SetModeEx(car1,EM_SetModeType_Searchenemy, false)--搜尋敵人
	--WriteRoleValue(car1,EM_RoleValue_PID,ownerid())
--	AddToPartition( car1, RoomID)
--	SetPlot( car1 , "dead" , "bk_war1_car1_dead" , 0 )
	--AddBuff( car1 ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	--local car2 = CreateObjByFlag( 104765 , 780812 , 11 , 1 )
	--SetModeEx(car2,EM_SetModeType_Show, true)
	--SetModeEx(car2,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
	--SetModeEx(car2,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
	--SetModeEx(car2,EM_SetModeType_NotShowHPMP, true)--不顯示血條
	--SetModeEx(car2,EM_SetModeType_Strikback,false )--反擊
--	SetModeEx(car2,EM_SetModeType_Move, true)--移動
	--SetModeEx(car2,EM_SetModeType_Fight, true)--可砍殺攻擊
	--SetModeEx(car2,EM_SetModeType_Searchenemy, false)--搜尋敵人
	--WriteRoleValue(car2,EM_RoleValue_PID,ownerid())
	--AddToPartition( car2, RoomID)
--	SetPlot( car2 , "dead" , "bk_war1_car2_dead" , 0 )
--	AddBuff( car2 ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	while 1 do 
		sleep(10)
		open = ReadRoleValue(start,EM_RoleValue_register1)----讀取控制器
		cd1=ReadRoleValue(OwnerID(),EM_RoleValue_register2)----讀取控制器
		cd2=ReadRoleValue(OwnerID(),EM_RoleValue_register3)----讀取控制器
		if open == 0 then 
			--if cd1 == 1 then 
			--	car1 = CreateObjByFlag( 104765 , 780812 , 10 , 1 )
			--	SetModeEx(car1,EM_SetModeType_Show, true)
			--	SetModeEx(car1,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			--	SetModeEx(car1,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			--	SetModeEx(car1,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			---	SetModeEx(car1,EM_SetModeType_Strikback, false)--反擊
			---	SetModeEx(car1,EM_SetModeType_Move, true)--移動
			--	SetModeEx(car1,EM_SetModeType_Fight, true)--可砍殺攻擊
			--	SetModeEx(car1,EM_SetModeType_Searchenemy, false)--搜尋敵人
			---	AddToPartition( car1, RoomID)
			--	WriteRoleValue(car1,EM_RoleValue_PID,ownerid())
			--	SetPlot( car1 , "dead" , "bk_war1_car1_dead" , 0 )
			--	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)
			--	AddBuff( car1 ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			--end
		--	if cd2 == 1 then 
			--	car2 = CreateObjByFlag( 104765 , 780812 , 11 , 1 )
			--	SetModeEx(car2,EM_SetModeType_Show, true)
			---	SetModeEx(car2,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			---	SetModeEx(car2,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			--	SetModeEx(car2,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			---	SetModeEx(car2,EM_SetModeType_Strikback, false)--反擊
			--	SetModeEx(car2,EM_SetModeType_Move, true)--移動
			--[[	SetModeEx(car2,EM_SetModeType_Fight, true)--可砍殺攻擊
				SetModeEx(car2,EM_SetModeType_Searchenemy, false)--搜尋敵人
				AddToPartition( car2, RoomID)
				WriteRoleValue(car2,EM_RoleValue_PID,ownerid())
				SetPlot( car2 , "dead" , "bk_war1_car2_dead" , 0 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)]]--
			--	AddBuff( car2 ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			--end		
		elseif open == 1 then 		
		end	
	end
	
end
function bk_war1_car1_dead()
	local carcount = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	WriteRoleValue(carcount,EM_RoleValue_register2,1)
end
function bk_war1_car2_dead()
	local carcount = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	WriteRoleValue(carcount,EM_RoleValue_register3,1)
end
function bk_war1_d12_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local dd = ReadRoleValue(start,EM_RoleValue_register9)
	if dd == 0 then 
	dd = dd +1 
	WriteRoleValue(start,EM_RoleValue_register9,dd)
	elseif dd == 1 then 
		
	end
end
function bk_war1_d01_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local dd = ReadRoleValue(start,EM_RoleValue_register9)
	if dd == 0 then 
	dd = dd +1 
	WriteRoleValue(start,EM_RoleValue_register9,dd)
	elseif dd == 1 then 
		
	end
end
function bk_WAR1_TIMEOVER()
	local ZoneID= ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)-----------------
	if ZoneID ~= 190 then 
		ClockClose( OwnerID() )
	end
end
function bk_war1_tg1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local player= ownerid()
end
function bk_war1_117111()  ----------------------------------npc 使用者
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	LoadQuestOption( OwnerID() )  --------得取談話內容
	---AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_01", 0 )
end
function bk_war1_117111_01()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----讀取控制器
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_car_car",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------時間結束告訴王該結束刪除了
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------距離過遠
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_car_car()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local tx=0-------------記錄這個暫時器的時間
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------讀取產生!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------檢查這個東西的物品數量
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObj( 104765 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			SetModeEx(car,EM_SetModeType_Strikback, false)--反擊
			SetModeEx(car,EM_SetModeType_Move, true)--移動
			SetModeEx(car,EM_SetModeType_Fight, true)--可砍殺攻擊
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--搜尋敵人
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------時間結束告訴王該結束刪除了	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		---say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------時間結束告訴王該結束刪除了
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------距離過遠
		end
	elseif carm >= 20 then 
		ScriptMessage( play , play , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------距離過遠
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------時間結束告訴王該結束刪除了
end
function bk_war1_car_caheck()
local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------  
local PlayerIsSit =  CheckFlag( OwnerID()  , 543769 )--玩家是否在載具上
local x=0
	x= LuaFunc_SearchNPCbyOrgID( OwnerID() , 105075, 100 , 0)
	----saY(ownerid(),"xxx="..x)	
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == 190 then 
		if x ~= -1 then 
			if (PlayerIsSit == true) then --玩家在載具上
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) -- 載具上無法使用
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) 
				return false
			else
				return true
			end
		elseif x == -1 then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SSC_WAR1_104765_1]", 0 ) --必須在傳送門才可以開啟
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WAR1_104765_1]", 0 ) 
			return false
		end
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) ~= 190 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM )
		return false
	end	
end
function bk_war1_car_use()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------  
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local car = CreateObj( 104765 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	SetModeEx(car,EM_SetModeType_Show, true)
	SetModeEx(car,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
	SetModeEx(car,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--不顯示血條
	SetModeEx(car,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(car,EM_SetModeType_Move, true)--移動
	SetModeEx(car,EM_SetModeType_Fight, true)--可砍殺攻擊
	SetModeEx(car,EM_SetModeType_Searchenemy, false)--搜尋敵人
	AddToPartition( car, RoomID)
	AddBuff( car ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
end
function bk_war_boss1_open()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------  
	local d13 = CreateObjByFlag(102678,780812,7,1)----野外boss開場就出來
	SetModeEx( d13 , EM_SetModeType_Mark, false)
	SetModeEx( d13 , EM_SetModeType_HideName, false)
	SetModeEx( d13 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( d13 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( d13 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( d13 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( d13 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( d13 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( d13 , EM_SetModeType_Searchenemy, false)
	SetModeEx( d13 , EM_SetModeType_Show, false)
	AddToPartition( d13 , RoomID )
	SetPlot( d13 , "Collision" , "bk_war1_door13_out" , 0 )
	
	local d14 = CreateObjByFlag(102678,780812,8,1)----野外boss開場就出來
	SetModeEx( d14 , EM_SetModeType_Mark, false)
	SetModeEx( d14 , EM_SetModeType_HideName, false)
	SetModeEx( d14 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( d14 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( d14 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( d14 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( d14 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( d14 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( d14 , EM_SetModeType_Searchenemy, false)
	SetModeEx( d14 , EM_SetModeType_Show, false)
	AddToPartition( d14 , RoomID )
	SetPlot( d14 , "Collision" , "bk_war1_door13_enter" , 0 )
	
	local d15=CreateObj( 112224 ,-6510.8, 112 , -2967.6, 334 , 1)
---	d15 = CreateObjByFlag(112224,780812,7,1)----野外boss開場就出來
	SetModeEx( d15 , EM_SetModeType_Mark, false)
	SetModeEx( d15 , EM_SetModeType_HideName, true)
	SetModeEx( d15 , EM_SetModeType_Gravity, false)
	SetModeEx( d15 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( d15 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( d15 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( d15 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( d15 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( d15 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( d15 , EM_SetModeType_Searchenemy, false)
	SetModeEx( d15 , EM_SetModeType_Show, true)
	AddToPartition( d15 , RoomID )
	
	local d16=CreateObj( 112224 ,2169.3, 10 , -2595.8, 207 , 1)
---	d16 = CreateObjByFlag(112224,780812,8,1)----野外boss開場就出來
	SetModeEx( d16 , EM_SetModeType_Mark, false)
	SetModeEx( d16 , EM_SetModeType_HideName, true)
	SetModeEx( d16 , EM_SetModeType_Gravity, false)
	SetModeEx( d16 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( d16 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( d16 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( d16 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( d16 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( d16 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( d16 , EM_SetModeType_Searchenemy, false)
	SetModeEx( d16 , EM_SetModeType_Show, true)
	AddToPartition( d16 , RoomID )
end
function bk_war1_car_dead1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	local dd = ReadRoleValue(start,EM_RoleValue_register8)
	---saY(ownerid(),"xxxxx="..dd)
	dd = dd -1 
	WriteRoleValue(start,EM_RoleValue_register8,dd)
end
function bk_war1_117111_m31()  ----------------------------------npc 使用者
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	LoadQuestOption( OwnerID() )  --------得取談話內容
	------------AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m311", 0 )
end
function bk_war1_117111_m311()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----讀取控制器
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo31",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------時間結束告訴王該結束刪除了
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------距離過遠
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo31()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local tx=0-------------記錄這個暫時器的時間
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------讀取產生!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------檢查這個東西的物品數量
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,18,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			SetModeEx(car,EM_SetModeType_Strikback, false)--反擊
			SetModeEx(car,EM_SetModeType_Move, true)--移動
			SetModeEx(car,EM_SetModeType_Fight, true)--可砍殺攻擊
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--搜尋敵人
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------時間結束告訴王該結束刪除了	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
			---say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------時間結束告訴王該結束刪除了
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------距離過遠
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------距離過遠
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------時間結束告訴王該結束刪除了
end
function bk_war1_117111_m32()  ----------------------------------npc 使用者
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	LoadQuestOption( OwnerID() )  --------得取談話內容
	----------------AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m321", 0 )
end
function bk_war1_117111_m321()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----讀取控制器
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo32",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------時間結束告訴王該結束刪除了
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------距離過遠
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo32()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local tx=0-------------記錄這個暫時器的時間
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------讀取產生!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------檢查這個東西的物品數量
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,19,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			SetModeEx(car,EM_SetModeType_Strikback, false)--反擊
			SetModeEx(car,EM_SetModeType_Move, true)--移動
			SetModeEx(car,EM_SetModeType_Fight, true)--可砍殺攻擊
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--搜尋敵人
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------時間結束告訴王該結束刪除了	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		---	say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------時間結束告訴王該結束刪除了
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------距離過遠
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------距離過遠
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------時間結束告訴王該結束刪除了
end
function bk_war1_117111_m41()  ----------------------------------npc 使用者
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	LoadQuestOption( OwnerID() )  --------得取談話內容
	----AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m411", 0 )
end
function bk_war1_117111_m411()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----讀取控制器
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo41",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------時間結束告訴王該結束刪除了
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------距離過遠
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo41()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local tx=0-------------記錄這個暫時器的時間
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------讀取產生!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------檢查這個東西的物品數量
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,20,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			SetModeEx(car,EM_SetModeType_Strikback, false)--反擊
			SetModeEx(car,EM_SetModeType_Move, true)--移動
			SetModeEx(car,EM_SetModeType_Fight, true)--可砍殺攻擊
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--搜尋敵人
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------時間結束告訴王該結束刪除了	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
			----say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------時間結束告訴王該結束刪除了
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------距離過遠
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------距離過遠
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------時間結束告訴王該結束刪除了
end
function bk_war1_117111_m42()  ----------------------------------npc 使用者
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	LoadQuestOption( OwnerID() )  --------得取談話內容
	-----AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m421", 0 )
end
function bk_war1_117111_m421()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----讀取控制器
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo42",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------時間結束告訴王該結束刪除了
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------距離過遠
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo42()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local tx=0-------------記錄這個暫時器的時間
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------讀取產生!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------檢查這個東西的物品數量
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,21,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			SetModeEx(car,EM_SetModeType_Strikback, false)--反擊
			SetModeEx(car,EM_SetModeType_Move, true)--移動
			SetModeEx(car,EM_SetModeType_Fight, true)--可砍殺攻擊
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--搜尋敵人
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------時間結束告訴王該結束刪除了	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		---	say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------時間結束告訴王該結束刪除了
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------距離過遠
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------距離過遠
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------時間結束告訴王該結束刪除了
end
function bk_war1_117111_m51()  ----------------------------------npc 使用者
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	LoadQuestOption( OwnerID() )  --------得取談話內容
	------------AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m511", 0 )
end
function bk_war1_117111_m511()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----讀取控制器
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo51",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------時間結束告訴王該結束刪除了
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------距離過遠
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo51()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local tx=0-------------記錄這個暫時器的時間
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------讀取產生!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------檢查這個東西的物品數量
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,22,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			SetModeEx(car,EM_SetModeType_Strikback, false)--反擊
			SetModeEx(car,EM_SetModeType_Move, true)--移動
			SetModeEx(car,EM_SetModeType_Fight, true)--可砍殺攻擊
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--搜尋敵人
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------時間結束告訴王該結束刪除了	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		---	say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------時間結束告訴王該結束刪除了
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------距離過遠
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------距離過遠
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------時間結束告訴王該結束刪除了
end
function bk_war1_117111_m52()  ----------------------------------npc 使用者
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	LoadQuestOption( OwnerID() )  --------得取談話內容
	-------------AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m521", 0 )
end
function bk_war1_117111_m521()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----讀取控制器
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo52",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------時間結束告訴王該結束刪除了
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------距離過遠
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo52()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----讀取控制器
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----讀取控制器
	local tx=0-------------記錄這個暫時器的時間
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------讀取產生!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------檢查這個東西的物品數量
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,23,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--可標記/點選(可以讓玩家點選)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC 或物件頭上的名稱是否顯示
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--不顯示血條
			SetModeEx(car,EM_SetModeType_Strikback, false)--反擊
			SetModeEx(car,EM_SetModeType_Move, true)--移動
			SetModeEx(car,EM_SetModeType_Fight, true)--可砍殺攻擊
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--搜尋敵人
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------時間結束告訴王該結束刪除了	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		----say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------時間結束告訴王該結束刪除了
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------距離過遠
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------距離過遠
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------時間結束告訴王該結束刪除了
end

