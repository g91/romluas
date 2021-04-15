

function LuaS_120515_0()
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race ~=2	then
		SetSpeakDetail(Obj,"[SC_120515_B]");
		return;
	end
	LoadQuestOption(Obj)
	AddSpeakOption ( Obj, TargetID( ), "[SC_111454_12]" , "LuaS_120515_2", 0 )  --我很擔心自己的前途，我將可以學到什麼技能？
	AddSpeakOption(Obj,Obj,"[SC_111454_3]","LuaS_120515_1", 0 )--我要學習新的技能
end

function LuaS_120515_1()
	local Obj = OwnerID()
	local Lv = ReadRoleValue(Obj,EM_RoleValue_Lv)
	local Main_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC)
	local Sub_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC_SUB)
	if	Sub_Voc ==-1	then
		SetSpeakDetail( Obj,"[SC_111454_17]")--喔！天啊！我竟然沒注意到你沒有副職！
		return
	end
	If	Main_Voc==10  or  Sub_Voc==10	then
		if	CheckFlag(Obj,546211)==false	then
			SetSpeakDetail( Obj,"[SC_498562_A]");--沒學會盾衛
			return;
		end
	end
	local CheckResult = DW_EliteSkill_CheckProgress(Main_Voc,Sub_Voc)  -- 未有重要物品(等級)
	local CheckLevel = DW_EliteSkill_CheckLv(Main_Voc,Sub_Voc) --未滿人物等級
	if	CheckResult > 50	then--全部學會 不用學
		SetSpeakDetail( Obj,"[SC_111454_7]")--在你現在的職業上我已經沒什麼可以教你的了，相信你未來可以創造出更多令人驚訝的事蹟吧！
		return
	end

	if	CheckLevel<=CheckResult	then --等級不足 不能學
		SetSpeakDetail( Obj,"[SC_111454_22]")--想學到這個技能的話，你還得努力提升自己的主副職到更高的一個層級才行。
		return
	end

	local BookCondition = DW_EliteSkill_ItemNum(CheckResult) --需要證書編號
	if	CountBodyItem(Obj,BookCondition)==0	then --沒有證書 不能學
		SetSpeakDetail( Obj,"[SC_111454_26]")
		return
	end

	if	CheckResult == 50	then --50級菁英技能的提醒
		if	DW_EliteSkill_CheckProgress(Sub_Voc,Main_Voc)~=50	then--另一邊也要滿 否則不能學
			SetSpeakDetail( Obj,"[SC_111454_27]")--需要將副職的境界也提升到相同的水準才行。
			return
		else
			DW_EliteSkill_Get(CheckResult,"GiveSub50Skill")--取得另一邊的菁英技能
		end
	end
--學習
	CloseSpeak(Obj)
	DW_EliteSkill_Get(CheckResult)--取得菁英技能
	CastSpell(Obj,Obj,491010 )
	ScriptMessage( Obj, Obj, 2, "[SC_111454_9]", 0 )--恭喜你！你學到新的技能！
	ScriptMessage( Obj, Obj, 0, "[SC_111454_9]", 0 )
	return
end

function LuaS_120515_2()
	local Obj = OwnerID()
	local Voc = ReadRoleValue (Obj , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(Obj , EM_RoleValue_VOC_SUB )
	if SubVoc  ~= -1 then
		SetSpeakDetail ( Obj , "[SC_111454_15]" )
		for i=3,10,1 do
			local Temp = i*5
			AddSpeakOption(Obj,Obj,"[SC_111454_13_"..Temp.."]","LuaS_120515_4("..Temp..")", 0 )
		end
	else
		SetSpeakDetail ( Obj , "[SC_111454_17]" )
	end
end

function LuaS_120515_4(Lv)
	local Obj = OwnerID()
	local Voc = ReadRoleValue (Obj , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(Obj , EM_RoleValue_VOC_SUB )
	local Level = Lv
	local String
	if	Level==50	then
		if	Voc > SubVoc	then
			String = "SC_SKILL_"..Voc..SubVoc..Level
		else
			String = "SC_SKILL_"..SubVoc..Voc..Level
		end
	else
		String = "SC_SKILL_"..Voc..SubVoc..Level
	end
	SetSpeakDetail ( Obj , "["..String.."]"  )
	AddSpeakOption( Obj , TargetID() , "[SO_110150_2]" , "LuaS_120515_2" , 0 )
end