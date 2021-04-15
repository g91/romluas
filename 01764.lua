function LuaS_114353_15_777()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_114353_15_777A" , TargetID() )
end
function LuaS_114353_15_777A(Obj)
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Areaname = "[ZONE_DAELANIS]"
	local CastMoney = {[820] = 1500 }
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
	AddBuff(OwnerID() , 501570,0,-1);
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	
	local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--
	if SelectID == 0  then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
			ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
		else
			if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
					CastSpell( OwnerID() , OwnerID() , 491008 )
					sleep( 5 )
					ChangeZone( OwnerID() , 15 , 0 , -4261 , 13 , 5050 , 250 )
			end
		end
		return 1
	elseif SelectID == 1  then
		return 0
	else 
		return 0
	end
end

function LuaS_114353_16_820()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_114353_16_820A" , TargetID() )
end
function LuaS_114353_16_820A(Obj)
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Areaname = "[ZONE_SOUTH_JENOTAR_FOREST]"
	local CastMoney = {[777] = 1500 ,[923] =1500}
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
	AddBuff(OwnerID() , 501570,0,-1);
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	
	local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--
	if SelectID == 0  then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
			ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
		else
			if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
					CastSpell( OwnerID() , OwnerID() , 491008 )
					sleep( 5 )
					ChangeZone( OwnerID() , 16 , 0 , -5982 , -148 , 21609 , 300 )
			end
		end
		return 1
	elseif SelectID == 1  then
		return 0
	else 
		return 0
	end
end


--------------------
function LuaS_114353_17_923()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_114353_17_923A" , TargetID() )
end
function LuaS_114353_17_923A(Obj)
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Areaname = "[ZONE_NORTHERN_JANOST_FOREST]"
	local CastMoney = {[820] = 1500 ,[643] = 1500}
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
	AddBuff(OwnerID() , 501570,0,-1);
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	
	local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--
	if SelectID == 0  then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
			ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
		else
			if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
					CastSpell( OwnerID() , OwnerID() , 491008 )
					sleep( 5 )
					ChangeZone( OwnerID() , 17 , 0 , 3571.6 , 113.5 , 31635.7 , 300 )
			end
		end
		return 1
	elseif SelectID == 1  then
		return 0
	else 
		return 0
	end
end
--------------------
function LuaS_114353_18_643()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_114353_18_643A" , TargetID() )
end
function LuaS_114353_18_643A(Obj)
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Areaname = "[ZONE_LYMUN_KINGDOM]"
	local CastMoney = {[923] = 1500 ,[522] = 1500}
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
	AddBuff(OwnerID() , 501570,0,-1);
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	
	local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--
	if SelectID == 0  then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
			ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
		else
			if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
					CastSpell( OwnerID() , OwnerID() , 491008 )
					sleep( 5 )
					ChangeZone( OwnerID() , 18 , 0 , 3085.2 , 85.0 , 47603.9 , 90 )
			end
		end
		return 1
	elseif SelectID == 1  then
		return 0
	else 
		return 0
	end
end

---------------------

function LuaS_114353_19_522()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_114353_19_522A" , TargetID() )
end
function LuaS_114353_19_522A(Obj)
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Areaname = "[ZONE_CAMPBELL_TOWNSHIP]"
	local CastMoney = {[643] = 1500 , [222] = 1500 }
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
	AddBuff(OwnerID() , 501570,0,-1);
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	
	local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--
	if SelectID == 0  then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
			ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
		else
			if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
					CastSpell( OwnerID() , OwnerID() , 491008 )
					sleep( 5 )
					ChangeZone( OwnerID() , 19 , 0 , -2893.9 , 119.0 , 49658.0 , 251.4 )
			end
		end
		return 1
	elseif SelectID == 1  then
		return 0
	else 
		return 0
	end
end

---------------------

function LuaS_114353_20_222()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_114353_20_222A" , TargetID() )
end
function LuaS_114353_20_222A(Obj)
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Areaname = "[ZONE_FIREBOOT_DWARF_FORTRESS]"
	local CastMoney = {[522] = 1500,[333]=1500 }
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
	AddBuff(OwnerID() , 501570,0,-1);
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	
	local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--
	if SelectID == 0  then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
			ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
		else
			if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
					CastSpell( OwnerID() , OwnerID() , 491008 )
					sleep( 5 )
					ChangeZone( OwnerID() , 20 , 0 , -16445.3 , 613 , 41033.7 , 174.4 )
			end
		end
		return 1
	elseif SelectID == 1  then
		return 0
	else 
		return 0
	end
end
function LuaS_114353_21_333()
	CloseSpeak( OwnerID() )
	CallPlot( OwnerID() , "LuaS_114353_21_333A" , TargetID() )
end
function LuaS_114353_21_333A(Obj)
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Areaname = "[ZONE_TORAGG_CARAVAN]"
	local CastMoney = {[222] = 1500 }
	local String = LuaS_111256_Dialog_MoneyChange(CastMoney , Area , Areaname)
	if String == -1 then
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
	AddBuff(OwnerID() , 501570,0,-1);
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	
	local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , obj )
	DialogClose( OwnerID() )
	CancelBuff( OwnerID(), 501570 );--
	if SelectID == 0  then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < CastMoney[Area] then
			ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
		else
			if AddRoleValue( OwnerID() , EM_RoleValue_Money , -(CastMoney[Area]) ) then
					CastSpell( OwnerID() , OwnerID() , 491008 )
					sleep( 5 )
					ChangeZone( OwnerID() , 21 , 0 , -26338.5 , -100 , 29778.7 , 174.4 )
			end
		end
		return 1
	elseif SelectID == 1  then
		return 0
	else 
		return 0
	end
end