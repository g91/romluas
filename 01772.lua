function ks_BuffPlus(BuffID)
	AddBuff( OwnerID(), BuffID, 0, -1 )
end

function ks_CheckItem01( ItemID )
	debugMsg(0,0,"ItemID Num = "..CountBodyItem( OwnerID() , ItemID ))
end

function ks_CheckMap( MapID )--檢查區域
	local OID = OwnerID()
	MapID = MapID or 1
	if DW_CheckMap( OID, MapID ) == true then
		return true;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false;
end

function ks_CheckBuff01( BuffID)
	if CheckBuff( OwnerID() , BuffID ) == true then
		debugMsg(0,0,"Buff true")
	else
		debugMsg(0,0,"Buff not true")
	end
end

function ks_test01( TID )
	local OID = OwnerID();
	--local TID = TargetID();--TargetID();
	local Stone = 3604664;
	
	local Ox = ReadRoleValue( OID, EM_RoleValue_X );
	local Oz = ReadRoleValue( OID, EM_RoleValue_Z );
	local Tx = ReadRoleValue( TID, EM_RoleValue_X );
	local Tz = ReadRoleValue( TID, EM_RoleValue_Z );
	local Sx = ReadRoleValue( Stone, EM_RoleValue_X );
	local Sz = ReadRoleValue( Stone, EM_RoleValue_Z );
	local m = math.floor( ((Tz-Oz)/(Tx-Ox))*100 ) /100
	local b = Oz-m*Ox;
	local d = math.abs(m*Sx-Sz+b ) / (m^2+1)^0.5
	DebugMsg(0,0,"Ox = "..Ox.."; Oz = "..Oz)
	DebugMsg(0,0,"Tx = "..Tx.."; Tz = "..Tz)
	DebugMsg(0,0,"m = "..m.."; b = "..b )
	Say( OID, "d = "..math.floor(d) )
end


function ks_test02( Obj)
	Say( OwnerID(), toString(CheckID(Obj)) )
	if not CheckID(Obj) then
		WriteRoleValue( Obj, EM_RoleValue_IsDead, 0 )
		AddToPartition( Obj, 0 )
		WriteRoleValue( Obj, EM_RoleValue_HP, ReadRoleValue( Obj, EM_RoleValue_MaxHP ) );--滿血
	end
end

function ks_test03( Sheep )
	local array = {}
	local dis= -100
	local Wolf = OwnerID()
	KS_Move( Wolf, dis-20, Sheep )
	--Say( OwnerID(), math.random(-Range,Range) )
end

function ks_test04()
	DebugMsg(0,0,"collectgarbage size = "..collectgarbage("count"))--取得垃圾量
end

function ks_test05()
	local OID = OwnerID()
	local Player = SearchRangePlayer( OID, 200 )
	Say( OID, "count = "..table.getn(Player) )

	for i=0, table.getn(Player)-1 do
		Say( OID, getName(Player[i]))
		ScriptMessage( Player[i], Player[i], 2,"[SC_424469_02]", 0 )--出現
		ScriptMessage( Player[i], Player[i], 0,"[SC_424469_02]", 0 )
	end
end

function ks_test06()
	local Player = OwnerID()
	local FlagID = 780755
	local X1 = GetMoveFlagValue( FlagID , 8 , EM_RoleValue_X )
	local Y1 = GetMoveFlagValue( FlagID , 8 , EM_RoleValue_Y )
	local Z1 = GetMoveFlagValue( FlagID , 8 , EM_RoleValue_Z )
	local X2 = GetMoveFlagValue( FlagID , 9 , EM_RoleValue_X )
	local Y2 = GetMoveFlagValue( FlagID , 9 , EM_RoleValue_Y )
	local Z2 = GetMoveFlagValue( FlagID , 9 , EM_RoleValue_Z )
	
	local Vx = X1 -X2;
	local Vy = Y1-Y2;
	local Vz = Z1-Z2;

	local Ux = 0;
	local Uy = 1;
	local Uz = 0;

	local Nx = (Uy*Vz-Uz*Vy)
	local Ny = -(Uz*Vx -Ux*Vz)
	local Nz = (Ux*Vy-Uy*Vx)
	local Dis = ((Nx*Nx+Ny*Ny+Nz*Nz)^0.5)
	Nx = Nx / Dis
	Ny = Ny / Dis
	Nz = Nz / Dis
	
	local Px = ReadRoleValue( Player, EM_RoleValue_X )
	local Py = ReadRoleValue( Player, EM_RoleValue_Y )
	local Pz = ReadRoleValue( Player, EM_RoleValue_Z )
	local D = -( Nx*X1+Ny*Y1+Nz*Z1 )
	local plane = Nx*Px+Ny*Py+Nz*Pz +D
	DebugMsg(0,0,"ZONE14_PE05_Enter plane  = "..plane  )
end

function ks_test07( Dis )
	local OID = OwnerID()
	Dis = Dis or 100
	local PosX = ReadRoleValue( OID, EM_RoleValue_X )
	local PosY = ReadRoleValue( OID, EM_RoleValue_Y )
	local PosZ = ReadRoleValue( OID, EM_RoleValue_Z )
	local PosDir = ReadRoleValue( OID, EM_RoleValue_Dir )
	
	local radian = (math.pi/180)*( PosDir )--徑度
	PosX = PosX  +(Dis*math.cos(radian))
	PosZ = PosZ - (Dis*math.sin(radian))
	PosY  = GetHeight( PosX, PosY, PosZ )	
	SetPos( OID, PosX, PosY, PosZ, PosDir )
end

function ks_fib(n)
	if n <= 0 then
		return 0
	else
		if n == 1 then
			return 1
		else
			return ks_fib(n-1)+ks_fib(n-2)
		end
	end
end

function ks_fib_test(n)
	local result = ks_fib(n)
	Say( OwnerID(), "result = "..result)
end

------------------------------------------------------------

function ks_BuffTest()
	local OID = OwnerID()
	if not CheckBuff( OID, 621216 ) then
		AddBuff( OID, 621216, 99, -1 )--轉換100N
	else
		CancelBuff(  OID, 621216 )
	end
end

function ks_BuffTest_1( Lv )
	local OID = OwnerID()
	if not CheckBuff( OID, 621219 ) then
		AddBuff( OID, 621219, Lv, -1 )
	else
		CancelBuff(  OID, 621219)
	end
end
		
function ks_NpcTest_1()--能源彈
	local Site1 = 62587178
	local Site2 = 62587360
	pushMagicShootTarget( Site1 )
	pushMagicShootTarget(Site2)
end

function ks_NpcAITest()
	local OID = OwnerID()
	local master = ReadRoleValue( OID, EM_RoleValue_Register1 );
	while true do
		Sleep(20)
		local ATID = ReadRoleValue( OID, EM_RoleValue_AttackTargetID )
		if ATID == 0 then
			local X = ReadRoleValue( master, EM_RoleValue_X );
			local Y = ReadRoleValue( master, EM_RoleValue_Y );
			local Z = ReadRoleValue( master, EM_RoleValue_Z );
			ks_Move( OID, 30, X, Y, Z ) --對象(RoleID)移動到指定位置
		else
			SetAttack( OID, ATID );
		end
	end
end

function ks_NpcStopTest01()
	local TID = OwnerID()
	local Boss = kg_GetPosRX( TID, 118789, 0, 50, math.random(90,270), 0, nil );--最終決定版
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
	MoveToFlagEnabled( Boss, false );
	SetModeEx( Boss , EM_SetModeType_Fight, false )--無法砍殺
	SetModeEx( Boss , EM_SetModeType_Mark, false )--無標記
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead, false )--無頭像
	SetModeEx( Boss , EM_SetModeType_HideName, true )--無名稱
	SetModeEx( Boss , EM_SetModeType_NotShowHPMP, true )--無血
	SetDefIdleMotion( Boss, ruFUSION_MIME_ATTACK_BOW_LOOP )
	AddToPartition( Boss, RoomID );
	AdjustFaceDir( Boss, TID, 0 )
	--WriteRoleValue( Boss, EM_RoleValue_LiveTime, 2 )

	local Bx = ReadRoleValue( Boss, EM_RoleValue_X )
	local By = ReadRoleValue( Boss, EM_RoleValue_Y )
	local Bz = ReadRoleValue( Boss, EM_RoleValue_Z )
	local Tx = ReadRoleValue( TID, EM_RoleValue_X )
	local Tz = ReadRoleValue( TID, EM_RoleValue_Z )
	local radian = (math.pi/180)*CalDir( (Tx-Bx), (Tz-Bz) )--徑度

	local TID1 = CreateObj( 117213, Bx  +(250*math.cos(radian)), By, Bz - (300*math.sin(radian)), 0, 1 )--114264
	AddToPartition(TID1, RoomID )	

	local TID2 = CreateObj( 117213, Bx  +(5*math.cos(radian)), By, Bz - (5*math.sin(radian)), 0, 1 )
	AddToPartition( TID2, RoomID )
	while true do
		SysCastSpellLv( Boss, TID1, 498296, 0 );--施放技能

		CallPlot( TID2, "ks_NpcStopTest02", Boss, TID2, 497863, 25 )
		sleep(20)
	end
end

function ks_NpcStopTest02( Boss, TID, SkillID, Lv )
	Sleep(8)
	SysCastSpellLv( Boss, TID, SkillID, Lv );--施放技能
end

function ks_ShowObjAtk()
	local OID = OwnerID()

	DebugMsg(0,0,"Lv = "..ReadRoleValue( OID, EM_RoleValue_Lv ) );--LV
	DebugMsg(0,0,"Atk = "..ReadRoleValue( OID, EM_RoleValue_Fin_Phy_ATK ) );--攻擊力
	DebugMsg(0,0,"Dmg = "..ReadRoleValue( OID, EM_RoleValue_Fin_Phy_Dmg ) );--主手傷害
	DebugMsg(0,0,"Def = "..ReadRoleValue( OID, EM_RoleValue_Fin_Phy_Def ) )--防禦力
	DebugMsg(0,0,"Matk = "..ReadRoleValue( OID, EM_RoleValue_Fin_Mag_ATK ) )--魔攻
	DebugMsg(0,0,"Mdef = "..ReadRoleValue( OID, EM_RoleValue_Fin_Mag_Def ) )--魔法防禦	
end

function ks_stringTest01()
	CallPlot( OwnerID(), "ks_stringTest02", 0 )
end

function ks_stringTest02()
	local Boss = OwnerID()
	local TID = Boss
	local Bx = ReadRoleValue( Boss, EM_RoleValue_X )
	local By = ReadRoleValue( Boss, EM_RoleValue_Y )
	local Bz = ReadRoleValue( Boss, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Boss, EM_RoleValue_Dir )
	local Tx = ReadRoleValue( TID, EM_RoleValue_X )
	local Tz = ReadRoleValue( TID, EM_RoleValue_Z )
	--local radian = (math.pi/180)*CalDir( (Tx-Bx), (Tz-Bz) )--徑度
	local radian = (math.pi/180)*Dir--徑度
	local Dis = 30

	while true do
		local Final = CreateObj( 103123, Bx  +(Dis*math.cos(radian)), By, Bz - (Dis*math.sin(radian)), 0, 1 )
		AddToPartition( Final, 0 )
		WriteRoleValue( Final, EM_RoleValue_LiveTime, 3 )
		SysCastSpellLv( Boss, Final, 499051, 0 )--純特效
		--CastSpellLv( Boss, Final, 498413, 0 )--純特效
		--CastSpellPos( Boss, Bx  +100*math.cos(radian) , By, Bz - 100*math.sin(radian), 498103, 0 )--丟出斧
		--SysCastSpellLv_Pos( Boss, Bx  +100*math.cos(radian) , By, Bz - 100*math.sin(radian), 498103, 0 )--丟出斧
		sleep(40)
	end
end

function ks_stringTest03()
	local Obj = OwnerID()
	local Cactus = OwnerID()
	local RoomID = ReadRoleValue( Cactus , EM_RoleValue_RoomID )
	local CactusX = ReadRoleValue( Cactus, EM_RoleValue_X )
	local CactusY = ReadRoleValue( Cactus, EM_RoleValue_Y )
	local CactusZ = ReadRoleValue( Cactus, EM_RoleValue_Z )
	local Fire = {}
	local FireX
	local FireY
	local FireZ
	local Radius = 30
	for i = 1 , 10 do
		FireX = CactusX - Radius * math.cos(math.pi*2*(i/10))
		FireZ = CactusZ + Radius * math.sin(math.pi*2*(i/10))
		Fire[i] = CreateObj( 100292 , FireX , CactusY , FireZ , 0 , 1 )
		MoveToFlagEnabled( Fire[i], false )
		WriteRoleValue( Fire[i], EM_RoleValue_LiveTime, 30 )
		AddToPartition( Fire[i] , 0 )
	end
	while 1 do 
		local WalkX = ReadRoleValue( Cactus , EM_RoleValue_X )
		local WalkZ = ReadRoleValue( Cactus , EM_RoleValue_Z )
		for j = 1 , 10 do
			FireX = WalkX - Radius * math.cos(math.pi*2*(j/10))
			FireZ = WalkZ + Radius * math.sin(math.pi*2*(j/10))
			MoveDirect( Fire[j] , FireX , CactusY , FireZ )
		end
		Sleep(5)
	end
end

function ks_stringTest04()
	local state = {}
	state[1] = function() say( OwnerID(), "1") end
	state[2] = function() say( OwnerID(), "2") end

	state[2]()
end

function ks_stringTest05()
	local OID = OwnerID()
	local Ctrl =  LuaFunc_CreateObjByObj( 103123, OID )
	CallPlot( Ctrl, "ks_stringTest07", 0 )
end

function ks_stringTest06()
	local OID = OwnerID()
	local Ctrl =  LuaFunc_CreateObjByObj( 103123, OID )
	CallPlot( Ctrl, "ks_stringTest08", 0 )
end

function ks_stringTest07()
	local OID = OwnerID()
	local Obj = {}
	local Num = 10
	local Dis = 20
	local Range = 50
	local ObjID = 115403
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local BaseX = ReadRoleValue( OID, EM_RoleValue_X )
	local BaseZ = ReadRoleValue( OID, EM_RoleValue_Z )
	local NewX, NewZ, DisX, DisZ, x, z, ObjDis
	ks_ActSetMode( OID )--設定演戲用NPC
	WriteRoleValue( OID, EM_RoleValue_LiveTime, 60 )
	
	
	for i = 1 , Num do
		x = BaseX-dis*math.cos(math.pi*2*(i/Num))
		z = BaseZ+dis*math.sin(math.pi*2*(i/Num))
		Obj[i] = CreateObj( ObjID, X, Y+5, Z, 0, 1 )
		SetModeEx( Obj[i], EM_SetModeType_Gravity, false )
		ks_ActSetMode( obj[i] )--設定演戲用NPC
		AddToPartition( obj[i], 0 )
		SetPos( Obj[i], x, y+5,z, 0 )
		WriteRoleValue( Obj[i], EM_RoleValue_LiveTime, 60 )
	end
	
	for i=1, 60 do
		Sleep(10)
		NewX = ReadRoleValue( OID, EM_RoleValue_X )
		NewZ = ReadRoleValue( OID, EM_RoleValue_Z )
		DisX = ( NewX - BaseX )^2
		DisZ = ( NewZ - BaseZ )^2
		ObjDis = math.floor( (DisX+DisZ)^0.5)
		if ObjDis < 10 then
			WriteRoleValue( OID, EM_RoleValue_IsWalk, 1 )
			BaseX = BaseX+math.random(-Range,Range)
			BaseZ = BaseZ+math.random(-Range,Range)
			MoveDirect( OID, BaseX, y, BaseZ )

			for i = 1 , Num do
				x = BaseX-dis*math.cos(math.pi*2*(i/Num))
				z = BaseZ+dis*math.sin(math.pi*2*(i/Num))
				MoveDirect( Obj[i], x, y+5, z )
			end
		end
	end
end

function ks_stringTest08()
	local OID = OwnerID()
	local Obj = {}
	local Num = 10
	local Dis = 20
	local Range = 50
	local Waiting = 6
	local ObjID = 115403
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local BaseX = ReadRoleValue( OID, EM_RoleValue_X )
	local BaseZ = ReadRoleValue( OID, EM_RoleValue_Z )
	local NewX, NewZ, DisX, DisZ, x, z, ObjDis
	local Trans = true
	local times = 0
	local MoveTimes = 0
	ks_ActSetMode( OID )--設定演戲用NPC
	WriteRoleValue( OID, EM_RoleValue_LiveTime, 60 )
	
	
	for i = 1 , Num do
		x = BaseX-dis*math.cos(math.pi*2*(i/Num))
		z = BaseZ+dis*math.sin(math.pi*2*(i/Num))
		Obj[i] = CreateObj( ObjID, X, Y+5, Z, 0, 1 )
		ks_ActSetMode( obj[i] )--設定演戲用NPC
		SetModeEx( Obj[i], EM_SetModeType_Gravity, false )
		AddToPartition( obj[i], 0 )
		SetPos( Obj[i], x, y+5,z, 0 )
		WriteRoleValue( Obj[i], EM_RoleValue_LiveTime, 60 )
	end
	
	for i=1, 100 do
		Sleep(8)
		NewX = ReadRoleValue( OID, EM_RoleValue_X )
		NewZ = ReadRoleValue( OID, EM_RoleValue_Z )
		DisX = ( NewX - BaseX )^2
		DisZ = ( NewZ - BaseZ )^2
		ObjDis = math.floor( (DisX+DisZ)^0.5)
		if ObjDis <= 0 then
			times = times+1
		
			if times >= Waiting then
				Trans = not Trans
				times = 0
				WriteRoleValue( OID, EM_RoleValue_IsWalk, 1 )
				BaseX = BaseX+math.random(-Range,Range)
				BaseZ = BaseZ+math.random(-Range,Range)
				MoveDirect( OID, BaseX, y, BaseZ )
			else
				local NewObj = {}
				if Trans then
					for i = 2 , Num do
						table.insert( NewObj, Obj[i] )
					end
					table.insert( NewObj, Obj[1] )
				else
					table.insert( NewObj, Obj[Num] )
					for i = 1 , Num-1 do
						table.insert( NewObj, Obj[i] )
					end
				end
				Obj = NewObj
			end
			
			for i = 1 , Num do
				x = BaseX-dis*math.cos(math.pi*2*(i/Num))
				z = BaseZ+dis*math.sin(math.pi*2*(i/Num))
				MoveDirect( Obj[i], x, y+5, z )
			end
		end
	end
end

function LuaKs_CountTop()--計算排行榜
	local BonusTop = {}--排行榜
	local JoinList = {}--參加成員
	JoinList["Discowood"] = 0
	JoinList["FN"] = 5
	JoinList["Kingofme"] = 11
	JoinList["Hao"] = 20
	JoinList["Davis"] = 30
	JoinList["KiwiG"] = 20
	
	for Name ,Score in pairs( JoinList ) do
		for i=1, 6 do
			local Key = BonusTop[i]
			if Key == nil or JoinList[Name] > JoinList[Key] then
				table.insert( BonusTop, i, Name )
				break
			end
		end
	end
	local Oid = OwnerID()
	for i=1, 6 do
		local Name = BonusTop[i]
		Say( Oid, Name.." 'Score = " ..JoinList[Name])
	end
end

function ks_KillObjTest()
	local ObjID = { 105290, 105291, 105292, 105293, 105299 }
	for i=1, 100 do
		KS_KillObj( ObjID )--殺死全地圖 特定ID物件
		sleep(20*10)
	end
end


--=======================================================--

function ks_stringTest09()
	local NpcID = OwnerID()
	local RoomID = ReadRoleValue ( NpcID , EM_RoleValue_RoomID )
	local Npc_X = ReadRoleValue ( NpcID , EM_RoleValue_X )
	local Npc_Y = ReadRoleValue ( NpcID , EM_RoleValue_Y )
	local Npc_Z = ReadRoleValue ( NpcID , EM_RoleValue_Z )
	local num = 10
	local Npc_obj = 30
	local obj_X = 0
	local obj_Z = 0
	local OrgID = 117552
	local move_time = 0
	local move_Value = 0
	local obj_table = {}
	local Temp_table = {}
	local chack_dir = 0
	local Change_dir = 0
	
	MoveToFlagEnabled( NpcID , false ) ---系統內建的路徑關掉
	WriteRoleValue(  NpcID , EM_RoleValue_IsWalk , 1 )
	for i = 1 , num , 1 do
	
		obj_X = Npc_X - Npc_obj * math.cos(math.pi*2*(i/num))
		obj_Z = Npc_Z + Npc_obj * math.sin(math.pi*2*(i/num))
		obj_table[i] = CreateObj( OrgID , obj_X , Npc_Y , obj_Z , 0, 1 )
		MoveToFlagEnabled( obj_table[i] , false ) ---系統內建的路徑關掉
		WriteRoleValue(  obj_table[i] , EM_RoleValue_IsWalk , 1 )
		SetModeEx( obj_table[i] , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
		WriteRoleValue( obj_table[i], EM_RoleValue_LiveTime, 30 )
		AddToPartition ( obj_table[i] , RoomID ) ----物件加入場景,例行公事
	end
	while 1 do
		sleep ( 10 )
		local NewX = ReadRoleValue( NpcID, EM_RoleValue_X )
		local NewZ = ReadRoleValue( NpcID, EM_RoleValue_Z )
		local DisX = ( NewX - Npc_X )^2
		local DisZ = ( NewZ - Npc_Z )^2
		if math.floor( (DisX+DisZ)^0.5) <= 0 then
		
			move_time = move_time + 1
			if move_time >= 5 then
				DebugMsg(0,0,"move")
				Npc_X = Npc_X+math.random(-35,35)
				Npc_Z = Npc_Z+math.random(-35,35)
				MoveDirect( NpcID, Npc_X , Npc_Y , Npc_Z )
				for i = 1 , num , 1 do
					obj_X = Npc_X - Npc_obj * math.cos(math.pi*2*(i/num))
					obj_Z = Npc_Z + Npc_obj * math.sin(math.pi*2*(i/num))
					MoveDirect( obj_table[i], obj_X , Npc_Y , obj_Z )
				end

				move_time = 0
			else
				DebugMsg(0,0,"idle")
				local moveobj_X = ReadRoleValue ( NpcID , EM_RoleValue_X )
				local moveobj_Z = ReadRoleValue ( NpcID , EM_RoleValue_Z )
				Temp_table = {}
				for i = 1 , num , 1 do
					if i < num then
						move_Value = i + 1
					else
						move_Value = 1
					end
					table.insert( Temp_table , obj_table[move_Value] )
				end
				obj_table = Temp_table
				
				for i = 1 , num , 1 do
					local move_obj_X = moveobj_X - Npc_obj * math.cos(math.pi*2*(i/num))
					local move_obj_Z = moveobj_Z + Npc_obj * math.sin(math.pi*2*(i/num))
					MoveDirect( obj_table[i], move_obj_X , Npc_Y , move_obj_Z )
				end

			end
		end
	end
end