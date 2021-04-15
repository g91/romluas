function SongSong_Bag_LV19( Option )

	local PlayerID = OwnerID()
	local PackageID = 201861		-- 塔吉頓禮包
	local NeedSpace = 2 + 2
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
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 300

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542339 ) == true then
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
		GiveBodyItem( PlayerID , 201862 , 1 )	-- 給下一個包 lv 20
		SetFlag( PlayerID , 542339 , 1 )	-- 新手禮包LV19已開啟
	end

end

function SongSong_Bag_LV20( Option )
	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local Country = {"kr"}

	local PlayerID = OwnerID()
	local PackageID = 201862		-- 安莉亞禮包

	local NeedSpace = 7			--正常只要7格
	if Language == Country[1] then	--韓國少給一個所以只要6格
		NeedSpace = 6
	end
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
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 2000

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542340 ) == true then
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

		DebugMsg( 0 , 0 , "Language ="..Language )
		GiveBodyItem( PlayerID , 201522 , 1 ) -- 符文福袋II
		GiveBodyItem( PlayerID , 203572 , 1 )  -- 1天白色駿馬坐騎
		GiveBodyItem( PlayerID , 203574 , 3 )  -- 高級經驗藥劑
		GiveBodyItem( PlayerID , 202902 , 3 )  -- 空間記錄墨水
		GiveBodyItem( PlayerID , 202903 , 10 ) -- 傳送者符文
	--	GiveBodyItem( PlayerID , 202435 , 3 )  -- 家的羈絆

		GiveBodyItem( PlayerID , 201883 , 1 )	-- 給下一個包 lv 25
		if Language ~= Country[1] then	--韓國語系特別處理
			GiveBodyItem( PlayerID , 202506 , 3 )	--韓國語系不給黃金修理槌 2010.12.28
		end

		SetFlag( PlayerID , 542340 , 1 )	-- 新手禮包LV20已開啟
	end
end

function SongSong_Bag_LV25( Option )

	local PlayerID = OwnerID()
	local PackageID = 201883		-- 艾索蘭禮包
	local NeedSpace = 1 + 1
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
	local HuFuGroup = {  }		
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 2500

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542341 ) == true then
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
		GiveBodyItem( PlayerID , 201863 , 1 )	-- 給下一個包 LV 30
		GiveBodyItem( PlayerID , 201522 , 1 )   -- 符文福袋II
		GiveBodyItem( PlayerID , 221395 , 1 )  -- 高級技能之源
		SetFlag( PlayerID , 542341 , 1 )	-- 新手禮包LV25已開啟
	end

end