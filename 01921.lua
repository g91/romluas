------------------------------------------------------------------------------
--2010/06/02
--��H���M����
	--3�ؤ����M: �����i��B���������B�m������
	--1�خ��_: �������_
	--3�ئϾm: ���a�Ͼm�B�j�L�Ͼm�B����Ͼm
	--3�ذ\: ���I���\�B�y�]�\�B��]�\
	--1�غ�:�q���Ժ�
	--1���N��:���N�~
	--1�س���:�x�V����
--���H���M
	--���୸
	--���غ�: �H�S�Ժ�
	--���W��
	--2�ح���: ���F����B�]�୸��
------------------------------------------------------------------------------



------------------------------------------------------------------------------
--���M  207552   7�ѥ����i�觤�M�]
------------------------------------------------------------------------------
function LuaI_207552( Option )
	local PlayerID = OwnerID()
	local PackageID = 207552		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207509 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  207553   30�ѥ����i�觤�M�]
------------------------------------------------------------------------------
function LuaI_207553( Option )
	local PlayerID = OwnerID()
	local PackageID = 207553		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207510 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207554   7�Ѩ����������M�]
------------------------------------------------------------------------------
function LuaI_207554( Option )
	local PlayerID = OwnerID()
	local PackageID = 207554		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207512 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207555   30�Ѩ����������M�]
------------------------------------------------------------------------------
function LuaI_207555( Option )
	local PlayerID = OwnerID()
	local PackageID = 207555		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207513 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  207556   7�Ѷm���������M�]
------------------------------------------------------------------------------
function LuaI_207556( Option )
	local PlayerID = OwnerID()
	local PackageID = 207556		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207515 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207557   30�Ѷm���������M�]
------------------------------------------------------------------------------
function LuaI_207557( Option )
	local PlayerID = OwnerID()
	local PackageID = 207557		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207516 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207506   7�Ѻ������_���M�]
------------------------------------------------------------------------------
function LuaI_207506( Option )
	local PlayerID = OwnerID()
	local PackageID = 207506		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207525 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207507   30�Ѻ������_���M�]
------------------------------------------------------------------------------
function LuaI_207507( Option )
	local PlayerID = OwnerID()
	local PackageID = 207507		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207526 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207615   7�ѳ��a�Ͼm���M�]
------------------------------------------------------------------------------
function LuaI_207615( Option )
	local PlayerID = OwnerID()
	local PackageID = 207615		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207528 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207616   30�ѳ��a�Ͼm���M�]
------------------------------------------------------------------------------
function LuaI_207616( Option )
	local PlayerID = OwnerID()
	local PackageID = 207616		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207529 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207617   7�ѥj�L�Ͼm���M�]
------------------------------------------------------------------------------
function LuaI_207617( Option )
	local PlayerID = OwnerID()
	local PackageID = 207617		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207531 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207618   30�ѥj�L�Ͼm���M�]
------------------------------------------------------------------------------
function LuaI_207618( Option )
	local PlayerID = OwnerID()
	local PackageID = 207618		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207532 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207619   7�Ѱ���Ͼm���M�]
------------------------------------------------------------------------------
function LuaI_207619( Option )
	local PlayerID = OwnerID()
	local PackageID = 207619		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207534 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207620   30�Ѱ���Ͼm���M�]
------------------------------------------------------------------------------
function LuaI_207620( Option )
	local PlayerID = OwnerID()
	local PackageID = 207620		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207535 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207625   7�Ѵ��I���\���M�]
------------------------------------------------------------------------------
function LuaI_207625( Option )
	local PlayerID = OwnerID()
	local PackageID = 207625		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207537 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207626   30�Ѵ��I���\���M�]
------------------------------------------------------------------------------
function LuaI_207626( Option )
	local PlayerID = OwnerID()
	local PackageID = 207626		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207538 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207627   7���y�]�\���M�]
------------------------------------------------------------------------------
function LuaI_207627( Option )
	local PlayerID = OwnerID()
	local PackageID = 207627		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207540 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207628   30���y�]�\���M�]
------------------------------------------------------------------------------
function LuaI_207628( Option )
	local PlayerID = OwnerID()
	local PackageID = 207628		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207541 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207629   7����]�\���M�]
------------------------------------------------------------------------------
function LuaI_207629( Option )
	local PlayerID = OwnerID()
	local PackageID = 207629		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207543 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207630   30����]�\���M�]
------------------------------------------------------------------------------
function LuaI_207630( Option )
	local PlayerID = OwnerID()
	local PackageID = 207630		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207544 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207622   7�ѩH�S�Ժ����M�]
------------------------------------------------------------------------------
function LuaI_207622( Option )
	local PlayerID = OwnerID()
	local PackageID = 207622		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207501 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207623   30�ѩH�S�Ժ����M�]
------------------------------------------------------------------------------
function LuaI_207623( Option )
	local PlayerID = OwnerID()
	local PackageID =  207623		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207502 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207631   7�ѵ��F���৤�M�]
------------------------------------------------------------------------------
function LuaI_207631( Option )
	local PlayerID = OwnerID()
	local PackageID = 207631		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207546 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207632   30�ѵ��F���৤�M�]
------------------------------------------------------------------------------
function LuaI_207632( Option )
	local PlayerID = OwnerID()
	local PackageID =  207632		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207547 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  207633   7���]�୸�৤�M�]
------------------------------------------------------------------------------
function LuaI_207633( Option )
	local PlayerID = OwnerID()
	local PackageID = 207633		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207549 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207634   30���]�୸�৤�M�]
------------------------------------------------------------------------------
function LuaI_207634( Option )
	local PlayerID = OwnerID()
	local PackageID =  207634		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207550 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207561   7�ѵq���Ժ����M�]
------------------------------------------------------------------------------
function LuaI_207561( Option )
	local PlayerID = OwnerID()
	local PackageID = 207561		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207558 , 1 )	
	end
end


------------------------------------------------------------------------------
--���M  207562   30�ѵq���Ժ����M�]
------------------------------------------------------------------------------
function LuaI_207562( Option )
	local PlayerID = OwnerID()
	local PackageID =  207562		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207559 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  207504   7�ѥ��N�~���M�]
------------------------------------------------------------------------------
function LuaI_207504( Option )
	local PlayerID = OwnerID()
	local PackageID = 207504		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207563 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  207508   30�ѥ��N�~���M�]
------------------------------------------------------------------------------
function LuaI_207508( Option )
	local PlayerID = OwnerID()
	local PackageID = 207508		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207564 , 1 )	
	end
end



------------------------------------------------------------------------------
--���M  207505   7�ѷx�V�������M�]
------------------------------------------------------------------------------
function LuaI_207505( Option )
	local PlayerID = OwnerID()
	local PackageID = 207505		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207572 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  207621  30�ѷx�V�������M�]
------------------------------------------------------------------------------
function LuaI_207621( Option )
	local PlayerID = OwnerID()
	local PackageID = 207621		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207573 , 1 )	
	end
end