function Lua_FN_KRNY_Q1_Main() 
	local Signed_Flag = CheckFlag(OwnerID()  , 543597) 
	if Signed_Flag == false then	--看看今天是不是已經拿過禮品
		SetSpeakDetail( OwnerID(), "[SC_KRNY_Q1_1_1]" ) --新年快樂!
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KRNY_Q1_2]", "Lua_FN_KRNY_Q1_Give", 0) --我想聽年節的吉祥話
	else
		SetSpeakDetail( OwnerID(), "[SC_KRNY_Q1_1_2]" ) --新年快樂!
	end
end

function Lua_FN_KRNY_Q1_Give()
	SetFlag( OwnerID()  , 543597 , 1 )
	CloseSpeak( OwnerID() )
	local RANDOM1 = DW_Rand(4)
	local BuffTable = {507842,507843,507844,507845}
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_KRNY_Q1_2_1][$SETVAR1="..GetName(TargetID()).."][$SETVAR2=".."["..BuffTable[RANDOM1].."]".."]", C_SYSTEM );
	AddBuff(OwnerID(),BuffTable[RANDOM1],0,3600)
end

function Lua_FN_KRNY_buff()
	AddBuff( OwnerID() ,504183 ,1 ,7200 )
end

function LuaN_KRNYshop() -- 掛 物件產生劇情 --物品
	AddBuff(TargetID() ,  503217, 1, -1) 
	SetShop(OwnerID() , 600186 , "Test_Shop_Close" ); 
end

function LuaN_KRNY_Q3_Main()
	local Signed_Flag = CheckFlag(OwnerID()  , 543599) 
	SetSpeakDetail( OwnerID(),"[SC_KRNY_Q3_2]")
	if Signed_Flag == true then	--看看是不是有接到任務
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KRNY_Q3_1]", "LuaN_KRNY_Q3_GIVE", 0) --我想要知道怎麼做年糕湯
	end
end

function LuaN_KRNY_Q3_GIVE()
	SetFlag( OwnerID()  , 543599 , 0 )
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID() , 206728 , 1 )
end

function LuaN_KRNY_NPC114345()
	SetSpeakDetail( OwnerID(), "[SC_KRNY_Q1_2_2]" )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_KRNY_Q1_2_3]", "LuaN_KRNY_NPC114345_option1", 0) --我要簽到！
	AddSpeakOption( OwnerID(), TargetID(), "[SC_KRNY_Q1_2_4]", "LuaN_KRNY_NPC114345_option2", 0) --我要領取簽到獎品！
end

function LuaN_KRNY_NPC114345_option1()
	local BuffLV = FN_CountBuffLevel(OwnerID(),505888)
	local flag24 = CheckFlag(OwnerID(),544723)
	local flag9 = CheckFlag(OwnerID(),544722)
	
	if CheckFlag(OwnerID(),544721) == TRUE then
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_KRNY_Q1_2_8]" , 0 )
		CloseSpeak(OwnerID())
		return
	end
	if flag24 == TRUE and flag9 == TRUE then
		CancelBuff(OwnerID(),505888)
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_KRNY_Q1_2_7]" , C_SYSTEM )
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_KRNY_Q1_2_7]" , C_SYSTEM )
	else	
		if BuffLV == -1 then
			AddBuff(OwnerID(),505888,0,-1)
		else
			local NewBuffLV = BuffLV+1
			if NewBuffLV <= 24 then
				CancelBuff(OwnerID(),505888)
				AddBuff(OwnerID(),505888,NewBuffLV,-1)
			end
			--
			if NewBuffLV == 9 then
				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_KRNY_Q1_2_5]" , C_SYSTEM )
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_KRNY_Q1_2_5]" , C_SYSTEM )
			elseif NewBuffLV == 24 then
				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_KRNY_Q1_2_5]" , C_SYSTEM )
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_KRNY_Q1_2_5]" , C_SYSTEM )
			end
		end
		SetFlag( OwnerID(), 544721 , 1 )
	end
	CloseSpeak(OwnerID())
end

function LuaN_KRNY_NPC114345_option2()
	local BuffLV = FN_CountBuffLevel(OwnerID(),505888)
	local flag24 = CheckFlag(OwnerID(),544723)
	local flag9 = CheckFlag(OwnerID(),544722)
	local check = FALSE
	
	if flag24 == TRUE and flag9 == TRUE then
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_KRNY_Q1_2_7]" , C_SYSTEM )
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_KRNY_Q1_2_7]" , C_SYSTEM )
		CloseSpeak(OwnerID())
		return
	else
		if BuffLV >= 24 then
			if flag24 == FALSE then
				if ReadRoleValue(OwnerID(),EM_RoleValue_SEX) == 0 then	--男
					GiveBodyItem(OwnerID(),223386,1)
					GiveBodyItem(OwnerID(),223387,1)
				else
					GiveBodyItem(OwnerID(),223411,1)
					GiveBodyItem(OwnerID(),223412,1)
				end
				SetFlag( OwnerID(), 544723 , 1 )
				CancelBuff(OwnerID(),505888)
				check = TRUE
			end
			if flag9 == FALSE then
				GiveBodyItem(OwnerID(),201519,1)
				SetFlag( OwnerID(), 544722 , 1 )
				flag9 = TRUE
				check = TRUE
			end
		end
		if BuffLV >= 9 then
			if flag9 == FALSE then
				GiveBodyItem(OwnerID(),201519,1)
				SetFlag( OwnerID(), 544722 , 1 )
				check = TRUE
			end
		end
	end
	if check == FALSE then
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_KRNY_Q1_2_6]" , 0 )
	end
	CloseSpeak(OwnerID())
end


--DIR_TAGID_636	韓國西瓜節

function LuaI_207266() --韓國西瓜活動
	local X = DW_Rand(2)
	if X == 1 then
		AddBuff( OwnerID() ,506905,0,1200)
	elseif X==2 then
		AddBuff( OwnerID() ,506906,0,300)
	end
end

function FN_KR_NPC_144055()
	LoadQuestOption( OwnerID() )
	SetSpeakDetail( OwnerID(), "[FN_KR_NPC_144055_1]")
	AddSpeakOption( OwnerID(), TargetID(), "[FN_KR_NPC_144055_2]", "FN_KR_NPC_144055_teach", 0) --活動說明
	AddSpeakOption( OwnerID(), TargetID(), "[FN_KR_NPC_144055_3]", "FN_KR_NPC_144055_change_10", 0) --10個
	AddSpeakOption( OwnerID(), TargetID(), "[FN_KR_NPC_144055_4]", "FN_KR_NPC_144055_change_20", 0) --20個
	AddSpeakOption( OwnerID(), TargetID(), "[FN_KR_NPC_144055_5]", "FN_KR_NPC_144055_change_30", 0) --30個
end

function FN_KR_NPC_144055_teach()
	SetSpeakDetail( OwnerID(), "[FN_KR_NPC_144055_6]" )
end

function FN_KR_NPC_144055_change_10()
	local X = CountBodyItem (OwnerID(), 207265 )
	if X >= 50 then
		DelBodyItem ( OwnerID(), 207265, 50 )
		GiveBodyItem(OwnerID(),207948,5)
		if CheckCompleteQuest(OwnerID(),423081) == FALSE or CheckCompleteQuest(OwnerID(),423082) == FALSE then
			GiveBodyItem(OwnerID(),207333,1)
		end
	else
		ScriptMessage(OwnerID(), OwnerID(), 1, "[FN_KR_NPC_144055_7]", "0" );
	end
	CloseSpeak( OwnerID() )
end

function FN_KR_NPC_144055_change_20()
	local X = CountBodyItem (OwnerID(), 207265 )
	if X >= 100 then
		DelBodyItem ( OwnerID(), 207265, 100 )
		GiveBodyItem(OwnerID(),207949,5)
		if CheckCompleteQuest(OwnerID(),423081) == FALSE or CheckCompleteQuest(OwnerID(),423082) == FALSE then
			GiveBodyItem(OwnerID(),207333,2)
		end
	else
		ScriptMessage(OwnerID(), OwnerID(), 1, "[FN_KR_NPC_144055_7]", "0" );
	end
	CloseSpeak( OwnerID() )
end

function FN_KR_NPC_144055_change_30()
	local X = CountBodyItem (OwnerID(), 207265 )
	if X >= 150 then
		DelBodyItem ( OwnerID(), 207265, 150 )
		GiveBodyItem(OwnerID(),207950,5)
		if CheckCompleteQuest(OwnerID(),423081) == FALSE or CheckCompleteQuest(OwnerID(),423082) == FALSE then
			GiveBodyItem(OwnerID(),207333,3)
		end
	else
		ScriptMessage(OwnerID(), OwnerID(), 1, "[FN_KR_NPC_144055_7]", "0" );
	end
	CloseSpeak( OwnerID() )
end

function FN_KR_NPC_144055_quest423081_finish()
	if CheckCompleteQuest(TargetID(), 423082) == TRUE then
		local X = CountBodyItem (TargetID(), 207333 )
		if X>=1 then
			DelBodyItem (TargetID(), 207333, X )
		end
	end
end

function FN_KR_NPC_144055_quest423082_finish()
	if CheckCompleteQuest(TargetID(), 423081) == TRUE then
		local X = CountBodyItem (TargetID(), 207333 )
		if X>=1 then
			DelBodyItem (TargetID(), 207333, X )
		end
	end
end

Function LuaI_207334(Option) --稱號
	--OwnerID = Player
	SetFlag(OwnerID(),544044,0)
	GiveBodyItem( OwnerID() , 530629 , 1 )
end

--====================================
--		白色情人節
--====================================
function FN_KR_WhiteValentine_shop()
	AddBuff(TargetID() ,  503217, 1, -1) 
	SetShop(OwnerID() , 600184 , "Test_Shop_Close" ); 
end