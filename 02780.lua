--旗標編號
--781210
--780688   光束旗標(總共12個  0~11)
--Lua_Zone24BossQQQQ  (光束函式)702506
--0	--Boss
--1~4	--裝置建造者建造點
--5	--重形壓制者x6+裝置建造者者x4+技能球

--物件編號
--local BossID = 107213			--薩丘吉諾茲
--local Mob1ID = 107372		--重型壓制者
--local Mob2ID = 107373		--裝置建造者
--local Mob3ID = 107374		--飛空追擊者
--local SystemID =  107371		--能量轉化裝置
--local MoveBallID = 107417		--透明球
--local PartsID = 107375			--掉落的零件
--local PassageID = 107331~107334	--載運通道 (暫時使用107331)
--local FlyLight = 107494~107496

function Z24_worldBoss_Ctrl_AI(Controller)
	local WilliamCtrl = Controller
	WriteRoleValue( WilliamCtrl , EM_RoleValue_Register1, 1 )
	local BossID = 107213		--薩丘吉諾茲
	local Mob1ID = 107372		--重型壓制者
	local Mob2ID = 107373		--裝置建造者
	local Mob3ID = 107374		--飛空追擊者
	local SystemID =  107371	--能量轉化裝置
	local BallID = 107417		--透明球
	local ShowBallID = 107417	--表演法陣dsssss
	local MagicBallID = 107481	--施法物件
	local TreasureID = 107375	--掉落零件
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Treasure = CreateObjByFlag( TreasureID , 781210 , 0 , 1 )
	local distime = 0
	
	local MagicBall = CreateObjByFlag( MagicBallID , 781210 , 0 , 1 )
	SetModeEx( MagicBall , EM_SetModeType_NotShowHPMP , true )		----不顯示血條
	SetModeEx( MagicBall , EM_SetModeType_Mark , false )			----不可被標記
---	SetModeEx( MagicBall , EM_SetModeType_Show , false )			----隱藏
	SetModeEx( MagicBall , EM_SetModeType_Strikback , false )			----不反擊
	SetModeEx( MagicBall , EM_SetModeType_Searchenemy , false )		----不索敵
	SetModeEx( MagicBall , EM_SetModeType_Fight , false )			----不可砍殺
	AddToPartition( MagicBall , RoomID )
	AddBuff(MagicBall , 623830 , 0 , -1 )
	
	local Bx = ReadRoleValue( MagicBall , EM_RoleValue_X ) 
	local By = ReadRoleValue( MagicBall , EM_RoleValue_Y )
	local Bz = ReadRoleValue( MagicBall , EM_RoleValue_Z )
	
	local MoveBall = CreateObj( BallID , Bx , By+300 , Bz ,  0 , 1 )
	SetModeEx( MoveBall , EM_SetModeType_NotShowHPMP , true )		----不顯示血條
	SetModeEx( MoveBall , EM_SetModeType_Mark , false )			----不可被標記
	SetModeEx( MoveBall , EM_SetModeType_Show , false )			----隱藏
	SetModeEx( MoveBall , EM_SetModeType_Strikback , false )			----不反擊
	SetModeEx( MoveBall , EM_SetModeType_Searchenemy , false )		----不索敵
	SetModeEx( MoveBall , EM_SetModeType_Fight , false )				----不可砍殺
	SetModeEx( MoveBall , EM_SetModeType_Gravity , false )			----無重力
	SetModeEx( MoveBall , EM_SetModeType_AlignToSurface , false )		----不貼齊地表
	AddToPartition( MoveBall , RoomID ) 
	WriteRoleValue( Ctrl , EM_RoleValue_Register1 , MoveBall )
	WriteRoleValue( MoveBall , EM_RoleValue_PassengerAttackable , 1)
	
	MoveToFlagEnabled( MoveBall , false )
		
	local Boss = CreateObj( BossID , Bx , By+300, Bz ,  0 , 1 )
	SetModeEx( Boss , EM_SetModeType_Gravity , false )			----無重力
	SetModeEx( Boss , EM_SetModeType_AlignToSurface , false )		----不貼齊地表
	SetModeEx( Boss , EM_SetModeType_Move , false )			----不移動
	SetModeEx( Boss , EM_SetModeType_Searchenemy , false )		----不索敵
	SetModeEx( Boss , EM_SetModeType_Fight , false )			----不可砍殺
	AddToPartition( Boss , RoomID )
	SetPlot(Boss,"dead","Z24_WorldBoss_DeadPlot",0);			--設定死亡劇情→轉交旗標記錄
	WriteRoleValue( Ctrl , EM_RoleValue_PID , Boss )
	WriteRoleValue( Boss , EM_RoleValue_PID , Ctrl )	
	AttachObj( Boss , MoveBall , 1 , "p_name_title" , "p_down" )
	AddBuff( Boss , 623855 , 0 , -1 )					--普攻禁止

	WriteRoleValue( MoveBall , EM_RoleValue_PassengerAttackable , 1)	--設定Boss可以被攻擊，必須寫入載具
	MoveToFlagEnabled( Boss , false )
	MoveDirect( MoveBall , Bx , By+39 , Bz )

	sleep(180)
	CallPlot(Boss,"Lua_DW_WBGUIDRecord",1);				--設定為此區域的第1號世界王
	BeginPlot(Boss,"Z24_WorldBoss_ScanHateList",0);
	SetModeEx( Boss , EM_SetModeType_Move , true )
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true )		----索敵
	SetModeEx( Boss , EM_SetModeType_Fight , true )			----可砍殺
	MoveDirect( MoveBall , Bx , By+40 , Bz )
--	SysCastSpellLv( boss ,boss , 850540 , 0 )

	WriteRoleValue( Ctrl , EM_RoleValue_Register2 , MagicBall )
	WriteRoleValue( MagicBall , EM_RoleValue_PID , MoveBall )
	WriteRoleValue( MagicBall , EM_RoleValue_Register1 , Boss )
	WriteRoleValue( MoveBall , EM_RoleValue_Register2 , MagicBall )
	WriteRoleValue( MoveBall , EM_RoleValue_Register4 , ctrl )
	
	local CombatBegin = 0

	local Npc_Table = {}

	Mob1_Table = {}			--主動怪
	Mob1Pick = 0
	Mob2_Table = {}			--被動怪
	Mob2Pick = 0
	System_table = {}
 	SystemDie = {}
	SystemDie[1] = 0
	SystemDie[2] = 0
	SystemDie[3] = 0
	SystemDie[4] = 0
----------------------------------
	local PTL={}--正常的載運通道
	local NUM=0--記數變數	
	
---------------------------------------------------------------------------------------------------------------------------------------------------
	while 1 do 
	sleep(10)
			PTL=SearchRangeNpc ( ctrl , 500 )
			for k = 0 , table.getn(PTL) do
				if ReadRoleValue( PTL[k], EM_RoleValue_OrgID )==107331 or
				   ReadRoleValue( PTL[k], EM_RoleValue_OrgID )==107332 or
				   ReadRoleValue( PTL[k], EM_RoleValue_OrgID )==107333 or
				   ReadRoleValue( PTL[k], EM_RoleValue_OrgID )==107334 then
						NUM=NUM+1
				end
			end
			
		distime = distime + 1
		if distime == 90 and HateListCount( Boss ) == 0 then			--開場90秒內沒人攻擊boss, 讓boss離開
		SetModeEx( Boss , EM_SetModeType_Searchenemy , false )		----不索敵
		SetModeEx( Boss , EM_SetModeType_Fight , false )			----不可砍殺
		MoveDirect( MoveBall , Bx , By+300 , Bz )
		sleep(100)	
			Npc_Table = SearchRangeNPC( Ctrl , 500 )
			for i = 0 , (#Npc_Table)-1 do
				if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BallID then
	 				DelObj( Npc_Table[i] )
	 			end
	 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == MagicBallID then
	 				DelObj( Npc_Table[i] )
	 			end
	 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BossID then
	 				DelObj( Npc_Table[i] )
	 			end
	 		end
	 		System_table = {}				
			SystemDie = {}		
		end			
		
		if HateListCount( Boss ) ~= 0 then
			if CombatBegin == 0 then				--戰鬥開關 0
				Boss = ReadRoleValue( Ctrl , EM_RoleValue_PID )
				BeginPlot( MoveBall , "Z24_WorldBoss_MoveBall" , 0 )
				BeginPlot( MagicBall , "Z24_worldBoss_MagicBallAI" , 0 )
				CancelBuff( MagicBall , 623830 )
			CombatBegin = 1
			end
		end		
--------------------------把死亡的裝置設0----------------------------------		
		if #System_table >= 1 then
--		System_table = {}
--		DebugMsg(0,0,"SystemDie1="..SystemDie[1].." SystemDie2="..SystemDie[2].." SystemDie3="..SystemDie[3].." SystemDie4="..SystemDie[4])
			for i= 1 , #System_table do
				if System_table[i]~=nil then
					if ReadRoleValue( System_table[i] , EM_RoleValue_IsDead ) == 1  then --or CheckID( System_table[i] ) == false
					SystemDie[i] = 0				
					end
				end
			end
		end
--------------------------把死亡的主動怪移出table--------------------------------				
		if #Mob1_Table ~= 0 then
			for i = #Mob1_Table , 1 , -1 do				--小怪1如果死亡,移出小怪1table
				if ReadRoleValue( Mob1_Table[i] , EM_RoleValue_IsDead ) == 1 or CheckID(Mob1_Table[i]) == false then
				table.remove( Mob1_Table , i )
				Mob1Pick = 0	
				end
			end
		end
--------------------------把死亡的被動怪移出table--------------------------------		
		if #Mob2_Table ~= 0 then
			for i = #Mob2_Table , 1 , -1 do
				if ReadRoleValue( Mob2_Table[i] , EM_RoleValue_IsDead ) == 1 or CheckID(Mob2_Table[i]) == false then
				table.remove( Mob2_Table , i )
				Mob2Pick = 0
				end
			end
		end		
----------------------------------------------------------------------------------------------------------------------------------------------
		if HateListCount( Boss ) == 0 then
			 if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0   then --and NUM == 4
			 	if CombatBegin ==1 then
			 		Npc_Table = SearchRangeNPC( Ctrl , 500 )
			 		for i = 0 , (#Npc_Table)-1 do
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob1ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob2ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob3ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == SystemID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BallID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == MagicBallID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BossID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107494 then
			 				DelObj( Npc_Table[i] )
			 			end 
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107495 then
			 				DelObj( Npc_Table[i] )
			 			end 
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107496 then
			 				DelObj( Npc_Table[i] )
			 			end 			 			
			 		end
			 		CombatBegin = 0
			 		Mob1_Table = {}
					Mob2_Table = {}
					System_table = {}				
					SystemDie = {}
					Mob1Pick = 0
					Mob2Pick = 0	
					WriteRoleValue( WilliamCtrl , EM_RoleValue_Register1, 0 )
					break		 						
			 	end
			 end
--------------------------------------------------------------------------------------------------------------------------------------
			if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1  then --or CheckID( Boss ) == false
					local X = ReadRoleValue( MoveBall , EM_RoleValue_X )
					local Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
					local Z = ReadRoleValue( MoveBall , EM_RoleValue_Z )
					AddBuff( Boss , 623857 , 0 , -1 )
					MoveDirect( MoveBall , X , Y+500 , Z )
					Treasure = CreateObjByFlag( TreasureID , 781210 , 0 , 1 )
					SetModeEx( Treasure , EM_SetModeType_Show, false)   	    --顯示
					SetModeEx( Treasure , EM_SetModeType_Searchenemy, false)   	    --索敵
					SetModeEx( Treasure , EM_SetModeType_Fight, false) 		    --砍殺
					SetModeEx( Treasure , EM_SetModeType_Move, false)		    --移動
					SetModeEx( Treasure , EM_SetModeType_Strikback, false)	    --反擊
					SetModeEx(Treasure,EM_SetModeType_NotShowHPMP,true)           --不顯示血條
					AddToPartition( Treasure , RoomID )
					Lua_DW_WBGUIDSwitch(1,Treasure);--將世界王的獎勵標準轉移到寶箱上
					Sleep(150)
					SetModeEx( Treasure , EM_SetModeType_Show, true)   	    --顯示
					AddBuff( Treasure , 623831 , 0 , -1 )
					ScriptMessage( Ctrl , -1 , 2 , "[SC_ZONE24_WORLDBOSS_DEAD]" , 0 )
					BeginPlot( Treasure , "Z24_WorldBoss_Treasure", 0 )				
					Npc_Table = SearchRangeNPC( Ctrl , 500 )
					for i = 0 , (#Npc_Table)-1 do
						if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob1ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob2ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob3ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == SystemID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BallID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == MagicBallID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BossID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107494 then
			 				DelObj( Npc_Table[i] )
			 			end 
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107495 then
			 				DelObj( Npc_Table[i] )
			 			end 
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107496 then
			 				DelObj( Npc_Table[i] )
			 			end 	
					end
					CombatBegin = 0
					System_table = {}
					Mob1_Table = {}
					Mob2_Table = {}
					SystemDie = {}
					Mob1Pick = 0
					Mob2Pick = 0
					CallPlot( WilliamCtrl, "LuaFunc_ResetObj", WilliamCtrl ) --WriteRoleValue( WilliamCtrl , EM_RoleValue_Register1, 0 )
					break
			end
		end				
	end
end

function Z24_WorldBoss_MoveBall()
	local MoveBall = OwnerID()
	local MagicBall = ReadRoleValue( MoveBall , EM_RoleValue_Register2 )
	local Boss = ReadRoleValue( MagicBall , EM_RoleValue_Register1 )
	local HighPick = 0
	local MBy = ReadRoleValue (MagicBall , EM_RoleValue_Y )
	local X = ReadRoleValue( MoveBall , EM_RoleValue_X )
	local Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
	local Z = ReadRoleValue( MoveBall , EM_RoleValue_Z )
	local Ynow
	local Y1 = MBy + 40		--低
	local Y2 = MBy + 150		--中	
	local Y3 = MBy + 300		--高
	local H	= 1			--階段判斷
	local H1 = 0
	WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )			--高度判斷
	local Npc_Table = {}
	local Playertable	
	
while 1 do
	sleep(10)
	H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )
	Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
--	DebugMsg(0,0,"Y="..Y.." Y1="..Y1)
	if H1 == 0 and Y == Y1 then
			ScriptMessage( MagicBall , -1  , 3 , "[SC_107213_WORLDBOSS_1]" , C_SYSTEM )
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_SLEEP_BEGIN ,ruFUSION_ACTORSTATE_SLEEP_LOOP )
			MoveDirect( MoveBall , X , Y1+1 , Z )					
			H = 1								--P1
			WriteRoleValue( MoveBall , EM_RoleValue_Register1 , H )
			sleep(150)							--停留15秒
			MoveDirect( MoveBall , X , Y2 , Z )
		SysCastSpellLv( MagicBall , MagicBall , 499763 , 0 )			--轉階段  強化現有所有小怪
		H1 = 1
		WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )
		WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 )			--開關光束射線的值
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_SLEEP_LOOP ,ruFUSION_ACTORSTATE_SLEEP_END )	
	end
	H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )	
	Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
--	DebugMsg(0,0,"Y="..Y.." Y2="..Y2)
	if H1 == 1 and Y== Y2 then
			ScriptMessage( MagicBall , -1 , 3 , "[SC_107213_WORLDBOSS_2]" , C_SYSTEM )	
		LightTag = {}
		farplayer = {}
		farplayertable={}	
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )			
			MoveDirect( MoveBall , X , Y2+1 , Z )					
			H = 2			--P2
			WriteRoleValue( MoveBall , EM_RoleValue_Register1 , H )
			sleep(150)		--停留15秒		
			MoveDirect( MoveBall , X , Y3 , Z )
		SysCastSpellLv( MagicBall , MagicBall , 499763 , 0 )	
		H1 = 2
		WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )		
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CROUCH_LOOP , ruFUSION_ACTORSTATE_CROUCH_END )					
	end	
	H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )	
	Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
--	DebugMsg(0,0,"Y="..Y.." Y3="..Y3)
	if H1 == 2 and Y == Y3 then	
			ScriptMessage( MagicBall , -1 , 3 , "[SC_107213_WORLDBOSS_3]" , C_SYSTEM )	
			MoveDirect( MoveBall , X , Y3+1 , Z )			
			H = 3			--P3
			WriteRoleValue( MoveBall , EM_RoleValue_Register1 , H )
			sleep(100)		--停留10秒		
			MoveDirect( MoveBall , X , Y2 , Z )
		SysCastSpellLv( MagicBall , MagicBall , 499763 , 0 )
		H1 = 3	
		WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )											
	end	
	H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )	
	Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
--	DebugMsg(0,0,"Y="..Y.." Y2="..Y2)
	if H1 == 3 and Y== Y2 then
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )	
			ScriptMessage( MagicBall , -1 , 3 , "[SC_107213_WORLDBOSS_2]" , C_SYSTEM )		
			MoveDirect( MoveBall , X , Y2+1 , Z )		
			H = 0			--P2
			WriteRoleValue( MoveBall , EM_RoleValue_Register1 , H )
			sleep(150)		--停留15秒		
			MoveDirect( MoveBall , X , Y1 , Z )
		SysCastSpellLv( MagicBall , MagicBall , 499763 , 0 )
		H1 = 0	
		WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CROUCH_LOOP , ruFUSION_ACTORSTATE_CROUCH_END )		
	end			
end
end

function Z24_worldBoss_MagicBallAI()
	local MagicBall = OwnerID()
	local RoomID = ReadRoleValue( MagicBall , EM_RoleValue_RoomID )
	local MoveBall = ReadRoleValue( MagicBall , EM_RoleValue_PID )
	local Boss = ReadRoleValue( MagicBall , EM_RoleValue_Register1 )
	local H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
	local skilltime = 0
	local Light = 499779
	local Fireshow = 499777
	local FireBallID = 107417
	local Mob1ID = 107372 		--重型壓制者
	local Mob2ID = 107373		--裝置建造者
	local Mob3ID = 107374		--飛空追擊者
	local Npc_Table = {}
	local P1_FireLight_Table = {}
	local BossPick = 0
while 1 do
sleep(10)
--------------------------把死亡的裝置設為0-------------------------------------
	H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
	skilltime = skilltime +1 
	if skilltime % 20 == 0 then
		CastSpell( MagicBall , MagicBall , Light )
	end	
-------------------------低階段--------------------------------------------------		
		H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
		if H == 1 then	
			if BossPick == 0 then
				CallPlot( Boss , "Z24_WorldBoss_BossAI" , 0 )				
-------------------------主動怪的產出-------------------------------------------							
				if #Mob1_Table < 6 and Mob1Pick == 0 then			--如果小怪1table裡面小於6隻，而小怪１開關處於０
					for i=1 , 6-#Mob1_Table do				--將小怪1補滿
						Mob1 = CreateObjByFlag( Mob1ID , 781210 , 5 , 1 )
						AddToPartition( Mob1 , 0 )
						SetFlag( Mob1, 544801, 1 )
						table.insert( Mob1_Table , Mob1 )	
					end	
					if #Mob1_Table == 6 then
						Mob1Pick = 1
					end			
				end
-------------------------被動怪的產出-------------------------------------------	
				if #Mob2_Table < 4  and Mob2Pick == 0 then			--如果小怪2table裡面小怪小於4隻，而小怪２開關處於０
					for i = 1  , 4-#Mob2_Table  do				--將小怪2補滿
						Mob2 = CreateObjByFlag( Mob2ID , 781210 , 5 , 1 )
						AddToPartition( Mob2 , 0 )
						SetFlag( Mob2, 544801, 1 )
						CallPlot( Mob2 , "Z24_worldBoss_Mob2AI" , 0 )
						table.insert( Mob2_Table , Mob2 )				
					end				
					if #Mob2_Table == 4 then
						Mob2Pick = 1
					end	
				end	
			BossPick = 1
			end					
		end
-------------------------中階段-------------------------------------------------	
		H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )		
		if H == 2  then	
			if BossPick == 1 then
				CallPlot( MagicBall , "Lua_Zone24BossQQQQ" , 0 )		
-------------------------主動怪的產出-------------------------------------------						
				if #Mob1_Table < 6 and Mob1Pick ==0 then
					for i=1 , 6-#Mob1_Table do
						Mob1 = CreateObjByFlag( Mob3ID , 781210 , 5 , 1 )		--補飛空追擊者
						AddToPartition( Mob1 , 0 )
						SetFlag( Mob1, 544801, 1 )
						table.insert( Mob1_Table , Mob1 )
					end
					if #Mob1_Table == 6 then
						Mob1Pick = 1
					end
				end
-------------------------被動怪的產出-------------------------------------------			
				if #Mob2_Table < 4 and Mob2Pick == 0 then
					for i = 1 , 4-#Mob2_Table do
						Mob2 = CreateObjByFlag( Mob2ID , 781210 , 5 , 1 )
						AddToPartition( Mob2 , 0 )
						SetFlag( Mob2, 544801, 1 )
						CallPlot( Mob2 , "Z24_worldBoss_Mob2AI" , 0 )
						table.insert( Mob2_Table , Mob2 )
					end				
					if #Mob2_Table == 4 then
						Mob2Pick = 1
					end	
				end
			BossPick = 0
			end
		end
--------------------------高階段--------------------------------------------------		
		H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
		if H == 3 then	
				local randSystem = DW_rand(#System_table)
				CastSpell( System_table[randSystem] , Boss , 499780 )	
			BossPick = 1
		end					
-------------------------中階段-------------------------------------------------		
		H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
		if H == 0 then	
			if BossPick == 1 then
				CallPlot( MagicBall , "Lua_Zone24BossQQQQ" , 0 )			
-------------------------主動怪的產出-------------------------------------------							
				if #Mob1_Table < 6 and Mob1Pick == 0 then
					for i=1 , 6-#Mob1_Table do
						Mob1 = CreateObjByFlag( Mob3ID , 781210 , 5 , 1 )		--補飛空追擊者
						AddToPartition( Mob1 , 0 )
						SetFlag( Mob1, 544801, 1 )--關閉帕奇鼠
						table.insert( Mob1_Table , Mob1 )
					end
					if #Mob1_Table == 6 then
						Mob1Pick = 1
					end
				end
-------------------------被動怪的產出-------------------------------------------			
				if #Mob2_Table < 4 and Mob2Pick == 0 then
					for i = 1 , 4-#Mob2_Table do
						Mob2 = CreateObjByFlag( Mob2ID , 781210 , 5 , 1 )
						AddToPartition( Mob2 , 0 )
						SetFlag( Mob2, 544801, 1 )
						CallPlot( Mob2 , "Z24_worldBoss_Mob2AI" , 0 )
						table.insert( Mob2_Table , Mob2 )
					end
					if #Mob2_table == 4 then
						Mob2Pick = 1
					end					
				end
			BossPick = 0
			end
		end
end
end

function Z24_worldBoss_Mob2AI()
	local Mob2 = OwnerID()
	local SystemID = 107371		--能量轉化裝置
	local FlagTable = {}
	FlagTable[1] = 1
	FlagTable[2] = 2
	FlagTable[3] = 3
	FlagTable[4] = 4
-----------------------------------------------------------------------------------------	
	SetModeEx( Mob2 , EM_SetModeType_Strikback , false )	--不反擊
	SetModeEx( Mob2 , EM_SetModeType_Searchenemy , false )	--不索敵
	SetModeEx( Mob2 , EM_SetModeType_Fight , false )		--不可砍殺
	if SystemDie[1] == 1  and SystemDie[2] == 1 and SystemDie[3] == 1 and SystemDie[4] == 1 then 
		SetModeEx( Mob2 , EM_SetModeType_Strikback , true )	--可反擊
		SetModeEx( Mob2 , EM_SetModeType_Searchenemy , true )	--可索敵
		SetModeEx( Mob2 , EM_SetModeType_Fight , true )		--可砍殺
		return
	end
	for i= 1 , 4 do
		if SystemDie[i] == 0 then
			SystemDie[i] = 1 
			LuaFunc_MoveToFlag( Mob2 , 781210 , FlagTable[i] , 100 )
			FA_FaceFlagEX( Mob2 , 781210 , FlagTable[i] , 0 , 0  )
			Sleep(10)
			CastSpell( Mob2 , Mob2 , 499782 )	
			Sleep(100)
			System_table[i] = CreateObjByFlag ( SystemID , 781210 , FlagTable[i]  , 0 )				
			SetModeEx( System_table[i] , EM_SetModeType_Mark , true )		--標記
			SetModeEx( System_table[i] , EM_SetModeType_HideName , false )		--不隱藏名稱
			SetModeEx( System_table[i] , EM_SetModeType_NotShowHPMP , false )	--顯示血條
			SetModeEx( System_table[i] , EM_SetModeType_Strikback , false )		--不反擊			
			SetModeEx( System_table[i] , EM_SetModeType_Move , false )		--不移動
			SetModeEx( System_table[i] , EM_SetModeType_Fight , true )		--可砍殺
			SetModeEx( System_table[i] , EM_SetModeType_Searchenemy , false )	--不索敵
			SetModeEx( System_table[i] , EM_SetModeType_Obstruct , false )		--阻擋
			AddToPartition( System_table[i] , 0 )
			SetFlag( System_table[i], 544801, 1 )--關閉帕奇鼠
			BeginPlot( System_table[i] , "Z24_WorldBoss_SystemAI" , 0 )	
			MoveToFlagEnabled( Mob2 , false )
			SetModeEx( Mob2 , EM_SetModeType_Strikback , true )	--可反擊
			SetModeEx( Mob2 , EM_SetModeType_Searchenemy , true )	--可索敵
			SetModeEx( Mob2 , EM_SetModeType_Fight , true )		--可砍殺
			return	
		end	
	end
end

function Z24_WorldBoss_BossAI()
	local Boss = OwnerID()
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_PID )
	local MoveBall = ReadRoleValue( Ctrl , EM_RoleValue_Register1 )
	local H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local hate_table = HateListCount( Boss )
	local RandPlayer = Rand(hate_table)
	local TempGID = 0
	local BallPick = 0 	
	farplayer = {}
	farplayertable={}
	LightTag = {}	
	while 1 do
	sleep(10)
		H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )	
		if H1 ==0  then 			
			farplayer = KS_GetHateList( Boss, 2 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
			for i = 1 , #farplayer do
				if GetDistance( Boss, farplayer[i])>= 150 then
					table.insert( farplayertable , farplayer[i] )
				end	
			end	
			if ReadRoleValue( Boss , EM_RoleValue_Register1 ) == 0 then			--光束射線的開關為0時
				if #farplayertable ~= 0  then	--最遠玩家表內沒有人的話
					DebugMsg(0,0,"step="..1)				
					local followman = DW_rand(#farplayertable)	--rand出最遠玩家的序號
					local Firstplayer= farplayertable[followman]	--依照序號去找玩家
						table.insert( LightTag , Firstplayer )	
					for i =1 , #farplayer do
						ScriptMessage( Boss , farplayer[i] , 3 , "[SC_107213_WORLDBOSS_0]".."|cffff0000" ..GetName(Firstplayer).. "|r" , C_SYSTEM )
					end																	
							local Bx = ReadRoleValue( Firstplayer , EM_RoleValue_X )
							local By = ReadRoleValue( Firstplayer , EM_RoleValue_Y )
							local Bz = ReadRoleValue( Firstplayer , EM_RoleValue_Z )
							local ball = CreateObj( 107417 , Bx , By , Bz , 0 , 1 )  ------------生出追蹤球
							SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
							SetModeEx( ball , EM_SetModeType_Mark, false)---可點選(是)
							SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
							SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
							SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
							SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
							AddToPartition( ball , RoomID )
							CastSpell( Boss , ball , 499777 )				--表演用光束
							WriteRoleValue( ball , EM_RoleValue_Livetime, 19 )  		--存活時間
							WriteRoleValue ( ball , EM_RoleValue_PID , Boss )
							BeginPlot( ball,"Z24_World_FollowBallAI_01", 0 )
					WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 )					
				else				--最遠玩家表內沒有人的話
					DebugMsg(0,0,"step="..2)
					TempGID = HateListInfo( Boss , RandPlayer , EM_HateListInfoType_GItemID )		--Boss仇恨表內隨意一個玩家	
					table.insert( LightTag , TempGID )	
					for i =1 , #farplayer do
						ScriptMessage( Boss , farplayer[i] , 3 , "[SC_107213_WORLDBOSS_0]".."|cffff0000" ..GetName(TempGID).. "|r" , C_SYSTEM )
					end
						local Bx = ReadRoleValue( TempGID , EM_RoleValue_X )
						local By = ReadRoleValue( TempGID , EM_RoleValue_Y )
						local Bz = ReadRoleValue( TempGID , EM_RoleValue_Z )
						local ball = CreateObj( 107417 , Bx , By , Bz , 0 , 1 )  ------------生出追蹤球
						SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
						SetModeEx( ball , EM_SetModeType_Mark, false)---可點選(是)
						SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
						SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
						SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
						SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
						AddToPartition( ball , RoomID )
						CastSpell( Boss , ball , 499777 )				--表演用光束
						WriteRoleValue( ball , EM_RoleValue_Livetime, 19 )  		--存活時間
						WriteRoleValue ( ball , EM_RoleValue_PID , Boss )
						BeginPlot( ball,"Z24_World_FollowBallAI_02", 0 )
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 )	
				end	
			end
		 end
	end	
end

function Z24_World_FollowBallAI_01()		--追最遠的玩家群
	local boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
	while true do
	Sleep(10)
		if ReadRoleValue( LightTag[1] , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( LightTag[1] , EM_RoleValue_IsPlayer ) ~= 1 then
				LightTag = {}
				local followman = DW_rand(#farplayertable)	--rand出最遠玩家的序號
				local Firstplayer= farplayertable[followman]	--依照序號去找玩家	
				table.insert( LightTag , Firstplayer )
				for i =1 , #farplayer do
					ScriptMessage( Boss , farplayer[i] , 3 , "[SC_107213_WORLDBOSS_0]".."|cffff0000" ..GetName(Firstplayer).. "|r" , C_SYSTEM )
				end
				SetFollow( OwnerID(), Firstplayer )
				SysCastSpellLv( OwnerID() , OwnerID() , 499781 , 0  )
		elseif ReadRoleValue( LightTag[1] , EM_RoleValue_IsDead ) == 0 then
				SetFollow( OwnerID(), LightTag[1] )
				SysCastSpellLv( OwnerID() , OwnerID() , 499781 , 0 )
		end
	end
end

function Z24_World_FollowBallAI_02()		--追仇恨表內隨機玩家
	local boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local hate_table = HateListCount( Boss )
	local RandPlayer = Rand(hate_table)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
	while true do
	Sleep(10)
		if ReadRoleValue( LightTag[1] , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( LightTag[1] , EM_RoleValue_IsPlayer ) ~= 1 then
				LightTag = {}
				TempGID = HateListInfo( Boss , RandPlayer , EM_HateListInfoType_GItemID )		--Boss仇恨表內隨意一個玩家	
				table.insert( LightTag , TempGID )
				for i =1 , #farplayer do
					ScriptMessage( Boss , farplayer[i] , 3 , "[SC_107213_WORLDBOSS_0]".."|cffff0000" ..GetName(TempGID).. "|r" , C_SYSTEM )
				end
				SetFollow( OwnerID(), TempGID )
				SysCastSpellLv( OwnerID() , OwnerID() , 499781 , 0  )
		elseif ReadRoleValue( LightTag[1] , EM_RoleValue_IsDead ) == 0 then
				SetFollow( OwnerID(), LightTag[1] )
				SysCastSpellLv( OwnerID() , OwnerID() , 499781 , 0 )
		end
	end
end

Function Z24_worldBoss_FireBall()
	while 1 do
		sleep(10)
		SysCastSpellLv( OwnerID() , OwnerID() , 499764 , 0 )
		SysCastSpellLv( OwnerID() , OwnerID() , 499783 , 0 )		
	end
end

function Z24_WorldBoss_SystemAI()
	local System = OwnerID()
	local player_table = {}
	local bufflv  
	AddBuff(System , 623802 , 0 , -1 )
	while 1 do
		sleep(10)
		player_table = SearchRangePlayer( System , 60 )
		for i=0 , #player_table do
			if CheckBuff( player_table[i] , 623759 ) == true then
				bufflv = FN_CountBuffLevel( player_table[i] , 623759 )	--讀取目標身上這個Buff有幾層 -1代表沒Buff
				if bufflv == 0 then					--如果只有一層，就直接刪掉
				CancelBuff( player_table[i] , 623759 )
				SysCastSpellLv( System , System , 850497 , 0 )
				else
				CancelBuff( player_table[i] , 623759 )
				AddBuff( player_table[i] , 623759 , bufflv-1 , -1 )
				SysCastSpellLv( System , System , 850497 , 0 )
				end
			end
		end
	end	
end

function Z24_WorldBoss_623783()
	local own = OwnerID()
	local tar = TargetID()
	local TagID =  ReadRoleValue( tar , EM_RoleValue_OrgID ) 
	if TagID == 107372 or TagID == 107373 or TagID == 107374  then
		return true
	else
		return false
	end
end

function Z24_WorldBoss_Treasure()
	SetPlot( OwnerID() ,"touch", "Z24_WorldBoss_Treasure_Open" ,40 )
end

function Z24_WorldBoss_Treasure_Open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	Sleep(20)
	KillID( OwnerID() , TargetID() )
end

function Lua_Zone24BossQQQQ()
local own = OwnerID()
local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	CallPlot( own, "Lua_Zone24BossQQQ", RoomID )
end

function Lua_Zone24BossQQQ( RoomID )--龍捲風
	local own = OwnerID()
	Sleep(10)
	--if KS_InCombat( own ) == true then
		for i=1, 2 do
			--local Wind = kg_GetPosRX( own, 107494, 85, 0, ((i-1)*180)-90 );
			local Wind = LuaFunc_CreateObjByObj(107494,own)
			SetModeEx( Wind, EM_SetModeType_Fight, false );	--無法砍殺
			SetModeEx( Wind, EM_SetModeType_Searchenemy, false );	-- 索敵
			SetModeEx( Wind, EM_SetModeType_Strikback , false );	-- 反擊
			SetModeEx( Wind, EM_SetModeType_Mark , false );	-- 標記
			SetModeEx( Wind, EM_SetModeType_NotShowHPMP, true );--沒有血條
			SetModeEx( Wind, EM_SetModeType_HideName, true )
			AddToPartition( Wind, RoomID );
			WriteRoleValue(Wind,EM_RoleValue_register1,own)
			AddBuff( Wind, 623288, 0, -1 );--外觀
			BeginPlot( Wind, "Lua_Zone24_WindAI", 0 );
		end
	--end
end

function Lua_Zone24_WindAI()--龍捲風
	local Wind = OwnerID();
	local RoomID = ReadRoleValue( Wind, EM_RoleValue_RoomID );
	local Global = ReadRoleValue(Wind,EM_RoleValue_register1)
	local _Global = 780688
	local Site = rand(9)+3;
	local X;	
	local Z;
	local Y = ReadRoleValue( Wind, EM_RoleValue_Y );
	local Fx = GetMoveFlagValue( _Global, Site, EM_RoleValue_X )
	local Fz = GetMoveFlagValue( _Global, Site, EM_RoleValue_Z )
	local monster1 = LuaFunc_CreateObjByObj ( 107496 , Wind ) --中
	local monster2 = LuaFunc_CreateObjByObj ( 107496 , Wind ) --頂
	local monster3 = LuaFunc_CreateObjByObj ( 107496 , Wind ) --頂
	SetModeEx( monster1, EM_SetModeType_Fight, false );	--無法砍殺
	SetModeEx( monster1, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( monster1, EM_SetModeType_Strikback , false );	-- 反擊
	SetModeEx( monster1, EM_SetModeType_Mark , false );	-- 標記
	SetModeEx( monster1, EM_SetModeType_NotShowHPMP, true );--沒有血條
	SetModeEx( monster1, EM_SetModeType_Gravity, false )
	SetModeEx( monster1, EM_SetModeType_Show, false )
	SetModeEx( monster1, EM_SetModeType_HideName, true )
	SetModeEx( monster3, EM_SetModeType_Fight, false );	--無法砍殺
	SetModeEx( monster3, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( monster3, EM_SetModeType_Strikback , false );	-- 反擊
	SetModeEx( monster3, EM_SetModeType_Mark , false );	-- 標記
	SetModeEx( monster3, EM_SetModeType_NotShowHPMP, true );--沒有血條
	SetModeEx( monster3, EM_SetModeType_Gravity, false )
	SetModeEx( monster3, EM_SetModeType_Show, false )
	SetModeEx( monster3, EM_SetModeType_HideName, true )
	
		SetModeEx( monster2, EM_SetModeType_Fight, false );	--無法砍殺
		SetModeEx( monster2, EM_SetModeType_Searchenemy, false );	-- 索敵
		SetModeEx( monster2, EM_SetModeType_Strikback , false );	-- 反擊
		SetModeEx( monster2, EM_SetModeType_Mark , false );	-- 標記
		SetModeEx( monster2, EM_SetModeType_NotShowHPMP, true );--沒有血條
		SetModeEx( monster2, EM_SetModeType_Gravity, false )
		SetModeEx( monster2, EM_SetModeType_HideName, true )
		
	AddToPartition( monster1, RoomID )
	AddToPartition( monster2, RoomID )
	AddToPartition( monster3, RoomID )
	WriteRoleValue(Wind , EM_RoleValue_Livetime , 15)
	WriteRoleValue(monster1 , EM_RoleValue_Livetime , 15)
	WriteRoleValue(monster2 , EM_RoleValue_Livetime , 15)
	WriteRoleValue(monster3 , EM_RoleValue_Livetime , 15)
	AttachObj(  monster1,Wind, 1, "p_down", "p_name_title" )
	AttachObj(  monster3,monster1, 1, "p_down", "p_name_title" )
	AttachObj(  monster2,monster3, 1, "p_down", "p_name_title" )
	KS_Move( Wind, 30, Fx, Y, Fz );
	WriteRoleValue( Wind, EM_RoleValue_PID, Site )
	sleep(10)
	SysCastSpellLv(monster2,Wind,850498,0)
	local MoveBall = ReadRoleValue( Global , EM_RoleValue_PID )
	local BicoCtrl = ReadRoleValue( MoveBall , EM_RoleValue_Register4 )
	while true do
--		if ReadRoleValue( MoveBall , EM_RoleValue_Register1 ) == 1 or ReadRoleValue( MoveBall , EM_RoleValue_Register1 ) == 3 then  --這邊判斷何時結束，然後刪掉自己
--			WriteRoleValue(Wind , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster1 , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster2 , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster3 , EM_RoleValue_Livetime , 1)
--		end
		--[[if KS_InCombat( Global) ~= true then
			--ks_WaitToDie( 1 );--Time時間  X秒後自己殺自己
--			WriteRoleValue(Wind , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster1 , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster2 , EM_RoleValue_Livetime , 1)
--			return
--		end--]]
		
		--SysCastSpellLv( Wind, Wind, _Global["SkillID"][4], _Global["Lv"][4] );--電流
		SysCastSpellLv(Wind,Wind,850499,0)
		SysCastSpellLv(monster2,monster2,850500,0)		
		X = ReadRoleValue( Wind, EM_RoleValue_X );
		Z = ReadRoleValue( Wind, EM_RoleValue_Z );
		local Dis = math.floor( ( ( X - Fx )^2 +( Z - Fz )^2 )^0.5)
		if Dis <=60 then
			local Array = {};
			for i=1, 9 do
				if i+2 ~= Site then
					table.insert( Array, i+2);
				end
			end
			Site = Array[rand(8)+1];
			WriteRoleValue( Wind, EM_RoleValue_PID, Site )
			Fx = GetMoveFlagValue( _Global, Site, EM_RoleValue_X )
			Fz = GetMoveFlagValue( _Global, Site, EM_RoleValue_Z )
		end
		KS_Move( Wind, 30, Fx, Y, Fz );
		Sleep(10)
	end
end

function Z24_bico_BoxAi()
	local FollowBall 
	local Px
	local Py 
	local Pz 
	local TempGID=TargetID()
		Px = ReadRoleValue( TempGID , EM_RoleValue_X )
		Py = ReadRoleValue( TempGID , EM_RoleValue_Y )
		Pz = ReadRoleValue( TempGID , EM_RoleValue_Z )
		FollowBall = CreateObj( 107417 , Px , Py ,Pz , 0 , 1 )
		SetModeEx( FollowBall , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( FollowBall , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( FollowBall , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( FollowBall , EM_SetModeType_Mark, false)			---可點選(是)
		SetModeEx( FollowBall , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
		SetModeEx( FollowBall , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( FollowBall , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條				
		AddToPartition( FollowBall , 0 )
		AddBuff( FollowBall , 623826 ,0 , -1 )
		BeginPlot( FollowBall , "Z24_worldBoss_FireBall" , 0 )
		WriteRoleValue( FollowBall , EM_RoleValue_Livetime, 10 )	
	
end

function Z24_WorldBoss_OnlyBoss()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID) == 107213 then
	return true
	else
	return false
	end
end

function Z24_WorldBoss_OnlyPlayer()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ==1 then
	return true
	else
	return false
	end
end
-----------------------
function Z24_WorldBoss_ScanHateList()--確定每秒檢查仇恨列表
	local Boss=OwnerID();
	while CheckID(Boss)==true and ReadRoleValue(Boss,EM_RoleValue_IsDead)==0 do
		Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
		sleep(10);
	end
end
function Z24_WorldBoss_DeadPlot()--死亡劇情:交接獎勵旗標
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(Boss);
	local Box=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(Box,EM_SetModeType_Show,false);
	SetModeEx(Box,EM_SetModeType_Mark,false);
	AddToPartition(Box,RoomID);
	Lua_DW_WBGUIDSwitch(1,Box);--將世界王的獎勵標準轉移到隱形箱子上
	WriteRoleValue(Box,EM_RoleValue_LiveTime,60);
end