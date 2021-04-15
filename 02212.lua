--/GM ? Zone 136 0 762.6 1000.7 1756.1

--780856--Flag1：lia(人形)
--780856--Flag2：Ana(魔)
--780856--Flag3：DOOR：/GM ? zone 136 0 761 1009.3 1806.5 270.6
--780856--Flag4：透明球A+紅+赫爾夫--魔法型(物免)黑灰
--780856--Flag5：透明球B+白+拉法德--物理型(魔免)黃褐
--780856--Flag6：透明球B+領主老爸
--780856--Flag7-26：隨機法陣
--780856--Flag27-29：門神 x 3
--780856--Flag30：集體傳點
--780858--FF1~7：人形路徑

--EM_RoleValue_register1--控制器
--EM_RoleValue_register1--控制器第一=howfar
--EM_RoleValue_register2--lia(人形)
--EM_RoleValue_register2--Ana(魔)第二=門神1
--EM_RoleValue_register3--Ana(魔)
--EM_RoleValue_register3--Ana(魔)第三=門神2
--EM_RoleValue_register4--Herf
--EM_RoleValue_register5--Rafad
--EM_RoleValue_register6--領主老爸
--EM_RoleValue_register7--Ana死
--EM_RoleValue_register7--Ana(魔)第七=門神3
--EM_RoleValue_register8 , 1--Herf死
--EM_RoleValue_register8 , 2--Rafad死
--EM_RoleValue_register8 , 3--兩隻熊死
--EM_RoleValue_register8--幻影第八=BOSS
--EM_RoleValue_register9--Entrance
--EM_RoleValue_register10--模式

--※ 控制器 ※--
function lua_sasa_104582_3_Counter()
	local Mode = 0												-----判斷模式用
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
	local BerserkCounter = 0									-------狂暴計時
	local IsBerserk = 0											-------狂暴開關
	local BearCounter = 0										-------小熊計時
	local BigCounter = 0										-------大熊計時
	local Ana = 0
	local Herf = 0
	local Rafad = 0
	local Father = 0
	local Entrance = 0
	local BallH = 0
	local howfar
	local EnterFight = 0
	local Mode2Buff = 507752									--死亡操作，抵銷傷害次數,預設5000萬
	local lia = CreateObjByFlag( 104583 , 780856 , 1 , 1 )		-----人形
	SetModeEx( lia , EM_SetModeType_Strikback , false )			-----不反擊
	SetModeEx( lia , EM_SetModeType_Fight , false )				-----不可砍殺
	SetModeEx( lia , EM_SetModeType_Move , true )				-----移動
	SetModeEx( lia , EM_SetModeType_Mark , false )				-----不可點選
	SetModeEx( lia , EM_SetModeType_NotShowHPMP , false )		-----不show血條
	AddToPartition( lia , Room )
	SetIdleMotion( lia , ruFUSION_MIME_WALK_FORWARD )
	BeginPlot( lia , "sasa_104583_walk" , 0 )
	--Say( lia , "1" )
	WriteRoleValue( OwnerID() , EM_RoleValue_register2 , lia )	
	WriteRoleValue( lia , EM_RoleValue_register1 , OwnerID() )
	local BearHere = 0											--熊熊開關
	local FatherHere = 0										--老爸開關
	local FatherDie = 0											--老爸死了開關
	local Baby1 = {}														--生小熊的變數
	local Baby2 = {}														--生小熊的變數
	local BigBear1 = 0												--門神1
	local BigBear2 = 0												--門神2
	local BigBear3 = 0												--門神3
	while 1 do
		sleep(10)
		Ana = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
		howfar = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
		BallH = ReadRoleValue( OwnerID() , EM_RoleValue_register4 )
		if Ana ~= 0 then
			local AnaTarget = ReadRoleValue( Ana , EM_RoleValue_AttackTargetID )
			local MaxHP = ReadRoleValue( Ana , EM_RoleValue_MaxHP )					--總血量
			local NowHP = ReadRoleValue( Ana , EM_RoleValue_HP )					--當前血量
			local HPPercent = ( NowHP / MaxHP )*100									--血量百分比
			if  ( AnaTarget ~= 0 ) and ( CheckID( Ana ) ) == true and howfar < 450 then
				BerserkCounter = BerserkCounter + 1
				BearCounter = BearCounter + 1
				if EnterFight == 0 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104582_01]" , "0xff6fb7ff" )
					--能讓我以魔化的形體來迎接…你們該為此感到榮幸！
					sleep(10)
					Mode = 1
					WriteRoleValue( Ana , EM_RoleValue_register10 , 1 )			--1=Mode1
--※ 門與門神 ※--
					Entrance = CreateObjByFlag( 104538 , 780856 , 3 , 1 )		-----阻擋門(入口)
					SetModeEx( Entrance , EM_SetModeType_Move , false )			------不移動
					SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------不反擊
					SetModeEx( Entrance , EM_SetModeType_Fight , false )		------不可砍殺
					SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------不索敵
					SetModeEx( Entrance , EM_SetModeType_Mark , false )			------不可點選
					SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------不show血條
					SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------阻擋
					AddToPartition( Entrance , Room )
					WriteRoleValue( Ana , EM_RoleValue_register9 , Entrance )
					
					BigBear1 = CreateObjByFlag( 105497 , 780856 , 29 , 1 )
					AddToPartition( BigBear1 , Room )
					WriteRoleValue( Ana , EM_RoleValue_register2 , BigBear1 )
					
					BigBear2 = CreateObjByFlag( 105498 , 780856 , 28 , 1 )
					AddToPartition( BigBear2 , Room )
					WriteRoleValue( Ana , EM_RoleValue_register3 , BigBear2 )
					
					BigBear3 = CreateObjByFlag( 105498 , 780856 , 27 , 1 )
					AddToPartition( BigBear3 , Room )
					WriteRoleValue( Ana , EM_RoleValue_register7 , BigBear3 )
--※ 集體傳傳樂 ※--
					local PPL = SetSearchAllPlayer( Room )
					local Num = 30
					local Num_flag = 780856			--抓玩家的點
					for h = 1 , PPL do
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1
						 and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0
						 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
							SetPosByFlag( ID , Num_flag , Num ) 		--抓玩家到同一個點
							Num = Num + 1
							if Num > GetMoveFlagCount(Num_flag) -1 then
								Num = 30
							end
							sysCastSpelllv ( ID , Ana , 496773 , 0 )		--玩家做仇恨
						end
					end
					EnterFight = 1
				end
--※ 小熊 ※--
				if EnterFight == 1 then
					if BearCounter >= 15 then
						for m = 1 , 2 do
							local flagNum1 = Rand(20)+7
							local flagNum2 = Rand(20)+7
							local BallD = CreateObjByFlag( 105346 , 780856 , flagNum1 , 1 )
							SetModeEx( BallD , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
							SetModeEx( BallD , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
							SetModeEx( BallD , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
							SetModeEx( BallD , EM_SetModeType_Searchenemy , false )   	--索敵
							SetModeEx( BallD , EM_SetModeType_Mark , false )			--標記
							SetModeEx( BallD , EM_SetModeType_Fight , false ) 			--砍殺
							SetModeEx( BallD , EM_SetModeType_Move , false )			--移動
							SetModeEx( BallD , EM_SetModeType_ShowRoleHead , true )
							SetModeEx( BallD , EM_SetModeType_Strikback , false )		--反擊
							SetModeEx( BallD , EM_SetModeType_Show , true )				--秀出
							AddToPartition( BallD , Room )
							WriteRoleValue( BallD , EM_RoleValue_Livetime, 5 )			--存在秒數
							AddBuff( BallD , 507751 , 0 , -1 )							--法陣,法術
							
							local BabyBear = CreateObjByFlag( 104585 , 780856 , flagNum1 , 1 )
							Baby1[table.getn( Baby1 )+1] = BabyBear
							AddToPartition( BabyBear , Room )
							BeginPlot( BabyBear , "sasa_104585_killID" , 0 )
							Setplot( BabyBear , "dead" , "sasa_104585_BombBear1" , 30 )
							--AddBuff( BabyBear , 509043 , 0 , 6 )						--倒數計時
							AddBuff( BabyBear , 505653 , 0 , -1 )						--不回血

							local BallE = CreateObjByFlag( 105346 , 780856 , flagNum2 , 1 )
							SetModeEx( BallE , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
							SetModeEx( BallE , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
							SetModeEx( BallE , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
							SetModeEx( BallE , EM_SetModeType_Searchenemy , false )   	--索敵
							SetModeEx( BallE , EM_SetModeType_Mark , false )			--標記
							SetModeEx( BallE , EM_SetModeType_Fight , false ) 			--砍殺
							SetModeEx( BallE , EM_SetModeType_Move , false )			--移動
							SetModeEx( BallE , EM_SetModeType_ShowRoleHead , true )
							SetModeEx( BallE , EM_SetModeType_Strikback , false )		--反擊
							SetModeEx( BallE , EM_SetModeType_Show , true )				--秀出
							AddToPartition( BallE , Room )
							WriteRoleValue( BallE , EM_RoleValue_Livetime, 5 )			--存在秒數
							AddBuff( BallE , 507750 , 0 , -1 )							--法陣,法術
							
							local BabyBear2 = CreateObjByFlag( 104586 , 780856 , flagNum2 , 1 )
							Baby2[table.getn( Baby2 )+1] = BabyBear2
							AddToPartition( BabyBear2 , Room )
							BeginPlot( BabyBear2 , "sasa_104585_killID" , 0 )
							Setplot( BabyBear2 , "dead" , "sasa_104586_BombBear2" , 30 )
							--AddBuff( BabyBear2 , 509145 , 0 , 6 )						--倒數計時
							AddBuff( BabyBear2 , 505653 , 0 , -1 )						--不回血
						end
						BearCounter = 0
					end
--※ 狂暴 ※--
					if BerserkCounter >= 1200 then
						if IsBerserk == 0 then
							AddBuff( Ana , 507744 , 0 , -1 ) 			--傀儡心刺
							--Say(Ana , "Time ="..BerserkCounter)
							ScriptMessage( Ana , -1 , 2 , "[SC_104582_02]" , "0xff6fb7ff" )
							--真無趣…這場鬧劇該結束了！你們實在弱的令我失望！
							IsBerserk = 1
						end	
						BerserkCounter = 0
					end
				end
--※ 模式一 ※--
				if Mode == 1 then
					if HPPercent <= 90 and ReadRoleValue( OwnerID() , EM_RoleValue_register7 ) ~= 1 then
						SetModeEx( Ana , EM_SetModeType_Move, false )				--不移動
						SetModeEx( Ana , EM_SetModeType_Fight , false ) 			--不砍殺
						SetModeEx( Ana , EM_SetModeType_Strikback , false )			--反擊
						AdjustFaceDir( Ana , AnaTarget , 0 )				--( who , 面向誰 , 角度 )
						Sleep(20)
						AddBuff( Ana, Mode2Buff , 0 , -1 )					--死亡操作，抵銷傷害次數,預設5000萬
						CastSpellLv( Ana , Ana , 497214 , 0 )				--死亡操作，預設1800秒
						Sleep(30)
						ScriptMessage( Ana , -1 , 2 , "[SC_104582_03]" , "0xff6fb7ff" )
						--別急…先讓這兩個孩子陪你們玩玩吧…
						Mode = 2
						WriteRoleValue( Ana , EM_RoleValue_register10 , 2 )	--2=Mode2
						sleep(10)
					end
--※ 模式二 ※--
				elseif Mode == 2 then
					local Mode2Counter = 0
					if BearHere == 0 then
--※ 生熊前的球 ※--	
						local BallA = CreateObjByFlag( 105346 , 780856 , 4 , 1 )
						SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
						SetModeEx( BallA , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
						SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
						SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--索敵
						SetModeEx( BallA , EM_SetModeType_Mark , false )			--標記
						SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--砍殺
						SetModeEx( BallA , EM_SetModeType_Move , false )			--移動
						SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
						SetModeEx( BallA , EM_SetModeType_Strikback , false )		--反擊
						SetModeEx( BallA , EM_SetModeType_Show , true )				--秀出
						AddToPartition( BallA , Room )
						WriteRoleValue( BallA , EM_RoleValue_Livetime, 5 )			--存在秒數
						AddBuff( BallA , 507750 , 0 , -1 )							--法陣,法術
						
						local BallB = CreateObjByFlag( 105346 , 780856 , 5 , 1 )
						SetModeEx( BallB , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
						SetModeEx( BallB , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
						SetModeEx( BallB , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
						SetModeEx( BallB , EM_SetModeType_Searchenemy , false )   	--索敵
						SetModeEx( BallB , EM_SetModeType_Mark , false )			--標記
						SetModeEx( BallB , EM_SetModeType_Fight , false ) 			--砍殺
						SetModeEx( BallB , EM_SetModeType_Move , false )			--移動
						SetModeEx( BallB , EM_SetModeType_ShowRoleHead , true )
						SetModeEx( BallB , EM_SetModeType_Strikback , false )		--反擊
						SetModeEx( BallB , EM_SetModeType_Show , true )				--秀出
						AddToPartition( BallB , Room )
						WriteRoleValue( BallB , EM_RoleValue_Livetime, 5 )			--存在秒數
						AddBuff( BallB , 507751 , 0 , -1 )							--法陣,物理
--※ 熊出沒注意 ※--
						Herf = CreateObjByFlag( 104587 , 780856 , 4 , 1 )
						SetModeEx( Herf , EM_SetModeType_Move , false )					--不移動
						AddToPartition( Herf , Room )
						SetDefIdleMotion( Herf , ruFUSION_ACTORSTATE_KNOCKDOWN_END )	--坐著
						AddBuff( Herf , 507755 , 0 , -1 )								--強化力量光環
						BeginPlot( Herf , "sasa_104587_Herf" , 0 )
						Setplot( Herf , "dead" , "sasa_104587_HerfDead" , 30 )
						WriteRoleValue( Herf , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( Herf , EM_RoleValue_register3 , Ana )
						Rafad = CreateObjByFlag( 104588 , 780856 , 5 , 1 )
						SetModeEx( Rafad , EM_SetModeType_Move , false )				--不移動						
						AddToPartition( Rafad , Room )
						SetDefIdleMotion( Rafad , ruFUSION_ACTORSTATE_KNOCKDOWN_END )	--坐著
						AddBuff( Rafad , 507756 , 0 , -1 )								--強化能量光環
						BeginPlot( Rafad , "sasa_104588_Rafad" , 0 )
						Setplot( Rafad , "dead" , "sasa_104588_RafadDead" , 30 )
						WriteRoleValue( Rafad , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( Rafad , EM_RoleValue_register3 , Ana )
						SetDefIdleMotion( Herf , ruFUSION_MIME_IDLE_STAND )
						SetDefIdleMotion( Rafad , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Herf , EM_SetModeType_Move , true )
						SetModeEx( Rafad , EM_SetModeType_Move , true )
						BearHere = 1
					end
					
--※ 一隻熊升天 ※--
					if ReadRoleValue( Ana , EM_RoleValue_register8 ) == 1
					 or ReadRoleValue( Ana , EM_RoleValue_register8 ) == 2 then
						BigCounter = BigCounter + 1
					end
					if BigCounter >= 5 and ReadRoleValue( Ana , EM_RoleValue_register8 ) == 1 then
						BigCounter = 0
						Herf = ReadRoleValue( Ana , EM_RoleValue_register4 )
						local HerfBear = star_CreateObj( Herf , 104587 , 0 , 0 , 0 , Room , 0)
						DelObj(Herf)
						Herf = HerfBear
						AddBuff( Herf , 507755 , 0 , -1 )							--強化力量光環
						BeginPlot( Herf , "sasa_104587_Herf" , 0 )
						Setplot( Herf , "dead" , "sasa_104587_HerfDead" , 30 )
						WriteRoleValue( Ana , EM_RoleValue_register8 , 0 )
						WriteRoleValue( Herf , EM_RoleValue_register3 , Ana )
					elseif BigCounter >= 5 and ReadRoleValue( Ana , EM_RoleValue_register8 ) == 2 then
						BigCounter = 0
						Rafad = ReadRoleValue( Ana , EM_RoleValue_register5 )
						local RafadBear = star_CreateObj( Rafad , 104588 , 0 , 0 , 0 , Room , 0)
						DelObj(Rafad)
						Rafad = RafadBear
						AddBuff( Rafad , 507756 , 0 , -1 )							--強化能量光環
						BeginPlot( Rafad , "sasa_104588_Rafad" , 0 )
						Setplot( Rafad , "dead" , "sasa_104588_RafadDead" , 30 )
						WriteRoleValue( Ana , EM_RoleValue_register8 , 0 )
						WriteRoleValue( Rafad , EM_RoleValue_register3 , Ana )
--※ 兩隻熊升天 ※--
					elseif ReadRoleValue( Ana , EM_RoleValue_register8 ) == 3
					 and ( CheckID( Ana ) == true) and ( ReadRoleValue( Ana , EM_RoleValue_IsDead ) == 0 )then
						ScriptMessage( Ana , -1 , 2 , "[SC_104582_04]" , "0xff6fb7ff" )
						--怎麼可能！他們可是我精心製成的菁英啊！
						Sleep(30)
						Herf = ReadRoleValue( Ana , EM_RoleValue_register4 )
						Rafad = ReadRoleValue( Ana , EM_RoleValue_register5 )
						sleep(20)
						DelObj(Herf)
						DelObj(Rafad)
						sleep(20)
						WriteRoleValue( Ana , EM_RoleValue_register8 , 0 )
						ScriptMessage( Ana , -1 , 2 , "[SC_104582_05]" , "0xff6fb7ff" )
						--嗚…啊…我的力量…！哼…別太自以為是了！
						Sleep(20)
						AddRoleValue( Ana , EM_RoleValue_HP , -MaxHP*0.3 )		--扣30%
						Sleep(10)
						CancelBuff( Ana , Mode2Buff )
						MagicInterrupt( Ana )
						SetModeEx( Ana , EM_SetModeType_Move, true )			--恢復移動
						SetModeEx( Ana , EM_SetModeType_Fight , true ) 			--恢復砍殺
						SetModeEx( Ana , EM_SetModeType_Strikback , true )		--恢復反擊
						Mode = 3
						WriteRoleValue( Ana , EM_RoleValue_register10 , 3 )		--3=Mode3
						sleep(10)	
					end
--※ 模式三 ※--
				elseif Mode == 3 then
					if FatherHere == 0 then
--※ 老爸出場球 ※--	
						ScriptMessage( Ana , -1 , 2 , "[SC_104582_06]" , "0xff6fb7ff" )
						--既然這樣，那就再跟「他」多敘舊一下吧！
						local BallC = CreateObjByFlag( 105346 , 780856 , 6 , 1 )
						SetModeEx( BallC , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
						SetModeEx( BallC , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
						SetModeEx( BallC , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
						SetModeEx( BallC , EM_SetModeType_Searchenemy , false )   	--索敵
						SetModeEx( BallC , EM_SetModeType_Mark , false )			--標記
						SetModeEx( BallC , EM_SetModeType_Fight , false ) 			--砍殺
						SetModeEx( BallC , EM_SetModeType_Move , false )			--移動
						SetModeEx( BallC , EM_SetModeType_ShowRoleHead , true )
						SetModeEx( BallC , EM_SetModeType_Strikback , false )		--反擊
						SetModeEx( BallC , EM_SetModeType_Show , true )				--秀出
						AddToPartition( BallC , Room )
						WriteRoleValue( BallC , EM_RoleValue_Livetime, 5 )			--存在秒數
						AddBuff( BallC , 509042 , 0 , -1 )							--法陣,法術
--※ 老爸來助陣 ※--
						Father = CreateObjByFlag( 104670 , 780856 , 6 , 1 )
						AddToPartition( Father , Room )
						Sleep(10)
						CastSpellLv( Father , Ana , 497188 , 0 )					--父愛光環
						Sleep(20)
						BeginPlot( Father , "sasa_104670_Father" , 0 )
						Setplot( Father , "dead" , "sasa_104670_FatherDead" , 30 )
						WriteRoleValue( Father , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( Father , EM_RoleValue_register3 , Ana )
						WriteRoleValue( Ana , EM_RoleValue_register6 , Father )
						FatherHere = 1
					end
--※ 老爸升天 ※--
					if ReadRoleValue( Ana , EM_RoleValue_register6 ) == 4
					 and ( CheckID( Ana ) == true) and ( ReadRoleValue( Ana , EM_RoleValue_IsDead ) == 0 ) then
						if FatherDie == 0 then
							ScriptMessage( Ana , -1 , 2 , "[SC_104582_07]" , "0xff6fb7ff" )
							--你們似乎搞不清楚惹怒了誰……弄壞了我的玩具是要付出代價的！
							Sleep(20)
							CancelBuff( Ana , 509036 )					--父愛光環
							FatherDie = 1
						end
					end
				end
			else
				if EnterFight == 1 then
					local AnaIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
					if AnaIsDead ~= 1 then
						if Ana ~= nil then
							DelObj(Ana)
							DelObj(BallH)
						end
						if Entrance ~= nil then
							DelObj(Entrance)
						end
						if BigBear1 ~= nil then
							DelObj(BigBear1)
						end
						if BigBear2 ~= nil then
							DelObj(BigBear2)
						end
						if BigBear3 ~= nil then
							DelObj(BigBear3)
						end
						if Herf ~= nil then
							DelObj(Herf)
						end
						if Rafad ~= nil then
							DelObj(Rafad)
						end
						if Father ~= nil then
							DelObj(Father)
						end
						for p = 1 , table.getn(Baby1) do
							if CheckID(Baby1[p]) == true and Baby1[p] ~= nil then
								DelObj( Baby1[p] )
							end
						end
						for q = 1 , table.getn(Baby2) do
							if CheckID(Baby2[q]) == true and Baby2[q] ~= nil then
								DelObj( Baby2[q] )
							end
						end
						BeginPlot( OwnerID() , "sasa_104582_CancelBuff" , 0 )		--清除BUFF
						sleep(50)
						Ana = CreateObjByFlag( 104582 , 780856 , 2 , 1 )
						BallH = CreateObjByFlag( 105346 , 780856 , 2 , 1 )
						SetModeEx( BallH , EM_SetModeType_HideName, true )			--名稱
						SetModeEx( BallH , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
						SetModeEx( BallH , EM_SetModeType_Mark, false )				--標記
						SetModeEx( BallH , EM_SetModeType_Move , false )				--不移動
						SetModeEx( BallH , EM_SetModeType_Searchenemy , false )		--不索敵
						SetModeEx( BallH , EM_SetModeType_Fight , false )			--可砍殺攻擊
						SetModeEx( BallH , EM_SetModeType_Strikback, false )			--反擊
						SetModeEx( BallH , EM_SetModeType_NotShowHPMP , false )		--不show血條
						AddToPartition( Ana , Room )
						AddToPartition( BallH , Room )
						BeginPlot( Ana , "sasa_104582_AI" , 0 )
						Setplot( Ana , "dead" , "sasa_104582_Dead" , 30 )
						BeginPlot( BallH , "sasa_104582_check" , 0 )
						WriteRoleValue( Ana , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( OwnerID() , EM_RoleValue_register3 , Ana )
						WriteRoleValue( BallH , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( BallH , EM_RoleValue_register3 , Ana )
						WriteRoleValue( OwnerID() , EM_RoleValue_register4 , BallH )
						BearHere = 0
						FatherHere = 0
						FatherDie = 0
						Baby1 = {}													--小熊重置歸零
						Baby2 = {}
						WriteRoleValue( Ana , EM_RoleValue_register8 , 0 )			--大熊階段重置歸零
					elseif AnaIsDead == 1 then										---Boss死了不重生
						DelObj(BallH)
						BeginPlot( OwnerID() , "sasa_104582_CancelBuff" , 0 )		--清除BUFF
						Sleep(50)
						return
					end
					EnterFight = 0
					BerserkCounter = 0
					IsBerserk = 0
					BearCounter = 0
				end
			end		
		end
	end
end

--※ 人形AI ※--
function sasa_104583_walk()
	while 1 do
		sleep(10)
		local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
		local MoveFlag = { 1 , 2 , 3 , 4 , 5 , 6 , 1 , 7 }
		for i=1 , 8 do
			local liaTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( liaTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
				--Say( OwnerID() , "2" )
				if ReadRoleValue( liaTarget , EM_RoleValue_VOC ) ~= 0  
				 and CheckRelation( OwnerID() , liaTarget , EM_CheckRelationType_Attackable ) == true then
					--Say( OwnerID() , "3" )
					--StopMove( OwnerID() , false )
					SetFlag( OwnerID() , 544800 , 1 )
					--if CheckFlag( OwnerID() , 544800) == true then
						--Say(OwnerID() , "OK")
					--else
						--Say(OwnerID() , "No")
					--end
					SetModeEx( OwnerID() , EM_SetModeType_Move , false )		--不移動
					AdjustFaceDir( OwnerID() , liaTarget , 0 )		--( who , 面向誰 , 角度 )
					--Say( OwnerID() , "speak" )
					Sleep(5)
					PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104583_01]" , 1 )
					--我本該為你們來到這裡的勇氣鼓掌，那表示待會你們的表現不會讓我失望。
					Sleep(40)
					PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104583_02]" , 1 )
					--可惜，阻斷了我的思考可是大忌呢……
					Sleep(30)
					PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104583_03]" , 1 )
					--害怕嗎？嘻嘻…別擔心，結束後我會好好重製你們的！
					Sleep(40)
					CastSpellLv( OwnerID() , OwnerID() , 496254 , 0 )				--遷怒
					--Say( OwnerID() , "4" )
					Sleep(40)
					Ana = star_CreateObj_NoAdd( OwnerID() , 104582 , 0 , 0 , 0 , Room , 0)
					BallH = CreateObjByFlag( 105346 , 780856 , 2 , 1 )			--測距離
					SetModeEx( BallH , EM_SetModeType_HideName, true )			--名稱
					SetModeEx( BallH , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
					SetModeEx( BallH , EM_SetModeType_Mark, false )				--標記
					SetModeEx( BallH , EM_SetModeType_Move , false )				--不移動
					SetModeEx( BallH , EM_SetModeType_Searchenemy , false )		--不索敵
					SetModeEx( BallH , EM_SetModeType_Fight , false )			--可砍殺攻擊
					SetModeEx( BallH , EM_SetModeType_Strikback, false )			--反擊
					SetModeEx( BallH , EM_SetModeType_NotShowHPMP , false )		--不show血條
					AddToPartition( Ana , Room )
					AddToPartition( BallH , Room )
					BeginPlot( Ana , "sasa_104582_AI" , 0 )
					Setplot( Ana , "dead" , "sasa_104582_Dead" , 30 )
					BeginPlot( BallH , "sasa_104582_check" , 0 )
					WriteRoleValue( Counter , EM_RoleValue_register3 , Ana )
					WriteRoleValue( Ana , EM_RoleValue_register1 , Counter )
					WriteRoleValue( BallH , EM_RoleValue_register1 , Counter )
					WriteRoleValue( BallH , EM_RoleValue_register3 , Ana )
					WriteRoleValue( Counter , EM_RoleValue_register4 , BallH )
					--Say( OwnerID() , "5" )
					DelObj(OwnerID())
					Sleep(30)
					return
				else
					ScriptMessage( OwnerID() , -1 , 1 , "Hi GM, plz back!" , 1 )
				end
			else				
				--Say( OwnerID() , "walk" )
				MoveToFlagEnabled ( OwnerID() ,  false )
				--LuaFunc_MoveToFlag( OwnerID() , 780858 , MoveFlag[i] , 10 )			--( who , flag , No. , Range )
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )		--不索敵
				DW_MoveToFlag( OwnerID() , 780858 , MoveFlag[i] , 10 )			--( who , flag , No. , Range )
				Sleep(20)
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )		--索敵
				sleep(10)
			end
		end	
	end
end

--※ 魔化AI ※--
function sasa_104582_AI()
	AddBuff( OwnerID() , 505653 , 0 , -1 )	------不讓Boss離開戰鬥回血的buff
	sleep(10)
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local mode = 0							-------判斷模式用
	local RandCounter = 0					--7S.RAND 3 招
	local Rand2Counter = 0					--7S.RAND 2 招
	local AECounter = 0						--噬靈
	local SkullCounter = 0					--爆裂死骨
	local FearCounter = 0					--詭譎
	local AE = 496258						--噬靈
	local Skull = 497213					--爆裂死骨
	local Fear = 496262						--詭譎
	local BossTarget

	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			mode = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
--※ 模式一 ※--
			if mode == 1 then
				RandCounter = RandCounter + 1
				if RandCounter >= 7 then
					sasa_104582_AnaSkill()
					RandCounter = 0
				end
--※ 模式二 ※--
			elseif mode == 2 then
				AECounter = AECounter + 1
				if AECounter >= 10 then
					BossTarget = OwnerID()
					SysCastSpellLv( OwnerID() , BossTarget , AE , 19 )
					AECounter = 0
				end
--※ 模式三 ※--
			elseif mode == 3 then
				Rand2Counter = Rand2Counter + 1
				FearCounter = FearCounter + 1
				SkullCounter = SkullCounter + 1
				if FearCounter >= 20 then
					local LuckyBear = {}
					local PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort(OwnerID())
					for z=1 , table.getn(PlayerInHate1) do
						local temp01 = PlayerInHate1[z]			 
						if ReadRoleValue( temp01 , EM_RoleValue_Voc ) ~= 0 				--GM排除
						 and ReadRoleValue( temp01 , EM_RoleValue_IsDead ) == 0 then 	--死人排除
							if ( temp01 ~= PlayerInHate1[1] )  
							 and ( CheckBuff( temp01 , 509007 ) == false ) 
							 and ( CheckBuff( temp01 , 509003 ) == false ) 
							 and ( CheckBuff( temp01 , 509475 ) == false ) then
								LuckyBear[table.getn(LuckyBear)+1] = temp01 			--找到的玩家放進TABLE
							end	
						end
					end
					--Say( OwnerID() , "Got Bear, "..table.getn(LuckyBear) )
					--if table.getn(LuckyBear) >= 2 then							------大於2人就rand 2個
						for y=1 , 1 do
							local Luckynum = Rand(table.getn(LuckyBear))+1		--RAND到的數字	
							if ( LuckyBear[Luckynum] ~= nil ) and ( ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
								BossTarget = LuckyBear[Luckynum]
								SysCastSpellLv( OwnerID() , BossTarget , Fear , 0 )
								if ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 1
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 2
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 3
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 6 then
									local Phy = star_CreateObj_NoAdd( LuckyBear[Luckynum] , 104589 , 0 , 0 , 0 , Room , 0 )
									AddToPartition( Phy , Room )
									BeginPlot( Phy , "sasa_104589_Phy" , 0 )
									Setplot( Phy , "dead" , "sasa_104589_PhyDead" , 30 )
									WriteRoleValue( Phy , EM_RoleValue_register7 , LuckyBear[Luckynum] )
									WriteRoleValue( Phy , EM_RoleValue_register8 , OwnerID() )		--記BOSS ID
								elseif ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 4
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 5
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 7
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 8 then
									local Mag = star_CreateObj_NoAdd( LuckyBear[Luckynum] , 104584 , 0 , 0 , 0 , Room , 0 )
									AddToPartition( Mag , Room )
									BeginPlot( Mag , "sasa_104584_Mag" , 0 )
									Setplot( Mag , "dead" , "sasa_104584_MagDead" , 30 )
									WriteRoleValue( Mag , EM_RoleValue_register7 , LuckyBear[Luckynum] )
									WriteRoleValue( Mag , EM_RoleValue_register8 , OwnerID() )		--記BOSS ID
								end
							end
							table.remove( LuckyBear , Luckynum )
							sleep(1)
							--Say( OwnerID() , "okok, "..table.getn(LuckyBear) )
						end
					--[[else													-------2人以下就全中
						for x=1 , table.getn(LuckyBear) do
							if ( LuckyBear[x] ~= nil )
							 and ( ReadRoleValue( LuckyBear[x] , EM_RoleValue_IsDead ) == 0 ) then
								Say( OwnerID() , "ok, "..table.getn(LuckyBear) )
								BossTarget = LuckyBear[x]
								SysCastSpellLv( OwnerID() , LuckyBear[x] , Fear , 0 )
								if ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 1
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 2
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 3
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 6 then
									local Phy = star_CreateObj_NoAdd( LuckyBear[x] , 104589 , 0 , 0 , 0 , Room , 0 )
									AddToPartition( Phy , Room )
									BeginPlot( Phy , "sasa_104589_Phy" , 0 )
									Setplot( Phy , "dead" , "sasa_104589_PhyDead" , 30 )
									WriteRoleValue( Phy , EM_RoleValue_register7 , LuckyBear[x] )
									WriteRoleValue( Phy , EM_RoleValue_register8 , OwnerID() )		--記BOSS ID
								elseif ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 4
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 5
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 7
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 8 then
									local Mag = star_CreateObj_NoAdd( LuckyBear[x] , 104584 , 0 , 0 , 0 , Room , 0 )
									AddToPartition( Mag , Room )
									BeginPlot( Mag , "sasa_104584_Mag" , 0 )
									Setplot( Mag , "dead" , "sasa_104584_MagDead" , 30 )
									WriteRoleValue( Mag , EM_RoleValue_register7 , LuckyBear[x] )
									WriteRoleValue( Mag , EM_RoleValue_register8 , OwnerID() )		--記BOSS ID
								end
							end
							sleep(1)
						end
					--end]]
					FearCounter = 0
				end
--※ 老爸死多一招 ※--
				if SkullCounter >= 10 then
					if ReadRoleValue( OwnerID() , EM_RoleValue_register6 ) == 4
					 and ( CheckID( OwnerID() ) == true) and ( ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 ) then
						local LuckySkull = {}
						local PlayerInHate5 = {}
						PlayerInHate5 = star_HateListSort(OwnerID())
						for r=1 , table.getn(PlayerInHate5) do
							local temp05 = PlayerInHate5[r]			 
							if ReadRoleValue( temp05 , EM_RoleValue_Voc ) ~= 0 				--GM排除
							 and ReadRoleValue( temp05 , EM_RoleValue_IsDead ) == 0 then 	--死人排除
								LuckySkull[table.getn(LuckySkull)+1] = temp05 			--找到的玩家放進TABLE
							end
						end
						--Say( OwnerID() , "Skull, "..table.getn(LuckySkull) )
						if table.getn(LuckySkull) >= 1 then
							for s=1 , 1 do
								local Luckynum = Rand(table.getn(LuckySkull))+1		--RAND到的數字	
								if ( LuckySkull[Luckynum] ~= nil )
								 and ( ReadRoleValue( LuckySkull[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
									BossTarget = LuckySkull[Luckynum]
									CastSpellLv( OwnerID() , BossTarget , Skull , 0 )
									sleep(25)
								end
								sleep(1)
								--Say( OwnerID() , "only, "..table.getn(LuckySkull) )
							end
						end
					end
					SkullCounter = 0
				end
				if Rand2Counter >= 7 then
					sasa_104582_AnaSkill_2()
					Rand2Counter = 0
				end
			end			
		end
	end
end

--※ 黑灰-赫爾夫AI ※--
function sasa_104587_Herf()
	while 1 do
		sleep(10)
		local HerfCounter = 0
		local HerfSkill = { 497186 , 497187 }							--邪惡回歸、渾沌
		local HerfSkillLv = { 49 , 29 }
		local HerfTarget 												--存BOSS要打的目標
		local SkillIndex 												--取TABLE內的位置
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--攻擊目標
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				HerfCounter = HerfCounter + 1
				if HerfCounter >= 8 then
					local Luck = Rand(100)
					if (Luck >= 0 and Luck < 50) then										--從0~ 取一個數
						SkillIndex = 1
						HerfTarget = OwnerID()
					elseif (Luck >= 50 and Luck < 100) then
						SkillIndex = 2
						HerfTarget = OwnerID()
					end
					if 	( HerfTarget ~= nil) 
					 and ( ReadRoleValue( HerfTarget , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLV( OwnerID() , HerfTarget , HerfSkill[SkillIndex] , HerfSkillLv[SkillIndex] )
						Sleep(10)
					end
					HerfCounter = 0
				end
			end
		end
	end
end

--※ 黃褐-拉法德AI ※--
function sasa_104588_Rafad()
	while 1 do
		sleep(10)
		local RafadCounter = 0
		local RafadSkill = { 497184 , 497185 }							--邪惡封鎖、快傷
		local RafadSkillLv = { 0 , 34 }
		local RafadTarget 												--存BOSS要打的目標
		local SkillIndex 												--取TABLE內的位置
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--攻擊目標
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				RafadCounter = RafadCounter + 1
				if RafadCounter >= 8 then
					local Luck = Rand(100)
					if (Luck >= 0 and Luck < 50) then										--從0~ 取一個數
						SkillIndex = 1
						RafadTarget = OwnerID()
					elseif (Luck >= 50 and Luck < 100) then
						SkillIndex = 2
						RafadTarget = OwnerID()
					end
					if 	( RafadTarget ~= nil) 
					 and ( ReadRoleValue( RafadTarget , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLV( OwnerID() , RafadTarget , RafadSkill[SkillIndex] , RafadSkillLv[SkillIndex] )
						Sleep(10)
					end
					RafadCounter = 0
				end
			end
		end
	end
end

--※ 領主AI ※--
function sasa_104670_Father()
	while 1 do
		sleep(10)
		local FireCounter = 0
		local SafeCounter = 0
		local FireSkill = { 497211 , 497212 }		--火焰噴射 , 丑角的把戲
		local FireLv = { 31 , 1 }
		local Save = 496337							--剝落（防熊抱 , ATK-10%）
		local DadTarget
		local SkillIndex
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				FireCounter = FireCounter + 1
				SafeCounter = SafeCounter + 1
				if SafeCounter>= 16 then
					DadTarget = OwnerID()
					CastSpellLV( OwnerID() , DadTarget , Save , 0 )
					sleep(10)
					SafeCounter = 0
				elseif FireCounter >= 7 then
					local LuckyBall = Rand(100)
					if (LuckyBall >= 0 and LuckyBall < 50) then
						--Say( OwnerID() , "ya~~" )
						SkillIndex = 1
						DadTarget = OwnerID()
						if ( DadTarget ~= nil ) and ( ReadRoleValue( DadTarget , EM_RoleValue_IsDead ) == 0 ) then
							CastSpellLv( OwnerID() , DadTarget , FireSkill[SkillIndex] , FireLv[SkillIndex] )
							Sleep(10)
						end
					elseif (LuckyBall >= 50 and LuckyBall < 100) then
						local PlayerInHate2 = {}
						PlayerInHate2 = star_HateListSort(OwnerID())
						local BallPlayer = {}
						--Say( OwnerID() , "yoyo~~" )
						SkillIndex = 2
						CastSpellLv( OwnerID() , OwnerID() , 496191 , 0 )					--丟球空動作
						for w=1 , table.getn(PlayerInHate2) do
							local temp03 = PlayerInHate2[w]			 
							if ReadRoleValue(temp03 , EM_RoleValue_Voc) ~= 0 				--GM排除
							 and ReadRoleValue(temp03 , EM_RoleValue_IsDead ) == 0 then 	--死人排除
								BallPlayer[table.getn(BallPlayer)+1] = temp03 				--找到的玩家放進TABLE
							end
						end
						--Say( OwnerID() , "Before ="..table.getn(BallPlayer) )
						if table.getn(BallPlayer) >= 6 then							------大於6人就rand 6個
							for v=1 , 6 do
								local Lucky3 = Rand(table.getn(BallPlayer))+1						--RAND到的數字	
								if ( BallPlayer[Lucky3] ~= nil ) and ( ReadRoleValue( BallPlayer[Lucky3] , EM_RoleValue_IsDead ) == 0 ) then
									SysCastSpellLv( OwnerID() , BallPlayer[Lucky3] , FireSkill[SkillIndex] , FireLv[SkillIndex] )
								end
								table.remove( BallPlayer , Lucky3 )
								sleep(1)
								--Say( OwnerID() , "After ="..table.getn(BallPlayer) )
							end
						else													-------6人以下就全中
							for u=1 , table.getn(BallPlayer) do
								if ( BallPlayer[u] ~= nil ) and ( ReadRoleValue( BallPlayer[u] , EM_RoleValue_IsDead ) == 0 ) then
									--Say( OwnerID() , "all ="..table.getn(BallPlayer) )
									SysCastSpellLv( OwnerID() , BallPlayer[u] , FireSkill[SkillIndex] , FireLv[SkillIndex] )
								end
								sleep(1)
							end
						end
					end
					FireCounter = 0
				end
			end
		end
	end
end

--※ 物理熊 ※--
function sasa_104589_Phy()
	while 1 do
		sleep(10)
		local PhyCounter = 0
		local BuffCounter = 0
		local PhyTarget 												--存BOSS要打的目標
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register8 )
		while 1 do
			sleep(10)
			if CheckID(Boss) == true then
				BuffCounter = BuffCounter + 1 
				if BuffCounter >= 5 then
					AddBuff( OwnerID() , 509008 , 0 , -1 )		--威能吸收
					BuffCounter = 0
				end		
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--攻擊目標
				if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
					PhyCounter = PhyCounter + 1								
					if PhyCounter >= 6 then
						PhyTarget = OwnerID()
						if 	( PhyTarget ~= nil) 
						 and ( ReadRoleValue( PhyTarget , EM_RoleValue_IsDead ) == 0 ) then
							CastSpellLV( OwnerID() , PhyTarget , 497185 , 34 )				--快傷
							Sleep(10)
						end
						PhyCounter = 0
					end
				end
			else
				KillID( OwnerID() , OwnerID() )
			end	
		end
	end
end

--※ 法術熊 ※--
function sasa_104584_Mag()
	while 1 do
		sleep(10)
		local MagCounter = 0
		local BuffCounter = 0
		local MagTarget 												--存BOSS要打的目標
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register8 )
		while 1 do
			sleep(10)
			if CheckID(Boss) == true then
				BuffCounter = BuffCounter + 1 
				if BuffCounter >= 5 then
					AddBuff( OwnerID() , 509008 , 0 , -1 )		--威能吸收
					BuffCounter = 0
				end		
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--攻擊目標
				if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
					MagCounter = MagCounter + 1
					if MagCounter >= 6 then
						MagTarget = OwnerID()
						if 	( MagTarget ~= nil) 
						 and ( ReadRoleValue( MagTarget , EM_RoleValue_IsDead ) == 0 ) then
							CastSpellLV( OwnerID() , MagTarget , 497187 , 29 )				--渾沌
							Sleep(10)
						end
						MagCounter = 0
					end
				end
			else
				KillID( OwnerID() , OwnerID() )
			end	
		end
	end
end