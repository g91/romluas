function LuaYU_111813_221()  
			SetCursorType( OwnerID() , eCursor_Mine );
			SetPlot( OwnerID() ,"touch",  "LuaYU_111813_222" , 10 )   
end

function LuaYU_111813_222()


	if BeginCastBar( OwnerID(), "[SC_111813_YU_25]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
 		--使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

		while true do
		sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then

			PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146

 			AttachCastMotionTool( OwnerID() , 210508 ); --置換武器為圓鍬



		end
	end



end