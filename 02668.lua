function AI_Z25_Boss_6_TouchSet()	--掛在任務物品的初始劇情之下-解凍藥劑
	local Obj = OwnerID()

	WriteRoleValue(Obj, EM_RoleValue_Register1, 6)

	SetPlot( Obj,"touch","AI_Z25_Boss_6_TouchEvent",30 )--觸碰劇情
end

function AI_Z25_Boss_6_TouchEvent()
	local Player = OwnerID()
	local Obj = TargetID()
	local Count = ReadRoleValue(Obj, EM_RoleValue_Register1)

	if Count <= 0 then	--如果藥劑已經被拿完就不給拿了
		return
	else
		BeginCastBarEvent( Player, Obj , "[SC_VALENTINE_2011_FN05]", 80, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSI2ON_ACTORSTATE_NORMAL , 1 , "AI_Z25_Boss_6_CastBarEvent")
	end
end

function AI_Z25_Boss_6_CastBarEvent(Player, Result)  --施法條事件
	local Obj = TargetID()
	local Count = ReadRoleValue(Obj, EM_RoleValue_Register1)
	local CastBarDebuff = 622445
	local UseBuff = 622446

	if Result > 0 then
		AddBuff(Player, CastBarDebuff, 0, -1)
		AddBuff(Player, UseBuff, 0, 15)
		WriteRoleValue(Obj, EM_RoleValue_Register1, Count-1)
	end
	EndCastBar( Player, Result )
end

function AI_Z25_Boss_6_CancelFreezeBuff()	--藥劑使用技能
	local Player =  TargetID()
	local FreezeBuff = 622450

	CancelBuff(Player, FreezeBuff)
end
----------------------------------------------------------------------------
--上面是實驗台拿藥劑的相關劇情
--下面是Boss AI
----------------------------------------------------------------------------
function AI_Z25_Boss_6_End()
	--偵測Boss離開戰鬥
	local Boss = OwnerID()
	WriteRoleValue(Boss, EM_RoleValue_Register1, 0 ) 
end

function AI_Z25_Boss_6_Begin()
	--偵測Boss進入戰鬥
	CallPlot( OwnerID(), "AI_Z25_Boss_6_Main", 0 )
end

function AI_Z25_Boss_6_Main()
	--一些設定
	local Boss = OwnerID()
	local RoomID =ReadRoleValue(Boss, EM_RoleValue_RoomID)
	local PetTable = {}
	local Bosstype = 0	--若是原本的靈獸 則設為0
	WriteRoleValue(Boss, EM_RoleValue_Register1, 1 )	--Register1寫為1表式開戰
	WriteRoleValue(Boss, EM_RoleValue_Register2, 0 )	--控制Boss的SkillA1開關
	
	Say(Boss, "----------Begin----------")
	--Buff
	local EnvironmentBuff = 622448
	local P2Buff = 622457
	--招式時間
	local SkillAtime = 7	-- 裂傷爪擊 / 凶蠻掃擊
	local SkillBtime = 12	-- 深寒冰槍
	local SkillCtime = 17	-- 冰河震盪
	local SkillDtime = 5	-- 寒流冰刺
	local SkillRageTime = 10
	
	if ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 106541 then
		Say(Boss, "----------I'm Summon Boss, so not all skill i will use!----------")
		Bosstype = 1 --若是魁儡靈獸 則設為1
		--設定奎爾諾所召喚出來的魁儡靈獸放招時間
		SkillAtime = 7
		SkillCtime = 17
		SkillDtime = 5
	end
	--招式
	local SkillA1 = 499325
	local SkillA2 = 499327
	local SkillB = 499328
	local SkillC = 499329
	--其它變數
	local IntoP2HP = 40	--進入第二階段的血量
	local BossTime = 0

	--開場環境效果 (有檢查魁儡靈獸不施放)
	if Bosstype == 0 then
		AddBuff(Boss, EnvironmentBuff, 0, -1)
	end

	while true do
		Sleep(10)
		BossTime = BossTime + 1
		Say(Boss, "-Time "..BossTime.." -")
		--Boss是否在戰鬥中的行為判定
		if ReadRoleValue(Boss, EM_RoleValue_Register1) == 0 then
			local Hate = KS_GetHateList( Boss, 1 )
			for h = 1 , table.getn(Hate) do
				CancelBuff(Hate[h], 622450)
			end
			--
			for p = 1 , table.getn(PetTable) do
				DelObj(PetTable[p])
			end
			--
			Say(Boss, "----------Stop----------")
			return
		end
		--A 裂傷爪擊 / 凶蠻掃擊
		if BossTime%SkillAtime == 0 then
			Say(Boss, "----------SkillA----------")
			if DW_Rand(2) == 1 then	--隨機2選1
				Say(Boss, "----------SkillA 1----------")
				local NowTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID)
				WriteRoleValue(Boss, EM_RoleValue_Register2, 0 )
				CastSpell( Boss, NowTarget, SkillA1 )
			else
				Say(Boss, "----------SkillA 2----------")
				CastSpell( Boss, Boss, SkillA2 )
			end
		end 
		--B 深寒冰槍 (有檢查魁儡靈獸不施放)
		if BossTime%SkillBtime == 0 and Bosstype == 0 then
			Say(Boss, "----------SkillB----------")
			local PlayerTable =  Lua_RandomPlayerFromHateList(Boss,3,true)
			for i = 1,table.getn(PlayerTable) do
				SysCastSpellLv(Boss, PlayerTable[i], SkillB, 0 )
			end
		end
		--C 冰河震盪
		if BossTime%SkillCtime == 0 then
			Say(Boss, "----------SkillC----------")
			CastSpell( Boss, Boss, SkillC )
		end
		--D 寒流冰刺
		if BossTime%SkillDtime == 0 then
			Say(Boss, "----------Skill D----------")
			local PlayerTable =  Lua_RandomPlayerFromHateList(Boss, 1, true)
			local IcePet = AI_Z25_Boss_6_IcePet(RoomID, PlayerTable[1], Boss)
			table.insert(PetTable, IcePet)
		end
		-- 霜怒 (有檢查魁儡靈獸不施放)
		if BossTime%SkillRageTime == 0 and Lua_PercentHP(Boss) <= IntoP2HP and Bosstype == 0 then
			Say(Boss, "----------Skill P2 Buff----------")
			AddBuff(Boss, P2Buff, 0, -1)
		end
	end
end

function AI_Z25_Boss_6_Environment()	--環境的凍僵疊加效果
	local player = TargetID()
	local ColdBuff = 622449
	local FreezeBuff = 622450

	local Count = FN_CountBuffLevel(player,ColdBuff)
	if Count == 4 then
		CancelBuff(player, ColdBuff)
		AddBuff(player, FreezeBuff, 0, -1)
	end
end

function AI_Z25_Boss_6_SkillC()	--冰河震盪擊中的範圍傷害
	local Boss = OwnerID()
	local player = TargetID()
	local skillCplus = 499330
	
	Say(Boss, "Cast Skill C")
	Say(player, "Hit by Skill C")

	local PosX = ReadRoleValue(player, EM_RoleValue_X)
	local PosY = ReadRoleValue(player, EM_RoleValue_Y)
	local PosZ = ReadRoleValue(player, EM_RoleValue_Z)

	SysCastSpellLv_Pos( Boss, PosX, PosY, PosZ, skillCplus, 0 )
end

function AI_Z25_Boss_6_SkillA1()	--裂傷爪擊的額外目標處理
	local Boss = OwnerID()
	local player = TargetID()
	local SkillA1plus = 499326
	local PlayerTable = SearchRangePlayer( player, 30 )
	local plusTarget = player
	Say(player, "SkillA1 cast")
	Say(player, "PlayerTable "..table.getn(PlayerTable))
	for i=0,table.getn(PlayerTable) do
		Say(PlayerTable[i], "check me! No."..i)
		if PlayerTable[i] == player then
			Say(PlayerTable[i], "i got remove")
			table.remove(PlayerTable, i)
		end
	end
	Say(player, "PlayerTable "..table.getn(PlayerTable))
	if ReadRoleValue(Boss, EM_RoleValue_Register2) == 0 then
		if table.getn(PlayerTable) >= 1 then
			plusTarget = PlayerTable[Rand(table.getn(PlayerTable))]
			Say(plusTarget, "me! me! me!")
		end
		SysCastSpellLv(Boss, plusTarget, SkillA1plus, 0 )
		WriteRoleValue(Boss, EM_RoleValue_Register2, 1 )
	end
end

function  AI_Z25_Boss_6_IcePet( RoomID, Player, Boss )--召喚寒流冰刺
	local PetBuff = 622459

	local PosX = ReadRoleValue(player, EM_RoleValue_X)
	local PosY = ReadRoleValue(player, EM_RoleValue_Y)
	local PosZ = ReadRoleValue(player, EM_RoleValue_Z)

	local IcePet = LuaFunc_CreateObjByObj( 106639, Boss )
	SetModeEx( IcePet, EM_SetModeType_Fight, false );	--無法砍殺
	SetModeEx( IcePet, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( IcePet, EM_SetModeType_Strikback , false );	-- 反擊
	SetModeEx( IcePet, EM_SetModeType_Mark , false );	-- 標記
	SetModeEx( IcePet, EM_SetModeType_NotShowHPMP, true );--沒有血條
	AddToPartition( IcePet, RoomID );
	AddBuff( IcePet, PetBuff, 0, -1 );--外觀
	MoveDirect( IcePet, PosX, PosY, PosZ )
	--
	if ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 106541 then
		--若是魁儡靈獸 則設寒流冰刺自爆的AE效果持續時間為6秒
		WriteRoleValue(IcePet, EM_RoleValue_Register1, 6)
	else
		--否則就是永久的 要靠藥劑解除
		WriteRoleValue(IcePet, EM_RoleValue_Register1, -1)
	end
	--
	CallPlot( IcePet, "AI_Z25_Boss_6_IcePet_die", 0 )
	--
	return IcePet
end

function AI_Z25_Boss_6_IcePet_die()
	Sleep(180)
	local pet = OwnerID()
	local icebuff = 622450
	local PlayerTable = SearchRangePlayer( pet, 60 )
	local BuffTime = ReadRoleValue(pet, EM_RoleValue_Register1)
	Say(pet, "- Pet Die! -")
	for i = 0 , table.getn(PlayerTable) do
		Say(PlayerTable[i], "- Freeze me! -")
		AddBuff(PlayerTable[i], icebuff, 0, BuffTime)
	end

	DelObj(pet)
end