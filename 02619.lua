function Lua_na_Q425021_CHECK() --神賜水滴任務，檢查玩家身上是否有汲水空瓶
	local Owner = OwnerID()
	local Target = TargetID()
	if CountBodyItem( Owner , 241076 ) >=1 then
		return true	 
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_425021_1]" , 0 ) --[SC_425021_1]手邊沒有可以盛裝露水的容器！
		return false
	end
end


function Lua_na_Q425021_DEL() --取得神賜水滴，刪除空瓶
	local Owner = OwnerID()
	local Target = TargetID()
	local R = rand(100)+1
	if  R < 30 then
		GiveBodyItem( Owner , 241077 , 1 )
		DelBodyItem( Owner , 241076 , 1 ) --刪除汲水空瓶
		return true	 
	else
		ScriptMessage( Owner , Owner , 2 , "[SC_425021_2]" , C_SYSTEM ) --[SC_425021_2]葉面上的水珠滑落到地面了！
		return false
	end
end



----
--測試用NPC
function Lua_na_117251_Quest_TEST()

end

---------接續702584 LuaQ_425071_SAY 後半段 ------------

function Lua_na_120245_YES() --隱藏任務
	local Owner = OwnerID() 
	SetSpeakDetail( Owner , "[SC_120245_Q_4]" ) --
 	AddSpeakOption ( Owner , Owner , "[SC_120245_Q_5]" , "Lua_na_120245_YES2", 0) --承諾會成為一位誠實的人
end

function Lua_na_120245_YES2()
	local Owner = OwnerID() 
	SetSpeakDetail( Owner , "[SC_120245_Q_6]" ) --很好！希望你未來不會因為冒險旅途的險惡，而遺忘此刻的承諾！
	GiveBodyItem( Owner , 530876 , 1 )
end

function Lua_na_120245_NO()
	local Owner = OwnerID() 
	SetSpeakDetail( Owner , "[SC_120245_Q_7]" ) -- 是嗎……你好好想想吧！
end



---清洗銀幣
function Lua_na_425023() --清洗銀幣之後，會出現怪物-裂縫葛斯帕爾
	local Player = OwnerID()
	local Target = TargetID()
	local Obj = Role:new( Target )  -- 取物件得 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local Monster = CreateObj(  106674  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在物件座標 X.Y.Z.Dir 身上準備創立物件 
	SetModeEx(Monster, EM_SetModeType_Strikback, true )--反擊
	SetModeEx(Monster, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx(Monster, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx(Monster, EM_SetModeType_Mark, true )--標記
	SetModeEx(Monster, EM_SetModeType_Move, true )--移動
	SetModeEx(Monster, EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx(Monster, EM_SetModeType_HideName, false )--名稱
	SetModeEx(Monster, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx(Monster, EM_SetModeType_Fight , true  )--可砍殺攻擊
	SetModeEx(Monster, EM_SetModeType_Drag , false )--阻力
	SetModeEx(Monster, EM_SetModeType_Show, true )--顯示
	AddToPartition( Monster , 0 ) -- 建立物件
	BeginPlot( Monster , "Lua_na_425023_monster_attack" , 0 )
	Setflag(Player, 545768,  1)

end

function Lua_na_425023_monster_attack()
	SetAttack( OwnerID(), TargetID()) --讓 裂縫葛斯帕爾 主動攻擊玩家
end


function Lua_na_120372_check() --點擊瀑布時，檢查身上有沒有古老的硬幣
	local Owner = OwnerID()
	local Target = TargetID()
	if CountBodyItem( Owner , 241079 ) >=1 then
		return true
	else
		return false
	end
end



function Lua_na_425023_monster_dead()

	local Owner = OwnerID()
	local Target = TargetID()
	local Step1 = Checkflag( Target , 545768 ) --已經清洗銀幣
	local Step2 = Checkflag( Target , 545775 ) --尚未拿到裂縫結晶
	
	if Checkquest( Target , 425023, 0 ) == true and Step1 == true and Step2 == false then 
		DelBodyItem( Target , 241079 ,1 ) --刪除 古老的銀幣
		ScriptMessage ( Target , Target , 1 , "[SC_425023_0]" , 0 )
		Setflag( Target , 545771 , 1 ) --給予玩家完成任務的條件
		Setflag( Target , 545775 , 1 ) --給予玩家完成任務的條件
		GiveBodyItem( Target , 241080 , 1 ) --給予玩家裂縫結晶
	end

end


function Lua_na_241080_DEL() --玩家刪除裂縫結晶會刪除KEYITEM 545775
	local Owner = OwnerID()
	Setflag( Owner , 545775 , 0 ) -- 『神蹟帶來的是……』
end


--工藝天分，工具判斷
function Lua_na_120376() -- 細工雕刻工具
	SetPlot( OwnerID() , "touch" , "Lua_na_120376_touch" , 50 )
end


function Lua_na_120377() --造型雕刻工具
	SetPlot( OwnerID() , "touch" , "Lua_na_120377_touch" , 50 )
end


function Lua_na_120376_touch() --細工雕刻工具
	local Owner = OwnerID()
	local Target = TargetID()
	local Qcheck = CheckAcceptQuest( Owner , 425024 ) --檢查身上是否有任務 工藝天分


	if Qcheck == true then --若玩家已接任務
		if CountBodyItem( Owner , 240808 ) >= 1 then
			return false	
		elseif  CheckFlag( Owner , 545773 ) == true then
			ScriptMessage ( Owner , Owner , 1 , "[SC_425024_0]" , 0 ) --你已經使用過這項工具了
			return false	
		else
			if BeginCastBarEvent( Owner , Target ,"[SC_425024_1]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_120376_castbar" ) ~= 1 then --20為bar動作時間  使用雕刻工具
			end
		end
	end			
end


function Lua_na_120376_castbar(Owner , CheckStatus )
	local Owner = OwnerID()
	local Target = TargetID()
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( Owner, CheckStatus );

			if CheckFlag( Owner , 545772 ) == true then --已經使用過細工雕刻工具
				GiveBodyItem ( Owner , 545773 , 1 )
				DelBodyItem (Owner , 240807 , 1 ) --刪除 雕刻用石頭
				GiveBodyItem( Owner , 240808 , 1 ) --給予石雕作品	
			else
				GiveBodyItem ( Owner , 545773 , 1 )
			end
		else
			-- 失敗
			EndCastBar( Owner, CheckStatus );
		end
	end
end


function Lua_na_120377_touch() --造型雕刻工具
	local Owner = OwnerID()
	local Target = TargetID()
	local Qcheck = CheckAcceptQuest( Owner , 425024 ) --檢查身上是否有任務 工藝天分

	if Qcheck == true then --若玩家已接任務
		if CountBodyItem( Owner , 240808 ) >= 1 then
			return false 
		elseif  CheckFlag( Owner , 545772 ) == true then
			ScriptMessage ( Owner , Owner , 1 , "[SC_425024_0]" , 0 ) --你已經使用過這項工具了
			return false

		else
			if BeginCastBarEvent( Owner , Target ,"[SC_425024_1]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_120377_castbar" ) ~= 1 then --20為bar動作時間  使用雕刻工具
			end
		end
	end
end



function Lua_na_120377_castbar(Owner , CheckStatus )
	local Owner = OwnerID()
	local Target = TargetID()
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( Owner , CheckStatus );

			if CheckFlag( Owner , 545773 ) == true then
				GiveBodyItem ( Owner , 545772 , 1 )
				DelBodyItem ( Owner , 240807 , 1 ) --刪除 雕刻用石頭
				GiveBodyItem( Owner , 240808 , 1 ) --給予石雕作品	
			else
				GiveBodyItem ( Owner , 545772 , 1 )
			end
		else
			-- 失敗
			EndCastBar(Owner , CheckStatus );
		end
	end
end


function Lua_na_240803_Check() --迷幻獸籠使用劇情 檢查目標
	local Owner = OwnerID()
	local Target = TargetID()
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID ) 
	local NowHP = ReadRoleValue( Target , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( Target , EM_RoleValue_MaxHP)
	local HPPercent = NowHP / MaxHP
	local X = (HPPercent*100)

	if OrgID == 106564 then --如果目標是任務怪
		if X > 30 then
			ScriptMessage ( Owner , Owner , 1 , "[SC_240803_1]" , 0 )  --捕捉失敗
			return false
		elseif X <=5 then --目標過於虛弱，無法作為研究樣本
			ScriptMessage ( Owner , Owner , 1 , "[SC_240803_2]" , 0 ) --目標過於虛弱，無法作為研究樣本
			return false
		elseif X == 0 then --目標錯誤
			ScriptMessage ( Owner , Owner , 1 , "[SC_493625_2]" , 0 )  --目標已死亡
			return false
		else --只有 6-30% 血量的目標可以被捕捉	
				return true
		end

	else
		ScriptMessage ( Owner , Owner , 1 , "[SC_421249_4]" , 0 )  	--目標錯誤
		return false
	end
end


function Lua_na_240803_Get()
	local Owner = OwnerID()	
	local Target = TargetID()	
	GiveBodyItem( Owner , 240804 , 1 )
	Hide( Target)
	killid( Target , Target)
end



--function Lua_106564_reset()
--	sleep( 50)
--	Show( OwnerID() , 0 )
--end



function Lua_119881_check() --伊波．影鉤檢查玩家身上是否有 241080裂縫結晶
	local Owner = OwnerID() 
	local Target = TargetID()
	if CheckAcceptQuest( Owner , 425023) == true then --已接受任務
		if CheckFlag( Owner , 545768 ) == true then --已點擊過瀑布
			if CountBodyItem( Owner , 241080) >=1 then  --如果身上有 裂縫結晶
			--	say(Owner, "123123" )
				LoadQuestOption( Owner)

			elseif CountBodyItem(Owner , 241079 ) == 0 then--如果身上沒有裂縫結晶, 已經打死過裂縫葛斯帕爾，身上沒有銀幣
				SetSpeakDetail( Owner , "[SC_425023_2]" ) --你應該是遺漏了什麼吧！我這裡還有一個[241079]，如果發現什麼特別的東西，也許就是『神蹟』帶來的禮物……
			--	say( Owner , "123")
				GiveBodyItem( Owner , 241079 , 1 ) --給予玩家古老的硬幣
			else				
				SetSpeakDetail( Owner , "[SC_425023_1]" ) -- 你真的看見「神蹟」了嗎？我想你應該太害怕，所以轉身逃走了吧！
				--say(Owner, "NONONO" )
			end
		else
			SetSpeakDetail( Owner , "[SC_425023_1]" ) -- 你真的看見「神蹟」了嗎？我想你應該太害怕，所以轉身逃走了吧！	
		end
	else
		LoadQuestOption( Owner)
	end
end


---------------------

function lua_Z31_Q425040_touch()
	local obj = OwnerID()
	Setplot(obj,  "touch" , "lua_Z31_Q425040_touch2" , 50 )
end

--讀取施法條前檢查
function lua_Z31_Q425040_touch2()

	local Player = OwnerID()
	local NPC = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local questid = 425040
	local keyid = 545769 

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckAcceptQuest( Player, questid ) == true  then
		if CheckFlag(Player, keyid )  == false then
			if Mount == true then --不在後座
				if BeginCastBarEvent( Player , NPC , "[120661]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_Z31_Q425040_touch3") ~= 1 then 
				--3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
				end
			else --在後座
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425040_01]" , 0 ) --看起來有點詭異的藍光...。
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425040_01]" , 0 ) --看起來有點詭異的藍光...。
	end

end

function lua_Z31_Q425040_touch3( Player , CheckStatus )
	local Target = TargetID()   -- npc


	DW_CancelTypeBuff( 68 , Player) --騎乘坐騎時，點擊下馬

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			BeginPlot(Target, "lua_mika_Q425040_objborn", 0 )  
			EndCastBar( Player , CheckStatus ) --清除施法條	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end



function lua_mika_Q425040_objborn()
	local OID = OwnerID()   -- OBJ
	local Player = TargetID()
	local Room = ReadRoleValue( OID, EM_RoleValue_RoomID )
	Local keyid = 545769 -- 任務條件
	local npcid = 106566  -- 暗能遊蟲

	BeginPlot(OID, "lua_mika_Q425040_hidden", 0 )  

	local NPC = Lua_CreateObjByDir( OID , npcid , 50 , 0);
	SetModeEx(NPC, EM_SetModeType_Move, true )--移動
	SetModeEx(NPC, EM_SetModeType_Show, true )--顯示

	SetModeEx(NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx(NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx(NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx(NPC, EM_SetModeType_Mark, false )--標記
	SetModeEx(NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx(NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx(NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx(NPC, EM_SetModeType_Fight , false  )--可砍殺攻擊
	SetModeEx(NPC, EM_SetModeType_Drag , false )--阻力

	AddToPartition( NPC , Room ) -- 建立物件
	sleep(15)

	local X = ReadRoleValue( NPC, EM_RoleValue_X )
	local Y = ReadRoleValue( NPC, EM_RoleValue_Y )
	local Z = ReadRoleValue( NPC, EM_RoleValue_Z )
		
	local Range = 20 +  rand(6) --亂數移動範圍
	MoveDirect( NPC, X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )

	Setflag(Player, keyid , 1)
	sleep(15)
	Delobj(NPC)
end


function lua_mika_Q425040_hidden()
	local npc = OwnerID()
	local sleeptime = 300    --30

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )

end



function Lua_425023_endMessage() --暗中協助 完成後的訊息
	local Target = TargetID()
	ScriptMessage( Target  , Target  , 1 , "[SC_425023_3]" , 0)
end