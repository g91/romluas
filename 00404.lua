function LuaInit_110346()
	--SetCursorType( OwnerID(), 1 );
	SetPlot( OwnerID() , "touch" , "LuaCollision_110346" , 150 );

end

function LuaCollision_110346()
--OwnerID玩家
--TargetID地板
	BeginPlot( TargetID() , "LuaCollision_110346_2" , 0 )  

end

function LuaCollision_110346_2()
--OwnerID地板
--TargetID玩家

       --int BeginCastBarEvent ( int iObjID, int iClickObjID, const char* pszString, int iTime, int iMotionID, int iMotionEndID, int iFlag, const char* pszLuaEvent )  新的CastingBar
       --                                     （  開bar者  ,    被開者           ,       Bar上的文字   ,        所需時間   ,  開始動作     ,  結束動作             , 中斷模式  ,  連結事件 ）
	if BeginCastBarEvent( TargetID(), OwnerID(),"TEST", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaCastCallBackHui" ) ~= 1 then
		ScriptMessage( TargetID(), TargetID(), 0,"[SAY_NPC_BUSY]", 0 );
		return
	end

	

end

function LuaCastCallBackHui( ObjID, CheckStatus )
--OwnerID玩家
--TargetID地板

		if( CheckStatus ~= 0 ) then

			if( CheckStatus > 0 ) then
				-- 成功
				EndCastBar( OwnerID(), CheckStatus );
				Say( OwnerID(), "GOOD1" );
			else
				-- 失敗
				EndCastBar( OwnerID(), CheckStatus );
				Say( OwnerID(), "FAILD1" );
			end
		end

end