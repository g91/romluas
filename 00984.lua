function E2008HELLDAY_5()--���n��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	MoveToFlagEnabled( OwnerID() , False )
	local Owner = Role:new( OwnerID() )
	local Target=Role:new(TargetID())
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local BaseDir =Target:Dir();
	local RDir = rand(20)
	local PClv = ReadRoleValue( TargetID() , EM_RoleValue_LV)
	local sting = CreateObj( 101332,BaseX, BaseY, BaseZ, BaseDir , 1 )
	local sting1 = CreateObj( 101281,BaseX, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
	local sting2 = CreateObj( 101281,BaseX-30, BaseY, BaseZ, BaseDir+180+RDir , 1 )
	local sting3 = CreateObj( 101331,BaseX+30+RDir, BaseY, BaseZ, BaseDir+180 , 1 )
	local sting4
	local sting5
	local tempa=rand(5)
	Say( OwnerID(),GetString("E2008HELL_K_8"))  --�ܦn�A�ڭn���A�|�|�Q�j�n�ʯ{�������C
	sleep(10)
	Say( OwnerID(),"5" ) --time
	sleep(10)
	Say( OwnerID(),"4" ) --time
	sleep(10)
	Say( OwnerID(),"3" ) --time
	sleep(10)
	Say( OwnerID(),"..." ) --time
	sleep(20)
	AddToPartition(sting, 0 )
	SetPlot(sting,"dead","E2008HELLDAY_dead",0)
	AddToPartition(sting1, 0 )
	AddToPartition(sting2, 0 )
	AddToPartition(sting3, 0 )
--	SetAttack(sting, TargetID() )
--	SetAttack(sting1, TargetID() )
--	SetAttack(sting2, TargetID() )
--	SetAttack(sting3, TargetID() )
	Hide( OwnerID() )
	if tempa >=1 then --�üƦh2��
		sting4 = CreateObj( 101281,BaseX+50, BaseY, BaseZ, BaseDir+180+RDir , 1 )
		sting5 = CreateObj( 101281,BaseX-50, BaseY, BaseZ, BaseDir+180+RDir , 1 )
		AddToPartition(sting4, 0 )
--		SetAttack(sting4, TargetID() )
		AddToPartition(sting5, 0 )
--		SetAttack(sting5, TargetID() )
		Say( sting5, GetString("E2008HELL_K_4")) --�O�ën�ʤ��l!
	end
	local CheckTime = 0
	local Checkdeadtime = 0
	HELLDAYBOSS = "LIVE"
	while true do
		if HELLDAYBOSS == "LIVE"  then
		--	DebugMsg( 0, RoomID ,"##Live CheckTime = "..CheckTime)
			if CheckTime >= 12 then
				if ReadRoleValue(sting, EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(sting) == true or
				   ReadRoleValue(sting1, EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(sting1) == true or
			   	   ReadRoleValue(sting2, EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(sting2) == true or
			   	   ReadRoleValue(sting3, EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(sting3) == true  then  --�٬���
				--	DebugMsg( 0, RoomID ,"**=====Fighting....Live CheckTime = "..CheckTime)
				else
				--	DebugMsg( 0, RoomID ,"=====Leave Fight=====**")
					if CheckID(sting1) == true  then
						DelObj(sting1)
					end
					if CheckID(sting2) == true  then
						DelObj(sting2)
					end
					if CheckID(sting3) == true  then
						DelObj(sting3)
					end
					if tempa >=1 then
 						if CheckID(sting4) == true  then
							DelObj(sting4)
						end
						if CheckID(sting5) == true  then
							DelObj(sting5)
						end
					end
					if CheckID(sting) == true  then
						DelObj(sting)
						HELLDAYBOSS = "DEAD"
					end
					MoveToFlagEnabled( OwnerID() , True )
				end
			end
		else
		--	DebugMsg( 0, RoomID ,"BOSS DEAD , Checkdeadtime = "..Checkdeadtime)
			if Checkdeadtime >= 360 then
				HELLDAYBOSS = "LIVE"			
				break
			end
			Checkdeadtime = Checkdeadtime + 1
		end
		CheckTime = CheckTime + 1
		Sleep( 10 )	-- �����ˬd�@��	
	end
	Show( OwnerID(), 0 )
end

function E2008HELLDAY_6()--���n��
	if ReadRoleValue( OwnerID(), EM_RoleValue_HP)>0 then
		CloseSpeak( OwnerID() )
		BeginPlot( TargetID(), "E2008HELLDAY_5", 10 );
	end
end
function E2008HELLDAY_dead()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	if HELLDAYBOSS == "LIVE" then
		HELLDAYBOSS = "DEAD"
	end
end