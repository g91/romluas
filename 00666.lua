function SongSong_Bag_LV16( Option )

	local PlayerID = OwnerID()
	local PackageID = 201858		-- 威爾斯禮包
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }	
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10 , 10 , 10 , 5 , 5 , 5 , 5 , 5 , 10 , 10  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 5, 5, 5 , 5, 5 , 0 , 0  }
	local HPPotionID = 200808	-- 高效急救藥水
	local MPPotionID = 201047	-- 高效魔力藥水
	-- 護符
	local HuFuGroup = {}	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 200

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542336 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HuFuID ~= nil  ) then		GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201859 , 1 )	-- 給下一個包 LV 17
		GiveBodyItem( PlayerID , 221394 , 1 ) -- 技能之源
		SetFlag( PlayerID , 542336 , 1 )	-- 新手禮包LV16已開啟
	end

end

function SongSong_Bag_LV17( Option )

	local PlayerID = OwnerID()
	local PackageID = 201859		-- 麥凱禮包
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10 , 10 , 10 , 5 , 5 , 5 , 5 , 5 , 10 , 10  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 5, 5, 5 , 5, 5 , 0 , 0  }			
	local HPPotionID = 200808  -- 高效急救藥水
	local MPPotionID = 201047  -- 高效魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 300

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542337 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201860 , 1 )	-- 給下一個包 LV18
		SetFlag( PlayerID , 542337 , 1 )	-- 新手禮包LV17已開啟
	end

end

function SongSong_Bag_LV18( Option )

	local PlayerID = OwnerID()
	local PackageID = 201860		-- 貝加禮包
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }	
	-- 防具
	local ArmorGroup = {  }		
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10 , 10 , 10 , 5 , 5 , 5 , 5 , 5 , 10 , 10  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 5, 5, 5 , 5, 5 , 0 , 0  }			
	local HPPotionID = 200808  -- 高效急救藥水
	local MPPotionID = 201047  -- 高效魔力藥水
	-- 護符
	local HuFuGroup = { }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 300

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542338 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HuFuID ~= nil  ) then		GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201861 , 1 )	-- 給下一個包 lv 19
		SetFlag( PlayerID , 542338 , 1 )	-- 新手禮包LV18已開啟
	end

end