function Lua_Hao_eneu_2year_login()

--	if type == EM_Event_Module_Type_Login then

		local month = GetSystime(3)+1
		local day = GetSystime(4)
		local hour = GetSystime(1)
		local min = GetSystime(2)
	
		local Buff = 505766
		local MsgBuff = 507860	-- ���ܥήɶ��T��
		local Keyitem = 545026
		local Item = 209561
		local Give = 1
		local BuffTime = 90000
	
--		if month == 3 then
--			if PlayerLV >= 20 then
--				if day == 15 and hour < 15 then
--					return false
--				elseif day == 19 and hour >= 11 then
--					return false
--				elseif ( hour >=00 and min >=0 ) then
					AddBuff( OwnerID() , MsgBuff , 0 , -1 )
					if CheckFlag( OwnerID() , Keyitem ) == true then
					--	AddBuff( OwnerID() , MsgBuff , 0 , -1 )
						return false
					else
					--	AddBuff( OwnerID() , MsgBuff , 0 , -1 )
						if CheckBuff( OwnerID() , Buff ) == false then -- ��s��n�J�ѼƬ� 1 �Ѯ�
							AddBuff( OwnerID() , Buff , 0 , BuffTime )
							SetFlag( OwnerID() , Keyitem , 1 )
							GiveBodyItem( OwnerID() , Item , Give )
							return false
						else
							local Count = BuffCount( OwnerID() )
							for i = 0 , Count , 1 do
							--	DebugMsg( 0 , 0 , "Count = "..Count )
								local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
							--	DebugMsg( 0 , 0 , "BuffID = "..BuffID )
								if BuffID == Buff then
									local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
								--	DebugMsg( 0 , 0 , "BuffLv = "..BuffLv )
									if BuffLv == 0 then -- ��s��n�J�ѼƬ� 2 �Ѯ�
										AddBuff( OwnerID() , Buff , 0 , BuffTime )
										SetFlag( OwnerID() , Keyitem , 1 )
										GiveBodyItem( OwnerID() , Item , Give+1 )
										break
									elseif BuffLv == 1 then -- ��s��n�J�ѼƬ� 3 �Ѯ�
										AddBuff( OwnerID() , Buff , 0 , BuffTime )
										SetFlag( OwnerID() , Keyitem , 1 )
										GiveBodyItem( OwnerID() , Item , Give+2 )
										break
									elseif BuffLv == 2 then -- ��s��n�J�ѼƬ� 4 �Ѯ�
										AddBuff( OwnerID() , Buff , 0 , BuffTime )
										SetFlag( OwnerID() , Keyitem , 1 )
										GiveBodyItem( OwnerID() , Item , Give+3 )
										break
									elseif BuffLv >= 3 then -- ��s��n�J�ѼƬ� 5 �Ѯ�
										AddBuff( OwnerID() , Buff , 0 , BuffTime )
										SetFlag( OwnerID() , Keyitem , 1 )
										GiveBodyItem( OwnerID() , Item , Give+4 )
										break
									end
							--	elseif CheckFlag( OwnerID() , Keyitem ) == true and CheckBuff( OwnerID() , Buff ) == false then
							--		DebugMsg( 0 , 0 , "You must use the correct way to test this activity , Something wrong  , Please try again ." )
								end
							end
						end
					end
--				end
--			end
--		end
--	end
end

function Lua_Hao_eneu_2year_login_Msg()	-- ���ܪ��a�����b�X�p�ɡA�X���᭫�s�n�J�C���C

--	local Buff = 507860	-- ���ܥήɶ��T��
	local Lowhour = 6
	local Maxhour = 23
	local Maxmin = 60
	local Msghour , Msgmin

--	local month = GetSystime(3)+1
--	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)

	if hour >= 0 and hour <= 5 then
	--	DebugMsg( 0 , 0 , "1" )
		Msghour = Lowhour - (hour+1)
		Msgmin = Maxmin - min
		if Msgmin == Maxmin then	-- 60 = 60
			Msghour = Msghour + 1	-- ����w = 60�A�ɰw+1
			Msgmin = 0			-- �P�ɡA���w�k 0
		end
	elseif hour >= 6 and hour <= 23 then
	--	DebugMsg( 0 , 0 , "2" )
		Msghour = Maxhour - hour + Lowhour
		Msgmin = Maxmin - min
		if Msgmin == Maxmin then	-- 60 = 60
			Msghour = Msghour + 1	-- ����w = 60�A�ɰw+1
			Msgmin = 0			-- �P�ɡA���w�k 0
		end
	end
--	Lua_Hao_System_Time()
	DebugMsg( 0 , 0 , "Hour = "..Msghour.." ".."Min = "..Msgmin )

	Msghour = string.format( "%02d", Msghour )
	Msgmin = string.format( "%02d", Msgmin )

	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GERMANY2_03][$SETVAR1="..Msghour.."][$SETVAR2="..Msgmin.."]" , C_SYSTEM )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GERMANY2_03][$SETVAR1="..Msghour.."][$SETVAR2="..Msgmin.."]" , C_SYSTEM )
--	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_GERMANY2_03][$SETVAR1="..Msghour.."][$SETVAR2="..Msgmin.."]" , C_SYSTEM )
--	�C�ѫ��򪺵n�J�A�|�a���A�B�~�����y�A
--	�Y��[$VAR1]�p��[$VAR2]�������[505766]�ĪG�����e�����������s�n�J�A
--	�Y�i����[505766]�����šC�̰��i�ɯŦܵ���5�C
--	���ʴ����A�u�n�C�ѫO���n�J�A�N�ണ�����ĪG���šA���ŶV���A�N���A��o����h<CY>[209561]</CY>�C
end