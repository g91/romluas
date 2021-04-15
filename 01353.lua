

function LuaS_MusicFestival_Phamtom()	--計時器
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Step = 0
	local Array = {}
	local Xtime = 0
	local Flag = 780304		--旗子編號
	local MonsterID = 0
	local BornString
	local Obj = Role:new( OwnerID() )
	local Phamtom = 0
	local MonsterID = 0
	local LittlePhamtom
	local Angel = 0
	local Box = {}
------------------------------------------------
	while true do
----------------------------------------------時間處理
		if Step == 0 then
			local NPCBOSS = "dead"
			local Obj
			local List = SearchRangeNPC( OwnerID() , 500 );
			local Owner = Role:new( OwnerID() );
			for i = 0 , table.getn(List)-1 do
				Obj = Role:New( List [i] )
				if Obj:OrgID() == 101844 then
					NPCBOSS = "life"
				end
			end
			if NPCBOSS == "dead" then 
				Phamtom  = CreateObjByFlag( 101844, 780330, 0, 1)        
				SetModeEx( Phamtom   , EM_SetModeType_Strikback, true )--反擊
				SetModeEx( Phamtom   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Phamtom   , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( Phamtom   , EM_SetModeType_Mark, true )--標記
				SetModeEx( Phamtom   , EM_SetModeType_Move, true )--移動
				SetModeEx( Phamtom   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Phamtom   , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Phamtom   , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Phamtom   , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Phamtom   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Phamtom  , 0)  
				Step = 1
			else
				Step = 1
			end
		elseif Step == 1 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				ScriptMessage( Phamtom , 0 , 1 , "[SC_DAN_101844_5]", C_SYSTEM ) --是誰膽敢打擾我！休想打我從他身上趕走！接招吧！
			    	Say( Phamtom , "[SC_DAN_101844_5]")  				 --由NPC發送訊息
				MonsterID = 101843
				LittlePhamtom = Lua_MusicFestival_BornPhamtom(MonsterID)
				Step = 2
			else
				Step = 99
			end
		elseif Step == 2 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				--檢查剩幾隻怪
				MonsterID = 101843
				local Survivor = 0
				local T2Obj
				local T2Count = SetSearchRangeInfo( OwnerID() , 400 )
				for i = 1 , T2Count , 1 do
					local T2ID = GetSearchResult()
					T2Obj = Role:New( T2ID )
					if T2Obj:RoomID() == RoomID and T2Obj ~= OwnerID() then
						local FlagOrgID = T2Obj:OrgID()
						if (FlagOrgID == MonsterID) then  --
							--DebugMsg( 0, RoomID ,"**Survivor1 Add")
							Survivor = Survivor + 1
						end
					end
				end
				if Survivor == 0 then
					Step = 3
				end
			else
				Step = 99				
			end
		elseif Step == 3 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				ScriptMessage( Phamtom , 0 , 1 , "[SC_DAN_101844_5]", C_SYSTEM ) --是誰膽敢打擾我！休想打我從他身上趕走！接招吧！
			    	Say( Phamtom , "[SC_DAN_101844_5]")  				 --由NPC發送訊息
				MonsterID = 101994
				LittlePhamtom = Lua_MusicFestival_BornPhamtom(MonsterID)
				Step = 4
			else
				Step = 99
			end
		elseif Step == 4 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				--檢查剩幾隻怪
				MonsterID = 101994
				local Survivor = 0
				local T2Obj
				local T2Count = SetSearchRangeInfo( OwnerID() , 400 )
				for i = 1 , T2Count , 1 do
					local T2ID = GetSearchResult()
					T2Obj = Role:New( T2ID )
					if T2Obj:RoomID() == RoomID and T2Obj ~= OwnerID() then
						local FlagOrgID = T2Obj:OrgID()
						if (FlagOrgID == MonsterID) then  --
							--DebugMsg( 0, RoomID ,"**Survivor1 Add")
							Survivor = Survivor + 1
						end
					end
				end
				if Survivor == 0 then
					Step = 5
				end
			else
				Step = 99				
			end
		elseif Step == 5 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				ScriptMessage( Phamtom , 0 , 1 , "[SC_DAN_101844_5]", C_SYSTEM ) --是誰膽敢打擾我！休想打我從他身上趕走！接招吧！
			    	Say( Phamtom , "[SC_DAN_101844_5]")  				 --由NPC發送訊息
				MonsterID = 101995
				LittlePhamtom = Lua_MusicFestival_BornPhamtom(MonsterID)
				--DeadPlot = LuaDan_101844_WhokillPhamtom ()
				--SetPlot( LittlePhamtom , "dead" , "LuaDan_101844_WhokillPhamtom" , 0 )
				Step = 6
			else
				Step = 99
			end
		elseif Step == 6 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				--檢查剩幾隻怪
				MonsterID = 101995
				local Survivor = 0
				local T2Obj
				local T2Count = SetSearchRangeInfo( OwnerID() , 400 )
				for i = 1 , T2Count , 1 do
					local T2ID = GetSearchResult()
					T2Obj = Role:New( T2ID )
					if T2Obj:RoomID() == RoomID and T2Obj ~= OwnerID() then
						local FlagOrgID = T2Obj:OrgID()
						if (FlagOrgID == MonsterID) then  --
							--DebugMsg( 0, RoomID ,"**Survivor1 Add")
							Survivor = Survivor + 1
						end
					end
				end
				if Survivor == 0 then
					Step = 7
				end
			else
				Step = 99				
			end
		elseif Step == 7 then
			local Obj = Role:new( Phamtom )
			DelObj(Phamtom)
			MonsterID = 102012 
	--		local angenpc = LuaFunc_SearchNPCbyOrgID( TargetID() , 102012, 3000 , 0)       --遺跡大門
			Angel = CreateObjByFlag( MonsterID, 780330, 0, 1)  --生出天使
			SetModeEx( Angel   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Angel   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Angel   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Angel   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Angel   , EM_SetModeType_Move, false )--移動
			SetModeEx( Angel   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Angel   , EM_SetModeType_HideName, true )--名稱
			SetModeEx( Angel   , EM_SetModeType_ShowRoleHead, true )--頭像框
			SetModeEx( Angel   , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( Angel   , EM_SetModeType_Show , true ) --不顯示
			AddToPartition(Angel,0)
			Say( Angel , "[SC_DAN_101844_6]")  	--感謝你將我從這些惡魔手上救回來！謝謝你帶來茱麗雅音樂旋律！讓我再度恢復開朗的心情！
			BeginPlot( OwnerID(), "Lua_MusicFestival_BornTresure", 0 )
			Xtime = 0
			Step = 8
		elseif Step == 8 then
			if Xtime <= 300 then
			--	ScriptMessage( Phamtom , 0 , 1 , "[SC_DAN_101844_7]", C_SYSTEM ) --是誰膽敢打擾我！休想打我從他身上趕走！接招吧！
			--	Say( Phamtom , "[SC_DAN_101844_7]")  				 --由NPC發送訊息
				sleep(1200)  --米佳修改 原為sleep(400)
				DelObj(Angel)
				sleep(300)				
				Step = 0
			end
		elseif Step == 99 then
			local T2Obj = SearchRangeNPC(OwnerID() , 1000)
			for i = 1 , table.getn( T2Obj ) do
				local ObjOrgID = ReadRoleValue( T2Obj[i] , EM_RoleValue_OrgID )
				local ObjRoomID = ReadRoleValue(T2Obj[i] , EM_RoleValue_RoomID)
				if ObjRoomID == RoomID then
					if (ObjOrgID == 101843) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101994) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101995) then
						DelObj(T2Obj[i])
					end
				end
			end
			Step = 0
		end
		--DebugMsg( 0, RoomID ,"Xtime = "..Xtime)
		Xtime = Xtime + 1
		sleep(10)
	end
end
--------------------------------------------------------------------------------------------------
function Lua_MusicFestival_BornTresure()
	local Box = {}
	for i = 0, 4 do 
		Box[i] = CreateObjByFlag( 114320, 780331, i, 1)  
		SetModeEx( Box[i]  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Box[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Box[i]  , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Box[i]  , EM_SetModeType_Mark, true )--標記
		SetModeEx( Box[i]   , EM_SetModeType_Move, false )--移動
		SetModeEx( Box[i]  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Box[i]  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Box[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( Box[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Box[i]   , EM_SetModeType_Show , true ) --顯示
		AddToPartition( Box[i]  , 0)  
		SetPlot(Box[i],"touch","LuaDan_101844_treasure",30)
		BeginPlot( Box[i], "Lua_MusicFestival_boxdie", 1200 )
	end
end
--------------------------------------------------------------------------------------------------
function Lua_MusicFestival_boxdie() --寶箱出現後2分鐘消失
	--Say(OwnerID(), "box die")
	sleep(10)
	DelObj(OwnerID())
end	

function Lua_MusicFestival_BornPhamtom(MonsterID)
	local LittlePhamtom = {}
	for i = 1, 5 do 
		LittlePhamtom[i] = CreateObjByFlag( MonsterID, 780331, i-1, 1)  --生出小魅影
		SetModeEx( LittlePhamtom[i]  , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( LittlePhamtom[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( LittlePhamtom[i]  , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( LittlePhamtom[i]  , EM_SetModeType_Mark, true )--標記
		SetModeEx( LittlePhamtom[i]   , EM_SetModeType_Move, true )--移動
		SetModeEx( LittlePhamtom[i]   , EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( LittlePhamtom[i]    , EM_SetModeType_HideName, true )--名稱
		SetModeEx( LittlePhamtom[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( LittlePhamtom[i], EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( LittlePhamtom[i]   , EM_SetModeType_Show , true ) --不顯示
		AddToPartition( LittlePhamtom[i]  , 0)  
	end
	return LittlePhamtom
end
--------------------------------------------------------------------------------------------------
function LuaDan_101844_treasure()
--	Say(OwnerID(), "OwnerID 1")			
--	Say(TargetID(), "TargetID 1")

--	local Flag =  CheckFlag(OwnerID()  , 542666)  
	local Flag2 =  CheckFlag(OwnerID()  , 542553)                                                  

	if Flag2 ==  false  then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112502_NOSTART]" , C_SYSTEM ) --你還沒參加這個活動喔～！
	else
		SetPlot( TargetID(),"touch","",0 )
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- 防止複數玩家於同時開啟寶箱，都能得到的問題。
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--忙碌中，請稍候再試。
			return										--
		end											--
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )					--
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
						GiveBodyItem( OwnerID(), 720627, 1)  
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						DelObj(TargetID())  
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
						WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
						SetPlot( TargetID(),"touch","LuaDan_101844_treasure",50 )
					end	
				end
			elseif ( result == "DAME" ) then
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- 防止複數玩家於同時開啟寶箱，都能得到的問題。 
				SetPlot( TargetID(),"touch","LuaDan_101844_treasure",50 )
			end
		end
	end
end

function lua_mika_musicfes_boxtest()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_PID) 
	Say(OwnerID(), "OwnerID")
	Say(OwnerID(), X)
end

--------------------------------------------------------------------------------------------------
function LuaDan_101844_Item_check()  --檢查此物品是否在特定NPC身上
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 101844 

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_101844_item]" , C_SYSTEM )	--請使用於魅影身上。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_101844_item]" , C_SYSTEM )	--請使用於魅影身上。
		return false	
	end
end
--------------------------------------------------------------------------------------------------
function LuaDan_101844_WhokillPhamtom()
--Say(OwnerID(), "3")
--Say(TargetID(), "4")
	SetPlot( OwnerID() , "dead" , "LuaDan_101844_WhokillPhamtom2" , 40 )

end
--------------------------------------------------------------------------------------------------
function LuaDan_101844_WhokillPhamtom2()
--Say(OwnerID(), "5")
--Say(TargetID(), "6")

	--local Player = OwnerID()

	SetFlag( TargetID()  , 542666 , 1 )   

	return true

end