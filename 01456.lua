function LuaN_mika_09summerlove_cast() --�����ܸ`�s���� ���󲣥ͼ@�� ���ê���
	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		Sleep(300)
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�		
		if ZoneID <= 1000 then
			if  min == 0 then  -- ���I
			RunningMsg( OwnerID() , 2 , "[SC_0908SEANSON_CAST]" )
			--�u���ܸ`���ʶ}�l�o�I�b�Z��R�������U��ϥX�{�F�R�o�ê��p�c�]�A�A�n������L�c�@�@�A�٬O��ܨ�U��Ϫ��p�Ѩϫ�_���R�O�H
			end
		end
	end
end