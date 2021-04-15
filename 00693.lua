function CoolClothCombo()
	Beginplot( OwnerID() ,"CoolClothLove", 0 )
end

function CoolClothLove()
	local CoolClothName = { "SYS_CLASSNAME_WARRIOR", "SYS_CLASSNAME_RANGER", "SYS_CLASSNAME_THIEF", "SYS_CLASSNAME_MAGE", "SYS_CLASSNAME_AUGUR", "SYS_CLASSNAME_KNIGHT","SYS_CLASSNAME_WARDEN","SYS_CLASSNAME_DRUID", "SO_EXIT" }
	--{ "戰士", "遊俠", "影行者", "法師", "祭司", "騎士","森林牧者","自然神官", "離開" }

	local n = 0
	local DialogStatus = 0

	local Player = OwnerID()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( Player , EM_LuaDialogType_Select , "What Cool Cloth Do You Want to Wear ?" )
		for i = 1, table.getn( CoolClothName ) do
			DialogSelectStr( Player , GetString(CoolClothName[i]) )
		end
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end

		while true do
			Sleep( 5 )
			n = n + 1
			DialogStatus = DialogGetResult( Player )
			if n > 120 then -- 防無窮迴圈，120 = 一分鐘
				ScriptMessage( Player , Player , 0, "Wait a long time & EXIT!!", 0 )
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			else
			end

			if ( DialogStatus == 8 ) or ( DialogStatus == -1 ) then
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF

				break
			elseif ( DialogStatus == -2 ) then
			else
				local Wear = CoolClothWear( DialogStatus )
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function CoolClothWear( Part )

	--Say(OwnerID(),"Part = "..Part)
	local Sex = ReadRoleValue(OwnerID(),EM_RoleValue_SEX)
	local Obj = Role:new( OwnerID() )
	if Part == 6 then
		if Sex == 0 then
			Obj:SetEq( EM_EQWearPos_Head , 220221 );
			Obj:SetEq( EM_EQWearPos_Clothes , 223457 );
			Obj:SetEq( EM_EQWearPos_Shoes , 223792 );
			Obj:SetEq( EM_EQWearPos_MainHand , 211190);
			Obj:SetEq( EM_EQWearPos_Pants , 223790);
			Obj:SetEq( EM_EQWearPos_Shoulder , 223793);
			Obj:SetEq( EM_EQWearPos_Belt , 0 );
			Obj:SetEq( EM_EQWearPos_Gloves , 0 );
		else
			Obj:SetEq( EM_EQWearPos_Head , 0 );
			Obj:SetEq( EM_EQWearPos_Clothes , 223457 );
			Obj:SetEq( EM_EQWearPos_Shoes , 223792 );
			Obj:SetEq( EM_EQWearPos_MainHand , 211766);
			Obj:SetEq( EM_EQWearPos_Pants , 223790);
			Obj:SetEq( EM_EQWearPos_Shoulder , 223793);
			Obj:SetEq( EM_EQWearPos_Belt , 0 );
			Obj:SetEq( EM_EQWearPos_Gloves , 0 );
		end
	elseif Part == 7 then
		if Sex == 0 then
			Obj:SetEq( EM_EQWearPos_Head , 211762 );
			Obj:SetEq( EM_EQWearPos_Clothes , 224359 );
			Obj:SetEq( EM_EQWearPos_Belt , 224363 );
			Obj:SetEq( EM_EQWearPos_Shoes , 225130 );
			Obj:SetEq( EM_EQWearPos_MainHand , 211762);
			Obj:SetEq( EM_EQWearPos_Gloves , 0 );
			Obj:SetEq( EM_EQWearPos_Shoulder , 0);
		else
			Obj:SetEq( EM_EQWearPos_Head , 224555 );
			Obj:SetEq( EM_EQWearPos_Clothes , 224550 );
			Obj:SetEq( EM_EQWearPos_Belt , 2224558 );
			Obj:SetEq( EM_EQWearPos_Shoes , 224559 );
			Obj:SetEq( EM_EQWearPos_MainHand , 211764);
			Obj:SetEq( EM_EQWearPos_Pants , 224557);
			Obj:SetEq( EM_EQWearPos_Gloves , 0 );
			Obj:SetEq( EM_EQWearPos_Shoulder , 0);
		end
	else
		local CoolClothWarrior = 221768
		local CoolClothRanger = 221775
		local CoolClothThief = 221782
		local CoolClothMage = 221789
		local CoolClothAugur = 221796
		local CoolClothKnight = 221761
		local CoolClothList = { CoolClothWarrior , CoolClothRanger , CoolClothThief , CoolClothMage , CoolClothAugur , CoolClothKnight }
		--設定玩家裝備
		Obj:SetEq( EM_EQWearPos_Head , CoolClothList[Part+1]+0 );
		Obj:SetEq( EM_EQWearPos_Clothes , CoolClothList[Part+1]+1 );
		Obj:SetEq( EM_EQWearPos_Belt , CoolClothList[Part+1]+2 );
		Obj:SetEq( EM_EQWearPos_Pants , CoolClothList[Part+1]+3 );
		Obj:SetEq( EM_EQWearPos_Shoes , CoolClothList[Part+1]+4 );
		Obj:SetEq( EM_EQWearPos_Shoulder, CoolClothList[Part+1]+5 );
		Obj:SetEq( EM_EQWearPos_Gloves , CoolClothList[Part+1]+6 );
	end
end