--德國需求 後台任務模板工具

function lua_mika_questcreate_Q1()
	local getkey = 544424 --當天接過任務的key(固定)
	local okkey = 544425 --當天完成任務的key(固定)
	local itemid = GetDBKeyValue("ItemID_100") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --任務需求道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_100")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_100")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_100")   --任務需求角色等級 (後台)
	
	if Checkflag(OwnerID(), okkey) == True then --如果有當天完成任務key
		SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_04]" )  --說一般對話
	else
		if Checkflag(OwnerID(), getkey ) == True then --如果有當天已接過任務key
			local count = CountBodyItem(OwnerID(), itemid )  --玩家身上道具數量
			if  count >= needAmount then --有足夠任務道具
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_04]" )  --說一般對話
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_COMPLETE]" , "lua_mika_questcreate_Q1_complete", 0 ) --選擇-完成任務
			else
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_02]" )  --說未完成對話
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GIVEUP]" , "lua_mika_questcreate_Q1_giveup", 0 ) --選擇-放棄任務
			end
		else
			local PlayerLv =  ReadRoleValue( OwnerID() , EM_RoleValue_LV)
			if PlayerLv >= needlv then --顯示可接任務
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_01]" )  --說任務內容
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GET]" , "lua_mika_questcreate_Q1_get", 0 ) --選擇-接受任務
			else
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_04]" )  --說一般對話
			end
		end
	end
end

function lua_mika_questcreate_Q1_giveup()
	local getkey = 544424 --當天接過任務的key(固定)
	CloseSpeak(OwnerID())
	Setflag(OwnerID(), getkey, 0 )  --刪除key
	CancelBuff(OwnerID(), 506949) -- 刪除 檢查任務條件的buff
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_GIVEUP2]", 0 )   --你已放棄此任務。
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_GIVEUP2]" , 0 ) 

end


function lua_mika_questcreate_Q1_get()  --選擇-接受任務
	local getkey = 544424 --當天接過任務的key(固定)
	local okkey = 544425 --當天完成任務的key(固定)
	local itemid = GetDBKeyValue("ItemID_100") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --任務需求道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_100")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_100")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_100")   --任務需求角色等級 (後台)

	CloseSpeak(OwnerID())
	Setflag(OwnerID(), getkey, 1 )
	Addbuff(OwnerID(), 506949, 0, -1   )   -- 掛上檢查任務條件的buff  目前buff暫無時間限制 可能再改
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_GETMSG][$SETVAR1=".."["..itemid.."]".."][$SETVAR2="..needAmount.."]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_GETMSG][$SETVAR1=".."["..itemid.."]".."][$SETVAR2="..needAmount.."]" , C_SYSTEM ) 
	--請至原野狩獵怪物取得[$VAR2]個[$VAR1]，完成後向[116666]回報任務。
end

function lua_mika_questcreate_Q1_complete() --選擇-完成任務
	local getkey = 544424 --當天接過任務的key(固定)
	local okkey = 544425 --當天完成任務的key(固定)
	local itemid = GetDBKeyValue("ItemID_100") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --任務需求道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_100")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_100")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_100")   --任務需求角色等級 (後台)

	local count = CountBodyItem(OwnerID(), itemid )  --玩家身上道具數量
	if  count >= needAmount then --有足夠任務道具
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_COMPLETE1]", C_SYSTEM )   --恭喜你完成任務！
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_COMPLETE1]", C_SYSTEM ) 
		DelBodyItem(OwnerID(), itemid, needAmount )  --刪除任務道具
		GiveBodyItem(OwnerID(), rewardid, RewardAmount ) --給與獎勵道具
		Setflag(OwnerID(), okkey, 1 )
		Setflag(OwnerID(), getkey, 0 )
	else
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_NOITEM]", 0 )   --你所持任務道具不足，無法完成任務。
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_NOITEM]" , 0 ) 
	end
end

--------------跑腿任務--------------

--NPC-A 初始對話
function lua_mika_questcreate_Q2()
	local getkey = 544426 --當天接過任務的key(固定)
	local okkey = 544427 --當天完成任務的key(固定)
	local givekey = 544708 --當天達成任務條件的key(固定)
	local itemid = GetDBKeyValue("ItemID_110") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --任務需求道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_110")   --任務需求角色等級 (後台)

	if Checkflag(OwnerID(), okkey) == True then --如果有當天已完成任務key
		SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_04]" )  --說一般對話
	else
		if Checkflag(OwnerID(), getkey ) == True then --如果有當天已接過任務key
			if  Checkflag(OwnerID(), givekey ) == True then --如果有達成條件key = 完成任務
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_06]" )  --說達成條件對話
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_COMPLETE]" , "lua_mika_questcreate_Q2_complete", 0 ) --選擇-完成任務
			else
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_02]" )  --說未完成對話(NPC-A)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GIVEUP]" , "lua_mika_questcreate_Q2_giveup", 0 ) --選擇-放棄任務
			end
		else
			local PlayerLv =  ReadRoleValue( OwnerID() , EM_RoleValue_LV)
			if PlayerLv >= needlv then --顯示可接任務
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_01]" )  --說任務內容
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GET]" , "lua_mika_questcreate_Q2_get", 0 ) --選擇-接受任務
			else
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_04]" )  --說一般對話
			end
		end
	end
end

function lua_mika_questcreate_Q2_giveup()
	local getkey = 544426 --當天接過任務的key(固定)
	local itemid = GetDBKeyValue("ItemID_110") --任務需求道具ID (後台)
	local count = CountBodyItem(OwnerID(), itemid ) --玩家身上任務道具數量

	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(), itemid , count )
	Setflag(OwnerID(), getkey, 0 )  --刪除key
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_GIVEUP2]", 0 )   --你已放棄此任務。
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_GIVEUP2]" , 0 ) 
end

--NPC-A 接下任務
function lua_mika_questcreate_Q2_get()
	local getkey = 544426 --當天接過任務的key(固定)
	local okkey = 544427 --當天完成任務的key(固定)
	local itemid = GetDBKeyValue("ItemID_110") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --任務需求道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_110")   --任務需求角色等級 (後台)
	local givekey = 544708 --當天達成任務條件的key(固定)

	CloseSpeak(OwnerID())
	Setflag(OwnerID(), getkey, 1 )
	GiveBodyItem(OwnerID(), itemid , needAmount ) --給與任務道具
--	Addbuff(OwnerID(), )   
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_GETMSG1][$SETVAR1=".."["..itemid.."]".."]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_GETMSG1][$SETVAR1=".."["..itemid.."]".."]" , C_SYSTEM ) 
	--
end

--NPC-B- 初始對話
function lua_mika_questcreate_Q2_B()
	local getkey = 544426 --當天接過任務的key(固定)
	local okkey = 544427 --當天完成任務的key(固定)
	local givekey = 544708 --當天達成任務條件的key(固定)

	local itemid = GetDBKeyValue("ItemID_110") --任務道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --任務道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_110")   --任務需求角色等級 (後台)

	local count = CountBodyItem(OwnerID(), itemid )  --玩家身上道具數量
	if Checkflag(OwnerID(), getkey ) == True and count >= needAmount then --如果有當天已接過任務 且任務道具數量正確 key
		SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_03]" )  --說達成條件對話(B)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GIVE]" , "lua_mika_questcreate_Q2_B2", 0 ) --選擇-交付物品
	else
		SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_05]" )  --說一般對話 玩家未接任務
	end
end

--NPC-B --選擇-交付物品
function lua_mika_questcreate_Q2_B2()
	local getkey = 544426 --當天接過任務的key(固定)
	local okkey = 544427 --當天完成任務的key(固定)
	local givekey = 544708 --當天達成任務條件的key(固定)
	local itemid = GetDBKeyValue("ItemID_110") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --任務需求道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_110")   --任務需求角色等級 (後台)

	local count = CountBodyItem(OwnerID(), itemid )  --玩家身上道具數量
	if  count >= needAmount then --有足夠任務道具
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), itemid, needAmount )  --刪除任務道具
		Setflag(OwnerID(), givekey, 1 )  --給 重要物品 達成任務條件
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_BACK]", C_SYSTEM )   --請去找[116663]回報任務。
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_BACK]" , C_SYSTEM ) 
	else
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_NOITEM]", 0 )   --你所持任務道具不足，無法完成任務。
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_NOITEM]" , 0 ) 
	end
end


function lua_mika_questcreate_Q2_complete()
	local getkey = 544426 --當天接過任務的key(固定)
	local okkey = 544427 --當天完成任務的key(固定)
	local givekey = 544708 --當天達成任務條件的key(固定)
	local itemid = GetDBKeyValue("ItemID_110") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --任務需求道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_110")   --任務需求角色等級 (後台)

	CloseSpeak(OwnerID())
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_COMPLETE1]", C_SYSTEM )   --恭喜你完成任務！
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_COMPLETE1]", C_SYSTEM ) 
	GiveBodyItem(OwnerID(), rewardid, RewardAmount ) --給予獎勵道具
	Setflag(OwnerID(), okkey, 1 )
	Setflag(OwnerID(), getkey, 0 )
	Setflag(OwnerID(), givekey, 0 )
end

---基本法術劇情
function lua_mika_QTool_itemcheck() 
 -- 此劇情綁在 [基本法術-506949] 每5秒觸發的 [法術集合-497638] - [ 基本法術-505821] 上  

	local itemid = GetDBKeyValue("ItemID_100") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --任務需求道具數量 (後台)
	local count = CountBodyItem(OwnerID(), itemid )  -- 玩家持有的 任務道具數量

--	Say(OwnerID(), needAmount )
--	Say(OwnerID(), count )
	if count >= needAmount then  --若玩家持有 >= 任務需求量, 即符合任務條件
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_OKMSG]", C_SYSTEM )   
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_OKMSG]" , C_SYSTEM ) 
		-- 達成任務條件，快向[116666]回報任務吧。
		CancelBuff(OwnerID(), 506949 )
	end
end