--旗標     	781015
--中控器   	106101
--150_Boss	107462
--150_小怪	107463
--150_表演小怪 	107364
--門    		102642 
--裂縫1       	107464       6
--裂縫2      	107467       6
--宓倫多的祕寶    107465
--7~10 左邊A組		15A洞
--11~14  右邊B組  	16B洞
------------------------
--技能(Boss)
--499874  	全場AE     
--499765	傷害+恐懼 
--499766	傷害+Dot
--499767 	傷害+緩速
--技能(小怪)
--499875  	50AE
--499876  	小傷害AE
--499855 	吞噬強化
-----------------------------
--Ctrl
--PID   
--1
--2         0        1
--3        hole2	
--7        boss	
--8        doorchick2
--9        doorchick1
--10      monstershow
----------------------------
--Boss
--PID     ctrl
--1
--2
--3
---------------------------
--hole2
--PID     ctrl
---------------------------
--monster
--PID     ctrl
--1         boss
--------------------------
--monstershowai
--PID     ctrl




function bico_Z24ez_Boss4_ctrl ()
	local Ctrl = OwnerID()					                      --控制器
	local CombatBegin = 0						      --開戰旗標
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local opendoor = 0
	local monster = CreateObjByFlag(107463,781015,6,1)                                  ---小怪     5
	local Monster_Table = {}
	local Boss = CreateObjByFlag(107462,781015,2,1)                                         ---BOSS   2
	local hole2 = CreateObjByFlag(107467,781015,6,1)    
	local Hp  = ReadRoleValue(Boss,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(Boss,EM_RoleValue_MaxHP)
	local Hp1  = (Hp / maxhp) *100 
	local Treasure = CreateObjByFlag( 107465 , 781015 , 1 , 1 )	--裂縫破裂產生寶箱

 	AddToPartition(Boss,RoomID)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)                                                       --  ctrl        PID   ctrl
	WriteRoleValue(hole2,EM_RoleValue_PID,Ctrl)                                                     --  hole2   PID   ctrl
	WriteRoleValue(ctrl,EM_RoleValue_Register2,0)                                                   --  crtl        r2     0
	WriteRoleValue(Ctrl , EM_RoleValue_Register1 , Boss )
	local hole1 = CreateObjByFlag(107464,781015,6,1)     --異界裂縫   6
	SetModeEx(hole1,EM_SetModeType_Mark, false)
	SetModeEx(hole1,EM_SetModeType_HideName, false)
	SetModeEx(hole1,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(hole1,EM_SetModeType_Strikback, false)
	SetModeEx(hole1,EM_SetModeType_Move, false)
	SetModeEx(hole1,EM_SetModeType_Fight, false)
	SetModeEx(hole1,EM_SetModeType_Searchenemy, false)
	SetModeEx(hole1,EM_SetModeType_Obstruct, false)
	AddToPartition( hole1, RoomID)
	WriteRoleValue( Boss , EM_RoleValue_Register10 , hole1 )		
	local hole2 = CreateObjByFlag(107467,781015,6,1)                              --可砍殺的異界裂縫   6 
	local doorchick1 = CreateObjByFlag(102642,781015,3,1)                    --後門     3
	SetModeEx(doorchick1,EM_SetModeType_Mark, false)
	SetModeEx(doorchick1,EM_SetModeType_HideName, false)
	SetModeEx(doorchick1,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick1,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick1,EM_SetModeType_Move, false)
	SetModeEx(doorchick1,EM_SetModeType_Fight, false)
	SetModeEx(doorchick1,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick1,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick1, RoomID)
	WriteRoleValue(ctrl,EM_RoleValue_Register9,doorchick1)              ---- ctrl r9 後門
	local doorchick2 = CreateObjByFlag(102642,781015,4,1)              ----前門        4
	local PlayerNum = SetSearchAllPlayer( ReadRoleValue( ctrl , EM_RoleValue_RoomID ) )	--取副本內同層玩家所有資料
	local PlayerID = {}

	while  1 do
		sleep(10)
		if ReadRoleValue(hole2,EM_RoleValue_IsDead)== 1 then   --裂縫被打破 會產生寶箱掉寶
				LockHP(boss,0,"")
				sleep(10)
				KillID(boss , boss )
				DelObj(boss)
				DelObj(doorchick1)   --刪除後門
				DelObj(doorchick2)   --刪除前門
				Boss = ReadRoleValue(Ctrl , EM_RoleValue_Register1)
				ScriptMessage( Boss, -1, 3,"[SC_106900_11]" ,0 )
				Treasure = CreateObjByFlag( 107465 , 781015 , 1 , 1 )
				SetModeEx( Treasure , EM_SetModeType_Searchenemy, false)   	    --索敵
				SetModeEx( Treasure , EM_SetModeType_Fight, false) 		    --砍殺
				SetModeEx( Treasure , EM_SetModeType_Move, false)		    --移動
				SetModeEx( Treasure , EM_SetModeType_Strikback, false)	    --反擊
				SetModeEx(Treasure,EM_SetModeType_NotShowHPMP,true)           --不顯示血條
				AddToPartition( Treasure , RoomID )
				local player = SetSearchAllPlayer(RoomID)      --讀取此層zone所有玩家數量
				local playername                               --先宣告要取出掃zone後的玩家
				for i = 1 , player do                          --幾個玩家執行幾次for迴圈，判斷所有玩家
				playername = GetSearchResult()             --取出掃zone後取得的玩家GID
				if CheckAcceptQuest( playername, 425684 ) == true and   --判斷玩家是否有此任務
				CheckCompleteQuest( playername, 425684 ) ~= true and    --擠查玩家是否完成任務
				CheckFlag( playername, 547281 ) ~= true then            --判斷玩家是否有完成此任務的旗標
				SetFlag(playername,547281,1)                        --讓玩家完成任務
				end
				end		
				BeginPlot( Treasure , "Z24ez_107465_Treasure", 0 )
				return
		end
		if HateListCount( boss ) ~= 0 then  --仇恨表內有人
			if CombatBegin == 0 then   
				BeginPlot(Boss , "bico_Z24ez_Boss4_ai" , 0)
				if opendoor == 0 then
					doorchick2 = CreateObjByFlag(102642,781015,4,1)
					SetModeEx(doorchick2,EM_SetModeType_Mark, false)
					SetModeEx(doorchick2,EM_SetModeType_HideName, false)
					SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
					SetModeEx(doorchick2,EM_SetModeType_Move, false)
					SetModeEx(doorchick2,EM_SetModeType_Fight, false)
					SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
					SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
					AddToPartition( doorchick2, RoomID)
					WriteRoleValue(ctrl,EM_RoleValue_Register8,doorchick2)     ---ctrl r8 前門 
				opendoor =1
				end
			end
			if Hp1 >= 50 then
				if ReadRoleValue(ctrl,EM_RoleValue_register7) == 1 then
					local player = {}
					player = SearchRangePlayer( Boss, 500 )
						if CheckBuff(Boss,623551) == true then
							for i = 0 , table.getn(player) do
								if CheckBuff( player[i], 623545 ) == true then
--								DebugMsg(0,0,"player="..i)
								CancelBuff(player[i], 623545 )
								end
							end
						end
				end
			end
			if  	ReadRoleValue(ctrl,EM_RoleValue_register2) == 1 then 	-----BOSS第一次死掉產生可被攻擊的裂縫		
				hole2 = CreateObjByFlag(107467,781015,6,1)
				SetModeEx( hole2,EM_SetModeType_Mark, true)		--可標記	
				SetModeEx( hole2,EM_SetModeType_HideName, false)		--不隱藏名字
				SetModeEx( hole2,EM_SetModeType_NotShowHPMP, false)	--秀血條
	--			SetModeEx( hole2, EM_SetModeType_ShowRoleHead, true )	
				SetModeEx( hole2,EM_SetModeType_Strikback, false)		--不能反擊
				SetModeEx( hole2,EM_SetModeType_Move, false)		--不能移動
				SetModeEx( hole2,EM_SetModeType_Fight, true)		--可被砍殺
				SetModeEx( hole2,EM_SetModeType_Searchenemy, false)	--不索敵
				SetModeEx( hole2,EM_SetModeType_Obstruct, false)		--不阻擋
				AddToPartition( hole2, RoomID)
				AddBuff( hole2 , 623802 , 0 , -1 )				--不回血
				KS_ScriptMessage("[SC_106900_05]")    --[這……有點不對勁……]
				WriteRoleValue(ctrl,EM_RoleValue_Register6,hole2)  
				local holeA = ReadRoleValue ( Boss , EM_RoleValue_Register1 )
				local holeB = ReadRoleValue ( Boss , EM_RoleValue_Register2 )
				local MonsterA = ReadRoleValue ( Boss , EM_RoleValue_Register3 )
				local MonsterB = ReadRoleValue ( Boss , EM_RoleValue_Register4 )
				DelObj(MonsterA)
				DelObj(MonsterB)
				DelObj(holeA)
				DelObj(holeB)
				DelObj(hole1)			
				WriteRoleValue(ctrl,EM_RoleValue_Register2,0)
				WriteRoleValue(hole2,EM_RoleValue_PID,ctrl)
				BeginPlot(hole2,"bico_Z24ez_Hole2AI",0)	
				if (checkid(hole2)==true and ReadRoleValue(hole2,EM_RoleValue_IsDead)== 1) or checkid(hole2)==false then
				ClearHateList(boss,-1)
				end							
			end
		CombatBegin = 1      --戰鬥開始		
		end
		if HateListCount( boss ) == 0 then  --仇恨表內沒人  
			if ReadRoleValue(boss,EM_RoleValue_IsDead)== 0 then		--滅團狀況下
				if opendoor == 1 then
				delobj(doorchick2)
				opendoor = 0
				end
				if CombatBegin == 1 then
					Monster_Table = SearchRangeNPC(ctrl,500)
						for i = 1 , table.getn(Monster_Table) do
							if ReadRoleValue(Monster_Table[i],EM_RoleValue_OrgID) == 107463  then
							DelObj ( Monster_Table[i] )
							end
						end
					holeA = ReadRoleValue ( Boss , EM_RoleValue_Register1 )
					holeB = ReadRoleValue ( Boss , EM_RoleValue_Register2 )
					MonsterA = ReadRoleValue ( Boss , EM_RoleValue_Register3 )
					MonsterB = ReadRoleValue ( Boss , EM_RoleValue_Register4 )
					DelObj(MonsterA)
					DelObj(MonsterB)
					DelObj(hole1)
					DelObj(holeA)
					DelObj(holeB)
					P2Pick = 0
					hole1 = CreateObjByFlag(107464,781015,6,1)     --異界裂縫   6
					SetModeEx(hole1,EM_SetModeType_Mark, false)
					SetModeEx(hole1,EM_SetModeType_HideName, false)
					SetModeEx(hole1,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(hole1,EM_SetModeType_Strikback, false)
					SetModeEx(hole1,EM_SetModeType_Move, false)
					SetModeEx(hole1,EM_SetModeType_Fight, false)
					SetModeEx(hole1,EM_SetModeType_Searchenemy, false)
					SetModeEx(hole1,EM_SetModeType_Obstruct, false)
					AddToPartition( hole1, RoomID)								
					DelObj(hole2)
					local monster2 = ReadRoleValue(Ctrl,EM_RoleValue_Register10)                     ---表演小怪
					DelObj(monster2)
					delobj(boss)
					KS_ScriptMessage("[SC_106900_10]")    --[哈哈哈哈哈～真是一群弱小的冒險者！！！]
					sleep(50)
					Boss=CreateObjByFlag(107462,781015,2,1)
					AddToPartition(Boss,RoomID)
					WriteRoleValue( Boss , EM_RoleValue_Register10 , hole1 )	
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					WriteRoleValue(Ctrl , EM_RoleValue_Register1 , Boss )
				monstertime = 0
				CombatBegin = 0 --戰鬥結束
				end
			end
			if ReadRoleValue(boss,EM_RoleValue_IsDead)== 1  then		--Boss死亡	 
				for	i=1 , PlayerNum , 1	do
				PlayerID[i] = GetSearchResult()		
					if CheckAcceptQuest( PlayerID[i] , 425684 ) == true and   --判斷玩家是否有此任務
					CheckCompleteQuest( PlayerID[i] , 425684 ) ~= true and
					CheckFlag( PlayerID[i] , 547281 ) ~= true then		
					SetScriptFlag( PlayerID[i] , 547281 , 1 )	
					end
				end			
				DelObj(doorchick1)----刪除後門
				DelObj(doorchick2)----刪除前門
				Delobj(hole1)	---刪除裂縫1
				if CombatBegin == 0 then
				KS_ScriptMessage("[SC_106900_08]")    --[冒險者……我的女兒就交給你們了……]
				return
				end
				if CombatBegin == 1 then
				Monster_Table = SearchRangeNPC(ctrl,500)
					for i = 1 , table.getn(Monster_Table) do
						if ReadRoleValue(Monster_Table[i],EM_RoleValue_OrgID) == 107463  then
						DelObj ( Monster_Table[i] )
						end
					end
				monstertime = 0
				CombatBegin = 0 --戰鬥結束
				KS_ScriptMessage("[SC_106900_08]")    --[冒險者……我的女兒就交給你們了……]
				return
				end
			end
		end
	end
end

function bico_Z24ez_Boss4_ai ()  --BossAI****************************
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ctrl  = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss  = OwnerID()
	local maxhp = ReadRoleValue(Boss,EM_RoleValue_MaxHP)
	local CombatBegin = 0
	local skilltime  = 0
	local Hp2  = ReadRoleValue(Boss,EM_RoleValue_HP)
	local Hp3  = (hp2 / maxhp) *100
	local rand = DW_rand(3)
	local monster = 0
	local P2Pick = 0
	local monstershow = CreateObjByFlag(107364,781015,6,1)
--	local hole1 = ReadRoleValue(Boss , EM_RoleValue_Register10 )
	LockHP( Boss,1,"" )	
	KS_ScriptMessage("[SC_106900_01]")    --[生命的意義是抵不過時間的無情！！！迎戰吧！冒險者！]	
	while 1 do
		sleep(10)
		skilltime=skilltime+1	
			if P2Pick ~= 1 then
			if skilltime % 15 == 0 then 	--每15秒產生一隻吞噬者
				KS_ScriptMessage("[SC_106900_04]")    --[讓吞噬者吞噬你們的時間與生命吧！]
				monster = CreateObjByFlag(107463,781015,6,1)     --小怪  6
				AddToPartition ( monster , RoomID ) -----把物件加入場景內
				SetModeEx(monster , EM_SetModeType_Searchenemy, false)   --不索敵
				AddBuff( monster , 509476 , 0 , 0 )				--不回血
				WriteRoleValue(monster,EM_RoleValue_register1,Boss)
				BeginPlot(monster,"bico_zone24ez_MonsterAi",0)				
			end
			end
	--		if skilltime == 480 then
	--		AddBuff(boss,623667,0,-1)
	--		end
		local NowHp = ReadRoleValue(Boss,EM_RoleValue_HP)
		local Hp1 = (NowHp / maxhp) *100	
			if Hp1 >= 50 and P2Pick == 0 then                       			  --50%以前
				if skilltime % 6 ==0 then                              --6秒一次rand3招
				KS_ScriptMessage("[SC_106900_02]")       --[無知的冒險者！用身體來體會我的槍術吧！]
					while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do --檢查還有沒有在施法
					sleep(2)
					end
					local PlayerID = CL_RandHata_TargetTable( 0 , 3 ) ---Value_TanK是否排坦0=不排 1=排    Play_Num最低需求玩家數量，不達此數量則直接丟出現有數量
					if PlayerID == nil or PlayerID == 0 then
					PlayerID = {}
					end
					local Target_Num = table.getn( PlayerID )
					local rand = DW_rand(3)
						for i = 1,Target_Num do
							if rand == 1 then
							SyscastSpellLv( boss,PlayerID[i] ,499765,0 )
							sleep(10)
							elseif rand ==  2 then
							SysCastSpellLv( boss, PlayerID[i],499766,0 )
							sleep(10)
							elseif rand ==  3 then
							SysCastSpellLv( boss,PlayerID[i],499767,0 )
							sleep(10)
							end
						end
				elseif	skilltime % 13 ==0 then                   		     --13秒施放全場AE
					KS_ScriptMessage("[SC_106900_03]")    --[喔拉～喔拉！你們都在這躺下吧！]
					while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
					sleep(2)
					end
				SysCastSpellLv(boss,boss,499874,0)
				end
			else
					if ReadRoleValue(boss,EM_RoleValue_HP)== 1 then
					SetModeEx(boss,EM_SetModeType_Strikback, false)
					SetModeEx(boss,EM_SetModeType_Move, false)
					SetModeEx(boss,EM_SetModeType_Fight, false)
					SetModeEx(boss,EM_SetModeType_Searchenemy, false)
					SyscastSpellLv(boss,boss,499774,0)
					AddBuff(boss,623544,0,0)							
					PlayMotion(Boss,ruFUSION_ACTORSTATE_DEAD)		
	 				WriteRoleValue(ctrl,EM_RoleValue_Register7,boss)
	 				WriteRoleValue(ctrl,EM_RoleValue_register2,1)
	 				return
	 				end
				AddBuff(Boss,623359,0,-1)
				if skilltime % 6 ==0 then                               	 --6秒一次rand3招
					while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
					sleep(2)
					end
					local PlayerID = CL_RandHata_TargetTable( 0 , 3 ) ---Value_TanK是否排坦0=不排 1=排    Play_Num最低需求玩家數量，不達此數量則直接丟出現有數量
					if PlayerID == nil or PlayerID == 0 then
					PlayerID = {}
					end
					local Target_Num = table.getn( PlayerID )
					local rand = DW_rand(3)
						for i = 1,Target_Num do
							if rand == 1 then
							SyscastSpellLv( boss,PlayerID[i] ,499767,5 )
							sleep(10)
							elseif rand ==  2 then
							SysCastSpellLv( boss, PlayerID[i],499766,5 )
					--		sleep(10)
					--		elseif rand ==  3 then
					--		SysCastSpellLv( boss,PlayerID[i],499765,5 )
							sleep(10)
							end
						end
				elseif	skilltime % 13 ==0 then                   		     --13秒施放全場AE
					while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
					sleep(2)
					end
				SysCastSpellLv(boss,boss,499874,0)
				end
				if P2Pick == 0 then
				local hole1 = ReadRoleValue(Boss , EM_RoleValue_Register10 )
--				say( hole1 , "hole="..hole1 )

				CallPlot( hole1 ,"Z24ez_hole1_P2AI" , 0 )
				local holeA = CreateObjByFlag( 107440 , 781015 , 15 , 1 )			--A組裂縫
					SetModeEx(holeA,EM_SetModeType_Mark, false)
					SetModeEx(holeA,EM_SetModeType_HideName, false)
					SetModeEx(holeA,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(holeA,EM_SetModeType_Strikback, false)
					SetModeEx(holeA,EM_SetModeType_Move, false)
					SetModeEx(holeA,EM_SetModeType_Fight, false)
					SetModeEx(holeA,EM_SetModeType_Searchenemy, false)
					SetModeEx(holeA,EM_SetModeType_Obstruct, false)
					AddToPartition( holeA, RoomID)
					WriteRoleValue( Boss , EM_RoleValue_Register1 , holeA )
					BeginPlot( holeA , "Z24ez_HoleA_AI" , 10 )
				local holeB =CreateObjByFlag( 107440 , 781015 , 16 , 1 )			--B組裂縫
					SetModeEx(holeB,EM_SetModeType_Mark, false)
					SetModeEx(holeB,EM_SetModeType_HideName, false)
					SetModeEx(holeB,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(holeB,EM_SetModeType_Strikback, false)
					SetModeEx(holeB,EM_SetModeType_Move, false)
					SetModeEx(holeB,EM_SetModeType_Fight, false)
					SetModeEx(holeB,EM_SetModeType_Searchenemy, false)
					SetModeEx(holeB,EM_SetModeType_Obstruct, false)
					AddToPartition( holeB, RoomID)
					WriteRoleValue( Boss , EM_RoleValue_Register2 , holeB)
					BeginPlot( holeB , "Z24ez_HoleB_AI" , 10 )
				local MonsterA = CreateObjByFlag( 107439 , 781015 , 7 , 1 )		--A小怪起始點7號
					SetModeEx(MonsterA,EM_SetModeType_Show, false)
					SetModeEx(MonsterA,EM_SetModeType_Mark, false)
					SetModeEx(MonsterA,EM_SetModeType_HideName, false)
					SetModeEx(MonsterA,EM_SetModeType_NotShowHPMP, true)
					SetModeEx(MonsterA,EM_SetModeType_Strikback, false)
					SetModeEx(MonsterA,EM_SetModeType_Move, true)
					SetModeEx(MonsterA,EM_SetModeType_Fight, false)
					SetModeEx(MonsterA,EM_SetModeType_Searchenemy, false)
					SetModeEx(MonsterA,EM_SetModeType_Obstruct, false)
					SetModeEx(MonsterA,EM_SetModeType_Gravity,FALSE)
					SetModeEx(MonsterA,EM_SetModeType_AlignToSurface,FALSE)					
					AddToPartition( MonsterA, RoomID)
					MoveToFlagEnabled( MonsterA , false )
					WriteRoleValue( Boss , EM_RoleValue_Register3 , MonsterA )
					WriteRoleValue( holeA , EM_RoleValue_PID , MonsterA )
					BeginPlot( MonsterA , "Z24ez_monsterA_AI" , 0 )
				local MonsterB = CreateObjByFlag( 107438 , 781015 , 14 , 1 )		--B小怪起始點14號
					SetModeEx(MonsterB,EM_SetModeType_Show, false)
					SetModeEx(MonsterB,EM_SetModeType_Mark, false)
					SetModeEx(MonsterB,EM_SetModeType_HideName, false)
					SetModeEx(MonsterB,EM_SetModeType_NotShowHPMP, true)
					SetModeEx(MonsterB,EM_SetModeType_Strikback, false)
					SetModeEx(MonsterB,EM_SetModeType_Move, true)
					SetModeEx(MonsterB,EM_SetModeType_Fight, false)
					SetModeEx(MonsterB,EM_SetModeType_Searchenemy, false)
					SetModeEx(MonsterB,EM_SetModeType_Obstruct, false)
					SetModeEx(MonsterB,EM_SetModeType_Gravity,FALSE)
					SetModeEx(MonsterB,EM_SetModeType_AlignToSurface,FALSE)
					AddToPartition( MonsterB, RoomID)
					MoveToFlagEnabled( MonsterB , false )
					WriteRoleValue( Boss , EM_RoleValue_Register4 , MonsterB )
					WriteRoleValue( holeB , EM_RoleValue_PID , MonsterB )
					BeginPlot( MonsterB , "Z24ez_monsterB_AI" , 0 )
				P2Pick = 1
				end				
			end
	end
end

function bico_zone24ez_MonsterAi()  --小怪Ai***********************
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local hate_table1 = HateListCount( Boss )
	local hate_table2 = HateListCount(OwnerID())
	local TempGID = 0
	local rand1 = rand(hate_table1)
		SysCastSpellLv(OwnerID(),OwnerID(),499876,0)		--時空炸裂
		SysCastSpellLv(OwnerID(),OwnerID(),499801,0)		--時光流逝
		TempGID = HateListInfo( Boss,rand1,EM_HateListInfoType_GItemID)    --Boss仇恨表內隨意一個玩家
		while 1 do
			sleep(10)
			if ReadRoleValue( TempGID , EM_RoleValue_IsDead)==1 or ReadRoleValue( TempGID , EM_RoleValue_IsPlayer )~=1 then --玩家死亡或者選擇到寵物
				hate_table1 = HateListCount( Boss )
				TempGID = 0
				rand1 = rand(hate_table1)	
				TempGID = HateListInfo( Boss,rand1,EM_HateListInfoType_GItemID)				
			elseif ReadRoleValue( TempGID , EM_RoleValue_IsDead)==0 then  --活
				SetAttack( OwnerID(),TempGID )
				SysCastSpellLv( OwnerID(),TempGID,499800,0 )
				SysCastSpellLv(TempGID,OwnerID(),499799,0)
			end
		end	
end

function bico_Z24ezmonsterdie()
	CancelBuff(OwnerID(), 623519)
end

function bico_Z24ez_Hole2AI()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = ReadRoleValue(ctrl,EM_RoleValue_PID)
	local doorchick1 = ReadRoleValue(ctrl,EM_RoleValue_Register9)
	local doorchick2 = ReadRoleValue(ctrl,EM_RoleValue_Register8)
	local monster2 = CreateObjByFlag(107364,781015,6,1)
	local holetime = 0
	local hole2 = OwnerID()
	hole2 = ReadRoleValue(ctrl,EM_RoleValue_Register6)  
	local monstercheck = 0
	while 1  do
 		sleep(10)
		holetime = holetime + 1 
			if holetime % 20 == 0 and monstercheck ==0 then
			 	monster2 = CreateObjByFlag(107364,781015,6,1)
				SetModeEx(monster2,EM_SetModeType_Mark, false)
				SetModeEx(monster2,EM_SetModeType_HideName, true)
				SetModeEx(monster2,EM_SetModeType_NotShowHPMP, true)
				SetModeEx(monster2,EM_SetModeType_Strikback, false)
				SetModeEx(monster2,EM_SetModeType_Move, true)
				SetModeEx(monster2,EM_SetModeType_Fight, false)
				SetModeEx(monster2,EM_SetModeType_Searchenemy, false)
				SetModeEx(monster2,EM_SetModeType_Obstruct, false)
				AddToPartition (monster2 , RoomID )
				KS_ScriptMessage("[SC_106900_09]")    --[嘶～嘶～唧～唧～嘶～～]
				DelObj(hole2)
				WriteRoleValue(ctrl,EM_RoleValue_Register10,monster2)
				WriteRoleValue(monster2,EM_RoleValue_PID,Ctrl)
				BeginPlot(monster2,"bico_Z24ez_monstershowAI",0)
				monstercheck = 1
			end
	end
end

function bico_Z24ez_monstershowAI()
	local monster2= OwnerID()
	local ctrl = ReadRoleValue(monster2,EM_RoleValue_PID)
--	say(ctrl,"ctrl")
	local boss = ReadRoleValue(ctrl,EM_RoleValue_register7)
	local x = ReadRoleValue(boss,EM_RoleValue_X)
	local y = ReadRoleValue(boss,EM_RoleValue_Y)
	local z = ReadRoleValue(boss,EM_RoleValue_Z)
	SysCastSpellLv(monster2,monster2,499857,0)
	WriteRoleValue(ctrl,EM_RoleValue_register7,1)     ---------判定是否有中異界震盪
	MoveToFlagEnabled(monster2, false )
	local time = Move( monster2,x,y,z)*3.5
	DebugMsg(0,0,"time="..time)
	Sleep(time)
	DebugMsg(0,0,"timeout")
	SysCastSpellLv(boss,boss,499855,0)
	AddBuff(boss,623551,0,-1)
	CancelBuff(boss,623544)
	CancelBuff(boss,623726)
	CancelBuff(boss,623359)
	PlayMotion(boss,ruFUSION_ACTORSTATE_KNOCKDOWN_RECOVER)
	KS_ScriptMessage("[SC_106900_06]")   --[這……是……異界的……力量……]
	SetModeEx(boss,EM_SetModeType_Strikback, true)
	SetModeEx(boss,EM_SetModeType_Move, true)
	SetModeEx(boss,EM_SetModeType_Fight, true)
	SetModeEx(boss,EM_SetModeType_Searchenemy, true)
	KS_ScriptMessage("[SC_106900_07]")   --[無法……自……我……控制……]
	DelObj(monster2)
	LockHP( boss , 0 , "" )	
end

function bico_Z24ez_Bossround2AI()
	say(OwnerID(),"good")
end

function bico_z24ez_givecancelbuff()
	local player = {}
	player = SearchRangePlayer( OwnerID(), 300 )
--	say(OwnerID(),"me")
	if CheckBuff(OwnerID(),623551) == true then
	for i = 0,table.getn(player) do
		if CheckBuff( player[i], 623545 ) == true then
		DebugMsg(0,0,"player="..i)
		CancelBuff(player[i], 623545 )
		end
	end
	end
end

function Z24ez_107465_Treasure()
	SetPlot( OwnerID() ,"touch", "Z24_107465ez_Treasure_open" ,40 )
end

function Z24_107465ez_Treasure_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	Sleep(20)
	KillID( OwnerID() , TargetID() )
end

function Z24ez_mustdie_true()
	return true
end

function Z24ez_monsterA_AI()
	local own = OwnerID()
while 1 do 
sleep(10)
	LuaFunc_MoveToFlag( own , 781015 , 10 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 9 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 8 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 7 , 0 )
end
end

function Z24ez_monsterB_AI()
	local own = OwnerID()
while 1 do 
sleep(10)
	LuaFunc_MoveToFlag( own , 781015 , 11 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 12 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 13 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 14 , 0 )
end
end

function Z24ez_Boss_TimeLight_Player()	--傷害對Boss無效	
	local own =OwnerID()
	local tar =TargetID()
	local Boss = ReadRoleValue( tar , EM_RoleValue_OrgID )
	local Monster = ReadRoleValue( tar , EM_RoleValue_OrgID )
	local Ctrl = ReadRoleValue( tar , EM_RoleValue_OrgID )
	local Job = ReadRoleValue( tar , EM_RoleValue_VOC )
	if Job ==0 or Monster ==102642 or Boss == 107462 or own == tar or Monster == 107438 or Ctrl == 106101 or Monster == 107439 or Monster ==107400 or Monster ==107403 or Monster == 107401 or Monster == 107402 or Monster ==107440 then
	return false
	else
	return true
	end	
end

function Z24ez_Boss_TimeLight_Boss()	--治療對玩家沒有用
	local own =OwnerID()
	local tar =TargetID()
	local Boss = ReadRoleValue( tar , EM_RoleValue_OrgID )
	if Boss == 107462 then
	return true
	else
	return false
	end	
end

function Z24ez_HoleA_AI()
	local own = OwnerID()
	local MonsterA = ReadRoleValue ( own , EM_RoleValue_PID )
	SysCastSpellLv( own , MonsterA , 499768 , 0 )
while 1 do
sleep(5)
SysCastSpellLv( own , MonsterA , 850492 , 0 )
end
end

function Z24ez_HoleB_AI()
	local own = OwnerID()
	local MonsterB = ReadRoleValue ( own , EM_RoleValue_PID )
	SysCastSpellLv( own , MonsterB , 499768 , 0 )
while 1 do
sleep(5)
SysCastSpellLv( own , MonsterB , 850492 , 0 )
end
end

function Z24ez_hole1_P2AI()
	local own = OwnerID()
	while 1 do
	sleep(10)
	SysCastSpellLv( own , own , 499769 , 0 )
	end
end