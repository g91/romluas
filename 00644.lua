function LuaS_110970()--�Ĥ@��
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--�����@��
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110970_0", 0 ) --���a�ﶵ�G���ڧU�A�@�u���O
end

function LuaS_110971()--�ĤG��
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--�����@��
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110971_0", 0 ) --���a�ﶵ�G���ڧU�A�@�u���O
end

function LuaS_110972()--�ĤT��
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--�����@��
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110972_0", 0 ) --���a�ﶵ�G���ڧU�A�@�u���O
end

function LuaS_110973()--�ĥ|��
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--�����@��
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110973_0", 0 ) --���a�ﶵ�G���ڧU�A�@�u���O
end

function LuaS_110974()--�Ĥ���
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--�����@��
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110974_0", 0 ) --���a�ﶵ�G���ڧU�A�@�u���O
end

function LuaS_110970_0()--�Ĥ@��
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--�p��Queue���X��
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--�p��I�]���X�ӪŦ�
	if sub then
		if (sub>14) and (lv>14) then
			if CountBodyItem( OwnerID(), 201893)==0 then
				if CountBodyItem( OwnerID(), 201894)==0 then
					if CountBodyItem( OwnerID(), 201895)==0 then
						if QueueOfBag == 0 and SpaceOfBag > 0 then
							GiveBodyItem( OwnerID(), 201893, 1 ) --���L�_�l���\
							LoadQuestOption(OwnerID())
						else
							SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--�s���a�M�ŭI�]
						end
					else
						LoadQuestOption(OwnerID())
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_0" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_0" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
	end
end

function LuaS_110971_0()--�ĤG��
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--�p��Queue���X��
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--�p��I�]���X�ӪŦ�
	if sub then
		if (sub>19) and (lv>19) then
			if CountBodyItem( OwnerID(), 201896)==0 then
				if CountBodyItem( OwnerID(), 201897)==0 then
					if CountBodyItem( OwnerID(), 201898)==0 then
						if QueueOfBag == 0 and SpaceOfBag > 0 then
							GiveBodyItem( OwnerID(), 201896, 1 ) --���L�_�l���\
							LoadQuestOption(OwnerID())
						else
							SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--�s���a�M�ŭI�]
						end
					else
						LoadQuestOption(OwnerID())
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_1" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_1" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
	end
end


function LuaS_110972_0()--�ĤT��
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--�p��Queue���X��
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--�p��I�]���X�ӪŦ�
	if sub then
		if (sub>24) and (lv>24) then
			if CountBodyItem( OwnerID(), 201899)==0 then
				if CountBodyItem( OwnerID(), 201900)==0 then
					if QueueOfBag == 0 and SpaceOfBag > 0 then
						GiveBodyItem( OwnerID(), 201899, 1 ) --���L�_�l���\
						LoadQuestOption(OwnerID())
					else
						SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--�s���a�M�ŭI�]
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_2" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_2" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
	end

end



function LuaS_110973_0()--�ĥ|��
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--�p��Queue���X��
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--�p��I�]���X�ӪŦ�
	if sub then
		if (sub>29) and (lv>29) then
			if CountBodyItem( OwnerID(), 201901)==0 then
				if CountBodyItem( OwnerID(), 201902)==0 then
					if CountBodyItem( OwnerID(), 201903)==0 then
						if QueueOfBag == 0 and SpaceOfBag > 0 then
							GiveBodyItem( OwnerID(), 201901, 1 ) --���L�_�l���\
							LoadQuestOption(OwnerID())
						else
							SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--�s���a�M�ŭI�]
						end
					else
						LoadQuestOption(OwnerID())
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_3" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_3" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
	end
end



function LuaS_110974_0()--�Ĥ���
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--�p��Queue���X��
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--�p��I�]���X�ӪŦ�
	if sub then
		if (sub>34) and (lv>34) then
			if CountBodyItem( OwnerID(), 201904)==0 then
				if CountBodyItem( OwnerID(), 201905)==0 then
					if CountBodyItem( OwnerID(), 201906)==0 then
						if QueueOfBag == 0 and SpaceOfBag > 0 then
							GiveBodyItem( OwnerID(), 201904, 1 ) --���L�_�l���\
							LoadQuestOption(OwnerID())
						else
							SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--�s���a�M�ŭI�]
						end
					else
						LoadQuestOption(OwnerID())
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_4" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_4" )   )--�s���a��ƲĤG���~�઺�ɭԨӧ�L
	end

end