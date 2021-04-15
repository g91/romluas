function ClientGlobalSysFunction1( x )
	if CheckFlag( OwnerID()  , 540851 ) ==true then--�ˬd���L�X��
		SetFlag( OwnerID()  , 540851 , 0 );--�R���X��
		SetFlag( OwnerID()   , 542482 , 0 );--�R���X��
		if GoReturnPos( TargetID()  ) then
			return true
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_Race ) == 0 then
			ChangeZone( TargetID() , 1 , 0 ,-4069,244, -8247, 47)--�ǰe��zone1
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_Race ) == 1 then
			ChangeZone( TargetID() , 12 , 0 ,31954, 23 , 3278 , 95 )--�ǰe��zone12
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
			ChangeZone( TargetID() , 1 , 0 ,-4069,244, -8247, 47)--�ǰe��zone1
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_Race ) == 1 then
			ChangeZone( TargetID() , 12 , 0 ,31954, 23 , 3278 , 95 )--�ǰe��zone12
		end
		return true
	end
	return false
end

--�}�һȦ�
--AC
--�H�c
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

		TimeFlagKeys [EM_TimeFlagEffect_BagPage3	] = "BagLet%02d";	 --�I�]3
		TimeFlagKeys [EM_TimeFlagEffect_BagPage4	] = "BagLet%02d";	 --�I�]4
		TimeFlagKeys [EM_TimeFlagEffect_BagPage5	] = "BagLet%02d";	 --�I�]3
		TimeFlagKeys [EM_TimeFlagEffect_BagPage6	] = "BagLet%02d";	 --�I�]4

		TimeFlagKeys [EM_TimeFlagEffect_BankBag2	] = "BankBagLet%02d";	--�Ȧ�I�]�}��
		TimeFlagKeys [EM_TimeFlagEffect_BankBag3	] = "BankBagLet%02d";	--�Ȧ�I�]�}��
		TimeFlagKeys [EM_TimeFlagEffect_BankBag4	] = "BankBagLet%02d";	--�Ȧ�I�]�}��
		TimeFlagKeys [EM_TimeFlagEffect_BankBag5	] = "BankBagLet%02d";	--�Ȧ�I�]�}��

		TimeFlagKeys [EM_TimeFlagEffect_HonorParty	] = nil;		--�a�A�ն�
		TimeFlagKeys [EM_TimeFlagEffect_MailPaper	] = nil;		--�l��H��
		TimeFlagKeys [EM_TimeFlagEffect_DailyFlag	] = nil;		--�C�魫�n���~�M������
		TimeFlagKeys [EM_TimeFlagEffect_MailMultiItem	] = nil;		--�l��榸�ǰe�h�Ӫ��~
		TimeFlagKeys [EM_TimeFlagEffect_HandyBank	] = "BankLet%02d";	--�H���Ȧ�
		TimeFlagKeys [EM_TimeFlagEffect_HandyAuction	] = "AuctionLet%02d";	--�H��AC
		TimeFlagKeys [EM_TimeFlagEffect_HandyMail	] = "MailLet%02d";	--�H���H�c

	end

	if( not ActionTypes )then
		ActionTypes = {};

		ActionTypes [EM_TimeFlagEffect_BagPage3	] = EM_ActionType_Rent_BackPacket;	 --�I�]3
		ActionTypes [EM_TimeFlagEffect_BagPage4	] = EM_ActionType_Rent_BackPacket;	 --�I�]4
		ActionTypes [EM_TimeFlagEffect_BagPage5	] = EM_ActionType_Rent_BackPacket;	 --�I�]3
		ActionTypes [EM_TimeFlagEffect_BagPage6	] = EM_ActionType_Rent_BackPacket;	 --�I�]4

		ActionTypes [EM_TimeFlagEffect_BankBag2	] = EM_ActionType_Rent_BankPacket;	--�Ȧ�I�]�}��
		ActionTypes [EM_TimeFlagEffect_BankBag3	] = EM_ActionType_Rent_BankPacket;	--�Ȧ�I�]�}��
		ActionTypes [EM_TimeFlagEffect_BankBag4	] = EM_ActionType_Rent_BankPacket;	--�Ȧ�I�]�}��
		ActionTypes [EM_TimeFlagEffect_BankBag5	] = EM_ActionType_Rent_BankPacket;	--�Ȧ�I�]�}��

--		TimeFlagKeys [EM_TimeFlagEffect_HonorParty	] = nil;		--�a�A�ն�
--		TimeFlagKeys [EM_TimeFlagEffect_MailPaper	] = nil;		--�l��H��
--		TimeFlagKeys [EM_TimeFlagEffect_DailyFlag	] = nil;		--�C�魫�n���~�M������
--		TimeFlagKeys [EM_TimeFlagEffect_MailMultiItem	] = nil;		--�l��榸�ǰe�h�Ӫ��~
		ActionTypes [EM_TimeFlagEffect_HandyBank	] = EM_ActionType_Rent_Bank;	--�H���Ȧ�
		ActionTypes [EM_TimeFlagEffect_HandyAuction	] = EM_ActionType_Rent_AC;	--�H��AC
		ActionTypes [EM_TimeFlagEffect_HandyMail	] = EM_ActionType_Rent_Mail;	--�H���H�c

	end

	local TimeFlagID = math.floor( x / 100 );  -- ���ʦ��
	local Type = x - ( TimeFlagID * 100 );	  -- ���Q��P�Ӧ�

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
		 -- 2012.10.01 �ק� AddMoney �^�ǼҦ�
		if AddMoneyEx_Account( OwnerID() ,  ActionTypes[TimeFlagID] , -Money , true ) == true then
			AddRoleValue( OwnerID() , EM_RoleValue_TimeFlag + TimeFlagID , Time )
		else
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_EXCHANGE_FAIL]" , 0 )	-- �I������
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

--�󴫩Ыμ˦�
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
		HaveFlag =  CheckFlag( OwnerID() , HouseFlag )--�ˬd���a���W�O�_���X��(�ʶR�ЫΪ��X��)
	end

	if( HaveFlag )then

		if( SetHouseType( x ) )then
			SetPos( OwnerID() , 0 , 0 , 0 , 0 );
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_203072_01")  , C_DEFAULT )	--�e�������T���G�L�k�󴫬��ۦP�槽���ЫΡI
		end

	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_203072_02]"  , C_DEFAULT )
	end

end

--�ˬd�Ыέ��n�X��
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


--�ˬd���L�s�ٸ�
function ClientGlobalSysFunction8(  x )

	local getNewTitleCount = 0;
	getNewTitleCount  = getNewTitleCount  + LuaFunc_CheckAllQuestTitle();

	--
	if( getNewTitleCount  > 0 )then
		--���o�s�ٸ�
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_GETTITLENM][$SETVAR1="..getNewTitleCount.."]"  , C_DEFAULT )
		
	else
		--�S���s�ٸ�
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_GETTITLENO]"  , C_DEFAULT )

	end


end

-- �I������o�W�[���ݺٸ����ĪG100%�A����1�p�ɡC
function ClientGlobalSysFunction9(x)

	local Player = OwnerID()
	local Buff = 621080
	local Famous = ReadRoleValue( Player , EM_RoleValue_TitleSys_Famous )

	if Famous == 100 then
		AddBuff( Player , Buff , 0 , 3600 )
		WriteRoleValue( Player , EM_RoleValue_TitleSys_Famous , 50 )	-- �N�W�n�j��g��50

	else	--���~
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_421101_0]" , C_DEFAULT )		
	end
end
--�R�s�]�k���o
--AddMoney( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )
--AddMoney_Bonus( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )
--AddMoney_Account( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )	--�w�g����
--�����Ϊ��~������]
local CoolSuit_GetMoney=function(keyID,strM,Action)

	local Player = OwnerID()
	local v1 = GetMoneyKeyValue( strM , 0 );
	local v2 = GetMoneyKeyValue( strM, 1 );
	local v3 = GetMoneyKeyValue( strM, 2 );
	if (v3>0) then
		local Money = ReadRoleValue( Player , EM_RoleValue_Money_Account );
		if (Money>=v3) then
		-- 2012.09.17 �s�W�A�N EM_ActionType_BUY_COOLSUITPAGE �ܧ� Action�A�קK Ra-log �d�ߤ��� ActionTypes 115 �����D�C--
		 -- 2012.10.01 �ק� AddMoney �^�ǼҦ�
			if AddMoneyEx_Account( Player ,  Action , -v3 , true ) == true then
				WriteAccountFlagValue( Player , KeyID , 1 , 1 )		
			else
				ScriptMessage( Player , Player , 1 , "[SC_EXCHANGE_FAIL]" , C_DEFAULT )	-- �I������
				return false
			end			
		--
		--	WriteAccountFlag( Player, keyID, 1 );
		else		
			ScriptMessage( Player , Player , 1 , "[SC_BUY_ACCOUNT]" , C_DEFAULT )	-- �A�S�����������p
		end
	
	elseif (v2>0) then
		if DelBodyItem( Player , 203038 , v2 ) then		-- �����ťN��
			WriteAccountFlagValue( Player , KeyID , 1 , 1 )
		--	WriteAccountFlag( OwnerID(), keyID, 1 );
		else
			ScriptMessage( Player , Player , 1, "[SC_BUY_TOKEN]" , C_DEFAULT )	-- �A�S�������������ťN��
		end	
	
	elseif (v1>0) then
		local Money = ReadRoleValue( Player , EM_RoleValue_Money);
		if (Money>=v1) then
		-- 2012.09.17 �s�W�A�N EM_ActionType_BUY_COOLSUITPAGE �ܧ� Action�A�קK Ra-log �d�ߤ��� ActionTypes 115 �����D�C--
			AddMoney( Player ,  Action , -v1  );
		--
		--	WriteAccountFlag( Player , keyID, 1 );
			WriteAccountFlagValue( Player , KeyID , 1 , 1 )
		else	
			ScriptMessage( Player , Player , 1 , "[SC_BUY_MONEY]" , C_DEFAULT )	-- �A�S�������������I
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
	-- 2012.09.17 �s�W�A�ץ� Ra-log �d�ߤ��� ActionTypes 114 �����D�C--
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
--�R�s�Ÿ�SET
--local CoolSuitSetID={540078,540079,540080,540081,540082}

function ClientGlobalSysFunction11(sets)

	local Player = OwnerID()
	-- 2012.09.17 �s�W�A�ץ� Ra-log �d�ߤ��� ActionTypes 115 �����D�C--
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