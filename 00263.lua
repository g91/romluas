function LuaS_110111_0()

	LoadQuestOption( OwnerID() );
	if CheckFlag( OwnerID(), 540227 ) then  
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_2") , "LuaS_110111_2", 0 ) 
		--/*������S
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_1") , "LuaS_110111_1", 0 ) 
		--/*������u�@�H
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*�������
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110111_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110111_1")   );
	--/*���в���{�b���ݭn�H�������A�p�G�A���U�ڭ̦�������A�N�|��o�i���в����ҩ��j�C
	--  �N�i���в����ҩ��j���ӳo�̫K�i����S�ҡA���P�����ȷ|�������P�ƶq�����ڡC
	--
	--  �p�G�A�n�������ܡA�N�Цb�o��ñ�W�A���j�W�C  

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_3") , "LuaS_110111_3", 0 ) 
	--/*ñ�r
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_8") , "LuaS_110111_EXIT", 0 ); --/*�A�Ҽ{

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110111_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110111_2")   );
	--/*�A�nú��h�֡i���в����ҩ��j�O�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_4") , "LuaS_110111_4", 0 ) 
	--/*ú��@�i
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_5") , "LuaS_110111_5", 0 ) 
	--/*ú���i
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_6") , "LuaS_110111_6", 0 ) 
	--/*ú�椭�i
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_7") , "LuaS_110111_7", 0 ) 
	--/*ú��Q�i
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_0", 0 ); --/*�^�W�@��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_3()

	SetSpeakDetail( OwnerID(), GetString("ST_110111_3")   );
	--/*�n�A�o�˴N�i�H�F�A�P�§A�����U�C
	--  ��A�`���쨬�����i���в����ҩ��j�A�Шӧ�ڻ���A�����S�C
	SetFlag( OwnerID() , 540227 , 1)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110111_4()
	if CountBodyItem( OwnerID() , 200582 ) < 1 then
		SetSpeakDetail( OwnerID(), GetString("ST_110111_4")   ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_2", 0 ); --/*�^�W�@��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*�������
	else
		CloseSpeak( OwnerID() );
		DelBodyItem( OwnerID() , 200582 , 1 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 50 )
	end
end
--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_5()
	if CountBodyItem( OwnerID() , 200582 ) < 2 then
		SetSpeakDetail( OwnerID(), GetString("ST_110111_4")   ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_2", 0 ); --/*�^�W�@��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*�������
	else
		CloseSpeak( OwnerID() );
		DelBodyItem( OwnerID() , 200582 , 2 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 100 )
	end
end
--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_6()
	if CountBodyItem( OwnerID() , 200582 ) < 5 then
		SetSpeakDetail( OwnerID(), GetString("ST_110111_4")   ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_2", 0 ); --/*�^�W�@��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*�������
	else
		CloseSpeak( OwnerID() );
		DelBodyItem( OwnerID() , 200582 , 5 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 250 )
	end
end

--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_7()
	if CountBodyItem( OwnerID() , 200582 ) < 10 then
		SetSpeakDetail( OwnerID(), GetString("ST_110111_4")   ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_2", 0 ); --/*�^�W�@��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*�������
	else
		CloseSpeak( OwnerID() );
		DelBodyItem( OwnerID() , 200582 , 10 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 500 )
	end
end
--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end
--------------------------------------------------------------------------------------------------------------------

