
--範圍玩家任務劇情開始播放(含音樂)
function Ag_QuestwithMusic( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray,PlayMusicID )
	if Var_AGMusicList==nil then
		Var_AGMusicList={}
	end
	local player = {}
	local Ctrl = OwnerID()
	local allplayer = SearchRangePlayer( Ctrl, CheckRange )
	local tmpMusic={}	
	local x,y,z,dir=DW_Location(Ctrl);
	local MapID=FindMapID(x,y,z)

	for i=0, table.getn(allplayer)-1 do--符合條件 給予演戲用Buff
		if	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and 
			CheckBuff( allplayer[i], CheckBuffID ) ~= true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			--ClientEvent_Range(  allplayer[i] , 0, "stopmusic" )
			Lua_StopBGM(allplayer[i])
			Var_AGMusicList[allplayer[i]]=PlayMusicToPlayer(allplayer[i],PlayMusicID,false)
			AddBuff( allplayer[i], CheckBuffID, 0, -1 )--給予檢查		
			table.insert( player, allplayer[i] )
		end
	end
	DebugMsg(0,0, "Count = "..table.getn(player))
	while true do
		for i= 1, table.getn(player) do
			if player[i] ~= nil and CheckID(player[i]) == true and  
				( CheckAcceptQuest( player[i], QuestID ) ~= true or --檢查有無任務
				CheckBuff( player[i], CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player[i], FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player[i], Ctrl, CheckRange ) ~= true ) then --檢查是否超過檢查範圍
				local x,y,z,dir=DW_Location(player[i]);
					if FindMapID(x,y,z)==MapID then
						if Var_AGMusicList[player[i]]~=nil then 
							StopSound(player[i],Var_AGMusicList[player[i]]);
							Var_AGMusicList[player[i]]=nil
						end
						Lua_PlayBGM(player[i])
						--ClientEvent_Range(  player[i] , 0, "playmusic" )
					end			
				CancelBuff( player[i], CheckBuffID )
				table.remove(player, i)							
			end
		end
		--DebugMsg(0,0, "Count = "..table.getn(player))
		if table.getn(player) == 0 then
			--DebugMsg(0,0,"Del")
			for i=1, table.getn(ActorArray ) do--刪除演員
				if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
			end
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
			ks_resetObj( Ctrl, nil )--重置中控
			break
		end
		sleep(20)
	end	
end
--範圍玩家任務劇情完成並停止播放音樂
function Ag_QuestwithMusicEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, Ctrl )--範圍玩家任務劇情結束給予重要旗標(含音樂)
	Ctrl = Ctrl or OwnerID()
	local player = SearchRangePlayer ( Ctrl, CheckRange ) 	

	for i=0, table.getn(player )-1 do--清除演戲Buff
		if	CheckID(player[i]) == true and  
			CheckAcceptQuest( player[i], QuestID ) == true and 
			CheckBuff( player[i] , CheckBuffID ) == true and 
			CheckFlag( player[i], FinishFlagID ) ~= true then
			
			if FinishFlagID ~= nil then SetFlag( player[i], FinishFlagID, 1 ) end
			if Var_AGMusicList[player[i]]~=nil then 
				StopSound(player[i],Var_AGMusicList[player[i]]); 
				Lua_PlayBGM(player[i])
				--ClientEvent_Range(  player[i] , 0, "playmusic" )
				Var_AGMusicList[player[i]]=nil
			end
			CancelBuff( player[i], CheckBuffID )
		end
	end

	for i=1, table.getn(ActorArray ) do--刪除演員
		if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	ks_resetObj( OwnerID(), nil )--重置中控
end
--區域上的初始記憶體
function lua_StarAMusicListTabble()
	Var_AGMusicList={}
end

--僅能使用在index順序1,2,3,4…的陣列
function AG_RandenArray( tmpTable )
	local tmp = {}
	--用意：用另一個同樣大小的陣列，塞入隨機值後，再做大小排序。
	for i=1, #tmpTable,1 do
		local num = rand( 100 )+1
		tmp[i] = num
	end
	--其實不需要雙迴圈的，不過已經寫了就懶得改了
 	for i=1,#tmpTable-1,1 do
		for j=i+1,#tmpTable,1 do
			if tmp[i] < tmp[j] then
				tmptable[i],tmptable[j] = tmptable[j],tmptable[i]
				tmp[i],tmp[j] = tmp[j],tmp[i]
			end
		end
	end
 	return tmpTable
end

--測試用
function lua_testRoomIDVar()
	local testu = ReadRoleValue( OwnerID(),EM_RoleValue_ZoneID )
	DebugMsg(0,0,"Test ZoneID = "..testu )
end

function lua_gctest()
	local time =0
	while true do
		if time%5 == 0 then
	 		debugmsg(0,0,"test"..gcinfo())
			time=5
		end
	end
end


--初始宣告
function lua_TestSetMounts()
	--坐騎陣列&m數量
	var_RideSelectNum = 5
	 var_RideSelectType = { 505075 ,505111 ,505113 ,
				505127 ,	505472 ,	505473 ,
				505474 ,	505475 ,	505476 ,
				505477 ,	505478 ,	505479 ,
				505480 ,	505481 ,	506001 ,
				506002 ,	506109 ,	506137 ,
				506174 ,	506175
					}
end
--執行
function lua_listYourCanRide( )
	if var_RideSelectType == nil then
		lua_TestSetMounts()
	end
	lua_YourCanRideExchange( )	--交換用
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Ride it ,Just do it." );
	for i=1,var_RideSelectNum,1 do
		DialogSelectStr( OwnerID() , "["..var_RideSelectType[i].."]" );
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		if SelectID < var_RideSelectNum  then
			AddBuff( OwnerID(),var_RideSelectType[SelectID+1],0,-1)
		end
		DialogClose( OwnerID() )
		return
end
--交換
function lua_YourCanRideExchange( )
	local upeRide = table.getn(var_RideSelectType)	--所有馬匹數量
	local choRide = var_RideSelectNum	--選擇數量
	for i=1, choRide do
		local randnum = RandRange( choRide+1, upeRide)
		var_RideSelectType[randnum],var_RideSelectType[upeRide]=var_RideSelectType[upeRide],var_RideSelectType[randnum] --交換至最後一匹
		var_RideSelectType[i],var_RideSelectType[upeRide]=var_RideSelectType[upeRide],var_RideSelectType[i]		--交換回第一匹
		upeRide = upeRide -1
	end
end
--釋放記憶體
function lua_ReMountsTabletonil()
	var_RideSelectNum = nil
	var_RideSelectType = nil
end
--測試回圈
function lua_TestSetMounts_test()
	for i=1,#var_RideSelectType,1 do
		DebugMsg(0,0,"testScore="..var_RideSelectType[i])
	end
end