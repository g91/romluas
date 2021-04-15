
--EM_RoleValue_PID 
--EM_RoleValue_Register1 控制器
--EM_RoleValue_Register2 
--EM_RoleValue_Register3 
--EM_RoleValue_Register4 
--EM_RoleValue_Register5 門
--EM_RoleValue_Register6 門
--EM_RoleValue_Register7 門
--EM_RoleValue_Register8 門
--EM_RoleValue_Register9 

--4 執政官 重製  
--5 執政官 戰鬥
--6 爵士重製
--7 爵士戰鬥
--8 雙子重製
--9 雙子戰鬥
--10 雙子死亡
--------------------------------------------------------------爵士
function Cang_129_baron_e()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local sys = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	local fight = 0		--1代表進入戰鬥
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skill = 0
	local Doorstart = 0
	local SkillDelay = { 2 , 2 , 3 }	-- 技能延遲時間
		--
	local showskill = { 495683, 495671, 495028 }
		--鐵血紀律, 軍團之怒, 軍法審判
	local SkillID = { 495650 , 495672 }	-- 招式ID	
		--劍氣衝擊, 霸氣斬 
	local SkillLV = { 4 , 8 }	--技能等級
		--
	local SkillSay = {"[SC_103941_03]"}	 
	local CountSay = {"[SC_103941_01]"}
	local Saycount = 0
	local Door1, Door2, Door3, Door4
	local skillDot = 0
	while true do
		sleep(10)
----------檢查區域內有沒有玩家
		local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
		local ThesePlayer = {}	
		local sway = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() -- 接暫存值
			if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
			--檢查玩家是不是還在；檢查是否死亡
				sway[table.getn(sway)+1] = ThesePlayer[i]	--放入sway內
			end					
		end		
----------該區域內沒有玩家，執行重置		
		if table.getn(sway) == 0 then
			if res == 0 then				
				SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--阻擋	
				SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--阻擋
				SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--阻擋
				SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--阻擋				
				WriteRoleValue( sys ,EM_RoleValue_Register1, 6)				
				res = 1
			end
		end			
----------戰鬥開始		
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			countskill = countskill + 1
			skill = skill + 1	
			skillDot = skillDot + 1
			fight = 1		
----------戰鬥開始，變大、關門
			if Doorstart == 0 then	
				--變大
				WriteRoleValue( sys ,EM_RoleValue_Register1, 7)	
				ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
				CastSpellLV( OwnerID(), OwnerID() , 495671 , 0 )
				--關門
				Door1 = CreateObjByFlag( 104016, 780668, 4, 1)			
				SetModeEX( Door1  , EM_SetModeType_Gravity , false )--重力
				SetModeEx( Door1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
				SetModeEx( Door1  , EM_SetModeType_Mark, false )--標記
				SetModeEx( Door1  , EM_SetModeType_Move, false )--移動
				SetModeEx( Door1  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Door1  , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( Door1  , EM_SetModeType_Strikback, false )--反擊
				AddToPartition( Door1 , RoomID )
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register5, 	Door1)			
				SetDefIdleMotion( Door1 , ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door1 , EM_SetModeType_Obstruct, true )--阻擋
				Door2 = CreateObjByFlag( 104016, 780668, 5, 1)			
				SetModeEX( Door2  , EM_SetModeType_Gravity , false )--重力
				SetModeEx( Door2  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
				SetModeEx( Door2  , EM_SetModeType_Mark, false )--標記
				SetModeEx( Door2  , EM_SetModeType_Move, false )--移動
				SetModeEx( Door2  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Door2  , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( Door2  , EM_SetModeType_Strikback, false )--反擊
				AddToPartition( Door2 , RoomID )
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register6, 	Door2)			
				SetDefIdleMotion( Door2,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door2 , EM_SetModeType_Obstruct, true )--阻擋
				Door3 = CreateObjByFlag( 104016, 780668, 6, 1)			
				SetModeEX( Door3  , EM_SetModeType_Gravity , false )--重力
				SetModeEx( Door3  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
				SetModeEx( Door3  , EM_SetModeType_Mark, false )--標記
				SetModeEx( Door3  , EM_SetModeType_Move, false )--移動
				SetModeEx( Door3  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Door3  , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( Door3  , EM_SetModeType_Strikback, false )--反擊
				AddToPartition( Door3 , RoomID )
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register7, 	Door3)			
				SetDefIdleMotion( Door3,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door3 , EM_SetModeType_Obstruct, true )--阻擋
				Door4 = CreateObjByFlag( 104016, 780668, 7, 1)			
				SetModeEX( Door4  , EM_SetModeType_Gravity , false )--重力
				SetModeEx( Door4  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
				SetModeEx( Door4  , EM_SetModeType_Mark, false )--標記
				SetModeEx( Door4  , EM_SetModeType_Move, false )--移動
				SetModeEx( Door4  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Door4  , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( Door4  , EM_SetModeType_Strikback, false )--反擊
				AddToPartition( Door4 , RoomID )
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register8, 	Door4)			
				SetDefIdleMotion( Door4,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door4 , EM_SetModeType_Obstruct, true )--阻擋	
				Doorstart = 1
			end		
----------黑光陣
			if countskill >= 7 then
				local TempPlayer1 = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer1 = {}	
				local sway1 = {}
				for i=1,TempPlayer1 do
					ThesePlayer1[i] = GetSearchResult() -- 接暫存值
					if CheckID( ThesePlayer1[i] ) == true and 
					ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsDead ) == 0 and 
					ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_VOC ) ~= 0 and
					ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsPlayer ) == 1 then
					--檢查玩家是不是還在；檢查是否死亡
						sway1[table.getn(sway1)+1] = ThesePlayer1[i]	 
					end					
				end	
				--當sawy小裡面有人的時候，隨便抓一個衰小的玩家
				if table.getn(sway1) ~= 0 then
					local anyone = DW_Rand(table.getn(sway1))	--rand
					local MessageString
					local PlayerName = GetName( sway1[anyone] )
					MessageString = "[SC_103941_02][$SETVAR1="..PlayerName.."]" --在string中可以秀出玩家的名字
					ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end					
					--表演法術之後產生一個法陣
					CastSpellLV( OwnerID(), OwnerID() , 495670 , 0 )
					local NowX = ReadRoleValue( sway1[anyone] , EM_RoleValue_X )
					local NowY = ReadRoleValue( sway1[anyone] , EM_RoleValue_Y )
					local NowZ = ReadRoleValue( sway1[anyone] , EM_RoleValue_Z )
					local NowDir = ReadRoleValue( sway1[anyone] , EM_RoleValue_Dir )			
					local SpellCaster = CreateObj( 103956 , NowX , NowY , NowZ , NowDir , 1 )
					SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--名稱
					SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--重力
					SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
					SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--標記
					SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--移動
					SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )
					SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--反擊	
					AddToPartition( SpellCaster , RoomID )	--加進舞台	
					WriteRoleValue( SpellCaster , EM_RoleValue_PID, OwnerID() )
					BeginPlot( SpellCaster , "Cang_129_b_summomkill_e" , 0)
					countskill = 0
				end	
			end
----------普通技能施放
			if skillDot >= 15 then
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end		
				CastSpellLV( OwnerID() , OwnerID() , 495135 , 0 )		
				skillDot = 0
			end
			if skill >= 5 then
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
				if SkillShow == 1 then
					if Saycount == 0 then
						ScriptMessage( OwnerID() , -1 , 2 , SkillSay[SkillShow], 1 )
						Saycount = 1
					end	
				end	
				CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay[SkillShow] * CheckTime )	
				SkillShow = 0
				skill = 0
				Saycount = 0
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥	
			if fight == 1 then
				WriteRoleValue( sys ,EM_RoleValue_Register1, 6)
				SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--阻擋
				SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--阻擋
				SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--阻擋
				SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--阻擋				
				fight = 0				
			end
		end
	end
end

--------------------------------------------------------------爵士法陣
function Cang_129_b_summomkill_e()
	AddBuff( OwnerID() , 505675 , 1 , -1 )
	local Baron = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	sleep(30)	
	SetPlot( OwnerID(), "range" , "Cang_129_b_s_range_e" ,30 )	
----------如果王離開戰鬥或是王死亡，刪除自己	
	while 1 do
		sleep(10)
----------搜尋55碼內有無NPC, NPC如果是自己, 就補血
		local NPC = SearchRangeNPC ( OwnerID() , 40 )
		if table.getn( NPC )~= 0 then
			if NPC[0] == Baron then
				ScriptMessage( Baron , -1 , 2 , "[SC_103941_05]", 1 )
				--哈哈哈哈哈，這對我是無效的！
				SysCastSpellLV( Baron , Baron , 495134 , 0 )
				SysCastSpellLV( Baron , Baron , 495683 , 0 )
				sleep(30)
				DelObj( OwnerID() )
				break
			end
		end
		local AttackTarget = ReadRoleValue( Baron , EM_RoleValue_AttackTargetID )		
		if (  AttackTarget == 0 ) and ( CheckID( Baron ) == true ) then  -- 檢查是否離開戰鬥
			DelObj( OwnerID() )
		end
		if ReadRoleValue( Baron ,EM_RoleValue_IsDead ) == 1 and ( CheckID( Baron ) == false ) then  -- 檢查是否離開戰鬥
			DelObj( OwnerID() )		
		end
	end	
end
--爵士玩家判定
function Cang_129_b_s_range_e()
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--如果玩家踩到法陣, 上buff, 然後給王上buff
		local Baron = ReadRoleValue( TargetID() , EM_RoleValue_PID )
		SetPlot( TargetID(), "range" , "" ,55 )
		--CastSpellLV( TargetID(), OwnerID(), 495028 , 0 )
		AddBuff( OwnerID() , 506079 , 0 , 5 )
		AddBuff( OwnerID() , 506088 , 0 , 5 )
		ScriptMessage( baron , -1 , 2 , "[SC_103941_04]", 1 )
		--你們的反抗都是沒有用的！	
		SysCastSpellLV( Baron , Baron , 495683 , 0 )
		DelObj( TargetID() )
	end	
end

--------------------------------------------------------------執政官死亡
function Cang_129_baron_dead_e()		
	--屍體
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103941_06]", 1 )
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Door1 = ReadRoleValue(OwnerID() , EM_RoleValue_Register5)	
	local Door2 = ReadRoleValue(OwnerID() , EM_RoleValue_Register6)
	local Door3 = ReadRoleValue(OwnerID() , EM_RoleValue_Register7)
	local Door4 = ReadRoleValue(OwnerID() , EM_RoleValue_Register8)	
	local corpse = LuaFunc_CreateObjByObj ( 103935, OwnerID() )
	local sys = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	WriteRoleValue( sys ,EM_RoleValue_Register1, 8)	
	
	SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--阻擋
	SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--阻擋
	SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--阻擋
	SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--阻擋	
	
	SetModeEX( corpse  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( corpse  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( corpse  , EM_SetModeType_Mark, false )--標記
	SetModeEx( corpse  , EM_SetModeType_Move, false )--移動
	SetModeEx( corpse  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( corpse  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( corpse  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( corpse , RoomID )
	WriteRoleValue( sys ,EM_RoleValue_Register9, corpse)
	BeginPlot( corpse, "Cang_129_baron_corpse_e", 0)
	--SetPlot( corpse, "dead", "Cang_129_baron_corpse", 0) 
	--KillID( corpse, corpse )
	--寶箱
	local Box = CreateObjByFlag( 104051, 780670, 11, 1)	--寶箱
	SetModeEx( Box  , EM_SetModeType_HideName, false )--名稱
	SetModeEx( Box  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框	
	SetModeEx( Box  , EM_SetModeType_NotShowHPMP, true )--血條					
	SetModeEx( Box   , EM_SetModeType_Move, false )--移動
	SetModeEx( Box  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Box  , EM_SetModeType_Strikback, false )--反擊
	AddToPartition( Box , RoomID )	 
	DelObj( OwnerID() )	
end	

function Cang_129_baron_corpse_e()	
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_DEATH_LOOP)	
	AddBuff( OwnerID(), 506760, 0, -1 )
	--return false
end 