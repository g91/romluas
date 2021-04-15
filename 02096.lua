function ic_104653_01()   ------主控器
	local Ctrl = OwnerID()					--控制器
	local open=0						    --開戰旗標				        
	local Luck=0							--隨機用
	local time6=0							--計時器 小怪用
	local time7=0							--計時器 黑色風暴用
	local killidtime=0
	local door1								--阻擋門1
	local door2								--阻擋門2
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104653,780730,13,1) 	-----BOSS創在  旗標1
	local door=CreateObjByFlag(104506,780730,14,1)	-----阻擋門(王死才會消失)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)	
				AddToPartition(Boss,RoomID)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	while true do
		sleep(10)	
		if hatelistcount(boss)~=0 then    		---讀仇恨人數
			time6=time6+1
			time7=time7+1
			---killidtime=killidtime+1
			---say(OwnerID(),"killidtime"..killidtime)
			if time7>=20 then
				WriteRoleValue(boss,EM_RoleValue_register3,1)---回傳1給BOSS
				time7=0
			end
			if time6>=31 then
				WriteRoleValue(boss,EM_RoleValue_register7,1)---回傳1給BOSS
				time6=0
			end
			--if killidtime>=480 then
				--WriteRoleValue(boss,EM_RoleValue_register8,1)---回傳1給BOSS
				--killidtime=0
			--end
			if open==0 then
				open=1										--開打了
			 door2=CreateObjByFlag(104198,780730,11,1)-------入口阻擋門
				SetModeEx( door2 , EM_SetModeType_Mark, false)			----可點選(否)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
				SetModeEx( door2 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( door2 , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---可砍殺(否)
				SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)	---索敵(否)
				AddToPartition(door2,RoomID)	
			door1=CreateObjByFlag(104198,780730,12,1)-------王身後阻擋門
				SetModeEx( door1 , EM_SetModeType_Mark, false)			---可點選(否)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(否)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--索敵(否)	
				AddToPartition(door1,RoomID)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_08]" , 2 )	-------開打對話--盜墓者~是誰讓你們進來的~受死吧
				BeginPlot(boss , "ic_104653_02" , 0)				------命令角色做事情
			end
		end	
		if hatelistcount(boss)==0 and open==1 then			--開戰後仇恨表沒人
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --王沒死 玩家滅團
				BeginPlot(OwnerID() , "ic_104224_07" , 0)
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
					if ID2==104654 or ID2==104655 then
					DelObj(ID)
					end
				end
				sleep(20)
				DelObj(boss)                                        --沒死自己殺死王
				DelObj(door1)										--刪除阻擋門
				DelObj(door2)										--刪除阻擋門
				sleep(30)                                           --5秒
				Boss=CreateObjByFlag(104653,780730,13,1)           --再創造1之				
				AddToPartition(Boss,RoomID)	                                ---創造王 必要				
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				open=0										--重置戰鬥
				time6=0
				time7=0
				killidtime=0
			elseif	ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---王死了
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_03]" , 2 )----雖然我被擊敗了~後面有更強的守護者再等著你---死亡
				BeginPlot(OwnerID() , "ic_104653_07" , 0)
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 ,NPCXX do
					if ID2==104654 or ID2==104655 then
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					DelObj(ID)
					end
				end
				DelObj(door)
				DelObj(door1)
				DelObj(door2)	
				open=0										--重置戰鬥
				time6=0
				time7=0
				killidtime=0
				break
			end				
		end	
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---無敵殺了王
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_03]" , 2 )----雖然我被擊敗了~後面有更強的守護者再等著你---死亡
				BeginPlot(OwnerID() , "ic_104653_07" , 0)
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 ,NPCXX do
					if ID2==104304 or ID2==104303 then
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					DelObj(ID)
					end
				end
				DelObj(door)
				open=0										
				time6=0
				time7=0
				killidtime=0
				sleep(600000) 
			end	
	end		
end  
function ic_104653_02()    ------王AI
	local Boss=OwnerID()
	local time1=0 	-----第1階段用
	local time2=0 	----計時器2 -第1-2階段用
	local time3=0 	----計時器3 -第2階段用
	local time4=0 	----計時器4 -第2階段用
	local time5=0 	----計時器4 -第2階段用
	local mob		----生隱形旗標用---黑色漩渦
	local mob1		----生小蟲用
	local mob2		----生小蟲用
	local mob3		----生狗人用
	local Luck=0	----隨機表用---技能用
	local Luck2=0	----隨機座標用
	local Luck3=0	----小蟲隨機用
	local play1x={} 
	local plays=0
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --讀取目前血量
	local HPPercent = NowHP / MaxHP	                                --血量百分比	
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local killidtime1 =0---狂暴用
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	local searchplay={}
	local searmuch=0 ------------數量
	while 1 do 
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標  
		local BossTarget=AttackTarget
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
		NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )--------讀取目前血量
		HPPercent = NowHP / MaxHP	--血量百分比
		sleep(10)
		--killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		--if killidtime1>=1 then
			--AddBuff( OwnerID(),507663,0 ,-1 )
			--killidtime1=0
			--WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)---把口袋8歸0
			--sleep(600)
		--end
		if HPPercent >=0.61 then  ------血量>=61% 用這技能
			time2=time2+1
			time3=time3+1
			---say(OwnerID(),"time"..time4)
			if time2==25 then ---綠法陣---生小蟲用30秒
				Luck2=DW_Rand(9)
				Luck3=Luck2+1
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_03]" , 2 )---------------出來吧~黑暗之星
				CastSpellLV( OwnerID() , OwnerID() , 496024, 2)
				mob1=CreateObjByFlag(104655,780730,Luck2,1)
				AddToPartition(mob1,RoomID)
				WriteRoleValue(mob1,EM_RoleValue_PID,boss)			--對小怪說BOSS是誰
				BeginPlot(mob1,"ic_104653_06",0)
				mob2=CreateObjByFlag(104655,780730,Luck3,1)
				AddToPartition(mob2,RoomID)
				WriteRoleValue(mob2,EM_RoleValue_PID,boss)			--對小怪說BOSS是誰
				BeginPlot(mob2,"ic_104653_06",0)
				time2=0								
			elseif  time2==15 then---黑法陣 15秒
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				---say(OwnerID(),"5")
				play1x=DW_HateRemain(0)-----------------------隨機打
				plays=DW_Rand(table.getn(play1x))	
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_05]" , 2 )---------------黑暗力量擴散	
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------維持動作
				CastSpellLV( OwnerID() , play1x[plays] , 496026 , 30 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------結束動作
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動
			elseif time2==20 then 
				Luck=DW_Rand(3)---隨機取得數字用
				if Luck == 1 then-----白法陣 20秒
				play1x=DW_HateRemain(0)-----------------------隨機打
				plays=DW_Rand(table.getn(play1x))
				---say(OwnerID(),"1")
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end	
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_01]" , 2 )---------------	體驗我族人受過的傷害吧
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------維持動作
				CastSpellLV( OwnerID() ,play1x[plays] , 496022 , 4 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end					
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------結束動作
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動
				sleep(50)
				elseif Luck == 2 then ---紅法陣
				---say(OwnerID(),"2")
				play1x=DW_HateRemain(0)-----------------------隨機打
				plays=DW_Rand(table.getn(play1x))
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_02]" , 2 )---------------承受火焰的憤怒吧
				sleep(20)
				searchplay= SearchRangePlayer ( play1x[plays] , 75 )----範圍75  掃區域找NPC
				searmuch=table.getn(searchplay)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end	
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)----------------------維持動作
				if searmuch == 1 then 
					CastSpellLV( OwnerID() , play1x[plays] , 496023, 100)
				elseif searmuch == 2 then
					CastSpellLV( OwnerID() , play1x[plays] , 496023, 50)
				elseif searmuch == 3 then
					CastSpellLV( OwnerID() , play1x[plays] , 496023, 25)
				elseif searmuch >= 4 then
					CastSpellLV( OwnerID() , play1x[plays] , 496023, 12)
				end	
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------結束動作
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動
				elseif Luck == 3 then --黃法陣
				play1x=DW_HateRemain(0)-----------------------隨機打
				plays=DW_Rand(table.getn(play1x))			
				--say(OwnerID(),"4")
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end	
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_04]" , 2 )---------------接受沙塵制裁吧	
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------維持動作
				CastSpellLV( OwnerID() ,play1x[plays], 496025, 50 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------結束動作
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動
				end
		    end
		end
	    if HPPercent <=0.60 then------血量低於60% 用這技能
			time5=time5+1
			--time4=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
			---say(OwnerID(),"time"..time5)
			if time5==13  then---黑法陣--15秒
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				play1x=DW_HateRemain(0)-----------------------隨機打
				plays=DW_Rand(table.getn(play1x))
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動		
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_05]" , 2 )---------------黑暗力量擴散	
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------維持動作
				CastSpellLV( OwnerID() , play1x[plays] , 496026 , 30)
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------結束動作
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動
				sleep(20)
			elseif time5>=20 then------綁玩家--30秒
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end	
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_06]" , 2 )---------------出現吧~我族最強的勇士
				Luck2=DW_Rand(10)
				play1x=DW_HateRemain(0)-----------------------打坦
				plays=DW_Rand(table.getn(play1x))
				if CheckBuff( play1x[plays], 507530 ) == false then					
					CastSpellLV( OwnerID() , play1x[plays] , 496126, 2)
					sleep(10)
					mob3=CreateObjByFlag(104654,780730,Luck2,1)
					AddToPartition(mob3,RoomID)
					WriteRoleValue(mob3,EM_RoleValue_PID,boss)
					BeginPlot(mob3,"ic_104653_08",0)
					time5=0
				end		
			elseif time5==15 then------黑漩渦--20秒
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end	
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_07]" , 8 )---------------承受的住死神風暴嗎?
				play1x=DW_HateRemain(0)-----------------------打坦
				plays=DW_Rand(table.getn(play1x))
				if CheckBuff( play1x[plays] , 507413 ) == false then 
					CastSpellLV( OwnerID() , play1x[plays] , 496020, 7 )
					WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				end				
			end	
		end
	end
end 
function ic_104653_06()----小蟲AI
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )
SetAttack( ownerid() , AttackTarget) ----------------------------出生的瞬間去看目標是誰去打她一下
	while true do
	---say(OwnerID(),"1")
	if hatelistcount(boss)==0 then   --檢查王有沒有目標
		DelObj(OwnerID())            --沒有把自己殺死    
	end	
	sleep(10)
	CastSpellLV( OwnerID() ,OwnerID() , 496131, 1)
	sleep(300)
	end	
end

function ic_104653_07()----刪除BUFF用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 507419 ) == true then
					CancelBuff(ThesePlayer[i], 507419)
					CancelBuff(ThesePlayer[i], 507534)	
					CancelBuff(ThesePlayer[i], 507530)
				elseif CheckBuff( ThesePlayer[i] , 507534 ) == true then
					CancelBuff(ThesePlayer[i], 507419)
					CancelBuff(ThesePlayer[i], 507534)	
					CancelBuff(ThesePlayer[i], 507530)
				elseif CheckBuff( ThesePlayer[i] , 507530 ) == true then
					CancelBuff(ThesePlayer[i], 507419)
					CancelBuff(ThesePlayer[i], 507534)	
					CancelBuff(ThesePlayer[i], 507530)	
				end
		end					
	end
end
function ic_104653_08()----狗人AI
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	while true do
		if hatelistcount(boss)==0 then   --檢查王有沒有目標
			DelObj(OwnerID())            --沒有把自己殺死    
		end
		sleep(10)
	end
end
--SC_104224_01--體驗我族人受過的傷害吧
--SC_104224_02--承受火焰的憤怒吧
--SC_104224_03--出來吧~黑暗之星
--SC_104224_04--接受沙塵制裁吧
--SC_104224_05--黑暗力量擴散
--SC_104224_06--出現吧~我族最強的勇士
--SC_104224_07--承受的住死神風暴嗎?
--SC_104224_08--盜墓者~是誰讓你們進來的~受死吧