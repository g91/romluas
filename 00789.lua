function Say_Relation()
	-- 關係讀取函式
	-- int GetRelation( int OwnerID , int TargetID )
	-- float GetRelationLv( int OwnerID , int TargetID  )

	-- Pos 關係欄位，總共有20格(0~19)
	-- int GetRelation_DBID( int OwnerID , int Pos )
	-- const char* GetRelation_Name( int OwnerID , int Pos )

	-- float GetRelation_Lv( int OwnerID , int Pos )
	-- int GetRelation_Relation( int OwnerID , int Pos )
	
	-- bool SetRelation( int OwnerID , int TargetID , int Relation1 , float Lv1 , int Relation2 , float Lv2 )

	-- bool SetRelationLv( int OwnerID , int TargetID , float Lv )

	-- bool SetRelation_Lv( int OwnerID , int Pos , float Lv )
	-- bool SetRelation_Relation( int OwnerID , int Pos , int Relation )

	-- 傳送用
	-- bool CallPlayer_DBID( int OwnerID , int TargetDBID )
	-- bool GotoPlayer_DBID( int OwnerID , int TargetDBID )
	-- int GetZoneID( int PlayerDBID )

	-- EM_RelationType_Stranger		= Value; Value = Value + 1;	--莫生人(不可使用 )(0)
	-- EM_RelationType_Friend		= Value; Value = Value + 1;	--好友( 不可使用 )(1)
	-- EM_RelationType_Enemy		= Value; Value = Value + 1;	--仇人( 不可使用 )(2)
	-- EM_RelationType_Student		= Value; Value = Value + 1;	--學生(3)
	-- EM_RelationType_Teacher		= Value; Value = Value + 1;	--老師(4)
	-- EM_RelationType_Wife		= Value; Value = Value + 1;	--妻子(5)
	-- EM_RelationType_Husband	= Value; Value = Value + 1;	--先生(6)
	-- EM_RelationType_Lover		= Value; Value = Value + 1;	--情人(7)
	-- EM_RelationType_Brother		= Value; Value = Value + 1;	--兄弟(8)
	-- EM_RelationType_Sister		= Value; Value = Value + 1;	--姐妹(9)
	-- EM_RelationType_BestFriend	= Value; Value = Value + 1;	--摯友(10)
	-- EM_RelationType_BadCompany	= Value; Value = Value + 1;	--損友(11)

	--local PartyNum = GetPartyID( OwnerID() , -1 )

	--local Couple1 = GetPartyID( OwnerID() , 1 )
	--local Couple2 = GetPartyID( OwnerID() , 2 )

	--if SetRelation( Couple1 , Couple2 , EM_RelationType_Wife , 0 , EM_RelationType_Husband , 0 ) then
	--if SetRelation( Couple1 , Couple2 , EM_RelationType_Husband , 0 , EM_RelationType_Wife , 0 ) then
	--	Say( OwnerID() , "Relation" )
	--else
	--	Say( OwnerID() , "Nothing" )
	--end

	local Player = OwnerID()

	--if Check_Relation( Player , EM_RelationType_Wife ) then
	--	Say( Player , GetRelation_Name( Player , Get_RelationPos( Player , EM_RelationType_Husband ) ) )
	--else
	--	Say( Player , "Wrong")
	--end
	
	SetRelation_Relation( Player , 0 , EM_RelationType_Husband )

end

function Check_RelationXX( Player , Relation )
	if Relation ~= EM_RelationType_Stranger and
	   Relation ~= EM_RelationType_Friend and
	   Relation ~= EM_RelationType_Enemy and
	   Relation ~= EM_RelationType_Student and
	   Relation ~= EM_RelationType_Teacher and
	   Relation ~= EM_RelationType_Wife and
	   Relation ~= EM_RelationType_Husband and
	   Relation ~= EM_RelationType_Lover and
	   Relation ~= EM_RelationType_Brother and
	   Relation ~= EM_RelationType_Sister and
	   Relation ~= EM_RelationType_BestFriend and
	   Relation ~= EM_RelationType_BadCompany then
		ScriptMessage( Player , Player , 1 , "Relation is Wrong !!!" , 0 )
		return false
	end

	local RelationName
	if Relation == EM_RelationType_Stranger then
		RelationName = "Stranger"
	elseif Relation == EM_RelationType_Friend then
		RelationName = "Friend"
	elseif Relation == EM_RelationType_Enemy then
		RelationName = "Enemy"
	elseif Relation == EM_RelationType_Student then
		RelationName = "Student"
	elseif Relation == EM_RelationType_Teacher then
		RelationName = "Teacher"
	elseif Relation == EM_RelationType_Wife then
		RelationName = "Wife"
	elseif Relation == EM_RelationType_Husband then
		RelationName = "Husband"
	elseif Relation == EM_RelationType_Lover then
		RelationName = "Lover"
	elseif Relation == EM_RelationType_Brother then
		RelationName = "Brother"
	elseif Relation == EM_RelationType_Sister then
		RelationName = "Sister"
	elseif Relation == EM_RelationType_BestFriend then
		RelationName = "BestFriend"
	elseif Relation == EM_RelationType_BadCompany then
		RelationName = "BadCompany"
	end

	local RelationTable = Scan_Relation( Player )
	if RelationTable[Relation] == RelationName then
		return true
	else
		return false
	end

end

function Scan_Relation( Player )

	local RelationPosTotal = 20
	local RelationArray = {}
	local RelationTable = {}
	
	for i = 0 , RelationPosTotal - 1 do
		local Relation = 0
		Relation = GetRelation_Relation( Player , i )
		Say( Player , "i="..i.." R="..Relation )
		if Relation ~= 0 then
			table.insert( RelationArray , Relation )
		end
	end
	Say( Player , "========================" )
	for i = 0 , RelationPosTotal-1 do
		if RelationArray[i] ~= nil then
			local Relation = GetRelation_Relation( Player , RelationArray[i] )
			Say( Player , "i="..i.." R="..Relation )
			if Relation  == 3 then
				table.insert( RelationTable , Relation  , "Student" )
			elseif Relation == 4 then
				table.insert( RelationTable , Relation  , "Teacher" )
			elseif Relation == 5 then
				table.insert( RelationTable , Relation  , "Wife" )
			elseif Relation == 6 then
				table.insert( RelationTable , Relation  , "Husband" )
			elseif Relation == 7 then
				table.insert( RelationTable , Relation  , "Lover" )
			elseif Relation == 8 then
				table.insert( RelationTable , Relation  , "Brother" )
			elseif Relation == 9 then
				table.insert( RelationTable , Relation  , "Sister" )
			elseif Relation == 10 then
				table.insert( RelationTable , Relation  , "BestFriend" )
			elseif Relation == 11 then
				table.insert( RelationTable , Relation  , "BadCompany" )
			end
		end
	end
	
	for i = 1 , table.getn(RelationTable) do
		if RelationTable[i] ~= nil then
			Say( Player , RelationTable[i] )
		end
	end

	return RelationTable

end
