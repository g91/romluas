------------------------------------------------------���ڮ楤���]�w-------------------------------------------------------------------------------
function Lua_3YRS_FROGEVENT01_NPC_1()--���ڮ楤��
	local Player = OwnerID()
	local NPC = TargetID()

		SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_19]")
	if CheckFlag(Player,546196) == true then											--�����L�@�����ȫ�~�|�}�Ҫ����y�ﶵ
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_9]","Lua_3YRS_FROGEVENT01_NPC_1_E",0)
	end
	if CountBodyItem(Player,241093)>=3 and CountBodyItem(Player,241094)>=3 then							--���W���\���P�u�ߦU3���ɭԡA���ȴN����
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
	elseif  CheckFlag(Player,546190)==false and CheckBuff(Player,622079)==false and CountBodyItem(Player,241091)<=0 then			--�����ȺX�СB�C�쪬�A�B�w���o�C���]�ĬҵL�k�A�����o�]��
		SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_18]")
		--�٨S����C��y
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_16]","Lua_3YRS_FROGEVENT01_NPC_1_A",0)

	elseif CheckFlag(Player,546191)==false and (CheckBuff(Player,622063)==true or CheckBuff(Player,622064)==true) then				--�C��i�K�O�M���@�����BUFF
		--�٨S�ιL�K�O�M�����
		AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_17]","Lua_3YRS_FROGEVENT01_NPC_1_D",0)
		CloseSpeak(Player)
	else
		SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_19]")
	end
	
end

function Lua_3YRS_FROGEVENT01_NPC_1_D()	--�K�O���@��BUFF
	local Player = OwnerID()
	SetFlag(Player,546191,1)
	CancelBuff(Player,622063)
	CancelBuff(Player,622064)
	CloseSpeak(Player)
end

function Lua_3YRS_FROGEVENT01_NPC_1_E()	--���y�ﶵ
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player,"[SC_3YRS_FROGEVENT01_21]")   -- 5.0.9�睊
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_11]","Lua_3YRS_FROGEVENT01_REWARD(".."1"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_12]","Lua_3YRS_FROGEVENT01_REWARD(".."2"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_13]","Lua_3YRS_FROGEVENT01_REWARD(".."3"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_14]","Lua_3YRS_FROGEVENT01_REWARD(".."4"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_22]","Lua_3YRS_FROGEVENT01_REWARD(".."5"..")",0)
	AddSpeakOption(Player,NPC,"[SC_3YRS_FROGEVENT01_15]","Lua_3YRS_FROGEVENT01_REWARD(".."6"..")",0)

end

function Lua_3YRS_FROGEVENT01_REWARD(Num)	--�I�����y��
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

------------------------------------------------------�p��NPC��-------------------------------------------------------------------------------

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

----------------------------------------------------------------�k�N�]�w----------------------------------------------------------

function Lua_3YRS_EVENT01_MAGIC_1()		--�C���]��
	CastSpell(OwnerID(),OwnerID(),850022)
end

function Lua_3YRS_EVENT01_MAGIC_2()		--�C��y��
	AddBuff(OwnerID(),622078,0,-1)
end

function Lua_3YRS_EVENT01_MAGIC3()		--�C��y��
	return true
end

function Lua_3YRS_Skill_UseCheck()		--��H�P�_
	local TORG = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if TORG == 120410 then
		return true
	else
		return false
	end
end

function Lua_3YS_BUFF_CHANGE()			--�H���ޯ�
	
	local TBUFF = {}
		TBUFF[1] = 622102
		TBUFF[2] = 622110
		TBUFF[3] = 622101
		TBUFF[4] = 622110

	AddBuff(OwnerID(),TBUFF[DW_RAND(4)],0,-1)

	return true
end

function Lua_3YS_BUFF_CANCEL()			--�Ϫ��aĲ�o�ܴ��ޯ�
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

function Lua_3YS_BUFF_CANCEL2()			--�K�KBUFF�����M���ޯ�
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


function Lua_3YS_BUFF_CANCEL3()			--��������Ĥ�
	local Player = TargetID()
	CancelBuff(Player,622063)
	CancelBuff(Player,622064)
end

function Lua_3YRS_FROG_HAPPY()			--�r���P�_
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

function Lua_3YRS_FROG_SAD()			--�q��P�_
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
--Times�G�h�ơFOBJ�G�ۤv�FTarget�G�ؼСFTCheckBuff�G�T�{�ؼ�BUFF�FOAddBuff�G���[BUFF�FItem�G�������~

	local TBuffPos = Lua_BuffPosSearch( Target , TCheckBuff ) 
	local TBuffInfo = BuffInfo(Target,TBuffPos, EM_BuffInfoType_Power )
	if TBuffInfo>=Times then
		CallPlot( Target, "LuaFunc_ResetObj",Target )
		AddBuff(OBJ,OAddBuff,0,-1)
		GiveBodyItem(OBJ,Item,1)
	end
end