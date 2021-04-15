function SongSong_Bag_LVEX26( Option )

	local PlayerID = OwnerID()
	local PackageID = 201877		-- 深藍色好運禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 防具
	local ArmorGroup = { 221710 , 221711 , 221711 , 221709 , 221709 , 221710 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 飾品
	local AccessGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 藥水
	local HPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local MPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local HPPotionID = 0
	local MPPotionID = 0
	-- 護符
	local HuFuGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }	-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 錢
	local Money = 0

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
	end
end

function SongSong_Bag_LVEX31( Option )

	local PlayerID = OwnerID()
	local PackageID = 201878		-- 深藍色好運禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 防具
	local ArmorGroup = { 221713 , 221714 , 221714 , 221712 , 221712 , 221713 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 飾品
	local AccessGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 藥水
	local HPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local MPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local HPPotionID = 0
	local MPPotionID = 0
	-- 護符
	local HuFuGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }	-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 錢
	local Money = 0

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
	end
end

function SongSong_Bag_LVEX36( Option )

	local PlayerID = OwnerID()
	local PackageID = 201879		-- 深藍色好運禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 防具
	local ArmorGroup = { 221716 , 221717 , 221717 , 221715 , 221715 , 221716 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 飾品
	local AccessGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 藥水
	local HPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local MPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local HPPotionID = 0
	local MPPotionID = 0
	-- 護符
	local HuFuGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }	-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 錢
	local Money = 0

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
	end
end