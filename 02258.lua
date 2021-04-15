function Zone13_Fish_Shop() --肉品
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

--------------------石碑介面簡易版------------------

function LuaAS_423817()--填入任務編號即可 目前版本只可對點擊物品取得任務使用
	if	CheckCompleteQuest(OwnerID(),423817) == true	then
		setflag(OwnerID(),544773,1)
	elseif	CheckCompleteQuest(OwnerID(),423817) == false	or	CheckAcceptQuest(OwnerID(),423817) == false	then
		DW_Border(423817) 
	end
end