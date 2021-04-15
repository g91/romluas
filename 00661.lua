-- ¾�~�C��
--1�Ԥh	���
--2�C�L	�֥�
--3�v���	�֥�
--4�k�v	����
--5���v	����
--6�M�h	�Z��
--7�˪L����	���
--8�۵M���x	����
--9�F���	����
--10�Ť�u�K	���

function SongSong_Bag_LV1( Option )

	local PlayerID = OwnerID()
	local PackageID = 201843		-- �]��§�]
	local Language = GetServerDataLanguage()           --����ثeserver���y�t
	local NeedSpace
	if Language == "cn" then
		NeedSpace = 4	-- ���z�t 4 �k�t 5
	else
		NeedSpace = 2 + 1
	end
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	-- �Z��
	local WeaponGroup = { }	
	-- ����
	local ArmorGroup = { }	
	-- ���~
	local AccessGroup = { 221668 , 221668 , 221668 , 221668 , 221668 , 221668, 221668 , 221668 , 221668 , 221668}	
	-- �Ĥ�
	local HPPotionGroup = { 30 , 30 , 30 ,  15 , 15  , 15 , 15 , 15  , 30 , 30}
	local MPPotionGroup = { 0 , 0 , 0 ,  15 , 15  , 15 , 15 , 15  , 0 , 0 }		
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = {  }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542321 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
	--	if Language == "cn" then
	--		GiveBodyItem( PlayerID , 202671 , 1 )
	--	end

		local Race = ReadRoleValue(PlayerID, EM_RoleValue_RACE ) -- �P�_�ر�
		if Race == 0 then -- �H��
			GiveBodyItem( PlayerID , 201844 , 1 )	-- ���U�@�ӥ]
		elseif Race == 1 then -- ���F
			GiveBodyItem( PlayerID , 201844 , 1 )	-- ���U�@�ӥ]
		elseif Race == 2 then -- �vű�G�H
			GiveBodyItem( PlayerID , 241254 , 1 )	-- ���U�@�ӥ] (�s�����])  ���I§�]
		end

		SetFlag( PlayerID , 542321 , 1 )	-- �s��§�]LV1�w�}��
	end

end


-- �H��, ���F�� lv2
function SongSong_Bag_LV2( Option )

	local PlayerID = OwnerID()
	local PackageID = 201844		-- �_�I��§�]
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = { }						
	-- ����
	local ArmorGroup = { 221671, 221670, 221670, 221669, 221669, 221671, 221671, 221669, 221669, 221671 }	
	-- ���~
	local AccessGroup = { }				
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5,5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = {  }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = {  }	-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542322 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 203571 , 1 )

		local Race = ReadRoleValue(PlayerID, EM_RoleValue_RACE ) -- �P�_�ر�
		if Race == 0 then -- �H��
			GiveBodyItem( PlayerID , 201845 , 1 )	-- ���U�@�ӥ]
		elseif Race == 1 then -- ���F
			GiveBodyItem( PlayerID , 205931 , 1 )	-- ���U�@�ӥ] �ǰ|§�]
		elseif Race == 2 then -- �vű�G�H
			GiveBodyItem( PlayerID , 241254 , 1 )	-- ���U�@�ӥ]  ���I§�]
		end

		SetFlag( PlayerID , 542322 , 1 )	-- �s��§�]LV2�w�}��
	end

end

-- �vű�G�H�� lv2
function SongSong_Bag_LV2_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241254	--���I§�]
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = { }						
	-- ����
	local ArmorGroup = { 221671, 221670, 221670, 221669, 221669, 221671, 221671, 221669, 221669, 221671 }	
	-- ���~
	local AccessGroup = { }				
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = {  }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = {  }	-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542322 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 203571 , 1 ) -- 1�ѴĦ��@�����M
		GiveBodyItem( PlayerID , 241255 , 1 )	-- ���U�@�ӥ] ��a§�]
		SetFlag( PlayerID , 542322 , 1 )	-- �s��§�]LV2�w�}��
	end

end

-- �H��
function SongSong_Bag_LV3( Option )

	local PlayerID = OwnerID()
	local PackageID = 201845		-- �}��§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = { 221672 , 221672 , 221672 , 221672 , 221672 , 221672  , 221672 , 221672   , 221672 , 221672  }	
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = { }
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542323 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201846 , 1 )	-- ���U�@�ӥ]
		SetFlag( PlayerID , 542323 , 1 )	-- �s��§�]LV3�w�}��
	end

end

-- ���F
function SongSong_Bag_LV3_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205931	--�ǰ|§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = { 221672 , 221672 , 221672 , 221672 , 221672 , 221672  , 221672 , 221672   , 221672 , 221672  }	
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = {}
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542323 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end

		GiveBodyItem( PlayerID , 205932 , 1 )	-- ���U�@�ӥ] lv4 �{��§�]
		SetFlag( PlayerID , 542323 , 1 )	-- �s��§�]LV3�w�}��
	end

end


-- �vű�G�H
function SongSong_Bag_LV3_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241255 --	��a§�]
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = { 221672 , 221672 , 221672 , 221672 , 221672 , 221672  , 221672 , 221672   , 221672 , 221672  }	
	-- �Ĥ�
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }	
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663		-- ²������Ĥ�
	local MPPotionID = 201042		-- ²���]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	-- �S�O�]
	local SpecBagGroup = { }
	-- ��
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542323 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end

		GiveBodyItem( PlayerID , 241256 , 1 )	-- ���U�@�ӥ] lv4 ����§�]
		SetFlag( PlayerID , 542323 , 1 )	-- �s��§�]LV3�w�}��
	end

end