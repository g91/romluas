function Lua_fireday_ev3_moon()
	AddBuff(OwnerID(),508281,1,-1)
	SetRandMove(OwnerID(), 500, 150,150)
--	BeginPlot(OwnerID(), "Lua_fireday_ev3_01",0)
end

function Lua_fireday_ev3_check()
	local ckbuff = CheckBuff(TargetID(), 508281)
		if ckbuff == FALSE then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV3_06]" , C_SYSTEM )
			return FALSE
		elseif  ckbuff == true then
			return true
		end
end

function Lua_fireday_ev3_attatk()
local tag=CheckBuff(TargetID(),508281)
	if tag == FALSE then
--		BeginPlot(OwnerID(),"Lua_fireday_ev3_sk",0)
		return FALSE
	end
	if tag == TRUE then 
		return TRUE
	end
end
	

function Lua_fireday_ev3_02()--maneger
local key = CheckFlag(OwnerID(), 544732)--完成尋找
local key2 = CheckCompleteQuest(OwnerID(), 423857)
	if key == TRUE and key2 == TRUE then
		SetSpeakDetail(OwnerID(), "[SC_FIREDAY_EV3_00]")
	end
	if key2 == TRUE and key == FALSE then
		SetSpeakDetail(OwnerID(), "[SC_FIREDAY_EV3_01]")
		LoadQuestOption(OwnerID())
	end
	if key == false and key2 == FALSE then
		LoadQuestOption (OwnerID())
	end
end

function Lua_fireday_ev3_03()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(), 208917 , 1 )
end
---------------------------
function Lua_fireday_ev3_00()--razeru
local y= CheckCompleteQuest(OwnerID(), 423857)
local x = CheckFlag(OwnerID(), 544732)
local z = CheckAcceptQuest (OwnerID(), 423858 )	
	if x == TRUE and y == true then
	SetSpeakDetail(OwnerID(), "[SC_FIREDAY_EV3_05]")
	elseif y == TRUE and z == TRUE then
	LoadQuestOption(OwnerID())
	elseif x == FALSE and y == TRUE  then 
	SetSpeakDetail(OwnerID(), "[SC_FIREDAY_EV3_04]")
	elseif x == FALSE and y == FALSE then
	LoadQuestOption(OwnerID())
	end
end
------------------先報廢
function Lua_fireday_ev3_04()
	local fin = CountBodyItem(OwnerID(),208916)
	if fin == TRUE then
	CloseSpeak(OwnerID() )
	SetFlag(OwnerID(), 544732, 1 )
	DelBodyItem(OwnerID(),208916, 1 )
	DelBodyItem(OwnerID(), 208917, 1 )
	GiveBodyItem(OwnerID(), 208918, 1)
	GiveBodyItem(OwnerID(),208915, 1)
	else
	SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你的材料不足
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "Lua_fireday_ev3_00", 0 )--回到上一層
	end
end
------------------
function Lua_fireday_ev3_05()
	SetFlag( TargetID() , 544732 , 1 ) --完成任務後給flag
end