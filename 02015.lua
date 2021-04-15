function ic_104461_01()   ------主控器
	local Ctrl = OwnerID()					--控制器
	local open=0						    --開戰旗標	
	local Luck1=0							--小怪隨機用	
	local Luck=0							--隨機用
	local time3=0							--計時器 小怪用
	local killidtime=0  					--狂爆時間
	local mob								--小怪1
	local mob1								--小怪2
	local door1								--阻擋門1
	local door2								--阻擋門2
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104461,780699,1,1) 	-----BOSS創在  旗標1
	local door=CreateObjByFlag(103125,780699,7,1)	-----阻擋門(王死才會消失)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)	
	SetModeEx( boss, EM_SetModeType_Move, false)
	AddToPartition(Boss,RoomID)
	AddBuff( Boss,507216,0 ,-1 )
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	while true do
		sleep(10)	
		if hatelistcount(boss)~=0 then    		---讀仇恨人數
			time3=time3+1
			killidtime=killidtime+1
			if killidtime>=480 then
				WriteRoleValue(boss,EM_RoleValue_register4,1)---回傳1給BOSS
			end
			if open==0 then
				open=1										--開打了
			 door2=CreateObjByFlag(103126,780699,6,1)-------入口阻擋門
				SetModeEx( door2 , EM_SetModeType_Mark, false)			----可點選(否)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
				SetModeEx( door2 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( door2 , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---可砍殺(否)
				SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)	---索敵(否)	
				AddToPartition(door2,RoomID)	
			door1=CreateObjByFlag(103126,780699,5,1)-------王身後阻擋門
				SetModeEx( door1 , EM_SetModeType_Mark, false)			---可點選(否)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(否)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--索敵(否)	
				AddToPartition(door1,RoomID)
				BeginPlot(boss , "ic_104461_02" , 0)				------命令角色做事情
			end
			if time3>=30 then										---30秒生1次
				Luck1=DW_Rand(9)
				---say(OwnerID(),"4")
				mob=CreateObjByFlag(104463,780721,Luck1,1) 			----生小怪 旗標2 法師
				AddToPartition(mob,RoomID)	
				WriteRoleValue(mob,EM_RoleValue_PID,boss)		---對小怪說BOSS是誰
				BeginPlot(mob,"ic_104461_05",0)                     ---小怪AI
		    end
			if time3>=30 then										---30秒生1次
				Luck1=DW_Rand(9)
				---say(OwnerID(),"4")
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_04]" , 2 )--小怪出生的對話
				mob1=CreateObjByFlag(104462,780721,Luck1,1) 			----生小怪 旗標2 戰士
				AddToPartition(mob1,RoomID)	
				WriteRoleValue(mob1,EM_RoleValue_PID,boss)			--對小怪說BOSS是誰
				BeginPlot(mob1,"ic_104461_06",0)					----小怪AI
			time3=0 		--重置計時
			end		
		end	
		if hatelistcount(boss)==0 and open==1 then			--開戰後仇恨表沒人
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --王沒死 玩家滅團
				BeginPlot(OwnerID() , "ic_104108_07" , 0)
            local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----自身範圍300  掃區域找NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104462	then  ---找固定ID NPC
							DelObj( NPCXX[i] )
						end
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104463	then  ---找固定ID NPC
							DelObj( NPCXX[i] )
						end
					end
				end		
				DelObj(boss)                                        --沒死自己殺死王
				DelObj(door1)										--刪除阻擋門
				DelObj(door2)										--刪除阻擋門
				sleep(50)                                           --5秒
				Boss=CreateObjByFlag(104461,780699,1,1)           --再創造1之				
				AddToPartition(Boss,RoomID)	                                ---創造王 必要		
				AddBuff( Boss,507216,0 ,-1 )	
				SetModeEx( boss, EM_SetModeType_Move, false)	
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				open=0										--重置戰鬥
				time3=0
				killidtime=0
			elseif	ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---王死了
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_03]" , 2 )----雖然我被擊敗了~後面有更強的守護者再等著你---死亡用
				BeginPlot(OwnerID() , "ic_104108_07" , 0)
				local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----自身範圍300  掃區域找NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104462	then  ---找固定ID NPC
							DelObj( NPCXX[i] )
						end
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104463	then  ---找固定ID NPC
						DelObj( NPCXX[i] )
						end
					end
				end		
				DelObj(door)
				DelObj(door1)
				DelObj(door2)	
				open=0										--重置戰鬥
				time3=0
				killidtime=0
			end				
		end
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---王死了
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_03]" , 2 )----雖然我被擊敗了~後面有更強的守護者再等著你---死亡用
				BeginPlot(OwnerID() , "ic_104108_07" , 0)
				local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----自身範圍300  掃區域找NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104462	then  ---找固定ID NPC
							DelObj( NPCXX[i] )
						end
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104463	then  ---找固定ID NPC
						DelObj( NPCXX[i] )
						end
					end
				end		
				DelObj(door)
				open=0										--重置戰鬥
				time3=0
				killidtime=0
				break	
		end		
	end		
end  
function ic_104461_02()    ------王AI
	local time1=0 	----計時器1 -技能用
	local time2=0	---- 計時器-技能大招用
	local time10=0	------表演用
	local Luck=0	----隨機表用
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --讀取目前血量
	local HPPercent = NowHP / MaxHP	                                --血量百分比	
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local y = 0
	local killidtime1 =0
	while 1 do 
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標  
		local BossTarget=AttackTarget
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
		NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )--------讀取目前血量
		HPPercent = NowHP / MaxHP	--血量百分比
		if time10<=0 then
		---say(OwnerID(),"99")
			----sleep(10)
			time10=time10+1
			CastSpellLV( OwnerID() , OwnerID() ,495953, 1)------表演丟披風
			CancelBuff( OwnerID() ,507216 ) ----------------------------清除他的buff
			SetModeEx( OwnerID() , EM_SetModeType_Move, true)
			sleep(5)
		end
		sleep(10)
		y = ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		if y==1 then-------對自己放+15%攻擊用
			---say(OwnerID(),"99")
			AddBuff( OwnerID(),507268,0 ,-1 )
			y=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)----把口袋3歸0
		elseif y==2 then-----對自己放+50%攻擊用
		---say(OwnerID(),"00")
		AddBuff( OwnerID(),507269,0 ,-1 )
			y=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)---把口袋3歸0
		elseif y==3 then-----對自己放+80%攻擊用
		---say(OwnerID(),"00")
		AddBuff( OwnerID(),507276,0 ,-1 )
			y=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)---把口袋3歸0		
		end
		killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		if killidtime1>=1 then
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_06]" , 2 )------佩謝法術加持~讓雅瓦卡力量爆增~跑吧跑吧~無知入侵者。---狂爆
			AddBuff( OwnerID(),507277,0 ,-1 )
			AddBuff( OwnerID(),507364,0 ,-1 )
			sleep(600)
			end
		if HPPercent >=0.71 then  ------血量>=71% 用這技能
			time1=time1+1
			---say(OwnerID(),"time"..time1)
			if time1>=7 then 
				Luck=DW_Rand(3)---隨機取得數字用
				if Luck == 1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				--say(OwnerID(),"1")
				CastSpellLV( OwnerID() , BossTarget , 495838, 200 )----單體技能
				elseif Luck == 2 then 
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				--say(OwnerID(),"2")
				CastSpellLV( OwnerID() , OwnerID() , 495923, 1 )----自身範圍
				elseif Luck == 3 then 
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end			
				---say(OwnerID(),"3")	
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_01]" , 1 )	---煩人的入侵者，讓你們體會貓族人的厲害。---翻桌用			
					CastSpellLV( OwnerID() ,OwnerID() , 495837, 2 )----翻桌
					sleep(30)		    
				end
				time1=0
		    end
		end
	    if HPPercent <=0.70 then------血量低於70% 用這技能
			time1=time1+1
			time2=time2+1
			---say(OwnerID(),"time"..time1)
			if time1>=7 then 
				Luck=DW_Rand(3)---隨機取得數字用
				if Luck == 1 then
				--say(OwnerID(),"4")
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				CastSpellLV( OwnerID() , BossTarget , 495838, 200 )-----單體技能
				elseif Luck == 2 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end	
				--say(OwnerID(),"5")
				CastSpellLV( OwnerID() , OwnerID() , 495923, 1)-----自身範圍
				elseif Luck == 3 then 
				--say(OwnerID(),"6")
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_01]" , 2 )----煩人的入侵者，讓你們體會貓族人的厲害。---翻桌用
				CastSpellLV( OwnerID() ,OwnerID() , 495837, 1 )----翻桌
				sleep(30)		    
				end
				time1=0
			end	
			if time2>=40 then------大招 40秒固定放---全體
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end			
			    ---say(OwnerID(),"7")
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_02]" , 2 )---------------沒有人可以在貓族憤怒下生存。---大絕用
				sleep(20)
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
				---say(OwnerID(),"[SC_104108_02]")
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------攻擊動作
				CastSpellLV( OwnerID() , OwnerID() , 495834 , 0 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------播放下來
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	
				SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
				time2=0
			end
		end
	end
end
function ic_104461_05 () -----小怪AI-1 法師
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local AttackTarget = ReadRoleValue( boss, EM_RoleValue_AttackTargetID )   ------ 找尋BOSS的攻擊目標  
	local BossTarget=0
	SetAttack( ownerid() , AttackTarget) ----------------------------出生的瞬間去看目標是誰去打她一下
	while true do
		BossTarget = ReadRoleValue( ownerid(), EM_RoleValue_AttackTargetID )   ------ 找尋BOSS的攻擊目標  
		sleep(10)
		CastSpellLV( OwnerID() , BossTarget , 495948, 100 )---禁言技能
		sleep(50)
		if hatelistcount(boss)==0 then   --檢查王有沒有目標
			DelObj(OwnerID())            --沒有把自己殺死    
		end	
	end
end
function ic_104461_06 () -----小怪AI-2 戰士
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )   ------ 找尋BOSS的攻擊目標  
	local BossTarget=0
	SetAttack( ownerid() , AttackTarget) 
	while true do
		BossTarget = ReadRoleValue( ownerid(), EM_RoleValue_AttackTargetID )   ------ 找尋BOSS的攻擊目標  
		sleep(10)
		CastSpellLV( OwnerID() , BossTarget , 495979, 1 )---破甲技能
		sleep(50)
		if hatelistcount(boss)==0 then   --檢查王有沒有目標
			DelObj(OwnerID())            --沒有把自己殺死    
		end	
	end
end
 
 --SC_104108_01---煩人的入侵者，讓你們體會貓族人的厲害。---翻桌用
 --SC_104108_02---沒有人可以在貓族憤怒下生存。---大絕用
 --SC_104108_03---雖然我被擊敗了~後面有更強的守護者再等著你---死亡用
-- SC_104108_04--出來吧~我的族人~幫助我趕走入侵者。---招小兵用
 --SC_104108_05--此區無法使用