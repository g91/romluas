function LuaYU_tonytony_0()

	local Oil =  CountBodyItem( OwnerID() , 203466 )  --�ƷȷȪ��ުo
	local Oil2 =  CountBodyItem( OwnerID() , 203475 )  --�S�սުo���G

	local Gola =  CountBodyItem( OwnerID() , 530368 ) --���Ӻٸ�

	local Save01 =  CheckFlag( OwnerID()  , 542163 ) --�ٸ�����
	local Save02 =  CheckFlag( OwnerID()  , 542164 )
	local Save03 =  CheckFlag( OwnerID()  , 542165 )
	local Save04 =  CheckFlag( OwnerID()  , 542166 )
	local Save05 =  CheckFlag( OwnerID()  , 542167 )
	local Save06 =  CheckFlag( OwnerID()  , 542168 )
	local Save07 =  CheckFlag( OwnerID()  , 542169 )
	local Save08 =  CheckFlag( OwnerID()  , 542170 )
	local Save09 =  CheckFlag( OwnerID()  , 542171 )
	local Save10 =  CheckFlag( OwnerID()  , 542172 )


	local daySave01 =  CheckFlag( OwnerID()  , 542232 ) --�C�魫�m
	local daySave02 =  CheckFlag( OwnerID()  , 542233 )
	local daySave03 =  CheckFlag( OwnerID()  , 542234 )
	local daySave04 =  CheckFlag( OwnerID()  , 542235 )
	local daySave05 =  CheckFlag( OwnerID()  , 542236 )
	local daySave06 =  CheckFlag( OwnerID()  , 542237 )
	local daySave07 =  CheckFlag( OwnerID()  , 542238 )
	local daySave08 =  CheckFlag( OwnerID()  , 542239 )
	local daySave09 =  CheckFlag( OwnerID()  , 542240 )
	local daySave10 =  CheckFlag( OwnerID()  , 542241 )

	local Oilsearch =  CheckFlag( OwnerID()  , 542243 ) --���a�@�N�����o
	local SelfSave =  CheckFlag( OwnerID()  , 542242 ) --����ڦۤv��

	local ZoneID = math.mod( ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID ), 1000);

	local Xcount =  4
	local Ycount =  3
	local Zcount =  3

	if daySave01 == true then
		Xcount = Xcount -1
	end

	if daySave02 == true then
		Xcount = Xcount -1
	end

	if daySave03 == true then
		Xcount = Xcount -1
	end

	if daySave04 == true then
		Xcount = Xcount -1
	end

	if daySave05 == true then
		Zcount = Zcount -1
	end

	if daySave06 == true then
		Zcount = Zcount -1
	end

	if daySave07 == true then
		Zcount = Zcount -1
	end

	if daySave08 == true then
		Ycount = Ycount -1
	end

	if daySave09 == true then
		Ycount = Ycount -1
	end

	if daySave10 == true then
		Ycount = Ycount -1
	end


		if Gola == 1 and  Save01 == true and Save02 == true and Save03 == true and Save04 == true and Save05 == true and Save06 == true and Save07 == true and Save08 == true and Save09 == true and Save10 == true then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_00")   )  --�A�ӼF�`�F�I�����Ũ����̥����A�����Q��ϤF�O�I�ݨ�A�_�ݦ�����{�A�ڤ]�۫H�A�|���I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_01") , "LuaYU_tonytony_1", 0 ) --������

		elseif  Save01 == true and Save02 == true and Save03 == true and Save04 == true and Save05 == true and Save06 == true and Save07 == true and Save08 == true and Save09 == true and Save10 == true then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_02")   )  --�A�ӼF�`�F�I�����Ũ����̥��������Q��ϤF�O�I�ݨ�A�_�ݦ�����{�A���D...�A�u���|���I�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_01") , "LuaYU_tonytony_2", 0 ) --������

		elseif  Gola == 1  and  daySave01 == true and daySave02 == true and daySave03 == true and daySave04 == true and daySave05 == true and daySave06 == true and daySave07 == true and daySave08 == true and daySave09 == true and daySave10 == true then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_03")   )  --���§A��I�����Ũ������L�n�}�l��ΤF�A���M���~�A�d�b�ϧw§���e�����p�B�ͷ|���檺�O�I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_32") , "LuaYU_tonytony_11", 0 ) --�e��ù����
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_33") , "LuaYU_tonytony_12", 0 ) --�e�����r��
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_37") , "LuaYU_tonytony_14", 0 ) --�e�����U�ҥ����
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_34") , "LuaYU_tonytony_13", 0 ) --�^�����s��
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --�T�w(�������)

		elseif Oilsearch == false and Oil >= 0 and  SelfSave == false and daySave01 == false and daySave02 == false and daySave03 == false and daySave04 == false and daySave05 == false and daySave06 == false and daySave07 == false and daySave08 == false and daySave09 == false and daySave10 == false then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_04")   )  --��...�i�H�ЧA���Ӧ���...���~�V�ѤӧN�F...�����Ũ����̦h��F���~�M...���G���ϧw�e§�����ɭ�...�N...�N�d�b�W���U���ӤF�աI��...�L�̲{�b�����L�A���n��������������n�ܡH
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_3", 0 ) --�]�b�ڨ��W

		elseif Oilsearch == true and Oil == 0 and Oil2 == 0 and  SelfSave == false  then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_13")   )  --�ڷQ�i��ݭn�@�Ǽ�ƪo�~���������Ũ����ƤU��...�n�h���̧�o�r�I�H�o...�o...�ڡI�ުo�I�i�H�ЧA�q[100061]���W���@��[203466]�ӶܡI�ڷQ�Ҧ��������ӳ����a�I10���A10�����ӴN�i�H�F�I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_6", 0 ) --�]�b�ڨ��W(�������)

		elseif Oilsearch == true and Oil < 10 and Oil > 0 and Oil2 == 0 and  SelfSave == false  then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_06")   )  --�z�I�A����ުo�F�I���O�ƶq�n�����Ӱ��C...
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --�T�w(�������)


		elseif Oilsearch == true and Oil >= 10 and SelfSave == false then

			if Xcount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_07") .. GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --�z�I�A����ުo�F�C�I�Ӧn�F�I�o���I�⥲���Ũ����ϤU�Ӥ~��I���i�H��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_08") , "LuaYU_tonytony_4", 0 ) --���@�e���ϴ�
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_09") , "LuaYU_tonytony_5", 0 ) --������I�ުo
			elseif Ycount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_07") .. GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --�z�I�A����ުo�F�C�I�Ӧn�F�I�o���I�⥲���Ũ����ϤU�Ӥ~��I���i�H��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_08") , "LuaYU_tonytony_4", 0 ) --���@�e���ϴ�
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_09") , "LuaYU_tonytony_5", 0 ) --������I�ުo

			elseif Zcount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_07") .. GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --�z�I�A����ުo�F�C�I�Ӧn�F�I�o���I�⥲���Ũ����ϤU�Ӥ~��I���i�H��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_08") , "LuaYU_tonytony_4", 0 ) --���@�e���ϴ�
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_09") , "LuaYU_tonytony_5", 0 ) --������I�ުo
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_07") .. GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --�z�I�A����ުo�F�C�I�Ӧn�F�I�o���I�⥲���Ũ����ϤU�Ӥ~��I���i�H��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_08") , "LuaYU_tonytony_4", 0 ) --���@�e���ϴ�
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_09") , "LuaYU_tonytony_5", 0 ) --������I�ުo
			end

		elseif Oil2 >= 1 and SelfSave == false then

			if Xcount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --�z�I�A����ުo�F�C�I�Ӧn�F�I�o���I�⥲���Ũ����ϤU�Ӥ~��I���i�H��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --�T�w(�������)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --�Ʊ�e���O�B�ϴ�
			elseif Ycount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --�z�I�A����ުo�F�C�I�Ӧn�F�I�o���I�⥲���Ũ����ϤU�Ӥ~��I���i�H��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --�T�w(�������)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --�Ʊ�e���O�B�ϴ�
			elseif Zcount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --�z�I�A����ުo�F�C�I�Ӧn�F�I�o���I�⥲���Ũ����ϤU�Ӥ~��I���i�H��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --�T�w(�������)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --�Ʊ�e���O�B�ϴ�
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --�z�I�A����ުo�F�C�I�Ӧn�F�I�o���I�⥲���Ũ����ϤU�Ӥ~��I���i�H��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --�T�w(�������)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --�Ʊ�e���O�B�ϴ�
			end


		elseif SelfSave == true then

			if ZoneID == 1 or ZoneID == 4 or ZoneID == 5 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_10")   )  --���§A����U�A�p�G���ѥ����Ũ����S�d����...�Ʊ�A�ٯ��������I
				--AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_6", 0 ) --�]�b�ڨ��W(�������)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_34") , "LuaYU_tonytony_13", 0 ) --�^�����s��
			else

				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_10")   )  --���§A����U�A�p�G���ѥ����Ũ����S�d����...�Ʊ�A�ٯ��������I
				--AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_6", 0 ) --�]�b�ڨ��W(�������)
			end

		elseif Oilsearch == false and SelfSave == false then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_04")   )  --��...�i�H�ЧA���Ӧ���...���~�V�ѤӧN�F...�����Ũ����̦h��F���~�M...���G���ϧw�e§�����ɭ�...�N...�N�d�b�W���U���ӤF�աI��...�L�̲{�b�����L�A���n��������������n�ܡH
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_3", 0 ) --�]�b�ڨ��W

		else
			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_04")   )  --��...�i�H�ЧA���Ӧ���...���~�V�ѤӧN�F...�����Ũ����̦h��F���~�M...���G���ϧw�e§�����ɭ�...�N...�N�d�b�W���U���ӤF�աI��...�L�̲{�b�����L�A���n��������������n�ܡH
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_3", 0 ) --�]�b�ڨ��W
		end






--				SetFlag( OwnerID()  , 542154 , 1 )  --�S���L���X��



end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_1()

	Local Playername = GetName( OwnerID() ) 

	if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then
		
		local Playername = "|cffffff20"..GetName( OwnerID() ).."|r"
		local str = "[SC_111584_YU_11][$SETVAR1="..Playername.."]"

		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_00")   )  --�A�ӼF�`�F�I�����Ũ����̥����A�����Q��ϤF�O�I�ݨ�A�_�ݦ�����{�A�ڤ]�۫H�A�|���I

		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 2 ,  Str )--XXX�A���@�ϤF�Ҧ��d�b�ϧw�̪������Ũ����A�L�O�x�V�`���^���I
		end
		
		sleep(10)
		GiveBodyItem( OwnerID() ,  203468  , 1 ) --�p����§��
		sleep(10)
		GiveBodyItem( OwnerID() ,  203467  , 1 ) --�p�����a�L
		sleep(10)
		SetFlag( OwnerID()  , 542163 , 0 )
		SetFlag( OwnerID()  , 542164 , 0 )
		SetFlag( OwnerID()  , 542165 , 0 )
		SetFlag( OwnerID()  , 542166 , 0 )
		SetFlag( OwnerID()  , 542167 , 0 )
		SetFlag( OwnerID()  , 542168 , 0 )
		SetFlag( OwnerID()  , 542169 , 0 )
		SetFlag( OwnerID()  , 542170 , 0 )
		SetFlag( OwnerID()  , 542171 , 0 )
		SetFlag( OwnerID()  , 542172 , 0 )

	else
		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
	end


--"[$VAR2]�@�ϤF�Ҧ��d�b�ϧw�̪������Ũ����A�L�O�x�V�`���^���I"
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_2()

	if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then

--		local Playername = "|cffff00ff"..GetName( OwnerID() ).."|r"
		local Playername = "|cffffff20"..GetName( OwnerID() ).."|r"
		local str = "[SC_111584_YU_12][$SETVAR1="..Playername.."]"


		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_02")   )  --�A�ӼF�`�F�I�����Ũ����̥��������Q��ϤF�O�I�ݨ�A�_�ݦ�����{�A���D...�A�u���|���I�H
		sleep(10)
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 2 ,  Str ) --XXX�@�ϤF�Ҧ��d�b�ϧw�̪������Ũ����A�L�O�x�V�`���^���I
		end
		sleep(10)
		GiveBodyItem( OwnerID() ,  203468  , 1 ) --�p����§��
		sleep(10)
		GiveBodyItem( OwnerID() ,  203467  , 1 ) --�p�����a�L
		sleep(10)
		GiveBodyItem( OwnerID() ,  530368  , 1 ) --�ٸ�
		SetFlag( OwnerID()  , 542163 , 0 )
		SetFlag( OwnerID()  , 542164 , 0 )
		SetFlag( OwnerID()  , 542165 , 0 )
		SetFlag( OwnerID()  , 542166 , 0 )
		SetFlag( OwnerID()  , 542167 , 0 )
		SetFlag( OwnerID()  , 542168 , 0 )
		SetFlag( OwnerID()  , 542169 , 0 )
		SetFlag( OwnerID()  , 542170 , 0 )
		SetFlag( OwnerID()  , 542171 , 0 )
		SetFlag( OwnerID()  , 542172 , 0 )

	else
		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
	end


end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_3()

	SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_13")   )  --�ڷQ�i��ݭn�@�Ǽ�ƪo�~���������Ũ����ƤU��...�n�h���̧�o�r�I�H�o...�o...�ڡI�ުo�I�i�H�ЧA�q[100061]���W���@��[203466]�ӶܡI�ڷQ�Ҧ��������ӳ����a�I10���A10�����ӴN�i�H�F�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_6", 0 ) --�]�b�ڨ��W(�������)
	SetFlag( OwnerID()  , 542243 , 1 )


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_4()

	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_36")   )  --���N�·ЧA�F
		sleep(10)
		DelBodyItem( OwnerID() , 203466 , 10 ) --�ƷȽުo
		GiveBodyItem( OwnerID() ,  203475  , 10 ) --�S�սުo���G
		sleep(10)		
		SetFlag( OwnerID()  , 542243 , 0 )
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --�T�w(�������)
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --�Ʊ�e���O�B�ϴ�
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
	end

end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_5()

	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_15")   )  --���§A����U�A���o�����ӴN�����F�a�I�ڷ|��A���j�W�i�D�����Ũ����̪��I���§A��I
		sleep(10)
		DelBodyItem( OwnerID() , 203466 , 10 ) --�ƷȽުo
		sleep(10)
		GiveBodyItem( OwnerID() ,  202839  , 1 ) --�x�V§��
		SetFlag( OwnerID()  , 542242 , 1 )

		SetFlag( OwnerID()  , 542232 , 1 )
		SetFlag( OwnerID()  , 542233 , 1 )
		SetFlag( OwnerID()  , 542234 , 1 )
		SetFlag( OwnerID()  , 542235 , 1 )
		SetFlag( OwnerID()  , 542236 , 1 )
		SetFlag( OwnerID()  , 542237 , 1 )
		SetFlag( OwnerID()  , 542238 , 1 )
		SetFlag( OwnerID()  , 542239 , 1 )
		SetFlag( OwnerID()  , 542240 , 1 )
		SetFlag( OwnerID()  , 542241 , 1 )

	else
		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
	end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_6()

	CloseSpeak( OwnerID() )                     --������ܼҪ�


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_10()

	local ZoneID = math.mod( ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID ), 1000);

	local daySave01 =  CheckFlag( OwnerID()  , 542232 ) --�C�魫�m
	local daySave02 =  CheckFlag( OwnerID()  , 542233 )
	local daySave03 =  CheckFlag( OwnerID()  , 542234 )
	local daySave04 =  CheckFlag( OwnerID()  , 542235 )
	local daySave05 =  CheckFlag( OwnerID()  , 542236 )
	local daySave06 =  CheckFlag( OwnerID()  , 542237 )
	local daySave07 =  CheckFlag( OwnerID()  , 542238 )
	local daySave08 =  CheckFlag( OwnerID()  , 542239 )
	local daySave09 =  CheckFlag( OwnerID()  , 542240 )
	local daySave10 =  CheckFlag( OwnerID()  , 542241 )

	if ZoneID == 1 then
		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_31")   )  --�������ڰe�A�@�{�a�I

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_33") , "LuaYU_tonytony_12", 0 ) --�e�����r��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_37") , "LuaYU_tonytony_14", 0 ) --�e�����U�ҥ����


	elseif ZoneID == 2 then
		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_31")   )  --�������ڰe�A�@�{�a�I

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_32") , "LuaYU_tonytony_11", 0 ) --�e��ù����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_33") , "LuaYU_tonytony_12", 0 ) --�e�����r��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_37") , "LuaYU_tonytony_14", 0 ) --�e�����U�ҥ����


	elseif ZoneID == 4 then
		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_31")   )  --�������ڰe�A�@�{�a�I

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_32") , "LuaYU_tonytony_11", 0 ) --�e��ù����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_37") , "LuaYU_tonytony_14", 0 ) --�e�����U�ҥ����

	elseif ZoneID == 5 then
		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_31")   )  --�������ڰe�A�@�{�a�I

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_32") , "LuaYU_tonytony_11", 0 ) --�e��ù����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_33") , "LuaYU_tonytony_12", 0 ) --�e�����r��

	end



end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_11()

	ChangeZone( OwnerID(), 1, 0, -611.6, 26.2, -5946.0, 245 )  --�e��ù����
	CloseSpeak( OwnerID() )                     --������ܼҪ�

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_12()


	ChangeZone( OwnerID(), 4, 0, -5344.5, 553.0, 3198.8, 163 ) --�e�����r��
	CloseSpeak( OwnerID() )                     --������ܼҪ�

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_13()


	ChangeZone( OwnerID(), 2, 0, 5083.8, 112.8, -2330.9, 26 )  --�^�����s��
	CloseSpeak( OwnerID() )                     --������ܼҪ�

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_14()


	ChangeZone( OwnerID(), 5, 0, -14236.3, 770.7, -699.5 , 184 )  --�^���U�ҥ����
	CloseSpeak( OwnerID() )                     --������ܼҪ�

end