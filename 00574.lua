--新手卡
Function LuaI_201543(Option)
	local PlayerID = OwnerID()
	local PackageID = 201543		-- 嚎叫禮包
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local job = ReadRoleValue( PlayerID , EM_RoleValue_VOC )
	-- 武器
	local WeaponGroup = {721862,721861,721860,721864,721863,721865  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 防具
	local ArmorGroup1 = { 721872, 721869 , 721869 , 721866 , 721866 , 721872 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	local ArmorGroup2 = { 721873, 721870 , 721870 , 721867 , 721867 , 721873 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	local ArmorGroup3 = { 721874, 721871 , 721871 , 721868 , 721868 , 721874 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 飾品
	local AccessGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 藥水
	local HPPotionGroup = { 5 , 5 , 5 , 5 , 5 , 5 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local MPPotionGroup = { 5 , 5 , 5 , 5 , 5 , 5 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local HPPotionID = 200840
	local MPPotionID = 201201							-- 基礎裝備石
	-- 護符
	local HuFuGroup = { 201700 , 201700 , 201700 , 201700 , 201700 , 201700 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }	-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 錢
	local Money = 0

	local WeaponID , ArmorID1 , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup1 , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )
	local ArmorID2 =  ArmorGroup2[job]
	local ArmorID3 =  ArmorGroup3[job]

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID1 ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID1 , 1 )			end
		if ( ArmorID2 ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID2 , 1 )			end
		if ( ArmorID3 ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID3 , 1 )			end
		if ( HuFuID ~= nil  ) then		GiveBodyItem( PlayerID ,HuFuID, 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		GiveBodyItem( PlayerID , 201887 , 1 )
	end
end
--激活禮品包
Function LuaI_201885(Option)
	local PlayerID = OwnerID()
	local PackageID = 201885
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201971 , 1 )
		GiveBodyItem( PlayerID , 201972 , 1 )
		GiveBodyItem( PlayerID , 201612 , 1 )
		GiveBodyItem( PlayerID , 201939 , 1 )
		GiveBodyItem( PlayerID , 530052 , 1 )
	end

end
--新手寵物包
Function LuaI_201886(Option)
	local PlayerID = OwnerID()
	local PackageID = 201886
	local NeedSpace = 9
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local job = ReadRoleValue( PlayerID , EM_RoleValue_VOC )
	-- 武器
	local WeaponGroup = {721862,721861,721860,721864,721863,721865  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 防具
	local ArmorGroup1 = { 721872, 721869 , 721869 , 721866 , 721866 , 721872 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	local ArmorGroup2 = { 721873, 721870 , 721870 , 721867 , 721867 , 721873 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	local ArmorGroup3 = { 721874, 721871 , 721871 , 721868 , 721868 , 721874 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 飾品
	local AccessGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 藥水
	local HPPotionGroup = { 5 , 5 , 5 , 5 , 5 , 5 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local MPPotionGroup = { 5 , 5 , 5 , 5 , 5 , 5 }					-- 戰士、遊俠、影行、法師、祭司、騎士
	local HPPotionID = 200840
	local MPPotionID = 201201							-- 基礎裝備石
	-- 護符
	local HuFuGroup = { 201700 , 201700 , 201700 , 201700 , 201700 , 201700 }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }	-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 錢
	local Money = 0

	local WeaponID , ArmorID1 , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup1 , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )
	local ArmorID2 =  ArmorGroup2[job]
	local ArmorID3 =  ArmorGroup3[job]

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID1 ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID1 , 1 )			end
		if ( ArmorID2 ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID2 , 1 )			end
		if ( ArmorID3 ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID3 , 1 )			end
		if ( HuFuID ~= nil  ) then		GiveBodyItem( PlayerID ,HuFuID, 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		GiveBodyItem( PlayerID , 201969 , 1 )
		GiveBodyItem( PlayerID , 201887 , 1 )
		AddRoleValue( PlayerID , EM_RoleValue_Money , 100000 )

		OpenBagMessage( PlayerID , "MSG_OPENBAG_03", 2 )	-- 出包公告

	end

end
--商城禮品包
Function LuaI_201887(Option)
	local PlayerID = OwnerID()
	local PackageID = 201887
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201967 , 10 )
		GiveBodyItem( PlayerID , 201971 , 1 )
		GiveBodyItem( PlayerID , 201972 , 1 )
		GiveBodyItem( PlayerID , 201619 , 1 )
		GiveBodyItem( PlayerID , 201460 , 5 )
	end

end
--封測獎勵
Function LuaI_202097(Option)
	local PlayerID = OwnerID()
	local PackageID = 202097
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 221654 , 1 )
		GiveBodyItem( PlayerID , 221655 , 1 )
		GiveBodyItem( PlayerID , 221656 , 1 )
		GiveBodyItem( PlayerID , 221657 , 1 )
		GiveBodyItem( PlayerID , 221658 , 1 )
		GiveBodyItem( PlayerID , 221659 , 1 )
		GiveBodyItem( PlayerID , 202095, 1 )
		GiveBodyItem( PlayerID , 202096 , 1 )
		GiveBodyItem( PlayerID ,530053, 1 )
		GiveBodyItem( PlayerID , 530054 , 1 )
		GiveBodyItem( PlayerID , 530055, 1 )
	end

end
