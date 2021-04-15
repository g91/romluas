function LuaS_113029()
	local Obj = OwnerID()
	local Main_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC)
	local Sub_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC_SUB)

	LoadQuestOption( OwnerID() )
	if 	DW_EliteSkill_CheckProgress(Main_Voc,Sub_Voc)>50	then	
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_2]" , "LuaS_113029_2", 0 ) -- 我想知道大師工匠令狀如何取得？
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_3]" , "LuaS_113029_3", 0 ) -- 我想知道武器核心如何取得？
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_4]" , "LuaS_113029_4", 0 ) -- 我想知道武器碎片如何取得？
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_5]" , "LuaS_113029_5", 0 ) -- 我想知道詭秘套牌如何取得？
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_10]" , "LuaS_113029_6", 0 ) -- 請再給我一張說明捲軸
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029]" , "LuaS_113029_1", 0 ) -- 我也能夠擁有這樣的武器嗎？
	end
end

function LuaS_113029_1()--解釋武器的前置條件

	SetSpeakDetail(OwnerID(),"[SC_113029_1]")
end

function LuaS_113029_2()--說明取得工匠令狀的方式

	SetSpeakDetail(OwnerID(),"[SC_113029_6]")
end

function LuaS_113029_3()--說明取得武器核心的方式

	SetSpeakDetail(OwnerID(),"[SC_113029_7]")
end

function LuaS_113029_4()--說明取得武器材質碎片的方式

	SetSpeakDetail(OwnerID(),"[SC_113029_8]")
end

function LuaS_113029_5()--說明取得詭異套牌的方式

	SetSpeakDetail(OwnerID(),"[SC_113029_9]")
end

function LuaS_113029_6()--再次領取說明捲軸

	GiveBodyItem( OwnerID(), 205066, 1 )
	CloseSpeak( OwnerID() )
end
