
function Lua_423154_01()
	LoadQuestOption( OwnerID())
	if CheckAcceptQuest( OwnerID(), 423154 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423154_BUFF]", "Lua_423154_02",0) --是的。
		--AddSpeakOption( OwnerID(), TargetID(), "Clear", "Lua_423154_test",0) --測試用
	end
end

function Lua_423154_00()
	GiveBodyItem( TargetID(), 207716, 1 )
	AddBuff( TargetID() , 507177 , 0 , 300 ) --給予看刻文Buff
	local EM = {	[1]=EM_RoleValue_Register1,
					[2]=EM_RoleValue_Register2,
					[3]=EM_RoleValue_Register3,
					[4]=EM_RoleValue_Register4,
					[5]=EM_RoleValue_Register5	}
	for i=1, 5 do		
		WriteRoleValue( TargetID(), EM[i], 0 )
	end
	debugmsg(0,0,"reg clear")
end

function Lua_423154_02()
	if CountBodyItem( OwnerID(), 207716 ) == 0 then	
		GiveBodyItem( OwnerID(), 207716, 1 )
	end
	AddBuff( OwnerID() , 507177 , 0 , 300 ) --給予看刻文Buff
	CloseSpeak( OwnerID() )	
end

function Lua_423154_test()
	CloseSpeak( OwnerID() )	
	for i=1, 5 do
		WriteRoleValue( OwnerID(), EM_RoleValue_Register..i, 0 )
		Say( OwnerID(), "Clear" ..i )
	end
end

function Lua_423154_set()
	BeginPlot( TargetID(), "Lua_423154_get", 0 )	
	return 1
end

function Lua_423154_get()
	local O_ID = OwnerID() --點擊物件
	local T_ID = TargetID() --玩家
	local Color = "0xffffff00"	-- 強制訊息為黃色
	local obj = {	[115869] = EM_RoleValue_Register1;
					[115871] = EM_RoleValue_Register2;
					[115872] = EM_RoleValue_Register3;
					[115873] = EM_RoleValue_Register4;
					[115874] = EM_RoleValue_Register5	}					
					
	local OrgID = ReadRoleValue( O_ID, EM_RoleValue_OrgID )
	local id = ReadRoleValue( T_ID, obj[OrgID] )
	if CheckQuest( T_ID, 423154 , 0 ) == true then
		if CountBodyItem( T_ID, 207716 ) == 1 then			
			if id == 0 then
				GiveBodyItem( T_ID, 207711, 1 )
				WriteRoleValue( T_ID, obj[OrgID], 1 )
			elseif id ~= 0 then
				ScriptMessage( O_ID, T_ID, 1 , "[SC_423154_ITEM]", Color )
				ScriptMessage( O_ID, T_ID, 0 , "[SC_423154_ITEM]", Color )
			end
		end
	end
end

--========================================================================================--

function Lua_423155_set()
	local OrgID = ReadRoleValue( TargetID(), EM_RoleValue_OrgID )
	if OrgID == 115797 then
		BeginPlot( TargetID(), "Lua_423155_get1", 0 )
	else
		BeginPlot( TargetID(), "Lua_423155_get2", 0 )
	end
	return 1
end

function Lua_423155_get1()
	local O_ID = OwnerID() --點擊物件
	local T_ID = TargetID()--玩家
	local count = { 0,0,0,0,0 }
	local item = {	207277, --A
					207350, --B
					207715	--C
				}
	local item1 = CountBodyItem( T_ID,  item[1] )
	local item2 = CountBodyItem( T_ID,  item[2] )
	local item3 = CountBodyItem( T_ID,  item[3] )
	local total = item1 + item2 + item3

	if CheckAcceptQuest( T_ID, 423155 ) == true then
		for i=1, 5-total do
			rnd = rand(3)+1
			if count[rnd] < 2 then
				GiveBodyItem( T_ID, item[rnd], 1 )
			else
				rnd = rand(3)+1
				GiveBodyItem( T_ID, item[rnd], 1 )
			end
			count[rnd] = count[rnd] + 1
		end
	end
end

function Lua_423155_get2()
	local O_ID = OwnerID() --點擊物件
	local T_ID = TargetID()--玩家
	local Color = "0xffffff00"	-- 強制訊息為黃色
	local count = 0
	local OrgID = ReadRoleValue( O_ID, EM_RoleValue_OrgID )
	local item = {	207351,
					207352,
					207353,
					207354,
					207373 }	
	local Obj = {	[115798] = 207277; --A
					[115801] = 207350; --B
					[115802] = 207715 }--C
	
	if CheckAcceptQuest( T_ID, 423155 ) == true then
		if CountBodyItem( T_ID,  Obj[OrgID] ) > 0 then
			local rnd = rand(5)+1
			for i = 1, 5 do
				if CountBodyItem( T_ID, item[rnd] ) < 1 then
					break
				elseif CountBodyItem( T_ID, item[i] ) < 1 then
					rnd = i
					break
				end
			end
			GiveBodyItem( T_ID, item[rnd], 1 )
			ScriptMessage( O_ID, T_ID , 1 , "[SC_423155_" ..rnd.."]" , Color )
			ScriptMessage( O_ID, T_ID , 0 , "[SC_423155_" ..rnd.."]" , Color )
			DelBodyItem( T_ID, Obj[OrgID], 1 )
		else
			ScriptMessage( O_ID, T_ID , 1 , "[SC_423155_REQUIRE]", Color )
			ScriptMessage( O_ID, T_ID , 0 , "[SC_423155_REQUIRE]", Color )
		end
		for i=1, 5 do
			if CountBodyItem( T_ID, item[i]) == 1 then
				count = count + 1
			end
		end
		if count == 5 then
			ScriptMessage( O_ID, T_ID , 1 , "[SC_423155_6]" , Color )
			ScriptMessage( O_ID, T_ID , 0 , "[SC_423155_6]" , Color )
		end
	end
end

--========================================================================================--
function Lua_423157_say()
	local T_ID = TargetID() --亞龍
	local O_ID = OwnerID() --玩家
	
	AdjustFaceDir( T_ID, O_ID, 0 ) --面向目標
	SetSpeakDetail( O_ID, "[SC_423157_SAY]" )
	AddSpeakOption( O_ID, T_ID, "[SC_423157_11]", "Lua_423157_1",0)
	AddSpeakOption( O_ID, T_ID, "[SC_423157_12]", "Lua_423157_false",0)
	AddSpeakOption( O_ID, T_ID, "[SC_423157_13]", "Lua_423157_false",0)
end

function Lua_423157_1()
	local T_ID = TargetID() --亞龍
	local O_ID = OwnerID() --玩家
	SetSpeakDetail( O_ID, "[SC_423157_SAY1]" )
	AddSpeakOption( O_ID, T_ID, "[SC_423157_21]", "Lua_423157_2",0)
	AddSpeakOption( O_ID, T_ID, "[SC_423157_22]", "Lua_423157_22",0)
end

function Lua_423157_2()
	local T_ID = TargetID() --亞龍
	local O_ID = OwnerID() --玩家
	
	SetSpeakDetail( O_ID, "[SC_423157_SAY2]" )
	AddSpeakOption( O_ID, T_ID, "[SC_423157_3]", "Lua_423157_3",0)
end

function Lua_423157_22()
	local T_ID = TargetID() --亞龍
	local O_ID = OwnerID() --玩家
	
	SetSpeakDetail( O_ID, "[SC_423157_23]" )
	BeginPlot( O_ID, "Lua_423157_false", 0 )
end

function Lua_423157_3()
	local T_ID = TargetID() --亞龍
	local O_ID = OwnerID() --玩家
	
	SetSpeakDetail( O_ID, "[SC_423157_SAY3]" )
	SetFlag( O_ID, 544279, 1 )
end

function Lua_423157_false()
	local O_ID = OwnerID() --玩家
	local Color = "0xffffff00"	-- 強制訊息為黃色	
	local MaxHP = ReadRoleValue( O_ID, EM_RoleValue_MaxHP )
	local HP = ReadRoleValue( O_ID, EM_RoleValue_HP )
	local hurt = HP - MaxHP*0.34
	
	CloseSpeak( O_ID )
	CastSpell( TargetID(), O_ID, 494223 )--心靈攻擊
	if hurt > 0 then
		WriteRoleValue( O_ID, EM_RoleValue_HP, hurt )
	elseif hurt <= 0 then
		WriteRoleValue( O_ID, EM_RoleValue_HP, 1 )
	end
	ScriptMessage( O_ID, O_ID , 1 , "[SC_423157_FALSE]" , Color )
	ScriptMessage( O_ID, O_ID , 0 , "[SC_423157_FALSE]" , Color )
end

--========================================================================================--

function Lua_423158_say()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	
	AdjustFaceDir( T_ID, O_ID, 0 ) --面向目標
	if CheckFlag( O_ID, 544282 ) == true then
		LoadQuestOption( O_ID )
	elseif CheckAcceptQuest( O_ID, 423159 ) == true and CheckFlag( O_ID, 544294 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --你準備好了嗎？
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423159_1",0) --我準備好了。
	elseif CheckAcceptQuest( O_ID, 423158 ) == true then
		SetSpeakDetail( O_ID, "[SC_423158_SAY1]" ) --啊！你在這兒，我這次回去帶來不好的消息。不過你......你在這裡似乎也沒閒著，不如你先說說你的遭遇。
		AddSpeakOption( O_ID, T_ID, "[SC_423158_1]", "Lua_423158_1",0)--告訴摩瑞克關於槐桑的事......
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423158_1()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	SetSpeakDetail( O_ID, "[SC_423158_SAY2]" )--這樣說來，佛南多．寇茲莫.....
	AddSpeakOption( O_ID, T_ID, "[SC_423158_2]", "Lua_423158_2",0)--告訴摩瑞克關於刻文的事
end

function Lua_423158_2()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	SetSpeakDetail( O_ID, "[SC_423158_SAY3]" )--康葛斯．多瑞安.....
	AddSpeakOption( O_ID, T_ID, "[SC_423158_3]", "Lua_423158_3",0)--聽下去
end

function Lua_423158_3()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	SetSpeakDetail( O_ID, "[SC_423158_SAY4]" )
	AddSpeakOption( O_ID, T_ID, "[SC_423158_3]", "Lua_423158_4",0)--聽下去
end

function Lua_423158_4()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	SetSpeakDetail( O_ID, "[SC_423158_SAY5]" )
	SetFlag( O_ID, 544282, 1 )
end

--========================================================================================--

function Lua_423159_1()--Z16 傳到Z17
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	CloseSpeak( O_ID )
	SetFlag( O_ID, 544294, 1 )
	sleep(5)
	ChangeZone( O_ID, 17, 0, 2023.9, 414.7, 28634.4, 232.8 )
end