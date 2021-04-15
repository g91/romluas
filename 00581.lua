function Davis_PlotDialogChangeJobList( )
	local Name = {"SYS_CLASSNAME_WARRIOR" , "SYS_CLASSNAME_RANGER" , "SYS_CLASSNAME_THIEF", "SYS_CLASSNAME_MAGE" , "SYS_CLASSNAME_AUGUR" , "SYS_CLASSNAME_KNIGHT" }
	local KeyName = {"Warrior" , "Ranger" , "Thief", "Mage" , "Augur" , "Knight" }
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_

		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Select Job" );
		
		for i = 1 , table.getn(Name) do
			DialogSelectStr( OwnerID() , GetString( Name[i] ) );
		end
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		if( DialogSendOpen( OwnerID() ) == false ) then 
			--��ưe�X�����D
			return;
		end
		
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
		
		if SelectID >= 0  and SelectID < table.getn(Name) then
			Davis_PlotDialogChangeJob( GetString( Name[SelectID+1] ) , SelectID+1 )
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end

function Davis_PlotDialogChangeJob( Name , VocNum )

	local RoleLvList= { 50,55,60,65,70 }
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
	Sleep( 10 )	-- ����ĤG�h�����ߧY����
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Select" .. Name .. " Level");
		
		for i = 1 , table.getn( RoleLvList ) do
			DialogSelectStr( OwnerID() , "("..i..")"..RoleLvList[i] .."LV" );
		end
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			--��ưe�X�����D
			return;
		end

		local SelectID = Hsiang_GetDialogResoult( OwnerID() );

		local Obj = Role:new( OwnerID() )	
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID >=0 and SelectID <  table.getn( RoleLvList )  then
			Obj:SetJob( VocNum )
			Obj:SetLevel( RoleLvList[SelectID+1] )
			SetStandardWearEq( OwnerID() )
			SetStandardClearMagicPointAndSetTP( OwnerID() )
		else
			Davis_PlotDialogChangeJobList( )
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function Davis_ResetTp( )
	SetStandardClearMagicPointAndSetTP( OwnerID() )
end