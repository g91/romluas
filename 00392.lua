function LuaS_110500_0()

	LoadQuestOption(OwnerID())	
--	if CheckAcceptQuest(OwnerID() , 420070 ) then
--		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110500_1"), "LuaS_110500_1",0 );		--�����L�ƪ��дo
--	end
end

-----------------------------------------------------------------------------------------------------------

function LuaS_110500_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110500_1") ); --
end

-----------------------------------------------------------------------------------------------------------
