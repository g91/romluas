-----���b�بF�S�D���116306�W����ܼ@��

function LuaS_116306()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423480 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423480_0]" , "LuaS_423480_1", 0 )	--�Чi�D������u�����áv���ǻ��C
	end
end

function LuaS_423480_1()	

	SetSpeakDetail(OwnerID(),"[SC_423480_1]")							--�b�ʦL���ԮɡA�ڭ̪��^��......
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423480_2]" , "LuaS_423480_2", 0 )			--�ӥ޸̨��èS���_�öܡH
end

function LuaS_423480_2()	

	SetSpeakDetail(OwnerID(),"[SC_423480_3]")							--�ӥ޸̪��_�áA�O[115600]���_�áA�o�D�~�ɩһ{�������Ȱ]�_�C...
	SetFlag( OwnerID() , 544390 , 1 )
end

-----���b�p�ԥաD���116339�W����ܼ@��

function LuaS_116339()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423482 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423482_0]" , "LuaS_423482_1", 0 )	--�ڥN��[116306]�ӨӡA�i�D�A����u�����áv���u�ۡC	
	end
end

function LuaS_423482_1()

	SetSpeakDetail(OwnerID(),"[SC_423482_1]")							--�A���u�����áv�u�O�ӪŴáA���Y�S�����e......
	SetFlag( OwnerID() , 544400 , 1 )
end