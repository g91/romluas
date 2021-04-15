------------------------------------------------------芙蘿格奶奶設定-------------------------------------------------------------------------------
function Lua_3YRS_FROGEVENT01_NPC_1()--芙蘿格奶奶
	local Player = OwnerID()
	local NPC = TargetID()

		SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_19]")
	if CheckFlag(Player,546196) == true then											--完成過一次任務後才會開啟的獎勵選項
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_9]","Lua_3YRS_FROGEVENT01_NPC_1_E",0)
	end
	if CountBodyItem(Player,241093)>=3 and CountBodyItem(Player,241094)>=3 then							--當身上有淚水與真心各3的時候，任務就完成
		SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_4]")
		SetFlag(Player,546194,1)
		SetFlag(Player,546190,1)
		SetFlag(Player,546196,1)
		CancelBuff( Player, 622079)	
		CancelBuff_NoEvent( Player, 622063)
		CancelBuff_NoEvent( Player, 622064)
		DelBodyItem(Player,241093,3);DelBodyItem(Player,241094,3);
		GiveBodyItem(Player,241092,1)
		Tell(Player,NPC,"[SC_3YRS_FROGEVENT01_4]")
	elseif  CheckFlag(Player,546190)==false and CheckBuff(Player,622079)==false and CountBodyItem(Player,241091)<=0 then			--有任務旗標、青蛙狀態、已取得青蛙魔藥皆無法再次取得魔藥
		SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_18]")
		--還沒拿到青蛙魅
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_16]","Lua_3YRS_FROGEVENT01_NPC_1_A",0)

	elseif CheckFlag(Player,546191)==false and (CheckBuff(Player,622063)==true or CheckBuff(Player,622064)==true) then				--每日可免費清除一次氣味BUFF
		--還沒用過免費清除氣味
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_17]","Lua_3YRS_FROGEVENT01_NPC_1_D",0)
		CloseSpeak(Player)
	else
		SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_19]")
	end
	
end

function Lua_3YRS_FROGEVENT01_NPC_1_D()	--免費消一次BUFF
	local Player = OwnerID()
	SetFlag(Player,546191,1)
	CancelBuff(Player,622063)
	CancelBuff(Player,622064)
	CloseSpeak(Player)
end

function Lua_3YRS_FROGEVENT01_NPC_1_E()	--獎勵選項
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_21]")   -- 5.0.9改版
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_11]","Lua_3YRS_FROGEVENT01_REWARD(".."1"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_12]","Lua_3YRS_FROGEVENT01_REWARD(".."2"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_13]","Lua_3YRS_FROGEVENT01_REWARD(".."3"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_14]","Lua_3YRS_FROGEVENT01_REWARD(".."4"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_22]","Lua_3YRS_FROGEVENT01_REWARD(".."5"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_15]","Lua_3YRS_FROGEVENT01_REWARD(".."6"..")",0)

end

function Lua_3YRS_FROGEVENT01_REWARD(Num)	--兌換獎勵用
	local Player = OwnerID()

	CloseSpeak(Player)
	if Num<5  then
		if 	CountBodyItem(Player,241095+Num)>=1 then
			DelBodyItem(Player,241095+Num,1)
			GiveBodyItem(Player,241099+Num,1)
		else
			ScriptMessage( player, player, 1,"[K_08MID_DIALOG7]", 0 )
		end
	elseif Num==5  then
		if CountBodyItem(Player,241099)>=1 and 
	    	   CountBodyItem(Player,241103)>=1 and 
		   CountBodyItem(Player,241102)>=1  then
		   DelBodyItem(Player,241099,1)
		   DelBodyItem(Player,241103,1)
		   DelBodyItem(Player,241102,1)
		   GiveBodyItem(Player,241104,1)
		DesignLog( Player , 1204065 , "4 years event - got mount - 241104 count" )
		else
			ScriptMessage( player, player, 1,"[K_08MID_DIALOG7]", 0 )
		end
	elseif Num==6  then
		if CountBodyItem(Player,241099)>=1 and 
	    	   CountBodyItem(Player,241104)>=1  then
		   DelBodyItem(Player,241099,1)
		   DelBodyItem(Player,241104,1)
		   GiveBodyItem(Player,242161,1)
		DesignLog( Player , 1204066 , "4 years event - got mount - 242161 count" )
		else
			ScriptMessage( player, player, 1,"[K_08MID_DIALOG7]", 0 )
		end
	else
		ScriptMessage( player, player, 1,"[K_08MID_DIALOG7]", 0 )
	end

end

function Lua_3YRS_FROGEVENT01_NPC_1_A()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_2]")
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_0]","Lua_3YRS_FROGEVENT01_NPC_1_B",0)
end

function Lua_3YRS_FROGEVENT01_NPC_1_B()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_3]")
	AddSpeakOption(Player,NPC,"[SO_110377_2]","Lua_3YRS_FROGEVENT01_NPC_1_C",0)	
end

function Lua_3YRS_FROGEVENT01_NPC_1_C()
	local Player = OwnerID()
	GiveBodyItem(Player,241091,1)
	SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_8]")
end

------------------------------------------------------小氣的NPC們-------------------------------------------------------------------------------

function Lua_3YRS_FROGEVENT01_NPC_2()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if CheckBuff(Player,622078)==true and CheckFlag(Player,546194) == true then
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_1]","Lua_3YRS_FROGEVENT01_NPC_2_1",0)
	end
end

function Lua_3YRS_FROGEVENT01_NPC_2_1()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_5]")
	GiveBodyItem(Player,241095,DW_RAND(3))
	SetFlag(Player,546192,1)
	DelBodyItem(Player,546194,1)
end

function Lua_3YRS_FROGEVENT01_NPC_3()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if CheckBuff(Player,622078)==true and CheckFlag(Player,546192) == true then
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_1]","Lua_3YRS_FROGEVENT01_NPC_3_1",0)
	end
end

function Lua_3YRS_FROGEVENT01_NPC_3_1()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_6]")
	GiveBodyItem(Player,241095,DW_RAND(3))
	SetFlag(Player,546193,1)
	DelBodyItem(Player,546192,1)
end

function Lua_3YRS_FROGEVENT01_NPC_4()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if CheckBuff(Player,622078)==true and CheckFlag(Player,546193) == true then
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_1]","Lua_3YRS_FROGEVENT01_NPC_4_1",0)
	end
end

function Lua_3YRS_FROGEVENT01_NPC_4_1()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_7]")
	GiveBodyItem(Player,241095,DW_RAND(3))
	SetFlag(Player,546194,1)
	DelBodyItem(Player,546193,1)
end

----------------------------------------------------------------法術設定----------------------------------------------------------

function Lua_3YRS_EVENT01_MAGIC_1()		--青蛙魔藥
	CastSpell(OwnerID(),OwnerID(),850022)
end

function Lua_3YRS_EVENT01_MAGIC_2()		--青蛙魅藥
	AddBuff(OwnerID(),622078,0,-1)
end

function Lua_3YRS_EVENT01_MAGIC3()		--青蛙魅藥
	return true
end

function Lua_3YRS_Skill_UseCheck()		--對象判斷
	local TORG = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if TORG == 120410 then
		return true
	else
		return false
	end
end

function Lua_3YS_BUFF_CHANGE()			--隨機技能
	
	local TBUFF = {}
		TBUFF[1] = 622102
		TBUFF[2] = 622110
		TBUFF[3] = 622101
		TBUFF[4] = 622110

	AddBuff(OwnerID(),TBUFF[DW_RAND(4)],0,-1)

	return true
end

function Lua_3YS_BUFF_CANCEL()			--使玩家觸發變換技能
	local player = OwnerID()
	local playerBuff = {}
	playerBuff[622101]=622101
	playerBuff[622102]=622102
	playerBuff[622110]=622110

		for key,value in pairs(playerBuff ) do
			if CheckBuff(player,key) == true then
				CancelBuff(player,value)
			end
		end
end

function Lua_3YS_BUFF_CANCEL2()			--呱呱BUFF結束清除技能
	CancelBuff_NoEvent(OwnerID(),622101)
	CancelBuff_NoEvent(OwnerID(),622102)
	CancelBuff_NoEvent(OwnerID(),622110)
end

function Lua_3YS_BUFF_CANCEL3_CHECK()
	local Player = TargetID()
	if CheckBuff(Player,622063)== true or CheckBuff(Player,622064)== true then
		return true
	else
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SYS_GAMEMSGEVENT_422]", 0 )
		return false
	end
end


function Lua_3YS_BUFF_CANCEL3()			--消除氣味藥水
	local Player = TargetID()
	CancelBuff(Player,622063)
	CancelBuff(Player,622064)
end

function Lua_3YRS_FROG_HAPPY()			--愉悅判斷
	local  NPC= TargetID()
	local Player = OwnerID()

	local Times = 4
	local TCheckBuff1 = 622065
	local OAddBuff1 = 622063
	local ITEM1 = 241094

	local words = {}
	words[1]="[SC_3YRS_EVENT01_FROG_1]"
	words[2]="[SC_3YRS_EVENT01_FROG_3]"
	words[3]="[SC_3YRS_EVENT01_FROG_5]"

	if CheckBuff(Player,622063)==false then
		NPCSay(Player ,words[DW_RAND(3)])		
		NPCSay(Npc,"[SC_3YRS_EVENT01_FROG_D]")
		AddBuff(NPC,622065,0,-1)
	elseif  CheckBuff(Player,622063)==true then
		NPCSay(Player ,words[DW_RAND(3)])	
		NPCSay(Npc,"[SC_3YRS_EVENT01_FROG_D]")
		for i=1,2 do
			AddBuff(NPC,622065,0,-1)
		end
	end
	Lua_3YRS_FROGBUFF(Times,Player,NPC,TCheckBuff1,OAddBuff1,ITEM1)
	Lua_3YS_BUFF_CANCEL()
end

function Lua_3YRS_FROG_SAD()			--沮喪判斷
	local NPC = TargetID()
	local Player = OwnerID()

	local Times = 4
	local TCheckBuff2 = 622066
	local OAddBuff2 = 622064
	local ITEM2 = 241093

	local words = {}
	words[1]="[SC_3YRS_EVENT01_FROG_2]"
	words[2]="[SC_3YRS_EVENT01_FROG_4]"
	words[3]="[SC_3YRS_EVENT01_FROG_6]"

	if CheckBuff(Player,622064)==false then
		NPCSay(Player ,words[DW_RAND(3)])	
		NPCSay(Npc,"[SC_3YRS_EVENT01_FROG_E]")
		AddBuff(NPC,622066,0,-1)
	elseif  CheckBuff(Player,622064)==true then
		NPCSay(Player ,words[DW_RAND(3)])	
		NPCSay(Npc,"[SC_3YRS_EVENT01_FROG_E]")
		for i=1,2 do
			AddBuff(NPC,622066,0,-1)
		end
	end
	Lua_3YRS_FROGBUFF(Times,Player,NPC,TCheckBuff2,OAddBuff2,ITEM2)
	Lua_3YS_BUFF_CANCEL()
end

function Lua_3YRS_FROGBUFF(Times,OBJ,Target,TCheckBuff,OAddBuff,Item)
--Times：層數；OBJ：自己；Target：目標；TCheckBuff：確認目標BUFF；OAddBuff：附加BUFF；Item：給予物品

	local TBuffPos = Lua_BuffPosSearch( Target , TCheckBuff ) 
	local TBuffInfo = BuffInfo(Target,TBuffPos, EM_BuffInfoType_Power )
	if TBuffInfo>=Times then
		CallPlot( Target, "LuaFunc_ResetObj",Target )
		AddBuff(OBJ,OAddBuff,0,-1)
		GiveBodyItem(OBJ,Item,1)
	end
end