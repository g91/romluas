--============================================--
-- Z16委託任務				 	--
--============================================--

function Lua_422939() --任務:灰煙的白芝 取得:白芝
	SetPlot( OwnerID(), "touch", "Lua_422939_run", 20 )
end

function Lua_422939_run()
	BeginPlot( TargetID(), "Lua_422939_do", 0 )
end

function Lua_422939_do()
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	if CheckQuest( T_ID, 422939 , 0 ) == true then
		if CountBodyItem ( T_ID,  207167 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207167, 1, 150 ) -- 玩家 給予物品 數量 時間(time = 0  則為script產物件     time > 0 則time為等待重生時間 )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207167 .."]]", 0 ) --XXX數量已達上限。
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --沒有符合的委託任務
	end
end
---------------------------------------------------------------------

function lua_207345_give() --世界王 瞎子霍克姆  取得古老的金幣
	giveBodyItem( OwnerID(), 207166, rand(30)+20 )
end

---------------------------------------------------------------------


function Lua_423215() --任務:主食是卡多芋 取得:卡多芋
	SetPlot( OwnerID(),"touch","Lua_423215_do",30 )
end

function Lua_423215_do()
	BeginPlot( TargetID(), "Lua_423215_Get", 0 )
end

function Lua_423215_create()	
	local FlagObjID = 780625 --旗幟物件編號 --780625
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量43	
	local Obj = 115020 --種植物件編號
	local ObjNum = math.floor( FlagNum / 4 )   --種植物件數量
	local resetTime = 150 --重製時間(秒)
	local Range = 20
	local Gravity = true --重力 
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end

function Lua_423215_Get()	
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	if CheckQuest( T_ID, 423215 , 0 ) == true then
		if CountBodyItem ( T_ID,  207168 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207168, 1, 0 ) -- 玩家 給予物品 數量 時間(time = 0  則為script產物件     time > 0 則time為等待重生時間 )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207168 .."]]", 0 ) --XXX數量已達上限。
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --沒有符合的委託任務
	end
end

--------------------------------------------------------------------

function Lua_422943() --任務:散落的木材 取得:灰煙木材
	SetPlot( OwnerID(),"touch","Lua_422943_run",20 )
end

function Lua_422943_run()
	BeginPlot( TargetID(), "Lua_422943_do", 0 )
end

function Lua_422943_do()
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	if CheckQuest( T_ID, 422943 , 0 ) == true then
		if CountBodyItem ( T_ID,  207170 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207170, 1, 150 ) -- 玩家 給予物品 數量 時間(time = 0  則為script產物件     time > 0 則time為等待重生時間 )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207170 .."]]", 0 ) --XXX數量已達上限。
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --沒有符合的委託任務
	end
end
--------------------------------------------------------------------

function Lua_423217() --任務:消失的王國 取得:古老工藝品
	SetPlot( OwnerID(),"touch","Lua_423217_do",20 )
end

function Lua_423217_do()
	BeginPlot( TargetID(), "Lua_423217_Get", 0 )
end

function Lua_423217_create()	
	local FlagObjID = 780659 --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量	
	local Obj = 115047 --種植物件編號
	local ObjNum = math.floor( FlagNum / 4 )   --種植物件數量
	local resetTime = 150 --重製時間(秒)
	local Range = 10
	local Gravity = true --重力 	

	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end

function Lua_423217_Get()
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	if CheckQuest( T_ID, 423217, 0 ) == true then
		if CountBodyItem ( T_ID,  207187 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207187, 1, 0 ) -- 玩家 給予物品 數量 時間(time = 0  則為script產物件     time > 0 則time為等待重生時間 )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207187 .."]]", 0 ) --XXX數量已達上限。
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --沒有符合的委託任務
	end
end

--------------------------------------------------------------------

function Lua_422935() --任務:佳布麗No.5的配方 取得:卻普瑞香草
	SetPlot( OwnerID(), "touch", "Lua_422935_run", 20 )
	SetModeEx( OwnerID(),EM_SetModeType_Move, true ) 
	SetModeEx( OwnerID(),EM_SetModeType_Show,false) 
	SetModeEx( OwnerID(), EM_SetModeType_Mark , false )				-- 標記
end

function Lua_422935_1()
	local x= 0
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115023	then
			x= x+1
		end
	end
	if	x > 3	then
		DelFromPartition(OwnerID())
		ReSetNPCInfo( OwnerID() )
		AddToPartition(OwnerID(),0)
		return
	end
	SetModeEx( OwnerID(),EM_SetModeType_Move, false ) 
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true )				-- 標記
	SetModeEx(OwnerID(),EM_SetModeType_Show,true) 
end

function Lua_422935_run()
	BeginPlot( TargetID(), "Lua_422935_do", 0 )
end

function Lua_422935_do()
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	if CheckQuest( T_ID, 422935, 0 ) == true then
		if CountBodyItem ( T_ID,  207158 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207158, 1, 150 ) -- 玩家 給予物品 數量 時間(time = 0  則為script產物件     time > 0 則time為等待重生時間 )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207158 .."]]", 0 ) --XXX數量已達上限。
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --沒有符合的委託任務
	end
end
--------------------------------------------------------------------

function Lua_423218() --任務:釣魚 取得:蘆魚
	SetPlot( OwnerID(),"touch","Lua_423218_run", 150 )
	local x = ReadRoleValue( OwnerID(), EM_RoleValue_X )+ rand(10)-5
	local y = ReadRoleValue( OwnerID(), EM_RoleValue_Y ) + rand(5)+5
	local z = ReadRoleValue( OwnerID(), EM_RoleValue_Z )+ rand(10)-5
	MoveDirect( OwnerID(), x, y, z)
end

function Lua_423218_create()	
	local FlagObjID = 780658 --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量	
	local Obj = 115044 --種植物件編號
	local ObjNum = math.floor( FlagNum / 4 )   --種植物件數量
	local resetTime = 150 --重製時間(秒)
	local Range = 20
	local Gravity = false --重力 
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end

function Lua_423218_run()
	BeginPlot( TargetID(), "Lua_423218_do", 0 )
end

function Lua_423218_do()
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	local require = 207192	 --魚竿
	local item = 207164  	-- 蘆魚
	local num = 1 		--數量
	cancelBuff( T_ID , 506709 ) --清除能否釣魚buff
	CastSpell( T_ID, T_ID, 495596 ) --重上能否釣魚buff
	sleep(5)
	if CountBodyItem( T_ID, require ) > 0 and CheckQuest( T_ID, 423218 , 0 ) == true then	--檢查有無魚竿
		if CheckBuff( T_ID, 506709 ) == true then --檢查是否在游泳
			if CountBodyItem( T_ID, item ) < 50 then
				if GetDistance( O_ID, T_ID ) > 40 then --檢查距離是否過近					
					if ReadRoleValue( O_ID, EM_RoleValue_Register3 ) == 1 then
						ScriptMessage( O_ID, T_ID, 1, "[SYS_AUCTION_WAIT_NEXT]", 0 )	--忙碌中，請稍候再試。
					else 
						WriteRoleValue( O_ID, EM_RoleValue_Register3, 1 )
						BeginCastBar( T_ID, "[SC_423218]", 50 , ruFUSION_ACTORSTATE_FISHING_CAST, ruFUSION_ACTORSTATE_FISHING_REEL, 0 )--釣魚			
						AttachCastMotionTool( T_ID, 212402 ); --CastingBar觸發成功，置換武器為魚竿
						while true do
							sleep(5)
							local CastBarStatus = CheckCastBar( T_ID )
							if ( CastBarStatus > 0) then
								GiveBodyItem( T_ID, item, num )	
								BeginPlot( O_ID, "ks_CreateObj_reset", 0 )	
								EndCastBar( T_ID, CastBarStatus )
								break
							elseif ( CastBarStatus < 0 ) then 
								WriteRoleValue( O_ID, EM_RoleValue_Register3, 0 )			
								EndCastBar( T_ID, CastBarStatus )
								break
							end					
						end
					end			
				else
					ScriptMessage( O_ID, T_ID, 1, "[WARRING_TARGET_TOO_CLOSE]",0) --距離目標太近
				end
			else
				ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" ..item .."]]", 0 ) --XXX數量已達上限。
			end			
		end
	else
		ScriptMessage( O_ID, T_ID,1,"[SC_SQUATGETITEM][$SETVAR1=" .."["..require.."]] [SC_Z16_OR] [SC_Z16_REQUIRE]",0) --你身上沒有XXX 或者 沒有符合的委託任務
	end
end

--------------------------------------------------------------------

function Lua_423223() --任務:亡者的救贖 取得:亡者的微笑 需求:火把
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_DEAD)	
end

function Lua_423223_start()
	BeginPlot( TargetID(), "Lua_423223_do", 0 )	
	return 1
end

function Lua_423223_save()
	DW_QietKillOne( 0, 103851 ) 
end

function Lua_423223_do()
	local target = TargetID()	 --玩家
	local owner = OwnerID()	 --屍體
	local require = 207189	 --火把
	local objType
	local obj = { }
	obj[115509] = { [0] = 115050; [1] =  103852 }--人類
	obj[115510] = { [0] = 115493; [1] =  103916 }--人馬
	obj[115512] = { [0] = 115491; [1] =  103918 }--犬人
	obj[115515] = { [0] = 115492; [1] =  103917 }--獅人
	obj[115516] = { [0] = 115497; [1] =  103923 }--豹人

		 
	if CountBodyItem ( target, require ) > 0 then
		local fire = LuaFunc_CreateObjByObj ( 115049, owner )
		SetModeEx( fire , EM_SetModeType_Mark	, false )
		sleep(10)
		objType = ReadRoleValue( owner, EM_RoleValue_OrgID )
		local rnd = rand(2)
		local ghost = LuaFunc_CreateObjByObj( obj[objType][rnd], owner )
		Sleep(5)
		MoveToFlagEnabled ( ghost, false )
		AdjustFaceDir( ghost, target, 0 )		
		sleep(10)
		if rnd == 0 then
			tell( target, ghost, "[SC_422981_50]")
			BeginPlot( target, "Lua_423223_save", 0 )
			sleep(20)
			DelObj( ghost )
		elseif rnd == 1 then
			BeginPlot( ghost, "LuaS_Discowood_CheckPeace", 0 ) --8.5秒內未進入戰鬥狀態就會消失
		end
		DelObj( fire )
		CallPlot( owner, "LuaFunc_ResetObj", owner )
	else
		ScriptMessage( owner, target, 1, "[SC_SQUATGETITEM][$SETVAR1=" .."["..require.."]".."]",0) --你身上沒有XXX
	end
end
--------------------------------------------------------------------

function Lua_423221() --拯救受難者
	LoadQuestOption(OwnerID())
	AdjustFaceDir( TargetID(), OwnerID(), 0 ) --使自己面向目標
	if CountBodyItem ( OwnerID(), 207172 ) > 0 and ReadRoleValue( TargetID(), EM_RoleValue_PID ) ==0 then --染血的鑰匙
		AddSpeakOption( OwnerID(),TargetID(),"[SC_423221_0]","Lua_423221_key",0) --把鑰匙給他
	end	
end

function Lua_423221_create()	
	local FlagObjID = 780612 --旗幟物件編號
	local Obj = {	115046,
			115166,
			115500,
			115502,
			115503,
			115505	} --種植物件編號

	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量	
	local ObjNum = math.floor( FlagNum / 3 )  +2 --種植物件數量
	local resetTime = 150 --重製時間(秒)
	local Range = 20
	local Gravity = true --重力 
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end

function Lua_423221_key()
	DisableQuest( TargetID() , true)
	WriteRoleValue( TargetID(), EM_RoleValue_PID, 1 )
	SetSpeakDetail( OwnerID(), "[SC_423221_1" ..rand(4) .."]") -- 隨機回覆 
	BeginPlot( TargetID(),  "Lua_423221_do", 0 )
end

function Lua_423221_do()
	Sleep(20)
	DW_QietKillOne( 1, 103855 ) 
	DelBodyItem ( TargetID(), 207172, 1 ) 
	CloseSpeak( TargetID() )
	BeginPlot( OwnerID(), "ks_CreateObj_reset", 0 )
end


---------------------------------------------------------------------

