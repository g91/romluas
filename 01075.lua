function K_2008xmss_1()  --���է���
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s1") , "K_2008xmss_2", 0 ) --�ڤ]�Q�n�s�~����
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s2") , "K_2008xmss_3", 0 ) --�ڷQ��10�����l�洫������t��§��
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s3") , "K_2008xmss_4", 0 ) --�ڷQ��20�����l�������t��§��
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s4") , "K_2008xmss_5", 0 ) --�ڷQ��50�����l��������t��§��
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s9") , "K_2008xmss_7", 0 ) --�ڷQ���D�x�V�`���Ѩ�
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_2()
SetSpeakDetail( OwnerID(), GetString("K_2008xmss_1_s5")   )--�]���n�w�ƤU�����ʪ��g�O�A�ҥH�n��z�S�����O�άO3000���C
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s6")  , "K_2008xmss_6", 0 ) --��3000����o�s�~����
end

function K_2008xmss_6()
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) >= 3000 then

			if CheckBuff(OwnerID() , 492099) == false then		
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -3000 )
			CastSpell( OwnerID() , OwnerID()  ,492233 )
			CloseSpeak( OwnerID() )
			else
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -3000 )
			CastSpell( OwnerID() , OwnerID()  ,492233 )
			CloseSpeak( OwnerID() )
			end

		else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --�z����������
		end
--		Say( OwnerID(), "ownerRun1" )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_3()
----�ڷQ��10�����l�洫������t��§��
	if CountBodyItem( OwnerID() , 203484 ) >= 10 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 203484 , 10 )
		GiveBodyItem( OwnerID() , 203481  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_2008xmss_1_s7")   )--���z�t�ϸ`�r��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_4()
--�ڷQ��10�����l�������t��§��
	if CountBodyItem( OwnerID() , 203484 ) >= 20 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 203484 , 20 )
		GiveBodyItem( OwnerID() , 203482  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_2008xmss_1_s7")   )--���z�t�ϸ`�r��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_5()
--�ڷQ��20�����l��������t��§��
	if CountBodyItem( OwnerID() , 203484 ) >= 50 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 203484 , 50 )
		GiveBodyItem( OwnerID() , 203483  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_2008xmss_1_s7")   )--���z�t�ϸ`�r��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_7()
----�ڷQ���D�x�V�`���Ѩ�

	SetSpeakDetail( OwnerID(), GetString("K_2008XMSS_1_S10")   )--�x�V�`
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --�^��W�@��	
	end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------