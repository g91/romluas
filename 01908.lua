--關係等級測試用指令

--師徒
--EM_RelationType_Student	--學生
--EM_RelationType_Teacher	--老師

--夫妻
--EM_RelationType_Wife	--妻子
--EM_RelationType_Husband	--先生

--EM_RelationType_Lover	--情人

--EM_RelationType_Family	--兄弟(家人)

--EM_RelationType_BestFriend	--摯友(朋友)


--夫妻

function lua_mika_partytest1()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	Say( Couple1, "Party")
	Say( Couple1, "1")
	Say( Couple2, "2")
end

function lua_mika_partytest2()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	Say( Couple1, "Party")
	local P1_DBID = ReadRoleValue(Couple1, EM_RoleValue_DBID ) --自己的DBID
	local P2_DBID = ReadRoleValue(Couple2, EM_RoleValue_DBID ) --對方的DBID
	Say(OwnerID(), P1_DBID)
	Say(OwnerID(), P2_DBID)
end

function lua_mika_relation_lvtest0()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 0 , EM_RelationType_Wife , 0 ) 
end

function lua_mika_relation_lvtest1()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 1 , EM_RelationType_Wife , 1 ) 
end

function lua_mika_relation_lvtest2()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 2 , EM_RelationType_Wife , 2 ) 
end

function lua_mika_relation_lvtest3()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 3 , EM_RelationType_Wife , 3) 
end

function lua_mika_relation_lvtest4()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 4 , EM_RelationType_Wife , 4 ) 
end

function lua_mika_relation_lvtest5()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 5 , EM_RelationType_Wife , 5) 
end

function lua_mika_relation_lvtest6()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 6 , EM_RelationType_Wife , 6 )  
end

function lua_mika_relation_lvtest7()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 7 , EM_RelationType_Wife , 7) 
end

function lua_mika_relation_lvtest8()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 8 , EM_RelationType_Wife , 8 ) 
end

function lua_mika_relation_lvtest9()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 9 , EM_RelationType_Wife , 9 ) 
end

function lua_mika_relation_lvtest10()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1, Couple2 , EM_RelationType_Husband , 10 , EM_RelationType_Wife , 10 ) 
end


--師徒
--EM_RelationType_Student	--學生
--EM_RelationType_Teacher	--老師

function lua_mika_relation_2_lv0()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 0 , EM_RelationType_Student , 0 ) 
end

function lua_mika_relation_2_lv1()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 1 , EM_RelationType_Student , 1 ) 
end

function lua_mika_relation_2_lv2()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 2 , EM_RelationType_Student , 2 ) 
end

function lua_mika_relation_2_lv3()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 3 , EM_RelationType_Student , 3 ) 
end

function lua_mika_relation_2_lv4()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 4 , EM_RelationType_Student , 4 ) 
end

function lua_mika_relation_2_lv5()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 5 , EM_RelationType_Student , 5 ) 
end

function lua_mika_relation_2_lv6()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 6 , EM_RelationType_Student , 6 ) 
end

function lua_mika_relation_2_lv7()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 7 , EM_RelationType_Student , 7 ) 
end

function lua_mika_relation_2_lv8()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 8 , EM_RelationType_Student , 8 ) 
end

function lua_mika_relation_2_lv9()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 9 , EM_RelationType_Student , 9 ) 
end

function lua_mika_relation_2_lv10()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Teacher , 10 , EM_RelationType_Student , 10 ) 
end


--EM_RelationType_Lover	--情人
function lua_mika_relation_3_lv0()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 0 , EM_RelationType_Lover , 0 ) 
end

function lua_mika_relation_3_lv1()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 1 , EM_RelationType_Lover , 1 ) 
end

function lua_mika_relation_3_lv2()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 2 , EM_RelationType_Lover , 2 ) 
end

function lua_mika_relation_3_lv3()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 3 , EM_RelationType_Lover , 3 ) 
end

function lua_mika_relation_3_lv4()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 4 , EM_RelationType_Lover , 4 ) 
end

function lua_mika_relation_3_lv5()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 5 , EM_RelationType_Lover , 5 ) 
end

function lua_mika_relation_3_lv6()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 6 , EM_RelationType_Lover , 6 ) 
end

function lua_mika_relation_3_lv7()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 7 , EM_RelationType_Lover , 7 ) 
end

function lua_mika_relation_3_lv8()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 8 , EM_RelationType_Lover , 8 ) 
end

function lua_mika_relation_3_lv9()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 9 , EM_RelationType_Lover , 9 ) 
end

function lua_mika_relation_3_lv10()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Lover , 10 , EM_RelationType_Lover , 10 ) 
end


--EM_RelationType_Family	--兄弟(家人)
function lua_mika_relation_4_lv0()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 0 , EM_RelationType_Family , 0 ) 
end

function lua_mika_relation_4_lv1()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 1 , EM_RelationType_Family , 1 ) 
end

function lua_mika_relation_4_lv2()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 2 , EM_RelationType_Family , 2 ) 
end

function lua_mika_relation_4_lv3()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 3 , EM_RelationType_Family , 3 ) 
end

function lua_mika_relation_4_lv4()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 4 , EM_RelationType_Family , 4 ) 
end

function lua_mika_relation_4_lv5()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 5 , EM_RelationType_Family , 5 ) 
end

function lua_mika_relation_4_lv6()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 6 , EM_RelationType_Family , 6 ) 
end

function lua_mika_relation_4_lv7()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 7 , EM_RelationType_Family , 7 ) 
end

function lua_mika_relation_4_lv8()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 8 , EM_RelationType_Family , 8 ) 
end

function lua_mika_relation_4_lv9()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 9 , EM_RelationType_Family , 9 ) 
end

function lua_mika_relation_4_lv10()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_Family , 10 , EM_RelationType_Family , 10 ) 
end


--EM_RelationType_BestFriend	--摯友(朋友)
function lua_mika_relation_5_lv0()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 0 , EM_RelationType_BestFriend , 0 ) 
end

function lua_mika_relation_5_lv1()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 1 , EM_RelationType_BestFriend , 1 ) 
end

function lua_mika_relation_5_lv2()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 2 , EM_RelationType_BestFriend , 2 ) 
end

function lua_mika_relation_5_lv3()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 3 , EM_RelationType_BestFriend , 3 ) 
end

function lua_mika_relation_5_lv4()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 4 , EM_RelationType_BestFriend , 4 ) 
end

function lua_mika_relation_5_lv5()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 5 , EM_RelationType_BestFriend , 5 ) 
end

function lua_mika_relation_5_lv6()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 6 , EM_RelationType_BestFriend , 6 ) 
end

function lua_mika_relation_5_lv7()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 7 , EM_RelationType_BestFriend , 7 ) 
end

function lua_mika_relation_5_lv8()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 8 , EM_RelationType_BestFriend , 8 ) 
end

function lua_mika_relation_5_lv9()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 9 , EM_RelationType_BestFriend , 9 ) 
end

function lua_mika_relation_5_lv10()
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	SetRelation( Couple1 , Couple2 , EM_RelationType_BestFriend , 10 , EM_RelationType_BestFriend , 10 ) 
end