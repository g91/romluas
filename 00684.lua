function LuaI_MSG_PUBLIC()
	local hour = 0
	local min = 0
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	
	while 1 do
		hour = GetSystime(1)
		min = GetSystime(2)

	--	if GetSystime(1) == 11 and  GetSystime(2) == 30 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_1") ) --�Z��R���س]���ʱN��30������}�l�C
	--		end 
	--	end 
	--	if GetSystime(1) == 11 and  GetSystime(2) == 50 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_2") ) --�Z��R���س]���ʱN��10������}�l�C
	--		end
	--	end 
	--	if GetSystime(1) == 11 and  GetSystime(2) == 55 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_3") ) --�Z��R���س]���ʱN��5������}�l�C
	--		end 
	--	end 
	--	if GetSystime(1) == 12 and  GetSystime(2) == 0 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_4") ) --�Z��R���س]���ʤw�}�l�A�ЦV�Z��R���������߻�ǳ��W�C
	--		end 
	--	end 
	--	if GetSystime(1) == 12 and  GetSystime(2) == 50 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_5") ) --�Z��R���س]���ʱN��10�����ᵲ���A�Х������̺ɳt�^��Z��R�����C
	--		end 
	--	end
	--	if GetSystime(1) == 13 and  GetSystime(2) == 0 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_6") ) --�Z��R���س]���ʤw�g�����C
	--		end 	
	--	end 

		if GetSystime(1) == 17 and  GetSystime(2) == 30 then

		end 
		if GetSystime(1) == 17 and  GetSystime(2) == 50 then

		end 
		if GetSystime(1) == 17 and  GetSystime(2) == 55 then

		end 
		if GetSystime(1) == 18 and  GetSystime(2) == 0 then

		end 
		if GetSystime(1) == 19 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("SC_AMES_BORN") ) 		--�ȴ餧���E���F�j�q���������A�ިӤF�������F�u��̮R�v�C
			end
		end 
	--	if GetSystime(1) == 19 and  GetSystime(2) == 30 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_1") ) --�Z��R���س]���ʱN��30������}�l�C
	--		end
	--	end 
	--	if GetSystime(1) == 19 and  GetSystime(2) == 50 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_2") ) --�Z��R���س]���ʱN��10������}�l�C
	--		end
	--	end 
	--	if GetSystime(1) == 19 and  GetSystime(2) == 55 then
	--		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_3") ) --�Z��R���س]���ʱN��5������}�l�C
	--		end
	--	end 
		if GetSystime(1) == 20 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_4") ) --�Z��R���س]���ʤw�}�l�A�ЦV�Z��R���������߻�ǳ��W�C
				RunningMsg( OwnerID() , 2 ,  GetString("SC_AMES_CLEAR") ) 		--�H�ۮɶ������u�A������������֡A�������F�u��̮R�v���}�F�ȴ餧���C
			end
		end 
--		if GetSystime(1) == 20 and  GetSystime(2) == 50 then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_5") ) --�Z��R���س]���ʱN��10�����ᵲ���A�Х������̺ɳt�^��Z��R�����C
--			end
--		end
--		if GetSystime(1) == 21 and  GetSystime(2) == 0 then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_6") ) --�Z��R���س]���ʤw�g�����C
--			end
--		end 		
		if  ( hour == 21 and min  == 40 ) then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_1") )	-- ��{�j�Y�̪������s�}�l�������ʡC
			end
		end 
		if  ( hour == 21 and min  == 50 ) then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_2") )	-- ��{�j�Y�̪������s�}�l�������ʡA�ǰe���ɧY�N�}�ҡC
			end
		end 
		if  ( hour == 22 and min  == 0 ) then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_3") )	-- ��{�j�Y�����ɶ}�ҡA�����s�@��ӥX�I�I
			end
		end 
		if  ( hour == 0 and min  == 0 ) then
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_4") )	-- ��{�j�Y�������s�l���F�������A��^�_�A�ǰe���ɤw�g�����I�I
			end
		end 
--		if  ( hour == 17 and min  == 50 ) then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_LOVE_ACTION_1") )		-- �R�N���٫O�@��ʱN��10������}�l�C
--			end
--		end
--		if  ( hour == 18 and min  == 0 ) then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_LOVE_ACTION_2") )		-- �R�N���٫O�@��ʤw�}�l�A�ЦV�Z��R�����F�Ϫ�ù�K���W�C
--			end
--		end
--		if  ( hour == 19 and min  == 50 ) then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_LOVE_ACTION_3") )		-- �R�N���٫O�@��ʱN��10�����ᵲ���A�Х������̾��t�����C
--			end
--		end
--		if  ( hour == 20 and min  == 0 ) then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_LOVE_ACTION_4") )		-- �R�N���٫O�@��ʤw�g�����C
--			end
--		end
--		if (hour > 10  or hour < 23) and (min == 55) then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_111284_1") )	-- �t�����媺���ұN�b��������}��
--			end
--		end
--		if (hour > 11) and (min == 0) then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_111284_2") )	-- �Q�����t�����媺���a�Ч�������U�I
--			end
--		end
--		if (hour > 11) and (min == 40) then
--			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_111284_10") )	-- �t�����媺���Ҥw����
--			end
--		end
		sleep( 300 )

	end

end