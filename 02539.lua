function LuaQ_Dr424813_UseCheck()
	local OID = OwnerID()
	local TID = TargetID()
	local TOrg = ReadRoleValue(TID,EM_RoleValue_OrgID)
	local THP = ReadRoleValue(TID,EM_RoleValue_HP)
	local TMaxHP = ReadRoleValue(TID,EM_RoleValue_MaxHP)
	local TDeath = ReadRoleValue(TID,EM_RoleValue_IsDead)
	local X = 0
	local Y = 0
	local TargetMonster = {}
		TargetMonster[106403]=240830;
		TargetMonster[106404]=240831;
		TargetMonster[106405]=240832;
		TargetMonster[106406]=240833;
		if CheckAcceptQuest(OID,424813) == true then
			for key,value in pairs(TargetMonster)  do
				if TOrg == key  and  
				CountBodyItem(OID,value)<1 then
					X = X+1
				end
			end
		end
		if TDeath == 1 then
			ScriptMessage( OID, OID, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif   (THP/TMaxHP) <= 0.3   then
			Y = Y+1 
		end
		if X==1 and Y==1 then
--			say(OID,X.."+"..Y)
			return true
		elseif X~=1 then
	 		   ScriptMessage( OID, OID, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif Y~=1 then
		 	   ScriptMessage( OID, OID, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		end
end

function LuaQ_Dr424813_Used()
	local TargetMonster = {}
		TargetMonster[106403]=240830;
		TargetMonster[106404]=240831;
		TargetMonster[106405]=240832;
		TargetMonster[106406]=240833;
	local OID = OwnerID()
	local TID = TargetID()
	local TOrg = ReadRoleValue(TID,EM_RoleValue_OrgID)
	UseItemDestroy()
--	say(OID,123456)
	for key,value in pairs(TargetMonster) do
		if TOrg == key and CountBodyItem(OID,value) < 1 then
			 GiveBodyItem(OID,value,1)
			CallPlot( TID, "LuaFunc_ResetObj",TID )
			break
		end
	end
end
----------------------------------------------------------------------------

function LuaQ_424815_Speak()
	local OID = OwnerID()
	local TID = TargetID()
	local Allitem = {
		[1]=240834,
		[2]=240835,
		[3]=240836,
		[4]=240837
			}
	local LuaString = {
		[1]="[SC_424815_01]",	--這骨頭好像有點古怪...你要不要瞧瞧...
		[2]="[SC_424815_02]",	--這塊木片上頭有點酒氣，會不會是引火用的？
		[3]="[SC_424815_03]",	--你看這塊石頭上面有足跡！
		[4]="[SC_424815_04]"	--這根羽毛應該不可能吧？
			}
	LoadQuestOption(OID)
	if CheckAcceptQuest(OID,424815) == true and 
	   CheckFlag(OID,545832) == false then
		for i=1,4 do
			if CountBodyItem(OID,Allitem[i]) >=1 then
				AddSpeakOption(OID,TID,LuaString[i],"LuaQ_424815_Speak"..i,0)
			end
		end
	elseif CheckAcceptQuest(OID,424816) == true and
		CountBodyItem(OID,240838)<1 then
		AddSpeakOption(OID,TID,"[SC_MOREITEM][$SETVAR1=".."[240838]".."]" ,"LuaQ_424816_ITEM",0)

	elseif CheckAcceptQuest(OID,424818) == true and
		CountBodyItem(OID,240839)<1 and 
		CheckFlag(OID,546055)==false then
		AddSpeakOption(OID,TID,"[SC_MOREITEM][$SETVAR1=".."[240839]".."]" ,"LuaQ_424818_ITEM",0)
	else
		LoadQuestOption(OID)
	end
end

function LuaQ_424815_Speak1()
	local OID = OwnerID()
	SetSpeakDetail(OID,"[SC_424815_01_1]")
	DelBodyItem(OID,240834,1)
end

function LuaQ_424815_Speak2()
	local OID = OwnerID()
	SetSpeakDetail(OID,"[SC_424815_02_1]")
	DelBodyItem(OID,240835,1)
end
function LuaQ_424815_Speak3()
	local OID = OwnerID()
	SetSpeakDetail(OID,"[SC_424815_03_1]")
	DelBodyItem(OID,240836,1)
end
function LuaQ_424815_Speak4()
	local OID = OwnerID()
	SetSpeakDetail(OID,"[SC_424815_04_1]")
	DelBodyItem(OID,240837,1)
	SetFlag(OID,545832,1)
end

function LuaQ_424816_ITEM()
	GiveBodyItem(OwnerID(),240838,5)
	CloseSpeak(OwnerID())
end

function LuaQ_424818_ITEM()
	GiveBodyItem(OwnerID(),240839,1)
	CloseSpeak(OwnerID())
end----------------------------------------------------------------------------
function LuaQ_424816_Check()
	local OID = OwnerID()
	local TID = TargetID()
	local place = SearchRangeNPC(OID,15)
	local Searchplace = 0 
	for i=0,table.getn(place) do
		local XOrg = ReadRoleValue(place[i],EM_RoleValue_OrgID)
		if XOrg == 119855 then
		UseItemDestroy()
			return true
		else
			return false
		end
	end
end

function LuaQ_424816_Used()
	local OID = OwnerID() 
	local TID = TargetID()
	PlayMotion(OID ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	DW_QietKillOne(0,106443)
	AddBuff(OID,621146,0,10)
	beginplot(OID,"LuaQ_424816_Used_02",10)
end

function LuaQ_424816_Used_02()
	local OID = OwnerID() 
	PlayMotion(OID ,ruFUSION_ACTORSTATE_CROUCH_END)
end
----------------------------------------------------------------------------
function LuaQ_424821_UseCheck()
	local Player = OwnerID()
	local Npc = TargetID()
	local Trange = 160
	local TOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	if CheckAcceptQuest(Player,424821)==true and 
	    (TOrg == 103585 or TOrg ==120119) and 
	    CheckDistance(Player,Npc,Trange)==true	then
		return true
	else
		return false
	end
end
--------------------------------------------
function LuaQ_424821_UseEffect()
	local Player = OwnerID()
	local Stone = DW_CreateObjEX("obj", 119960, Player)
	local ctrl = DW_CreateObjEX("obj", 119306, Stone)
	Dr_ActSetMode(ctrl)
	CallPlot(ctrl,"LuaQ_424821_Used",Player,Stone,ctrl)
end

function Dr_ActSetMode(obj)
	SetModeEx( obj   , EM_SetModeType_Mark, false )--標記
	SetModeEx( obj   , EM_SetModeType_Move, false )--移動
	SetModeEx( obj   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( obj   , EM_SetModeType_HideName, true)--名稱
end

function LuaQ_424821_Used(Player,Stone,ctrl)
	local TBuffPos 
	local TBuffInfo
	local TMonster = SearchRangeNPC(ctrl,200)
	local TOrg = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local Mgctimes = 0
	local Msg = {}
		Msg[1] = "[SC_424821_1]"; --墜飾中所釋放的魔力凝結成結晶
		Msg[2] = "[SC_424821_5]"; --[103585]的怒火似乎稍微平息了一些
		Msg[3] = "[SC_424821_2]"; --魔力不斷的注入柯隆體內
		Msg[5] = "[SC_424821_3]"; --墜飾發出了破裂的聲響
		Msg[7] = "[SC_424821_4]"; --墜飾碎裂了
	while true do
		Sleep(30)
		for i = 0,table.getn(TMonster) do
			TBuffPos = Lua_BuffPosSearch(Player,621204)
			TBuffInfo = BuffInfo( Player , TBuffPos , EM_BuffInfoType_Power )
			if ReadRoleValue(TMonster[i],EM_RoleValue_OrgID) == 103585 or ReadRoleValue(TMonster[i],EM_RoleValue_OrgID) == 120119 then
				CastSpell(ctrl,TMonster[i],498561)
				Mgctimes = Mgctimes + 1
			end
		   	if TBuffInfo >=3   then
				SetFlag(Player,545833,1)
				CancelBuff(Player,621204)
				CancelBuff(TMonster[i],621240)
				CallPlot(ctrl,"LuaQ_424821_Complete",Stone,ctrl,Player)
			end
		end
		if Mgctimes%2 == 0 then				--偶數次
			ScriptMessage(player, player, 1,Msg[2], 0 );
			callPlot(Player,"LuaQ_424821_Monster",Player)
		else
			AddBuff(Player,621204,0,-1)
			if  Mgctimes > 7 then
				ScriptMessage(player, player, 1,Msg[3], 0 );
			else
				ScriptMessage(player, player, 1,Msg[Mgctimes], 0 );
			end
		end
		if CheckAcceptQuest(Player,424821)==false then
			CancelBuff(Player,621204)
			CallPlot(ctrl,"LuaQ_424821_Complete",Stone,ctrl,Player)
		end		
	end
end

function LuaQ_424821_Monster(Player)
	local Obj = OwnerID()
	local ROOMID = ReadRoleValue(Player,EM_RoleValue_RoomID)
	local CenterX = ReadRoleValue(Player,EM_RoleValue_X)
	local CenterY = ReadRoleValue(Player,EM_RoleValue_Y)
	local CenterZ = ReadRoleValue(Player,EM_RoleValue_Z)
	local objnum = 1
	local birds = {}	--記錄小鳥
	local X = {}	--記錄小鳥X
	local Z = {}	--記錄小鳥Z
	local Y 
	local Radius = 50
		for i = 1 , objnum do
			X[i] = CenterX - Radius * math.cos(math.pi*2*(i/objnum))
			Z[i] = CenterZ + Radius * math.sin(math.pi*2*(i/objnum))
			Y = CenterY
			birds[i] = CreateObj( 106488, X[i], Y, Z[i], 0, 1 )
			AddToPartition(birds[i],ROOMID)
			SetAttack(birds[i],Player)
			callplot(birds[i],"LuaQ_424821_DelMonster",birds[i])
		end
end

function LuaQ_424821_DelMonster(birds)
	while 1 do
		Sleep(20)
		if checkid(birds)~=0 or checkid(birds)~=nil then
			if HateListCount( birds) == 0   then
				delobj(birds)
			end
		end
	
	end
end

function LuaQ_424821_Complete(Stone,ctrl,Player)
	DelBodyItem(Player,240846,1)
	DelObj(Stone)
	DelObj(ctrl)
end

function LuaQ_Check_BirdBuff()
	local ctrl = OwnerID()
	local TMonster = SearchRangeNPC(ctrl,150)
	local TOrg
	while true do
		Sleep(100)
		for i =0,table.getn(TMonster) do
			TOrg = ReadRoleValue(TMonster[i],EM_RoleValue_OrgID)
			if TOrg == 103585 and  CheckBuff(TOrg,621240)==false then
			AddBuff(TMonster[i],621240,0,-1)
			break
			end
		end
	end
end
---------------------------------------
function LuaQ_424995_SoldierSay()
	local OID = OwnerID()
	local TID = TargetID()
	local TPID = ReadRoleValue(TID,EM_RoleValue_PID)
	if TPID == 1 then
		SetSpeakDetail(OID ,"[SC_Z22_PANIRO_NPC_0]")
	elseif TPID == 2 then
		SetSpeakDetail(OID ,"[SC_Z22_PANIRO_NPC_1]")
	else
		SetSpeakDetail(OID ,"[SC_Z22_PANIRO_NPC_2]")
	end
--	LoadQuestOption(OID)
	if (CheckAcceptQuest(OID,424995)==true or CheckAcceptQuest(OID,424990)==true or CheckAcceptQuest(OID,424985)==true)and 
		CountBodyItem(OID,240845)>0 and 
		CheckBuff(TID,621553)==false then
		AddSpeakOption(OID,TID,"[SC_424995_0]","LuaQ_424995_ItemCheck",0)
--	else
--	LoadQuestOption(OID)
	end
end

function LuaQ_424995_ItemCheck()
	local OID = OwnerID()
	local TID = TargetID()
	local SayRAND = Rand(4)+1
	local TRAND = {}
	TRAND[1]="[SC_424995_1]"
	TRAND[2]="[SC_424995_2]"
	TRAND[3]="[SC_424995_3]"
	TRAND[4]="[SC_424995_4]"
	CloseSpeak(OID)
	if CheckBuff(TID,621553)==false and SayRAND == 3 then
		Say(TID,TRAND[SayRAND])
		DelBodyItem(OID,240845,1)
		AddBuff(TID,621553,0,10)
	elseif CheckBuff(TID,621553)==false then 
		Say(TID,TRAND[SayRAND])
		DelBodyItem(OID,240845,1)
		DW_QietKillOne(0,106518)
		AddBuff(TID,621553,0,10)
	end
end

function LuaQ_424982_UesCheck()
	return true
end

function LuaQ_424982_0()
	local OID = OwnerID()
	local book = {}
	book[1] = 240944
	book[2] = 240945
	book[3] = 240946
	book[4] = 240947
	book[5] = 240948
	book[6] = 240949
	book[7] = 240950
	book[8] = 240951
	book[9] = 240952
	book[10] = 240953
	book[11] = 240954
	UseItemDestroy() 
	GiveBodyItem(OID,book[DW_rand(11)],1)
end

function LuaQ_424982_1()	--四季
	local OID = OwnerID()
	local book = {}
	book[240944] = "[SC_424982_0]"	
	book[240945] = "[SC_424982_1]"	
	book[240946] = "[SC_424982_2]"	
	book[240947] = "[SC_424982_3]"	
	local A = 0	--判斷持有類別
	local LosePage = {}
	for key,value in pairs(book) do 
		if CountBodyItem(OID,key)>=1 then
			A = A+1
		elseif CountBodyItem(OID,key)==0  then
			table.insert(LosePage,value)
		end
	end
	if A == 1 then
		ScriptMessage(OID, OID, 0,"[SC_424982_ITEM_1][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]".."[$SETVAR3="..LosePage[3].."]", 0 );
		ScriptMessage(OID, OID, 1,"[SC_424982_ITEM_1][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]".."[$SETVAR3="..LosePage[3].."]", 0 );
	elseif A==2 then
		ScriptMessage(OID, OID, 0,"[SC_424982_ITEM_2][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]", 0 );
		ScriptMessage(OID, OID, 1,"[SC_424982_ITEM_2][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]", 0 );
	elseif A==3 then
		ScriptMessage(OID, OID, 0,"[SC_424982_ITEM_3][$SETVAR1="..LosePage[1].."]", 0 );
		ScriptMessage(OID, OID, 1,"[SC_424982_ITEM_3][$SETVAR1="..LosePage[1].."]", 0 );
	elseif A == 4 then
		return true
	end
end

function LuaQ_424982_2()
	local OID = OwnerID()
	local TID = TargetID()
	local Man = Lua_DW_CreateObj("obj",119694,OID)
	callplot(Man,"LuaQ_424982_3",Man,OID)

end

function LuaQ_424982_3(Man,OID)
	local A = 0
	for i=1,4 do
		if CountBodyItem(OID,240943+i)>=1 then
			A = A+1
		end
	end
	if A == 4 then
		DelBodyItem(OID,240944,1)
		DelBodyItem(OID,240945,1)
		DelBodyItem(OID,240946,1)
		DelBodyItem(OID,240947,1)
		GiveBodyItem(OID,240941,1)
	end
	delobj(Man)
end

function LuaQ_424982_4()	--黑髮
	local OID = OwnerID()
	local book = {}
	book[240948] = "[SC_424982_4]"	
	book[240949] = "[SC_424982_5]"	
	book[240950] = "[SC_424982_6]"	
	book[240951] = "[SC_424982_7]"
	local A = 0	--判斷持有類別
	local LosePage = {}
	for key,value in pairs(book) do 
		if CountBodyItem(OID,key)>=1 then
			A = A+1
		elseif CountBodyItem(OID,key)==0  then
			table.insert(LosePage,value)
		end
	end
	if A == 1 then
		ScriptMessage(OID, OID, 0,"[SC_424982_ITEM_1][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]".."[$SETVAR3="..LosePage[3].."]", 0 );
		ScriptMessage(OID, OID, 1,"[SC_424982_ITEM_1][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]".."[$SETVAR3="..LosePage[3].."]", 0 );
	elseif A==2 then
		ScriptMessage(OID, OID, 0,"[SC_424982_ITEM_2][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]", 0 );
		ScriptMessage(OID, OID, 1,"[SC_424982_ITEM_2][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]", 0 );
	elseif A==3 then
		ScriptMessage(OID, OID, 0,"[SC_424982_ITEM_3][$SETVAR1="..LosePage[1].."]", 0 );
		ScriptMessage(OID, OID, 1,"[SC_424982_ITEM_3][$SETVAR1="..LosePage[1].."]", 0 );
	elseif A == 4 then
		return true
	end
end

function LuaQ_424982_5()
	local OID = OwnerID()
	local TID = TargetID()
	local Man = Lua_DW_CreateObj("obj",119694,OID)
	callplot(Man,"LuaQ_424982_6",Man,OID)

end

function LuaQ_424982_6(Man,OID)
	local A = 0
	for i=1,4 do
		if CountBodyItem(OID,240947+i)>=1 then
			A = A+1
		end
	end
	if A == 4 then
		DelBodyItem(OID,240948,1)
		DelBodyItem(OID,240949,1)
		DelBodyItem(OID,240950,1)
		DelBodyItem(OID,240951,1)
		GiveBodyItem(OID,240942,1)
	end
	delobj(Man)
end

function LuaQ_424982_7()	--火哥
	local OID = OwnerID()
	local book = {}
	book[240952] = "[SC_424982_8]"	
	book[240953] = "[SC_424982_9]"
	book[240954] = "[SC_424982_10]"
	local A = 0	--判斷持有類別
	local LosePage = {}
	for key,value in pairs(book) do 
		if CountBodyItem(OID,key)>=1 then
			A = A+1
		elseif CountBodyItem(OID,key)==0  then
			table.insert(LosePage,value)
		end
	end
	if A==1 then
		ScriptMessage(OID, OID, 0,"[SC_424982_ITEM_2][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]", 0 );
		ScriptMessage(OID, OID, 1,"[SC_424982_ITEM_2][$SETVAR1="..LosePage[1].."]".."[$SETVAR2="..LosePage[2].."]", 0 );
	elseif A==2 then
		ScriptMessage(OID, OID, 0,"[SC_424982_ITEM_3][$SETVAR1="..LosePage[1].."]", 0 );
		ScriptMessage(OID, OID, 1,"[SC_424982_ITEM_3][$SETVAR1="..LosePage[1].."]", 0 );
	elseif A == 3 then
		return true
	end
end

function LuaQ_424982_8()
	local OID = OwnerID()
	local TID = TargetID()
	local Man = Lua_DW_CreateObj("obj",119694,OID)
	callplot(Man,"LuaQ_424982_9",Man,OID)

end

function LuaQ_424982_9(Man,OID)
	local A = 0
	for i=1,3 do
		if CountBodyItem(OID,240951+i)>=1 then
			A = A+1
		end
	end
	if A == 3 then
		DelBodyItem(OID,240952,1)
		DelBodyItem(OID,240953,1)
		DelBodyItem(OID,240954,1)
		GiveBodyItem(OID,240943,1)
	end
	delobj(Man)
end

function LuaQ_424982_Finish()
	local TID = TargetID()
	SetFlag(TID,546088,1)
end

function LuaQ_424983_Finish()
	local TID = TargetID()
	SetFlag(TID,546089,1)
end

function LuaQ_424984_Finish()
	local TID = TargetID()
	SetFlag(TID,546090,1)
end

function LuaQ_424982_QuestCheck()
	local OID = OwnerID()
	if CheckAcceptQuest(OID,424982)==true or
	CheckAcceptQuest(OID,424983)==true or
	CheckAcceptQuest(OID,424984)==true then
	return true
	end
end

function LuaQ_424982_POEM()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		--四季
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_424982_POEM_01]")
	AddBorderPage( OwnerID(), "[SC_424982_POEM_02]")
	AddBorderPage( OwnerID(), "[SC_424982_POEM_03]")
	AddBorderPage( OwnerID(), "[SC_424982_POEM_04]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

function LuaQ_424982_STORY()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		--黑髮
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_424982_STORY_01]")
	AddBorderPage( OwnerID(), "[SC_424982_STORY_02]")
	AddBorderPage( OwnerID(), "[SC_424982_STORY_03]")
	AddBorderPage( OwnerID(), "[SC_424982_STORY_04]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

function LuaQ_424982_SONG()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		--聖歌
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_424982_SONG_01]")
	AddBorderPage( OwnerID(), "[SC_424982_SONG_02]")
	AddBorderPage( OwnerID(), "[SC_424982_SONG_03]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

function LuaQ_424822_STONE_0()--觸碰劇情							--檢驗石碑
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaQ_424822_STONE_1",35 )
end

function LuaQ_424822_STONE_1()
	local player = OwnerID() 	-- 玩家
	local npc = TargetID()  		-- NPC

	DW_CancelTypeBuff(68,player)
	
	--判斷有沒有任務
	--判斷有沒有物品
	--判斷有的沒的
	if 	CheckAcceptQuest(player,424822) == true and
		countbodyitem(player,240841)>0 then
		WriteRoleValue(npc,EM_RoleValue_Register9,9)
		--SetModeEx(npc,EM_SetModeType_Mark,false)
		--ScriptMessage( player, player, 1,"[SC_MIXMEDICINE_02]", 0 )
		if 	BeginCastBarEvent( player, npc,"[SC_423240]", 30, 148, 150, 0, "LuaQ_424822_STONE_2" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	else 
		ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )			--使用條件不符
		return
	end
end

function LuaQ_424822_STONE_2(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			DelBodyItem( player, 240841, 1 )	
			SetFlag(player,545834,1)	
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
	--SetModeEx(npc,EM_SetModeType_Mark,true)
end