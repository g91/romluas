
--門口--/GM ? zone 163 0 2306.4 774.3 -130.7
--Flag--781380
--Count--108278
--天空之羽--123481
--大地撼動透明球--108344
--旗標--Flag1--BOSS
--旗標--Flag2--前門
--旗標--Flag3--後門
--旗標--Flag4~23--小怪生怪點

--BOSS--EM_RoleValue_register1--Count
--BOSS--EM_RoleValue_register2--Mode
--BOSS--EM_RoleValue_register9--Entrance
--BOSS--EM_RoleValue_register10--Exit
--feather--EM_RoleValue_register1--BOSS
--feather--EM_RoleValue_register2--player
--count--EM_RoleValue_register3--1--死亡

--for迴圈使用至--a

--※ 控制器 ※--
function sasa_108481_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( Count , EM_RoleValue_ZoneID )
	local BossNum = { 108481 , 108482 , 108483 }
	local Buff = { 625098 , 625425 }			--無堅不摧 , 龜息
	local class
	if ZoneID == 163 or ZoneID == 940 then		--困難--測試區
		class = 1
	elseif ZoneID == 164 then	--普通
		class = 2
	elseif ZoneID == 165 then	--簡易
		class = 3
	end
	local BOSS = CreateObjByFlag( BossNum[class] , 781380 , 1 , 1 )
	AddToPartition( BOSS , Room )
	BeginPlot( BOSS , "sasa_108481_AI" , 0 )
	Setplot( BOSS , "dead" , "sasa_108481_Dead" , 30 )
	WriteRoleValue( BOSS , EM_RoleValue_register1 , Count )
	
	local Entrance = 0
	local Exit = CreateObjByFlag( 106239 , 781380 , 3 , 1 )	--後門出口
	SetModeEx( Exit , EM_SetModeType_Move , false )			--不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--不可砍
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--不可點
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	--不show血條
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--阻擋
	AddToPartition( Exit , Room )               
	WriteRoleValue( BOSS , EM_RoleValue_register10 , Exit )
	
	local Mode = 0
	local EnterFight = 0
	local Earth = DW_CircleRand(20)	--需為取出數量倍數
	local WindCounter = 0		--起風
	local ECounter = 0			--大地計時
	local BerserkCounter = 0	-------狂暴計時
	local IsBerserk = 0			-------狂暴開關
	
	while 1 do
		Sleep(10)
		local BossTarget = ReadRoleValue( BOSS , EM_RoleValue_AttackTargetID )
		local MaxHP = ReadRoleValue( BOSS , EM_RoleValue_MaxHP )					--總血量
		local NowHP = ReadRoleValue( BOSS , EM_RoleValue_HP )						--當前血量
		local HPPercent = ( NowHP / MaxHP )*100										--血量百分比
		if ( BossTarget ~= 0 ) and ( CheckID( BOSS ) ) == true then
			WindCounter = WindCounter + 1
			ECounter = ECounter + 1
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				AddBuff( BOSS , Buff[1] , 0 , -1 )	--無堅不摧
				ScriptMessage( BOSS , -1 , 2 , "[SC_108481_01]" , 1 )
				--受到外來者的打擾，[108481]的脾氣也跟著向上攀升
				Mode = 1
				WriteRoleValue( BOSS , EM_RoleValue_register2 , 1 )
				Entrance = CreateObjByFlag( 106239 , 781380 , 2 , 1 )		--前門入口
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--不移動
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--不反擊
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--不可砍
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--不索敵
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--不可點
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	--不show血條
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--阻擋
				AddToPartition( Entrance , Room )
				WriteRolevalue( BOSS , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
			if Mode == 1 then
				if HPPercent <= 60 and ReadRoleValue( BOSS , EM_RoleValue_register3 ) ~= 1 then
					AddBuff( BOSS , Buff[2] , 0 , -1 )	--龜息
					CancelBuff_NoEvent( BOSS , Buff[1] )--取消無堅不摧
					Mode = 2
					WriteRoleValue( BOSS , EM_RoleValue_register2 , 2 )
					Sleep(10)
				end
			end
			if EnterFight == 1 then
--※ 每23秒起風 ※--
				if WindCounter >= 23 then
					for b = 1 , 5 do
						local feather = CreateObjByFlag( 123481 , 781380 , Earth()+3 , 1 )--從flag4開始種物件，此種RAND不包含flag0，所以+3 是要略過flag1~3
						SetModeEx( feather , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
						SetModeEx( feather , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
						SetModeEx( feather , EM_SetModeType_Searchenemy, false )   	--索敵
						SetModeEx( feather , EM_SetModeType_Fight, false ) 			--砍殺
						SetModeEx( feather , EM_SetModeType_Move, false )				--移動
						SetModeEx( feather , EM_SetModeType_ShowRoleHead, true )
						SetModeEx( feather , EM_SetModeType_NotShowHPMP , true )		--不show血條
						SetModeEx( feather , EM_SetModeType_Strikback, false )			--反擊
						SetModeEx( feather , EM_SetModeType_Show, true )				--秀出
						AddToPartition( feather , Room )
						BeginPlot( feather , "sasa_123481_Feather" , 0 )
						Setplot( feather , "touch" , "sasa_123481_AI" , 30 )
						WriteRoleValue( feather , EM_RoleValue_register1 , BOSS )	--紀錄BOSS
						--WriteRoleValue( feather , EM_RoleValue_Livetime , 8 )		--存在秒數
					end
					WindCounter = 0
--※ 大地撼動產生點 ※--
				elseif ECounter >= 5 then
					for a = 1 , 5 do
						local Eball = CreateObjByFlag( 108344 , 781380 , Earth()+3 , 1 )--從flag4開始種物件，此種RAND不包含flag0，所以+3 是要略過flag1~3
						SetModeEx( Eball , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
						SetModeEx( Eball , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
						SetModeEx( Eball , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
						SetModeEx( Eball , EM_SetModeType_Searchenemy , false )   	--索敵
						SetModeEx( Eball , EM_SetModeType_Mark , false )			--標記
						SetModeEx( Eball , EM_SetModeType_Fight , false ) 			--砍殺
						SetModeEx( Eball , EM_SetModeType_Move , false )			--移動
						SetModeEx( Eball , EM_SetModeType_ShowRoleHead , true )
						SetModeEx( Eball , EM_SetModeType_Strikback , false )		--反擊
						SetModeEx( Eball , EM_SetModeType_Show , true )				--秀出
						AddToPartition( Eball , Room )
						WriteRoleValue( Eball , EM_RoleValue_Livetime, 6 )			--存在秒數
						AddBuff( Eball , 625435 , 0 , -1 )							--法陣,法術
						SetPlot( Eball , "collision" , "sasa_108344_fight" , 75 )	--碰撞劇情
					end
					ECounter = 0
				end
--※ 狂爆 ※--
				if ( BerserkCounter >= 480 and class == 1 ) 
				 or ( BerserkCounter >= 360 and class == 2 ) then		--8 min. and 6 min.
					ScriptMessage( BOSS , -1 , 2 , "[SC_108481_04]" , 1 )
					--長久應戰的[108481]越來越不耐煩，他要準備了結這場戰鬥了！
					if IsBerserk == 0 then
						AddBuff( BOSS , 625099 , 0 , -1 )
						--Say( BOSS , "Time ="..BerserkCounter )
						IsBerserk = 1
					end
					BerserkCounter = 0
				end
			end
		else
--※ 重置死亡 ※--
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				if BossIsDead ~= 1 then
					ScriptMessage( BOSS , -1 , 2 , "[SC_108481_02]" , 1 )
					--[108481]兇猛地令你無法招架…
					if CheckID(BOSS) == true then
						DelObj(BOSS)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end
					--BeginPlot( Count , "sasa_106382_CancelBuff" , 0 )	--清除BUFF
					Sleep(20)
					BOSS = CreateObjByFlag( BossNum[class] , 781380 , 1 , 1 )
					AddToPartition( BOSS , Room )
					BeginPlot( BOSS , "sasa_108481_AI" , 0 )
					Setplot( BOSS , "dead" , "sasa_108481_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( BOSS , EM_RoleValue_register1 , Count )
					WriteRoleValue( BOSS , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( BOSS , EM_RoleValue_register10 , Exit )
				elseif BossIsDead == 1 then
				--BeginPlot( Count , "sasa_106382_CancelBuff" , 0 )	--清除BUFF
					break
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
				WindCounter = 0
				ECounter = 0
			end
		end
	end
end

--※ 大地撼動傷害 ※--
function sasa_108344_fight()
	SysCastSpellLV( TargetID() , TargetID() , 851632 , 0 )
	sleep(5)
end

--※ 點天空之羽 ※--
function sasa_123481_AI()
	--WriteRoleValue ( TargetID() , EM_RoleValue_Register2 , OwnerID() )
	--BeginPlot( TargetID() , "sasa_123481_AI2" , 0)
	CallPlot( TargetID() , "sasa_123481_AI2" , OwnerID() );
end

--※ 刪天空之羽 ※--
function sasa_123481_AI2( GetPlayer )
	Setplot( OwnerID() , "touch" , "" , 0 )
	GetPlayer = GetPlayer ;--or ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local Buff = 625430			--毒性落羽
	local _toxicKill = CheckBuff( GetPlayer , 625432 );
	DebugMsg( 0 , 0 , " _toxicKill : "..tostring( _toxicKill ) );
	if _toxicKill == true then		--瘋狂鎖羽
		SysCastSpellLv( OwnerID(), GetPlayer , 852152 , 0 )		-----殺了有瘋狂鎖羽的玩家
		KillID( OwnerID(), GetPlayer );
		sleep(5)
		delobj ( OwnerID() )
	else
		if ReadRoleValue( GetPlayer , EM_RoleValue_IsDead ) == 0 then
			AddBuff( GetPlayer , Buff , 0 , 10 )	--10 SEC.
		end
		Sleep(5)
		delobj ( OwnerID() )
	end
end

--※ 天空之羽AI ※--
function sasa_123481_Feather()
	local Musho = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local BBuff = 625429		--興奮羽入
	local BuffCounter = 0
	while 1 do
		Sleep(10)
		BuffCounter = BuffCounter + 1
		if BuffCounter >= 7 then
			if ReadRoleValue( Musho , EM_RoleValue_IsDead ) == 0  then		--瘋狂鎖羽
				AddBuff( Musho , BBuff , 0 , -1 )
			end
			BuffCounter = 0
			delobj ( OwnerID() )
		end
		sleep(5)
	end
end

--※ 死了 ※--
function sasa_108481_Dead()
	SetFlag( OwnerID() , 544801 , 1 )			--死亡不出現啪嘰鼠
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_108481_03]" , 1 )
	--一陣吼叫－－[108481]抬高身軀往一旁倒下…
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--讀出控制器GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--告訴計時器Boss死了
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
end

--※ AI ※--
function sasa_108481_AI()
	local Owner = OwnerID()
	--AddBuff( Owner , 509476 , 0 , -1 )		------不讓Boss離開戰鬥回血的buff
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = ReadRoleValue( Owner , EM_RoleValue_register1 )
	--local ModeMode = 0		--判斷模式
	local RandCounter = 0		--Rand 2 Skills
	local Luck
	local BossTarget
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( Owner , EM_RoleValue_AttackTargetID )	--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( Owner ) ) == true then
			RandCounter = RandCounter + 1
			if RandCounter >= 7 then
				sasa_108481_Skill()
				RandCounter = 0
			end
		end
	end
end

--※ Rand Skill ※--

function sasa_108481_Skill()
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local class
	if ZoneID == 163 or ZoneID == 940 then		--困難--測試區
		class = 1
	elseif ZoneID == 164 then	--普通
		class = 2
	elseif ZoneID == 165 then	--簡易
		class = 3
	end
	local Skill = { 851356 , 851357 }		--硬殼刃、下顎兇咬
	local SkillLv = { 0 , 0 }
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--取出仇恨表內的玩家
	local BossTarget 											--存BOSS要打的目標
	local SkillIndex 											--取TABLE內的位置
	
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		BossTarget = OwnerID()
		CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end