function Lua_CatchMonsterCheck_0001()

	local Card = {[100054] = 770004 , [100105] = 770004 , [100056] = 770005 , [100146] = 770006 , [100063] = 770009 , 
		[100204] = 770009 , [100055] = 770011 , [100132] = 770026 , [100280] = 770026 , [100211] = 770027 ,
		[100396] = 770027 , [100083] = 770045 , [100299] = 770045 , [100209] = 770053 , [100122] = 770075 , 
		[100226] = 770082 , [100227] = 770083 , [100228] = 770084 
		 } --�ΩǪ��s�������ޡA���e�O�d��ID
	local GuardSummoner = {[100054] = 201161 , [100105] = 201161 , [100056] = 201161 , [100146] = 201161 , [100063] = 201161 , 
			[100204] = 201161 , [100055] = 201161 , [100132] = 201161 , [100280] = 201161 , [100211] = 201161 ,
			[100396] = 201161 , [100083] = 201161 , [100299] = 201161 , [100209] = 201161 , [100122] = 201161 , 
			[100226] = 201161 , [100227] = 201161 , [100228] = 201161 
			 } --�ΩǪ��s���@���ޡA���e�O���������~
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	
	if CountBodyItem( OwnerID() , GuardSummoner[OrgID] ) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_0"), 0 );  --/*�A�w�g�P�P�ت��ͪ��w�U�����C		
		return false
	elseif CheckCardFlag( OwnerID(), Card[OrgID] ) == true then --�p�G���d���~Ĳ�o
		return true
	elseif CheckID( TargetID() ) == false or TargetID() == OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201167_2"), 0 ); --/*�A�S���ؼСC
		return false
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_1"), 0 );  --/*�A�����A���ؼЪ��u�W�A�L�k�l���F����C
		return false
	end
	
end

function Lua_CatchMonsterSpellCheck_0001()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	Local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_2"), 0 );  --/*�A�u���ݵۧA���������ؼнl���F����C
		return false
	elseif ReadRoleValue( TargetID() , EM_RoleValue_LV ) - ReadRoleValue( OwnerID() , EM_RoleValue_LV ) > 5 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_3"), 0 );  --/*�o�ӥؼЪ��F��L��j�j�A�A�L�k�P��l�������C
		return false
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_LV ) - ReadRoleValue( TargetID() , EM_RoleValue_LV ) > 5 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_4"), 0 );  --/*�o�ӥؼЪ��F��i��|�b�l���������L�{���Q�A�R���C
		return false
	end
	if MaxHP >= 5000 then
		if ReadRoleValue(TargetID() ,EM_RoleValue_HP ) < 500 then
				return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_5"), 0 );  --/*�b�ؼЪ��F��}�A�e�A�L�k�P��l�������C	
			return false
		end
	elseif ReadRoleValue( TargetID() , EM_RoleValue_HP ) < MaxHP/10 or ReadRoleValue( TargetID() , EM_RoleValue_HP ) < 30 then			
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_5"), 0 );  --/*�b�ؼЪ��F��}�A�e�A�L�k�P��l�������C	
		return false
	end
			
end

function Lua_CatchMonsterUse_0001()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	Local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local GuardSummoner = {[100054] = 201161 , [100105] = 201161 , [100056] = 201161 , [100146] = 201161 , [100063] = 201161 , 
			[100204] = 201161 , [100055] = 201161 , [100132] = 201161 , [100280] = 201161 , [100211] = 201161 ,
			[100396] = 201161 , [100083] = 201161 , [100299] = 201161 , [100209] = 201161 , [100122] = 201161 , 
			[100226] = 201161 , [100227] = 201161 , [100228] = 201161 
			 } --�ΩǪ��s���@���ޡA���e�O���������~
	if MaxHP >= 5000 then
		if ReadRoleValue(TargetID() ,EM_RoleValue_HP ) < 500 then
			if Rand( 500*1.25 ) > ReadRoleValue( TargetID() ,EM_RoleValue_HP ) then	
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_OK_0"), 0 );  --/*�A���\���l���F�F����I
				if BeginPlot( TargetID() , "Lua_NPC_Reset_Function" , 0 ) and GuardSummoner[OrgID] ~= null then
					GiveBodyItem( OwnerID() , GuardSummoner[OrgID] , 1 )
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_6"), 0 );  --/*�ؼЩڵ��P�A�l�������C
			end
		end
	elseif ReadRoleValue( TargetID() , EM_RoleValue_HP ) < MaxHP/10 or ReadRoleValue( TargetID() , EM_RoleValue_HP ) < 30 then
			if Rand( MaxHP*1.25/10 ) > ReadRoleValue(TargetID() ,EM_RoleValue_HP ) then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_OK_0"), 0 );  --/*�A���\���l���F�F����I			
				if BeginPlot( TargetID() , "Lua_NPC_Reset_Function" , 0 ) and GuardSummoner[OrgID] ~= null then
					GiveBodyItem( OwnerID() , GuardSummoner[OrgID] , 1 )
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_6"), 0 );  --/*�ؼЩڵ��P�A�l�������C
			end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_CATCH_ERROR_5"), 0 );  --/*�b�ؼЪ��F��}�A�e�A�L�k�P��l�������C	
	end

			
end

function Lua_NPC_Reset_Function()
	
	local OID = OwnerID( )
	local TID = TargetID( )
	
	local IncCount = 0;
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if RoomID == 0 then 
		IncCount  = 1;
	end
	
	Sys_NPC_DeadCount = Sys_NPC_DeadCount+IncCount  ;
	--Say( TargetID() , "Sys_NPC_DeadCount" .. Sys_NPC_DeadCount .. "IncCount ".. IncCount )
	--Sleep(50);
	-- �]�w����
	DelFromPartition( OID )			
	
	-- ���]NPC���	
	local ReviveTime = ReSetNPCInfo( OID )
	
	if ReviveTime  == -1 then
		Sys_NPC_DeadCount = Sys_NPC_DeadCount-IncCount  ;
		DelObj( OID )
		return
	end
	ReviveTime = ReviveTime  - 5;
	Sleep( 50 );
	ReviveTime  = ReviveTime  * ( Rand(60) + 70 ) / 100	
	while( 1) do
		if Sys_NPC_DeadCount  < 50 then
			ReviveTime = ReviveTime - 1
		elseif Sys_NPC_DeadCount  < 100 then
			ReviveTime = ReviveTime - 3
		elseif Sys_NPC_DeadCount  < 150 then
			ReviveTime = ReviveTime - 9
		else
			ReviveTime = ReviveTime - 27
		end
		Sleep(  10 )
		if( ReviveTime <= 0 ) then
			break;
		end
	end
	Sys_NPC_DeadCount = Sys_NPC_DeadCount-IncCount  ;
	-- ���s�[�J���ΰ�
	AddToPartition( OID , -1 ) 

end