function LuaQ_420344_Complete()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	local Me = Role:new(OwnerID())
	local RoomID = Me:RoomID()
	CastSpell( OwnerID() , OwnerID() , 490102 )
	Sleep( 50 )
	local HarpyKing = CreateObj( 100141 , Me:X()+50 , Me:Y() , Me:Z()+50 , Me:Dir()+3 , 1) --�N�ΡA��m�n��
	CancelBuff( OwnerID(), 500902 )
	SetRoleCamp( HarpyKing ,"Visitor" )
	AddToPartition( HarpyKing , RoomID )
	sleep( 30 )
	Say( HarpyKing , GetString("SAY_420344_0") ) --/*���F��P�]�ڪ��oô�L�k���ΡA�ڨ���o�˪���i�w�g�Ӥ[�F�A�����ڥåͪ��O�q�a�I���ڥi�H��o�w���C
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_420344_1") ) --/*�����ᦼ���l���N��q�H�]�ڤ��O�ܱj���ɡA��O�䷴�����ɡA��������N��A�@���ű��J�C
	sleep( 30 )
	Say( HarpyKing , GetString("SAY_420344_2") ) --/*�کȦۤv�����쨺�ɭԡA�����g�ɪ���G�A���`���ͪ��h�W�A���ڵL�k����ۤv���ɶ��U�ӷU���C
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_420344_3") ) --/*�^�N�U���A���ߡA�k�h�a�I�^�k�C
	sleep( 30 )
	Say( HarpyKing , GetString("SAY_420344_4") ) --/*�P�E�z�A�����u���A�ڻP�ڤl�������ˡC
	sleep( 30 )
	CastSpell( HarpyKing , HarpyKing , 490102 )
	sleep( 30 )
	DelObj( HarpyKing )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end	