
function Test_ManySpeller( num )--產生測試用的NPC
	local OID = OwnerID()
	local FlagID =  780656
	Test_ManySpeller_TransTime = 30;
	Test_ManySpeller_Num = 40;
	Test_ManySpelle_AI_Lock = false;
	num = num or 2

	for i=0, num do
		--local ctrl = CreateObj( 115053, ReadRoleValue( OID, EM_RoleValue_X ), ReadRoleValue( OID, EM_RoleValue_Y ), ReadRoleValue( OID, EM_RoleValue_Z ), 0 , 1 );
		local ctrl = CreateObj( 115053, GetMoveFlagValue( FlagID, i , EM_RoleValue_X ), GetMoveFlagValue( FlagID, i , EM_RoleValue_Y ), GetMoveFlagValue( FlagID, i , EM_RoleValue_Z ), 0, 1 );
		AddToPartition( ctrl, 0 );
		CallPlot( ctrl, "Test_ManySpeller_Ctrl", 0)
		DebugMsg(0,0,"Create Test ManySpeller Ctrl")
		sleep(10)
	end
end

function Test_ManySpeller_Ctrl()
	DebugMsg(0,0,"Start Test ManySpeller")
	local num = Test_ManySpeller_Num or 1
	local OID = OwnerID();
	--local GoodID = 103123;
	local GoodID = 100152;
	local BadID = 103121;

	local X = ReadRoleValue( OID, EM_RoleValue_X )
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local Z = ReadRoleValue( OID, EM_RoleValue_Z )
	if Test_ManySpeller_Obj == nil then
		Test_ManySpeller_Obj = {}
	end

	for i=1, num do
		local obj = CreateObj( GoodID, X+math.random(-20,20), Y , Z+math.random(-20,20) , 0 , 1 );
		CallPlot( obj, "Test_ManySpelle_AI", X, Y, Z )
		SetPlot( obj, "dead", "Test_ManySpeller_dead", 0 )
		SetRoleCamp( obj, "SNPC");
		AddToPartition( obj, 0 );
		table.insert( Test_ManySpeller_Obj, obj )
		
		local obj = CreateObj( BadID, X+math.random(-20,20), Y , Z+math.random(-20,20), 0 , 1 );
		CallPlot( obj, "Test_ManySpelle_AI", X, Y, Z )
		SetPlot( obj, "dead", "Test_ManySpeller_dead", 0 )
		AddToPartition( obj, 0 );
		table.insert( Test_ManySpeller_Obj, obj )
		sleep(10)
	end
	DebugMsg(0,0,"Create Test ManySpeller End")
	DelObj(OID)
end

function Test_ManySpelle_AI( X, Y, Z )
	local OID = OwnerID()
	local MagicID = {490242,--電擊術
			490239,--鳳凰
			491153,--煉獄之火
			490281,--群體治癒術

			490204,--火球			
			490212,--落雷召喚
			491150,--火焰術
			490252,--銀河
			491168,--電球術
			491169,--紫雷箭

			490256,--激流衝擊
			490274,--冰霧術
			491165,--刺骨寒氣
			}
	local MagicNum = table.getn(MagicID);

	while true do
		local time = Test_ManySpeller_Time or 1
		for i=1, time do
			if Test_ManySpelle_AI_Lock == nil then
				delobj(OID)
			end
			sleep(10)
		end
		local TID = ReadRoleValue( OID, EM_RoleValue_AttackTargetID )
		if TID == 0 and hateListCount( OID ) == 0 then
			--MoveDirect( OID, X, Y, Z )
		elseif ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 0 then
			while true do
				local Rnd = rand(MagicNum)+1;
				if KS_GetColdown( OID, MagicID[Rnd] ) == 0 then
					if Rnd > 4 then
						CastSpell( OID, TID, MagicID[Rnd] )
					else
						CastSpell( OID, OID, MagicID[Rnd] )
					end
					break;
				end
			end
		end
	end
end

function Test_ManySpeller_dead()
	return false
end

function Test_ManySpeller_Delet()
	DebugMsg(0,0,"Delet Test ManySpeller")
	Test_ManySpelle_AI_Lock = nil;
	if Test_ManySpeller_Obj ~= nil then
		for obj in pairs(Test_ManySpeller_Obj) do
			if CheckID(obj) == true then
				DelObj(obj)
			end
		end
		Test_ManySpeller = nil
	end
end

function Test_ManySpeller_SetTime( time )
	Test_ManySpeller_Time = time
end

function Test_ManySpeller_SetNum( num )
	Test_ManySpeller_Num = num
end

function Test_ManySpeller_SetTransTime( time )
	Test_ManySpeller_TransTime = time
end

function Test_ManySpeller_Trans()
	local FlagID =  780656
	local OID = OwnerID()
	local op = true
	local i = 0;

	while true do		
		Test_ManySpeller_TransTime = Test_ManySpeller_TransTime or 10

		sleep(Test_ManySpeller_TransTime*10)
		DebugMsg(0,0,"Trans to Flag "..i )
		local X = GetMoveFlagValue( FlagID, i , EM_RoleValue_X )
		local Y = GetMoveFlagValue( FlagID, i , EM_RoleValue_Y )
		local Z = GetMoveFlagValue( FlagID, i , EM_RoleValue_Z )
		SetPos( OID, X, Y, Z, 0 )
		if i <= 1 and op == true then
			i = i+1
		elseif i > 0 and op == false then
			i = i-1
		end
		
		if i == 2 then
			op = false
		elseif i == 0 then
			op = true
		end
	end
end
