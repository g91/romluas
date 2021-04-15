function ic_Sound_106818_00()																---任務NPC用	? delkeyitem 546299
	local own = OwnerID()
	local tar = TargetID()
	if CheckScriptFlag(own, 546287 ) ==false then
		SetSpeakDetail(own,"[SC_SOUND_IC_02]")
		AddSpeakOption(own,tar,"[SC_SOUND_IC_01]","ic_Sound_106818_00_1",0)					---接任務
	elseif CheckScriptFlag(own, 546287 ) ==true then
		SetSpeakDetail(own,"[SC_SOUND_IC_03]")
		if CheckScriptFlag(own, 546299 ) ==false then
			AddSpeakOption(own,tar,"[SC_SOUND_IC_12]","ic_Sound_106818_00_2",0)				---傳送
		end	
	end
end
function ic_Sound_106818_00_1()																---任務NPC用
	local own = OwnerID()
	local tar = TargetID()
	GiveBodyItem(own, 546287,1)
	GiveBodyItem(own, 241315,1)
	lua_star_BossKilledCount(106818)
	BeginPlot( own , "ic_Sound_106818_00_2",0)
	CloseSpeak(own)
end
function ic_Sound_106818_00_2()																---傳送用
	local player = OwnerID() 																
		BeginPlot( player , "ic_Sound_106818_00_3",0)
		CloseSpeak(player)
end
function ic_Sound_106818_00_3()																---傳送用
	local player = OwnerID() 
	if CheckBuff(player, 501570) == true then  
		ScriptMessage(player,player, 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(player, 501570,0,-1);
	end
	DialogCreate(player, EM_LuaDialogType_YesNo ,"[SC_SOUND_IC_12]")
	DialogSelectStr(player, "[SC_GETTITLE_1]" )
	DialogSelectStr(player, "[SC_CANCEL]" )
	if( DialogSendOpen(player) == false ) then 
		ScriptMessage(player,player,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		return
	end
	for i = 0 , 300 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult(player);
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
			if ( SelectID == 0 ) then														---選是，執行劇情
				ChangeZone(player,2,0,-1281,-380,2183,183)
				GiveBodyItem(player, 546299,1)
				CancelBuff(player, 501570 );
				break;
			elseif ( SelectID == 1 ) then													---選否
				CancelBuff(player, 501570 );
				DialogClose(player)	
				break
			end
		elseif i == 300 then																---30秒後，自動關閉視窗
			CancelBuff(player, 501570 );
			DialogClose(player)	
			break
		end
	end
end
function ic_Sound_106818_00_4()																---傳玩家回城
	local own = OwnerID()
	BeginPlot( own , "ic_Sound_106818_00_5",0)
	CloseSpeak(own)
end
function ic_Sound_106818_00_5()																---傳玩家回城
	local player = OwnerID() 																
		BeginPlot( player , "ic_Sound_106818_00_6",0)
		CloseSpeak(player)
end
function ic_Sound_106818_00_6()																---傳玩家回城
	local player = OwnerID() 
	local playXX
	if CheckBuff(player, 501570) == true then  
		ScriptMessage(player,player, 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(player, 501570,0,-1);
	end
	DialogCreate(player, EM_LuaDialogType_YesNo ,"[SC_SOUND_IC_04]")
	DialogSelectStr(player, "[SC_GETTITLE_1]" )
	DialogSelectStr(player, "[SC_CANCEL]" )
	if( DialogSendOpen(player) == false ) then 
		ScriptMessage(player,player,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		return
	end
	for i = 0 , 300 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult(player);
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
			if ( SelectID == 0 ) then														---選是，執行劇情
				playXX = ReadRoleValue( player , EM_RoleValue_AttachObjGUID )
				if playXX==-1 then
					ChangeZone(player,2,0,2748,55,930,233)
				elseif	playXX~=-1 then
					ScriptMessage(player,player,2, "[SC_SOUND_IC_30]","0xffff8040")
					ScriptMessage(player,player,0, "[SC_SOUND_IC_30]","0xffff8040")
				end	
				CancelBuff(player,622486)
				CancelBuff(player,622460)
				CancelBuff(player,622461)
				CancelBuff(player,622462)
				CancelBuff(player,622463)
				CancelBuff(player,622464)
				CancelBuff(player,622465)
				CancelBuff(player,622502)
				CancelBuff(player, 501570 );
				break;
			elseif ( SelectID == 1 ) then													---選否
				CancelBuff(player, 501570 );
				DialogClose(player)	
				break
			end
		elseif i == 300 then																---30秒後，自動關閉視窗
			CancelBuff(player, 501570 );
			DialogClose(player)	
			break
		end
	end
end
function ic_Sound_106818_01()  																--say(OwnerID(),"boss44="..boss44)														
	local isaac=OwnerID()																	---ScriptMessage( OwnerID(), TargetID(), 0, "XXXX", 0 ) 1=紅 2=黃 3=訊息 4=紅+訊息 5=黃+訊息(單人)
	local RoomID=ic_ReadRoleValue(isaac,11)
	local flag_id=781132																	---旗標	? createflag 781132
	local boss1=ic_mob_flag_add_Y_N( isaac,106818,flag_id,1,1)								---魅影													
	local boss2=ic_mob_flag_add_Y_N( isaac,106820,flag_id,2,1)								---音樂天使
	local boss3=ic_mob_flag_add_Y_N( isaac,106821,flag_id,3,2)								---平台
	local boss4=ic_mob_flag_add_Y_N( isaac,106824,flag_id,4,2)								---符文柱
	local boss5=ic_mob_flag_add_Y_N( isaac,106824,flag_id,5,2)								---符文柱
	local boss6=ic_mob_flag_add_Y_N( isaac,106824,flag_id,6,2)								---符文柱
	local boss7																				---小魅影
	local boss8={}																			---能量
	local boss9																				---寶箱
	local play=0																			---生小魅影
	local boss7XX=0																			---小魅影死幾支	
	local play12=0																			---完成幾輪
	local BOSSXX=0																			---魅影死
	local time1=0																			---結束撿寶時間
	local time2=0																			---玩家是否下線
	local playxx=0																			---玩家
	local open=0																			---開始了
	local time3=0																			---計時器
	local boss2buff																			---天使囚禁層數																		
	local playtime=0																		---玩家時間到
	local play98=0																			---玩家跑出範圍
	local play9898
	local luck=0																			---失敗隨機獎勵
	local playOK
	local playjob
	AddBuff(boss1,622473,0 ,-1)
	AddBuff(boss2,622473,0 ,-1)
	AddBuff(boss2,622499,0 ,-1)
	SetFlag(boss1, 544801 , 1 )
	SetModeEx(boss1,EM_SetModeType_Searchenemy, false) 
	SetModeEx(boss1,EM_SetModeType_Fight,false) 
	SetModeEx(boss1,EM_SetModeType_Move,false) 
	SetModeEx(boss2,EM_SetModeType_Searchenemy, false) 
	SetModeEx(boss2,EM_SetModeType_Fight,false) 
	SetModeEx(boss2,EM_SetModeType_Move,false) 	
	ic_WriteRoleValue(boss2,0,isaac)
	ic_WriteRoleValue(boss1,10,boss2)
	ic_WriteRoleValue(boss2,10,boss1)
	ic_WriteRoleValue(boss4,10,boss2)
	ic_WriteRoleValue(boss5,10,boss2)
	ic_WriteRoleValue(boss6,10,boss2)
	ic_WriteRoleValue(boss3,0,isaac)	
	ic_All_bobo(boss3)
	ic_All_bobo(boss4)
	ic_All_bobo(boss5)
	ic_All_bobo(boss6)
	SetModeEx(boss3,EM_SetModeType_HideName, true) 
	SetModeEx(boss4,EM_SetModeType_HideName, true) 
	SetModeEx(boss5,EM_SetModeType_HideName, true) 
	SetModeEx(boss6,EM_SetModeType_HideName, true)
	SetModeEx(boss3,EM_SetModeType_Obstruct, false) 
	SetModeEx(boss4,EM_SetModeType_Obstruct, false) 
	SetModeEx(boss5,EM_SetModeType_Obstruct, false) 
	SetModeEx(boss6,EM_SetModeType_Obstruct, false)
	SetModeEx(boss4,EM_SetModeType_Mark, false) 
	SetModeEx(boss5,EM_SetModeType_Mark, false) 
	SetModeEx(boss6,EM_SetModeType_Mark, false)	
	AddToPartition(boss3,RoomID)
	AddToPartition(boss4,RoomID)
	AddToPartition(boss5,RoomID)
	AddToPartition(boss6,RoomID)
	AdjustFaceDir(boss4,boss2,0)
	AdjustFaceDir(boss5,boss2,0)
	AdjustFaceDir(boss6,boss2,0)
	BeginPlot(boss1,"ic_Sound_106818_01_1" , 0)
	BeginPlot(boss2,"ic_Sound_106818_01_2" , 0)
	BeginPlot(boss4,"ic_Sound_106818_01_3" , 0)
	BeginPlot(boss5,"ic_Sound_106818_01_3" , 0)
	BeginPlot(boss6,"ic_Sound_106818_01_3" , 0)
	SetPlot(boss3,"touch","ic_Sound_106818_02",10)	
	LockHP(boss2, ReadRoleValue(boss2, EM_RoleValue_MaxHP )*0.1 , "" )
	LockHP(boss1, ReadRoleValue(boss1, EM_RoleValue_MaxHP )*0.1 , "" )
	while true do
		play=ic_ReadRoleValue(isaac,1)
		boss7XX=ic_ReadRoleValue(isaac,2)
		play12=ic_ReadRoleValue(isaac,3)
		play9898=ic_ReadRoleValue(isaac,6)
		playtime=ic_ReadRoleValue(isaac,7)
		open=ic_ReadRoleValue(isaac,8)
		time2=ic_ReadRoleValue(isaac,9)
		BOSSXX=ic_ReadRoleValue(isaac,10)
		if 	open==1 then
			SetModeEx(boss1,EM_SetModeType_Fight, true) 
			SetModeEx(boss2,EM_SetModeType_Fight, true) 
			playxx=ic_ReadRoleValue(isaac,4)
			ic_WriteRoleValue(boss1,8,playxx)
			ic_WriteRoleValue(boss2,8,playxx)
			play98=GetDistance(isaac,playxx)
			time3=time3+1
			if play98>250 and BOSSXX==0 and time2==0 then
				ScriptMessage(playxx,playxx,1, "[SC_SOUND_IC_26]","0xffff00ff")--亮紫色
				ScriptMessage(playxx,playxx,0, "[SC_SOUND_IC_26]",0)
			end
			if play98>300 and BOSSXX==0 and time2==0 then
				ScriptMessage(playxx,playxx,1, "[SC_SOUND_IC_29]","0xff8000ff")--暗紫色
				ScriptMessage(playxx,playxx,0, "[SC_SOUND_IC_29]",0)
				lua_star_BossKilledCount(106822)
				ic_WriteRoleValue(isaac,6,1)
			end
			if time3>300 and BOSSXX==0 and time2==0 then
				lua_star_BossKilledCount(106819)
				ic_WriteRoleValue(isaac,7,1)
			end
			if CheckID(playxx) == true and CheckBuff(playxx, 622486 ) == true then
			
			elseif CheckID(playxx) == false or CheckBuff(playxx, 622486 ) == false then
				ic_WriteRoleValue(isaac,9,1)
			end
		end
		if play==1 and play12<2 then
			ic_WriteRoleValue(isaac,8,1)
			ic_WriteRoleValue(boss1,9,1)
			if play12==0 then
				for i=1,4 do																---生能量
					boss8[i]=ic_mob_flag_add_Y_N(isaac,106822,flag_id,14+i,1)
					ic_WriteRoleValue(boss8[i],1,i)
					ic_WriteRoleValue(boss8[i],2,0)
					ic_All_bobo(boss8[i])
					SetModeEx(boss8[i],EM_SetModeType_HideName, true) 
					SetModeEx(boss8[i],EM_SetModeType_Obstruct, false) 
					SetModeEx(boss8[i],EM_SetModeType_Mark, false)
					SetModeEx(boss8[i],EM_SetModeType_Mark, false)	
					AddToPartition(boss8[i],RoomID)
					AddBuff(boss8[i],622554+i,0,-1 )
					BeginPlot(boss8[i],"ic_Sound_106818_play8" , 0)
				end
			end	
			for i=1,5 do																	---生小魅影
					boss7=ic_mob_flag_add_Y_N(isaac,106819,flag_id,9+i,1)
					SetFlag(boss7, 544801 , 1 )												---不生帕奇鼠用
					SetModeEx(boss7,EM_SetModeType_Move, false) 
					SetModeEx(boss7,EM_SetModeType_Searchenemy, false) 
					ic_WriteRoleValue(boss7,0,isaac)
					ic_WriteRoleValue(boss7,1,boss8[1])
					ic_WriteRoleValue(boss7,4,boss8[2])
					ic_WriteRoleValue(boss7,9,boss8[3])
					ic_WriteRoleValue(boss7,10,boss8[4])
					AddBuff(boss7,622473,0 ,-1)
					BeginPlot(boss7,"ic_Sound_106818_03" , 0)
				end
			ic_WriteRoleValue(isaac,1,0)
		end
		if boss7XX==5 then																	---打死5次
			ic_WriteRoleValue(isaac,1,1)
			ic_WriteRoleValue(isaac,2,0)
			play12=ic_ReadRoleValue(isaac,3)
			ic_WriteRoleValue(isaac,3,play12+1)
			if	CheckBuff(boss2,622509) == true then
				boss2buff=ic_buff_lv(boss2,622509)
				CancelBuff(boss2,622509)
				if boss2buff==1 then
					AddBuff(boss2,622509,0,-1)
					CancelBuff(boss2,622510)
					ScriptMessage(playxx,playxx,2, "[SC_SOUND_IC_17]","0xffff80ff")
					sleep(10)
					ScriptMessage(playxx,playxx,2, "[SC_SOUND_IC_18]","0xff8000ff")
					time3=time3+1
				end	
			end	
		end
		if play12==2 then																	---完成2輪
			AddRoleValue(playxx , EM_LuaValueFlag_UseItem37,1)								--完成+1
			playOK=ReadRoleValue(playxx, EM_LuaValueFlag_UseItem37)
			--say(playxx,"playOK="..playOK)
			if playOK>=5 and
			   CountBodyItem(playxx,530900)==0 and			--戰士1
			   CountBodyItem(playxx,530901)==0 and			--遊俠2
			   CountBodyItem(playxx,530902)==0 and			--影行者3
			   CountBodyItem(playxx,530903)==0 and			--法師4
			   CountBodyItem(playxx,530904)==0 and			--祭師5
			   CountBodyItem(playxx,530905)==0 and			--騎士6
			   CountBodyItem(playxx,530906)==0 and			--森林牧者7
			   CountBodyItem(playxx,530907)==0 and 			--自然神官8
			   CountBodyItem(playxx,530908)==0 and			--靈能者9
			   CountBodyItem(playxx,530909)==0 and			--符文工匠10
			   CountBodyItem(playxx,530911)==0 and			--11
			   CountBodyItem(playxx,530912)==0 and			--12
			   CountBodyItem(playxx,530913)==0 and			--13
			   CountBodyItem(playxx,530914)==0 and			--14
			   CountBodyItem(playxx,530915)==0 and 			--15
			   CountBodyItem(playxx,530916)==0 and			--16
			   CountBodyItem(playxx,530917)==0 and			--17	
			   CountBodyItem(playxx,530918)==0 then			--18
			   playjob=ReadRoleValue(playxx, EM_RoleValue_VOC )--超過10要額外+1
			   if playjob<11 then
					GiveBodyItem(playxx,530899+playjob,1)	
			   elseif playjob>10 then						--職業號碼大於10用
					GiveBodyItem(playxx,530900+playjob,1)	
				end
			   lua_star_BossKilledCount(106824)
			elseif playOK>=15 and CountBodyItem(playxx,530910)==0 then
				local PlayerName = GetName(playxx)
				local MessageString = "[SC_SOUND_IC_27][$SETVAR1="..PlayerName.."]" 	
				ic_say_all_world(MessageString,2,3) 
				 GiveBodyItem(playxx,530910,1)
				 lua_star_BossKilledCount(106825)
			end
			BeginPlot(playxx,"ic_Sound_106818_02_1",0)
			LockHP(boss1, ReadRoleValue(boss1, EM_RoleValue_MaxHP )*-1 , "" )
			lua_star_BossKilledCount(106821)
			sleep(20)
			SetModeEx(boss2,EM_SetModeType_Fight, true) 
			ic_WriteRoleValue(boss2,1,1)
			sleep(40)
			if time3<61 then---最好
				for i=1,5 do																---生寶箱
					boss9=ic_mob_flag_add_Y_N(isaac,106546,flag_id,9+i,2)
					ic_All_bobo(boss9)
					SetModeEx(boss9,EM_SetModeType_Obstruct, false) 
					AddToPartition(boss9,RoomID)
					playxx=ic_ReadRoleValue(isaac,4)
					KillID(playxx,boss9)
				end
			elseif time3>60  then--普通
				for i=1,5 do																---生寶箱
					boss9=ic_mob_flag_add_Y_N(isaac,106545,flag_id,9+i,2)
					ic_All_bobo(boss9)
					SetModeEx(boss9,EM_SetModeType_Obstruct, false) 
					AddToPartition(boss9,RoomID)
					playxx=ic_ReadRoleValue(isaac,4)
					KillID(playxx,boss9)
				end
			end
			ic_WriteRoleValue(isaac,3,3)
		end
		if BOSSXX==1 or time2==1 or playtime==1 or play9898==1 then
			if playtime==1 or play9898==1 then												---失敗了
				sleep(20)
				Luck=DW_Rand(2)
				if luck==1 then
					GiveBodyItem(playxx, 204428,1)											---安慰獎(音符)
				elseif luck==2 then
					GiveBodyItem(playxx, 204457,1)											---安慰獎(樂譜)
				end	
				ScriptMessage(playxx,playxx,1, "[SC_SOUND_IC_28]","0xff8000ff")				---暗紫色
				ScriptMessage(playxx,playxx,0, "[SC_SOUND_IC_28]",0)
			end
			if time1==2 and BOSSXX==1 then													---魅影死
				CancelBuff(boss2,622500)
				ScriptMessage(playxx,playxx,1, "[SC_SOUND_IC_16]","#001E78")
				ScriptMessage(playxx,playxx,0, "[SC_SOUND_IC_16]",0)
				local PlayerName = GetName(playxx)
				local MessageString = "[SC_SOUND_IC_24][$SETVAR1="..PlayerName.."]"
				ScriptMessage(playxx,playxx,2,MessageString,"0xffff80ff")
			end
			time1=time1+1
			if time1>15 or time2==1 or playtime==1 or play9898==1 then						---15秒撿寶~玩家下線~時間到了~跑太遠
				if time2==1 or playtime==1 or play9898==1 then								---玩家下線~時間到了~跑太遠
					ic_npcXX(400,106820,106821,106822,106818,106819,106824,106823,106547,0,0)
				end
				if BOSSXX==1 then
					ic_npcXX(400,106820,106821,106822,106823,106547,106545,106546,0,0,0)
				end
				BeginPlot(playxx,"ic_Sound_106818_00_5",0)
				BeginPlot(playxx,"ic_Sound_106818_02_1",0)
				sleep(20)
				local Search = SearchRangePlayer (isaac,400)
				for i = 0 , table.getn(Search)	do
					if ReadRoleValue(Search[i],EM_RoleValue_VOC) ~= 0 then 
						AddBuff(Search[i] ,622512,0,-1)
					end
				end
				sleep(10)
				CancelBuff(playxx,622486)
				CancelBuff(playxx,622555)
				CancelBuff(playxx,622556)
				CancelBuff(playxx,622557)
				CancelBuff(playxx,622558)
				CancelBuff(playxx,622559)
				CancelBuff(playxx,622560)
				CancelBuff(playxx,622502)
				ic_WriteRoleValue(isaac,1,0)
				ic_WriteRoleValue(isaac,2,0)
				ic_WriteRoleValue(isaac,3,0)
				ic_WriteRoleValue(isaac,4,0)
				ic_WriteRoleValue(isaac,6,0)
				ic_WriteRoleValue(isaac,7,0)
				ic_WriteRoleValue(isaac,8,0)
				ic_WriteRoleValue(isaac,9,0)
				ic_WriteRoleValue(isaac,10,0)
				boss7XX=0																			
				play12=0																			
				BOSSXX=0																		
				time1=0																			
				time2=0																			
				playxx=0																			
				open=0																			
				time3=0																																			
				playtime=0																		
				play98=0																			
				playbuff=0	
				boss8={}
				boss1=ic_mob_flag_add_Y_N( isaac,106818,flag_id,1,1)													
				boss2=ic_mob_flag_add_Y_N( isaac,106820,flag_id,2,1)
				boss3=ic_mob_flag_add_Y_N( isaac,106821,flag_id,3,2)
				boss4=ic_mob_flag_add_Y_N( isaac,106824,flag_id,4,2)
				boss5=ic_mob_flag_add_Y_N( isaac,106824,flag_id,5,2)
				boss6=ic_mob_flag_add_Y_N( isaac,106824,flag_id,6,2)
				AddBuff(boss1,622473,0 ,-1)
				AddBuff(boss2,622473,0 ,-1)
				AddBuff(boss2,622499,0 ,-1)
				SetFlag(boss1, 544801 , 1 )
				SetModeEx(boss1,EM_SetModeType_Searchenemy, false) 
				SetModeEx(boss1,EM_SetModeType_Fight, false) 
				SetModeEx(boss1,EM_SetModeType_Move, false) 
				SetModeEx(boss2,EM_SetModeType_Searchenemy, false) 
				SetModeEx(boss2,EM_SetModeType_Fight, false) 
				SetModeEx(boss2,EM_SetModeType_Move, false) 	
				ic_WriteRoleValue(boss2,0,isaac)
				ic_WriteRoleValue(boss1,10,boss2)
				ic_WriteRoleValue(boss2,10,boss1)
				ic_WriteRoleValue(boss4,10,boss2)
				ic_WriteRoleValue(boss5,10,boss2)
				ic_WriteRoleValue(boss6,10,boss2)
				ic_WriteRoleValue(boss3,0,isaac)	
				ic_All_bobo(boss3)
				ic_All_bobo(boss4)
				ic_All_bobo(boss5)
				ic_All_bobo(boss6)
				SetModeEx(boss3,EM_SetModeType_HideName, true) 
				SetModeEx(boss4,EM_SetModeType_HideName, true) 
				SetModeEx(boss5,EM_SetModeType_HideName, true) 
				SetModeEx(boss6,EM_SetModeType_HideName, true)
				SetModeEx(boss3,EM_SetModeType_Obstruct, false) 
				SetModeEx(boss4,EM_SetModeType_Obstruct, false) 
				SetModeEx(boss5,EM_SetModeType_Obstruct, false) 
				SetModeEx(boss6,EM_SetModeType_Obstruct, false)
				SetModeEx(boss4,EM_SetModeType_Mark, false) 
				SetModeEx(boss5,EM_SetModeType_Mark, false) 
				SetModeEx(boss6,EM_SetModeType_Mark, false)	
				AddToPartition(boss3,RoomID)
				AddToPartition(boss4,RoomID)
				AddToPartition(boss5,RoomID)
				AddToPartition(boss6,RoomID)
				AdjustFaceDir(boss4,boss2,0)
				AdjustFaceDir(boss5,boss2,0)
				AdjustFaceDir(boss6,boss2,0)
				BeginPlot(boss1,"ic_Sound_106818_01_1" , 0)
				BeginPlot(boss2,"ic_Sound_106818_01_2" , 0)
				BeginPlot(boss4,"ic_Sound_106818_01_3" , 0)
				BeginPlot(boss5,"ic_Sound_106818_01_3" , 0)
				BeginPlot(boss6,"ic_Sound_106818_01_3" , 0)
				SetPlot(boss3,"touch","ic_Sound_106818_02",10)	
				LockHP(boss2, ReadRoleValue(boss2, EM_RoleValue_MaxHP )*0.1 , "" )
				LockHP(boss1, ReadRoleValue(boss1, EM_RoleValue_MaxHP )*0.1 , "" )
			end	
		end
		sleep(10)
	end
end
function ic_Sound_106818_01_1()																---魅影技能		
	local mob=OwnerID()
	local AttackTarget
	local play=0
	local kkplay=0
	local Luck=0
	local time1=0
	local HPPercent
	local play123
	local time2=0
	local time3=0
	while true do
		play=ic_ReadRoleValue(mob,1)
		kkplay=ic_ReadRoleValue(mob,9)	
		if kkplay==1 then
			time1=time1+1
			if time1>9 then
				Luck=DW_Rand(2)
				play=ic_ReadRoleValue(mob,1)
				if CheckBuff(mob,622472) == false and play==0  then							---沒封印
					if Luck==1 then
						play123=ic_ReadRoleValue(mob,8)
						local Search = SearchRangePlayer ( OwnerID() , 200)
						for i = 0 , table.getn(Search)	do
							if ReadRoleValue(Search[i]  , EM_RoleValue_VOC ) ~= 0 then 
								if CheckBuff(Search[i],622486) == true then					---有玩活動
									ScriptMessage(play123,play123,2, "[SC_SOUND_IC_15]","0xffff80ff")
									CastSpellLV(mob,Search[i],850112,0)
									ic_magic_ing(mob,5)
								end	
							end
						end	
						time1=0
					elseif Luck==2 and play==0 then											---小魅影無敵
						play123=ic_ReadRoleValue(mob,8)
						ScriptMessage(play123,play123,2, "[SC_SOUND_IC_15]","0xffff80ff")
						CastSpellLV(mob,mob,850113,0)
						ic_magic_ing(mob,5)
						time1=0
					end
				elseif	CheckBuff(mob,622472) == true and play==1 then						---被封印
				time1=0
				end
			end	
		end
		if play==1 then
			ic_WriteRoleValue(mob,9,0)
			AttackTarget=ic_ReadRoleValue(mob,10)
			HPPercent=ic_HP_Max_Now(mob)
			if HPPercent>0.5 then
				if time2==0 then
					NPCSay(mob, "[SC_SOUND_IC_19]")
					time2=1
				end	
				CastSpellLV(mob,AttackTarget,850110,2)										---打天使一次10%
				ic_magic_ing(mob,5)
			elseif HPPercent<0.5 then
				if time3==0 then
					NPCSay(mob, "[SC_SOUND_IC_20]")
					time3=1
				end
				CastSpellLV(mob,AttackTarget,850111,3)										---打天使一次15%
				ic_magic_ing(mob,5)
			end
		end
		sleep(10)	
	end
end
function ic_Sound_106818_01_2()																---天使技能	
	local mob=OwnerID()
	local isaac=ic_ReadRoleValue(mob,0)	
	local AttackTarget
	local play=0
	local time1=0
	local time2=0
	local HPPercent
	local play123
	local time3=0
	local time4=0
	local time5=0
	while true do
		play=ic_ReadRoleValue(mob,1)
		if play==0 then
			if time1==0 then
				AddBuff(mob,622509,1,-1)
				PlayMotion(mob,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
				sleep(10)
				AddBuff(mob,622510,0,-1)
				time1=1
			elseif time1==1 then
				PlayMotion(mob,ruFUSION_ACTORSTATE_CROUCH_LOOP)
				play123=ic_ReadRoleValue(mob,8)
				if  CheckBuff(play123,622555) == false and 
					CheckBuff(play123,622556) == false and 
					CheckBuff(play123,622557) == false and 
					CheckBuff(play123,622558) == false and 
					CheckBuff(play123,622559) == false and 
					CheckBuff(play123,622560) == false then
					if time3==0 then
						ScriptMessage(play123,play123,1, "[SC_SOUND_IC_25]","0xffff80ff")
						time3=1
					end 
				end	
			end		
		end
		if play==1 then
			play123=ic_ReadRoleValue(mob,8)
			if time1==1 then
				PlayMotion(mob,ruFUSION_ACTORSTATE_CROUCH_END)
				sleep(10)
				ScriptMessage(play123,play123,2, "[SC_SOUND_IC_21]","0xffff80ff")
				CastSpellLV(mob,mob,850107,4)
				sleep(10)
				AttackTarget=ic_ReadRoleValue(mob,10)
				ic_WriteRoleValue(AttackTarget,1,1)
				sleep(10)
				AddBuff(mob,622500,0 ,-1)
				ic_npcXX(100,106824,0,0,0,0,0,0,0,0,0)
				time1=2
			end
				AttackTarget=ic_ReadRoleValue(mob,10)
				HPPercent=ic_HP_Max_Now(mob)
			if ReadRoleValue(AttackTarget,EM_RoleValue_IsDead)== 0 then
				if HPPercent>0.5 and time2==0 then
					if time4==0 then
						NPCSay(mob, "[SC_SOUND_IC_22]")
						time4=1
					end
					CastSpellLV(mob,AttackTarget,850108,3)									---打魅影一次15%
					ic_magic_ing(mob,5)
				elseif HPPercent<0.5 and time2==0 then
					if time5==0 then
						NPCSay(mob, "[SC_SOUND_IC_23]")
						time5=1
					end
					CastSpellLV(mob,AttackTarget,850109,4)									---打魅影一次20%
					ic_magic_ing(mob,5)
				end
			elseif	ReadRoleValue(AttackTarget,EM_RoleValue_IsDead)== 1 then
					ic_WriteRoleValue(isaac,10,1)
					time2=1
			end	
		end	
		sleep(10)	
	end
end
function ic_Sound_106818_01_3()																---石住技能(表演用)
	local mob=OwnerID()
	local AttackTarget
	while true do
		AttackTarget=ic_ReadRoleValue(mob,10)
		CastSpellLV(mob,mob,850105,0)
		sleep(10)
	end
end
function ic_Sound_106818_02()																---點平台 106818
	local play=OwnerID()	
	local npc=TargetID()
	local RoomID=ReadRoleValue(npc,EM_RoleValue_RoomID)
	local flag_id=781132
	local RoomID=ic_ReadRoleValue(npc,11)
	local isaac=ic_ReadRoleValue(npc,0)	
	local time0=0
	local mob
	local play123
	SetPlot(npc,"touch","",0)
	play123=GetPartyID(play, -1 )
	if play123==0 then
		if CountBodyItem( play, 241315 )>0 then
			time0=ic_ReadRoleValue(NPC,1)
				if time0==0 then
					mob=ic_mob_flag_add_Y_N( npc,106547,flag_id,3,2) 
					ic_All_nolook_00(mob)
					AddToPartition(mob,RoomID)
					GiveBodyItem(play, 546158,1)
					ScriptMessage(play,play,2, "[SC_SOUND_IC_14]","0xffff8040")
					ScriptMessage(play,play,0, "[SC_SOUND_IC_14]","0xffff8040")
					lua_star_BossKilledCount(106820)
					DelBodyItem(play,241315,1)
					AddBuff(play,622486,0 ,-1 )
					ic_WriteRoleValue(npc,1,1)
					CastSpellLV(mob,mob,850106,0)
					ic_WriteRoleValue(isaac,4,play)
	--				---------------------------  給與全勤獎 --------------------------------
	--				local OID = OwnerID()  
	--				--< OID後方請請填入該活動中是"玩家"的變數,  例如 Local OID = player
	--				-- 如果此段的OwnerID 為玩家則不需更改
	--				local allcount = 2  -- 所有新活動數量
	--				local count = 0
	--				local keylist =  {
	--					546158, --拯救天使
	--					546519 --蒐集音樂能量
	--						}
	--				for i =  1 , table.getn(keylist) do
	--					if Checkflag(OID , keylist[i] )  == true then
	--						count = count +1
	--					end
	--					if i == table.getn(keylist) then
	--						if count == allcount then -- 如果完成全部
	--							lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 5月愛樂節活動 為等級0
	--						end
	--					end
	--				end
					-----------------------------------------------------------------------
					sleep(40)
					ic_WriteRoleValue(isaac,1,1)
					ClockOpen(play,EM_ClockCheckValue_27,300,300, 0 ,"ic_Sound_106818_02_1","ic_Sound_106818_02_1")
					sleep(30)
					SetPlot(npc,"touch","ic_Sound_106818_02",10)
				elseif	time0~=0 then
					ic_say_play(play,play,"[SC_SOUND_IC_05]",4)
					sleep(30)
					SetPlot(npc,"touch","ic_Sound_106818_02",10)
				end
		elseif CountBodyItem( play, 241315 )<1 then
			ic_say_play(play,play,"[SC_SOUND_IC_06]",4)
			sleep(30)
			SetPlot(npc,"touch","ic_Sound_106818_02",10)
		end	
	elseif	play123~=0 then
		ic_say_play(play,play,"[SC_SOUND_IC_07]",5)
		sleep(30)
		SetPlot(npc,"touch","ic_Sound_106818_02",10)
	end
	sleep(10)	
end
function ic_Sound_106818_02_1()																---關計時器
	ClockClose( OwnerID())
end
function ic_Sound_106818_03()																---小魅影用
	local mob=OwnerID()
	local Luck=0																			---6選1用
	local Luck1=0																			---6選1用
	local time0=0																			---6選1用
	local time1=0																			---6選1用
	local Luck2=0																			---生氣與平靜用
	local Luck3=0																			---生氣與平靜用
	local time2=0																			---生氣與平靜用
	local time4=0																			---生氣與平靜用
	local time5=0
	local time6=0
	local time7=0
	local mob1
	local mob2
	local mob3
	local mob4
	local mob5
	SetPlot(mob,"dead","ic_Sound_106818_03_1",0)
	while true do
		time5=ic_ReadRoleValue(mob,5)
		time6=ic_ReadRoleValue(mob,6)
		mob5=ic_ReadRoleValue(mob,7)
		if CheckBuff(mob,622474) == true then 
			if time7==1 then
				PlayMotion(mob,150)
				sleep(10)
				time4=time4+1
				time1=time1+1
				time7=0
			end
			PlayMotion(mob,101)
			sleep(20)
			time4=time4+2
			time1=time1+2
		elseif CheckBuff(mob,622475) == true then 
			if time7==0 then
				PlayMotion(mob,148)
				sleep(10)
				PlayMotion(mob,149)
				time4=time4+1
				time1=time1+1
				time7=1
			elseif	time7==1 then
				PlayMotion(mob,149)
			end
		end
		if time2==0 then
			Luck2=DW_Rand(2)
			ic_WriteRoleValue(mob,3,Luck2)
			AddBuff(mob,622473+Luck2,0 ,-1 )
			time2=1
			mob5=ic_ReadRoleValue(mob,7)
			ic_WriteRoleValue(mob,7,mob5+1)
		elseif 	time2==1 then
			time4=time4+1
			if time4>30 or time5==1 then
				Luck3=ic_ReadRoleValue(mob,3)
				mob5=ic_ReadRoleValue(mob,7)
				ic_WriteRoleValue(mob,7,mob5-1)
				if Luck3==1 and time4>5 then
					ic_WriteRoleValue(mob,3,2)
					ic_WriteRoleValue(mob,5,0)
					AddBuff(mob,622475,0 ,-1 )
					time4=0
				elseif	Luck3==2 and time4>5 then
					ic_WriteRoleValue(mob,3,1)
					ic_WriteRoleValue(mob,5,0)
					AddBuff(mob,622474,0 ,-1 )
					time4=0
				end
				mob5=ic_ReadRoleValue(mob,7)
				ic_WriteRoleValue(mob,7,mob5+1)
			end
		end
		if time0==0 then
			Luck=DW_Rand(4)
			Luck1=ic_ReadRoleValue(mob,2)
			if Luck~=Luck1 then
				ic_WriteRoleValue(mob,2,Luck)
				AddBuff(mob,622459+Luck,0 ,-1 )
				time0=1
				mob5=ic_ReadRoleValue(mob,7)
				ic_WriteRoleValue(mob,7,mob5+1)	
			end
		elseif 	time0==1 then
			time1=time1+1
			if time1>30 or time6==1 then
				mob5=ic_ReadRoleValue(mob,7)
				ic_WriteRoleValue(mob,7,mob5-1)
				Luck=DW_Rand(4)
				Luck1=ic_ReadRoleValue(mob,2)
				if Luck~=Luck1 then
					ic_WriteRoleValue(mob,2,Luck)
					ic_WriteRoleValue(mob,6,0)
					AddBuff(mob,622459+Luck,0 ,-1 )
					time1=0
				end
				mob5=ic_ReadRoleValue(mob,7)
				ic_WriteRoleValue(mob,7,mob5+1)
			end
		end
		mob5=ic_ReadRoleValue(mob,7)
		if mob5==2  then
			Luck3=ic_ReadRoleValue(mob,3)--生氣or平靜
			Luck1=ic_ReadRoleValue(mob,2)--4選1
			mob1=ic_ReadRoleValue(mob,1)--火
			mob2=ic_ReadRoleValue(mob,4)--水
			mob3=ic_ReadRoleValue(mob,9)--土
			mob4=ic_ReadRoleValue(mob,10)--風
			if Luck3==1 then		--生氣
				if Luck1==1 then	--火
					sysCastSpellLV(mob2,mob,850176,0)				
				elseif Luck1==2 then--水
					sysCastSpellLV(mob1,mob,850175,0)	
				elseif Luck1==3 then--土
					sysCastSpellLV(mob4,mob,850178,0)
				elseif Luck1==4 then--風
					sysCastSpellLV(mob3,mob,850177,0)	
				end
			elseif Luck3==2 then	--平靜
				if Luck1==1 then	--火
					sysCastSpellLV(mob1,mob,850175,0)
				elseif Luck1==2 then--水
					sysCastSpellLV(mob2,mob,850176,0)	
				elseif Luck1==3 then--土
					sysCastSpellLV(mob3,mob,850177,0)		
				elseif Luck1==4 then--風
					sysCastSpellLV(mob4,mob,850178,0)	
				end
			end
			
		end
		sleep(10)
	end
end
function ic_Sound_106818_03_1()																---小魅影死
	local mob=OwnerID()
	local isaac=ic_ReadRoleValue(mob,0)
	local boss7XX=0	
		  boss7XX=ic_ReadRoleValue(isaac,2)	
		  ic_WriteRoleValue(isaac,2,boss7XX+1)
end
function ic_Sound_106818_play1()															---火傷害判定用
	local player = OwnerID() 	
	local NPC = TargetID()	
	CancelBuff(player,622555)
	if ReadRoleValue(NPC,EM_RoleValue_OrgID) == 106819 then
		if CheckBuff(NPC,622501) == false then												---沒無敵
			if CheckBuff(NPC,622474) == true then											---生氣相剋
				if CheckBuff(NPC,622461) == true then
					return true
				end	
				if CheckBuff(NPC,622461) == false then
					ic_WriteRoleValue(NPC,5,1)
					ic_WriteRoleValue(NPC,6,1)
					return false
				end
			elseif CheckBuff(NPC,622475) == true then										---平靜相同
				if CheckBuff(NPC,622460) == true then
					return true
				end	
				if CheckBuff(NPC,622460) == false then
					ic_WriteRoleValue(NPC,5,1)
					ic_WriteRoleValue(NPC,6,1)
					return false
				end
			elseif CheckBuff(NPC,622475) == false and CheckBuff(NPC,622474) == false then	--平靜相同
				return false
			end
		elseif CheckBuff(NPC,622501) == true then											---有無敵
			ScriptMessage(player,player,1, "[SC_SOUND_IC_13]","0xff897681")
			ScriptMessage(player,player,0, "[SC_SOUND_IC_13]","0xff897681")
			return false
		end		
	elseif	ReadRoleValue(NPC,EM_RoleValue_OrgID) ~= 106819 then
		ScriptMessage(NPC,player,0,"[SC_SOUND_IC_08]","0xffb14e78")
		return false
	end	
end
function ic_Sound_106818_play2()															---水傷害判定用
	local player = OwnerID() 	
	local NPC = TargetID()		
	CancelBuff(player,622556)
	if ReadRoleValue(NPC,EM_RoleValue_OrgID) == 106819 then
		if CheckBuff(NPC,622501) == false then												---沒無敵
			if CheckBuff(NPC,622474) == true then											---生氣相剋
				if CheckBuff(NPC,622460) == true then
					return true
				end	
				if CheckBuff(NPC,622460) == false then
					ic_WriteRoleValue(NPC,5,1)
					ic_WriteRoleValue(NPC,6,1)
					return false
				end
			elseif CheckBuff(NPC,622475) == true then										---平靜相同
				if CheckBuff(NPC,622461) == true then
					return true
				end	
				if CheckBuff(NPC,622461) == false then
					ic_WriteRoleValue(NPC,5,1)
					ic_WriteRoleValue(NPC,6,1)
					return false
				end
			elseif CheckBuff(NPC,622475) == false and CheckBuff(NPC,622474) == false then	---平靜相同
				return false
			end
		elseif CheckBuff(NPC,622501) == true then											---有無敵
			ScriptMessage(player,player,1, "[SC_SOUND_IC_13]","0xff897681")
			ScriptMessage(player,player,0, "[SC_SOUND_IC_13]","0xff897681")
			return false
		end	
	elseif	ReadRoleValue(NPC,EM_RoleValue_OrgID) ~= 106819 then
		ScriptMessage(NPC,player,0,"[SC_SOUND_IC_08]","0xffb14e78")
		return false
	end
end
function ic_Sound_106818_play3()															---土傷害判定用
	local player = OwnerID() 	
	local NPC = TargetID()	
	CancelBuff(player,622557)
	if ReadRoleValue(NPC,EM_RoleValue_OrgID) == 106819 then
		if CheckBuff(NPC,622501) == false then												---沒無敵
			if CheckBuff(NPC,622474) == true then											---生氣相剋
				if CheckBuff(NPC,622463) == true then
					return true
				end	
				if CheckBuff(NPC,622463) == false then
					ic_WriteRoleValue(NPC,5,1)
					ic_WriteRoleValue(NPC,6,1)
					return false
				end
			elseif CheckBuff(NPC,622475) == true then										---平靜相同
				if CheckBuff(NPC,622462) == true then
					return true
				end	
				if CheckBuff(NPC,622462) == false then
					ic_WriteRoleValue(NPC,5,1)
					ic_WriteRoleValue(NPC,6,1)
					return false
				end
			elseif CheckBuff(NPC,622475) == false and CheckBuff(NPC,622474) == false then	--平靜相同
				return false
			end
		elseif CheckBuff(NPC,622501) == true then											---有無敵
			ScriptMessage(player,player,1, "[SC_SOUND_IC_13]","0xff897681")
			ScriptMessage(player,player,0, "[SC_SOUND_IC_13]","0xff897681")
			return false
		end		
	elseif	ReadRoleValue(NPC,EM_RoleValue_OrgID) ~= 106819 then
		ScriptMessage(NPC,player,0,"[SC_SOUND_IC_08]","0xffb14e78")
		return false
	end	
end
function ic_Sound_106818_play4()															---風傷害判定用
	local player = OwnerID() 	
	local NPC = TargetID()	
	CancelBuff(player,622558)
	if ReadRoleValue(NPC,EM_RoleValue_OrgID) == 106819 then
		if CheckBuff(NPC,622501) == false then	--沒無敵
			if CheckBuff(NPC,622474) == true then	--生氣相剋
				if CheckBuff(NPC,622462) == true then
					return true
				end	
				if CheckBuff(NPC,622462) == false then
					ic_WriteRoleValue(NPC,5,1)
					ic_WriteRoleValue(NPC,6,1)
					return false
				end
			elseif CheckBuff(NPC,622475) == true then	--平靜相同
				if CheckBuff(NPC,622463) == true then
					return true
				end	
				if CheckBuff(NPC,622463) == false then
					ic_WriteRoleValue(NPC,5,1)
					ic_WriteRoleValue(NPC,6,1)
					return false
				end
			elseif CheckBuff(NPC,622475) == false and CheckBuff(NPC,622474) == false then	--平靜相同
				return false
			end
		elseif CheckBuff(NPC,622501) == true then	--有無敵
			ScriptMessage(player,player,1, "[SC_SOUND_IC_13]","0xff897681")
			ScriptMessage(player,player,0, "[SC_SOUND_IC_13]","0xff897681")
			return false
		end		
	elseif	ReadRoleValue(NPC,EM_RoleValue_OrgID) ~= 106819 then
		ScriptMessage(NPC,player,0,"[SC_SOUND_IC_08]","0xffb14e78")
		return false
	end	
end
function ic_Sound_106818_play7()															---封印魅影判定用
	local player = OwnerID() 	
	local NPC = TargetID()  	
	if ReadRoleValue(NPC,EM_RoleValue_OrgID) == 106818 then
		return true
	elseif	ReadRoleValue(NPC,EM_RoleValue_OrgID) ~= 106818 then
		ScriptMessage(player,player,0,"[SC_SOUND_IC_09]","0xffb14e78")
		return false
	end
end
function ic_Sound_106818_play9()															---無敵判定用
	local player = OwnerID() 	
	local NPC = TargetID()  	
	if ReadRoleValue(NPC,EM_RoleValue_OrgID) == 106819 then
		return true
	elseif	ReadRoleValue(NPC,EM_RoleValue_OrgID) ~= 106819 then
		return false
	end
end
function ic_Sound_106818_play8()															---符文柱給能量用
	local mob=OwnerID()
	local mob123
	while true do
		mob123=ic_ReadRoleValue(mob,1)
		local Search = SearchRangePlayer (mob, 20)
		for i = 0 , table.getn(Search)	do
			if ReadRoleValue(Search[i]  , EM_RoleValue_VOC ) ~= 0 then 
				if CheckBuff(Search[i] ,622486) == true then
					ic_skill_CD_0(Search[i],850097+mob123,0)
					if CheckBuff(Search[i] ,622554+mob123) == false then
						AddBuff(Search[i],622554+mob123,0 ,-1 )
					end	
				end
			end
		end
	sleep(5)
	end
end
function ic_Sound_106818_GM(X)--? pcall ic_Sound_106818_GM(X)
local player = OwnerID()
local playOK
local playjob
	if X==0 then
		DelBodyItem(player, 546287, 1 )---接過任務
		DelBodyItem(player, 546299, 1 )---傳送過
		DelBodyItem(player, 546158, 1 )---玩過任務
	elseif X==1 then
		DelBodyItem(player, 546287, 1 )---接過任務
	elseif X==2 then
		DelBodyItem(player, 546299, 1 )---傳送過
	elseif X==3 then
		playOK=ReadRoleValue(player, EM_LuaValueFlag_UseItem37)
		AddRoleValue(player , EM_LuaValueFlag_UseItem37,-playOK)
		playOK=ReadRoleValue(player, EM_LuaValueFlag_UseItem37)
		say(player,"playOK="..playOK)
		DelBodyItem(player, 530900, 1 )
		DelBodyItem(player, 530901, 1 )
		DelBodyItem(player, 530902, 1 )
		DelBodyItem(player, 530903, 1 )
		DelBodyItem(player, 530904, 1 )
		DelBodyItem(player, 530905, 1 )
		DelBodyItem(player, 530906, 1 )
		DelBodyItem(player, 530907, 1 )
		DelBodyItem(player, 530908, 1 )
		DelBodyItem(player, 530909, 1 )
		DelBodyItem(player, 530910, 1 )
		DelBodyItem(player, 530911, 1 )
		DelBodyItem(player, 530912, 1 )
		DelBodyItem(player, 530913, 1 )
		DelBodyItem(player, 530914, 1 )
		DelBodyItem(player, 530915, 1 )
		DelBodyItem(player, 530916, 1 )
		DelBodyItem(player, 530917, 1 )	
	elseif X==4 then		
		AddRoleValue(player , EM_LuaValueFlag_UseItem37,1)									--完成+1
		playOK=ReadRoleValue(player, EM_LuaValueFlag_UseItem37)
		say(player,"playOK="..playOK)
		if playOK>=5 and
		   CountBodyItem(player,530900)==0 and			--戰士
		   CountBodyItem(player,530901)==0 and			--遊俠
		   CountBodyItem(player,530902)==0 and			--影行者
		   CountBodyItem(player,530903)==0 and			--法師
		   CountBodyItem(player,530904)==0 and			--祭師
		   CountBodyItem(player,530905)==0 and			--騎士
		   CountBodyItem(player,530906)==0 and			--森林牧者
		   CountBodyItem(player,530907)==0 and 			--自然神官
		   CountBodyItem(player,530908)==0 and			--靈能者	
		   CountBodyItem(player,530909)==0 and			--符文工匠10
		   CountBodyItem(player,530911)==0 and			--11
		   CountBodyItem(player,530912)==0 and			--12
		   CountBodyItem(player,530913)==0 and			--13
		   CountBodyItem(player,530914)==0 and			--14
		   CountBodyItem(player,530915)==0 and 			--15
		   CountBodyItem(player,530916)==0 and			--16
		   CountBodyItem(player,530917)==0 and			--17	
		   CountBodyItem(player,530918)==0 then			--18
		   playjob=ReadRoleValue(player, EM_RoleValue_VOC )
		   if playjob<11 then
				GiveBodyItem(player,530899+playjob,1)	
		   elseif playjob>10 then						--職業號碼大於10用
				GiveBodyItem(player,530900+playjob,1)	
		   end
		elseif playOK>=15 and CountBodyItem(player,530910)==0 then
			 GiveBodyItem(player,530910,1)
		end
	elseif X==5 then	
		AddRoleValue(player , EM_LuaValueFlag_UseItem37,5)									--完成+5
		playOK=ReadRoleValue(player, EM_LuaValueFlag_UseItem37)
		say(player,"playOK="..playOK)
		if playOK>=20 and
		   CountBodyItem(player,530900)==0 and			--戰士
		   CountBodyItem(player,530901)==0 and			--遊俠
		   CountBodyItem(player,530902)==0 and			--影行者
		   CountBodyItem(player,530903)==0 and			--法師
		   CountBodyItem(player,530904)==0 and			--祭師
		   CountBodyItem(player,530905)==0 and			--騎士
		   CountBodyItem(player,530906)==0 and			--森林牧者
		   CountBodyItem(player,530907)==0 and 			--自然神官
		   CountBodyItem(player,530908)==0 and			--靈能者	
		   CountBodyItem(player,530909)==0 and			--符文工匠10
		   CountBodyItem(player,530911)==0 and			--11
		   CountBodyItem(player,530912)==0 and			--12
		   CountBodyItem(player,530913)==0 and			--13
		   CountBodyItem(player,530914)==0 and			--14
		   CountBodyItem(player,530915)==0 and 			--15
		   CountBodyItem(player,530916)==0 and			--16
		   CountBodyItem(player,530917)==0 and			--17	
		   CountBodyItem(player,530918)==0 then			--18
		   playjob=ReadRoleValue(player, EM_RoleValue_VOC )
		   if playjob<11 then
				GiveBodyItem(player,530899+playjob,1)	
		   elseif playjob>10 then						--職業號碼大於10用
				GiveBodyItem(player,530900+playjob,1)	
		   end
		elseif playOK>=50 and CountBodyItem(player,530910)==0 then
			 GiveBodyItem(player,530910,1)
		end
	elseif X==6 then	
		AddRoleValue(player , EM_LuaValueFlag_UseItem37,10)									--完成+10
		playOK=ReadRoleValue(player, EM_LuaValueFlag_UseItem37)
		say(player,"playOK="..playOK)
		if playOK>=5 and
		   CountBodyItem(player,530900)==0 and			--戰士
		   CountBodyItem(player,530901)==0 and			--遊俠
		   CountBodyItem(player,530902)==0 and			--影行者
		   CountBodyItem(player,530903)==0 and			--法師
		   CountBodyItem(player,530904)==0 and			--祭師
		   CountBodyItem(player,530905)==0 and			--騎士
		   CountBodyItem(player,530906)==0 and			--森林牧者
		   CountBodyItem(player,530907)==0 and 			--自然神官
		   CountBodyItem(player,530908)==0 and			--靈能者	
		   CountBodyItem(player,530909)==0 and			--符文工匠10
		   CountBodyItem(player,530911)==0 and			--11
		   CountBodyItem(player,530912)==0 and			--12
		   CountBodyItem(player,530913)==0 and			--13
		   CountBodyItem(player,530914)==0 and			--14
		   CountBodyItem(player,530915)==0 and 			--15
		   CountBodyItem(player,530916)==0 and			--16	   
		   CountBodyItem(player,530917)==0 and			--17	
		   CountBodyItem(player,530918)==0 then			--18
		   playjob=ReadRoleValue(player, EM_RoleValue_VOC )
		   if playjob<11 then
				GiveBodyItem(player,530899+playjob,1)	
		   elseif playjob>10 then						--職業號碼大於10用
				GiveBodyItem(player,530900+playjob,1)	
		   end
		elseif playOK>=15 and CountBodyItem(player,530910)==0 then
			 GiveBodyItem(player,530910,1)
		end
	--elseif X==99 then---OK要刪除	
	--	BeginPlot(player,"ic_Sound_106818_02_1",0)
	--	ic_npcXX(400,106820,106821,106822,106818,106819,106824,106823,106547,106545,0)
	--	ic_playBUFFXX(400,622486,622555,622556,622557,622558,622559,622560,622502,0,0)
	end
end
--0xffb14e78--暗紅色
--0xff897681--
--0xffff8040--橘色
--0xffff80ff--粉紅
--lua_star_BossKilledCount(106818)--領音樂盒次數
--lua_star_BossKilledCount(106819)--時間到次數
--lua_star_BossKilledCount(106820)--平台被點次數
--lua_star_BossKilledCount(106821)--成功次數
--lua_star_BossKilledCount(106822)--跑太遠失敗次數
--lua_star_BossKilledCount(106824)--拿到5次稱號
--lua_star_BossKilledCount(106825)--拿到15次稱號
--EM_LuaValueFlag_UseItem37--成功記數  
--SC_Sound_IC_18-37