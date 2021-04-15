function Lua_Dan_112698_5() 								        --我要報名音樂馬術競賽活動
	local Flag1 =	 CheckFlag(OwnerID()  , 542550)                                         --今天已完成隊長
--	local Flag2 =	 CheckFlag(OwnerID()  , 542527)                                         --第二次接任務
--	local Flag3 =	 CheckFlag(OwnerID()  , 542528)                                         --第三次接任務
	local SignFlag = CheckFlag(OwnerID()  , 542552)                                         --防止重覆報名
	local Protect  = CheckFlag(OwnerID()  , 542551)                                         --護衛旗標
	local Name = GetName( OwnerID() )
	local Name2 = GetName( TargetID())
	local clock = ClockRead( OwnerID() , EM_ClockValueType_NowTime )                        --倒數秒數
	local JohnPID = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) 
		if Flag1 == false then --今天還沒報名過
			if JohnPID == 5 then   --如果PID為5
				local A = ReadRoleValue(TargetID() , EM_RoleValue_Register+9)   
				CloseSpeak( OwnerID() ) 
				ScriptMessage( TargetID() , 0 , 1 , "[SC_DAN_112698_24]" , C_SYSTEM )
				ScriptMessage( TargetID() , 0 , 0 , "[SC_DAN_112698_24]" , C_SYSTEM )
				Sleep(10)
				ScriptMessage( TargetID() , 0 , 1 , "[SC_MUSICFES_RICING_TIME][$SETVAR1="..A.."]" , C_SYSTEM ) --距離再次報名時間還有[$VAR1]秒。
				ScriptMessage( TargetID() , 0 , 0 , "[SC_MUSICFES_RICING_TIME][$SETVAR1="..A.."]" , C_SYSTEM ) --距離再次報名時間還有[$VAR1]秒。
			elseif JohnPID == 0 then 
				if Protect == false then                                                                --報名護衛者不能報名隊長
					if SignFlag == false then 
							CloseSpeak( OwnerID() ) 
							WriteRoleValue( TargetID() , EM_RoleValue_PID , 5)
							BeginPlot(TargetID() , "Lua_mika_musicfes_PID5" , 0 )  --將npc pid設為5
							BeginPlot(TargetID() , "Lua_mika_musicfes_count" , 0 )  --倒數5分鐘
							ScriptMessage( TargetID(), 0, 1,  "[SC_DAN_112698_31][$SETVAR1="..Name.."]", C_SYSTEM ) -- 0 範圍內玩家都可聽到 ,  1 畫面中間訊息。
							ScriptMessage( TargetID(), 0, 0,  "[SC_DAN_112698_31][$SETVAR1="..Name.."]", C_SYSTEM ) -- 0 範圍內玩家都可聽到 ,  0 訊息欄。
							Sleep(10)
						--	ScriptMessage( TargetID(), 0, 1,  "[SC_DAN_112698_31]", C_SYSTEM ) -- 目前已有隊伍報名，請稍候再進行報名喔。
						--	ScriptMessage( TargetID(), 0, 0,  "[SC_DAN_112698_31]", C_SYSTEM ) -- 		   
							AddBuff(OwnerID(), 503212, 0, 900 )  --給予音樂Buff標記擁有音樂箱的人
							GiveBodyItem( OwnerID() , 204426  , 1 ) 	  				   --給音樂盒 
							GiveBodyItem( OwnerID() , 204604  , 1 ) 	  				   --給地理資訊
							SetFlag( OwnerID()  , 542552 , 1 )   						   --防止重覆報名flag
							SetFlag( OwnerID()  , 542520 , 1 )   --隊長旗標
							ClockOpen( OwnerID(), EM_ClockCheckValue_3 , 900, 900 , 0  , "LuaDan_112698_offline" , "LuaDan_112698_clock_close" ) --設定計時器開始,15分鐘
							ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_MUSICFES_CHECKPOINT01]", C_SYSTEM) -- 第一個簽哨點的位置為[ZONE_ALL_INSTANCE]門口，快組隊前往簽到吧！
							ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_MUSICFES_CHECKPOINT01]", C_SYSTEM ) 
					else 
						CloseSpeak( OwnerID() ) 
						ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112698_20]", C_SYSTEM) --趕快將音樂盒送給馬丁．路德吧！
						ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112698_20]", C_SYSTEM ) 
					end		
				else 
					CloseSpeak( OwnerID() ) 
					ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112698_23]", C_SYSTEM) --你已經報名協助隊長了喔！
					ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112698_23]", C_SYSTEM ) 
				end
			end
		else 
			CloseSpeak( OwnerID() ) 
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112756_6]", C_SYSTEM) --你今天已經完成此活動，請明天再繼續報名吧。
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112756_6]", C_SYSTEM ) 
		end

end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112698_8()--我要報名協助將音樂盒送達終點

	local SignFlag = CheckFlag(OwnerID()  , 542552)                                         --防止重覆報名
	local Protect  = CheckFlag(OwnerID()  , 542551)                                         --護衛旗標
	local finish = CheckFlag(OwnerID()  , 542527 )                                         --今天完成過護衛
	local Name = GetName( OwnerID() )
	local Name2 = GetName( TargetID())
--	local JohnPID = ReadRoleValue( TargetID() ,  EM_RoleValue_Register+7) 
	local count = 0
		if finish == false then
			if SignFlag == false then 
				if Protect == false  then 
					CloseSpeak( OwnerID() ) 
					ScriptMessage( TargetID(), 0, 2,  "[SC_DAN_112698_32][$SETVAR1="..Name.."]", 0 ) 
					ScriptMessage( TargetID(),0, 0, "[SC_DAN_112698_32][$SETVAR1="..Name.."]", 0 )
					AddBuff(OwnerID(), 503215, 0, 900 )  --給予音樂Buff標記護衛者
					SetFlag( OwnerID()  , 542552 , 1 ) --防止重覆報名
					SetFlag( OwnerID()  , 542551 , 1 ) --護衛旗標
					GiveBodyItem( OwnerID() , 204604  , 1 ) 	   --給地理資訊
					ClockOpen( OwnerID(), EM_ClockCheckValue_3 , 900, 900 , 0  , "LuaDan_112698_offline" , "LuaDan_112698_clock_close" ) --設定計時器開始,15分鐘
					ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_MUSICFES_CHECKPOINT01]", C_SYSTEM) -- 第一個簽哨點的位置為[ZONE_ALL_INSTANCE]門口，快組隊前往簽到吧！
					ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_MUSICFES_CHECKPOINT01]", C_SYSTEM ) 
				else
					CloseSpeak( OwnerID() ) 
					ScriptMessage( OwnerID(), OwnerID(), 1,"[QUEST_MSG_ALREADYDONE]", C_SYSTEM) -- 你已經完成此任務
					ScriptMessage( OwnerID(), OwnerID(), 0,"[QUEST_MSG_ALREADYDONE]", C_SYSTEM ) 
				end
			else 
				CloseSpeak( OwnerID() ) 
				ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112698_29]", C_SYSTEM) -- 你已經報名過了
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112698_29]", C_SYSTEM ) 
			end
		else 
			CloseSpeak( OwnerID() ) 
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112756_6]", C_SYSTEM) --你今天已經完成此活動，請明天再繼續報名吧。
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112756_6]", C_SYSTEM ) 
		end
end

function LuaDan_112698_offline()   --離線時執行劇情
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --音樂盒
	local Signpaper =  CountBodyItem( OwnerID() , 204526) --簽到卷
	local locationpapaer =  CountBodyItem( OwnerID() , 204604 ) --地理資訊
	local Player   = OwnerID()
	ClockClose( OwnerID() ) 	
	DelBodyItem(Player , 204426 , MusicBox) --收走玩家身上音樂盒
	DelBodyItem(Player , 204604 , locationpapaer) --收走玩家身上地理資訊
	DelBodyItem(Player , 204526, Signpaper ) --收走玩家身上簽到卷
	SetFlag( Player  , 542529 , 0 ) --第一個簽哨點
	SetFlag( Player  , 542548 , 0 )	--第二個簽哨點
	SetFlag( Player  , 542549 , 0 ) --第三個簽哨點
	SetFlag( Player  , 542448 , 0 ) --防止不斷產出怪或簽哨員   
	SetFlag( Player  , 542630 , 0 ) --再度生怪
	SetFlag( Player  , 542552 , 0 ) --防止重覆報名
	SetFlag( Player  , 542551,  0) --護衛旗標
	SetFlag( Player  , 542520,  0) --隊長旗標
	CancelBuff( OwnerID(), 501635)
	CancelBuff( OwnerID(), 503215)
	CancelBuff( OwnerID(), 503212)
end

function LuaDan_112698_clock_close()   --計時器時間到時執行劇情
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --音樂盒
	local Signpaper =  CountBodyItem( OwnerID() , 204526) --簽到卷
	local locationpapaer =  CountBodyItem( OwnerID() , 204604 ) --地理資訊
	local Player   = OwnerID()
	ClockClose( OwnerID() ) 	
	DelBodyItem(Player , 204426 , MusicBox) --收走玩家身上音樂盒
	DelBodyItem(Player , 204604 , locationpapaer) --收走玩家身上地理資訊
	DelBodyItem(Player , 204526, Signpaper ) --收走玩家身上簽到卷
	SetFlag( Player  , 542529 , 0 ) --第一個簽哨點
	SetFlag( Player  , 542548 , 0 )	--第二個簽哨點
	SetFlag( Player  , 542549 , 0 ) --第三個簽哨點
	SetFlag( Player  , 542448 , 0 ) --防止不斷產出怪或簽哨員   
	SetFlag( Player  , 542630 , 0 ) --再度生怪
	SetFlag( Player  , 542552 , 0 ) --防止重覆報名
	SetFlag( Player  , 542551,  0) --護衛旗標
	SetFlag( Player  , 542520,  0) --隊長旗標
	CancelBuff( OwnerID(), 501635)
	CancelBuff( OwnerID(), 503215)
	CancelBuff( OwnerID(), 503212)
	ScriptMessage( Player,  Player, 2, "[SC_DAN_112698_19]" , 0 )	--時間到！勇士們稍稍喘口氣吧！
end
---------------------------------------------------------------------------------------------------
function Lua_mika_musicfes_PID5()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 5)
	PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
--	Say(OwnerID(), PID)
end

function Lua_mika_musicfes_count() --時間倒數5分鐘 時間到歸零
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9,  300 )   -- TIME倒數 
	while true do
		AddRoleValue(OwnerID() , EM_RoleValue_Register+9,  -1 )    
		local A = ReadRoleValue(OwnerID() , EM_RoleValue_Register+9)   
--		Say(OwnerID(),A)
		if A == 0  then
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0)
--			Say(OwnerID(), "pid is 0")
			PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
	--		Say(OwnerID(), PID)
			break
		end
		sleep(10)
	end
end