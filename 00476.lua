function LuaS_110725_0()

	LoadQuestOption( OwnerID() )

	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110725_5", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110725_1", 0 ) 

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110725_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110725_0", 0 ); 	--�ڷQ�^���誺���
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_110725_EXIT",  0 );	--���}

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110725_5()

	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_5")  , C_SYSTEM )	--�e�������T���G�z�N�^�{�a�I�n�O�b�����ҥ�����I
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_5") , 0 )	--�z�N�^�{�a�I�n�O�b�����ҥ�����I
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--�e�������T���G�^�{�a�I�n�O���ѡI
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--�^�{�a�I�n�O���ѡI
	end

	CloseSpeak( OwnerID() );	--������ܵ���

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110725_EXIT()
	CloseSpeak( OwnerID() );	--������ܵ���
end
--------------------------------------------------------------------------------------------------------------------------