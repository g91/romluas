function LuaS_110922_0()
	----�ᯫ�`���� �}���������� ���׶ǰe
	if CheckBuff(OwnerID(), 621880) == TRUE then
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011_FN13]")
		return
	end
	----

	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110755_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110755_1", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_6"), "LuaS_110755_6", 0 ) --�ڷQ�ǰe��Z��R������F��
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_7"), "LuaS_110755_7", 0 ) --�ڷQ�ǰe��Z��R���������s����
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_8"), "LuaS_110755_8", 0 ) --�ڷQ�ǰe��Z��R�������U�F��
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_9"), "LuaS_110755_9", 0 ) --�ڷQ�ǰe��Z��R�������U���
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_10"), "LuaS_110728_10", 0 ) --�ڷQ�ǰe��Z��R���������X�f
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SC_111339_12"), "LuaS_111339_12", 0 ) --�ڷQ�ǰe���̤����j�U

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------------------

function LuaS_110755_11()

	CloseSpeak( OwnerID() );	--������ܵ���

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 2 , 0,5267,61,-3901,50)	--�Z��R����¾�~�j�U

end
