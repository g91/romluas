function Hsiang_ShowBar( ItemID , Time )
	if BeginCastBar( OwnerID(), "TEST", Time , ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0  ) ~= 1 then
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		return
	end

	while 1 do
		Sleep( 5 )
		local CheckStatus = CheckCastBar( ItemID );
		if( CheckStatus ~= 0 ) then
			if( CheckStatus > 0 ) then
				EndCastBar( OwnerID(), CheckStatus );
				return true;
			else
				-- 失敗
				EndCastBar( OwnerID(), CheckStatus );
				return false;
			end
		end		
	end
end


function Hsiang_TestShowBar( )

	if Hsiang_ShowBar( OwnerID()  ,  50 ) == true then
		Say( OwnerID() , " 成功 " )
	else
		Say( OwnerID() , " 失敗 " )
	end

end