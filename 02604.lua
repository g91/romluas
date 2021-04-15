
function Lua_ACWB_Boss1_GlobalSet()--�����ܼƳ]�w
	if ACWB_Boss1_Global == nil then
		ACWB_Boss1_Global = {}
	end
	local Global = ACWB_Boss1_Global
	
	Global["Skill"] = {}
	Global["Skill"][1] = {	ID = 499048, Time = 20, TID = nil	}--�������
	Global["Skill"][2] = {	ID = 499053, Time = 12, TID = 1	}--�a�_�i
	Global["Skill"][3] = {	ID = 499052, Time = 9, TID = nil	}--��ɨg�q
	Global["Skill"][4] = {	ID = 499051, Time = 17, TID = 0	}--�g��
	
	Global["CheckDis"] = 300 --�����԰����Z��
	Global["FireLife"] = 90--�����s�b�ɶ�
	Global["CrazyTime"] = 480 --�g�ɮɶ�
	Global["FireTime"] = 1	--�`�N����/���K����I�񶡹j
	Global["ShareDmgLv"] = 20 --���u�ˮ`�̤j����(0~7)
	Global["ShareNum"] = 7 --���u�ˮ`���ݨD�H��
end

function Lua_ACWB_Boss1_Ctrl()
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID );
	
	if ACWB_Boss1_Global == nil then
		Lua_ACWB_Boss1_GlobalSet()
	end
	
	if ACWB_Boss1_Global[RoomID] == nil then
		ACWB_Boss1_Global[RoomID] = {}
	end
		
	local Global = ACWB_Boss1_Global[RoomID]
	Global["Ctrl"] = Ctrl
	Global["Boss"] = LuaFunc_CreateObjByObj(  106625, Global["Ctrl"] )
	ks_AttackMode( Global["Boss"] )--�]�w�i����NPC
	SetPlot( Global["Boss"], "dead", "Lua_ACWB_Boss1_Dead", 0 );--���`�P�_
		--20120109�ǡA�s�]���׫���C
		local Global = ACWB_Boss1_Global[RoomID];
		local exit = Cl_CreateObj_ForFlag( 106237 , 780871 , 2 , RoomID ) ----���ͳz���y�M��
		SetModeEx ( exit , EM_SetModeType_Obstruct, true) 		---����(�O)
		WriteRoleValue( OwnerID(),EM_RoleValue_Register10, exit)
end

function Lua_ACWB_Boss1_Fight()--�}�l�԰�
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	CallPlot( ACWB_Boss1_Global[RoomID]["Ctrl"], "Cl_ACWB_BossIsDeadFlag", 1)--�i�J�԰�
	CallPlot( OwnerID(), "Lua_ACWB_Boss1_AI" )
		--�s�]���ת��A20120102�Ƿs�W
		--local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
		local Global = ACWB_Boss1_Global[RoomID];
		local doors1 = Cl_CreateObj_ForFlag( 106237 , 780871 , 1 , RoomID ) ----���ͳz���y�M��
		SetModeEx ( doors1 , EM_SetModeType_Obstruct, true) 		---����(�O)
		Global["CtrlObj"] = Global["CtrlObj"] or {}
		table.insert( Global["CtrlObj"], doors1 )

end

function Lua_ACWB_Boss1_AI()--BossAI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	local Skill = ACWB_Boss1_Global["Skill"]
	Global["HitCount"] = 0
	local time = 0;
	
	CallPlot( Boss, "Lua_ACWB_Boss1_Timer", 0 )--�p�ɾ�
	ScriptMessage( Boss, -1 , 2 , "[SC_ACWB_BOSS1_START]", 2 );--�����԰�
		--20120113�s�W����}�Ԫ��ɶ�
		sleep(40)
	while true do
		DebugMsg(0,0,"SkillTime = "..time )
		for i=1, #Skill do
			if time%Skill[i].Time == 0 then
				local DisableRotate = false
				StopMove( Boss, true );
				ScriptMessage( Global["Ctrl"], -1 , 2 , "[SC_ACWB_BOSS1_SKILL_"..i.."]", 2 );
				local target = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
				if Skill[i].TID == nil then
					target = Boss
				else
					if Skill[i].TID >= 0 then
						local Hater = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
						if #Hater >0 then
							target = Hater[rand(#Hater)+1]
						end
					end
					--target = Lua_ACWB_Boss1_SpellTarget( target )--�гy�ޯ�аO�I
				end
				
				if i==2 then--�a�_�i
					DisableRotate = true--���V��w
					AdjustFaceDir( Boss, target, 0 )
					target = Boss
				elseif i==4 then--��ɨg��
					AddBuff( target, 621983, 0,-1 )--������w
				end
				--Say( Boss, "target = "..GetName(target) )
				CastSpell( Boss, target, Skill[i].ID )
				lockTime = GameObjInfo_Int( Skill[i].ID, "SpellTime" )
				Lua_ACWB_Boss1_SetLock( lockTime, DisableRotate  )
				break
			end
		end
		time = time+1;
		sleep(10)
	end
end

function Lua_ACWB_Boss1_Dead()--���`�@��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	ScriptMessage( Global["Ctrl"], -1 , 2 , "[SC_ACWB_BOSS1_DEAD]", 2 );--�����԰�
	CallPlot( Global["Ctrl"], "Cl_ACWB_BossIsDeadFlag", 3)--BOSS���`
	CallPlot(Global["Ctrl"] , "Lua_ACWB_DelExit")
	Lua_ACWB_Boss1_Reset()
end

function Lua_ACWB_Boss1_SpellTarget( target )--�гy�ޯ�аO�I
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	local Bx = ReadRoleValue( Boss, EM_RoleValue_X )
	local By = ReadRoleValue( Boss, EM_RoleValue_Y )
	local Bz = ReadRoleValue( Boss, EM_RoleValue_Z )
	local Tx = ReadRoleValue( target, EM_RoleValue_X )
	local Tz = ReadRoleValue( target, EM_RoleValue_Z )
	local radian = (math.pi/180)*CalDir( (Tx-Bx), (Tz-Bz) )--�|��

	target = CreateObj( 103123, Bx  +10*math.cos(radian), By, Bz - 10*math.sin(radian), 0, 1 )--106626
	SetRoleCamp( target, "Visitor")
	ks_TrapMode( target )----������
	WriteRoleValue( target, EM_RoleValue_LiveTime, 3 )
	
	return target
end

function Lua_ACWB_Boss1_Timer()--�p�ɾ�
	local Boss = OwnerID()
	local Global = ACWB_Boss1_Global
	local Base = {}
	Base.X = ReadRoleValue( Boss, EM_RoleValue_X )
	Base.Y = ReadRoleValue( Boss, EM_RoleValue_Y )
	Base.Z = ReadRoleValue( Boss, EM_RoleValue_Z )
	local X, Z
	local time = 0
	
	while true do
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - Base.X )^2 +( Z - Base.Z )^2 )^0.5);
		if not KS_InCombat( Boss )  or Dis > Global["CheckDis"] then
			ScriptMessage( Boss, -1 , 2 , "[SC_ACWB_BOSS1_EXIT]", 2 );--�����԰�
			ks_TransTo( Base.X, Base.Y, Base.Z )--�ǰe��S�w��m( Rnd = �H���Z�� min=�̤p�Z�� )
			Lua_ACWB_Boss1_Reset( true )--���m
			return
		end
		
		if time >= Global["CrazyTime"] and not CheckBuff( Boss, 621929 ) then
			--AddBuff( Boss, 621929, 0, -1 )
			AddBuff( Boss, 622092, 0, -1 )
		end
		DebugMsg(0,0,"time="..time)
		time = time+1
		Sleep(10)
	end
end

function Lua_ACWB_Boss1_Reset( reset )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	if Global["CtrlObj"] ~= nil then
		for i=1, #Global["CtrlObj"] do
			if CheckID( Global["CtrlObj"][i] ) then
				DelObj( Global["CtrlObj"][i] )
			end
		end
		Global["CtrlObj"] = nil
	end
	
	if reset then
		CallPlot( Global["Ctrl"], "Cl_ACWB_BossIsDeadFlag", 2)--�԰����m
		SetModeEx( Global["Boss"], EM_SetModeType_Move, true )
		SetModeEx( Global["Boss"], EM_SetModeType_Fight, true )
		SetModeEx( Global["Boss"], EM_SetModeType_DisableRotate , false )
		ks_resetObj( Global["Boss"], 5 );
	end
end

--function Lua_ACWB_Boss1_CreateFire()--���ͺ���
--	local Boss = OwnerID()
--	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
--	local Global = ACWB_Boss1_Global[RoomID];
--	local fire = LuaFunc_CreateObjByObj( 106626, Boss )
--	ks_TrapMode( fire )----������
--	AddBuff( fire, 621930, 0, -1 )--�S��
--	CallPlot( fire, "Lua_ACWB_Boss1_FireAI", Boss )
	
--	Global["CtrlObj"] = Global["CtrlObj"] or {}
--	table.insert( Global["CtrlObj"], fire )
--end
--�ק睊���A�bboss�I��100�X�I��
function Lua_ACWB_Boss1_CreateFire()--���ͺ���
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	local X = ReadRoleValue( Boss , EM_RoleValue_X )
	local Y = ReadRoleValue( Boss , EM_RoleValue_Y )
	local Z = ReadRoleValue( Boss , EM_RoleValue_Z )
	local Range = 70
	local ObjX , ObjZ = 0 , 0
	local nRand=Rand(8)+1
		ObjX = X - Range * math.cos(math.pi*2*(nRand/8))
		ObjZ = Z + Range * math.sin(math.pi*2*(nRand/8))
	local fire = CreateObj( 106626 , ObjX, Y+25, ObjZ, 0, 1 )
	AddToPartition( fire , RoomID  )
	--local fire = LuaFunc_CreateObjByObj( 106626, Boss )
	ks_TrapMode( fire )----������
	AddBuff( fire, 621930, 0, -1 )--�S��
	CallPlot( fire, "Lua_ACWB_Boss1_FireAI", Boss )
	
	Global["CtrlObj"] = Global["CtrlObj"] or {}
	table.insert( Global["CtrlObj"], fire )
end

function Lua_ACWB_Boss1_FireAI( Boss )--��������
	local Fire = OwnerID()
	local Global = ACWB_Boss1_Global
	--2012/01/02�Ƿs�W�ק�}�l�SBUFF�ɶ�
	for i=1,3 do
		if (HateListCount(Boss) == 0 ) or CheckID(Boss )==false then
			DebugMsg(0,0,"bye")
			DelObj(OwnerID())
			return
		end
		Sleep(10)
	end
	for i=1, Global["FireLife"] do
		if i%Global["FireTime"] == 0 then
			if GetDistance( Fire, Boss ) <= 100 then
				--�Ƿs�W�P�w�A���קK��˹L�Y���a�����ܦ^��C
				 if CheckBuff(Boss,622092)==FALSE then
					AddBuff( Boss, 621922, 0, -1 )--���K����
				end
			end
			--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )

			CastSpell( Fire, Fire, 499049 )
		end
		Sleep(10)
	end
	DelObj( Fire )
end

function Lua_ACWB_Boss1_SetLock( time, DisableRotate )
	local obj = OwnerID()
	time = time or 0
	if time == 0 then
		sleep(5)
		return
	end
	if DisableRotate then
		SetModeEx( obj, EM_SetModeType_DisableRotate , true )
	end
	SetModeEx( obj, EM_SetModeType_Move, false )
	--SetModeEx( obj, EM_SetModeType_Fight, false )
	sleep( time*10 )
	--SetModeEx( obj, EM_SetModeType_Fight, true )
	SetModeEx( obj, EM_SetModeType_DisableRotate , false )
	Sleep(10)
	SetModeEx( obj, EM_SetModeType_Move, true )
end

function Lua_ACWB_Boss1_ShareDmgCheck()--�ˮ`���u�ˬd
	local Boss = OwnerID()
	local TID = TargetID()
	local count = 0
	
	local Player = SearchRangePlayer( TID, 100 );
	for i=0, #Player-1 do
		if ReadRoleValue( Player[i], EM_RoleValue_VOC ) ~= 0 then
			count = count+1
		end
	end
	DebugMsg(0,0,"ShareDmgLv = ".. math.floor(ACWB_Boss1_Global["ShareDmgLv"]/count).."; count = "..count )
	SysCastSpellLv( Boss, Boss, 499050, math.floor(ACWB_Boss1_Global["ShareDmgLv"]/count) )
	if count < ACWB_Boss1_Global["ShareNum"] then
		CallPlot( Boss, "Lua_ACWB_Boss1_AddCrazyBuff", ACWB_Boss1_Global["ShareNum"] - count-1 )--�g�ɪ��A
	end
end

function Lua_ACWB_Boss1_AddCrazyBuff( Lv )--�g�ɪ��A
	Sleep(10)
	local BuffID = 621924
	local MaxLv = GameObjInfo_Int( BuffID, "MaxBuffLv")
	if Lv > MaxLv then
		Lv = MaxLv
	end
	AddBuff( OwnerID(), BuffID, Lv, -1 )--�g��
end

--boss���`�ɧR�����ת�
function Lua_ACWB_DelExit()
		local exit=ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
		DelObj(exit)
end