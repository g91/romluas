------------------------------------------------------------
------夢境Boss-----喀里恩尤薩里安--------------
-----保留技能----全場冰，留下兩個人。

function Lua_apon_102850_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Check_life = 0
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPLX = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	local CheckTime = 10	-- 每秒判斷
	local WiDiMark = 0
	local WuDiTime = 10 *30	-- 無敵30秒
	local IceMark = 0
	local IceTime = 10 *15	-- 每15秒冰一個
	local SkillTime = 2.5		-- 技能延遲時間
	local HammerFlagID = 780286
	local HammerFlag = {}
	local Hammer = {}
	local HammerID = 112324
	local IceDistance = 500
	local BuffID = 502826	-- 水汽凝結
	local StartHammer = 0

	local SkillID = { 492379, 492380, 492381, 492382, 502826, 492573 }
	local SkillLV = { 15, 30 , 1800 , 20 , 1 , 1 }
	local SkillSay = { "[SC_101501_01]", "[SC_101501_02]", "[SC_101501_03]", "[SC_101501_04]", "[SC_101501_05]", "[SC_101501_06]" }
	
	for f = 1, 	GetMoveFlagCount( HammerFlagID )-1 do
		table.insert( HammerFlag , f )
	end

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		--if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
		if HateListCount( OwnerID() ) ~= 0 then
			Check_life = 1
			if StartHammer == 0 then
				HammerFlag = Lua_MixTable( HammerFlag )
				local thisHammerFlag = HammerFlag[1]
				local thisHammerID = Lua_DW_CreateObj( "flag" , HammerID , HammerFlagID , thisHammerFlag , 1 , 1 )
				table.insert( Hammer  , thisHammerID )
				SetPlot( thisHammerID , "Touch" , "LuaS_112324_GetHammer" , 25 )
				AddBuff( thisHammerID , 502840 , 1 , 600 )		-- 亮晶晶
				StartHammer = 1
			end


			if WiDiMark >= 40 then
				local SkillShow = 6	-- 無敵
				local IceTarget = 0

				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime*2 )
				WuDiTime = HateListCount( OwnerID() )*50 			--以人數決定無敵時間長短  (小鑫修正)
				Buff_WuDiTime = WuDiTime / 10				--無敵Buff時間 (小鑫修正)

				ScriptMessage( OwnerID() , 0 , 2 ,  SkillSay[SkillShow], C_SYSTEM )		-- 開始無敵
				SetFightMode(  OwnerID() , 1, 0, 1, 1 )		-- 不移動
				Sleep( 2 )
				
				AddBuff( OwnerID() , 502827 , 1 , Buff_WuDiTime  )					-- 皮膚硬化 (小鑫修正,防止無敵有時候施放失敗)	
				
				for i = 1, table.getn( Hammer ) do	-- 先刪掉場上的的破冰之鎚
					if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then		DelObj( Hammer[i] )	end
				end
				
				if ( Hammer ~= nil ) then	
					Hammer = {}	
				end

				HammerFlag = Lua_MixTable( HammerFlag )
				local HateListRand = HateListRandom( OwnerID() )
				for t = 1, table.getn( HateListRand ) - 3 do	-- -3 就是(最後)兩個玩家不冰
					local SkillShow = 5	-- 冰
					local thisHammerFlag = HammerFlag[t]
					local thisHammerID = Lua_DW_CreateObj( "flag" , HammerID , HammerFlagID , thisHammerFlag+2 , 1 , 1 )	
					table.insert( Hammer  , thisHammerID )
					SetPlot( thisHammerID , "Touch" , "LuaS_112324_GetHammer" , 25 )
					AddBuff( thisHammerID , 502840 , 1 , 600 )		-- 亮晶晶

					IceTarget = HateListRand[t]
					if GetDistance( OwnerID() , IceTarget ) <= IceDistance then
						ScriptMessage( OwnerID() , IceTarget , 1 ,  SkillSay[SkillShow], C_SYSTEM )	-- 冰人
						AddBuff( IceTarget , SkillID[SkillShow] , 1 , 600 )		-- 10 分鐘
					end
				end
				
				------檢查是不是全冰了，是的話隨機一個解冰--------
				sleep(10)
				
				local AllIceCheck = 0
				local Freeman = 0
				for i = 1 , table.getn( HateListRand ) , 1 do
					if CheckBuff( HateListRand[i] , 502826 ) == true then
						AllIceCheck = AllIceCheck + 1
					end
				end
				if HateListCount( OwnerID() ) > 1 and AllIceCheck == table.getn( HateListRand ) then
					Freeman = HateListRand[ table.getn( HateListRand )]
					for i = 1 , table.getn( HateListRand ) -3 , 1 do -------檢查一定要是活的人才放掉，但如果只有一個活人，冰給他死
						if ReadRoleValue( Freeman , EM_RoleValue_IsDead ) == 1 then
							Freeman = HateListRand[ table.getn( HateListRand )-i]
						else
							break
						end
					end							
					CancelBuff( Freeman , 502826 )
				end				
				-----------------------------------------------------------------------
				Sleep( WuDiTime-20 )
				ScriptMessage( OwnerID() , 0 , 2 ,  "[SC_101501_07]", C_SYSTEM )		-- 解除無敵
				WiDiMark  = 0			
				SetFightMode(  OwnerID() , 1, 1, 1, 1 )						-- 恢復正常				
				SkillShow = 4
				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime - 10 )
				CastSpellLV( OwnerID() , HateTargetID() , SkillID[SkillShow] , SkillLV[SkillShow] )	-- 無敵清場
			end

				local SkillRND =  Rand( 100 )+1	-- 產生亂數
				--Say( OwnerID() , SkillRND .." %" )
				local SkillShow = 1
				if SkillRND <= 100 and SkillRND > 75 then
					SkillShow = 1
				elseif SkillRND <= 75 and SkillRND > 50 then
					SkillShow = 2
				elseif SkillRND <= 50 and SkillRND > 5 then
					SkillShow = 3
				elseif SkillRND <= 5 and SkillRND > 0 then
					SkillShow = 1
					--SkillShow = 4
				end

				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime )
				--Say( OwnerID() ,  SkillSay[SkillShow] )
				CastSpellLV( OwnerID() , HateTargetID() , SkillID[SkillShow] , SkillLV[SkillShow] )

			--end
			WiDiMark = WiDiMark + 1
			IceMark = IceMark + 1
		elseif HateListCount( OwnerID() ) == 0 then
			--SetPosByFlag( OwnerID(), 780388 , 1 )----將 DK 傳到場中間
			local ID = {}
			local ID_2 = {}
			local ID_2_all = 0
			--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
			--if  ( AttackTarget ~= 0 ) then
				--SetAttack(OwnerID(),AttackTarget)
			--end
			
			if Check_life == 1 then
				local PPL = SetSearchAllPlayer(roomid1)
				--sleep(10)
				--DeBugMsg(0,0,"PPL = "..PPL)
				if PPL==0 then-----------------------------檢查裡面是否 有沒有人
					for i = 1, table.getn( Hammer ) do	-- 先刪掉場上的的破冰之鎚
						if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then	
							DelObj( Hammer[i] )
						end
					end
					
					if ( Hammer ~= nil ) then	
						Hammer = {}	
					end
					
					WriteRoleValue( Boss, EM_RoleValue_PID, 1)
					sleep(30)
					Delobj(OwnerID())
				
				elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
					for i = 1 , PPL , 1 do 
						ID[i] = GetSearchResult()
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
							ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
							GetDistance( OwnerID(), ID[i]) >=1300 then
							PPLX=PPLX+1
							--DeBugMsg(0,0,"ID ="..ID[i])
							--DeBugMsg(0,0,"PPLX = "..PPLX)
						else
							table.insert( ID_2 , ID[i] ) 
						end
						Check_ID = table.getn(ID)	
						--say(OwnerID(),"Check_ID_2 =="..Check_ID)
					end
					
					if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
						for i = 1, table.getn( Hammer ) do	-- 先刪掉場上的的破冰之鎚
							if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then		
								DelObj( Hammer[i] )	
							end
						end
						
						if ( Hammer ~= nil ) then	
							Hammer = {}	
						end
						
						WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----要是相等的話回報主體，進行重置
						sleep(30)
						Delobj(OwnerID())
						break
					elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
						ID_2_all = table.getn(ID_2)
						for i = 1 , ID_2_all , 1 do
						--for i = 1 , PPL , 1 do 
							--ID[i] = GetSearchResult()
							--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
								--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
								--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
								SetAttack( OwnerID() , ID_2[i] )
								PPLX = 0
								PPL = 0
								--pos = 1
							--end
						end
					end
				end
			end	
		else

			WiDiMark = 0
			IceMark = 0
			StartHammer = 0

			for i = 1, table.getn( Hammer ) do	-- 離開戰鬥刪破冰之鎚
				if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then		DelObj( Hammer[i] )	end
			end
			if ( Hammer ~= nil ) then	Hammer = {}	end

		end

		Sleep( CheckTime )
	end

end


----------------------------------------
---------夢境Boss-----小棉蟲-------

function Lua_apon_102853_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Check_life = 0
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPLX = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	while 1 do 
		sleep(10)
		local counter1 = 0												-------------蟲蟲危機發動計時器	
		local counter2 = 0												-------------一般技能出招計時器
		local ModeCheck = 503981										-------------模式檢查用				
		local Mode1 = 503983											-------------模式1		
		local Mode2 = 503984											-------------模式2	
		local CombatBegin = 0											-------------戰鬥開始旗標
		local Skill = { 493663 , 493664 , 493665 , 493787 , 493788 }	--------------- 1.尖角穿刺   	2.裂地	3.王蟲震攝		4.塵土飛揚		5.現身(未使用)		
		local SkillLv = {0 , 0 , 0 , 0 , 0}
		local SkillString = { "[SC_102349_1]" , "[SC_102349_2]" , "[SC_102349_3]" }
		
		local LittleWormID = 102351		----------自爆小蟲
		local LittleWorm = {}			----------自爆小蟲GID存放用
		local FakeBossID = 102890		----------Boss分身
		local WormHoleFlag = 780396		----------蟲洞旗子( 潛入地下)
		local Earthquake = 1			----------是否表演鑽入土中
		local ControlSpell = 493666			---------靈魂連結	
		local NowHP = 0
			
		while 1 do	
			sleep(10)	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
			if HateListCount( OwnerID() ) ~= 0 then
				Check_life = 1
			
				if CombatBegin == 0 then							---------------只有開場放一次
					AddBuff( OwnerID() , ModeCheck , 0 , -1 )		----------------------------上Boss模式檢查Buff
					AddBuff( OwnerID() , Mode1 , 0 , -1 )		----------------------------Boss模式1  
					CombatBegin = 1
				end	
				counter1 = counter1 + 1							----------蟲蟲危機開始計時
				counter2 = counter2 + 1							----------一般技能技能
				local partymember = LuaFunc_PartyData(AttackTarget)				
				local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
				local Luck = Rand( 100 )		--------- 出招亂數
				local SkillIndex = 1
				local BossTarget = AttackTarget

				if CheckBuff(OwnerID() , Mode1) == true then							-----------------處於模式1
					Earthquake = 1					
				elseif CheckBuff(OwnerID() , Mode2) == true then							-----------------處於模式2
					if Earthquake == 1 then
						local BeControlled = 0
						WriteRoleValue( OwnerID() , EM_RoleValue_AttackDelay , 20 )			------延遲普攻2秒( 要確定功能都ok )
						SetModeEx( OwnerID() , EM_SetModeType_Move , false )			------乖乖站著播特效
						CastSpellLV( OwnerID() , AttackTarget , ControlSpell , 0 )			-------靈魂連結綁人
						sleep(30)
						while 1 do
							BeControlled = Rand(table.getn(partymember))+1
							if ReadRoleValue( partymember[BeControlled] , EM_RoleValue_IsDead ) == 0  then								
								AddBuff( partymember[BeControlled] , 504825 , 0 , -1 )								
								break
							else
								table.remove( partymember , partymember[BeControlled] )
							end	
						end	
						WriteRoleValue( OwnerID() , EM_RoleValue_register1 , partymember[BeControlled] )						
						CastSpellLV( OwnerID() , OwnerID() , Skill[4] , SkillLv[4] )		-------------------表演潛入土中
						sleep(15)
						SetModeEx( OwnerID() , EM_SetModeType_Move , true )	
						local Hole = {1 , 2 , 3 , 4 , 5 , 6}
						local HoleNumber = Rand(6)+1
						table.remove( Hole , HoleNumber )
						local HoleNumber1 = Rand(table.getn( Hole ) ) + 1												
						SetPosByFlag( OwnerID(), WormHoleFlag , HoleNumber )						
						NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )	-------紀錄王當前血量
						local FakeBoss = CreateObjByFlag( FakeBossID , WormHoleFlag , Hole[HoleNumber1] , 1 )		---------------分身出現
						AddToPartition( FakeBoss , Room )
						SetAttack( FakeBoss , AttackTarget )
						AddBuff( FakeBoss , 504823 , 0 , -1 )
						WriteRoleValue( FakeBoss , EM_RoleValue_register1 , AttackTarget )
						WriteRoleValue( FakeBoss , EM_RoleValue_register3 , NowHP )
						CallPlot( FakeBoss , "Lua_apon_102853_dreamking_1" , OwnerID() )
						Earthquake = 2
					end	
				end	

				if counter1 == 25 then							--------蟲蟲危機發動
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0  then 						
							local LittleWormTemp = lua_star_CreateNPC( partymember[i] , 0 , LittleWormID , 450 , Room )	--------生出自爆蟲
							LittleWorm[table.getn( LittleWorm )+1] = LittleWormTemp									--------並將GID存入table	
							Setplot( LittleWormTemp , "range" , "lua_star_BossAI_BigWorm_2" , 40)
							BeginPlot(LittleWormTemp,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
							--Setplot( LittleWormTemp , "dead" , "lua_star_BossAI_LittleDead" , 30)					-----為了刪掉小蟲屍體
							SetAttack( LittleWormTemp , partymember[i] )
						end
					end
					counter1 = 0
				end	
				
				if counter2 >= 10 then					-----------Boss一般技能施放
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
						SkillIndex = 2
						BossTarget = HateTargetID()									
					end	
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
					sleep(10)
					counter2 = 0
				end	
			elseif HateListCount( OwnerID() ) == 0 then
				--SetPosByFlag( OwnerID(), 780388 , 1 )----將 DK 傳到場中間
				local ID = {}
				local ID_2 = {}
				local ID_2_all = 0
				--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
				--if  ( AttackTarget ~= 0 ) then
					--SetAttack(OwnerID(),AttackTarget)
				--end
				
				if Check_life == 1 then
					local PPL = SetSearchAllPlayer(roomid1)
					--sleep(10)
					--DeBugMsg(0,0,"PPL = "..PPL)
					if PPL==0 then-----------------------------檢查裡面是否 有沒有人
						--DeBugMsg(0,0,"MOB_1  ")
						WriteRoleValue( Boss, EM_RoleValue_PID, 1)
						sleep(30)
						Delobj(OwnerID())
					
					elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
						for i = 1 , PPL , 1 do 
							ID[i] = GetSearchResult()
							if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
								ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
								GetDistance( OwnerID(), ID[i]) >=1300 then
								PPLX=PPLX+1
								--DeBugMsg(0,0,"ID ="..ID[i])
								--DeBugMsg(0,0,"PPLX = "..PPLX)
							else
								table.insert( ID_2 , ID[i] ) 
							end
							Check_ID = table.getn(ID)	
							--say(OwnerID(),"Check_ID_2 =="..Check_ID)
						end
						
						if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
							--DeBugMsg(0,0,"MOB_2 ")
							WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----要是相等的話回報主體，進行重置
							sleep(30)
							Delobj(OwnerID())
							break
						elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
							ID_2_all = table.getn(ID_2)
							for i = 1 , ID_2_all , 1 do
							--for i = 1 , PPL , 1 do 
								--ID[i] = GetSearchResult()
								--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
									--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
									--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
									SetAttack( OwnerID() , ID_2[i] )
									PPLX = 0
									PPL = 0
									--pos = 1
								--end
							end
						end
					end
				end	
			else
				for i = 1 , table.getn( LittleWorm ) do
					if CheckID( LittleWorm[i] ) == true and LittleWorm[i] ~= nil then
						DelObj( LittleWorm[i] )
					end
				end
				break		------------------------離開戰鬥跳出當前迴圈，重置所有變數
			end	
		end		
	end
end


function Lua_apon_102853_dreamking_1(Boss)		------Boss分身劇情
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )	
	--WriteRoleValue( OwnerID() , EM_RoleValue_HP , HP )	---------7/21紀錄Boss血量暫時先拿掉
	WriteRoleValue( OwnerID() , EM_RoleValue_register2 , Boss )
	--local player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	--local partymember = LuaFunc_PartyData( player )
	local BeControlled = ReadRoleValue( Boss , EM_RoleValue_register1 )
	local counter = 0
	 
	WriteRoleValue( OwnerID() , EM_RoleValue_register1 , BeControlled )
	Setplot(OwnerID() , "dead" , "Lua_apon_102853_dreamking_2" , 30)
	for i=1 , 35 do
		if CheckID(OwnerID()) == true then
			counter = counter + 1
			sleep(10)
			if counter == 20 then
				DelObj(OwnerID())
				break
			end
		else
			break	
		end	
	end	
end

function Lua_apon_102853_dreamking_2()			-------分身死亡劇情
	local ControllBuff = 504825
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	CancelBuff( BeControlled , ControllBuff )
end



function lua_apon_102853_TransferDM()	--------因為觸發法術的被攻擊觸發只有物理攻擊才能觸發，所以改用每秒產生法術來做( 504034連續產生用 )
	local ControllBuff = 504825
	local LastDamage = ReadRoleValue( OwnerID() , EM_RoleValue_LastDHp )	-------最後一次被傷害值( 這個值並不會自己清空 )
	local LastTemp = 0														-------暫存前一次的最後被傷害值
	if ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 0 then  		-------register5用來判斷是當次的被傷害值還是前一次的
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register6 , LastDamage )	-------register6存放當次被傷害值
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register7 , LastDamage )	-------register7存放前一次被傷害值
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register6 )
	end		 
	local TransDamage = LastDamage*0.5										--------轉移玩家攻擊分身傷害比例
	local TD = math.floor(abs(TransDamage))	
	local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	if LastDamage ~= LastTemp then
		SysCastSpellLV(OwnerID() , BeControlled , 493696 , TD )
	end	
end