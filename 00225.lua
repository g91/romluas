function LuaS_110186_0()
	LoadQuestOption( OwnerID() )
--	SetSpeakDetail( OwnerID(), GetString("ST_110186_0")   );
	--/*�d�i�Ԧh��......�ں���......�w......�w���ĥ�.......��......���U�ӳo�Ӧr�O......�H
	--
	--�x�H�A�O�ְڡH��ڦ��ƶܡH
	--�ڡI��F�I�S���A�y�U���A�o�Ӧr���ӬO�y�U���I�o����g�U��......
	if ( CheckAcceptQuest( OwnerID(), 420038 ) == true ) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_1") , "LuaS_110186_1", 0 ); --/*��Ķ�۸O�ݥ�1  
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_2") , "LuaS_110186_2", 0 ); --/*��Ķ�۸O�ݥ�2
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_3") , "LuaS_110186_3", 0 ); --/*��Ķ�۸O�ݥ�3
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_4") , "LuaS_110186_4", 0 ); --/*��Ķ�۸O�ݥ�4
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_1()

	if ( CountBodyItem( OwnerID(), 200029) > 0 ) then
		SetSpeakDetail( OwnerID(), GetString("ST_110186_A")   );
		--/*�F�褣�N�b���ܡH�b���r�I�A�]�S�h�ѫ��N�o�˽k��F�H
	else
		if( CountBodyItem( OwnerID(), 200020) > 0 ) then
			SetSpeakDetail( OwnerID(), GetString("ST_110186_1")   );
			--/*�����վ��o���O���
			--�ڬݬݳ�K�K���e½�L�@���A�����D�ٰO�o�h�֡K�K
			--��K�K
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_C") , "LuaS_110186_5", 0 );
			--/*�~��
		else
			SetSpeakDetail( OwnerID(), GetString("ST_110186_B")   );
			--/*�A�n��½Ķ���F��b���ڡH�ګ��S�ݨ��H
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_2()

	if ( CountBodyItem( OwnerID(), 200031)  > 0 ) then
		SetSpeakDetail( OwnerID(), GetString("ST_110186_A")   );
		--/*�F�褣�N�b���ܡH�b���r�I�A�]�S�h�ѫ��N�o�˽k��F�H
	else
		if( CountBodyItem( OwnerID(), 200026) > 0 ) then
			SetSpeakDetail( OwnerID(), GetString("ST_110186_2")   );
			--/*����hҭ���O���
			--�ڬݬݳ�K�K���e½�L�@���A�����D�ٰO�o�h�֡K�K
			--��K�K
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_C") , "LuaS_110186_6", 0 );
			--/*�~��
		else
			SetSpeakDetail( OwnerID(), GetString("ST_110186_B")   );
			--/*�A�n��½Ķ���F��b���ڡH�ګ��S�ݨ��H
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_3()

	if ( CountBodyItem( OwnerID(), 200032) > 0 ) then
		SetSpeakDetail( OwnerID(), GetString("ST_110186_A")   );
		--/*�F�褣�N�b���ܡH�b���r�I�A�]�S�h�ѫ��N�o�˽k��F�H
	else
		if( CountBodyItem( OwnerID(), 200027) > 0 ) then
			SetSpeakDetail( OwnerID(), GetString("ST_110186_3")   );
			--/*�����G�Ԫ��O���
			--�ڬݬݳ�K�K���e½�L�@���A�����D�ٰO�o�h�֡K�K
			--��K�K
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_C") , "LuaS_110186_7", 0 );
			--/*�~��
		else
			SetSpeakDetail( OwnerID(), GetString("ST_110186_B")   );
			--/*�A�n��½Ķ���F��b���ڡH�ګ��S�ݨ��H
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_4()

	if ( CountBodyItem( OwnerID(), 200033) > 0 ) then
		SetSpeakDetail( OwnerID(), GetString("ST_110186_A")   );
		--/*�F�褣�N�b���ܡH�b���r�I�A�]�S�h�ѫ��N�o�˽k��F�H
	else
		if( CountBodyItem( OwnerID(), 200028) > 0 ) then
			SetSpeakDetail( OwnerID(), GetString("ST_110186_4")   );
			--/*��㫶�b�䴣���O���
			--�ڬݬݳ�K�K���e½�L�@���A�����D�ٰO�o�h�֡K�K
			--��K�K
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_C") , "LuaS_110186_8", 0 );
			--/*�~��
		else
			SetSpeakDetail( OwnerID(), GetString("ST_110186_B")   );
			--/*�A�n��½Ķ���F��b���ڡH�ګ��S�ݨ��H
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_5()

	SetSpeakDetail( OwnerID(), GetString("ST_110186_5")   );
	--/*����A�Q

	DelBodyItem( OwnerID(), 200020, 1 ) 
	GiveBodyItem( OwnerID(), 200029, 1 );
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_6()

	SetSpeakDetail( OwnerID(), GetString("ST_110186_6")   );
	--/*����A�Q

	DelBodyItem( OwnerID(), 200026, 1 ) 
	GiveBodyItem( OwnerID(), 200031, 1 );
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_7()

	SetSpeakDetail( OwnerID(), GetString("ST_110186_7")   );
	--/*����A�Q

	DelBodyItem( OwnerID(), 200027, 1 ) 
	GiveBodyItem( OwnerID(), 200032, 1 );
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_8()

	SetSpeakDetail( OwnerID(), GetString("ST_110186_8")   );
	--/*����A�Q

	DelBodyItem( OwnerID(), 200028, 1 ) 
	GiveBodyItem( OwnerID(), 200033, 1 );
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*�������
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end