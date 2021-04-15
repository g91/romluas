function ai_blood()
	local SkillID = {}
	local SkillLV = {}
	local counter = 0
	while 1 do
		sleep(10)	--停1秒
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --取當前目標數值		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			--local	playername = SearchRangeNPC ( OwnerID , 500 )	--搜尋周圍玩家
			local g1 = GetPartyID( TargteID(), 1 )
			sleep(20)	--停2秒
			Say (OwnerID(), g1)
		end			
	end		
end