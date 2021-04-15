--------------------------------------- 422511 壞傢伙的弱點 ------------------------------
function LuaI_205573_0()
	local Goods = {205574,205575,205576,205577,205578}
	local Num = math.floor(DW_Rand( 100 )/20 ) +1
	GiveBodyItem( OwnerID() , Goods[Num] , 1 )
	UseItemDestroy()
end

function LuaI_205574_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_422511_0]"  )
	if CheckAcceptQuest( OwnerID() , 422511 ) == true then
		SetFlag( OwnerID() , 542906 , 1 )
	end
	ShowBorder( OwnerID(), 0 ,str ,"ScriptBorder_Texture_Paper" )	
end

----------------------------------------- 422513 燒了他們的房子 -----------------------------------------
function LuaI_205579_Check()
	if CheckAcceptQuest( OwnerID() , 422513 ) == false or CheckFlag( OwnerID() , 542907 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422513_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422513_0]" , 0 ) 
		return false
	end
	local Me = Role:new( OwnerID() )
	local Count = GetMoveFlagCount(780400)
	local Result = "No"
	for i = 4 , Count-1 , 1 do
		local X = GetMoveFlagValue( 780400 , i , EM_RoleValue_X )
		local Y = GetMoveFlagValue( 780400 , i , EM_RoleValue_Y )
		local Z = GetMoveFlagValue( 780400 , i , EM_RoleValue_Z )
		if ( ( Me:X() - X ) ^ 2 + ( Me:Z() - Z ) ^ 2 ) < 2500 then
			Result = "OK"
			break
		end
	end
--	if Me:X() > -3000 or Me:X() < -3280 or Me:Z() > 17500 or Me:Z() <17180 or Me:ZoneID() ~= 8 then
	if Result == "No" then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422513_1]" , 0 ) --你必須更靠近[ZONE_BODO OF EARTH]中土之圖騰柱旁儀式大廳的木造部分才行
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422513_1]" , 0 ) 
		return false
	end
	return true
end

function LuaI_205579_Use()
	local Fire = Lua_CreateObjByDir( OwnerID() ,112399 , 20 , 0 ) 
	Lua_ObjDontTouch( Fire ) 
	AddToPartition( Fire , 0 )
	AddBuff( Fire , 503605 , 1 , -1 )
	BeginPlot( Fire , "LuaI_205579_Play" , 0 )
	if CheckAcceptQuest( OwnerID() , 422513) == true then
		SetFlag( OwnerID() , 542907 , 1 )
	end
end

function LuaI_205579_Play()	
	local Me = Role:new( OwnerID() )
	local FireMan = {}
	for i = 1 , 3 , 1 do
		Fireman[i] = CreateObjByFlag( 102352, 780400 , i , 1 )
		WriteRoleValue( Fireman[i] , EM_RoleValue_PID , TargetID() )
		WriteRoleValue( Fireman[i] , EM_RoleValue_Register , i )
		BeginPlot( Fireman[i]  , "LuaI_205579_FireMan" , 0 )
		SetRoleCamp( Fireman[i]  , "Visitor" )
	end
	sleep( 30 )
	AddBuff( OwnerID() , 502724 , 1 , -1 )
	local Count = GetMoveFlagCount(780400)
	local Dis = 20
	local Fire = {}
	local num = 1
	local FirePoint = {}
	for i = 1 , Count-4 , 1 do
		FirePoint[i] = i + 3
	end
	while table.getn( Fire ) < Count -4 do
		for pry , obj in pairs(FirePoint) do
			if obj ~= 0 then
				local X = GetMoveFlagValue( 780400 , obj , EM_RoleValue_X )
				local Y = GetMoveFlagValue( 780400 , obj , EM_RoleValue_Y )
				local Z = GetMoveFlagValue( 780400 , obj , EM_RoleValue_Z )
				if ( ( Me:X() - X ) ^ 2 + ( Me:Z() - Z ) ^ 2 ) < Dis^2 then
					Fire[num] = CreateObj( 112399 , X , Y , Z , 0 , 1 )
					Lua_ObjDontTouch( Fire[num] ) 
					AddToPartition( Fire[num] , 0 )
					BeginPlot( Fire[num] , "LuaI_205579_Fire" , 0 )
					WriteRoleValue(  Fire[num]  , EM_RoleValue_LiveTime , 60 )
					num = num + 1
					FirePoint[pry] = 0
				end
			end
		end
		Dis =Dis + 20
		if Dis > 320 then
			break
		end
		sleep( 30 )
	end
	sleep( 100 )
	CancelBuff_NoEvent( OwnerID() , 502724 )
	sleep( 50 )
--	for pry , obj  in pairs(Fire) do
--		if CheckID( obj ) == true and ReadRoleValue( obj , EM_RoleValue_OrgID ) == 112399 then
--			Delobj( obj )
--		end
--	end
	DelObj( OwnerID() )
end

function LuaI_205579_Fire()	
	local ObjTable =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 112399 , 10 , 1 )
	local Result = "OK"
	for pry , obj in pairs(ObjTable) do
		if Obj == -1 then
			break
		end
		if Obj ~= OwnerID() then
			Result = "NO"
		end
	end
	if ObjTable[0] ~= OwnerID() then
		Result = "NO"
	end 
	if  Result == "NO" then
		Delobj(  OwnerID() )
	else
		AddBuff( OwnerID() , 503605 , 1 , -1 )
		sleep( 30 )
		AddBuff( OwnerID() , 502724 , 1 , -1 )	
		sleep( 200 )
		CancelBuff_NoEvent( OwnerID() , 502724 )
	end
end

function LuaI_205579_FireMan()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local pry = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	sleep( 50 )
	AddToPartition( OwnerID() , 0 )
	if pry == 1 then
		Yell( OwnerID() , "[SC_422513_2]" , 3 ) --燒起來了！燒起來了！快把火撲滅！
	end
	sleep( 20 )
	if pry == 3 and CheckID(Player) == true then
		local Monster = {102226 , 102227 , 102228 , 102352 }
		Yell( OwnerID() , "[SC_422513_3]" , 3 ) --放火的傢伙在這裡，殺了他！
		LuaFunc_MonsterAlert_Script( Monster , 100 )
	end
	if CheckID(Player) == true then
		Hide( OwnerID() )
		SetRoleCamp( OwnerID() , "Monster" )
		Show( OwnerID() , 0 )
		SetAttack( OwnerID() , Player )
	end

	LuaFunc_Obj_Suicide(0)
end

--------------------- 422506 再從食物下手？ -----------------------
function LuaI_205568_0()
	if CheckAcceptQuest( OwnerID() , 422506 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422506_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422506_0]" , 0 ) 
	elseif CountBodyItem( OwnerID() , 205569) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422506_1]" , 0 ) --你已經取得足夠的[205569]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422506_1]" , 0 ) 
	else
		local Food = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113247 , 50 , 1) 
		if Food[0] == -1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422506_2]" , 0 ) --你必須靠近[113247]才能使用
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422506_2]" , 0 ) 
		else
			local target = 0
			for pry , obj in pairs(Food) do
				if obj == -1 then
					break
				end
				if ReadRoleValue(obj, EM_RoleValue_PID ) == 0 then
					target = obj
					break
				end
			end
			if target == 0 then
				if ReadRoleValue( food[0] , EM_RoleValue_PID ) > 0 then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422506_4]" , 0 ) --目標已經被冰封了
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422506_4]" , 0 ) 
				else
					target = food[0]
					BeginPlot(  target  , "LuaI_205568_1" , 0)
				end
			end
		end
	end
end

function LuaI_205568_1()
	local Me = Role:new( OwnerID() )
	local Ice = CreateObj( 112399 ,Me:X() , Me:Y() ,Me:Z() , Me:Dir() , 1)
	Lua_ObjDontTouch( Ice ) 
	AddToPartition( Ice , 0 )
	AddBuff( Ice , 500988 , 1 , -1 )
	sleep( 10 )
	AddBuff( Ice , 504001 , 1 , -1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Ice )
end


function LuaQ_422506_BeforClick()
	local Ice = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	if Ice > 0 then
		return 1
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422506_3]" , 0 ) --你必須先使用[205568]讓[113247]結冰
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422506_3]" , 0 ) 
	end
	return -1
end

function LuaQ_422506_AfterClick()
	local Ice = ReadRoleValue(  TargetID()  , EM_RoleValue_PID )
	if CheckID( Ice ) == true and ReadRoleValue( Ice , EM_RoleValue_OrgID ) == 112399 then
		Delobj( Ice )
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
	return 1
end

--------------------------------------------------------- 422507 設法接觸 ---------------------------------
function LuaM_493669_Check()
	if CheckAcceptQuest( OwnerID() , 422507 ) == false or CountBodyItem(OwnerID() , 205571) > 0 then
--	if CountBodyItem(OwnerID() , 205571) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102232 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_1]" , 0 ) --這不是你要帶回去的對象
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_2]" , 0 ) --[102232]已經死了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_2]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID()  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_3]" , 0 ) --你必須先讓[102232]注意到你！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_3]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) >  ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )/2  then
		SetAttack( TargetID() , OwnerID() )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_4]" , 0 ) --[102232]頑強的抵抗著
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_4]" , 0 ) 
		return false
	end
	return true
end

function LuaM_504002_Effect()
	BeginPlot( TargetID() , "LuaM_504002_Reset" , 0 )
	GiveBodyItem( OwnerID() , 205571 , 1 )
	UseItemDestroy()
end

function LuaM_504002_Reset()
	LuaFunc_ResetObj( OwnerID() ) 
end

------------------------------------ 422508 取得嚕贊的信任 -------------------
function LuaI_205572_0()
	if CheckAcceptQuest( OwnerID() , 422508 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422508_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422508_0]" , 0 ) 
		return
	end
	if CheckFlag( OwnerID() , 542911) == true then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422508_1]" , 0 ) --[205572]在你手中飄浮著，你可以感覺到上面充滿了風的力量
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422508_1]" , 0 ) 
		return
	end
	local WindTotem = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113212 , 50 ) 
	if WindTotem  < 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422508_2]" , 0 ) --你離[113212]還不夠近
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422508_2]" , 0 ) 
		return
	end
	SetFlag( OwnerID() , 542911 , 1 )
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422508_3]" , 0 ) --風的聲音在你四週回蕩著
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422508_3]" , 0 ) 
	CastSpell( OwnerID() , OwnerID() , 493668 )
	return
end

------------------------------------------------ 422509 風神的指示 --------------------------------
function LuaI_113248_0()
	local DummyCage = LuaFunc_CreateObjByObj(113255, OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , DummyCage )
	Hide( DummyCage)
	Lua_ObjDontTouch( DummyCage   ) 
	SetModeEX(DummyCage , EM_SetModeType_Obstruct , true )
	Show( DummyCage , 0 )
end
function LuaS_113248_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422509 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422509_0]" ,"LuaS_113248_1", 0 ) --風神有什麼話要告訴我？
	end
end

function LuaS_113248_1()
	SetSpeakDetail( OwnerID(), "[SC_422509_1]" ) --在禁制之壁被封印的當時......
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422509_2]" ,"LuaS_113248_2", 0 ) --我該怎麼做？
end

function LuaS_113248_2()
	SetSpeakDetail( OwnerID(), "[SC_422509_3]" ) --風神說，不用擔心......
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422509_4]" ,"LuaS_113248_3", 0 ) --什麼是過往的榮耀？
end

function LuaS_113248_3()
	SetSpeakDetail( OwnerID(), "[SC_422509_5]" ) --風神無法告訴你們太多......
--	if CheckAcceptQuest( OwnerID() , 422509 ) == true then
		SetFlag( OwnerID() , 542912 , 1 )
--	end 
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422509_6]" ,"LuaS_113248_0", 0 ) --謝謝你，我會牢記風神的指示。
end

function LuaQ_422509_Complete()
	AddBuff( TargetID() , 504004 , 1 , 60 )
	DisableQuest( OwnerID() , true )
	local Cage = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Hide( Cage )
	Hide( OwnerID() )
	local DummyShaman = LuaFunc_CreateObjByObj( 113259 , OwnerID() )
	local DummyCage = LuaFunc_CreateObjByObj(113258 , OwnerID() )
	local DummyNPC = CreateObjByFlag( 113257 , 780401 , 1 , 0 )
	WriteRoleValue( DummyShaman , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( DummyNPC , EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( DummyShaman , false )
	MoveToFlagEnabled( DummyNPC , false )
	Hide( DummyShaman )
	Hide( DummyCage)
	Lua_ObjDontTouch( DummyShaman  ) 
	Lua_ObjDontTouch( DummyCage   ) 
	Lua_ObjDontTouch( DummyNPC  ) 
	SetModeEX(DummyCage , EM_SetModeType_Obstruct , true )
	Show( DummyShaman  , 0 )
	Show( DummyCage , 0 )
	AddToPartition( DummyNPC  , 0 )
	sleep(10)
	DW_MoveToFlag( DummyNPC , 780401 , 2 , 0 )	
	sleep(5)
	AdjustFaceDir( DummyNPC , OwnerID(), 0 )
	sleep(5)
	PlayMotion( DummyNPC , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep(30)
	Delobj( DummyCage)
	PlayMotion( DummyNPC , ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep(10)
	PlayMotion( DummyNPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( DummyNPC , "[SC_422509_7]" , 3 ) --很抱歉使用這麼粗暴的方法將你擄來。
	sleep( 30 )
	PlayMotion( DummyShaman , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	Yell( DummyShaman , "[SC_422509_8]" , 3 ) --沒關係，風神說你們是朋友，是可以信任的人，我不會介意的。
	sleep(30)
	PlayMotion( DummyShaman , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Yell( DummyShaman , "[SC_422509_9]" , 3 ) --希望你們可以成功，阻止那股邪惡勢力，我要先回[ZONE_BODO OF WIND]了，後會有期。
	sleep( 30 )
	BeginPlot( DummyShaman , "LuaQ_422509_Play" , 0 )
	sleep(20)
	AdjustFaceDir( DummyNPC , DummyShaman , 0 )
	sleep(5)
	PlayMotion( DummyNPC , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep(30)
	if CheckID( TargetID() ) == true then
		AdjustFaceDir( DummyNPC , TargetID() , 0 )
		sleep(5)
		PlayMotion( DummyNPC , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		sleep( 30 )
	end
	DW_MoveToFlag( DummyNPC , 780401 , 1 , 0 )	
	DelObj( DummyNPC )
	if CheckID( TargetID() ) == true then
		CancelBuff_NoEvent( TargetID() , 504004 )
	end
	sleep( 30 )
	Show( Cage , 0 )
	Show( OwnerID() , 0)
	DisableQuest( OwnerID() , false )
end

function LuaQ_422509_Play()
	DW_MoveToFlag( OwnerID() , 780401 , 3 , 0 )	
	DelObj( OwnerID() )
end
----------------------------------------------------------------------------------------------------------------