--邪骨之珠

function LuaS_101450_0()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 101450, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	AddBuff( SpellCaster ,502486,1 ,-1 )
	BeginPlot(SpellCaster,"LuaS_101450_1",0)
	return true
end


function LuaS_101450_1()
	sleep(150)
	Delobj(OwnerID())
end


--邪骨之珠

function LuaS_101451_0()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 101451, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	AddBuff( SpellCaster ,502486,1 ,-1 )
	SetAttack(SpellCaster,TargetID())
	BeginPlot(SpellCaster,"LuaS_101451_1",0)
	return true
end


function LuaS_101451_1()
	sleep(300)
	Delobj(OwnerID())
end


function LuaS_112045_0()
--出生階段
	Zone_BoxRand = {}
	local RandCount = {}
	local RandTotal = 0
	local HowManyBox = 0
	for i = 0 , GetMoveFlagCount(780228)-1 do
		Zone_BoxRand[i] = 0
	end



--迴圈階段
	while true do

		--先算有幾個箱子
		for i = 0 , GetMoveFlagCount(780228)-1 do
			if Zone_BoxRand[i] == 1 then
				HowManyBox = HowManyBox + 1
			end
		end
		--如果箱子數量未滿則
		if HowManyBox < GetMoveFlagCount(780228) then
			--亂數決定現在出生的箱子
			math.randomseed(math.random(10000, 99999))
			RandTotal = math.random(GetMoveFlagCount(780228)) -1
--			for i = 0 , GetMoveFlagCount(780228)-1 do
--				if Zone_BoxRand[i] == 0 then
--					RandCount[i] = math.random( 0 , 1 )
--				else
--					RandCount[i] = 0
--				end
--				RandTotal = RandTotal + RandCount[i]
--			end

--			RandTotal = RandTotal -1
--			if RandTotal < 0 then RandTotal = 0

			--跳過已有箱子的點
			for i = 0 , GetMoveFlagCount(780228)-1 do
				if Zone_BoxRand[i] == 1 then
					RandTotal  = RandTotal  + 1
				end

				if RandTotal == i then
					Zone_BoxRand[i] = 1
					local Box
					if ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) == 204 then
						Box = CreateObjByFlag( 101376, 780228, RandTotal , 1 )
					else
						Box = CreateObjByFlag( 101465, 780228, RandTotal , 1 )
					end
					SetModeEx( Box  , EM_SetModeType_ShowRoleHead, false )--頭像框
					AddToPartition( Box , 0 )
					WriteRolevalue(Box , EM_RoleValue_PID , i)
					BeginPlot( Box , "LuaS_112045_1" , 0 )	
					break				
				end
			end
		end
		
		HowManyBox = 0
		RandTotal = 0

		sleep(3000)

	end

end

function LuaS_112045_1()
	SetPlot(OwnerID() , "touch" , "LuaS_112045_2" , 50)
end

function LuaS_112045_2()
	sleep(10)
	SetPlot(TargetID() , "touch" , "LuaS_112045_2" , 50)
	math.randomseed(math.random(10000, 99999))
	local RandBox = math.random(1,100)
	if RandBox > 40 then
		local BoxMonster = LuaFunc_CreateObjByObj( 101405, TargetID() )
		if ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID ) == 204 then
			local Array = {}
			for i=1, 4 do
				Array[i] = LuaFunc_CreateObjByObj( 101406, TargetID() )
				AddToPartition(Array[i] , 0 )
				BeginPlot(OwnerID() , "LuaS_112045_3" , 0 )
			end
		end
		AddToPartition(BoxMonster , 0 )
		BeginPlot(BoxMonster  , "LuaS_112045_3" , 0 )
		SetAttack(OwnerID() , BoxMonster  )
		Zone_BoxRand[ ReadRoleValue(TargetID() , EM_RoleValue_PID) ] = 0
		DelObj(TargetID())
	else
		KillID(OwnerID() , TargetID())
		Zone_BoxRand[ ReadRoleValue(TargetID() , EM_RoleValue_PID) ] = 0
	end
end


function LuaS_112045_3()
	while true do
		sleep(85)
		local AttackTarget = ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			DelObj(OwnerID())
			break
		end
	end
end



function LuaS_101407_0()--巨岩護衛者 裝成石像
	Local Pos_x = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Local Pos_z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)

	while 1 do
		if HateListCount( OwnerID()) > 0 then
			sleep(20)
		else
			if 	math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_X  ) ) - math.abs( Pos_X) <6 	and
				math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_Z  ) ) - math.abs( Pos_Z) <6	then
				sleep(30)
				AddBuff( OwnerID() ,502545,100 ,-1 )
			else
				sleep(30)
			end

		end
	end
end


function LuaS_101397_0() -- 放大1.3倍
	AddBuff( OwnerID() ,502546, 200 ,-1 )
end

--492256

function LuaS_492329_0() --巨岩護衛者的招式
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 112146, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	CastSpell(SpellCaster  , SpellCaster  , 492256)
	BeginPlot(SpellCaster,"LuaS_492329_1",0)
	return true
end


function LuaS_492329_1()
	sleep(150)
	Delobj(OwnerID())
end


--毒霧陷阱


function LuaS_112055_0()
	AddBuff( OwnerID() ,502553, 99 ,-1 )
end

--褻瀆爆發

function LuaS_101409_0()
--	Say(OwnerID() , GetName(TargetID()) )
	if CheckBuff(TargetID() , 502455) == true then
		CancelBuff( TargetID(), 502455)
	end
end