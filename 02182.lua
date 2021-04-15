function cl_Z19104723() -----月影賽巴-----對某些NPC使用會有額外傷害
	---local mst = OwnerID()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local skill = 0
	local skill2 = 0
	local CombatBegin = 0
	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		sleep ( 10 )
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥
			end
			if CombatBegin == 1 then
				skill = skill + 1
				skill2 = skill2 + 1
				if skill >= 3 then
					local npc = ReadRoleValue( AttackTarget, EM_RoleValue_OrgID )
					if npc == 104735 or  npc == 104709 then
						CastSpelllv ( OwnerID() , AttackTarget , 496633 , 0 )   ---扣50%
						sleep ( 10 )
					else
						CastSpelllv ( OwnerID() , AttackTarget , 496634 , 30 )  ---正常用
					end
					skill = 0
				end
				if skill2 >= 11 then
					CastSpelllv ( OwnerID() , AttackTarget , 496608 , 0 )
					sleep ( 10 )
					skill2 = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0 ------所以因為王的仇恨表內沒有人就該離開戰鬥了~這時候就必須將這個值寫回去原來的0~不然王會一直保持戰鬥狀態
			end
		end
	end
end
------------------------訓獸師--------------------------------
function cl_Z19104714()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖  
	local CombatBegin = 0
	local skill = 0
	local X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
	local mots = CreateObj( 105067 , X1+20, Y1 , Z1 , 0 , 1 )
	----local mots=Lua_DW_CreateObj("obj",105067,OwnerID(),50,1)
	AddToPartition(mots,RoomID)
	WriteRoleValue ( mots , EM_RoleValue_PID, OwnerID() )
	SetFollow(mots,OwnerID())
	BeginPlot( mots,"cl_19105067", 10 )
	Addbuff (  OwnerID() , 508254 , 0 , -1 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥
			end
			if CombatBegin == 1 then
			skill = skill + 1
				if skill >= 7 then
					CastSpelllv ( OwnerID() , AttackTarget , 496603 , 20 )
					skill = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0 ------所以因為王的仇恨表內沒有人就該離開戰鬥了~這時候就必須將這個值寫回去原來的0~不然王會一直保持戰鬥狀態
			end
		end	
	end
end
function cl_19105067()  ---寵物的
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local skill = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( AI , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		local AttackTarget2 = ReadRoleValue( ownerid() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		SetAttack( ownerid() , AttackTarget)
		if HateListCount( ownerid() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥
				if AttackTarget == 0 then
					SetAttack( AI , AttackTarget2)
				end
			end
			if CombatBegin == 1 then
			skill = skill + 1
				if skill >= 7 then
					CastSpelllv ( OwnerID() , OwnerID() , 496636 , 20 )
					skill = 0
				end
			end
		elseif HateListCount ( ownerid() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0 ------所以因為王的仇恨表內沒有人就該離開戰鬥了~這時候就必須將這個值寫回去原來的0~不然王會一直保持戰鬥狀態
			end
		end	
		if ReadRoleValue( AI , EM_RoleValue_IsDead)== 1	and HateListCount( ownerid() ) == 0 then
			delobj ( ownerid() )
		end
	end
end
------------------------------格拉夫鎮壓者--------------------
function cl_19104733()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local time1 = 0
	local time2 = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					--總血量
		local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )						--當前血量
		local HPPercent = ( NowHP / MaxHP )*100
		if HPPercent <= 50 then
			if time1 == 0 then
				time1 = 1
			end
		elseif HPPercent >= 50 then
			if time1 == 1 then
				time1 = 0
				time2 = 0
			end
		end
		if HPPercent <= 50 and time1 == 1  and time2 == 0 then   -----當HP低於80%的時候~要開始生血球中控器
			say(OwnerID(),"[SC_19104733]")
			time2 = 1
			local Search = SearchRangeNPC ( OwnerID() , 150 )
			for i = 0 , table.getn(Search) do
				if Search[i] ~= OwnerID() then
					if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 104733 and ReadRoleValue( Search[i] , EM_RoleValue_IsDead)== 0 then---BOSS是否存在 -12人王
						SetAttack( Search[i] , AttackTarget)
						say ( Search[i] , "[SC_19104733_2]")
					end
				end
			end
		end
	end
end
--------------------------------------------------遷徙的野鳥------------------------------------------------------------
function cl_19104756()
	Addbuff (  OwnerID() , 508251 , 0 , -1 )
end
--------------------------------------------馬戲團小怪-------------------------
function cl_19XXXXX()
	Addbuff (  OwnerID() , 508254 , 0 , -1 )
end
----------------------------------Z22---------------------------------
function cl_Mob_skill_Explosion() --巨門能量收集者&巨門能量提供者死亡自爆劇情
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local DBID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	--say ( OwnerID , "DBID="..DBID)
	local DBID_Table = {}
	DBID_Table[106399] = 106371
	DBID_Table[106400] = 106372
	--say ( OwnerID , "DBID_Table="..DBID_Table[DBID])
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	local Skill_Ball = CreateObj ( DBID_Table[DBID] , Obj_X , Obj_Y , Obj_Z , 0 , 1) --隨機自身周圍生怪
	SetModeEx( Skill_Ball , EM_SetModeType_Strikback, false ) ---反擊(否)
	SetModeEx( Skill_Ball , EM_SetModeType_Move, false ) ---移動	(否)
	SetModeEx( Skill_Ball , EM_SetModeType_Searchenemy, false )--索敵(否)
	SetModeEx( Skill_Ball , EM_SetModeType_Mark, false )			---可點選(是)
	SetModeEx( Skill_Ball , EM_SetModeType_ShowRoleHead, false ) 		---頭像框(是)
	SetModeEx( Skill_Ball , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( Skill_Ball , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
	AddToPartition( Skill_Ball , RoomID )
	WriteRoleValue ( Skill_Ball , EM_RoleValue_Livetime , 3 )
	sysCastSpelllv ( Skill_Ball , Skill_Ball , 498893 , 30 )  ----自己對自己施放一個法術(表演用)
end
function cl_Mob_106161_AI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local CombatBegin = 0
	local skill_table = {}
	skill_table[7] = { 0 , 7 , 498894 , 1 , 10 }
	skill_table[13] = { 0 , 13 , 498896 , 0 , 60 }
	skill_table[17] = { 0 , 17 , 0 , 0 , 10 } 
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = skill_table[num][1] + 1
				end
				if skill_table[7][1] >=  skill_table[7][2] then
					CastSpelllv ( OwnerID , AttackTarget , skill_table[7][3] , skill_table[7][4] )
					sleep ( skill_table[7][5] )
					skill_table[7][1] = 0
				end
				if skill_table[13][1] >=  skill_table[13][2] then
					CastSpelllv ( OwnerID , OwnerID , 498900 , 0 ) --表演用
					sysCastSpelllv ( OwnerID , OwnerID , skill_table[13][3] , skill_table[13][4] )
					sleep ( skill_table[13][5] )
					skill_table[13][1] = 0
				end
				if skill_table[17][1] >=  skill_table[17][2] then
					cl_BossSkill_12(10)
					sleep ( skill_table[17][5] )
					skill_table[17][1] = 0
				end
			end
		elseif HateListCount ( OwnerID ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = 0
				end
			end
		end
	end
end
function cl_BossSkill_12( num )
	local NpcID = OwnerID()
	local RoomID = ReadRoleValue ( NpcID , EM_RoleValue_RoomID )
	local Npc_X = ReadRoleValue ( NpcID , EM_RoleValue_X )
	local Npc_Y = ReadRoleValue ( NpcID , EM_RoleValue_Y )
	local Npc_Z = ReadRoleValue ( NpcID , EM_RoleValue_Z )
	local Npc_obj = 150
	local obj_X = 0
	local obj_Z = 0
	local OrgID = 106422
	local move_time = 0
	local obj_table = {}
	local objMove_X = 0
	local objMove_Z = 0
	local Hate_table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
	local AttackTarget = table.getn(Hate_table) ----重整這個Table
	for i = 1 , num , 1 do
		obj_X = Npc_X - Npc_obj * math.cos(math.pi*2*(i/num))
		obj_Z = Npc_Z + Npc_obj * math.sin(math.pi*2*(i/num))
		obj_table[i] = CreateObj( OrgID , obj_X , Npc_Y , obj_Z , 0, 1 )
		SetModeEx( obj_table[i] , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
		SetModeEx( obj_table[i] , EM_SetModeType_Searchenemy, false )--索敵(否)
		SetModeEx( obj_table[i] , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( obj_table[i] , EM_SetModeType_Fight, false) ---可砍殺(是)
		AddToPartition ( obj_table[i] , RoomID ) ----物件加入場景,例行公事
		MoveToFlagEnabled( obj_table[i] , false ) ---系統內建的路徑關掉
		WriteRoleValue(  obj_table[i] , EM_RoleValue_IsWalk , 1 )
		local Rand_Target = DW_Rand( AttackTarget )  ---取隨機TABLE的位置
		WriteRoleValue(  obj_table[i] , EM_RoleValue_PID , NpcID )
		WriteRoleValue(  obj_table[i] , EM_RoleValue_Register1 , Hate_table[Rand_Target] )
	end
end
function cl_BossSkill_Small_ball()
	local BallID = OwnerID()
	local NpcID = ReadRoleValue ( BallID , EM_RoleValue_PID )
	local RoomID = ReadRoleValue ( BallID , EM_RoleValue_RoomID )
	local AttackTarget = ReadRoleValue ( BallID , EM_RoleValue_Register1 )
	local Target_X = ReadRoleValue ( AttackTarget , EM_RoleValue_X )
	local Target_Y = ReadRoleValue ( AttackTarget , EM_RoleValue_Y )
	local Target_Z = ReadRoleValue ( AttackTarget , EM_RoleValue_Z )
	MoveToFlagEnabled( BallID , false ) ---系統內建的路徑關掉
	WriteRoleValue( BallID , EM_RoleValue_IsWalk , 0 )
	Hide( BallID )
	Show( BallID , RoomID )
	LuaFunc_WaitMoveTo( BallID , Target_X , Target_Y , Target_Z )
	sysCastSpelllv ( BallID , BallID , 498895 , 0 )  ----自己對自己施放一個法術(表演用)
	sleep ( 5 )
	delobj ( BallID )
end
function cl_BossSkill_Shock()
	local OwnerID = OwnerID()
	local Hate_table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
	local AttackTarget = table.getn(Hate_table) ----重整這個Table
	for i = 1 , 3 , 1 do
		local Rand_Target = DW_Rand( AttackTarget )  ---取隨機TABLE的位置
		sysCastSpelllv ( OwnerID , Hate_table[Rand_Target] , 498897 , 0 )  ----自己對自己施放一個法術(表演用)
	end
end
function cl_z22Mob_skill_498898()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local AttackTarget = ReadRoleValue ( OwnerID , EM_RoleValue_AttackTargetID )
	local MobID = Lua_CreateObjToRandownPos( OwnerID , 106408 , 1 , 10 , true)
	SetAttack( MobID[1] , AttackTarget)
end