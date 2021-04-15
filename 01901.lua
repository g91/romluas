--啟動器
--EM_RoleValue_PID 主控制器
--EM_RoleValue_Register1
--EM_RoleValue_Register2 B
--EM_RoleValue_Register3 O
--EM_RoleValue_Register4 戰鬥
--EM_RoleValue_Register5 門
--EM_RoleValue_Register6 門
--EM_RoleValue_Register7 門
--EM_RoleValue_Register8 門
--EM_RoleValue_Register9 

--baron
--EM_RoleValue_PID 
--EM_RoleValue_Register1
--EM_RoleValue_Register2 
--EM_RoleValue_Register3 
--EM_RoleValue_Register4 
--EM_RoleValue_Register5
--EM_RoleValue_Register6 
--EM_RoleValue_Register7 女王
--EM_RoleValue_Register8 門
--EM_RoleValue_Register9 主控器

--office holder
--EM_RoleValue_PID 
--EM_RoleValue_Register1
--EM_RoleValue_Register2 
--EM_RoleValue_Register3 
--EM_RoleValue_Register4 
--EM_RoleValue_Register5 
--EM_RoleValue_Register6 
--EM_RoleValue_Register7 
--EM_RoleValue_Register8 
--EM_RoleValue_Register9 主控器

--4 執政官 重製  
--5 執政官 戰鬥
--6 爵士重製
--7 爵士戰鬥
--8 雙子重製
--9 雙子戰鬥
--10 雙子死亡


--------------------------------------------------------------主控
function Cang_129_2bo_all_e()

	local Pass = 0	--第一層鎖
	local Pass2 = 0	--第二層鎖
	local sys = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Queen
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Count = 0
	local Count1 = 0
	--魁儡女王劇情	
	Queen = CreateObj( 103936, 2124, 600, 2036, 38.8, 1)
	SetModeEX( Queen  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Queen  , EM_SetModeType_Move, false )--移動
	SetModeEx( Queen  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Queen  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Queen  , EM_SetModeType_Strikback, false )--反擊		
	--Queen = CreateObjByFlag( 103936, 780668, 0, 1) 
	AddToPartition( Queen , RoomID )
	CastSpellLV( Queen, Queen, 495712 , 1 )
	sleep(10)
	ScriptMessage( Queen , -1 , 2 , "[SC_103942_01]", 1 )	
----------魁儡女王施放魁儡術，招喚魁儡雙子
	local corpse01 = ReadRoleValue(sys,EM_RoleValue_Register8)
	local corpse02 = ReadRoleValue(sys,EM_RoleValue_Register9)	
	local X1 = ReadRoleValue( corpse01 , EM_RoleValue_X )
	local Y1 = ReadRoleValue( corpse01 , EM_RoleValue_Y )
	local Z1 = ReadRoleValue( corpse01 , EM_RoleValue_Z )
	local Dir1 = ReadRoleValue( corpse01 , EM_RoleValue_Dir )			
	local show2 = CreateObj( 103956 , X1 , Y1 , Z1 , Dir1 , 1 )	
	SetModeEx( show2  , EM_SetModeType_NotShowHPMP, true )--血條	
	SetModeEX( show2  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( show2  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( show2  , EM_SetModeType_Mark, false )--標記
	SetModeEx( show2  , EM_SetModeType_Move, false )--移動
	SetModeEx( show2  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( show2  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( show2  , EM_SetModeType_Strikback, false )--反擊				
	AddToPartition( show2 , RoomID )	
	local X2 = ReadRoleValue( corpse02 , EM_RoleValue_X )
	local Y2 = ReadRoleValue( corpse02 , EM_RoleValue_Y )
	local Z2 = ReadRoleValue( corpse02 , EM_RoleValue_Z )
	local Dir2 = ReadRoleValue( corpse02 , EM_RoleValue_Dir )			
	local show3 = CreateObj( 103956 , X2 , Y2 , Z2 , Dir2 , 1 )	
	SetModeEx( show3  , EM_SetModeType_NotShowHPMP, true )--血條	
	SetModeEX( show3  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( show3  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( show3  , EM_SetModeType_Mark, false )--標記
	SetModeEx( show3  , EM_SetModeType_Move, false )--移動
	SetModeEx( show3  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( show3  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( show3  , EM_SetModeType_Strikback, false )--反擊				
	AddToPartition( show3 , RoomID )	
	
	CastSpellLV( show2, show2, 495670 , 1 )
	CastSpellLV( show3, show3, 495670 , 1 )
	Sleep(30)	
	SetModeEx( corpse01  , EM_SetModeType_Show, false )
	SetModeEx( corpse02  , EM_SetModeType_Show, false )

----------表演招換
	local show0 = CreateObjByFlag( 103956, 780668, 1, 1)		
	SetModeEx( show0  , EM_SetModeType_NotShowHPMP, true )--血條	
	SetModeEX( show0  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( show0  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( show0  , EM_SetModeType_Mark, false )--標記
	SetModeEx( show0  , EM_SetModeType_Move, false )--移動
	SetModeEx( show0  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( show0  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( show0  , EM_SetModeType_Strikback, false )--反擊				
	AddToPartition( show0 , RoomID )			
	local show1 = CreateObjByFlag( 103956, 780668, 2, 1)
	SetModeEx( show1  , EM_SetModeType_NotShowHPMP, true )--血條	
	SetModeEX( show1  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像
	SetModeEx( show1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( show1  , EM_SetModeType_Move, false )--移動
	SetModeEx( show1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( show1  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( show1  , EM_SetModeType_Strikback, false )--反擊				
	AddToPartition( show1 , RoomID )			
	CastSpellLV(show0, show0, 495670 , 1 )
	CastSpellLV(show1, show1, 495670 , 1 )
	
	ScriptMessage( Queen , -1 , 2 , "[SC_103942_02]", 1 )
----------產生爵士
	local Temp1 = CreateObjByFlag( 104052, 780668, 1, 1) 
	AddToPartition( Temp1 , RoomID )	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, Temp1)	--控制器寫入
	WriteRoleValue( Temp1 ,EM_RoleValue_Register9, OwnerID())	--控制器寫入
	sleep(10)
	AddBuff( Temp1, 506849, 0, -1)
----------產生執政官
	local Temp2 = CreateObjByFlag( 104053, 780668, 2, 1)
	AddToPartition( Temp2 , RoomID )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Temp2)	--控制器寫入
	WriteRoleValue( Temp2 ,EM_RoleValue_Register9, OwnerID())	--控制器寫入	
	sleep(10)
	AddBuff( Temp2, 506849, 0, -1)	
	
	--女王變身透明球
	AddBuff( Queen, 506848, 0, -1) 
	WriteRoleValue( Temp1 ,EM_RoleValue_Register7, Queen)	--寫入PID	
----------互存
	WriteRoleValue( Temp2 ,EM_RoleValue_PID, Temp1)	--寫入PID
	WriteRoleValue( Temp1 ,EM_RoleValue_PID, Temp2)	--寫入PID	
----------啟動王AI
	BeginPlot( Temp1, "Cang_129_2bo_baron_e", 0)
	BeginPlot( Temp2, "Cang_129_2bo_oh_e", 0)
	BeginPlot( OwnerID() , "Cang_129_2bo_GD_e" , 0)

	local res = 0 --回傳值鎖
	local Door1, Door2, Door3, Door4
	local playing
	
	while 1 do
		sleep(10)
		Door1 = ReadRoleValue( OwnerID(),EM_RoleValue_Register5 )
		Door2 = ReadRoleValue( OwnerID(),EM_RoleValue_Register6 )
		Door3 = ReadRoleValue( OwnerID(),EM_RoleValue_Register7 )
		Door4 = ReadRoleValue( OwnerID(),EM_RoleValue_Register8 )
		playing = ReadRoleValue( OwnerID(),EM_RoleValue_Register4 )
		
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
				DelObj(Temp1)
				DelObj(Temp2)				
				SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--阻擋	
				SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--阻擋
				SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--阻擋
				SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( corpse01  , EM_SetModeType_Show, true )
				SetModeEx( corpse02  , EM_SetModeType_Show, true )
				DelObj( Queen )
				WriteRoleValue( sys ,EM_RoleValue_Register1, 8)				
				res = 1
			end
		end		
----------檢查兩個王是否活著
		if playing == 1 then
			if CheckID(Temp1)==false or								--檢查Temp1是否存在
				ReadRoleValue(Temp1,EM_RoleValue_IsDead)==1	then	--檢查Temp1是否死亡	
				if	ReadRoleValue(Temp2,EM_RoleValue_IsDead)==0	and	--檢查Temp2是不是還活著
					CheckID(Temp2)==true and						--檢查Temp2是不是存在
					HateListCount( Temp2 )  == 0 then				--檢查Temp2仇恨表還有沒有人
					Pass2 = Pass2 + 1								--成立 Pass2 +1
				end
			end		
			if CheckID(Temp2)==false	or							--檢查Temp2是否存在
				ReadRoleValue(Temp2,EM_RoleValue_IsDead)==1	then	--檢查Temp2是否死亡		
				if	ReadRoleValue(Temp1,EM_RoleValue_IsDead)==0	and	--檢查Temp1是否死亡
					CheckID(Temp1)==true and						--檢查Tmep1是不是存在
					HateListCount( Temp1 )  == 0 then				--檢查Temp1是否戰鬥中
					Pass2 = Pass2 + 1								--成立 Pass2 +1
				end
			end
----------Pass2 只會為0或1, 0等於都死, 1等於其一死亡且另一離開戰鬥
			if Pass2 == 1 then
				if res == 0 then 
				--刪除現存			
					DelObj(Temp1)
					DelObj(Temp2)
					sleep(50)
					SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
					SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--阻擋	
					SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
					SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--阻擋
					SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
					SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--阻擋
					SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
					SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--阻擋						
					SetModeEx( corpse01  , EM_SetModeType_Show, true )
					SetModeEx( corpse02  , EM_SetModeType_Show, true )
					DelObj( Queen )
					WriteRoleValue( sys ,EM_RoleValue_Register1, 8)	
					res = 1
				end
			end	
----------當兩隻王都死，給寶箱，回傳主控			
			if	CheckID(Temp1)==false or ReadRoleValue(Temp1,EM_RoleValue_IsDead)==1 then		
				if	CheckID(Temp2)==false or ReadRoleValue(Temp2,EM_RoleValue_IsDead)==1 then
					if res == 0 then
						Hide(Temp1)	--隱藏屍體
						Hide(Temp2)	--隱藏屍體
						DelObj( Queen )
						WriteRoleValue( sys ,EM_RoleValue_Register1, 10)					
						SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--阻擋	
						SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--阻擋
						SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--阻擋
						SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--阻擋
						local Box = CreateObjByFlag( 104054, 780670, 12, 1)	--寶箱
						SetModeEx( Box  , EM_SetModeType_HideName, false )--名稱
						SetModeEx( Box  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
						SetModeEx( Box  , EM_SetModeType_NotShowHPMP, true )--血條					
						SetModeEx( Box  , EM_SetModeType_Move, false )--移動
						SetModeEx( Box  , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEx( Box  , EM_SetModeType_Strikback, false )--反擊						
						AddToPartition( Box , RoomID ) 
						res = 1				
					end	
				end	
			end
		end	
	end	
end

--------------------------------------------------------------距離判定
function Cang_129_2bo_GD_e()
	local Temp1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local Temp2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)

	while true do
		sleep(10)
----------距離爵士50碼內，會一直施放漣漪衝擊；距離爵士50外，正常攻擊
		if GetDistance( Temp1, Temp2) <= 100 then
			if CheckID( Temp1 ) == true then
				AddBuff( Temp2 , 506817, 1, -1)	
			end				
		elseif GetDistance( Temp1, Temp2) > 100 then
			CancelBuff( Temp2 , 506817 )
		end
	end
end

--------------------------------------------------------------爵士
function Cang_129_2bo_baron_e()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local OH = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local start = ReadRoleValue(OwnerID() , EM_RoleValue_Register9)
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
	local SkillLV = { 4 , 7 }	--技能等級
		--
	local SkillSay = {"[SC_103941_03]"}	 
	local CountSay = {"[SC_103941_01]"}
	local Saycount = 0
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			countskill = countskill + 1
			skill = skill + 1	
			fight = 1			
			WriteRoleValue( start ,EM_RoleValue_Register4, 1)		
----------戰鬥開始，變大、關門			
			if Doorstart == 0 then	
				--變大
				--ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
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
				WriteRoleValue( start ,EM_RoleValue_Register5, 	Door1)			
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
				WriteRoleValue( start ,EM_RoleValue_Register6, 	Door2)			
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
				WriteRoleValue( start ,EM_RoleValue_Register7, 	Door3)			
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
				WriteRoleValue( start ,EM_RoleValue_Register8, 	Door4)			
				SetDefIdleMotion( Door4,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door4 , EM_SetModeType_Obstruct, true )--阻擋				
				Doorstart = 1
			end		
----------黑光陣
			if countskill == 7 then
				--當執政官活著，黑光陣的目標是執政官的目標
				if ReadRoleValue( OH,EM_RoleValue_IsDead ) == 0	then	--檢查OH是否死亡
					local OH_attackTarget = ReadRoleValue( OH, EM_RoleValue_AttackTargetID )
					local MessageString
					local PlayerName = GetName( OH_attackTarget )
					MessageString = "[SC_103941_02][$SETVAR1="..PlayerName.."]" --在string中可以秀出玩家的名字
					ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end					
					--表演法術之後產生一個法陣
					CastSpellLV( OwnerID(), OwnerID() , 495670 , 2 )
					local NowX = ReadRoleValue( OH_attackTarget , EM_RoleValue_X )
					local NowY = ReadRoleValue( OH_attackTarget , EM_RoleValue_Y )
					local NowZ = ReadRoleValue( OH_attackTarget , EM_RoleValue_Z )
					local NowDir = ReadRoleValue( OH_attackTarget , EM_RoleValue_Dir )			
					local SpellCaster = CreateObj( 103956 , NowX , NowY , NowZ , NowDir , 1 )
					SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--名稱
					SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--重力
					SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
					SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--標記
					SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--移動
					SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--反擊	
					AddToPartition( SpellCaster , RoomID )	--加進舞台	
					WriteRoleValue( SpellCaster , EM_RoleValue_Livetime, 30 )--存在時間
					WriteRoleValue( SpellCaster , EM_RoleValue_PID, OwnerID() )
					WriteRoleValue( SpellCaster , EM_RoleValue_Register1, OH )
					BeginPlot( SpellCaster , "Cang_129_2bo_b_summomkill_e" , 0)
					countskill = 0
				--如果執政官死了，黑光陣的對象改變	
				elseif ReadRoleValue( OH,EM_RoleValue_IsDead ) == 1	then
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
						MessageString = "[SC_103941_02][$SETVAR1="..PlayerName.."]" --在string中可以秀出玩家的名字
						ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
						while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
						end					
						--表演法術之後產生一個法陣
						CastSpellLV( OwnerID(), OwnerID() , 495670 , 2 )
						local NowX = ReadRoleValue( sway1[anyone] , EM_RoleValue_X )
						local NowY = ReadRoleValue( sway1[anyone] , EM_RoleValue_Y )
						local NowZ = ReadRoleValue( sway1[anyone] , EM_RoleValue_Z )
						local NowDir = ReadRoleValue( sway1[anyone] , EM_RoleValue_Dir )			
						local SpellCaster = CreateObj( 103956 , NowX , NowY , NowZ , NowDir , 1 )
						SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--名稱
						SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--重力
						SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
						SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--標記
						SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )
						SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--移動
						SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--可砍殺攻擊
						SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--反擊	
						AddToPartition( SpellCaster , RoomID )	--加進舞台	
						WriteRoleValue( SpellCaster , EM_RoleValue_Livetime, 30 )--存在時間
						WriteRoleValue( SpellCaster , EM_RoleValue_PID, OwnerID() )
						WriteRoleValue( SpellCaster , EM_RoleValue_Register1, OH )
						BeginPlot( SpellCaster , "Cang_129_2bo_b_summomkill_e" , 0)
						countskill = 0
					end	
				end	
			end
----------普通技能施放			
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
				--ScriptMessage( OwnerID() , -1 , 2 , SkillSay[SkillShow], 1 )
				CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay[SkillShow] * CheckTime )	
				SkillShow = 0
				skill = 0
			end			
		end
	end
end

--------------------------------------------------------------爵士法陣
function Cang_129_2bo_b_summomkill_e()
	AddBuff( OwnerID() , 505675 , 1 , -1 )
	sleep(30)
	SetPlot( OwnerID(), "range" , "Cang_129_2bo_b_s_range_e" ,30 )
	local OH = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local Baron = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	while true do
		sleep(10)
----------搜尋55碼內有無NPC, NPC如果是HO王, 就鎖他移動, 表演
		local NPC = SearchRangeNPC ( OwnerID() , 40 )
		if table.getn( NPC )~= 0 then
			if NPC[0] == OH then
				--當NPC是HO, 替baron上buff
				--AddBuff( baron, 506080, 1, -1)
				SysCastSpellLV( baron , baron , 495683 , 0 )
				BeginPlot( OH , "Cang_129_Dontmove_e", 0) 
				sleep(10)
				DelObj( OwnerID() )
				break
			end
		end
----------如果王離開戰鬥或是王死亡，刪除自己		
		local AttackTarget = ReadRoleValue( Baron , EM_RoleValue_AttackTargetID )		
		if (  AttackTarget == 0 ) and ( CheckID( Baron ) == true ) then  -- 檢查是否離開戰鬥
			DelObj( OwnerID() )
		end
		if ReadRoleValue( Baron ,EM_RoleValue_IsDead ) == 1 and ( CheckID( Baron ) == false ) then  -- 檢查是否離開戰鬥
			DelObj( OwnerID() )		
		end		
	end	
end

----------OH停止專用
function Cang_129_Dontmove_e()
	SetModeEx( OwnerID() , EM_SetModeType_Move, false )
	--不回血不攻擊buff
	AddBuff( OwnerID() , 506091, 1, 10)
	sleep(100)
	SetModeEx( OwnerID() , EM_SetModeType_Move, true )
end

----------黑光陣，對玩家判定
function Cang_129_2bo_b_s_range_e()	
	--如果玩家踩到法陣, 上buff, 然後給王上buff
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
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

--------------------------------------------------------------執政官
function Cang_129_2bo_oh_e()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local baron = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local start = ReadRoleValue(OwnerID() , EM_RoleValue_Register9)
	local fight = 0		--1代表進入戰鬥
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skill = 0
	local Doorstart = 0
	local roseskill = 0
	local beg = 0
	local Lietime = 0
	local skill01 = 0
	local skill02 = 0
	local SkillDelay = { 2 , 2 }	-- 技能延遲時間
		--
	local SkillID = { 495027, 495469 } 
		--漣漪, 斬擊
	local SkillLV = { 4 , 7 }	--技能等級
		--
	local SkillSay = {"[SC_103934_03]"}	
	local Saycount = 0
	--漣漪爆沖
	local CountSay = {"[SC_103934_01]"}	
	--開場
	local any, any1, any2
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			skill = skill +1
			roseskill = roseskill +1
			fight = 1
			Lietime = Lietime + 1
			skill01 = skill01 + 1
			skill02 = skill02 + 1
			WriteRoleValue( start ,EM_RoleValue_Register4, 1)
----------戰鬥開始，變大			
			if beg == 0 then
				--變大
				CastSpellLV( OwnerID(), OwnerID() , 495029 , 2 )
				beg = 1
			end
----------有檢查BUFF，施放漣漪衝擊			
			if CheckBuff( OwnerID() , 506817 ) == true then
				if Lietime >= 2 then
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end			
					ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
					CastSpellLV( OwnerID(), OwnerID() , 495027 , 2 )
					Lietime = 0
				end	
			end
----------玫瑰綻放			
			if roseskill >= 10 then
				--爵士活著的時候，目標是爵士的目標
				if ReadRoleValue( baron , EM_RoleValue_IsDead ) == 0 then	--檢查OH是否死亡				
					local B_attackTarget = ReadRoleValue( baron, EM_RoleValue_AttackTargetID ) 
					local MessageString
					local PlayerName = GetName( B_attackTarget )
					MessageString = "[SC_103934_02][$SETVAR1="..PlayerName.."]" --在string中可以秀出玩家的名字
					ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end					
					--玫瑰刺
					CastSpellLV( OwnerID(), B_attackTarget , 495025 , 2)
					roseskill = 0
				--爵士死之後，目標是自己的目標
				elseif ReadRoleValue( baron , EM_RoleValue_IsDead ) == 1 then
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
						--玫瑰刺
						CastSpellLV( OwnerID(), sway1[anyone] , 495025 , 2 )
						roseskill = 0
					end	
				end	
			end	
----------執著
			if skill01 >= 30 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103934_04]", 1 )
				--while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
				--	sleep(3)
				--end	
				--CastSpellLV( OwnerID(), OwnerID() , 495465 , 2 )				
				--local Use = DW_HateRemain(1)     --仇恨表找人 填0代表 不排除主坦
				--for i = 1, table.getn(Use) do				
				--	Addbuff( Use[i], 506785, 0, -1)				
				--end
				--sleep(20)
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
					local TempPlayer1 = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
					local ThesePlayer1 = {}	
					local Use = {}
					for i=1,TempPlayer1 do
						ThesePlayer1[i] = GetSearchResult() -- 接暫存值
						if CheckID( ThesePlayer1[i] ) == true and 
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_VOC ) ~= 0 and
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsPlayer ) == 1 then
						--檢查玩家是不是還在；檢查是否死亡
							Use[table.getn(Use)+1] = ThesePlayer1[i]	--放入sway內
						end					
					end					
					--local Use = DW_HateRemain(0)     			--仇恨表找人 填0代表 不排除主坦
					local Use1 = {}		
					local Use2 = {}
					any = DW_Rand(table.getn(Use))		--rand Use
					Addbuff( Use[any], 506986, 0, 10)
					--第二次rand
					for i = 1 , table.getn(Use) do				--use有幾個人做幾次		
						if Use[i] ~= Use[any] then				--i不等於any1
							Use1[table.getn(Use1)+1] = Use[i]	--放入use1
						end
					end
					if table.getn(Use1) ~= 0 then				--use1不為0的時候
						any1 = DW_Rand(table.getn(Use1))	--rand any2出來
						if Use1[any1] ~= nil then				--不等於nil的時候執行
							Addbuff( Use1[any1], 506986, 0, 10)
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
								Addbuff( Use2[any2], 506986, 0, 10)
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
					BeginPlot( control, "Cang_129_oh_buffskill_in_e" , 0 )
					skill02 = 0
				elseif SkillRND == 2 then
					--第一次rand
					local Use = DW_HateRemain(0)				--仇恨表找人 填0代表 不排除主坦
					local Use1 = {}		
					local Use2 = {}
					any = DW_Rand(table.getn(Use))		--rand Use
					Addbuff( Use[any], 506987, 0, 10)
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
							Addbuff( Use1[any1], 506987, 0, 10)
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
								Addbuff( Use2[any2], 506987, 0, 10)
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
					BeginPlot( control, "Cang_129_oh_buffskill_out_e" , 0 )	
					skill02 = 0
				end							
			end
----------普通技能施放			
			if skill >= 10 then
				local SkillRND = DW_Rand ( 100 ) 
				if SkillRND <= 100 and SkillRND > 75 then 
					SkillShow = 1	--
					BossTarget = OwnerID()					
				elseif SkillRND <= 75 and SkillRND > 0 then 
					SkillShow = 2	--
					BossTarget = AttackTarget											
				end	
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end
				--ScriptMessage( OwnerID() , -1 , 2 , SkillSay[SkillShow], 1 )
				CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay[SkillShow] * CheckTime )	
				SkillShow = 0
				skill = 0
			end		
		end
	end
end

--------------------------------------------------------------執政官流血技能
function Cang_129_2bo_oh_skill_e()
	BeginPlot( TargetID() , "Cang_129_2bo_oh_skill_do_e" , 0)
end

function Cang_129_2bo_oh_skill_do_e()

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
	
	
	
	

