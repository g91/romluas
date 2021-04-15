
-- �H���]
function SongSong_Bag_LV4( Option )

	local PlayerID = OwnerID()
	local PackageID = 201846		-- �E��§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = { }	
	-- ����
	local ArmorGroup = { }	
	-- ���~
	local AccessGroup = { 221673 , 221673 , 221673 , 221673 , 221673 , 221673  , 221673 , 221673 , 221673 , 221673 }
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542324 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201521 , 1 )  --�Ť�ֳU
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201847 , 1 )	-- ���U�@�ӥ]
		SetFlag( PlayerID , 542324 , 1 )	-- �s��§�]LV4�w�}��
	end

end


-- ���F

function SongSong_Bag_LV4_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205932		-- �{��§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = { }	
	-- ����
	local ArmorGroup = { }	
	-- ���~
	local AccessGroup = { 221673 , 221673 , 221673 , 221673 , 221673 , 221673  , 221673 , 221673 , 221673 , 221673 }
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542324 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201521 , 1 )  --�Ť�ֳU
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 205933 , 1 )	-- ���U�@�ӥ] �j�v§�]
		SetFlag( PlayerID , 542324 , 1 )	-- �s��§�]LV4�w�}��
	end
end


-- �G�H
function SongSong_Bag_LV4_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241256		-- ����§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = { }	
	-- ����
	local ArmorGroup = { }	
	-- ���~
	local AccessGroup = { 221673 , 221673 , 221673 , 221673 , 221673 , 221673  , 221673 , 221673 , 221673 , 221673 }
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542324 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201521 , 1 )  --�Ť�ֳU
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 241257 , 1 )	-- ���U�@�ӥ] �q�|§�]
		SetFlag( PlayerID , 542324 , 1 )	-- �s��§�]LV4�w�}��
	end

end

-- �H��
function SongSong_Bag_LV5( Option )

	local PlayerID = OwnerID()
	local PackageID = 201847		-- �q�|§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = { }
	-- ����
	local ArmorGroup = { 221676 , 221675 , 221675 , 221674 , 221674 , 221676 ,221676 ,221674 ,221674 ,221676 }	
	-- ���~
	local AccessGroup = { }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10  , 10 , 10 , 20 , 20 }	
	local MPPotionGroup = { 0 , 0 , 0 , 10, 10, 10   , 10 , 10 , 0 , 0 }	
	local HPPotionID = 200663	-- ²������Ĥ�
	local MPPotionID = 201042	-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = {  }

	-- ��
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542325 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202902, 1 ) -- �Ŷ��O������
		GiveBodyItem( PlayerID , 202903 , 5 ) -- �ǰe�̲Ť�
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201848 , 1 )	-- ���U�@�ӥ] lv6
		SetFlag( PlayerID , 542325 , 1 )	-- �s��§�]LV5�w�}��
	end

end


-- ���F
function SongSong_Bag_LV5_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205933		-- �j�v§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = { }
	-- ����
	local ArmorGroup = { 221676 , 221675 , 221675 , 221674 , 221674 , 221676 ,221676 ,221674 ,221674 ,221676 }	
	-- ���~
	local AccessGroup = { }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10  , 10 , 10 , 20 , 20 }	
	local MPPotionGroup = { 0 , 0 , 0 , 10, 10, 10   , 10 , 10 , 0 , 0 }	
	local HPPotionID = 200663	-- ²������Ĥ�
	local MPPotionID = 201042	-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542325 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202902, 1 ) -- �Ŷ��O������
		GiveBodyItem( PlayerID , 202903 , 5 ) -- �ǰe�̲Ť�
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 205934 , 1 )	-- ���U�@�ӥ] lv6 ����§�]
		SetFlag( PlayerID , 542325 , 1 )	-- �s��§�]LV5�w�}��
	end
end

-- �G�H
function SongSong_Bag_LV5_2( Option )
	local PlayerID = OwnerID()
	local PackageID = 241257		-- �q�|§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = { }
	-- ����
	local ArmorGroup = { 221676 , 221675 , 221675 , 221674 , 221674 , 221676 ,221676 ,221674 ,221674 ,221676 }	
	-- ���~
	local AccessGroup = { }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10  , 10 , 10 , 20 , 20 }	
	local MPPotionGroup = { 0 , 0 , 0 , 10, 10, 10   , 10 , 10 , 0 , 0 }	
	local HPPotionID = 200663	-- ²������Ĥ�
	local MPPotionID = 201042	-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542325 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202902, 1 ) -- �Ŷ��O������
		GiveBodyItem( PlayerID , 202903 , 5 ) -- �ǰe�̲Ť�
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 241258 , 1 )	-- ���U�@�ӥ] lv6 �ͽ�§�]
		SetFlag( PlayerID , 542325 , 1 )	-- �s��§�]LV5�w�}��
	end
end

-- �H��
function SongSong_Bag_LV6( Option )

	local PlayerID = OwnerID()
	local PackageID = 201848		-- ù��§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = { 221677 , 221677 , 221677 , 221677 , 221677 , 221677  , 221677 , 221677  , 221677 , 221677 }	
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663	-- ²������Ĥ�
	local MPPotionID = 201042	-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = {}	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542326 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
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
		GiveBodyItem( PlayerID , 201849 , 1 )	-- ���U�@�ӥ] lv7
		SetFlag( PlayerID , 542326 , 1 )	-- �s��§�]LV6�w�}��
	end

end


-- ���F
function SongSong_Bag_LV6_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205934		-- ����§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = { 221677 , 221677 , 221677 , 221677 , 221677 , 221677  , 221677 , 221677  , 221677 , 221677 }	
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663	-- ²������Ĥ�
	local MPPotionID = 201042	-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = {}	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542326 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
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
		GiveBodyItem( PlayerID , 205935 , 1 )	-- ���U�@�ӥ] lv7 ���L§�]
		SetFlag( PlayerID , 542326 , 1 )	-- �s��§�]LV6�w�}��
	end

end

-- �G�H
function SongSong_Bag_LV6_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241258		-- �ͽ�§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = { 221677 , 221677 , 221677 , 221677 , 221677 , 221677  , 221677 , 221677  , 221677 , 221677 }	
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663	-- ²������Ĥ�
	local MPPotionID = 201042	-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = {}	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542326 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
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
		GiveBodyItem( PlayerID , 241259 , 1 )	-- ���U�@�ӥ] lv7 �x��§�]
		SetFlag( PlayerID , 542326 , 1 )	-- �s��§�]LV6�w�}��
	end

end