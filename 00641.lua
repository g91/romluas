function LuaS_110944_0()

	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110944_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110944_1", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_4"), "LuaS_110727_6", 0 ) --�ڷQ�ǰe��Z��R������F��
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_3"), "LuaS_110944_3", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_6"), "LuaS_110944_6", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_7"), "LuaS_110944_7", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_8"), "LuaS_110944_8", 0 ) 

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

	if ReadRoleValue( OwnerID()  , EM_RoleValue_VOC ) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_9"), "LuaS_110805_Secret", 0 ) 
		AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_10"), "LuaS_110944_Secret", 0 ) 
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110944_0", 0 ); 	--�ڷQ�^���誺���

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_5()

	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_10")  , C_SYSTEM )	--�e�������T���G�z�N�^�{�a�I�n�O�b���`�ۭn��I
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_10") , 0 )	--�z�N�^�{�a�I�n�O�b���`�ۭn��I
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--�e�������T���G�^�{�a�I�n�O���ѡI
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--�^�{�a�I�n�O���ѡI
	end

	CloseSpeak( OwnerID() );	--������ܵ���

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_2()

	CloseSpeak( OwnerID() );	--������ܵ���

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0, -22822, -179, 2683, 44)	--���`�M�h�Ϋ���ӷ~�s��

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_3()

	CloseSpeak( OwnerID() );	--������ܵ���

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0,-23198, -260, 4492, 150)	--���`�M�h�Τ����aģ�s��

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_6()

	CloseSpeak( OwnerID() );	--������ܵ���

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0,-20792, -226, 6210, 150)	--���`�M�h�Ϋe���Ԫ��s��

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_7()

	CloseSpeak( OwnerID() );	--������ܵ���

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0,-23578, -261, 5843 , 150)	--���`�M�h�Φ�Ϥu�~�s��

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_8()

	CloseSpeak( OwnerID() );	--������ܵ���

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0,-21987, -179, 3650 , 330)	--���`�M�h�ΪF�϶ħL�s��

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_Secret()
	CloseSpeak( OwnerID() );	--������ܵ���
	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 10 , 0,-29260, 23, -12227, 125) --Zone11
end
