function Lua_60ES_CLOSE_A()	--425710完成
	local player = TargetID()
	SetFlag(player,547008,0)	--A KEY	
	SetFlag(player,547009,1)	--B KEY
	SetFlag(player,547010,1)	--C KEY
end

function Lua_60ES_CLOSE_B()	--425708完成
	local player = TargetID()
	SetFlag(player,547009,0)	--B KEY
	SetFlag(player,547013,1)	--D KEY
	SetFlag(player,547014,1)	--E KEY
	SetFlag(player,547540,0)	--關閉給雪珠花法寶
	SetFlag(player,547541,0)	--關閉給海棠花法寶
end

function Lua_60ES_CLOSE_C()	--425711完成
	local player = TargetID()
	SetFlag(player,547010,0)	
	if CountBodyItem(player,230786)>0 and CheckFlag(player,547540)==false then		--雪珠
		SetFlag(player,547540,1)	
	elseif CountBodyItem(player,230787)>0 and CheckFlag(player,547541)==false then	--海棠
		SetFlag(player,547541,1)	
	end
end

function Lua_60ES_CLOSE_D()	--425709完成
	local player = TargetID()
	SetFlag(player,547013,0)
	SetFlag(player,547018,0)      --系統發信判斷
end


function Lua_60ES_CLOSE_E()	--425712完成
	local player = TargetID()
	SetFlag(player,547014,0)	
end

function Lua_60ES_npc_flower_say()
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,425708)==true and CountBodyItem(player,230786)==0 and CheckFlag(player,547540)==true then
		AddSpeakOption(player,npc,"[SC_MOREITEM][$SETVAR1=".."[".."230786".."]".."]","Lua_60ES_npc_flower_give(1)",0)
	elseif CheckAcceptQuest(player,425708)==true and CountBodyItem(player,230787)==0 and CheckFlag(player,547541)==true then
		AddSpeakOption(player,npc,"[SC_MOREITEM][$SETVAR1=".."[".."230787".."]".."]","Lua_60ES_npc_flower_give(2)",0)
	end
	LoadQuestOption(player)
end

function Lua_60ES_npc_flower_give(Num)
	local player = OwnerID()
	if Num==1 then
		GiveBodyItem(player,230786,1)
	elseif Num==2 then
		GiveBodyItem(player,230787,1)
	end	
	CloseSpeak(player)
end

function LuaS_110869_0()	--巴巴洛依對話劇情，首次對話(遺失英勇信標，再次購買機制)
	local player = OwnerID()
	local Npc = TargetID()
	
	if CheckFlag(player,547013)==true and 	
	 CheckFlag(player,547014)==false and 
	CountBodyItem(player,240778)<1 then
	AddSpeakOption(Player,Npc,"[SC_MOREITEM][$SETVAR1=".."[".."240778".."]".."]","LuaS_110869_1",0)
	--可再次取得英勇信標，不過必需付錢
	end
	LoadQuestOption(player)
end

function LuaS_110869_1()	
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[LV60_ELITESKILLS_7][$SETVAR1=".."10000".."]","LuaS_110869_YES","LuaQ_425086_No")
end


function LuaS_110869_YES()
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 10000 then
			ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
			return
		else
			if AddRoleValue( OwnerID() , EM_RoleValue_Money , -10000 ) then
				GiveBodyItem( OwnerID() , 240778 , 1 )
			end
		end
end

function LuaS_110869_NO()
	local player = OwnerID()
	return
end

function Lv60_ELITESKILLS_ITEM_CHECK(PlayerID,ItemID,OPTION)	--凝露使用判斷
	if PlayerID== nil or 0 then
		PlayerID= OwnerID()
	else	
		PlayerID= PlayerID
	end
	local Durable 
	local MaxDurable
	local State,pos = Lv60_MagicTools_ExistCheck(PlayerID,ItemID)	--回傳True or false,裝備位置
	if State == true then
		Durable = GetItemInfo( PlayerID,EM_ItemPacketType_EQ, pos, EM_ItemValueType_Durable )
		MaxDurable = GetItemInfo( PlayerID,EM_ItemPacketType_EQ, pos, EM_ItemValueType_MaxDurable )
		if (OPTION=="ItemID") then
			if Durable<MaxDurable then
				return State
			else
				ScriptMessage(PlayerID,PlayerID,3,"[LV60_ELITESKILLS_4][$SETVAR1=".."["..ItemID.."]".."]",0)
				return false
			end
		elseif (OPTION=="MagicTools") then
			return true
		end
	elseif State == false then
		ScriptMessage(PlayerID,PlayerID,3,"[LV60_ELITESKILLS_8][$SETVAR1=".."["..ItemID.."]".."]",0)	
		return false
	end
end

function Lv60_ELITESKILLS_ITEM_USE(ItemID)		--凝露使用後增加法寶耐久
	local PlayerID =  OwnerID()
	local NewDurable
	local MaxDurable 
	local State,Eqpos = Lv60_MagicTools_ExistCheck(PlayerID,ItemID) --取得裝備位置,state此處無用，單純用來接回傳的值
	local MagicTools = GetItemInfo( PlayerID,EM_ItemPacketType_EQ, Eqpos, EM_ItemValueType_OrgObjID )	--確認法寶編號
	local Durable 	
		if ItemID ~= nil then
			Durable = GetItemInfo(PlayerID,EM_ItemPacketType_EQ ,Eqpos,EM_ItemValueType_Durable)	--取得法寶現有耐久度
			if MagicTools==ItemID then
				If Durable < 1000 then
					ScriptMessage(PlayerID,PlayerID,3,"[LV60_ELITESKILLS_0][$SETVAR1=".."["..MagicTools.."]".."]",0)
				elseif Durable>=1000 and  Durable<1500 then
					ScriptMessage(PlayerID,PlayerID,3,"[LV60_ELITESKILLS_1][$SETVAR1=".."["..MagicTools.."]".."]",0)
				elseif Durable>=1500 and  Durable<2000 then 
					ScriptMessage(PlayerID,PlayerID,3,"[LV60_ELITESKILLS_2][$SETVAR1=".."["..MagicTools.."]".."]",0)
				end
					NewDurable = SetItemInfo( PlayerID,EM_ItemPacketType_EQ, Eqpos, EM_ItemValueType_Durable, Durable+100 )	--實際所需數值為耐久度的100倍。
					addbuff(PlayerID,621733,0,1)
					return NewDurable
			end
		else 
			return Durable
		end
end

function Lv60_MagicTools_ExistCheck(PlayerID,MagicTools)	--檢查玩家身上是不是裝有特定法寶，有的話回傳位置
	local Pos
	local X = 0
	for i=18,20 do	
		if GetItemInfo(PlayerID,EM_ItemPacketType_EQ,i,EM_ItemValueType_OrgObjID) == MagicTools then
			pos = i
			return true,pos
		else
			X = X + 0
		end
	end
	if X==0 then
		return false
	end
	return false
end

function Lv60_ELITESKILLS_GetItem()			--使用法寶取得凝露或精華
	local PlayerID =  OwnerID()
	local MagicTools = GetItemInfo( PlayerID,EM_ItemPacketType_EQ, -1, EM_ItemValueType_OrgObjID )
	local Durable = GetItemInfo( PlayerID,EM_ItemPacketType_EQ, -1, EM_ItemValueType_Durable )
	local MaxDurable = GetItemInfo( PlayerID,EM_ItemPacketType_EQ, -1, EM_ItemValueType_MaxDurable )

	if (MagicTools == 230786 or MagicTools ==230787 ) and Durable >= MaxDurable then
		GiveBodyItem(PlayerID,240774,1)
		UseItemDestroy()
	elseif MagicTools == 230786 and Durable < MaxDurable then
		ScriptMessage(PlayerID,PlayerID,2,"[LV60_ELITESKILLS_3][$SETVAR1=".."[".."230786".."]".."][$SETVAR2=".."[".."240772".."]".."]",0)
		GiveBodyItem(PlayerID,240772,1)
	elseif MagicTools == 230787 and Durable < MaxDurable then
		ScriptMessage(PlayerID,PlayerID,2,"[LV60_ELITESKILLS_3][$SETVAR1=".."[".."230787".."]".."][$SETVAR2=".."[".."240773".."]".."]",0)
		GiveBodyItem(PlayerID,240773,1)
	end
end


function Lv60_ELITESKILLS_MagicTools_Max()		--最大上限
	local PlayerID = OwnerID()
	local Durable 
	local MaxDurable 
	local NewDurable
	local MagicTools

	for i=18,20 do	
		MagicTools = GetItemInfo(PlayerID,EM_ItemPacketType_EQ ,i,EM_ItemValueType_OrgObjID)
		if MagicTools == 230786 or MagicTools == 230787 then
			Durable = GetItemInfo(PlayerID,EM_ItemPacketType_EQ ,i,EM_ItemValueType_Durable)
			MaxDurable = GetItemInfo( PlayerID,EM_ItemPacketType_EQ, i, EM_ItemValueType_MaxDurable )
			NewDurable = SetItemInfo( PlayerID,EM_ItemPacketType_EQ, i, EM_ItemValueType_Durable, MaxDurable )	
			return NewDurable	
		end
	end
end

--
function Lv60_ELITESKILLS_Beacon(OPTION)
	local PlayerID = OwnerID()
	local NpcID = TargetID()
	local MobList = {}
	MobList[107183] = 107183
	MobList[107185] = 107185
	MobList[107792] = 107792	--Z19 hard
	MobList[107190] = 107190
	MobList[107192] = 107192
	MobList[103580] = 103580	--5.0.4修正難度，一般版世界王也可解任務 2012/10/11
	MobList[103583] = 103583	--5.0.4修正難度，一般版世界王也可解任務
	MobList[107787] = 107787	--5.0.4修正難度，一般版世界王也可解任務	--Z19 easy
	MobList[105893] = 105893	--5.0.4修正難度，一般版世界王也可解任務
	MobList[105894] = 105894	--5.0.4修正難度，一般版世界王也可解任務
	local MobDeath = ReadRoleValue(NpcID,EM_RoleValue_IsDead)
	local MobOrgID = ReadRoleValue(NpcID,EM_RoleValue_OrgID)
	if (OPTION=="CHECK") then
		if MobOrgID==MobList[MobOrgID] and MobDeath == 1 then
			return lua_LV60SkillCheckBuffAG( NpcID )
		else
			ScriptMessage( PlayerID, PlayerID, 2,"[SYS_GAMEMSGEVENT_422]", 0 )		--使用條件不符
			return false
		end
	elseif (OPTION=="USE") then
		SysCastSpellLv( NpcID,PlayerID,850364,1 ) --補充：對boss使用後，讓boss打個法術在你身上，目地是避免2次使用信標。
		GiveBodyItem(PlayerID,240777,1)
	end
end
--準補充：利用身上的buff確認王是否曾被使用過信標，回傳true or false
function lua_LV60SkillCheckBuffAG( NpcID )
	local Pos = Lua_BuffPosSearch( OwnerID() , 623488 ) 
	local member = 0
	if Pos ~= -1 then
		if NpcID == BuffInfo( OwnerID(),Pos,EM_BuffInfoType_OwnerID ) then
			ScriptMessage( OwnerID() , OwnerID() , 2,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		else
			return true
		end
	else
		return true
	end
end
--

function LuaQ_425710_Letter()
	local Player = OwnerID()
	local PlayerLv = ReadRoleValue(Player ,EM_RoleValue_LV)
	local PlayerSubLv = ReadRoleValue(Player ,EM_RoleValue_LV_SUB  )
	local Str = "["..GetUseItemGUID(Player ).."]"		
	ClearBorder( Player );			--初始化石碑介面
	AddBorderPage( Player , GetQuestDetail( 425710 , 1 ) )

	if PlayerLv>= 60 and PlayerSubLv>= 60  then
		ShowBorder( Player ,425710, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage( Player , Player , 3,"[SYS_GAMEMSGEVENT_422]", 0 )
	end
end

function LV60_ELITE_FINISH()
	local PlayerID =TargetID()
	SetFlag(PlayerID,547014,1)
end

function LV60_ELITE_MAIL_0()
	Setplot(OwnerID(),"range","LV60_ELITE_MAIL_1",35)
end

function LV60_ELITE_MAIL_1()
	local Player = OwnerID()
	local PlayerLv = ReadRoleValue(Player ,EM_RoleValue_LV)
	local PlayerSubLv = ReadRoleValue(Player ,EM_RoleValue_LV_SUB  )
	if CheckCompleteQuest(Player,425710)==false and CountBodyItem(Player,241650)<1 and PlayerLv>=60 and PlayerSubLv>=60 and CheckFlag(player,547009)==false then
		SetFlag(PlayerID,547009,1)
		SendMailEx( "[SO_110484_NEWER]" , GetName(OwnerID()) , "[LV60_ELITESKILLS_5]" , "[LV60_ELITESKILLS_6]" , 0, 1 ,0 ) 
	else
		return
	end
end

--使用物品取得60級菁英技能
function Lua_240780_CheckUseScript()--物品使用檢查
	local Player=OwnerID();
	local SubVoc=ReadRoleValue(Player,EM_RoleValue_VOC_SUB);
	if SubVoc==-1 then
		ScriptMessage( Player, Player, 1, "[SC_SYSWARNING_NOSUBVOC]", 0 );--警告訊息：你沒有副職！請裝備你的副職，若是沒有副職請尋找一個。
		return false;
	end
	local subLv = ReadRoleValue(OwnerID(),EM_RoleValue_LV_SUB)
	local mainLv =  ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if mainLv<60 or subLv<60 then
		ScriptMessage( Player, Player, 1, "[SC_SYSWARNING_LVTOOLOW]", 0 );--警告訊息：使用條件不符
		return false;
	end
	local MainVoc=ReadRoleValue(Player,EM_RoleValue_VOC);
--	if MainVoc==9 or MainVoc==10 or SubVoc==9 or SubVoc==10 then
--		ScriptMessage( Player, Player, 1, "[SYS_GAMEMSGEVENT_422]", 0 );--警告訊息：使用條件不符
--		return false;
--	end
	if(CheckCompleteQuest(Player,425709)==true)or(Lua_Across10Lv_AddCond_1()==true)then--完成任務串or有任一職業組合的精英技能
		return true;
	end
	local NextLevelScale= Lua_Across10Lv_CheckKeyItem(MainVoc,SubVoc)  -- 待學技能的下個級別(目前主副組合)
	if NextLevelScale==60 then
		return true;
	elseif  NextLevelScale>60 then
		ScriptMessage(Player,Player,1,"[SC_SYSWARNING_HADBEENHIGHEST]",0);--警告訊息：你已經學會此組合的所有技能！目前沒有更多的內容可供你學習。
		return false;
	else
		ScriptMessage( Player, Player, 1, "[SC_SYS_NEEDLEAD]", 0 );--警告訊息：使用條件不符
		return false;
	end
	local NextPairLvScale=Lua_Across10Lv_CheckLv(MainVoc,SubVoc) --人物雙職業的下個級別
	if NextPairLvScale<=NextLevelScale then
		ScriptMessage( Player, Player, 1, "[SC_SYSWARNING_LVTOOLOW]", 0 );--警告訊息：你的等級不足，請確認你符合學習此技能的門檻。
		return false;
	end
	NextLevelScale= Lua_Across10Lv_CheckKeyItem(SubVoc , MainVoc)  -- 待學技能的下個級別(相反主副組合)
	if NextPairLvScale<=NextLevelScale then
		ScriptMessage( Player, Player, 1, "[SC_SYSWARNING_LVTOOLOW]", 0 );--警告訊息：你的等級不足，請確認你符合學習此技能的門檻。
		return false;
	end
	local checkbeforeLv50 = DW_EliteSkill_tBackDoor()
	if checkbeforeLv50==false then
		DebugMsg(0,0,"checkbeforeLv50="..checkbeforeLv50)
		ScriptMessage( Player, Player, 1, "[SYS_GAMEMSGEVENT_422]", 0 );--警告訊息：使用條件不符
		return false;
	end
	return true;
end
function Lua_240780_SrvScript()--物品使用效果：sever端劇情
	local Player=OwnerID();
	local MainVoc=ReadRoleValue(Player,EM_RoleValue_VOC);
	local SubVoc=ReadRoleValue(Player,EM_RoleValue_VOC_SUB);
	local NextLevelScale= Lua_Across10Lv_CheckKeyItem(MainVoc,SubVoc)  -- 待學技能的下個級別(目前主副組合)
	DW_EliteSkill_tBackDoor()
	Lua_Across10Lv_GetKeyItem(NextLevelScale)
	CastSpell(Player,Player,491010 )
	ScriptMessage( Player, Player, 3, "[SC_111454_9]", C_YELLOW )--恭喜你！你學到新的技能！
	return;
end

--60級菁英技能任務
	
function LV60_ES_SendLetter()--登入事件執行檢查，發信
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )		--取得玩家等級
	local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )	--取得玩家副職等級  副職等級隨主職等級上限，無須判定。
			--Debuglog( 2 , "TH_Event PlayerLV = "..PlayerLV )
			--Debuglog( 2 , "TH_Event PlayerSUBLV = "..PlayerSUBLV )
			--DebugMsg( 0 , 0 , PlayerLV)
			--DebugMsg( 0 , 0 , PlayerSUBLV )
	if PlayerLV>=60 and PlayerSUBLV>=60 and CheckFlag(OwnerID(),547018)==false then 
		local MainVoc=ReadRoleValue(OwnerID(),EM_RoleValue_VOC);
		local SubVoc=ReadRoleValue(OwnerID(),EM_RoleValue_VOC_SUB);
		if Lua_Across10Lv_CheckKeyItem(MainVoc,SubVoc)~=10000 then
			SetFlag(OwnerID(),547008,1)
			SetFlag(OwnerID(),547018,1)
			SendMailEx( "[SO_110484_NEWER]" , GetName(OwnerID()) , "[LV60_ELITESKILLS_5]" , "[LV60_ELITESKILLS_6]" , 0, 1 ,0 ) 
		end
	end
end