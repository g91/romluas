function LuaI_110929_1()
	MoveToFlagEnabled( OwnerID() , False )
	local Owner = Role:new( OwnerID() )
	local Target=Role:new(TargetID())
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local BaseDir =Target:Dir();
	local sting = CreateObj( 100670,BaseX+30, BaseY, BaseZ, BaseDir+180 , 1 )
	local sting1 = CreateObj( 100670,BaseX, BaseY, BaseZ+30, BaseDir+180 , 1 )
	local sting2 = CreateObj( 100670,BaseX-30, BaseY, BaseZ, BaseDir+180 , 1 )
	local sting3 = CreateObj( 100670,BaseX, BaseY, BaseZ-30, BaseDir+180 , 1 )
	local sting4 =0
	local sting5 =0
	local helper = CreateObj(100669, BaseX, BaseY, BaseZ, BaseDir, 1 )		

	local tempa=rand(5)
	AddToPartition(sting, 0 )
	AddToPartition(sting1, 0 )
	AddToPartition(sting2, 0 )
	AddToPartition(sting3, 0 )
	SetAttack(sting, TargetID() )
	SetAttack(sting1, TargetID() )
	SetAttack(sting2, TargetID() )
	SetAttack(sting3, TargetID() )
	sleep(10)
	Hide( OwnerID() )
	AddToPartition( helper, 0 )
	setrolecamp(helper,"SNPC")

	if tempa >3 then --亂數多2之
		sting4 = CreateObj( 100670,BaseX+50, BaseY, BaseZ, BaseDir+180 , 1 )
		sting5 = CreateObj( 100670,BaseX-50, BaseY, BaseZ, BaseDir+180 , 1 )
		AddToPartition(sting4, 0 )
		SetAttack(sting4, TargetID() )
		AddToPartition(sting5, 0 )
		SetAttack(sting5, TargetID() )
		Say( helper, GetString("LU_700636"))--哇，還真多，這下可好了。
	end

	sleep(120)
	Say( helper, GetString("LU_700637"))--真是難纏的怪物	

	while true do
		if ReadRoleValue(sting, EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(sting) == true or
		   ReadRoleValue(sting1, EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(sting1) == true or
	   	   ReadRoleValue(sting2, EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(sting2) == true or
	   	   ReadRoleValue(sting3, EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(sting3) == true  then  --檢查是否離開戰鬥
		else
			if CheckID(sting) == true  then
				DelObj(sting)
			end
			if CheckID(sting1) == true  then
				DelObj(sting1)
			end
			if CheckID(sting2) == true  then
				DelObj(sting2)
			end
			if CheckID(sting3) == true  then
				DelObj(sting3)
			end
			if CheckID(sting4) == true  then
				DelObj(sting4)
			end
			if CheckID(sting5) == true  then
				DelObj(sting5)
			end
			if CheckID(helper) == true  then
				DelObj(helper)
			end
			Say( helper,GetString("LU_700638"))--終於逃掉了，不過可能還會有下一波攻擊。
			MoveToFlagEnabled( OwnerID() , True )
			break		
		end
		Sleep( 60 )	-- 六秒檢查一次	
	end
	sleep(1)
	Show( OwnerID(), 0 )
end