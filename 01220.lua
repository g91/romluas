

function LuaS_101586_0()
	local OldOne = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local ObjID
	if	CheckID(OldOne)	then
		if	ReadRoleValue(OwnerID() , EM_RoleValue_RoomID) == ReadRoleValue( OldOne , EM_RoleValue_RoomID) then --�p�G�P�@�h���N�O�ª�PID�A�CĲ�o�@�����@���s��
			DelObj(OldOne)
		end
	end
	if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 113	then	--�إX�Ӫ�NPC�HZONEID�ܤ�
		ObjID = Lua_DW_CreateObj( "flag" , 101586 , 780014 , 4 , 0 ) --35
	else
		ObjID = Lua_DW_CreateObj( "flag" , 101882 , 780014 , 4 , 0 ) --50
	end
	NPCAttackFlag(ObjID) --�N�԰�����
	SetRoleCamp( ObjID  , "Visitor" );
	AddToPartition( ObjID ,ReadRoleValue(OwnerID() , EM_RoleValue_RoomID ) )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , ObjID ) --��s���˪O�ɰv�g�JĨۣ�H��PID
	SetPlot(OwnerID() , "range" , "LuaS_101586_1" , 100)
end


function LuaS_101586_1()
	SetPlot(TargetID() , "range" , "" , 0) -- �קK����Ĳ�o
	BeginPlot( TargetID() , "LuaS_101586_2" , 0 ) --�}�l�D�Ԭy�{
end

function LuaS_101586_2()
	local Boss
	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = 0  --��l�ƥ����ܼ�

	local Door2 = Lua_DW_CreateObj( "flag" , 112224 , 780014 , 3  , 0) --���_�h��
	--���ͪ���
	SetModeEx( Door2 , EM_SetModeType_Obstruct , true ) 
	SetModeEx( Door2 , EM_SetModeType_Mark , false ) 
	AddToPartition( Door2,ReadRoleValue(OwnerID() , EM_RoleValue_RoomID ) ) --Addtopartition �~�|���ͧ@��
	local Four = {} --�̷Ӱϰ��T�M�w�X���ԱN
	if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 113	then
		Four = {101664 , 101665 , 101666 , 101667 }--35��
	else
		Four = {101886 , 101887 , 101888 , 101889 }--50��
	end
	local ObjID = ReadRoleValue(OwnerID() , EM_RoleValue_PID ) --��X�˪O�ɰv��ID
	ScriptMessage(ObjID , -1 , 2 , "[SC_101586_1]" , 0 )
	sleep(20)
	ScriptMessage(ObjID , -1 , 2 , "[SC_101586_2]" , 0 )
	sleep(10)
	--Round one
	local Rand = DW_Rand(table.getn(Four)) --�|��@
	local Obj1 = Lua_DW_CreateObj( "flag" , Four[Rand] , 780014 , 1 , 1 , 1 )
	SetPlot(Obj1 , "dead" , "LuaS_101586_3" , 0 ) --���F������ܥ����ܼƪ��A
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		SetAttack( Obj1 , ThesePlayer[i] ) -- �����e�i����
	end
	WriteRoleValue(Obj1 , EM_RoleValue_PID , 2) --�վ�s�H�d��
	BeginPlot(Obj1,"Lua_DW_CallHelper" , 0) --�s�H
	table.remove(Four,Rand)
	sleep(200)
	while true do
		sleep(30)
		--�O�_�i�J�U�@���q
		if	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] == 1	then
			break
		end
		--���}�԰���B�m
		if	ReadRoleValue(Obj1,EM_RoleValue_IsAttackMode)~=1	then
			DelObj(Obj1)
			DelObj(Door2)
			BeginPlot( OwnerID() , "LuaS_101586_0" , 1 )
			return
		end
	end
	sleep(20)
	ScriptMessage(ObjID , -1 , 2 , "[SC_101586_3]" , 0 )
	sleep(10)
	--Round two
	local Rand = DW_Rand(table.getn(Four))
	local Obj2 = Lua_DW_CreateObj( "flag" , Four[Rand] , 780014 , 1 , 1 , 1 )
	SetPlot(Obj2 , "dead" , "LuaS_101586_3" , 0 )
	TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
	ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		SetAttack( Obj2 , ThesePlayer[i] ) -- �����e�i����
	end
	WriteRoleValue(Obj2 , EM_RoleValue_PID , 2) --�վ�s�H�d��
	BeginPlot(Obj2,"Lua_DW_CallHelper" , 0) --�s�H
	table.remove( Four , Rand )
	sleep(200)
	while true do
		sleep(30)
		--�O�_�i�J�U�@���q
		if	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] == 2	then
			break
		end
		--���}�԰���B�m
		if	ReadRoleValue(Obj2 ,EM_RoleValue_IsAttackMode)~=1	then
			DelObj(Obj2)
			DelObj(Door2)
			BeginPlot( OwnerID() , "LuaS_101586_0" , 1 )
			return
		end
	end


	--Round Three
	ScriptMessage(ObjID , -1 , 2 , "[SC_101586_4]" , 0 )
	DelObj( ObjID )
	sleep(50)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 113	then--�̷Ӱϰ��T�M�w�X���ԱN
		Boss = Lua_DW_CreateObj( "flag" , 101586 , 780014 , 1 , 1 , 1 ) --35
	else
		Boss = Lua_DW_CreateObj( "flag" , 101882 , 780014 , 1 , 1 , 1 )--50
	end
	SetPlot(Boss , "dead" , "LuaS_101586_3" , 0 )
	TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
	ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		SetAttack( Boss , ThesePlayer[i] ) -- �����e�i����
	end
	sleep(200)
	local Help1 = 1 -- �U�}1
	local Help2 = 1 -- �U�}2
	local Sec = 0 --�p��
	local HardLv = 0
	while true do
		sleep(10)
		Sec = Sec + 1
		--�O�_�i�J�U�@���q
		if	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] == 3	then
			break
		end

		if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 114	then --�i���� �I�s���x
			if	table.getn(Four) == 2	and
				Sec >= 10		then
				ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_6]" , 0 )
				local Rand = DW_Rand(table.getn(Four))
				Help1 = Lua_DW_CreateObj( "flag" , Four[Rand] , 780014 , 1 , 1 , 1 )
				TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
				ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
					SetAttack( Help1 , ThesePlayer[i] ) -- �����e�i����
				end
				table.remove( Four , Rand )
				BeginPlot(Help1,"LuaS_101586_7" , 0)
				BeginPlot(Help1,"LuaS_Discowood_CheckPeace",0)
				Sec = 0
			end
			if	table.getn(Four) == 1	and
				Help2 == 1		and
				Sec >= 30		then
				ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_7]" , 0 )
				Help2 = Lua_DW_CreateObj( "flag" , Four[1] , 780014 , 1 , 1 , 1 )
				TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
				ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
					SetAttack( Help2 , ThesePlayer[i] ) -- �����e�i����
				end
				table.remove( Four , Rand )
				BeginPlot(Help2,"LuaS_101586_7" , 0)
				BeginPlot(Help2,"LuaS_Discowood_CheckPeace",0)
				Sec = 0
			end

			--���x11111
			if	Help1 ~= 1	and
				Help1 ~= nil	then
				if	Sec >= 15	and --�s�X��15��
					CheckBuff(Help1,503405)	and --�ީ|�b
					ReadRoleValue(Help1,EM_RoleValue_Register6) == 1	then--�I�k����
					CancelBuff(Help1,503405)--���޶}��
					HardLv = HardLv + 1--���׼W�[
					Sec = 0--����k�s
				end
				if	ReadRoleValue(Help1,EM_RoleValue_Register6) == 0	and --�S���I�k����
					ReadRoleValue(Help1,EM_RoleValue_IsDead) == 0	and -- �٬���
					not	CheckBuff(Help1,503405)			and
					CheckID(Help1)					and
					Sec > 5						then
					NPCDead( Help1 , Help1 )
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_8]" , 0 ) --�G�H�N�x�Q�������]�O�Ͼ��Ӥ`
				end
			end
			--���x2222
			if	Help2 ~= 1	and
				Help2 ~= nil	then
				if	Sec >= 15	and--�s�X��15��
					CheckBuff(Help2,503405)	and--�ީ|�b
					ReadRoleValue(Help2,EM_RoleValue_Register6) == 1	then --�I�k����
					CancelBuff(Help2,503405) --���޶}��
					HardLv = HardLv + 2  --���׼W�[
					Sec = 0 --����k�s
				end
				if	ReadRoleValue(Help2,EM_RoleValue_Register6) == 0	and--�S���I�k����
					ReadRoleValue(Help2,EM_RoleValue_IsDead) == 0	and -- �٬���
					not	CheckBuff(Help2,503405)			and
					CheckID(Help2)					and
					Sec > 5						then
					NPCDead( Help2 , Help2 )
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_8]" , 0 ) --�G�H�N�x�Q�������]�O�Ͼ��Ӥ`
				end
			end

			-- ���ץ[�j���վ�

			if	HardLv == 3	then
				if	ReadRoleValue(Help1,EM_RoleValue_IsDead)==0	and
					CheckID(Help1)					then
					if	CheckID(Help1)	then
						AddBuff(Help1,503411,10,2)
					end
					if	CheckID(Boss)	then
						AddBuff(Boss,503411,10,2)
					end
					if	CheckID(Help2)	then
						AddBuff(Help2,503411,10,2)
					end
				end
				if	ReadRoleValue(Help2,EM_RoleValue_IsDead)==0	and
					CheckID(Help2)					then
					TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					ThesePlayer = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						AddBuff(ThesePlayer[i],503412,10,2)
					end
				end
			else
				if	HardLv == 1	then
					if	ReadRoleValue(Help1,EM_RoleValue_IsDead)==0		and
						CheckID(Help1)						then
						if	CheckID(Help1)	then
							AddBuff(Help1,503411,10,2)
						end
						if	CheckID(Boss)	then
							AddBuff(Boss,503411,10,2)
						end
						if	CheckID(Help2)	then
							AddBuff(Help2,503411,10,2)
						end
					end
				end

				if	HardLv == 2	then
					if	ReadRoleValue(Help2,EM_RoleValue_IsDead)==0		and
						CheckID(Help2)						then
						TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
						ThesePlayer = {}
						for i=1,TempPlayer do
							ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
							AddBuff(ThesePlayer[i],503412,10,2)
						end
					end
				end
			end


		end
		--���}�԰���B�m
		if	ReadRoleValue(Boss ,EM_RoleValue_IsAttackMode)~=1	then
			if 	CheckID(Help1)	then --�p�G�w���ͭn�B�z��
				DelObj(Help1)
			end
			if 	CheckID(Help2)	then --�p�G�w���ͭn�B�z��
				DelObj(Help2)
			end
			DelObj(Boss)
			DelObj(Door2)
			BeginPlot( OwnerID() , "LuaS_101586_0" , 1 )
			return
		end
	end

	while	CheckID(Help1)	or   --�p�G���x���X�{�N�����x�����A�}��
		CheckID(Help2)	do
		sleep(10)
	end
	--�����F�~�i�J�}�����q
	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] + 2
	--�e���~�F
	if	HardLv < 3	and
		HardLv ~= 0	then
		local Box1 = Lua_DW_CreateObj("flag",102014,780014,5)
		NPCAttackFlag(Box1)
		SetPlot(Box1,"touch","Lua_DW_Chest",45)
		ScriptMessage(Box1 , -1 , 0 , "111111" , 0 ) 
	end
	if	HardLv == 3	then
		local Box1 = Lua_DW_CreateObj("flag",102014,780014,5)
		local Box2 = Lua_DW_CreateObj("flag",102015,780014,6)
		NPCAttackFlag(Box1)
		NPCAttackFlag(Box2)
		SetPlot(Box1,"touch","Lua_DW_Chest",45)
		SetPlot(Box2,"touch","Lua_DW_Chest",45)
	end
	DelObj(Door2)
end

function LuaS_101586_3()
	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] + 1  -- �P�_�p�ƥ[�@
	if	ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 101586	then  --�ɰv�����ɭԦ��S���t
		ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_5]" , 0 )
	end
	return true
end

function LuaS_101586_4()
	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = 0  --��l�ƥ����ܼ�
	if	ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID ) == 114	then -- �����S�O�P�_  50�Ŧ�Ĳ�I�@��
		BeginPlot(OwnerID(),"LuaS_101586_5",0)
	end
end


function LuaS_101586_5()
	while true do
		sleep(20)
		if	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] == 5	then
			Hide(OwnerID())
			break
		end
	end
end

function LuaS_101586_6()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register6,1)
end

function LuaS_101586_7()
	CastSpell(OwnerID(),OwnerID(),493185)
	AddBuff(OwnerID(),503405,500,20)
end