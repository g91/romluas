--Zone7PE旗標 780098
function LuaPE_Zone7_Controler()
	local NumSet = { 0 , 50 , -1 , 1  } --每一個階段所要到達的數字，負值代表到達這個數字回到重置階段，正值代表到達這個數字進入下一階段，0 代表不計數
	local TimeSet = { 7200 , 0 , 300 , -300 , 1800} --單位為秒，負值代表到達這個數字回到重置階段，正值代表到達這個數字進入下一階段，最後一位為重置所需的時間，0 代表不限時
	
	local Fire = {}
	local Count = GetMoveFlagCount(780098) 
--	Scriptmessage( OwnerID() , -1 , 0 ,Count , 0 )
	if Count > 3 then
		for i = 3 , Count -2 , 1 do
			Fire[i-2] = CreateObjByFlag( 112118, 780098 , i , 1 )
--			Scriptmessage( OwnerID() , -1 , 0 , i-2 , 0 )
			if i >=  Count -3 then
				WriteRoleValue( Fire[i-2] , EM_RoleValue_Register , 1 )
			else
				WriteRoleValue( Fire[i-2] , EM_RoleValue_Register , 0 )
			end
			WriteRoleValue( Fire[i-2] , EM_RoleValue_Register +1 , i )
			Lua_ObjDontTouch( Fire[i-2] )
			AddToPartition( Fire[i-2] , 0 )
			BeginPlot( Fire[i-2] , "LuaPE_Zone7_Fire" , 0 )
		end
	end

	LuaPQ_CreatePQStage(NumSet,TimeSet) --也可以不加CheckFlag，不加的狀況會自動取 RoomID 作為辨識旗標

	LuaI_PQ_AllBeControledByOne()   --開始回圈，執行階段控制的工作
end

function  LuaPE_Zone7_Stage1_Mob() --一開始的小怪
--	LuaI_PQ_ObjectInitial() --初始化，執行控制物件依不同階段來顯示或不顯示的動作
	SetPlot( OwnerID() , "dead" , "LuaPE_Zone7_Stage1_Dead" , 0 ) --設定物件劇情，必須在回圈前設定，這將決定物件用何種方式來改變計數器的數字，這邊是殺死物件時改變數字，來統計殺死幾個物件
end

function LuaPE_Zone7_Stage1_Dead()
	local Stage = LuaPQ_GetStage() --取得現在的階段
	if Stage == 2 then --判定這個階段是不是該改變計數器數字
		LuaPQ_ChangeNum(1) --改變這個階段的計數器數字，正值代表推進，負值代表倒退
	end
	return true
end

function  LuaPE_Zone7_Fire() --火焰SCPIRT
	local Auro1 = 504949 --小混亂光環，怪物會受到光環影響而機率陷入恐懼，在王附近可以免疫
	local Auro2 = 504983 --大混亂光環，玩家會受到光環影響而機率陷入恐懼，在 NPC 附近可以免疫
	local Fire
	local ShowFire = 0
	local Pos = ReadRoleValue(OwnerID() , EM_RoleValue_Register +1  )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		Fire = 504347
	else
		Fire = 503605
	end
	if math.floor(Pos/2) ~= Pos/2 or ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		ShowFire = 1
	end	
	while 1 do
		local Stage = LuaPQ_GetStage()
		if Stage == 1 or Stage == 2 then --移除所有效果
			Lua_CancelAllBuff( OwnerID() )
		end
		if Stage == 3 then
		--	AddBuff( OwnerID() , 505012 , 0 , -1 )
			if CheckBuff( OwnerID() , Fire ) == false and  ShowFire == 1 then --沒有火焰效果就加火焰效果
				AddBuff( OwnerID() ,Fire  , 0 , -1 )
			end
			if CheckBuff( OwnerID() , Auro1) == false then --加上小混亂光環
				CancelBuff_NoEvent( OwnerID() , Auro2 )
				AddBuff( OwnerID() , Auro1, 0 , -1 )
			end
		end
		if Stage == 0 then
			if CheckBuff( OwnerID() , 502724) == true  and ShowFire == 1 then --移除放大效果
				CancelBuff_NoEvent( OwnerID() , 502724 )
			end
			if CheckBuff( OwnerID() , Auro1) == false then --加上小混亂光環
				CancelBuff_NoEvent( OwnerID() , Auro2 )
				AddBuff( OwnerID() , Auro1, 0 , -1 )
			end
		end
		if Stage == 4 then
			if CheckBuff( OwnerID() , Fire ) == false and ShowFire == 1 then --沒有火焰效果就加火焰效果
				AddBuff( OwnerID() ,Fire  , 0 , -1 )
			end
			if CheckBuff( OwnerID() , 502724) == false  and ShowFire == 1 then --加上火焰變大效果
				AddBuff( OwnerID() , 502724, 0 , -1 )
			end
			if CheckBuff( OwnerID() , Auro2) == false then --加上大混亂光環
				CancelBuff_NoEvent( OwnerID() , Auro1 )
				AddBuff( OwnerID() , Auro2, 0 , 300 )
			end
		end
		sleep( 10 )
	end
end

function  LuaPE_Zone7_ComObj_B() --不計數不消失通用物件（精英怪）
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 34 )
	sleep( 10 )
	LuaI_PQ_ObjectInitial() --初始化，執行控制物件依不同階段來顯示或不顯示的動作
end

function  LuaPE_Zone7_NPC()  --拉迪海瑞
	sleep( 10 )
	local HeroAuro = 504950--英雄光環，在英雄附近不會受到火焰大混亂光環的影響
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk ,  0 )
	LuaI_PQ_ObjectInitial_RH() --初始化，執行控制物件依不同階段來顯示或不顯示的動作
	SetPlot( OwnerID() , "dead" , "LuaPE_Zone7_NPC_Dead" , 0 ) --設定物件劇情，必須在回圈前設定，這將決定物件用何種方式來改變計數器的數字，這邊是殺死物件時改變數字，來統計殺死幾個物件
	local Show = 0
	local Sodier = {}
	local Count = GetMoveFlagCount(780098) 
	local CrazyHeart
	AddBuff( OwnerID() , HeroAuro, 0 , -1 )--加上英雄光環（效果判定要加上階段判斷）
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +5 , 0 )
	while 1 do
		local Stage = LuaPQ_GetStage()
		if ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 9 ) == 1 and Show == 0 then
			Yell( OwnerID() ,  "[SC_PE_ZONE7_1_DAWNATTACK_0]" ,  3 ) --這場宴會可真是盛大啊！不介意我們中途加入吧？
			MoveToFlagEnabled( OwnerID() , false )
			local X = GetMoveFlagValue( 780098 , 2 , EM_RoleValue_X )
			local Y = GetMoveFlagValue( 780098 , 2 , EM_RoleValue_Y )
			local Z = GetMoveFlagValue( 780098 , 2 , EM_RoleValue_Z )
			Move( OwnerID() ,  X , Y , Z )
			sleep( 30 )
			CrazyHeart = CreateObjByFlag( 102735 , 780098 , 1 , 1 )
			AddToPartition( CrazyHeart , 0 )
			MoveToFlagEnabled( CrazyHeart  , false )
			WriteRoleValue( CrazyHeart , EM_RoleValue_IsWalk ,  0 )
			if CheckBuff( CrazyHeart , HeroAuro) == false then --加上英雄光環
				AddBuff( CrazyHeart  , HeroAuro, 0 , -1 )
			end
			Yell( CrazyHeart ,  "[SC_PE_ZONE7_1_DAWNATTACK_1]" ,  3 ) --哼哼......總算有些有意思的工作了。
			SetPlot( CrazyHeart , "dead" , "LuaPE_Zone7_NPC_CreazyHeart" , 0 )
			Move( CrazyHeart , X , Y , Z )
			if Count > 3 then
				for i = 3 , Count -2 , 1 do
					local Flag = 2+DW_Rand(Count -4)
					Sodier[i-2] = CreateObjByFlag( 102787+DW_Rand(2), 780098 , Flag  , 1 )
					Lua_ObjDontTouch( Sodier[i-2] )
					AddToPartition( Sodier[i-2] , 0 )
					WriteRoleValue( Sodier[i-2]  , EM_RoleValue_IsWalk ,  0 )
					MoveToFlagEnabled( Sodier[i-2]  , false )
					Move( Sodier[i-2] , X , Y , Z )
				end
			end
			Show = 1
		end
		if  ReadRoleValue( OwnerID() , EM_RoleValue_Register +5 ) > 0 then
			break
		end
		if Stage == 0 and Show == 1 then
			break
		end
		sleep( 10 )
	end
	if CheckID( CrazyHeart ) == true and ReadRoleValue( CrazyHeart , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( CrazyHeart , EM_RoleValue_OrgID ) == 102735 then
--		Yell( CrazyHeart , "HOME" , 3 )
		BeginPlot( CrazyHeart , "LuaPE_Zone7_NPCGoHome" , 0 )
	end
	for i = 3 , Count -2 , 1 do
--		Yell( OwnerID() , i-2 , 3 )
		if CheckID( Sodier[i-2] ) == true and ReadRoleValue( Sodier[i-2] , EM_RoleValue_IsDead ) == 0  then
--			Yell( Sodier[i-2] , "HOME" , 3 )
			 if ReadRoleValue( Sodier[i-2] , EM_RoleValue_OrgID ) == 102788 or ReadRoleValue( Sodier[i-2] , EM_RoleValue_OrgID ) == 102789 then
				BeginPlot( Sodier[i-2] , "LuaPE_Zone7_NPCGoHome" , 0 )
			end
		end
	end
	BeginPlot( OwnerID()  , "LuaPE_Zone7_NPCGoHome" , 0 )
end

function LuaPE_Zone7_NPC_Dead()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) == 0 then
		local Stage = LuaPQ_GetStage() --取得現在的階段
		if Stage == 3 then --判定這個階段是不是該改變計數器數字
			LuaPQ_ChangeNum(1) --改變這個階段的計數器數字，正值代表推進，負值代表倒退
		end
--		if Stage == 4 then --判定這個階段是不是該改變計數器數字
--			local Time = LuaPQ_GetTime() 
--			LuaPQ_ChangeTime( -Time )  --改變這個階段的計數器數字，正值代表推進，負值代表倒退
--		end
	end
	Lua_CancelAllBuff( OwnerID() ) 
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +5 , 777 )
	return false
end

function LuaPE_Zone7_NPCGoHome()
	SetFightMode( OwnerID() , 0 , 1 , 0 , 0 )
	Lua_CancelAllBuff( OwnerID() )
	SetStopAttack(OwnerID() )
	local Stage = LuaPQ_GetStage() --取得現在的階段
	if Stage == 0 then
		if ReadRoleValue( OwnerID()  , EM_RoleValue_OrgID ) == 102734 then
			Yell( OwnerID() ,  "[SC_PE_ZONE7_1_DAWNATTACK_2]" ,  3 ) --宴會結束啦！在他們增援之前離開這裡！
		end
	else
		if ReadRoleValue( OwnerID()  , EM_RoleValue_OrgID ) == 102734 then
			if LuaPQ_GetNum() < 1 then
				Yell( OwnerID() ,  "[SC_PE_ZONE7_1_DAWNATTACK_3]" ,  3 )--喂！情況不妙，該走囉！
			else
				Yell( OwnerID() ,  "[SC_PE_ZONE7_1_DAWNATTACK_2]" ,  3 ) --宴會結束啦！在他們增援之前離開這裡！
			end
		end
		if ReadRoleValue( OwnerID()  , EM_RoleValue_OrgID ) == 102735 then
			if LuaPQ_GetNum() < 1 then
				Yell( OwnerID() ,  "[SC_PE_ZONE7_1_DAWNATTACK_4]" ,  3 ) --哈哈！這次的狩獵可惜了，下次再繼續吧！
			end
		end
	end
	local X = GetMoveFlagValue( 780098 , 1 , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780098 , 1 , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780098 , 1 , EM_RoleValue_Z )
	Move( OwnerID() ,  X , Y , Z )
	sleep( 100 )
	if ReadRoleValue( OwnerID()  , EM_RoleValue_OrgID ) == 102734 then
		LuaFunc_ResetObj( OwnerID() )
	else
		DelObj( OwnerID() )
	end
end 

function  LuaPE_Zone7_Stage3_Boss() 
	local Count = GetMoveFlagCount(780098) - 1
	SetPosByFlag( OwnerID(), 780098, Count )
	local BossAuro = 504951
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 4 )
	sleep( 10 )
	AddBuff( OwnerID() , BossAuro, 0 , -1 )--加上首領光環（效果判定要加上階段判斷）
	LuaI_PQ_ObjectInitial_RH() --初始化，執行控制物件依不同階段來顯示或不顯示的動作
	SetPlot( OwnerID() , "dead" , "LuaPE_Zone7_Stage3_Dead" , 0 ) --設定物件劇情，必須在回圈前設定，這將決定物件用何種方式來改變計數器的數字，這邊是殺死物件時改變數字，來統計殺死幾個物件
	local Show = 0
	local Sodier = LuaFunc_Matrix_Maker( 30 , 5 ) 
	local ObjMatrix ={}
	while 1 do
		local Stage = LuaPQ_GetStage()
		if ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 9 ) == 1 and Show == 0 then
			ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101771,Sodier,2, 0 )
			ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101771,Sodier,2, 1 )
			ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101771,Sodier,2, -1 )
			ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101770,Sodier,3 , 0 )
			ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101770,Sodier,3 , 1 )
			ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101770,Sodier,3, -1 )
			ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(101770,Sodier,4 , 0 )
			ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(101770,Sodier,4 , 1 )
			ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(101770,Sodier,4, -1 )
			ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(101769,Sodier,3 , 2 )
			ObjMatrix[11] = LuaFunc_CreateNPCByMatrix(101769,Sodier,3, -2 )
			Yell( OwnerID() ,  "[SC_PE_ZONE7_1_DAWNATTACK_7]" ,  3 ) --給我把這些骯髒的螻蟻全部捏成粉末！
			--MoveToFlagEnabled( OwnerID() , false )
			local X = GetMoveFlagValue( 780098 , 2 , EM_RoleValue_X )
			local Y = GetMoveFlagValue( 780098 , 2 , EM_RoleValue_Y )
			local Z = GetMoveFlagValue( 780098 , 2 , EM_RoleValue_Z )
			--Move( OwnerID() ,  X , Y , Z )
			for pry , obj in pairs(ObjMatrix) do
				WriteRoleValue( obj , EM_RoleValue_LiveTime ,  180 )
				WriteRoleValue( obj , EM_RoleValue_IsWalk ,  0 )
				MoveToFlagEnabled( obj  , false )
				BeginPlot( obj  , "LuaPE_Zone7_MobCheckBoss" , 0 )
				if DW_Rand( 500 ) > 250 then
					Move( obj , X - DW_Rand(50) , Y , Z+DW_Rand(50) )
				else
					Move( obj , X - DW_Rand(50) , Y , Z-DW_Rand(50) )
				end
			end
			Show = 1
		end
		if Stage == 0 and Show == 1 then
			break
		end
		sleep( 10 )
	end
	for i = 1 , 11 , 1 do
		if CheckID( ObjMatrix[i] ) == true and ReadRoleValue( ObjMatrix[i]  , EM_RoleValue_IsDead ) == 0  then
--			Yell( ObjMatrix[i] ," HOME " , 3 )
			 if ReadRoleValue( ObjMatrix[i] , EM_RoleValue_OrgID ) == 102790 or ReadRoleValue( ObjMatrix[i] , EM_RoleValue_OrgID ) == 102791 then
				BeginPlot( ObjMatrix[i]  , "LuaPE_Zone7_MobGoHome" , 0 )
			end
		end
	end
	BeginPlot( OwnerID()  , "LuaPE_Zone7_MobGoHome" , 0 )
end

function LuaPE_Zone7_MobCheckBoss()
	local Stage = LuaPQ_GetStage() --取得現在的階段
	while 1 do
		if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 or Stage ~= 4 then
			break
		end
		if HateListCount(OwnerID()  ) == 0 then
			local Num = 1+DW_Rand(GetMoveFlagCount(780098) -3)
			local X = GetMoveFlagValue( 780098 , Num  , EM_RoleValue_X )
			local Y = GetMoveFlagValue( 780098 , Num  , EM_RoleValue_Y )
			local Z = GetMoveFlagValue( 780098 , Num  , EM_RoleValue_Z )
			Move( OwnerID() , X , Y , Z )
		end
		sleep( 30 + Rand(30) )
	end
	BeginPlot( OwnerID()  , "LuaPE_Zone7_MobGoHome" , 0 )
end

function LuaPE_Zone7_MobGoHome()
	SetFightMode( OwnerID() , 0 , 1 , 0 , 0 )
	Lua_CancelAllBuff( OwnerID() )
	SetStopAttack(OwnerID() )
	local Stage = LuaPQ_GetStage() --取得現在的階段
	local Count = GetMoveFlagCount(780098) - 1
	if Stage == 0 or Stage == 1 then
		if ReadRoleValue( OwnerID()  , EM_RoleValue_OrgID ) == 101772 then
			Yell( OwnerID() ,  "[SC_PE_ZONE7_1_DAWNATTACK_8]" ,  3 ) --哼！沒用的東西！剩下的就交給你們處理，給我在明天之前把這裡恢復原狀！
		end
	end
	local X = GetMoveFlagValue( 780098 , Count , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780098 , Count , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780098 , Count , EM_RoleValue_Z )
	Move( OwnerID() ,  X , Y , Z )
	sleep( 100 )
	if ReadRoleValue( OwnerID()  , EM_RoleValue_OrgID ) == 101772 then
		LuaFunc_ResetObj( OwnerID() )
	else
		DelObj( OwnerID() )
	end
end 

function LuaPE_Zone7_Stage3_Dead()
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_PE_ZONE7_1_DAWNATTACK_9]" , 0 ) --[101772]被殺死了！
	local Stage = LuaPQ_GetStage() --取得現在的階段
	local Target =  Lua_HateListPos( 1 ) 
	if Stage == 4 then --判定這個階段是不是該改變計數器數字
		LuaPQ_ChangeNum(1) --改變這個階段的計數器數字，正值代表推進，負值代表倒退
		local Champion = 0
		Champion = HateListInfo( OwnerID() , Target[1] , EM_HateListInfoType_GItemID )
		if CheckID(Champion) == true and ReadRoleValue( Champion , EM_RoleValue_IsPlayer ) == 1 then
			local Name = GetName(Champion)
			local Str = "[SC_PE_ZONE7_1_DAWNATTACK_5][$SETVAR1="..Name.."]"
			ScriptMessage( OwnerID() , -1 , 2 , Str , 0 ) --在[$VAR1]英勇作戰下，突襲[ZONE_NAGA OUTPOST]的行動獲得了極大的成功！
			ScriptMessage( OwnerID() , -1 , 0 , Str , 0 )
		end
	end
	return true
end

function LuaPE_Zone7_NPC_CreazyHeart()
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP )
	Yell( OwnerID() ,  "[SC_PE_ZONE7_1_DAWNATTACK_6]" ,  3 ) --哼！你太小看我[102735]了！
	Lua_CancelAllBuff( OwnerID() ) 
	AddBuff( OwnerID() , 504950, 0 , -1 )
	CastSpellLV( OwnerID() , OwnerID() , 490147 , 250 )
	return false
end

function LuaPE_ZONE7_BroadSystem() --臨時用進度公佈劇情
	sleep( 20 )
	local Stage = 0
	local OrgNum = 0
	local Num = 0
	local OrgTime = 0
	local Time = 0
	local String = {[0] = "[SC_PE_ZONE7_1_STAGE0]" , [1] = "NO" ,[2] = "[SC_PE_ZONE7_1_STAGE2]" , [3] = "[SC_PE_ZONE7_1_STAGE3]" , [4] = "[SC_PE_ZONE7_1_STAGE4]" }
	local StoryString = {[0] = "NO" , [1] = "NO" ,[2] = "[SC_PE_ZONE7_1_STORY2]" , [3] = "[SC_PE_ZONE7_1_STORY3]" , [4] = "NO" }
	local StageString = {[0] = "NO" , [1] = "NO" , [2] = "NO" , [3] = "NO" , [4] = "NO" }
	local CountString = {[0] = "NO" , [1] = "NO" , [2] = "[SC_PE_ZONE7_1_COUNT2]" , [3] = "[SC_PE_ZONE7_1_COUNT3]" , [4] = "[SC_PE_ZONE7_1_COUNT4]"}
	local TimerString = {[0] = "[SC_PE_ZONE7_1_TIMER0]" ,  [1] = "[SC_PE_ZONE7_1_TIMER0]" , [2] = "NO" , [3] = "[SC_PE_ZONE7_1_TIMER3]" , [4] = "[SC_PE_ZONE7_1_TIMER4]" }
	local TempStr = ""
	local Counter = 0

	while 1 do
		OrgNum = math.abs(LuaPQ_GetOrgNum())
		OrgTime = math.abs(LuaPQ_GetOrgTime())

		local PlayerNum = SetSearchAllPlayer(0)
		local Player ={}
		local CheckPPLPry= 1
		for i = 1,PlayerNum,1 do
			local Role = GetSearchResult()
			if Lua_ObjAreaCheck(Role , 573 ) == true then
				Player[CheckPPLPry] = Role
				CheckPPLPry= CheckPPLPry + 1
			end
		end

		if  Stage ~= LuaPQ_GetStage() then
			Stage = LuaPQ_GetStage() 
			if String[Stage] ~="NO" then
				for pry , obj in pairs(Player) do
					ScriptMessage( obj , obj , 1, String[Stage] , 0 ) --更換階段後的訊息
					ScriptMessage( obj , obj , 0, String[Stage] , 0 )
				end
			end
			if StoryString[Stage] ~= "NO" then
				for pry , obj in pairs(Player) do
					ScriptMessage( obj  , obj , 0, StoryString[Stage] , 0 )--劇情提示訊息
				end
			end
			if StageString[Stage] ~= "NO" then
				for pry , obj in pairs(Player) do
					ScriptMessage( obj , obj , 0, StageString[Stage] , 0 )--劇情提示訊息
				end
			end
			if OrgNum ~= 0 and CountString[Stage] ~= "NO" then
				Num = LuaPQ_GetNum()
				TempStr = CountString[Stage].."[$SETVAR1="..OrgNum.."][$SETVAR2="..Num.."]"
				for pry , obj in pairs(Player) do
					ScriptMessage( obj , obj , 0,TempStr  , 0 )--劇情提示訊息
				end
			end
			if OrgTime ~= 0 and TimerString[Stage] ~= "NO" then
				Time = LuaPQ_GetTime()
				if Stage == 0 then
					Time = Time + 7200
				end
				TempStr = TimerString[Stage].."[$SETVAR1="..Time.."]"
				for pry , obj in pairs(Player) do
					ScriptMessage( obj , obj , 0, TempStr  , 0 )--劇情提示訊息
				end
			end
		end

		if OrgTime ~= 0 then
			Time = LuaPQ_GetTime()
			if Time ~= OrgTime and ( (Counter == 30 and Time >= 30 ) or Time <= 10 ) then
				if Stage == 0 then
					Time = Time + 7200
					OrgTime = OrgTime + 7200
				end
				if StageString[Stage] ~= "NO" then
					for pry , obj in pairs(Player) do
						ScriptMessage( obj , obj , 0, StageString[Stage] , 0 )--劇情提示訊息
					end
				end
				if TimerString[Stage] ~= "NO" then
					TempStr = TimerString[Stage].."[$SETVAR1="..Time.."]"
					for pry , obj in pairs(Player) do
						ScriptMessage( obj , obj , 0, TempStr , 0 )--劇情提示訊息
					end
				end
			end
		end

		if OrgNum ~= 0 and ( Num ~= LuaPQ_GetNum() or (Num == LuaPQ_GetNum() and Counter == 30 ) ) then
			if OrgTime == 0 and StageString[Stage] ~= "NO" then
				for pry , obj in pairs(Player) do
					ScriptMessage( obj , obj, 0, StageString[Stage] , 0 )--劇情提示訊息
				end
			end
			Num = LuaPQ_GetNum()
			TempStr = CountString[Stage].."[$SETVAR1="..OrgNum.."][$SETVAR2="..Num.."]"
			for pry , obj in pairs(Player) do
				ScriptMessage( obj ,obj, 0 ,TempStr  , 0 )--劇情提示訊息
			end
		end

		if Counter == 30 then
			Counter = 0 
		end

		sleep( 10 )
		Counter  = Counter  + 1
	end
end

function LuaPE_ZONE7_LimitTest()
	local Stage = LuaPQ_GetStage() --取得現在的階段
	if Stage == 0 then
		local Time = LuaPQ_GetTime() 
		LuaPQ_ChangeTime( -Time )  --改變這個階段的計數器數字，正值代表推進，負值代表倒退
	end
	if Stage == 1 then
		local Time = LuaPQ_GetTime() 
		LuaPQ_ChangeTime( -Time )  --改變這個階段的計數器數字，正值代表推進，負值代表倒退
	end
	if Stage == 2 then
		local Num = LuaPQ_GetNum()
		LuaPQ_ChangeNum(50-Num)
	end
	if Stage == 3 then
		local Time = LuaPQ_GetTime() 
		LuaPQ_ChangeTime( -Time )  --改變這個階段的計數器數字，正值代表推進，負值代表倒退
	end
	if Stage == 4 then
		local Time = LuaPQ_GetTime() 
		LuaPQ_ChangeTime( -Time )  --改變這個階段的計數器數字，正值代表推進，負值代表倒退
		LuaPQ_ChangeNum(1) 
	end
end


function LuaM_504980_CHECK() --怪物慌亂
	local Stage = LuaPQ_GetStage()
	if Stage ~= 3 and Stage ~= 4 then --移除所有效果
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		return false
	end
	local OrgID = ReadRoleValue(  TargetID() , EM_RoleValue_OrgID )
	if OrgID == 102734 or OrgID == 102735 or OrgID == 102788 or OrgID == 102789 or OrgID == 101823 or OrgID == 101772 then
		return false
	end
	local PetID = {100944 , 100945 , 101524 , 101525 , 101526 , 101527 , 101686 , 102104 , 102105 ,102106 , 102107 , 102108 , 102297 , 102324 , 102325 }
	for pry , obj in pairs(PetID) do
		if OrgID == obj then
			return false
		end
	end
	if OrgID == 112118 then
		return false
	end
	if CheckBuff( TargetID() , 504982 ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then
		return false
	end
	return true
end

function LuaM_504981_CHECK()--玩家buff
	local Stage = LuaPQ_GetStage()
	if Stage ~= 3 and Stage ~= 4 then --移除所有效果
		return false
	end
	local Check = "NO"
	if ReadRoleValue(  TargetID(), EM_RoleValue_IsPlayer ) == 0 then
		local OrgID = ReadRoleValue(  TargetID() , EM_RoleValue_OrgID )
		if OrgID == 102734 or OrgID == 102735 or OrgID == 102788 or OrgID == 102789 then
			Check = "YES"
		end
	else
		Check = "YES"
	end
	local PetID = {100944 , 100945 , 101524 , 101525 , 101526 , 101527 , 101686 , 102104 , 102105 ,102106 , 102107 , 102108 , 102297 , 102324 , 102325 }
	for pry , obj in pairs(PetID) do
		if OrgID == obj then
			Check = "YES"
		end
	end
	if Check == "NO" then
		return false
	end
	if CheckBuff( TargetID() , 504984 ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then
		CancelBuff_NoEvent( TargetID() , 504984 )
	end

	return true
end

function LuaM_504982_CHECK()--怪物buff
	local Stage = LuaPQ_GetStage()
	if Stage ~= 4 then
		return false
	end
	if ReadRoleValue(  TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		return false
	end
	local OrgID = ReadRoleValue(  TargetID() , EM_RoleValue_OrgID )
	if OrgID == 102734 or OrgID == 102735 or OrgID == 102788 or OrgID == 102789 or OrgID == 101823 then
		return false
	end
	local PetID = {100944 , 100945 , 101524 , 101525 , 101526 , 101527 , 101686 , 102104 , 102105 ,102106 , 102107 , 102108 , 102297 , 102324 , 102325 }
	for pry , obj in pairs(PetID) do
		if OrgID == obj then
			return false
		end
	end
	if OrgID == 112118 then
		return false
	end
	if CheckBuff( TargetID() , 504980 ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then
		CancelBuff_NoEvent( TargetID() , 504980 )
	end
	return true
end

function LuaM_504984() 
	if HateListCount(TargetID() ) == 0 and ReadRoleValue(TargetID() , EM_RoleValue_IsDead) == 0 then
		if DW_Rand(100) > 90 then
			AddBuff( TargetID() , 501463 , 0 , 5 )
		else
			FaceObj( TargetID() , OwnerID() )
			PlayMotion( TargetID() , ruFUSION_ACTORSTATE_ATTACK_UNARMED )
		end
	end
end

function LuaS_112533_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest( OwnerID() , 420940 ) == true then
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_8]", "LuaS_112533_4",0 ); --詢問有沒有其他地方可以兌換[206013]
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_1]", "LuaS_112533_1",0 ); --詢問哪裡可以取得[206013]
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_2]", "LuaS_112533_2",0 ); --我要用 50 個[206013]兌換[206216]
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_3]", "LuaS_112533_3",0 ); --我要用 50 個[206013]兌換[206218]
end

function LuaS_112533_1()
	SetSpeakDetail( OwnerID(), "[SC_112533_4]" ) --[ZONE_NAGA OUTPOST]的前線士兵身上都會有這種識別名牌，包括那些索雷爾頓。如果有人能得到夠多[206013]，那就代表這個人擊敗了不少敵人，我們將提供獎勵給這樣的勇士。
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_0]", "LuaS_112533_0",0 ); --回到之前的對話
end
function LuaS_112533_2()
	if CountBodyItem( OwnerID() , 206013 ) >= 50 then
		if Lua_SafeGive( OwnerID() , 206216 , 1 ) == true then
			DelBodyItem( OwnerID() , 206013 , 50 )
			SetSpeakDetail( OwnerID(), "[SC_112533_5]" )--嗯......你的表現的確出色！這裡的 50 個[206013]我確實收到了。這個[206216]就交給你了！希望你之後仍可以繼續幫助我們。
		else
			SetSpeakDetail( OwnerID(), "[SC_112533_6]" ) --看來你已經拿不動這些東西了......別擔心，我們的物資很充裕，下次再來吧！
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_112533_7]" ) --嗯.....你身上的識別名牌數量不夠喔！
	end 
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_0]", "LuaS_112533_0",0 ); --回到之前的對話
end
function LuaS_112533_3()
	if CountBodyItem( OwnerID() , 206013 ) >= 50 then
		if Lua_SafeGive( OwnerID() , 206218 , 1 ) == true then
			DelBodyItem( OwnerID() , 206013 , 50 )
			SetSpeakDetail( OwnerID(), "[SC_112533_5]" )--嗯......你的表現的確出色！這裡的 50 個[206013]我確實收到了。這個[206216]就交給你了！希望你之後仍可以繼續幫助我們。
		else
			SetSpeakDetail( OwnerID(), "[SC_112533_6]" ) --看來你已經拿不動這些東西了......別擔心，我們的物資很充裕，下次再來兌換吧！
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_112533_7]" ) --嗯.....你身上的識別名牌數量不夠喔！請繼續努力，我很期待你的表現喔！
	end 
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_0]", "LuaS_112533_0",0 ); --回到之前的對話
end

function LuaS_112533_4()
	SetSpeakDetail( OwnerID(), "[SC_112533_9]" ) --你應該認識我們隊長[112807]吧？他現在應該在[ZONE_NAGA OUTPOST]外面的廢棄村莊那裡，找他兌換也是可以的。
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_0]", "LuaS_112533_0",0 ); --回到之前的對話
end

function LuaS_112807_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest( OwnerID() , 420940 ) == true then
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_1]", "LuaS_112807_1",0 ); --詢問哪裡可以取得[206013]
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_2]", "LuaS_112807_2",0 ); --我要用 50 個[206013]兌換[206216]
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_3]", "LuaS_112807_3",0 ); --我要用 50 個[206013]兌換[206218]
	end
end

function LuaS_112807_1()
	SetSpeakDetail( OwnerID(), "[SC_112807_0]" ) --你看到前面[ZONE_NAGA OUTPOST]裡的那些傢伙了嗎？他們身上都帶著這種名牌。
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_0]", "LuaS_112533_0",0 ); --回到之前的對話
end
function LuaS_112807_2()
	if CountBodyItem( OwnerID() , 206013 ) >= 50 then
		if Lua_SafeGive( OwnerID() , 206216 , 1 ) == true then
			DelBodyItem( OwnerID() , 206013 , 50 )
			SetSpeakDetail( OwnerID(), "[SC_112807_1]" )--你做的很好！這個是你要的[206216]。
		else
			SetSpeakDetail( OwnerID(), "[SC_112807_2]" ) --看你背包都已經塞到鼓起來了，這東西還放的進去嗎？安心好了，獎賞不會長腳跑掉的。
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_112807_4]" ) --別急，看仔細，你身上的[206013]不夠喔！再去多收集一點吧！嗯？
	end 
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_0]", "LuaS_112807_0",0 ); --回到之前的對話
end
function LuaS_112807_3()
	if CountBodyItem( OwnerID() , 206013 ) >= 50 then
		if Lua_SafeGive( OwnerID() , 206218 , 1 ) == true then
			DelBodyItem( OwnerID() , 206013 , 50 )
			SetSpeakDetail( OwnerID(), "[SC_112807_3]" )--你做的很好！這個是你要的[206218]。
		else
			SetSpeakDetail( OwnerID(), "[SC_112807_2]" ) --看你背包都已經塞到鼓起來了，這東西還放的進去嗎？安心好了，獎賞不會長腳跑掉的。
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_112807_4]" ) --別急，看仔細，你身上的[206013]不夠喔！再去多收集一點吧！嗯？
	end 
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_112533_0]", "LuaS_112807_0",0 ); --回到之前的對話
end


function LuaI_206216_0() --一般補給品
	local Count = 0
	local Things = { 204889 , 204890 ,  200229, 200270, 206249 , 206250 }
	local Num = { 20 , 20 , 3 , 3 , 1 , 1  }
	local Rate = { 100 , 100 , 100 , 100 , 100 , 100 }
	local Result = {}

	for pry , obj in pairs(Rate) do
		if DW_Rand(70000) <= obj*700 then
			Result[pry] = 1
			Count = Count + 1
		else
			Result[pry] = 0
		end			
	end

	if Count ~= 0 then
		if EmptyPacketCount( OwnerID() ) < Count then 
			ScriptMessage( OwnerID() ,OwnerID() , 1 , GetString("MSG_SONGSONGBAGWARN"), 0 ); 
			ScriptMessage( OwnerID() ,OwnerID() , 0 , GetString("MSG_SONGSONGBAGWARN"), 0 ); 
			return false
		end
		if  QueuePacketCount(OwnerID() ) ~= 0  then
			ScriptMessage( OwnerID() ,OwnerID() ,1 , "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			ScriptMessage( OwnerID() ,OwnerID() , 0, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			return false
		end
		for pry , obj in pairs(Result) do
			if obj > 0 then
				GiveBodyItem( OwnerID()  , Things[pry] , Num[pry] )
			end 
		end
		UseItemDestroy()
	end
end

function LuaI_206217_0() --特殊補給品
	local Count = 0
	local FoodA = {200272 , 200113 , 200114 }
	local FoodB = {200143 , 200144}
	local Things = { 204889 , 204890  ,FoodA[DW_Rand(3)] , FoodB[DW_Rand(2)], 206249, 206250 }
	local Num = { 20 , 20  , 1, 3, 2 , 1  }
	local Rate = { 100 , 100 , 100 , 100 ,  100 , 100 }
	local Result = {}

	for pry , obj in pairs(Rate) do
		if DW_Rand(70000) <= obj*700 then
			Result[pry] = 1
			Count = Count + 1
		else
			Result[pry] = 0
		end			
	end

	if Count ~= 0 then
		if EmptyPacketCount( OwnerID() ) < Count then 
			ScriptMessage( OwnerID() ,OwnerID() , 1 , GetString("MSG_SONGSONGBAGWARN"), 0 ); 
			ScriptMessage( OwnerID() ,OwnerID() , 0 , GetString("MSG_SONGSONGBAGWARN"), 0 ); 
			return false
		end
		if  QueuePacketCount(OwnerID() ) ~= 0  then
			ScriptMessage( OwnerID() ,OwnerID() ,1 , "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			ScriptMessage( OwnerID() ,OwnerID() , 0, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			return false
		end
		for pry , obj in pairs(Result) do
			if obj > 0 then
				GiveBodyItem( OwnerID()  , Things[pry] , Num[pry] )
			end 
		end
		UseItemDestroy()
	end
end

function LuaI_206218_0() --資源補給品
	local Count = 0
	local Runes= {200850,200851,200852,200853,200854,200855}
	local Things = { 200239 , 200298 ,  200342 , Runes[DW_Rand(6)] ,206249,206250}
	local Num = { 20 , 20 , 20 , 10 , 1 , 1 }
	local Rate = { 100 , 100 , 100 , 100 , 100  , 100 }
	local Result = {}

	for pry , obj in pairs(Rate) do
		if DW_Rand(70000) <= obj*700 then
			Result[pry] = 1
			Count = Count + 1
		else
			Result[pry] = 0
		end			
	end

	if Count ~= 0 then
		if EmptyPacketCount( OwnerID() ) < Count then 
			ScriptMessage( OwnerID() ,OwnerID() , 1 , GetString("MSG_SONGSONGBAGWARN"), 0 ); 
			ScriptMessage( OwnerID() ,OwnerID() , 0 , GetString("MSG_SONGSONGBAGWARN"), 0 ); 
			return false
		end
		if  QueuePacketCount(OwnerID() ) ~= 0  then
			ScriptMessage( OwnerID() ,OwnerID() ,1 , "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			ScriptMessage( OwnerID() ,OwnerID() , 0, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			return false
		end
		for pry , obj in pairs(Result) do
			if obj > 0 then
				GiveBodyItem( OwnerID()  , Things[pry] , Num[pry] )
			end 
		end
		UseItemDestroy()
	end
end