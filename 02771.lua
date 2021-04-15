--可放置物件劇情(亮晶晶)
function Lua_na_wdposition()
	local Owner = OwnerID()
	AddBuff( Owner , 623743 , 0 , -1 )
end


----------------------------------------------------------
--結婚蛋糕 / 點心塔 / 飲料塔 
----------------------------------------------------------
function Lua_na_wedding_cake0(Option , TicketID , ObjID)  --共用function
	local Owner = OwnerID()
	local Target = TargetID()
	local TOrgID = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Roomid = ReadRoleValue(Owner, EM_LuaValueFlag_UseItem43 )

	if ( Option == "CHECK" ) then --檢查目標
		if TOrgID == 121476 then --如果目標是置換的擺飾
			return true
		else
			ScriptMessage( Owner , Owner , 2, "[SC_WEDDING_MEG0]" , 0 )
			return false
		end

	elseif ( Option == "USE" ) then --使用結果
		if WeddingObjlist == nil then
			WeddingObjlist = {}  -- 建立空的擺放物件清單
		end

		if WeddingObjlist[Roomid] == nil then
			WeddingObjlist[Roomid] = {}  -- 建立Table
		end

	--	DelBodyItem( Owner, TicketID, 1 )
		ChangeObjID( Target , ObjID)
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, false )--關閉頭像框
		table.insert(WeddingObjlist[roomid] , Target )
	end		
end

function Lua_na_wedding_cake() --蛋糕的初始劇情
	local Owner = OwnerID() --蛋糕本體
	local CakeOrgid = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	local CakeType = { 	121494, 121495, 121496, --結婚蛋糕 
				121503, 121504, 121505, --點心塔 
				121506, 121507, 121508	} --飲料塔
	for i = 1 , #CakeType do
		if CakeOrgid == CakeType[i] then
			WriteRoleValue( Owner , EM_RoleValue_PID , 20 )
			break
		end
	end
	SetPlot( Owner , "touch" , "Lua_na_wdcake1_touch" , 30 ) --設定觸碰劇情
end

function Lua_na_wdcake1_touch() --觸碰劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() --物件
	local TPid = ReadRoleValue( Target , EM_RoleValue_PID )
	local CakeOrgid = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local CakeGift = {	[121494] = {202895 , 1} ; --雋永之愛婚禮蛋糕
				[121495] = {202896 , 1} ; --玫瑰愛戀婚禮蛋糕
				[121496] = {202897 , 1} ; --巧克甜心婚禮蛋糕
				[121503] = {241960 , 1} ; --繽紛甜莓點心塔
				[121504] = {241961 , 1} ; --心心相印綜合點心塔
				[121505] = {241959 , 1} ; --香草莓果點心塔
				[121506] = {241962 , 1} ; --皇家璀璨飲料塔
				[121507] = {241963 , 1} ; --永結銀心飲料塔
				[121508] = {241964 , 1} ; --亙古之愛飲料塔
							}--對應獎勵(目前物品/數量暫代)
--	DebugMsg(0, 0, TPid)
	if TPid > 1 then --如果可以點擊
		SetPlot( Target , "touch" , "" , 0)
		GiveBodyItem( Owner , CakeGift[CakeOrgid][1] , CakeGift[CakeOrgid][2] )
		WriteRoleValue( Target , EM_RoleValue_PID , TPid - 1)
		sleep(10)
		SetPlot( Target , "touch" , "Lua_na_wdcake1_touch" , 30 ) --設定觸碰劇情
	else
		if TPid == 1 then
			GiveBodyItem( Owner , CakeGift[CakeOrgid][1] , CakeGift[CakeOrgid][2] )
			WriteRoleValue( Target , EM_RoleValue_PID , TPid - 1)	
		end
		SetPlot( Target , "touch" , "" , 0)
		ChangeObjID( Target , 121476 ) 
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, true )
	end
end

----------------------------------------------------------
--美饌桌 121477
----------------------------------------------------------
function Lua_na_wedding_table0(Option , TicketID , ObjID)  --共用function
	local Owner = OwnerID()
	local Target = TargetID()
	local TOrgID = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Roomid = ReadRoleValue(Owner, EM_LuaValueFlag_UseItem43 )

	if ( Option == "CHECK" ) then --檢查目標
		if TOrgID == 121477 then --如果目標是置換的擺飾
			return true
		else
			ScriptMessage( Owner , Owner , 2, "[SC_WEDDING_MEG0]" , 0 )
			return false
		end

	elseif ( Option == "USE" ) then --使用結果
		if WeddingObjlist == nil then
			WeddingObjlist = {}  -- 建立空的擺放物件清單
		end

		if WeddingObjlist[Roomid] == nil then
			WeddingObjlist[Roomid] = {}  -- 建立Table
		end

	--	DelBodyItem( Owner, TicketID, 1 )
		ChangeObjID( Target , ObjID)
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, false )--關閉頭像框
		table.insert(WeddingObjlist[roomid] , Target )
	end		
end


function Lua_na_wedding_table() --餐桌的初始劇情
	local Owner = OwnerID() --餐桌本體
	local TableOrgid = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	local TableType = { 121509, 121510, 121511 } --餐桌
	for i = 1 , #TableType do
		if TableOrgid == TableType[i] then
			WriteRoleValue( Owner , EM_RoleValue_PID , 20 )
			break
		end
	end
	SetPlot( Owner , "touch" , "Lua_na_wdtable_touch" , 30 ) --設定觸碰劇情
end


function Lua_na_wdtable_touch() --觸碰劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() --物件
	local TPid = ReadRoleValue( Target , EM_RoleValue_PID )
	local TableOrgid = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local TableGift = {	[121509] = {241965 , 1} ; --典雅佳餚美饌桌
				[121510] = {241966 , 1} ; --特製佳餚美饌桌
				[121511] = {241967 , 1} ; --精選佳餚美饌桌	
							}--對應獎勵(目前物品/數量暫代)
--	DebugMsg(0, 0, TPid)
	if TPid > 1 then --如果可以點擊
		SetPlot( Target , "touch" , "" , 0)
		GiveBodyItem( Owner , TableGift[TableOrgid][1] , TableGift[TableOrgid][2] )
		WriteRoleValue( Target , EM_RoleValue_PID , TPid - 1)
		sleep(10)
		SetPlot( Target , "touch" , "Lua_na_wdtable_touch" , 30 ) --設定觸碰劇情
	else
		if TPid == 1 then
			GiveBodyItem( Owner , TableGift[TableOrgid][1] , TableGift[TableOrgid][2] )
			WriteRoleValue( Target , EM_RoleValue_PID , TPid - 1)
		end
		SetPlot( Target , "touch" , "" , 0)
		ChangeObjID( Target , 121477 ) 
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, true )
	end
end


----------------------------------------------------------
--樂團 121478
----------------------------------------------------------
function Lua_na_wedding_band(Option , TicketID , ObjID)  --共用function
	local Owner = OwnerID()
	local Target = TargetID()
	local TOrgID = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Roomid = ReadRoleValue(Owner, EM_LuaValueFlag_UseItem43 )  

	if ( Option == "CHECK" ) then --檢查目標
		if TOrgID == 121478 then --如果目標是置換的擺飾
			return true
		else
			ScriptMessage( Owner , Owner , 2, "[SC_WEDDING_MEG0]" , 0 )
			return false
		end

	elseif ( Option == "USE" ) then --使用結果
		if WeddingObjlist == nil then
			WeddingObjlist = {}  -- 建立空的擺放物件清單
		end

		if WeddingObjlist[Roomid] == nil then
			WeddingObjlist[Roomid] = {}  -- 建立Table
		end

	--	DelBodyItem( Owner, TicketID, 1 )
		SetPlot( Target , "touch" , "Lua_na_wdband_touch" , 30 ) --設定觸碰劇情
		ChangeObjID( Target , ObjID)
		SetModeEx( Target , EM_SetModeType_ShowRoleHead, false )--關閉頭像框
		table.insert(WeddingObjlist[roomid] , Target )
	end		
end

function Lua_na_wdband_touch()
	local OID = OwnerID()  -- player
	local TID = TargetID()  --obj
	local range = 150
	local players = SearchRangePlayer(TID, range)
	local playing = ReadRoleValue(TID, EM_RoleValue_Register+1 )	 -- 是否播放中,  99 = 播放 
	
	if playing == 99 then  -- 播放中
		WriteRoleValue(TID, EM_RoleValue_Register+1, 0 )  -- 寫入停止撥放
	else
		WriteRoleValue(TID, EM_RoleValue_Register+1, 99 )  -- 寫入開始播放
		Callplot(TID, "Lua_na_wdband_touch_02" , 0 )  -- 樂團開始跑回圈 每秒檢測沒有播放buff的玩家 有的話就給他播放
	end
end

function Lua_na_wdband_touch_02()
	local band = OwnerID()  -- player
	local range = 150
	local musicbuff = 623793

--	say(band , "band ")

	while true do 
	--	say(band, "test")
		local playing = ReadRoleValue(band, EM_RoleValue_Register+1 )	 -- 是否播放中,  99 = 播放 
		if playing ~= 99 then  -- 沒有在播放中  
			break
		else	-- 播放中 -- 播放給其他玩家剛靠近的玩家
			local players = SearchRangePlayer(band, range)
			for i = 0 , table.getn(players) do 
				if CheckBuff(players[i], musicbuff ) == false then -- 不是播放者
					AddBuff(players[i], musicbuff, 0, 3 )
					Lua_StopBGM(players[i])  -- 停止目前播放音樂
					local MusicID = PlayMusicToPlayer(players[i],"music/wedding/fairytales_06_COL_ARO_home.mp3",True);  -- 指定玩家聽到某個音效，音量大小會根據距離衰減	
					-- music/dungeon/Pesche/ancient_wars_07_MKS_warriors_arise!.mp3
					Callplot(players[i], "Lua_na_wdband_touch_03" , band, MusicID )  -- 玩家跑回圈
				--	say(players[i], "music on 3" )
				end
				AddBuff(players[i], musicbuff, 0, 3 )
			end
		end
		sleep(10)
	end
end


-- 玩家跑回圈
function Lua_na_wdband_touch_03(obj, MusicID)
	local OID = OwnerID()  -- player
	local range = 150
--	say(OID, MusicID)
--	say(obj, "obj")

--	say(OID, "Check range and id ." )

	while true do 
		if CheckID(obj) == true then  -- 是否有box
			local playing = ReadRoleValue(obj, EM_RoleValue_Register+1 )	
			if playing ~= 99 then  -- 沒有在播放中
				StopSound(OID,MusicID)  -- 停止MusicID這個頻道的聲音
				Lua_PlayBGM(OID)
			--	say(OID, "Stop and continue 1")
				break
			else
				local dis = GetDistance(OID, obj)  -- 玩家和物件距離
				if dis >= range then   -- 超出範圍 停止音樂
					StopSound(OID,MusicID)  -- 停止MusicID這個頻道的聲音
					Lua_PlayBGM(OID)
				--	say(OID, "Stop and continue 2 ")
					break
				end
			end
		else  -- 找不到物件 停止音樂
			StopSound(OID,MusicID)  -- 停止MusicID這個頻道的聲音
			Lua_PlayBGM(OID)
		--	say(OID, "Stop and continue 3")
			break 
		end
		sleep(10)
	end
end


----------------------------------------------------------
--幸福箴言氣球禮盒/甜蜜捧花禮盒
----------------------------------------------------------
function Lua_na_wedding_box() --202898 / 202899 共用劇情
	local Owner = OwnerID()
	local ZoneID = ReadRoleValue(Owner,EM_RoleValue_ZoneID)	
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流

	if Zone == 305 or Zone == 306 or Zone == 307 then
		return TRUE
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_WEDDING_MEG1]", 0 )
		return FALSE
	end
end


function Lua_na_wdballon_touch() --觸碰劇情
	local Owner = OwnerID() --氣球
	local Player = TargetID() -- 玩家使用者

	local Roomid = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	if WeddingObjlist2 == nil then
		WeddingObjlist2 = {}  -- 建立空的擺放物件清單
	end

	if WeddingObjlist2[Roomid] == nil then
		WeddingObjlist2[Roomid] = {}  -- 建立Table
	end

	table.insert(WeddingObjlist2[roomid] , Owner )
	SetPlot( Owner , "touch" , "Lua_na_wedding_ballon" , 30 ) --設定觸碰劇情
end

function Lua_na_wedding_ballon() --氣球的觸碰
	local Owner = OwnerID() --玩家
	local Target = TargetID()
	local Maxim = {}
	Maxim[1] = "[SC_WEDDING_MESSAGE01]"
	Maxim[2] = "[SC_WEDDING_MESSAGE02]"		
	Maxim[3] = "[SC_WEDDING_MESSAGE03]"
	Maxim[4] = "[SC_WEDDING_MESSAGE04]"
	Maxim[5] = "[SC_WEDDING_MESSAGE05]"
	Maxim[6] = "[SC_WEDDING_MESSAGE06]"
	Maxim[7] = "[SC_WEDDING_MESSAGE07]"
	local R = DW_rand(7)
	SetPlot( Target , "touch" , "" , 0)
	ScriptMessage( Owner , Owner ,3 , Maxim[R] , 0)
	Addbuff( Owner , 623766 , 0, -1 )
	Sleep(10)
	SetPlot( Target, "touch" , "Lua_na_wedding_ballon" , 30 ) --設定觸碰劇情
end



function Lua_na_wdbouquet_touch() --花束的初始劇情
	local Owner = OwnerID() --花束
	local Player = TargetID() -- 玩家使用者

	local Roomid = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	if WeddingObjlist2 == nil then
		WeddingObjlist2 = {}  -- 建立空的擺放物件清單
	end

	if WeddingObjlist2[Roomid] == nil then
		WeddingObjlist2[Roomid] = {}  -- 建立Table
	end
	table.insert(WeddingObjlist2[roomid] , Owner )
	WriteRoleValue( Owner , EM_RoleValue_PID, 0 )
	SetPlot( Owner , "touch" , "Lua_na_wedding_bouquet" , 30 ) --設定觸碰劇情
end


function Lua_na_wedding_bouquet() --花束的觸碰劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() --花束
--	local T_PID = ReadRoleValue( Target , EM_RoleValue_PID)
	if ReadRoleValue( Target , EM_RoleValue_PID) == 0 then
		WriteRoleValue( Target , EM_RoleValue_PID , 1 )
		DelObj( Target)
		GiveBodyItem( Owner, 212141, 1)
		GiveBodyItem( Owner, 530925, 1 )
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_WEDDING_MEG2]" , 0 )	
	end
end




------------------------------------------------------------------------------
--使用物品 切片蛋糕/ 飲料/ 點心
------------------------------------------------------------------------------
function Lua_wedding_item_check( Buff1, Buff2)
	local Owner = OwnerID()
	if CheckBuff( Owner , Buff1) == true or CheckBuff(Owner , Buff2) == true then
		ScriptMessage( Owner , Owner , 1 , "[SC_WEDDING_ITEM3]" , 0)
		return false
	else
		return true
	end
end




--小間禮堂
--/GM ? ZONE 305 0 -3600 250 3600
--
--大間禮堂
--/GM ? ZONE 305 0 -3600 250 -480
--
--室外禮堂
--/GM ? ZONE 305 0 -3600, 400 -4200