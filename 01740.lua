function LuaI_103485_EASY()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = 0
	local Timer = 0
	local OnBattle = 0
	local Wave = {}
	local WaveLv = 50
	local WaveTime = 10
	local d = 10
	local WavePos = 3
	
	for i = 1 , 4 , 1 do
		Wave[i] = {}
	end

	local Wall = {}
	for i = 1 , 2 , 1 do
		Wall[i] = CreateObjByFlag(112399, 780361 ,i*2-1, 1 )
		SetModeEx( Wall[i], EM_SetModeType_Gravity , false)
		Lua_ObjDontTouch( Wall[i] ) 
		AddToPartition( Wall[i]  , RoomID )
		BeginPlot( Wall[i] , "LuaI_103485_Wall_EASY" , 0 )
	end

	while 1 do
		Count = HateListCount( OwnerID() )
		if Count > 0 then
						 	
			local PPL = SetSearchAllPlayer(RoomID )
			if OnBattle == 0 then --進入戰鬥Show訊息
				AddBuff( OwnerID() , 503723 , 1 , 300 )
				OnBattle = 1
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102021_0]" , 0 ) --愚蠢的人類！你們以為在海之祭司前這種保護你們的祝福還會有用嗎？
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102021_0]" , 0 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_SP02 )
				CastSpell( OwnerID() , OwnerID() , 492669 )
				local Flag = 1
				for i = 1 , PPL , 1 do 
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID , OwnerID() ) < 200 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 then
						 SetPosByFlag( ID , 780360 , Flag ) 
						CastSpell( ID, ID , 491922 )
						Flag = Flag + 1
						if Flag > GetMoveFlagCount(780360) -1 then
							Flag = 1
						end
					end
				end
			end
				 
			for i = 1 , PPL , 1 do --戰鬥中不斷上Buff
				local ID = GetSearchResult()
				if CheckBuff( ID ,506297 ) == false and ReadRoleValue(ID, EM_RoleValue_IsDead) == 0 and ReadRoleValue(ID, EM_RoleValue_IsPlayer) == 1 then
					if ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 then
						AddBuff( ID , 506297 , 0 , -1 )
					end
				end
			end
			if Timer == 30-WaveTime then
				EnableNpcAI( OwnerID() , false );
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102021_1]" , 0 ) --孕育吾等的海流啊！回應我的呼喚！將這些入侵者作為您的祭品吧！
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102021_1]" , 0 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_SP01 )
				local RandNum1 = DW_Rand(WavePos)
				local RandNum2 = DW_Rand(WavePos) + WavePos
				Wave[1][1] = CreateObjByFlag(103483 , 780361 ,RandNum1, 1 )
				Wave[2][1]= CreateObjByFlag(103483 , 780361 ,RandNum1 + WavePos*2 , 1 )
				Wave[3][1] = CreateObjByFlag(103483 , 780361 ,RandNum2 , 1 )
				Wave[4][1] = CreateObjByFlag(103483 , 780361 ,RandNum2 + WavePos*2 , 1 )
				AdjustFaceDir(Wave[1][1] , Wave[2][1] , 0 ) 
				AdjustFaceDir(Wave[2][1] , Wave[1][1] , 0 ) 
				AdjustFaceDir(Wave[3][1] , Wave[4][1] , 0 ) 
				AdjustFaceDir(Wave[4][1] , Wave[3][1] , 0 ) 
				sleep( 5 )
				for j = 1 , 4 , 1 do
					local Cal
					local obj = Role:new( Wave[j][1] )
					Cal = (math.pi/180)*(obj:Dir()) 
					local Y1 = GetHeight( obj:X() - d* math.sin( Cal ), obj:Y()  , obj:Z() - d * math.cos( Cal ) );
					local Y2 = GetHeight( obj:X() + d* math.sin( Cal ), obj:Y()  , obj:Z() + d * math.cos( Cal )  );
					Wave[j][2] =  CreateObj ( 103483 , obj:X() - d* math.sin( Cal ), Y1, obj:Z() - d * math.cos( Cal ) , obj:Dir() , 1)
					Wave[j][3] =  CreateObj ( 103483 , obj:X() + d* math.sin( Cal ), Y2  , obj:Z() + d * math.cos( Cal ) , obj:Dir() , 1)
				end
				for j = 1 , 4 , 1 do
					for i = 1 , 3 , 1 do
						Lua_ObjDontTouch( Wave[j][i] )
						WriteRoleValue( Wave[j][i]  , EM_RoleValue_LiveTime, WaveTime )
						AddToPartition(  Wave[j][i]  , RoomID )
					end
				end

				if  ( ReadRoleValue( OwnerID() , EM_RoleValue_HP) / ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP) )*100 > 7 and 
					( ReadRoleValue( OwnerID() , EM_RoleValue_HP) / ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP) )*100 < 8 then
					local FunnyBoy = CreateObjByFlag(101773, 780361 , 1 , 1 )
					SetFightMode( FunnyBoy , 0 , 1 , 0 , 0 )
					Lua_ObjDontTouch(  FunnyBoy )
					WriteRoleValue( FunnyBoy  , EM_RoleValue_LiveTime, WaveTime )
					WriteRoleValue( FunnyBoy  , EM_RoleValue_IsWalk, 0 )
					AddToPartition(  FunnyBoy , RoomID )
					BeginPlot( FunnyBoy , "LuaI_102021_Funny" , 0 )
				end
				sleep( 5 )
				CastSpellLV(  Wave[2][1] ,  Wave[1][1] , 493214 ,WaveLv ) 
				CastSpellLV(  Wave[2][2] ,  Wave[3][1] , 493214 ,WaveLv ) 
				CastSpellLV(  Wave[4][2] ,  Wave[3][3] , 493214 ,WaveLv )
				sleep(3)
				CastSpellLV(  Wave[3][1] ,  Wave[4][1] , 493214 ,WaveLv ) 
				CastSpellLV(  Wave[1][2] ,  Wave[2][3] , 493214 ,WaveLv ) 
				CastSpellLV(  Wave[3][2] ,  Wave[4][3] , 493214 ,WaveLv )
				sleep( 27 )
				CastSpellLV(  Wave[1][1] ,  Wave[2][1] , 493215 ,WaveLv ) 
				CastSpellLV(  Wave[1][3] ,  Wave[2][2] , 493215 ,WaveLv ) 
				CastSpellLV(  Wave[3][3] ,  Wave[4][2] , 493215 ,WaveLv )
				sleep(3)
				CastSpellLV(  Wave[4][1] ,  Wave[3][1] , 493215 ,WaveLv ) 
				CastSpellLV(  Wave[2][3] ,  Wave[1][2] , 493215 ,WaveLv ) 
				CastSpellLV(  Wave[4][3] ,  Wave[3][2] , 493215 ,WaveLv )
				sleep(7)
				Timer = Timer + 5
				EnableNpcAI( OwnerID() , true );
			end
			sleep( 10 )
			Timer = Timer + 1
			if Timer >= 30 then
				Timer = Timer - 30
			end
		else
			if OnBattle == 1 then --結束戰鬥清除玩家身上buff
				OnBattle = 0
				Timer = 0
				local PPL = SetSearchAllPlayer(RoomID )
				for i = 1 , PPL , 1 do
					local ID = GetSearchResult()
					if CheckBuff( ID ,506297 ) == true then
						CancelBuff_NoEvent( ID , 506297 )
					end
				end
				if CheckBuff( OwnerID() , 503723 ) == true then
					CancelBuff_NoEvent( OwnerID() , 503723 )
				end
				if CheckBuff( OwnerID() , 503724 ) == true then
					CancelBuff_NoEvent( OwnerID() , 503724 )
				end
			end
			sleep( 10 )	
		end
	end
end


function LuaI_103485_Wall_EASY()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = TargetID()
	local Square = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110578 , 100, 1)
	local Count
	local Switch = "Close"
	local Me = Role:new( OwnerID() )
	local JellyFish = CreateObj( 102103 , Me:X() , Me:Y() - 100 , Me:Z() , Me:Dir() , 1 )
	SetModeEx( JellyFish , EM_SetModeType_Gravity , false)
	Lua_ObjDontTouch( JellyFish) 
	AddToPartition( JellyFish , RoomID )
	while 1 do
		if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 or CheckID(Boss) == false or ReadRoleValue( Boss, EM_RoleValue_OrgID )~= 103485 or ReadRoleValue( Boss, EM_RoleValue_RoomID )~= RoomID then
			Switch = "Open"
			break
		end
		Count = HateListCount( Boss )
		if Count > 0 then
			if Switch == "Open" then
				Switch = "Close"
				for i = 0 , 10 , 1 do
					if Square[i] == -1 then
						break
					end
					Hide( Square[i]  )
					SetModeEx( Square[i]  , EM_SetModeType_Obstruct ,True)
					Show( Square[i]  , RoomID )
				end
				Show( JellyFish , RoomID )

			end
			sleep( 60 )
		else
			if Switch == "Close" then 
				Switch = "Open"
				for i = 0 , 10 , 1 do
					if Square[i] == -1 then
						break
					end
					Hide( Square[i]  )
					SetModeEx( Square[i]  , EM_SetModeType_Obstruct ,false)
					Show( Square[i]  , RoomID )
				end
				Hide( JellyFish )
			end
			sleep( 10 )
		end
	end
	for i = 0 , 10 , 1 do
		if Square[i] == -1 then
			break
		end
		Hide( Square[i]  )
		SetModeEx( Square[i]  , EM_SetModeType_Obstruct ,false)
		Show( Square[i]  , RoomID )
	end
	Hide( JellyFish )	
end