-- 穝も猌竟
function New_Hand_Weapon( Option )
	local PlayerID = OwnerID()
	local PackageID = 201704		-- 弘▆猌竟
	local WeaponGroup = { 210511 , 210512 , 210513 , 210514 , 210515 , 210516 , 210511 , 210515 , 210514 , 210511}	-- 驹笴獿紇︽猭畍步肕此狶礛﹛艶才ゅ
	local WeaponID = ReadRoleJob_Give( PlayerID , WeaponGroup )

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , WeaponID , 1 )
		GiveBodyItem( PlayerID , 209577 , 1)	--2011/3/14穝糤
	end
end
-- 穝もňㄣ
function New_Hand_Armor( Option )
	local PlayerID = OwnerID()
	local PackageID = 201705		-- 弘▆ňㄣ
	local ArmorGroup = { 221581 , 221582 , 221583 , 221584 , 221585 , 221586 , 221581 , 221585 ,221584 , 221581 }	-- 驹笴獿紇︽猭畍步肕此狶礛﹛艶才ゅ
	local ArmorID = ReadRoleJob_Give( PlayerID , ArmorGroup )

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , ArmorID , 1 )
	end
end
-- 穝も媚
function New_Hand_Potion( Option )
	local PlayerID = OwnerID()
	local PackageID = 201706		-- 膀セ媚
	local RedPotionID = 200151
	local BluePotionID = 200152
	local RedPotionGroup = { 5 , 5 , 5 , 2 , 2 , 3 , 5 , 2 , 5 , 5 }		-- 驹笴獿紇︽猭畍步肕此狶礛﹛艶才ゅ
	local BluePotionGroup = { 0 , 0 , 0 , 3 , 3 , 2 , 0 , 3 , 0 , 0 }		-- 驹笴獿紇︽猭畍步肕此狶礛﹛艶才ゅ
	local RedPotionNum = ReadRoleJob_Give( PlayerID , RedPotionGroup )
	local BluePotionNum = ReadRoleJob_Give( PlayerID , BluePotionGroup )

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , RedPotionID , RedPotionNum )
		if ( BluePotionNum ~= 0 ) then
			GiveBodyItem( PlayerID , BluePotionID , BluePotionNum )
		end
	end
end
-- 伦玴搂
function New_Hand_Present( Option )
	local PlayerID = OwnerID()
	local PackageID = 201709		-- 伦玴搂
	local Item1 = { 200151 , 5 }		-- 膀娄励端媚
	local Item2 = { 220098 , 1 }		-- 彩ガ︾
	local Item3 = { 520121 , 1}		-- 砰 I

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1[1] , Item1[2] )
		GiveBodyItemEx( PlayerID , Item2[1] , Item2[2] ,  1 , 0 ,0 ,0  , 0 , 0 )
		GiveBodyItem( PlayerID , Item3[1] , Item3[2] )
	end
end
function	CheckDelBodyItem( PlayerID , ItemID , DeleteNumber )
	if ( CountBodyItem( PlayerID , ItemID ) >= DeleteNumber ) then
		DelBodyItem( PlayerID , ItemID , DeleteNumber )
		return true
	else
		return false
	end
end

function ReadRoleJob_Give( PlayerID , ItemGroup )
	local job = ReadRoleValue( PlayerID , EM_RoleValue_VOC )
	if ( job == 0 ) then	-- 恨瞶
		ScriptMessage( PlayerID , PlayerID , 2 , "Please don't use GM to test this !!" , C_SYSTEM )	-- 礶い丁癟
		return ItemGroup[1]
	else
		return ItemGroup[job]
	end
end

-- 干毕ゼ才ゅ垂靡
function NoGiveCrystal()
-- ЧΘ锣戮ヴ叭 420691-420696
-- ō⊿Τ才ゅ垂靡 201467
-- ⊿Τ捌戮 EM_RoleValue_LV_SUB
-- ⊿Τ锣戮篨夹 540820
-- ō临Τ EmptyPacketCount
-- 既跋琌 QueuePacketCount
	if ( CheckCompleteQuest( OwnerID() , 420691 ) == true or CheckCompleteQuest( OwnerID() , 420692 ) == true or CheckCompleteQuest( OwnerID() , 420693 ) == true or CheckCompleteQuest( OwnerID() , 420694 ) == true or CheckCompleteQuest( OwnerID() , 420695 ) == true or CheckCompleteQuest( OwnerID() , 420696 ) == true ) and CountBodyItem( OwnerID() , 201467 ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB ) == 0 and CheckFlag( OwnerID() , 540820 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
		GiveBodyItem( OwnerID() , 201467 , 1 )
		Sleep(100)
	end
end

-- 耞戮穨计
function JobCount()

	local JCount = 0

	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_RuneDancer ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Druid ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_HARPSYN ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_PSYRON ) > 0 then
		JCount = JCount + 1
	end

	local JNUM = ReadRoleValue( OwnerID() , EM_RoleValue_VocCount )

	if JCount < JNUM then
		return true
	else
		return false
	end

end