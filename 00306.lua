function LuaQ_420310_Complete()
	DisableQuest( OwnerID() , True)
	Say( OwnerID() ,GetString("SAY_110289_0")) --/*�w�쾥�K�K�f�K�K�����w�K�K�I�I�K�K�����K�K
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 30 )
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 30 )
--	local Shadow = LuaFunc_CreateObjByObj ( 100042 , OwnerID() ) --�N��
--	SetRoleCamp( Shadow , "SNPC" )
--	sleep( 30 )	
--	Delobj(Shadow)
	Say( OwnerID() ,GetString("SAY_110289_1")) --/*�I�I�I�㫢���������
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_110289_3")) --/*�S�Q��s�㺸�ᾥ�����`�����O�q�]�u�ѳo�@�I�I�A�٤�����......�٤�����......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG)
	sleep( 50 )
	DisableQuest( OwnerID() , false)	
end
function LusS_110289_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest(OwnerID(),420308) == true or CheckAcceptQuest(OwnerID(),420308) == true then
		if CountBodyItem( OwnerID() , 200885 ) == 0 and CheckCompleteQuest(OwnerID(),420310) == false then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110289_1") , "LuaS_110289_1", 0 ); --/*���F�]��
		end
	end
end

function LuaS_110289_1()

	CloseSpeak( OwnerID() );	--������ܵ���
	Say( TargetID() ,GetString("SAY_110289_2")) --/*�M�ª��å�I���n�ڰ��o���A�ٰO�o�d�U�ƥΪ����q�C
	GiveBodyItem(OwnerID(),200885,1)
end