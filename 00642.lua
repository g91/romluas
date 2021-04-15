function LuaI_530064()
	GiveBodyItem ( TargetID() , 530064, 1 )	-- 頭銜：「仙人掌剋星」
	ScriptMessage( TargetID(), TargetID(), 2, GetString("ST_530063") , C_SYSTEM )	--畫面中間訊息：取得頭銜：「仙人掌剋星」
	ScriptMessage( TargetID(), TargetID(), 0, GetString("ST_530063") , 0 )		--系統訊息：取得頭銜：「仙人掌剋星」
end 

