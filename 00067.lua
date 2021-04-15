function NPC_DuelistRewardStore_Init()		--勇士勳章商店 - 物件產生劇情
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  );	--小地圖掛防具Icon
end

function NPC_DuelistRewardStore()		--勇士勳章商店 - 對話劇情
	local Player = OwnerID()
	local Npc = TargetID()
	AdjustFaceDir( Npc , Player , 0 ) --面向
	CloseShop( Npc )
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_121440_01]"   )	-- 你好，冒險者，我正在找尋一種名為[241706]的稀有物品。
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_01][SYS_ARMORTYPE_00]" , "NPC_DuelistRewardStore_01" , 5 )	--守護鎧甲選項
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_02][SYS_ARMORTYPE_01]" , "NPC_DuelistRewardStore_02" , 5 )	--殘殺鎖甲選項
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_03][SYS_ARMORTYPE_02]" , "NPC_DuelistRewardStore_03" , 5 )	--迅捷皮甲選項
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_04][SYS_ARMORTYPE_03]" , "NPC_DuelistRewardStore_04" , 5 )	--魔導布衣選項
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_05][SYS_ARMORTYPE_03]" , "NPC_DuelistRewardStore_05" , 5 )	--癒合布衣選項
	AddSpeakOption( Player , Npc , "[SC_DUELIST_REWARD][SYS_SPECIALSUIT]" , "NPC_DuelistRewardStore_06" , 5 )	--勇士勳章酷裝選項
	AddSpeakOption( Player , Npc , "[AC_ITEMTYPENAME_11][BOOTY]" , "NPC_DuelistRewardStore_07" , 5 )	--其他戰利品選項
end

function NPC_DuelistRewardStore_01()	--勇士勳章商店 - 守護鎧甲選項
	SetShop( TargetID() , 600002 , "" )	--勇士勳章商店 - 守護鎧甲
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_02()	--勇士勳章商店 - 殘殺鎖甲選項
	SetShop( TargetID() , 600003 , "" )	--勇士勳章商店 - 殘殺鎖甲
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_03()	--勇士勳章商店 - 迅捷皮甲選項
	SetShop( TargetID() , 600004 , "" )	--勇士勳章商店 - 迅捷皮甲
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_04()	--勇士勳章商店 - 魔導布衣選項
	SetShop( TargetID() , 600005 , "" )	--勇士勳章商店 - 魔導布衣
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_05()	--勇士勳章商店 - 癒合布衣選項
	SetShop( TargetID() , 600006 , "" )	--勇士勳章商店 - 癒合布衣
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_06()	--勇士勳章商店 - 勇士勳章酷裝選項
	SetShop( TargetID() , 600427 , "" )	--勇士勳章酷裝商店
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_07()	--勇士勳章商店 - 其他戰利品選項
	SetShop( TargetID() , 600185 , "" )	--勇士勳章戰利品商店
	CloseSpeak( OwnerID() )
	OpenShop()
end