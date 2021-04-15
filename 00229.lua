function LuaS_112763_0() --坐騎
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_MOUNTH_SHOP_B]" , "LuaS_MOUTH_SHOP_B", 0 ) --/*租借坐騎
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_MOUNTH_SHOP_BB]" , "LuaS_MOUTH_SHOP_BB", 0 ) --/*租借坐騎
end

function LuaS_112781_0() --交易所
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENAC]", "LuaS_112781_1", 0 ) --/*開啟拍賣所
end

function LuaS_112781_1()
	CloseSpeak( OwnerID() )
	MyOpenAC()
end

function LuaS_112778_0() --信箱
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENMAIL]", "LuaS_112778_1", 0 ) --/*開啟信箱
end

function LuaS_112778_1()
	CloseSpeak( OwnerID() )
	MyOpenMail()	
end

function LuaI_112793_0()
	SetPlot( OwnerID() , "range" , "LuaI_112793_1" , 100 )
end

function LuaI_112793_1()
	if CheckFlag( OwnerID() , 542557 ) == false then
		SetFlag( OwnerID() , 542557 , 1 )
	end

	if CheckFlag( OwnerID()  , 540794 ) == false then --檢查是否有頭銜：「新手冒險者」
		if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("ST_NEWHAND"));
			DialogSelectStr( OwnerID() , GetString("SO_NEWHANDYES") );
			DialogSelectStr( OwnerID() , GetString("SO_NEWHANDNO") );
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
				--資料送出有問題
				return;
			end
			local SelectID = Hsiang_GetDialogResoult( OwnerID() );
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF

			if SelectID == 0  then
				if  ChangeZone( OwnerID() , 100, -1,3230, 7, 3704, 270) == true then
					----紀錄進入位置
					local Obj = Role:new( OwnerID() );
					local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
					if ZoneID> 0 and  ZoneID< 100 and Obj:RoomID() == 0 then
						local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
						if( Ret == false ) then
							ScriptMessage( OwnerID(), OwnerID(), 0, "Save Location Error" , 0 )	
							return;
						end
					elseif ZoneID> 100 or Obj:RoomID() ~= 0 then
						local Ret = SaveReturnPos_ZoneDef( OwnerID() )
						if( Ret == false ) then
							ScriptMessage( OwnerID(), OwnerID(), 0, "Save Location Error" , 0 )	
							return;
						end
					else
							ScriptMessage( OwnerID(), OwnerID(), 0, "System Error" , 0 )	
							return;
					end
					-----
					SetFlag( OwnerID()  , 540851 , 1 );
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]" , 1 )
				end
				return
			else
				GiveBodyItem ( OwnerID() , 530042 , 1 )	-- 頭銜：「新手冒險者」
			--	ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_NEWADV") , C_SYSTEM )	--畫面中間訊息：取得頭銜：「新手冒險者」
			--	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_NEWADV") , 0 )		--系統訊息：取得頭銜：「新手冒險者」
				SetFlag( OwnerID()  , 540794 , 1 );
				return
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end
end