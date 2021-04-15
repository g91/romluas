function LuaS_420785_start()
	CloseSpeak( TargetID() );	--關閉對話視窗

	CastSpell( TargetID() , TargetID() , 491008 )
	sleep( 5 )
	ChangeZone( TargetID() , 5 , 0, -8109.5, 670 , -7874.3, 0)  --傳送到金恩格旁邊
end