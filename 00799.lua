function LuaS_421357_0()
	if CheckAcceptQuest(OwnerID() , 421357) then
		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_421357_1") , "LuaS_421357_1", 0 ) --���a�ﶵ�G�аݧA��ť���L....
	else
		LoadQuestOption(OwnerID())
	end
end


function LuaS_421357_1()
	SetFlag(OwnerID(),541794,1)
	SetSpeakDetail ( OwnerID(), GetString ( "SC_421357_0" )   )
end