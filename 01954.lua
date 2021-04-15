----423368--115952點擊前檢查：
function LuaS_423368()
	if	(CheckAcceptQuest(OwnerID(),423368)==true )and( CheckCompleteQuest( OwnerID(),423368)==false) and	CheckFlag( OwnerID() , 544290 ) ==false	then
			if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
				if	CountBodyItem(OwnerID(),207729) > 0 	then
					return true
				else
					ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423368_0]",0) --你身上沒有初生樹！
					ScriptMessage(OwnerID(),OwnerID(), 0, "[SC_423368_0]",0) --你身上沒有初生樹！
					return false
				end	
			else
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			--目標正在忙碌中
			return false
			end
		else
		return false
	end
end

--點擊後演戲：
function LuaS_423368_after()

	if 	CheckAcceptQuest( OwnerID() , 423368) == true		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(OwnerID() , 544234, 1 )						--544299判斷距離用		
		AddBuff(OwnerID() , 507206 , 1 , 120)  						
	end

	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
	DelBodyItem(OwnerID(), 207729, 1 )							

	local WATER= LuaFunc_CreateObjByOBj(116013, TargetID() )				--出現演戲的土堆116013
	DisableQuest( WATER, true )
	WriteRoleValue( WATER,EM_RoleValue_Register+2,OwnerID())				--把玩家寫進由演戲土堆
	WriteRoleValue( WATER,EM_RoleValue_Register+3,TargetID())				--把原土堆寫進演戲土堆
	BeginPlot( WATER, "LuaS_423368_Range_CHECK" , 0 )					--掛演戲土堆迴圈檢查--玩家不在就刪除演戲土堆
	BeginPlot( WATER, "Lua_423368_end" , 0 )
	
	local TREE= Lua_DW_CreateObj("flag" ,116014,780655,1,1)				--種出觀賞用植物
	DisableQuest( TREE, true )
	WriteRoleValue(  TREE,EM_RoleValue_Register+3,WATER)				--把演戲土堆寫進演戲樹苗
	BeginPlot(  TREE, "Lua_423368_22" , 0 )

	return true
end


function LuaS_423368_Range_CHECK()
	local QWATER = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 120 , 1 do
		Num = 0
			if	CheckAcceptQuest( player , 423368) == true	and
				CheckFlag( player , 544234) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	Setposbyflag(player , 780694, 6 ) 							--傳送玩家回原地，旗子編號780694、6
	writerolevalue(QWATER , EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
end


function Lua_423368_22()
	local WATER= ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)			--演戲土堆
	for i = 0 , 120 , 1 do
		if	CheckID(WATER) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423368_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423368)==false )	then
		if 	CheckBuff( OwnerID(), 507206) == true	then
			CancelBuff( OwnerID() , 507206)  
		end
		return false
	end
	local ANT= {}
	ANT= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ANT)-1 do
		if	ReadRoleValue(ANT[i] , EM_RoleValue_OrgID) == 115953		then
			return false
		end
		if	i == table.getn(ANT)	then
			return true
		end
	end
end

function LuaS_423368_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507206)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544234, 0 )
end


function Lua_423368_end()
	sleep(10)
	local PLAY=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )
	local QWATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )	
	Setposbyflag(PLAY, 780655, 7 ) 							--傳送玩家，旗子編號780655、7
	
	local ANT = Lua_DW_CreateObj("flag" ,115953,780655,2,1)				--115953安特克羅、旗子編號780655、2
	DisableQuest(  ANT , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( ANT , false )
	WriteRoleValue(  ANT ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  ANT,EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲安特
	BeginPlot(  ANT, "Lua_423368_22" , 0 )						--掛安特迴圈檢查--WATER不在就刪除安特							
	AdjustFaceDir( PLAY, ANT, 0 )		

	local ELY = Lua_DW_CreateObj("flag" ,115965,780655,3,1)				--115965伊利雅爾、旗子編號780655、3
	DisableQuest(  ELY , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( ELY , false )
	WriteRoleValue(  ELY ,EM_RoleValue_IsWalk , 1 )
--	WriteRoleValue(  ANT,EM_RoleValue_Register+4,ELY)					--把演戲伊利寫進演戲土堆
	WriteRoleValue(  ELY,EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲伊利雅爾
	BeginPlot(  ELY	, "Lua_423368_22" , 0 )						--掛伊利迴圈檢查--演戲土堆不在就刪除伊利

	local IB = Lua_DW_CreateObj("flag" ,115963,780655,4,1)					--115963艾貝、旗子編號780655、4
	DisableQuest(  IB , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( IB , false )
	WriteRoleValue(  IB ,EM_RoleValue_IsWalk , 1 )
--	WriteRoleValue(  ANT,EM_RoleValue_Register+5,STAR)					--把艾貝寫進演戲安特
	WriteRoleValue(  IB,EM_RoleValue_Register+3,OwnerID())					--把演戲土堆寫進演戲艾貝
	BeginPlot(  IB	, "Lua_423368_22" , 0 )	


	local NI = Lua_DW_CreateObj("flag" ,115964,780655,5,1)					--115964妮克絲、旗子編號780655、5
	DisableQuest(  NI , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(NI , false )
	WriteRoleValue(  NI ,EM_RoleValue_IsWalk , 1 )
--	WriteRoleValue(  ANT,EM_RoleValue_Register+5,STAR)					--把妮克絲寫進演戲安特
	WriteRoleValue(  NI,EM_RoleValue_Register+3,OwnerID())					--把演戲安特寫進演戲妮克絲
	BeginPlot(  NI, "Lua_423368_22" , 0 )	
	CastSpell( NI  , NI   , 494399)

	local People = {}
	local amount = 8
	For i=1, amount  do
		sleep(5)	
		local R = Rand( 3 ) 
		if	R ==0	then
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 116060, 780700, 9 , 0 )  
				Lua_ObjDontTouch( People[i] )	
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)	
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 116061, 780700, 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			else
				People[i] = CreateObjByFlag( 116062, 780700, 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			end	
		elseif	R ==1	then	
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 116060, 780700, 9 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 116061, 780700, 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			else
				People[i] = CreateObjByFlag( 116062, 780700, 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			end	
		else
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 116060, 780700, 9 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 116061, 780700, 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			else
				People[i] = CreateObjByFlag( 116062, 780700, 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_423368_PeopleGo",0)
				WriteRoleValue(  People[i],EM_RoleValue_Register+4,ANT )				--把演戲安特寫進演戲眾精靈
				WriteRoleValue(  People[i],EM_RoleValue_Register+3,OwnerID())				--把演戲土堆寫進演戲眾精靈
				BeginPlot(People[i]	, "Lua_423368_22" , 0 )						--掛迴圈檢查
			end	
		end
	End
	local BODO = Lua_DW_CreateObj("flag" ,116015,780700,12,1)				--115966安特克羅、旗子編號780700、12
	SetModeEX( BODO , EM_SetModeType_Mark , false )
	CastSpell( BODO  , BODO   , 494399)	
	sleep(30)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423368_8]" , 3 )			--伊利：你們是否也感受到這股純粹的自然之力？
	sleep(20)
	CastSpell( NI  , NI   , 494399)
	CastSpell( BODO   , BODO    , 494399)
	sleep(10)	
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423368_9]" , 3 )			--伊利：安特克羅...我們的精靈王者，將我們從誘惑的桎梏囹圄中釋放。
	sleep(20)
	CastSpell( BODO    , BODO     , 494399)
	sleep(10)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell( ELY , "[SC_423368_10]" , 3 )			--伊利：繁星湧泉經歷蛻變，我們也獲得重生。
	sleep(20)
	CastSpell( BODO   , BODO    , 494399)
	Yell( People[1] , "[SC_423368_11]" , 3 )			--眾精靈
	For i=1, 8  do						--眾精靈下跪
		PlayMotionEX( People[i] , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	end
	PlayMotion( IB , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(10)
	CastSpell( BODO   , BODO    , 494399)
	CastSpell( NI  , NI  , 494399)
	Yell( ANT , "[SC_423368_1]" , 3 )			--安：丕變的地貌無法再承擔外力干擾，萬物順應自然，時間能治癒傷痕。
	sleep(20)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Yell( ELY , "[SC_423368_2]" , 3 )			--伊利：總有一天，這裡會恢復成原始古林的模樣，我承諾用畢生心力彌補造成的傷害。
	sleep(20)
	AdjustFaceDir( ANT , ELY , 0 )	
	sleep(10)	
	PlayMotion( ANT ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ANT , "[SC_423368_3]" , 3 )			--安：我將與妳一同守護他們。
	sleep(20)
	AdjustFaceDir( ANT , IB, 0 )				--<面向艾貝洛妮雅>
	CastSpell( ANT  , ANT  , 491276  )
	sleep(20)
	PlayMotion( ANT , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( ANT , "[SC_423368_4]" , 3 )			--安：[115963]，[ZONE_JYRNATHERIN_FOREST]剛從紊亂狀態中平息，我有必須留下的原因。
	sleep(20)
	Yell( ANT , "[SC_423368_7]" , 3 )			--安：封印之戰已經過去，精靈們不適合再有隔閡，請把我的隨身配劍帶回出征之所交給精靈王[112854]作為
	sleep(40)
	Yell( IB , "[SC_423368_5]" , 3 )			--艾貝洛妮雅：是！
	PlayMotion( IB , ruFUSION_ACTORSTATE_CROUCH_END)
	AddBuff( IB   , 501119, 1 , 10 )	
	For i=1, 8  do		
		AddBuff( People[i]  , 501119, 1 , 10 )	
	end
	sleep(10)
	BeginPlot(  IB , "Lua_423368_IBNI_MOVE" , 0 )	
	sleep(20)
	AdjustFaceDir( NI , ANT, 0 )				--<妮克絲獨角獸面向精靈王>
	sleep(10)
	Yell(NI , "[SC_423368_6]" , 3 )			--妮克絲獨角獸：感謝你們做的一切，我也會繼續守護這座森林、守護著你們...
	sleep(20)
	For i=1, 8  do
	PlayMotion( People[i] , ruFUSION_ACTORSTATE_CROUCH_END)
	end
	sleep(10)
	if	CheckFlag( PLAY , 544290 ) == false	then
		SetFlag( PLAY, 544290 , 1 )
	end
	if	CheckBuff( PLAY, 507206) == true	then
		CancelBuff( PLAY, 507206)  
	end
	DelObj(OwnerID())
	Setposbyflag(PLAY, 780694, 6 ) 							--傳送玩家回原地，旗子編號780694、6
	WriteRoleValue( QWATER  , EM_RoleValue_Register+1 , 0 )
end

function LuaS_423368_PeopleGo()
	local ANT= ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
	MoveToFlagEnabled(OwnerID(), false)
	LuaFunc_MoveToFlag(OwnerID() , 780700, ReadRoleValue(OwnerID(),EM_RoleValue_PID),0  )
	AdjustFaceDir( OwnerID(), ANT, 0 )	
end

function Lua_423368_IBNI_MOVE()
	LuaFunc_MoveToFlag(OwnerID(), 780655,6,0)		--<艾貝洛妮雅離去>
	sleep(20)
	DelObj(OwnerID())
end