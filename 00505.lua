function LuaS_110592()

	LoadQuestOption( OwnerID() )

	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110592_5", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110592_1", 0 ) 

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

	if CheckFlag( OwnerID()  , 540826 ) == true then
	else
		if ( CountBodyItem( OwnerID() , 201211 ) >= 10 ) then
			SetFlag( OwnerID()  , 540826, 1 )
		end
	end
end

function AlreadyTenCrystal()		-- 完成收集十個符文晶砂
	if CheckFlag( TargetID() , 540826 ) == true then	-- 重要物品：收集到十個符文晶砂
	else
		SetFlag( TargetID() , 540826 , 1 )
	end

	if ( CheckCompleteQuest( TargetID() , 420701 ) == false or CheckCompleteQuest( TargetID() , 420702 ) == false or CheckCompleteQuest( TargetID() , 420703 ) == false or CheckCompleteQuest( TargetID() , 420704 ) == false or CheckCompleteQuest( TargetID() , 420705 ) == false or CheckCompleteQuest( TargetID() , 420706 ) == false or CheckCompleteQuest( TargetID() , 420707 ) == false or CheckCompleteQuest( TargetID() , 420708 ) == false ) then
		local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )	-- 如果不報到，一開始就來解的話
	
		    if ( job == 0 ) then
			-- return "管理者"
		elseif  ( job == 1 ) then
			SetFlag( TargetID() , 540811 , 1 )	-- 新手職業選戰士
		elseif  ( job == 2 ) then
			SetFlag( TargetID() , 540812 , 1 )	-- 新手職業選遊俠
		elseif  ( job == 3 ) then
			SetFlag( TargetID() , 540813 , 1 )	-- 新手職業選盜賊
		elseif  ( job == 4 ) then
			SetFlag( TargetID() , 540814 , 1 )	-- 新手職業選法師
		elseif  ( job == 5 ) then
			SetFlag( TargetID() , 540815 , 1 )	-- 新手職業選祭司
		elseif  ( job == 6 ) then
			SetFlag( TargetID() , 540816 , 1 )	-- 新手職業選騎士
		elseif  ( job == 7 ) then
			SetFlag( TargetID() , 540817 , 1 )	-- 新手職業選言靈使
		elseif  ( job == 8 ) then
			SetFlag( TargetID() , 540818 , 1 )	-- 新手職業選德魯伊
		end
		return true
	end

end

function TransferJobHall()
	local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	    if ( job == 1 ) then
		ChangeZone( TargetID() , 2 , 0 , 5442 , 62, -4254 , 165 )	-- 戰士
	elseif ( job == 2 ) then
		ChangeZone( TargetID() , 2 , 0 , 5565 , 62, -4305 , 60 )	-- 遊俠
	elseif ( job == 3 ) then
		ChangeZone( TargetID() , 2 , 0 , 5488 , 62, -4314 , 105 )	-- 影行者
	elseif ( job == 4 ) then
		ChangeZone( TargetID() , 2 , 0 , 5595 , 62, -4235 , 330 )	-- 法師
	elseif ( job == 5 ) then
		ChangeZone( TargetID() , 2 , 0 , 5473 , 62, -4182 , 235 )	-- 祭司
	elseif ( job == 6 ) then
		ChangeZone( TargetID() , 2 , 0 , 5544 , 62, -4173 , 290 )	-- 騎士
	--elseif ( job == 7 ) then
	--	ChangeZone( TargetID() , 2 , 0 , 5442 , 62, -4254 , 165 )	-- 言靈使
	--elseif ( job == 8 ) then
	--	ChangeZone( TargetID() , 2 , 0 , 5442 , 62, -4254 , 165 )	-- 德魯伊
	else
		Say ( OwnerID , "非合法職業" )
	end
	return true
end

function AllJobMasterTalk()

	if ( CheckFlag( OwnerID() , 540831 ) == true and CheckFlag( OwnerID() , 540832 ) == true and CheckFlag( OwnerID() , 540833 ) == true and CheckFlag( OwnerID() , 540834 ) == true and CheckFlag( OwnerID() , 540835 ) == true and CheckFlag( OwnerID() , 540836 ) == true ) then
		return true
	else
		return false
	end
end

function TalkGiveSelfJob()
	if CheckFlag( TargetID() , 540826 ) == true then	-- 重要物品：開始與其他指導員說話
	else
		SetFlag( TargetID() , 540826 , 1 )
	end

	local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	    if ( job == 1 ) then
		SetFlag( TargetID() , 540831 , 1 )	-- 重要物品：第一次跟戰士說話
	elseif ( job == 2 ) then
		SetFlag( TargetID() , 540832 , 1 )	-- 重要物品：第一次跟遊俠說話
	elseif ( job == 3 ) then
		SetFlag( TargetID() , 540833 , 1 )	-- 重要物品：第一次跟影行者說話
	elseif ( job == 4 ) then
		SetFlag( TargetID() , 540834 , 1 )	-- 重要物品：第一次跟法師說話
	elseif ( job == 5 ) then
		SetFlag( TargetID() , 540835 , 1 )	-- 重要物品：第一次跟祭司說話
	elseif ( job == 6 ) then
		SetFlag( TargetID() , 540836 , 1 )	-- 重要物品：第一次跟騎士說話
	--elseif ( job == 7 ) then
	--	SetFlag( TargetID() , 540837 , 1 )	-- 重要物品：第一次跟言靈使說話
	--elseif ( job == 8 ) then
	--	SetFlag( TargetID() , 540838 , 1 )	-- 重要物品：第一次跟德魯伊說話
	else
		Say ( OwnerID , "非合法職業" )
	end
	return true
end

function StartJobMasterTalk()		-- 開始與其他指導員說話
	if CheckFlag( TargetID() , 540826 ) == true then	-- 重要物品：開始與其他指導員說話
	else
		SetFlag( TargetID() , 540826 , 1 )
	end
end