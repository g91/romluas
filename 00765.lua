------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�Ķ��j��
function houselearn_10()
	BeginPlot(OwnerID() , "houselearn_10_1" , 0 )
end
function houselearn_10_1()
	local average = 0.25			--/*���B�]�w�������g���
	local bookdbid = 202705		--/*���B�]�w�Ѫ�����s��
	local lva = 60			--/*���B�]�w�ϥγ̰�����
	local lvb = 0			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 60			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502086
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Herblism )
	local SkillLV1 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Lumbering )
	local SkillLV2 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Mining )
		if ZoneID == 400 then
			if ( SkillLV > lvb or SkillLV1 > lvb or SkillLV2 > lvb) then				--/*�P�_����
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_10") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
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
							LuaFunc_HouseTrainRandMLH(average*truecast/casttime)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_3") , 0 )	--/*�A�����Ƿ|�T�رĶ��ޯ�~��\Ū����
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_3") , 0 )	--/*�A�����Ƿ|�T�رĶ��ޯ�~��\Ū����
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�Z�����Τj��
function houselearn_11()
	BeginPlot(OwnerID() , "houselearn_11_1" , 0 )
end
function houselearn_11_1()
	local average = 3			--/*���B�]�w�������g���
	local bookdbid = 202732		--/*���B�]�w�Ѫ�����s��
	local lva = 60			--/*���B�]�w�ϥγ̰�����     �ѩ�O�Z�����m�ת����~ ���A�Ω󵥯ŭ��� �Щ������� 
	local lvb = 0			--/*���B�]�w�ϥΤ��i�C�󵥯�
	local casttime = 600			--/*���B�]�w��ӬI�k�ɶ�
	local truecast = 60			--/*���B�]�w�u��I�k�ɶ�
	local BookMagicID = 502089
	while 1 do
	local resultZ = "";
	local skill = ""
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue(OwnerID(), EM_RoleValue_LV  )  --�D¾����
		if ZoneID == 400 then
	--		if  ( PlayerLV <= lva and PlayerLV >= lvb ) then	--/*�b�i�H�����Ű϶���
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* �P�_�O�_����
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--�ϥή�
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_11") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*�}�l�I�k
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
						local x = Rand( 13 ) + 1					--/*�Ȯ��������`�Z���P�j��rand���}�ɻݭn��rand�אּ15
							if x == 1 then
								skill = EM_SkillValueType_Unarmed
							elseif x == 2 then
								skill = EM_SkillValueType_Blade
							elseif x == 3 then
								skill = EM_SkillValueType_Dagger
							elseif x == 4 then
								skill = EM_SkillValueType_Wand
							elseif x == 5 then
								skill = EM_SkillValueType_Axe
							elseif x == 6 then
								skill = EM_SkillValueType_Bludgeon
							elseif x == 7 then
								skill = EM_SkillValueType_Claymore
							elseif x == 8 then
								skill = EM_SkillValueType_Staff
							elseif x == 9 then
								skill = EM_SkillValueType_2H_Axe
							elseif x == 10 then
								skill = EM_SkillValueType_2H_Hammer
							elseif x == 11 then
								skill = EM_SkillValueType_Bow
							elseif x == 12 then
								skill = EM_SkillValueType_CossBow
							elseif x == 13 then
								skill = EM_SkillValueType_Define
	--						elseif x == 14 then
	--							skill = EM_SkillValueType_Gun
	--						elseif x == 15 then
	--							skill = EM_SkillValueType_Polearm
							end
							LuaFunc_HouseTrainWapenSkill(average*truecast/casttime,skill)
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
	--		else
	--			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/*�A�����Ŧ��G����\Ū����
	--			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/*�A�����Ŧ��G����\Ū����
	--			break;
	--		end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*�A���b�ЫΤ�
				break;
		end
	end
end