--魔法標記產生
function Lua_na_hidemarks()
	local hidemark = CreateObjByflag(117228 , 780853 , 0 , 1 ) --在指定編號的旗子上產生戰花仙人掌(NPC編號,旗子編號,旗子編碼,數量)
	SetModeEx( hidemark, EM_SetModeType_Strikback, false)--反擊
	SetModeEx( hidemark, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( hidemark, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( hidemark, EM_SetModeType_Mark, false )--標記
	SetModeEx( hidemark, EM_SetModeType_Move, false)--移動
	SetModeEx( hidemark, EM_SetModeType_Searchenemy, false)--索敵
	SetModeEx( hidemark, EM_SetModeType_HideName, true )--名稱
	SetModeEx( hidemark, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( hidemark, EM_SetModeType_Fight , false)--可砍殺攻擊 
	SetModeEx( hidemark, EM_SetModeType_Drag , false )--阻力
	SetModeEx( hidemark, EM_SetModeType_Show, true )--顯示
	AddToPartition( hidemark , 0 ) 
--	Say( OwnerID(), "hide born")
end


function Lua_na_marks_born()
	while true do
		sleep( 10)
		BeginPlot( OwnerID(), "Lua_na_marks_born2",0 )
		sleep(150)
	end
end

function Lua_na_marks_born2()
	local X = {1,2,3,4,5,6,7,8,9}  
	local Y = 0
	local Y1 = {}
	for i = 1 , 9 do   -- 產生9個
		Y = Rand(table.getn(X))+1
		Y1[i] = X[Y]
		table.remove(X,Y)
		local Mark = {}
		local Crand = rand(3)	--隨機出怪
		if Crand ==0 then
			Mark[i] = CreateObjByFlag(117225 , 780853, Y1[i] ,1) --使用旗子產生防禦旗標 npc 旗子編號 數量 
		elseif  Crand ==1 then
			Mark[i] = CreateObjByFlag(117226 , 780853, Y1[i] ,1) --使用旗子產生攻擊旗標 npc 旗子編號 數量 
		else
			Mark[i] = CreateObjByFlag(117227 , 780853, Y1[i] ,1) --使用旗子產生緩速旗標npc 旗子編號 數量 
		end
		SetModeEx( Mark[i]  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Mark[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Mark[i] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Mark[i] , EM_SetModeType_Mark, false )--標記
		SetModeEx( Mark[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( Mark[i] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Mark[i] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( Mark[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Mark[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Mark[i], EM_SetModeType_Drag , false )--阻力
		SetModeEx( Mark[i], EM_SetModeType_Show, true )--顯示
		AddToPartition( Mark[i]  , 0 )	--產生旗標
	end			
	Sleep(100)
	BeginPlot( OwnerID(), "Lua_na_plants_Delhidemark",0 )
--	Say( OwnerID(), "Del")
end


function Lua_na_plants_Delhidemark()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 117225, 117226, 117227}

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
					DelObj( ID )
					end
				end
			end
		end
	end
end



function Lua_na_plants_Delhidemark1()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 117225, 117226, 117227, 117228}

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
					DelObj( ID )
					end
				end
			end
		end
	end
end



function Lua_na_plants_defencemark() --抵抗傷害標記
	SetPlot( OwnerID() , "Collision" , "Lua_na_plants_defence" , 10);	
end


function Lua_na_plants_defence()
	local A = CheckBuff( OwnerID(), 508274) --defence
	local B = CheckBuff( OwnerID(), 508275) 
	local C = CheckBuff( OwnerID(), 508276)

	if A == false and B == false and C == false then --尚未取得任何BUFF
		AddBuff( OwnerID(), 508274, 0, 10)
--		say(OwnerID(), "1")
	elseif A == true then --已經取得第一個防禦BUFF
		CancelBuff ( OwnerID(), 508274)
		AddBuff( OwnerID(), 508277, 0, 10) 
--		say(OwnerID(), "2")
	elseif B == true or C == true then--選擇錯誤
		CancelBuff ( OwnerID(), 508274)
		CancelBuff ( OwnerID(), 508275)
		CancelBuff ( OwnerID(), 508276)
		Say(OwnerID(), "Wrong")
	end
	Say( OwnerID(), "defence") 
	Hide( TargetID() )
end




function Lua_na_plants_attackmark() --攻擊標記
	SetPlot( OwnerID() , "Collision" , "Lua_na_plantsboss_attack" , 10)
end

function Lua_na_plantsboss_attack()
	local Flower = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
	local A = CheckBuff( OwnerID(), 508274) 
	local B = CheckBuff( OwnerID(), 508275) --attack
	local C = CheckBuff( OwnerID(), 508276)

	if A == false and B == false and C == false then --尚未取得任何BUFF
		AddBuff( OwnerID(), 508275, 0, 10)
	--	say(OwnerID(), "1")
	elseif B == true then --已經取得第一個攻擊BUFF
		CancelBuff ( OwnerID(), 508275)
		CastSpell( OwnerID(), Flower, 496847 )
		say(Flower, "2")
	elseif A == true or C == true then--選擇錯誤
		CancelBuff ( OwnerID(), 508274)
		CancelBuff ( OwnerID(), 508275)
		CancelBuff ( OwnerID(), 508276)
		Say(OwnerID(), "Wrong")
	end
	Say( OwnerID(), "attack") 
	Hide( TargetID() )
end




function Lua_na_plants_slowmark() --緩速標記
	SetPlot( OwnerID() , "Collision" , "Lua_na_plants_slow" , 10);
end


function Lua_na_plants_slow() --緩速標記
	local Flower = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
	local A = CheckBuff( OwnerID(), 508274) 
	local B = CheckBuff( OwnerID(), 508275) 
	local C = CheckBuff( OwnerID(), 508276) --slow

	if A == false and B == false and C == false then --尚未取得任何BUFF
		AddBuff( OwnerID(), 508276, 0, 10)
	--	say(OwnerID(), "1")
	elseif C == true then --已經取得第一個攻擊BUFF
		CancelBuff ( OwnerID(), 508276)
		CastSpell( OwnerID(), Flower , 496848 )
	--	say(Flower, "3")
	elseif A == true or B == true then--選擇錯誤
		CancelBuff ( OwnerID(), 508274)
		CancelBuff ( OwnerID(), 508275)
		CancelBuff ( OwnerID(), 508276)
		Say(OwnerID(), "Wrong")
	end
	Say( OwnerID(), "slow") 
	Hide( TargetID() )
end





-------------------------------------------------------------------------------------
--寶箱產生劇情
-------------------------------------------------------------------------------------
function Lua_na_plants_treasureborn()  --產生6個被封印的寶箱
	local X = {1,2,3,4,5,6}  
	local Y = 0
	local Z = {1,2,3,4,5,6}
	for i = 1 , 6 do   -- 產生6個
		Y = Rand(table.getn(X))+1 
		Z[i] = X[Y]
		table.remove(X,Y)
		local Chest ={}
		Chest[i] = CreateObjByFlag(117412 , 780841 , Z[i] , 1) --使用旗子產生旗標 npc 旗子編號 數量 

		SetModeEx(Chest[i]  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx(Chest[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx(Chest[i]  , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx(Chest[i]  , EM_SetModeType_Mark, true )--標記
		SetModeEx(Chest[i]  , EM_SetModeType_Move, false )--移動
		SetModeEx(Chest[i]  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx(Chest[i]  , EM_SetModeType_HideName, true )--名稱
		SetModeEx(Chest[i]  , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx(Chest[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx(Chest[i]  , EM_SetModeType_Drag , false )--阻力
		SetModeEx(Chest[i] , EM_SetModeType_Show, true )--顯示
		WriteRoleValue( Chest[i] , EM_RoleValue_PID , Z[i] )
		AddToPartition( Chest[i] , 0 )	--產生旗標
--		SetPlot( Chest[i] , "Touch" , "Lua_plants_chest2_na" , 150 )
		BeginPlot( Chest[i] , "Lua_na_plants_chestdel", 0 )
	end		
--	Say( OwnerID(), "Born OK!" )	
	Sleep(100)
end


function Lua_na_plants_chest2() --玩家身上有古代戰花的花粉，解除寶箱封印
	--OwnerID = 玩家
	-- TargetID = 寶箱
	Say( OwnerID(), "Owner")
	Say( TargetID(), "Target" )
	local P = CountBodyItem( OwnerID(), 208976)
	if P >=1 then
		ChangeObjID( TargetID(), 117411 ) 
	else
		return false
	end
end


function Lua_na_plants_chestdel()
	local Count = 1
	local ChestPID = ReadRoleValue( OwnerID(), EM_RoleValue_PID) 
	Sleep(3000) --5分鐘之後開始刪除第一個寶箱
	for i= 1 , 6 do
		if ChestPID == Count then
		--	Say( OwnerID(), ChestPID)
			DelObj( OwnerID())
		else
			sleep( 600) --每一分鐘刪除一個寶箱
			Count = Count +1
		end
	end
end
							





--寶箱的觸碰劇情
function Lua_na_plants_box1() --受詛咒的寶箱觸碰劇情
	SetPlot( OwnerID(), "touch" , "Lua_na_plants_box2" , 10)
end

function Lua_na_plants_box2() --
	--OwnerID = 玩家
	-- TargetID = 寶箱
	local P = CountBodyItem( OwnerID(), 208976)
	if P >=1 then
		ChangeObjID( TargetID(), 117411 ) 
		Say( OwnerID(), "Change!!" )
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_CACTUS_BOX_01]" , C_SYSTEM ) --這個寶箱的魔法封印已經解除。
	else
		Say( OwnerID(), "OPEN ERROR!!" )
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_CACTUS_BOX_02]" , C_SYSTEM ) --這個寶箱已被魔法封印，必須先解除封印才可開啟。
	end
end



function Lua_na_plants_box3() -- 解除封印的寶箱
	SetPlot( OwnerID() , "touch" , "Lua_plants_box4_na" , 10 );
end

function Lua_plants_box4_na()
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--你處於裝死狀態無法行動。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位

						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
						GiveBodyItem( OwnerID() , 725051 , 1 )
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						BeginPlot( TargetID(), "Lua_na_box_del" , 0 ) 
					--	Delobj( TargetID() ) --15秒後刪除寶箱
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
						SetPlot( TargetID(),"touch","Lua_na_plants_box4",10 )
					end	
				end
			elseif ( result == "DAME" ) then
				SetPlot( TargetID(),"touch","Lua_na_plants_box4",10 )
			end
		end
	end
end


function Lua_na_box_del()
	sleep( 150)
	DelObj( OwnerID() )
end
