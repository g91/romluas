function kg_104592_Skillinfo(  )
		--	      1	         2	        3	          4	           5          	6	     7
	local SkillId = { 496248 , 496775 , 496774 , 496776 , 496777 ,   496779  ,    496780  }
	          	       --火焰噴射  隨機目標  喜_Hot   喜_扇形  降全體治療  怒_扇形    放坦Dot    
	local SkillLv = { 200, 	       200 ,          0 ,          200 ,            0 ,         	0 ,         0      }
	--等級為0的必須至模板調整，雜耍球調整的為%數，娃娃爆炸的調整在 kg_104592_DollExplode 這個函式中調整
	--玩家點娃娃的持續傷害需在 kg_104592_TouchDoll 中調整
	--領主無面具時的狂暴效果需再 kg_104592_BossForm 中調整
	--領主丟雜耍球需再 kg_104592_Form0_3Ball 中調整
	--怒_扇形 需再 kg_104592_BossSkill06_Cast 中調整
	local SkillString = { "[SC_104592_07]" , "[SC_104592_08]" , "496774"  , "[SC_104592_09]" , "496777" , "[SC_104592_10]"   , "499780"  }
	return SkillId,SkillLv,SkillString
end
--------------------------中控器-----------------------------------
function kg_104592_01()	--Zone19 格拉夫古堡 Boss領主中控器
--EM_RoleValue_Register1 BossID
--EM_RoleValue_Register2 娃娃ID
--EM_RoleValue_Register9 入口
--EM_RoleValue_Register10 出口
	local FlagID = 780851	--0:入口 1.出口 2.Boss戰鬥位置  3. 停用 4~9. 娃娃隨機參考點
	local Ctrl= OwnerID()	--中控器自身
	local BossID = 104592	--領主物件編號
	local DollID = 117212	--娃娃編號
	local DoorID = 105078	--阻擋門編號
	local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID )
	local TempString = "Graf_FanRange_"..RoomID
	kg_BossGV[TempString] = {}	--存取扇形範圍的玩家
	
	local Boss6_ExitDoor = CreateObjByFlag( DoorID, FlagID , 1 , 1 )--出口阻擋門
	kg_DoorInit( Boss6_ExitDoor )
	WriteRoleValue(Ctrl,EM_RoleValue_Register10,Boss6_ExitDoor)
	AddToPartition( Boss6_ExitDoor , RoomID )
	
	local Boss = CreateObjByFlag( BossID, FlagID , 2 , 1 )
	WriteRoleValue(Ctrl,EM_RoleValue_Register1,Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register3,0)
	WriteRoleValue(Boss,EM_RoleValue_Register5,1)
	MoveToFlagEnabled( Boss, false )	--關閉巡邏路徑劇情
	SetModeEx( Boss , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( Boss , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( Boss , EM_SetModeType_Searchenemy, false )	--索敵
	SetModeEx( Boss , EM_SetModeType_Revive, false )	--可重生
	AddToPartition( Boss , RoomID )
	
	local Doll = kg_GetRangePos( FlagID , DollID , 75 , 0 ,-1 , 2 )--在旗子2號的前方30碼處
	SetModeEx( Doll , EM_SetModeType_Gravity , false )	-- 重力
	WriteRoleValue(Ctrl,EM_RoleValue_Register2,Doll)
	WriteRoleValue(Doll,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register2,Doll)
	WriteRoleValue(Doll,EM_RoleValue_Register2,Boss)
	WriteRoleValue(Doll,EM_RoleValue_Register8,0 )
	SetModeEx( Doll , EM_SetModeType_Mark, false)---可點選
	SetModeEx( Doll , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( Doll , EM_SetModeType_Move, false) ---移動
	SetModeEx( Doll , EM_SetModeType_Revive, false)--可重生
	AddToPartition( Doll , RoomID )
	SetPos( Doll ,ReadRoleValue( Doll , EM_RoleValue_X ), ReadRoleValue( Doll , EM_RoleValue_Y )+18 ,ReadRoleValue( Doll , EM_RoleValue_Z ),ReadRoleValue( Doll , EM_RoleValue_Dir ) )
	setplot(Boss,"range","LuaS_kg_hell_show",250)
	SetPlot(Boss,"dead","kg_104592_BossDead",30)
end

function kg_104592_ResetBoss()
	Sleep(50)
	local FlagID = 780851	--0:入口 1.出口 2.Boss戰鬥位置  3. 停用 4~9. 娃娃隨機參考點
	local Ctrl= OwnerID()	--中控器自身
	local BossID = 104592	--領主物件編號
	local DollID = 117212	--娃娃編號
	local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID )
	--local Boss = CreateObjByFlag( BossID, FlagID , 2 , 1 )
	local Boss = kg_GetRangePos( FlagID , BossID , 0 , 0 ,-2 , 2 )
	WriteRoleValue(Ctrl,EM_RoleValue_Register1,Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register3,0)
	WriteRoleValue(Boss,EM_RoleValue_Register5,1)
	MoveToFlagEnabled( Boss, false )	--關閉巡邏路徑劇情
	SetModeEx( Boss , EM_SetModeType_Revive, false )	--可重生
	SetModeEx( Boss , EM_SetModeType_Strikback, TRUE) ---反擊
	SetModeEx( Boss , EM_SetModeType_Fight, TRUE) ---可砍殺
	SetModeEx( Boss , EM_SetModeType_Searchenemy, TRUE)	--索敵
	AddToPartition( Boss , RoomID )
	
	local Doll = kg_GetRangePos( FlagID , DollID , 75 , 0 ,-1 , 2 )--在旗子2號的前方30碼處
	SetModeEx( Doll , EM_SetModeType_Gravity , false )	-- 重力
	WriteRoleValue(Ctrl,EM_RoleValue_Register2,Doll)
	WriteRoleValue(Doll,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register2,Doll)
	WriteRoleValue(Doll,EM_RoleValue_Register2,Boss)
	WriteRoleValue(Doll,EM_RoleValue_Register8,0 )
	SetModeEx( Doll , EM_SetModeType_Mark, false)---可點選
	SetModeEx( Doll , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( Doll , EM_SetModeType_Move, false) ---移動
	SetModeEx( Doll , EM_SetModeType_Revive, false)--可重生
	AddToPartition( Doll , RoomID )
	SetPos( Doll ,ReadRoleValue( Doll , EM_RoleValue_X ), ReadRoleValue( Doll , EM_RoleValue_Y )+18 ,ReadRoleValue( Doll , EM_RoleValue_Z ),ReadRoleValue( Doll , EM_RoleValue_Dir ) )
	SetPlot(Boss,"dead","kg_104592_BossDead",30)
	BeginPlot(Boss,"kg_104592_BossAI",1)
end

function LuaS_kg_hell_show()	--領主劇情表演
	if kg_CheckGM(OwnerID())==TRUE then--玩家不為GM
		setplot(TargetID(),"range","",250)
		local graf = TargetID()
		local RoomID = ReadRoleValue( graf,EM_RoleValue_RoomID)
		local ena = ReadRoleValue(graf,EM_RoleValue_Register2)	--LuaFunc_SearchNPCbyOrgID( graf ,117212  , 1000 , 0)

		AdjustFaceDir(graf,ena,0)
		sleep(5)
		PlayMotion(graf,ruFUSION_ACTORSTATE_EMOTE_IDLE)
		sleep(10)
		yell(graf,"[SC_HELL_GRAF_1]",3)
		sleep(40)
		PlayMotion(graf,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		yell(graf,"[SC_HELL_GRAF_2]",3)
		sleep(40)
		yell(graf,"[SC_HELL_GRAF_5]",3)
		PlayMotion(graf,ruFUSION_ACTORSTATE_BUFF_SP01)
		sleep(40)
		yell(graf,"[SC_HELL_GRAF_6]",3)
		sleep(40)
		yell(graf,"[SC_HELL_GRAF_3]",3)
		sleep(20)
		AdjustFaceDir(graf,ena,90)
		sleep(5)
		PlayMotion(graf,ruFUSION_ACTORSTATE_CAST_SP01)
		sleep(30)
		AdjustFaceDir(graf,OwnerID(),0)
		sleep(5)
		PlayMotion(graf,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
		yell(graf,"[SC_HELL_GRAF_4]",3)
		sleep(30)

		local Ctrl = ReadRoleValue(graf,EM_RoleValue_Register1)
		SetModeEx( graf , EM_SetModeType_Strikback, TRUE) ---反擊
		SetModeEx( graf , EM_SetModeType_Fight, TRUE) ---可砍殺
		SetModeEx( graf , EM_SetModeType_Searchenemy, TRUE)	--索敵
		BeginPlot(graf,"kg_104592_BossAI",1)
	end
end

function kg_104592_BossAI()
--EM_RoleValue_Register1 中控器ID
--EM_RoleValue_Register2 娃娃ID
--EM_RoleValue_Register3 Boss面具形態
--EM_RoleValue_Register5 Boss面具轉換中
	local Boss = OwnerID()
	local Form = 0
	local timer = 0
	local EnterBattle = 0
	local EndBattle = 1
	local SkillId,SkillLv,SkillString = kg_104592_Skillinfo()
	local SkillIndex = 0
	local Ctrl = ReadRoleValue(Boss,EM_RoleValue_Register1)
	local Doll = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	
	while 1 do
		if KS_InCombat(Boss)==true then
			if EnterBattle == 0 then	--戰鬥初始化
				DebugMsg(0,0,"EnterBattle")
				--SysCastSpellLv(Boss,Boss,497085,0)
				BeginPlot(Ctrl,"kg_104592_BossCrazy",0 )
				CallPlot(Doll , "kg_104592_DollAI" , Doll)--娃娃開始隨機傳送
				local Boss6_EnterDoor = CreateObjByFlag( 105078, 780851 , 0 , 1 )--入口阻擋門
				kg_DoorInit( Boss6_EnterDoor )
				WriteRoleValue(Ctrl,EM_RoleValue_Register9,Boss6_EnterDoor)
				AddToPartition( Boss6_EnterDoor , RoomID )
				
				ScriptMessage( Boss , -1 , 2 , "[SC_104592_01]" , C_SYSTEM )
				--你們居然敢打擾我!!
				WriteRoleValue(Boss,EM_RoleValue_Register5,1)
				WriteRoleValue(Boss,EM_RoleValue_Register3,1)	--一開場就笑
				EnterBattle = 1
				EndBattle = 0
			end
			
			Form = ReadRoleValue( Boss,EM_RoleValue_Register3 )
			if ReadRoleValue(Boss,EM_RoleValue_Register5)==1 then
				WriteRoleValue(Boss,EM_RoleValue_Register5,0)
				kg_104592_BossForm(Boss,Form)
			else
				if Form == 0 then
					kg_104592_Form0_Skill(Boss , SkillId, SkillLv , SkillString ,timer )
				elseif Form == 1 then--喜
					kg_104592_Form1_Skill(Boss , SkillId, SkillLv , SkillString ,timer )
				elseif Form ==2 then--哀
					kg_104592_Form2_Skill(Boss , SkillId, SkillLv , SkillString ,timer )
				elseif Form ==3 then--怒
					kg_104592_Form3_Skill(Boss , SkillId, SkillLv , SkillString ,timer )
				end
			end
			timer = timer +1 
		else
			if EndBattle==0 then
				BeginPlot(Ctrl,"kg_104592_ResetBoss",1)
				local EnterDoor = ReadRoleValue(Ctrl,EM_RoleValue_Register9)
				DelObj( EnterDoor )--刪除入口
				DelObj(Doll)
				DelObj(Boss)
				break
			end
		end
		sleep(10)
	end
end

function kg_104592_BossDead()
	local Boss = OwnerID()
	local Doll = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	kg_104592_BossForm(Boss)--清除領主Buff
	DelObj( Doll )
	local QuestDoll = kg_GetRangePos( 780851 , 117213 , 75 , 0 ,-1 , 2 )--在旗子2號的前方30碼處
	SetModeEx( QuestDoll , EM_SetModeType_Gravity , false )	-- 重力
	SetModeEx( QuestDoll , EM_SetModeType_Move, false) ---移動
	AddToPartition( QuestDoll , ReadRoleValue( Boss , EM_RoleValue_RoomID ) )
	SetPos( QuestDoll ,ReadRoleValue( QuestDoll , EM_RoleValue_X ), ReadRoleValue( QuestDoll , EM_RoleValue_Y )+18 ,ReadRoleValue( QuestDoll , EM_RoleValue_Z ),ReadRoleValue( QuestDoll , EM_RoleValue_Dir ) )
	SysCastSpellLv( QuestDoll , QuestDoll , 496177 , 0 )	--傳送特效
	ScriptMessage( Boss , -1 , 2 , "[SC_104592_02]" , C_SYSTEM )	--[115301].....原諒我............
	
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	local TempString = "Graf_FanRange_"..RoomID
	kg_BossGV[TempString] = nil	--存取扇形範圍的玩家
	
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
	local Boss6_EnterDoor = ReadRoleValue( Ctrl , EM_RoleValue_Register9 )
	local Boss6_ExitDoor = ReadRoleValue( Ctrl , EM_RoleValue_Register10 )
	DelObj(Boss6_EnterDoor)--刪除入口
	DelObj(Boss6_ExitDoor)--刪除出口
end


------------------------領主技能------------------------------
function  kg_104592_BossCrazy()--Boss進入狂暴
	local Boss= ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local timer = 0
	while 1 do
		if KS_InCombat(Boss)~=TRUE  then
			DebugMsg(0,0,"BattleEnd")
			break
		elseif  timer==480 and KS_InCombat(Boss)==TRUE then
			AddBuff(Boss,507744,0,-1)
			break
		else
			
		end
		sleep(10)
		timer=timer+1
	end
end

function kg_104592_BossForm(Boss,Form)	--改變面具
--EM_RoleValue_Register3--Boss面具形態
--AddBuff(Boss,508482,0,-1) --無面具(附帶狂暴)
--AddBuff(Boss,508411,0,-1) --笑臉
--AddBuff(Boss,508412,0,-1) --哭臉
--AddBuff(Boss,508413,0,-1) --怒臉
--508416 喜_hot
--508419 散播哀怨種子
--508422 物免盾
--508423 魔免盾

	magicinterrupt(Boss)	--對Boss施放斷法
	Form = Form or -1	--Form為nil 則設定為-1
	WriteRoleValue(Boss,EM_RoleValue_Register3,Form )
	local BuffArray = { 508482 , 508411 , 508412 , 508413 , 508416 , 508419 , 508422 , 508423 }
	kg_ClearBuff( Boss , BuffArray )
	AddBuff( Boss ,508560,1,-1 )--不可移動
	
	if Form == 1 then
		AddBuff(Boss,508411,0,-1) --笑臉
		ScriptMessage( Boss , -1 , 2 , "[SC_104592_14]" , C_YELLOW )	--[104592] 戴上了面具 !
		PlayMotion(Boss , ruFUSION_ACTORSTATE_BUFF_SP03)
	elseif Form == 2 then
		AddBuff(Boss,508412,0,-1) --哭臉
		CallPlot( Boss , "kg_104592_Form2_AddShield" , Boss )
		ScriptMessage( Boss , -1 , 2 , "[SC_104592_14]" , C_YELLOW )	--[104592] 戴上了面具 !
		PlayMotion(Boss , ruFUSION_ACTORSTATE_BUFF_SP03)
	elseif Form == 3 then
		AddBuff(Boss,508413,0,-1) --怒臉
		ScriptMessage( Boss , -1 , 2 , "[SC_104592_14]" , C_YELLOW )	--[104592] 戴上了面具 !
		PlayMotion(Boss , ruFUSION_ACTORSTATE_BUFF_SP03)
	elseif  Form == 0 then
		AddBuff(Boss,508482,0,-1) --無面具(調整狂暴等級在這邊調整) 每個等級調整10%
		ScriptMessage( Boss , -1 , 2 , "[SC_104592_06]" , C_YELLOW )	--[104592] 的面具因爆炸破碎了!
		PlayMotion(Boss , ruFUSION_ACTORSTATE_BUFF_SP01)
	end
	Sleep(30)
end

function kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )	--隨機2選一施放法術
--SkillIndex=1--火焰噴射
--SkillIndex=2--領主之燄
	local SkillIndex=1--火焰噴射
	--if timer>1 and timer%7==0 then
		local randSkill = math.random(100)
		local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
		if randSkill >=50 then
			if GetDistance( Boss,atkTarget )<=60 and kg_CheckAtk(atkTarget)==TRUE then--火焰噴射
				CastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
				ScriptMessage( Boss , -1 , 2 ,SkillString[SkillIndex] , C_SYSTEM )
				--讓你們欣賞我的新把戲!!!
				Sleep(20)
			else
				SkillIndex=2--領主之燄
				local PlayersInHate = KS_GetHateList( Boss , 1 )
				atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]	--隨機取一名
				if kg_CheckAtk(atkTarget)==TRUE then
					AddBuff( Boss ,508560,1,-1 )--不可移動
					PlayMotion( Boss,ruFUSION_ACTORSTATE_CAST_SP02)
					sleep(10)
					SysCastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
					local messageString = SkillString[SkillIndex].."[$SETVAR1="..GetName( atkTarget ).."]"
					ScriptMessage( Boss , -1 , 2 ,messageString , C_SYSTEM )
					--[$VAR1]!! 來場華麗的火焰秀吧!
					Sleep(10)
				end
			end
		else
			SkillIndex=2--領主之燄
			local PlayersInHate = KS_GetHateList( Boss , 1 )
			atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]
			if kg_CheckAtk(atkTarget)==TRUE then
				AddBuff( Boss ,508560,1,-1 )--不可移動
				PlayMotion( Boss,ruFUSION_ACTORSTATE_CAST_SP02)
				sleep(10)
				SysCastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
				local messageString = SkillString[SkillIndex].."[$SETVAR1="..GetName( atkTarget ).."]"
				ScriptMessage( Boss , -1 , 2 ,messageString , C_SYSTEM )
				--[$VAR1]!! 來場華麗的火焰秀吧!
				Sleep(10)
			end
		end
	--end
end

function kg_104592_Form0_Skill(Boss , SkillId, SkillLv , SkillString ,timer )--無面具_技能

	local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
	if timer>1 and timer%7==0 then
		kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )
	elseif timer>1 and timer%3==0 then
		CastSpellLv( Boss, atkTarget  ,496786 , 0 )--丟球
		Sleep(20)
	end
end

function kg_104592_Form0_3Ball()
	--WriteRoleValue(OwnerID(),EM_RoleValue_Register6,1)
	local Boss = OwnerID()
	local SkillId = 496785
	local SkillLv = 60
	local SkillString = "[SC_104592_12]"
	local PlayersInHate = KS_GetHateList( Boss , 1 )	--抓仇恨列表
	local UnluckyPlayers = KS_RegroupArray( PlayersInHate , 6 )	--仇恨列表隨意抓三隻
	ScriptMessage( Boss , -1 , 2 ,SkillString , C_SYSTEM )
	--這球很好玩，就送你們了!
	for i in pairs(UnluckyPlayers) do
		if kg_CheckAtk( UnluckyPlayers[i] ) == TRUE then
			SysCastSpellLv( Boss , UnluckyPlayers[i] , SkillId , SkillLv )
		end
	end
end

function kg_104592_Form1_Skill( Boss , SkillId, SkillLv , SkillString ,timer )--喜_技能
--SkillIndex=3--喜_Hot
--SkillIndex = 4--喜_扇形	--聽我說個冷笑話吧!
	local SkillIndex = 0
	if CheckBuff(Boss,508416 )== false then
		SkillIndex=3--喜_Hot
		CastSpellLv( Boss , Boss , SkillId[SkillIndex] , SkillLv[SkillIndex] )
	end
	if timer>1 and timer%7==0 then
		kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )
	elseif timer>1 and timer%13==0 then
		local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
		if GetDistance( Boss,atkTarget )<=60 and kg_CheckAtk(atkTarget)==TRUE then
			SkillIndex = 4--喜_扇形
			CastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
			ScriptMessage( Boss , -1 , 2 ,SkillString[SkillIndex] , C_SYSTEM )
			--聽我說個冷笑話吧!
			Sleep(40)
		end
	end
end

function kg_104592_Form2_Skill(Boss , SkillId, SkillLv , SkillString ,timer )--哀_技能
--SkillIndex=7	--哀怨之淚
--508421 哀怨之淚 dot 
	local SkillIndex = 0
	if timer>1 and timer%3==0 then
		SkillIndex = 7
		local PlayersInHate = KS_GetHateList( Boss , 1 )
		local atkTarget = PlayersInHate[1]	--取得坦克
		--PlayMotion(Boss,ruFUSION_ACTORSTATE_CAST_SP02)
		SysCastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
		Sleep(10)
	end
	if timer>1 and timer%7==0 then
		kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )
	end
end

function kg_104592_Form2_AddShield( Boss )
--[SC_104592_11]	--[104592]展開了護盾!
--SkillIndex=9		--哀傷之盾
--SkillIndex=10	--哀怨之盾
--508422 物免盾
--508423 魔免盾
	local timer = 0
	local SkillIndex = 0
	local Shield = { 508422 , 508423 }
	math.randomseed( math.random(10000, 99999) )
	SkillIndex = math.random(1,2)--先跑一次隨機盾
	AddBuff( Boss, Shield[SkillIndex] , 0 , -1 )
	while 1 do
		if  ReadRoleValue( Boss , EM_RoleValue_Register3 )==2 then
			if timer>1 and timer%11==0 then
				kg_ClearBuff( Boss , Shield )	--清除身上的盾
				SkillIndex = math.random(1,2)
				AddBuff( Boss, Shield[SkillIndex] , 0 , -1 )
				ScriptMessage( Boss , -1 , 2 , "[SC_104592_11]" , C_YELLOW )
				--[104592]展開了護盾
			end
		else 
			break
		end
		Sleep(10)
		timer=timer+1
	end
end

function kg_104592_Form3_Skill(Boss , SkillId, SkillLv , SkillString ,timer )--怒_技能
--SkillIndex=5--怨念爆發
--SkillIndex = 6--怨念打擊(須分散)	--看我把你們切碎!!!
--AddBuff( 508419 )	--讓Boss每三秒就擴散一次種子
	local SkillIndex = 0
	if CheckBuff( Boss,508419 )== false then	--群體降治療
		--SkillIndex=5--怨念爆發
		AddBuff( Boss, 508419 , 0 , -1 )
	end
	
	if timer>1 and timer%7==0 then
		kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )
	elseif timer>1 and timer%11==0 then	--若技能有施法時間需改寫script
		local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
		if GetDistance( Boss,atkTarget )<=100 and kg_CheckAtk(atkTarget)==TRUE then
			SkillIndex = 6--怨念打擊(須分散)
			CastSpellLv(Boss, atkTarget ,SkillId[SkillIndex] , 0 )
			ScriptMessage( Boss , -1 , 2 ,SkillString[SkillIndex] , C_SYSTEM )
			--看我把你們切碎!!!
			sleep(30)
		end
	end
end

function kg_104592_BossSkill06_CountObj()--怨念打擊算人數
	local O_id = OwnerID()
	local T_id = TargetID()
	local RoomID = ReadRoleValue( O_id , EM_RoleValue_RoomID )
	local TempString = "Graf_FanRange_"..RoomID
	table.insert( kg_BossGV[TempString] , T_id )
end
function kg_104592_BossSkill06_Cast()--對陣列施放怨念打擊
	local O_id = OwnerID()
	local SkillId = 496787
	local SkillLv = 400
	local RoomID = ReadRoleValue( O_id , EM_RoleValue_RoomID )
	local TempString = "Graf_FanRange_"..RoomID
	local FanRange = kg_BossGV[TempString]
	local ShareNum = table.getn( FanRange )
	for i=1 ,  table.getn( FanRange ) do
		if GetDistance( O_id , FanRange[i] )>60  then--對大於60瑪的人不算在分享範圍內，但還是會打到
			ShareNum = ShareNum-1
		end
	end
	if ShareNum<=0 then ShareNum=1 end--預防sever的誤差取到負值
	DebugMsg(0,0,"ShareCount = "..ShareNum )
	local Damage = math.ceil( (SkillLv/ShareNum) )	-- 200*1000/share
	for i=1 , table.getn( FanRange ) do
		SysCastSpellLv(O_id , FanRange[i] , SkillId , Damage )
	end
	kg_BossGV[TempString]={}--清空陣列
end
function kg_104592_BossSkill05()--怨念種子劇情
	local Boss = OwnerID()
	local PlayersInHate = KS_GetHateList( Boss , 1 )
	for i=1,table.getn(PlayersInHate) do
		AddBuff( PlayersInHate[i] , 508418 , 0 , 10 )--怨恨種子
	end
end
-----------------------娃娃AI--------------------------------------------
function kg_104592_DollExplode( Doll )	--娃娃施展爆破技能
	local SkillId = 496784	--娃娃爆破
	local SkillLv = 2
	local Boss = ReadRoleValue( Doll , EM_RoleValue_Register2 )
	SysCastSpellLv( Doll, Doll ,SkillId , SkillLv )	--娃娃自爆
	SetPlot( Doll,"touch","",30 )
	if CheckDistance( Doll , Boss , 50 )==true then	--測試娃娃與領主是否在距離內
		magicinterrupt(Boss)	--對Boss施放斷法
		kg_104592_BossForm(Boss,0)
		--WriteRoleValue(Boss,EM_RoleValue_Register5,1)
		--WriteRoleValue(Boss,EM_RoleValue_Register3,0)
	end
	CallPlot( Doll , "kg_104592_DollReBorn" , Doll )--假如直接call function 會無視sleep()
end

function kg_104592_DollReBorn( Doll )	--娃娃重生
	local Ctrl = ReadRoleValue( Doll , EM_RoleValue_Register1 )
	local Boss = ReadRoleValue( Doll , EM_RoleValue_Register2 )
	local timer=0
	Sleep(3)--為了讓爆炸動畫播完
	SetModeEx( Doll , EM_SetModeType_Show, FALSE)--隱藏
	math.randomseed(math.random(10000, 99999))
	while 1 do
		if KS_InCombat(Boss)==true then
			if timer>0 and timer==20 then --等待20秒讓領主戴回面具
				if CheckBuff( Boss , 508482 )==TRUE then	--確定Boss處在面具破碎狀態
					--magicinterrupt(Boss)	--對Boss施放斷法
					--kg_104592_BossForm( Boss , math.random(1,3) )--強制轉換型態
					WriteRoleValue(Boss,EM_RoleValue_Register5,1)
					WriteRoleValue(Boss,EM_RoleValue_Register3, math.random(1,3) )
				end
			elseif timer>0 and timer==40 then--40秒時娃娃重生
				DebugMsg(0,0,"Reborn")
				local ranNum = math.random(4,9)
				SetPosByFlag( Doll , 780851 , ranNum )
				SetModeEx( Doll , EM_SetModeType_Show, TRUE)--顯示
				SysCastSpellLv( Doll,Doll,496177,0 )	--傳送特效
				SetPlot( Doll,"touch","kg_104592_TouchDoll",30 )
				break
			end
		else	--領主離開戰鬥回到初始位置
			break
		end
		--DebugMsg(0,0,timer)
		Sleep(10)
		timer=timer+1
	end
end

function kg_104592_DollAI( Doll )
--EM_RoleValue_Register1 中控器ID
--EM_RoleValue_Register2 BossID
--EM_RoleValue_Register8 娃娃"正在"被玩家綁定點選時為1
	local Ctrl = ReadRoleValue( Doll , EM_RoleValue_Register1 )
	WriteRoleValue( Doll,EM_RoleValue_Register5,0)
	math.randomseed(math.random(10000, 99999))
	Sleep(30)	--3秒後傳送
	SysCastSpellLv( Doll,Doll,496177,0 )
	local ranNum = math.random(4,9)
	SetPosByFlag( Doll , 780851 , ranNum )
	SysCastSpellLv( Doll,Doll,496177,0 )
	SetModeEx( Doll , EM_SetModeType_Mark, TRUE)---可點選
	Sleep(10)
	SetPlot( Doll,"touch","kg_104592_TouchDoll",30 )
end

function kg_104592_TouchDoll()
--EM_RoleValue_Register8 "正在"被玩家綁定點選時為1
--508493 引導傷害
	local Player = OwnerID()
	local Doll = TargetID()
	if ReadRoleValue(Doll,EM_RoleValue_Register8)==0 then
		WriteRoleValue(Doll,EM_RoleValue_Register8, 1 )	--滑鼠點選後鎖定
		AddBuff( Player , 508493 ,0,-1 )--引導傷害( 技能等級需在這裡調整 ) 每級-1000傷害
		if BeginCastBarEvent( Player, Doll , "[SC_104592_13]", 30, ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_END, 0 , "kg_104592_DollCastBarTriger")~=1 then
			ScriptMessage( Doll, Player, 0,"[SAY_NPC_BUSY]", 0 )
		end
	else
		ScriptMessage( Doll, Player, 0,"[SAY_NPC_BUSY]", 0 )
	end
end

function kg_104592_DollCastBarTriger( ObjID, CheckStatus )
--OwnerID 玩家
--TargetID 娃娃
	local Player = OwnerID()
	local Doll = TargetID()
	if CheckStatus >0  then
		CancelBuff( Player, 508493 )
		EndCastBar( Player,CheckStatus )
		WriteRoleValue( Doll,EM_RoleValue_Register8,0)
		kg_104592_DollExplode( Doll )
	else
		CancelBuff( Player, 508493 )
		WriteRoleValue( Doll,EM_RoleValue_Register8,0)
		EndCastBar( Player,CheckStatus)
	end
end
