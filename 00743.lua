function Clock_Counter()
	local StartTime = os.clock ()
	local n = 0
	while true do
		Sleep( 10 )
		n = n + 1
		if n > 60 then -- ¨¾µL½a°j°é¡A60 = ¤@¤ÀÄÁ
			ScriptMessage( OwnerID() , OwnerID() , 0 , "Exit Loop", 0 )
			break
		else

		end

		local NowTime = os.clock ()
		Time = math.floor( NowTime - StartTime )
		Say( OwnerID() , Time )

	end

end
