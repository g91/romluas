function houselearn_4(bookdbid)
	CallPlot(OwnerID() , "houselearn_4_1" , bookdbid )
end
function houselearn_4_1(bookdbid)
	local average = 3			--/*���B�]�w�������g���
--	local bookdbid = 202702		--/*���B�]�w�Ѫ�����s��
	local lva = 30			--/*���B�]�w�ϥγ̰�����
	local lvb = 0			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*�P�_����
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- ���\
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- ����
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*�p�G���\�����@�����y
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*�p�G���ѵ����@��
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*�A�S����
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*�A�S����
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_5(bookdbid)
	CallPlot(OwnerID() , "houselearn_5_1" , bookdbid )
end
function houselearn_5_1(bookdbid)
	local average = 3			--/*���B�]�w�������g���
--	local bookdbid = 202703		--/*���B�]�w�Ѫ�����s��
	local lva = 40			--/*���B�]�w�ϥγ̰�����
	local lvb = 30			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*�P�_����
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- ���\
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- ����
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*�p�G���\�����@�����y
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*�p�G���ѵ����@��
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*�A�S����
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*�A�S����
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_6(bookdbid)
	CallPlot(OwnerID() , "houselearn_6_1" , bookdbid )
end
function houselearn_6_1(bookdbid)
	local average = 3			--/*���B�]�w�������g���
--	local bookdbid = 202704		--/*���B�]�w�Ѫ�����s��
	local lva = 60			--/*���B�]�w�ϥγ̰�����
	local lvb = 40			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*�P�_����
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- ���\
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- ����
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*�p�G���\�����@�����y
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*�p�G���ѵ����@��
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*�A�S����
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*�A�S����
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end
-------------------------------------------------------------------------------------------------------
function houselearn_70(bookdbid)
	CallPlot(OwnerID() , "houselearn_70_1" , bookdbid )
end
function houselearn_70_1(bookdbid)
	local average = 141			--/*���B�]�w�������g���
--	local bookdbid = 240494		--/*���B�]�w�Ѫ�����s��
	local lva = 70			--/*���B�]�w�ϥγ̰�����
	local lvb = 60			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*�P�_����
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- ���\
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- ����
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*�p�G���\�����@�����y
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*�p�G���ѵ����@��
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*�A�S����
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*�A�S����
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_71(bookdbid)
	CallPlot(OwnerID() , "houselearn_71_1" , bookdbid )
end
function houselearn_71_1(bookdbid)
	local average = 213			--/*���B�]�w�������g���
--	local bookdbid = 240495		--/*���B�]�w�Ѫ�����s��
	local lva = 80			--/*���B�]�w�ϥγ̰�����
	local lvb = 70			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*�P�_����
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- ���\
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- ����
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*�p�G���\�����@�����y
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*�p�G���ѵ����@��
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*�A�S����
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*�A�S����
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_72(bookdbid)
	CallPlot(OwnerID() , "houselearn_72_1" , bookdbid )
end
function houselearn_72_1(bookdbid)
	local average = 315			--/*���B�]�w�������g���
--	local bookdbid = 240496		--/*���B�]�w�Ѫ�����s��
	local lva = 90			--/*���B�]�w�ϥγ̰�����
	local lvb = 80			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*�P�_����
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- ���\
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- ����
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*�p�G���\�����@�����y
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*�p�G���ѵ����@��
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*�A�S����
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*�A�S����
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_73(bookdbid)
	CallPlot(OwnerID() , "houselearn_73_1" , bookdbid )
end
function houselearn_73_1(bookdbid)
	local average = 468			--/*���B�]�w�������g���
--	local bookdbid = 240497		--/*���B�]�w�Ѫ�����s��
	local lva = 100			--/*���B�]�w�ϥγ̰�����
	local lvb = 90			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*�P�_����
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- ���\
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- ����
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*�p�G���\�����@�����y
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*�p�G���ѵ����@��
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*�A�S����
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*�A�S����
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/�A�����Ŧ��G����\Ū����
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end