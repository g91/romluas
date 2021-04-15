--===============================神秘的動物巡禮<對話劇情>===============================================
function TeaCat_Xmas2012_animalQ1()
	local Player = OwnerID()

--	if checkflag(Player, 547146)==true then--有無完成任務1完成旗標
--		if CheckFlag(Player,547155)==true then--檢查有無任務2活動結束旗標
--			SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC09]")
--		else
--			if CheckFlag(Player, 547153)==true then--檢查有無領獎資格旗標
--				SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC08]")
--				GiveBodyItem(Player,203734,6)
--				SetFlag(Player,547155,1)--任務2活動結束旗標開啟
--				setflag(Player, 547148,0)--將目標點專用旗關閉
--				setflag(Player, 547149,0)
--				setflag(Player, 547150,0)
--				setflag(Player, 547151,0)
--				CancelBuff(Player, 623749)
--			else
--				if checkflag(player,547147)==false then
--					if CountBodyItem( Player, 242018 )>0  then
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC10]")--你好啊，年輕人。
--					elseif CountBodyItem( Player, 242020 )>0  then---<寒夜谷篇>
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC02]")--呵呵，年輕人...
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT03]" ,  "TeaCat_Xmas2012_animalQ2",0 )--聽規則
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --參加
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --不參加
--					elseif  CountBodyItem( Player, 242021 )>0  then---<雪海營地篇>
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC03]")--呵呵，年輕人...
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT03]" ,  "TeaCat_Xmas2012_animalQ2",0 )--聽規則
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --參加
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --不參加
--					elseif  CountBodyItem( Player, 242022 )>0  then---<霜木谷篇>
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC04]")--呵呵，年輕人...
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT03]" ,  "TeaCat_Xmas2012_animalQ2",0 )--聽規則
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --參加
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --不參加
--					elseif   CountBodyItem( Player, 242019 )>0 then --<風嗥岩塔篇>
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC01]")--呵呵，年輕人...
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT03]" ,  "TeaCat_Xmas2012_animalQ2",0 )--聽規則
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --參加
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --不參加
--					elseif CountBodyItem( Player, 242018 )==0 and CountBodyItem( Player, 242020 )==0 or CountBodyItem( Player, 242021 )==0 or CountBodyItem( Player, 242022 )==0 or 		CountBodyItem( Player, 242019 )==0 then
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC10]")--你好啊，年輕人。
--					end
--				
--				else
--					SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC07]")--供品弄不見...
--				end
--			end	
--		end
--	else
		LoadQuestOption(Player)
--	end
end

function TeaCat_Xmas2012_animalQ2()--聽規則
	local player= OwnerID()
	SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC05]")
	AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --參加
	AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --不參加
end

function TeaCat_Xmas2012_animalQ3()--不參加
	local player= OwnerID()
	SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC06]")
end

function TeaCat_Xmas2012_animalStart()--參加
	local Player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	SysCastSpellLv(player,NPC,  850469, 0)
	setflag(player,547147,1)--任務2旗子
	if CountBodyItem( Player, 242019 )>0  then
		setflag(player, 547148,1)--<風嗥岩塔專用鏡像旗>
	elseif CountBodyItem( Player, 242020 )>0  then
		setflag(player, 547149,1)--<寒夜谷專用鏡像旗>
	elseif CountBodyItem( Player, 242021 )>0  then
		setflag(player, 547150,1)--<雪海營地專用鏡像旗>
	elseif CountBodyItem( Player, 242022 )>0  then
		setflag(player, 547151,1)--<霜木谷專用鏡像旗>
	end
		
end
--===============================================================================
function TeaCat_Xmas2012_FoodFindSnow(NPCID)--放置供品前檢查
	local Player = OwnerID()
	local OrgID = SearchRangeNPC(Player, 25)
	--DebugMsg(Player,0,"running")
	for i = 1, #OrgID do
		local Shine = ReadRoleValue(OrgID[i], EM_RoleValue_OrgID)
		if Shine == NPCID then
	--	DebugMsg(Player,0,"got the snow")
			return true
		else
			ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING02]",0)
	--		say(Shine, "I'm here")
	--		say(NPCID, "Hello")
	--		DebugMsg(Player, 0, "no running")
			return false
		end	
	end
end
--==========================使用供品的劇情============================================
function TeaCat_Xmas2012_SetFood()	--供品使用劇情
	local Player = OwnerID()
	BeginCastBarEvent( Player, Player, "[SC_2012_TCXMAS_SETFOOD]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "TeaCat_Xmas2012_SetFood_Result" )
end

function TeaCat_Xmas2012_SetFood_Result(Obj,CheckResult)	--供品使用劇情CastBar
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )

	if CheckResult > 0 then					--大於0是成功
		local Food = CreateObjByObj( 121566, Player )
		SetModeEx( Food, EM_SetModeType_Strikback, false )		--反擊
		SetModeEx( Food, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
		SetModeEx( Food, EM_SetModeType_Obstruct, false )		--阻擋
		SetModeEx( Food, EM_SetModeType_Mark, false )			--標記
		SetModeEx( Food, EM_SetModeType_Move, false )			--移動
		SetModeEx( Food, EM_SetModeType_Searchenemy, false )		--索敵
		SetModeEx( Food, EM_SetModeType_HideName, false )		--名稱
		SetModeEx( Food, EM_SetModeType_ShowRoleHead, false )		--頭像框
		SetModeEx( Food, EM_SetModeType_Fight , false )			--可砍殺攻擊
		SetModeEx( Food, EM_SetModeType_Drag , true )			--阻力
		AddToPartition(Food , RoomID)
		CallPlot( Food, "TeaCat_Xmas2012_Food_Plot", food, 50 )
--	elseif CheckResult < 0 then 				--小於0是失敗
--		return
	end
	EndCastBar( Player, CheckResult )
	SetFlag(Player,547152,1)
	setFlag(Player,547153,1)
end

function TeaCat_Xmas2012_Food_Plot(food, time)
	sleep(time)
	delobj(food)
end

--=============================神秘的動物巡禮<風嗥岩塔魔獸篇>===============================================
function TeaCat_Xmas2012_Animal1()
	local animal =OwnerID()
	local player = TargetID()
	DebugMsg(0, 0, "0")
	while true do
		sleep(50)--------------------------------------------每5秒檢查一次
	--	DebugMsg(0, 0, "1")
		local r= rand(6)
		LuaFunc_MoveToFlag(animal, 781222, r , 0)--------animal在既有的旗標上隨機移動
	--	DebugMsg(0, 0, "2")
		if  ReadRoleValue(animal,EM_RoleValue_Register1)==1 then------------------------如果animal有被隱藏...
			sleep(150)----------------------------------則15秒後讓他現形
			SetModeEx(animal  ,EM_SetModeType_Show , true ) 
			SetModeEx( animal   , EM_SetModeType_Mark, true )--標記
			SetModeEx( animal  , EM_SetModeType_HideName, true )--名稱
			SetModeEx( animal , EM_SetModeType_ShowRoleHead, true )--頭像框
	--		DebugMsg(0, 0, "3")
			LuaFunc_MoveToFlag(animal, 781222, r , 0)
			WriteRoleValue( animal, EM_RoleValue_Register1, 0 )
		else-------------------------------------------------如果animal沒有被隱藏...
			if checkbuff(animal,623748)==true then----如果有玩家給animal buff
				sleep(200)---------------------------20秒後animal消失
	--			DebugMsg(0, 0, "4")
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--標記
				SetModeEx( animal  , EM_SetModeType_HideName, false )--名稱
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--頭像框
				WriteRoleValue( animal, EM_RoleValue_Register1, 1 )
			else----------------------------------------如果沒有玩家給animal buff
				sleep(100)-------------------------10秒後animal消失
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--標記
				SetModeEx( animal  , EM_SetModeType_HideName, false )--名稱
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--頭像框
	--			DebugMsg(0, 0, "5")
				WriteRoleValue( animal, EM_RoleValue_Register1, 1 )
	--			DebugMsg(0, 0, "6")
			
			end

		end	
	end
end

--=============================神秘的動物巡禮<寒夜谷魔獸篇>===============================================
function TeaCat_Xmas2012_Animal2()
	local animal =OwnerID()
	local player = TargetID()

	while true do
		sleep(50)--------------------------------------------每5秒檢查一次
		local r= rand(6)
		LuaFunc_MoveToFlag(animal, 781223, r , 0)--------animal在既有的旗標上隨機移動

		if  ReadRoleValue(animal,EM_RoleValue_Register2)==1 then------------------------如果animal有被隱藏...
			sleep(150)----------------------------------則15秒後讓他現形
			SetModeEx(animal  ,EM_SetModeType_Show , true ) 
			SetModeEx( animal   , EM_SetModeType_Mark, true )--標記
			SetModeEx( animal  , EM_SetModeType_HideName, true )--名稱
			SetModeEx( animal , EM_SetModeType_ShowRoleHead, true )--頭像框
			LuaFunc_MoveToFlag(animal, 781223, r , 0)
			WriteRoleValue( animal, EM_RoleValue_Register2, 0 )
		else-------------------------------------------------如果animal沒有被隱藏...
			if checkbuff(animal,623748)==true then----如果有玩家給animal buff
				sleep(200)---------------------------20秒後animal消失
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--標記
				SetModeEx( animal  , EM_SetModeType_HideName, false )--名稱
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--頭像框
				WriteRoleValue( animal, EM_RoleValue_Register2, 1 )
			else----------------------------------------如果沒有玩家給animal buff
				sleep(100)-------------------------10秒後animal消失
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--標記
				SetModeEx( animal  , EM_SetModeType_HideName, false )--名稱
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--頭像框
				WriteRoleValue( animal, EM_RoleValue_Register2, 1 )
			
			end

		end	
	end
end

--=============================神秘的動物巡禮<雪海營地魔獸篇>===============================================
function TeaCat_Xmas2012_Animal3()
	local animal =OwnerID()
	local player = TargetID()

	while true do
		sleep(50)--------------------------------------------每5秒檢查一次
		local r= rand(6)
		LuaFunc_MoveToFlag(animal, 781224, r , 0)--------animal在既有的旗標上隨機移動

		if  ReadRoleValue(animal,EM_RoleValue_Register3)==1 then------------------------如果animal有被隱藏...
			sleep(150)----------------------------------則15秒後讓他現形
			SetModeEx(animal  ,EM_SetModeType_Show , true ) 
			SetModeEx( animal   , EM_SetModeType_Mark, true )--標記
			SetModeEx( animal  , EM_SetModeType_HideName, true )--名稱
			SetModeEx( animal , EM_SetModeType_ShowRoleHead, true )--頭像框
			LuaFunc_MoveToFlag(animal, 781224, r , 0)
			WriteRoleValue( animal, EM_RoleValue_Register3, 0 )
		else-------------------------------------------------如果animal沒有被隱藏...
			if checkbuff(animal,623748)==true then----如果有玩家給animal buff
				sleep(200)---------------------------20秒後animal消失
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--標記
				SetModeEx( animal  , EM_SetModeType_HideName, false )--名稱
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--頭像框
				WriteRoleValue( animal, EM_RoleValue_Register3, 1 )
			else----------------------------------------如果沒有玩家給animal buff
				sleep(100)-------------------------10秒後animal消失
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--標記
				SetModeEx( animal  , EM_SetModeType_HideName, false )--名稱
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--頭像框
				WriteRoleValue( animal, EM_RoleValue_Register3, 1 )
			
			end

		end	
	end
end

--=============================神秘的動物巡禮<霜木谷魔獸篇>===============================================
function TeaCat_Xmas2012_Animal4()
	local animal =OwnerID()
	local player = TargetID()

	while true do
		sleep(50)--------------------------------------------每5秒檢查一次
		local r= rand(6)
		LuaFunc_MoveToFlag(animal, 781225, r , 0)--------animal在既有的旗標上隨機移動

		if  ReadRoleValue(animal,EM_RoleValue_Register4)==1 then------------------------如果animal有被隱藏...
			sleep(150)----------------------------------則15秒後讓他現形
			SetModeEx(animal  ,EM_SetModeType_Show , true ) 
			SetModeEx( animal   , EM_SetModeType_Mark, true )--標記
			SetModeEx( animal  , EM_SetModeType_HideName, true )--名稱
			SetModeEx( animal , EM_SetModeType_ShowRoleHead, true )--頭像框
			LuaFunc_MoveToFlag(animal, 781225, r , 0)
			WriteRoleValue( animal, EM_RoleValue_Register4, 0 )
		else-------------------------------------------------如果animal沒有被隱藏...
			if checkbuff(animal,623748)==true then----如果有玩家給animal buff
				sleep(200)---------------------------20秒後animal消失
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--標記
				SetModeEx( animal  , EM_SetModeType_HideName, false )--名稱
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--頭像框
				WriteRoleValue( animal, EM_RoleValue_Register4, 1 )
			else----------------------------------------如果沒有玩家給animal buff
				sleep(100)-------------------------10秒後animal消失
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--標記
				SetModeEx( animal  , EM_SetModeType_HideName, false )--名稱
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--頭像框
				WriteRoleValue( animal, EM_RoleValue_Register4, 1 )
			
			end

		end	
	end
end
--===============================<禮包判斷>=========================================
function TeaCat_Xmas2012_FoodBag( Option )

	local Player= OwnerID()
--	local PackageID = 242018--熱熱的小箱子
	local FoodID = 726729 

	if ( Option == "CHECK" ) then
		if CountBodyItem( Player, 242019 )>0  or CountBodyItem( Player, 242020 )>0  or CountBodyItem( Player, 242021 )>0  or CountBodyItem( Player, 242022 )>0  then
			ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING03]",0)
			return false
		else
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( Player , FoodID  , 1 )
		ScriptMessage(Player,Player,3,"[SC_2012_TCXMAS_WARNING05]",0) 
	end
end

--=============================<技能>============================================
function TeaCat_Xmas2012_Skill()
	local Player = OwnerID()
	local Animal=TargetID()
	local CheckTable ={[121561]=1;[121562]=2;[121563]=3;[121564]=4;}
	local Num = ReadRoleValue( Animal, EM_RoleValue_OrgID )
	PlayMotion(Player,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	AdjustFaceDir( Animal , Player , 0 )
--	FaceObj(Animal, Player)
	if checkflag(Player, 547152)==true then
		if CheckTable[Num] == 1 then
			if CheckBuff(Player, 623747) == true then
				ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING04]",0)
			else
				NPCSay(Animal,"[SC_2012_TCXMAS_MONSAY01]")
				addbuff(Player, 623747,0,600)
			end
		elseif CheckTable[Num] == 2 then
				if CheckBuff(Player, 623747) == true then
				ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING04]",0)
			else
				NPCSay(Animal,"[SC_2012_TCXMAS_MONSAY02]")
				addbuff(Player, 623747,0,600)
			end
		elseif CheckTable[Num] == 3 then
				if CheckBuff(Player, 623747) == true then
				ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING04]",0)
			else
				NPCSay(Animal,"[SC_2012_TCXMAS_MONSAY03]")
				addbuff(Player, 623747,0,600)
			end
		elseif CheckTable[Num] == 4 then
				if CheckBuff(Player, 623747) == true then
				ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING04]",0)
			else
				NPCSay(Animal,"[SC_2012_TCXMAS_MONSAY04]")
				addbuff(Player, 623747,0,600)
			end
		
		addbuff(Animal, 623748,0,3)
		end
	else
		ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING01]",0)
	end
end

--==========================測試指令區==============================================
function TeaCat_Xmas2012_ReplayQ1()
	local owner= ownerID()
	setflag(owner, 547146, 0)--任務一完成
	setflag(owner, 547147, 0)--任務二活動開始
	setflag(owner, 547148, 0)--風嗥岩塔專用鏡像旗
	setflag(owner, 547149, 0)--寒夜谷專用鏡像旗
	setflag(owner, 547150, 0)--雪海營地專用鏡像旗
	setflag(owner, 547151, 0)--霜木谷專用鏡像旗
	setflag(owner, 547152, 0)--放下物品旗標
	setflag(owner, 547153, 0)--領獎旗標
	setflag(owner, 547155, 0)--活動結束旗標
	DelBodyItem(owner, 241995, 999)--鹿肉片
	DelBodyItem(owner, 242002, 1)--鹿肉湯
	DelBodyItem(owner, 242018, 1)--熱熱的小箱子
	DelBodyItem(owner, 242019, 1)--謎樣的供品
	DelBodyItem(owner, 242020, 1)--腥味的供品
	DelBodyItem(owner, 242021, 1)--血腥的供品
	DelBodyItem(owner, 242022, 1)--噁心的供品
	CancelBuff(owner, 623731)--暖意
	CancelBuff(owner, 623747)--魔獸的祝福
	CancelBuff(owner, 623749)--活動2開始
	BeginPlot( owner, "Lua_DailyQuest_CLS",0 )
end

function TeaCat_Xmas2012_ReplayQ2()
	local owner = OwnerID()
	setflag(owner, 547147, 0)--任務二活動開始
	setflag(owner, 547148, 0)--風嗥岩塔專用鏡像旗
	setflag(owner, 547149, 0)--寒夜谷專用鏡像旗
	setflag(owner, 547150, 0)--雪海營地專用鏡像旗
	setflag(owner, 547151, 0)--霜木谷專用鏡像旗
	setflag(owner, 547152, 0)--放下物品旗標
	setflag(owner, 547153, 0)--領獎旗標
	setflag(owner, 547155, 0)--活動結束旗標
	DelBodyItem(owner, 242019, 1)--謎樣的供品
	DelBodyItem(owner, 242020, 1)--腥味的供品
	DelBodyItem(owner, 242021, 1)--血腥的供品
	DelBodyItem(owner, 242022, 1)--噁心的供品
	CancelBuff(owner, 623731)--暖意
	CancelBuff(owner, 623747)--魔獸的祝福
	CancelBuff(owner, 623749)--活動2開始
	GiveBodyItem(owner, 242018,1)
end		


--=================<額外判斷>====================
function TeaCat_Xmas2012_FinishQ1()
	local Player = TargetID()	
	SetFlag(Player, 547146, 1)
	SetFlag(Player, 547168, 0)	--每日旗標
	SetFlag( Player, 547336, 1 )	--FN添加的全勤獎判斷旗標
	DesignLog( Player , 425721 , "425721 complete" )
end

--=================<打火石打鹿判斷>=======================
function TeaCat_Xmas2012_HitDeer(Player, Deer)
	SysCastSpellLv(Player, Deer, 850471,0)
end
--=================<鹿肉湯使用區域判斷>====================
function TeaCat_Xmas2012_DeerSoup()
	local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
		
	if MyZoneID ~= 358 or MyZone ~= 358 then-----
	--	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_2012_TCXMAS_WARNING06]", 0 ) --(這物品只限在海波拉高原使用)
		ScriptMessage( OwnerID(), OwnerID(), 3, "[SC_2012_TCXMAS_WARNING06]", 0 )
		return false
	end
	return true
end
--=================<HelpTeaCat>====================
function FN_Xmas2012_HelpTeaCat()	--行禮判斷目標OrgID
	local Monster = TargetID()
	local OrgID = ReadRoleValue( Monster, EM_RoleValue_OrgID )

	if OrgID ~= 121561 and OrgID ~= 121562 and OrgID ~= 121563 and OrgID ~= 121564 then
		return false
	end
	return true
end

function FN_Xmas2012_HelpTeaCat2()	--食物刪除 刪掉行禮buff
	local Player = OwnerID()
	CancelBuff( Player, 623749 )
end