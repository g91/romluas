function lua_z23t120711_01()	--任務425474乖乖不得了
	LoadQuestOption(OwnerID())
	
end

function lua_z23t120511_01()	--任務425474乖乖不得了 與npc摩瑞克的對話
	if CheckAcceptQuest(OwnerID(),425474) then
		SetSpeakDetail( OwnerID(), "[SC_Z23120511_S1]" ); 	--是你阿…我還是來不及阻止她。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120511_C1"), "lua_z23t120511_02",0)
	else
		LoadQuestOption(OwnerID())
	end
end
function lua_z23t120511_02()
	SetSpeakDetail( OwnerID(), "[SC_Z23120511_S2]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120511_C2"), "lua_z23t120511_03",0)
end
function lua_z23t120511_03()	--任務425474乖乖不得了 與npc摩瑞克的對話
	SetFlag(OwnerID(),546486,1)
	LoadQuestOption(OwnerID())
end

--425476 z23任務善意的欺騙
function Lua_z23q425476_talkwithJILL()	--對話
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),425476)==true and CheckFlag(OwnerID(),546487)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_425476_S01]","LuaP_425476_1",0);
	end
end
function LuaP_425476_1()	--呼叫表演
	CloseSpeak( OwnerID() )
	local tmpNPC = SearchRangeNPC( TargetID(), 50 )	--search NPC周圍找中控(106794)
	local objnum =0					--記錄物件數量
	local obj = 0						--回傳的中控器ID
		for i = 0,#tmpNPC-1 do
			if ReadRoleValue( tmpNPC[i], EM_RoleValue_OrgID ) == 106794 then
				objnum = objnum +1
			end
		end
		if objnum >0 then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
			CloseSpeak(OwnerID());
		else
			local tx,ty,tz,tdir 
				tx=ReadRoleValue( TargetID(),EM_RoleValue_X);
				ty=ReadRoleValue( TargetID(),EM_RoleValue_Y);
				tz=ReadRoleValue( TargetID(),EM_RoleValue_Z);
				tdir=ReadRoleValue(TargetID(),EM_RoleValue_Dir);
			obj = CreateObj( 106794, tx, ty, tz, tdir,1 )
			SetFightMode ( obj, 0, 0, 0,0 ) 
			SetModeEx( obj, EM_SetModeType_Show, false )
			SetModeEx( obj, EM_SetModeType_Mark, false )
			AddToPartition( obj, 0 )
			CallPlot( obj, "LuaP_425476_2",obj )
		end
end
function LuaP_425476_2( O_ID )
	local QuestID = 425476				--任務編號
	local FinishFlagID = 546487			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 150				--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID)
		ActorArray[1] =CreateObj_ByObjPoint( O_ID, 120513, "p_down" )	--表演用吉兒
		ActorArray[2] =CreateObjByFlag( 120474,780871,8,1 )		--表演用康葛斯．多瑞安
			SetModeEx(  ActorArray[1]  , EM_SetModeType_ShowRoleHead, true )	
			SetModeEx(  ActorArray[2]  , EM_SetModeType_ShowRoleHead, true )
			AddToPartition(ActorArray[1],RoomID)
			AddToPartition(ActorArray[2],RoomID)
	CallPlot( O_ID,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )	--表演開始
	--範圍看戲用的檢查函式
		SetDefIdleMotion( ActorArray[1],ruFUSION_MIME_EMOTE_TIRED )
			Sleep(20)
		Say(ActorArray[1],"[SC_425476_S02]" )
		SetDefIdleMotion( ActorArray[1],ruFUSION_MIME_CROUCH_BEGIN )
			Sleep(40)
		Say(ActorArray[1],"[SC_425476_S03]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S04]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S05]" )
			Sleep(40)
		Say(ActorArray[2],"[SC_425476_S06]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S07]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S08]" )
			Sleep(40)
		Say(ActorArray[1],"[SC_425476_S09]" )
			Sleep(10)
		Say(ActorArray[2],"[SC_425476_S10]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S11]" )
			Sleep(40)
		Say(ActorArray[2],"[SC_425476_S12]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S13]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S14]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S15]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S16]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S17]" )
			Sleep(30)
		PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(ActorArray[2],"[SC_425476_S18]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S19]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S20]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S21]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S22]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S21]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S23]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S24]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S21]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S25]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S26]" )
			Sleep(30)
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end
--判斷是否給予稱號
function lua_Z23Q425476_1()
	Setflag(OwnerID(),546484,1)
end
--任務425477，摩瑞克對話劇情
function lua_z23q425477_Morrok()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425477)==true and CheckFlag(OwnerID(),546488)==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425477_S1"), "lua_z23q425477_Morrok1" ,0)
	end
	if ReadRoleValue(TargetID(),EM_RoleValue_Register1)==0 then
		CallPlot(TargetID(),"lua_z23CheckObjIRU_A",0)
	end
end 
function lua_z23CheckObjIRU_A()
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1 )
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj = CreateObj(106794,x,y,z,dir,1)
			SetModeEx( obj  , EM_SetModeType_Show, false )
			SetModeEx( obj  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( obj  , EM_SetModeType_Move, false )--移動
			SetModeEx( obj  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( obj  , EM_SetModeType_Searchenemy, false )--索敵
		AddToPartition( obj,0 )
		CallPlot( obj,"lua_z23CheckObjIRU_B",0)
end
function lua_z23CheckObjIRU_B()
	local time =0 
	local num =0
	while true do
		local NPC = SearchRangeNPC( OwnerID(),50 )
		for i=0,#NPC-1 do
			if ReadRoleValue( NPC[i],EM_RoleValue_OrgID )==120514 then
				num=num+1
			end
		end
		if num==0 then
			time=time+1
		else
			time=0
		end
		if time ==6 then
			local obj =CreateObj(120514,-7723,720,-16395,220,1)
			AddToPartition(obj,0)
			time=0
		end
		num = 0
		Sleep(50)
	end
end
function lua_z23q425477_Morrok1()
	SetSpeakDetail( OwnerID(), "[SC_425477_C1]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425477_S2"), "lua_z23q425477_Morrok2" ,0)
end
function lua_z23q425477_Morrok2()
	SetFlag(OwnerID(),546488,1)
	SetSpeakDetail( OwnerID(), "[SC_425477_C2]" ); 
end

--任務425477，人王對話劇情
function lua_z23q425477_Kingdom()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425477)==true and CheckFlag(OwnerID(),546489)==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425477_S1"), "lua_z23q425477_Kingdom1" ,0)
	end
end 
function lua_z23q425477_Kingdom1()
	SetSpeakDetail( OwnerID(), "[SC_425477_C3]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425477_S2"), "lua_z23q425477_Kingdom2" ,0)
end
function lua_z23q425477_Kingdom2()
	SetFlag(OwnerID(),546489,1)
	SetSpeakDetail( OwnerID(), "[SC_425477_C4]" ); 
end

--任務425478 年輕的真龍使者
--接任務後觸發龍飛下的劇情
function lua_z23q425478_onaccept()
	--不重覆觸發
	--R1值=1 =>龍飛下的劇情，玩家尚可接任務。
	--R1值=2 =>劇情正在表演中，玩家接任務會被提示。
	if ReadRoleValue( OwnerID(),EM_RoleValue_Register1 )==1 then
		return
	elseif ReadRoleValue( OwnerID(),EM_RoleValue_Register1 )==2 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_Z23Q425478_00]",C_SYSTEM); 
	else
		WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1 );
		BeginPlot( OwnerID() , "lua_z23q120758_start" , 0 );
	end
end

function lua_z23q120758_start()	--龍飛下的劇情
	local FlagID=780871
	local Actor=CreateObjByFlag( 120758, FlagID, 2, 1 )
	local Actor2=CreateObjByFlag( 120794, FlagID, 3, 1 )
		WriteRoleValue( Actor2, EM_RoleValue_IsWalk,1 )
		SetDefIdleMotion( Actor2,ruFUSION_MIME_IDLE_CROUCH)
		SetModeEx( Actor , EM_SetModeType_Gravity , false )
		SetDefIdleMotion( Actor,ruFUSION_MIME_SPIRAL_LOOP )
		AddToPartition(Actor,0)
		MoveToFlagEnabled( Actor2, false )
		LuaFunc_MoveToFlag( Actor,FlagID,3,1)
		SetDefIdleMotion( Actor,ruFUSION_ACTORSTATE_CAST_SP02 )
		Sleep(20)
		AddBuff(Actor,622610,0,30)
		PlayMotion(Actor,215)
		AddToPartition(Actor2,0)
		DelObj(Actor)
		Sleep(10)
		Show(Actor2,0)
		Sleep(10)
		PlayMotion(Actor2,150)
		SetModeEx( Actor2,EM_SetModeType_Mark,false )
		SetDefIdleMotion( Actor2,ruFUSION_MIME_IDLE_STAND)
		Sleep(10)
		LuaFunc_MoveToFlag( Actor2,FlagID,4,1)
		MoveToFlagEnabled( Actor2, false )
		Sleep(30)
		CallPlot(OwnerID(),"LuaS_z23q425478_2",Actor2)
end

function LuaS_z23q425478_2(Actor2)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,2)
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 425478				--任務編號
	local FinishFlagID = 546492				--完成任務獲得的旗標
	local CheckBuffID = 507178				--檢查是否正在演戲的BUFF
	local CheckRange = 150				--演戲的檢查範圍
	local ActorArray = {}					--(新版修改)演員陣列表
--	local PlayMusicID="music/dungeon/Pesche/ethno_10_TSI_wide_sands.mp3"
		ActorArray[1] =CreateObj_ByObjPoint(O_ID,120710,"p_down" )	--表演用卡拉維
		ActorArray[4] =Actor2							--表演用穎克兒
	local AcArray=SearchRangeNPC(O_ID,100);	
		for i=0,table.getn(AcArray),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==120759 then		--表演用摩瑞克
				ActorArray[2] =CreateObj_ByObjPoint(AcArray[i],120712,"p_down" )
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==120760 then		--表演用老卡爾
				ActorArray[3] =CreateObj_ByObjPoint(AcArray[i],120718,"p_down" )
			end
		end
		SetModeEx( ActorArray[1],EM_SetModeType_Mark,false )
		SetModeEx( ActorArray[2],EM_SetModeType_Mark,false )
		SetModeEx( ActorArray[3],EM_SetModeType_Mark,false )
		AddToPartition(ActorArray[1],0)
		AddToPartition(ActorArray[2],0)
		AddToPartition(ActorArray[3],0)
	--範圍看戲用的檢查函式
	CallPlot( O_ID,"Ag_QuestS",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )
		Sleep(20)
		Say(ActorArray[3],"[SC_Z23Q425478_01]" )--Tista-aq e`erra Jena , Kistaerra Garfe rotei va-arna(真言)。
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_02]" )--謝謝你，人類的法師。
		Sleep(10)
		Say(Actor2,"[SC_Z23Q425478_03]" )--雖然我並不介意。
		Sleep(10)
		Say(Actor2,"[SC_Z23Q425478_04]" )--但龍族其實並不喜歡與非龍族使用真言交流。
		Sleep(30)
		Say(ActorArray[3],"[SC_Z23Q425478_05]" )--原來如此，看來是我太自大了些。
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_06]" )--我們根直接的面對問題吧。
		Sleep(10)
		PlayMotion(Actor2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(Actor2,"[SC_Z23Q425478_07]" )--我是[120715]。
		Sleep(20)
		Say(Actor2,"[SC_Z23Q425478_08]" )--我前來這裡，是受光之神使邦克雷姆斯的指令而來。
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_09]" )--邀約聯盟人王、龍族使者與輔佐人王的康葛斯．多瑞安先生與會。
		Sleep(40)
		Say(Actor2,"[SC_Z23Q425478_10]" )--到時候眾龍領袖都會參與這個會議。
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_11]" )--請諸位妥善準備後，前往平衡聖所的方向。
		Sleep(30)
		Say(ActorArray[2],"[SC_Z23Q425478_12]" )--感謝你，我們已經收受到龍族的邀請。
		Sleep(30)
		PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(ActorArray[2],"[SC_Z23Q425478_13]" )--但我們參與會議的人員可能有變。
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_14]" )--變動？其理由為何？
		Sleep(20)
		Say(Actor2,"[SC_Z23Q425478_15]" )--我想到達龍的聖所。
		Sleep(20)
		PlayMotion(Actor2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(Actor2,"[SC_Z23Q425478_16]" )--並沒有增派人員保護的必要。
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_18]" )--這是龍族邀約的會議
		Sleep(20)
		Say(Actor2,"[SC_Z23Q425478_19]" )--只是希望聯盟方也同樣重視，
		Sleep(20)
		Say(Actor2,"[SC_Z23Q425478_20]" )--參與會議的希望是足以影響這個戰略的人員。
		Sleep(30)
		PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(ActorArray[1],"[SC_Z23Q425478_21]" )--是，我們了解了。
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_22]" )--變動的事我會帶為轉達，到時候我會在聖所前面迎接各位。
		Sleep(10)
		local Actor=CreateObjByFlag( 120758, 780871, 5, 1 )	--龍型
		LuaFunc_MoveToFlag( Actor2,780871,5,1)
		SetDefIdleMotion( Actor2,ruFUSION_MIME_IDLE_CROUCH)
		Hide(Actor2)
		AddToPartition(Actor,0)
		SetModeEx( Actor , EM_SetModeType_Gravity , false )
		SetDefIdleMotion( Actor,ruFUSION_ACTORSTATE_CAST_SP02 )
		Sleep(20)
		DelObj(Actor)
		
		Ag_QuestEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end
function lua_z23q120758_end()	--龍離去
	local FlagID=780871
	local Actor=CreateObjByFlag( 120758, FlagID, 5, 1 )	--龍型
		LuaFunc_MoveToFlag( OwnerID(),FlagID,5,1)
		SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_CROUCH)
		Hide(OwnerID())
		AddToPartition(Actor,0)
		SetModeEx( Actor , EM_SetModeType_Gravity , false )
		SetDefIdleMotion( Actor,ruFUSION_ACTORSTATE_CAST_SP02 )
		Sleep(30)
		DelObj(Actor)
		DelObj(OwnerID())
		DebugMsg(0,0,"del")
end

function lua_z23_mounstplaymotion1()
	local num=rand(3)
		if num==0 then
			PlayMotion(OwnerID(),20)
		elseif num==1 then
			PlayMotion(OwnerID(),84)
		else
			PlayMotion(OwnerID(),164)
		end
end

--偷來用，重置中控，並且將R1寫回0
--20130329修改為表演中斷就刪掉自己
function Ag_QuestS1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )--範圍玩家任務劇情開始播放
	local player = {}
	local Ctrl = OwnerID()
	local allplayer = SearchRangePlayer( Ctrl, CheckRange )	

	for i=0, table.getn(allplayer)-1 do--符合條件 給予演戲用Buff
		if	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and 
			CheckBuff( allplayer[i], CheckBuffID ) ~= true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			
			AddBuff( allplayer[i], CheckBuffID, 0, -1 )--給予檢查			
			table.insert( player, allplayer[i] )
		end
	end
	DebugMsg(0,0, "Count = "..table.getn(player))
	while true do
		for i= 1, table.getn(player) do
			if player[i] ~= nil and CheckID(player[i]) == true and  
				( CheckAcceptQuest( player[i], QuestID ) ~= true or --檢查有無任務
				CheckBuff( player[i], CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player[i], FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player[i], Ctrl, CheckRange ) ~= true ) then --檢查是否超過檢查範圍
				
				CancelBuff( player[i], CheckBuffID )
				table.remove(player, i)							
			end
		end
		--DebugMsg(0,0, "Count = "..table.getn(player))
		if table.getn(player) == 0 then
			--DebugMsg(0,0,"Del")
			for i=1, table.getn(ActorArray ) do--刪除演員
				if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
			end
			DelObj( Ctrl )
			break
		end
		sleep(20)
	end	
end

function Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, Ctrl )--範圍玩家任務劇情結束給予重要旗標
	Ctrl = Ctrl or OwnerID()
	local player = SearchRangePlayer ( Ctrl, CheckRange ) 	

		for i=0, table.getn(player )-1 do--清除演戲Buff
			if	CheckID(player[i]) == true and  
				CheckAcceptQuest( player[i], QuestID ) == true and 
				CheckBuff( player[i] , CheckBuffID ) == true and 
				CheckFlag( player[i], FinishFlagID ) ~= true then
			
				if FinishFlagID ~= nil then SetFlag( player[i], FinishFlagID, 1 ) end
				CancelBuff( player[i], CheckBuffID )
			end
		end

		for i=1, table.getn(ActorArray ) do--刪除演員
			if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
		end
		DelObj( Ctrl ) --刪除中控
end
--任務425479
function luaZ23Q425479_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425479)==true and CountBodyItem(OwnerID(),241302)>=1 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z23Q425479_1]", "luaZ23Q425479_2", 0 );
	end
end
function luaZ23Q425479_2()
	SetSpeakDetail( OwnerID(),"[SC_Z23Q425479_2]" )
	DelBodyItem( OwnerID(),241302,1 )
	SetFlag( OwnerID(),546485,1 )
end
--給稱號，填板，任務善意的欺騙，表演完觸發
function lua_Z23Q425476_GiveTittle()
	if CheckFlag( TargetID(),546484 ) then
		GiveBodyItem ( TargetID(),530031,1 )
		SetFlag(TargetID(),546484,0)
	else
		GiveBodyItem ( TargetID(),530030,1 )
	end
end