function LuaQ_420320_Complet()

	sleep(5)
	Say( OwnerID() , GetString("ST_420320_3") )	-- �еy�ݤ���C
	sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN );
	Say( OwnerID() , GetString("ST_420320_1") )	-- �ڲ{�b�N�N�]�k�`�J�ŭ����������I
	CastSpell( OwnerID() , OwnerID() , 490112 );	-- �Ѭr���S��
	Sleep(20)
	--PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CAST_END );
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Say( OwnerID() , GetString("ST_420320_2") )	-- �����F�A�o�˴N�i�H�F�I
	sleep(10)

end

function LuaQ_420322_Complet()

	sleep(5)
	Say( OwnerID() , GetString("ST_420322_3") )	-- �еy�ݤ@�U�C
	sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Say( OwnerID() , GetString("ST_420322_1") )	-- �ڲ{�b�ϥγo�Ǫ��~�N�l�������I�[�O�@�I
	CastSpell( OwnerID() , OwnerID() , 490112 );	-- �Ѭr���S��
	Sleep(20)
	--PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Say( OwnerID() , GetString("ST_420322_2") )	-- �n�F�A�o�˴N��F�I
	sleep(10)

end