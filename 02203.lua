function Lua_na_plants_born()
	local X = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}  
	local Y = 0
	local Y1 = {}
	BeginPlot( OwnerID(), "Lua_na_plants_treasureborn" , 0 )
	for i = 1 , 20 do   -- 產生20個
		Y = Rand(table.getn(X))+1
		Y1[i] = X[Y]
		table.remove(X,Y)
		local plants = {}
		local Crand = rand(2)	--隨機出怪
		if Crand ==1 then
			plants[i] = CreateObjByFlag(117220 , 780840, Y1[i] ,1) --使用旗子產生仙人掌 npc 旗子編號 數量 
		else 
			plants[i] = CreateObjByFlag(117221 , 780840, Y1[i] ,1) --使用旗子產生仙人掌 npc 旗子編號 數量 
		end
		SetModeEx( plants[i]  , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( plants[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( plants[i] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( plants[i] , EM_SetModeType_Mark, true )--標記
		SetModeEx( plants[i] , EM_SetModeType_Move, true )--移動
		SetModeEx( plants[i] , EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( plants[i] , EM_SetModeType_HideName, true )--名稱
		SetModeEx( plants[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( plants[i] , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( plants[i] , EM_SetModeType_Drag , false )--阻力
		SetModeEx( plants[i] , EM_SetModeType_Show, true )--顯示
		AddToPartition( plants[i] , 0 )	--產生仙人掌
		sleep(5)
	end
	BeginPlot( OwnerID(), "Lua_na_plants_count" , 0 )
end


function Lua_na_plants_count()	-- 檢查特定仙人掌npc編號的數量
	local Flower =nil
	--Sleep( 100)
	while true do
		sleep(30)
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Count = SetSearchAllNPC( RoomID )
		local Obj
		local NPC = { 117220,117221, 105125, 105126 }
		local C =0
		if  Count ~= 0 then
			for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
				if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
					for j = 1 , table.getn( NPC ) , 1 do
						if Name == NPC[j] then  --若為陣列中的值
						--WriteRoleValue( ID , EM_RoleValue_PID , 0 )
						C = C+1
						end
					end
				end
			end
		Say ( OwnerID(), "C="..C )
		end	
		if  C == 0 then -- 若場上已經沒有仙人掌
			if Flower ==nil then
			--	Say ( OwnerID(), "1")
				Flower = Lua_na_cactusboss_born(OwnerID())
				WriteRoleValue(OwnerID(),EM_RoleValue_Register10,Flower)
			--	Say ( OwnerID(), Flower)
			--	Say ( OwnerID(), "2")
				BeginPlot( Flower, "Lua_na_hidemarks",0 ) --印記隱藏劇情
			end
		end
	end
end


--仙人掌題目
function Lua_na_plants_Q()  --10
	while true do
--		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  0 )     --清空NPC的題目
		local ran = rand(6)+1
		if ran <= 2 then
			sleep (50)
		elseif ran > 2 and ran <=4 then
			sleep (80)
		else 	
			sleep (100)
		end

		local RANDOM = rand(3)	
		if RANDOM == 0 then  
			sleep(10)
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3,  1 )     --給題目
			local E = ReadRoleValue( OwnerID(), EM_RoleValue_Register+3)	
		--	PlayMotion( OwnerID(), 83) 
			NpcSay(OwnerID(),"[SC_CACTUS_ITEM_01]" ) -- （嫩...肉...）
		elseif RANDOM == 1 then 
			sleep(10)
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3,  2 )     --給題目
			local E = ReadRoleValue( OwnerID(), EM_RoleValue_Register+3)	
		--	PlayMotion( OwnerID(), 83) 
			NpcSay(OwnerID(),"[SC_CACTUS_ITEM_02]" ) --（野...菜...）
		elseif RANDOM == 2 then 
			sleep(10)
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3,  3 )     --給題目
			local E = ReadRoleValue( OwnerID(), EM_RoleValue_Register+3)	
		--	PlayMotion( OwnerID(), 83) 
			NpcSay(OwnerID(),"[SC_CACTUS_ITEM_03]" ) -- （茅...草...）
		end
		sleep(20)
	end
end


function Lua_na_DELplants()--清除所有仙人掌
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 117220 , 117221, 105125, 105126  }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID)
					end
				end
			end
		end
	end
end





--debug用



--物品寫入值
function Lua_na_plants_check1() --檢查目標是否為仙人掌
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )

	if CheckDistance( OwnerID(), TargetID(), 100 ) == true then
		if ( CheckID( TargetID() ) == true ) and  ( (OrgID == 117220) or ( OrgID == 117221) ) then  --對象是那2種npc
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+8, 1 ) --在物品身上寫入值1
			local Z = ReadRoleValue( OwnerID(), EM_RoleValue_Register+8 )
			return true
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 or   TargetID() == OwnerID() then --施法對象是玩家或是玩家自己
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , C_SYSTEM )	--目標不正確。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]"  , C_SYSTEM )	--目標不正確。
			return false
		elseif ( CheckID( TargetID() ) == false ) then  --沒有對象
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421192_1]" , C_SYSTEM )	--你沒有目標
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421192_1]"  , C_SYSTEM )	--你沒有目標
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_2]" , C_SYSTEM )	--目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_2]"  , C_SYSTEM )	--目標距離過遠
		return false
	end
end



function Lua_na_plants_check2() --檢查目標是否為仙人掌
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )

	if CheckDistance( OwnerID(), TargetID(), 100 ) == true then
		if ( CheckID( TargetID() ) == true ) and  ( (OrgID == 117220) or ( OrgID == 117221) ) then  --對象是那2種npc
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+8, 2 ) --在物品身上寫入值1
			local Z = ReadRoleValue( OwnerID(), EM_RoleValue_Register+8 )
			return true
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 or   TargetID() == OwnerID() then --施法對象是玩家或是玩家自己
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , C_SYSTEM )	--目標不正確。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]"  , C_SYSTEM )	--目標不正確。
			return false
		elseif ( CheckID( TargetID() ) == false ) then  --沒有對象
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421192_1]" , C_SYSTEM )	--你沒有目標
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421192_1]"  , C_SYSTEM )	--你沒有目標
			return false
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_2]" , C_SYSTEM )	--目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_2]"  , C_SYSTEM )	--目標距離過遠
		return false
	end
end


function Lua_na_plants_check3() --檢查目標是否為仙人掌
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )

	if CheckDistance( OwnerID(), TargetID(), 100 ) == true then
		if ( CheckID( TargetID() ) == true ) and  ( (OrgID == 117220) or ( OrgID == 117221) ) then  --對象是那2種npc
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+8, 3 ) --在物品身上寫入值1
			local Z = ReadRoleValue( OwnerID(), EM_RoleValue_Register+8 )
			return true
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 or   TargetID() == OwnerID() then --施法對象是玩家或是玩家自己
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , C_SYSTEM )	--目標不正確。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]"  , C_SYSTEM )	--目標不正確。
			return false
		elseif ( CheckID( TargetID() ) == false ) then  --沒有對象
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421192_1]" , C_SYSTEM )	--你沒有目標
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421192_1]"  , C_SYSTEM )	--你沒有目標
			return false
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_2]" , C_SYSTEM )	--目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_2]"  , C_SYSTEM )	--目標距離過遠
		return false
	end
end




--檢查題目與答案是否相同，使用後
function Lua_na_plants_meet2() --使用物品執行劇情
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+3 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+8 )

	if Q == A then
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK01]" ) --太美味了～好吃好吃！
--		BeginPlot( OwnerID(), "Lua_na_plants_count", 0)
		PlayMotion( TargetID(), 119) --Cast表演
		DelObj( TargetID())
	else
		Tell(OwnerID() ,  TargetID(), "[SC_PLANTS_SPEAK02]") --你居然給我這種東西！我生氣了！！！
		BeginPlot( OwnerID(), "Lua_na_plants_X", 0)
		PlayMotion( TargetID(), 83) --Cast表演
		DelObj( TargetID())
	end
end

function Lua_na_plants_vege2()
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+3 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+8 )
	if Q == A then
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK01]" ) --太美味了～好吃好吃！
--		BeginPlot( OwnerID(), "Lua_na_plants_count", 0)
		PlayMotion( TargetID(), 119) --Cast表演
		DelObj( TargetID())
	else
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK02]" ) --你居然給我這種東西！我生氣了！！！
		BeginPlot( OwnerID(), "Lua_na_plants_X", 0)
		PlayMotion( TargetID(), 83) --Cast表演
		DelObj( TargetID())
	end
end


function Lua_na_plants_grass2()
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+3 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+8 )
	if Q == A then
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK01]" ) --太美味了～好吃好吃！
--		BeginPlot( OwnerID(), "Lua_na_plants_count", 0)
		PlayMotion( TargetID(), 119) --Cast表演
		DelObj( TargetID())
	else
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK02]" ) --你居然給我這種東西！我生氣了！！！
		BeginPlot( OwnerID(), "Lua_na_plants_X", 0)
		PlayMotion( TargetID(), 83) --Cast表演
		DelObj( TargetID())
	end
end





function Lua_na_plants_X()  --對仙人掌使用錯誤的物品，出現兩隻仙人掌
	local Obj = Role:new(OwnerID())
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local plant2 = {}
	plant2[0] = CreateObj( 105125 , BaseX-rand(50), BaseY, BaseZ, BaseDir, 1 ) --出現花草怪	SetModeEx( Flower, EM_SetModeType_Strikback, true )--反擊
	plant2[1] = CreateObj( 105126 , BaseX+rand(50), BaseY, BaseZ, BaseDir, 1 ) --出現古代果果仙人掌
	AddToPartition( plant2[0], 0 )
	AddToPartition( plant2[1], 0 )
--	Say( OwnerID(), "born" )
end



function Lua_na_cactusboss_born(Player) --古代戰花仙人掌出現劇情
	local RoomID = ReadRoleValue(Player,EM_RoleValue_RoomID)
	local Flower = CreateObjByflag( 105127, 780840 , 0 , 1 ) --在指定編號的旗子上產生戰花仙人掌(NPC編號,旗子編號,旗子編碼,數量)
	SetModeEx( Flower, EM_SetModeType_Strikback, true )--反擊
	SetModeEx( Flower, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Flower, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Flower, EM_SetModeType_Mark, true )--標記
	SetModeEx( Flower, EM_SetModeType_Move, true )--移動
	SetModeEx( Flower, EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Flower, EM_SetModeType_HideName, true )--名稱
	SetModeEx( Flower, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( Flower, EM_SetModeType_Fight , true )--可砍殺攻擊 
	SetModeEx( Flower, EM_SetModeType_Drag , false )--阻力
	SetModeEx( Flower, EM_SetModeType_Show, true )--顯示
	AddToPartition( Flower , RoomID ) 
	return Flower

end



--戰花仙人掌無敵劇情
function Lua_na_cactusboss_born_1() --古代戰花仙人掌出現劇情，一般攻擊無效
	say( OwnerID(), "[SC_plants_BOSS01]") --古戰花仙人掌對話：這次又是誰想來挑戰我啊！
--	PlayMotion( OwnerID(), 83)
	Addbuff(OwnerID(), 508060,0, -1) 
	BeginPlot( OwnerID(), "Lua_na_cactusboss_attack",0)
end

function Lua_na_cactusboss_attack() --戰花仙人掌戰鬥劇情
	while true do
	local attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local random= Rand(15)
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local HPPercent = NowHP / MaxHP
	local X = (HPPercent*100)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then --進入戰鬥
			if  X > 50 then  --血量高於50%
				local ran1 = rand(3)
				PlayMotion( OwnerID(), 31 )
				sleep(20)
			--	CastSpell( OwnerID(), OwnerID(), 496236)
				sleep(50)
				if ran1== 0 then 
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS02]" ) -- 想挑戰我？你也太天真了吧！
				end
			elseif X <=50 and X >=30 then
				local ran2 = rand(3)
				if random <5 then --5/15
					if ran2== 0 then 
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS03]" )  -- 
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
			--		CastSpell( OwnerID(), OwnerID(), 496237)
					sleep(50)
				else	
					if ran2== 1  then 
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS04]" )  -- 哈哈！通通變成雪人吧！
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
			--		CastSpell( OwnerID(), OwnerID(), 496236)
					sleep(50)
				end
			elseif X < 30 then --當雪人的血量低於30%
				local ran3 = rand(3)
				if random <=2 then -- 2/15
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS05]" )  --想打敗我還早呢！
					PlayMotion( OwnerID(), 60)
			--		CastSpell( OwnerID(), OwnerID(), 496086)　--回復

				else
					if ran3== 1  then 
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS04]" )  -- 哈哈！通通變成雪人吧！
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
			--		CastSpell( OwnerID(), OwnerID(), 496236)
					sleep(50)
				end
			end
		end
	sleep(100)
	end
end


