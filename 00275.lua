--工事殘骸

function LuaI_110125()

	SetPlot( OwnerID() , "touch" , "LuaI_110125_1" , 40 )	

end
function LuaI_110125_1()
	if CheckAcceptQuest( OwnerID() , 420143 ) then
		SetPlot( TargetID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
		BeginPlot( TargetID() , "LuaI_110125_2" , 0 )	
	end
end

function LuaI_110125_2()

	Local R = Rand( 7 )
	if R <= 2  then
		GiveBodyItem( TargetID() , 200580 , 1 )
	elseif R == 7 then
		GiveBodyItem( TargetID()  , 200580 , 2 )
	elseif R == 5 then
		GiveBodyItem( TargetID()  , 200581 , 2 )		
	else
		GiveBodyItem( TargetID()  , 200581 , 1 )
	end			
	Hide( OwnerID() )
	sleep( 100 )
	SetPlot( OwnerID() , "touch" , "LuaI_110125_1" , 40 )	
	Show( OwnerID() , 0 )		
end
--瑪爾
function LuaQ_420145_Complete()

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_JUMP )
	sleep( 20 )
	Say( OwnerID() , GetString("SAY_110117_0")) --/*糟糕！剩下的麵包不小心都掉到地上了……	

end
--反骷髏幫勢力名冊
function LuaI_200574()
	if CheckAcceptQuest( OwnerID() , 420133 ) then
		SetFlag( OwnerID() , 540224 , 1)
	end
	Say( OwnerID() , "你將反骷髏幫勢力名冊毀掉了。" )
	DelBodyItem( OwnerID() , 200574 , 1 )
end
--鐵匠

function LuaS_110439_0()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110439_0") , "LuaS_110439_SHOP", 0 ); 
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110439_SHOP()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	ZONE3_SMITH_SHOP(TargetID())

end