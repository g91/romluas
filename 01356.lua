
function LuaI_101881_Dead()  --冰封統計用 script 請放裡面
	local DoorA = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local DoorB = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	BeginPlot( DoorA , "LuaI_101881_OpenDoor" , 0 )
	BeginPlot( DoorB , "LuaI_101881_OpenDoor" , 0 )

	-- 冰封守護者死亡紀錄
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 101881 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )

	return true
end

function LuaI_101883_Dead() --毛腳統計用 script 請放裡面
	local SealDrawf = {}
	local Orb = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	for i = 1 , 3 , 1 do
		SealDrawf[i] = CreateObjByFlag(101885 , 780287 , 6+ i , 1 )
		AddToPartition( SealDrawf[i] , RoomID )
	end
	Orb = CreateObjByFlag(112399, 780287 , 11, 1 )
	AddToPartition( Orb , RoomID )
	 Lua_ObjDontTouch( Orb ) 
	for i = 1 , 3 , 1 do
		SetFightMode( SealDrawf[i] , 0 , 1 , 0 , 0 )
		WriteRoleValue(  SealDrawf[i] , EM_RoleValue_PID , 0 )
		WriteRoleValue( SealDrawf[i] , EM_RoleValue_IsWalk , 0 )
		MoveToFlagEnabled( SealDrawf[i] , false )
	end
	WriteRoleValue( SealDrawf[1] , EM_RoleValue_Register , SealDrawf[2] )
	WriteRoleValue( SealDrawf[1] , EM_RoleValue_Register+1 , SealDrawf[3] )
	BeginPlot( SealDrawf[1] , "LuaI_112331_Play_lv50" ,0)
	BeginPlot( Orb , "LuaI_101883_KnockDoor" ,0)

	-- 毛腳死亡紀錄
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 101883 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )

	return true
end

function LuaI_101883_KnockDoor()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep( 10 )
	local Door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112321 , 100 , 0)
	-------------顯示訊息---------
--	ScriptMessage( OwnerID() , -1 ,2 , Door , 0 )
	-----------------------------------
	if CheckID( Door ) == true and ReadRoleValue( Door , EM_RoleValue_RoomID ) == Room and ReadRoleValue( Door , EM_RoleValue_IsNPC ) == 1 then
		Hide( Door )
	end
	sleep( 100 )
	Hide( OwnerID() ) 
end


function LuaI_101881()
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep( 30 )
	AddBuff( OwnerID() , 502357 , 1 , 86400 )
	local Door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112321 , 1000 , 0)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Door )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	SetPlot( OwnerID() , "Dead" , "LuaI_101881_Dead" , 40 )
end


function LuaI_112331_Play_lv50()
	local Boss = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101881 , 500 , 0)
	local Drawf1 = OwnerID()
	local Drawf2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Drawf3 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
	WriteRoleValue( Boss,  EM_RoleValue_Register , Drawf1)
	WriteRoleValue( Boss,  EM_RoleValue_Register+1 , Drawf2)
	WriteRoleValue( Boss,  EM_RoleValue_Register+2 , Drawf3)
	AdjustFaceDir( Drawf1 , Boss , 0 ) 
	AdjustFaceDir( Drawf2 , Boss , 0 ) 
	AdjustFaceDir( Drawf3 , Boss , 0 ) 
	SetPlot( Boss, "Range" , "LuaI_112331_Play2_lv50" , 300 )
end

function LuaI_112331_Play2_lv50()
	SetPlot( TargetID() , "range" , "" , 0 )
	BeginPlot( TargetID(), "LuaI_112331_Play3_lv50" , 0 )
end

function LuaI_112331_Play3_lv50()
	local Drawf = {}
--	local Auro = {}
	local Auro = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Check = "YES"
	Drawf[1] = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	Drawf[2] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
	Drawf[3] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )
	Yell( Drawf[1] , "[SC_112331_0]" , 5 ) --好！工作啦！（矮人語）
	sleep( 30 )
	Yell( Drawf[3] , "[SC_112331_1]" , 5 ) --這塊冰裡面的傢伙真的會動嗎？（矮人語）
	sleep(30)
	Yell( Drawf[2] , "[SC_112331_2]" , 5 ) --新來的，別問那麼多，乖乖做事就好。（矮人語）
	sleep( 30 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_101585_0]" , 0 )
	AddBuff( OwnerID() , 502848 , 100 , -1 )

	Auro = CreateObjByFlag( 112331 , 780287 ,2, 1 )
	AddToPartition( Auro , RoomID )
	Lua_ObjDontTouch( Auro )
	AddBuff( Auro , 503403 , 1 , -1 )
	sleep( 30 )
	Yell( Drawf[1] , "[SC_112331_3]" , 5 ) --糟了！快躲起來！（矮人語）
	BeginPlot( Drawf[2] , "LuaI_112331_Drawf2_lv50" , 0 )
	LuaFunc_MoveToFlag( Drawf[1] , 780287 , 2 , 0 )
	Yell( Drawf[3] , "[SC_112331_4]" , 5 ) --什麼？什麼？發生什麼事？（矮人語）
	sleep(30)
	CastSpellLV( Drawf[3] , Drawf[3] , 492587 , 30 )
	Yell( Drawf[3] , "[SC_112331_5]" , 5 ) --哇啊啊啊～（矮人語）
	sleep( 20 )
	PlayMotionEX(Drawf[3] , ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	AddBuff( Drawf[3] , 502550 , 100 , 100 )
	AdjustFaceDir( Drawf[1], OwnerID() , 0 ) 
	AdjustFaceDir( Drawf[2], OwnerID() , 0 ) 
	Yell( Drawf[1] , "[SC_112331_6]" , 5 ) --真是有夠笨！警告都響起來了，還不趕快躲進絕緣結界，死了活該！（矮人語）	
	sleep( 30 )
	Yell( Drawf[2] , "[SC_112331_7]" , 5 ) --唉～我們又得找新的學徒了。（矮人語）
	sleep( 30 )
	CancelBuff( OwnerID() , 502848 )
	if CheckID( Auro ) == true and ReadRoleValue( Auro, EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Auro , EM_RoleValue_IsNPC ) == 1 then
		DelObj( Auro)
	end
	Yell( Drawf[1] , "[SC_112331_8]" , 5 ) --繼續吧！少一個人不知道力量夠不夠......（矮人語）	
	sleep( 30 )
	LuaFunc_MoveToFlag( Drawf[1] , 780287 , 7 , 0 )
	LuaFunc_MoveToFlag( Drawf[2] , 780287 , 8 , 0 )
	sleep( 5 )
	DelObj( Drawf[3])
	SetFightMode( Drawf[1], 1 , 1 , 1 , 1 )
	SetFightMode( Drawf[2], 1 , 1 , 1 , 1 )
	Hide( Drawf[1] )
	Show(Drawf[1] , RoomID )
	Hide( Drawf[2] )
	Show(Drawf[2] , RoomID )
	AdjustFaceDir( Drawf[1], OwnerID() , 0 ) 
	AdjustFaceDir( Drawf[2], OwnerID() , 0 ) 
	sleep( 5 )
	BeginPlot( Drawf[1], "LuaP_112331_Seal_lv50" , 0 )
	BeginPlot( Drawf[2], "LuaP_112331_Seal_lv50" , 0 )
	while 1 do
		Check = "YES"
		for i = 1 , 2 , 1 do
			if CheckID( Drawf[i] ) == true and ReadRoleValue(Drawf[i] , EM_RoleValue_OrgID) == 101885 and ReadRoleValue(Drawf[i] , EM_RoleValue_RoomID) == RoomID and ReadRoleValue(Drawf[i] , EM_RoleValue_IsDead) == 0 then
				Check = "NO"
			end
		end
		if Check == "YES" then
			break
		end
		sleep( 60 )
	end
	BeginPlot( OwnerID() , "LuaAI_101881_Battle" , 0 )
end


function LuaI_112331_Drawf2_lv50()
	LuaFunc_MoveToFlag( OwnerID() , 780287 , 2 , 0 )
	sleep( 5 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
end

function LuaI_112331_Drawf3_lv50()
	for i = 1 , 30 , 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
			break
		end
		Yell( OwnerID() , "[SC_112331_4]" , 5 ) --什麼？什麼？發生什麼事？（矮人語）
		sleep( 20 )
	end
end

function LuaP_112331_Seal_lv50()
	while 1 do
		if HateListCount( OwnerID() ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 0 then
			CastSpell( OwnerID() , TargetID() , 492184 )
		else
			AddBuff( OwnerID() , 502383 , 1 , 1 )
		end
		if CheckID( TargetID() ) == false or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep( 60 )
	end
end

Function LuaAI_101881_Battle()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Dummy = 0
	local Target = 0
	local Count = 0
	local AuroCount = 0
	local Num = 6
	local Auro = 0
	local Door = {}
	local Flag = 1
	local R2U2 = 0

	Door[0] = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local DoorIce = 0

	CancelBuff( OwnerID() , 502357 )
	sleep( 1 )
	CastSpell( OwnerID() , OwnerID() , 492608 )
	sleep( 5 )
	Door[1] = CreateObjByFlag( 112321 , 780287 , 10 , 1 )
	SetModeEx( Door[0] , EM_SetModeType_Show , false) 
	DoorIce = LuaFunc_CreateObjByObj ( 112307 , Door[0]  )
	Door[2] = LuaFunc_CreateObjByObj ( 112307 , Door[1]  )
--	AddToPartition( DoorIce , RoomID )
	AddToPartition( Door[1] , RoomID )
--	AddToPartition( Door[2] , RoomID )
	SetModeEx( Door[1] , EM_SetModeType_Show , false) 
	SetModeEx( Door[1] , EM_SetModeType_Obstruct , true) 
	Lua_ObjDontTouch(Door[1])
	WriteRoleValue( Door[0]  , EM_RoleValue_PID , DoorIce )
	WriteRoleValue( Door[1]  , EM_RoleValue_PID ,Door[2] )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9 ,Door[1] )
	Lua_ObjDontTouch( DoorIce )
	Lua_ObjDontTouch( Door[2])
	Hide( Door[0]  )
	Show(Door[0] , RoomID )
	AddBuff( DoorIce , 502357 , 1 , 86400 )
	AddBuff( Door[2]  , 502357 , 1 , 86400 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_101585_2]" , 0 )
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_101585_2]" , 0 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_REVIVING )
	sleep( 15 )
	Yell( OwnerID() , "[SC_101585_1]" , 5 )
	SetFightMode( OwnerID() , 1 , 1 , 1 , 1 )
	local State = 0
	local Down = "No"
	local Target = 0
	Hide( OwnerID() )
	Show( OwnerID() , RoomID )

	while 1 do
		if  HateListCount( OwnerID() ) > 0 then
			Show( Door[1] , RoomID )
			Show( Door[2] , RoomID )
			if CheckBuff( Door[2] , 502357 ) == false then
				AddBuff( Door[2]  , 502357 , 1 , 86400 )
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_101585_2]" , 0 )
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_101585_2]" , 0 )
			end

			if Count == 8 or Count == 16 or Count == 24 then
				EnableNpcAI( OwnerID() , false );
				SetModeEx(  OwnerID()  , EM_SetModeType_DisableRotate, true) 
				SetModeEx(  OwnerID()  , EM_SetModeType_Move, false) 
				local Obj = Role:new( ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID))
				Dummy = CreateObj ( 112047 , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir()  , 1)
				AddToPartition( Dummy , RoomID )
				Lua_ObjDontTouch( Dummy )
				WriteRoleValue( Dummy , EM_RoleValue_LiveTime , 30 )
				CastSpellLV( OwnerID() , Dummy , 492533 , 9 ) --觸電+符文拳擊
			end
			if Count == 11 or Count == 19 or Count == 27 then
				SetModeEx(  OwnerID()  , EM_SetModeType_DisableRotate, false) 
				SetModeEx(  OwnerID()  , EM_SetModeType_Move, true) 
				EnableNpcAI( OwnerID() , true );
			end
			if Count == 25 then
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_101585_0]" , 0 )
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_101585_0]" , 0 )
			end
			if Count == 30 then
				Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				Down = "Yes"
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_101585_0]" , 0 )
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_101585_0]" , 0 )
				SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
				PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
				Lua_CancelAllBuff( OwnerID()  )
				EnableNpcAI( OwnerID() , false )
				AddBuff( OwnerID() , 502550 , 60 , 60 )
				AddBuff( OwnerID() , 502848 , 50 , -1 ) --能量溢出
			end
			if Count >= 30 and Count < 45 then
				State = State + 1
			end
			if AuroCount == 0 then
				Auro = CreateObjByFlag( 112331 , 780287 , Flag , 1 )
				AddToPartition( Auro, RoomID )
				SetPlot( OwnerID() , "range" , "LuaAI_101881_RangeBuff" , 15 )
				Lua_ObjDontTouch( Auro)
				AddBuff( Auro , 503403 , 1 , -1 )
				WriteRoleValue( Auro , EM_RoleValue_LiveTime , 8 )
				Flag = Flag + 1
				if Flag > 6 then
					Flag = 1
				end
			end
			AuroCount  = AuroCount  + 1
			if AuroCount == 5 then
				AuroCount = 0
			end

			if State >= 2 and Down == "Yes" then
				local PPL = SetSearchAllPlayer(RoomID )
				for i = 1 , PPL , 1 do
					local ID = GetSearchResult()
					local BuffCheck = {[0] =502832 , [1] =502902 , [2] =501546 ,[3] =503402} --有這些buff就不會受傷害503402絕緣結界
					local BuffResult = 1
					for i = 0 , table.getn(BuffCheck ) do
						if CheckBuff( ID ,BuffCheck[i] ) == true then
							BuffResult = 0
							break
						end 
					end
					if 	BuffResult == 1 and ReadRoleValue( ID , EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0
						and ReadRoleValue( ID , EM_RoleValue_RoomID) == RoomID and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 then
						ScriptMessage(ID , ID , 1 , "[SC_101585_3]" , 0 )
						ScriptMessage( ID , ID , 0 , "[SC_101585_3]" , 0 )
						CastSpellLV( ID , ID , 492587 , 500 ) --一擊殺
					end
				end
				State = 0
			end

			if Count == 45 then	
				Down = "No"
				State =  0
				Yell( OwnerID() , "[SC_101585_1]" , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_REVIVING )
				sleep( 30 )
				CancelBuff( OwnerID() , 502848)
				SetFightMode( OwnerID() , 1 , 1 , 1 , 1 )
				CancelBuff( OwnerID() , 502550 )
				EnableNpcAI( OwnerID() , true )
				if CheckID(Target) == true then
					FaceObj( OwnerID(), Target  )
					SetAttack( OwnerID() , Target )
				end
				R2U2 = Lua_CreateObjByDir( OwnerID() ,102011, 100 , 0) 
				AddToPartition( R2U2 , RoomID )
				BeginPlot( R2U2 , "LuaI_R2U2_0" , 0 )
				Count = 3
			end
			Count = Count + 1
			sleep( 10 )
		else
			Hide( Door[1]  )
			Hide( Door[2]  )
			if Down == "Yes" then
				State = 0
				Yell( OwnerID() , "[SC_101585_1]" , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_REVIVING )
				sleep( 50 )
				CancelBuff( OwnerID() , 502848)
				SetFightMode( OwnerID() , 1 , 1 , 1 , 1 )
				CancelBuff( OwnerID() , 502550 )
				EnableNpcAI( OwnerID() , true )	
				Down = "No"
			end
			for i = 1 , BuffCount(OwnerID() ) , 1 do
				local BuffID = BuffInfo( OwnerID() , i-1 , EM_BuffInfoType_BuffID)
				CancelBuff( OwnerID() , BuffID )
			end

			if ReadRoleValue( OwnerID() , EM_RoleValue_HP ) < ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) then
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) )
			end 
			Count = 0
			sleep(60)
		end
	end
end

function LuaAI_101881_RangeBuff()
	if CheckBuff( TargetID() , 503403 ) == true then
		AddBuff( OwnerID() , 503402 , 0 , 12 )
	end
end

function LuaI_101881_OpenDoor()
	local ICE = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	CancelBuff(ICE, 502357 )
	sleep( 1 )
	CastSpell(  ICE ,  ICE , 492608 )
	sleep( 10 )
	Hide( ICE)
	Hide( OwnerID() )
end

function LuaI_R2U2_0()
	Yell( OwnerID() , "R2U2....R2U2......" , 10 )
	local Boss = TargetID()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetModeEX( OwnerID() , EM_SetModeType_Strikback ,false )	
	SetModeEX( OwnerID() ,EM_SetModeType_Searchenemy , false)
	SetPlot( OwnerID() , "dead" ,"LuaFunc_DeadPlay" , 0)
	AddBuff( OwnerID() , 502707 , 1 , -1 ) --非戰鬥不回血
	while 1 do
		if ReadRoleValue( Boss, EM_RoleValue_OrgID ) ~= 101881 then
			DelObj( OwnerID() )
			break
		end
		if  ReadRoleValue( Boss, EM_RoleValue_RoomID ) ~= Room  then
			DelObj( OwnerID() )
			break
		end
		if HateListCount( Boss ) == 0 or ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 then
			DelObj( OwnerID() )
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			break
		end
		if GetDistance( OwnerID() , Boss ) > 200 then
			FaceObj( OwnerID() , Boss )
		else
			CastSpellLV( OwnerID() , Boss , 493085 , 1 )
		end
		sleep( 30 )
	end
end