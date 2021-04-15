function Discowood_Vocation_Talk_0()
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race >1	then
		SetSpeakDetail(Obj,"[SC_120515_A]");
		return;
	end
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	LoadQuestOption(OwnerID())
	--我很擔心自己的前途，我將可以學到什麼技能？
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_12") , "Discowood_Vocation_Talk_ShowSkill", 0 ) 
	--換取15級技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_1_15") , "DW_Vocation_license_15", 0 ) 
	--換取20級技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_1_20") , "DW_Vocation_license_20", 0 )  
	--我想知道取得技能學習證書的方法。
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_10") , "Discowood_Vocation_Talk_HigherSkill", 0 ) 
	--我要學習新的技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_3") , "Discowood_Vocation_Show_GetSkill", 0 ) 
end

function Discowood_Vocation_Talk_1()--費爾‧阿克加德
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race >1	then
		SetSpeakDetail(Obj,"[SC_120515_A]");
		return;
	end
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	LoadQuestOption(OwnerID())
	local KeyItem = {
				{	0 	,	541945	,	541946	,	541947	,	541948	,	541949	,	543032	,	543033	}	,
				{	541950	,	0	,	541951	,	541952	,	541953	,	541954	,	543034	,	543035	}	,
				{	541955	,	541956	,	0	,	541957	,	541958	,	541959	,	543036	,	543037	}	,
				{	541960	,	541961	,	541962	,	0	,	541963	,	541964	,	543038	,	543039	}	,
				{	541965	,	541966	,	541967	,	541968	,	0	,	541969	,	0	,	0	}	,
				{	541970	,	541971	,	541972	,	541973	,	541974	,	0	,	0	,	0	}	,	
				{	543100	,	543101	,	543102	,	543103	,	0	,	0	,	0	,	543104	}	,
				{	543105	,	543106	,	543107	,	543108	,	0	,	0	,	543109	,	0	}
			}
	--我很擔心自己的前途，我將可以學到什麼技能？
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_12") , "Discowood_Vocation_Talk_ShowSkill", 0 ) 
	--我想知道取得技能學習證書的方法。
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_10") , "Discowood_Vocation_Talk_HigherSkill", 0 ) 
	--我要學習新的技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_3") , "Discowood_Vocation_Show_GetSkill", 0 ) 
	if type(SubVoc)~="number" or (SubVoc<=0 or SubVoc>=9) then
		return;
	end
	if	not	CheckFlag(OwnerID(),KeyItem[Voc][SubVoc])		then
		--換取25級技能
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_1_25") , "DW_Vocation_license_25", 0 )  
	end
end

function Discowood_Vocation_Talk_2()--蒙其德‧貝曼
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race >1	then
		SetSpeakDetail(Obj,"[SC_120515_A]");
		return;
	end
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	LoadQuestOption(OwnerID())
	--我很擔心自己的前途，我將可以學到什麼技能？
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_12") , "Discowood_Vocation_Talk_ShowSkill", 0 ) 
	--我想知道取得技能學習證書的方法。
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_10") , "Discowood_Vocation_Talk_HigherSkill", 0 ) 
	--我要學習新的技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_3") , "Discowood_Vocation_Show_GetSkill", 0 ) 
	if type(SubVoc)~="number" or (SubVoc<=0 or SubVoc>=9) then
		return;
	end
	--換取30級技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_1_30") , "DW_Vocation_license_30", 0 )  
end

function Discowood_Vocation_Talk_3()--希絲莉娜‧喬巴特
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race >1	then
		SetSpeakDetail(Obj,"[SC_120515_A]");
		return;
	end
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	LoadQuestOption(OwnerID())
	local KeyItem = {
				{	0 	,	542006	,	542007	,	542008	,	542009	,	542010	,	543048	,	543049	}	,
				{	542011	,	0	,	542012	,	542013	,	542014	,	542015	,	543050	,	543051	}	,
				{	542016	,	542017	,	0	,	542018	,	542019	,	542020	,	543052	,	543053	}	,
				{	542021	,	542022	,	542023	,	0	,	542024	,	542025	,	543054	,	543055	}	,
				{	542026	,	542027	,	542028	,	542029	,	0	,	542030	,	0	,	0	}	,
				{	542031	,	542032	,	542033	,	542034	,	542035	,	0	,	0	,	0	}	,	
				{	543120	,	543121	,	543122	,	543123	,	0	,	0	,	0	,	543124	}	,
				{	543125	,	543126	,	543127	,	543128	,	0	,	0	,	543129	,	0	}
			}
	--我很擔心自己的前途，我將可以學到什麼技能？
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_12") , "Discowood_Vocation_Talk_ShowSkill", 0 ) 
	--我想知道取得技能學習證書的方法。
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_10") , "Discowood_Vocation_Talk_HigherSkill", 0 ) 
	--我要學習新的技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_3") , "Discowood_Vocation_Show_GetSkill", 0 ) 
	if type(SubVoc)~="number" or (SubVoc<=0 or SubVoc>=9) then
		return;
	end
	if	not	CheckFlag(OwnerID(),KeyItem[Voc][SubVoc])		then
		--換取35級技能
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_1_35") , "DW_Vocation_license_35", 0 )  
	end
end

function Discowood_Vocation_Talk_4()--貝林‧普斯頓
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race >1	then
		SetSpeakDetail(Obj,"[SC_120515_A]");
		return;
	end
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	LoadQuestOption(OwnerID())
	--我很擔心自己的前途，我將可以學到什麼技能？
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_12") , "Discowood_Vocation_Talk_ShowSkill", 0 ) 
	--我想知道取得技能學習證書的方法。
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_10") , "Discowood_Vocation_Talk_HigherSkill", 0 ) 
	--我要學習新的技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_3") , "Discowood_Vocation_Show_GetSkill", 0 ) 
	if type(SubVoc)~="number" or (SubVoc<=0 or SubVoc>=9) then
		return;
	end
	--換取40級技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_1_40") , "DW_Vocation_license_40", 0 )  
	--換取45級技能
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_1_45") , "DW_Vocation_license_45", 0 )  
end

function DW_Vocation_license_15()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_15")   ) 
	AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_24]" , "Discowood_Vocation_Talk_license_Lv15", 0 ) 
end

function DW_Vocation_license_20()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_20")   ) 
	AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_24]" , "Discowood_Vocation_Talk_license_Lv20", 0 ) 
end

function DW_Vocation_license_25()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_25")   ) 
	AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_24]" , "Discowood_Vocation_Talk_license_Lv25", 0 ) 
end

function DW_Vocation_license_30()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_30")   ) 
	AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_24]" , "Discowood_Vocation_Talk_license_Lv30", 0 ) 
end

function DW_Vocation_license_35()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_35")   ) 
	AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_24]" , "Discowood_Vocation_Talk_license_Lv35", 0 ) 
end

function DW_Vocation_license_40()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_40")   ) 
	AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_24]" , "Discowood_Vocation_Talk_license_Lv40", 0 ) 
end

function DW_Vocation_license_45()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_45")   ) 
	AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_24]" , "Discowood_Vocation_Talk_license_Lv45", 0 ) 
end

function Discowood_Vocation_Talk_ShowSkill()

	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )

	SetSpeakDetail ( OwnerID() , "[SC_111454_15]" )
	if SubVoc  ~= -1 then
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_15]" , "Discowood_Vocation_Talk_ShowSkill_15", 0 )  
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_20]" , "Discowood_Vocation_Talk_ShowSkill_20", 0 )  
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_25]" , "Discowood_Vocation_Talk_ShowSkill_25", 0 )  
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_30]" , "Discowood_Vocation_Talk_ShowSkill_30", 0 )  
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_35]" , "Discowood_Vocation_Talk_ShowSkill_35", 0 )  
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_40]" , "Discowood_Vocation_Talk_ShowSkill_40", 0 )  
--		if	Voc ~= 7 and Voc ~= 8 and SubVoc ~= 7 and SubVoc ~= 8	then
			AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_45]" , "Discowood_Vocation_Talk_ShowSkill_45", 0 )  
			AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_50]" , "Discowood_Vocation_Talk_ShowSkill_50", 0 )  
--		end
	else
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_16]" , "Discowood_Vocation_Talk_ShowSkill_1", 0 )  
	end

end

function Discowood_Vocation_Talk_ShowSkill_1()
	SetSpeakDetail ( OwnerID() , "[SC_111454_17]" )
end

function Discowood_Vocation_Talk_ShowSkill_15()
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local String = "SC_SKILL_"..Voc..SubVoc.."15"
	SetSpeakDetail ( OwnerID() , "["..String.."]"  )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110150_2]" , "Discowood_Vocation_Talk_ShowSkill" , 0 )
end
function Discowood_Vocation_Talk_ShowSkill_20()
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local String = "SC_SKILL_"..Voc..SubVoc.."20"
	SetSpeakDetail ( OwnerID() , "["..String.."]"  )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110150_2]" , "Discowood_Vocation_Talk_ShowSkill", 0 )
end
function Discowood_Vocation_Talk_ShowSkill_25()
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local String = "SC_SKILL_"..Voc..SubVoc.."25"
	SetSpeakDetail ( OwnerID() , "["..String.."]"  )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110150_2]" , "Discowood_Vocation_Talk_ShowSkill" , 0)
end
function Discowood_Vocation_Talk_ShowSkill_30()
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local String = "SC_SKILL_"..Voc..SubVoc.."30"
	SetSpeakDetail ( OwnerID() , "["..String.."]"  )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110150_2]" , "Discowood_Vocation_Talk_ShowSkill" , 0)
end
function Discowood_Vocation_Talk_ShowSkill_35()
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local String = "SC_SKILL_"..Voc..SubVoc.."35"
	SetSpeakDetail ( OwnerID() , "["..String.."]"  )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110150_2]" , "Discowood_Vocation_Talk_ShowSkill" , 0)
end
function Discowood_Vocation_Talk_ShowSkill_40()
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local String = "SC_SKILL_"..Voc..SubVoc.."40"
	SetSpeakDetail ( OwnerID() , "["..String.."]"  )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110150_2]" , "Discowood_Vocation_Talk_ShowSkill", 0 )
end
function Discowood_Vocation_Talk_ShowSkill_45()
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local String = "SC_SKILL_"..Voc..SubVoc.."45"
	SetSpeakDetail ( OwnerID() , "["..String.."]"  )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110150_2]" , "Discowood_Vocation_Talk_ShowSkill" , 0)
end
function Discowood_Vocation_Talk_ShowSkill_50()
	SetSpeakDetail ( OwnerID() , "[SC_111454_25]")
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110150_2]" , "Discowood_Vocation_Talk_ShowSkill" , 0)
end

function Discowood_Vocation_Talk_HigherSkill()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111454_8")   )  --學到更高級的技能的地方
end


function Discowood_Vocation_Talk_GetSkill()
	local Top = ReadRoleValue(TargetID() , EM_RoleValue_LV)
	if Top > 45 then
		Top = 45
	end
	local How,b = Discowood_Vocation_Check_GetSkill(Top)
	if How == 1 then
		SetSpeakDetail ( OwnerID(), "[SC_111454_22]"   ) --你的等級還不足以學習新的技能
		return
	end

	if How == 2 then
--		local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
--		local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
--		local VocLv = b
--		local String = "SC_SKILL_"..Voc..SubVoc..VocLv
		CastSpell(OwnerID() , OwnerID() , 491010 )
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_111454_9]" , 0 ) 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_111454_9]" , 0 ) 
		CloseSpeak( OwnerID())
--		SetSpeakDetail ( OwnerID(),  GetString(String) )
		return
	end

	if How == 3 then
		SetSpeakDetail(OwnerID() , GetString("SC_111454_7") ) --在你現在的職業上我已經沒什麼可以教你的了，相信你未來可以創造出更多令人驚訝的事蹟吧！
		return
	end

	local String = "SC_111454_11_"..How
	if How ~= nil then
		SetSpeakDetail ( OwnerID(), GetString(String)  ) 
	else
		CloseSpeak(OwnerID())
	end
end