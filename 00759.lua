function houselearn_1(bookdbid)
	CallPlot(OwnerID() , "houselearn_1_1" , bookdbid )
end
function houselearn_1_1(bookdbid)
	local average = 21			--/*���B�]�w�������g���
--	local bookdbid = 202699		--/*���B�]�w�Ѫ�����s��
	local lva = 30			--/*���B�]�w�ϥγ̰�����
	local lvb = 0			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 501609
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
							LuaFunc_HouseTrainGetEXP(average*truecast/casttime)
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
function houselearn_2(bookdbid)
	CallPlot(OwnerID() , "houselearn_2_1" , bookdbid )
end
function houselearn_2_1(bookdbid)
	local average = 21			--/*���B�]�w�������g���
--	local bookdbid = 202700		--/*���B�]�w�Ѫ�����s��
	local lva = 40			--/*���B�]�w�ϥγ̰�����
	local lvb = 30			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 501609
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
							LuaFunc_HouseTrainGetEXP(average*truecast/casttime)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/*�A�����Ŧ��G����\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/*�A�����Ŧ��G����\Ū����
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

function houselearn_3(bookdbid)
	CallPlot(OwnerID() , "houselearn_3_1" , bookdbid )
end
function houselearn_3_1(bookdbid)
	local average = 21			--/*���B�]�w�������g���
--	local bookdbid = 202701		--/*���B�]�w�Ѫ�����s��
	local lva = 60			--/*���B�]�w�ϥγ̰�����
	local lvb = 40			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 501609
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
							LuaFunc_HouseTrainGetEXP(average*truecast/casttime)
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
function houselearn_66(bookdbid)
	CallPlot(OwnerID() , "houselearn_66_1" , bookdbid )
end
function houselearn_66_1(bookdbid)
	local average = 1902			--/*���B�]�w�������g���
--	local bookdbid = 240490		--/*���B�]�w�Ѫ�����s��
	local lva = 70			--/*���B�]�w�ϥγ̰�����
	local lvb = 60			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 501609
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
							LuaFunc_HouseTrainGetEXP(average*truecast/casttime)
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
function houselearn_67(bookdbid)
	CallPlot(OwnerID() , "houselearn_67_1" , bookdbid )
end
function houselearn_67_1(bookdbid)
	local average = 2823			--/*���B�]�w�������g���
--	local bookdbid = 240491		--/*���B�]�w�Ѫ�����s��
	local lva = 80			--/*���B�]�w�ϥγ̰�����
	local lvb = 70			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 501609
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
							LuaFunc_HouseTrainGetEXP(average*truecast/casttime)
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
function houselearn_68(bookdbid)
	CallPlot(OwnerID() , "houselearn_68_1" , bookdbid )
end
function houselearn_68_1(bookdbid)
	local average = 4194			--/*���B�]�w�������g���
--	local bookdbid = 240492		--/*���B�]�w�Ѫ�����s��
	local lva = 90			--/*���B�]�w�ϥγ̰�����
	local lvb = 80			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 501609
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
							LuaFunc_HouseTrainGetEXP(average*truecast/casttime)
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
function houselearn_69(bookdbid)
	CallPlot(OwnerID() , "houselearn_69_1" , bookdbid )
end
function houselearn_69_1(bookdbid)
	local average = 6231		--/*���B�]�w�������g���
--	local bookdbid = 240493		--/*���B�]�w�Ѫ�����s��
	local lva = 100			--/*���B�]�w�ϥγ̰�����
	local lvb = 90			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 600			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 501609
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
							LuaFunc_HouseTrainGetEXP(average*truecast/casttime)
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