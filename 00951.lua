function LuaS_110989_2() --�s�W�P�_����,string
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=46 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_7")   ) --�̱z�����šA�ѥ[�����ʻݭn����I��� 12000 ���A�z�T�w�n�ѥ[�ܡH
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=41 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_6")   ) --�̱z�����šA�ѥ[�����ʻݭn����I��� 10000 ���A�z�T�w�n�ѥ[�ܡH
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=36 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_5")   ) --�̱z�����šA�ѥ[�����ʻݭn����I��� 9000 ���A�z�T�w�n�ѥ[�ܡH
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=31 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_4")   ) --�̱z�����šA�ѥ[�����ʻݭn����I��� 8000 ���A�z�T�w�n�ѥ[�ܡH
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=26 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_3")   ) --�̱z�����šA�ѥ[�����ʻݭn����I��� 7000 ���A�z�T�w�n�ѥ[�ܡH
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=21 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_2")   ) --�̱z�����šA�ѥ[�����ʻݭn����I��� 6000 ���A�z�T�w�n�ѥ[�ܡH
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=15 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_1")   ) --�̱z�����šA�ѥ[�����ʻݭn����I��� 5000 ���A�z�T�w�n�ѥ[�ܡH
	end
	if  CheckBuff(OwnerID() , 501603 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_3") , "LuaS_110989_3", 0 ) --/*�ڭn�ѥ[
	end
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_4") , "LuaS_110989_0", 0 ) --/*���ڦҼ{�@�U

end

function LuaS_110989_3()
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=46 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 12000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 12 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -12000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --�z���D��Ŷ�����
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=41 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 10000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 10 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -10000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --�z���D��Ŷ�����
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=36 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 9000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 9 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -9000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --�z���D��Ŷ�����
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=31 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 8000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 8 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -8000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --�z���D��Ŷ�����
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=26 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 7000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 7 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -7000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --�z���D��Ŷ�����
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=21 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 6000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 6)
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -6000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --�z���D��Ŷ�����
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=15 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 5000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 5 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -5000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --�z���D��Ŷ�����
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
		end
	end

		SetSpeakDetail( OwnerID(), GetString("ST_110989_3")   ) 
	--�n���A�T�ꦬ��F�z������A
end
