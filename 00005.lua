function Sys01_NPCDead()
	local OID = OwnerID( )
	local TID = TargetID( )
	
	-- �]�wNPC���`
	NPCDead( OID , TID )
	
	local IncCount = 0;
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if RoomID == 0 then 
		IncCount  = 1;
	end

	Sleep(50);
	--���� �ߧ��_��

	local LootTime = 0;
	while(1) do
		if CheckTreasureDelete( OID ) == true then
			break;
		end
		Sleep( 10);
		LootTime = LootTime + 1;
	end
	
	Sys_NPC_DeadCount = Sys_NPC_DeadCount+IncCount  ;
--	sleep( 100 ) --��Ĭ��2009.4.3 �W�[��������e���s�d�ɶ�
	-- �]�w����
	DelFromPartition( OID )				

	-- ���]NPC���	
	local ReviveTime = ReSetNPCInfo( OID )
	
	if ReviveTime  == -1 then
		Sys_NPC_DeadCount = Sys_NPC_DeadCount-IncCount  ;
		DelObj( OID )
		return
	end

	local IsSpeedUp = true;
	if( ReviveTime > 300 ) then
		IsSpeedUp = false;
	end
	ReviveTime = ReviveTime  - 5 - LootTime;
	Sleep( 50 );
	ReviveTime  = ReviveTime  * ( Rand(60) + 70 ) / 100	
	while( 1) do
		if Sys_NPC_DeadCount  < 50 and IsSpeedUp == false then
			ReviveTime = ReviveTime - 10
		elseif Sys_NPC_DeadCount  < 150 then
			ReviveTime = ReviveTime - 15
		elseif Sys_NPC_DeadCount  < 250 then
			ReviveTime = ReviveTime - 20
		else
			ReviveTime = ReviveTime - 25
		end
		Sleep(  100 )
		if( ReviveTime <= 0 ) then
			break;
		end
	end
	Sys_NPC_DeadCount = Sys_NPC_DeadCount-IncCount  ;

	AssistMagic( OID , 500666 , 10 )
	-- ���s�[�J���ΰ�
	SetFlag( OID , 542497 , 0 ) --��Ĭ��2009.4.3�R������Q�ϥιL���X��--2009.5.7���ʨ�DelFromPartition����--2009.5.11���ʨ�AddToPartition���e
	AddToPartition( OID , -1 ) 
end