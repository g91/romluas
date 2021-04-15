function LuaS_110279_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest( OwnerID() , 420303 ) == true and CheckFlag( OwnerID() , 540255 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110279_0") , "LuaQ_420303_Complete", 0 ); 
		--/*我們什麼時候去找卡夫卡莫伊的寶藏？
	end
end
-----------------------------------------------------------------------------------------------
function LuaQ_420303_Complete()
	CloseSpeak( OwnerID() )  --關閉對話視窗
	BeginPlot( TargetID() , "LuaQ_420303_Plot" , 0 )
end
-----------------------------------------------------------------------------------------------
function LuaQ_420303_Plot()

	DisableQuest( OwnerID() , true )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 666 )
	local DBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	Say( OwnerID() , GetString("SAY_110279_0") ) --/*對了！我之前說要和你分享卡夫卡莫伊的寶藏......
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110279_1") ) --/*我是騙你的，其實啊～
	sleep( 10 )
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	local KFKMY = LuaFunc_CreateObjByObj ( 100355 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(KFKMY,"dead" , "LuaI_110279_dead",0)
	BeginPlot(KFKMY,"LuaQ_420303_Sui",0)
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	sleep( 10 )
	Say( KFKMY , GetString("SAY_110279_2") ) --/*我就是卡夫卡莫伊！而且我要來拿走你身上的寶物囉！
	sleep( 10 )
	SetFightMode( OwnerID() , 1 , 1 , 0 , 1 )
	SetAttack( KFKMY , TargetID() )
	sleep( 10 )
	while true do
		if CheckID(KFKMY) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			--CastSpell( OwnerID(),OwnerID(),490098)
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),DBID,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 540255 ) == true then 
				Say( OwnerID() , GetString("SAY_110279_3") ) --/*停停停～我投降！不要再打了！
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
			end
			sleep( 50 )
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end

end
-----------------------------------------------------------------------------------------------
function LuaQ_420303_Sui()
	LuaFunc_Obj_Suicide(300)
end
-----------------------------------------------------------------------------------------------	
function LuaI_110279_dead()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckCompleteQuest( TargetID() , 420303) == true then 
		SetFlag( TargetID() , 540255, 1 )
	end	
	Delobj( OwnerID() )
	return false
end
-----------------------------------------------------------------------------------------------	
function LuaI_110279_0()
	SetPlot( OwnerID() ,"Range" , "LuaI_110279_1" , 300 )
end
-------------------------------------------------------------------------------------------------
function LuaI_110279_1()
	if CountBodyItem( OwnerID() , 200875 ) > 0 and CheckAcceptQuest( OwnerID() , 420302 ) == false and CheckCompleteQuest( OwnerID() , 420302 ) == false then
		BeginPlot( TargetID() , "LuaI_110279_2" , 0 )
	end
end
-------------------------------------------------------------------------------------------------
function LuaI_110279_2()
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
		AdjustFaceDir( OwnerID(),TargetID(),  0 ) 
		ScriptMessage(  OwnerID(), TargetID(),0, GetString("SAY_110279_4"), C_YELLOW ); --/奇怪的商人對你大喊：喂！來一下！我想跟你作一筆交易。
		PlayMotion(  OwnerID(), ruFUSION_ACTORSTATE_EMOTE_WAVE	)
		sleep( 30 )
	end
end