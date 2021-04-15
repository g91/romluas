function LuaS_203525( Option )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	local Player = OwnerID()
	local PackageID = 203525
	local DebEXP = ReadRoleValue( Player , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( Player , EM_RoleValue_DebtTP )
	if ( Option == "CHECK" ) then
		if CountBodyItem( Player , PackageID ) >= 1 then
			if DebEXP < 0 then
				return true
			elseif DebEXP >= 0 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_1]" , C_DEFAULT )		--無須使用此物品，你沒有負債！！
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_5]" , C_SYSTEM )		--你負債已經清空了！	
	end

end

function LuaS_203876( Option )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	local Player = OwnerID()
	local PackageID = 203876
	local DebEXP = ReadRoleValue( Player , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( Player , EM_RoleValue_DebtTP )
	if ( Option == "CHECK" ) then
		if CountBodyItem( Player , PackageID ) >= 1 then
			if DebEXP < 0 then
				if PlayerLV <= 25 then
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_3]" , C_DEFAULT )		--你的等級太高了，無法使用此物品！！
				return false
				end
			elseif DebEXP >= 0 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_1]" , C_DEFAULT )		--無須使用此物品，你沒有負債！！
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID() , "LuaS_203876_USE" , 0 )
	end

end

function LuaS_203876_USE()
	local DebEXP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtTP )
	local EXP = 5000
	local TP = 500
	--Say(OwnerID(),"DialogCreate....ing")
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		if (DebEXP + EXP) >= 0 then
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_203525_4][$SETVAR1=".."[203876]".."][$SETVAR2="..(-1)*DebEXP.."][$SETVAR3="..(-1)*DebEXP.."]")
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_203525_6][$SETVAR1=".."[203876]".."][$SETVAR2="..EXP.."][$SETVAR3="..TP.."]")
		end
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
			local NEWEXP = DebEXP+EXP
			local NEWTP = DebTP+TP
			if CountBodyItem( OwnerID() , 203876 ) >= 1 then
				if (NEWEXP < 0) then
					--Say(OwnerID(),"1")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , NEWEXP )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , NEWTP )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_2][$SETVAR1="..EXP.."][$SETVAR2="..TP.."]" , C_SYSTEM )		--你的經驗值負債減少了5000，技能點數負債減少了500
				elseif (NEWEXP >= 0) then
					--Say(OwnerID(),"2")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_5]" , C_SYSTEM )		--你負債已經清空了！			
				end
				DelBodyItem( OwnerID() , 203876 , 1 )
			else
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			end
			return
		else
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_203877( Option )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	local Player = OwnerID()
	local PackageID = 203877
	local DebEXP = ReadRoleValue( Player , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( Player , EM_RoleValue_DebtTP )
	if ( Option == "CHECK" ) then
		if CountBodyItem( Player , PackageID ) >= 1 then
			if DebEXP < 0 then
					return true
			elseif DebEXP >= 0 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_1]" , C_DEFAULT )		--無須使用此物品，你沒有負債！！
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID() , "LuaS_203877_USE" , 0 )
	end

end

function LuaS_203877_USE()
	local DebEXP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtTP )
	local EXP = 10000
	local TP = 1000
	--Say(OwnerID(),"DialogCreate....ing")
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		if (DebEXP + EXP) >= 0 then
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_203525_4][$SETVAR1=".."[203876]".."][$SETVAR2="..(-1)*DebEXP.."][$SETVAR3="..(-1)*DebEXP.."]")
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_203525_6][$SETVAR1=".."[203876]".."][$SETVAR2="..EXP.."][$SETVAR3="..TP.."]")
		end
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
		local NEWEXP = DebEXP+EXP
		local NEWTP = DebTP+TP
			if CountBodyItem( OwnerID() , 203877 ) >= 1 then
				if (NEWEXP < 0) then
					--Say(OwnerID(),"1")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , NEWEXP )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , NEWTP )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_2][$SETVAR1="..EXP.."][$SETVAR2="..TP.."]" , C_SYSTEM )		--你的經驗值負債減少了5000，技能點數負債減少了500
				elseif (NEWEXP >= 0) then
					--Say(OwnerID(),"2")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_5]" , C_SYSTEM )		--你負債已經清空了！			
				end
				DelBodyItem( OwnerID() , 203877 , 1 )
			else
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			end
			return
		else
			return
		end	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_203878( Option )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	local Player = OwnerID()
	local PackageID = 203878
	local DebEXP = ReadRoleValue( Player , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( Player , EM_RoleValue_DebtTP )
	if ( Option == "CHECK" ) then
		if CountBodyItem( Player , PackageID ) >= 1 then
			if DebEXP < 0 then
					return true
			elseif DebEXP >= 0 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_1]" , C_DEFAULT )		--無須使用此物品，你沒有負債！！
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID() , "LuaS_203878_USE" , 0 )
	end

end

function LuaS_203878_USE()
	local DebEXP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtTP )
	local EXP = 50000
	local TP = 5000
	--Say(OwnerID(),"DialogCreate....ing")
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		if (DebEXP + EXP) >= 0 then
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_203525_4][$SETVAR1=".."[203876]".."][$SETVAR2="..(-1)*DebEXP.."][$SETVAR3="..(-1)*DebEXP.."]")
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_203525_6][$SETVAR1=".."[203876]".."][$SETVAR2="..EXP.."][$SETVAR3="..TP.."]")
		end
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
		local NEWEXP = DebEXP+EXP
		local NEWTP = DebTP+TP
			if CountBodyItem( OwnerID() , 203878 ) >= 1 then
				if (NEWEXP < 0) then
					--Say(OwnerID(),"1")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , NEWEXP )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , NEWTP )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_2][$SETVAR1="..EXP.."][$SETVAR2="..TP.."]" , C_SYSTEM )		--你的經驗值負債減少了5000，技能點數負債減少了500
				elseif (NEWEXP >= 0) then
					--Say(OwnerID(),"2")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_5]" , C_SYSTEM )		--你負債已經清空了！			
				end
				DelBodyItem( OwnerID() , 203878 , 1 )
			else
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			end
			return
		else
			return
		end	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end


----新手寵物專用
function LuaS_207082( Option )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	local Player = OwnerID()
	local PackageID = 207082
	local DebEXP = ReadRoleValue( Player , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( Player , EM_RoleValue_DebtTP )
	if ( Option == "CHECK" ) then
		if CountBodyItem( Player , PackageID ) >= 1 then
			if PlayerLV >= 31 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_207082_2]" , C_DEFAULT )	--你的角色等級已超過31級，無法使用此物品。
				return false
			else
				if DebEXP < 0 then
						return true
				elseif DebEXP >= 0 then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_1]" , C_DEFAULT )		--無須使用此物品，你沒有負債！！
					return false
				end
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_5]" , C_SYSTEM )		--你負債已經清空了！	
	end

end



function lua_mika_debttest() -- 負債 exp 加 1萬 tp 加1000
	WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , -10000 )
	WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , -1000 )
	Say(OwnerID(), "dept up !")
end
------------------------ 2011.03.04 中國摩力游需求  天佑贖罪券 ------------------------
function LuaS_209590( Option )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	local PackageID = 209590
	local DebEXP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtTP )
	if ( Option == "CHECK" ) then
		if CountBodyItem( OwnerID() , PackageID ) >= 1 then
			if DebEXP < 0 then
				return true
			elseif DebEXP >= 0 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_1]" , C_DEFAULT )		--無須使用此物品，你沒有負債！！
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID() , "LuaS_209590_USE" , 0 )
	end
end

function LuaS_209590_USE()
	local DebEXP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtExp )
	local DebTP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtTP )
	local EXP = 3000000
	local TP = 300000

	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		if (DebEXP + EXP) >= 0 then
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_203525_4][$SETVAR1=".."[209590]".."][$SETVAR2="..(-1)*DebEXP.."][$SETVAR3="..(-1)*DebEXP.."]" )
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_203525_6][$SETVAR1=".."[209590]".."][$SETVAR2="..EXP.."][$SETVAR3="..TP.."]" )
		end
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" )
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	
			--資料送出有問題
			return
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() )
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
		local NEWEXP = DebEXP+EXP
		local NEWTP = DebTP+TP
			if CountBodyItem( OwnerID() , 209590 ) >= 1 then
				if (NEWEXP < 0) then
					--Say(OwnerID(),"1")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , NEWEXP )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , NEWTP )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_2][$SETVAR1="..EXP.."][$SETVAR2="..TP.."]" , C_SYSTEM )		--你的經驗值負債減少了300萬，技能點數負債減少了30萬
				elseif (NEWEXP >= 0) then
					--Say(OwnerID(),"2")
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
					WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_5]" , C_SYSTEM )		--你負債已經清空了！			
				end
				DelBodyItem( OwnerID() , 209590 , 1 )
			else
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			end
			return
		else
			return
		end	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------