function LuaS_110090_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest(OwnerID(),420268) then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SO_110090_1"),"LuaS_110090_1",0)
		--/*�ШD�����F���}�q����~�a���q�D
	end
end
--------------------------------------------------------------------------------------------------
function LuaS_110090_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaQ_420268_Accept" , 0 )
end
--------------------------------------------------------------------------------------------------
function LuaQ_420268_Accept()
	--�ˬd�ǰe���b���b�A���b�N�}��
	--�l��ǰe��(�ƥ�)
	Say( OwnerID() , "�����}�F" )
	--BeginPlot( Door , "LuaQ_420268_DoorClose" , 0 ) --�]�w����
end
---------------------------------------------------------------------------------------------------
function LuaQ_420268_DoorClose()
	sleep( 300 )
 	DelObj( OwnerID() )
end
---------------------------------------------------------------------------------------------------