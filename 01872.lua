--菲律賓國慶活動

--NPC 吉德
Function lua_mika_phbirthday_npc01_1()
	SetSpeakDetail( OwnerID(), "[SC_VNMAYDAY_01]" )--你想知道哪些事情呢？
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_VNMAYDAY_02]" , "lua_mika_phbirthday_npc01_2", 0 ) --查看勝利之日的歷史
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_VNMAYDAY_03]" , "lua_mika_phbirthday_npc01_3", 0 ) --查看五月節的歷史
end

Function lua_mika_phbirthday_npc01_2() --查看勝利之日的歷史
	SetSpeakDetail( OwnerID(), "[SC_VNMAYDAY_04]" )--4月30日在越南為一年一次的節日...(略)  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_phbirthday_npc01_1", 0 ) --回到上一層
end

Function lua_mika_phbirthday_npc01_3() --查看五月節的歷史
	SetSpeakDetail( OwnerID(), "[SC_VNMAYDAY_05]" )--五月節提及了各種勞工慶祝的引導...(略)  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_phbirthday_npc01_1", 0 ) --回到上一層
end

-- NPC 優菲
Function lua_mika_phbirthday_npc02_1()
	SetSpeakDetail( OwnerID(), "[SC_VNMAYDAY_06]" )--為了慶祝這個節日...(略)  
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_0908SEANSON_03]" , "lua_mika_phbirthday_npc02_2", 0 ) --我想兌換獎勵
end

Function lua_mika_phbirthday_npc02_2() --我想兌換獎勵
	local item = CountBodyItem(OwnerID(), 207080 ); -- 檢查 幸運票券 數量
	if item >=3 then  --數量未定
		CloseSpeak(OwnerID())
		GiveBodyItem(OwnerID(), 725150 , 1 )  --給獎勵 掉寶 菲律賓專用獎勵
		DelBodyItem(OwnerID(), 207080 , 3 ) --扣幸運票券x3
	else 
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--你所持的物品數量不足。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_phbirthday_npc02_1", 0 ) --回到上一層
	end
end

function lua_mika_phbirthday_rewardtest()  --一次給20掉寶
	GiveBodyItem(OwnerID(), 725150 , 20 )  --給獎勵 掉寶
end