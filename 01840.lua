--貝爾.愛林頓 103913
--貝爾.愛林頓 115489
--大包裹 115504
--亞歷恩.耶里 103914
--袋中怪物 103907
--愛古達的執行計畫 423191
--物品：神秘客的服裝 207173
--物品：包裹 207299
--變身buff：神秘客偽裝 506712
--移動旗子：780611
--完成旗標：544023
--544024 與亞歷恩接觸
--544025 與貝兒接觸

function LuaS_115489_0()
	if CheckFlag( OwnerID() , 544025 ) == true and CheckAcceptQuest( OwnerID() , 423191 ) == true and CheckBuff( OwnerID() , 506712 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_423191_A_10]" ) --你先到[ZONE_KAIYA_VILLAGE]的湖畔等我，一會兒，我就會到那。
	else
		LoadQuestOption( OwnerID() )	
		if CheckBuff( OwnerID() , 506712 ) == true then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423191_A_0]" , "LuaS_115489_1", 0 )	--(將包裹交至她的手上。)
		end
	end
end

function LuaS_115489_1()
	if CheckAcceptQuest( OwnerID() , 423191 ) == false then
		SetSpeakDetail( OwnerID() , "[SC_423191_A_1]" ) --我不是跟你說過，沒事不要這麼大搖大擺的進入村莊，免得讓人懷疑！
	elseif CountBodyItem( OwnerID() , 207299 ) == 0 and CheckFlag( OwnerID() , 544025 ) == false then
		SetSpeakDetail( OwnerID() , "[SC_423191_A_2]" ) --嗯，我知道了！我已經跟你說過，不要這麼大搖大擺的進入村莊，免得讓人懷疑！怎麼就是聽不懂人話？
	else
		DelBodyItem( OwnerID() , 207299 , 1 )
		SetFlag( OwnerID() , 544025 , 1 )
		SetSpeakDetail( OwnerID() , "[SC_423191_A_3]" ) --嗯，我知道了！我已經跟你說過，不要這麼大搖大擺的進入村莊，免得讓人懷疑！怎麼就是聽不懂人話？罷了，你先到[ZONE_KAIYA_VILLAGE]的湖畔等我，一會兒，我就會到那。
	end
end

function LuaI_207173_Check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_1]" , 0 ) --戰鬥中無法換裝。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_1]" , 0 )
		return false
	end
	if CheckBuff( OwnerID() , 506712 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_2]" , 0 ) --你已經換上[207173]了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_2]" , 0 )
		return false
	end
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_3]" , 0 ) --你無法在騎乘時換裝
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaI_207173_USE()
	AddBuff( OwnerID() , 506712 , 0 , -1 )
end

function LuaI_423191_Check()
	SetPlot( OwnerID() , "range" , "LuaI_423191_Check_2" , 50 )
end

function LuaI_423191_Check_2()
	if CheckAcceptQuest( OwnerID() , 423191 ) == true and CheckFlag( OwnerID() , 544023 ) == false and CheckFlag( OwnerID() , 544025 ) == true then

		if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
			if ReadRoleValue(TargetID() , EM_RoleValue_Register + 1 ) ~= OwnerID() then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_A_4]" , 0 ) --[115489]似乎還沒有抵達，如果在這裡等可能會引起不必要的注意，過一會兒再過來會比較好。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_A_4]" , 0 )
			end
			return
		end
		if CheckBuff( OwnerID() , 506712 ) == false  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_A_5]" , 0 ) --或許你該穿上[115462]給你的服裝，再與[115489]見面。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_A_5]" , 0 )
			return
		end
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
		WriteRoleValue( TargetID() , EM_RoleValue_Register + 1 , OwnerID() )	
		BeginPlot( TargetID() , "LuaI_423191_Play" , 0 )
	end
end

function LuaI_423191_Play()
	
	local Flag = 780611
	local Bear = CreateObjByFlag( 103913 , Flag , 1 , 1 )
	local Alien = CreateObjByFlag( 103914 , Flag , 2 , 1 )
	local Bag = CreateObjByFlag( 115504 , Flag , 3 , 1 )
	local Monster = CreateObjByFlag( 103907 , Flag , 3 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Temp = 0
	
	WriteRoleValue( Bear , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Alien , EM_RoleValue_IsWalk , 1 )
	SetRoleCamp( Bear , "Visitor" )
	SetRoleCamp( Alien , "Visitor" )
			
	for i = 1 , 1800 do --計時 30 分鐘
		local State = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
		if CheckID(TargetID() ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and CheckBuff( TargetID() , 506712 ) == false then
			if CheckID( Bear ) == true and ReadRoleValue( Bear, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Bear , EM_RoleValue_Register ) == 0 and State < 4 then
				Yell( Bear , "[SC_423191_C_1]" , 2 ) --怎麼會是你？
				WriteRoleValue( Bear , EM_RoleValue_Register  , 1 )
				SetRoleCamp( Bear , "Monster" )
				SetAttack( Bear , TargetID() )
				CallPlot( Bear , "LuaFunc_423191_Suicide" , 100 )
			end
			if CheckID( Alien ) == true and ReadRoleValue( Alien, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
				Yell( Alien , "[SC_423191_C_2]" , 2 ) --這是怎麼回事？你是誰？你把艾倫怎麼了?
				WriteRoleValue( Alien , EM_RoleValue_Register  , 1 )
				SetRoleCamp( Alien , "Monster" )
				SetAttack( Alien , TargetID() )
				CallPlot( Alien , "LuaFunc_423191_Suicide" , 100 )
			end
		end
		if State == 1 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 and ReadRoleValue( Bear , EM_RoleValue_Register ) == 0 then
			AddToPartition( Bear , RoomID )
			AddToPartition( Alien , RoomID )
			MoveToFlagEnabled( Bear , false )
			MoveToFlagEnabled( Alien , false )
			Yell( Bear , "[SC_423191_B_1]" , 2 ) --跟我們走。
			WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 2 )			
		end
		if State == 2 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 and ReadRoleValue( Bear , EM_RoleValue_Register ) == 0 then
			local Result = 0
			if LuaI_423191_Move_And_Hide( Bear , 4 , 0 ) == true then
				Result = Result + 1
			end
			if LuaI_423191_Move_And_Hide( Alien , 5 , 0 ) == true then
				Result = Result + 1
			end
			if Result > 1 then
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 3 )	
			end
		end
		if State == 3 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 and ReadRoleValue( Bear , EM_RoleValue_Register ) == 0 then
			if Temp == 0 then
				AdjustFaceDir( Bear , Alien, 0 ) --使自己面向目標
				AdjustFaceDir( Alien, Bear , 0 ) --使自己面向目標
			end
			if Temp == 1 then
				PlayMotion( Bear , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				Yell( Bear , "[SC_423191_B_2]" , 2 ) --我說過多少次了？組織是組織，實驗是實驗，我有我的作法，我已經在想辦法幫忙你們把他們都引到[ZONE_ALIMAR_TOMB]了，你們還想怎樣？
			end
			if Temp == 5 then
				PlayMotion( Bear , ruFUSION_ACTORSTATE_EMOTE_POINT )
				Yell( Bear , "[SC_423191_B_3]" , 2 ) --更何況以你們的作法，是不可能抓到實驗品1001號、實驗品762號的！還不如像我一樣一步步接近他們，至少目前1001號已經信賴的喝下我為他做的藥劑。
			end
			if Temp == 9 then
				PlayMotion( Bear , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				Yell( Bear , "[SC_423191_B_4]" , 2 ) --知道的話，就快點回去向他們回報吧！再過不久，他們就會被我引到到[ZONE_ALIMAR_TOMB]，別再惹麻煩了，明白嗎？
			end
			if Temp == 12 then
				AdjustFaceDir( Bear , Alien, 180 ) --使自己面向目標
				if CheckID( TargetID() ) == true then
					AdjustFaceDir( Alien, TargetID() , 0 ) --使自己面向目標
				end
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 4 )	
				Temp = -1
			end
			Temp = Temp + 1
		end
		if State == 4 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
			if Temp == 0 then
				LuaI_423191_Move_And_Hide( Bear , 7,5 )
				PlayMotion( Alien, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
			end
			if Temp == 3 then
				if CheckID( TargetID() ) == true then
					AdjustFaceDir( Alien, TargetID() , 0 ) --使自己面向目標
				end
			end
			if Temp == 4 then
				PlayMotion( Alien , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				Yell( Alien , "[SC_423191_B_5]" , 2 ) --女人啊～就是這樣，愛亂發脾氣！喂～你今天怎麼都不說話呢？好吧！順便把那不怎麼成功的實驗品帶回那個地方吧！
			end
			if Temp == 6 then
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 5 )	
				Temp = -1
			end
			Temp = Temp + 1
		end
		if State == 5 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
			AddToPartition( Bag , RoomID )
			SetPlot( Bag , "touch" , "LuaI_423191_Bag_Touch" , 30 )
			WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 6 )	
		end
		if State == 6 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
			if LuaI_423191_Move_And_Hide( Alien , 6 , 0 ) == true then
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 7 )	
			end
		end
		if State == 7 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
			if Temp == 0 then
				AdjustFaceDir( Alien, Bag , 0 ) --使自己面向目標
			end
			if Temp == 1 then
				PlayMotionEX( Alien , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
			end
			if Temp == 2 then
				Yell( Alien , "[SC_423191_B_6]" , 2 ) --哼！這是就是那些愚蠢村民的下場，怎麼能這樣輕易相信女人給的藥劑呢？
			end
			if Temp == 3 then
				PlayMotion( Alien , ruFUSION_ACTORSTATE_CROUCH_END)
			end
			if Temp == 5 then
				if CheckID( TargetID()) == true then
					AdjustFaceDir( Alien, TargetID() , 0 ) --使自己面向目標
				end
				Yell( Alien , "[SC_423191_B_7]" , 2 ) --將牠帶回去吧！小心一點，不要讓牠逃了出來！
			end
			if Temp == 6 then
				PlayMotion( Alien, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
				if CheckID( TargetID() ) == true and CheckAcceptQuest( TargetID() , 423191 ) == true then
					SetFlag( TargetID() , 544024 , 1 )
				end
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 8 )	
			end
			Temp = Temp + 1
		end
		if CheckID( Bag ) == false and State ~= 9 then
			AddToPartition( Monster , RoomID )
			SetPlot( Monster , "dead" , "LuaI_423191_MonsterDead" , 0 )
			WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 9 )
			if CheckID( TargetID() ) == true then
				SetAttack( Monster , TargetID() )
				CancelBuff_NoEvent( TargetID() , 506712 )
			end
			SetRoleCamp( Alien , "Monster" )
			SetPlot( Alien , "dead" , "LuaI_423191_AlienDead" , 0 )
			CallPlot( Alien , "LuaFunc_423191_Suicide" , 100 )
			CallPlot( Monster , "LuaFunc_423191_Suicide" , 100 )
			Yell( Alien , "[SC_423191_C_2]" , 2 ) --這是怎麼回事？你是誰？你把艾倫怎麼了?
			WriteRoleValue( Alien , EM_Rolevalue_Register , 1 ) --表示亞歷恩.耶里進入戰鬥狀態
			if CheckID( TargetID() ) == true then
				SetAttack( Alien , TargetID() )
			end			 
		end
		sleep( 10 )
		--劇情中斷判定
		if	( CheckID( Alien ) == false or ReadRoleValue( Alien , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Alien , EM_RoleValue_Register ) > 1 ) and
			( CheckID( Bear ) == false or ReadRoleValue( Bear , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Bear , EM_RoleValue_Register ) > 1 ) and
			State < 4 
		then	
			break
		end
		if	( CheckID( Alien ) == false or ReadRoleValue( Alien , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Alien , EM_RoleValue_Register ) > 1 ) and
			State >= 4 
		then
			if CheckID( Monster ) == true and ReadRoleValue( Monster , EM_RoleValue_Register ) == 0 then
				BeginPlot( Monster , "LuaI_423191_MonsterDead" , 0 )
			end
			break
		end

		if CheckID( TargetID() ) == false then
			break
		end
		if CheckAcceptQuest( TargetID() , 423191 ) == false then
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423191_A_6]" , 0 ) --放棄任務，劇情中斷。
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423191_A_6]" , 0 )
			break
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			break
		end
		if CheckID(Alien) == true and ReadRoleValue( Alien , EM_RoleValue_IsDead ) == 0 and GetDistance( TargetID() , Alien ) > 350 then
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423191_A_7]" , 0 ) --超出距離，劇情中斷。
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423191_A_7]" , 0 )
			break
		end
		if i == 1800 then
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423191_A_8]" , 0 ) --超出時間，劇情中斷。
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423191_A_8]" , 0 )
			break
		end
	end
	if CheckID( TargetID() ) == true then
		SetFlag( TargetID() ,  544024 , 0 ) 
	end
	for i = 1 , 4 , 1 do
		local Obj
		if i == 1 then Obj = Bear end
		if i == 2 then Obj = Alien end
		if i == 3 then Obj = Bag end
		if i == 4 then Obj = Monster end
		if CheckID( Obj ) == true and ReadRoleValue( Obj , EM_RoleValue_IsDead ) == 0 then DelObj( Obj ) end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )		
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +1 , 0 )	
end

function LuaI_423191_Move_And_Hide( Obj , FlagNum , Time)
	local X = GetMoveFlagValue( 780611 ,FlagNum , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780611 ,FlagNum , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780611 ,FlagNum , EM_RoleValue_Z )
	local ObjID = Role:new( Obj )
	local Dis = ( ObjID:X() - X ) ^ 2 + ( ObjID:Y() - Y ) ^ 2 + ( ObjID:Z() - Z ) ^ 2

	if Time > 0 then
		WriteRoleValue( Obj , EM_RoleValue_LiveTime , Time )
	end
	if Dis > 250 then
		Move( Obj , X , Y , Z )
		return false
	else
		StopMove(Obj,true)
		return true
	end
end

function LuaI_423191_MonsterDead()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 ) --表示怪物被擊敗的劇情觸發
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack(OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	AddBuff( OwnerID() , 503605 , 1 , -1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_LiveTime , 3 )
	return false
end
function LuaI_423191_AlienDead()
	local count = HateListCount( OwnerID() );
	for i = 1 , Count  , 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( ID , 423191 ) == true then
			SetFlag( ID , 544023  , 1 ) 
		end
	end
	return true
end
function LuaI_423191_Bag_Touch()
	If CheckFlag( OwnerID() , 544024 ) == true and CheckAcceptQuest( OwnerID() , 423191 ) == true then
		Delobj( TargetID() )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_A_9]" , 0 ) --這個袋子裡裝的東西看來十分詭異，在弄清楚之前最好不要輕易碰觸。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_A_9]" , 0 )
	end
end

function LuaFunc_423191_Suicide(Time)
	--Time 物件存在的最低時間
	Sleep(Time)

	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- 六秒檢查一次	
		else
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  == 0 then
				if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 103907 then
					BeginPlot( OwnerID() , "LuaI_423191_MonsterDead" , 0 )
				else
					WriteRoleValue( OwnerID() , EM_RoleValue_register , 2 )
					Lua_CancelAllBuff( OwnerID() ) 
					SetRoleCamp( OwnerID() , "Visitor" )
					LuaI_423191_Move_And_Hide( OwnerID() , 7,5 )
				end
			end
			break		
		end
		sleep(1)
	end
end