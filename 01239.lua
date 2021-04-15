


function Lua_DW_CBUI(QuestID)--CBUI = Check Before Use Item 
	local QuestMob = {}
	QuestMob[1] = {"Q421966",0.6	,100268}
	QuestMob[2] = {"Q421968",0.6	,100267}
	QuestMob[3] = {"Q421981",0.8	,100863}
	QuestMob[4] = {"Q421970",0.6	,100231 , 100232 , 100641 }
	QuestMob[5] = {"Q421971",0.6	,100231}
	QuestMob[6] = {"Q421972",0.6	,100232}
	QuestMob[7] = {"Q421973",0.6	,100641}
	QuestMob[8] = {"Q421987",1	,100739,100742,100841,100842,100843,100844,100845,100846}

	local Timing = ReadRoleValue(TargetID() , EM_RoleValue_HP)/ReadRoleValue(TargetID() , EM_RoleValue_MaxHP)

	local QuestStr = "Q"..QuestID
	for i=1 , table.getn(QuestMob) do
		if	QuestMob[i][1] == QuestStr		then
			for j=3 , table.getn(QuestMob[i]) do
				if	ReadRoleValue( TargetID() , EM_RoleValue_PID) ~= 0	then
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_421101_0]", 0 ) 
					return false
				end
				if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID) == QuestMob[i][j]	then
					if	Timing < QuestMob[i][2]		then
						WriteRoleValue(TargetID() , EM_RoleValue_PID , QuestID)
						return true
					else
						ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_101614_2]", 0 ) 
						return false
					end
				end
			end
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_421101_0]", 0 ) 
			return false
		end
	end
	ScriptMessage( OwnerID(), OwnerID(), 2, "Data Error !!", 0 ) 
	return false
end


function Lua_DW_UIGI()--UIGI = Use Item Get Item
	local QuestID = ReadRoleValue(TargetID() , EM_RoleValue_PID )
	local QuestMob = {}
	QuestMob[1] = {"Q421966" , 204023}
	QuestMob[2] = {"Q421968" , 204024}
	QuestMob[3] = {"Q421981" , 204030}
	QuestMob[4] = {"Q421971" , 204039}
	QuestMob[5] = {"Q421972" , 204040}
	QuestMob[6] = {"Q421973" , 204041}
	QuestMob[7] = {"Q421987" , 542417}

	local QuestStr = "Q"..QuestID
	for i=1 , table.getn(QuestMob) do
		if	QuestMob[i][1] == QuestStr		then
			for j=2 , table.getn(QuestMob[i]) do
				GiveBodyItem(OwnerID() , QuestMob[i][j] , 1)
			end
			return true
		end
	end
	return false
end