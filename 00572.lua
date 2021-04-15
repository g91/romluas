function LuaS_110805_0()

	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110805_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110805_1", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_2"), "LuaS_110944_2", 0 ) 
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
function LuaS_110805_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110805_0", 0 ); 	--�ڷQ�^���誺���
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_110805_EXIT",  0 );	--���}

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110805_5()

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
function LuaS_110805_EXIT()
	CloseSpeak( OwnerID() );	--������ܵ���
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110805_Secret()
	CloseSpeak( OwnerID() );	--������ܵ���
	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 10 , 0,-22350, -226, 1993, 61) --Zone10
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110805_2()

	CloseSpeak( OwnerID() );	--������ܵ���

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0, 5525, 53, -3074, 52)	--�Z��R������F��

end
--------------------------------------------------------------------------------------------------------------------------
Function Z6_TransporterIcon_00()--12.06.2012�s�WbyWilliam
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint )
End
--------------------------------------------------------------------------------------------------------------------------