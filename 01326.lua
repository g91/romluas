--演奏薩克斯風
function LuaYU_PlayMusic_0()

	While true do
		sleep(40)
			PlayMotion( OwnerID(), 124) 
			AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 
	end

end


--演奏吉他

function LuaYU_PlayMusic_2()

	While true do
		sleep(40)
			PlayMotion( OwnerID(), 126) 
			AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 
	end

end


--演奏鈴鼓

function LuaYU_PlayMusic_7()

	While true do
		sleep(40)
			PlayMotion( OwnerID(), 125) 
			AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 
	end

end






--NPC補充說明

function LuaYU_PlayMusic_4()

	local MusicdoneOK = CheckCompleteQuest( OwnerID(), 422271 ); --判斷玩家是否完成該任務

	if MusicdoneOK == true then   --完成

		SetSpeakDetail(  OwnerID(), "[SC_MUSICPLAY_18]"  ) 


	elseif ReadRoleValue( OwnerID() , EM_RoleValue_LV ) >= 10 then

		SetSpeakDetail(  OwnerID(), "[SC_MUSICPLAY_08]"  ) 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_MUSICPLAY_06]"  , "LuaYU_PlayMusic_6", 0 )--尋找知音

	else
		SetSpeakDetail(  OwnerID(), "[SC_MUSICPLAY_08]"  ) 

	end



end

function LuaYU_PlayMusic_5()

	LoadQuestOption( OwnerID() )


end

function LuaYU_PlayMusic_6()

	SetSpeakDetail(  OwnerID(), "[SC_MUSICPLAY_07]"  ) --樂器介紹
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_MUSICPLAY_05]"  , "LuaYU_PlayMusic_5", 0 )--樂器製作


end






---------------------------------------------------------------------------------------------------------------------------- 薩克斯風 

function YUYULua_PlayMusic_00( Option ) --204421


	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*有騎乘狀態無法使用


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false

		else
			return true
		end



	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503334 ) == true then --如果目前 吹奏成功的摳當還在

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。

		else		

			BeginPlot( OwnerID() , "YUYULua_PlayMusic_01" , 0 )            --開始演奏樂器

		end

	end

end

function YUYULua_PlayMusic_01( ) --204421  薩克斯風 



--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/sax.mp3",FALSE)   --2011.4 新增音效

	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。

	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE , ruFUSION_ACTORSTATE_EMOTE_PROVOKE , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
	 AttachCastMotionTool( OwnerID(), 211824 ); --置換武器為薩克斯風
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493069, 0)
			AddBuff( OwnerID() ,503334 ,0 ,150 ); --吹奏成功 



		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end



end

---------------------------------------------------------------------------------------------------------------------------- 吉他 

function YUYULua_PlayMusic_10( Option ) --204461

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*有騎乘狀態無法使用


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503333 ) == true then --如果目前 演奏成功的摳當還在

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。

		else			


			BeginPlot( OwnerID() , "YUYULua_PlayMusic_11" , 0 )  

		end

	end


end

function YUYULua_PlayMusic_11( ) --204461  吉他 




--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/guitar.mp3",FALSE)  --2011.4 新增音效

	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。

	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
	 AttachCastMotionTool( OwnerID(), 211822 ); --置換武器為吉他
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493068, 0)	
			AddBuff( OwnerID() ,503333 ,0 ,150 ); --演奏成功 


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end




end

---------------------------------------------------------------------------------------------------------------------------- 烏德  

function YUYULua_PlayMusic_20( Option ) --204462

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*有騎乘狀態無法使用


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503333 ) == true then --如果目前 演奏成功的摳當還在

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。

		else			


			BeginPlot( OwnerID() , "YUYULua_PlayMusic_21" , 0 )  


		end

	end


end

function YUYULua_PlayMusic_21( ) --204462  烏德  


---	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/lute.mp3",FALSE)  --2011.4 新增音效
 
	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。


	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR , ruFUSION_ACTORSTATE_EMOTE_POINT , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
	 AttachCastMotionTool( OwnerID(), 211826 ); --置換武器為烏德
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493067, 0)
			AddBuff( OwnerID() ,503333 ,0 ,150 ); --演奏成功 


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end




end

---------------------------------------------------------------------------------------------------------------------------- 鈴鼓 

function YUYULua_PlayMusic_30( Option ) --204463

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*有騎乘狀態無法使用


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503335 ) == true then --如果目前 彈奏成功的摳當還在

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。

		else			



			BeginPlot( OwnerID() , "YUYULua_PlayMusic_31" , 0 )  


		end

	end


end

function YUYULua_PlayMusic_31( ) --204463  鈴鼓 


--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/tambourin.mp3",FALSE)  --2011.4 新增音效

	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。


	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE , ruFUSION_ACTORSTATE_EMOTE_DANCE , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
	 AttachCastMotionTool( OwnerID(), 211825 ); --置換武器為鈴鼓
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493071, 0)
			AddBuff( OwnerID() ,503335 ,0 ,150 ); --彈奏成功 


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end



end

---------------------------------------------------------------------------------------------------------------------------- 沙鈴   降防

function YUYULua_PlayMusic_40( Option ) --204464

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*有騎乘狀態無法使用


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503335 ) == true then --如果目前 彈奏成功的摳當還在

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --冷卻中。

		else			



			BeginPlot( OwnerID() , "YUYULua_PlayMusic_41" , 0 )  


		end

	end


end

function YUYULua_PlayMusic_41( ) --204464  沙鈴


--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/maracas.mp3",FALSE)  --2011.4 新增音效

	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。


	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE , ruFUSION_ACTORSTATE_EMOTE_DANCE , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
	 AttachCastMotionTool( OwnerID(), 211823 ); --置換武器為沙鈴
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493070, 0)
			AddBuff( OwnerID() ,503335 ,0 ,150 ); --彈奏成功 


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end



end

---------------------------------------------------------------------------------------------------------------------------- 永歷牌薩克斯風 

function YUYULua_PlayMusic_50( Option ) --204421

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*有騎乘狀態無法使用


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then




			BeginPlot( OwnerID() , "YUYULua_PlayMusic_51" , 0 )  



	end

end

function YUYULua_PlayMusic_51( ) --204421



--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )


--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。

	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
	 AttachCastMotionTool( OwnerID(), 211841 ); --置換武器為薩克斯風
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 
	AddBuff( OwnerID() ,503338 ,0 ,6 ); --效果


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
			
			BeginPlot( OwnerID() , "YUYULua_PlayMusic_52" , 0 )  
--			CastSpelllv( OwnerID() ,  OwnerID() , 492458, 1)	--黃色


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
			CancelBuff( OwnerID() ,503338 )
		end
	end



end

function YUYULua_PlayMusic_52( ) --204421



--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )

--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。

	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
	 AttachCastMotionTool( OwnerID(), 211841 ); --置換武器為薩克斯風
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --特效 
	AddBuff( OwnerID() ,503338 ,0 ,6 ); --效果


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
			
			BeginPlot( OwnerID() , "YUYULua_PlayMusic_51" , 0 )  
--			CastSpelllv( OwnerID() ,  OwnerID() , 492458, 1)	--黃色


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
			CancelBuff( OwnerID() ,503338 )
		end
	end



end




---以下是樂器包

function YUYULua_PlayMusic_60( Option,ItemID ) 
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , ItemID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		local Item   = {	204558,--製作的樂器
				204559,
				204560,
				204561,
				204562,

				204563,--商城7天版包
				204564,
				204565,
				204566,
				204567,

				204573,--商城7天版包
				204574,
				204575,
				204576,
				204577,

				206412,--商城30天版包
				206413,
				206414,
				206415,
				206416

				}

		local GIVEID= {	204542,
				204543,
				204544,
				204545,
				204546,

				204421,
				204461,
				204462,
				204463,
				204464,

				204568,
				204569,
				204570,
				204571,
				204572,

				206417,
				206418,
				206419,
				206420,
				206421

				}


		for i= 1 , table.getn(Item) do

			if ItemID == Item[i] then 
				GiveBodyItem( PlayerID , GIVEID[i] , 1 )	

			end
		end

	end
end

function Lua_Hao_Musical_Instruments( )	-- 判斷被施放目標是否為玩家

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Player = ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer )

	if Player ~= 1 then
	--	DebugMsg( OwnerID() , RoomID , TargetID().." = "..Player )
		return false
	end
--	DebugMsg( OwnerID() , RoomID , TargetID().." = "..Player )
	return true
end

function Lua_Hao_Musical_Reset_CD( )	-- 重置特定法術的CD

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Magic = { 493067 , 493068 , 493069 , 493070 , 493071 }
	local Buff = { 503333 , 503334 , 503335 }

	for i = 1 , table.getn(Magic) , 1 do
		local Class = GameObjInfo_Int( Magic[i] ,"ColdownClass")  -- 抓這個法術的施法冷卻欄位 - 分類
		local Type = GameObjInfo_Int( Magic[i] ,"ColdownType")  -- 抓這個法術的施法冷卻欄位次分類 - 冷卻類型
		local CD = GameObjInfo_Int( Magic[i] ,"ColdownTime") -- 抓這個法術的施法冷卻欄位次分類 - 冷卻時間
	--	DebugMsg( OwnerID() , RoomID , "Class = "..Class.." Type = "..Type )
		if CD > 0 then
		--	DebugMsg( OwnerID() , RoomID , TargetID().." "..Magic[i] )
			WriteRoleValue( TargetID() , EM_RoleValue_Coldown_Job + Type , 0 )
			local Data = ReadRoleValue( TargetID() , EM_RoleValue_Coldown_Job + Type )
		--	DebugMsg( OwnerID() , RoomID , TargetID().." , Data = "..Data )
		--	DebugMsg( OwnerID() , RoomID , TargetID().." , Coldown = "..CD )
		end
	end

	for i = 1 , table.getn(Buff) , 1 do
		CancelBuff( TargetID() , Buff[i] )
	end
end