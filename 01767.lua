---呼叫分身用

function AP_Ocean_callBoss_Easy()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--local Boss = OwnerID()
	--CastSpell( OwnerID() , OwnerID() , 493492) --只有特效，沒有效果的法術
	sleep(15) --停頓 1.5 秒後才將分身叫出
	local Boss_other = LuaFunc_CreateObjByObj ( 103478, OwnerID() )  --將分身叫出
	WriteRoleValue( Boss_other , EM_RoleValue_PID , OwnerID() )
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	WriteRoleValue( Boss_other , EM_RoleValue_Register1   , AttackTarget )
	BeginPlot(Boss_other,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	SetAttack( Boss_other , AttackTarget )		------0618小鑫新增
end


----分身嘎巴簡單 AI --水牢術 --

function Lua_AP_jail_Easy()
	while 1 do		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		local Tank_Num = 0
		sleep(10)
	
		while 1 do	
			sleep(10)
			SetPlot( OwnerID(),"dead","AP_jail_2_Easy",10 )   --死亡劇情
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				local partymember = LuaFunc_PartyData( AttackTarget)		--讀當前目標的partydata		
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				counter4 = counter4 + 1
				local Boss_1 = OwnerID()
				if counter1 == 1 then
					for i = 1 , partymember[0] , 1 do
						
						local Boss_Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
						if partymember[i] == Boss_Target then
							Tank_Num = i  --將 Boss_taget 的編號寫入 Tank_Num
							--Say(OwnerID(),Tank_Num)
							break	--跳出這一個迴圈
						end
					end
					for j = 1 , 100 do
						local jail = Rand(partymember[0]-1)+1    --因為partymember 是 從 0 開始
						if jail ~= Tank_Num then
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_6]", 1 )    --字串要新增
							Say( OwnerID() , "[SC_102063_6]" )	---安靜的待在這吧 ！！  ((獅魚人語 )
							sleep(10)
							CastSpell( OwnerID() , partymember[jail] , 493491) -----水牢術
							WriteRoleValue( Boss_1 , EM_RoleValue_Register2   , partymember[jail] )
							break
						end
					end	
				end	
				
				--if counter2 == 22 then      --將分身會補血的技能先暫時拔除
				--local Boss_Heal = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
					--CastSpell( OwnerID() , Boss_Heal, 493493)   --對嘎巴施放"獅魚人的憐憫"
					--counter2 = 0
					--sleep(10)
				--end
				
				if counter3 == 9 then
					
					CastSpell( OwnerID() , TargetID() , 493217)  --對目標施放"巨力連擊"
					counter3 = 0
					sleep(10)
				
				end
			end
		end
	end
end
	
	
function AP_jail_2_Easy()
	local OP = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)  
	CancelBuff( OP, 503730 )   --將原先被水牢所困的玩家解除
end

	
	

------------隱形飛劍 -----------------------------	
function AP_sword_1_Easy()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local sword = LuaFunc_CreateObjByObj ( 103479, OwnerID() )  --將隱形的怪物叫出來
	SetModeEx( sword   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( sword  ,  EM_SetModeType_Strikback, false )--反擊
	SetModeEx( sword   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( sword   , EM_SetModeType_Searchenemy, true) --搜尋敵人
	SetModeEx( sword   , EM_SetModeType_Mark, false )--標記
	SetModeEx( sword   , EM_SetModeType_ShowRoleHead, false )--頭像框
	--SetModeEx( sword   , EM_SetModeType_Show, false )--先隱形
	--SetModeEx( sword   , EM_SetModeType_Show, true )--再秀出，目的是為了可以正確的把上列的功能使用出來
	Hide( sword )
	--WriteRoleValue(sword, EM_RoleValue_Livetime,30)
	AddToPartition( sword ,    RoomID )	--加進舞台
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
end


--------------------------------------------嘎巴完整 AI -------------------------------------------------

function AP_OceanBoss_4_Easy()	
	while 1 do		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		local counter5 = 0
		--WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) 
		local pid = 0
		--Say( OwnerID(),  AttackTarget ) 
		sleep(10)
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				--counter1 = counter1 + 1		0617小鑫暫時取消衝鋒
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				counter4 = counter4 + 1
				counter5 = counter5 + 1
				if counter1 == 10 then
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then       							
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_1]", 1 )    --字串要新增
							Say( OwnerID() , "[SC_102063_1]" )	----這不是你們該來的地方！人類！(獅魚人語)
							sleep(10)
							CastSpell( OwnerID() , partymember[i] , 493189) 	 ----嘎巴衝鋒						
						end
					end	
					counter1 = 0
				end
				if counter2 == 25 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_2]", 1 )    --字串要新增
					Say( OwnerID() , "[SC_102063_2]" )	----   嘎巴的身上散發出詭異的魔力波動 ！！
					sleep(10)
					CastSpell( OwnerID() , OwnerID() , 495327) 	 ----嘎巴秘術						
					sleep(10)
					counter2 = 0
				end
				if 	counter3 == 58 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_3]", 1 )    --字串要新增
					Say( OwnerID() , "[SC_102063_3]" )	----吼 ！ 忽然感覺到一陣天搖地動 ！！
					CastSpell( OwnerID() , OwnerID() , 493188) 	 ----音波震吼					
					sleep(10)	
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_5]", 1 )    --字串要新增
					Say( OwnerID() , "[SC_102063_5]" )	----惹嘎巴生氣的人 ！都該死 ！ [ 獅魚人語 ]
					sleep(10)
					CastSpell( OwnerID() , OwnerID() , 495346) 	 ----嘎巴之怒
					SetFightMode ( OwnerID(),1, 0, 0,1 )	-----0617小鑫新增，不讓他邊跑邊放
					sleep(10)
					SetFightMode ( OwnerID(),1, 1, 1,1 )
					counter3 = 0
				end
				if counter4 == 13 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_4]", 1 )    --字串要新增
					Say( OwnerID() , "[SC_102063_4]" )	----  嘗嘗大海最強大的破壞力吧 ！！[ 獅魚人語 ]
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 493221 , 40) 	 ----漩渦迴擊					
					counter4 = 0
				end
				
				if counter5 == 7 then
					local anyone = Rand(partymember[0]-1)+1    --因為partymember 是 從 0 開始
					CastSpell( OwnerID() , partymember[anyone] , 495136) 	 ----嘎巴漩渦					
					sleep(10)							
					counter5 = 0
				end
			else
				break		-------0617小鑫新增，幫你重置counter	
			end
		end
	end
end
	

											