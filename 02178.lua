------------------------------------------------------------------------------
--2010/10/26
--��H���M����
	--���୸
	--1�ب��r�s���M: �ֻL���r�s
	--3�ظ˥Ұ\���M:���b�l�W�\�B�A�ж��\�B�ع��ռv�\
	--1�ثC�짤�M: �]�ۥ���
	--2�ةԤ�ߧ��M: �Ԥ�Ԥ�B�]�k�Ԥ�

--���H���M

------------------------------------------------------------------------------



------------------------------------------------------------------------------
--���M  207959   7�ѧֻL���r�s���M�]
------------------------------------------------------------------------------
function LuaI_207959( Option )
	local PlayerID = OwnerID()
	local PackageID = 207959		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208570 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  207960   30�ѧֻL���r�s���M�]
------------------------------------------------------------------------------
function LuaI_207960( Option )
	local PlayerID = OwnerID()
	local PackageID = 207960		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208571 , 1 )	
	end
end




------------------------------------------------------------------------------
--���M  209488   7���]�ۥ��짤�M�]
------------------------------------------------------------------------------
function LuaI_209488( Option )
	local PlayerID = OwnerID()
	local PackageID = 209488		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209485 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  209489   30���]�ۥ��짤�M�]
------------------------------------------------------------------------------
function LuaI_209489( Option )
	local PlayerID = OwnerID()
	local PackageID = 209489		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209486 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  207624   90���]�ۥ��짤�M�]
------------------------------------------------------------------------------
function LuaI_207624( Option )
	local PlayerID = OwnerID()
	local PackageID = 207624		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209490 , 1 )	
	end
end




------------------------------------------------------------------------------
--���M  209967   7�ѩԤ�Ԥ��M�]
------------------------------------------------------------------------------
function LuaI_209967( Option )
	local PlayerID = OwnerID()
	local PackageID = 209967		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209961 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  209968   30�ѩԤ�Ԥ��M�]
------------------------------------------------------------------------------
function LuaI_209968( Option )
	local PlayerID = OwnerID()
	local PackageID = 209968		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209962 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  209969   7���]�k�Ԥ��M�]
------------------------------------------------------------------------------
function LuaI_209969( Option )
	local PlayerID = OwnerID()
	local PackageID = 209967		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209964 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  209970   30���]�k�Ԥ��M�]
------------------------------------------------------------------------------
function LuaI_209970( Option )
	local PlayerID = OwnerID()
	local PackageID = 209970		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209965 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  240442   7�ѵ��b�l�W�\���M�]
------------------------------------------------------------------------------
function LuaI_240442( Option )
	local PlayerID = OwnerID()
	local PackageID = 240442		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240433 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  240443   30�ѵ��b�l�W�\���M�]
------------------------------------------------------------------------------
function LuaI_240443( Option )
	local PlayerID = OwnerID()
	local PackageID = 240443		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240434 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  240444   7�ѻA�ж��\���M�]
------------------------------------------------------------------------------
function LuaI_240444( Option )
	local PlayerID = OwnerID()
	local PackageID = 240444		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240436 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  240445   30�ѻA�ж��\���M�]
------------------------------------------------------------------------------
function LuaI_240445( Option )
	local PlayerID = OwnerID()
	local PackageID = 240445		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240437 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  240446   7�ѵع��ռv�\���M�]
------------------------------------------------------------------------------
function LuaI_240446( Option )
	local PlayerID = OwnerID()
	local PackageID = 240446		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240439 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  240447   30�ѵع��ռv�\���M�]
------------------------------------------------------------------------------
function LuaI_240447( Option )
	local PlayerID = OwnerID()
	local PackageID = 240447		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240440 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  240931  7�ѹ��L�������M�]
------------------------------------------------------------------------------
function LuaI_240931( Option )
	local PlayerID = OwnerID()
	local PackageID = 240931		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240928 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  240932   30�ѹ��L�������M�]
------------------------------------------------------------------------------
function LuaI_240932( Option )
	local PlayerID = OwnerID()
	local PackageID = 240932		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240929 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  240936   7�ѫխ߯T�理�M�]
------------------------------------------------------------------------------
function LuaI_240936( Option )
	local PlayerID = OwnerID()
	local PackageID = 240936		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240933 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  240937   30�ѫխ߯T�理�M�]
------------------------------------------------------------------------------
function LuaI_240937( Option )
	local PlayerID = OwnerID()
	local PackageID = 240937		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240934 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  241010   7�Ѳ`�W�f�q�����M�]
------------------------------------------------------------------------------
function LuaI_241010( Option )
	local PlayerID = OwnerID()
	local PackageID = 241010		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240916 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  241011   30�Ѳ`�W�f�q�����M�]
------------------------------------------------------------------------------
function LuaI_241011( Option )
	local PlayerID = OwnerID()
	local PackageID = 241011		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240917 , 1 )	
	end
end



------------------------------------------------------------------------------
--���M  241319   7�Ѳů��y�v�\���M�]
------------------------------------------------------------------------------
function LuaI_241319( Option )
	local PlayerID = OwnerID()
	local PackageID = 241319		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 241316 , 1 )	
	end
end



------------------------------------------------------------------------------
--���M  241320   30�Ѳů��y�v�\���M�]
------------------------------------------------------------------------------
function LuaI_241320( Option )
	local PlayerID = OwnerID()
	local PackageID = 241320		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 241317 , 1 )	
	end
end


