function SetMotion_Sit()
	local MotionID = ruFUSION_MIME_SIT_LOOP;
	SetDefIdleMotion( OwnerID(), MotionID )
end

function SetMotion_Crouch()
	local MotionID = ruFUSION_MIME_CROUCH_LOOP;
	SetDefIdleMotion( OwnerID(), MotionID )
end

function SetMotion_Sleep()
	local MotionID = ruFUSION_MIME_SLEEP_LOOP;
	SetDefIdleMotion( OwnerID(), MotionID )
end

function SetMotion_Death()
	local MotionID = ruFUSION_MIME_DEATH_LOOP;
	SetDefIdleMotion( OwnerID(), MotionID )
end

function SetMotion_Crafting()
	local MotionID = ruFUSION_MIME_CRAFTING_LOOP;
	SetDefIdleMotion( OwnerID(), MotionID )
end

function SetMotion_SitChair()
	local MotionID = ruFUSION_MIME_SIT_CHAIR_LOOP;
	SetDefIdleMotion( OwnerID(), MotionID )
end

function SetMark_FlightPoint()
	SetMinimapIcon( OwnerID() , EM_MapIconType_FlightPoint );
end

--Z34~Z38「新的」頑固獵犬對話用
function lua_Island1_MTSnoopSZ()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Flag = 549411					-- 塔蘇克島

	LoadQuestOption( player );	-- 載入任務模板對話
	AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , " lua_Island_TransportSet", 0 ); -- 我要將回程術地點登記於此

--開啟傳送術
	if CheckFlag( Player, 540001 ) == false then
		AddSpeakOption( Player, Player, GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); -- 傳送是什麼？
		SetFlag( Player, 540001, 1 )
	end

--開啟此地傳送門
	if CheckFlag( Player , Flag ) == false then
		SetFlag( Player , Flag , 1)
		ScriptMessage( Player, Player, 1, GetString("SC_111256_OT"), C_SYSTEM );	--你成功開啟了此地的旅者之門。
	end

--列出傳送選項(501638=騎程禁止)
	if CheckBuff( Player , 501638 ) == false then
		if CheckFlag( Player , 541314 ) == true then 				-- 凡瑞娜絲城
			AddSpeakOption( Player, TargetID(),  "[SC_TRANSFER_OPTION_MEG][$SETVAR1=[ZONE_VARANAS]]"  , "lua_Island_Transport(2)",  0 ); --傳送到凡瑞娜絲城
		end
		if CheckFlag( Player , 548979 ) == true then 	-- 費泰爾丘陵
			AddSpeakOption( Player, TargetID(),  "[SC_TRANSFER_OPTION_MEG][$SETVAR1=[ZONE_Z33_FAYTEAR_UPLANDS]]"  , "lua_Island_Transport(33)", 0 ); --傳送到費泰爾丘陵
		end
	end
end
-- CDW
function lua_Island_TransportSet()
	local player = OwnerID();
	local Area = ReadRoleValue(  player , EM_RoleValue_ZoneID )

	if Area > 99 or Area < 1 then
		ScriptMessage( player , player , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( player );
		return
	end

	if GetDistance( player , TargetID() ) > 50 then
		ScriptMessage( player , player , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( player );
		return
	end

	local SHP = SaveHomePoint( player );

	if ( SHP == true) then
		CastSpell( player , player , 491008 )	-- 記點特效
		ScriptMessage( player , player , 2 , "[SC_TRANSFER_SAVEHOME_MEG][$SETVAR1=[ZONE_Z34_TASUQ_ISLAND]]"  , C_SYSTEM )	-- 畫面中間訊息：您將回程地點登記在開墾聚落！
		ScriptMessage( player , player , 0 , "[SC_TRANSFER_SAVEHOME_MEG][$SETVAR1=[ZONE_Z34_TASUQ_ISLAND]]"  , 0 )		-- 您將回程地點登記在開墾聚落！
	else
		ScriptMessage( player , player , 2 , GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	-- 畫面中間訊息：回程地點登記失敗！
		ScriptMessage( player , player , 0 , GetString("ST_TRANSFER_FAIL") , 0 )		-- 回程地點登記失敗！
	end

	CloseSpeak( player );	--關閉對話視窗

end

--傳送術
function lua_Island_Transport( loc )
	local Player = OwnerID()
	CloseSpeak( Player )
	DebugMsg( 0, 0, "Player_Select_a_location="..loc )
	CallPlot( Player , "lua_Island_TransportSpell" , TargetID() , Player , loc )
end
function lua_Island_TransportSpell( Obj , Player , loc )
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Areaname = {};
	local CastMoney = {};
	local TransportPoint = {};

	-- 凡瑞娜絲城
	Areaname[2] = "[ZONE_VARANAS]";
	CastMoney[2] = 10000;
	TransportPoint[2] = { 2298, 0, 1153, 39 };

	-- 費泰爾丘陵
	Areaname[33] = "[ZONE_Z33_FAYTEAR_UPLANDS]";
	CastMoney[33] = 6000;
	TransportPoint[33] = {-4248.7, 839.1, 5134.2, 116.5};
	
	local String = ""
	String = "[SC_111256_DIALOG_0][$SETVAR1="..Areaname[loc].."][$SETVAR2="..CastMoney[loc].."]"		-- 傳送到 XXX 需要付費 OO 銀
	if String == -1 then
		ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	--資料送出有問題
		return 0
	end
	if CheckBuff( Player , 501570) == false then  --增加檢查判斷
		DialogCreate( Player , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( Player , GetString("SO_YES") );
		DialogSelectStr( Player , GetString("SO_NO") );
		AddBuff( Player, 501570, 0 ,-1 );	--然後給予BUFF
		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	-- 資料送出有問題
			return 0
		end
		-- 通用取得DIALOG判斷( 取得的物件ID、存在的秒數、距離限制、距離限制參考的目標 )
		local SelectID = EX_GetDialogResoult( Player, 30 , 75 , Obj )
		DialogClose( Player )
		CancelBuff( Player, 501570 );	-- 最後清除BUFF
		if SelectID == 0  then
			if ReadRoleValue( Player , EM_RoleValue_Money ) < CastMoney[loc] then
				ScriptMessage( Player, Player, 1, GetString("SAY_MOUTH_ERROR_A"), 0 );	 --/*你身上的錢不夠。
			else
				if AddRoleValue( Player , EM_RoleValue_Money , -(CastMoney[loc]) ) then
					local tx,ty,tz,tdir = TransportPoint[loc][1],TransportPoint[loc][2],TransportPoint[loc][3],TransportPoint[loc][4]
					CastSpell( Player , Player , 491008 )
					sleep( 5 )
					ChangeZone( Player , loc , 0 , tx , ty , tz, tdir )
				end
			end
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end