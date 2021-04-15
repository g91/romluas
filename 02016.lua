--------------------------------------------------------------------------------主控制器
function Cang_130_tree_control_6()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Boss
	local count = 0
	local Dead = 0
	local Buff = 507380
	--生出boss
	Boss = CreateObjByFlag( 104465, 780711, 0, 1) 
	AddToPartition( Boss , RoomID )	
	WriteRoleValue( Boss , EM_RoleValue_Register1, OwnerID() )
	BeginPlot(Boss,"Cang_130_tree_6",0)
	SetPlot( Boss, "dead" , "Cang_130_tree_dead_6" ,0 )	
	
	local Door = CreateObjByFlag( 104471 , 780711 , 5 , 1 )
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door  , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( Door  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( Door , RoomID )	--加進舞台
	
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) 
		Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
		if Dead == 1 then
			sleep(1)
			DelObj( Door )
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
			local ThesePlayer = {}	
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- 接暫存值
				if CheckID( ThesePlayer[i] ) == true and 
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
					if CheckBuff( ThesePlayer[i] , Buff ) == true then
						CancelBuff(ThesePlayer[i], Buff)	
					end
				end					
			end
			break
		end		
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查Boss是否戰鬥中
			count = 1
			if ( CheckID( Boss ) == false ) or 
			ReadRoleValue( Boss,EM_RoleValue_IsDead ) == 1 then
				count = 0
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer = {}	
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					if CheckID( ThesePlayer[i] ) == true and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
					--檢查玩家是不是還在；檢查是否死亡
						if CheckBuff( ThesePlayer[i] , Buff ) == true then
							CancelBuff(ThesePlayer[i], Buff)	
						end
					end					
				end
				--break
			end
		end
		if (  AttackTarget == 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥
			--boss戰鬥過，沒死沒目標，重置
			if count == 1 then
				sleep(10)
				DelObj( Boss )
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer = {}	
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					if CheckID( ThesePlayer[i] ) == true and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
					--檢查玩家是不是還在；檢查是否死亡
						if CheckBuff( ThesePlayer[i] , Buff ) == true then
							CancelBuff(ThesePlayer[i], Buff)	
						end
					end					
				end
				sleep(50)
				Boss = CreateObjByFlag( 104465, 780711, 0, 1) 
				AddToPartition( Boss , RoomID )	
				WriteRoleValue( Boss , EM_RoleValue_Register1, OwnerID() )
				BeginPlot( Boss,"Cang_130_tree_6",0 )		
				SetPlot( Boss, "dead" , "Cang_130_tree_dead_6" ,0 )
				count = 0
			end	
		end		
		if	ReadRoleValue( Boss,EM_RoleValue_IsDead ) == 1 or	--檢查Temp1是否死亡
			CheckID( Boss ) == false then				--檢查Temp1是否戰鬥中		
			if count == 1 then
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer = {}	
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					if CheckID( ThesePlayer[i] ) == true and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
					--檢查玩家是不是還在；檢查是否死亡
						if CheckBuff( ThesePlayer[i] , Buff ) == true then
							CancelBuff(ThesePlayer[i], Buff)	
						end
					end					
				end			
				break
			end
		end
	end	
end

function Cang_130_tree_dead_6()
	local control = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	WriteRoleValue( control , EM_RoleValue_Register9, 1 )
end
--------------------------------------------------------------------------------Boss主體AI
function Cang_130_tree_6()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local count = 0
	local count1 = 0
	local count2 = 0
	local count3 = 0
	local count4 = 0
	local count5 = 0
	local M_tree1
	local L_tree1, L_tree2, L_tree3, L_tree4 
	--local little_tree = {}	--小樹table
	--local mid_tree = {}		--中樹rable	
	local mid_tree1 = {}	--中樹rable	
	local mid_tree_1 = {}	--中樹rable	
	local Alltree = {}
	local Doorstart = 0		--開戰只做一次用開關
	local M_t = 104466		--中樹
	local L_t = 104467		--小樹
	local Mode1 = 507371	--階段1
	local Mode2 = 507372	--階段2	
	local Buff_L_t = 507376	--小樹buff
	local mark = 0			--消盾
	WriteRoleValue( OwnerID() , EM_RoleValue_Register9, mark )
	local SkillAoE = { 495998, 495999 } 
	--降治療, 暈兩秒
	local SkillDelay = { 1 , 1 }		--技能延遲時間
	local CheckTime = 10				--延遲
	local SkillID = { 496000 , 496001 }	--招式ID	
	local SkillLV = { 9 , 0 }			--技能等級
	local countskill = 0				--技能計數
	local Door
	local Mconut = 0
	local say1 = 0
	local CountSay = { "[SC_104144_01]",  "[SC_104144_02]", "[SC_104144_03]", "[SC_104144_04]", "[SC_104144_05]", "[SC_104144_06]" , "[SC_104144_07]"  }
	--破壞自然法則的罪人阿，你們將永遠成為這片土地的一部分，滋潤整片大地！
	--在自然法則的運行中，除了自然之力以外，都無法被使用！
	--感受自然之源憤怒的力量吧！
	--破壞者將受到自然力量無情的反撲。
	--甦醒吧，我的僕從，給予這些罪人最大的懲罰。
	--來點驚喜吧，凡人。
	--世上沒有可以擊破自然之力所匯集的護盾！
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  
			if Doorstart == 0 then
				ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
--------------開場執行：time時間階段，buff不可用物品，cy水晶產生，盾檢查，生門
				BeginPlot( OwnerID() , "Cang_130_tree_time_6", 0)
			---	BeginPlot( OwnerID() ,"bk_hacker_17_130_05",0)--------------------------------防駭客機制
				ScriptMessage( OwnerID() , -1 , 2 , CountSay[2], 1 )
				BeginPlot( OwnerID() , "Cang_130_tree_shief_6", 0)
				Door = CreateObjByFlag( 104471 , 780711 , 6 , 1 )
				SetModeEX( Door  , EM_SetModeType_Gravity , false )--重力
				SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
				SetModeEx( Door  , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( Door  , EM_SetModeType_Mark, false )--標記
				SetModeEx( Door  , EM_SetModeType_Move, false )--移動
				SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Door  , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( Door  , EM_SetModeType_Strikback, false )--反擊	
				AddToPartition( Door , RoomID )	--加進舞台		
				WriteRoleValue( Door , EM_RoleValue_PID, OwnerID() )					
				BeginPlot( Door , "Cang_130_tree_summomkill_6", 0)				
				Doorstart = 1		
			end	
			count2 = count2 + 1
			count3 = count3 + 1
			countskill = countskill + 1

--------------15秒對所有的樹靈放Buff
			if count2 >= 15 then
				Alltree = {}
				Alltree = SearchRangeNPC( OwnerID() , 400 )		
				if table.getn(Alltree) ~= 0 then				--有樹	
					for i = 1, table.getn(Alltree) do			--執行對樹放BUFF
						if Alltree[i] ~= OwnerID() then
							if ReadRoleValue( Alltree[i] , Em_RoleValue_OrgID ) == M_t or ReadRoleValue( Alltree[i] , Em_RoleValue_OrgID ) == L_t then
								AddBuff(Alltree[i] , Buff_L_t , 0 , -1)
							end	
						end	
					end
					count2 = 0
				end	
			end
--------------第一階段			
			if CheckBuff( OwnerID(), Mode1) == true then
				--引爆所有中樹
				--40秒後轉回一階段，中樹爆炸	
				count1 = count1 + 1
				count4 = 0
				Mconut = 0
				if count5 == 1 then
					--掃場上所有NPC
					mid_tree1 = {}
					mid_tree1 = SearchRangeNPC( OwnerID() , 400 )
					if table.getn(mid_tree1) ~= 0 then
						if say1 == 0 then
							ScriptMessage( OwnerID() , -1 , 2 , CountSay[6], 1 )
							say1 = 1
						end
						--當裡面的樹是中樹, 殺掉刪除
						for i= 0, table.getn(mid_tree1) do 
							if ReadRoleValue( mid_tree1[i] , Em_RoleValue_OrgID ) == M_t then
								KillID( OwnerID(), mid_tree1[i] )
								sleep(5)
								DelObj( mid_tree1[i] )
							end		
						end	
					end	
				end	
--------------生命之盾				
				if count1 >= 30 then 
					mark = 0
					WriteRoleValue( OwnerID() , EM_RoleValue_Register9, mark )
					ScriptMessage( OwnerID() , -1 , 2 , CountSay[7], 1 )
					CastSpellLV( OwnerID() , OwnerID() , 496003 , 3 )
					AddBuff( OwnerID() , 507381 , 2 , -1 )
					Sleep(30)
					count1 = 0
				end
				if count == 0 then
					--招四小怪	
					ScriptMessage( OwnerID() , -1 , 2 , CountSay[5], 1 )
					L_tree1 = CreateObjByFlag( L_t, 780711, 1, 1)			
					AddToPartition( L_tree1 , RoomID )
					WriteRoleValue( L_tree1 , EM_RoleValue_PID, OwnerID() )	
					BeginPlot( L_tree1 , "Cang_130_Littletree_skill_6", 0)
					L_tree2 = CreateObjByFlag( L_t, 780711, 2, 1)	
					AddToPartition( L_tree2 , RoomID )
					WriteRoleValue( L_tree2 , EM_RoleValue_PID, OwnerID() )	
					BeginPlot( L_tree2 , "Cang_130_Littletree_skill_6", 0)					
					L_tree3 = CreateObjByFlag( L_t, 780711, 3, 1)						
					AddToPartition( L_tree3 , RoomID )
					WriteRoleValue( L_tree3 , EM_RoleValue_PID, OwnerID() )	
					BeginPlot( L_tree3 , "Cang_130_Littletree_skill_6", 0)					
					L_tree4 = CreateObjByFlag( L_t, 780711, 4, 1)			
					AddToPartition( L_tree4 , RoomID )
					WriteRoleValue( L_tree4 , EM_RoleValue_PID, OwnerID() )	
					BeginPlot( L_tree4 , "Cang_130_Littletree_skill_6", 0)					
					count = 1
				end	
--------------降治療技能				
				if count3 >= 10 then
					--每20秒AOE傷害, 降治療
					ScriptMessage( OwnerID() , -1 , 2 , CountSay[4], 1 )
					CastSpellLV( OwnerID() , OwnerID() , SkillAoE[1] , 10 )
					Sleep(10)
					count3 = 0
				end		
				if countskill >= 7 then
					local SkillRND = DW_Rand ( 100 ) 
					if SkillRND <= 100 and SkillRND > 75 then 
						SkillShow = 1	--
						BossTarget = OwnerID()					
					elseif SkillRND <= 75 and SkillRND > 50 then 
						SkillShow = 2	--
						BossTarget = AttackTarget						
					elseif SkillRND <= 50 and SkillRND > 25 then 
						SkillShow = 1	--
						BossTarget = OwnerID()										
					elseif SkillRND <= 25 and SkillRND > 0 then 
						SkillShow = 2	--
						BossTarget = AttackTarget					
					end	
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end
					CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay[SkillShow] * CheckTime )	
					SkillShow = 0
					countskill = 0
				end			
--------------第二階段				
			elseif CheckBuff( OwnerID(), Mode2) == true then
				--最多四隻中樹	
				count4 = count4 + 1
				count1 = 0
				count5 = 1
				say1 = 0
				count = 0	
				--每8秒招中怪
				if count4 >= 7 then
					--掃場上物件
					if Mconut < 3 then
						Alltree = {}
						mid_tree_1 = {}
						Alltree = SearchRangeNPC( OwnerID() , 400 )
						for i= 0, table.getn(Alltree) do 
							if ReadRoleValue( Alltree[i] , Em_RoleValue_OrgID ) == M_t then
								mid_tree_1[table.getn(mid_tree_1)+1] = Alltree[i]
							end					
						end
						if table.getn(mid_tree_1) < 4 then
							local rmd = DW_rand(4)
							M_tree1 = CreateObjByFlag( M_t, 780711, rmd, 1)			
							AddToPartition( M_tree1 , RoomID )
							WriteRoleValue( M_tree1 , EM_RoleValue_PID, OwnerID() )	
							BeginPlot( M_tree1 , "Cang_130_Midtree_skill_6", 0)					
							count4 = 0
						end	
						Mconut = Mconut + 1
					end	
				end
				if count3 >= 15 then
					--每20秒AOE傷害, 降暈兩秒
					ScriptMessage( OwnerID() , -1 , 2 , CountSay[3], 1 )
					CastSpellLV( OwnerID() , OwnerID() , SkillAoE[2] , 10 )
					Sleep(20)
					count3 = 0
				end			
				if countskill >= 7 then
					local SkillRND = DW_Rand ( 100 ) 
					if SkillRND <= 100 and SkillRND > 75 then 
						SkillShow = 1	--
						BossTarget = OwnerID()					
					elseif SkillRND <= 75 and SkillRND > 50 then 
						SkillShow = 2	--
						BossTarget = AttackTarget						
					elseif SkillRND <= 50 and SkillRND > 25 then 
						SkillShow = 1	--
						BossTarget = OwnerID()										
					elseif SkillRND <= 25 and SkillRND > 0 then 
						SkillShow = 2	--
						BossTarget = AttackTarget					
					end	
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end
					CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay[SkillShow] * CheckTime )	
					SkillShow = 0
					countskill = 0	
				end				
			end
		end	
	end		
end			
--------------------------------------------------------------------------------計時
function Cang_130_tree_time_6()

	local Mode1 = 507371	--階段1
	local Mode2 = 507372	--階段2
	local Mode3 = 507451
	local M1time = 0
	local C_time = 0
	AddBuff( OwnerID() , Mode1 , 0 , -1 )	
	BeginPlot( OwnerID() , "Cang_130_tree_buff_6", 0)
	BeginPlot( OwnerID() , "Cang_130_tree_cy_6", 0)
	while true do
		sleep(10)
		C_time = C_time + 1 
		M1time = M1time + 1
		if C_time >= 600 then
			AddBuff( OwnerID() , Mode3 , 0 , -1 )	--狂暴
			C_time = 0
		end
		if M1time == 60 then	--如果在階段1 --60
			CancelBuff( OwnerID() , Mode1 )		--刪除1
			AddBuff( OwnerID() , Mode2 , 0 , -1 )	--進入2
		elseif M1time == 100 then	--如果在階段2  --100
			CancelBuff( OwnerID() , Mode2 )		--刪除2
			AddBuff( OwnerID() , Mode1 , 0 , -1 )	--進入1	
			M1time = 0
		end
	end	
end

--------------------------------------------------------------------------------水晶產生
function Cang_130_tree_cy_6()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local cy
	local count1 = 0
	local count2 = 0
	local count3 = 0
	while true do
		sleep(10)
		count1 = count1 + 1
		count2 = count2 + 1 
		if count3 == 0 then
			local bomb = {}
			for i = 0, 1 do
				local any = Rand(10) 
				bomb[i] = CreateObjByFlag( 104520, 780712, any, 1)
				AddToPartition( bomb[i] , RoomID )
				WriteRoleValue( bomb[i] , EM_RoleValue_PID, OwnerID() )	
				AddBuff( bomb[i], 507655, 0 , -1)
				BeginPlot( bomb[i] , "Cang_130_tree_bomb_6", 0)
				--sleep(1)
				--SetPlot( bomb[i] , "dead" , "Cang_130_tree_bombdead_6" ,0 )
			end	
			count3 = 1	
		end		
		if count1 >= 5 then
			local any = Rand(10)
			cy = CreateObjByFlag( 116143, 780712, any, 1) 
			SetModeEX( cy  , EM_SetModeType_Gravity , false )--重力
			SetModeEx( cy  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( cy  , EM_SetModeType_Move, false )--移動
			SetModeEx( cy  , EM_SetModeType_NotShowHPMP, true )
			SetModeEx( cy  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( cy  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( cy  , EM_SetModeType_Strikback, false )--反擊
			WriteRoleValue( cy , EM_RoleValue_Livetime, 10 )	
			AddToPartition( cy , RoomID )	
			SetPlot( cy, "touch" , "Cang_130_item_touch_6" ,30 )
			count1 = 0
		end
	end
end

-------------------------------------------------------------------------------炸彈
function Cang_130_tree_bombdead_6()	
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local count = 0
	local SpellCaster = star_CreateObj_NoAdd( OwnerID() , 104194 , 0 , 0 , 0 , RoomID , 90)
	SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--名稱
	SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )--血條
	SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( SpellCaster , RoomID )	--加進舞台
	BeginPlot( SpellCaster , "Cang_mage_deadtime_6" , 0)	
	if count ==0 then	
	CastSpellLV( SpellCaster , SpellCaster , 496215 , 9 )
		count = 1
	end			
end

function Cang_130_tree_bomb_6()
	local count = 0
	local count1 = 0
	BeginPlot( OwnerID() , "Cang_130_tree_summomkill_6", 0)
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
	local ThesePlayer = {}
	local sway = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
		ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
		ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
			sway[table.getn(sway)+1] = ThesePlayer[i]	--放入Useful裡面 
		end					
	end
	local anyone
	anyone = DW_rand(table.getn(sway))
	SetAttack( OwnerID() , sway[anyone] )
	SysCastSpellLV( sway[anyone] , OwnerID() , 496216, 1)

	while true do
		sleep(10)
		count = count + 1
		count1 = count1 + 1
		if count >= 10 then	
			local TempPlayer1 = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
			local ThesePlayer1 = {}
			local sway1 = {}
			for i=1,TempPlayer1 do
				ThesePlayer1[i] = GetSearchResult() -- 接暫存值
				if CheckID( ThesePlayer1[i] ) == true and 
				ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsDead ) == 0 and 
				ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
					sway1[table.getn(sway1)+1] = ThesePlayer1[i]	--放入Useful裡面 
				end					
			end
			anyone = DW_rand(table.getn(sway1))
			SetAttack( OwnerID() , sway1[anyone] )
			SysCastSpellLV( sway1[anyone] , OwnerID() , 496216, 1)
			count = 0
		end
		--if count1 >= 30 then
		--	KillID( OwnerID(), OwnerID() )
		--end
	end
end
	
--------------------------------------------------------------------------------每秒檢查不可使用物品BUFF
function Cang_130_tree_buff_6()
	local Buff = 507380 --不可使用物品
	while true do			
		local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
		local ThesePlayer = {}	
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() -- 接暫存值
			if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
			--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , Buff ) == false then
					Addbuff(ThesePlayer[i], Buff, 0 , -1)	
				end
			end					
		end
		sleep(50)
	end
end	

--------------------------------------------------------------------------------盾檢查
function Cang_130_tree_shief_6()
	local mark = 0
	while true do		
		sleep(10)
		mark = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
--------------清除盾效果			
		if mark == 1 then
			CancelBuff( OwnerID() , 507381 )
			AddBuff( OwnerID() , 507381 , 1 , -1 )
		elseif mark == 2 then
			CancelBuff( OwnerID() , 507381 )
			AddBuff( OwnerID() , 507381 , 0 , -1 )	
		elseif mark >= 3 then		
			CancelBuff( OwnerID() , 507381 )				
		end
	end
end	
--------------------------------------------------------------------------------王死自己刪除自己
function Cang_130_tree_summomkill_6()
	
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
----------如果王離開戰鬥或是王死亡，刪除自己	
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )		
		if (  AttackTarget == 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥
			sleep(30)
			DelObj( OwnerID() )
		end
		if ReadRoleValue( Boss ,EM_RoleValue_IsDead ) == 1 and ( CheckID( Boss ) == false ) then  -- 檢查是否離開戰鬥
			sleep(30)
			DelObj( OwnerID() )		
		end
	end	
end

--------------------------------------------------------------------------------中樹
function Cang_130_Midtree_skill_6()
	BeginPlot( OwnerID() , "Cang_130_tree_summomkill_6", 0)
	SetPlot( OwnerID() , "dead" , "Cang_130_Midtree_dead_6" ,0 )	
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )	--讀取血量	
	local count = 0
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )		
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥
			count = count + 1
			local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP	--血量百分比		
			if ( HPPercent <= 0.75 ) then	--補血
				if count >= 10 then
					CastSpellLV( OwnerID() , Boss , 496004 , 0 )
					Sleep(30)
					count = 0
				end	
			end
		end
	end	
end

function Cang_130_Midtree_dead_6()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local count = 0
	local SpellCaster = star_CreateObj_NoAdd( OwnerID() , 104469 , 0 , 0 , 0 , RoomID , 90)
	SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--名稱
	SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )--血條
	SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--反擊		
	AddToPartition( SpellCaster , RoomID )	--加進舞台	
	if count ==0 then 
		CastSpellLV( SpellCaster , SpellCaster , 496002 , 10 )
		count = 1
	end	
	BeginPlot( SpellCaster , "Cang_mage_deadtime_6" , 0)
end

function Cang_mage_deadtime_6()
	sleep(30)
	Delobj(OwnerID())
end
--------------------------------------------------------------------------------小樹死亡劇情
function Cang_130_smalltree_dead_6()	
	--local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	--local count = 0
	--local SpellCaster = star_CreateObj_NoAdd( OwnerID() , 104470 , 0 , 0 , 0 , RoomID , 90)
	--SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--名稱
	--SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--重力
	--SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )--血條
	--SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	--SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--標記
	--SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--移動
	--SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--索敵
	--SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--可砍殺攻擊
	--SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--反擊	
	--AddToPartition( SpellCaster , RoomID )	--加進舞台
	--if count ==0 then	
	--CastSpellLV( SpellCaster , TargetID() , 496067 , 29 )
	--	count = 1
	--end		
	--BeginPlot( SpellCaster , "Cang_mage_deadtime_6" , 0)	
	DelObj(OwnerID())
end

--------------------------------------------------------------------------------小樹
function Cang_130_Littletree_skill_6()
	BeginPlot( OwnerID() , "Cang_130_tree_summomkill_6", 0)
	SetPlot( OwnerID() , "dead" , "Cang_130_smalltree_dead_6" ,0 )
	local count = 0
	local count1 = 0
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )		
	local SkillBuff = 507375
	local SKill = 495997
	local anyone
	local skillpower
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )		
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥
		--local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		
		--if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			count1 = count1 + 1
			if count == 0 then
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer = {}
				local sway = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					if CheckID( ThesePlayer[i] ) == true and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
						sway[table.getn(sway)+1] = ThesePlayer[i]	--放入Useful裡面 
					end					
				end
				anyone = DW_rand(table.getn(sway))
				SetAttack( OwnerID() , sway[anyone] )			
				count = 1
			end 
			local M_Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--小怪目標
			local skillseact = Lua_BuffPosSearch( M_Target , SkillBuff )				--檢查目標buff位子
			--Say(OwnerID(), "s="..skillseact)
			if count1 >= 5 then 
				if skillseact < 0 then	
					CastSpellLV( OwnerID() , M_Target , Skill , 0 )
				elseif skillseact >= 0 then														--位子確定之後												     
					skillpower = BuffInfo( M_Target , skillseact , EM_BuffInfoType_Power )	--檢查這buff層數
					--Say(OwnerID(), "s="..skillpower)
					if skillpower == 0 then
						CastSpellLV( OwnerID() , M_Target , Skill , 0 )
					elseif skillpower == 1 then
						CastSpellLV( OwnerID() , M_Target , Skill , 1 )
					elseif skillpower == 2 then
						CastSpellLV( OwnerID() , M_Target , Skill , 2 )				
					elseif skillpower == 3 then
						CastSpellLV( OwnerID() , M_Target , Skill , 3 )
					elseif skillpower == 4 then
						CastSpellLV( OwnerID() , M_Target , Skill , 4 )
					elseif skillpower == 5 then
						CastSpellLV( OwnerID() , M_Target , Skill , 5 )
					elseif skillpower > 5 then
						CastSpellLV( OwnerID() , M_Target , Skill , skillpower )				
					end
				end	
				count1 = 0
			end
		end
	end	
end


--------------------------------------------------------------------------------物品
--生命水晶
function Cang_130_item_use_01_6()	--解除毒霧用水晶
	local Buff1 = 507377	--毒霧編號
	local count = 0
	if CheckBuff ( OwnerID() , Buff1 ) == true then	
		CancelBuff( OwnerID() , Buff1 )		
		count = 1
	end
	if count == 1 then
		CancelBuff( OwnerID() , 507384 )
		AddBuff( OwnerID(), 507383, 0, 15 )
		--GiveBodyItem( OwnerID(), 208073 , 1)
	end
end

--劇毒水晶
function Cang_130_item_use_02_6()	--破盾用水晶
	local Buff1 = 507381
	local PlayerName = GetName( TargetID() )
	--Say(OwnerID(), "T="..PlayerName)
	local mark = ReadRoleValue( TargetID() ,EM_RoleValue_Register9)	
	--Say(OwnerID(), "mark="..mark)
	mark = mark + 1
	WriteRoleValue( TargetID() , EM_RoleValue_Register9, mark )
	mark = ReadRoleValue( TargetID() ,EM_RoleValue_Register9)	
	--Say(OwnerID(), "mark2="..mark)
	CancelBuff( OwnerID() , 507383 )			
end	

--物品使用
function Cang_130_item_touch_6()
	local count = 0
	if count == 0 then 
		--GiveBodyItem( OwnerID(), 208072 , 1)
		AddBuff( OwnerID(), 507384, 0, 15 )
		count =1 
	end
	DelObj( TargetID() )
end	