function LuaI_110486()

	SetPlot( OwnerID() , "range" , "LuaI_110486_0" , 70 )
end

function LuaI_110486_0()
	BeginPlot( TargetID() , "LuaI_110486_1" , 0 )
end

function LuaI_110486_1()

	if Rand(100) > 40 then
		Say( OwnerID() , GetString("SAY_110486_1") ) --/* ���K���ӤH����٦b����H����٤����H --��STRING1
	else
		Say( OwnerID() , GetString("SAY_110486_2") ) --/* ���K�o�ӫ��~�n�K --��STRING2		
	end
	sleep( 10 )
end


function LuaS_110486_0()
	
	if CheckFlag( OwnerID() , 540820 ) == true and CheckFlag( OwnerID() , 540775 ) == false then
	
		SetSpeakDetail( OwnerID(), GetString("ST_110486_2")   );--/*���K�o�ӫ��~�n�K 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110486_1") , "LuaS_110486_1", 0 ); --/*�]���ۤk�h�A�ݰ_�Ӧ��G������ߨơH�^
	
	else
	
	LoadQuestOption ( OwnerID() ) 	

	end
	
	
end

function LuaS_110486_1()
	SetFlag( OwnerID() ,540775 , 1 ) 
	CloseSpeak( OwnerID() ); 
end








