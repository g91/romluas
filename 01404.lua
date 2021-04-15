function LuaN_mika_goblintitle00()--6.1.2開始更新另一個版本的獎勵，請見703204(奈)
	local item1 = CountBodyItem(OwnerID(), 205037 ); -- 檢查是否有 兌換物品
	local title1 = CountBodyItem(OwnerID(), 530375 ); -- 檢查是否有 稱號1
	local title2 = CountBodyItem(OwnerID(), 530376 ); -- 檢查是否有 稱號2   
	local title3 = CountBodyItem(OwnerID(), 530377 ); -- 檢查是否有 稱號3 

	if title1 == 1 and title2 == 1 then
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE01]" )--　當你擁有一定數量的<CP>[205037]</CP>時，你可以換取以下稱號
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE02]", "LuaN_mika_goblintitle01", 0) --用10個<CM>[205037]</CM>換取稱號<CP>「哥布林勇士」</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE03]", "LuaN_mika_goblintitle02", 0) --用100個<CM>[205037]</CM>換取稱號<CP>「翻滾吧，哥布林！」</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE04]", "LuaN_mika_goblintitle03", 0) --用250個<CM>[205037]</CM>換取稱號<CP>「綠色奇蹟」</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_GoblinEnter_00", 0 ) --回到上一層
	else
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE14]" )--　當你擁有一定數量的<CP>[205037]</CP>時，你可以換取以下稱號
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE02]", "LuaN_mika_goblintitle01", 0) --用10個<CM>[205037]</CM>換取稱號<CP>「哥布林勇士」</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GOBLINTITLE03]", "LuaN_mika_goblintitle02", 0) --用100個<CM>[205037]</CM>換取稱號<CP>「翻滾吧，哥布林！」</CP>
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_GoblinEnter_00", 0 ) --回到上一層
	end
end

function LuaN_mika_goblintitle01()
	local item1 = CountBodyItem(OwnerID(), 205037 ); -- 檢查是否有 兌換物品
	local title1 = CountBodyItem(OwnerID(), 530375 ); -- 檢查是否有 稱號1
	local title2 = CountBodyItem(OwnerID(), 530376 ); -- 檢查是否有 稱號2   
	local title3 = CountBodyItem(OwnerID(), 530377 ); -- 檢查是否有 稱號3 

	if title1 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE05]" )--你已經擁有此稱號。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
	else
		if item1 >= 10 then  --數量未定
			GiveBodyItem(OwnerID(), 530375 , 1 )  --給稱號
			DelBodyItem(OwnerID(), 205037 , 10 ) --扣物品 X10
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE06]" )--勇士，你的勇敢，已經得到了歌布林群的讚賞。恭喜你取得此稱號！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
		else 
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE07]" )--你沒有足夠的<CP>[205037]</CP>
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
		end		
	end
end 

function LuaN_mika_goblintitle02()
	local item1 = CountBodyItem(OwnerID(), 205037 ); -- 檢查是否有 兌換物品
	local title1 = CountBodyItem(OwnerID(), 530375 ); -- 檢查是否有 稱號1
	local title2 = CountBodyItem(OwnerID(), 530376 ); -- 檢查是否有 稱號2   
	local title3 = CountBodyItem(OwnerID(), 530377 ); -- 檢查是否有 稱號3 

	if title2 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE05]" )--你已經擁有此稱號。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
	else
		if title1 == 0 then
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE11]" )--你沒有稱號 <CB>「[530375]」</CB>喔。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
		else
			if item1 >= 100 and title1 == 1 then  --數量未定
				GiveBodyItem(OwnerID(), 530376 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205037 , 100 ) --扣物品 X100
				SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE09]" )-- 只有強悍的鬥士，才夠資格擁有這個頭銜。恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE07]" )--你沒有足夠的<CP>[205037]</CP>
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
			end	
		end	
	end
end 

function LuaN_mika_goblintitle03()
	local item1 = CountBodyItem(OwnerID(), 205037 ); -- 檢查是否有 兌換物品
	local title1 = CountBodyItem(OwnerID(), 530375 ); -- 檢查是否有 稱號1
	local title2 = CountBodyItem(OwnerID(), 530376 ); -- 檢查是否有 稱號2   
	local title3 = CountBodyItem(OwnerID(), 530377 ); -- 檢查是否有 稱號3 

	if title3 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE05]" )--你已經有這個稱號囉
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
	else
		if title1 == 0 and title2 == 0 then 
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE13]" )--你沒有稱號 <CB>「[530375]」</CB>與 <CB>「[530376]」</CB>喔。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
		elseif title1 == 1 and title2 == 0 then
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE12]" )--你沒有稱號 <CB>「[530376]」</CB>喔。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
		elseif title1 == 0 and title2 == 1 then
			SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE11]" )--你沒有稱號 <CB>「[530375]」</CB>喔。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
		elseif 	title1 == 1 and title2 == 1 then		
			if item1 >= 250 then  --數量未定
				GiveBodyItem(OwnerID(), 530377 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205037 , 250 ) --扣物品 X250
				SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE06]" )--無庸置疑，你已然是最頂尖的存在，恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE07]" )--你沒有足夠的<CP>[205037]</CP>
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_goblintitle00", 0 ) --回到上一層
			end
		end		
	end
end

function Lua_Hao_GoblindelAll()	

	Delbodyitem(OwnerID(), 530375 , 1 ) 
	Delbodyitem(OwnerID(), 530376 , 1 ) 
	Delbodyitem(OwnerID(), 530377 , 1 ) 
	Setflag(OwnerID(), 542742 , 0 ) 
	Setflag(OwnerID(), 542743 , 0 ) 
	Setflag(OwnerID(), 542869 , 0 ) 
	Setflag(OwnerID(), 542870 , 0 ) 
	Setflag(OwnerID(), 542875 , 0 ) 
	Setflag(OwnerID(), 542876 , 0 ) 
	Setflag(OwnerID(), 542877 , 0 ) 
	Setflag(OwnerID(), 542878 , 0 ) 
	Setflag(OwnerID(), 542904 , 0 )
	Setflag(OwnerID(), 542905 , 0 )
	Setflag(OwnerID(), 542689 , 0 ) --2014/11/18增加挑戰資格旗標重置
	GiveBodyItem(OwnerID(), 203038 , 30)
end

Function Lua_Hao_Goblinbox_51()   --Lv20~29寶箱Script&掉落表

		SetPlot( OwnerID() , "touch" , "Lua_Hao_Goblinbox_52" , 50 );

	end	

Function Lua_Hao_Goblinbox_52()

--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")

	SetPlot( TargetID(),"touch","",0 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

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
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
					GiveBodyItem( OwnerID() , 724511 , 1 )
--					GiveBodyItem( OwnerID() ,  ,  )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)

				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。

				end	
			end

		elseif ( result == "DAME" ) then

			SetPlot( TargetID(),"touch","Lua_Hao_Goblinbox_52",50 )

		end
	end

end


Function Lua_Hao_Goblinbox_53()   --Lv30~39寶箱Script&掉落表

		SetPlot( OwnerID() , "touch" , "Lua_Hao_Goblinbox_54" , 50 );

	end	

Function Lua_Hao_Goblinbox_54()

--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")

	SetPlot( TargetID(),"touch","",0 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

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
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
					GiveBodyItem( OwnerID() , 724513 , 1 )
--					GiveBodyItem( OwnerID() ,  ,  )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)

				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。

				end	
			end

		elseif ( result == "DAME" ) then

			SetPlot( TargetID(),"touch","Lua_Hao_Goblinbox_54",50 )

		end
	end

end

Function Lua_Hao_Goblinbox_55()   --Lv40~49寶箱Script&掉落表

		SetPlot( OwnerID() , "touch" , "Lua_Hao_Goblinbox_56" , 50 );

	end	

Function Lua_Hao_Goblinbox_56()

--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")

	SetPlot( TargetID(),"touch","",0 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

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
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
					GiveBodyItem( OwnerID() , 724515 , 1 )
--					GiveBodyItem( OwnerID() ,  ,  )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)

				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。

				end	
			end

		elseif ( result == "DAME" ) then

			SetPlot( TargetID(),"touch","Lua_Hao_Goblinbox_56",50 )

		end
	end

end

Function Lua_Hao_Goblinbox_57()   --50寶箱Script&掉落表

		SetPlot( OwnerID() , "touch" , "Lua_Hao_Goblinbox_58" , 50 );

	end	

Function Lua_Hao_Goblinbox_58()

--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")

	SetPlot( TargetID(),"touch","",0 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

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
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
					GiveBodyItem( OwnerID() , 724517 , 1 )
--					GiveBodyItem( OwnerID() ,  ,  )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)

				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。

				end	
			end

		elseif ( result == "DAME" ) then

			SetPlot( TargetID(),"touch","Lua_Hao_Goblinbox_58",50 )

		end
	end

end