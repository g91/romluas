--門口：/GM ? Zone 139 0 479.6 1471.3 -1050.6
--金剛站點：/GM ? Zone 140 0 354.1 1588.9 -705.2
--780911--Flag1：大金剛
--780911--Flag2：前門：/GM ? Zone 139 0 444.4 1472.7 -1048.8
--780911--Flag3：後門
--780911--Flag4~6：3個出桶口(DIR：90)
--4：/GM ? zone 139 0 232.2 1471.4 -682.8
--5：/GM ? zone 139 0 297.2 1471.4 -682.8
--6：/GM ? zone 139 0 365.2 1471.4 -682.8
--780911--Flag7~9：3個桶終點
--780911--Flag10：寶箱
--780911--Flag11~13：攻城車
--780911--Flag14~23：小怪
--780911--Flag24：岩氣透明球

--控制器--EM_RoleValue_register1--Boss死亡判斷(1=死)

--Boss--EM_RoleValue_register1--控制器
--Boss--EM_RoleValue_register5--Mode
--Boss--EM_RoleValue_register6--Car01
--Boss--EM_RoleValue_register7--Car02
--Boss--EM_RoleValue_register8--Car03
--Boss--EM_RoleValue_register9--Entrance
--Boss--EM_RoleValue_register10--Exit

--Bomb--EM_RoleValue_Register1--Player
--Car--EM_RoleValue_Register1--Player
--Car--EM_RoleValue_Register2--Boss

--※ 控制器 ※--
function sasa_105458_Counter_easy()
	local Entrance = 0
	local EnterFight = 0	
	local Mode = 0												------判斷模式用
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 105858 , 780911 , 1 , 1 )
	AddToPartition( Boss , Room )
	BeginPlot( Boss , "sasa_105458_AI_easy" , 0 )
	Setplot( Boss , "dead" , "sasa_105458_Dead_easy" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
	
	local Entrance = CreateObjByFlag( 105459 , 780911 , 2 , 1 )		-----阻擋門(入口)
	SetModeEx( Entrance , EM_SetModeType_Move , false )			------不移動
	SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( Entrance , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------不索敵
	SetModeEx( Entrance , EM_SetModeType_Mark , false )			------不可點選
	SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------不show血條
	SetModeEx( Entrance , EM_SetModeType_Obstruct , false )		------阻擋(為了打開狀態所以不勾)
	AddToPartition( Entrance , Room )
	SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )	--打開狀態
	WriteRoleValue( Boss , EM_RoleValue_register9 , Entrance )
	
	local Exit = CreateObjByFlag( 105459 , 780911 , 3 , 1 )		------阻擋門(出口)
	SetModeEx( Exit , EM_SetModeType_Move , false )				------不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )		------不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )			------不可砍殺
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )		------不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )				------不可點選
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )		------不show血條
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )			------阻擋
	AddToPartition( Exit , Room )
	SetIdleMotion( Exit , ruFUSION_ACTORSTATE_ACTIVATE_END )	------關閉狀態
	WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )

	local Car01 = CreateObjByFlag( 105863 , 780911 , 11 , 1 )
	SetModeEx( Car01 , EM_SetModeType_ShowRoleHead, false )			--不秀頭像框
	SetModeEx( Car01 , EM_SetModeType_Mark, false )					--標記
	SetModeEx( Car01 , EM_SetModeType_Move , false )				------不移動
	SetModeEx( Car01 , EM_SetModeType_Strikback , false )			------不反擊
	SetModeEx( Car01 , EM_SetModeType_Fight , false )				------不可砍殺
	AddToPartition( Car01 , Room )
	AddBuff( Car01 , 509476 , 0 , -1 )								--車子不回血
	Setplot( Car01 , "dead" , "sasa_105665_Broken01_easy" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register6 , Car01 )
	WriteRoleValue( Car01 , EM_RoleValue_register2 , Boss )
	
	local Car02 = CreateObjByFlag( 105863 , 780911 , 12 , 1 )
	SetModeEx( Car02 , EM_SetModeType_ShowRoleHead, false )			--不秀頭像框
	SetModeEx( Car02 , EM_SetModeType_Mark, false )					--標記
	SetModeEx( Car02 , EM_SetModeType_Move , false )				------不移動
	SetModeEx( Car02 , EM_SetModeType_Strikback , false )			------不反擊
	SetModeEx( Car02 , EM_SetModeType_Fight , false )				------不可砍殺
	AddToPartition( Car02 , Room )
	AddBuff( Car02 , 509476 , 0 , -1 )								--車子不回血
	Setplot( Car02 , "dead" , "sasa_105665_Broken02_easy" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register7 , Car02 )
	WriteRoleValue( Car02 , EM_RoleValue_register2 , Boss )
	
	local Car03 = CreateObjByFlag( 105863 , 780911 , 13 , 1 )
	SetModeEx( Car03 , EM_SetModeType_ShowRoleHead, false )			--不秀頭像框
	SetModeEx( Car03 , EM_SetModeType_Mark, false )					--標記
	SetModeEx( Car03 , EM_SetModeType_Move , false )				------不移動
	SetModeEx( Car03 , EM_SetModeType_Strikback , false )			------不反擊
	SetModeEx( Car03 , EM_SetModeType_Fight , false )				------不可砍殺
	AddToPartition( Car03 , Room )
	AddBuff( Car03 , 509476 , 0 , -1 )								--車子不回血
	Setplot( Car03 , "dead" , "sasa_105665_Broken03_easy" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register8 , Car03 )
	WriteRoleValue( Car03 , EM_RoleValue_register2 , Boss )

	local GG01 = {}							--小怪變數
	local GG02 = {}							--小怪變數
	local GGCounter = 0						--15S.出小怪
	--local BerserkCounter = 0									-------狂暴計時
	--local IsBerserk = 0											-------狂暴開關
		
	while 1 do
		Sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if ( BossTarget ~= 0 ) and ( CheckID( Boss ) ) == true then
			GGCounter = GGCounter + 1
			--BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				ScriptMessage( Boss , -1 , 2 , "[SC_105458_01]" , 1 )
				--歡迎，你們是新來的練習對象吧？
				Mode = 1
				WriteRoleValue( Boss , EM_RoleValue_register5 , 1 )				--1=Mode1
				SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_END )	--關門放狗
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )			--阻擋(關門了所以要擋)
				SetModeEx( Car01 , EM_SetModeType_Fight , true )				--可以砍車了
				SetModeEx( Car01 , EM_SetModeType_ShowRoleHead, true )			--秀頭像框
				SetModeEx( Car01 , EM_SetModeType_Mark, true )					--標記
				SetModeEx( Car02 , EM_SetModeType_Fight , true )
				SetModeEx( Car02 , EM_SetModeType_ShowRoleHead, true )
				SetModeEx( Car02 , EM_SetModeType_Mark, true )
				SetModeEx( Car03 , EM_SetModeType_Fight , true )
				SetModeEx( Car03 , EM_SetModeType_ShowRoleHead, true )
				SetModeEx( Car03 , EM_SetModeType_Mark, true )
				local PPL = SetSearchAllPlayer( Room )
				--local Num = 1
				--local Num_OP = 780839			--抓玩家的點
				for h = 1 , PPL do
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1
					 and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0
					 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
						--SetPosByFlag( ID , Num_OP , Num ) 			--抓玩家到同一個點
						--Num = Num + 1
						--if Num > GetMoveFlagCount(Num_OP) -1 then
							--Num = 1
						--end
						sysCastSpelllv ( ID , Boss , 497225 , 0 )		--玩家做仇恨
					end
				end
				EnterFight = 1
			end
--※ 小怪來囉 ※--
			if EnterFight == 1 then
				if GGCounter >= 15 then
					ScriptMessage( Boss , -1 , 2 , "[SC_105458_03]" , 1 )
					--我精銳的勇士們，快牽制住他們！
					for d = 1 , 1 do
						local flagNum1 = Rand(10)+14
						local flagNum2 = Rand(10)+14
						local GGP = CreateObjByFlag( 105861 , 780911 , flagNum1 , 1 )	--物理
						GG01[table.getn( GG01 )+1] = GGP
						AddToPartition( GGP , Room )
						BeginPlot( GGP , "sasa_105462_Run_easy" , 0 )
						--Say( GGP , "Yes,Sir!" )
						Sleep(1)
						local GGM = CreateObjByFlag( 105862 , 780911 , flagNum2 , 1 )	--法術
						GG02[table.getn( GG02 )+1] = GGM
						AddToPartition( GGM , Room )
						BeginPlot( GGM , "sasa_105463_Run_easy" , 0 )
						--Say( GGM , "Yes,Boss!" )
					end
					GGCounter = 0
				end
--※ 狂暴 ※--
				--if BerserkCounter >= 360 then
					--if IsBerserk == 0 then
						--AddBuff( Boss , 620042 , 0 , -1 )
						--Say( Boss , "Time ="..BerserkCounter )
						--ScriptMessage( Boss , -1 , 2 , "[SC_105458_05]" , 1 )
						--這些弱者是哪裡找來的！？我要換批新的練習對象！
						--IsBerserk = 1
					--end	
					--BerserkCounter = 0
				--end
			end
--※ 模式一 ※--
			if Mode == 1 then												----模式=1

			--elseif Mode == 2 then											----模式=2
			end
--※ 重置死亡 ※--
		else
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
				if BossIsDead ~= 1 then
					if CheckID(Boss) == true then
						DelObj(Boss)
					end
					if CheckID(Car01) == true then
						DelObj(Car01)
					end
					if CheckID(Car02) == true then
						DelObj(Car02)
					end
					if CheckID(Car03) == true then
						DelObj(Car03)
					end
					for e = 1 , table.getn(GG01) do
						if CheckID(GG01[e]) == true and GG01[e] ~= nil then
							DelObj(GG01[e])
						end
					end
					for f = 1 , table.getn(GG02) do
						if CheckID(GG02[f]) == true and GG02[f] ~= nil then
							DelObj(GG02[f])
						end
					end
					BeginPlot( OwnerID() , "sasa_105458_CancelBuff_easy" , 0 )		--清除BUFF
					sleep(50)
					SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )	--芝麻開門
					sleep(20)
					SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )	--維持開門狀態
					sleep(20)
					SetModeEx( Entrance , EM_SetModeType_Obstruct , false )		------阻擋(為了打開狀態所以不勾)
					Boss = CreateObjByFlag( 105858 , 780911 , 1 , 1 )
					AddToPartition( Boss , Room )
					BeginPlot( Boss , "sasa_105458_AI_easy" , 0 )
					Setplot( Boss , "dead" , "sasa_105458_Dead_easy" , 30 )
					
					Sleep(20)
					
					Car01 = CreateObjByFlag( 105863 , 780911 , 11 , 1 )
					SetModeEx( Car01 , EM_SetModeType_Move , false )			------不移動
					SetModeEx( Car01 , EM_SetModeType_Strikback , false )		------不反擊
					SetModeEx( Car01 , EM_SetModeType_Fight , false )			------不可砍殺
					SetModeEx( Car01 , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
					SetModeEx( Car01 , EM_SetModeType_Mark, false )				--標記
					AddToPartition( Car01 , Room )
					AddBuff( Car01 , 509476 , 0 , -1 )							--車子不回血
					Setplot( Car01 , "dead" , "sasa_105665_Broken01_easy" , 30 )
					WriteRoleValue( Boss , EM_RoleValue_register6 , Car01 )
					WriteRoleValue( Car01 , EM_RoleValue_register2 , Boss )
					
					Car02 = CreateObjByFlag( 105863 , 780911 , 12 , 1 )
					SetModeEx( Car02 , EM_SetModeType_Move , false )			------不移動
					SetModeEx( Car02 , EM_SetModeType_Strikback , false )		------不反擊
					SetModeEx( Car02 , EM_SetModeType_Fight , false )			------不可砍殺
					SetModeEx( Car02 , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
					SetModeEx( Car02 , EM_SetModeType_Mark, false )				--標記
					AddToPartition( Car02 , Room )
					AddBuff( Car02 , 509476 , 0 , -1 )							--車子不回血
					Setplot( Car02 , "dead" , "sasa_105665_Broken02_easy" , 30 )
					WriteRoleValue( Boss , EM_RoleValue_register7 , Car02 )
					WriteRoleValue( Car02 , EM_RoleValue_register2 , Boss )
					
					Car03 = CreateObjByFlag( 105863 , 780911 , 13 , 1 )
					SetModeEx( Car03 , EM_SetModeType_Move , false )			------不移動
					SetModeEx( Car03 , EM_SetModeType_Strikback , false )		------不反擊
					SetModeEx( Car03 , EM_SetModeType_Fight , false )			------不可砍殺
					SetModeEx( Car03 , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
					SetModeEx( Car03 , EM_SetModeType_Mark, false )				--標記
					AddToPartition( Car03 , Room )
					AddBuff( Car03 , 509476 , 0 , -1 )							--車子不回血
					Setplot( Car03 , "dead" , "sasa_105665_Broken03_easy" , 30 )
					WriteRoleValue( Boss , EM_RoleValue_register8 , Car03 )
					WriteRoleValue( Car03 , EM_RoleValue_register2 , Boss )

					WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
					WriteRoleValue( Boss , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
					GG01 = {}							--小怪變數重置歸零
					GG02 = {}							--小怪變數重置歸零
				elseif BossIsDead == 1 then									---Boss死了不重生
					BeginPlot( OwnerID() , "sasa_105458_CancelBuff_easy" , 0 )	--清除BUFF
					return
				end
				EnterFight = 0
				--BerserkCounter = 0
				--IsBerserk = 0
				GGCounter = 0
			end
		end
	end
end

--※ 大金剛AI ※--
function sasa_105458_AI_easy()
	AddBuff( OwnerID() , 509476 , 0 , -1 )		------不讓Boss離開戰鬥回血的buff
	AddBuff( OwnerID() , 509844 , 89 , -1 )		------玩家打BOSS-傷
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )			-----不移動
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local mode = 0							--判斷模式用
	local BoxCounter = 0					--11S.火藥桶
	local BallCounter = 0					--7S.燃炎爆彈
	local AirCounter = 0					--5S.岩氣
	local Box = 497218						--火藥桶表演
	local FireBall = 497215					--燃炎爆彈
	local FireCheck = 497302				--爆彈判斷
	local AirAct = 497223					--岩氣動作
	local Air = 497301						--岩氣
	local Angry = 497227					--怒氣爆裂
	local BallA
	local BossTarget
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			mode = ReadRoleValue( OwnerID() , EM_RoleValue_register5 )
--※ 模式一 ※--
			if mode == 1 then
				BoxCounter = BoxCounter + 1
				BallCounter = BallCounter + 1
				AirCounter = AirCounter + 1
--※ 火藥桶 ※--
				if BoxCounter >= 11 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_105458_02]" , 1 )
					--集中精神！試試看這個！
					BossTarget = OwnerID()
					CastSpellLv( OwnerID() , BossTarget , Box , 0 )	--打地出火藥桶
					Sleep(5)
					sasa_105458_RunBox_easy()
					BoxCounter = 0
--※ 丟爆彈 ※--
				elseif BallCounter >= 7 then
					local LuckyU = {}
					local PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort(OwnerID())
					for b = 1 , table.getn(PlayerInHate1) do
						local temp01 = PlayerInHate1[b]			 
						if ReadRoleValue( temp01 , EM_RoleValue_Voc ) ~= 0 					--GM排除
						 and ReadRoleValue( temp01 , EM_RoleValue_IsDead ) == 0				--死人排除
						 and ReadRoleValue( temp01 , EM_RoleValue_OrgID ) ~= 105863 then	--車子排除
							if ( CheckBuff( temp01 , 509876 ) == false ) then
								LuckyU[table.getn(LuckyU)+1] = temp01 			--找到的玩家放進TABLE
							end	
						end
					end
					--Say( OwnerID() , "Fire, "..table.getn(LuckyU) )
					for c = 1 , 1 do
						local Luckynum = Rand(table.getn(LuckyU))+1				--RAND到的數字
						if ( LuckyU[Luckynum] ~= nil )
						 and ( ReadRoleValue( LuckyU[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
							BossTarget = LuckyU[Luckynum]
							--Say( OwnerID() , GetName(BossTarget) )
							CastSpellLv( OwnerID() , BossTarget , FireBall , 4 )	--燃炎爆彈
							Sleep(20)
							SysCastSpellLv( OwnerID() , BossTarget , FireCheck , 0 )	--爆彈判斷
						end
						table.remove( LuckyU , Luckynum )
						sleep(1)
						--Say( OwnerID() , "OH-NO, "..table.getn(LuckyU) )
					end
					BallCounter = 0
--※ 踩地出岩氣 ※--
				elseif AirCounter >= 5 then
					BossTarget = OwnerID()
					CastSpellLv( OwnerID() , BossTarget , AirAct , 0 )
					BallA = CreateObjByFlag( 105389 , 780911 , 24 , 1 )
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
					WriteRoleValue( BallA , EM_RoleValue_Livetime, 3 )			--存在秒數
					CastSpellLv( BallA , BossTarget , Air , 1 )
					AirCounter = 0
--※ 車爆光 ※--
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_register6 ) == 4
				 and ReadRoleValue( OwnerID() , EM_RoleValue_register7 ) == 4 
				 and ReadRoleValue( OwnerID() , EM_RoleValue_register8 ) == 4 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_105458_07]" , 1 )
					--真是浪費了我的[105665]…我要毀了這些不知好歹的傢伙！
					Sleep(30)
					BossTarget = OwnerID()
					CastSpellLv( OwnerID() , BossTarget , Angry , 24 )
				end
			end
		end
	end
end

--※ 物理小怪AI ※--
function sasa_105462_Run_easy()
	while 1 do
		Sleep(10)
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local PhyTarget
		while 1 do
		sleep(10)
			local Car = {}
			Car = SearchRangeNPC ( OwnerID() , 100 )
			local CarBox = table.getn(Car)
			for i = 1 , CarBox do
				if ReadRoleValue( Car[i] , EM_RoleValue_OrgID ) == 105863 then
					--Say( OwnerID() , "GO~~~" )
					SetAttack( OwnerID() , Car[i] )
					PhyTarget = Car[i]
					CastSpellLV( OwnerID() , PhyTarget , 497222 , 3 )		--衝擊
				end
			end
			Sleep(50)
		end
	end
end

--※ 法術小怪AI ※--
function sasa_105463_Run_easy()
	while 1 do
		Sleep(10)
		local MagCounter = 0
		local MagTarget
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
		sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--攻擊目標
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				MagCounter = MagCounter + 1
				if MagCounter >= 2 then
					--Say( OwnerID() , "BON~~~" )
					MagTarget = OwnerID()
					if 	( MagTarget ~= nil) 
					 and ( ReadRoleValue( MagTarget , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLV( OwnerID() , MagTarget , 497221 , 1 )		--光裂
						Sleep(10)
					end
					MagCounter = 0
				end
			end
		end
	end
end

--※ 火藥桶滾滾 ※--
function sasa_105458_RunBox_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	for a = 1 , 3 do
		local BoxFlag = { 4 , 5 , 6 }
		local FlagNum = Rand(3)+1
		local BoxBoy = CreateObjByFlag( 105860 , 780911 , BoxFlag[FlagNum] , 1 )
		SetModeEx( BoxBoy , EM_SetModeType_Strikback , false )					--不反擊
		SetModeEx( BoxBoy , EM_SetModeType_Move , true )						--移動
		AddToPartition( BoxBoy , Room )
		AddBuff( BoxBoy , 509476 , 0 , -1 )		------不讓火藥桶回血的buff
		BeginPlot( BoxBoy , "sasa_105461_Kill_easy" , 0 )
		SetPlot( BoxBoy , "collision" , "sasa_105461_GO_easy" , 10 )
		Setplot( BoxBoy , "dead" , "sasa_105461_BoxDead_easy" , 30 )
		MoveToFlagEnabled ( BoxBoy ,  false )
		SetModeEx( BoxBoy , EM_SetModeType_Searchenemy , false )				--不索敵
		--Say( OwnerID() , "yes!" )
		Sleep(20)
	end
end

--※ 火藥桶炸掉 ※--
function sasa_105461_Kill_easy()
	local MoveFlag = Rand(3)+7
	DW_MoveToFlag( OwnerID() , 780911 , MoveFlag , 0 )					--( who , flag , No. , Range )
	--local KillCounter = 0
	--while 1 do
		--Sleep(10)
		--KillCounter = KillCounter + 1
		--if KillCounter == 10 then
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_DEATH_DOWN )
			SysCastSpellLV( OwnerID() , OwnerID() , 497226 , 1 )		--爆破桶
			Sleep(20)
			delobj ( OwnerID() )
		--end
	--end
end

--※ 火藥桶碰撞 ※--
function sasa_105461_GO_easy()
	SysCastSpellLV( TargetID() , OwnerID() , 496259 , 4 )			--強力撞擊
	sleep(1)
end

--※ 火藥桶炸完掉火藥 ※--
function sasa_105461_BoxDead_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Bomb
	Bomb = star_CreateObj_NoAdd( OwnerID() , 118460 , 0 , 0 , 0 , Room , 0) 	--掉火藥
	SetModeEx( Bomb , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
	SetModeEx( Bomb , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
	SetModeEx( Bomb , EM_SetModeType_Searchenemy, false )   	--索敵
	SetModeEx( Bomb , EM_SetModeType_Fight, false ) 			--砍殺
	SetModeEx( Bomb , EM_SetModeType_Move, false )				--移動
	SetModeEx( Bomb , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( Bomb , EM_SetModeType_NotShowHPMP , false )		--不show血條
	SetModeEx( Bomb , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( Bomb , EM_SetModeType_Show, true )				--秀出
	AddToPartition( Bomb , Room )
	Setplot( Bomb , "touch" , "sasa_118460_AI_easy" , 30 )
	WriteRoleValue( Bomb , EM_RoleValue_Livetime , 10 )			--存在秒數
end

--※ 點火藥 ※--
function sasa_118460_AI_easy()
	BeginPlot( TargetID() , "sasa_118460_AI2_easy" , 0)
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1 , OwnerID() )
end

--※ 刪火藥 ※--
function sasa_118460_AI2_easy()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local BombBuff = 509271				--殘餘火藥
	if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 0 then
		AddBuff( Player , BombBuff , 0 , 20 )
	end
	Sleep(20)
	delobj ( OwnerID() )
end

--※ 大金剛死了 ※--
function sasa_105458_Dead_easy()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_105458_04]" , 1 )
	--[105515]是不會親易放過你們的！
	--史凱林‧薩爾多是不會親易放過你們的！
	--BeginPlot( OwnerID(), "ic_ha_de_139_01" , 0 )							--防駭客
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		--讀出控制器GID
	WriteRoleValue( counter , EM_RoleValue_register1 , 1 )					--告訴計時器Boss死了
	local Treasure = CreateObjByFlag( 105859 , 780911 , 10 , 1 )			--寶箱
	SetModeEx( Treasure , EM_SetModeType_Searchenemy, false)   				--索敵
	SetModeEx( Treasure , EM_SetModeType_Fight, false) 						--砍殺
	SetModeEx( Treasure , EM_SetModeType_Move, false)						--移動
	SetModeEx( Treasure , EM_SetModeType_Strikback, false)					--反擊
	AddToPartition( Treasure , Room )
	BeginPlot( Treasure , "sasa_105460_Treasure_easy", 0 )
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )			--開門
	SetIdleMotion( Exit , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetIdleMotion( Exit , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )				--維持開門狀態
	SetModeEx( Entrance , EM_SetModeType_Obstruct , false )					--阻擋勾掉
	SetModeEx( Exit , EM_SetModeType_Obstruct , false )
	DelObj( Entrance )
	DelObj( Exit )
end

--※ 爆車 ※--
function sasa_105665_Broken01_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---讀出Boss GID
	WriteRoleValue( Boss , EM_RoleValue_register6 , 4 )						---告訴Boss Car01爆了
end

function sasa_105665_Broken02_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---讀出Boss GID
	WriteRoleValue( Boss , EM_RoleValue_register7 , 4 )						---告訴Boss Car02爆了
end

function sasa_105665_Broken03_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---讀出Boss GID
	WriteRoleValue( Boss , EM_RoleValue_register8 , 4 )						---告訴Boss Car03爆了
end

--※ 寶箱 ※--
function sasa_105460_Treasure_easy()
	SetPlot( OwnerID() ,"touch", "sasa_Treasure_openeasy" ,40 )
end

function sasa_Treasure_openeasy()
	SetPlot( TargetID() ,"touch", "" ,0 )
	Sleep(20)
	KillID( OwnerID() , TargetID() )
end


--※ 爆彈火殘留 ※--
--function sasa_105499_Fire()										--爆彈判斷
	--local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--local xx = ReadRoleValue ( TargetID() , EM_RoleValue_X )
	--local yy = ReadRoleValue ( TargetID() , EM_RoleValue_y )
	--local zz = ReadRoleValue ( TargetID() , EM_RoleValue_z )
	--local Fire = CreateObj ( 105499 , xx , yy , zz , 0 , 1 )
	--SetModeEx( Fire , EM_SetModeType_SearchenemyIgnore , true )	---物件不會被搜尋
	--SetModeEx( Fire , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	--SetModeEx( Fire , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
	--SetModeEx( Fire , EM_SetModeType_Searchenemy , false )   	--索敵
	--SetModeEx( Fire , EM_SetModeType_Mark , false )				--標記
	--SetModeEx( Fire , EM_SetModeType_Fight , false ) 			--砍殺
	--SetModeEx( Fire , EM_SetModeType_Move , false )				--移動
	--SetModeEx( Fire , EM_SetModeType_ShowRoleHead , true )
	--SetModeEx( Fire , EM_SetModeType_Strikback , false )		--反擊
	--SetModeEx( Fire , EM_SetModeType_Show , true )				--秀出
	--AddToPartition( Fire , Room )
	--WriteRoleValue( Fire , EM_RoleValue_Livetime , 15 )			--存在秒數
	--beginplot( Fire , "sasa_105499_Fire2", 0 )
--end

--function sasa_105499_Fire2()                      				--爆彈判斷2
	--AddBuff( OwnerID() , 509265 , 0 , -1 )							--餘焰
	--while true do
	--sleep(10)
		--sysCastSpellLv( OwnerID() , OwnerID() , 497216 , 0 )	--餘火
	--end	
--end

--※ 防車被攻擊用 ※--餘火、岩氣
function sasa_105863_npccheck()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 105863 then
		return false
	else
		return true
	end
end

--※ 車子 ※--
function sasa_105863_Tank01()					--攻城車模版產生劇情
	AddBuff( OwnerID() , 509268 , 9 , -1 )		--攻擊NPC威力UP
	AddBuff( OwnerID() , 509269 , 49 , -1 )		--被NPC攻擊威力UP
end

function sasa_105863_Tank02( Seat , UpDown )	--攻城車主要script
	local SkillID = { 497228 , 497220 }			--火藥炮、碎裂炮火
	local SkillLv = { 0 , 0 }
	local Pos									--讀取玩家BUFF位置
	local Time									--殘餘火藥剩下的時間
	if UpDown == 1 then							--上車
		--Say( OwnerID() , "In" )
		SetFlag( OwnerID() , 545041 , 1 )		--給重要物品旗標
		AddBuff( OwnerID() , 509876 , 0 , -1 )	--上車BOSS不打
		Pos = Lua_BuffPosSearch( OwnerID() , 509271 )
		Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )
		AddBuff( TargetID() , 509271 , 0 , Time )
		WriteRoleValue( TargetID() , EM_RoleValue_register1 , OwnerID() )
		SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
		SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
	elseif UpDown == 0 then						--下車
		--Say( OwnerID() , "Out" )
		SetFlag( OwnerID() , 545041 , 0 )		--取消重要物品旗標
		CancelBuff( OwnerID() , 509876 )		--取消上車BOSS不打
		WriteRoleValue( TargetID() , EM_RoleValue_register1 , 0 )
		DelExSkill( OwnerID() , TargetID() , SkillID[1] )
		DelExSkill( OwnerID() , TargetID() , SkillID[2] )
	end
end

--※ 彈藥檢查 ※--
function sasa_105863_Buffcheck()
	local First = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	if CheckBuff( First , 509271 ) == false then
		ScriptMessage( First , First , 1 , "[SC_105458_06]" , 2 )
		--殘餘火藥不足
		return false
	else
		return true
	end
end

--※ 清BUFF ※--
function sasa_105458_CancelBuff_easy()												--刪除BUFF用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local YesPlayer = SetSearchAllPlayer(RoomID)								--找區域所有玩家
	local BuffPlayer = {}
	for g = 1 , YesPlayer do
		BuffPlayer[g] = GetSearchResult() 										--接暫存值
		if CheckID( BuffPlayer[g] ) == true	 									--檢查玩家是不是還在；檢查是否死亡
		 and ReadRoleValue( BuffPlayer[g] , EM_RoleValue_IsDead ) == 0			--EM_RoleValue_IsDead   =1  =死亡
		 and ReadRoleValue( BuffPlayer[g] , EM_RoleValue_IsPlayer ) == 1 then	--EM_RoleValue_IsPlayer =1  =玩家
			if CheckBuff( BuffPlayer[g] , 509271 ) == true						--殘餘火藥
			 or CheckBuff( BuffPlayer[g] , 509264 ) == true then				--烈焰
				CancelBuff( BuffPlayer[g] , 509271 )								--要刪除的BUFF
				CancelBuff( BuffPlayer[g] , 509264 )
			end
		end
	end
end