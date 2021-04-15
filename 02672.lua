function Cl_Z25_Trap_SetcollisionPlot()--機關區水的觸碰劇情
	SetPlot( OwnerID(), "collision","CL_Z25_Trap_begin", 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
end
function CL_Z25_Trap_begin()--機關區水的觸碰傷害
	local OwnerID =OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	if ReadRoleValue ( OwnerID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( OwnerID , EM_RoleValue_IsPlayer ) == 1 then
		if ReadRoleValue ( OwnerID , EM_RoleValue_Y ) < 3120 then
			if CheckBuff ( OwnerID , 623888 ) ~= true then
				Addbuff (  OwnerID , 623888 , 0 , 3 )
			end
		end
	end
end
function Cl_Z25_Trap_CheckBuff()--機關區水域高度
	local OwnerID =OwnerID()
	local Owner_Y = ReadRoleValue ( OwnerID , EM_RoleValue_Y )
	say ( OwnerID , "Owner_Y"..Owner_Y )
	if Owner_Y >= 3120 then
		CancelBuff_NoEvent( OwnerID , 507808 ) ---清除BUFF
	end
end

function bico_151_tripSetFlag_0()--機關手把觸碰
	SetPlot( OwnerID() , "touch", "bico_151_tripSetFlag_1" , 30 )
	PlayMotion( TargetID() , ruFUSION_MIME_ACTIVATE_END )	
end

function bico_151_tripSetFlag_1()--機關浮石的顯示
	local NPC_Table = {}
	PlayMotionEX( TargetID() , ruFUSION_MIME_ACTIVATE_END , ruFUSION_MIME_ACTIVATE_BEGIN  )
		NPC_Table = SearchRangeNPC( TargetID() , 500 )
	for i = 0 , #NPC_Table do
		if ReadRoleValue( NPC_Table[i] , EM_RoleValue_OrgID ) == 121717 then
			SetModeEx( NPC_Table[i] , EM_SetModeType_Show , true )
			SetModeEx( NPC_Table[i] , EM_SetModeType_Obstruct , true )
		end
		if ReadRoleValue( NPC_Table[i] , EM_RoleValue_OrgID ) == 107492 then
			SetModeEx( NPC_Table[i] , EM_SetModeType_Move , false )
		end
	end
	
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )--稱號或取機制部分
	local PPL = SetSearchAllPlayer(Room)
	for i = 1 , PPL , 1 do
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
			if CountBodyItem ( ID , 530952 ) == 0 then
				GiveBodyItem( ID , 530952 , 1 )
			end
		end
	end
	
end

function bico_151_BugBomb_0()--小怪[劇毒吸血蟲]自爆AI
	SetPlot( OwnerID() , "range", "bico_151_BugBomb_1" , 20 )
end

function bico_151_BugBomb_1()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsPlayer ) == 1 then
	SysCastSpellLv(TargetID() , TargetID() ,850549 , 0 )
	end
end

function bico_151_BugBomb_2()
	KillID( OwnerID() , OwnerID() )
end



function bico_151_walk1_01()--無頭5人團
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 107546 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 107545 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 107545 , Matrix , 2 , -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 107547 , Matrix , 3 , 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 107547 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "bico_151_walk1_02" , 0 )
end
function bico_151_walk1_02()
	sleep( 10 )
	BeginPlot( OwnerID() , "bico_151_walk1_01" , 0 )
end

function bico_151_walk2_01()--無頭5人團( 含巨衛 )
	local dis = 20
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 107548 , Matrix , 2 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 107547 , Matrix , 1 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 107547 , Matrix , 1 , -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 107545 , Matrix , 3 , 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 107545 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "bico_151_walk2_02" , 0 )
end
function bico_151_walk2_02()
	sleep( 10 )
	BeginPlot( OwnerID() , "bico_151_walk2_01" , 0 )
end

function bico_151_walk3_01()--小狼狗團
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 107554 , Matrix , 2 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 107554 , Matrix , 1 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 107554 , Matrix , 1 , -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 107554 , Matrix , 3 , 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 107554 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "bico_151_walk3_02" , 0 )
end
function bico_151_walk3_02()
	sleep( 10 )
	BeginPlot( OwnerID() , "bico_151_walk3_01" , 0 )
end

function bico_151_Mob107548_Gainman()--無頭巨衛AI
	local skilltime = 0
	local HatePlayerNum
	local RandPlayer 
	local TempGID 
	while 1 do
	sleep(10)
		if HateListCount( OwnerID() ) ~= 0 then
		skilltime = skilltime + 1
			if skilltime % 15 == 0 then
				HatePlayerNum = HateListCount( OwnerID() )
				RandPlayer = rand(HatePlayerNum)
				TempGID = HateListInfo( OwnerID() , RandPlayer , EM_HateListInfoType_GItemID) 
				if ReadRoleValue( TempGID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( TempGID , EM_RoleValue_IsPlayer )~=1 then--目標死亡或者是寵物的話, 繼續挑選其他玩家
					HatePlayerNum = HateListCount( OwnerID() )
					RandPlayer = DW_rand(HatePlayerNum)
					TempGID = HateListInfo( OwnerID() , RandPlayer , EM_HateListInfoType_GItemID) 
					CastSpell( OwnerID(), TempGID, 850555 )--施放 魔電擊
				else
					CastSpell( OwnerID(), TempGID, 850555 )--施放 魔電擊
				end
			end
		else
		skilltime = 0	
		end
	end
end

function bico_151_Mob107553()--肢解縫補體動作1
PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN ) 
AddBuff( OwnerID() , 623802 , 0 , -1 )
local FightPick = 0 
local skilltime = 0
	while 1 do 
	sleep(10)
		 if HateListCount(OwnerID())~= 0 then
		 skilltime= skilltime + 1
			if skilltime % 20 == 0 then
				AddBuff( OwnerID() , 623938 , 0 , 4 )
			end
		FightPick = 1
		end
		if HateListCount(OwnerID()) == 0 and FightPick == 1 then
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN ) 
		FightPick = 0
		end
	end
end

function bico_151_Mob107556()--魔多惡醫惡臭汙血Buff判斷
local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
local HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
local HPp =  (HP/MaxHP)*100
	if HPp <= 50 and CheckBuff( OwnerID() , 623970 ) == false then
		return true
	else
		return false
	end
end

function bico_151_MobMotion_Speak()--講話動作
PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
end

function bico_151_MobMotion_angry()--生氣動作
PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_ANGRY)
end

function bico_151_MobMotion_SALUTE()--敬禮動作
PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE)
end

function bico_151_MobMotion_APPLAUSE()--同意動作
PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
end

function bico_151_DoorSetFlag_0()--大門機關手把觸碰
	SetPlot( OwnerID() , "touch", "bico_151_DoorSetFlag_1" , 30 )
--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
--	PlayMotion( TargetID() , ruFUSION_MIME_ACTIVATE_END )	
end

function bico_151_DoorSetFlag_1()--大門機關手把觸碰劇情
	PlayMotionEX( TargetID() , ruFUSION_MIME_ACTIVATE_END , ruFUSION_MIME_ACTIVATE_BEGIN  )	
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )	
end

function bico_151_DoorControl()
	local DoorClick = {}
	local Door_table = {}
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Mob_LeaderID = 107077	--帶隊衝鋒蘑菇人
	local MobA = CreateObjByFlag( Mob_LeaderID , 781253 , 11 , 1 )	
	local MobB =  CreateObjByFlag( Mob_LeaderID , 781253 , 10 , 1 )	
	local MobA_Click = 0
	local MobB_Click = 0
	local Door_Click = 0
--	local Door_ID = 107573	--機關門編號
	local NpcTable = SearchRangeNPC( OwnerID() , 200 )
	for i=0 , #NpcTable do
		If ReadRoleValue( NpcTable[i] , EM_RoleValue_OrgID ) == 121736 then	--機關開關編號
		table.insert(DoorClick , NpcTable[i])
		end
		if ReadRoleValue( NpcTable[i] , EM_RoleValue_OrgID ) == 107573 then
		table.insert(Door_table , NpcTable[i])
		end
	end
--	PlayMotion( Door_table[1] , ruFUSION_MIME_ACTIVATE_END )
	while 1 do
	sleep(10)
--		DebugMsg( 0,0,"Door1_click="..ReadRoleValue( DoorClick[1], EM_RoleValue_PID ) )
--		DebugMsg( 0,0,"Door2_click="..ReadRoleValue( DoorClick[2], EM_RoleValue_PID ) )
		if Door_Click == 0 and ReadRoleValue( DoorClick[1], EM_RoleValue_PID ) == 1 and ReadRoleValue( DoorClick[2], EM_RoleValue_PID ) == 1 then
			for i= 1 , #NpcTable  do
				if ReadRoleValue( NpcTable[i] , EM_RoleValue_OrgID ) == 107574 then
				DelObj(NpcTable[i])
				end		
			end
			Sleep(20)
			PlayMotion( Door_table[1] , ruFUSION_MIME_ACTIVATE_END )
			Door_Click = 1
		--	PlayMotionEX( Door_table[1] , ruFUSION_MIME_ACTIVATE_LOOP , ruFUSION_MIME_ACTIVATE_BEGIN )
		elseif MobA_Click == 0 and ReadRoleValue( DoorClick[2], EM_RoleValue_PID ) == 1 then --ReadRoleValue ( DoorClick[1], EM_RoleValue_PID ) == 0 and 
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_Z151MOB_01]" , 0 )
			SetModeEx( MobA , EM_SetModeType_NotShowHPMP , true )		----不顯示血條
			SetModeEx( MobA , EM_SetModeType_Mark , false )			----不可被標記
			SetModeEx( MobA , EM_SetModeType_Show , false )			----隱藏
			SetModeEx( MobA , EM_SetModeType_Strikback , false )			----不反擊
			SetModeEx( MobA , EM_SetModeType_Searchenemy , false )		----不索敵
			SetModeEx( MobA , EM_SetModeType_Fight , false )			----不可砍殺
			AddToPartition( MobA , RoomID ) 
			BeginPlot( MobA , "bico_151_walk5_01" , 10 )
			WriteRoleValue( MobA, EM_RoleValue_IsWalk, 0 )
--			MoveToFlagEnabled( MobA, False )
			LuaFunc_MoveToFlag( MobA, 781253, 13, 0 )
			local Dir_A = ReadRoleValue ( MobA, EM_RoleValue_Dir )
--			DebugMsg( 0, 0, "Dir_A="..Dir_A )	
			SetDir(MobA, 358.7 )		
			MobA_Click = 1
		elseif MobB_Click == 0 and ReadRoleValue ( DoorClick[1], EM_RoleValue_PID ) == 1  then --and ReadRoleValue( DoorClick[2], EM_RoleValue_PID ) == 0
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_Z151MOB_02]" , 0 )
			SetModeEx( MobB , EM_SetModeType_NotShowHPMP , true )		----不顯示血條
			SetModeEx( MobB , EM_SetModeType_Mark , false )			----不可被標記
			SetModeEx( MobB , EM_SetModeType_Show , false )			----隱藏
			SetModeEx( MobB , EM_SetModeType_Strikback , false )			----不反擊
			SetModeEx( MobB , EM_SetModeType_Searchenemy , false )		----不索敵
			SetModeEx( MobB , EM_SetModeType_Fight , false )			----不可砍殺
			AddToPartition( MobB, RoomID ) 
			BeginPlot( MobB , "bico_151_walk4_01" , 10 )
			WriteRoleValue( MobB, EM_RoleValue_IsWalk, 0 )	
--			MoveToFlagEnabled( MobB, False )
			LuaFunc_MoveToFlag( MobB, 781253, 12, 0 )	
			local Dir_B = ReadRoleValue ( MobB, EM_RoleValue_Dir )
--			DebugMsg( 0, 0, "Dir_B="..Dir_B )	
			SetDir(MobB, 181.9 )								
			MobB_Click = 1	
		end
	end
end


function bico_151_walk4_01()--死靈騎士
	local dis = 20
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 107551 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 107551 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 107551 , Matrix , 2 , -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 107551 , Matrix , 3 , 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 107551 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "bico_151_walk4_02" , 0 )
end
function bico_151_walk4_02()
	sleep( 10 )
	BeginPlot( OwnerID() , "bico_151_walk4_01" , 0 )
end

function bico_151_walk5_01()--魔多惡醫
	local dis = 20
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 107556 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 107556 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 107556 , Matrix , 2 , -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 107556 , Matrix , 3 , 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 107556 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "bico_151_walk5_02" , 0 )
end
function bico_151_walk5_02()
	sleep( 10 )
	BeginPlot( OwnerID() , "bico_151_walk5_01" , 0 )
end