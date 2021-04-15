----EM_RoleValue_PID = Boss 本體
----EM_RoleValue_Register1 = 手術刀_1
----EM_RoleValue_Register2 = 手術刀_2
----EM_RoleValue_Register3 = 手術刀_3
----EM_RoleValue_Register4 = 手術刀_4
----EM_RoleValue_Register5 = 手術刀_1 動作判斷
----EM_RoleValue_Register6 = 手術刀_2 動作判斷
----EM_RoleValue_Register7 = 手術刀_3 動作判斷
----EM_RoleValue_Register8 = 手術刀_4 動作判斷
----EM_RoleValue_Register9 = 計時器

function Lua_apon_Boss_102969_AI() --本體控制器
	
	while 1 do
		sleep(10)
		
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1,0) ---目的用於重置
		WriteRoleValue( OwnerID(), EM_RoleValue_Register2,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register3,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register5,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register6,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register7,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register8,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_PID,0)
		
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Flag_Boss = 780362 ---亞沙
		local Flag_blade = 780385 ---手術刀
		local Flag_corpse = 780386 ---四個女侍
		local Flag_Boss_AI = 780387 ----Boss_AI
		local Flag_Boss_Time = 780388 ----計時器
		local Flag_Door = 780389 ----門
		
		local Corpse_1 ---床位判斷用
		local Corpse_2 ---床位判斷用
		local Corpse_3 ---床位判斷用
		local Corpse_4 ---床位判斷用
		
		local Boss = CreateObjByFlag( 102969 , Flag_Boss , 1 , 1 ) ---亞沙
		WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_PID, Boss)
		AddToPartition( Boss,roomid1 )
		Show(Boss,roomid1)
		BeginPlot( Boss, "Lua_apon_Boss_102969_fight", 10) ---Boss的戰鬥Function
		
		local Blade_1 = CreateObjByFlag( 114311 , Flag_blade , 1 , 1 ) ---第一把手術刀
		WriteRoleValue( Blade_1, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Blade_1)
		AddToPartition( Blade_1,roomid1 )
		Show(Blade_1,roomid1)
		BeginPlot( Blade_1, "Lua_apon_blade_start_1", 10)
		
		local Blade_2 = CreateObjByFlag( 114311 , Flag_blade , 2 , 1 ) ---第二把手術刀
		WriteRoleValue( Blade_2, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Blade_2)
		AddToPartition( Blade_2,roomid1 )
		Show(Blade_2,roomid1)
		BeginPlot( Blade_2, "Lua_apon_blade_start_2", 10)
		
		local Blade_3 = CreateObjByFlag( 114311 , Flag_blade , 3 , 1 ) ---第三把手術刀
		WriteRoleValue( Blade_3, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register3, Blade_3)
		AddToPartition( Blade_3,roomid1 )
		Show(Blade_3,roomid1)
		BeginPlot( Blade_3, "Lua_apon_blade_start_3", 10)
		
		local Blade_4 = CreateObjByFlag( 114311 , Flag_blade , 4 , 1 ) ---第四把手術刀
		WriteRoleValue( Blade_4, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4, Blade_4)
		AddToPartition( Blade_4,roomid1 )
		Show(Blade_4,roomid1)
		BeginPlot( Blade_4, "Lua_apon_blade_start_4", 10)
		
		
		
		while 1 do 
			sleep(10)
			if Checkbuff(OwnerID(),505631) == true then -----場上所有手術刀和女侍的重置
				CancelBuff(OwnerID(),505631)
				BeginPlot( OwnerID(), "Lua_apon_corpse_Timer_1", 10)
			
			elseif Checkbuff(OwnerID(),505632) == true then -----Boss完整重置
				sleep(20) ---重置時間
				CancelBuff(OwnerID(),505632)
				
				local Corpse_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---手術刀 1
				local Corpse_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2) ---手術刀 2
				local Corpse_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---手術刀 3
				local Corpse_4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---手術刀 4
				sleep(10)
				local Corpse_mob_1 = ReadRoleValue(Corpse_1,EM_RoleValue_Register1) --女侍屍體 1
				local Corpse_mob_2 = ReadRoleValue(Corpse_2,EM_RoleValue_Register1) --女侍屍體 2
				local Corpse_mob_3 = ReadRoleValue(Corpse_3,EM_RoleValue_Register1) --女侍屍體 3
				local Corpse_mob_4 = ReadRoleValue(Corpse_4,EM_RoleValue_Register1) --女侍屍體 4
				sleep(10)
				Delobj(Corpse_mob_1)
				Delobj(Corpse_mob_2)
				Delobj(Corpse_mob_3)
				Delobj(Corpse_mob_4)
				Delobj(Corpse_1)
				Delobj(Corpse_2)
				Delobj(Corpse_3)
				Delobj(Corpse_4)
				--BeginPlot( OwnerID(), "Lua_apon_corpse_Timer_2", 0)
				break
			end
		end
	end
end

-----EM_RoleValue_PID = 中央控制器
-----EM_RoleValue_Register1 = 屍體
-----EM_RoleValue_Register2 = 判斷開始啟動手術刀用
-----EM_RoleValue_Register3 = 停止手術刀的一切動作用


function Lua_apon_blade_start_1() ----第一把手術刀
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---中央控制器
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss本體
	local Flag_corpse = 780386 ---躺在床上的女侍
	local Corpse_1 = CreateObjByFlag( 103035 , Flag_corpse , 1 , 1 )
	SetDefIdleMotion( Corpse_1,ruFUSION_MIME_SIT_DOWN)
	SetModeEx(Corpse_1 , EM_SetModeType_Strikback , false )--反擊
	SetModeEx(Corpse_1 , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Corpse_1 , EM_SetModeType_Fight, false) ----可砍殺攻擊
	SetModeEx( Corpse_1 , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Corpse_1 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Corpse_1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Corpse_1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Corpse_1 , EM_SetModeType_Gravity, false) ----重力
	SetModeEx( Corpse_1 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Corpse_1 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	SetModeEx( Corpse_1 , EM_SetModeType_Move, false) ----移動
	AddToPartition( Corpse_1,roomid1 )
	Show(Corpse_1,roomid1)
	
	WriteRoleValue( Corpse_1, EM_RoleValue_Register4, Boss_AI)
	WriteRoleValue( Corpse_1, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Corpse_1)
	BeginPlot( Corpse_1, "Lua_apon_corpse_check", 5)
	
	local Check ---判斷開始啟動手術刀用
	local Check_2
	
	while 1 do 
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		Check_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if Check == 1 and Check_2 == 0 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			BeginPlot( OwnerID(), "Lua_apon_QN_114311_01", 5)
		end
	end
end

function Lua_apon_blade_start_2() ----第二把手術刀
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---中央控制器
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss本體
	local Flag_corpse = 780386 ---躺在床上的女侍
	local Corpse_2 = CreateObjByFlag( 103036 , Flag_corpse , 2 , 1 )
	SetDefIdleMotion( Corpse_2,ruFUSION_MIME_SIT_DOWN)
	SetModeEx(Corpse_2 , EM_SetModeType_Strikback , false )--反擊
	SetModeEx(Corpse_2 , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Corpse_2 , EM_SetModeType_Fight, false) ----可砍殺攻擊
	SetModeEx( Corpse_2 , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Corpse_2 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Corpse_2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Corpse_2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Corpse_2 , EM_SetModeType_Gravity, false) ----重力
	SetModeEx( Corpse_2 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Corpse_2 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	SetModeEx( Corpse_2 , EM_SetModeType_Move, false) ----移動
	AddToPartition( Corpse_2,roomid1 )
	Show(Corpse_2,roomid1)
	
	WriteRoleValue( Corpse_2, EM_RoleValue_Register4, Boss_AI)
	WriteRoleValue( Corpse_2, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Corpse_2)
	BeginPlot( Corpse_2, "Lua_apon_corpse_check", 5)
	
	local Check ---判斷開始啟動手術刀用
	
	while 1 do 
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		if Check == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			BeginPlot( OwnerID(), "Lua_apon_QN_114311_01", 5)
		end
	end
end

function Lua_apon_blade_start_3() ----第三把手術刀
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---中央控制器
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss本體
	local Flag_corpse = 780386 ---躺在床上的女侍
	local Corpse_3 = CreateObjByFlag( 103037 , Flag_corpse , 3 , 1 )
	SetDefIdleMotion( Corpse_3,ruFUSION_MIME_SIT_DOWN)
	SetModeEx( Corpse_3 , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( Corpse_3 , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Corpse_3 , EM_SetModeType_Fight, false) ----可砍殺攻擊
	SetModeEx( Corpse_3 , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Corpse_3 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Corpse_3 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Corpse_3 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Corpse_3 , EM_SetModeType_Gravity, false) ----重力
	SetModeEx( Corpse_3 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Corpse_3 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	SetModeEx( Corpse_3 , EM_SetModeType_Move, false) ----移動
	AddToPartition( Corpse_3,roomid1 )
	Show(Corpse_3,roomid1)
	
	WriteRoleValue( Corpse_3, EM_RoleValue_Register4, Boss_AI)
	WriteRoleValue( Corpse_3, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Corpse_3)
	BeginPlot( Corpse_3, "Lua_apon_corpse_check", 5)
	
	local Check ---判斷開始啟動手術刀用
	
	while 1 do 
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		if Check == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			BeginPlot( OwnerID(), "Lua_apon_QN_114311_01", 5)
		end
	end
end

function Lua_apon_blade_start_4() ----第四把手術刀
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---中央控制器
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss本體
	local Flag_corpse = 780386 ---躺在床上的女侍
	local Corpse_4 = CreateObjByFlag( 103038 , Flag_corpse , 4 , 1 )
	SetDefIdleMotion( Corpse_4,ruFUSION_MIME_SIT_DOWN)
	SetModeEx( Corpse_4 , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( Corpse_4 , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Corpse_4 , EM_SetModeType_Fight, false) ----可砍殺攻擊
	SetModeEx( Corpse_4 , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Corpse_4 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Corpse_4 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Corpse_4 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Corpse_4 , EM_SetModeType_Gravity, false) ----重力
	SetModeEx( Corpse_4 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Corpse_4 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	SetModeEx( Corpse_4 , EM_SetModeType_Move, false) ----移動
	AddToPartition( Corpse_4,roomid1 )
	Show(Corpse_4,roomid1)
	
	WriteRoleValue( Corpse_4, EM_RoleValue_Register4, Boss_AI)
	WriteRoleValue( Corpse_4, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Corpse_4)
	BeginPlot( Corpse_4, "Lua_apon_corpse_check", 5)
	
	local Check ---判斷開始啟動手術刀用
	
	while 1 do 
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		if Check == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			BeginPlot( OwnerID(), "Lua_apon_QN_114311_01", 5)
		end
	end
end

---------1. 需要補強的部份：如果Boss 數十秒，時間到，則要讓這個 function break ，並且完整重置整個 手術刀 的部份。
-----------Counter 夠，先隱身自己，在讓目標玩家可以有這個 寵物的  Buff
-------------寵物時間到後，先傳回一個值給 Boss_AI，在刪除自己，完全重置所有的手術刀流程 
function Lua_apon_corpse_check() ----放在屍體身上的判斷用
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Blade = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---把屍體的手術刀的 GID 讀出來
	local Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---累計血祭的次數
	local Check_pet = ReadRoleValue(OwnerID(),EM_RoleValue_Register2) ---判斷是否成為 寵物用
	local Check_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---判斷是否成為怪物用
	local Pet_owner = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---存放寵物主人的GID
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---- Boss_AI 
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss 本體 
	local Check_A = 0 ----避免重復觸發用
	local Check_B = 0
	local Check_C = 0
	while 1 do
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		Check_pet = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		Check_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		--say(OwnerID(),"Corpse Check Counter ="..Check)
		if Check == 3 and Check_A == 0 then
			Check_A = 1
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 1)
		end
		
------女侍變成玩家的寵物----------------------------------------------------------------------------------------		
		if Check_pet == 1 and Check_mob == 0 and Check_B == 0 then
			local PPL = SetSearchAllPlayer(roomid1 ) ---將所有玩家可以點手術刀的Buff全部清除
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				CancelBuff(ID,505591 )
			end
			
			Blade = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
			Hide(Blade)
			local Blade_2 = star_CreateObj( Blade , 114311 , 0 , 0 , 0 , roomid1 , 0) ---生出手術刀二代
			
			if ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103035 then ----四個屍體，各是將手術刀，存到不同的 Register
				WriteRoleValue( Boss_AI, EM_RoleValue_Register1, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103036 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register2, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103037 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register3, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103038 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register4, Blade_2 )
			end
			
			WriteRoleValue( OwnerID(), EM_RoleValue_PID, Blade_2 )
			Delobj(Blade)
			
			Check_B = 1
			Pet_owner = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
			Hide(OwnerID())
			--say(OwnerID(),"Pet Start !!")
			sleep(10)
			if ReadRoleValue( Pet_owner , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( Pet_owner, EM_RoleValue_VOC) ~= 0  
				and ReadRoleValue( Pet_owner , EM_RoleValue_RoomID  ) == roomid1 then
				if ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103035 then
					SysCastSpellLV( Pet_owner, Pet_owner, 494893, 1)
					AddBuff (Pet_owner , 505633 , 0 , 36) ----addbuff  到玩家身上，辨視用的
				elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103036 then
					SysCastSpellLV( Pet_owner, Pet_owner, 494894, 1)
					AddBuff (Pet_owner , 505633 , 0 , 36)
				elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103037 then
					SysCastSpellLV( Pet_owner, Pet_owner, 494895, 1)
					AddBuff (Pet_owner , 505633 , 0 , 36)
				elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103038 then
					SysCastSpellLV( Pet_owner, Pet_owner, 494896, 1)
					AddBuff (Pet_owner , 505633 , 0 , 36)
				end
			end
			
		elseif Check_mob == 1 and Check_pet == 0 and Check_C == 0 then
			local PPL = SetSearchAllPlayer(roomid1 ) ---將所有玩家可以點手術刀的Buff全部清除
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				CancelBuff(ID,505591 )
			end
			
			Blade = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
			Hide(Blade)
			local Blade_2 = star_CreateObj( Blade , 114311 , 0 , 0 , 0 , roomid1 , 0) ---生出手術刀二代
			
			if ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103035 then ----四個屍體，各是將手術刀，存到不同的 Register
				WriteRoleValue( Boss_AI, EM_RoleValue_Register1, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103036 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register2, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103037 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register3, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103038 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register4, Blade_2 )
			end
			
			Delobj(Blade)
			
			Pet_owner = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
			Check_C = 1
			Hide(OwnerID())
			--say(OwnerID(),"Boss_Pet Start !!")
			if ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103035 then
				local Boss_pet = star_CreateObj( OwnerID() , 103035 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Boss_pet, "Lua_apon_Boss_Pet_1", 5)
				WriteRoleValue( Boss_pet, EM_RoleValue_PID, Boss ) ----把本體Boss 的 GID 寫入 Boss_Pet 的 PID 中
				WriteRoleValue(Boss_pet, EM_RoleValue_Livetime,35)
				AddBuff (Boss , 505634 , 0 , 36)--addbuff  到Boss身上，辨視用的
				SetAttack( Boss_pet , Pet_owner )
				
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103036 then
				local Boss_pet = star_CreateObj( OwnerID() , 103036 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Boss_pet, "Lua_apon_Boss_Pet_1", 5)
				WriteRoleValue( Boss_pet, EM_RoleValue_PID, Boss ) ----把本體Boss 的 GID 寫入 Boss_Pet 的 PID 中
				WriteRoleValue(Boss_pet, EM_RoleValue_Livetime,35)
				AddBuff (Boss , 505634 , 0 , 36)--addbuff  到Boss身上，辨視用的
				SetAttack( Boss_pet , Pet_owner )
				
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103037 then
				local Boss_pet = star_CreateObj( OwnerID() , 103037 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Boss_pet, "Lua_apon_Boss_Pet_2", 5)
				WriteRoleValue( Boss_pet, EM_RoleValue_PID, Boss ) ----把本體Boss 的 GID 寫入 Boss_Pet 的 PID 中
				WriteRoleValue(Boss_pet, EM_RoleValue_Livetime,35)
				AddBuff (Boss , 505634 , 0 , 36)--addbuff  到Boss身上，辨視用的
				SetAttack( Boss_pet , Pet_owner )
				
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103038 then
				local Boss_pet = star_CreateObj( OwnerID() , 103038 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Boss_pet, "Lua_apon_Boss_Pet_2", 5)
				WriteRoleValue( Boss_pet, EM_RoleValue_PID, Boss ) ----把本體Boss 的 GID 寫入 Boss_Pet 的 PID 中
				WriteRoleValue(Boss_pet, EM_RoleValue_Livetime,35)
				AddBuff (Boss , 505634 , 0 , 36)--addbuff  到Boss身上，辨視用的
				SetAttack( Boss_pet , Pet_owner )
			end
		end
	end
end



------以下為手術刀被觸發的流程-----------------------------------------------------------------------------------------------
function Lua_apon_QN_114311_01()	--發動 觸發
	SetPlot( OwnerID() , "touch" , "Lua_apon_QN_114311_02" , 20 )
end

function Lua_apon_QN_114311_02()
	SetPlot( TargetID(),"touch", "" ,0 )
	AddBuff (OwnerID() , 505591 , 0 , -1) ---在點選人身上加一個buff，為了不讓其它人也可以點選手術刀
	local Boss_AI = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local Corpse = ReadRoleValue(TargetID(),EM_RoleValue_Register1)
	--say(TargetID(),"Corpse ="..Corpse)
	--say(TargetID(),"Corpse Counter ="..ReadRoleValue(Corpse,EM_RoleValue_Register1))
	WriteRoleValue( Corpse, EM_RoleValue_Register1, (ReadRoleValue(Corpse,EM_RoleValue_Register1)) + 1)
	WriteRoleValue( Corpse, EM_RoleValue_Register4, OwnerID()) --- 將第一個點手術刀的玩家，記錄成寵物的主人
	
	--SetPlot( TargetID(),"touch", "" ,0 )
	--AddBuff (OwnerID() , 505591 , 0 , -1) ---在點選人身上加一個buff，為了不讓其它人也可以點選手術刀
	local roomid1 = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	WriteRoleValue(TargetID(), EM_RoleValue_Livetime,3)
	Hide(TargetID())
	local Ball = star_CreateObj( TargetID() , 103039 , 0 , 0 , 0 , roomid1 , 0) ---生出一個隱形人，記得換成隱形人的ID:
	-------------特效球專用-----------------------------------------------------------------------------------------------------------------
	SetModeEx(Ball , EM_SetModeType_Strikback , false )--反擊
	SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Ball , EM_SetModeType_Fight, false) ----可砍殺攻擊
	SetModeEx( Ball , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Ball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Ball , EM_SetModeType_Gravity, false) ----重力
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	SetModeEx( Ball , EM_SetModeType_Move, false) ----移動
	Hide(Ball)
	Show(Ball,roomid1)
	WriteRoleValue(Ball, EM_RoleValue_Livetime,3)	
	CastSpellLV( Ball , OwnerID() , 494735 , 0 )--血祭
	sleep(15)
	Hide(Ball)
	local Ball_2 = star_CreateObj( Ball , 114312 , 0 , 0 , 0 , roomid1 , 0) ---生出手術刀二代
	WriteRoleValue( Ball_2, EM_RoleValue_Register1, Corpse ) ----把屍體的 GID 傳給新的手術刀
	WriteRoleValue( Ball_2, EM_RoleValue_PID, Boss_AI ) ----Boss_AI 的GID 傳給新的手術刀
	WriteRoleValue( Corpse, EM_RoleValue_PID, Ball_2 ) --- 把手術刀二代，存到屍體的PID內
	BeginPlot(Ball_2,"Lua_apon_QN_114311_03",10)	
end

function Lua_apon_QN_114311_03()	--發動 觸發
	SetPlot( OwnerID() , "touch" , "Lua_apon_QN_114311_04" , 20 )
end

function Lua_apon_QN_114311_04()
	if Checkbuff(OwnerID(),505591) == true then
		SetPlot( TargetID(),"touch", "" ,0 )
		BeginPlot( TargetID(), "Lua_apon_QN_114311_05", 10)
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102969_10]" , 1 ) ---你無法使用血腥利刃來完成血之祭禮！
	end
end

function Lua_apon_QN_114311_05()
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Corpse = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	--say(TargetID(),"Corpse ="..Corpse)
	--say(TargetID(),"Corpse Counter ="..ReadRoleValue(Corpse,EM_RoleValue_Register1))
	WriteRoleValue( Corpse, EM_RoleValue_Register1, ReadRoleValue(Corpse,EM_RoleValue_Register1) + 1)
	WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
	Hide(OwnerID())
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	
	local Ball = star_CreateObj( OwnerID() , 103039 , 0 , 0 , 0 , roomid1 , 0) ---生出一個隱形人，記得換成隱形人的ID:
	-------------特效球專用-----------------------------------------------------------------------------------------------------------------
	SetModeEx(Ball , EM_SetModeType_Strikback , false )--反擊
	SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Ball , EM_SetModeType_Fight, false) ----可砍殺攻擊
	SetModeEx( Ball , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Ball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Ball , EM_SetModeType_Gravity, false) ----重力
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	SetModeEx( Ball , EM_SetModeType_Move, false) ----移動
	WriteRoleValue(Ball, EM_RoleValue_Livetime,5)
	Hide(Ball)
	Show(Ball,roomid1)
	CastSpellLV( Ball , TargetID() , 494735 , 0 )--血祭
	sleep(15)
	Hide(Ball)
	local Ball_2 = star_CreateObj( Ball , 114312 , 0 , 0 , 0 , roomid1 , 0) ---生出手術刀二代
	WriteRoleValue(Ball_2,EM_RoleValue_Register1,Corpse) ----把屍體的 GID 傳給新的手術刀
	WriteRoleValue(Ball_2,EM_RoleValue_PID,Boss_AI)----Boss_AI 的GID 傳給新的手術刀
	WriteRoleValue( Corpse, EM_RoleValue_PID, Ball_2 ) --- 把手術刀二代，存到屍體的PID內
	BeginPlot(Ball_2,"Lua_apon_QN_114311_03",10)
end


function Lua_apon_corpse_Timer_1()
	--say(OwnerID(),"Blade Return !!")
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag_blade = 780385 ---手術刀
	local Flag_corpse = 780386 ---四個女侍
	
	local Corpse_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---手術刀 1
	local Corpse_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2) ---手術刀 2
	local Corpse_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---手術刀 3
	local Corpse_4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---手術刀 4
	sleep(10)
	local Corpse_mob_1 = ReadRoleValue(Corpse_1,EM_RoleValue_Register1) --女侍屍體 1
	local Corpse_mob_2 = ReadRoleValue(Corpse_2,EM_RoleValue_Register1) --女侍屍體 2
	local Corpse_mob_3 = ReadRoleValue(Corpse_3,EM_RoleValue_Register1) --女侍屍體 3
	local Corpse_mob_4 = ReadRoleValue(Corpse_4,EM_RoleValue_Register1) --女侍屍體 4
	sleep(10)
	Delobj(Corpse_mob_1)
	Delobj(Corpse_mob_2)
	Delobj(Corpse_mob_3)
	Delobj(Corpse_mob_4)
	Delobj(Corpse_1)
	Delobj(Corpse_2)
	Delobj(Corpse_3)
	Delobj(Corpse_4)
	
	local Blade_1 = CreateObjByFlag( 114311 , Flag_blade , 1 , 1 ) ---第一把手術刀
	WriteRoleValue( Blade_1, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Blade_1)
	AddToPartition( Blade_1,roomid1 )
	Show(Blade_1,roomid1)
	BeginPlot( Blade_1, "Lua_apon_blade_start_1", 10)
	
	local Blade_2 = CreateObjByFlag( 114311 , Flag_blade , 2 , 1 ) ---第二把手術刀
	WriteRoleValue( Blade_2, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Blade_2)
	AddToPartition( Blade_2,roomid1 )
	Show(Blade_2,roomid1)
	BeginPlot( Blade_2, "Lua_apon_blade_start_2", 10)
	
	local Blade_3 = CreateObjByFlag( 114311 , Flag_blade , 3 , 1 ) ---第三把手術刀
	WriteRoleValue( Blade_3, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register3, Blade_3)
	AddToPartition( Blade_3,roomid1 )
	Show(Blade_3,roomid1)
	BeginPlot( Blade_3, "Lua_apon_blade_start_3", 10)
	
	local Blade_4 = CreateObjByFlag( 114311 , Flag_blade , 4 , 1 ) ---第四把手術刀
	WriteRoleValue( Blade_4, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register4, Blade_4)
	AddToPartition( Blade_4,roomid1 )
	Show(Blade_4,roomid1)
	BeginPlot( Blade_4, "Lua_apon_blade_start_4", 10)

end

function Lua_apon_corpse_Timer_2()
	--say(OwnerID(),"Boss Return !!")
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag_blade = 780385 ---手術刀
	local Flag_corpse = 780386 ---四個女侍
	local Flag_Boss_AI = 780387 ----Boss_AI
	local Flag_Boss_Time = 780388 ----計時器
	
	local Corpse_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---手術刀 1
	local Corpse_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2) ---手術刀 2
	local Corpse_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---手術刀 3
	local Corpse_4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---手術刀 4
	sleep(10)
	local Corpse_mob_1 = ReadRoleValue(Corpse_1,EM_RoleValue_Register1) --女侍屍體 1
	local Corpse_mob_2 = ReadRoleValue(Corpse_2,EM_RoleValue_Register1) --女侍屍體 2
	local Corpse_mob_3 = ReadRoleValue(Corpse_3,EM_RoleValue_Register1) --女侍屍體 3
	local Corpse_mob_4 = ReadRoleValue(Corpse_4,EM_RoleValue_Register1) --女侍屍體 4
	sleep(10)
	Delobj(Corpse_mob_1)
	Delobj(Corpse_mob_2)
	Delobj(Corpse_mob_3)
	Delobj(Corpse_mob_4)
	Delobj(Corpse_1)
	Delobj(Corpse_2)
	Delobj(Corpse_3)
	Delobj(Corpse_4)
	--sleep(10)
	--local Boss_AI = CreateObjByFlag( 103056 , Flag_Boss_AI , 1 , 1 ) ---將Boss_AI 重新重出來
	--SetModeEx(Boss_AI , EM_SetModeType_Strikback , false )--反擊
	--SetModeEx(Boss_AI , EM_SetModeType_Searchenemy , false )--索敵
	--SetModeEx( Boss_AI , EM_SetModeType_Fight, false) ----可砍殺攻擊
	--SetModeEx( Boss_AI , EM_SetModeType_Mark, false) ----標記
	--SetModeEx( Boss_AI , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	--SetModeEx( Boss_AI , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	--SetModeEx( Boss_AI , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	--SetModeEx( Boss_AI , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	--SetModeEx( Boss_AI , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	--SetModeEx( Boss_AI , EM_SetModeType_Move, false) ----移動
	--AddToPartition( Boss_AI,roomid1 )
	--Show(Boss_AI,roomid1)
	BeginPlot( OwnerID(), "Lua_apon_Boss_102969_AI", 10)
	--BeginPlot( Boss_AI, "Lua_apon_Boss_102969_AI", 10)
	--say(OwnerID(),"Boss_AI Begin !!")
	--sleep(10)
	--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
	--Hide(OwnerID())
	--Delobj(OwnerID())
end




