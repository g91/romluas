function Luas_423688()
LoadQuestOption( OwnerID() )	--���J���ȼҪO
	if CheckAcceptQuest( OwnerID(), 423688 ) == true then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423688_1]", "Luas_423688_1", 0 )--�ڷǳƦn�F�A�X�o�a!
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423571_3]", "Luas_423688_2", 0 )--�A�����C
	end
		
end

function Luas_423688_1()
	CloseSpeak( OwnerID() );
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 20 )
	ChangeZone( OwnerID() , 15 , 0 , -4019.2 , 81.4 , 7498.8 , 268.6 )
end
function Luas_423688_2()
	SetSpeakDetail(OwnerID(),"[SC_423571_4]")
end