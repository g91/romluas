function LuaQ_420344_Complete()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	local Me = Role:new(OwnerID())
	local RoomID = Me:RoomID()
	CastSpell( OwnerID() , OwnerID() , 490102 )
	Sleep( 50 )
	local HarpyKing = CreateObj( 100141 , Me:X()+50 , Me:Y() , Me:Z()+50 , Me:Dir()+3 , 1) --代用，位置要調
	CancelBuff( OwnerID(), 500902 )
	SetRoleCamp( HarpyKing ,"Visitor" )
	AddToPartition( HarpyKing , RoomID )
	sleep( 30 )
	Say( HarpyKing , GetString("SAY_420344_0") ) --/*我靈魂與魔族的牽繫無法切割，我受到這樣的折磨已經太久了，取走我永生的力量吧！讓我可以獲得安息。
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_420344_1") ) --/*汝死後汝之子民將何從？魔族之力至強之時，亦是其毀滅之時，收成之日將近，願汝勿棄初衷。
	sleep( 30 )
	Say( HarpyKing , GetString("SAY_420344_2") ) --/*我怕自己撐不到那時候，殺戮狂暴的血液，死亡重生的痛苦，讓我無法控制自己的時間愈來愈長。
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_420344_3") ) --/*吾將助汝，勿懼，歸去吧！吾女。
	sleep( 30 )
	Say( HarpyKing , GetString("SAY_420344_4") ) --/*感激您，風的泉源，我與我子民的母親。
	sleep( 30 )
	CastSpell( HarpyKing , HarpyKing , 490102 )
	sleep( 30 )
	DelObj( HarpyKing )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end	