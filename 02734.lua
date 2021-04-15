function LuaQ_425206_ClickCheck()	--任務:療癒之籽，點擊(物件)前事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local emptybucket = 241658
	if CountBodyItem(player,emptybucket)>0 and 
	(CheckAcceptQuest(player,425206)==true or 
	 CheckAcceptQuest(player,425767)==true or 
	 CheckAcceptQuest(player,425777)==true) then
		return true
	else
		ScriptMessage(player,player,0,"[NO_ITEM][$SETVAR1=".."[".."241658".."]".."]",0)	--你沒有空的水桶！
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)			--使用條件不符！
		return false
	end
end

function LuaQ_425206_Click()	--任務:療癒之籽，點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local emptybucket = 241658
	DelBodyItem(player,emptybucket,1)
	return true
end

function LuaQ_425206_NpcSpeak()--任務:療癒之籽，NPC:121173-列寇卓德，對話選項
	local player = OwnerID()
	if CountBodyItem(player,241657)>0 and
	 (CheckAcceptQuest(player,425206)==true or 
	  CheckAcceptQuest(player,425767)==true or 
	  CheckAcceptQuest(player,425777)==true)then
		AddSpeakOption(player,player,"[SC_YOUWANTIT][$SETVAR1=".."[".."241657".."]".."]","LuaQ_425206_NpcSpeak_0",0)
	end
	if CheckAcceptQuest(player,425635)==true and
		CountBodyItem(player,241655)==0 and
		CheckFlag(player,546893)==false then
		GiveBodyItem(player,241655,1)
	end
	LoadQuestOption(player)
end

function LuaQ_425206_NpcSpeak_0()	--給NPC桶子，給完成條件
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107428
	DelBodyItem(player,241657,1)
	CallPlot(player,"DW_QietKillOne",player,questitem)
	GiveBodyItem(player,241658,1)
	Npcsay(Npc,"[SC_424151_4]")
	CloseSpeak(player)
end

function LuaQ_425207_Potions_Check()--任務:救治傷患，物品:241661-治療藥水 使用前檢查
	local player = OwnerID()
	local Npc = TargetID()
	local NpcOrg = ReadRoleValue(npc,EM_RoleValue_OrgID)
	local CheckDis = CheckDistance(player,Npc,40)
	local NpcBuff = CheckBuff(Npc,623497)
	if NpcBuff==false then
		if CheckDis==true  then
			if NpcOrg==121588 and 
			(CheckAcceptQuest(player,425207)==true or 
			CheckAcceptQuest(player,425768)==true or 
			CheckAcceptQuest(player,425778)==true ) then
				return true
			else
				ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)
				return false
			end
		else
			ScriptMessage(player,player,1,"[SC_424086_8]",0)
			return false	
		end
	else
			ScriptMessage(player,player,1,"[SC_Z24_425207_0][$SETVAR1=".."[".."121588".."]".."]",0)
			return false			
	end
end

function LuaQ_425207_Potions_Use()--任務:救治傷患，物品:241661-治療藥水 使用後判定
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107429
	local action = 0 
	action=DW_RAND(100)
	if action%10<=7 then
		AddBuff(Npc,623497,0,15)
		Npcsay(Npc,"[SC_RESCUE_STRING_NPC02]")
		CallPlot(player,"DW_QietKillOne",player,questitem)	
	else
		ScriptMessage(player,player,1,"[SC_425207_FAIL]",0)
	end
end

function LuaQ_425207_Finish()	--完成任務：開啟委託、PE
	local player = TargetID()
	SetFlag(player,547216,1)
	SetFlag(player,547206,1)
end

function LuaQ_425220_TeleportSpot()    --任務:協助傳送程序
	SetPlot( OwnerID(),"collision","LuaQ_425220_Teleport",0 )	
end

function LuaQ_425220_Teleport()
	local player = OwnerID()
	local Location = 0
	if (CheckAcceptQuest(player,425220)==true or   
	   CheckAcceptQuest(player,425764)==true or
	   CheckAcceptQuest(player,425774)==true) and CheckFlag(player,547201)==false then
		Location = DW_RAND(3)
		if Location == 1 then
			SetFlag(player,547201,1)
			SetPos(player,1087.7,657.1,-6713.7,0)
		elseif Location == 2 then
			SetFlag(player,547201,1)
			SetPos(player,393.4,478.7,-9328.2,0)
		else
			SetFlag(player,547201,1)
			SetPos(player,3306,3.8,-10195,0)
		end
		ScriptMessage(player,player,2,"[SC_101431_03]",0)
		ScriptMessage(player,player,0,"[SC_101431_03]",0)
	else
		return
	end
end

function LuaQ_425220_finish()--完成任務：開啟委託、PE
	local player = TargetID()
	SetFlag(player,547218,1)
	SetFlag(player,547208,1)
end

function LuaQ_425542_finish()--完成任務：開啟委託、PE --馴鹿幫手
	local player = TargetID()
	SetFlag(player,547212,1)
	SetFlag(player,547222,1)
end

function LuaQ_425231_ItemCheck()--任務:新的同盟？物品:241659-充能器使用前檢查
	local player = OwnerID()
	if CheckAcceptQuest(player,425231)==true  then
		return true
	else
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
		return false
	end
end

function LuaQ_425231_ItemUsed()--任務:新的同盟？物品:241659-充能器使用後效果
	local player = OwnerID()
	ScriptMessage(player,player,2,"[SC_PE_9_1_48]",0)
	AddBuff(player,623815,0,5)
end

function LuaQ_425231_ClickCheck()--任務:新的同盟？點擊(物件)前事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	if CheckBuff(player,623815)==true then
		if CheckBuff(Npc,623816)==false  then
			if CheckBuff(player,623815)==true and 
			   CheckAcceptQuest(player,425231)==true  then
				return true
			else
				ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
				return false
			end
		else
			ScriptMessage(player,player,1,"[SC_Z24_425231_0][$SETVAR1=".."[".."121230".."]".."]",0)			--使用條件不符！
			return false
		end
	else
		ScriptMessage(player,player,1,"[SC_DEFEND_TOWERNOENGER]",0)			--使用條件不符！
		return false
	end
end

function LuaQ_425231_Click()--任務:新的同盟？點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107430 --成功補充能量
	local action = 0 
	action=DW_RAND(10)
	if action<=7 then
		AddBuff(Npc,623816,0,15)
		CallPlot(player,"DW_QietKillOne",player,questitem)	
	else
		ScriptMessage(player,player,1,"[SC_Z24_425231_1]",0)
	end	
	return true
end

function LuaQ_425232_UseCheck()--任務:強化防線？物品:241660-超級8段調節能源射線儀
	local player = OwnerID()
	local Npc = TargetID()
	local NcpTable = {}
	NcpTable[107138] = 107138
	NcpTable[107139] = 107139
	NcpTable[107140] = 107140
	NcpTable[107141] = 107141
	local NcpOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)

	DW_CancelTypeBuff(68,player)
	
	if CheckAcceptQuest(player,425232)==true and 
	   NcpOrg==NcpTable[NcpOrg] and 
	   CheckBuff(Npc,623817)==false then
		  if CheckDistance(player,Npc,50)==true then
					return true
		else
			ScriptMessage(player,player,1,"[SC_424086_8]",0)
			return false
		end
	else
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
		return false
	end		
end

function LuaQ_425232_Used()
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107431 --成功使用射線
	local action = 0 
	action=DW_RAND(10)
	if action<=7 then
		AddBuff(Npc,623817,0,15)
		CallPlot(player,"DW_QietKillOne",player,questitem)	
	else
		AddBuff(player,623818,0,10)
		ScriptMessage(player,player,1,"[SC_Z24_425232_0]",0)
	end	
end

function LuaQ_425538_UseCheck()--任務:棉薄之力？物品:241663-鹿奶酪
	local player = OwnerID()
	local Npc = TargetID()
	local NpcTable = {}
	NpcTable[121220] = 121220
	NpcTable[121588] = 121588
	NpcTable[121223] = 121223
	NpcTable[121225] = 121225
	NpcTable[121224] = 121224
	NpcTable[121584] = 121584
	NpcTable[121585] = 121585
	NpcTable[121173] = 121173
	NpcTable[121220] = 121220
	NpcTable[121593] = 121593
	NpcTable[121591] = 121591

	local NpcOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	if CheckAcceptQuest(player,425538)==true and NpcOrg ==NpcTable[NpcOrg ]  then
		return true
	else
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
		return false
	end	
end

function LuaQ_425538_Used()--任務:棉薄之力？物品:241663-鹿奶酪
	local player = OwnerID()
	local Npc = TargetID()
--	local StringRand = DW_Rand(2)
	NpcSay(Npc,"[SC_422068_5]")	
	CallPlot(player,"DW_QietKillOne",player,107432)
	return true	
end



function LuaQ_425541_ItemCheck()--任務:照料馴鹿，物品:241662-動物用藥劑
	local player = OwnerID()
	local Npc = TargetID()
	local sick = 623819
	if (CheckAcceptQuest(player,425541)==true or 
	   CheckAcceptQuest(player,425769)==true or 
	   CheckAcceptQuest(player,425779)==true ) and 
	   CheckBuff(Npc,623819)==true  then
		  if CheckDistance(player,Npc,50)==true then
			return true
		else
			ScriptMessage(player,player,1,"[SC_424086_8]",0)
			return false
		end
	elseif (CheckAcceptQuest(player,425541)==true or 
	   CheckAcceptQuest(player,425769)==true or 
	   CheckAcceptQuest(player,425779)==true ) and 
	   CheckBuff(Npc,623819)==false then
		ScriptMessage(player,player,1,"[SC_425541_GOOD]",0)	--使用條件不符！
		return false
	else
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
		return false
	end	
end

function LuaQ_425541_ItemUsed()--任務:照料馴鹿，物品:241662-動物用藥劑
	local player = OwnerID()
	local Npc = TargetID()
	local NpcOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	local sick = 623819
	local questitem = 107433 --成功照顧馴鹿
	if CheckBuff(Npc,sick)==true and NpcOrg==121608 then
		CancelBuff(Npc,sick)
		CallPlot(player,"DW_QietKillOne",player,questitem)
		return true
	else
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
		return false		
	end		
end

function LuaQ_425541_GetSick()
	local Npc = OwnerID()
	CallPlot(Npc,"LuaQ_425541_GetSick_1",Npc)
end

function LuaQ_425541_GetSick_1()
	local Npc = OwnerID()
	Sleep(150)
	AddBuff(Npc,623819,0,-1)
end

function LuaQ_425541_SickDeer()
	local Npc = OwnerID()
	AddBuff(Npc,623819,0,-1)
end


function LuaQ_425541_ClickCheck()--任務:照料馴鹿  點擊(物件)前事件(掛在任務模板) (木箱)
	local player = OwnerID()
	local Npc = TargetID()
		if CountBodyItem(player,242067)>0 and 
		   (CheckAcceptQuest(player,425541)==true or 
		    CheckAcceptQuest(player,425769)==true or 
		    CheckAcceptQuest(player,425779)==true)  then
			return true
		else

			ScriptMessage(player,player,1,"[ITEM_NOT_ENOUGH][$SETVAR1=".."[".."242067".."]".."]",0)	--沒有足夠的糧草！
			return false
		end
end

function LuaQ_425541_Click()--任務:照料馴鹿  點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local Grass = 0
	local questitem = 107434 --成功餵食馴鹿
	DelBodyItem(player,242067,1)
	CallPlot(player,"DW_QietKillOne",player,questitem)
	Grass = LuaFunc_CreateObjByObj ( 119244 , Npc ) 	
	SetModeEx(Grass,EM_SetModeType_Mark,false)    		
	SetModeEx(Grass,EM_SetModeType_HideName,true)     
	CallPlot(Grass,"LuaQ_425541_ObjDel",Grass)
	return true
end

function LuaQ_425541_ObjDel(obj)
	Sleep(100)
	DelObj(obj)
end


function LuaQ_425544_ClickCheck()--任務:穩定結界  點擊(物件)前事件(掛在任務模板) (木箱)
	local player = OwnerID()
	local Npc = TargetID()
		if CountBodyItem(player,242069)>0 and 
		   CheckAcceptQuest(player,425544)==true  then
			return true
		else
			ScriptMessage(player,player,1,"[ITEM_NOT_ENOUGH][$SETVAR1=".."[".."242069".."]".."]",0)	--沒有足夠的糧草！
			return false
		end
end

function LuaQ_425544_Click()--任務:穩定結界  點擊(物件)後事件(掛在任務模板)
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107435 --穩定結界能量
	CallPlot(player,"DW_QietKillOne",player,questitem)
	return true
end

function LuaQ_425675_finish_GiveItem()
	local player = OwnerID()
	local Npc = TargetID()
	if CheckCompleteQuest(player,425675)==true and --完成熱肉湯
	   CheckAcceptQuest(player,425674)==true and	--呼喚未完成
	   CountBodyItem(player,241666)<1 then		--熱肉湯
	SetSpeakDetail(player,"[SC_YOUWANTIT][$SETVAR1=".."[".."241666".."]".."]")
	GiveBodyItem(player,241666,1)
	end
	LoadQuestOption(player)
end

function LuaQ_425672_finish()--完成任務：開啟委託、PE
	local player = TargetID()
	SetFlag(player,547214,1)
	SetFlag(player,547224,1)
end

-- 

function LuaQ_425643_finish()
	local Player = TargetID()
	ScriptMessage( Player, Player, 3, "[SC_425643_0]", C_SYSTEM )
	AddBuff( Player, 506098, 0, 3 )
	Sleep( 30 )
	SetPos(player,4491.8,178.8,-9601.9,180)
end



function LuaQ_425636_FINISH()	--善有善報
	local Npc = OwnerID()
	local player = TargetID()
	SetFlag(Player,546893,1)
	AddBuff(player,623821,0,-1)

	Sleep(10)
	local Actor=Lua_DW_CreateObj( "flag" , 121611 , 781248, 0 , 1 , 1 )
	DW_Move("flag",Actor,781248,1)
	YELL(Actor,"[SC_422666]",2)
	sleep(25)
	DelObj(Actor)
	sleep(5)
	CancelBuff(player,623821)
end


function LuaQ_425634_finish()	--舉手之勞
	local player = TargetID()	
	GiveBodyItem(player,241655,1)
end


function LuaQ_425641_UseCheck()   --錦囊妙計參考
	local player = OwnerID()
	local Npc = TargetID()
	local TOrg = ReadRoleValue(Npc ,EM_RoleValue_OrgID)
	local THP = ReadRoleValue(Npc ,EM_RoleValue_HP)
	local TMaxHP = ReadRoleValue(Npc ,EM_RoleValue_MaxHP)
	local TDeath = ReadRoleValue(Npc ,EM_RoleValue_IsDead)
	local TargetCheck = 0
	local hpcount = 0
	local TargetMonster = {}
		TargetMonster[106403]=242062;

		if CheckAcceptQuest(player ,425641)== true and TOrg==105708  then
			TargetCheck = TargetCheck +1
		end
		if TDeath == 1 then
			ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif   (THP/TMaxHP) <= 0.3   then
			hpcount  = hpcount +1 
		end
		if TargetCheck==1 and hpcount==1 then
			return true
		elseif TargetCheck~=1 then
	 		   ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif hpcount~=1 then
		 	   ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		end
end

function LuaQ_425641_Used()
	local player = OwnerID()
	local Npc = TargetID()
	local TOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	UseItemDestroy()
	if TOrg == 105708  then
		GiveBodyItem(player ,242062,1)
	 	ScriptMessage( player , player , 2,"[SC_424317_03]", 0 )
		CallPlot( Npc, "LuaFunc_ResetObj",Npc )
	end

end

function LuaS_425639_finish()
	local Npc = OwnerID()
	local player = TargetID()
	AddBuff(player,623822,0,4)

	Sleep(5)
	local Actor=Lua_DW_CreateObj( "obj",121612,Npc , 1 , 1)
	DW_Move("flag",Actor,781248,2)
	YELL(Actor,"[SC_425639_SHOW_1]",2)
	sleep(15)
	DelObj(Actor)
	sleep(5)
	CancelBuff(player,623822)
end

function LuaS_425640_Accept()
	local Npc = OwnerID()
	local player = TargetID()
	AddBuff(player,623824,0,-1)

	Sleep(5)
	local Actor=Lua_DW_CreateObj( "obj",121701,Npc , 1 , 1)
	DW_Move("flag",Actor,781248,3)
	sleep(15)
	DelObj(Actor)
	sleep(5)
	CancelBuff(player,623824)
end

function LuaQ_425638_Monster_Dead()		--怪物死亡劇情

	local monsterlist= {}
	monsterlist = DW_HateSequence( 0 )
	for i=1,table.getn(monsterlist) do
		if CheckAcceptQuest(monsterlist[i],425638) == true then
			SetFlag(monsterlist[i],547356,1)
		end
	end
end

function LuaQ_425644_Use()--任務:商討對策？ 信件使用
	local player = OwnerID()
	local Npc = TargetID()
	local NpcTable = {}
	local NpcOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	NpcTable[118309] = 547347	--犀牛人
	NpcTable[115647] = 547350	--貓族
	NpcTable[115150] = 547351	--夏爾多 ZONE_SHADOR
	NpcTable[118266] = 547352	--艾翁 ZONE_AYON

		if CheckAcceptQuest(player,425644)==true  then
			  if CheckDistance(player,Npc,50)==true then
				for index,value in pairs(NpcTable) do
					if NpcOrg==index and  CheckFlag(player,value)==false then
						SetFlag(player,value,1)
						Npcsay(Npc,"[SC_425644_0]")
						UseItemDestroy()
						break
					else
						ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)	--使用條件不符！
					end
				end
			else
				ScriptMessage(player,player,1,"[SC_424086_8]",0)
			end
		else
			ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)				--使用條件不符！
		end	
end

function LuaS_425833_accept()
	local Npc = OwnerID()
	local player = TargetID()
	AddBuff(player,622310,0,-1)

	Sleep(5)
	local Actor=Lua_DW_CreateObj( "obj",121701,Npc , 1 , 1)
	DW_Move("flag",Actor,781248,10)
	YELL(Actor,"[SC_425639_SHOW_1]",2)
	sleep(15)
	DelObj(Actor)
	sleep(5)
	CancelBuff(player,622310)
end

function LuaS_425833_finish()
	local Npc = OwnerID()
	local player = TargetID()
	GiveBodyItem(player,241327,1)
	GiveBodyItem(player,242027,1)
end