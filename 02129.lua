function Lua_frosty_hideobj_na() --隱藏物件劇情		
	while true do
		local hour = GetSystime(1) --抓系統時間(小時)
		local min = GetSystime(2) --抓系統時間(分鐘)
	--	say(OwnerID(), hour )
	--	say(OwnerID(), min )
		local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_RealZoneID)				
		local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流

		if Zone == 5 then  --只有出現在ZONE 5
			if  hour == 23 or hour  == 3 or hour  == 7 or hour  == 11 or hour  ==15 or hour  == 19  then  
				if min == 30 then --30分的時候進行廣播
  					RunningMsgEx( OwnerID() , 2 , 3 ,"[SC_FROSTY_NA_01]" ) 	--  (0 自己 1 區域 2 全部玩家 )。在海波拉高原中，飄散著不尋常的氣息。
				elseif min  == 45 then --45分時進行廣播
  						RunningMsgEx( OwnerID() , 2 , 3 , "[SC_FROSTY_NA_02]" ) 	-- (0 自己 1 區域 2 全部玩家 )。海波拉高原中不尋常的氣息正在凝聚。
				elseif min == 55 then --55分時廣播，執行雪人出現劇情
					BeginPlot( OwnerID(), "Lua_frosty_begin_na",0 )					
				end
	
		
			elseif hour  == 2 or hour  == 6 or hour  == 10 or hour  == 14 or hour  == 18 or hour  == 22  then
				if min == 0 then --刪除雪堆雪人王劇情
					local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Count = SetSearchAllNPC( RoomID )
					local Obj
					local NPC = {104497,116655}

					if  Count ~= 0 then
						for i=1 , Count , 1 do
							local ID = GetSearchResult()
							Obj=Role:New(ID)
							if Obj:IsNPC() == true then
								local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
								for j = 1 , table.getn( NPC ) , 1 do
									if Name == NPC[j] then  --若為陣列中的值
									BeginPlot( OwnerID(), "Lua_snowdrift_Del_na", 0 )	--刪除雪堆, 雪人王
									end
								end
							end
						end
					end
				end
			end
		end
		Sleep(600)   --一分鐘跑一次
	end
end

function Lua_frosty_begin_na()	--決定冰霜王出現的地點
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	local random = rand(20)   
	if random <= 10  then   -- 0 -20
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsgEx( OwnerID() , 2 , 3 , "[SC_FROSTY_NA_04]" ) 	-- (0 自己 1 區域 2 全部玩家 )。不尋常的氣息在海波拉高原中的雪海中逐漸凝聚成形。
		end
		sleep( 3000) --5分鐘之後
		BeginPlot( OwnerID(), "Lua_snowborn1_na" ,0 ) --出現在雪海
	else
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsgEx( OwnerID() , 2 , 3 , "[SC_FROSTY_NA_05]" ) 	-- (0 自己 1 區域 2 全部玩家 )。不尋常的氣息在海波拉高原中的霜木谷中逐漸凝聚成形。
		end
		sleep( 3000) --5分鐘之後
		BeginPlot( OwnerID(), "Lua_snowborn2_na" ,0 ) --出現在霜木谷
	end
end




function Lua_snowborn1_na()  --雪堆出生，邪惡雪人王出現
	local X = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30 }  --30個
	local Y = 0
	local Y6 = {}
	for i = 1 , 15 do   -- 產生15個
		Y = Rand(table.getn(X))+1
		Y6[i] = X[Y]
		table.remove(X,Y)
		local snowdrift = {}
		snowdrift[i] = CreateObjByFlag(116655 , 780797, Y6[i] ,1) --使用旗子產生雪堆 npc 旗子編號 數量 
		SetModeEx( snowdrift[i]  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( snowdrift[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( snowdrift[i]  , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( snowdrift[i]  , EM_SetModeType_Mark, true )--標記
		SetModeEx( snowdrift[i]  , EM_SetModeType_Move, false )--移動
		SetModeEx( snowdrift[i]  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( snowdrift[i]  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( snowdrift[i]  , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( snowdrift[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( snowdrift[i], 0 )	--讓雪堆產生
		SetPlot(snowdrift[i], "Touch" , "Lua_snowdrift_touch_na" , 50 )
	--	Say(OwnerID(),"Y6"..i.." = "..Y6[i])-- i = 第幾個 ,  y6[i]  = 數字
	end
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsgEx( OwnerID() , 2 , 3 ,  "[SC_FROSTY_NA_06]" ) 	--  (0 自己 1 區域 2 全部玩家 )。在海波拉高原的雪海中出現了冰霜王。
	end
	local Frosty = CreateObjByflag( 104497, 780797 , 0 , 1 ) --在指定編號的旗子上產生冰霜王(NPC編號,旗子編號,旗子編碼,數量)
	AddToPartition( Frosty , 0 ) 
end


function Lua_snowborn2_na()  --雪堆出生，邪惡雪人王出現
	local X = {32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61 }  --30個
	local Y = 0
	local Y6 = {}
	for i = 1 , 15 do   -- 產生15個
		Y = Rand(table.getn(X))+1
		Y6[i] = X[Y]
		table.remove(X,Y)
		local snowdrift = {}
		snowdrift[i] = CreateObjByFlag(116655 , 780797, Y6[i] ,1) --使用旗子產生雪堆 npc 旗子編號 數量 
		SetModeEx( snowdrift[i]  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( snowdrift[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( snowdrift[i]  , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( snowdrift[i]  , EM_SetModeType_Mark, true )--標記
		SetModeEx( snowdrift[i]  , EM_SetModeType_Move, false )--移動
		SetModeEx( snowdrift[i]  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( snowdrift[i]  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( snowdrift[i]  , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( snowdrift[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( snowdrift[i], 0 )	--讓雪堆產生
		SetPlot(snowdrift[i], "Touch" , "Lua_snowdrift_touch_na" , 50 )
	--	Say(OwnerID(),"Y6 "..i.." = "..Y6[i])-- i = 第幾個 ,  y6[i]  = 數字
	end
--	Say(OwnerID(), "BORN OK")
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsgEx( OwnerID() , 2 , 3 , "[SC_FROSTY_NA_07]" ) 	--  (0 自己 1 區域 2 全部玩家 )。在海波拉高原的霜木谷中出現了冰霜王。
	end
	local Frosty = CreateObjByflag( 104497, 780797 , 31 , 1 ) --在指定編號的旗子上產生冰霜王(NPC編號,旗子編號,旗子編碼,數量)
	AddToPartition( Frosty , 0 ) 
end



--雪堆的劇情
function Lua_snowdrift_touch_na()	--雪堆觸碰劇情
	SetPlot( OwnerID() , "Touch" , "Lua_snowdrift_touchcheck_na" , 50 )
end

function Lua_snowdrift_touchcheck_na()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if BeginCastBarEvent( O_ID, T_ID,"[SC_FROSTY_NA_14]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_snowdrift_touch01_na" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
	return
	end
end

function Lua_snowdrift_touch01_na(O_ID, CheckStatus)   -- <---() 內 參數一定要有
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			Hide( TargetID() )
			EndCastBar( O_ID, CheckStatus );
			local random = rand(3)   
			if random ==0  then   -- 0 -20
				GiveBodyItem( OwnerID(), 207968, 5) --給玩家5顆魔法雪球
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_08]" , C_SYSTEM )	--從沾有精靈氣息的雪堆中取得了魔法雪球。
			elseif random == 1 then
				GiveBodyItem( OwnerID(), 207968, 3) --給玩家3顆魔法雪球
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_08]" , C_SYSTEM )
			elseif random == 2 then
				GiveBodyItem( OwnerID(), 207968, 2) --給玩家2顆魔法雪球
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_08]" , C_SYSTEM )
			end

		else
			-- 失敗
			Hide( TargetID() )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_15]" , C_SYSTEM )
			EndCastBar(O_ID, CheckStatus );			
		end
		Beginplot(TargetID(), "Lua_snowdrift_hide_na" , 0 ) --執行雪球隱藏劇情
	end
end

function Lua_snowdrift_hide_na()	--雪堆隱藏劇情，隨機顯示時間
	local ran = rand(60)   
	if ran <= 20  then   -- 0 -20
		Sleep(200)  
	elseif ran >= 21 and ran <= 40  then   -- 21 -40
		Sleep(300)  
	elseif ran >= 41 and ran <= 60  then   -- 41 -60
		Sleep(350)  
	end
	Show(OwnerID(), 0)
end



--雪堆刪除劇情
function Lua_snowdrift_Del_na()  --刪除雪堆, 雪人王
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsgEx( OwnerID() , 2 , 3 ,  "[SC_FROSTY_NA_10]" ) 	--海波拉高原中不尋常的氣息已經散去。
	end
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 116655, 104497 }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID)
					end
				end
			end
		end
	end
end

--	local TempObj = { 116655 , 104497 }
--	for i = 1 ,table.getn(TempObj) do
--		Lua_DavisDelObj(TempObj[i])
--	end



--冰霜王的劇情
function Lua_frostyborn_na() --冰霜王初始劇情，一般攻擊無效
	say( OwnerID(), "[SC_FROSTY_NA_09]") --冰霜王對話：哈哈哈！看我的冰霜無敵術！
	PlayMotion( OwnerID(), 83)
	Addbuff(OwnerID(), 508060,0, -1) 
	BeginPlot( OwnerID(), "Lua_frosty_attack_na",0)
end

function Lua_frosty_attack_na()
	while true do
	local attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local random= Rand(15)+1
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local HPPercent = NowHP / MaxHP
	local X = (HPPercent*100)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then
			if  X > 50 then
				local ran1 = rand(3)
				PlayMotion( OwnerID(), 31 )
				sleep(20)
				CastSpell( OwnerID(), OwnerID(), 496236)
				sleep(50)
				if ran1== 0 then 
					say( OwnerID(), "[SC_FROSTYSPEAK_01]") -- 哈哈哈！陪我一起玩吧！
				end
			elseif X <=50 and X >=30 then
				local ran2 = rand(3)
				if random <5 then --5/15
					if ran2== 0 then 
					say( OwnerID(), "[SC_FROSTYSPEAK_02]") --別跑！看我的冰霜凍結術！！
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
					CastSpell( OwnerID(), OwnerID(), 496237)
					sleep(50)
				else	
					if ran2== 1  then 
					say( OwnerID(), "[SC_FROSTYSPEAK_03]") -- 哈哈！通通變成雪人吧！
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
					CastSpell( OwnerID(), OwnerID(), 496236)
					sleep(50)
				end
			elseif X < 30 then --當雪人的血量低於30%
				local ran3 = rand(3)
				if random == 1 then -- 1/15
					Say( OwnerID(), "[SC_FROSTYSPEAK_05]" ) --唉呀！你也打得太用力了吧！看我的冰霜恢復術！
					PlayMotion( OwnerID(), 60)
					CastSpell( OwnerID(), OwnerID(), 496086)

				elseif random >1 and random <8 then -- 8/15
					if ran3== 0  then 
					say( OwnerID(), "[SC_FROSTYSPEAK_04]") -- 圓滾滾！圓滾滾！看我的大雪球！！
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
					CastSpell( OwnerID(), OwnerID(), 496238)
					sleep(50)
				else
					if ran3== 1  then 
					say( OwnerID(), "[SC_FROSTYSPEAK_03]") -- 哈哈！通通變成雪人吧！
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
					CastSpell( OwnerID(), OwnerID(), 496236)
					sleep(50)
				end
			end
		end
	sleep(100)
	end
end


function Lua_frostydead_na()	--冰霜王死亡劇情
	local Obj = Role:new(OwnerID())
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	Fairy = CreateObj( 116181, BaseX, BaseY, BaseZ, BaseDir, 1 ) --出現雪人精靈
	AddToPartition(Fairy,0)
	say( OwnerID(), "[SC_FROSTY_NA_11]") -- 哼！別以為這樣就打敗了我，我一定會再回來的！
	BeginPlot( Fairy, "Lua_snowdrift_Del_na", 0 )	--刪除所有的NPC
--	local random = rand(10) --2012 暖冬節刪除
--	if random < 6 then --60%的機率開啟冰凍海波拉的入口
--	--	say( Fairy , random)
--		BeginPlot(  Fairy, "Lua_storm_path_start", 0 ) 	--執行傳送到358劇情
--	end	
--	sleep(50)
	BeginPlot( Fairy, "Lua_snowfairy_Del_na", 0 )	--執行雪人精靈刪除劇情，三分鐘之後刪除
	return true
end

	
--精靈雪球的劇情
function Lua_magicsnowball1_na() --使用精靈雪球的效果
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Boss = 104497
	--Owner = 玩家自己
	--Target=NPC/其它玩家	
	if CheckDistance( OwnerID(), TargetID(), 150 ) == true then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~=1  and OrgID ~= Boss or TargetID() == OwnerID()  then  --目標不是玩家也不是BOSS
			ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_FROSTY_NA_16]" , C_SYSTEM ) --<CS>無法對此目標使用精靈雪球。</CS>
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_FROSTY_NA_16]" , 0 )	--<CS>無法對此目標使用精靈雪球。</CS>	
			return false
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1  and TargetID() ~= OwnerID() then --目標是玩家
			if CheckBuff( TargetID(), 508038 ) == true then --檢查玩家身上是否有雪人BUFF，對雪人狀態的玩家使用，可以解除雪人狀態
				return true	
			else
				ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_FROSTY_NA_16]" , C_SYSTEM ) --<CS>無法對此目標使用精靈雪球。</CS>
				ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_FROSTY_NA_16]" , 0 )	--<CS>無法對此目標使用精靈雪球。</CS>	
				return false
			end
		elseif OrgID == Boss then --目標是BOSS
			return true
		end
	end
	sleep(1)
end

function Lua_magicsnowball2_na()	--檢查目標
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Boss = 104497

	if CheckBuff( TargetID(), 508038 ) == true then 
		CancelBuff( TargetID(), 508038) -- 刪除雪人BUFF
		CancelBuff( TargetID(), 508036) --刪除寒顫BUFF
		AddBuff( OwnerID(),  508098 , 0, 7200 ) --持續時間2小時，紀錄玩家確實有攻擊冰霜王，兌換獎勵的憑證
		ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_FROSTY_NA_12]" , C_SYSTEM ) --你幫助其它的冒險者恢復原樣。
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_FROSTY_NA_12]" , 0 )	--你幫助其它的冒險者恢復原樣。

		local X = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem22) --幫助玩家計次
		WriteRoleValue(OwnerID(),  EM_LuaValueFlag_UseItem22 , X+1 )
		local New = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem22) --幫助玩家計次
	--	Say( OwnerID(), "X="..X..", NEW="..New)

	elseif OrgID == Boss then --目標為冰霜王
	--Owner= 玩家
	--Target=冰霜王
		CastSpell( OwnerID() , TargetID() , 496240 ) 
		AddBuff( OwnerID(),  508098 , 0, 7200 ) --持續時間2小時，紀錄玩家確實有攻擊冰霜王，兌換獎勵的憑證
		local Y = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem21) --攻擊冰霜王計次
		WriteRoleValue(OwnerID(),  EM_LuaValueFlag_UseItem21 , Y+1 )	
		local NEW = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem21) --攻擊冰霜王計次
	--	Say( OwnerID(), "Y="..Y..", NEW="..NEW)
	end
end


--雪人精靈的初始劇情
function Lua_snowfairy_born_na() 
--Owner 玩家
--Target 雪人
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
--	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --檢查NPC與玩家的距離
	SetSpeakDetail( OwnerID(), GetString("SC_FROSTY_NA_FAIRY2") ) --看似和平的這片雪地，有時寧靜的令人感到不安。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FROSTY_NA_17"), "Lua_snowfairy_exchange_na", 0 ) --繳交10張我是乖寶寶證書兌換獎勵
	if CheckBuff( OwnerID(), 508098) == true then --檢查玩家是否有攻擊冰霜王
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FROSTY_NA_13"), "Lua_snowfairy_reply_na", 0 ) --協助擊敗了冰霜王
	end
	sleep(10)
end


function Lua_snowfairy_reply_na()
	SetSpeakDetail( OwnerID(), GetString("SC_FROSTY_NA_FAIRY1") ) --勇敢的冒險者，多虧了你的協助才能順利消滅冰霜王。最近海波拉高原時常飄散著不同以往的氣息，看來冰霜王還是會伺機再度出現，希望到時候你能夠繼續協助我們抑制這股令人不安的氣息。
	if CheckFlag ( OwnerID(), 544422) ==false then
		GiveBodyItem( OwnerID(), 206437,1 )
		SetFlag( OwnerID(), 544422, 1 )
	end
	GiveBodyItem( OwnerID(), 725523, 1 ) --給獎勵			
	CancelBuff(OwnerID(), 508098)
	BeginPlot( OwnerID(), "Lua_snowmantitle_na", 0) 
end

function Lua_snowfairy_exchange_na()
	if CountBodyItem( OwnerID(), 206437) >= 10 then
		DelBodyItem( OwnerID(), 206437, 10 )
		GiveBodyItem( OwnerID(), 725524, 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_FROSTY_NA_FAIRY3") ) -- 希望你會喜歡這份禮物。暖冬節快樂！
	else 
		SetSpeakDetail( OwnerID(), GetString("SC_FROSTY_NA_FAIRY4") ) --你似乎沒有足夠的我是乖寶寶證書。
	end
end


function Lua_snowmantitle_na()
	local HIT = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem21)
	local HELP = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem22)

	if HIT >=1000 and HELP >=100  then
		GiveBodyItem( OwnerID(), 530665, 1)
	end
	if HIT >= 500  then 
		GiveBodyItem( OwnerID(), 530663, 1)
	end
	if HELP >= 500  then
		GiveBodyItem( OwnerID(), 530664, 1)
	end
end	

function Lua_snowfairy_Del_na()
	sleep(1800) --3分鐘之後刪除雪人精靈，10為一秒
	DelObj(OwnerID())
end



--測試用
function Lua_snowman_useitem_na()
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem21, 0)
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem22, 0)
end

function Lua_snowman_hit498_na()
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem21, 498)
end

function Lua_snowman_help498_na()
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem22, 498)
end

function Lua_snowman_useitem998_na()
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem21, 998)
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem22, 998)

end

function Lua_snowman_check_na()
	local HIT = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem21)
	local HELP = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem22)
	Say( OwnerID(), "Hit="..HIT.."/ Help="..HELP)
end


function Lua_Frostyskillcheck_na()
	local BuffType = 0
	local Count = BuffCount ( TargetID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 68 then				       	    --/*有騎乘狀態
	--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --使用對象有騎乘效果，無法使用。
		return false
	else
		return TRUE
	end
end

function Lua_frosty_na_deldaily()
	SetFlag( OwnerID(), 544422,0 )
end