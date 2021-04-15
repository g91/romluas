function Lua_Valentine_RunMessage_talk()
	SetSpeakDetail( OwnerID(), "[SC_VALENTINE_RUNMESSAGE0]"   )--你想要傳遞幸福嗎？給我5個情人節巧克力，我幫你將訊息傳達給所有玩家！
	AddSpeakOption( OwnerID(), OwnerID(), "[SC_VALENTINE_RUNMESSAGE1]" , "Lua_Valentine_RunMessage_talk2", 0 ) --我想要傳遞幸福！
end
function Lua_Valentine_RunMessage_talk2()
	if CountBodyItem( OwnerID() , 203023 ) >= 5 then
		BeginPlot(OwnerID(),"Lua_Valentine_RunMessage",0)
		CloseSpeak( OwnerID())
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE4]",0)
		CloseSpeak( OwnerID())
	end
end


function Lua_Valentine_RunMessage()
	local Setp = 0
	local TargetName = "";
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF	
		
		DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "[SC_VALENTINE_RUNMESSAGE_NAME]"); --請輸入想要傳遞訊息的對象？？
		DialogSelectStr( OwnerID() , "[SC_202800_2]" );
		DialogSelectStr( OwnerID() , "[SC_202800_3]" );

		if( DialogSendOpen( OwnerID() ) == false ) then 		
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return;
		end

		local SelectID = -2;

		for i = 0 , 600 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
				local CheckResult = DialogGetInputCheckResult( OwnerID() );
				if( CheckResult == 0 )then 
					-- 失敗, 有髒話
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE7]",0)	--你輸入的文字含有不雅文字。
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				elseif( CheckResult == 1 ) then
					-- 成功
					TargetName = DialogGetInputResult( OwnerID() );
					if string.len(TargetName) <= 32 then
						if( SelectID == 0 ) then
							CancelBuff( OwnerID(), 501570 );--最後清除BUFF
							DialogClose( OwnerID() )
							Setp = 1
							break
						end
					else
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE5]",0)	--你輸入的字數過多，無法為你傳遞訊息。
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end
			elseif i == 600 then
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_OVERTIME_MSG]",0)	
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end




	if Setp == 1 and CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "[SC_VALENTINE_RUNMESSAGE2]"); --請輸入你想要傳達的訊息？
		DialogSelectStr( OwnerID() , "[SC_202800_2]" );
		DialogSelectStr( OwnerID() , "[SC_202800_3]" );

		if( DialogSendOpen( OwnerID() ) == false ) then 			
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return;
		end

		local SelectID = -2;
		local inputstring = "";
		local Name = GetName(OwnerID())
		for i = 0 , 600 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
				local CheckResult = DialogGetInputCheckResult( OwnerID() );
				if( CheckResult == 0 )then 
					-- 失敗, 有髒話
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE7]",0)	--你輸入的文字含有不雅文字。
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				elseif( CheckResult == 1 ) then
					-- 成功
					inputstring = DialogGetInputResult( OwnerID() );
					if string.len(inputstring) <= 72 then
						if( SelectID == 0 ) then
							if CountBodyItem( OwnerID() , 203023 ) >= 5 then
								local SayString = "[SC_VALENTINE_WANTTOSAY][$SETVAR1 = "..Name.." ][$SETVAR2 = "..TargetName.." ][$SETVAR3 = "..inputstring.." ]"
								local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
								local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
								if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
									--RunningMsg( OwnerID(), 2 ,SayString );
								end
								ScriptMessage( OwnerID(),-2,1,SayString,0)	--將話廣播出去！
								ScriptMessage( OwnerID(),-2,0,SayString,0)	--將話廣播出去！
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE3]",C_SYSTEM)--你要傳遞的訊息已經傳達給所有玩家了！
								DelBodyItem( OwnerID() , 203023 , 5 )
							else
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE4]",0)	
							end
						end
					else
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE5]",0)	--字數太多
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end
			elseif i == 600 then
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_OVERTIME_MSG]",0)
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function Lua_Valentine_RunMessage_Motion()
	MoveToFlagEnabled( OwnerID(), false );
	AddBuff(OwnerID(),502704,1,-1)
	while 1 do
	local RandBox = Rand(2)
		if RandBox == 0 then
			Say(OwnerID(),"[SC_VALENTINE_IDLESAY_1]")
			PlayMotion( OwnerID(),165 )
		else
			Say(OwnerID(),"[SC_VALENTINE_IDLESAY_2]")
			PlayMotion( OwnerID(),166 )
		end
	Sleep(Rand(100))
	Sleep(300)
	end
end