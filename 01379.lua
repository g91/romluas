------------------------------------------------------------------------------
--�d���c  �ä[�����_�_�d���c  204821
------------------------------------------------------------------------------
function LuaI_miyon_petbox01( Option )
	local PlayerID = OwnerID()
	local PackageID = 204821		--�ä[�����_�_�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203230 , 1 )	 --�ä[�����_�_�d���J
	end
end
-------------------------------------------------------------------------------
--�d���c  �ä[�n���_�_�d���c  204822
------------------------------------------------------------------------------
function LuaI_miyon_petbox02( Option )
	local PlayerID = OwnerID()
	local PackageID = 204822		--�ä[�n���_�_�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203229 , 1 )	 --�ä[�n���_�_�d���J
	end
end
-------------------------------------------------------------------------------
--�d���c  �ä[���`�_�_�d���c  204823
------------------------------------------------------------------------------
function LuaI_miyon_petbox03( Option )
	local PlayerID = OwnerID()
	local PackageID = 204823		--�ä[���`�_�_�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203241 , 1 )	 --�ä[���`�_�_�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  �ä[���T�_�_�d���c  204824
------------------------------------------------------------------------------
function LuaI_miyon_petbox04( Option )
	local PlayerID = OwnerID()
	local PackageID = 204824		--�ä[���T�_�_�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203243 , 1 )	 --�ä[���T�_�_�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  7�Ѥp���H�d���c  204817
------------------------------------------------------------------------------
function LuaI_miyon_petbox05( Option )
	local PlayerID = OwnerID()
	local PackageID = 204817		--7�Ѥp���H�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203227 , 1 )	 --7�Ѥp���H�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  �ä[�p���H�d���c  204818
------------------------------------------------------------------------------
function LuaI_miyon_petbox05_2( Option )
	local PlayerID = OwnerID()
	local PackageID = 204818		--�ä[�p���H�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203228 , 1 )	 --�ä[�p���H�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  �ä[�����L�d���c  204819
------------------------------------------------------------------------------
function LuaI_miyon_petbox06( Option )
	local PlayerID = OwnerID()
	local PackageID = 204819		--�ä[�����L�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203242 , 1 )	 --�ä[�����L�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  �ä[����y�y�d���c  204820
------------------------------------------------------------------------------
function LuaI_miyon_petbox07( Option )
	local PlayerID = OwnerID()
	local PackageID = 204820		--�ä[����y�y�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203244 , 1 )	 --�ä[����y�y�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  �ä[���y�y�d���c  203275
------------------------------------------------------------------------------
function LuaI_miyon_petbox08( Option )
	local PlayerID = OwnerID()
	local PackageID = 203275		--�ä[���y�y�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203245 , 1 )	 --�ä[���y�y�d���J
	end
end
-------------------------------------------------------------------------------
--�d���c  �ä[�¥ֽ��d���c 203284
------------------------------------------------------------------------------
function LuaI_miyon_petbox09( Option )
	local PlayerID = OwnerID()
	local PackageID = 203284		--�ä[�¥ֽ��d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203273 , 1 )	 --�ä[�¥ֽ��d���J
	end
end
-------------------------------------------------------------------------------
--�d���c  �ä[�n�ʩ��d���c 204782
------------------------------------------------------------------------------
function LuaI_miyon_petbox10( Option )
	local PlayerID = OwnerID()
	local PackageID = 204782		--�ä[�n�ʩ��d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203274 , 1 )	 --�ä[�n�ʩ��d���J
	end
end
-------------------------------------------------------------------------------
--�d���c  30�ѥզϦu���_�_�d���c 205678
------------------------------------------------------------------------------
function LuaI_205678box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205678		--30�ѥզϦu���_�_�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 205676 , 1 )	 --30�ѥզϦu���_�_�d���J
	end
end
-------------------------------------------------------------------------------
--�d���c  7�ѥզϦu���_�_�d���c 205679
------------------------------------------------------------------------------
function LuaI_205679box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205679		--7�ѥզϦu���_�_�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 205677 , 1 )	 --7�ѥզϦu���_�_�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  7�ѻ�F�Ԧ��~�d���c 206178
------------------------------------------------------------------------------
function LuaI_206178box( Option )
	local PlayerID = OwnerID()
	local PackageID = 206178		--7�ѻ�F�Ԧ��~�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206175 , 1 )	 --7�ѻ�F�Ԧ��~�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  30�ѻ�F�Ԧ��~�d���c 206179
------------------------------------------------------------------------------
function LuaI_206179box( Option )
	local PlayerID = OwnerID()
	local PackageID = 206179		--30�ѻ�F�Ԧ��~�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206176 , 1 )	 --30�ѻ�F�Ԧ��~�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  7�Ѷ����b�k�d���c 206025
------------------------------------------------------------------------------
function LuaI_206025box( Option )
	local PlayerID = OwnerID()
	local PackageID = 206025		--7�Ѷ����b�k�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206022 , 1 )	 --7�Ѷ����b�k�d���J
	end
end
------------------------------------------------------------------------------
--�d���c  30�Ѷ����b�k�d���c 206252
------------------------------------------------------------------------------
function LuaI_206252box( Option )
	local PlayerID = OwnerID()
	local PackageID = 206252		--30�Ѷ����b�k�d���c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206023 , 1 )	 --30�Ѷ����b�k�d���J
	end
end
------------------------------------------------------------------------------
--2010.03.23 �w��ӫ��d

function LuaI_207095( Option )
	local PlayerID = OwnerID()
	local PackageID = 207095		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207089 , 1 )	
	end
end

function LuaI_207096( Option )
	local PlayerID = OwnerID()
	local PackageID = 207096		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207090 , 1 )	
	end
end

function LuaI_207097( Option )
	local PlayerID = OwnerID()
	local PackageID = 207097		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207092 , 1 )	
	end
end

function LuaI_207098( Option )
	local PlayerID = OwnerID()
	local PackageID = 207098		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207093 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  7�Ѫ��൳�_�_�d���c 207731
------------------------------------------------------------------------------
function LuaI_207731( Option )
	local PlayerID = OwnerID()
	local PackageID = 207731		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207099 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  30�Ѫ��൳�_�_�d���c 207732
------------------------------------------------------------------------------
function LuaI_207732( Option )
	local PlayerID = OwnerID()
	local PackageID = 207732		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207100 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  7�Ѽ��a���L���d���c 207733
------------------------------------------------------------------------------
function LuaI_207733( Option )
	local PlayerID = OwnerID()
	local PackageID = 207733		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207102 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  30�Ѽ��a���L���d���c 207734
------------------------------------------------------------------------------
function LuaI_207734( Option )
	local PlayerID = OwnerID()
	local PackageID = 207734		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207103 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  7�Ѷ¥ղy�_�d���c 207105
------------------------------------------------------------------------------
function LuaI_207105( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_207105		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207708 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  30�Ѷ¥ղy�_�d���c 207106
------------------------------------------------------------------------------
function LuaI_207106( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_207106		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207709 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  7�ѦB���_�_�d���c 208456
------------------------------------------------------------------------------
function LuaI_208456( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208456		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208453 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  30�ѦB���_�_�d���c 208457
------------------------------------------------------------------------------
function LuaI_208457( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208457		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208454 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  7�ѳ��H���_�_�d���c 208464
------------------------------------------------------------------------------
function LuaI_208464( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208464		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208458 , 1 )	
	end
end

------------------------------------------------------------------------------
--�d���c  30�ѳ��H���_�_�d���c 208465
------------------------------------------------------------------------------
function LuaI_208465( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208465		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208459 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  7�Ѥp����H�d���c 208466
------------------------------------------------------------------------------
function LuaI_208466( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208466		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208461 , 1 )	
	end
end


------------------------------------------------------------------------------
--�d���c  30�Ѥp����H�d���c 208467
------------------------------------------------------------------------------
function LuaI_208467( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208467		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208462 , 1 )	
	end
end