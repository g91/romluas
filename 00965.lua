function LuaS_111490_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG2") , "LuaS_111490_2", 0 ) --�ڷQ��20�ӡu����}�v�I���u�o�J���v�ٸ�
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG3") , "LuaS_111490_3", 0 ) --�ڷQ��300�ӡu����}�v�I���u�W�ŷo�J���v�ٸ�
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG4") , "LuaS_111490_4", 0 ) --�ڷQ��5���C�⪺�u�m�a�v�U1���I���u�n�ʤj�G���v�ٸ�
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG5") , "LuaS_111490_5", 0 ) --�ڤw�g���u�o�J���v�ٸ��A�ڷQ��20�ӡu����}�v�I���u�ܨ��Ĥ��v
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG6") , "LuaS_111490_6", 0 ) --�ڷQ�αm�a�I���ӫ����~
end
-----------------
function LuaS_111490_1()
SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG7")   )--�n�ʸ`���Ѩ�1...
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG7_2") , "LuaS_111490_1_1", 0 ) --�M��O�H
end
-----------------
function LuaS_111490_1_1()
SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG7_1")   )--�n�ʸ`���Ѩ�2...
end
-----------------
function LuaS_111490_2()
--�ڷQ��20�ӡu����}�v�I���u�o�J���v�ٸ�
	if CountBodyItem( OwnerID() , 530365 ) < 1 then
		if CountBodyItem( OwnerID() , 203078 ) >= 20 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			local DAVISRAND = rand(100)		
			DelBodyItem( OwnerID() , 203078 , 20 )
			GiveBodyItem( OwnerID() , 530365 , 1 )
				if DAVISRAND > 60 then		--40%���v
					GiveBodyItem( OwnerID() , 725451  , 1 )  --���� �����L�BĨۣ�H�䤤���@
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG11")   )--�A����{�u�����I�گS�O���y�A�@���ܨ��Ĥ��A���A�n�ʸ`�ּ֡I
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
				end
			else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
			end
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG12")   )--�z�w�g���o�Ӻٸ��F�A���୫�ƧI���C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end
-----------------
function LuaS_111490_3()
--�ڷQ��300�ӡu����}�v�I���u�W�ŷo�J���v�ٸ�
	if CountBodyItem( OwnerID() , 530366 ) < 1 then
		if CountBodyItem( OwnerID() , 203078 ) >= 300 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			local DAVISRAND = rand(100)			
			DelBodyItem( OwnerID() , 203078 , 300 )
			GiveBodyItem( OwnerID() , 530366 , 1 )
				if DAVISRAND > 30 then		--70%���v����
					GiveBodyItem( OwnerID() , 725452  , 1 )
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG11")   )--�A����{�u�����I�گS�O���y�A�@���ܨ��Ĥ��A���A�n�ʸ`�ּ֡I
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
				end
			else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
			end
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG12")   )--�z�w�g���o�Ӻٸ��F�A���୫�ƧI���C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end
-----------------
function LuaS_111490_4()
--�ڷQ��5���C�⪺�u�m�a�v�U1���I���u�n�ʤj�G���v�ٸ�
	if CountBodyItem( OwnerID() , 530364 ) < 1 then
		if 	CountBodyItem( OwnerID() , 203080 ) >= 1 and 
			CountBodyItem( OwnerID() , 203081 ) >= 1 and 
			CountBodyItem( OwnerID() , 203082 ) >= 1 and 
			CountBodyItem( OwnerID() , 203083 ) >= 1 and 
			CountBodyItem( OwnerID() , 203084 ) >= 1 then
			if EmptyPacketCount( OwnerID() ) >= 0  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , 203080 , 1 )
			DelBodyItem( OwnerID() , 203081 , 1 )
			DelBodyItem( OwnerID() , 203082 , 1 )
			DelBodyItem( OwnerID() , 203083 , 1 )
			DelBodyItem( OwnerID() , 203084 , 1 )
			GiveBodyItem( OwnerID() , 530364 , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
			else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
			end
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG12")   )--�z�w�g���o�Ӻٸ��F�A���୫�ƧI���C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end
-----------------
function LuaS_111490_5()
--�ڤw�g���u�o�J���v�ٸ��A�ڷQ��20�ӡu����}�v�I���u�ܨ��Ĥ��v
	if CountBodyItem( OwnerID() , 530365 ) >= 1 then
		if CountBodyItem( OwnerID() , 203078 ) >= 20 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			local DAVISRAND = rand(100)		
			DelBodyItem( OwnerID() , 203078 , 20 )
				if DAVISRAND > 10 then		--90%���v����
					GiveBodyItem( OwnerID() , 725454  , 1 )  --���� �����L�BĨۣ�H�䤤���@
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
				else			--5�H���v����p�����B�p�n��
					GiveBodyItem( OwnerID() , 725453  , 1 ) 
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG14")   )--���ߧA�I�A���S���ܨ��Ĥ��A���z�n�ʸ`�ּ֡I
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
				end
			else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
			end
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG13")   )--�z�S���u�o�J���v�o�Ӻٸ��A����I���ܨ��Ĥ��C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end