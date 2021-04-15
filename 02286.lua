function ic_105514_01()  																	---第10口袋固定死亡劇情用				[$VAR1]			 SC_105267_00												
	local isaac=OwnerID()																	---控制器
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local open=0						  													---開戰旗標				        
	local killidtime=0																		---狂暴計時
	local BOSSXX=0																			---BOSS死亡
	local Boss100
	local BOSS9898=0
	local door1																				---阻擋門
	local mob1																				---暈BOSS用小球
	local mob2																				---暈BOSS用小球
	local mob3																				---暈BOSS用小球
	local mob4																				---暈BOSS用小球
	local mob5=0																			---開關		
	local mobplay																			---小球開始跑劇情
	local Boss=CreateObjByFlag(105514,780870,1,1) 											---BOSS創在  旗標1
	local door=CreateObjByFlag(105585,780870,2,1)											---阻擋門(王死才會消失)
	SetModeEx( Boss , EM_SetModeType_Move, false) 							---移動	
	SetModeEx( Boss , EM_SetModeType_Fight, false) 						---可砍殺
		mob1=CreateObjByFlag(105704,780870,11,1)												
			SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob1  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob1  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob1 , EM_SetModeType_Mark, false)									---可點選(否)
			AddToPartition( mob1 , RoomID )
			WriteRoleValue(mob1,EM_RoleValue_PID,Boss)										---mob1暫存口袋PID mob1=BOSS
		mob2=CreateObjByFlag(105704,780870,12,1)
			SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob2  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob2  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob2 , EM_SetModeType_Mark, false)									---可點選(否)	
			AddToPartition( mob2 , RoomID )
			WriteRoleValue(mob2,EM_RoleValue_PID,Boss)										---mob2暫存口袋PID mob2=BOSS
		mob3=CreateObjByFlag(105704,780870,13,1)
			SetModeEx( mob3  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob3  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob3  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob3  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob3 , EM_SetModeType_Mark, false)									---可點選(否)	
			AddToPartition( mob3 , RoomID )
			WriteRoleValue(mob3,EM_RoleValue_PID,Boss)										---mob3暫存口袋PID mob3=BOSS
		mob4=CreateObjByFlag(105704,780870,14,1)
			SetModeEx( mob4  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob4  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob4  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob4  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob4 , EM_SetModeType_Mark, false)									---可點選(否)
			AddToPartition( mob4 , RoomID )
			WriteRoleValue(mob4,EM_RoleValue_PID,Boss)										---mob4暫存口袋PID mob4=BOSS
		door1=CreateObjByFlag(105586,780870,3,1)									---王身後阻擋門
			SetModeEx( door1 , EM_SetModeType_Mark, false)							---可點選(否)
			SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 					---頭像框(否)
			SetModeEx( door1 , EM_SetModeType_Obstruct, true) 						---阻擋(是)
			SetModeEx( door1 , EM_SetModeType_Strikback, false) 					---反擊
			SetModeEx( door1 , EM_SetModeType_Move, false) 							---移動	
			SetModeEx( door1 , EM_SetModeType_Fight, false) 						---可砍殺
			SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 			---是否被搜尋(否)
			SetModeEx( door1 , EM_SetModeType_Searchenemy, false)					---索敵(否)	
			AddToPartition(door1,RoomID)		
			SetModeEx( door , EM_SetModeType_Mark, false)									---可點選(否)
			SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 							---頭相框(否)
			SetModeEx( door , EM_SetModeType_Obstruct, true) 								---阻擋(是)
			SetModeEx( door , EM_SetModeType_Strikback, false) 								---反擊
			SetModeEx( door , EM_SetModeType_Move, false) 									---移動	
			SetModeEx( door , EM_SetModeType_Fight, false) 									---可砍殺
			SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false)						---是否被搜尋(否) 
			SetModeEx( door , EM_SetModeType_Searchenemy, false)							---索敵(否)
			AddToPartition(door,RoomID)	
			AddToPartition(Boss,RoomID)
			SetPlot( Boss,"dead","ic_105514_BOSSXX",0 )										---掛死亡劇情
			SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
			SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_END)			
			WriteRoleValue(Boss,EM_RoleValue_PID,isaac)   									---BOSS暫存口袋PID BOSS=isaac
			WriteRoleValue(isaac,EM_RoleValue_PID,Boss)										---isaac暫存口袋PID isaac=BOSS
	while true do
		sleep(10)
		BOSSXX=ReadRoleValue(isaac , EM_RoleValue_register10)
		mobplay=ReadRoleValue(isaac , EM_RoleValue_register9)								---小球跑劇情
		BOSS9898=ReadRoleValue(isaac , EM_RoleValue_register8)
		--say(OwnerID(),"mobplay="..mobplay)
		--say(OwnerID(),"mob5="..mob5)
		if mobplay==1 and mob5==0 then
			BeginPlot(mob1 , "ic_105514_mob" , 0)
			BeginPlot(mob2 , "ic_105514_mob" , 0)
			BeginPlot(mob3 , "ic_105514_mob" , 0)
			BeginPlot(mob4 , "ic_105514_mob" , 0)
			--say(OwnerID(),"playmob")
			sleep(5)
			WriteRoleValue(isaac,EM_RoleValue_register9,0)
			mob5=1
		elseif mobplay==2 and mob5==1 then	
			WriteRoleValue(mob1,EM_RoleValue_register9,1)
			WriteRoleValue(mob2,EM_RoleValue_register9,1)
			WriteRoleValue(mob3,EM_RoleValue_register9,1)
			WriteRoleValue(mob4,EM_RoleValue_register9,1)
			sleep(10)
			WriteRoleValue(mob1,EM_RoleValue_register9,0)
			WriteRoleValue(mob2,EM_RoleValue_register9,0)
			WriteRoleValue(mob3,EM_RoleValue_register9,0)
			WriteRoleValue(mob4,EM_RoleValue_register9,0)
			mob5=0
			--say(OwnerID(),"stopmob")
		end
			if hatelistcount(boss)==0 and open==0 then 
				PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
			end
			if hatelistcount(boss)~=0 then    												---讀仇恨人數
				killidtime=killidtime+1
				if killidtime==360 then														---狂暴時間
					--WriteRoleValue(boss,EM_RoleValue_register10,1)							---狂爆了
					killidtime=0
				end
				if open==0 then
					open=1																	---開打了
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_END)	
				Boss100=Lua_DW_CreateObj("flag",104693,780870,1,0)							---測試距離用
						SetModeEx( Boss100  , EM_SetModeType_HideName, false )					---名稱
						SetModeEX( Boss100  , EM_SetModeType_Gravity , false )					---重力
						SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				---不秀頭像框
						SetModeEx( Boss100  , EM_SetModeType_Mark, false )						---標記
						SetModeEx( Boss100  , EM_SetModeType_Move, false )						---移動
						SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				---索敵
						SetModeEx( Boss100  , EM_SetModeType_Fight , false )					---可砍殺攻擊
						SetModeEx( Boss100  , EM_SetModeType_Strikback, false )					---反擊	
						AddToPartition(Boss100,RoomID)
						WriteRoleValue(Boss100,EM_RoleValue_PID,isaac)
						WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
						BeginPlot(Boss100 , "ic_105514_100" , 0)---測試距離			
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105267_00]" , 2 )				---開打對話---可憐的凡人，想挑戰英雄的力量嗎? 
					PlayMotion ( boss,ruFUSION_ACTORSTATE_SLEEP_END	 )---------------第1ㄍ動作
					sleep(20)
					SetModeEx( Boss , EM_SetModeType_Move, true) 							---移動	
					SetModeEx( Boss , EM_SetModeType_Fight, true) 						---可砍殺
					AddBuff(Boss,508864,6,-1 )
					BeginPlot(boss , "ic_105514_02" , 0)									---命令角色做事情
				end
			end	
			if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then			---開戰後仇恨表沒人
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   					---王沒死 玩家滅團
					sleep(20)
					DelObj(boss)                                        					---沒死自己殺死王	
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					DelObj(Boss100)
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register8,0)
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(20)
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					sleep(20)                                          
					Boss=CreateObjByFlag(105514,780870,1,1)           						---再創造1之				
					AddToPartition(Boss,RoomID)	                               				---創造王 必要	
					SetModeEx( Boss , EM_SetModeType_Move, false) 
					SetModeEx( Boss , EM_SetModeType_Fight, false) 						---可砍殺
					SetPlot( Boss,"dead","ic_105514_BOSSXX",0 )								---掛死亡劇情
					WriteRoleValue(isaac,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,isaac)
					BeginPlot(isaac, "ic_105514_BUFFXX" , 0)								---刪除BUFF
					mob1=Lua_DW_CreateObj("flag",105704,780870,11,0)
						SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
						SetModeEx( mob1  , EM_SetModeType_Move, false )									--移動
						SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )							--索敵
						SetModeEx( mob1  , EM_SetModeType_Fight , false )								--可砍殺攻擊
						SetModeEx( mob1 , EM_SetModeType_Mark, false)									---可點選(否)	
						AddToPartition( mob1 , RoomID )
						WriteRoleValue(mob1,EM_RoleValue_PID,Boss)										---mob1暫存口袋PID mob1=BOSS
					mob2=Lua_DW_CreateObj("flag",105704,780870,12,0)
						SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
						SetModeEx( mob2  , EM_SetModeType_Move, false )									--移動
						SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )							--索敵
						SetModeEx( mob2  , EM_SetModeType_Fight , false )								--可砍殺攻擊
						SetModeEx( mob2 , EM_SetModeType_Mark, false)									---可點選(否)	
						AddToPartition( mob2 , RoomID )
						WriteRoleValue(mob2,EM_RoleValue_PID,Boss)										---mob2暫存口袋PID mob2=BOSS
					mob3=Lua_DW_CreateObj("flag",105704,780870,13,0)
						SetModeEx( mob3  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
						SetModeEx( mob3  , EM_SetModeType_Move, false )									--移動
						SetModeEx( mob3  , EM_SetModeType_Searchenemy, false )							--索敵
						SetModeEx( mob3  , EM_SetModeType_Fight , false )								--可砍殺攻擊
						SetModeEx( mob3 , EM_SetModeType_Mark, false)									---可點選(否)
						AddToPartition( mob3 , RoomID )
						WriteRoleValue(mob3,EM_RoleValue_PID,Boss)										---mob3暫存口袋PID mob3=BOSS
					mob4=Lua_DW_CreateObj("flag",105704,780870,14,0)
						SetModeEx( mob4  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
						SetModeEx( mob4  , EM_SetModeType_Move, false )									--移動
						SetModeEx( mob4  , EM_SetModeType_Searchenemy, false )							--索敵
						SetModeEx( mob4  , EM_SetModeType_Fight , false )								--可砍殺攻擊
						SetModeEx( mob4 , EM_SetModeType_Mark, false)									---可點選(否)
						AddToPartition( mob4 , RoomID )
						WriteRoleValue(mob4,EM_RoleValue_PID,Boss)										---mob4暫存口袋PID mob4=BOSS	
					open=0																				---重置戰鬥
					killidtime=0
				elseif	BOSSXX==1 and open==1 then														---王死了
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105267_01]" , 2 )							---死亡對話---可恨阿，不是因為英雄之力不完全不然怎會輸
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(10)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					SetModeEx( door , EM_SetModeType_Obstruct, false) 	
					SetModeEx( door1 , EM_SetModeType_Obstruct, false) 		
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					DelObj(Boss100)
					BeginPlot(isaac, "ic_105514_BUFFXX" , 0)											---刪除BUFF
					open=0																				---重置戰鬥
					killidtime=0
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register8,0)
					mob5=0
					BOSSXX=2
					sleep(100)
					DelObj(door)
					DelObj(door1)
					break
				end				
			end	
			if BOSSXX==1  then---無敵殺了王
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105267_01]" , 2 )			   				---可恨阿，不是因為英雄之力不完全不然怎會輸---死亡
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(10)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					SetModeEx( door , EM_SetModeType_Obstruct, false) 	
					SetModeEx( door1 , EM_SetModeType_Obstruct, false) 	
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					BeginPlot(isaac, "ic_105514_BUFFXX" , 0)							  				---刪除BUFF
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register8,0)
					mob5=0
					open=0	
					killidtime=0
					BOSSXX=2
					sleep(100)
					DelObj(door)
					DelObj(door1)	
					break	
			end	
	end		
end  
function ic_105514_BOSSXX()																	---死亡用
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
		WriteRoleValue(isaac,EM_RoleValue_register10,1)
end 
function ic_105514_BUFFXX()																	---刪除BUFF用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)											---找區域所有玩家
	local ThesePlayer = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() 												---接暫存值 508865
			if CheckID( ThesePlayer[i] ) == true and 										---檢查玩家是不是還在；檢查是否死亡
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 				---EM_RoleValue_IsDead   =1  =死亡
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then			---EM_RoleValue_IsPlayer =1  =玩家
				if CheckBuff( ThesePlayer[i] , 508866 ) == true or
				   CheckBuff( ThesePlayer[i] , 508784 ) == true	or
				   CheckBuff( ThesePlayer[i] , 508785 ) == true or
				   CheckBuff( ThesePlayer[i] , 508863 ) == true or
				   CheckBuff( ThesePlayer[i] , 508865 ) == true then						---確認BUFF
					CancelBuff(ThesePlayer[i], 508866)										---要刪除的BUFF
					CancelBuff(ThesePlayer[i], 508784)
					CancelBuff(ThesePlayer[i], 508785)	
					CancelBuff(ThesePlayer[i], 508863)
					CancelBuff(ThesePlayer[i], 508865)
				end
			end					
		end
end	
function ic_105514_100()																	---測試距離用
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local BOSS9898=GetDistance( OwnerID(), Boss)
		while true do
			BOSS9898=GetDistance( OwnerID(), Boss)
			sleep(10)
			if  BOSS9898>=430 then
				WriteRoleValue(isaac,EM_RoleValue_register8,1)
			end
		end
end
function ic_105514_02()   																	 ---王AI(第10固定狂暴用)
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss=OwnerID()
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local play44=0																			 ---狂爆用
	local killidtime=0								 										 ---狂暴用
	local play1x={} 									 									 ---隨機打用
	local plays=0   									 									 ---隨機打用
	local Luck=0										 									 ---隨機表用
	local time0=0																			 ---轉第2階段用
	local time00=0
	local time1=0																			 ---轉第2階段用
	local time2=0																			 ---全場DOT用	
	local time3=0																			 ---遠方技能用
	local time4=0																			 ---5秒換目標用
	local time5=0																			 ---前方範圍技能用
	local time6=0																			 ---進入追人清仇恨
	local time9=0
	local time10=0	
	local boss9898=0																		 ---追人用
	local plya9898																			 ---紀錄抓到誰
	local play1=0
	local play2=0
	local play3=0
	local play4=0
	local play0=0
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )    		 ---找尋目前的攻擊目標
			local BossTarget=AttackTarget
			killidtime=ReadRoleValue(Boss,EM_RoleValue_register10)
			--say(OwnerID(),"boss9898="..boss9898)
			--say(OwnerID(),"play0="..play0)
			--say(OwnerID(),"play1="..play1)
			--say(OwnerID(),"play2="..play2)
			--say(OwnerID(),"play3="..play3)
			--say(OwnerID(),"play4="..play4)
			if killidtime==1 and play44==0 then												  ---狂爆了	
				---AddBuff(Boss,620042,0 ,-1 )
				killidtime=0
				WriteRoleValue(Boss,EM_RoleValue_register10,0)							 	  ---把口袋10歸0
				play44=1
			end
			if time0==1 then																  ---第2階段
				if time6==0 then
					if hatelistcount(boss)>=2 then	
						CastSpellLV( OwnerID(), OwnerID(), 498049, 0 )						  ---全體範圍技能
						sleep(20)
						CancelBuff(Boss,508864)
						sleep(20)
						time6=1
					elseif hatelistcount(boss)==1 then	
						CastSpellLV( OwnerID(), OwnerID(), 498049, 0 )						  ---全體範圍技能
						sleep(20)
						CancelBuff(Boss,508864)
						sleep(20)
						time6=1
					end	
					
				end	
					if hatelistcount(boss)==1 then											  ---1刷死(1次)
						if play1==0 or play2==0 or play3==0 or play4==0 then
							---WriteRoleValue(isaac,EM_RoleValue_register9,1)
							local PlayerName = GetName( BossTarget )
							local MessageString = "[SC_105267_03][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							sleep(10)		  
							sysCastSpellLV( BossTarget, boss, 508491, 0 )						---嘲諷		  
							sleep(10)
							SetAttack(Boss , BossTarget)										---叫BOSS打玩家
							sleep(10)
							CastSpellLV( OwnerID(), BossTarget, 497447, 999)				---衝鋒
							time0=0	
							time1=0
							play1=0
							play2=0	
							play3=0
							play4=0
							boss9898=0
							local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
							local TempPlayer = SetSearchAllPlayer(RoomID)				  ---找區域所有玩家
							local ThesePlayer = {}
							for i=1,TempPlayer do
								ThesePlayer[i] = GetSearchResult() 						  ---接暫存值
								if CheckID( ThesePlayer[i] ) == true and 
									ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
									ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
										--檢查玩家是不是還在；檢查是否死亡
									if CheckBuff( ThesePlayer[i] , 508785 ) == true then
										CancelBuff(ThesePlayer[i], 508785)
									end				
								end
							end	
						end	
					end	
					if hatelistcount(boss)==2 then											  ---2刷死(2次死)
					if  boss9898==0 then
						if play1==0 then
							play1x=DW_HateRemain(0)											  ---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])		  ---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)			
						if CheckBuff( plya9898, 508785 ) == false then						  ---確認 被抓過的不會被追
							play1=1
						end	
						if play1==1 then
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
							end
							if play0==0 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV( plya9898, boss, 497474, 0 )					  	---嘲諷	
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								if CheckBuff( boss, 508491 ) == true and play0==0 then			---確認	
									AddBuff(Boss,508864,0,-1 )
									play0=1
								end	
							end
							if play0==1  then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,1)
								boss9898=1
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---王跑路階段
							end
						end
					elseif	boss9898==1 then
						if play1==1 then														---確認剛剛玩家有沒有死亡
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play1=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0	
						end	
						if play2==0 then
							play1x=DW_HateRemain(0)												---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---確認 被抓過的不會被追
							play2=1
						end	
						if play2==1 then
							if play0==1 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)
							    sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷	
								SetAttack(Boss , plya9898)										---叫BOSS打玩家								
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷	
								SetAttack(Boss , plya9898)										---叫BOSS打玩家	
								if CheckBuff( boss, 508491 ) == true and play0==1 then			---確認	
									AddBuff(Boss,508864,0,-1 )
									---WriteRoleValue(isaac,EM_RoleValue_register9,1)
									local PlayerName = GetName( plya9898)
									local MessageString = "[SC_105267_03][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
										  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)
									CastSpellLV( OwnerID(), plya9898, 497447, 999 )				---衝鋒
									play0=2
									time0=0
								end	
							end		
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 or play0==2 then	
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0
								time1=0
								play1=0
								play2=0
								play3=0
								play4=0
								play0=0
								boss9898=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									for i=1,TempPlayer do
									ThesePlayer[i] = GetSearchResult() 							---接暫存值
									if CheckID( ThesePlayer[i] ) == true and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
											--檢查玩家是不是還在；檢查是否死亡
										if CheckBuff( ThesePlayer[i] , 508785 ) == true then
											CancelBuff(ThesePlayer[i], 508785)
										end
									end					
								end
								time0=0
							end	
						end	
					end
					end	
					if hatelistcount(boss)==3 then											  ---3刷死(3次死)
					if  boss9898==0 then
						if play1==0 then
							play1x=DW_HateRemain(0)											  ---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])		  ---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)			
						if CheckBuff( plya9898, 508785 ) == false then						  ---確認 被抓過的不會被追
							play1=1
						end	
						if play1==1 then
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
							end
							if play0==0 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)									  ---叫BOSS打玩家	
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )					  ---嘲諷
								SetAttack(Boss , plya9898)									  ---叫BOSS打玩家	
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV( plya9898, boss, 497474, 0 )					  ---嘲諷
								SetAttack(Boss , plya9898)									  ---叫BOSS打玩家	
								if CheckBuff( Boss, 508491 ) == true and play0==0 then		  ---確認
									AddBuff(Boss,508864,0,-1 )
									play0=1
								end	
							end	
							if play0==1 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,1)
								boss9898=1
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---王跑路階段
							end
						end
					elseif	boss9898==1 then
						if play1==1 then														---確認剛剛玩家有沒有死亡
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play1=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0	
						end		
						if play2==0 then
							play1x=DW_HateRemain(0)												---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---確認 被抓過的不會被追
							play2=1
						end	
						if play2==1 then
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0
								play3=0
								play4=0
								play0=0
								boss9898=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
										for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
										end
								time0=0	
							end
							if play0==1 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								if CheckBuff( Boss, 508491 ) == true and play0==1  then			---確認
									AddBuff(Boss,508864,0,-1 )
									play0=2
								end	
							end	
							if play0==2 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,2)	
								boss9898=2
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---王跑路階段
							end
						end	
					elseif	boss9898==2 then
						if play2==1 then														---確認剛剛玩家有沒有死亡
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play2=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0	
						end
						if play3==0 then
							play1x=DW_HateRemain(0)												---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---確認 被抓過的不會被追
							play3=1
						end	
						if play3==1 then
							if play0==2 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								if CheckBuff( Boss, 508491 ) == true and play0==2  then			---確認	
									AddBuff(Boss,508864,0,-1 )
									---WriteRoleValue(isaac,EM_RoleValue_register9,1)
									local PlayerName = GetName( plya9898)
									local MessageString = "[SC_105267_03][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
										  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)
									CastSpellLV( OwnerID(), plya9898, 497447, 999)				---衝鋒	
									play0=3
									time0=0
								end	
							end	
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 or play0==3 then	
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0
								time1=0
								play1=0
								play2=0
								play3=0
								play4=0
								play0=0
								boss9898=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									for i=1,TempPlayer do
									ThesePlayer[i] = GetSearchResult() 							---接暫存值
									if CheckID( ThesePlayer[i] ) == true and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
										--檢查玩家是不是還在；檢查是否死亡
										if CheckBuff( ThesePlayer[i] , 508785 ) == true then
											CancelBuff(ThesePlayer[i], 508785)
										end
									end					
								end
								time0=0
							end	
						end
					end	
					end
					if hatelistcount(boss)>=4 then											  ---N人刷
					if  boss9898==0 then
						if play1==0 then
							play1x=DW_HateRemain(0)											  ---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])		  ---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)			
						if CheckBuff( plya9898, 508785 ) == false then						  ---確認 被抓過的不會被追
							play1=1
						end	
						if play1==1 then
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
							end
							if play0==0 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								local PlayerName = GetName( plya9898)
								local MessageString = "[SC_105267_05][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								sleep(10)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷	
								SetAttack(Boss , plya9898)										---叫BOSS打玩家									
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷	
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								if CheckBuff( boss, 508491 ) == true and play0==0 then			---確認	
									AddBuff(Boss,508864,0,-1 )
									play0=1
								end	
							end	
							if play0==1 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,1)
								boss9898=1
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---王跑路階段
							end
						end
					elseif	boss9898==1 then
						if play1==1 then														---確認剛剛玩家有沒有死亡
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play1=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0	
						end	
						if play2==0 then
							play1x=DW_HateRemain(0)												---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---確認 被抓過的不會被追
							play2=1
						end	
						if play2==1 then
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
										for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
										end
							end
							if play0==1 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								local PlayerName = GetName( plya9898)
								local MessageString = "[SC_105267_05][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								sleep(10)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷	
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家	
								if CheckBuff( boss, 508491 ) == true and play0==1 then			---確認	
									AddBuff(Boss,508864,0,-1 )
									play0=2
								end	
							end	
							if play0==2 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,2)	
								boss9898=2
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---王跑路階段
							end
						end	
					elseif	boss9898==2 then
						if play2==1 then														---確認剛剛玩家有沒有死亡
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play2=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0	
						end
						if play3==0 then
							play1x=DW_HateRemain(0)												---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---確認 被抓過的不會被追
							play3=1
						end	
						if play3==1 then
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									 for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
										end
							end
							if play0==2 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								local PlayerName = GetName( plya9898)
								local MessageString = "[SC_105267_05][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								sleep(10)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家							
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								if CheckBuff( boss, 508491 ) == true and play0==2 then			---確認	
									AddBuff(Boss,508864,0,-1 )
									play0=3
								end	
							end	
							if play0==3 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,3)	
								boss9898=3

								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---王跑路階段
							end
						end	
					elseif	boss9898==3 then
						if play3==1 then														---確認剛剛玩家有沒有死亡
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---接暫存值
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--檢查玩家是不是還在；檢查是否死亡
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play3=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0	
						end
						if play4==0 then
							play1x=DW_HateRemain(0)												---隨機打
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---紀錄抓到誰
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---確認 被抓過的不會被追
							play4=1
						end	
						if play4==1 then
							if play0==3 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								local PlayerName = GetName( plya9898)
								local MessageString = "[SC_105267_05][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								sleep(10)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(10)
								sysCastSpellLV(plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sleep(30)
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								sysCastSpellLV(plya9898, boss, 497474, 0 )						---嘲諷
								SetAttack(Boss , plya9898)										---叫BOSS打玩家
								if CheckBuff( boss, 508491 ) == true and play0==3 then			---確認	
									AddBuff(Boss,508864,0,-1 )
									local PlayerName = GetName( plya9898)
									local MessageString = "[SC_105267_03][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
										  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(10)	  
									WriteRoleValue(isaac,EM_RoleValue_register9,1)				---小球	  
									sleep(20)
									if CheckBuff( OwnerID() , 508787 ) == false then
										CastSpellLV( OwnerID(), plya9898, 497447, 999)				---衝鋒
									end	
									play0=4
								end	
							end	
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 or play0==4 then	
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)					---紀錄歸0
								time1=0
								play1=0
								play2=0
								play3=0
								play4=0
								play0=0
								boss9898=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---找區域所有玩家
								local ThesePlayer = {}
								for i=1,TempPlayer do
									ThesePlayer[i] = GetSearchResult() 							---接暫存值
									if CheckID( ThesePlayer[i] ) == true and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
											--檢查玩家是不是還在；檢查是否死亡
										if CheckBuff( ThesePlayer[i] , 508785 ) == true then
											CancelBuff(ThesePlayer[i], 508785)
										end
									end		
								end	
								time0=0	
							end
						end	
					end	
				end	
			end
			---say(OwnerID(),"time9="..time9)
			---say(OwnerID(),"time0="..time0)
			if time0==0  then
				if 	time9==1 then
					WriteRoleValue(isaac,EM_RoleValue_register9,2)
					CancelBuff(Boss,508864)
					sleep(20)
					SetModeEx( boss  , EM_SetModeType_Move, true )							 ---移動
					SetModeEx( boss  , EM_SetModeType_Strikback, true )						 ---反擊
					sleep(20)
					CastSpellLV( OwnerID(), OwnerID(), 498049,0)							 ---全體範圍技能
					sleep(20)
					CancelBuff(Boss,508491)
					sleep(10)
					AddBuff(Boss,508864,6,-1 )
				end	
				if time5>=2 and time10==0 then
					SetModeEx( boss  , EM_SetModeType_Move, true )							 ---移動
					time10=1
				end
				time6=0
				WriteRoleValue(isaac,EM_RoleValue_register9,2)
				WriteRoleValue(Boss,EM_RoleValue_register1,0)
				WriteRoleValue(Boss,EM_RoleValue_register2,0)								---紀錄歸0
				play1=0
				play2=0
				play3=0
				play4=0
				play0=0
				time9=0
				boss9898=0		
				time1=time1+1
				time2=time2+1
				time3=time3+1
				time4=time4+1
				time5=time5+1
				if time1>=21 or time4==5 then															---轉追人階段用
					time0=1
					time1=0
					time9=1
					time2=0
					time3=0
					time5=0
					time10=0
				end	
				if time2>=19 then
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105267_04]" , 2 )			   	---凡人能承受英雄之力的強大嗎?
					CastSpellLV( OwnerID(), OwnerID(), 498050, 0)							---全體範圍技能
					sleep(20)
					time2=0
				end
				if time3>=13 then	
					if hatelistcount(boss)==1 then
						local PlayerName = GetName( BossTarget )
						local MessageString = "[SC_105267_02][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
							  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
						CastSpellLV( OwnerID(), BossTarget, 497055,20)						---遠方範圍技能
						sleep(30)
						time3=0
					elseif hatelistcount(boss)>=2	then
						play1x=DW_HateRemain(1)												---隨機打--不打坦
						plays=DW_Rand(table.getn(play1x))
						local PlayerName = GetName( play1x[plays] )
						local MessageString = "[SC_105267_02][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
							  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
						CastSpellLV( OwnerID(), play1x[plays], 497055,20)					---遠方範圍技能
						sleep(30)
						time3=0
					end	
				end
				if time5>=7 then
					CastSpellLV( OwnerID(), BossTarget, 497054,0)							 ---前方範圍技能
					sleep(40)
					time5=0
					time10=0
				end
			end	
		end	
end
function ic_105514_mob() 
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BOSS9898=GetDistance( OwnerID(), Boss)
	local time1=0
	local mobstop=ReadRoleValue(OwnerID(),EM_RoleValue_register9)	
	while 1 do
		local BOSS9898=GetDistance( OwnerID(), Boss)
		mobstop=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		--say(OwnerID(),"BOSS9898="..BOSS9898)
		if BOSS9898<=30 and time1==0 then
			AddBuff(Boss,508787,0 ,-1 )
			SetModeEx( boss  , EM_SetModeType_Move, false )									---移動
			SetModeEx( boss  , EM_SetModeType_Strikback, false )							---反擊	
			---say(OwnerID(),"123")
			time1=1
		end
		if time1==1 or mobstop==1 then
			--say(OwnerID(),"456")
			break
		end
		sleep(5)
	end
  
end	