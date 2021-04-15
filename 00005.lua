function Sys01_NPCDead()
	local OID = OwnerID( )
	local TID = TargetID( )
	
	-- 設定NPC死亡
	NPCDead( OID , TID )
	
	local IncCount = 0;
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if RoomID == 0 then 
		IncCount  = 1;
	end

	Sleep(50);
	--等待 撿完寶物

	local LootTime = 0;
	while(1) do
		if CheckTreasureDelete( OID ) == true then
			break;
		end
		Sleep( 10);
		LootTime = LootTime + 1;
	end
	
	Sys_NPC_DeadCount = Sys_NPC_DeadCount+IncCount  ;
--	sleep( 100 ) --阿蘇於2009.4.3 增加屍體消失前的存留時間
	-- 設定消失
	DelFromPartition( OID )				

	-- 重設NPC資料	
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
	-- 重新加入分割區
	SetFlag( OID , 542497 , 0 ) --阿蘇於2009.4.3刪除屍體被使用過的旗標--2009.5.7移動到DelFromPartition之後--2009.5.11移動到AddToPartition之前
	AddToPartition( OID , -1 ) 
end