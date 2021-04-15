function SongSong_Bag_LVEX7( Option )

	local PlayerID = OwnerID()
	local PackageID = 201869		-- 綠色好運禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 防具
	local ArmorGroup = { 221701 , 221701 , 221701 , 221701 , 221701 , 221701 }		-- 戰士、遊俠、影行、法師、祭司、騎士
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

function SongSong_Bag_LVEX9( Option )

	local PlayerID = OwnerID()
	local PackageID = 201870		-- 綠色好運禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 防具
	local ArmorGroup = { 221702 , 221702 , 221702 , 221702 , 221702 , 221702 }		-- 戰士、遊俠、影行、法師、祭司、騎士
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

function SongSong_Bag_LVEX10( Option )

	local PlayerID = OwnerID()
	local PackageID = 201871		-- 綠色好運禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 防具
	local ArmorGroup = { 221703 , 221703 , 221703 , 221703 , 221703 , 221703 }		-- 戰士、遊俠、影行、法師、祭司、騎士
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