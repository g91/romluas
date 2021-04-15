function ic_104605_01()   ------主控器
		local Ctrl = OwnerID()					--控制器
		local open=0						    --開戰旗標				        
		local killidtime=0
		local boss44=0
		local time1=0							---放技能						
		local door1								--阻擋門1
		local door2								--阻擋門2
		local BOSS9898=0
		local Boss100
		local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
		local Boss=CreateObjByFlag(104605,780775,1,1) 	-----BOSS創在  旗標1
		local door=CreateObjByFlag(105078,780775,2,1)	-----阻擋門(王死才會消失)
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
		SetPlot( Boss,"dead","ic_104605_44",0 )
		WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
		WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
		while true do
			sleep(10)
			--say(OwnerID(),"boss44="..boss44)
			--say(OwnerID(),"open="..open)
			boss44=ReadRoleValue(  OwnerID() , EM_RoleValue_register4 )
			BOSS9898=ReadRoleValue(  OwnerID() , EM_RoleValue_register10)
			if hatelistcount(boss)~=0 then    		---讀仇恨人數
				killidtime=killidtime+1
				time1=time1+1
				---say(OwnerID(),"killidtime"..killidtime)
				if killidtime==30 then
					say(Boss,"[SC_104605_10]") --兄:冒險者的痛苦就是我的快樂     弟:同感從冒險者痛苦中找快樂
				elseif killidtime==30 then
					say(Boss,"[SC_104605_11]") --弟:換我根冒險者玩遊戲了嗎        兄: 還沒有輪到你~慢慢等吧
				elseif killidtime==90 then
					say(Boss,"[SC_104605_12]") --弟:快點換我玩了啦  兄:下一批冒險者再給你玩
				elseif killidtime==180 then
					say(Boss,"[SC_104605_13]") --弟:痛苦嗎?害怕嗎? 兄:真正可怕得還沒出現~哈哈
				elseif killidtime==240 then
					say(Boss,"[SC_104605_14]") --兄:冒險者~試看看~秒殺得快感 弟:慢慢折磨才好玩啦
				elseif killidtime==320 then
					say(Boss,"[SC_104605_15]") --兄:太無聊了我先休息一下 弟:不准休息~遊戲結束才能休息
				elseif killidtime>=480 then
					say(Boss,"[SC_104605_16]") --兄:玩太久了厭煩了 弟:那快點結束這個遊戲吧
					WriteRoleValue(boss,EM_RoleValue_register8,1)---回傳1給BOSS
					killidtime=0
				end
				if open==0 then
					open=1										--開打了
				 Boss100=Lua_DW_CreateObj("flag",104693,780775,1,0)--測試距離用
					SetModeEx( Boss100  , EM_SetModeType_HideName, false )--名稱
					SetModeEX( Boss100  , EM_SetModeType_Gravity , false )--重力
					SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
					SetModeEx( Boss100  , EM_SetModeType_Mark, false )--標記
					SetModeEx( Boss100  , EM_SetModeType_Move, false )--移動
					SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Boss100  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( Boss100  , EM_SetModeType_Strikback, false )--反擊	
					AddToPartition(Boss100,RoomID)
					WriteRoleValue(Boss100,EM_RoleValue_PID,Ctrl)
					WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
					BeginPlot(Boss100 , "ic_104605_100" , 0)---測試距離	
				 door2=CreateObjByFlag(105078,780775,3,1)-------入口阻擋門
					SetModeEx( door2 , EM_SetModeType_Mark, false)			----可點選(否)
					SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
					SetModeEx( door2 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
					SetModeEx( door2 , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( door2 , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( door2 , EM_SetModeType_Fight, false) ---可砍殺(否)
					SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
					SetModeEx( door2 , EM_SetModeType_Searchenemy, false)	---索敵(否)
					AddToPartition(door2,RoomID)	
				door1=CreateObjByFlag(104198,780775,4,1)-------王身後阻擋門
					SetModeEx( door1 , EM_SetModeType_Mark, false)			---可點選(否)
					SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(否)
					SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--阻擋(是)
					SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
					SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
					SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--索敵(否)	
					AddToPartition(door1,RoomID)
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_01]" , 2 )	-------開打對話--冒險者 我們來玩場遊戲吧 生或死 自己決定
					BeginPlot(boss , "ic_104605_02" , 0)				------命令角色做事情
				end
			end	
			if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then			--開戰後仇恨表沒人
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --王沒死 玩家滅團
					sleep(20)
					DelObj(boss)                                        --沒死自己殺死王
					DelObj(door1)										--刪除阻擋門
					DelObj(door2)										--刪除阻擋門
					DelObj(Boss100)
					local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
					local ID=GetSearchResult()
					local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					for i = 0 , NPCXX do
						ID=GetSearchResult()
						ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						--say(OwnerID(),"NPCXX"..NPCXX)
						if ID2==104785  then
						DelObj(ID)
						end
					end
					sleep(30)                                           --5秒
					Boss=CreateObjByFlag(104605,780775,1,1)           --再創造1之				
					AddToPartition(Boss,RoomID)	                                ---創造王 必要		
					SetPlot( Boss,"dead","ic_104605_44",0 )	
					WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					BeginPlot(OwnerID() , "ic_104605_04" , 0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register10,0)
					open=0					--重置戰鬥
					time1=0
					killidtime=0
				elseif	boss44==1 and open==1 then---王死了
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_02]" , 2 )----我們怎會輸呢 這跟遊戲規則不符阿~~不~~---死亡
					DelObj(door)
					DelObj(door1)
					DelObj(door2)
					DelObj(Boss100)
					local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
					local ID=GetSearchResult()
					local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					for i = 0 , NPCXX do
						ID=GetSearchResult()
						ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						--say(OwnerID(),"NPCXX"..NPCXX)
						if ID2==104785  then
						DelObj(ID)
						end
					end
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register10,0)
					BeginPlot(OwnerID() , "ic_104605_04" , 0)				
					open=0										--重置戰鬥
					time1=0
					killidtime=0
					boss44=2
					sleep(100)
					break
				end				
			end	
			if boss44==1  then---無敵殺了王
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_02]" , 2 )----我們怎會輸呢 這跟遊戲規則不符阿~~不~~---死亡
					DelObj(door)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register10,0)
					BeginPlot(OwnerID() , "ic_104605_04" , 0)
					open=0	
					time1=0	
					killidtime=0
					boss44=2
					sleep(100)		
					break	
			end	
		end		
	end  
function ic_104605_44()
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
WriteRoleValue(Ctrl,EM_RoleValue_register4,1)
end 
function ic_104605_100()---測試用
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local BOSS9898=GetDistance( OwnerID(), Boss)
	while true do
		BOSS9898=GetDistance( OwnerID(), Boss)
		sleep(10)
		--say(OwnerID(),"BOSS9898="..BOSS9898)
		if  BOSS9898>=600 then
			WriteRoleValue(Ctrl,EM_RoleValue_register10,1)
		end
	end
end	
function ic_104605_02()    ------王AI
		local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		local Boss=OwnerID()
		local play1x={} ---隨機打用
		local plays=0   ---隨機打用
		local Luck=0	----隨機表用
		local time2=0 	----計時器
		local time3=0 	----計時器
		local time4=0 	----計時器
		local time5=0 	----技能用
		local time6=0 	----技能用
		local time7=0 	----技能用
		local time8=0 	----技能用
		local time9=0 	----技能用
		local time10=0 	----技能用
		local time11=0	--進階段放技能用
		local time22=0	--進階段放技能用
		local time33=0	
		local time44=0	
		local mob11
		local play44=0
		local Search = SearchRangePlayer ( OwnerID() , 400 )--找玩家用
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
		local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --讀取目前血量
		local HPPercent = NowHP / MaxHP	  
		local killidtime1 =0---狂暴用
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
			local BossTarget=AttackTarget
			MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
			NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------讀取目前血量
			HPPercent = NowHP / MaxHP	--血量百分比
			killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
			if killidtime1==1 and play44==0 then
				AddBuff( OwnerID(),507744,0 ,-1 )
				killidtime1=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)---把口袋8歸0
				play44=1
			end
				if HPPercent >=0.80   then ---兄
				time2=time2+1
				time3=time3+1
				time4=time4+1
				time10=time10+1
				time7=0 		
				time8=0 		
				time9=0
				time5=0
				time22=0
					if time10==5 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_03]" , 2 )----兄:由我先開始 與你們 玩遊戲 能有幾個人存活呢 哈哈
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
						end
						if hatelistcount(boss)==1 then
							if CheckBuff( BossTarget, 507911 ) == false then	---確認鐵處女BUFF  有不打
								local X0, Y0, Z0
								local PlayerName = GetName( BossTarget )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , BossTarget , 496363, 0 )
								sleep(30)	
								X0=ReadRoleValue(BossTarget ,EM_RoleValue_X)
								Y0=ReadRoleValue(BossTarget ,EM_RoleValue_Y)
								Z0=ReadRoleValue(BossTarget ,EM_RoleValue_Z)
							if CheckBuff(BossTarget, 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------生隱形球
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---可砍殺(是)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,15 ,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , BossTarget )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
							end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
								plays=DW_Rand(table.getn(play1x))
							if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打	
								local X0, Y0, Z0
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , play1x[plays] , 496363 , 0 )
								sleep(30)
								X0=ReadRoleValue(play1x[plays] ,EM_RoleValue_X)
								Y0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Y)
								Z0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Z)
							if CheckBuff(play1x[plays], 507911 ) == true then	
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------生隱形球
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---可砍殺(是)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,15 ,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , play1x[plays] )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
							end	  
						end	
					end
					if time4>=18 then--鐵處女---隨機1人
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(5)
						end
						if hatelistcount(boss)==1 then
							if CheckBuff( BossTarget, 507911 ) == false then	---確認鐵處女BUFF  有不打
								local X0, Y0, Z0
								local PlayerName = GetName( BossTarget )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , BossTarget , 496363, 0 )
								sleep(30)	
								X0=ReadRoleValue(BossTarget ,EM_RoleValue_X)
								Y0=ReadRoleValue(BossTarget ,EM_RoleValue_Y)
								Z0=ReadRoleValue(BossTarget ,EM_RoleValue_Z)
							if CheckBuff(BossTarget, 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------生隱形球
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---可砍殺(是)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,15 ,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , BossTarget )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time4=0
							elseif CheckBuff( BossTarget, 507911 ) == true then	
								time4=0
							end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
								plays=DW_Rand(table.getn(play1x))
							if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打	
								local X0, Y0, Z0
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , play1x[plays] , 496363 , 0 )
								sleep(30)
								X0=ReadRoleValue(play1x[plays] ,EM_RoleValue_X)
								Y0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Y)
								Z0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Z)
							if CheckBuff(play1x[plays], 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------生隱形球
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---可砍殺(是)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,15 ,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , play1x[plays] )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time4=0
							end	
						end	
					end
					if time3>=11 then--範圍擊飛--第1仇恨 仇恨歸0(暫時)
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(5)
						end
						if hatelistcount(boss)==1 then
							local PlayerName = GetName( BossTarget )
							local MessageString = "[SC_104605_08][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							CastSpellLV( OwnerID() , BossTarget , 496362 , 200 )
							sleep(30)
							time3=0
						elseif hatelistcount(boss)>1 then
							play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
							plays=DW_Rand(table.getn(play1x))
							local PlayerName = GetName( play1x[plays] )
							local MessageString = "[SC_104605_08][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							CastSpellLV( OwnerID() , play1x[plays] , 496362 , 200 )
							sleep(30)
							time3=0
						end	
					end
					if time2>=5 then--單體技能--第1仇恨
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(5)
						end
						CastSpellLV( OwnerID() , BossTarget , 496361, 0 )----單體技能
						sleep(10)
						time2=0
					end
				end
				if HPPercent <0.8 and HPPercent >=0.60 then---弟
				time9=time9+1
				time7=time7+1
				time8=time8+1
				time22=time22+1
				time2=0 	
				time3=0 	
				time4=0 
				time3=0 
				time11=0
				time33=0 
					if time5==0 then--轉階段放1次
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_04]" , 2 )----弟:換我來吧 慢慢折磨 才是最好玩的遊戲
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(5)
						end
						CastSpellLV( OwnerID() , OwnerID() , 496364, 7 )----全場DOT
						time5=1
					end
					if time22==5 then
						if hatelistcount(boss)==1 then
								play1x=DW_HateRemain(0)-----------------------隨機打
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打
									local PlayerName = GetName( play1x[plays] )
									local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 , 7 )
									sleep(30)
								end	
						elseif hatelistcount(boss)>1 then
							play1x=DW_HateRemain(1)-----------------------隨機打
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打
									local PlayerName = GetName( play1x[plays] )
									local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 , 7 )
									sleep(30)
								end	
						end	
					end
					if time9>=21 then--針刺--隨機1人
						if hatelistcount(boss)==1 then
								play1x=DW_HateRemain(0)-----------------------隨機打
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 , 7 )
									sleep(30)
									time9=0
								end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------隨機打
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 , 7 )
									sleep(30)
									time9=0
								end	
						end	
					end
					if time7>=15 then--人人有獎
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end
						CastSpellLV( OwnerID() , OwnerID() , 496364,9)----全場DOT
						time7=0
					end
					if time8>=11 then---全體恐懼
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----恐懼 畏懼 該讓你們感受看看了
						play1x=DW_HateRemain(0)-----------------------隨機打
						plays=DW_Rand(table.getn(play1x))
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(5)
						end
						sleep(10)
						CastSpellLV( OwnerID() , OwnerID() , 496365,9)----隨機3人跑吧
						sleep(10)
						time8=0
					end
				end
				if HPPercent <0.60 then--兄弟一起來
					time2=time2+1
					time3=time3+1
					time4=time4+1
					time6=time6+1
					time11=time11+1
					time33=time33+1
					--say(OwnerID(),"time11="..time11)
					--say(OwnerID(),"time2="..time2)
					if time44==0 then--鐵處女---隨機1人
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
						end
						CastSpellLV( OwnerID() , OwnerID() , 496243,9)----全場DOT
						sleep(10)	
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(5)
						end
						if hatelistcount(boss)==1 then
							if CheckBuff( BossTarget, 507911 ) == false then	---確認鐵處女BUFF  有不打
								CastSpellLV( OwnerID() , BossTarget , 496363, 0 )
								sleep(30)	
								local X0, Y0, Z0
								local PlayerName = GetName( BossTarget )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )	
								X0=ReadRoleValue(BossTarget ,EM_RoleValue_X)
								Y0=ReadRoleValue(BossTarget ,EM_RoleValue_Y)
								Z0=ReadRoleValue(BossTarget ,EM_RoleValue_Z)
							if CheckBuff(BossTarget, 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------生隱形球
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---可砍殺(是)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,3,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , BossTarget )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time44=1
							elseif CheckBuff( BossTarget, 507911 ) == true then	
								time44=1	
							end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
								plays=DW_Rand(table.getn(play1x))
							if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打	
								--CastSpellLV( OwnerID() , OwnerID() , 496243,9)----全場DOT
								--sleep(10)
								CastSpellLV( OwnerID() , play1x[plays] , 496363 , 0 )
								sleep(30)
								local X0, Y0, Z0
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )	
									X0=ReadRoleValue(play1x[plays] ,EM_RoleValue_X)
									Y0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Y)
									Z0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Z)
								if CheckBuff( play1x[plays], 507911 ) == true then	
									mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------生隱形球
									SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---反擊(否)
									SetModeEx( mob11 , EM_SetModeType_Move, false) ---移動	(否)
									SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--索敵(否)
									SetModeEx( mob11 , EM_SetModeType_Mark, true)			---可點選(是)
									SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
									SetModeEx( mob11 , EM_SetModeType_Fight, true) ---可砍殺(是)
									AddToPartition(mob11,RoomID)
									AddBuff( mob11,506822,3 ,-1 )
									WriteRoleValue( mob11 , EM_RoleValue_register1 , play1x[plays] )
									SetPlot( mob11,"dead","ic_104605_06",0 )  
									BeginPlot(mob11 , "ic_104605_05" , 0)
								end	
								time44=1
							elseif CheckBuff( BossTarget, 507911 ) == true then	
								time44=1		
							end	
						end	
					elseif time44==1 then--針刺--隨機1人
						if hatelistcount(boss)==1 then
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
								end
								ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----恐懼 畏懼 該讓你們感受看看了
								sleep(10)
								CastSpellLV( OwnerID() , OwnerID() , 496365,1)----隨機3人跑吧
								sleep(30)	
									play1x=DW_HateRemain(0)-----------------------隨機打
									plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打	
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 ,7)
									sleep(30)
									time44=3
								end	
						elseif hatelistcount(boss)>1 then	
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
								end
								ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----恐懼 畏懼 該讓你們感受看看了
								CastSpellLV( OwnerID() , OwnerID() , 496365,1)----隨機3人跑吧
								sleep(30)	
									play1x=DW_HateRemain(1)-----------------------隨機打
									plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打	
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 ,7)
									sleep(30)
									time44=3
								end	
						
						end	
					end
					if time6>=27 then--鐵處女---隨機1人
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
						end
						CastSpellLV( OwnerID() , OwnerID() , 496243,9)----全場DOT
						sleep(10)
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(5)
						end
						if hatelistcount(boss)==1 then
							if CheckBuff( BossTarget, 507911 ) == false then	---確認鐵處女BUFF  有不打
								local X0, Y0, Z0
								local PlayerName = GetName( BossTarget )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , BossTarget , 496363, 0 )
								sleep(30)	
								X0=ReadRoleValue(BossTarget ,EM_RoleValue_X)
								Y0=ReadRoleValue(BossTarget ,EM_RoleValue_Y)
								Z0=ReadRoleValue(BossTarget ,EM_RoleValue_Z)
							if CheckBuff(BossTarget, 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------生隱形球
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---可砍殺(是)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,3,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , BossTarget )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time6=0
							elseif CheckBuff( BossTarget, 507911 ) == true then	
								time6=0	
							end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
								plays=DW_Rand(table.getn(play1x))
							if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打	
								local X0, Y0, Z0
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , play1x[plays] , 496363 , 0 )
								sleep(30)	
								X0=ReadRoleValue(play1x[plays] ,EM_RoleValue_X)
								Y0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Y)
								Z0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Z)
							if CheckBuff( play1x[plays], 507911 ) == true then	
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------生隱形球
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---可砍殺(是)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,3,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , play1x[plays] )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time6=0	
							end		
						end	
					end
					if time4>=17 then--針刺--隨機1人
						if hatelistcount(boss)==1 then
									play1x=DW_HateRemain(0)-----------------------隨機打
									plays=DW_Rand(table.getn(play1x))
									while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
									sleep(5)
									end
									ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----恐懼 畏懼 該讓你們感受看看了
									sleep(20)
									CastSpellLV( OwnerID() , OwnerID() , 496365,1)----隨機3人跑吧
									sleep(30)
									while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
									sleep(5)
									end
									if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打
										local PlayerName = GetName( play1x[plays] )
										local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
												  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
										sleep(20)		  
										CastSpellLV( OwnerID() , play1x[plays] , 496366 ,7)
										sleep(30)
										time4=0
									end	
						elseif hatelistcount(boss)>1 then	
									play1x=DW_HateRemain(1)-----------------------隨機打
									plays=DW_Rand(table.getn(play1x))
									while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
									sleep(5)
									end
									ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----恐懼 畏懼 該讓你們感受看看了
									sleep(20)
									CastSpellLV( OwnerID() , OwnerID() , 496365,1)----隨機3人跑吧
									sleep(30)
									while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
									sleep(5)
									end
									if CheckBuff( play1x[plays], 507911 ) == false then	---確認鐵處女BUFF  有不打
										local PlayerName = GetName( play1x[plays] )
										local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
												  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
										sleep(20)		  
										CastSpellLV( OwnerID() , play1x[plays] , 496366 ,7)
										sleep(30)
										time4=0
									end	
									
						end		
					end
				end 
				if time3>=12 then--範圍擊飛--第1仇恨 仇恨歸0(暫時)
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
						end
					if hatelistcount(boss)==1 then
							local PlayerName = GetName( BossTarget )
							local MessageString = "[SC_104605_08][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
							ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							CastSpellLV( OwnerID() , BossTarget , 496362 , 200 )
							sleep(30)
							time3=0
					elseif hatelistcount(boss)>1 then
							play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
							plays=DW_Rand(table.getn(play1x))
							local PlayerName = GetName( play1x[plays] )
							local MessageString = "[SC_104605_08][$SETVAR1="..PlayerName .."]" 		----在string中可以秀出玩家的名字
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							CastSpellLV( OwnerID() , play1x[plays] , 496362 , 200 )
							sleep(30)
							time3=0
					end		
				end
				if time33>=10 then---全體恐懼
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end
						CastSpellLV( OwnerID() , BossTarget , 496361,0)----單體技能
						sleep(10)
						time33=0
					end	
				end
end
	function ic_104605_04()----刪除BUFF用
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
		local ThesePlayer = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() -- 接暫存值
			if CheckID( ThesePlayer[i] ) == true and 
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
					--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 507908 ) == true 
				or CheckBuff( ThesePlayer[i] , 507911 ) == true 
				or CheckBuff( ThesePlayer[i] , 507907 ) == true 
				or CheckBuff( ThesePlayer[i] , 507736 ) == true
				or CheckBuff( ThesePlayer[i] , 508381 ) == true	then
					CancelBuff(ThesePlayer[i], 507908)
					CancelBuff(ThesePlayer[i], 507911)
					CancelBuff(ThesePlayer[i], 507907)
					CancelBuff(ThesePlayer[i], 507934)
					CancelBuff(ThesePlayer[i], 507736)
					CancelBuff(ThesePlayer[i], 508381)
				end
			end					
		end
	end
	function ic_104605_05()
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
		local skillLV1=0 ---ReadRoleValue( OwnerID() , EM_RoleValue_register4 )
		local skillLV2=0 
		--local yy = Lua_BuffPosSearch( player, 507934 )
		--local xx=0
		local time1=0
		while 1 do
			--say(OwnerID(),"skillLV1="..skillLV1)
			--say(OwnerID(),"skillLV2="..skillLV2)
			if time1==0 then
				if	ReadRoleValue( player , EM_RoleValue_IsDead ) == 0 then
					CastSpellLV( OwnerID() , player , 496368,23)
					WriteRoleValue(  OwnerID() , EM_RoleValue_register4 ,17)
					--yy= Lua_BuffPosSearch( player , 507934 )
					--xx=BuffInfo( player, yy , EM_BuffInfoType_Power )---讀取技能等級
					--CastSpellLV( OwnerID() , player , 496368,XX+2)
					time1=1
				elseif	ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 then
						DelObj(OwnerID())
				end
			elseif time1==1 then
				skillLV1=ReadRoleValue( OwnerID() , EM_RoleValue_register4 )
				sleep(10)
				skillLV2=skillLV1+6
				--yy= Lua_BuffPosSearch( player , 507934 )
				--xx=BuffInfo( player, yy , EM_BuffInfoType_Power )---讀取技能等級
				if	ReadRoleValue( player , EM_RoleValue_IsDead ) == 0 then	
					CastSpellLV( OwnerID() , player , 496368,skillLV2)
					WriteRoleValue(  OwnerID() , EM_RoleValue_register4 , skillLV2 )
				elseif	ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 then	
					DelObj(OwnerID())
				end	
			end	
			sleep(10)
		end
	end
	function ic_104605_06()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	
			CancelBuff(player, 507934)
			sleep(1)
			CancelBuff(player, 507911)
			sleep(1)
			DelObj(OwnerID())
			sleep(10)
	end