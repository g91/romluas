--巧藝節獎勵兌換

--兌換獎勵NPC 初始對話劇情
function lua_mika_skllcraft_reward_00()
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家

	SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_REWARD01]"   )  -- 冒險者，你好～我是巧藝節活動獎勵兌換員！ (略)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLCRAFT_01]" , "lua_mika_skllcraft_story", 0 )  -- 我想知道巧藝節的由來 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_29]" , "lua_mika_skllcraft_reward_01", 0 ) -- 我想兌換獎勵
end

--選項-我想知道巧藝節的由來 
function lua_mika_skllcraft_story()
	SetSpeakDetail( OwnerID(), "[SC_SKILLCRAFT_02]"   )  -- 巧藝節story (略)
end

--選項-兌換獎勵
function lua_mika_skllcraft_reward_01()

	local itemid = 240060  ---需求物品編號
	local needcount = 6  -- 需求數量  要改數量時請從這裡改
	local playercount = CountBodyItem(OwnerID(), itemid)   --玩家身上需求物品的數量
	local rewardid = 242090   --巧藝節獎勵 - 辛勤巧藝禮盒

	if playercount < needcount then -- 數量不足
		SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
	else
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), itemid, needcount )  -- DEL 兌換物品
		GiveBodyitem(OwnerID(), rewardid, 1 )   -- 給獎勵編號
		DesignLog( OwnerID() , 113933 , "craft festival - reward change. " ) -- 巧藝節獎勵兌換計次 (6.0.1後)
		if DW_Rand(100) <= 3 then	--3%機率獲得
			GiveBodyitem(OwnerID(), 241456, 1 ) --2012 新增配合星座寵物的材料獎勵   雙子幻獸結晶
		end
	end
end