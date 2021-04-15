function LuaS_111256_10()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_10A" , TargetID() )
end
function LuaS_111256_10A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = GetString("ZONE_AYEN CARAVAN")
	local CastMoney = {[6] = 10 , [11] = 250 , [10] = 10 }
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
						ChangeZone( OwnerID() , 10 , 0 ,-38730, -2, 1543, 14)
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
function LuaS_111256_10_1()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_10A_1" , TargetID() )
end
function LuaS_111256_10A_1(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = "[ZONE_REIFORT POINT]"
	local CastMoney = {[2]=50,[6]=10,[10]=10}
	local String = "[SC_111256_DIALOG_0][$SETVAR1="..Areaname.."][$SETVAR2="..CastMoney[Area].."]" --傳送到羅格鎮需要付費 XX 銀
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
						ChangeZone( OwnerID() , 10 , 0 ,-29480, -540, 1193, 8.6)
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


function LuaS_111256_11()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_11A" , TargetID() )
end
function LuaS_111256_11A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = "[ZONE_LAGO]"
	local CastMoney = {[5] = 500 , [10] = 250 }
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
						ChangeZone( OwnerID() , 11 , 0 , -29454, 254 , -17630, 180)
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

function LuaS_111256_3()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_3A" , TargetID() )
end
function LuaS_111256_3A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = "[ZONE_DUST HOLD]"
	local CastMoney = {[2] = 750 , [7] = 1000 }
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
						ChangeZone( OwnerID() , 3 , 0 , 13855, 27 , 6748, 175)
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

function LuaS_111256_7()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_7A" , TargetID() )
end
function LuaS_111256_7A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = "[ZONE_BOULDERWIND]"
	local CastMoney = {[3] = 1000 , [8] = 1250 }
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
						ChangeZone( OwnerID() , 7 , 0 ,19672, 12 , 21907 , 340)
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

function LuaS_111256_12()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_12A" , TargetID() )
end
function LuaS_111256_12A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = "[ZONE_STONES FURLOUGH]"
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
						ChangeZone( OwnerID() , 12 , 0 ,28502, 312, 3465 , 180 )
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

function LuaS_111256_13()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_13A" , TargetID() )
end
function LuaS_111256_13A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = "[ZONE_HARFEN_CAMP]"
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
						ChangeZone( OwnerID() , 13 , 0 ,-6324.4, 165, -3914.3 , 166.2 )
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

function LuaS_111256_8()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_8A" , TargetID() )
end
function LuaS_111256_8A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = "[ZONE_THE GREEN TOWER]" 
	local CastMoney = {[7] = 1250 , [9] = 1500 }
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
						ChangeZone( OwnerID() , 8 , 0 , 5924 , 189 , 20751 , 210 ) 
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

function LuaS_111256_9()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_9A" , TargetID() )
end
function LuaS_111256_9A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = "[ZONE_DIMARKA]" 
	local CastMoney = {[8] = 1500 }
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
						ChangeZone( OwnerID() , 9 , 0 , -11207 , 973 , 26316 , 70 ) 
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


function LuaS_111256_31()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_111256_31A" , TargetID() )
end
function LuaS_111256_31A(obj)
	local Area = LuaS_111256_ZoneID(ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ))
	local Areaname = GetString("ZONE_Z31_IFANTRISH_CRYPT")
	local CastMoney = {[2] = 10}
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
						ChangeZone( OwnerID() , 31 , 0 , 2300, 1546, -414, 300)
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

function LuaS_119885_0()		--Z31伊凡崔希地穴，阿狗
	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Flag = {[1] = 541313 ,[2] = 541314 , [3] = 542297 , [4] = 541315 ,[5] = 541316 ,[6] = 541317 ,[7]=542498, [8] = 542744 ,[9] = 542997 , [10] = 541318 ,[11] = 541319 , [12] = 542557, [31]=546255 }
--	if Area > 99 or Area < 1 then
--		LoadQuestOption( OwnerID() )		
--	else
--		SetSpeakDetail( OwnerID() , GetString("SC_111256_0") )--呼～小子，你想做什麼快說；我，可是很沒耐心的。
	LoadQuestOption( OwnerID() )
		if CheckAcceptQuest(OwnerID(),425189)==true and CountBodyItem(OwnerID(),241049)>=1 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_111584_YU_34]","LuaQ_424189_ChangeZone",0)
		end
		if CheckFlag( OwnerID() , Flag[Area] ) == false then
			SetFlag( OwnerID() , Flag[Area] , 1)
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111256_OT"), C_SYSTEM );
		end
		if CheckFlag( OwnerID()  , 540001 ) == false then
			SetFlag( OwnerID()  , 540001 , 1 )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SC_111256_Q") , "LuaS_119885_Q", 0 ); --傳送是什麼？
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SC_111256_S") , "LuaS_119885_S", 0 ); --我要將回程術地點登記於此
		if CheckBuff( OwnerID() , 501638 ) == false then
			LuaS_Area_List(Area,Flag)
		end
	LoadQuestOption( OwnerID() )
--	end
end

function LuaS_119885_Q()

	SetSpeakDetail( OwnerID(), GetString("SC_111256_QD"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_119885_0", 0 ); 	--我想回到剛剛的對話

end

function LuaS_119885_S()

	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )

	if Area > 99 or Area < 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	local Point = {[1] = "ST_TRANSFER_2" , [2] = "ST_TRANSFER_9" , [3] = "ST_TRANSFER_13", [4] = "ST_TRANSFER_4" , [5] = "ST_TRANSFER_5" , [6] = "ST_TRANSFER_10" , [7] = "ST_TRANSFER_14" , [8] = "ST_TRANSFER_16" ,[9] = "ST_TRANSFER_17" , [10] = "ST_TRANSFER_11" ,[11] = "ST_TRANSFER_12" , [12] = "ST_TRANSFER_15" ,  [31] = "ST_TRANSFER_18"}
	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then

		if CheckAcceptQuest( OwnerID() , 424809 ) == true then	-- for 新手導引任務
			SetFlag( OwnerID() , 546255 , 1 )	-- 做完回程地點登記
		end

		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString(Point[Area])  , C_SYSTEM )	--畫面中間訊息：您將回程地點登記在開墾聚落！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString(Point[Area]) , 0 )	--您將回程地點登記在開墾聚落！
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--畫面中間訊息：回程地點登記失敗！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--回程地點登記失敗！
	end

	CloseSpeak( OwnerID() );	--關閉對話視窗

end