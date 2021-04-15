function lua_valentine_awardchange()
	local Language = GetServerDataLanguage() 

--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		SetSpeakDetail(OwnerID(),"[SC_VALENTINE_2011CHANGE_00]")
	else
		SetSpeakDetail(OwnerID(),"[SC_VALENTINE_2011CHANGE_00_TW]")
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011CHANGE_01]","lua_valentine_awardchange_01",0)

--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011CHANGE_03]","lua_valentine_redo_change",0)
	end
end


function lua_valentine_awardchange_01()
	local Owner = OwnerID()
	local tmpT= CountBodyItem(Owner,209161)
	local S = Check_Bag_Space(Owner,1)

	if tmpT >=4 and S == true then
		CloseSpeak(Owner)
		DelBodyItem(Owner,209161,4)
		GiveBodyItem(Owner,209191,1)
		GiveBodyItem( Owner , 241479 , 10)
	elseif tmpT >= 4 and S == FALSE then
		SetSpeakDetail(Owner,"[SC_CHANGEGOOD_1_2]")
		AddSpeakOption( Owner, TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_awardchange", 0 )
	elseif tmpT<4 then
		SetSpeakDetail( Owner, "[SC_0908SEANSON_26]" )--你的材料不足
		AddSpeakOption( Owner, TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_awardchange", 0 )--回到上一層
	end
end

function lua_valentine_redo_change()
	local tmpT = CountBodyItem(OwnerID(),202904)
	local S = Check_Bag_Space(OwnerID(),1)

	if tmpT >=1 and S == true then
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(),202904,1)
		GiveBodyItem(OwnerID(),209230,1)
	elseif tmpT >= 1 and S == FALSE then
		SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_awardchange", 0 )
	elseif tmpT<1 then
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你的材料不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_awardchange", 0 )--回到上一層
	end
end

---重置券
function lua_valentine_redo()
	local Owner = OwnerID()
	ScriptMessage(Owner,Owner,1,"[SC_VALENTINE_2011_RE]",C_SYSTEM)
	SetFlag(Owner,544817,0)--贈花刪除
	SetFlag(Owner,542173,0)--魔法玫瑰刪除
	SetFlag(Owner,542174,0)--magic rose

	SetFlag(Owner,544816, 0)--餡餅刪除
	SetFlag(Owner,544818, 0)
	SetFlag(Owner,544868, 0)
	SetFlag(Owner,544869, 0)
	SetFlag(Owner,544812, 0)
	SetFlag(Owner,544813, 0)
	SetFlag(Owner,544814, 0)

	SetFlag(Owner,544730, 0)--奧斯蒙
	
	--2012
	SetFlag(Owner,541865, 0)	--誓約奪還
	SetFlag(Owner,546188, 0)	--花神warfare 完成
	SetFlag(Owner,546195, 0)	--花神warfare 拿過傳送石的旗標
	SetFlag(Owner,546180, 0)	--守護戀人希望
	ic_Flora_play_all(10)

	--2013
	SetFlag(Owner,547360, 0) --玫瑰階梯(完成)
	SetFlag(Owner,547354, 0) --收集祝福
	SetFlag(Owner,547321, 0) --收集祝福
	CancelBuff( Owner , 623922)
	
end