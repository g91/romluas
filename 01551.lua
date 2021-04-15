
function Lua_cang_WD_AI6()

	local SkillA = 0

	while true do
	Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			SkillA = SkillA + 1
			
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
			local ThesePlayer = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- 接暫存值
			end
			local anyone = Rand(table.getn(ThesePlayer))+1	--rand 
			if SkillA >= 10 then 
			
				CastSpellLV( OwnerID() , ThesePlayer[anyone] , 494173 , 1 )
				sleep(30)
				local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				local worm = {}
				for i= 1, 3, 1 do
					worm[i] = LuaFunc_CreateObjByObj ( 102667, ThesePlayer[anyone] )
					AddToPartition( worm[i] ,    RoomID )	--加進舞台
					BeginPlot( worm[i] , "Lua_cang_WD_AI6_1",0 )
					SysCastSpellLV( ThesePlayer[anyone], worm[i], 494176, 1)	--rand出來的人對王嘲諷
					SetAttack( worm[i] , ThesePlayer[anyone] ) --送出攻擊目標
				end
				SkillA = 0
			end
		else
		end	
	end
end

function Lua_cang_WD_AI6_1()

	while true do
	Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		sleep(10)
		if (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			Delobj(OwnerID())
		end
	end
end	


--疾病檢查距離
function Lua_cang_WD_AI4()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--取ROOMID
	local PPL = SetSearchAllPlayer(RoomID)

	for i = 1 , PPL , 1 do --去搜尋
		ID[i] = GetSearchResult() -- 接暫存值
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID[i] , OwnerID() ) > 0 and GetDistance( ID[i] , OwnerID() ) < 75
			and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then
			if ID[i] ~= OwnerID() and Checkbuff(ID[i], 504684) == false then
				AddBuff( ID[i] ,504684,1 ,-1 )	-- +BUFF
			end	
		end	
	end
end	



function Lua_cang_WD_AI5()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = LuaFunc_CreateObjByObj ( 102718, OwnerID() )	--招換
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( Temp )
	AddToPartition( Temp ,    RoomID )	--加進舞台
	AddBuff( Temp ,504812,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_WD_AI5_1",0)

end

function Lua_cang_WD_AI5_1()
	sleep(120)
	Delobj(OwnerID())
end
