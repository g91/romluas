--���ʰƥ�-�j�N���_
-----���y.���~


-- �j�N���_���լd����
function LuaI_206426( Option ) --�j�N���_���լd����
	local PlayerID = OwnerID()
	local PackageID = 206426		--�j�N���_���լd����
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if CheckFlag(PlayerID, 543406) == false then --�Lkeyitem
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_RESETTICKET2]" , C_SYSTEM )	--�A�ثe���ݭn���m���ƥ��C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_RESETTICKET2]"  , C_SYSTEM )
			return false
		elseif CheckFlag(PlayerID, 543406) == true then --��keyitem
			return true
		end

	elseif ( Option == "USE" ) then		
		SetFlag(PlayerID, 543406, 0) 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_RESETTICKET]" , C_SYSTEM )	--�A�{�b�i�H���s�D�ԥj�N���_���F�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_RESETTICKET]"  , C_SYSTEM )
	end
end


--�j�N���_�ĪG�d���զX
function Lua_206425_GET() --�R�B���l
	BeginPlot(  OwnerID()  , "Lua_mika_losttreasuredes03" , 0 )  
	sleep(30)
end

function Lua_206425USEAREA()--�j�N���_�ĪG�d���զX�P�_�ϰ�
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	if Zone == 355 then
		return true
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DAN_111700_37]",0)
		return false
	end	
end


function LuaI_206427( Option ) --�}���Z���t����b
	local PlayerID = OwnerID()
	local PackageID = 206427		--�}���Z���t����b
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725026 , 1 )	 --���_
	end
end

--���M�H��
function LuaI_206631( Option ) --�խ߹��L������w
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local item1 = CountBodyItem( PlayerID, 206631) 
	local item2 = CountBodyItem( PlayerID, 206632) 
	local item3 = CountBodyItem( PlayerID, 206633) 
	local item4 = CountBodyItem( PlayerID, 206634) 
	local item5 = CountBodyItem( PlayerID, 206635) 

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			return false
		elseif item1 >= 1 and item2 >=1 and item3 >=1 and item4 >=1 and item5 >=1 then
			DelBodyItem( PlayerID, 206632, 1) 
			DelBodyItem( PlayerID, 206633, 1) 
			DelBodyItem( PlayerID, 206634, 1) 
			DelBodyItem( PlayerID, 206635, 1) 
			return true
		else
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_0908SEANSON_26]" ,0  )--�A�ҫ������~�ƶq�����C
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_0908SEANSON_26]" ,0  )--�A�ҫ������~�ƶq�����C
			return false
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID ,206560 , 1 )	 --���M
	end
end

function LuaI_206636( Option ) --�a�����L������w
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local item1 = CountBodyItem( PlayerID, 206636) 
	local item2 = CountBodyItem( PlayerID, 206637) 
	local item3 = CountBodyItem( PlayerID, 206638) 
	local item4 = CountBodyItem( PlayerID, 206639) 
	local item5 = CountBodyItem( PlayerID, 206640) 
	local item6 = CountBodyItem( PlayerID, 206641)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			return false
		elseif item1 >= 1 and item2 >=1 and item3 >=1 and item4 >=1 and item5 >=1 and item6 >=1 then
			DelBodyItem( PlayerID, 206637, 1) 
			DelBodyItem( PlayerID, 206638, 1) 
			DelBodyItem( PlayerID, 206639, 1) 
			DelBodyItem( PlayerID, 206640, 1) 
			DelBodyItem( PlayerID, 206641, 1) 
			return true
		else
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_0908SEANSON_26]" ,0  )--�A�ҫ������~�ƶq�����C
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_0908SEANSON_26]" ,0  )--�A�ҫ������~�ƶq�����C
			return false
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID ,206572 , 1 )	 --���M
	end
end

--���y�_�c���~(�Mnpc�I��)
function LuaI_206428( Option ) --�j���_�c
	local PlayerID = OwnerID()
	local PackageID = 206428		--�j���_�c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725010 , 1 )	 --���_
	end
end

function LuaI_206429( Option ) --�B�A�_�c
	local PlayerID = OwnerID()
	local PackageID = 206429		--�B�A�_�c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725051 , 1 )	 --���_
	end
end

function LuaI_206430( Option ) --�B�A�_�c
	local PlayerID = OwnerID()
	local PackageID = 206430		--�B�A�_�c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725013 , 1 )	 --���_
	end
end

function LuaI_206431( Option ) --�I�]�Ŷ�����Ѩ�
	local PlayerID = OwnerID()
	local PackageID = 206431		--�I�]�Ŷ�����Ѩ�
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725025 , 1 )	 --���_
	end
end