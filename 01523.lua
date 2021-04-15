function LuaI_StringCheck() --字串檢測
	SetPlot( OwnerID() , "touch" , "LuaSuez_StringCheck_Box" , 50 )
end
function LuaSuez_StringCheck() --字串檢測
	BeginPlot( OwnerID() , "LuaSuez_StringCheck_Box" , 0 )
end
function LuaSuez_StringCheck_Box()
	DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "[SC_113426_01]"); 
	DialogSelectStr( OwnerID() , "Accept" );
	DialogSelectStr( OwnerID() , "Cancel");

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return;
	end

	local SelectID = -2;
	local inputstring = ""
	local outputstring = ""
	DialogClose( OwnerID() );
	for i = 0 , 600 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
			inputstring = DialogGetInputResult( OwnerID() )
			outputstring = "["..inputstring.."]"
			if( SelectID == 0 ) then
				if Type(inputstring) ~= "string" or inputstring == "" then
					Tell( OwnerID() , TargetID() , "Nullity String Code .")
				else
					local tmp = tonumber(inputstring)
					if tmp ~= nil and tmp >= 420025 and tmp <= 430000 then
						LuaSuez_StringDetailVersion( inputstring , 1 )
					else
						Say( OwnerID() , inputstring )
						Tell( OwnerID() , TargetID() , inputstring.." = "..outputstring )
					end
				end
			end
			break

		elseif i >= 600 then
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_OVERTIME_MSG]",0)
			break
		end
	end

end

function LuaSuez_StringDetailVersion( inputstring , option )
	--Say( OwnerID() , inputstring )
	--Say( OwnerID() , option )
	local tempString1 = "Sys"..inputstring.."_name"
	local tempString2 = "Sys"..inputstring.."_szquest_accept_detail"
	local tempString3 = "Sys"..inputstring.."_szquest_complete_detail"
	local tempString4 = "Sys"..inputstring.."_szquest_desc"
	local tempString5 = "Sys"..inputstring.."_szquest_uncomplete_detail"
	-- local outputstring = tempString1.."=["..tempString1.."]\n\n"..tempString2.."=\n["..tempString2.."]\n\n"..tempString3.."=\n["..tempString3.."]\n\n"..tempString4.."=\n["..tempString4.."]\n\n"..tempString5.."=\n["..tempString5.."]";
	local outputstring = "";
	if option == 1 then
		outputstring = tempString1.."=["..tempString1.."]";
	elseif option == 2 then
		outputstring = tempString2.."=\n["..tempString2.."]";
	elseif option == 3 then
		outputstring = tempString3.."=\n["..tempString3.."]";
	elseif option == 4 then
		outputstring = tempString4.."=\n["..tempString4.."]";
	elseif option == 5 then
		outputstring = tempString5.."=\n["..tempString5.."]";
	end
	DialogClose( OwnerID() );
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , outputstring );
	DialogSelectStr( OwnerID() , tempString2 );
	DialogSelectStr( OwnerID() , tempString3 );
	DialogSelectStr( OwnerID() , tempString4 );
	DialogSelectStr( OwnerID() , tempString5 );
	DialogSelectStr( OwnerID() , "[SO_EXIT]" );
	if( DialogSendOpen( OwnerID() ) == false ) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)
		return false
	end

	local SelectID = -2;
	for i = 0 , 600 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID == 4 ) then
			DialogClose( OwnerID() );
			break;
		elseif ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
			LuaSuez_StringDetailVersion( inputstring , SelectID+2 )
			break;
		elseif i >= 600 then
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_OVERTIME_MSG]",0)		
			break;
		end
	end

end