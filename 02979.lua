-----------相關物件與旗標-----------

--中控器物件	107853
--Boss物件	107852	Raid
--		107853	Normal
--		107854	Easy
--特效透明球	107854
--門		102642 (暫代)
--旗標編號	781323
	--Boss	0
	--後門	1
	--前門	2

-----------相關法術集合與基本法術-----------

--7秒範圍攻擊	851012
--7秒扇形攻擊	851013
--9秒投擲巨石	851014
--13秒直線衝鋒	851015
--跳躍攻擊	

--13秒Boss定身	624560
--回血Buff	624566

local Z27_bico_Boss4_BossHeadache_Click = {}
local Z27_bico_Boss4_HP = {}
local Z27_bico_Boss4_Jump_Click ={}
local Z27_bico_boss4_TarTab = {}


function lua_bico_157_boss4_Ctrl()	--中控器的Script

-----------宣告區-----------
	local Ctrl = OwnerID()
	local BossNPC = { 107852, 108163, 108164 }
	local ZoneID = ReadRoleValue( Ctrl, EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID )
	local zone
	if ZoneID == 157 then  zone =1 
		elseif ZoneID == 158 then zone =2 
		elseif ZoneID == 159 then zone =3 
		elseif ZoneID == 938 then zone = 1
	end
	local Boss = CreateObjByFlag( BossNPC[zone] , 781323 , 0 , 1 )		--Boss, 旗標0
	local Door_Back = CreateObjByFlag( 102642 , 781323 , 1 , 1 )	--後門, 旗標1
	local Door_Front = CreateObjByFlag( 102642 , 781323 , 2 , 1 )	--前門, 旗標2
	local Fight_Click = 0		--戰鬥開關, 非戰鬥=0, 戰鬥=1
	local Door_Front_Click = 0	--前門開關, 開=0, 關=1
	local BossHP = ReadRoleValue( Boss, EM_RoleValue_HP )
	Z27_bico_Boss4_HP[ RoomID ] = BossHP			--Boss4王的當下HP血量 (全域變數)
	Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = 0			--Boss暈眩開關 (全域變數)

	
	--初始狀態--
	AddToPartition( Boss, RoomID )	--產生Boss
	Door_Back = CreateObjByFlag( 102642 , 781323 , 1 , 1 )
	SetModeEx( Door_Back, EM_SetModeType_Mark, false)		--標記(不可)
	SetModeEx( Door_Back, EM_SetModeType_HideName, false)	--名字(隱藏)
	SetModeEx( Door_Back, EM_SetModeType_NotShowHPMP, false)	--血條(不秀)
	SetModeEx( Door_Back, EM_SetModeType_Strikback, false)	--反擊(不可)
	SetModeEx( Door_Back, EM_SetModeType_Move, false)		--移動(不可)
	SetModeEx( Door_Back, EM_SetModeType_Fight, false)		--砍殺(不可)
	SetModeEx( Door_Back, EM_SetModeType_Searchenemy, false)	--索敵(不可)
	SetModeEx( Door_Back, EM_SetModeType_Obstruct, true)		--阻擋(可)
	AddToPartition( Door_Back, RoomID )	--產生後門
	

	
-----------AI編寫區-----------
while 1 do	
sleep(10)
	--Boss仇恨表非0, 表示開戰--
	if HateListCount( Boss ) ~= 0 then		--Boss仇恨表內有人(戰鬥開始)
		--開戰--
		if Fight_Click == 0 then			--初始戰鬥開關如果為0
			BeginPlot( Boss , "lua_bico_157_boss4_Ai" , 0 )		--執行BossAiScript
			ScriptMessage( Boss, -1, 2, "[SC_107852_01]", 0 )	--嗷嗚～我聞到食物的味道！					
			if Door_Front_Click == 0 then	--前門開關如果為0
				Door_Front = CreateObjByFlag( 102642 , 781323 , 2 , 1 )
				SetModeEx( Door_Front, EM_SetModeType_Mark, false )			--標記(不可)
				SetModeEx( Door_Front, EM_SetModeType_HideName, false )		--名字(隱藏)
				SetModeEx( Door_Front, EM_SetModeType_NotShowHPMP, false )	--血條(不秀)
				SetModeEx( Door_Front, EM_SetModeType_Strikback, false )		--反擊(不可)
				SetModeEx( Door_Front, EM_SetModeType_Move, false )			--移動(不可)
				SetModeEx( Door_Front, EM_SetModeType_Fight, false )			--砍殺(不可)
				SetModeEx( Door_Front, EM_SetModeType_Searchenemy, false )		--索敵(不可)
				SetModeEx( Door_Front, EM_SetModeType_Obstruct, true )		--阻擋(可)
				AddToPartition( Door_Front, RoomID )	
			Door_Front_Click = 1	--前門開關進入戰鬥後, 設定為1
			end
		Fight_Click = 1	--戰鬥開關ON
		end
	end
	--Boss仇恨表為0, 1: 滅團; 2: Boss死亡--
	if HateListCount( Boss ) == 0 then					--Boss仇恨表內無人(滅團)
		--滅團--
		if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 then	--Boss沒有死亡的狀況下
			if Door_Front_Click == 1 then
				DelObj( Door_Front )	--刪除前門
		--		DelObj( Door_Back )	--刪除後門 (測試方便用)		
			Door_Front_Click = 0		--重製前門開關狀態為0
			end
			if Fight_Click == 1 then
				ScriptMessage( Boss, -1, 2, "[SC_107852_02]", 0 )	--這食物的味道一點都不美味！
				DelObj( Boss )
				Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = nil
				Z27_bico_Boss4_HP[ RoomID ] = nil
				Boss = CreateObjByFlag( BossNPC[zone] , 781323 , 0 , 1 )	--Boss, 旗標0
				AddToPartition(Boss,RoomID)
				BossHP = ReadRoleValue( Boss, EM_RoleValue_HP )
				Z27_bico_Boss4_HP[ RoomID ] = BossHP			--Boss4王的當下HP血量 (全域變數)
				Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = 0			--Boss暈眩開關 (全域變數)	
			Fight_Click = 0			
			end
		end
		--Boss死亡--
		if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 then
			DelObj( Door_Back )	--開啟後門
			DelObj( Door_Front )	--開啟前門	
			DelObj( Ctrl )
			Z27_bico_Boss4_HP[ RoomID ] = nil	
			Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = nil
			Z27_bico_Boss4_Jump_Click[ RoomID ] = nil
			Z27_bico_boss4_TarTab[ RoomID ] = nil			
		end			
	end
end
end

function lua_bico_157_boss4_Ai()	--Boss的Script
-----------宣告區-----------
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	local SkillTime = 0		--技能計時器
	local BossFightTime = 0		--狂暴計時器
	local SoulBall = 107854
	local Skill_Ae_1 = 851012	--每7秒範圍傷害
	local Skill_Ae_2 = 851013	--每7秒前方扇形傷害
	local Skill_Stone = 851014	--每9秒投擲巨石
	local Skill_Stone_DMG = 851016	--每9秒投擲巨石傷害
	local Skill_Run = 851015	--每13秒施放的衝鋒技能
	local Skill_Jump_Up = 851017	--施放跳躍攻擊_跳起
	local Skill_Jump_Down = 851018	--施放跳躍攻擊_落下
	local Jump_TarTable = {}
	local RevHP = 624566		--回血Buff
	local Jump_Shadow = 624561	--黑影idol特效
	local Hate_table = KS_GetHateList( Boss, 1 )
	local RandPlayer = Rand( #Hate_table )
	local TarGID = HateListInfo( Boss, RandPlayer, EM_HateListInfoType_GItemID )
	local MaxHP = ReadRoleValue( Boss, EM_RoleValue_MAxHP )
	local NowHP = ReadRoleValue( Boss, EM_RoleValue_HP )	--Boss當下的HP
	local Ten_HP = MaxHP*0.015
	local RandSkill = DW_rand( 2 )
	AddBuff( Boss, 624586, 0, 480 )
	AddBuff( Boss, 502707, 0, -1 )
	
	Z27_bico_Boss4_Jump_Click[ RoomID ] = 0	
	
-----------AI編寫區-----------
while 1 do
sleep(10)
	----Boss當下的血量若是等於紀錄的血量就取消回血Buff----
	if Z27_bico_Boss4_BossHeadache_Click[ RoomID ] == 0 then	--Boss暈眩開關關閉時執行這邊
		AddBuff( Boss, 624587, 0, -1 )	--顯示用的續力狀態
		NowHP = ReadRoleValue( Boss, EM_RoleValue_HP )	--Boss當下的HP
		local HPClick = NowHP + Ten_HP
		if HPClick > Z27_bico_Boss4_HP[ RoomID ] and CheckBuff( Boss, RevHP ) == true then
			WriteRoleValue( Boss, EM_RoleValue_HP, Z27_bico_Boss4_HP[ RoomID ] )
			CancelBuff( Boss, RevHP )	--Boss取消回血Buff				
		elseif CheckBuff( Boss, RevHP ) == false and HPClick < Z27_bico_Boss4_HP[ RoomID ]  then
				AddBuff( Boss, RevHP, 0, -1 )	--Boss掛回血Buff
		end
----技能施放時機點----
	SkillTime = SkillTime + 1
		----跳躍攻擊----		
		if Z27_bico_Boss4_Jump_Click[ RoomID ] == 1 then	
			while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
				sleep(2)
			end
			SetModeEx( Boss , EM_SetModeType_Obstruct, false)
			SetModeEx( Boss , EM_SetModeType_Move, false)	---移動
			SetModeEx( Boss , EM_SetModeType_Fight, false)	---可砍殺
			SetModeEx( Boss , EM_SetModeType_Mark, false)
			ScriptMessage( Boss, -1, 2, "[SC_107852_07]", 0 )	--跳起來！跳起來！
			CastSpell( Boss, Boss, Skill_Jump_Up )
			sleep(20)	
	   		----目標篩選：活人與玩家----	
		  		Hate_table = KS_GetHateList( Boss, 1 )
				for i = 1, #Hate_table do			--把活著的玩家丟到目標列表內
					if ReadRoleValue( Hate_table[i], EM_RoleValue_IsDead ) == 0 or ReadRoleValue( Hate_table[i], EM_RoleValue_IsPlayer ) == 1 then		--如果Rand到的目標已死或者非玩家
						table.insert( Jump_TarTable, Hate_table[i] )
					end
				end
			-------------------------------	
				if #Jump_TarTable ~= 0 then	
					if #Jump_TarTable > 1 then		
						RandPlayer = Rand( #Jump_TarTable )
						TarGID = HateListInfo( Boss, RandPlayer, EM_HateListInfoType_GItemID )	--Boss仇恨表內隨機的活著玩家				
							local skilltarget = Lua_DW_CreateObj( "obj", 107855, TarGID, 0 )
							SetModeEx( skilltarget , EM_SetModeType_Mark, false)
							SetModeEx( skilltarget , EM_SetModeType_HideName, false)
							SetModeEx( skilltarget , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( skilltarget , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( skilltarget , EM_SetModeType_Obstruct, false)   -----阻擋
							SetModeEx( skilltarget , EM_SetModeType_Strikback, false) ---反擊
							SetModeEx( skilltarget , EM_SetModeType_Move, false) ---移動	
							SetModeEx( skilltarget , EM_SetModeType_Fight, false) ---可砍殺
							SetModeEx( skilltarget , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( skilltarget , EM_SetModeType_Searchenemy, false)
							SetModeEx( skilltarget , EM_SetModeType_Show, true)	
							AddToPartition( skilltarget , RoomID )
							WriteRoleValue( skilltarget, EM_RoleValue_Livetime, 4 )
							AddBuff( skilltarget, 624561, 1, -1 )-------上落地特效的buff
							local x, y, z, dir = DW_Location( skilltarget )
							SetPos( Boss, x, y, z, 20 )
							sleep(10)
							CastSpell( Boss, Boss, Skill_Jump_Down )
							SetModeEx( Boss , EM_SetModeType_Move, true) ---移動
							SetModeEx( Boss , EM_SetModeType_Fight, true) ---可砍殺
							SetModeEx( Boss , EM_SetModeType_Mark, true)	
							Jump_TarTable = {}
					else
							local skilltarget = Lua_DW_CreateObj( "obj", 107855, Jump_TarTable[1], 0 )
							SetModeEx( skilltarget , EM_SetModeType_Mark, false)
							SetModeEx( skilltarget , EM_SetModeType_HideName, false)
							SetModeEx( skilltarget , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( skilltarget , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( skilltarget , EM_SetModeType_Obstruct, false)   -----阻擋
							SetModeEx( skilltarget , EM_SetModeType_Strikback, false) ---反擊
							SetModeEx( skilltarget , EM_SetModeType_Move, false) ---移動	
							SetModeEx( skilltarget , EM_SetModeType_Fight, false) ---可砍殺
							SetModeEx( skilltarget , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( skilltarget , EM_SetModeType_Searchenemy, false)
							SetModeEx( skilltarget , EM_SetModeType_Show, true)	
							AddToPartition( skilltarget , RoomID )
							WriteRoleValue( skilltarget, EM_RoleValue_Livetime, 3 )
							AddBuff( skilltarget, 624561, 1, -1 )-------上落地特效的buff
							sleep(10)
							local x, y, z, dir = DW_Location( skilltarget )
							SetPos( Boss, x, y, z, 20 )
							CastSpell( Boss, Boss, Skill_Jump_Down )
							SetModeEx( Boss , EM_SetModeType_Move, true) ---移動
							SetModeEx( Boss , EM_SetModeType_Fight, true) ---可砍殺
							SetModeEx( Boss , EM_SetModeType_Mark, true)	
							Jump_TarTable = {}
					end
				end
			Z27_bico_Boss4_Jump_Click[ RoomID ] = 0
--			SkillTime = 0
		end						
	--每7秒施放範圍傷害或者前方扇形--
		if SkillTime % 7 == 0 then
			RandSkill = DW_rand( 2 )
			if RandSkill == 1 then
				while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
				sleep(2)
				end
				CastSpellLV( Boss, Boss, Skill_Ae_1, 0 )
			end
			if RandSkill == 2 then
				while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
				sleep(2)
				end
				CastSpellLV( Boss, Boss, Skill_Ae_2, 0 )
			end
		end
	--每10秒投擲巨石--
		if SkillTime % 10 == 0 then
			while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
			sleep(2)
			end
			Hate_table = KS_GetHateList( Boss, 1 )
			if #Hate_table ~= 0 then
				if #Hate_table > 1 then	--仇恨表內大於一個人的話
					ScriptMessage( Boss, -1, 2, "[SC_107852_05]".."|cffff0000" ..GetName(Hate_table[2]).. "|r" , 0 )	--巨石會砸碎你的頭
					CastSpellLV( Boss, Hate_table[2], Skill_Stone, 0 )	--投擲第二仇恨的玩家
				else	--仇恨表內如果只有一個人的話
					ScriptMessage( Boss, -1, 2, "[SC_107852_05]".."|cffff0000" ..GetName(Hate_table[1]).. "|r" , 0 )	--巨石會砸碎你的頭
					CastSpellLV( Boss, Hate_table[1], Skill_Stone, 0 )	--投擲第一仇恨的玩家
				end
			end
		end
	--每17秒施放衝鋒--
		if SkillTime % 17 == 0 then	
			while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
			sleep(2)
			end			
		----選隨機目標----	
			Hate_table = KS_GetHateList( Boss, 1 )
			RandPlayer = Rand( #Hate_table )
			TarGID = HateListInfo( Boss, RandPlayer, EM_HateListInfoType_GItemID )	--仇恨表內隨機目標
			Z27_bico_boss4_TarTab[ RoomID ] = {}
			table.insert(Z27_bico_boss4_TarTab[ RoomID ], TarGID)	
			ScriptMessage( Boss, -1, 2, "[SC_107852_06]".."|cffff0000" ..GetName(TarGID).. "|r" , 0 )	--我要吃你的肉！喝你的血！					
			CastSpellLV( Boss, TarGID, Skill_Run, 0 )
			lua_bico_157_boss4_Wind()
		end	
		end
end
end

function lua_bico_157_SaveBossHP()
	local Boss = OwnerID()
	local RevHP = 624566		--回血Buff
	local HP = ReadRoleValue( Boss, EM_RoleValue_HP )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	Z27_bico_Boss4_Jump_Click[ RoomID ] = 1
	Z27_bico_Boss4_HP[ RoomID ] = HP
	SetModeEx( Boss, EM_SetModeType_Move, true )
	Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = 0		--關閉Boss暈眩開關
end

function lua_bico_157_boss4_DEAD()
	Cl_Resist_HackersBossDead()	--防駭
	ScriptMessage( OwnerID(), -1, 2, "[SC_107852_03]", 0 )	--這麼快就結束了……
end

function lua_bico_157_boss4_480sFight()	--狂暴計時器
	ScriptMessage( OwnerID(), -1, 2, "[SC_107852_04]", 0 )	--全身充滿了力量！殺！殺！殺！
end

function lua_bico_157_boss4_Skill1()	--聚力衝擊觸發
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	AddBuff(OwnerID(), 624559,0 ,10 )
	CancelBuff( OwnerID(), 624566 )
	CancelBuff( OwnerID(), 624587 )	--刪除續力狀態
	Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = 1		--Boss暈眩開關開啟
end

function lua_bico_157_boss4_Wind()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Bx, By, Bz, Bdir = DW_Location( OwnerID() )
	local Distance = GetDistance( OwnerID(), Z27_bico_boss4_TarTab[ RoomID ][1] )
	local x, y, z, dir = DW_Location( Z27_bico_boss4_TarTab[ RoomID ][1] )
	local sec = Move( OwnerID(), x, y, z )
	sleep(sec)
	for Dis = 50, Distance-50, 50 do
		local Wx, Wy, Wz = DW_Relative( Z27_bico_boss4_TarTab[ RoomID ][1], Bx, By, Bz, Dis )		--取得物件與某個座標間的點(xyz)=>3D, Dis 是填新座標離 Tx, Ty, Tz的距離
		local Wind = CreateObj( 107854, Wx, Wy, Wz, 0, 1 )
		SetModeEx( Wind , EM_SetModeType_Mark, false)
		SetModeEx( Wind , EM_SetModeType_HideName, false)
		SetModeEx( Wind , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( Wind , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( Wind , EM_SetModeType_Obstruct, false)   -----阻擋
		SetModeEx( Wind , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( Wind , EM_SetModeType_Move, true) ---移動	
		SetModeEx( Wind , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( Wind , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( Wind , EM_SetModeType_Searchenemy, false)
		SetModeEx( Wind , EM_SetModeType_Show, true)
		AddToPartition( Wind , RoomID )
		CallPlot( wind, "lua_bico_157_boss4_WindAI" , 10 )
		SetRandMove( Wind, 200, 10, 50 )
		AddBuff( Wind, 624564, 0, -1 )
		WriteRoleValue( Wind, EM_RoleValue_Livetime, 12 )
		sleep(5)	
	end
	Z27_bico_boss4_TarTab[ RoomID ] = {}
end

function lua_bico_157_boss4_WindAI()
	while true do 
	sleep(10)
		DW_MoveRandPath( OwnerID() , 100 ,nil, OwnerID() )	
	end
end
--DW_Relative(GUID,Tx,Ty,Tz,Dis)