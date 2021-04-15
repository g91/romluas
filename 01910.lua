--測試用指令

function lua_mika_merrycheck()  --測試雙方有沒有結過婚
	local PartyNum = GetPartyID( TargetID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --1P是老公
	local IamW = Check_Relation( Couple1, EM_RelationType_Wife )  --1P是老婆
	local UareH = Check_Relation( Couple2 , EM_RelationType_Husband )  --2P是老公
	local UareW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --2P是老婆

	Say(Couple1, "p1")
	Say(Couple2, "p2")
	if IamH == true then
		Say(Couple1, "P1 is husband.")
	else
		Say(Couple1, "P1 is not husband.")
	end
	if IamW  == true then 
		Say(Couple1, "P1 is  wife.")
	else
		Say(Couple1, "P1 is not wife.")
	end
	if UareH  == true then
		Say(Couple2, "P2 is husband.")
	else
		Say(Couple2, "P2 is not husband.")
	end
	if UareW  == true then
		Say(Couple2, "P2 is wife.")
	else
		Say(Couple2, "P2 is not wife.")
	end
end

function lua_mika_partytest()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	Say(OwnerID() , PartyNum)
end

---加EXP趴數測試
function lua_mika_relation_test34() -- +10%
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	local getlv = GetRelationLv(Couple1, Couple2)
	newexp = getlv + 0.1 
	SetRelation( Couple1 , Couple2 , EM_RelationType_Husband , newexp , EM_RelationType_Wife , newexp ) 
end

function lua_mika_relation_test35() -- +1%
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	local getlv = GetRelationLv(Couple1, Couple2)  --取關係點數
	newexp = getlv + 0.01 
	SetRelation( Couple1 , Couple2 , EM_RelationType_Husband , newexp , EM_RelationType_Wife , newexp )  --設關係等級
end


function lua_mika_relation_onlinetest()
	local Player = OwnerID()	
	local Couple1 = GetPartyID( Player , 1 )
	local Couple2 = GetPartyID( Player , 2 )
	local P1_DBID = ReadRoleValue(Couple1, EM_RoleValue_DBID ) --1P的DBID
	local P2_DBID = ReadRoleValue(Couple2, EM_RoleValue_DBID ) --2P的DBID
	local P1_online =  CheckOnlinePlayer(P1_DBID )  -- 在不在線上
	local P2_online =  CheckOnlinePlayer(P2_DBID )  -- 在不在線上

	Say(OwnerID(), P1_DBID)
	Say(OwnerID(), P2_DBID)
	if P1_online == TRUE and P2_online == TRUE then
		Say(OwnerID(), "P1 and P2 online ")
	elseif P1_online == TRUE and P2_online == FALSE then
		Say(OwnerID(), "P1 is online, P2 is not online . ")
	elseif P1_online == FALSE and P2_online == TRUE then
		Say(OwnerID(), "P1 is online, P2 is not online . ")
	end
end

function lua_mika_relation_test02()
	local relaitonDBID  = 0
	for i = 0 , 19 do
		relaitonDBID = GetRelation_DBID( OwnerID() , i )
	--	Say( OwnerID() , "relationDBID[" .. i .. "]=" relationDBID );
		Say( OwnerID() , i )
		Say( OwnerID() , relaitonDBID )
	end
end

function lua_mika_relation_test03()
	local POS19_DBID  = GetRelation_DBID( OwnerID() , 19 )
	Say( OwnerID() , POS19_DBID )
end

function lua_mika_relation_check()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	local Relation = GetRelation(Couple1, Couple2)
	local Relation2 = GetRelation(Couple2, Couple1)
	Say(OwnerID(), Relation )
	Say(OwnerID(), Relation2 )
end

