------------��������240747_�ϥΫ����----------------------------------------------------------------------------------------
function Lua_ying_thanksgiving_usegift()

	local Player = OwnerID()

	Lua_Hao_Set_GuildResources( Player ,  0 , 200 , 1500 , 1500 , 1500 , 400 ,  10 )	-- �W�[���|�귽
	-- ����B���p�B�q���B����B�į�B�]����ءB���̮֤�
end
-------��������240747_�ϥΫe�ˬd--------------------------------------------------------------------------------------------
function Lua_ying_thanksgiving_240747chk()

	local Player = OwnerID()
	local ZoneID =  ReadRoleValue( Player , EM_RoleValue_ZoneID )  --�Y���y3 �h��3401
	local MyZone = ZoneID -1000*math.floor( ZoneID / 1000 ) --3401-1000*�L����˥h(3401/1000) = 401

	if MyZone == 401 then --���|����
		return true
	else
		ScriptMessage( Player , Player , 1 , "[SC_THANKS_2011_24]" , 0 ) --�����~�u�i�b���|�������ϥΡI
		return false
	end
end