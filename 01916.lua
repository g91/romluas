------------------------------------------------------------------------------------------------------------
--2010/07/02
------------------------------------------------------------------------------------------------------------

Function LuaI_207135() --�褧�ӫ���ҮM�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 203065 ,1, 221576 ,1, 203576 ,1 , 220251 , 1 , 220859 , 1 , 220293 , 1 } }
	return BaseTressureProc6( itemset , 6 )
end


Function LuaI_207136() --�褧�ӫ��֥ҮM�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 203065 ,1, 221576 ,1, 203576 ,1 , 220670 , 1 , 220643 , 1 , 210401 , 1 }	 }
	return BaseTressureProc6(   itemset , 6  )
end


Function LuaI_207137() --�褧�ӫ�����M�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 203065 ,1, 221576 ,1, 203576 ,1 , 220376 , 1 ,220344 , 1 ,220438 , 1}	 }
	return BaseTressureProc6(   itemset , 6  )
end


Function LuaI_207138() --���_���]����M�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  203576 ,1 , 223802 , 1 , 223805 , 1  , 223804 , 1  , 223759 , 1  , 223803 , 1}	 }
	return BaseTressureProc6(   itemset , 6  )
end


Function LuaI_207139() --���_���]����M�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  203576 ,1 , 223450 , 1 , 223451 , 1 , 223452 , 1 , 223456 , 1  , 223455 , 1  }	 }
	return BaseTressureProc6(   itemset , 6  )
end


Function LuaI_207140() --���_���]��ҮM�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  203576 ,1 , 223457 , 1 , 223462 , 1 , 223459 , 1, 223458 , 1 , 223461 , 1 , 223457 , 1  , 223462 , 1 , 223459 , 1 ,  223458 , 1, 223461 , 1 }	 }
	return BaseTressureProc6(   itemset , 6  )
end


Function LuaI_207141() --���_���]�Z�ҮM�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  203576 ,1, 223808 , 1 , 223807 , 1 , 223811 , 1 , 223809 , 1 , 223812 , 1}	 }
	return BaseTressureProc6(   itemset , 6  )
end

------------------------------------------------------------------------------------------------------------
--2010/08/31
------------------------------------------------------------------------------------------------------------
Function LuaI_208229() --�����̧���M�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  224359 ,1 , 224366 , 1 , 225129 , 1 , 224360 , 1 , 225130 , 1 , 203065 , 1 , 221365 , 1 , 220768 , 1  }	 }
	return BaseTressureProc6(   itemset , 8  )
end

Function LuaI_208230() --�������M�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  225132 ,1 , 225131 , 1 , 224361 , 1 , 225133 , 1 , 224364 , 1 , 203065 , 1 , 221365 , 1 , 220768 , 1  }	 }
	return BaseTressureProc6(   itemset , 8  )
end

Function LuaI_208231() --�����t�T�M�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  224358 ,1 , 224352 , 1 , 224356 , 1 , 224357 , 1 , 224354 , 1 , 203065 , 1 , 221365 , 1 , 220768 , 1  }	 }
	return BaseTressureProc6(   itemset , 8  )
end

Function LuaI_208232() --�����D��M�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  224367 ,1 , 224373 , 1 , 224369 , 1 , 224368 , 1 , 224372 , 1 , 203065 , 1 , 221365 , 1 , 220768 , 1  }	 }
	return BaseTressureProc6(   itemset , 8  )
end

Function LuaI_208233() --�����೽���M�˲�

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, {  224374 ,1 , 224380 , 1 , 224376 , 1 , 224375 , 1 , 224379 , 1 , 203065 , 1 , 221365 , 1 , 220768 , 1  }	 }
	return BaseTressureProc6(   itemset , 8  )
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
function BaseTressureProc6(   itemset  , maxprizecount )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�

	for i = 1 , table.getn( itemset ),3 do

		--�ˬd�O�_�����			
		if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
			return false
		end
		
		for j = 1 , table.getn( itemset[i+2] ) ,2 do
		--	GiveBodyItem( OwnerID() , itemset[i+2][j] , itemset[i+2][j+1 ] )
			GiveBodyItemEX( OwnerID() , itemset[i+2][j] , itemset[i+2][j+1 ] , 0 , 0 , 0 , 0 , 0 , 0 )
		--	GiveBodyItemEX( OwnerID() , 220251 , 1 , 0 , 0 , 0 , 0 ,0 , 0 )	-- OrgID , ���~ , ���| , �}��(25��1�}�B100��4�})�B�ݩ�1�B�ݩ�2�B�ݩ�3�B�ݩ�4�B�ݩ�5
		--	GiveBodyItemEX( OwnerID() , 220859 , 1 , 0 , 0 , 0 , 0 ,0 , 0 )
		--	GiveBodyItemEX( OwnerID() , 220293 , 1 , 0 , 0 , 0 , 0 ,0 , 0 )
		end
	
		if itemset[i+1] ~= "" then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 , itemset[i+1] )
			end
		end
		return true;
	end
	
	return false;
end