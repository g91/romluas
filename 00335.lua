function LuaQ_420347_Complete()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110317_0" ) ) --/*�@���e���ڡA���M�h�ΥH�έn�뤤���H���K��a���A�ڳ��M���M�h�Τ��X�{�o�˪����c�A�y�y�K�K
	sleep( 20 )
	ScriptMessage( OwnerID(), TargetID(), 0, GetString("SAY_110317_1" ), 0 ); --/*�J�p���D�������C�n����A���G�u�q���a�m�W�r�A�o��Ƨڤ��Ʊ�Ӧh�H���D�A�ڧƱ�A�����U�ڸѨM���ӫq�{�A���K�a�K�K�v
	sleep( 20 )
	Say( OwnerID() , GetString("SAY_110317_2" ) ) --/*�y�y�I
	SetPlot( OwnerID() , "touch" , "" , 0 )
end