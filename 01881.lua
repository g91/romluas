
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
--------------------------------------------------------------執政官
function Cang_129_oh()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local sys = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	local fight = 0		--1代表進入戰鬥
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skill = 0
	local Doorstart = 0
	local roseskill = 0
	local skill01 = 0
	local skill02 = 0
	local res = 0
	local SkillDelay = { 2 , 2 , 3 }	-- 技能延遲時間
		--
	local SkillID = { 495744, 495030 } 
		--漣漪爆沖, 斬擊
	local showskill = { }	-- 招式ID	
		--
	local SkillLV = { 4 , 7 }	--技能等級
		--
	local SkillSay = {"[SC_103934_03]"}	
	local Saycount = 0
	--漣漪爆沖
	local CountSay = {"[SC_103934_01]"}	
	--開場
	local Door1, Door2, Door3, Door4
	local any, any1, any2
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
				WriteRoleValue( sys ,EM_RoleValue_Register1, 4)				
				res = 1
			end
		end		
----------戰鬥開始	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			skill = skill +1
			roseskill = roseskill +1
			fight = 1
			skill01 = skill01 + 1
			skill02 = skill02 + 1
			if Doorstart == 0 then	
				--變大
				WriteRoleValue( sys ,EM_RoleValue_Register1, 5)
				ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
				CastSpellLV( OwnerID(), OwnerID() , 495029 , 0 )			
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
			--玫瑰刺[$VAR1]			
			if roseskill >= 10 then
----------找一個隨機玩家
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
						sway1[table.getn(sway1)+1] = ThesePlayer1[i]	--放入sway內
					end					
				end		
----------RAND一個人出來打玫瑰		
				if table.getn(sway1) ~= 0 then
					local anyone = DW_Rand(table.getn(sway1))	--rand
					local MessageString
					local PlayerName = GetName( sway1[anyone] )
					MessageString = "[SC_103934_02][$SETVAR1="..PlayerName.."]" --在string中可以秀出玩家的名字
					ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end	
					--玫瑰
					CastSpellLV( OwnerID(), sway1[anyone], 495025 , 2 )
					roseskill = 0
				end	
			end
			--執著
			if skill01 >= 30 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103934_04]", 1 )
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end	
				CastSpellLV( OwnerID(), OwnerID() , 495465 , 2 )				
				local Use = DW_HateRemain(1)     --仇恨表找人 填0代表 不排除主坦
				for i = 1, table.getn(Use) do				
					Addbuff( Use[i], 506785, 0, -1)				
				end
				sleep(20)
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end				
				CastSpellLV( OwnerID(), OwnerID() , 495026 , 2 )
				sleep(20)
				skill01 = 0
			end
			if skill02 >= 20 then
				local SkillRND = DW_Rand ( 2 )
				if SkillRND == 1 then		
					--第一次rand
					local Use = DW_HateRemain(0)     			--仇恨表找人 填0代表 不排除主坦
					local Use1 = {}		
					local Use2 = {}
					any = DW_Rand(table.getn(Use))		--rand Use
					Addbuff( Use[any], 506961, 0, 10)
					--第二次rand
					for i = 1 , table.getn(Use) do				--use有幾個人做幾次		
						if Use[i] ~= Use[any] then				--i不等於any1
							Use1[table.getn(Use1)+1] = Use[i]	--放入use1
						end
					end
					if table.getn(Use1) ~= 0 then				--use1不為0的時候
						any1 = DW_Rand(table.getn(Use1))	--rand any2出來
						if Use1[any1] ~= nil then				--不等於nil的時候執行
							Addbuff( Use1[any1], 506961, 0, 10)
							sleep(10)
						end		
					--第三次rand	
						for j = 1 , table.getn(Use1) do				--use1有幾個人做幾次	
							if Use1[j] ~= Use1[any1] then			--i不等於any2
								Use2[table.getn(Use2)+1] = Use1[j]	--放入use2
							end
						end	
						if table.getn(Use2) ~= 0 then				--use2不為0的時候	
							any2 = DW_Rand(table.getn(Use2))	--rand any3出來	
							if Use2[any2] ~= nil then				--不等於nil的時候執行
								Addbuff( Use2[any2], 506961, 0, 10)
								--CastSpellLV( OwnerID() , Use[any] , 495456 , 0 )
								--CastSpellLV( OwnerID() , Use1[any1] , 495456 , 0 )
								--CastSpellLV( OwnerID() , Use2[any2] , 495456 , 0 )
								sleep(10)
							end	
						end		
					end		
					local control = Lua_DW_CreateObj( "obj" , 103956 , OwnerID() , 0)	
					SetModeEx( control  , EM_SetModeType_NotShowHPMP, true )--血條					
					SetModeEX( control  , EM_SetModeType_Gravity , false )--重力
					SetModeEx( control  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
					SetModeEx( control  , EM_SetModeType_Mark, false )--標記
					SetModeEx( control  , EM_SetModeType_Move, false )--移動
					SetModeEx( control  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( control  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( control  , EM_SetModeType_Strikback, false )--反擊
					AddToPartition( control , RoomID )	
					WriteRoleValue( control , EM_RoleValue_Livetime, 13 )		
					BeginPlot( control, "Cang_129_oh_buffskill_in" , 0 )
					skill02 = 0
				elseif SkillRND == 2 then
					--第一次rand
					local Use = DW_HateRemain(0)				--仇恨表找人 填0代表 不排除主坦
					local Use1 = {}		
					local Use2 = {}
					any = DW_Rand(table.getn(Use))		--rand Use
					Addbuff( Use[any], 506962, 0, 10)
					--SysCastSpellLV( OwnerID() , Use[any] , 495457 , 0 )
					--第二次rand
					for i = 1 , table.getn(Use) do				--use有幾個人做幾次		
						if Use[i] ~= Use[any] then				--i不等於any1
							Use1[table.getn(Use1)+1] = Use[i]	--放入use1
						end
					end
					if table.getn(Use1) ~= 0 then				--use1不為0的時候
						any1 = DW_Rand(table.getn(Use1))	--rand any2出來
						if Use1[any1] ~= nil then				--不等於nil的時候執行
							Addbuff( Use1[any1], 506962, 0, 10)
							--SysCastSpellLV( OwnerID() , Use1[any1] , 495457 , 0 )
							sleep(10)
						end	
					--第三次rand	
						for j = 1 , table.getn(Use1) do				--use1有幾個人做幾次	
							if Use1[j] ~= Use1[any1] then			--i不等於any2
								Use2[table.getn(Use2)+1] = Use1[j]	--放入use2
							end
						end	
						if table.getn(Use2) ~= 0 then				--use2不為0的時候	
							any2 = DW_Rand(table.getn(Use2))	--rand any3出來	
							if Use2[any2] ~= nil then				--不等於nil的時候執行
								Addbuff( Use2[any2], 506962, 0, 10)
								--CastSpellLV( OwnerID() , Use[any] , 495457 , 0 )
								--CastSpellLV( OwnerID() , Use1[any1] , 495457 , 0 )
								--CastSpellLV( OwnerID() , Use2[any2] , 495457 , 0 )
								sleep(10)
							end	
						end		
					end		
					local control = Lua_DW_CreateObj( "obj" , 103956 , OwnerID() , 0)
					SetModeEx( control  , EM_SetModeType_NotShowHPMP, true )--血條
					SetModeEX( control  , EM_SetModeType_Gravity , false )--重力
					SetModeEx( control  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
					SetModeEx( control  , EM_SetModeType_Mark, false )--標記
					SetModeEx( control  , EM_SetModeType_Move, false )--移動
					SetModeEx( control  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( control  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( control  , EM_SetModeType_Strikback, false )--反擊
					AddToPartition( control , RoomID )		
					WriteRoleValue( control , EM_RoleValue_Livetime, 13 )
					BeginPlot( control, "Cang_129_oh_buffskill_out" , 0 )	
					skill02 = 0
				end							
			end
----------普通技能
			if skill >= 7 then
				local SkillRND = DW_Rand ( 100 ) 
				if SkillRND <= 100 and SkillRND > 65 then 
					SkillShow = 1	--
					BossTarget = OwnerID()					
				elseif SkillRND <= 65 and SkillRND > 0 then 
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
				Saycount =  0
			end
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if fight == 1 then
				WriteRoleValue( sys ,EM_RoleValue_Register1, 4)
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

--------------------------------------------------------------執政官流血技能
function Cang_129_oh_skill()
	BeginPlot( TargetID() , "Cang_129_oh_skill_do" , 0)
end

function Cang_129_oh_skill_do()

	while true do
		sleep(10)
		--先確認玩家是不是死亡或者不存在
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 1 or 
		ReadRoleValue( OwnerID() , EM_RoleValue_IsPlayer) == 0 then
			break
		end
		--檢察玩家身上有沒有穿刺這buff
		if CheckBuff( OwnerID() , 506086 ) == false then
			break
		end
		--如果玩家的血量大於或是等於滿血的時候, 清除buff穿刺
		if ReadRoleValue( OwnerID() , EM_RoleValue_HP) >= ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) then
			CancelBuff_NoEvent( OwnerID() , 506086 )
			break
		end
	end	
end

--------------------------------------------------------------執政官死亡
function Cang_129_oh_dead()	
	--屍體		
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103934_05]", 1 )

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local sys = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	WriteRoleValue( sys ,EM_RoleValue_Register1, 6)
	
	local Door1 = ReadRoleValue(OwnerID() , EM_RoleValue_Register5)	
	local Door2 = ReadRoleValue(OwnerID() , EM_RoleValue_Register6)
	local Door3 = ReadRoleValue(OwnerID() , EM_RoleValue_Register7)
	local Door4 = ReadRoleValue(OwnerID() , EM_RoleValue_Register8)		
	SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--阻擋
	SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--阻擋
	SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--阻擋
	SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--阻擋	
	
	local corpse = LuaFunc_CreateObjByObj ( 103934, OwnerID() )
	SetModeEX( corpse  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( corpse  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( corpse  , EM_SetModeType_Mark, false )--標記
	SetModeEx( corpse  , EM_SetModeType_Move, false )--移動
	SetModeEx( corpse  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( corpse  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( corpse  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( corpse , RoomID )
	WriteRoleValue( sys ,EM_RoleValue_Register8, corpse)
	BeginPlot( corpse, "Cang_129_oh_corpse", 0)
	--SetPlot( corpse, "dead", "Cang_129_oh_corpse", 0) 
	--KillID( corpse, corpse )
	--寶箱
	local Box = CreateObjByFlag( 103957, 780670, 10, 1)	--寶箱
	SetModeEx( Box  , EM_SetModeType_HideName, false )--名稱
	SetModeEx( Box  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框	
	SetModeEx( Box  , EM_SetModeType_NotShowHPMP, true )--血條					
	SetModeEx( Box   , EM_SetModeType_Move, false )--移動
	SetModeEx( Box  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Box  , EM_SetModeType_Strikback, false )--反擊
	AddToPartition( Box , RoomID )	
	DelObj( OwnerID() )	
end	
--------------------------------------------------------------執政官死亡屍體
function Cang_129_oh_corpse()	
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_DEATH_LOOP)	
	AddBuff( OwnerID(), 506760, 0, -1 )
end 

--------------------------------------------------------------要靠近的BUFF
function Cang_129_oh_buffskill_in()

	while true do 
		sleep(10)
		local buf = {}
		local player = SearchRangeplayer ( OwnerID() , 1000 )		--搜尋有多少人
		if table.getn( player )~= 0 then
			for i = 0, table.getn(player) do
				if CheckID( player[i] ) == true and 							--活著
				ReadRoleValue( player[i] , EM_RoleValue_IsDead ) == 0 and 		--沒死
				ReadRoleValue( player[i] , EM_RoleValue_VOC ) ~= 0 and			--不是GM
				ReadRoleValue( player[i] , EM_RoleValue_IsPlayer ) == 1 and	--是個人
				CheckBuff( player[i] , 506961) == true then				--檢查有沒有111111
					buf[table.getn(buf)+1] = player[i] 					--丟入集合	
				end	
			end	
			--Say( OwnerID(), "buf="..table.getn(buf))
			if table.getn(buf) >= 3 then					--如果集合理面有三個人
				if GetDistance( Buf[1], Buf[2]) <= 25 and	--檢查距離
				GetDistance( Buf[2], Buf[3]) <= 25 and		
				GetDistance( Buf[1], Buf[3]) <= 25 then
					CancelBuff( Buf[1] , 506961 )
					CancelBuff( Buf[2] , 506961 )
					CancelBuff( Buf[3] , 506961 )
					DelObj( OwnerID())
					break
				end	
			end	
		end	
	end		
end			
--------------------------------------------------------------要離開的BUFF			
function Cang_129_oh_buffskill_out()
	
	while true do 
		sleep(10)
		local buf = {}
		local player = SearchRangeplayer ( OwnerID() , 1000 )
		if table.getn( player )~= 0 then
			for i = 0, table.getn( player ) do
				if CheckID( player[i] ) == true and 
				ReadRoleValue( player[i] , EM_RoleValue_IsDead ) == 0 and 
				ReadRoleValue( player[i] , EM_RoleValue_VOC ) ~= 0 and
				ReadRoleValue( player[i] , EM_RoleValue_IsPlayer ) == 1 and
				CheckBuff( player[i] , 506962) == true then
					buf[table.getn(buf)+1] = player[i]
				end	
			end		
			--Say( OwnerID(), "buf="..table.getn(buf))
			if table.getn(buf) >= 3 then
				if GetDistance( Buf[1], Buf[2]) > 100 and
				GetDistance( Buf[2], Buf[3]) > 100 and
				GetDistance( Buf[1], Buf[3]) > 100 then
					CancelBuff( Buf[1] , 506962 )
					CancelBuff( Buf[2] , 506962 )
					CancelBuff( Buf[3] , 506962 )	
					DelObj( OwnerID())
					break
				end
			end	
		end	
	end		
end			
	