function lua_valentine_sendflower_00()  --npc start
local take=CheckFlag(OwnerID(), 544817)
	if take == FALSE then
	SetSpeakDetail(OwnerID(), "[SC_VALENTINE_2011EV2_00]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_01]","lua_valentine_sendflower_01",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_07]","lua_valentine_sendflower_change",0)
	elseif take == TRUE then
	SetSpeakDetail(OwnerID(),"[SC_VALENTINE_2011EV2_05]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_04]","lua_valentine_sendflower_special",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_07]","lua_valentine_sendflower_change",0)
	end
end
function lua_valentine_sendflower_01()
	SetSpeakDetail(OwnerID(),"[SC_VALENTINE_2011EV2_03]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_01]","lua_valentine_sendflower_02",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_04]","lua_valentine_sendflower_special",0)
end

function lua_valentine_sendflower_02()
local s = Check_Bag_Space( OwnerID() , 1  )
	if s == TRUE then
	GiveBodyItem(OwnerID(),209137,5)
	SetFlag(OwnerID(),544817,1)
	CloseSpeak(OwnerID())
	else
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_00", 0 )
	end
end
function lua_valentine_sendflower_SKILL()

	AddBuff(OwnerID(),508993,1,600)
	AddBuff(TargetID(),508992,1,600)
	ScriptMessage(OwnerID(),TargetID(),1,"[SC_VALENTINE_2011EV2_06]",C_SYSTEM)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_VALENTINE_2011EV2_06]",C_SYSTEM)
	GiveBodyItem(TargetID(),209138,1)

end
function lua_valentine_sendflower_skcheck()
local tmpO=OwnerID()
local tmpT=TargetID()
local ckbuff= CheckBuff(TargetID(),508992)
	if tmpO == tmpT then
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_VALENTINE_2011EV2_15]",C_SYSTEM)
		return FALSE	
	elseif ckbuff == TRUE then
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_VALENTINE_2011EV2_ERR]",C_SYSTEM)
		return FALSE
	else
		return TRUE
	end
end
function lua_valentine_sendflower_special()
	SetSpeakDetail(OwnerID(),"[SC_VALENTINE_2011EV2_08]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_09]","lua_valentine_sendflower_special_0",0)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_00", 0 )--回到上一層
end

function lua_valentine_sendflower_special_0()
local tempC=CountBodyItem(OwnerID(),202903)
local tmpS=Check_Bag_Space(OwnerID(),1)
	if tempC>=1 and tmpS == TRUE  then
	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(),202903,1)
	GiveBodyItem(OwnerID(),209139,1)
	elseif tempC>=1 and tmpS==FALSE then
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_special", 0 )
	elseif tempC<1 then
	SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你的材料不足
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_special", 0 )--回到上一層	
	end
end	


function lua_valentine_sendflower_change()
	SetSpeakDetail(OwnerID(),"[SC_VALENTINE_2011EV2_10]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_11]","lua_valentine_sendflower_change15",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_12]","lua_valentine_sendflower_change30",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_13]","lua_valentine_sendflower_change50",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_VALENTINE_2011EV2_14]","lua_valentine_sendflower_change100",0)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_00", 0 )
end
---------vvvvv蒐集品兌換區vvvvvvv------------
function lua_valentine_sendflower_change15()
local check = CountBodyItem(OwnerID(),209138)
local BLV = FN_CountBuffLevel(OwnerID(), 508995)
local a = BLV +1
local S = Check_Bag_Space(OwnerID(),1)
	if check >= 10 and S == true then
	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(),209138,10)
	GiveBodyItem(OwnerID(),209161,1)
	AddBuff(OwnerID(), 508995,a,-1)
	elseif check>=10 and S==false then
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_change", 0 )
	elseif check< 10 then
	SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你的材料不足
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_change", 0 )--回到上一層	
	end	
local d = FN_CountBuffLevel(OwnerID(),508995)
	if d >= 31 then
	GiveBodyItem(OwnerID(),530675,1)
	CancelBuff(OwnerID(),508995)
	end
end

function lua_valentine_sendflower_change30()
local check = CountBodyItem(OwnerID(),209138)
local BLV = FN_CountBuffLevel(OwnerID(), 508995)
local a = BLV +1
local S = Check_Bag_Space(OwnerID(),2)
	if check >= 30 and S == TRUE then
	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(),209138,30)
	GiveBodyItem(OwnerID(),209161,1)
	GiveBodyItem(OwnerID(),209162,1)
	AddBuff(OwnerID(), 508995,a,-1)
	elseif check >=30 and S== FALSE then
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_change", 0 )
	elseif check< 30 then
	SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你的材料不足
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_change", 0 )--回到上一層	
	end	
local d = FN_CountBuffLevel(OwnerID(),508995)
	if d >= 31 then
	GiveBodyItem(OwnerID(),530675,1)
	CancelBuff(OwnerID(),508995)
	end
end

function lua_valentine_sendflower_change50()
local check = CountBodyItem(OwnerID(),209138)
local BLV = FN_CountBuffLevel(OwnerID(), 508995)
local a = BLV +1
local S = Check_Bag_Space(OwnerID(),2)
	if check >= 50 and S == TRUE then
	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(),209138,50)
	GiveBodyItem(OwnerID(),209161,2)
	GiveBodyItem(OwnerID(),209162,2)
	AddBuff(OwnerID(), 508995,a,-1)
	elseif check>=50 and S==FALSE then
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_change", 0 )
	elseif check< 50 then
	SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你的材料不足
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_change", 0 )--回到上一層	
	end	
local d = FN_CountBuffLevel(OwnerID(),508995)
	if d >= 31 then
	GiveBodyItem(OwnerID(),530675,1)
	CancelBuff(OwnerID(),508995)
	end
end

function lua_valentine_sendflower_change100()
local check = CountBodyItem(OwnerID(),209138)
local S = Check_Bag_Space(OwnerID(),2)
	if check >= 123 and S==TRUE then
	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(),209138,123)
	GiveBodyItem(OwnerID(),209161,4)
	GiveBodyItem(OwnerID(),209162,3)
	GiveBodyItem(OwnerID(),530676,1)
	elseif check>= 123 and S == FALSE then
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_change", 0 )
	elseif check < 123 then
	SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你的材料不足
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_valentine_sendflower_change", 0 )--回到上一層	
	end	
end

--------^^^^^蒐集品兌換^^^^^----------
function lua_valentine_sendflower_pack()
	if Check_Bag_Space( OwnerID() , 1 ) == false then
		return false
	end
	
	local itemset1 = {  55 ,""	 	, { 209161 , 1 }
			,  80,""		, { 209161 , 2 }
			, 92 ,""		, { 209161 , 3 }
			, 97 ,""		, { 209161 , 4 } 
			, 100 ,"" 	, { 209161 , 5 }	}
	BaseTressureProc7( itemset1 , 1 )
	
	return true
end
---------
function lua_valentine_award()

GiveBodyItem(OwnerID(),725640,1)
end

function lua_valentine_award_CHECK()
local bagS=Check_Bag_Space(OwnerID(),1)
if bagS == FALSE then
return FALSE
else
return TRUE
end
end