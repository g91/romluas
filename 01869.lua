--廠商共用活動_寶箱

-- 怪物死亡後跑的 寶箱出現劇情

--寶箱1
function Lua_mika_monstersum_lv10trea()
	local Treasure = {}
	Treasure  = Lua_Davis_BornByMultilateral( 114989 , 10 , 50 )	-- 物件ID、邊形數量、半徑長
end

--寶箱2
function Lua_mika_monstersum_lv20trea()
	local Treasure = {}
	Treasure  = Lua_Davis_BornByMultilateral( 114990 , 10 , 50 )	-- 物件ID、邊形數量、半徑長
end

--寶箱3
function Lua_mika_monstersum_lv30trea()
	local Treasure = {}
	Treasure  = Lua_Davis_BornByMultilateral( 114991 , 10 , 50 )	-- 物件ID、邊形數量、半徑長
end



--寶箱開啟劇情

--等級10寶箱
Function  Lua_mika_monstersum_treas10_1() --掛在物件產出SCRIPT
	SetPlot( OwnerID() , "touch" , "Lua_mika_monstersum_treas10_2" , 30 );
end

function Lua_mika_monstersum_treas10_2()
--	Say(OwnerID(), "OwnerID 1") --玩家			
--	Say(TargetID(), "TargetID 1") --寶箱

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- 防止複數玩家於同時開啟寶箱，都能得到的問題。
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--忙碌中，請稍候再試。
			return										--
		end											--
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )												--					--
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
					--	Say(TargetID(), " treasure 1")
						GiveBodyItem( OwnerID() , 725152 , 1 )
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						DelObj(TargetID())  
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
						WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
						SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas10_2",50 )
					end	
				end
			elseif ( result == "DAME" ) then
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- 防止複數玩家於同時開啟寶箱，都能得到的問題。 
				SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas10_2",50 )
			end
		end

end


--等級20寶箱
Function  Lua_mika_monstersum_treas20_1() --掛在物件產出SCRIPT
	SetPlot( OwnerID() , "touch" , "Lua_mika_monstersum_treas20_2" , 30 );
end

function Lua_mika_monstersum_treas20_2()
--	Say(OwnerID(), "OwnerID 1") --玩家			
--	Say(TargetID(), "TargetID 1") --寶箱

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- 防止複數玩家於同時開啟寶箱，都能得到的問題。
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--忙碌中，請稍候再試。
			return										--
		end											--
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )												--					--
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
					--	Say(TargetID(), " treasure 2")
						GiveBodyItem( OwnerID() , 725153 , 1 )
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						DelObj(TargetID())  
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
						WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
						SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas20_2",50 )
					end	
				end
			elseif ( result == "DAME" ) then
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- 防止複數玩家於同時開啟寶箱，都能得到的問題。 
				SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas20_2",50 )
			end
		end
end

--寶箱 3
Function  Lua_mika_monstersum_treas30_1() --掛在物件產出SCRIPT
	SetPlot( OwnerID() , "touch" , "Lua_mika_monstersum_treas30_2" , 30 );
end

function Lua_mika_monstersum_treas30_2()
--	Say(OwnerID(), "OwnerID 1") --玩家			
--	Say(TargetID(), "TargetID 1") --寶箱

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- 防止複數玩家於同時開啟寶箱，都能得到的問題。
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--忙碌中，請稍候再試。
			return										--
		end											--
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )												--					--
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
					--	Say(TargetID(), " treasure 3")
						GiveBodyItem( OwnerID() , 725154 , 1 )
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						DelObj(TargetID())  
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
						WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
						SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas30_2",50 )
					end	
				end
			elseif ( result == "DAME" ) then
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- 防止複數玩家於同時開啟寶箱，都能得到的問題。 
				SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas30_2",50 )
			end
		end
end