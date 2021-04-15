
-- (共同)
function SongSong_Bag_LV10( Option )
	local PlayerID = OwnerID()
	local PackageID = 201852		-- 嚎叫禮包
	local NeedSpace = 4 + 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }	
	-- 防具
	local ArmorGroup = { 221687 , 221686 , 221686 , 221685 , 221685 , 221687, 221687, 221685, 221685, 221687 }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10  , 10 , 10 , 20 , 20 }	
	local MPPotionGroup = { 0 , 0 , 0 , 10, 10, 10   , 10 , 10 , 0 , 0 }	
	local HPPotionID = 200807  -- 急救藥水
	local MPPotionID = 201046 -- 魔力藥水
	-- 護符
	local HuFuGroup = { }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 100

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542330 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201853 , 1 )	-- 給下一個包 lv11
		GiveBodyItem( PlayerID , 202902 , 3 )	-- 空間記錄墨水 
		GiveBodyItem( PlayerID , 202903 , 10 )	-- 傳送者符文 
		GiveBodyItem( PlayerID , 202435 , 3 )  -- 家的羈絆	
		GiveBodyItem( PlayerID , 201201 , 5 ) -- 基礎裝備石
		SetFlag( PlayerID , 542330 , 1 )	-- 新手禮包LV10已開啟
	end

end


function SongSong_Bag_LV11( Option )

	local PlayerID = OwnerID()
	local PackageID = 201853		-- 毗爾禮包
	local NeedSpace = 2 + 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }	
	local HPPotionID = 200807	-- 急救藥水
	local MPPotionID = 201046	-- 魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 100

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542331 ) == true then
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
		GiveBodyItem( PlayerID , 201854 , 1 )	-- 給下一個包 12
		SetFlag( PlayerID , 542331 , 1 )	-- 新手禮包LV11已開啟
	end

end

function SongSong_Bag_LV12( Option )

	local PlayerID = OwnerID()
	local PackageID = 201854		-- 麥督格禮包
	local NeedSpace = 2 + 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }	
	local HPPotionID = 200807	-- 急救藥水
	local MPPotionID = 201046	-- 魔力藥水
	-- 護符
	local HuFuGroup = { }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 100

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542332 ) == true then
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
		if ( HuFuID ~= nil  ) then			GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201855 , 1 )	-- 給下一個包
		GiveBodyItem( PlayerID , 221394 , 1 ) 	-- 技能之源
		GiveBodyItem( PlayerID , 221394 , 1 ) 	-- 技能之源
		SetFlag( PlayerID , 542332 , 1 )	-- 新手禮包LV12已開啟
	end

end