function LuaS_110592_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110592_0", 0 ); 	--�ڷQ�^���誺���
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110592_5()

	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_2")  , C_SYSTEM )	--�e�������T���G�z�N�^�{�a�I�n�O�bù����I
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_2") , 0 )	--�z�N�^�{�a�I�n�O�bù����I
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--�e�������T���G�^�{�a�I�n�O���ѡI
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--�^�{�a�I�n�O���ѡI
	end

	CloseSpeak( OwnerID() );	--������ܵ���

end
--------------------------------------------------------------------------------------------------------------------------