--�� �H���ͩǨ��� ��--
function sasa_Random_controltest0414()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Count , EM_RoleValue_ZoneID )
	local Flag = DW_CircleRand(10)	--�ݬ����X�ƶq����

--�� �H��BOSS ��--
	for a = 1 , 2 do
		local boss = CreateObjByFlag( 104472 , 781456 , Flag()+0 , 1 )--����RAND���]�tflag0�A�ҥH�qflag4�}�l�ت���A�n�gFlag()+3�A���Lflag1~3
		AddToPartition( boss , Room )
		--BeginPlot( boss , "sasa_104472_AI01010xx" , 0 )
	end
	sleep(10)
end
--�������D�٭n���աA�줣���ܼơC(getmoveflagvalue), 2 arg is null
--�� BOSS AI ��--
function sasa_104472_AI01010xx()
	while 1 do
		local MoveFlag = { 1 , 2 , 3 , 4 }
		for c = 1 , 4 do
			local Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if ( Target ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
				if ReadRoleValue( Target , EM_RoleValue_VOC ) ~= 0 then
					Sleep(5)
				else
					ScriptMessage( OwnerID() , -1 , 1 , "Hi GM, you shouldn't be here." , 1 )
				end
			else
				sleep(10)
				MoveToFlagEnabled( OwnerID() , false )--���a�INPC�樫�����_
				DW_MoveToFlag( OwnerID() , 781457 , MoveFlag[i] , 10 )		--( who , flag , No. , Range )
				sleep(10)
			end
		end
	end
end