function Lua_bk_122_start_102705()---------------------歐基基開始判斷程式
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = OwnerID()
	local afdoor = CreateObjByFlag(103561,780449,10,1)---------------後門
	local mamu=0
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----重力
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---移動	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	AddToPartition( afdoor , RoomID )
	local boss = CreateObjByFlag(102705,780449,9,1)------------------------------------歐基基
	AddToPartition( boss , RoomID )
	WriteRoleValue( boss, EM_RoleValue_PID,start)
	BeginPlot( boss ,"Lua_bk_122_boss_102705",0)---------------------------------王劇情模式
	SetPlot( boss ,"dead","Lua_bk_122_dead_102705" , 0 )-----------放入死亡劇情
	local x=0
	while 1 do 
	sleep(10)
		local x=ReadRoleValue(start,EM_RoleValue_Register1)
		---------x=0    
		---------x=1   王進入戰鬥進入正常重置
		---------x=2   王死了
		if x==1 then
			sleep(30)
			local boss = CreateObjByFlag(102705,780449,9,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"Lua_bk_122_boss_102705",0)---------------------------------王劇情模式
			SetPlot( boss ,"dead","Lua_bk_122_dead_102705" , 0 )
			WriteRoleValue(start, EM_RoleValue_Register1,0)	
			x=0
		end
		if x==2 then 	
			local PPL = SetSearchAllPlayer(RoomID)
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then 
					SetFlag( ID, 543621, 1 )
				end
			end	
			Lua_bk_122_boss_530426()
			WriteRoleValue(start, EM_RoleValue_Register1,3)-----寫進一個3
			sleep(10)
			DelObj(afdoor)
			sleep(50)
			local PPL2=SetSearchAllNPC(RoomID)----------------尋找整間的
			for x=1,PPL do 						
				local ID = GetSearchResult()
				if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
					DelObj(ID)
				end
			end
			break------------------------離開判斷程式
		end	
	end
end

function Lua_bk_122_boss_102705()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = OwnerID()
	local mo={}
	local mo1=0
	local mo2=0
	local mo3=0
	local mo4=0
	local mo5=0
	local mo6=0
	local mo7=0
	local door=0
	local dtime=0
	local ddtime=0
	local ds=0
	local time1=0
	local ggtime=0
	local gg=0
	local CombatBegin=0------------------進入戰鬥模式
	local dead=0
	local sbs=0---------小怪強化buff的位置
	local sbp=0---------小怪強化buff的威力
	local PPL=0
	local Play_Chose={}
	local Luck=0
	local kp=0
	local skill={494913,494914,494910}------1.蓄力斬 2. 腐蝕波 3. 毒液腐蝕
	local SkillIndex=0
	local ctime1=0
	local mid=0
	while 1 do 
	sleep(10)
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
	local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			if CombatBegin == 0 then							---------------只有開場放一次
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102705_01]" , 1 )
				CombatBegin = 1
				door = CreateObjByFlag(102925,780449,8,1)-----------------------在旗標2上面丟入阻擋門
				SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_HideName, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door , EM_SetModeType_Obstruct, true)   -----會阻擋(阻擋其他的物件)
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door , EM_SetModeType_Show, true)
				AddToPartition( door , RoomID )
				WriteRoleValue(boss, EM_RoleValue_Register8,door)	---
				-------------------------------------------在地上產生屍體來準備做成小怪的產生
				for i=1,7 do 
					mo[i]=CreateObjByFlag(103042,780449,i,1)-----------------------在位置上產生屍體
					SetModeEx( mo[i] , EM_SetModeType_Gravity, true) ---重力
					SetModeEx( mo[i] , EM_SetModeType_Mark, true)
					SetModeEx( mo[i] , EM_SetModeType_HideName, true)
					SetModeEx( mo[i] , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mo[i] , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( mo[i] , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
					SetModeEx( mo[i] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( mo[i] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( mo[i] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( mo[i] , EM_SetModeType_SearchenemyIgnore, false) 
					SetModeEx( mo[i] , EM_SetModeType_Searchenemy, false)
					SetModeEx( mo[i] , EM_SetModeType_Show, true)
					SetDefIdleMotion( mo[i],ruFUSION_MIME_DEATH_LOOP)---播放倒在地上動作-------------死亡動作
					AddToPartition( mo[i] , RoomID )
					SetPlot( mo[i],"dead","Lua_bk_122_smaster_103042",10)
					KillID(mo[i] ,mo[i] )  ---殺掉npc指令
					AddBuff(mo[i], 505637 , 1 , -1 )------------------------------第一階段屍體不能 給她回血
					--WriteRoleValue(mo[i], EM_RoleValue_Livetime,20)
				end
			end
			dtime=dtime+1------------------------------------------------時間
			ggtime=ggtime+1
			ctime1=ctime1+1
			ddtime=ddtime+1
			if ggtime>=600 then 
				if gg==0 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102705_05]" , 1 )
					say(OwnerID(),"[SC_102705_05]")
					AddBuff(boss, 505224 , 1 , -1 )------------------狂暴
					gg=1
				end
			end
			if ddtime>=40 then 	
				if ds==0 then 
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102705_02]" , 1 )
				say(OwnerID(),"[SC_102705_02]")
				ds=1
				end
			end
			if dtime>=45 then 
				--ScriptMessage( OwnerID() , -1 , 2 , "[SC_102705_02]" , 1 )
				dead=dead+1----------------------------------------計算地上屍體起來數量 
				if dead==1 then -------------------第一隻
					DelObj(mo[dead])-----------------刪除第一隻人類屍體
					mo1=CreateObjByFlag(103043,780449,1,1)-----------------------在位置上產生屍體
					SetModeEx( mo1 , EM_SetModeType_Gravity, true) ---重力
					SetModeEx( mo1 , EM_SetModeType_Mark, true)
					SetModeEx( mo1 , EM_SetModeType_HideName, true)
					SetModeEx( mo1 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mo1 , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( mo1 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
					SetModeEx( mo1 , EM_SetModeType_Strikback, true) ---反擊
					SetModeEx( mo1 , EM_SetModeType_Move, true) ---移動	
					SetModeEx( mo1 , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( mo1 , EM_SetModeType_SearchenemyIgnore, true) 
					SetModeEx( mo1 , EM_SetModeType_Searchenemy, true)
					SetModeEx( mo1 , EM_SetModeType_Show, true)
					AddToPartition( mo1 , RoomID )
					WriteRoleValue( mo1, EM_RoleValue_PID,boss)---------------------紀錄
					WriteRoleValue(boss, EM_RoleValue_Register1,mo1)
					WriteRoleValue( mo1, EM_RoleValue_Register8,start)---------------------紀錄					
					BeginPlot( mo1 ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
					SetPlot( mo1 , "dead" , "Lua_bk_122_smaster_103043" , 10 )
				elseif dead==2 then 
					PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
					CastSpellLV( boss , boss , 494917 , 0 )  ----吸取生命
					for x=1,PPL do 						
						local ID = GetSearchResult()
						if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
							local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
							if de ==1 then
							
							elseif de == 0 then ------------------沒死
								sysCastSpellLV( ID , ID , 494916 , 0 )  ---殺掉npc指令
								--AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
							end
						end
					end
					--for i=1,1 do 
					--	if dead==1 then 
					-----		local de=ReadRoleValue(mo1,EM_RoleValue_Register1)-----------去檢查npc的值
					--		if de ==1 then
					--				
					---		elseif de == 0 then ------------------沒死
					--		---NPCDead( ID , boss )
					---		KillID(boss,ID)  ---殺掉npc指令
					--		say(OwnerID(),"1111111")
					---		AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
					--		end
					--	end
					---end
					DelObj(mo[dead])-----------------刪除第二隻人類屍體
					mo2=CreateObjByFlag(103043,780449,2,1)-----------------------在位置上產生屍體
					SetModeEx( mo2 , EM_SetModeType_Gravity, true) ---重力
					SetModeEx( mo2 , EM_SetModeType_Mark, true)
					SetModeEx( mo2 , EM_SetModeType_HideName, true)
					SetModeEx( mo2 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mo2 , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( mo2 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
					SetModeEx( mo2 , EM_SetModeType_Strikback, true) ---反擊
					SetModeEx( mo2 , EM_SetModeType_Move, true) ---移動	
					SetModeEx( mo2 , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( mo2 , EM_SetModeType_SearchenemyIgnore, true) 
					SetModeEx( mo2 , EM_SetModeType_Searchenemy, true)
					SetModeEx( mo2 , EM_SetModeType_Show, true)
					AddToPartition( mo2 , RoomID )
					WriteRoleValue( mo2, EM_RoleValue_PID,boss)---------------------紀錄
					WriteRoleValue(boss, EM_RoleValue_Register2,mo2)	
					WriteRoleValue( mo2, EM_RoleValue_Register8,start)---------------------紀錄
					BeginPlot( mo2 ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
					SetPlot(mo2,"dead","Lua_bk_122_smaster_103043",10)
				elseif dead==3 then 
					PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
					CastSpellLV( boss , boss , 494917 , 0 )  ----吸取生命
					for x=1,PPL do 						
						local ID = GetSearchResult()
						if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
							local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
							if de ==1 then
							
							elseif de == 0 then ------------------沒死
								sysCastSpellLV( ID , ID , 494916 , 0 )  ---殺掉npc指令
								--AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
							end
						end
					end
				--	for i=1,2 do 
				--		if dead==1 then 
				---			local de=ReadRoleValue(mo1,EM_RoleValue_Register1)-----------去檢查npc的值
				--			if de ==1 then
				--					
				---			elseif de == 0 then ------------------沒死
				--			---NPCDead( ID , boss )
				---			KillID(boss,ID)  ---殺掉npc指令
				---			say(OwnerID(),"1111111")
				---			AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
				---			end
				---		end
				--		if dead==2 then 
				---			local de=ReadRoleValue(mo2,EM_RoleValue_Register1)-----------去檢查npc的值
				--			if de ==1 then
				--					
				---			elseif de == 0 then ------------------沒死
				--			---NPCDead( ID , boss )
				--			KillID(boss,ID)  ---殺掉npc指令
				---			say(OwnerID(),"1111111")
				---			AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
				---			end
				--		end
				--	end
					DelObj(mo[dead])-----------------刪除第三隻人類屍體
					mo3=CreateObjByFlag(103043,780449,3,1)-----------------------在位置上產生屍體
					SetModeEx( mo3 , EM_SetModeType_Gravity, true) ---重力
					SetModeEx( mo3 , EM_SetModeType_Mark, true)
					SetModeEx( mo3 , EM_SetModeType_HideName, true)
					SetModeEx( mo3 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mo3 , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( mo3 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
					SetModeEx( mo3 , EM_SetModeType_Strikback, true) ---反擊
					SetModeEx( mo3 , EM_SetModeType_Move, true) ---移動	
					SetModeEx( mo3 , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( mo3 , EM_SetModeType_SearchenemyIgnore, true) 
					SetModeEx( mo3 , EM_SetModeType_Searchenemy, true)
					SetModeEx( mo3 , EM_SetModeType_Show, true)
					AddToPartition( mo3 , RoomID )
					WriteRoleValue( mo3, EM_RoleValue_PID,boss)---------------------紀錄
					WriteRoleValue(boss, EM_RoleValue_Register3,mo3)	
					WriteRoleValue( mo3, EM_RoleValue_Register8,start)---------------------紀錄
					BeginPlot( mo3 ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
					SetPlot( mo3 , "dead" , "Lua_bk_122_smaster_103043" , 10 )
				elseif dead==4 then
					PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
					CastSpellLV( boss , boss , 494917 , 0 )  ----吸取生命
					for x=1,PPL do 						
						local ID = GetSearchResult()
						if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
							local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
							if de ==1 then
							
							elseif de == 0 then ------------------沒死
								sysCastSpellLV( ID , ID , 494916 , 0 )  ---殺掉npc指令
								--AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
							end
						end
					end
					DelObj(mo[dead])-----------------刪除第四隻人類屍體
					mo4=CreateObjByFlag(103043,780449,4,1)-----------------------在位置上產生屍體
					SetModeEx( mo4 , EM_SetModeType_Gravity, true) ---重力
					SetModeEx( mo4 , EM_SetModeType_Mark, true)
					SetModeEx( mo4 , EM_SetModeType_HideName, true)
					SetModeEx( mo4 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mo4 , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( mo4 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
					SetModeEx( mo4 , EM_SetModeType_Strikback, true) ---反擊
					SetModeEx( mo4 , EM_SetModeType_Move, true) ---移動	
					SetModeEx( mo4 , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( mo4 , EM_SetModeType_SearchenemyIgnore, true) 
					SetModeEx( mo4 , EM_SetModeType_Searchenemy, true)
					SetModeEx( mo4 , EM_SetModeType_Show, true)
					AddToPartition( mo4 , RoomID )
					WriteRoleValue( mo4, EM_RoleValue_PID,boss)---------------------紀錄
					WriteRoleValue(boss, EM_RoleValue_Register4,mo4)	
					WriteRoleValue( mo4, EM_RoleValue_Register8,start)---------------------紀錄
					BeginPlot( mo4 ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
					SetPlot( mo4 , "dead" , "Lua_bk_122_smaster_103043" , 10 )
				elseif dead==5 then
					PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
					CastSpellLV( boss , boss , 494917 , 0 )  ----吸取生命
					for x=1,PPL do 						
						local ID = GetSearchResult()
						if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
							local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
							if de ==1 then
							
							elseif de == 0 then ------------------沒死
								sysCastSpellLV( ID , ID , 494916 , 0 )  ---殺掉npc指令
								--AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
							end
						end
					end
					DelObj(mo[dead])-----------------刪除第五隻人類屍體
					mo5=CreateObjByFlag(103043,780449,5,1)-----------------------在位置上產生屍體
					SetModeEx( mo5 , EM_SetModeType_Gravity, true) ---重力
					SetModeEx( mo5 , EM_SetModeType_Mark, true)
					SetModeEx( mo5 , EM_SetModeType_HideName, true)
					SetModeEx( mo5 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mo5 , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( mo5 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
					SetModeEx( mo5 , EM_SetModeType_Strikback, true) ---反擊
					SetModeEx( mo5 , EM_SetModeType_Move, true) ---移動	
					SetModeEx( mo5 , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( mo5 , EM_SetModeType_SearchenemyIgnore, true) 
					SetModeEx( mo5 , EM_SetModeType_Searchenemy, true)
					SetModeEx( mo5 , EM_SetModeType_Show, true)
					AddToPartition( mo5 , RoomID )
					WriteRoleValue( mo5, EM_RoleValue_PID,boss)---------------------紀錄
					WriteRoleValue(boss, EM_RoleValue_Register5,mo5)
					WriteRoleValue( mo5, EM_RoleValue_Register8,start)---------------------紀錄
					BeginPlot( mo5 ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
					SetPlot( mo5 , "dead" , "Lua_bk_122_smaster_103043" , 10 )
				elseif dead==6 then
					PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
					CastSpellLV( boss , boss , 494917 , 0 )  ----吸取生命
					for x=1,PPL do 						
						local ID = GetSearchResult()
						if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
							local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
							if de ==1 then
							
							elseif de == 0 then ------------------沒死
								sysCastSpellLV( ID , ID , 494916 , 0 )  ---殺掉npc指令
								--AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
							end
						end
					end
					DelObj(mo[dead])-----------------刪除第六隻人類屍體
					mo6=CreateObjByFlag(103043,780449,6,1)-----------------------在位置上產生屍體
					SetModeEx( mo6 , EM_SetModeType_Gravity, true) ---重力
					SetModeEx( mo6 , EM_SetModeType_Mark, true)
					SetModeEx( mo6 , EM_SetModeType_HideName, true)
					SetModeEx( mo6 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mo6 , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( mo6 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
					SetModeEx( mo6 , EM_SetModeType_Strikback, true) ---反擊
					SetModeEx( mo6 , EM_SetModeType_Move, true) ---移動	
					SetModeEx( mo6 , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( mo6 , EM_SetModeType_SearchenemyIgnore, true) 
					SetModeEx( mo6 , EM_SetModeType_Searchenemy, true)
					SetModeEx( mo6 , EM_SetModeType_Show, true)
					AddToPartition( mo6 , RoomID )
					WriteRoleValue( mo4, EM_RoleValue_PID,boss)---------------------紀錄
					WriteRoleValue(boss, EM_RoleValue_Register6,mo6)
					WriteRoleValue( mo6, EM_RoleValue_Register8,start)---------------------紀錄
					BeginPlot( mo6 ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
					SetPlot( mo6 , "dead" , "Lua_bk_122_smaster_103043" , 10 )
				elseif dead==7 then
					PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
					CastSpellLV( boss , boss , 494917 , 0 )  ----吸取生命
					for x=1,PPL do 						
						local ID = GetSearchResult()
						if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
							local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
							if de ==1 then
							
							elseif de == 0 then ------------------沒死
								sysCastSpellLV( ID , ID , 494916 , 0 )  ---殺掉npc指令
								--AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
							end
						end
					end
					DelObj(mo[dead])-----------------刪除第七隻人類屍體
					mo7=CreateObjByFlag(103043,780449,7,1)-----------------------在位置上產生屍體
					SetModeEx( mo7 , EM_SetModeType_Gravity, true) ---重力
					SetModeEx( mo7 , EM_SetModeType_Mark, true)
					SetModeEx( mo7 , EM_SetModeType_HideName, true)
					SetModeEx( mo7 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mo7 , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( mo7 , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
					SetModeEx( mo7 , EM_SetModeType_Strikback, true) ---反擊
					SetModeEx( mo7 , EM_SetModeType_Move, true) ---移動	
					SetModeEx( mo7 , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( mo7 , EM_SetModeType_SearchenemyIgnore, true) 
					SetModeEx( mo7 , EM_SetModeType_Searchenemy, true)
					SetModeEx( mo7 , EM_SetModeType_Show, true)
					AddToPartition( mo7 , RoomID )
					WriteRoleValue( mo7, EM_RoleValue_PID,boss)---------------------紀錄
					WriteRoleValue(boss, EM_RoleValue_Register7,mo7)
					WriteRoleValue( mo7, EM_RoleValue_Register8,start)---------------------紀錄
					BeginPlot( mo7 ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
					SetPlot( mo7 , "dead" , "Lua_bk_122_smaster_103043" , 10 )
				elseif dead>7  then-----------------
					PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
					CastSpellLV( boss , boss , 494917 , 0 )  ----吸取生命
					for x=1,PPL do 						
						local ID = GetSearchResult()
						if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
							local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
							if de ==1 then
							
							elseif de == 0 then ------------------沒死
								sysCastSpellLV( ID , ID , 494916 , 0 )  ---殺掉npc指令494916
								--AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
							end
						end
					end
				end
				dtime=0
				ddtime=0
				ds=0
			end
			if ctime1>=10 then 
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 34) then
					SkillIndex = 1------------------------------------------單體打王傷害
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 1 )
					sleep(20)
				elseif (Luck >= 34 and Luck < 67) then	
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102705_04]" , 1 )
					---say(OwnerID(),"[SC_102705_04]")
					SkillIndex = 2-------------------------------------------單體打王傷害
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]															
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 0 )
					sleep(20)
					end
				elseif (Luck >= 67 and Luck < 101) then	
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102705_03]" , 1 )
					---say(OwnerID(),"[SC_102705_03]")
					SkillIndex = 3-------------------------------------------單體打王傷害
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , 0 )
					sleep(20)
				end
				ctime1=0
			end
		elseif HateListCount( boss ) == 0 then----------------離開戰鬥 所有值都該回歸
			if CombatBegin == 1 then
				sleep(30)
				for i=1,7 do
					sleep(5)
					DelObj(mo[i])
				end
				WriteRoleValue(start, EM_RoleValue_Register1,1)	
				WriteRoleValue(boss, EM_RoleValue_Register9,1)	
				PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
				for x=1,PPL do 						
					local ID = GetSearchResult()
					if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
						local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
						if de ==1 then
						
						elseif de == 0 then ------------------沒死
							DelObj(ID)
							--AddBuff( boss , 504757, 0 , -1 )----先給一個固定時間回復幾%血量的buff
						end
					end
				end
				DelObj(door)
				sleep(50)
				DelObj(boss)
				CombatBegin=0
			end
		end
	end
end
function Lua_bk_122_smaster_103042()------------------------------------人類屍體死亡假死狀態
	SetModeEx( OwnerID() , EM_SetModeType_Gravity, true) ---重力
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false)
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)
	SetModeEx( OwnerID() , EM_SetModeType_Show, true)
	return false
end
---------------怪物強化buff 設定成為離開戰鬥不消失----------------死亡劇情讓script 去檢查目標身上的buff要是擁有505489這個強化buff代表是被玩家殺死的
function Lua_bk_122_smaster_103043()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local bs=0
	local bp=0
	local x=0
	local ns=LuaFunc_CreateObjByObj(103043,OwnerID())-------------這是假的屍體
	PlayMotion (ns, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetModeEx( ns , EM_SetModeType_Gravity, true) ---重力
	SetModeEx(ns, EM_SetModeType_Mark, false)
	SetModeEx( ns , EM_SetModeType_HideName, false)
	SetModeEx( ns , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( ns , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( ns , EM_SetModeType_Obstruct,false)   -----會阻擋(阻擋其他的物件)
	SetModeEx( ns , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( ns , EM_SetModeType_Move, false) ---移動	
	SetModeEx( ns , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( ns , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( ns , EM_SetModeType_Searchenemy,false)
	SetModeEx( ns , EM_SetModeType_Show, true)
	WriteRoleValue( ns, EM_RoleValue_PID,boss)---------------------紀錄
	WriteRoleValue(ns, EM_RoleValue_Register3,TargetID())-----紀錄	
	bs=Lua_BuffPosSearch( OwnerID() ,  505719 )
	if bs>=0 then  
		bp=BuffInfo( OwnerID(),bs,EM_BuffInfoType_Power)
	--	say(OwnerID(),"bbbbbb"..bp)
		x=bp+1
	---	say(OwnerID(),"bbbbbb"..x)
		for i=1,x do
			AddBuff(ns , 505719 , 0 , -1 )
		end
	end
	BeginPlot(ns,"Lua_bk_122_smaster1_103043",0)---------準備重生模式
	sleep(10)
	DelObj(OwnerID())
end
function Lua_bk_122_smaster1_103043()------------------------------------魔人屍體死亡假死狀態
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local bs=0
	local bp=0
	local x=0
	local kill=ReadRoleValue( OwnerID(),EM_RoleValue_Register3 ) 
	local x=ReadRoleValue( kill,EM_RoleValue_OrgID ) 
	WriteRoleValue(OwnerID(), EM_RoleValue_Register1,1)
	if ReadRoleValue( kill,EM_RoleValue_OrgID ) == 103043 then -------------檢查殺死他的人是誰 
		CancelBuff( OwnerID() ,  505719 ) ----------------結束怪物的強化buff
		BeginPlot(OwnerID(),"Lua_bk_bosshp_102705",0)--------補血
		BeginPlot(OwnerID(),"Lua_bk_122_smde1_103043",100)---------準備重生模式
	elseif ReadRoleValue( kill,EM_RoleValue_OrgID ) ~= 103043 then 
		bs=Lua_BuffPosSearch( OwnerID() ,  505719 )
		if bs>=0 then  
			bp=BuffInfo( OwnerID(),bs,EM_BuffInfoType_Power)
			x=bp+1
			-----say(OwnerID(),"x"..x)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register2,x)
		end
		BeginPlot(OwnerID(),"Lua_bk_122_smde_103043",100)---------準備重生模式
	end
end
function Lua_bk_122_smde1_103043()------被王正常殺死的重生劇情
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local start =ReadRoleValue(boss,EM_RoleValue_PID)-----檢查出開始的
	local bp=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--------查看他的威力
	local bp1=0
	local newmaster=LuaFunc_CreateObjByObj(103043,OwnerID())
	BeginPlot( newmaster ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
	WriteRoleValue( newmaster, EM_RoleValue_PID,boss)---------------------紀錄
	WriteRoleValue( newmaster, EM_RoleValue_Register8,start)---------------------紀錄
	SetPlot( newmaster , "dead" , "Lua_bk_122_smaster_103043" , 0 )
	CastSpellLV( OwnerID() , OwnerID() , 494911 , 0 )------屍爆
	sleep(10)
	DelObj(OwnerID())
end
function Lua_bk_122_smde_103043()------重生劇情
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local start =ReadRoleValue(boss,EM_RoleValue_PID)-----檢查出開始的
	local bp=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--------查看他的威力
	local bp1=0
	local newmaster=LuaFunc_CreateObjByObj(103043,OwnerID())
---	say(OwnerID(),"bp"..bp)
	bp1=bp+1
--	say(OwnerID(),"bp1"..bp1)
	for i=1,bp1 do
		AddBuff( newmaster , 505719 , 0 , -1 )
	end
----	SysCastSpellLV( boss , boss , 494909 , 0 )
	BeginPlot( newmaster ,"Lua_bk_122_smbegin_103043",50)---------戰鬥判斷模式
	WriteRoleValue( newmaster, EM_RoleValue_PID,boss)---------------------紀錄
	WriteRoleValue( newmaster, EM_RoleValue_Register8,start)---------------------紀錄
	SetPlot( newmaster , "dead" , "Lua_bk_122_smaster_103043" , 0 )
	CastSpellLV( OwnerID() , OwnerID() , 494911 , 0 )------屍爆
	sleep(10)
	DelObj(OwnerID())
end
function Lua_bk_122_smbegin_103043()-------------小怪消失劇情
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
	local live = 0
	while 1 do 
	sleep(10)
	live = ReadRoleValue(start,EM_RoleValue_Register1)
		--say(OwnerID(),"live"..live)
		if live==2 then 
			DelObj(OwnerID())
		end	
	end
end
function Lua_bk_122_dead_102705()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local door= ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
	local boss=OwnerID()
	local PPL=0
	local kill=TargetID()
	local x=0
	x=ReadRoleValue(kill,EM_RoleValue_OrgID)
	---say(ownerid(),"kill"..x)
	WriteRoleValue(boss, EM_RoleValue_Register9,1)
	WriteRoleValue(start, EM_RoleValue_Register1,2)	
	PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
	for x=1,PPL do 						
		local ID = GetSearchResult()
		if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103043 then 
			local de=ReadRoleValue(ID,EM_RoleValue_Register1)-----------去檢查npc的值
			if de ==1 then
				DelObj(ID)
			elseif de == 0 then ------------------沒死
				DelObj(ID)
			end
		end
	end
	DelObj(door)
end
function Lua_bk_122_smaster_103045()------------------------------------人類屍體死亡假死狀態
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	SetModeEx( OwnerID() , EM_SetModeType_Gravity, true) ---重力
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false)
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)
	SetModeEx( OwnerID() , EM_SetModeType_Show, true)
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_DEATH_LOOP)---播放倒在地上動作-------------死亡動作
	AddToPartition( OwnerID() , RoomID )
	SetPlot( OwnerID(),"dead","Lua_bk_122_smaster_103042",10)
	KillID(OwnerID() ,OwnerID() )  ---殺掉npc指令
	AddBuff(OwnerID(), 505637 , 1 , -1 )------------------------------第一階段屍體不能 給她回血
end
function Lua_bk_bosshp_102705()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss_nowhp=ReadRoleValue(  boss , EM_RoleValue_HP )
	local boss_maxhp=ReadRoleValue( boss , EM_RoleValue_MaxHP )
	local HPPercent = boss_nowhp / boss_maxhp	--血量百分比
	if HPPercent <= 0.99 then
		HPPercent=HPPercent+0.01
		boss_nowhp=boss_maxhp*HPPercent
		WriteRoleValue( boss, EM_RoleValue_HP,boss_nowhp)
	elseif HPPercent > 0.99 then 
		WriteRoleValue( boss, EM_RoleValue_HP,boss_maxhp)
	end
end
function Lua_bk_122_boss_530426()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do 
		local ID = GetSearchResult()
	---	local x=CountBodyItem(ID, 530426 )
	---	say(ID,"xxx")
	--	if x== 1 then 
	---	elseif x==0 then 
			if CheckFlag( ID, 543619 ) == true and
				CheckFlag( ID, 543620 ) == true and
				CheckFlag( ID, 543621 ) == true and
				CheckFlag( ID, 543622 )  == true and
				CheckFlag( ID, 543623 ) == true then 
				GiveBodyItem( ID, 530426, 1 )
			end
	---	end
	end	
end