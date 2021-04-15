--703115
function Lua_na_166_red_effect()	--融合裝置的初始劇情 108524 / 108542 / 108553
	local Owner = OwnerID()
	AddBuff( Owner , 625263 , 0 , -1 )
	BeginPlot( Owner, "Lua_na_166_red_effect_1" , 0 )
end

function Lua_na_166_red_effect_1() --融合裝置對玩家造成傷害
	local Owner = OwnerID()
	while true do
		SysCastSpellLv( Owner , Owner , 851489 , 0 )
		sleep(30)
	end
end

function Lua_166_equipment_dead()  --融合裝置死亡
	local Owner = OwnerID()
	local Zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID)
	local Monster =	{	[166] = { 108521 , 108522 } , 
				[167] = { 108540 , 108541 },
				[168] = { 108551 , 108552 } 	}
	local x,y,z,dir=DW_Location(OwnerID());--根據物件位置
	local Npc = SearchRangeNPC( Owner , 20)
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	
	
	for i = 0 , #Npc do
		DeBugMsg( 0 , 0 , #Npc)
		if ReadRoleValue( Npc[i] , EM_RoleValue_OrgID) == 123331 then
			local Obj=CreateObj(Monster[Zone][1] , x , y , z , dir , 1)
			AddToPartition(Obj,Room);
			DelObj( Npc[i] )
			break
		elseif ReadRoleValue( Npc[i] , EM_RoleValue_OrgID) == 123332 then 
			local Obj=CreateObj(Monster[Zone][2] , x , y , z , dir , 1 )
			AddToPartition(Obj,Room);
			DelObj( Npc[i] )
			break
		end
	end
	return true
end 

function Lua_na_166_attack_01() --卡沙攻擊動作
	local Owner = OwnerID()
	local R1 = DW_Rand(30)
	AddBuff( Owner , 625186 , 0 , -1 )
	Sleep(R1)
	while CheckBuff(Owner , 625186 ) == true do
		local R = DW_Rand(20)
		if R < 2 then
			PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_INSTANT )
		elseif R < 6 then
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_BUFF_SP01)
		else
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		end
		sleep(25)
	end
end

function Lua_na_166_attack_02()  --卡沙對打用
	local Owner = OwnerID()
	local R1 = DW_Rand(30)
	AddBuff( Owner , 625186 , 0 , -1 )
	Sleep(R1)
	while CheckBuff(Owner , 625186 ) == true do
		local R = DW_Rand(20)
		if R < 1 then
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_PARRY_1H)
		elseif R < 4 then
			PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_SP01)
		elseif R < 6 then
			PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_INSTANT )
		elseif R < 8 then
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_BUFF_SP01)
		else
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		end
		sleep(25)
	end
end


function Lua_na_166_Scout()  --斥侯隱身
	local Owner = OwnerID()
	addbuff( Owner , 625187 , 0 , -1 )
end


--101823 帶隊用蘑菇人
function na_166_walkP1()
	local Owner = OwnerID()
	local Zone = ReadRoleValue( Owner , EM_RoleValue_ZoneID)
	local Monster =	{	[166] = { 108443 , 108522 } , 
			  	[167] = { 108533 , 108541 } ,
				[168] = { 108544 , 108552 }	}  --卡沙強化巡查兵 / 巨狼融合實驗體
	local dis = 15  --可看物件大小調整距離寬度
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Monster[Zone][1], Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( Monster[Zone][2] , Matrix , 3 , 1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( Owner , "na_166_walk01" , 0 )
end

function na_166_walk01()
	sleep( 10 )
	BeginPlot( OwnerID() , "na_166_walkP1" , 0 )
end
	

function Lua_na_166_Scout_trap() --陷阱，在斥侯身邊產生6個陷阱
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID) --確認伺服器的分流
	local Obj = Role:new( Owner )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local NPCGroup = {}
	local X = { 6 }-- 幾邊型
	local dis = { 20 } -- 距離圓心的距離
	local Count = 1

	for i = 1 , #X do
		for j = 1 , X[i] , 1 do
			NPCGroup[Count] = CreateObj( 108555, BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			WriteRoleValue( NPCGroup[Count] , EM_RoleValue_PID , Count )
			Count = Count + 1
		end
	end
	for i = 1 , #NPCGroup do
		SetModeEx( NPCGroup[i] , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( NPCGroup[i] , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( NPCGroup[i] , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( NPCGroup[i] , EM_SetModeType_Mark , false )--標記
		SetModeEx( NPCGroup[i] , EM_SetModeType_Move , true )--移動
		SetModeEx( NPCGroup[i], EM_SetModeType_Gravity, true )--重力
		SetModeEx( NPCGroup[i] , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( NPCGroup[i] , EM_SetModeType_HideName , true )--名稱
		SetModeEx( NPCGroup[i] , EM_SetModeType_ShowRoleHead , false )--頭像框
		SetModeEx( NPCGroup[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( NPCGroup[i] , EM_SetModeType_Drag , false )--阻力
		SetModeEx( NPCGroup[i] , EM_SetModeType_Show , true )--顯示
		Sleep(2)
		AdjustFaceDir( NPCGroup[i] , Owner , 0 ) 
		AddToPartition( NPCGroup[i] , RoomID )
	end
end

function Lua_na_166_Scout_trap2()  --陷阱產生後的劇情
	local Owner = OwnerID()
	Sleep(10)
	Castspell( Owner, Owner, 851494)
	PlayMotionEX( Owner, ruFUSION_ACTORSTATE_DYING, ruFUSION_ACTORSTATE_DEAD)
	sleep(10)
	DelObj( Owner)
end 


function Lua_na_166_meteor_search()
	local Owner = OwnerID()
	local Player = SearchRangePlayer( Owner , 100)
--	Say( Owner , "Player = "..#Player )
	local R = Rand(#Player)
	FaceObj( Owner , Player[R] )
	SysCastSpellLV( Owner , Player[R] , 851500 , 0 ) --丟炸彈	
end