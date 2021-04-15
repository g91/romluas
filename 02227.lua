function Lua_BuffAddHpCheck()
	if CheckBuff( OwnerID() , 501570) == false then
		return true
	else
		return false
	end
end
function Lua_BuffAddHp()
	BeginPlot(OwnerID(),"Lua_BuffAddHpPP",0)
end
function Lua_BuffAddHpPP()
	if CheckBuff( OwnerID() , 501570) == false then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "[SC_209462_1]"); --請問你想要設定血量為多少?
		DialogSelectStr( OwnerID() , "[SC_202800_2]" );
		DialogSelectStr( OwnerID() , "[SC_202800_3]" );
		AddBuff(OwnerID() , 501570,0,-1);
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0);	
			--資料送出有問題
		end
		CancelBuff(OwnerID(),509979)
		CancelBuff(OwnerID(),509980)
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , OwnerID() );
		if SelectID == 0  then
			local MMHP = ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)
		--	Say(OwnerID(),"yes2");
			local inputstring
			inputstring = DialogGetInputResult( OwnerID() );
			inputstring = tonumber( inputstring)
			if inputstring ~= nil then
				local XX = inputstring-MMHP
		--		Say(OwnerID(),inputstring.." - "..MMHP.." = "..XX);
				if XX < 10000 and XX>0 then
					local Slv = XX
					if Slv >0 then AddBuff(OwnerID(),509979,Slv-1,-1) end
				elseif XX <= 100000000  and XX>0 then
					local Slv = XX % 10000
					local Tlv = (XX - Slv ) /10000
		--			Say(OwnerID(),"Tlv = "..Tlv.." Slv = "..Slv);
					if Slv >0 then AddBuff(OwnerID(),509979,Slv-1,-1) end
					AddBuff(OwnerID(),509980,Tlv-1,-1)
				else
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_209462_2]",0);						
				end
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_209462_3]",0);	
			end
		elseif SelectID == 1  then
			--Say(OwnerID(),"[]");
		else
			--Say(OwnerID(),"Error2");
		end
		CancelBuff( OwnerID(), 501570 );
	end
end