function LuaS_111339_0()
	----�ᯫ�`���� �}���������� ���׶ǰe
	if CheckBuff(OwnerID(), 621880) == TRUE then
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011_FN13]")
		return
	end
	----

	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110728_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110728_1", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_6"), "LuaS_110728_6", 0 ) --�ڷQ�ǰe��Z��R������F��
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_7"), "LuaS_110728_7", 0 ) --�ڷQ�ǰe��Z��R���������s����
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_8"), "LuaS_110728_8", 0 ) --�ڷQ�ǰe��Z��R�������U�F��
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_9"), "LuaS_110727_9", 0 ) --�ڷQ�ǰe��Z��R�������U���
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_10"), "LuaS_110728_10", 0 ) --�ڷQ�ǰe��Z��R���������X�f
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_11"), "LuaS_110755_11", 0 ) --�ڷQ�ǰe��Z��R����¾�~�j�U

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111339_12()
	CloseSpeak( OwnerID() );	--������ܵ���

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 2 , 0,6922,59,-2496,50)	--��̤���
end
