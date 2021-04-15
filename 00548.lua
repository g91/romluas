function ClientGlobalSysFunction1( x )
	if CheckFlag( OwnerID()  , 540851 ) ==true then--檢查有無旗標
		SetFlag( OwnerID()  , 540851 , 0 );--刪除旗標
		SetFlag( OwnerID()   , 542482 , 0 );--刪除旗標
		if GoReturnPos( TargetID()  ) then
			return true
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_Race ) == 0 then
			ChangeZone( TargetID() , 1 , 0 ,-4069,244, -8247, 47)--傳送到zone1
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_Race ) == 1 then
			ChangeZone( TargetID() , 12 , 0 ,31954, 23 , 3278 , 95 )--傳送到zone12
		end
		return true
	end
	return false
end

function ClientGlobalSysFunction2(  x )
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) == 102 then
		if GoReturnPos( TargetID() ) then
			return true
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_Race ) == 0 then
			ChangeZone( TargetID() , 1 , 0 ,-4069,244, -8247, 47)--傳送到zone1
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_Race ) == 1 then
			ChangeZone( TargetID() , 12 , 0 ,31954, 23 , 3278 , 95 )--傳送到zone12
		end
		return true
	end
	return false
end

--開啟銀行
--AC
--信箱
function ClientGlobalSysFunction3(  x )

	if( x == 1 )then

		if( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) == 400 )then
			Sys_Bank_Open();
			return true;
		end

		local Time = GetMoneyKeyValue( "BankLet00", 0 );
		local Money = GetMoneyKeyValue(  "BankLet00", 1 );
		if( Time == 0 or Money == 0 )then
			ScriptMessage( OwnerID(), TargetID(), 0, "Open bank error, Time or Money == 0" , 0 )
			return;
		end

		if ( ReadRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HandyBank ) >= 0  ) then 
			Sys_Bank_Open()
			return true;
		end

	elseif( x == 2 )then

		local Time = GetMoneyKeyValue( "AuctionLet00", 0 );
		local Money = GetMoneyKeyValue(  "AuctionLet00", 1 );
		if( Time == 0 or Money == 0 )then
			ScriptMessage( OwnerID(), TargetID(), 0, "Open AC error, Time or Money == 0" , 0 )
			return;
		end

		if ( ReadRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HandyAuction  ) >= 0  ) then 
			OpenAC()
			return true;
		end
	elseif( x == 3 )then
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Time = GetMoneyKeyValue( "MailLet00", 0 );
		local Money = GetMoneyKeyValue(  "MailLet00", 1 );
		if( Time == 0 or Money == 0 )then
			DebugMsg( OwnerID() , Room , "Open mail box error, Time or Money == 0" )
		--	ScriptMessage( OwnerID(), TargetID(), 0, "Open mail box error, Time or Money == 0" , 0 )
			return;
		end

		if ( ReadRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HandyMail ) >= 0  ) then 
			OpenMail( )
			return true;
		end
	end

	return false
end






function ClientGlobalSysFunction4( x )

	if( not TimeFlagKeys )then
		TimeFlagKeys = {}

		TimeFlagKeys [EM_TimeFlagEffect_BagPage3	] = "BagLet%02d";	 --背包3
		TimeFlagKeys [EM_TimeFlagEffect_BagPage4	] = "BagLet%02d";	 --背包4
		TimeFlagKeys [EM_TimeFlagEffect_BagPage5	] = "BagLet%02d";	 --背包3
		TimeFlagKeys [EM_TimeFlagEffect_BagPage6	] = "BagLet%02d";	 --背包4

		TimeFlagKeys [EM_TimeFlagEffect_BankBag2	] = "BankBagLet%02d";	--銀行背包開放
		TimeFlagKeys [EM_TimeFlagEffect_BankBag3	] = "BankBagLet%02d";	--銀行背包開放
		TimeFlagKeys [EM_TimeFlagEffect_BankBag4	] = "BankBagLet%02d";	--銀行背包開放
		TimeFlagKeys [EM_TimeFlagEffect_BankBag5	] = "BankBagLet%02d";	--銀行背包開放

		TimeFlagKeys [EM_TimeFlagEffect_HonorParty	] = nil;		--榮譽組隊
		TimeFlagKeys [EM_TimeFlagEffect_MailPaper	] = nil;		--郵件信紙
		TimeFlagKeys [EM_TimeFlagEffect_DailyFlag	] = nil;		--每日重要物品清除機制
		TimeFlagKeys [EM_TimeFlagEffect_MailMultiItem	] = nil;		--郵件單次傳送多個物品
		TimeFlagKeys [EM_TimeFlagEffect_HandyBank	] = "BankLet%02d";	--隨身銀行
		TimeFlagKeys [EM_TimeFlagEffect_HandyAuction	] = "AuctionLet%02d";	--隨身AC
		TimeFlagKeys [EM_TimeFlagEffect_HandyMail	] = "MailLet%02d";	--隨身信箱

	end

	if( not ActionTypes )then
		ActionTypes = {};

		ActionTypes [EM_TimeFlagEffect_BagPage3	] = EM_ActionType_Rent_BackPacket;	 --背包3
		ActionTypes [EM_TimeFlagEffect_BagPage4	] = EM_ActionType_Rent_BackPacket;	 --背包4
		ActionTypes [EM_TimeFlagEffect_BagPage5	] = EM_ActionType_Rent_BackPacket;	 --背包3
		ActionTypes [EM_TimeFlagEffect_BagPage6	] = EM_ActionType_Rent_BackPacket;	 --背包4

		ActionTypes [EM_TimeFlagEffect_BankBag2	] = EM_ActionType_Rent_BankPacket;	--銀行背包開放
		ActionTypes [EM_TimeFlagEffect_BankBag3	] = EM_ActionType_Rent_BankPacket;	--銀行背包開放
		ActionTypes [EM_TimeFlagEffect_BankBag4	] = EM_ActionType_Rent_BankPacket;	--銀行背包開放
		ActionTypes [EM_TimeFlagEffect_BankBag5	] = EM_ActionType_Rent_BankPacket;	--銀行背包開放

--		TimeFlagKeys [EM_TimeFlagEffect_HonorParty	] = nil;		--榮譽組隊
--		TimeFlagKeys [EM_TimeFlagEffect_MailPaper	] = nil;		--郵件信紙
--		TimeFlagKeys [EM_TimeFlagEffect_DailyFlag	] = nil;		--每日重要物品清除機制
--		TimeFlagKeys [EM_TimeFlagEffect_MailMultiItem	] = nil;		--郵件單次傳送多個物品
		ActionTypes [EM_TimeFlagEffect_HandyBank	] = EM_ActionType_Rent_Bank;	--隨身銀行
		ActionTypes [EM_TimeFlagEffect_HandyAuction	] = EM_ActionType_Rent_AC;	--隨身AC
		ActionTypes [EM_TimeFlagEffect_HandyMail	] = EM_ActionType_Rent_Mail;	--隨身信箱

	end

	local TimeFlagID = math.floor( x / 100 );  -- 取百位數
	local Type = x - ( TimeFlagID * 100 );	  -- 取十位與個位

	if( not TimeFlagKeys [TimeFlagID ] or not ActionTypes[TimeFlagID] )then
		ScriptMessage( OwnerID(), TargetID(), 0, "TimeFlagID Error!!  TimeFlagID  = " .. TimeFlagID  , 0 )
		return;
	end

	local keyformat = TimeFlagKeys [TimeFlagID ];
	
	local Time = GetMoneyKeyValue(  string.format( keyformat , Type ), 0 );
	local Money = GetMoneyKeyValue(  string.format( keyformat , Type ) , 1 );


	if( Time == 0 or Money == 0 )then
		ScriptMessage( OwnerID(), TargetID(), 0, "[TIME_AND_MONEY_ERROR]" , 0 )
		return;
	end

	local AccountMoney = ReadRoleValue( OwnerID() , EM_RoleValue_Money_Account )

	if AccountMoney >= Money then
		--AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , -Money )
		 -- 2012.10.01 修改 AddMoney 回傳模式
		if AddMoneyEx_Account( OwnerID() ,  ActionTypes[TimeFlagID] , -Money , true ) == true then
			AddRoleValue( OwnerID() , EM_RoleValue_TimeFlag + TimeFlagID , Time )
		else
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_EXCHANGE_FAIL]" , 0 )	-- 兌換失敗
			return false
		end
	else
		ScriptMessage( OwnerID(), TargetID(), 0, "You don't Have enough Money !!" , 0 )
		-- nothing
	end

	return true;
end

function ClientGlobalSysFunction5( x )
	if ( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) == 400 ) then
		BeginPlot( OwnerID() , "Sys_ChangeJob" , 0 )
		return true;
	end
end

--更換房屋樣式
function ClientGlobalSysFunction6(  x )

	local HouseIDs = 
	{
		575523,
		575524,
		578537,
		578538,
		579041,
		579917,
		579918
	}
	
	local FlagIDs = 
	{
		542670,
		542671,
		542672,
		542673,
		542674,
		542675,
		542676
	}

	local HouseFlag;

	for i= 1 , table.getn(HouseIDs) do

		if x == HouseIDs[i] then 
			HouseFlag = FlagIDs[i]
		end
	end

--	Say( OwnerID, NewHouse )
--	Tell( OwnerID() , OwnerID() ,   NewHouse.."1"  )
	
	local HaveFlag = nil;
	
	if( HouseFlag )then
		HaveFlag =  CheckFlag( OwnerID() , HouseFlag )--檢查玩家身上是否有旗標(購買房屋的旗標)
	end

	if( HaveFlag )then

		if( SetHouseType( x ) )then
			SetPos( OwnerID() , 0 , 0 , 0 , 0 );
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_203072_01")  , C_DEFAULT )	--畫面中間訊息：無法更換為相同格局的房屋！
		end

	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_203072_02]"  , C_DEFAULT )
	end

end

--檢查房屋重要旗標
function ClientGlobalSysFunction7(  x )

--	ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) 
--	ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) 

--	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) 
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) 


	local currentHouse = GetHouseType();


--	ScriptMessage( TargetID() , OwnerID() , 1 , currentHouse.."T" , 0 ) 
--	ScriptMessage( TargetID() , OwnerID() , 0 , currentHouse.."T" , 0 ) 

--	ScriptMessage( OwnerID() , OwnerID() , 1 , currentHouse.."O" , 0 ) 
--	ScriptMessage( OwnerID() , OwnerID() , 0 , currentHouse.."O" , 0 ) 




	if ( currentHouse == 575523 ) then
		SetFlag( OwnerID(), 542670, 1 );
	elseif ( currentHouse == 575524 ) then
		SetFlag( OwnerID(), 542670, 1 );
		SetFlag( OwnerID(), 542671, 1 );
	elseif ( currentHouse == 578537 ) then
		SetFlag( OwnerID(), 542670, 1 );
		SetFlag( OwnerID(), 542671, 1 );
		SetFlag( OwnerID(), 542672, 1 );
	elseif ( currentHouse == 578538 ) then 
		SetFlag( OwnerID(), 542670, 1 );
		SetFlag( OwnerID(), 542671, 1 );
		SetFlag( OwnerID(), 542672, 1 );
		SetFlag( OwnerID(), 542673, 1 );
	elseif ( currentHouse == 579041 ) then --
		SetFlag( OwnerID(), 542670, 1 );
		SetFlag( OwnerID(), 542671, 1 );
		SetFlag( OwnerID(), 542672, 1 );
		SetFlag( OwnerID(), 542673, 1 );
		SetFlag( OwnerID(), 542674, 1 );
	elseif ( currentHouse == 579917 ) then --
		SetFlag( OwnerID(), 542670, 1 );
		SetFlag( OwnerID(), 542671, 1 );
		SetFlag( OwnerID(), 542672, 1 );
		SetFlag( OwnerID(), 542673, 1 );
		SetFlag( OwnerID(), 542674, 1 );
		SetFlag( OwnerID(), 542675, 1 );
	elseif ( currentHouse == 579918 ) then --
		SetFlag( OwnerID(), 542670, 1 );
		SetFlag( OwnerID(), 542671, 1 );
		SetFlag( OwnerID(), 542672, 1 );
		SetFlag( OwnerID(), 542673, 1 );
		SetFlag( OwnerID(), 542674, 1 );
		SetFlag( OwnerID(), 542675, 1 );
		SetFlag( OwnerID(), 542676, 1 );

	end

end


--檢查有無新稱號
function ClientGlobalSysFunction8(  x )

	local getNewTitleCount = 0;
	getNewTitleCount  = getNewTitleCount  + LuaFunc_CheckAllQuestTitle();

	--
	if( getNewTitleCount  > 0 )then
		--取得新稱號
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_GETTITLENM][$SETVAR1="..getNewTitleCount.."]"  , C_DEFAULT )
		
	else
		--沒有新稱號
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_GETTITLENO]"  , C_DEFAULT )

	end


end

-- 點擊後取得增加附屬稱號的效果100%，持續1小時。
function ClientGlobalSysFunction9(x)

	local Player = OwnerID()
	local Buff = 621080
	local Famous = ReadRoleValue( Player , EM_RoleValue_TitleSys_Famous )

	if Famous == 100 then
		AddBuff( Player , Buff , 0 , 3600 )
		WriteRoleValue( Player , EM_RoleValue_TitleSys_Famous , 50 )	-- 將名聲強制寫成50

	else	--錯誤
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_421101_0]" , C_DEFAULT )		
	end
end
--買新魔法衣櫥
--AddMoney( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )
--AddMoney_Bonus( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )
--AddMoney_Account( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )	--已經停用
--金錢或物品給予原因
local CoolSuit_GetMoney=function(keyID,strM,Action)

	local Player = OwnerID()
	local v1 = GetMoneyKeyValue( strM , 0 );
	local v2 = GetMoneyKeyValue( strM, 1 );
	local v3 = GetMoneyKeyValue( strM, 2 );
	if (v3>0) then
		local Money = ReadRoleValue( Player , EM_RoleValue_Money_Account );
		if (Money>=v3) then
		-- 2012.09.17 新增，將 EM_ActionType_BUY_COOLSUITPAGE 變更為 Action，避免 Ra-log 查詢不到 ActionTypes 115 的問題。--
		 -- 2012.10.01 修改 AddMoney 回傳模式
			if AddMoneyEx_Account( Player ,  Action , -v3 , true ) == true then
				WriteAccountFlagValue( Player , KeyID , 1 , 1 )		
			else
				ScriptMessage( Player , Player , 1 , "[SC_EXCHANGE_FAIL]" , C_DEFAULT )	-- 兌換失敗
				return false
			end			
		--
		--	WriteAccountFlag( Player, keyID, 1 );
		else		
			ScriptMessage( Player , Player , 1 , "[SC_BUY_ACCOUNT]" , C_DEFAULT )	-- 你沒有足夠的晶鑽
		end
	
	elseif (v2>0) then
		if DelBodyItem( Player , 203038 , v2 ) then		-- 必爾汀代幣
			WriteAccountFlagValue( Player , KeyID , 1 , 1 )
		--	WriteAccountFlag( OwnerID(), keyID, 1 );
		else
			ScriptMessage( Player , Player , 1, "[SC_BUY_TOKEN]" , C_DEFAULT )	-- 你沒有足夠的必爾汀代幣
		end	
	
	elseif (v1>0) then
		local Money = ReadRoleValue( Player , EM_RoleValue_Money);
		if (Money>=v1) then
		-- 2012.09.17 新增，將 EM_ActionType_BUY_COOLSUITPAGE 變更為 Action，避免 Ra-log 查詢不到 ActionTypes 115 的問題。--
			AddMoney( Player ,  Action , -v1  );
		--
		--	WriteAccountFlag( Player , keyID, 1 );
			WriteAccountFlagValue( Player , KeyID , 1 , 1 )
		else	
			ScriptMessage( Player , Player , 1 , "[SC_BUY_MONEY]" , C_DEFAULT )	-- 你沒有足夠的金錢！
		end
	else
		DebugMsg( Player ,0 , "keyID= "..keyID )
		--AddRoleValue( OwnerID() , keyID, 1 );
		WriteAccountFlagValue( Player , KeyID , 1 , 1 )
	--	WriteAccountFlag( Player , keyID, 1 );
	end	
end
--local CoolSuitPageID={540070,540071,540072,540073,540074,540075,540076,540077}
--local CoolSuitPageID={	EM_AccountFlag_MW_Space_Switch_1 ,
--			EM_AccountFlag_MW_Space_Switch_2 ,
--			EM_AccountFlag_MW_Space_Switch_3 ,
--			EM_AccountFlag_MW_Space_Switch_4 , 
--			EM_AccountFlag_MW_Space_Switch_5 ,
--			EM_AccountFlag_MW_Space_Switch_6 ,
--			EM_AccountFlag_MW_Space_Switch_7 ,
--			EM_AccountFlag_MW_Space_Switch_8	}
--local function printtable(tab)
--
--	DebugMsg( 0 , 0 ,type(tab).."size="..table.getn(tab))
--	for t,v in tab  do
--		DebugMsg( 0 , 0 , ""..t.."="..v )
--	end
--end		
function ClientGlobalSysFunction10(page)
	--ScriptMessage( TargetID() , OwnerID() , 1 , "page=|cffff00ff" ..page.. "|r" , 0 ) 
	local Player = OwnerID()
	-- 2012.09.17 新增，修正 Ra-log 查詢不到 ActionTypes 114 的問題。--
	local Action = EM_ActionType_BUY_COOLSUITPAGE
	--
	local CoolSuitPageID={	EM_AccountFlag_MW_Space_Switch_1 ,
				EM_AccountFlag_MW_Space_Switch_2 ,
				EM_AccountFlag_MW_Space_Switch_3 ,
				EM_AccountFlag_MW_Space_Switch_4 , 
				EM_AccountFlag_MW_Space_Switch_5 ,
				EM_AccountFlag_MW_Space_Switch_6 ,
				EM_AccountFlag_MW_Space_Switch_7 ,
				EM_AccountFlag_MW_Space_Switch_8	}
				
--	DebugMsg( Player ,0 , "page= "..page )
	if (page<2 or page>10) then
		return ;
	end
--	printtable(CoolSuitPageID);
	local keyID=CoolSuitPageID[page-2];
--	DebugMsg( Player ,0 , "keyID= "..keyID )
	if ReadAccountFlagValue( Player , keyID , 1 ) == 1 then
		DebugMsg( Player , 0 , "You already have this "..keyID )
		return	
	end
--	if (CheckFlag( OwnerID()  , keyID )) then
--		return ;
--	end
	local StrKey=string.format( "Wardrobe_PageCost%d" , page );
	CoolSuit_GetMoney(keyID,StrKey,Action);
end
--買新酷裝SET
--local CoolSuitSetID={540078,540079,540080,540081,540082}

function ClientGlobalSysFunction11(sets)

	local Player = OwnerID()
	-- 2012.09.17 新增，修正 Ra-log 查詢不到 ActionTypes 115 的問題。--
	local Action = EM_ActionType_BUY_COOLSUITSET
	--
	local CoolSuitSetID={	EM_AccountFlag_MW_Set_Switch_1 , 
				EM_AccountFlag_MW_Set_Switch_2 ,
				EM_AccountFlag_MW_Set_Switch_3 ,
				EM_AccountFlag_MW_Set_Switch_4 ,
				EM_AccountFlag_MW_Set_Switch_5	}
--	DebugMsg( Player ,0 , "sets= "..sets )
	if (sets<5 or sets>10) then
		return ;
	end
	local keyID=CoolSuitSetID[sets-5];	
--	DebugMsg( Player ,0 , "keyID= "..keyID )
	if ReadAccountFlagValue( Player , keyID , 1 ) == 1 then
		DebugMsg( Player , 0 , "You already have this "..keyID )
		return	
	end
--	if (CheckFlag( Player  ,  keyID )) then
--		return ;
--	end
	local StrKey=string.format( "Wardrobe_SetCost%d" , sets );
	CoolSuit_GetMoney(keyID,StrKey,Action);
end