function LuaI_110989_1()
	local Name = GetName( OwnerID() ) 
	local String = "[SAY_110989_0][$SETVAR1="..Name.."]"--���\���N�q���B�e�^�ӡI
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if CheckBuff( OwnerID() ,501603 ) == true or CheckBuff( OwnerID() ,502168 ) == true  or  CheckBuff( OwnerID() ,502169 ) == true  or  CheckBuff( OwnerID() ,502170 ) == true  or  CheckBuff( OwnerID() ,502171 ) == true  or  CheckBuff( OwnerID() ,502172 ) == true  or  CheckBuff( OwnerID() ,502173 ) == ture then
		if  GetSystime( 1 ) == 12 or GetSystime( 1 ) == 20 then  --�ɶ������������� 
			if CheckBuff( OwnerID() ,501603 ) == true then 
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 6000 ) 
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 501603 ) --����BUFF
			elseif CheckBuff( OwnerID() ,502168 ) == true  then  --�ɶ������������� then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 7200 ) 
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502168 ) --����BUFF
			elseif CheckBuff( OwnerID() ,502169 ) == true then  --�ɶ������������� then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 10500 ) 
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502169 ) --����BUFF
			elseif CheckBuff( OwnerID() ,502170 ) == true then  --�ɶ������������� then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 14400 ) 
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502170 ) --����BUFF
			elseif CheckBuff( OwnerID() ,502171 ) == true then  --�ɶ������������� then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 17100 ) 
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502171 ) --����BUFF
			elseif CheckBuff( OwnerID() ,502172 ) == true then  --�ɶ������������� then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 20000) 
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502172 ) --����BUFF
			elseif CheckBuff( OwnerID() ,502173 ) == true then  --�ɶ������������� then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 20000 ) 
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502173 ) --����BUFF
			end
		else --�W�L�ɶ��^�Ӫ��T��
		CancelBuff( OwnerID() , 501603 ) --����BUFF
		CancelBuff( OwnerID() , 502168 ) --����BUFF
		CancelBuff( OwnerID() , 502169 ) --����BUFF
		CancelBuff( OwnerID() , 502170 ) --����BUFF
		CancelBuff( OwnerID() , 502171 ) --����BUFF
		CancelBuff( OwnerID() , 502172 ) --����BUFF
		CancelBuff( OwnerID() , 502173 ) --����BUFF
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_110989_1"), 0 ); --�����b���񦹦a�ɬ�M�Ƭ��ǹХ|���A�ݨӧA�S��b�ɶ�����F�C
		end
	end
end