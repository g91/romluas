
function LuaS_112151_event()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_K_09V_112151_0") , "LuaS_112151_1", 0 ) --餵食乳牛山魔楊草 200335 100192  570026
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_K_09V_112151_1") , "LuaS_112151_2", 0 ) --餵食乳牛野漿草200334 
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_K_09V_112151_2") , "LuaS_112151_3", 0 ) --餵食乳牛艾爾香草200338
end

function LuaS_112151_1()
local KeyID =200335
local KeyID2=209136 --花神專用山魔楊草
CloseSpeak( OwnerID() )
	IF CountBodyItem( OwnerID() , KeyID2 ) > 0 then
		BeginPlot( OwnerID(), "LuaS_112151_9",10 );
	else
		if( KeyID ~= 0 and  CountBodyItem( OwnerID() , KeyID ) <= 0 ) then
			Say( TargetID() , GetString( "SC_K_09V_112151_3" ));
			return;
		end

		BeginPlot( OwnerID(), "LuaS_112151_9",10 );
	end
end


function LuaS_112151_9()
if BeginCastBar( OwnerID() , GetString("SC_K_09V_112151_0") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 )==1 then
	while 1 do
			if ( CheckCastBar( OwnerID()  ) > 0) then -- 成功
				result = true
				EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
				break;
			end
			if ( CheckCastBar( OwnerID()  )< 0 ) then -- 失敗
				result = false
				EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
				break;
			end
	CloseSpeak( OwnerID() )
	sleep( 5 )
	end
	if result == true and CountBodyItem( OwnerID() , 209136 ) >=1 then 
	DelBodyItem( OwnerID() , 209136 , 1 )
		local tempA=rand(3)
		if tempA==0 then
		GiveBodyItem( OwnerID() , 202983  , 1 )
		else
		ScriptMessage(  OwnerID() , OwnerID() , 0,GetString( "SC_K_09V_112151_4" ),0)
		end
	else
		if result == true and CountBodyItem( OwnerID() , 200335 ) >=1 then 
		DelBodyItem( OwnerID() , 200335 , 1 )
			local tempA=rand(3)
			if tempA==0 then
			GiveBodyItem( OwnerID() , 202983  , 1 )
			else
			ScriptMessage(  OwnerID() , OwnerID() , 0,GetString( "SC_K_09V_112151_4" ),0)
			end
		end
	end
end
end


function LuaS_112151_2()
local KeyID =200334
CloseSpeak( OwnerID() )
	if( KeyID ~= 0 and  CountBodyItem( OwnerID() , KeyID ) <= 0 ) then
		Say( TargetID() , GetString( "SC_K_09V_112151_3" ));
		return;
	end
	BeginPlot( OwnerID(), "LuaS_112151_10",10 );
end

function LuaS_112151_10()
if BeginCastBar( OwnerID() , GetString("SC_K_09V_112151_1") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 )==1 then
	while 1 do
			if ( CheckCastBar( OwnerID()  ) > 0) then -- 成功
				result = true
				EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
				break;
			end
			if ( CheckCastBar( OwnerID()  )< 0 ) then -- 失敗
				result = false
				EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
				break;
			end
	CloseSpeak( OwnerID() )
	sleep( 5 )
	end
	if result == true and CountBodyItem( OwnerID() , 200334 ) >=1 then 
	DelBodyItem( OwnerID() , 200334 , 1 )
		local tempB=rand(2)
		if tempB==0 then
		GiveBodyItem( OwnerID() , 202983  , 1 )
				else
		ScriptMessage(  OwnerID() , OwnerID() , 0,GetString( "SC_K_09V_112151_4" ),0)
		end
	end
end
end



function LuaS_112151_3()
	local KeyID =200338
CloseSpeak( OwnerID() )
	if( KeyID ~= 0 and  CountBodyItem( OwnerID() , KeyID ) <= 0 ) then
		Say( TargetID() , GetString( "SC_K_09V_112151_3" ));
		return;
	end
	BeginPlot( OwnerID(), "LuaS_112151_11",10 );
	end

function LuaS_112151_11()
if BeginCastBar( OwnerID() , GetString("SC_K_09V_112151_2") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 )==1 then
	while 1 do
			if ( CheckCastBar( OwnerID()  ) > 0) then -- 成功
				result = true
				EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
				break;
			end
			if ( CheckCastBar( OwnerID()  )< 0 ) then -- 失敗
				result = false
				EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
				break;
			end
	CloseSpeak( OwnerID() )
	sleep( 5 )
	end
	if result == true and CountBodyItem( OwnerID() , 200338 ) >=1 then 
	DelBodyItem( OwnerID() , 200338 , 1 )
	GiveBodyItem( OwnerID() , 202983  , 1 )
	end
end
end