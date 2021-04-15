function LuaS_110031_0()

	LoadQuestOption( OwnerID() );	
	if CheckAcceptQuest( OwnerID(), 420223 ) then -- 檢查任務
	 	if CountBodyItem( OwnerID(),200677 ) == 0 then
			AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110031_1") , "LuaS_110031_1", 0 ) 
			--/*樣品遺失了
		end 
	end
end
---------------------------------------------------------------------------------------------------
function LuaS_110031_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110031_1")   );
	--/*那這罐給你吧！
	--/*這是我的獵人朋友在之前發現的，他也碰到類似的怪物，看來這樣的怪物不只一隻呢！
	GiveBodyItem( OwnerID(),200677,1)
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110031_0"), "LuaS_110031_EXIT", 0 ) --/*離開	
end
------------------------------------------------------------------------------------------------------
function LuaS_110031_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end
------------------------------------------------------------------------------------------------------