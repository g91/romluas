-- 新手武器包
function New_Hand_Weapon( Option )
	local PlayerID = OwnerID()
	local PackageID = 201704		-- 精良武器包
	local WeaponGroup = { 210511 , 210512 , 210513 , 210514 , 210515 , 210516 , 210511 , 210515 , 210514 , 210511}	-- 戰士、遊俠、影行、法師、祭司、騎士、森林牧者、自然神官、靈能者、符文工匠
	local WeaponID = ReadRoleJob_Give( PlayerID , WeaponGroup )

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , WeaponID , 1 )
		GiveBodyItem( PlayerID , 209577 , 1)	--2011/3/14新增
	end
end
-- 新手防具包
function New_Hand_Armor( Option )
	local PlayerID = OwnerID()
	local PackageID = 201705		-- 精良防具包
	local ArmorGroup = { 221581 , 221582 , 221583 , 221584 , 221585 , 221586 , 221581 , 221585 ,221584 , 221581 }	-- 戰士、遊俠、影行、法師、祭司、騎士、森林牧者、自然神官、靈能者、符文工匠
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
-- 新手藥水包
function New_Hand_Potion( Option )
	local PlayerID = OwnerID()
	local PackageID = 201706		-- 基本藥水包
	local RedPotionID = 200151
	local BluePotionID = 200152
	local RedPotionGroup = { 5 , 5 , 5 , 2 , 2 , 3 , 5 , 2 , 5 , 5 }		-- 戰士、遊俠、影行、法師、祭司、騎士、森林牧者、自然神官、靈能者、符文工匠
	local BluePotionGroup = { 0 , 0 , 0 , 3 , 3 , 2 , 0 , 3 , 0 , 0 }		-- 戰士、遊俠、影行、法師、祭司、騎士、森林牧者、自然神官、靈能者、符文工匠
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
-- 豐厚的禮物
function New_Hand_Present( Option )
	local PlayerID = OwnerID()
	local PackageID = 201709		-- 豐厚的禮物
	local Item1 = { 200151 , 5 }		-- 基礎療傷藥
	local Item2 = { 220098 , 1 }		-- 粗布衣
	local Item3 = { 520121 , 1}		-- 體力 I

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
	if ( job == 0 ) then	-- 管理者
		ScriptMessage( PlayerID , PlayerID , 2 , "Please don't use GM to test this !!" , C_SYSTEM )	-- 畫面中間訊息
		return ItemGroup[1]
	else
		return ItemGroup[job]
	end
end

-- 補救未拿到符文水晶證明
function NoGiveCrystal()
-- 完成轉職任務 420691-420696
-- 身上沒有符文水晶證明 201467
-- 沒有副職 EM_RoleValue_LV_SUB
-- 沒有轉職旗標 540820
-- 身上還有空位 EmptyPacketCount
-- 暫存區是空的 QueuePacketCount
	if ( CheckCompleteQuest( OwnerID() , 420691 ) == true or CheckCompleteQuest( OwnerID() , 420692 ) == true or CheckCompleteQuest( OwnerID() , 420693 ) == true or CheckCompleteQuest( OwnerID() , 420694 ) == true or CheckCompleteQuest( OwnerID() , 420695 ) == true or CheckCompleteQuest( OwnerID() , 420696 ) == true ) and CountBodyItem( OwnerID() , 201467 ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB ) == 0 and CheckFlag( OwnerID() , 540820 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
		GiveBodyItem( OwnerID() , 201467 , 1 )
		Sleep(100)
	end
end

-- 判斷職業數
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