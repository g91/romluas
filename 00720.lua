function ComboServer_Bag_LV1( Option )

	local PlayerID = OwnerID()
	local PackageID = 202436		-- �߰��d���]
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 201095	-- ���֪Z����
	local Item2 = 201097	-- ���ָ˳ƥ�
	local Item3 = 201969	-- ���H�l���
	local Item4 = 201700	-- �@�ѥհ����M
	local Item5 = 221576	-- ��ťͩR�@��
	local Item6 = 201103	-- �y�аO�иH��

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 5 )
		GiveBodyItem( PlayerID , Item2 , 5 )
		GiveBodyItem( PlayerID , Item3 , 1 )
		GiveBodyItem( PlayerID , Item4 , 1 )
		GiveBodyItem( PlayerID , Item5 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
	end

end
