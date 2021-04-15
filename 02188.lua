function kg_117187_01()	--點選舞孃的初始劇情
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "What's wrong???" , "kg_117187_02", 0 )
end

function kg_117187_02()	
	SetSpeakDetail(OwnerID(),"Can you help me???")
	AddSpeakOption( OwnerID(), TargetID( ), "Back" , "kg_117187_01", 0 )
end

function kg_117187_RandomSpeak()
	--kg_ShowID()
	local oid=OwnerID()
	local ranSpeak,ranTime
	while 1 do
		Sleep(1)
		ranSpeak=math.random(3)
		--DebugMsg(0,0,ranSpeak)
		if ranSpeak ==1 then
			NPCSay(oid,"Who can help me...")
		elseif ranSpeak==2 then
			NPCSay(oid,"Ouch..............")
		else 
			NPCSay(oid,"WTF.........")
		end
		ranTime=math.random(300,1200)
		sleep(ranTime)
	end
end
