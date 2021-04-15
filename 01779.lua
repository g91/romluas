--701779 點選寵物劇情

--新手引導寵物用寵物檢查劇情
function CheckSummon_newPet(MonsterID)
	local Obj
	local Count = SetSearchRangeInfo( OwnerID(), 200 )
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:OrgID() == MonsterID and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and ReadRoleValue( ID , EM_RoleValue_OwnerDBID ) == ReadRoleValue( OwnerID() , EM_RoleValue_DBID ) then
			DelObj(ID)
			CloseSpeak(OwnerID())
			local Name = Obj:OrgID()
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--你回收了寵物
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--你回收了寵物
			return false
		end
	end
	return true
end

--新手點選後寵物對話 掛在寵物npc初始對話
function lua_mika_newpet_speak() 
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	local Lv = ReadRoleValue( master , EM_RoleValue_LV )
--	Say(OwnerID(), "OwnerID") --玩家
--	Say(TargetID(), "TargetID") --寵物
	if ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) == OwnerID() then   --點的對象是寵物主人
--		Say(TargetID(), "you are my master.") --寵物
--		Say(master, "I am master.")
		SetSpeakDetail( master, "[SC_NEWPLAYERPET_TOUCH02]" )--你好，親愛的主人，在冒險的旅途上還順利嗎？
--		AddSpeakOption( master, master, "[SC_NEWPLAYERPET_TOUCH03]" , "lua_mika_newpet_guide", 0 ) --查看目前等級提示
		AddSpeakOption( master, master, "[SC_NEWPLAYERPET_TOUCH04]" , "lua_mika_newpet_guide2", 0 ) --查看新手教學提示
		if Lv >= 11 and Lv <= 30 then
			AddSpeakOption( master, master, "[SC_NEWPLAYERPET_TOUCH05]" , "lua_mika_deptticket_give", 0 ) --領取[207082]
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_NEWPLAYERPET_TOUCH01]" )--你不是我的主人喔，我只對我的主人提供協助。
	end
end

--查看新手教學提示
function lua_mika_newpet_guide2() --查看新手教學提示
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_VNMAYDAY_01]" )--你想知道哪些事情呢？ 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT01]" , "lua_mika_newpet_guide21", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT02]" , "lua_mika_newpet_guide22", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT03]" , "lua_mika_newpet_guide23", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT04]" , "lua_mika_newpet_guide24", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT05]" , "lua_mika_newpet_guide25", 0 ) 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_speak", 0 ) --回到上一層
end

function lua_mika_newpet_guide21() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT01_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --回到上一層
end

function lua_mika_newpet_guide22() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT02_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --回到上一層
end

function lua_mika_newpet_guide23() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT03_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --回到上一層
end

function lua_mika_newpet_guide24() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT04_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --回到上一層
end

function lua_mika_newpet_guide25() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT05_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --回到上一層
end

--新手寵物給贖罪券
Function lua_mika_deptticket_give()  --新手寵物給贖罪券1
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_TOUCH06]" )--清債券介紹
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_TOUCH05]" , "lua_mika_deptticket_give1", 0 ) --領取[207082]
end

Function lua_mika_deptticket_give1()  --新手寵物給贖罪券2
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
--	Say(OwnerID(), "OwnerID 3") --玩家
--	Say(TargetID(), "TargetID 3") --寵物
	CloseSpeak(OwnerID())
	if CheckFlag(OwnerID(), 543840 ) == true then 
		--你今天已經領取過[207082]了。
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_NEWPLAYERPET_TICKETGET01]" ,0)
	else
		--使用此物品後，將能清除你主職所有的經驗值與技能負債。
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_NEWPLAYERPET_TICKETGET03]" ,C_SYSTEM )
		--希望提供的物品能對你有所幫助。
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_NEWPLAYERPET_TICKETGET02]" ,C_SYSTEM )
		GiveBodyItem(OwnerID(), 207082 , 1)
		SetFlag(OwnerID(), 543840  ,1) --新手每日領取清債券flag
	end	
end

function lua_mika_newpet_delkey()  --刪除所有相關keyitem
	Setflag(OwnerID(), 543840, 0 )
	Setflag(OwnerID(), 543807, 0 )
	Setflag(OwnerID(), 543833, 0 )
	Setflag(OwnerID(), 543834, 0 )
	Setflag(OwnerID(), 543835, 0 )
	Setflag(OwnerID(), 543836, 0 )
	Setflag(OwnerID(), 543837, 0 )
	Setflag(OwnerID(), 543841, 0 )
	Setflag(OwnerID(), 543842, 0 )
	Setflag(OwnerID(), 543843, 0 )
	Setflag(OwnerID(), 543844, 0 )
	Setflag(OwnerID(), 543845, 0 )
	Setflag(OwnerID(), 543846, 0 )
	Setflag(OwnerID(), 543847, 0 )
	Setflag(OwnerID(), 543848, 0 )
	Setflag(OwnerID(), 543849, 0 )
	Say(OwnerID(), "Del newpet all keyitem. ")
end



-- 5.0.0 update
-- 新手寵物相關  
-- 登入時給的BUFF 在消失時觸發劇情 給贖罪券
function lua_mika_newpet_giveitem()
	local Owner = OwnerID()  -- Player
	local Lv = ReadRoleValue( Owner , EM_RoleValue_LV )

	if Lv >= 11 and Lv <= 30 then
		if CheckFlag( Owner, 543840 ) == false then   -- 當天還沒領過
			ScriptMessage( Owner, Owner, 1,"[SC_NEWPLAYERPET_TICKETGET04]" ,C_SYSTEM )
			ScriptMessage( Owner, Owner, 0,"[SC_NEWPLAYERPET_TICKETGET04]" ,C_SYSTEM )
			-- 主人你好，請收下我為你準備的小禮物，請在需要的時候使用吧！
			GiveBodyItem(Owner, 207082 , 1)
			SetFlag( Owner, 543840  ,1) --新手每日領取清債券flag
		end
	end
end
