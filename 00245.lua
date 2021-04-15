function LuaS_ChangeParalledID_0() 
	
	--LoadQuestOption( OwnerID() );
	SetSpeakDetail( OwnerID(), GetString ( "ST_CHANGEPARALLED_MSG" )   )
	--這個世界上受到符文力量的影響，讓時間的流動在某些地方產生了分歧，那些因此而分離的世界我們稱為分流，
	--這些分流與我們的世界就如同一個實體在不同光線下產生的不同影子，這也是我們迷途之光所探討的神祕之一。

	--現在我們迷途之光發現某些特定地點可以讓人前往不同的分流，過去有些人在這個世界找不到自己的方向，就是
	--因為他真正應該去的地方其實是在其他的分流上，你是否也迷惘自己的方向？如果是的話，你或許可以前往其他
	--的分流看看，而我們迷途之光將會幫助你進行這段旅程。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_CHANGEPARALLED") , "LuaS_ChangeParalledID_1", 0 ) --/*我要前往其他分流
end

function LuaS_ChangeParalledID_1() 
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() ,"LuaFunc_ChangeParalledID", 0 )
end

function LuaFunc_ChangeParalledID()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷

		DialogCreate( OwnerID() , EM_LuaDialogType_Select , GetString("CHANGE_PARALLED_DIALOG") );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		local ParalledID 		= 0
		local BaseZoneID      	= 1
		while( 1 ) do --動態建立分流資料
			if( CheckZone( ParalledID * 1000 + BaseZoneID) == false ) then
				break;
			end

			DialogSelectStr( OwnerID() , "<" .. (ParalledID+1) .. ">"  );
			ParalledID = ParalledID + 1;
		end	
		
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)
			--資料送出有問題
			return;
		end

		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF		
		if SelectID >= 0  and SelectID <= ParalledID then --選擇的傳回值與分流代號相同

			CastSpell( OwnerID() , OwnerID() , 491008 )
			sleep(5)
			CastSpell( OwnerID(), OwnerID(), 490102 );
			sleep(5)
			OpenClientMenu( OwnerID() , EM_ClientMenuType_Loading)
			CancelBuff( OwnerID(), 500902 );
			SetParalledID( OwnerID() , SelectID )
			sleep(5)
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("CHANGE_PARALLED_MESSAGE"), "0xFFFFF266" )

		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end