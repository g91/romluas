function Zone13_Fish_Shop() --�׫~
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Fish );
	SetShop( OwnerID() , 600269 , "Test_Shop_Close" );
end

--------
Function LuaAS_Mining()
	while 1 do
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN )
	sleep(50)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_END )
	end	
end

------
function LuaAS_Speaking()
	while 	1 	do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		NPCSAY(OwnerID(),"[SC_117394_01]")
		sleep(30+Rand(20))
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		NPCSAY(OwnerID(),"[SC_117394_02]")
		sleep(30+Rand(20))
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		NPCSAY(OwnerID(),"[SC_117394_03]")
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		NPCSAY(OwnerID(),"[SC_117394_01]")
		Sleep(300)
	end
end

--------------------�۸O����²����------------------

function LuaAS_423817()--��J���Ƚs���Y�i �ثe�����u�i���I�����~���o���Ȩϥ�
	if	CheckCompleteQuest(OwnerID(),423817) == true	then
		setflag(OwnerID(),544773,1)
	elseif	CheckCompleteQuest(OwnerID(),423817) == false	or	CheckAcceptQuest(OwnerID(),423817) == false	then
		DW_Border(423817) 
	end
end