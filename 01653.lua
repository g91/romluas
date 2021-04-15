--Monster = CreateObjByFlag( BronID, Flag , rand((GetMoveFlagCount(Flag)-1)) , 1 )

function Lua_SandKing_deadlog()
	local RoomID = ReadRoleValue ( OwnerID(), EM_RoleValue_RoomID )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	SandKingSurvive = 0
	DesignLog(OwnerID(),100645,"沙塵之王..Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	--
	local RoomPlayer = SetSearchAllPlayer(RoomID)
	for i=1,RoomPlayer do
		local searchID = GetSearchResult()
		CancelBuff( searchID , 505339 )
	end
	--
	local SearchMonsterGroup = SearchRangeNPC( OwnerID(), 600 )
	for x=1, table.getn(SearchMonsterGroup) do
		if ReadRoleValue(SearchMonsterGroup[x], EM_RoleValue_OrgID) == 102907 or ReadRoleValue(SearchMonsterGroup[x], EM_RoleValue_OrgID) == 102906 then
			DelObj( SearchMonsterGroup[x])
		end
	end
end

function Lua_SkillAMonster_timer()			--讓流沙刪除自己的function
	sleep( 460 )
	DelObj( OwnerID() )
end

function Lua_FN_Ai_SandKing_Unit()
	if SandKingSurvive == 0 then
		DelObj(OwnerID())
	else
		AddBuff( OwnerID() , 503060 ,0 ,-1 )				--給予乾涸靈光
	end
end
-----------------------------------沙塵王AI從這邊開始-----------------------------------↓
function Lua_Ai_SandKing()
	SetPlot( OwnerID() , "dead" , "Lua_SandKing_deadlog" , 0 ); --設定死亡劇情
	if SandKingSurvive == null then
		SandKingSurvive = 0			--宣告死亡全域變數
	end
	SandKingSurvive = 1
	--
	local RoomID = ReadRoleValue ( OwnerID(), EM_RoleValue_RoomID )
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP ) 	--記錄王的HP
	local CountHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )   	--用來計算王的HP
	local DamageCount = 0							--紀錄受傷的量
	local SummonHP = 4000000		--召喚的門檻，如果想要改變王受到多少傷害就招小怪，改這邊
--	local HealHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP ) / 20		--玩家死亡幫Boss補血的量
	local HealCheck = FALSE
	local TempUnit				--小怪暫存
	local MonsterID = 102906		--產生的小怪
	local MonsterGroup = {}			--紀錄生出來的小怪的陣列
	local JoinFight = FALSE			--判定是否進入戰鬥
	--黏稠流沙是SkillA，沙噴泉是SkillB，沙縛是SkillC，狂暴是SkillD
	local SkillAtimer = 7			--計時器
	local SkillBtimer = 0			--    ↑
	local SkillCtimer = 0			--    ↓
	local SkillDtimer = 0			--計時器
	local SkillEtimer = 0
	local SkillACD = 7				--冷卻時間
	local SkillBCD = 30				--    ↑
	local SkillCCD = 21				--    ↓
	local SkillDCD = 600				--冷卻時間300
	local SkillECD = 36
	local SkillAID = 494642
	local SkillBID = 494643
	local SkillCID = 494644
	local SkillDID = 505331			--這個是AddBuff 填寫的是基本法術
	local SkillEID = 506933	
	local SkillAMonsterID = 102907		--用來當作SkillA的流沙施展的怪物
	local SkillAGroup = {}			--紀錄生出來的流沙
	local HatePlayer = {}
	local CheckPlayer = {}
	local TempCheck
	local AttackTarget

	while true do
		AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == TRUE ) then  	-- 檢查是否離開戰鬥
			if JoinFight == FALSE then
				HatePlayer = SearchRangePlayer(OwnerID(), 700 )
				JoinFight = TRUE
			end
			--判斷玩家給予DEBUFF
			local HateCount = SetSearchAllPlayer(RoomID)
			for i=1,HateCount do
				local searchID = GetSearchResult()

				if ReadRoleValue( searchID , EM_RoleValue_IsDead) == 0 then --非死亡
					if CheckBuff( searchID , 505339 )  == FALSE then
						WriteRoleValue ( searchID , EM_RoleValue_Register10, OwnerID())
						AddBuff( searchID , 505339 ,0 ,-1 )					--給予侵蝕之沙
					end
				elseif ReadRoleValue( searchID , EM_RoleValue_IsDead) == 1 then
					if ReadRoleValue ( searchID , EM_RoleValue_Register10) == OwnerID() then
--						local Heal = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) + HealHP	--幫王補血5%
--						WriteRoleValue ( OwnerID() , EM_RoleValue_HP, Heal)
						WriteRoleValue ( searchID , EM_RoleValue_Register10, 0)
						ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_SANDKING_01]", 1 )
					end
				end
			end

			--召喚沙塵元素的技能
			CountHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
			if CountHP < NowHP then --表示已經受傷
				DamageCount = DamageCount + ( NowHP - CountHP )
				if DamageCount > SummonHP then
					DamageCount = DamageCount - SummonHP
					local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1) 	--取得仇恨列表隨機玩家TargetPlayer
					TempUnit = CreateObjbyObj( MonsterID,TargetPlayer[1])	--在TargetPlayer旁邊創造沙塵元素
					SetModeEx( TempUnit  , EM_SetModeType_Revive , TRUE )	--設定可重生
					SetAttack( TempUnit,TargetPlayer[1])			--命令沙塵元素攻擊TargetPlayer
					table.insert (MonsterGroup,TempUnit)
					ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_SANDKING_02]", 1 )
				end
			end
			NowHP = CountHP
			
			if SkillAtimer >= SkillACD then					--●檢查時間，是否要使用黏稠流沙技能
				local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)				--取得仇恨列表隨機玩家為TargetPlayer
				--TempUnit = CreateObjbyObj( SkillAMonsterID,TargetPlayer[1]) 	--造出流沙的物件
				TempUnit = Lua_DW_CreateObj( "obj" , SkillAMonsterID , TargetPlayer[1] , 0 , 1 )
				SetModeEx( TempUnit , EM_SetModeType_Mark, false )		--標記
				SetModeEx( TempUnit , EM_SetModeType_HideName, false )	--名稱
				SetModeEx( TempUnit , EM_SetModeType_ShowRoleHead, false )	--頭像框
				SetModeEx( TempUnit , EM_SetModeType_Fight,false)			--砍殺
				AddToPartition( TempUnit,RoomID )
				CastSpell( TempUnit , TempUnit , SkillAID )	--施展法術
				BeginPlot( TempUnit, "Lua_SkillAMonster_timer", 0 ) 		--時間到刪掉流沙自己
				table.insert (SkillAGroup,TempUnit)
				SkillAtimer = 0
			elseif SkillBtimer >= SkillBCD then					--●檢查時間，是否要使用沙噴泉技能
				local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)				--取得仇恨列表隨機玩家為TargetPlayer
				CastSpellLV( OwnerID(), TargetPlayer[1], SkillBID , 1 )				--施展法術
				SkillBtimer = 0
			elseif SkillCtimer >= SkillCCD then					--●檢查時間，是否要使用沙縛技能
				local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),3)				--取得仇恨列表隨機3玩家為TargetPlayer
				for i= 1 ,table.getn(TargetPlayer) do
					SysCastSpellLV( OwnerID(), TargetPlayer[i], SkillCID , 1 )			--施展法術
				end
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_SANDKING_03]", 1 )
				SkillCtimer = 0
			end

			if SkillDtimer >= SkillDCD then					--●檢查時間，是否狂暴
				AddBuff( OwnerID() , 505331 ,0 ,-1 )
				SkillDtimer = 0
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_SANDKING_03]", 1 )
			end

			if SkillEtimer >= SkillECD then
				local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),6)				--取得仇恨列表隨機6玩家為TargetPlayer
				for i= 1 ,table.getn(TargetPlayer) do
					AddBuff(TargetPlayer[i],506933,1,3)		--施展法術
				end
				SkillEtimer = 0
			end

		else --如果脫離戰鬥的話
			if JoinFight == TRUE then
				for i=1,table.getn(MonsterGroup)  do 				--幹掉所有召喚的沙塵元素
					if CheckID(MonsterGroup[i]) == TRUE then
						DelObj( MonsterGroup[i] )
					end
				end
				for i=1,table.getn(SkillAGroup) do 				--幹掉所有流沙
					if CheckID(SkillAGroup[i]) == TRUE then
						DelObj( SkillAGroup[i] )
					end
				end
				JoinFight = FALSE
			end
			--								--把玩家身上的侵蝕之沙debuff取消
			local RoomPlayer = SetSearchAllPlayer(RoomID)
			for i=1,RoomPlayer do
				local searchID = GetSearchResult()
				CancelBuff( searchID , 505339 )
			end
			--
			SkillAtimer = 7							--把該歸零的歸零
			SkillBtimer = 0
			SkillCtimer = 0
			SkillDtimer = 0
			SkillEtimer = 0
			DamageCount = 0
			MonsterGroup = {}
			SkillAGroup = {}
			HatePlayer = {}
			NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP ) 
		end
	--
	Sleep(10)
	SkillAtimer = SkillAtimer + 1
	SkillBtimer = SkillBtimer + 1
	SkillCtimer = SkillCtimer + 1
	SkillDtimer = SkillDtimer + 1
	SkillEtimer = SkillEtimer + 1
	end
end

---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
function Lua_SandKing_UnitDead()
	SetPlot(OwnerID(),"dead","Lua_SandKing_CreatPortal",0) 
end

function Lua_SandKing_CreatPortal()
	local RoomID = ReadRoleValue ( OwnerID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue ( OwnerID(), EM_RoleValue_X )
	local Y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y )
	local Z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z )
	local Dir = ReadRoleValue ( OwnerID(), EM_RoleValue_Dir )
	local Unit = CreateObjByObj(115747, OwnerID() )
	SetModeEx( Unit , EM_SetModeType_Gravity, false )--重力
	SetModeEx( Unit , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Unit , EM_SetModeType_AlignToSurface, false )--貼地
	SetModeEx( Unit , EM_SetModeType_Move, false )--移動
	SetPos( Unit , X , Y+21 , Z , Dir )
	DelFromPartition(Unit)
	AddToPartition(Unit, RoomID)
	SetPlot(Unit ,"touch","Lua_SandKing_Portal",150) 
	BeginPlot(Unit,"Lua_SandKing_DelPortal",0)
end

function Lua_SandKing_Portal()
	local ZoneID = ReadRoleValue ( OwnerID(), EM_RoleValue_ZoneID )
	if ZoneID == 3 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register9, 3)
	else
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register9, 18)
	end
	ChangeZone( OwnerID(), 121 , 0 , -572.3, -96.6, 88.3, 42.5)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register10, 0)
end

function Lua_SandKing_DelPortal()
	Sleep(36000)
	DelObj(OwnerID())
end

function Lua_SandKing_PortalOut()
	SetPlot(OwnerID() ,"touch","Lua_SandKing_PortalOutEffect",150) 
end

function Lua_SandKing_PortalOutEffect()
	local ZoneID = ReadRoleValue ( OwnerID(), EM_RoleValue_Register9)
	if ZoneID == 3 then
		ChangeZone( OwnerID(), 3 , 0 , 17137.9, 15.0, 12751.3, 89.0)
	else
		ChangeZone( OwnerID(), 18 , 0 , 3014.7, 299.8, 42739.1, 178.7)
	end
end