function thanksgiving_transport_talk()
	SetSpeakDetail( OwnerID(), "[SC_TRANSPOT_TALK_1]" )--忙死了！忙死了！每次到了火雞節就亂成一鍋粥！正值火雞節城內正大擺宴席，需求大量的糧食，不過運送糧食的人手不夠，冒險者每天可以來我這裡協助徵收糧草一次，然後照工作成效給予一定的獎勵。
	if CheckFlag( OwnerID()  , 543463) ~= true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRANSPOT_TALK_2]" , "thanksgiving_transport_talk2", 0 ) --我想協助徵收糧草
	end
end
function thanksgiving_transport_talk2()
	SetSpeakDetail( OwnerID(), "[SC_TRANSPOT_TALK_3]" )--因為時間很趕，運送糧草的人員可以跟我租用座騎，[505068]跑速100％，租用需要3000金幣；[505069]跑速150％，租用需要一個[202903]，這兩種高速座騎都很好用，可以提高你的效率，但是要注意一點，就是高速奔馳下的座騎要注意[505016]，當[505016]到達到100時，該座騎會出現10秒鐘「[505014]」的狀態，要避免此狀態，就要在路途中經過一些[113920]， 只要從[113920]旁邊經過就可以降低些許[505016]。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRANSPOT_TALK_4]" , "thanksgiving_transport_start", 0 ) --我要用[505076]
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRANSPOT_TALK_5]" , "thanksgiving_transport_start1", 0 ) --我想用[505068]
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRANSPOT_TALK_6]" , "thanksgiving_transport_start2", 0 ) --我想用[505069]
end
function thanksgiving_transport_start()
	CloseSpeak(OwnerID())
	ClockClose(OwnerID())
	local Dis = GetDistance( OwnerID(), TargetID() )
	if Dis < 150 then
		BeginPlot(OwnerID(),"thanksgiving_transport_st_run",0)
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_422810_1]",0)	--距離太過遙遠，無法使用。
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_422810_1]",0)	--距離太過遙遠，無法使用。
	end
end
function thanksgiving_transport_st_run()	
	if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	end
	
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_TRANSPOT_TALK_4_1]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--資料送出有問題s
		return
	end
	for i = 0 , 30 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 30 then
			if ( SelectID == 0 ) then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )
				--開始計時
				if CheckFlag( OwnerID()  , 543463) ~= true then
					--取得運糧buff
					AddBuff(OwnerID(),505015,0,-1)
					--宣告個人積分、清空個人積分
					if THANKSGIVEINGTRAN ==nil then
						THANKSGIVEINGTRAN = {}
					end
					THANKSGIVEINGTRAN[DBID] = {}
					THANKSGIVEINGTRAN[DBID][1]=0
					THANKSGIVEINGTRAN[DBID][2]=0
					THANKSGIVEINGTRAN[DBID][3]=0	--紀錄是否領過獎勵
					--開始計時
						AddBuff(OwnerID(),505076,0,1800)
						--AddBuff(OwnerID(), 505016,4,-1)
						SetFlag( OwnerID()  , 543463 , 1 )
						ClockOpen( OwnerID() , EM_ClockCheckValue_10  , 300 , 300 , 0  ,"Lua_thanksgiving_Out_ending"  , "Lua_thanksgiving_ending" );--時間以秒算
					--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID][1])
					Debuglog(2 , "THANKSGIVEINGTRAN3 = "..THANKSGIVEINGTRAN[DBID][3])
				end

				break;
			elseif ( SelectID == 1 ) then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 30 then
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )	
			break
		end
	end
end
function thanksgiving_transport_start1()
	CloseSpeak(OwnerID())
	ClockClose(OwnerID())
	local Dis = GetDistance( OwnerID(), TargetID() )
	if Dis < 150 then
		BeginPlot(OwnerID(),"thanksgiving_transport_st1_run",0)
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_422810_1]",0)	--距離太過遙遠，無法使用。
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_422810_1]",0)	--距離太過遙遠，無法使用。
	end
end
function thanksgiving_transport_st1_run()
	if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	end

	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)	
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_TRANSPOT_TALK_5_1]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--資料送出有問題s
		return
	end
	for i = 0 , 30 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 30 then
			if ( SelectID == 0 ) then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )
				--開始計時
				if CheckFlag( OwnerID()  , 543463) ~= true then
					--宣告個人積分、清空個人積分
					if THANKSGIVEINGTRAN ==nil then
						THANKSGIVEINGTRAN = {}
					end
					THANKSGIVEINGTRAN[DBID] = {}
					THANKSGIVEINGTRAN[DBID][1]=0
					THANKSGIVEINGTRAN[DBID][2]=0
					THANKSGIVEINGTRAN[DBID][3]=0--紀錄是否領過獎勵
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money  ) >= 3000 then
		 				AddMoney( OwnerID() ,  EM_ActionType_PlotDestory , -3000 )
						--取得運糧buff、獲得騎乘火雞技能
						AddBuff(OwnerID(),505015,0,-1)
						AddBuff(OwnerID(),505068,0,1800)
						--AddBuff(OwnerID(), 505016,4,-1)
						SetFlag( OwnerID()  , 543463 , 1 )
						ClockOpen( OwnerID() , EM_ClockCheckValue_10  , 300 , 300 , 0  ,"Lua_thanksgiving_Out_ending"  , "Lua_thanksgiving_ending" );--時間以秒算
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TALK_7]", C_SYSTEM ); --/*很抱歉，你準備的金額不足。
						--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID])
						Debuglog(2 , "THANKSGIVEINGTRAN3 = "..THANKSGIVEINGTRAN[DBID][3])
					else
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111454_20]", 0 ); --/*很抱歉，你準備的金額不足。
					end
				end
				break;
			elseif ( SelectID == 1 ) then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 30 then
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )	
			break
		end
	end

end

function thanksgiving_transport_start2()
	CloseSpeak(OwnerID())
	ClockClose(OwnerID())
	local Dis = GetDistance( OwnerID(), TargetID() )
	if Dis < 150 then
		BeginPlot(OwnerID(),"thanksgiving_transport_st2_run",0)
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_422810_1]",0)	--距離太過遙遠，無法使用。
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_422810_1]",0)	--距離太過遙遠，無法使用。
	end
end

function thanksgiving_transport_st2_run()
	if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	end

	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_TRANSPOT_TALK_6_1]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--資料送出有問題
		return
	end
	for i = 0 , 30 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 30 then
			if ( SelectID == 0 ) then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )
				--開始計時
				if CheckFlag( OwnerID()  , 543463) ~= true then
					--宣告個人積分、清空個人積分
					if THANKSGIVEINGTRAN ==nil then
						THANKSGIVEINGTRAN = {}
					end
					THANKSGIVEINGTRAN[DBID] = {}
					THANKSGIVEINGTRAN[DBID][1]=0
					THANKSGIVEINGTRAN[DBID][2]=0
					THANKSGIVEINGTRAN[DBID][3]=0--紀錄是否領過獎勵
					if CountBodyItem(OwnerID(),202903) >= 1 then
						DelBodyItem(OwnerID(),202903,1)
						--取得運糧buff、獲得騎乘火雞技能
						AddBuff(OwnerID(),505015,0,-1)
						AddBuff(OwnerID(),505069,0,1800)
						--GiveBodyItem(OwnerID(),206319,1)
						SetFlag( OwnerID()  , 543463 , 1 )
						ClockOpen( OwnerID() , EM_ClockCheckValue_10  , 300 , 300 , 0  ,"Lua_thanksgiving_Out_ending"  , "Lua_thanksgiving_ending" );--時間以秒算
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TALK_7]", C_SYSTEM ); --/*很抱歉，你準備的金額不足。
						--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID][1])
						Debuglog(2 , "THANKSGIVEINGTRAN3 = "..THANKSGIVEINGTRAN[DBID][3])
					else
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112502_NO]", 0 ); --/*你持有的物品數量不足喔！
					end
				end
				break;
			elseif ( SelectID == 1 ) then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 30 then
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )	
			break
		end
	end
end
function Lua_thanksgiving_ending()
	ClockClose(OwnerID())
	CancelBuff(OwnerID(),505016)
	CancelBuff(OwnerID(),505076)
	CancelBuff(OwnerID(),505068)
	CancelBuff(OwnerID(),505069)
	CancelBuff(OwnerID(),505017)
	CancelBuff(OwnerID(),505018)
	CancelBuff(OwnerID(),505019)
	thanksgiving_transport_finish()
	--BeginPlot(OwnerID(),"thanksgiving_transport_finish",0)
end
function Lua_thanksgiving_OutGame()
	CancelBuff_NoEvent(OwnerID(),505015)
	CancelBuff(OwnerID(),505016)
	CancelBuff(OwnerID(),505076)
	ClockClose(OwnerID())
end
function thanksgiving_transport_finish()
	CancelBuff_NoEvent(OwnerID(),505015)
	--結算分數
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	local Score = THANKSGIVEINGTRAN[DBID][1]
	local ticketID = 206266
	local Gife = {2,3,4,5}
	--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID])[1]
	--給予獎勵
	if Score <= 30 then
		GiveBodyItem(OwnerID(),ticketID,Gife[1])
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[1].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*時間到，此次協助糧草徵收，你的積分為[$VAR1]，可以獲得[$VAR2]個[$VAR3]
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[1].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*時間到，此次協助糧草徵收，你的積分為[$VAR1]，可以獲得[$VAR2]個[$VAR3]
	elseif Score <= 50 then
		GiveBodyItem(OwnerID(),ticketID,Gife[2])
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[2].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*時間到，此次協助糧草徵收，你的積分為[$VAR1]，可以獲得[$VAR2]個[$VAR3]
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[2].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*時間到，此次協助糧草徵收，你的積分為[$VAR1]，可以獲得[$VAR2]個[$VAR3]
	elseif Score <= 99 then
		GiveBodyItem(OwnerID(),ticketID,Gife[3])
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[3].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*時間到，此次協助糧草徵收，你的積分為[$VAR1]，可以獲得[$VAR2]個[$VAR3]
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[3].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*時間到，此次協助糧草徵收，你的積分為[$VAR1]，可以獲得[$VAR2]個[$VAR3]
	elseif Score >= 100 then
		GiveBodyItem(OwnerID(),ticketID,Gife[4])
		GiveBodyItem(OwnerID(),206308,1)
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[4].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*時間到，此次協助糧草徵收，你的積分為[$VAR1]，可以獲得[$VAR2]個[$VAR3]
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_TIMEUP][$SETVAR1="..Score.."][$SETVAR2="..Gife[4].."][$SETVAR3=".."["..ticketID.."]".."]", C_SYSTEM ); --/*時間到，此次協助糧草徵收，你的積分為[$VAR1]，可以獲得[$VAR2]個[$VAR3]
	end
	Debuglog(2 , "Write THANKSGIVEINGTRAN3 to 1 #######################")
	THANKSGIVEINGTRAN[DBID][1] = 0
	THANKSGIVEINGTRAN[DBID][2] = 1
	THANKSGIVEINGTRAN[DBID][3] = 1
end
function Luatg_transport_take_range()
	--Say(OwnerID(),"CheckBuff...")
	--檢查是否有運糧buff、且尚未取得糧食
	local NPCID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local BuffOK = 0
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		--Say(OwnerID(),"BuffID = "..BuffID)
		if BuffID == 505015 then
			BuffOK = BuffOK + 1
			--Say(OwnerID(),"BuffID = "..BuffID.." BuffOk = "..BuffOk)
		end
		if BuffID == 505017 or BuffID == 505018 or BuffID == 505019 then
			BuffOK = BuffOK + 1
			--Say(OwnerID(),"BuffID = "..BuffID.." BuffOk = "..BuffOk)
		end
	end
	--Say(OwnerID(),"BuffOk = "..BuffOk)
	if BuffOk == 1 then
		--動作投擲糧草
		--Say(OwnerID(),"Casting")
		CastSpell(TargetID(),OwnerID(),494454)
		--取得糧食
		if  NPCID == 113766 then
			--505017
			AddBuff(OwnerID(), 505017,0,-1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_GETFOOD]", C_SYSTEM ); --/*你取得了一袋糧食
		elseif  NPCID == 113767 then
			--505018
			AddBuff(OwnerID(), 505018,0,-1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_GETFOOD]", C_SYSTEM ); --/*你取得了一袋糧食
		elseif  NPCID == 113768 then
			--505019
			AddBuff(OwnerID(), 505019,0,-1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_GETFOOD]", C_SYSTEM ); --/*你取得了一袋糧食
		else
			--Say(OwnerID(),"NoBuff")
		end
	elseif BuffOk >= 2 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_TAKE_ALREADY]", C_SYSTEM ); --/*你已經攜帶了一份糧草
	end
end
function Luatg_transport_back_range()
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	--Say(OwnerID(),"THANKSGIVEINGTRAN = "..THANKSGIVEINGTRAN[DBID][2])
	if THANKSGIVEINGTRAN ~= nil then
		if THANKSGIVEINGTRAN[DBID] ~= nil then
			if THANKSGIVEINGTRAN[DBID][2] == 0 then
				local BuffKind = 0
				--檢查是否取得糧食
				local BuffType = 0
				local Count = BuffCount ( OwnerID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
					if BuffID == 505015 then
						BuffKind = BuffKind + 1
					elseif BuffID == 505017 then
						--收回糧食
						--Say(OwnerID(),"Casting..17")
						CastSpell(OwnerID(),TargetID(),494454)
						CancelBuff(OwnerID(),505017)
						--增加積分
						local Score = 2
						BuffKind = BuffKind + 1
						THANKSGIVEINGTRAN[DBID][1] = THANKSGIVEINGTRAN[DBID][1] + Score
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505017]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*你送回了[$VAR1]，積分提高[$VAR2]，你現在的積分是[$VAR3]
						ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505017]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*你送回了[$VAR1]，積分提高[$VAR2]，你現在的積分是[$VAR3]
					elseif BuffID == 505018 then
						--收回糧食
						--Say(OwnerID(),"Casting..18")
						CastSpell(OwnerID(),TargetID(),494454)
						CancelBuff(OwnerID(),505018)
						--增加積分
						local Score = 5
						BuffKind = BuffKind + 1
						THANKSGIVEINGTRAN[DBID][1] = THANKSGIVEINGTRAN[DBID][1] + Score
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505018]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*你送回了[$VAR1]，積分提高[$VAR2]，你現在的積分是[$VAR3]
						ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505018]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*你送回了[$VAR1]，積分提高[$VAR2]，你現在的積分是[$VAR3]
					elseif BuffID == 505019 then		
						--收回糧食
						--Say(OwnerID(),"Casting..19")
						CastSpell(OwnerID(),TargetID(),494454)
						CancelBuff(OwnerID(),505019)
						--增加積分
						local Score = 10
						BuffKind = BuffKind + 1
						THANKSGIVEINGTRAN[DBID][1] = THANKSGIVEINGTRAN[DBID][1] + Score
						ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505019]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*你送回了[$VAR1]，積分提高[$VAR2]，你現在的積分是[$VAR3]
						ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_BACK_FOOD][$SETVAR1=".."[505019]".."][$SETVAR2="..Score.."][$SETVAR3="..THANKSGIVEINGTRAN[DBID][1].."]", C_SYSTEM ); --/*你送回了[$VAR1]，積分提高[$VAR2]，你現在的積分是[$VAR3]
					end
				end
				if BuffKind == 1 then
					ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_BACK_HERRYUP]", C_SYSTEM ); --/*把握時間，趕快去找各農場的特派員
				end
			end
		end
	end
end
function Luatg_transport_eat_range()
	--Say(OwnerID(),"drinking")
	--檢查是否有疲勞度buff、減少疲勞度
	local BuffOK = 0
	local BuffType = 0
	local BuffClear = 0
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505016 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if (BuffLv-30) >= 4 then
				CancelBuff(OwnerID(),BuffID)
				AddBuff(OwnerID(), BuffID,(BuffLv-30),-1)
				BuffClear = BuffClear +1
				break
			else 
				CancelBuff(OwnerID(),BuffID)
				AddBuff(OwnerID(), BuffID,4,-1)
				BuffClear = BuffClear +1
				break
			end
		end
	end
	if BuffClear > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_EATING]", 0 ); --/*你的座騎疲勞度下降了許多
	end
end
function Luatg_transport_take()
	AddBuff(OwnerID(),503217,0,-1)
	SetPlot(OwnerID(),"Range","Luatg_transport_take_range",150)
end
function Luatg_transport_back()
	AddBuff(OwnerID(),503217,0,-1)
	SetPlot(OwnerID(),"Range","Luatg_transport_back_range",150)
end
function Luatg_transport_eat()
	SetPlot(OwnerID(),"Range","Luatg_transport_eat_range",70)
end
function thanksgiving_CheckBuff()
	AddBuff(OwnerID(), 505016,4,-1)
end
function thanksgiving_AddBuff()
	local BuffType = 0
	local BuffAdd = 0
	local BuffRide = 0
	local BuffNoRide = 0
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		--Say(OwnerID(),"BuffID = "..BuffID)
		if BuffID == 505016 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv >= 99 then
				CancelBuff(OwnerID(),BuffID)
				AddBuff(OwnerID(), 505014,0,10)
				AddBuff(OwnerID(), 505016,4,-1)
			else
				AddBuff(OwnerID(), 505016,4,-1)
			end
			BuffAdd = BuffAdd +1
		elseif BuffID == 505015 then
			BuffRide = BuffRide +1
		elseif BuffID == 505068 or BuffID == 505076 then
			BuffNoRide = BuffNoRide + 1
		end
	end
	--Say(OwnerID(),"BuffAdd = "..BuffAdd)
	if BuffAdd == 0 then
		AddBuff(OwnerID(), 505016,4,-1)
	end
	if BuffNoRide == 0 then
		CancelBuff(OwnerID(),505016)
	end
	if BuffRide == 0 then
		CancelBuff(OwnerID(),505076)
		CancelBuff(OwnerID(),505017)
		CancelBuff(OwnerID(),505018)
		CancelBuff(OwnerID(),505019)
	end
end

function Lua_thanksgiving_Out_ending()
	ClockClose(OwnerID())
	CancelBuff(OwnerID(),505016)
	CancelBuff(OwnerID(),505076)
	CancelBuff(OwnerID(),505068)
	CancelBuff(OwnerID(),505069)
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
--	Say(OwnerID(),"Buff Gone,ZoneID = "..ZoneID)
	Debuglog(2 , " OUT END ZoneID = "..ZoneID)
--	if THANKSGIVEINGTRAN[DBID][3] == 0 then	--沒領過
		if ZoneID == 2 then
		--	local BuffOK = 0
		--	local Count = BuffCount ( OwnerID())
		--	for i = 0 , Count do
		--		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
				--Say(OwnerID(),"BuffID = "..BuffID)
		--		if BuffID == 505015 then
		--			BuffOK = BuffOK + 1
		--			Debuglog(2 , "BuffID = "..BuffID.." BuffOk = "..BuffOk)
					--Say(OwnerID(),"BuffID = "..BuffID.." BuffOk = "..BuffOk)
		--		end
		--	end
		--	if BuffOK == 0 then
				Debuglog(2 , "Buff is Gone !!!!!!!!!!!!!!!!!!!!!!")
				CancelBuff(OwnerID(),505016)
				CancelBuff(OwnerID(),505076)
				CancelBuff(OwnerID(),505017)
				CancelBuff(OwnerID(),505018)
				CancelBuff(OwnerID(),505019)
				CancelBuff(OwnerID(),505015)
				GiveBodyItem(OwnerID(),206266,1)
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_OUTGAMEGIVEUP][$SETVAR1=".."[206266]".."]", C_SYSTEM ); --/*你在活動進行中離開遊戲，任務失敗，僅得到1個[$VAR1]
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_OUTGAMEGIVEUP][$SETVAR1=".."[206266]".."]", C_SYSTEM ); --/*你在活動進行中離開遊戲，任務失敗，僅得到1個[$VAR1]
		--	end
			Debuglog(2 , "Write THANKSGIVEINGTRAN3 to 1 #######################")
			THANKSGIVEINGTRAN[DBID][1] = 0
			THANKSGIVEINGTRAN[DBID][2] = 1
			THANKSGIVEINGTRAN[DBID][3] = 1
		else
			Debuglog(2 , "Buff is Gone and Wrong Zone!!!!!!!!!!!!!!!!!!!!!!")
			ClockClose(OwnerID())
			CancelBuff(OwnerID(),505016)
			CancelBuff(OwnerID(),505076)
			CancelBuff(OwnerID(),505017)
			CancelBuff(OwnerID(),505018)
			CancelBuff(OwnerID(),505019)
			CancelBuff(OwnerID(),505015)
			GiveBodyItem(OwnerID(),206266,1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_TRANSPOT_OUTGIVEUP][$SETVAR1=".."[206266]".."]", C_SYSTEM ); --/*你在活動進行中離開了銀湧之野，任務失敗，僅得到1個[$VAR1]
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_TRANSPOT_OUTGIVEUP][$SETVAR1=".."[206266]".."]", C_SYSTEM ); --/*你在活動進行中離開了銀湧之野，任務失敗，僅得到1個[$VAR1]
		end
--	end
end