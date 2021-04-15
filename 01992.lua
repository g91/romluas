-----掛在喀沙特．怒牙116306上的對話劇情

function LuaS_116306()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423480 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423480_0]" , "LuaS_423480_1", 0 )	--請告訴我關於「黃金棺」的傳說。
	end
end

function LuaS_423480_1()	

	SetSpeakDetail(OwnerID(),"[SC_423480_1]")							--在封印之戰時，我們的英雄......
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423480_2]" , "LuaS_423480_2", 0 )			--墓穴裡其實並沒有寶藏嗎？
end

function LuaS_423480_2()	

	SetSpeakDetail(OwnerID(),"[SC_423480_3]")							--墓穴裡的寶藏，是[115600]的寶藏，卻非外界所認為的金銀財寶。...
	SetFlag( OwnerID() , 544390 , 1 )
end

-----掛在穆拉白．怒牙116339上的對話劇情

function LuaS_116339()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423482 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423482_0]" , "LuaS_423482_1", 0 )	--我代替[116306]而來，告訴你關於「黃金棺」的真相。	
	end
end

function LuaS_423482_1()

	SetSpeakDetail(OwnerID(),"[SC_423482_1]")							--你說「黃金棺」只是個空棺，裡頭沒有遺骸......
	SetFlag( OwnerID() , 544400 , 1 )
end