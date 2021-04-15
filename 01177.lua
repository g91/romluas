function LuaInside_RACEGAME()
	LoadQuestOption( OwnerID() )
	SetCrystalID( TargetID(), 350 ); 	
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_RACEGAMEINSIDE_1]" , "Lua_RACEGAME_GetGuildBidInfo", 0 ) --我想報名賽馬場的比賽
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_RACEGAMEINSIDE_2]" , "Lua_RACEGAME_Teach", 0 ) --我想了解賽馬場的規則
end

function Lua_RACEGAME_GetGuildBidInfo()
	CloseSpeak( OwnerID() )
	BeginPlot(OwnerID(),"Lua_RACEGAME_GetGuildBidInfo1",0)
end
function Lua_RACEGAME_GetGuildBidInfo1()
	if (CheckZone(350) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_RACEGAME_ZONEERROR]" , 0 )	--賽馬場還再準備中
	else
		if (CheckBuff( OwnerID() , 503080 ) == false) then
			if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
				AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
				
				DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_RACEGAME_GETTACKT]")
				DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
				DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
				if( DialogSendOpen( OwnerID() ) == false ) then 
					ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
					--資料送出有問題
					return
				end
				
				for i = 0 , 100 , 1 do
					Sleep( 1 );
					SelectID = DialogGetResult( OwnerID() );
					if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
						if ( SelectID == 0 ) then
							if (CountBodyitem(OwnerID(),203038) >= 15 )then
								AddBuff(OwnerID(), 503080, 0, -1)		--取得票據
								DelBodyitem(OwnerID(),203038,15)
								CancelBuff( OwnerID(), 501570 );--最後清除BUFF
								DialogClose( OwnerID() )
								--要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
								SendBGInfoToClient( 350, OwnerID() )
								break;
							else
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_111813_YU_36]",0)	
								CancelBuff( OwnerID(), 501570 );--最後清除BUFF
								DialogClose( OwnerID() )
								-- 2012.07.16 修正玩家於報名跨伺服器競賽 - 馳風大道(Zone 441)時，在必爾汀代幣(203038)持有不足的情況下，重覆點擊確定報名後，會於對話視窗顯示「已經開啟一個對話選項」的問題。
								break;
							end
						elseif ( SelectID == 1 ) then
							CancelBuff( OwnerID(), 501570 );--最後清除BUFF
							DialogClose( OwnerID() )
							break
						end
					elseif i == 100 then
						CancelBuff( OwnerID(), 501570 );--最後清除BUFF
						DialogClose( OwnerID() )		
						break
					end
				end
			else
				ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
			end
		else
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SetCrystalID( TargetID(), 350 ); 	
			SendBGInfoToClient( 350, OwnerID() )
		end

	end
end
function Lua_RACEGAME_Teach()
	SetSpeakDetail( OwnerID(), "[SC_RACEGAMEINSIDE_3]"   )	--這是一個考驗駕馭技巧，以個人加入佇列，當佇列中達到8人時，就會以個人為隊伍的方式進入比賽，變成八個隊伍的比賽。 
								--玩家有一分鐘的時間可以選擇是否進入賽馬場，如果一分鐘內所有進入佇列的玩家少於五位，則關閉賽馬場，該次戰場沒有獲勝者。 
								--以到達終點的先後順序為名次。
								--參加費用為30枚必爾汀代幣。
								--第一名獲得100枚必爾汀代幣、第二名獲得50枚必爾汀代幣、第三名獲得30枚必爾汀代幣。
								--比賽進行時，賽道上會有許多特技可以取用，每個人最多只能攜帶一個特技。 
end
function Lua_RACE_INTORide()
	--CastSpell(OwnerID(),OwnerID(),491233)
	AddBuff(OwnerID(), 501634, 0, -1)		--管理員騎戰馬
	local dis = 30
	local hindrance = {}
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local OldX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
	local OldY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
	local OldZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
	local OldDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
	local Cal = (math.pi/180)*(OldDir) 
	dis = 10
	hindrance[1] = CreateObj( 112586, OldX+dis*math.sin(Cal) ,OldY ,OldZ +dis*math.cos(Cal),OldDir , 1 )
	hindrance[2] = CreateObj( 112587, OldX-dis*math.sin(Cal) ,OldY ,OldZ -dis*math.cos(Cal),OldDir , 1 )
	hindrance[3] = CreateObj( 110224, OldX- 30*math.cos(Cal)+dis*math.sin(Cal) ,OldY ,OldZ +30*math.sin(Cal) +dis*math.cos(Cal),OldDir , 1 )
	hindrance[4] = CreateObj( 110224, OldX- 30*math.cos(Cal)-dis*math.sin(Cal) ,OldY ,OldZ +30*math.sin(Cal) -dis*math.cos(Cal),OldDir , 1 )
	for i=1,table.getn(hindrance) do
		SetModeEx( hindrance[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( hindrance[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( hindrance[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( hindrance[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( hindrance[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( hindrance[i], EM_SetModeType_Gravity, true )--重力
		SetModeEx( hindrance[i], EM_SetModeType_Move, false )--移動
		SetModeEx( hindrance[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( hindrance[i], EM_SetModeType_Searchenemy, false )--索敵
		AddToPartition( hindrance[i] ,  RoomID  )
	end
	BeginPlot( hindrance[1] , "Lua_RACE_sidemessger1" , 0 )
	BeginPlot( hindrance[2] , "Lua_RACE_sidemessger2" , 0 )
end
function Lua_RACE_sidemessger1()
	local RR = rand(100)
	while 1 do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE )
		Sleep(10)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Say(OwnerID(),"[SC_RACE_SIDEMESSAGE1]")
		Sleep(1800+RR)
	end
end
function Lua_RACE_sidemessger2()
	local RR = rand(100)
	while 1 do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE )
		Sleep(10)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Say(OwnerID(),"[SC_RACE_SIDEMESSAGE2]")
		Sleep(1800+RR)
	end
end