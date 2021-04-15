function Lua_Hao_Goblin_test()

	SetPlot(OwnerID() ,"range","Lua_Hao_Goblin_113166_1",100)

end

function Lua_Hao_Goblin_test1()
Say(OwnerID, "1")
Say(TargetID, "2")
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"the gate is open! Do you want to leave this instance")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--資料送出有問題
		return
	end
	for i = 0 , 100 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
			if ( SelectID == 0 ) then
				ChangeZone( TargetID() , 4, 0, -5852.6, 572.2, 3326.3, 149.5 ) --前往銀瀑村
				DialogClose( OwnerID() )
				break;
			elseif ( SelectID == 1 ) then
				DialogClose( OwnerID() )		
				break
			end
		elseif i == 100 then
			DialogClose( OwnerID() )		
			break
		end
	end
end


Function Lua_Hao_Test_Buff()
--Say(OwnerID(), "1")
--Say(TargetID(), "2")

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Count = 80

		for i = 1 , Count , 1 do						
				AddBuff(OwnerID(),503610,1,-1)
				castspell( OwnerID() , OwnerID() , 493376 );
				Say( OwnerID(), i)
		sleep(10)
				
		end	
	
end


 