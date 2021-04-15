function FN_Gamania_1Year_116037()
	AdjustFaceDir( TargetID(), OwnerID(), 0 )
	LoadQuestOption( OwnerID())
	SetSpeakDetail( OwnerID(), "[GAMANIA_1YEAR_01]"  )
	AddSpeakOption( OwnerID(), TargetID(), "[GAMANIA_1YEAR_02]"  , "FN_Gamania_1Year_Exchange", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[GAMANIA_1YEAR_03]"  , "FN_Gamania_1Year_teach", 0 )
end

function FN_Gamania_1Year_teach()
	SetSpeakDetail( OwnerID(), "[GAMANIA_1YEAR_TEACH]"  )
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]"  , "FN_Gamania_1Year_116037", 0 )
end

function FN_Gamania_1Year_Exchange()
	local CheckTable = {208184,208185,208186,208187,208188,208189,208190}
	local CheckX
	local ItemCheck = TRUE

	for i=1,7 do
		if i == 1 then
			CheckX = 1
		else
			CheckX = 0
		end
		if CountBodyItem( OwnerID(), CheckTable[i] ) <= CheckX then
			ItemCheck = FALSE
			break
		end
	end
	--
	if ItemCheck == FALSE then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[GAMANIA_1YEAR_NOTENOUGHITEM]", 0 )
	else
		DelBodyItem( OwnerID(), 208184, 2 )
		DelBodyItem( OwnerID(), 208185, 1 )
		DelBodyItem( OwnerID(), 208186, 1 )
		DelBodyItem( OwnerID(), 208187, 1 )
		DelBodyItem( OwnerID(), 208188, 1 )
		DelBodyItem( OwnerID(), 208189, 1 )
		DelBodyItem( OwnerID(), 208190, 1 )
		GiveBodyItem(OwnerID(),208191,1)
	end
	CloseSpeak(OwnerID())
end

Function LuaI_208191() --神諭之戰周年慶禮包

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208191]][$SETVAR3=[207568]]"

	if Check_Bag_Space( OwnerID() , 1 ) == false then
		return false
	end
	
	local itemset = { 1 ,Prize1Str	, { 207568,1 } --永久赤怒鐵脊龍
		        , 4 ,""	, { 207567,1 } --30天赤怒鐵脊龍
		       , 10 ,""	, { 207566,1 } --7天赤怒鐵脊龍
		       , 17 ,""	, { 205549,1 } --7天背包空間卷-V
		       , 24 ,""	, { 205550,1 } --7天背包空間卷-VI
	                     , 32 ,"" 	, { 207749,1 } --7天銀行空間卷-IV
 		       , 40 ,"" 	, { 207750,1 } --7天銀行空間卷-V
		       , 52 ,"" 	, { 203784,5 } --公會城堡傳送石
		       , 64 ,"" 	, { 202904,3 } --傳送門符文
		       , 76 ,"" 	, { 202435,5 } --家的牽絆
		       , 88 ,"" 	, { 208211,5 } --橘子汁
		       , 100 ,"" 	, { 208212,5 }} --橘子				

	BaseTressureProc7(   itemset , 1 );
	return true;
end

function FN_Gamania_1Year_QuestSpellCheck()
	if OwnerID() == TargetID() then
		return FALSE
	else
		return TRUE
	end	
end

function FN_Gamania_1Year_QuestSpell()
	local class = ReadRoleValue ( TargetID(), EM_RoleValue_VOC)
	local flagtable = {544409,544410,544411,544412,544413,544414,544415,544416}
	for i = 1,8 do
		if class == i then
			if CheckFlag(OwnerID(),flagtable[i]) == FALSE then
				Say(OwnerID(),"[GAMANIA_1YEAR_04]")
				SetFlag(OwnerID(),flagtable[i],1)
				AddBuff(TargetID(),506936,0,3600)
			end
		end
	end
end

function LuaI_208294()
	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	GiveBodyItem(OwnerID(),725396,2)
end