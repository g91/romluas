function bk_423284_15_0()
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	if CheckCompleteQuest(OwnerID(),423285) ==true or CheckAcceptQuest(OwnerID(),423285) ==true then 
		AddSpeakOption( OwnerID(), TargetID(), "[SC_115531_1]", "bk_423284_15_1", 0 )
	elseif CheckCompleteQuest(OwnerID(),423285) ==false or CheckAcceptQuest(OwnerID(),423285) ==false then 
	
	end
end
function bk_423284_15_1()
	if ChangeZone( OwnerID() , 209 , 0, 1645 , 753, -4909 , 272 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
function bk_423284_209_0()
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	if CheckCompleteQuest(OwnerID(),423285) ==true or CheckAcceptQuest(OwnerID(),423285) ==true then 
		AddSpeakOption( OwnerID(), TargetID(), "[SC_115531_1]", "bk_423284_209_1", 0 )
	elseif CheckCompleteQuest(OwnerID(),423285) ==false or CheckAcceptQuest(OwnerID(),423285) ==false then 
	
	end
end
function bk_423284_209_1()
	if ChangeZone( OwnerID() , 209 , 0, 63.3 , 858 , -820 , 270 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

