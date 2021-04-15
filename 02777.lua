-- 5.0.6婚禮系統-婚禮寵物

-- 1. LV5 - LV10 夫妻組隊法術劇情
-- 提示玩家領取寵物

function lua_mika_weddingpet_01()
	local Player = OwnerID()
	local todaykey = 545684  -- 今天已獲得 婚禮寵物訊息
	local gotlv1key = 545685  -- 已領取過婚禮寵物 

	if CheckFlag(player, gotlv1key ) == false then -- 沒  已領取過婚禮寵物
		if CheckFlag(player, todaykey ) == false then  --  沒 今天已獲得婚禮寵物訊息
			ScriptMessage( player, player, 1, "[SC_MERRYPET_01]", C_SYSTEM )
			ScriptMessage( player, player, 0, "[SC_MERRYPET_01]", C_SYSTEM )
			Setflag(player, todaykey, 1)   -- GOT 今天已獲得婚禮寵物訊息
		end
	end
end


-- 任務NPC -  115000 菲娜．弗雷斯  寵物領取NPC
function lua_mika_weddingpet_NPC_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local todaykey = 545684  -- 今天已獲得 婚禮寵物訊息
	local gotlv1key = 545685  -- 已領取過婚禮寵物 

	if CheckFlag(player, gotlv1key ) == false then   -- 沒有 已領取過婚禮寵物  key
		if CheckFlag(player, todaykey ) == true then  -- 有今天已獲得婚禮寵物訊息 key
			SetSpeakDetail(Player, "[SC_MERRYPET_04]" )
			AddSpeakOption( Player, Player, "[SC_MERRYPET_05]" , "lua_mika_weddingpet_NPC_02", 0 ) -- 我要領取[SC_MERRYPET_00]
		else  -- 未符合領取資格
			SetSpeakDetail(Player, "[SC_MERRYPET_02]" )  -- 
		end
	else  -- 已領過了
		SetSpeakDetail(Player, "[SC_MERRYPET_08]" )   -- 有 已領取過婚禮寵物  key
		AddSpeakOption( Player, Player, "[SC_MERRYPET_09]" , "lua_mika_weddingpet_NPC_03", 0 ) -- 我想了解[SC_MERRYPET_00]的培育方式
	end
end

function lua_mika_weddingpet_NPC_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local todaykey = 545684  -- 今天已獲得 婚禮寵物訊息
	local gotlv1key = 545685  -- 已領取過婚禮寵物 
	local petid =  241971  

	SetSpeakDetail(Player, "[SC_MERRYPET_10]" )   -- 領取時對話
	SetFlag(Player, gotlv1key, 1 ) -- 給與key 1 
	GiveBodyItem(Player, petid, 1  )
 
end

-- 融合方式
function lua_mika_weddingpet_NPC_03()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_MERRYPET_10]" )   --  融合方式
end