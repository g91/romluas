function LuaFunc_LivinSkill_Dialog(String)
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
		
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF

		if SelectID == 0  then

			CastSpell( OwnerID() , OwnerID() , 491010 )
			sleep(5)
			return 1
		elseif SelectID == 1  then

			return 0
		else 

			return 0
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end