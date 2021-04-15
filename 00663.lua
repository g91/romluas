
-- 人類
function SongSong_Bag_LV7( Option )

	local PlayerID = OwnerID()
	local PackageID = 201849		-- 枯木禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = { 221680 ,221679, 221679, 221678, 221678, 221680 ,221680, 221678, 221678, 221680 }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542327 ) == true then
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
		GiveBodyItem( PlayerID , 201850 , 1 )	-- 給下一個包
		SetFlag( PlayerID , 542327 , 1 )	-- 新手禮包LV7已開啟
	end
end

-- 精靈
function SongSong_Bag_LV7_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205935		-- 蕈林禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = { 221680 ,221679, 221679, 221678, 221678, 221680 ,221680, 221678, 221678, 221680 }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542327 ) == true then
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
		GiveBodyItem( PlayerID , 205936 , 1 )	-- 給下一個包 lv8 地穴禮包
		SetFlag( PlayerID , 542327 , 1 )	-- 新手禮包LV7已開啟
	end
end


-- 矮人
function SongSong_Bag_LV7_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241259		-- 膽識禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = { 221680 ,221679, 221679, 221678, 221678, 221680 ,221680, 221678, 221678, 221680 }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542327 ) == true then
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
		GiveBodyItem( PlayerID , 241260 , 1 )	-- 給下一個包 lv8 幻境禮包
		SetFlag( PlayerID , 542327 , 1 )	-- 新手禮包LV7已開啟
	end

end

-- 人類
function SongSong_Bag_LV8( Option )

	local PlayerID = OwnerID()
	local PackageID = 201850		-- 破碎禮包
	local NeedSpace = 4 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = { 221683 , 221682 , 221682 , 221681 , 221681 , 221683, 221683 , 221681 , 221681 ,221683 }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542328 ) == true then
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
		GiveBodyItem( PlayerID , 200840 , 5 ) -- 基礎武器石
		GiveBodyItem( PlayerID , 201201 , 5 ) -- 基礎裝備石
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201851 , 1 )	-- 給下一個包 lv9
		SetFlag( PlayerID , 542328 , 1 )	-- 新手禮包LV8已開啟
	end
end

-- 精靈
function SongSong_Bag_LV8_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205936		-- 地穴禮包
	local NeedSpace = 4 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = { 221683 , 221682 , 221682 , 221681 , 221681 , 221683, 221683 , 221681 , 221681 ,221683 }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542328 ) == true then
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
		GiveBodyItem( PlayerID , 200840 , 5 ) -- 基礎武器石
		GiveBodyItem( PlayerID , 201201 , 5 ) -- 基礎裝備石
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 205937 , 1 )	-- 給下一個包 lv9  試煉禮包
		SetFlag( PlayerID , 542328 , 1 )	-- 新手禮包LV8已開啟
	end
end

-- 矮人
function SongSong_Bag_LV8_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241260		-- 幻境禮包
	local NeedSpace = 4 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = { 221683 , 221682 , 221682 , 221681 , 221681 , 221683, 221683 , 221681 , 221681 ,221683 }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542328 ) == true then
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
		GiveBodyItem( PlayerID , 200840 , 5 ) -- 基礎武器石
		GiveBodyItem( PlayerID , 201201 , 5 ) -- 基礎裝備石
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 241261 , 1 )	-- 給下一個包 lv9  南城禮包
		SetFlag( PlayerID , 542328 , 1 )	-- 新手禮包LV8已開啟
	end
end

-- 人類
function SongSong_Bag_LV9( Option )

	local PlayerID = OwnerID()
	local PackageID = 201851		-- 月泉禮包
	local NeedSpace = 3 + 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221684 , 221684 , 221684 , 221684 , 221684 , 221684  , 221684 , 221684 , 221684 , 221684  }  -- 月泉禮包墜飾
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663 -- 簡易急救藥水
	local MPPotionID = 201042 -- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 100
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542329 ) == true then
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
		GiveBodyItem( PlayerID , 201521 , 1 )  -- 符文福袋I	
		GiveBodyItem( PlayerID , 202152 , 2 )  -- 經驗值加成果實

		GiveBodyItem( PlayerID , 201852 , 1 )	-- 給下一個包 ( 人類)
		SetFlag( PlayerID , 542329 , 1 )	-- 新手禮包LV9已開啟
	end

end


-- 精靈
function SongSong_Bag_LV9_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205937		-- 試煉禮包
	local NeedSpace = 3 + 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221684 , 221684 , 221684 , 221684 , 221684 , 221684  , 221684 , 221684 , 221684 , 221684  }  -- 月泉禮包墜飾
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663 -- 簡易急救藥水
	local MPPotionID = 201042 -- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 100
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542329 ) == true then
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
		GiveBodyItem( PlayerID , 201521 , 1 )  -- 符文福袋I	
		GiveBodyItem( PlayerID , 202152 , 2 )  -- 經驗值加成果實

		GiveBodyItem( PlayerID , 205938 , 1 )	-- 給下一個包  出征禮包
		SetFlag( PlayerID , 542329 , 1 )	-- 新手禮包LV9已開啟
	end

end


-- 矮人
function SongSong_Bag_LV9_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241261		-- 南城禮包
	local NeedSpace = 3 + 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221684 , 221684 , 221684 , 221684 , 221684 , 221684  , 221684 , 221684 , 221684 , 221684  }  -- 月泉禮包墜飾
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663 -- 簡易急救藥水
	local MPPotionID = 201042 -- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 100
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542329 ) == true then
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
		GiveBodyItem( PlayerID , 201521 , 1 )  -- 符文福袋I	
		GiveBodyItem( PlayerID , 202152 , 2 )  -- 經驗值加成果實

		GiveBodyItem( PlayerID , 241262 , 1 )	-- 給下一個包  勇士禮包
		SetFlag( PlayerID , 542329 , 1 )	-- 新手禮包LV9已開啟
	end

end