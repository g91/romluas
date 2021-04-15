function CreateMonsterTest(MonsterID  ,  Count  , IsNeedKillMonster)
	local Obj = Role:new( OwnerID() )
	local X = Obj:X()
	local Z = Obj:Z()
	
	--�x�s�Ǫ�ID���}�C
	local MonsterObjList = {}

	for i = 1 , Count , 1 do
		MonsterObjList [i] = CreateObj( MonsterID , X + 100 , Obj:Y() , Z , 0 , 1 );
		AddToPartition( MonsterObjList [i]  , Obj:RoomID() );
		SetAttack( MonsterObjList [i] , OwnerID() );
	end

	--���ݩǪ��Q��
	local IsFind
	if IsNeedKillMonster == true then
		while 1 do
			Sleep( 10 )
			IsFind = false

			for i = 1 , Count , 1 do
				if CheckID( MonsterObjList [i] ) == true then
					IsFind = true
					break
				end
			end

			if IsFind == false then 
				Obj:Say( "NoMonster" );
				break
			end
		end
	end
	

end