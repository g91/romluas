function Lua_CheckLVtoQuest()
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  )  --取得玩家等級
	if PlayerLV > 5 then
		SetSpeakDetail( OwnerID(),"[SC_SF_FROGOUT]" ); 
	else
		LoadQuestOption( OwnerID() );  --載入任務模板
	end
end
function Lua_FrogdeadScript()
	SetPlot(OwnerID(),"dead","Lua_SummberFrogdead",0)
end 
function Lua_SummberFrogdead()
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID)
	local MonsterID = {102283,102284,102285,102286,102291,102287,102288,102289,102290,102292}
	if CheckAcceptQuest(TargetID(),422471) == true then
		for i = 1 , 5 do
			if OrgID == MonsterID[i] then
				GiveBodyItem(TargetID(),205082,1)
			end
		end
		for i = 6 , 10 do
			if OrgID == MonsterID[i] then
				GiveBodyItem(TargetID(),205082,6)
			end
		end
	end
end
