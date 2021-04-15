function Hsiang_PlotDialogChangeJobList( )
	local Name = {"[SYS_CLASSNAME_WARRIOR]" , "[SYS_CLASSNAME_RANGER]" , "[SYS_CLASSNAME_THIEF]", "[SYS_CLASSNAME_MAGE]" , "[SYS_CLASSNAME_AUGUR]" , "[SYS_CLASSNAME_KNIGHT]" }
	local KeyName = {"Warrior" , "Ranger" , "Thief", "Mage" , "Augur" , "Knight" }
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷

		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Select Job" );
		
		for i = 1 , table.getn(Name) do
			DialogSelectStr( OwnerID() , Name[i] );
		end
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			--資料送出有問題
			return;
		end
		
		--local SelectID = Hsiang_GetDialogResoult( OwnerID() );

		local n = 0
		local DialogStatus = 0
		while true do
			sleep( 1 )
			n = n + 1
			DialogStatus = DialogGetResult( OwnerID() )
			--Say( OwnerID() , DialogStatus )
			if n > 600 then -- 防無窮迴圈，600 = 一分鐘
				ScriptMessage( OwnerID() , OwnerID() , 0, "無窮迴圈或閒置過久", 0 )
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF		
				break
			else
				--ScriptMessage( OwnerID() , OwnerID() , 0, "合法迴圈", 0 )
			end
			if ( DialogStatus == 8 ) or ( DialogStatus == -1 ) then
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF		
				break
			elseif ( DialogStatus == -2 ) then
			else
				local Wear = Hsiang_PlotDialogChangeJob( Name[DialogStatus+1] , DialogStatus+1 )
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function Hsiang_PlotDialogChangeJob( Name , VocNum )
	local RoleLvList= { 1, 5 , 10,15,20,25,30,35,40,45,50,55,60,65,70 }
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--最後清除BUFF		
	Sleep( 10 )	-- 防止第二層視窗立即關閉
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Select" .. Name .. " Level");
		
		for i = 1 , table.getn( RoleLvList ) do
			DialogSelectStr( OwnerID() , "("..i..")"..RoleLvList[i] .."LV" );
		end
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			--資料送出有問題
			return;
		end

		local SelectID = Hsiang_GetDialogResoult( OwnerID() );

		local Obj = Role:new( OwnerID() )	

		if SelectID >= -1 then
			Obj:SetJob( VocNum )
			Obj:SetLevel( RoleLvList[SelectID+1] )
			SetStandardWearEq( OwnerID() )
			SetStandardClearMagicPointAndSetTP( OwnerID() )
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF		
		--else
		--	Hsiang_PlotDialogChangeJobList( )
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function Hsiang_ResetTp( )
	SetStandardClearMagicPointAndSetTP( OwnerID() )
end