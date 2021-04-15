function LuaS_113029()
	local Obj = OwnerID()
	local Main_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC)
	local Sub_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC_SUB)

	LoadQuestOption( OwnerID() )
	if 	DW_EliteSkill_CheckProgress(Main_Voc,Sub_Voc)>50	then	
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_2]" , "LuaS_113029_2", 0 ) -- �ڷQ���D�j�v�u�K�O���p����o�H
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_3]" , "LuaS_113029_3", 0 ) -- �ڷQ���D�Z���֤ߦp����o�H
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_4]" , "LuaS_113029_4", 0 ) -- �ڷQ���D�Z���H���p����o�H
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_5]" , "LuaS_113029_5", 0 ) -- �ڷQ���D�ޯ��M�P�p����o�H
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029_10]" , "LuaS_113029_6", 0 ) -- �ЦA���ڤ@�i�������b
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113029]" , "LuaS_113029_1", 0 ) -- �ڤ]����֦��o�˪��Z���ܡH
	end
end

function LuaS_113029_1()--�����Z�����e�m����

	SetSpeakDetail(OwnerID(),"[SC_113029_1]")
end

function LuaS_113029_2()--�������o�u�K�O�����覡

	SetSpeakDetail(OwnerID(),"[SC_113029_6]")
end

function LuaS_113029_3()--�������o�Z���֤ߪ��覡

	SetSpeakDetail(OwnerID(),"[SC_113029_7]")
end

function LuaS_113029_4()--�������o�Z������H�����覡

	SetSpeakDetail(OwnerID(),"[SC_113029_8]")
end

function LuaS_113029_5()--�������o�޲��M�P���覡

	SetSpeakDetail(OwnerID(),"[SC_113029_9]")
end

function LuaS_113029_6()--�A������������b

	GiveBodyItem( OwnerID(), 205066, 1 )
	CloseSpeak( OwnerID() )
end
