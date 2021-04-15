function Lua_Hao_thanksday_Crowd_01()   -- 各城鎮鶴鴕分享餐
		SetPlot( OwnerID() , "touch" , "Lua_Hao_thanksday_Crowd_02" , 50 );
	end	
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_Crowd_02()

	local Buff = { 505026 , 505027 , 505028 , 505029 } 	 	-- 放大術、縮小術、騎乘加速、幸運降臨
	local key = { 544561, 544562, 544563, 544564 } 		-- 食用過各種食物得到的key

	if ReadRoleValue( TargetID() , EM_RoleValue_Register+1) ==1 then			-- 防止複數玩家於同時開啟，都能得到的問題。 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		-- 忙碌中，請稍候再試。
		return										--
	end											--

	for i = 1 , 4 , 1 do
		if CheckBuff ( OwnerID() , Buff[i] ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_THANKSGIVING_17]" , C_SYSTEM )  -- 現在還不餓
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_THANKSGIVING_17]" , C_SYSTEM )  -- 現在還不餓
--			say ( OwnerID() , "[SC_THANKSGIVING_17]" )
			return
		end
	end

--	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )	

		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 1 ) 
	
		if BeginCastBar( OwnerID(), "[SC_THANKSGIVING_18]", 30 , ruFUSION_ACTORSTATE_EMOTE_EAT , ruFUSION_ACTORSTATE_EMOTE_EAT , 0 ) == 1 then	
			--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)
			
				while true do
				sleep( 2 )
					local CastBarStatus = CheckCastBar( OwnerID() )
					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- 成功
							result = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- 失敗
							result = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end
			
				if ( result == "OKOK" ) then
			
					if CheckID( TargetID() ) == true then
	
						local RANDOWN = rand(100)
							if RANDOWN <= 30  then
								AddBuff( OwnerID() , Buff[1] , 1 , 3600 )
								if Checkflag(OwnerID(), key[1] ) == false then
									Setflag( OwnerID(), key[1] , 1 )
								end
							elseif  RANDOWN <=60  and RANDOWN > 30 then
								AddBuff( OwnerID() , Buff[2] , 1 , 3600 )
								if Checkflag(OwnerID(), key[2] ) == false then
									Setflag( OwnerID(), key[2] , 1 )
								end
							elseif  RANDOWN <=80  and RANDOWN > 60 then
								AddBuff( OwnerID() , Buff[3] , 1 , 3600 )
								if Checkflag(OwnerID(), key[3] ) == false then
									Setflag( OwnerID(), key[3] , 1 )
								end
							elseif  RANDOWN <=100  and RANDOWN > 80 then
								AddBuff( OwnerID() , Buff[4] , 1 , 3600 )
								if Checkflag(OwnerID(), key[4] ) == false then
									Setflag( OwnerID(), key[4] , 1 )
								end
							end
							if CountBodyItem(OwnerID(), 530631 ) == 0 then  --當沒有稱號
								if Checkflag(OwnerID(), key[1] ) == true and Checkflag(OwnerID(), key[2] ) == true and Checkflag(OwnerID(), key[3] ) == true and Checkflag(OwnerID(), key[4] ) == true then
									GiveBodyItem(OwnerID(), 530631, 1)
									GiveBodyItem(OwnerID(), 206266, 5 )
									Setflag(OwnerID(),  544561 , 0)
									Setflag(OwnerID(),  544562 , 0)
									Setflag(OwnerID(),  544563 , 0)
									Setflag(OwnerID(),  544564 , 0)
								end
							end
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_VICTORY ) ;

							sleep(30)
							WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 ) 
					end

				elseif ( result == "DAME" ) then
					WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 ) 	-- 防止複數玩家於同時開啟寶箱，都能得到的問題。
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY ) ;

					SetPlot( TargetID(),"touch","Lua_Hao_thanksday_Crowd_02",50 )
				end
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_Item() -- 使用鶴鴕大餐

--	ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_THANKSGIVING_24]", C_SYSTEM )		-- 限量是殘酷的
--	ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_THANKSGIVING_24]", C_SYSTEM )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 113706, BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	AddBuff( NPC , 504665 , 1 , 15 )
	BeginPlot ( NPC , "Lua_Hao_thanksday_DelItem" , 0 )
	sleep(10)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_DelItem() -- 砍掉鶴鴕大餐
	Sleep(1800)
	DelObj ( OwnerID() )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_01()   -- 玩家使用有次數的鶴鴕大餐
		SetPlot( OwnerID() , "touch" , "Lua_Hao_thanksday_02" , 50 );
	end	
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_02()

	local Buff = { 505055 , 505057 , 505058 } 		-- 生命守護、魔力守護、攻擊守護
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )

--	Say(  TargetID() ,"PID="..PID)

	if ReadRoleValue( TargetID() , EM_RoleValue_Register+1) ==1 then			-- 防止複數玩家於同時開啟，都能得到的問題。 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		-- 忙碌中，請稍候再試。
		return										--
	end											--	

		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 1 ) 
	
		if BeginCastBar( OwnerID(), "[SC_THANKSGIVING_18]", 20 , ruFUSION_ACTORSTATE_EMOTE_EAT , ruFUSION_ACTORSTATE_NORMAL , 0 ) == 1 then	

			--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)
			
				while true do
				sleep( 2 )
					local CastBarStatus = CheckCastBar( OwnerID() )
					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- 成功
							result = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- 失敗
							result = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end
			
				if ( result == "OKOK" ) then
			
					if CheckID( TargetID() ) == true then
	
						local RANDOWN = rand(100)
							if RANDOWN <= 35  then
								AddBuff( OwnerID() , Buff[1] , 1 , 3600 )
							elseif  RANDOWN <=70  and RANDOWN > 35 then
								AddBuff( OwnerID() , Buff[2] , 1 , 3600 )
							elseif  RANDOWN <=100  and RANDOWN > 70 then
								AddBuff( OwnerID() , Buff[3] , 1 , 3600 )
							end			
						PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_VICTORY ) ;
						WriteRoleValue( TargetID() , EM_RoleValue_PID, PID+1 )	
						if PID == 9 then
							DelObj ( TargetID() )
						else
							WriteRoleValue( TargetID() , EM_RoleValue_PID, PID+1 )	
							sleep(20)
							WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 ) 
						end
					end
			
				elseif ( result == "DAME" ) then
					WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 ) 	-- 防止複數玩家於同時開啟，都能得到的問題。
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY ) ;
					SetPlot( TargetID(),"touch","Lua_Hao_thanksday_02",50 )
				end
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_Action() --對話視窗

	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_APPROVAL ) 
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_03]"   )  -- 你好，冒險者
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_04]" , "Lua_Hao_thanksday_about1", 0 ) --我想知道祈願節的由來。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_05]" , "Lua_Hao_thanksday_about3", 0 ) -- 關於糧草徵收
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_06]" , "Lua_Hao_thanksday_about4", 0 ) -- 關於鶴鴕大餐
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_07]" , "Lua_Hao_thanksday_about5", 0 ) -- 蒐集肉桂葉
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_08]" , "Lua_Hao_thanksday_about6", 0 ) -- 我想兌換[獎勵物品]

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_2010_NPC04]" , "Lua_mika_thankday_npc03", 0 ) --我想兌換[208292]  --祈願節重置券
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about1() -- 我想知道祈願節的由來。
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_01]"   )  --內容說明01
	AddSpeakOption(OwnerID(), TargetID(), "[SC_THANKSGIVING_20]" , "Lua_Hao_thanksday_about2", 0 ) -- 天阿，發生了什麼事情
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about2() -- 我想知道祈願節的由來。
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_02]"   )  --內容說明02
	AddSpeakOption(OwnerID(), TargetID(), "[SC_THANKSGIVING_21]" , "Lua_Hao_thanksday_about2_1", 0 ) -- 接下來呢？
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about2_1() -- 我想知道祈願節的由來。
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_02_2]"   )  --內容說明02
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about3() -- 關於糧草徵收
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_11]"   )  --位於[ZONE_VARANAS]正門門口附近的[113765]正在徵人幫忙，如果你願意協助他...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about4() -- 關於鶴鴕大餐
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_12]"   )  --每年到了這個季節，各地的城鎮為了歡慶祈願節的到來，都會擺放香氣四溢的烤鶴鴕大餐與來訪的旅人一同分享，今年...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about5() -- 關於蒐集[206265]
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_13]"   )  --我正在蒐集[206265]，只有搭配這種特殊香料的烤鶴鴕，才稱得上是最美味的料理，當你蒐集到10個之後，請交給我...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_THANKSGIVING_15]" , "Lua_Hao_thanksday_about5_1", 0 ) -- 交付10個肉桂葉
	AddSpeakOption(OwnerID(), TargetID(), "[SC_THANKSGIVING_22]" , "Lua_Hao_thanksday_about5_2", 0 ) -- 我該如何取得肉桂葉
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about5_2() -- 我該如何取得肉桂葉
	SetSpeakDetail( OwnerID()  , "[SC_THANKSGIVING_23]" ) -- 只要擊敗與你的主職等級相近的怪物，就有機會在拾取時獲得肉桂葉。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about5_1() -- 關於蒐集[206265]

	local today= CheckFlag(OwnerID()  , 543288) -- 今天參加過
	local item = CountBodyItem(OwnerID() , 206265 ) -- 肉桂葉

	if today == true then
		SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_16]"   )  --你今天已經完成了這個任務，請你明天再來吧。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
	else
		if item >= 10 then
			DelBodyItem( OwnerID() , 206265 , 10 ) -- 肉桂葉
			GiveBodyItem( OwnerID() , 206266 , 1 ) -- 感恩節活動參加憑證
			GiveBodyItem( OwnerID() , 206248 , 3 ) -- 物品：鶴鴕大餐
			SetFlag( OwnerID() , 543288 , 1 )
			SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_09]"   )  --成功兌換後
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
		else
			SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   )  --你所持的物品數量不足
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層	
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about6() -- 我想兌換[206309]和[240747]
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_14]"   )  -- 兌換<CB>[206309]</CB>和<CB>[240747]</CB>必須要20張<CB>[206266]</CB>，確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_111284_6]" , "Lua_Hao_thanksday_about6_1", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_about6_1() -- 我想兌換206309 祈願祝福禮盒 和 240747

	local item = CountBodyItem(OwnerID() , 206266 ) -- 感恩節活動參加憑證
	if item >= 15 then
		DelBodyItem( OwnerID() , 206266 , 15 ) -- 感恩節活動參加憑證
		GiveBodyItem( OwnerID() , 242093 , 1 ) -- 幸福滿盈禮盒
		GiveBodyItem( OwnerID() , 240747 , 1 ) -- 元素結晶
		SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_10]"   )  --成功兌換後
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   )  -- 你所持的物品數量不足
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_thanksday_Action", 0 ) --回到上一層
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_206308( Option ) --精緻料理家具禮盒
	local PlayerID = OwnerID()
	local PackageID = 2063080		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 724883 	-- 掉落表

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_206309( Option ) --祈願祝福禮盒
	local PlayerID = OwnerID()
	local PackageID = 2063090		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 724884 	-- 掉落表

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
		GiveBodyItem( PlayerID , 241480 , 15 ) -- 2012新增深海元素
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_thanksday_Reset()
	SetFlag( OwnerID() , 543288 , 0 )
	SetFlag( OwnerID() , 543463 , 0 )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_thanksday_Msg( Option )
	if ( Option == "CHECK" ) then

	ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_THANKSGIVING_24]", C_SYSTEM )		-- 限量是殘酷的
	ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_THANKSGIVING_24]", C_SYSTEM )

	elseif ( Option == "USE" ) then

	ScriptMessage( OwnerID(), OwnerID(), 1 , "123", C_SYSTEM )

	end
end