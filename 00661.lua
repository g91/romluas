-- 職業列表
--1戰士	鎖甲
--2遊俠	皮甲
--3影行者	皮甲
--4法師	布衣
--5祭師	布衣
--6騎士	鎧甲
--7森林牧者	鎖甲
--8自然神官	布衣
--9靈能者	布衣
--10符文工匠	鎖甲

function SongSong_Bag_LV1( Option )

	local PlayerID = OwnerID()
	local PackageID = 201843		-- 魔幻禮包
	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local NeedSpace
	if Language == "cn" then
		NeedSpace = 4	-- 物理系 4 法系 5
	else
		NeedSpace = 2 + 1
	end
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	-- 武器
	local WeaponGroup = { }	
	-- 防具
	local ArmorGroup = { }	
	-- 飾品
	local AccessGroup = { 221668 , 221668 , 221668 , 221668 , 221668 , 221668, 221668 , 221668 , 221668 , 221668}	
	-- 藥水
	local HPPotionGroup = { 30 , 30 , 30 ,  15 , 15  , 15 , 15 , 15  , 30 , 30}
	local MPPotionGroup = { 0 , 0 , 0 ,  15 , 15  , 15 , 15 , 15  , 0 , 0 }		
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542321 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
	--	if Language == "cn" then
	--		GiveBodyItem( PlayerID , 202671 , 1 )
	--	end

		local Race = ReadRoleValue(PlayerID, EM_RoleValue_RACE ) -- 判斷種族
		if Race == 0 then -- 人類
			GiveBodyItem( PlayerID , 201844 , 1 )	-- 給下一個包
		elseif Race == 1 then -- 精靈
			GiveBodyItem( PlayerID , 201844 , 1 )	-- 給下一個包
		elseif Race == 2 then -- 影鑄矮人
			GiveBodyItem( PlayerID , 241254 , 1 )	-- 給下一個包 (編號未設)  探險禮包
		end

		SetFlag( PlayerID , 542321 , 1 )	-- 新手禮包LV1已開啟
	end

end


-- 人類, 精靈用 lv2
function SongSong_Bag_LV2( Option )

	local PlayerID = OwnerID()
	local PackageID = 201844		-- 冒險者禮包
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = { }						
	-- 防具
	local ArmorGroup = { 221671, 221670, 221670, 221669, 221669, 221671, 221671, 221669, 221669, 221671 }	
	-- 飾品
	local AccessGroup = { }				
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5,5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }	-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542322 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 203571 , 1 )

		local Race = ReadRoleValue(PlayerID, EM_RoleValue_RACE ) -- 判斷種族
		if Race == 0 then -- 人類
			GiveBodyItem( PlayerID , 201845 , 1 )	-- 給下一個包
		elseif Race == 1 then -- 精靈
			GiveBodyItem( PlayerID , 205931 , 1 )	-- 給下一個包 學院禮包
		elseif Race == 2 then -- 影鑄矮人
			GiveBodyItem( PlayerID , 241254 , 1 )	-- 給下一個包  探險禮包
		end

		SetFlag( PlayerID , 542322 , 1 )	-- 新手禮包LV2已開啟
	end

end

-- 影鑄矮人用 lv2
function SongSong_Bag_LV2_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241254	--探險禮包
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = { }						
	-- 防具
	local ArmorGroup = { 221671, 221670, 221670, 221669, 221669, 221671, 221671, 221669, 221669, 221671 }	
	-- 飾品
	local AccessGroup = { }				
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {  }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }	-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542322 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 203571 , 1 ) -- 1天棕色駿馬坐騎
		GiveBodyItem( PlayerID , 241255 , 1 )	-- 給下一個包 營地禮包
		SetFlag( PlayerID , 542322 , 1 )	-- 新手禮包LV2已開啟
	end

end

-- 人類
function SongSong_Bag_LV3( Option )

	local PlayerID = OwnerID()
	local PackageID = 201845		-- 開墾禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221672 , 221672 , 221672 , 221672 , 221672 , 221672  , 221672 , 221672   , 221672 , 221672  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = { }
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542323 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201846 , 1 )	-- 給下一個包
		SetFlag( PlayerID , 542323 , 1 )	-- 新手禮包LV3已開啟
	end

end

-- 精靈
function SongSong_Bag_LV3_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205931	--學院禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221672 , 221672 , 221672 , 221672 , 221672 , 221672  , 221672 , 221672   , 221672 , 221672  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {}
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542323 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end

		GiveBodyItem( PlayerID , 205932 , 1 )	-- 給下一個包 lv4 認證禮包
		SetFlag( PlayerID , 542323 , 1 )	-- 新手禮包LV3已開啟
	end

end


-- 影鑄矮人
function SongSong_Bag_LV3_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241255 --	營地禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221672 , 221672 , 221672 , 221672 , 221672 , 221672  , 221672 , 221672   , 221672 , 221672  }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = { }
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542323 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end

		GiveBodyItem( PlayerID , 241256 , 1 )	-- 給下一個包 lv4 祝福禮包
		SetFlag( PlayerID , 542323 , 1 )	-- 新手禮包LV3已開啟
	end

end