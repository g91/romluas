function LuaS_110329_0()
	LoadQuestOption()
	if CheckAcceptQuest(OwnerID(),420267) then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110329_1"),  "LuaS_110329_1",  0 );
		--/*�߰ݫe�������F�~�a����k
	end
end
-----------------------------------------------------------------------------------------------------------
function LuaS_110329_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_110329_2" , 0 )
	SetPlot( TargetID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
end
-----------------------------------------------------------------------------------------------------------
function LuaS_110329_2()
	local Chilayk = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110327 , 100 )
	SetPlot( Chilayk , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	Say( OwnerID() ,GetString("SAY_110329_0") ) --/*......
	sleep( 10 )
	Say( OwnerID() ,GetString("SAY_110329_1") ) --/*�ڨS����ܡA�{�b�u��۫H�A�̤F�C
	sleep( 10 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep( 30 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_110329_2") ) --/*�o��M�W���ڪ���A�N�o�Ǧ��b�����F�����m���A�K�i�H���}�q�������F�~�a���q�D�C
	sleep( 10 )
	GiveBodyItem( TargetID() , 201010 , 1 )
	Say( Chilayk , GetString("SAY_110327_0") ) --/*����p�����Ψ���`�a�I
	MoveToFlagEnabled( Chilayk , false )
	FaceObj( Chilayk , OwnerID() )
	sleep( 30 )
	PlayMotion( Chilayk , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Say( OwnerID() ,GetString("SAY_110329_3") ) --/*��C�J�A�ڥu�O�Ʊ�ۤv��h�X�@�I�O�K�K
	sleep( 30 )
	PlayMotion( Chilayk , ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep( 30 )
	Say( Chilayk , GetString("SAY_110327_1") ) --/*��w�p���Ʊ��N�浹�L�̧a�I�ɧ�������_��O�A�{�b���d���A�o�]�O�ڭ̩M��w�p�����w���O�H
	MoveToFlagEnabled( Chilayk , true )
	sleep( 30 )
	SetPlot( Chilayk , "touch" , "" , 0 )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end
------------------------------------------------------------------------------------------------------------
function LuaQ_420345_Complete()
	local Chilayk = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110327 , 100 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	SetPlot( Chilayk , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_110329_4") ) --/*�o�O�K�K�I�H
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DYING)
	MoveToFlagEnabled( Chilayk , false )
	FaceObj( Chilayk , OwnerID() )
	sleep( 30 )
	Say( Chilayk , GetString("SAY_110327_2") ) --/*�ȵa�H�ȵa�H
	--PlayMotion( Chilayk ,   ) --�ۤU���ʧ@
	sleep( 30 )
	Say( Chilayk , GetString("SAY_110327_3") ) --/*�I�l�M�߷i���F�K�K�o�O���^�ơH�ȵa�I���L�ӡI
	sleep( 10 )	
	--PlayMotion( Chilayk ,   ) --���_���ʧ@
	--�ਭ�I��ȵa���ʧ@
	PlayMotion( Chilayk, ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Chilayk , GetString("SAY_110327_4") ) --/*�֡I�֥h�����I�ڭ̤������o�����I
	sleep( 20 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_SLEEP_END) --�ȵa���_���ʧ@
	Say( OwnerID() ,GetString("SAY_110329_5") ) --/*���K�K���ΤF�A�ڨS�ơK�K	
	sleep( 10 )
	--�ਭ����ȵa���ʧ@
	sleep( 30 )
	--PlayMotion( Chilayk ,   ) --�ۤU���ʧ@
	Say( Chilayk , GetString("SAY_110327_5") ) --/*�p�٦n�a�H���o�ͤF�ƻ�ơH
	sleep( 10 )
	Say( OwnerID() ,GetString("SAY_110329_6") ) --/*��A�ڨS�ơA���L���o�ͪ��Ʊ��ڤ]�٤��M���K�K�ڥu���D���@��Ƨڭn�d�M���C
	sleep( 10 )
	--PlayMotion( Chilayk ,   ) --���_���ʧ@
	MoveToFlagEnabled( Chilayk , true )
	Say( OwnerID() ,GetString("SAY_110329_7") ) --/*�q���a�m�W�r�A����ƧڧƱ����U�A�C
	sleep( 30 )
	SetPlot( Chilayk , "touch" , "" , 0 )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end
---------------------------------------------------------------------------------------------------------
function LuaQ_420346_Complete()
	local Chilayk = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110327 , 100 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	SetPlot( Chilayk , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420346_0"), 0 ); --/*�ȵa�ݤF�p�e�Ѥ���N�p�e�ѥ浹��C�J�C
	--PlayMotion( Chilayk ,   ) --�ۤU���ʧ@
	sleep( 30 )
	--PlayMotion( Chilayk ,   ) --���_���ʧ@
	ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420346_1"), 0 ); --/*��C�J�J�Ӧa�ݵۭp���Ѫ����e�C
	sleep( 10 )
	PlayMotion( Chilayk, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep( 30 )
	SetPlot( Chilayk , "touch" , "" , 0 )
	SetPlot( OwnerID() , "touch" , "" , 0 )

end