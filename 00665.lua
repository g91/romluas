function SongSong_Bag_LV13( Option )

	local PlayerID = OwnerID()
	local PackageID = 201855		-- ���Q�w§�]
	local NeedSpace = 2 + 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }	
	local HPPotionID = 200807	-- ����Ĥ�
	local MPPotionID = 201046	-- �]�O�Ĥ�
	-- �@��
	local HuFuGroup = {  }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 200

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542333 ) == true then
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
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201856 , 1 )	-- ���U�@�ӥ] lv14
		SetFlag( PlayerID , 542333 , 1 )	-- �s��§�]LV13�w�}��
	end

end

function SongSong_Bag_LV14( Option )

	local PlayerID = OwnerID()
	local PackageID = 201856		-- �Ǵ�§�]
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }	
	local HPPotionID = 200807	-- ����Ĥ�
	local MPPotionID = 201046	-- �]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 200

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542334 ) == true then
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
		if ( HuFuID ~= nil  ) then			GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201857 , 1 )	-- ���U�@�ӥ] lv 15
		SetFlag( PlayerID , 542334 , 1 )	-- �s��§�]LV14�w�}��
	end

end

function SongSong_Bag_LV15( Option )
	local Language = GetServerDataLanguage()           --����ثeserver���y�t
	local Country = {"kr","cn"}

	local PlayerID = OwnerID()
	local PackageID = 201857		-- ����§�]

	local NeedSpace = 2 + 7			--���`�u�n7��
	if Language == Country[1] then	--����ֵ��@�өҥH�u�n6��
		NeedSpace = 2 + 6
	elseif Language == Country[2] then	--����h���@�өҥH�n8��
		NeedSpace = 2 + 8
	end
--	local NeedSpace = 2 + 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }
	local HPPotionID = 200807							-- ����Ĥ�
	local MPPotionID = 201046							-- �]�O�Ĥ�
	-- �@��
	local HuFuGroup = {  }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 200

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542335 ) == true then
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

		DebugMsg( 0 , 0 , "Language ="..Language )
		GiveBodyItem( PlayerID , 201858 , 1 )	-- ���U�@�ӥ]  lv 16

		GiveBodyItem( PlayerID , 200840 , 5 )  -- ��¦�Z����
		GiveBodyItem( PlayerID ,201201, 5 )  -- ��¦�˳ƥ�
		GiveBodyItem( PlayerID , 202902, 3 ) -- �Ŷ��O������
		GiveBodyItem( PlayerID , 202903 , 10 ) -- �ǰe�̲Ť�
		GiveBodyItem( PlayerID , 203574, 3 ) -- ���Ÿg���ľ�

		if Language ~= Country[1] then  --�P�_�O���O�D���y�t
			GiveBodyItem( PlayerID , 202506, 2 )   -- �D����y�t�~�������ײz�l	
		end
		if Language == Country[2] then --����y�t�S�O�B�z
			GiveBodyItem( PlayerID , 202671 , 1 )	--���굹���P��
		end

		SetFlag( PlayerID , 542335 , 1 )	-- �s��§�]LV15�w�}��
	end

end