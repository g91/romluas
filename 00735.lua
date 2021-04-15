function LuaS_111256_1()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_1A" , TargetID() )
end
function LuaS_111256_1A(Obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = GetString("ZONE_ROGSHIRE")
	local CastMoney = {[2] = 10 }
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷

	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
		
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
						CastSpell( OwnerID() , OwnerID() , 491008 )
						sleep( 5 )
						ChangeZone( OwnerID() , 1 , 0 , -1155, 37, -5548, 100 )
				end
			end
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_111256_2()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_2A" , TargetID() )
end
function LuaS_111256_2A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = GetString("ZONE_VARANAS")
	local CastMoney = {[1] = 10 ,  [3] = 750 ,[4] = 250 , [6] = 50 ,[10]=50, [12] = 10 ,[31] = 10}
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
		
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
						CastSpell( OwnerID() , OwnerID() , 491008 )
						sleep( 5 )
						ChangeZone( OwnerID() , 2 , 0, 2298, 0, 1153, 39)
				end
			end
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_111256_4()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_4A" , TargetID() )
end
function LuaS_111256_4A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = GetString("ZONE_ARGENFALL")
	local CastMoney = {[2] = 250 , [5] = 500 }
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
		
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
						CastSpell( OwnerID() , OwnerID() , 491008 )
						sleep( 5 )
						ChangeZone( OwnerID() , 4 , 0 ,-5917, 593, 2886, 280 )
				end
			end
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_111256_5()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_5A" , TargetID() )
end
function LuaS_111256_5A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = GetString("ZONE_HAROLFE TRADING POST")
	local CastMoney = {[4] = 500 , [6] = 750 , [11] = 500 }
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
						CastSpell( OwnerID() , OwnerID() , 491008 )
						sleep( 5 )
						ChangeZone( OwnerID() , 5 , 0 ,  -14466, 756, -170, 2 )
				end
			end
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_111256_6()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_6A" , TargetID() )
end
function LuaS_111256_6A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = GetString("ZONE_OBSIDIAN BASTION")
	local CastMoney = {[2] = 50 , [5] = 750 , [10] = 10 }
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
		
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		if SelectID == 0  then
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
						CastSpell( OwnerID() , OwnerID() , 491008 )
						sleep( 5 )
						ChangeZone( OwnerID() , 6 , 0 , -20460, -190, 6507, 132)
				end
			end
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end