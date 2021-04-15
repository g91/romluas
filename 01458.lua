

function Lua_cang_Tree_modecheck()	---------------------檢查Boss處於哪個模式
	local Mode1 = 504119	--階段1
	local Mode2 = 504120	--階段2
	if CheckBuff(OwnerID() , Mode1)	== true  then	--如果在階段1
		CancelBuff( OwnerID() , Mode1 )		--刪除1
		AddBuff( OwnerID() , Mode2 , 0 , -1 )	--進入2
	elseif CheckBuff(OwnerID() , Mode2) == true then	--如果在階段2
		CancelBuff( OwnerID() , Mode2 )		--刪除2
		AddBuff( OwnerID() , Mode1 , 0 , -1 )	--進入1	
	end
end




function Lua_cang_BossAi_Gtree()

	while true do
		sleep(10)
		local SkillDelay = { 20, 40, 30}	-- 技能延遲時間
		--金樹之怒, 大地之殤, 崩擊
		local SkillID = { 493569, 493574, 493573, 493571, 493624, 493570}	-- 招式ID	
		--金樹之怒, 大地之殤, 崩擊, 炸彈, 平靜, 銀樹之怒
		local BuffID = { 503868, 503874, 503780, 503778, 503869}	-- BuffID
		--金樹之怒, 樹之賜, 平靜, 樹之賜(空), 銀樹之怒
		local SkillLV = {1, 1, 10, 1}
		--金樹之怒, 大地之殤, 崩擊, 炸彈
		local SkillSay = { "[SC_102347_1]", "[SC_102347_2]", "[SC_102347_3]", "[SC_102347_4]" }	-- 招式說話
		-- 讓泰貝瑞恩淨化心靈。
		-- 讓我看看你還有什麼能耐。
		-- 接受大地的憤怒吧!!!
		--燃燒你們體內的自然能量!!
		local SkillA = 0	--怒 開場法術
		local SkillB = 0
		local SkillC = 0	--大地之殤計時器
		local SkillD = 0	--崩擊計時器
		local SkillF = 0	--炸彈 開場變數
		local Mode1 = 504119	--階段1
		local Mode2 = 504120	--階段2
		local CombatBegin = 0	--開場一次
		local CountSay = 0
		
		while true do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--抓目標值
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥	
					
				local Useful = {}
				local Use2 = {}				
				
				SkillC = SkillC + 1
				SkillD = SkillD + 1
				local TreeTarget = AttackTarget
				local partymember = LuaFunc_PartyData( AttackTarget)	--抓取隊伍成員				
				local SkillShow = 0	--技能選擇器
				local TreeTarget = AttackTarget	--王的目標
				local ThesePlayer = {}
				local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --銀樹GID
				
								
				if CombatBegin == 0 then	--開場一次
					Addbuff( OwnerID(), 503914, 1 , -1)    --開場對自己放檢查
					Addbuff( OwnerID(), mode1, 1 , -1)    --開場對自己(p1)										
					CombatBegin = 1
				end					

				if CheckBuff(OwnerID() , Mode1) == true then	--mode1	
					if SkillA == 0 then
						CancelBuff( OwnerID() , BuffID[2] )
						SysCastSpellLV( OwnerID(), OwnerID() , SkillID[5], 0) ----平靜
						sleep(10)
						for i = 1 , partymember[0] , 1 do
							if CheckID( partymember[i] ) == true and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( partymember[i] , EM_RoleValue_IsPlayer ) == 1 then	--檢查玩家是不是還在；檢查是否死亡；檢查是不是玩家
								if GetDistance( OwnerID(), partymember[i] ) <= 800 then
									Useful[table.getn(Useful)+1] = partymember[i]	
								end--放入Useful裡面
							end
						end								
						
						local anyone1 = Rand(table.getn(Useful))+1				--rand Useful裡面的人
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102347_1]", 1 )
						SysCastSpellLV( Useful[anyone1], OwnerID(), 493569, 1)	--rand出來的人對王嘲諷
						SetAttack(OwnerID(),Useful[anyone1])						--讓王攻擊該玩家		
						sleep(10)
						if CheckID( HT ) == true then
							for j=1 , table.getn(Useful) do					
								if Useful[j] ~= Useful[anyone1] then		--找[J]不等於anyone1
									Use2[table.getn(Use2)+1] = Useful[j]	--把這些人放入Use2
								end
							end		
							local any2 = Rand(table.getn(Use2))+1			--rand any2裡面的人
							if Use2[any2] ~= nil then
								ScriptMessage( HT , -1 , 2 , "[SC_102348_1]", 1 )
								SysCastSpellLV( Use2[any2] , HT , 493570, 1) 	--rand出來的人對銀樹嘲諷
								SetAttack( HT , Useful[any2] )						--讓王打該玩家
								--Say(HT, "G>S_target="..Useful[any2])
								sleep(10)
							end
						end
						SkillA = 1							
					end	
														
					if SkillC >= 7 then --大地之殤
						SkillShow = 2
						TreeTarget = OwnerID()
						SkillC = 0						
					elseif SkillD >= 5 then --崩擊
						SkillShow = 3
						TreeTarget = AttackTarget
						SkillD = 0
					end	
					SkillF = 0	--歸零計數
					CountSay = 0
				elseif CheckBuff(OwnerID() , Mode2) == true then	--mode2
					if CountSay == 0 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102347_6]", 1 )
						Sleep(30)
						Addbuff( OwnerID(), BuffID[2], 1 , 20)    --對自己賜
						CountSay = 1
					end
					if SkillF == 0 then  --發動炸彈第一次
						CastSpellLV( OwnerID(), TreeTarget, SkillID[4], 1)
						Sleep(10)
						SkillF = 1
					end
					if SkillC >= 7 then --大地之殤
						SkillShow = 2
						TreeTarget = OwnerID()
						SkillC = 0						
					elseif SkillD >= 5 then --崩擊
						SkillShow = 3
						TreeTarget = AttackTarget
						SkillD = 0
					end	
					SkillA = 0	--歸零計數
				end	
				if SkillShow ~= 0 then
					Say( OwnerID() , SkillSay[SkillShow] )
					CastSpellLV( OwnerID() , TreeTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay[SkillShow])
					SkillShow = 0
				end							
			else
				break
			end
		end					
	end
end





function Lua_cang_BossAi_Stree()

	while true do
		sleep(10)
		local SkillDelay = { 10, 40, 30}	-- 技能延遲時間
		--銀樹之怒, 生命衰弱, 禮讚
		local SkillID = { 493570, 493576, 493575, 493624}	-- 招式ID	
		--銀樹之怒, 生命衰弱, 禮讚
		local SkillLV = {1, 2, 2}
		--銀樹之怒, 生命衰弱, 禮讚
		local BuffID = { 503869, 503875, 503780}	-- BuffID
		--銀樹之怒, 樹之賜, 平靜
		local SkillSay = { "[SC_102348_1]", "[SC_102348_2]", "[SC_102348_3]", "[SC_102347_4]" }	-- 招式說話
		-- 讓洛爾琳淨化你的心靈。
		-- 小心能量的反撲。
		-- 生命由我掌控!!!
		--燃燒你們體內的自然能量!!
		local SkillA = 1	--變數 開場法術
		local SkillC = 0	--生命衰弱計時器
		local SkillD = 0	--禮讚計時器
		local SkillF = 0	--炸彈計數器
		local Mode1 = 504119	--階段1
		local Mode2 = 504120	--階段2
		local CombatBegin = 0	--開場一次
		local CountSay = 0	--訊息開關 

		while true do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--抓目標值
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥				
			SkillC = SkillC + 1
			SkillD = SkillD + 1
			local SkillShow = 0			
			--Say(OwnerID() , SkillD)
			local TreeTarget = AttackTarget
			local partymember = LuaFunc_PartyData( AttackTarget)
			local Useful = {}
			local Use2 = {}					
		
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
			local ThesePlayer = {}
			local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --金樹GID

				if CombatBegin == 0 then	--開場一次
					Addbuff( OwnerID(), 503914, 1 , -1)     --開場對自己放檢查
					Addbuff( OwnerID(), mode1, 1 , -1)		--開場對自己(p1)
					Addbuff( OwnerID(), 503704, 1 , -1)		--不攻擊
					CombatBegin = 1
				end		
				
				if CheckBuff(OwnerID() , Mode1) == true then	--mode1
					if SkillA == 0 then
						CancelBuff( OwnerID() , BuffID[2] )		--刪除賜			
						if CheckID( HT ) == false or ReadRoleValue( HT , EM_RoleValue_IsDead ) == 1 then
							SysCastSpellLV( OwnerID(), OwnerID() , SkillID[4], 0) ----平靜
							sleep(10)
							for i = 1 , partymember[0] , 1 do
								if CheckID( partymember[i] ) == true and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0 then	--檢查玩家是不是還在；檢查是否死亡
									if GetDistance( OwnerID(), partymember[i] ) <= 800 then
										Useful[table.getn(Useful)+1] = partymember[i]
									end	--放入Useful裡面
								end
							end							
							local anyone1 = Rand(table.getn(Useful))+1				--rand Useful裡面的人
							if Useful[anyone1] ~= nil then
								ScriptMessage( OwnerID() , -1 , 2 , "[SC_102348_1]", 1 )
								SysCastSpellLV( Useful[anyone1], OwnerID(), 493570, 1)	--rand出來的人對王嘲諷
								SetAttack(OwnerID(),Useful[anyone1])						--讓王攻擊該玩家	
								--Say(OwnerID(), "S_target="..Useful[anyone1])
								sleep(10)
								SkillA = 1
							end	
						end	
					end	
					
					if SkillC >= 5 then --生命衰弱
						SkillShow = 2
						TreeTarget = OwnerID()
						SkillC = 0
					elseif SkillD >= 2 then --禮讚
						SkillShow = 3
						TreeTarget = AttackTarget
						SkillD = 0
					end
					SkillF = 0
					CountSay = 0
				elseif CheckBuff(OwnerID() , Mode2) == true then	--mode2
					if CountSay == 0 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102347_6]", 1 )
						Sleep(30)
						Addbuff( OwnerID(), BuffID[2], 1 , 20)    --開場對自己賜
						CountSay = 1
					end
					if CheckID( HT ) == false or ReadRoleValue( HT , EM_RoleValue_IsDead ) == 1 then
						if SkillF == 0 then  --發動炸彈第一次
							CastSpellLV( OwnerID(), TreeTarget, 493571, 1)
							Sleep(10)
							SkillF = 1
						end
					end

					if SkillC >= 5 then --生命衰弱
						SkillShow = 2
						TreeTarget = OwnerID()
						SkillC = 0
					elseif SkillD >= 2 then --禮讚
						SkillShow = 3
						TreeTarget = AttackTarget
						SkillD = 0
					end
					if CheckID( HT ) == false or ReadRoleValue( HT , EM_RoleValue_IsDead ) == 1 then
						SkillA = 0
					end
				end	
				if SkillShow ~= 0 then
					--Say(OwnerID(), TreeTarget)
					Say( OwnerID() , SkillSay[SkillShow] )
					CastSpellLV( OwnerID() , TreeTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay[SkillShow])
					SkillShow = 0
				end
			else
				break	
			end
		end					
	end
end
			




function Lua_cang_BossAi_GSTree()


	local Pass = 0	--第一層鎖
	local Pass2 = 0	--第二層鎖
	local Temp1	--金樹
	local Temp2	--銀樹
	local Temp3 --寶箱
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Door1, Door2, Door3
	local Count = 0
	local Count1 = 0
	local Craze = 0

	--產生金樹
	Temp1 = CreateObjByFlag( 102347, 780402, 0, 1) 
	AddToPartition( Temp1 , RoomID )	
	BeginPlot(Temp1,"Lua_cang_BossAi_Gtree",0)
	sleep(10)
	
	--產生銀樹
	Temp2 = CreateObjByFlag( 102348, 780403, 0, 1)
	AddToPartition( Temp2 , RoomID )
	BeginPlot(Temp2,"Lua_cang_BossAi_Stree",0)
	sleep(10)

	WriteRoleValue( Temp2 ,EM_RoleValue_PID, Temp1)	--寫入PID
	WriteRoleValue( Temp1 ,EM_RoleValue_PID, Temp2)	--寫入PID
	
	--Door1 = CreateObjByFlag( 102460, 780419, 0, 1)	--阻擋門
	--SetModeEx( Door1   , EM_SetModeType_Move, false )--移動
	--SetModeEx( Door1   , EM_SetModeType_Fight , false )--不可砍殺攻擊
	--SetModeEx( Door1   , EM_SetModeType_Strikback, false )--反擊
	--SetModeEx( Door1   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--SetModeEx( Door1   , EM_SetModeType_Mark, false )--標記
	--SetModeEx( Door1   , EM_SetModeType_Obstruct, true )--阻擋
	--AddToPartition( Door1 , RoomID )	
	Door2 = CreateObjByFlag( 102460, 780419, 1, 1) 
	SetModeEx( Door2   , EM_SetModeType_Move, false )--移動
	SetModeEx( Door2   , EM_SetModeType_Fight , false )--不可砍殺攻擊
	SetModeEx( Door2   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Door2   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Door2   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door2   , EM_SetModeType_Obstruct, true )--阻擋
	AddToPartition( Door2 , RoomID )	
	--Door3 = CreateObjByFlag( 102460, 780419, 2, 1) 
	--SetModeEx( Door3   , EM_SetModeType_Move, false )--移動
	--SetModeEx( Door3   , EM_SetModeType_Fight , false )--不可砍殺攻擊
	--SetModeEx( Door3   , EM_SetModeType_Strikback, false )--反擊
	--SetModeEx( Door3   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--SetModeEx( Door3   , EM_SetModeType_Mark, false )--標記
	--SetModeEx( Door3   , EM_SetModeType_Obstruct, true )--阻擋
	--AddToPartition( Door3 , RoomID )	
	
	while 1 do	--執行	--執行到PASS >1 中止回圈
		--Say(OwnerID(), "Count1="..Count1)
		sleep(10)
		Pass = 0
		Pass2 = 0		
		if GetDistance( Temp1, Temp2) >= 500 then
			pass2 = 1
 		end
		if HateListCount( Temp1 ) ~= 0 then 
			Craze = Craze +1
			if Craze == 360 then	
				Addbuff( Temp1, 503873, 1, -1)
				Addbuff( Temp2, 503873, 1, -1)
				Craze = 0
			end	
		elseif 	HateListCount( Temp1 ) == 0 and HateListCount( Temp2 ) == 0 then
			Craze = 0
		end		
		
		if	CheckID(Temp1)==false	or							--檢查Temp1是否存在
			ReadRoleValue(Temp1,EM_RoleValue_IsDead)==1	then	--檢查Temp1是否死亡	
			Pass = Pass + 1										--如果都成立 pass+1
			Hide(Temp1)											--隱藏屍體
			Count1 = Count1 + 1
			if	ReadRoleValue(Temp2,EM_RoleValue_IsDead)==0	and	--檢查Temp2是不是還活著
				CheckID(Temp2)==true and						--檢查Temp2是不是存在
				HateListCount( Temp2 )  == 0 then				--檢查Temp2仇恨表還有沒有人
				Pass2 = Pass2 + 1								--成立 Pass2 +1
			end
			if Count1 == 15 then
				Temp1 = CreateObjByFlag( 102347, 780402, 0, 1) 
				AddToPartition( Temp1 , RoomID )	
				BeginPlot(Temp1,"Lua_cang_BossAi_Gtree",0)
				WriteRoleValue( Temp1 ,EM_RoleValue_PID, Temp2)	--寫入PID
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(TargetID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					SetAttack( Temp1 , ThesePlayer[i] ) --送出攻擊目標
				end	
				sleep(10)
				Count1 = 0
			end
		end		
		if	CheckID(Temp2)==false	or							--檢查Temp2是否存在
			ReadRoleValue(Temp2,EM_RoleValue_IsDead)==1	then	--檢查Temp2是否死亡
			Pass = Pass + 1										--如果都成立 pass+1
			Hide(Temp2)											--隱藏屍體		
			Count1 = Count1 + 1
			if	ReadRoleValue(Temp1,EM_RoleValue_IsDead)==0	and	--檢查Temp1是否死亡
				CheckID(Temp1)==true and						--檢查Tmep1是不是存在
				HateListCount( Temp1 )  == 0 then				--檢查Temp1是否戰鬥中
				Pass2 = Pass2 + 1								--成立 Pass2 +1
			end
			if Count1 == 15 then
				Temp2 = CreateObjByFlag( 102348, 780403, 0, 1) 
				AddToPartition( Temp2 , RoomID )	
				BeginPlot(Temp2,"Lua_cang_BossAi_Stree",0)
				WriteRoleValue( Temp2 ,EM_RoleValue_PID, Temp1)	--寫入PID
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(TargetID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					SetAttack( Temp2 , ThesePlayer[i] ) --送出攻擊目標
				end	
				sleep(10)
				Count1 = 0
			end

		end
			--Pass2 只會為0或1, 0等於金銀都死, 1等於金銀其一死亡且另一離開戰鬥
		if	Pass2 == 1 then	--pass2 = 1 
			Count1 = 0
			--刪除現存樹
			DelObj(Temp1)
			DelObj(Temp2)
			sleep(50)

			--建立新的樹
			Temp1 = CreateObjByFlag( 102347, 780402, 0, 1)
			AddToPartition( Temp1 , RoomID )
			BeginPlot(Temp1,"Lua_cang_BossAi_Gtree", 10)
			sleep(10)

			Temp2 = CreateObjByFlag( 102348, 780403, 0, 1)
			AddToPartition( Temp2 , RoomID )
			BeginPlot(Temp2, "Lua_cang_BossAi_Stree", 10)
			sleep(10)
			WriteRoleValue( Temp2 ,EM_RoleValue_PID, Temp1)	--寫入PID
			WriteRoleValue( Temp1 ,EM_RoleValue_PID, Temp2)	--寫入PID
			Craze = 0
		end
		
		if	Pass == 2	then	--Pass為2 金銀都死亡或消失
			Count1 = 0
			local Temp5, Temp6
			
			Hide(Temp1)	--隱藏屍體
			Hide(Temp2)	--隱藏屍體
			sleep(50)
			--DelObj(Door1)
			DelObj(Door2)
			--DelObj(Door3)
			
			Temp5 = CreateObjByFlag( 113394, 780402, 0, 1)	--金樹SNPC
			AddToPartition( Temp5 , RoomID )
			ScriptMessage( Temp5 , -1 , 2 , "[SC_102347_5]", 1 )
			Say( Temp5 ,  "[SC_102347_5]")
			Temp6 = CreateObjByFlag( 102357, 780403, 0, 1)	--銀樹SNPC
			AddToPartition( Temp6 , RoomID )
			Say( Temp6 ,  "[SC_102348_4]")
			Temp3 = CreateObjByFlag( 102358, 780404, 0, 1)	--寶箱						
			--SetModeEx( Temp3  , EM_SetModeType_HideName, false )--名稱
			SetModeEx( Temp3  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( Temp3  , EM_SetModeType_NotShowHPMP, true )
			--SetModeEx( Temp3  , EM_SetModeType_Mark, false )--標記
			AddToPartition( Temp3 , RoomID )	--戰鬥特徵 
			SetFightMode(Temp3, 0, 0, 0, 0)
			sleep(10)
			ScriptMessage( Temp6 , -1 , 2 , "[SC_102348_4]", 1 )
			break
		end
	end	
end