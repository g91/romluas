
function LuaS_InstanceTellTime()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	Say(OwnerID() , Ver_Zone200_TestTime[RoomID] )
end

function LuaS_InstanceChangeTime(Time)
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	Ver_Zone200_TestTime[RoomID] = Time
	Say(OwnerID() , Ver_Zone200_TestTime[RoomID] )
end

function LuaS_Discowood_InstanceOnce()
	if CheckBuff( OwnerID() , 500669) then

	else
		if CountBodyItem(OwnerID() , 200392 ) > 0 then
			if	CastSpell( TargetID() , OwnerID() , 491284 ) then--�I�k
				DelBodyItem(OwnerID(),200392,1)
				sleep(10)
			end
		else
			BeginPlot(  OwnerID() , "LuaS_Discowood_InstanceOut" , 0 )
		end
	end
end

--���a�i�J�NĲ�I�d��@���������
function LuaS_Discowood_FireInstance()
	--Ĳ�I�@��
	SetPlot(OwnerID(),"range","LuaS_Discowood_InstanceOnce", 100)
	--�����^�ǭ�
	local Pass = false
	--������h��
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	--�ŧi���եΪ��Ӽh�����ܼ�
	Ver_Zone200_TestTime[RoomID]=0
	--�����ƥ��}���ɶ�
	local Original_Hour = GetSystime(1)
	local Original_Min = GetSystime(2)
	--�n�}�l�s�����y�{
	local ReportTime = 55
	--�гy�Ǫ��ì���ID
	local Array = {}
	--��1�i
	Array = LuaS_Discowood_InstanceMonster(100377 , 18 ,  100376 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--��2�i
	Array = LuaS_Discowood_InstanceMonster(100692 , 18 ,  100281 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--��3�i
	Array = LuaS_Discowood_InstanceMonster(100097 , 18 ,  100131 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--��4�i
	Array = LuaS_Discowood_InstanceMonster(100264 , 13 ,  100562 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--��5�i
	Array = LuaS_Discowood_InstanceMonster(100236 , 13 ,  100228 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--��6�i
	Array = LuaS_Discowood_InstanceMonster(100611 , 13 ,  100366 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--��7�i
	Array = LuaS_Discowood_InstanceMonster(100625 , 10 ,  100370 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--��8�i
	Array = LuaS_Discowood_InstanceMonster(100160 , 10 ,  100138 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--�X�_�c
	local Chest = CreateObjByFlag( 100939 , 780087 , 0 , 1 )
	SetFightMode ( Chest,0,0,0,0 )
	AddToPartition(Chest,RoomID)
	BeginPlot( Chest , "LuaS_Discowood_InstanceChest" , 0 )
	SetPlot(OwnerID(),"range","", 0)
	while true do
		--�p��w�g�g�L���ɶ�
		local Now_Hour = GetSystime(1)
		local Now_Min = GetSystime(2)	
		local Count_Hour = 0
		local Count_Min = 0
		if (Now_Hour-Original_Hour) < 0 then
			Count_Hour = Now_Hour - Original_Hour + 24
		else
			Count_Hour = Now_Hour - Original_Hour
		end

		Count_Min = Now_Min - Original_Min + (Count_Hour*60) + Ver_Zone200_TestTime[RoomID]
		--�ˬd�O�_�i�J�˼�
		if 	Count_Min == ReportTime and
			ReportTime < 60 then
			local Time =""
			Time = ReplaceString( GetString("SC_111284_9") , "LastTime" , 60-ReportTime )
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 1 ,  Time )  --�ѤUx����
			end
			ReportTime = ReportTime + 1
		end
		--�p�G�ɶ��W�L�N�R�_�c��H
		if 	Count_Min >= 60 then
			if 	CheckID(Chest) and
				ReadRoleValue(Chest,EM_RoleValue_RoomID) == RoomID then
				DelObj(Chest)
			end	
			LuaS_Discowood_ClearInstance(RoomID)
		end
		sleep(10)
	end
end
--�ˬd�ɶ��O�_�W�L&�Ǫ��O�_�������禡
function LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
	--�p��w�g�g�L���ɶ�
	local Now_Hour = GetSystime(1)
	local Now_Min = GetSystime(2)	
	local Count_Hour = 0
	local Count_Min = 0
	if (Now_Hour-Original_Hour) < 0 then
		Count_Hour = Now_Hour - Original_Hour + 24
	else
		Count_Hour = Now_Hour - Original_Hour
	end

	Count_Min = Now_Min - Original_Min + (Count_Hour*60) + Ver_Zone200_TestTime[RoomID]
	--�ˬd�O�_�i�J�˼�
	if 	Count_Min == ReportTime and
		ReportTime < 60 then
		local Time =""
		Time = ReplaceString( GetString("SC_111284_9") , "LastTime" , 60-ReportTime )
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 1 ,  Time )  --�ѤUx����
		end
		ReportTime = ReportTime + 1
	end
	--�ˬd�O���O�n�����ƥ��B�R�ǡB�𪱮a
	if 	Count_Min >= 60 then
		for i = 0 , table.getn(Array) do
			if 	CheckID(Array[i]) and
				ReadRoleValue(Array[i] , EM_RoleValue_RoomID) == RoomID then
				DelObj(Array[i])
			end
		end	
		LuaS_Discowood_ClearInstance(RoomID)
		return false , ReportTime
	end
	--�ŧi�ͦs���ܼ�
	local Survivor = 0
	--�ˬd�ѴX���Ǫ�
	for i = 0 , table.getn(Array) do
		if 	CheckID(Array[i]) and
			ReadRoleValue(Array[i] , EM_RoleValue_RoomID) == RoomID and
			ReadRoleValue(Array[i] , EM_RoleValue_IsDead) == 0 then
			Survivor = Survivor + 1
		end
	end
	--�Ǫ��O���O�����F�H
	if Survivor == 0 then
		return true , ReportTime
	else
		return false , ReportTime
	end
end

--�ͩǪ��禡
function LuaS_Discowood_InstanceMonster(MonsterBoss , HowMuch ,  Monster1 , RoomID)
	local Array = {}
	local Boss = CreateObjByFlag( MonsterBoss, 780087 , 0 , 1 )
	AddToPartition( Boss ,   RoomID )
	Array[0] = Boss
	for i=1 , HowMuch do
		local Monster = CreateObjByFlag( Monster1, 780087 , i , 1 )
		AddToPartition( Monster ,  RoomID )
		Array[i] = Monster
	end

	return Array
end
--�_�c����l�@��
function LuaS_Discowood_InstanceChest()
	SetPlot(OwnerID() , "touch" , "LuaS_Discowood_KillChest" , 40 )
end
--�_�c��Ĳ�I�@��
function LuaS_Discowood_KillChest()
	NPCDead( TargetID() , OwnerID() )
	SetPlot(TargetID() , "touch" , "" ,  0 )
end
--�M���a�禡
function LuaS_Discowood_ClearInstance(RoomID)
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == True then
				BeginPlot(  ID , "LuaS_Discowood_InstanceOut" , 0 )
			end
		end	
	end
end


function LuaS_Discowood_InstanceOut()
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	ChangeZone( OwnerID(), 2 , 0, 3905 , 49, -785, 240)
end