function PK_Bag_LV1( Option )

	local PlayerID = OwnerID()
	local PackageID = 202437		-- �̫���§�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721220	-- �̫ᱼ����

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV2( Option )

	local PlayerID = OwnerID()
	local PackageID = 202438		-- �l�H�̺��§�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721854	-- �l�H�̱�����

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV3( Option )

	local PlayerID = OwnerID()
	local PackageID = 202439		-- �H�t���§�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721855	-- �H�t������

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV4( Option )

	local PlayerID = OwnerID()
	local PackageID = 202440		-- �Z��R�����§�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721857	-- �Z��R��������

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV5( Option )

	local PlayerID = OwnerID()
	local PackageID = 202441		-- ��̤������§�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721858	-- ��̤���������

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV6( Option )

	local PlayerID = OwnerID()
	local PackageID = 202442		-- �������§�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721859	-- ����������

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV7( Option )

	local PlayerID = OwnerID()
	local PackageID = 202443		-- �Z��R���M��§�]
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721951	-- �Z��R��������
	local Item2 = 721952
	local Item3 = 721953
	local Item4 = 721954
	local Item5 = 721955
	local Item6 = 721956
	local Item7 = 721957

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
		GiveBodyItem( PlayerID , Item2 , 1 )
		GiveBodyItem( PlayerID , Item3 , 1 )
		GiveBodyItem( PlayerID , Item4 , 1 )
		GiveBodyItem( PlayerID , Item5 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item7 , 1 )
	end

end

function PK_Bag_LV8( Option )

	local PlayerID = OwnerID()
	local PackageID = 202444		-- ��̤����M��§�]
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721958	-- ��̤���������
	local Item2 = 721959
	local Item3 = 721960
	local Item4 = 721961
	local Item5 = 721962
	local Item6 = 721963
	local Item7 = 721964

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
		GiveBodyItem( PlayerID , Item2 , 1 )
		GiveBodyItem( PlayerID , Item3 , 1 )
		GiveBodyItem( PlayerID , Item4 , 1 )
		GiveBodyItem( PlayerID , Item5 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item7 , 1 )
	end

end

function PK_Bag_LV9( Option )

	local PlayerID = OwnerID()
	local PackageID = 202445		-- �����M��§�]
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721865	-- ����������
	local Item2 = 721866
	local Item3 = 721867
	local Item4 = 721868
	local Item5 = 721869
	local Item6 = 721870
	local Item7 = 721871

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
		GiveBodyItem( PlayerID , Item2 , 1 )
		GiveBodyItem( PlayerID , Item3 , 1 )
		GiveBodyItem( PlayerID , Item4 , 1 )
		GiveBodyItem( PlayerID , Item5 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item7 , 1 )
	end

end

function PKTitle_Bag_LV1( Option )

	local PlayerID = OwnerID()
	local PackageID = 202446		-- �]�ۺ�^§�]

	local Item1 = 530071	-- �]�ۺ�^

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PKTitle_Bag_LV2( Option )

	local PlayerID = OwnerID()
	local PackageID = 202447		-- ���̤��|§�]

	local Item1 = 530072	-- ���̤��|

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PKTitle_Bag_LV3( Option )

	local PlayerID = OwnerID()
	local PackageID = 202448		-- �v�ޤ���§�]

	local Item1 = 530353	-- �v�ޤ���

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end
