
-- SC_WEAVE_TAILOR_01 本活動字串

-- 2012 綵織節活動 魔法裁縫師 初始中控器物件 magical tailor
function lua_mika_weave_ctrl1()
	local OID = OwnerID()
	local ZoneID = ReadRoleValue( OID , EM_RoleValue_ZoneID ) --讀取隱藏物件位於哪個Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120888 , 100 , 0 ) --以隱藏物件為中心，向周圍N碼搜尋特定IDNPC

	AddBuff(  OID,  503217, 1, -1) 
	while true do
		sleep(600)  -- 一分鐘跑一次
		local Hour = GetSystime(1) --取得現在時間：時
		local Min = GetSystime(2) --取得現在時間：分
		local RR = ReadRoleValue(OID, EM_RoleValue_Register2 )  -- 測試用報名開關
	--	Say(OID, "now time is "..Hour..":"..min )

		if ZoneID < 1000 then --(分流1：2、分流2：1002、分流3：2002，若ZoneID大於1000則為分流)
			---- 廣播時間 
			if  RR == 100  then  
			--	Say(OID, "100" )
				-- 活動開始, 報名用npc隱藏 , 產生活動表演用 npc
				WriteRoleValue( OID , EM_RoleValue_PID , 0 ) --把NPC的PID值寫為"0"，取消開放報名
				WriteRoleValue( OID , EM_RoleValue_Register2 , 0 ) -- 將NPC R2 改回 0
				local R1 = ReadRoleValue(OID, EM_RoleValue_Register) -- npc R1 用於判斷本場次已報名人數
			--	say(OID, "PlayerNum ="..R1 )
				if R1 > 0 then
					if R1 <= 5 then
						NPCSAY(OID, "[SC_WEAVE_TAILOR_09]")  
					elseif R1 >= 6 and R1 <= 10 then
						NPCSAY(OID, "[SC_WEAVE_TAILOR_10]")  			
					end					
					BeginPlot(OID,"lua_mika_weave_start",0)  -- 生活動相關物件
				else
					NPCSAY(OID, "[SC_WEAVE_TAILOR_08]")
				end
			---- 報名時段
			elseif RR == 99 then  
			--	Say(OID, "99" )
				NPCSAY(OID, "test - event will begin , please join me !" )
				if ReadRoleValue(OID, EM_RoleValue_PID )  ~= 1 then
					WriteRoleValue( OID , EM_RoleValue_PID , 1 ) --把NPC的PID值寫為"1"，表示NPC開放報名
					WriteRoleValue( OID , EM_RoleValue_Register , 0 ) --把NPC的R值歸零
				end
			elseif ( Hour == 7 ) or ( Hour == 15 ) or ( Hour == 19 ) or ( Hour == 22 )  then 
				if min == 10 then
					RunningMsgEx( OID , 2 , 3 , "[SC_WEAVE_TAILOR_01]" ) 
				elseif  min == 20 then  
					NPCSAY(OID, "[SC_WEAVE_TAILOR_27]" )
					if ReadRoleValue(OID, EM_RoleValue_PID )  ~= 1 then
						WriteRoleValue( OID , EM_RoleValue_PID , 1 ) --把NPC的PID值寫為"1"，表示NPC開放報名
						WriteRoleValue( OID , EM_RoleValue_Register , 0 ) --把NPC的R值歸零
					end
				elseif  min == 25 or min == 28 then  
					NPCSAY(OID, "[SC_WEAVE_TAILOR_28]" )
					-- 再過幾分鐘就要開始了，有意願的冒險者請現在來找我報名吧！
				elseif min == 30 then
					-- 活動開始, 報名用npc隱藏 , 產生活動表演用 npc
					WriteRoleValue( OID , EM_RoleValue_PID , 0 ) --把NPC的PID值寫為"0"，取消開放報名
					WriteRoleValue( OID , EM_RoleValue_Register2 , 0 ) -- 將NPC R2 改回 0
					local R1 = ReadRoleValue(OID, EM_RoleValue_Register) -- npc R1 用於判斷本場次已報名人數
				--	say(OID, "PlayerNum ="..R1 )
					if R1 > 0 then
						if R1 <= 5 then
							NPCSAY(OID, "[SC_WEAVE_TAILOR_09]")  
						elseif R1 >= 6 and R1 <= 10 then
							NPCSAY(OID, "[SC_WEAVE_TAILOR_10]")  			
						end					
						BeginPlot(OID,"lua_mika_weave_start",0)  -- 生活動相關物件
					else
						NPCSAY(OID, "[SC_WEAVE_TAILOR_08]")
					end
				end

			elseif  (( Hour >= 8 ) and  ( Hour <=23 )) then 
				if  min == 20 then  
					NPCSAY(OID, "[SC_WEAVE_TAILOR_27]" )
					if ReadRoleValue(OID, EM_RoleValue_PID )  ~= 1 then
						WriteRoleValue( OID , EM_RoleValue_PID , 1 ) --把NPC的PID值寫為"1"，表示NPC開放報名
						WriteRoleValue( OID , EM_RoleValue_Register , 0 ) --把NPC的R值歸零
					end
				elseif  min == 25 or min == 28 then  
					NPCSAY(OID, "[SC_WEAVE_TAILOR_28]" )
					-- 再過幾分鐘就要開始了，有意願的冒險者請現在來找我報名吧！
				elseif min == 30 then
					-- 活動開始, 報名用npc隱藏 , 產生活動表演用 npc
					WriteRoleValue( OID , EM_RoleValue_PID , 0 ) --把NPC的PID值寫為"0"，取消開放報名
					WriteRoleValue( OID , EM_RoleValue_Register2 , 0 ) -- 將NPC R2 改回 0
					local R1 = ReadRoleValue(OID, EM_RoleValue_Register) -- npc R1 用於判斷本場次已報名人數
				--	say(OID, "PlayerNum ="..R1 )
					if R1 > 0 then
						if R1 <= 5 then
							NPCSAY(OID, "[SC_WEAVE_TAILOR_09]")  
						elseif R1 >= 6 and R1 <= 10 then
							NPCSAY(OID, "[SC_WEAVE_TAILOR_10]")  			
						end					
						BeginPlot(OID,"lua_mika_weave_start",0)  -- 生活動相關物件
					else
						NPCSAY(OID, "[SC_WEAVE_TAILOR_08]")
					end
				end
			end
		end
	end
end

-- 產生活動 相關npc  給予玩家相關buff 物件
function lua_mika_weave_start()
	local OID = OwnerID()  -- 活動NPC
	local R1 = ReadRoleValue(OID, EM_RoleValue_Register) -- npc R1 用於判斷本場次已報名人數
	local range = 160 -- 活動半徑範圍
	local npcrange = 300 -- 刪除周圍怪物的range
	
	-- 刪除周圍狼與豬
	local npc = SearchRangeNPC(OID, npcrange )
	for i = 0 , table.getn(npc)-1  do 	-- 搜尋範圍內玩家
		local Orgid = ReadRoleValue(NPC[i], EM_RoleValue_OrgID )
		if Orgid == 100212 or  Orgid == 100211 then
			SetModeEx( npc[i], EM_SetModeType_Show, false )--顯示
			SetModeEx( npc[i], EM_SetModeType_Mark, false )--標記
			SetModeEx( npc[i], EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( npc[i], EM_SetModeType_Fight , false )--可砍殺攻擊
			Beginplot(npc[i], "lua_mika_weave_npcshow" , 0 )
		end
	end

	-- 給活動玩家相關buff 等
	local Player = SearchRangePlayer( OID , range ) --搜尋周圍160玩家
	for i = 0 , table.getn(Player)-1  do 	-- 搜尋範圍內玩家
	--	say(Player[i], "player-"..i)
		if CheckBuff(Player[i], 623044) == true then  -- 魔力絲線 報名證明buff
			Setflag(Player[i], 546863, 1 )  -- 給當天參加key 
			AddBuff(Player[i], 623041, 0, 190 )  -- 活動技能buff
			CancelBuff(Player[i], 623044 )  -- 刪除報名證明 buff
			Beginplot(Player[i], "lua_mika_weave_rangecheck" , 0 )
		end
	end

	-- 產生魔法陣 表演用
	local magicroll = CreateObjByFlag(120887 , 781158, 0 ,1) --使用旗子產生npc 
	SetModeEx( magicroll, EM_SetModeType_Show, true )--顯示
	SetModeEx( magicroll, EM_SetModeType_Mark, false )--標記
	SetModeEx( magicroll, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( magicroll, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( magicroll, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( magicroll, EM_SetModeType_Move, false )--移動
	SetModeEx( magicroll, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( magicroll, EM_SetModeType_HideName, false )--名稱
	SetModeEx( magicroll, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( magicroll, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( magicroll, EM_SetModeType_Drag , false )--阻力
	AddToPartition( magicroll, 0 )	--讓物件產生
--	say(magicroll, "magicroll born")

	-- 產生生球中控隱藏物件 BOX
	local Box = CreateObjByFlag(121058 , 781158, 0 ,1) --使用旗子產生npc 
	SetModeEx( Box, EM_SetModeType_Mark, false )--標記  ------------false
	SetModeEx( Box, EM_SetModeType_Show, false )--顯示 ------------false
	SetModeEx( Box, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Box, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Box, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Box, EM_SetModeType_Move, false )--移動
	SetModeEx( Box, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Box, EM_SetModeType_HideName, false )--名稱
	SetModeEx( Box, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Box, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Box, EM_SetModeType_Drag , false )--阻力
	AddToPartition( Box, 0 )	--讓物件產生
--	Say(Box , "hidebox born.")
--	Callplot( Box, "lua_mika_weave_ctrl2", R1  ) -- 將目前玩家報名人數代入此函式

	SetModeEx( OID , EM_SetModeType_Show , False ) --顯示
	SetModeEx( OID, EM_SetModeType_Mark, False )--標記

	-- 產生活動用表演npc
	local Tailor = CreateObjByFlag(120889 , 781158, 0 ,1) --使用旗子產生npc 
	SetModeEx( Tailor, EM_SetModeType_Mark, true )--標記
	SetModeEx( Tailor, EM_SetModeType_Show, true )--顯示
	SetModeEx( Tailor, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( Tailor, EM_SetModeType_HideName, true )--名稱
	SetModeEx( Tailor, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Tailor, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Tailor, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Tailor, EM_SetModeType_Move, false )--移動
	SetModeEx( Tailor, EM_SetModeType_Searchenemy, false )--索敵

	SetModeEx( Tailor, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Tailor, EM_SetModeType_Drag , false )--阻力
	AddToPartition( Tailor, 0 )	--讓物件產生
	Callplot( Box, "lua_mika_weave_ctrl2", R1 , Tailor  ) -- 將目前玩家報名人數代入此函式
	BeginPlot(Tailor,"lua_mika_weave_actor",0)  -- 表演NPC 相關劇情

end

function lua_mika_weave_npcshow()
	local OID = OwnerID()
	sleep(1800)   --3分鐘
--	say(OID, "SHOW" )
	SetModeEx( OID, EM_SetModeType_Show, true )--顯示
	SetModeEx( OID, EM_SetModeType_Mark, true )--標記
	SetModeEx( OID, EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( OID, EM_SetModeType_Fight , true )--可砍殺攻擊
end


-- 活動開始時在玩家身上執行
function lua_mika_weave_rangecheck()
	local OID = OwnerID()
	local timer = 0
	while true do 
		sleep(10)
		timer = timer +1
		if timer == 181 then 
			break
		else
			local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120889 , 350 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
			local dis = GetDistance(OID, NPC ) 
			if dis >= 180 then
				ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_24]" , 0 )   --你離開了活動區域，已失去活動資格。
				ScriptMessage( OID , OID , 0 , "[SC_WEAVE_TAILOR_24]" , 0 )   --你離開了活動區域，已失去活動資格。
				CancelBuff(OID , 623041 )  -- Del 活動技能buff
				CancelBuff(OID , 623045 )  -- Del 活動分數buff
				break
			elseif dis >= 166 then
				ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_23]" , 0 )   --注意！你即將離開活動區域，若離開活動區域將會失去活動資格！
				ScriptMessage( OID , OID , 0 , "[SC_WEAVE_TAILOR_23]" , 0 )   
			end
		end
	end
end

----------------------------------------  活動中控隱藏物件跑的劇情模板
function lua_mika_weave_ctrl2(R1 , Tailor)
	local FlagObjID = 781174 --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量
	local ObjNum =  R1*3   -- 玩家數量的*3
	local resetTime =  6
	local Range = 5 --亂數範圍

	lua_mika_weave_ballctrl( FlagObjID, FlagNum, ObjNum, resetTime, Range , Tailor ) 
end

-- 活動中控隱藏物件劇情模板函式
function lua_mika_weave_ballctrl( FlagObjID, FlagNum, ObjNum, resetTime, Range , Tailor )
	--FlagObjID 旗幟物件編號
	--FlagNum 旗幟數量	
	--ObjNum 種植物件數量	
	--resetTime 重製時間(秒)
	--Range 生怪範圍
	local ctrl = OwnerID() --中控物件
	local RoomID = ReadRoleValue( ctrl, EM_RoleValue_RoomID ) --區域編號
	if lua_mika_weave_Global == nil then
		lua_mika_weave_Global = {}
	end
	lua_mika_weave_Global["create"] = {}
	lua_mika_weave_Global["flag"] = {}
	local create = lua_mika_weave_Global["create"]
	local flag = lua_mika_weave_Global["flag"]
	local num
	local random
	local objID
	local count = 0
	local x
	local y
	local z

	if ObjNum > FlagNum then
		ObjNum  = FlagNum 
	end
		
	--debugmsg( 0, 0, "counter = "..counter )
	for i=0, FlagNum do
		flag[i] = 0 
	end
	
	while true do
		--count = ReadRoleValue( ctrl, EM_RoleValue_Register1 )
--		DebugMsg(0,0,"Sheep Count = "..count )
		--DebugMsg(0,0,"#create = "..#create )
		if #create < ObjNum then
			for i=#create, ObjNum-1 do
				Sleep(1)
				random  = math.random(#flag);
				--DebugMsg(0,0,"Temp random = "..random )
				for i,v in ipairs(flag) do
					if ((v < flag[random] or create[random]~=nil ) and create[i]==nil )then
						random = i;
						--DebugMsg(0,0,"random Change to "..random )
					end
				end
				flag[random] = flag[random] + 1 --出過一次記錄
--				random = RandRange(0, 29)  
--				if  create[random ] > 1 then
--					while true do
--						sleep(1)
--						random = ks_CreateObjSearch( create, FlagNum, 0 )
--						if random ~= nil then break	 end
--						random = RandRange(0, 29)  
--						if  create[ random ] > 1 then break end
--					end
--				end
				--DebugMsg(0,0,"Real random = "..random )
				if random ~= nil then 
					x = GetMoveFlagValue( FlagObjID, random-1 , EM_RoleValue_X ) 
					y = GetMoveFlagValue( FlagObjID, random-1 , EM_RoleValue_Y ) 
					z = GetMoveFlagValue( FlagObjID, random-1 , EM_RoleValue_Z ) 	
						
					-- 決定要產生物件的id
					local RR = math.random(100)
					local rate = {32, 32, 32 , 4 }
					local Objlist = { 103013, 103014, 103015, 106548  }
						 if RR > (100 - rate[1] ) then   -- 69 -  100
							objID = Objlist[1]
						elseif RR > (100 - rate[1] - rate[2] ) then   -- 36 -  68
							objID = Objlist[2]
						elseif RR > (100 - rate[1] - rate[2] - rate[3] ) then  --  5 - 35
							objID = Objlist[3]
						else
							objID = Objlist[4]
						end

				--	say(OwnerID(), "objID ="..objID )
					create[random] = CreateObj( objID, x, y, z, rand(360), 1 )
					SetModeEx( create[random], EM_SetModeType_Mark, true )--標記
					SetModeEx( create[random], EM_SetModeType_Show, true )--顯示
					SetModeEx( create[random], EM_SetModeType_Move, true )--移動
					SetModeEx( create[random], EM_SetModeType_ShowRoleHead, true )--頭像框
					SetModeEx( create[random], EM_SetModeType_HideName, true )--名稱
					SetModeEx( create[random], EM_SetModeType_Strikback, true )--反擊
					SetModeEx( create[random], EM_SetModeType_SearchenemyIgnore, true )--被搜尋
					SetModeEx( create[random], EM_SetModeType_Obstruct, false )--阻擋
					SetModeEx( create[random], EM_SetModeType_Searchenemy, true )--索敵
					SetModeEx( create[random], EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( create[random], EM_SetModeType_Drag , false )--阻力
					MoveToFlagEnabled( create[random], false ); 
					WriteRoleValue( create[random]  ,EM_RoleValue_IsWalk , 1  )--用跑的
					--WriteRoleValue( create[random], EM_RoleValue_Register1, ctrl )
					WriteRoleValue( create[random], EM_RoleValue_Register1, random )
					local bufflv = rand(2)
					AddBuff( create[random], 623205, bufflv, -1 )  -- speed up  ( 0 ~ 2 )
					ReCalculate( create[random] ) 
					AddToPartition( create[random], RoomID )

					--say(create[random], "ID = "..objid.." , flagid = "..random )

					CallPlot( create[random], "lua_mika_weave_ballmove", Tailor )  --  球的物件移動劇情
					--AddRoleValue( ctrl, EM_RoleValue_Register1, 1 )
					Sleep(1)					
				end
				--count = ReadRoleValue( ctrl, EM_RoleValue_Register1 )
			end
		end
			
--		for i=1, resetTime do
--			local ResetFlag = ReadRoleValue( ctrl, EM_RoleValue_Register2 )
--			if ResetFlag ~= 0 then
--				DebugMsg(0,0,"ResetFlag ="..ResetFlag)
--				create[ResetFlag] = 0
--				WriteRoleValue( ctrl, EM_RoleValue_Register2, 0 )
--			end
		--DebugMsg(0,0,"Begin Sleep")
		sleep(resetTime*10)
		--DebugMsg(0,0,"End Sleep")
--		end
	end
end


function lua_mika_weave_ballreset( Obj )--Delete (是否刪除); Obj (對象)
	Obj = Obj or OwnerID()
--	local ctrl = ReadRoleValue( Obj, EM_RoleValue_Register1 )
	local random = ReadRoleValue( Obj, EM_RoleValue_Register1 )
--	AddRoleValue( ctrl, EM_RoleValue_Register1, -1 )--count-1
--	WriteRoleValue( ctrl, EM_RoleValue_Register2, Flag )--FlagClear
--	DebugMsg(0,0,"Flag "..Flag.."; Ctrl = "..Ctrl )
	local create = lua_mika_weave_Global["create"]
	local flag = lua_mika_weave_Global["flag"]
	create[random] = nil
	Sleep(1)
	DelObj( Obj )
end

------------------------------------------------- 

function lua_mika_weave_ballmove(Tailor)
	local OID = OwnerID()
	local flag = 781158 -- balls flag
	local timer = 0
	local orgid = ReadRoleValue(OID, EM_RoleValue_OrgID )
	local ballid = {103013, 103014, 103015, 106548}
	local range = 200
	local scorebuff = 622433  -- 元素收集量
--	local Tailor = LuaFunc_SearchNPCbyOrgID( OID , 120889 , range , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local X , Y , Z = ReadRoleValue( Tailor , EM_RoleValue_X ) , ReadRoleValue( Tailor , EM_RoleValue_Y ) , ReadRoleValue( Tailor , EM_RoleValue_Z )
	local dis , Colormode

	MoveDirect( OID , X , Y , Z )
	while true do 
		dis = GetDistance( OID , Tailor ) 
	--	say(OID, "DIS ="..dis )
		if dis < 1 then
	--		say(OID, "DIS OK")
			Colormode = ReadRoleValue(Tailor, EM_RoleValue_PID )  -- colormode = PID ,  1 = 紅 , 2 = 黃 ,  3 = 藍
			if Colormode == 1 then
				if ( orgid == ballid[2] ) or  ( orgid == ballid[3] ) then 
					Playmotion(Tailor, 18 )
					CastSpell(OID, Tailor, 850342 ) -- 擊中特效
					Addbuff(Tailor, 622432, 0, 15 )  -- 給tailor 被擊中的buff 10 sec
				elseif orgid == ballid[4] then
					CastSpell(OID, Tailor, 850342 ) -- 擊中特效
					Addbuff(Tailor, 622432, 1, 20 )  -- 給tailor 被擊中的buff 10 sec
					Playmotion(Tailor, 18 )
				end
			elseif Colormode == 2 then
				if ( orgid == ballid[1] ) or  ( orgid == ballid[3] ) then 
					CastSpell(OID, Tailor, 850342 ) -- 擊中特效
					Addbuff(Tailor, 622432, 0, 15 )  -- 給tailor 被擊中的buff 10 sec
					Playmotion(Tailor, 18 )
				elseif orgid == ballid[4] then
					CastSpell(OID, Tailor, 850342 ) -- 擊中特效
					Addbuff(Tailor, 622432, 1, 20 )  -- 給tailor 被擊中的buff 10 sec
					Playmotion(Tailor, 18 )
				end
			elseif Colormode == 3 then
				if ( orgid == ballid[1] ) or  ( orgid == ballid[2] ) then 
					CastSpell(OID, Tailor, 850342 ) -- 擊中特效
					Addbuff(Tailor, 622432, 0, 15 )  -- 給tailor 被擊中的buff 10 sec
					Playmotion(Tailor, 18 )
				elseif orgid == ballid[4] then
					CastSpell(OID, Tailor, 850342 ) -- 擊中特效
					Addbuff(Tailor, 622432, 1, 20 )  -- 給tailor 被擊中的buff 10 sec
					Playmotion(Tailor, 18 )
				end
			end
			lua_mika_weave_ballreset( OID )   -- 重置此球位置並刪除
		end
		sleep(1)
	end

end

-- 120889 活動用表演npc .  等同中控器
---- EM_RoleValue_PID   -- colormode = PID ,  1 = 紅 , 2 = 黃 ,  3 = 藍

function lua_mika_weave_actor()
	local OID = OwnerID()  -- actor 
	local timer = 0
	local R1 = RandRange(  31 , 35 )  --  變顏色+ 碎碎念時間
	local R2 = 18  -- NPC施法
	local buffid = 622432  -- npc連續被擊中次數
	local buffid2 = 622433  -- 元素收集量
	local speak = { "[SC_WEAVE_TAILOR_02]" , "[SC_WEAVE_TAILOR_03]" , "[SC_WEAVE_TAILOR_04]" }
	local range = 160 -- 活動半徑範圍

	-- 產生魔法光罩 預設是隨機的
	local shieldlist = {121055, 121056, 121057}
	local bornrandom = Rand(2)+1 -- 1 ~ 3 
	WriteRoleValue(OID, EM_RoleValue_PID , bornrandom )  -- Colormode 
	local Colormode = ReadRoleValue(OID,EM_RoleValue_PID )
--	Say(OID, "Colormode ="..Colormode )
	local shield = CreateObjByFlag( shieldlist[bornrandom] , 781158, 0 ,1) --使用旗子產生npc 
	SetModeEx( shield, EM_SetModeType_Obstruct, false )--阻擋 ----- 之後可能要改true
	SetModeEx( shield, EM_SetModeType_Show, true )--顯示
	SetModeEx( shield, EM_SetModeType_Mark, false )--標記
	SetModeEx( shield, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( shield, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( shield, EM_SetModeType_Drag , false )--阻力 
	SetModeEx( shield, EM_SetModeType_Move, false )--移動
	SetModeEx( shield, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( shield, EM_SetModeType_HideName, false )--名稱
	SetModeEx( shield, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( shield, EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( shield, 0 )	--讓物件產生
--	say(shield, "shield born")


	while true do
		sleep(10)
		timer = timer + 1
	--	say(OID, timer )
		local npcscore = FN_CountBuffLevel(OID, buffid2 )  -- NPC身上元素收集量
		local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )  -- colormode = PID ,  1 = 紅 , 2 = 黃 ,  3 = 藍

		if timer == 180 then  -- 結束活動
			NPCSAY(OID, "[SC_WEAVE_TAILOR_07]" )  -- 先收集到這邊吧，辛苦你了！

			-- 給獎
			local Player = SearchRangePlayer( OID , range ) --搜尋周圍160玩家
			for i = 0 , table.getn(Player)-1 do 	-- 搜尋範圍內有活動skill的玩家, 有就給獎
				if CheckBuff(Player[i], 623041) == true then
					 ------- 給玩家個人分數的獎勵 ------
					if CheckBuff(Player[i], 623045 ) == false then
						local socre = 0
						ScriptMessage( Player[i] , Player[i] , 1 , "[SC_WEAVE_TAILOR_29][$SETVAR1="..socre.."]" , C_SYSTEM )  --   活動結束，你的[623045]為[$VAR1]次。
						ScriptMessage( Player[i] , Player[i] , 0 , "[SC_WEAVE_TAILOR_29][$SETVAR1="..socre.."]"  , C_SYSTEM  )
					else
						local playerscore = FN_CountBuffLevel(Player[i], 623045 )  -- 玩家分數
						local realsccore = playerscore + 1
						ScriptMessage( Player[i] , Player[i] , 1 , "[SC_WEAVE_TAILOR_29][$SETVAR1="..realsccore.."]" , C_SYSTEM )  --   活動結束，你的[623045]為[$VAR1]次。
						ScriptMessage( Player[i] , Player[i] , 0 , "[SC_WEAVE_TAILOR_29][$SETVAR1="..realsccore.."]"  , C_SYSTEM  )
					--	Say(Player[i], "playerscore ="..playerscore )  -- 玩家總分
						if realsccore >= 71 then 
							GiveBodyItem(Player[i], 241646, 1 )  
						elseif realsccore >= 51 and realsccore <= 70 then 
							GiveBodyItem(Player[i], 241645, 5 )  
						elseif realsccore >= 31 and realsccore <= 50 then
							GiveBodyItem(Player[i], 241645, 3 )  
						elseif realsccore >= 11 and realsccore <= 30 then 
							GiveBodyItem(Player[i], 241645, 1 )  
						end
					end
					 ------- 給玩家npc分數的獎勵  -------
					if CheckBuff(OID, buffid2 )  == false  then
						GiveBodyItem(Player[i], 241480, 1 )  
					else
						local npcscore = FN_CountBuffLevel(OID, buffid2 )  -- NPC身上元素收集量
					--	Say(OID, "npcscore = "..npcscore )
						if npcscore >= 41 then 
							GiveBodyItem(Player[i], 241480, 5 )  
						elseif npcscore >= 11 and npcscore <= 40 then  
							GiveBodyItem(Player[i], 241480, 3 )  
						elseif npcscore <= 10 then   -- 30以下
							GiveBodyItem(Player[i], 241480, 1 )  
						end
					end

					CancelBuff(Player[i], 623045 )  -- 刪 活動分數buff
					CancelBuff(Player[i], 623041 )  -- 刪 活動技能buff

					Setflag(Player[i],546864, 1 ) -- 當天已完成過魔法裁縫師
	
					---------------  給予全勤獎 --------------------
					Lua_Festival_07_All(Player[i])    -- 2013 改全勤獎函式 
					-----------------------------------------------------

				end
			end

			-- 刪除活動相關物件
			local npc = SearchRangeNPC(OID, range )
			for i = 0 , table.getn(npc)-1 do 	-- 搜尋範圍內玩家
				local Orgid = ReadRoleValue(NPC[i], EM_RoleValue_OrgID )
				local objlist = {120887,121058, 121055, 121056, 121057, 103013, 103014, 103015, 106548 }
				if Orgid == objlist[1] or Orgid == objlist[2] or Orgid == objlist[3] or Orgid == objlist[4] or Orgid == objlist[5] or Orgid == objlist[6] or Orgid == objlist[7] or Orgid == objlist[8] or Orgid == objlist[9]  then
					Delobj(npc[i] )
				end
			end

			-- 讓活動npc 秀出來 
			local NPC2 = LuaFunc_SearchNPCbyOrgID( OID , 120888, range , 0)      --  活動NPC
			SetModeEx( NPC2 , EM_SetModeType_Show , True ) --顯示
			SetModeEx( NPC2, EM_SetModeType_Mark, True )--標記
		--	Say(OID, "SHOW")
			sleep(10)
			DelObj(OID)  -- 刪除表演用NPC
			break
		end

		if timer == 161 then
			NPCSAY(OID, "[SC_WEAVE_TAILOR_06]" )  
		end

		if timer%5 == 0 then
			local purpleball = Lua_Hao_NPC_Range_Search( OID ,106548 , 100 )  -- range 內物件數量 
			if purpleball > 0 then
				NPCSAY(OID, "[SC_WEAVE_TAILOR_25]" )  -- npc 叫玩家驅散紫球
			end
		end

		if timer%R2 == 0 then  -- npc施法 每次施法會回收一些元素  元素量取決於NPC身上損傷BUFFLV
			local damagelv = FN_CountBuffLevel(OID, buffid )  -- NPC身上損傷Buff lv (10秒)  
			CastSpell(OID, OID, 850340 )  -- NPC施法表演, 元素聚集

			if damagelv >= 4 then  -- 5 層
				NPCSAY(OID, "[SC_WEAVE_TAILOR_04]" ) 
			elseif damagelv <= 3 and damagelv >= 1 then  -- 2. 3  4層
				NPCSAY(OID, "[SC_WEAVE_TAILOR_03]" ) 
				AddBuff(OID, buffid2, 2 , 180 )   --  
			elseif damagelv <= 0  then
				NPCSAY(OID, "[SC_WEAVE_TAILOR_02]" ) 
				AddBuff(OID, buffid2, 4 , 180 )   
			end
		end

		if timer%R1 == 0 then -- 變顏色時間
			local damagelv = FN_CountBuffLevel(OID, buffid )  -- NPC身上損傷Buff lv (10秒)  
			local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )  -- colormode = PID ,  1 = 紅 , 2 = 黃 ,  3 = 藍
			local CR = Rand(100)+1

			NPCSAY(OID, "[SC_WEAVE_TAILOR_05]")  -- 好了，來收集其它種元素吧
			-- 變換防護罩顏色
			if Colormode == 1 then -- 紅
				local Shield = Lua_Hao_NPC_Closest_Search( OID , 121055  , range )-- 以Owner為中心做范圍搜尋，回傳最接近的物件
				if CR > 65 then
					WriteRoleValue(OID, EM_RoleValue_PID , 3 )  --藍
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121057 );	-- 置換物件的ID 藍色魔法罩
				--	Say(OID, "change to BLUE ,"..Colormode)

					-- 給玩家腳下提示buff
					local Player = SearchRangePlayer( OID , 160 ) --搜尋周圍160玩家
					for i = 0 , table.getn(Player)-1  do 	-- 搜尋範圍內玩家
						if CheckBuff(Player[i], 623041) == true  then  -- 活動技能buff
							CastSpell(OID, Player[i], 850367 )    -- blue 
						end
					end

				else
					WriteRoleValue(OID, EM_RoleValue_PID , 2 )  --黃
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121056 );	-- 置換物件的ID 黃色魔法罩
				--	Say(OID, "change to YELLOW"..Colormode )

					-- 給玩家腳下提示buff
					local Player = SearchRangePlayer( OID , 160 ) --搜尋周圍160玩家
					for i = 0 , table.getn(Player)-1  do 	-- 搜尋範圍內玩家
						if CheckBuff(Player[i], 623041) == true  then  -- 活動技能buff
							CastSpell(OID, Player[i], 850366 )    -- yellow
						end
					end

				end
			elseif Colormode == 2 then -- 黃
				local Shield = Lua_Hao_NPC_Closest_Search( OID , 121056  , range )-- 以Owner為中心做范圍搜尋，回傳最接近的物件
				if CR > 70 then
					WriteRoleValue(OID, EM_RoleValue_PID , 3 )  --藍
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121057 );	-- 置換物件的ID 藍色魔法罩
				--	Say(OID, "change to BLUE ,"..Colormode)

					-- 給玩家腳下提示buff
					local Player = SearchRangePlayer( OID , 160 ) --搜尋周圍160玩家
					for i = 0 , table.getn(Player)-1  do 	-- 搜尋範圍內玩家
						if CheckBuff(Player[i], 623041) == true  then  -- 活動技能buff
							CastSpell(OID, Player[i], 850367 )    -- blue 
						end
					end
				else
					WriteRoleValue(OID, EM_RoleValue_PID , 1 )
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121055 );	-- 置換物件的ID 紅色魔法罩
				--	Say(OID, "change to RED "..Colormode)

					-- 給玩家腳下提示buff
					local Player = SearchRangePlayer( OID , 160 ) --搜尋周圍160玩家
					for i = 0 , table.getn(Player)-1  do 	-- 搜尋範圍內玩家
						if CheckBuff(Player[i], 623041) == true then  -- 活動技能buff
							CastSpell(OID, Player[i], 850365 )    -- RED
						end
					end
				end
			elseif Colormode == 3 then -- 藍
				if CR > 60 then
					WriteRoleValue(OID, EM_RoleValue_PID , 1 )
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121055 );	-- 置換物件的ID 紅色魔法罩
				--	Say(OID, "change to RED "..Colormode)

					-- 給玩家腳下提示buff
					local Player = SearchRangePlayer( OID , 160 ) --搜尋周圍160玩家
					for i = 0 , table.getn(Player)-1  do 	-- 搜尋範圍內玩家
						if CheckBuff(Player[i], 623041) == true  then  -- 活動技能buff
							CastSpell(OID, Player[i], 850365 )    -- RED
						end
					end
				else
					-- 變換防護罩顏色
					WriteRoleValue(OID, EM_RoleValue_PID , 2 )  --黃
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121056 );	-- 置換物件的ID 黃色魔法罩
				--	Say(OID, "change to YELLOW"..Colormode )

					-- 給玩家腳下提示buff
					local Player = SearchRangePlayer( OID , 160 ) --搜尋周圍160玩家
					for i = 0 , table.getn(Player)-1  do 	-- 搜尋範圍內玩家
						if CheckBuff(Player[i], 623041) == true  then  -- 活動技能buff
							CastSpell(OID, Player[i], 850366 )    -- Yellow
						end
					end
				end
			end
		end
	end

end

function lua_mika_weave_flagtest()
	local OID  = OwnerID()
	local FlagObjID = 781174 --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量
	say(OID, "NUM = "..FlagNum)
end
function lua_mika_weave_flagTEST2()
	local ctrl = OwnerID() --中控物件
	local RoomID = ReadRoleValue( ctrl, EM_RoleValue_RoomID ) --區域編號
	local FlagObjID = 781174 --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量
	local create;
	for i=0, FlagNum-1 do
		x = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_X ) 
		y = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_Y ) 
		z = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_Z ) 	
		create = CreateObj( 103015, x, y, z, rand(360), 1 )
		SetModeEx( create, EM_SetModeType_Mark, true )--標記
		SetModeEx( create, EM_SetModeType_Show, true )--顯示
		SetModeEx( create, EM_SetModeType_Move, true )--移動
		SetModeEx( create, EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( create, EM_SetModeType_HideName, true )--名稱
		SetModeEx( create, EM_SetModeType_Strikback, true )--反擊
		SetModeEx( create, EM_SetModeType_SearchenemyIgnore, true )--被搜尋
		SetModeEx( create, EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( create, EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( create, EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( create, EM_SetModeType_Drag , false )--阻力
		MoveToFlagEnabled( create, false ); 
		WriteRoleValue( create  ,EM_RoleValue_IsWalk , 1  )--用跑的
		--WriteRoleValue( create[random], EM_RoleValue_Register1, ctrl )
		AddToPartition( create, RoomID )
	end
end