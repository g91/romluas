function LuaS_110031_0()

	LoadQuestOption( OwnerID() );	
	if CheckAcceptQuest( OwnerID(), 420223 ) then -- �ˬd����
	 	if CountBodyItem( OwnerID(),200677 ) == 0 then
			AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110031_1") , "LuaS_110031_1", 0 ) 
			--/*�˫~�򥢤F
		end 
	end
end
---------------------------------------------------------------------------------------------------
function LuaS_110031_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110031_1")   );
	--/*���o�����A�a�I
	--/*�o�O�ڪ��y�H�B�ͦb���e�o�{���A�L�]�I���������Ǫ��A�ݨӳo�˪��Ǫ����u�@���O�I
	GiveBodyItem( OwnerID(),200677,1)
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110031_0"), "LuaS_110031_EXIT", 0 ) --/*���}	
end
------------------------------------------------------------------------------------------------------
function LuaS_110031_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end
------------------------------------------------------------------------------------------------------