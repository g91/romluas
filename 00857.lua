function LuaYU_111353_0()

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG1") , "LuaYU_111353_1", 0 ) --�����ѤH���L�h
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG6") , "LuaYU_111353_2", 0 ) --���󭷨�����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG10") , "LuaYU_111353_10", 0 ) --�ڭn�i�h��������
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG5") , "LuaYU_RecipeList", 0 ) --����Ͳ��t��



end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_1()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D1")   )--�����ѤH���L�h����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_0", 0 ) --�^��W�@��
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_2()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D6")   )--���󭷨����Ǥ���
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG2") , "LuaYU_111353_3", 0 ) --���󭷨����Ǫ��]��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG3") , "LuaYU_111353_4", 0 ) --�p����o�}�����S�����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG4") , "LuaYU_111353_5", 0 ) --�����]��
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG9") , "LuaYU_111353_9", 0 ) --�����]�ԭ��d
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_0", 0 ) --�^��W�@��
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_3()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D2")   )--���󭷨����Ǫ��]��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_2", 0 ) --�^��W�@��
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_4()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D3")   )--����S�����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_2", 0 ) --�^��W�@��
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_5()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D4")   )--�����]��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_2", 0 ) --�^��W�@��
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_9()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D9")   )--�����]�ԭ��d
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_2", 0 ) --�^��W�@��
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_10()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D10")   )--�ڭn�i�h��������
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG7") , "LuaYU_111353_7", 0 ) --�I�����]��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_0", 0 ) --�^��W�@��
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_7()
		if CountBodyItem( OwnerID() , 202982 ) >= 1 then
			SetSpeakDetail( OwnerID(), GetString("YU_111353_D13")   )--
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_10", 0 ) --�^��W�@��


		elseif CountBodyItem( OwnerID() , 202980 ) >= 1 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
				DelBodyItem( OwnerID() , 202980 , 1 )
				GiveBodyItem( OwnerID() , 202982  , 1 )
				SetSpeakDetail( OwnerID(), GetString("YU_111353_D7")   )--
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_10", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_10", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), GetString("YU_111353_D12")   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_10", 0 ) --�^��W�@��	
	end

end
