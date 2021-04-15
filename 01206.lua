--<< LuaSUEZ_SayDir : 顯示你的DIR >>
--<< LuaSUEZ_Who : 顯示誰在同一個區域 >>
--<< LuaSuez_RunningMSG : 區域跑馬燈 >>
--<< LuaSuez_ShakeMSG : 來電震動訊息，如果該區域全部玩家要收到請填 0 >>

function LuaSUEZ_SayDir() --顯示方向
	Say( OwnerID() , ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) )
end
function LuaSUEZ_Who() --顯示誰在
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local ZoneID = Lua_ExGetZone(OwnerID())
	local Count = SetSearchAllPlayer(RoomID)
	Tell( OwnerID() , OwnerID() , "Zone = "..ZoneID)
	Tell( OwnerID() , OwnerID() , "Room = "..RoomID) 
	Tell( OwnerID() , OwnerID() , "Player Number : "..Count)
	if count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == True then
				Tell( OwnerID() , OwnerID() , GetName( ID ).." : "..ID )
			end
		end
	end	
end

function LuaSuez_RunningMSG() --區域跑馬燈
	BeginPlot( OwnerID() , "LuaSuez_RunningMSG02" , 0 )
end
function LuaSuez_RunningMSG02()
	DialogCreate( OwnerID() , EM_LuaDialogType_Input  , " Input Your Message : "); 
	DialogSelectStr( OwnerID() , "Accept" );
	DialogSelectStr( OwnerID() , "Cancel");

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return;
	end

	local SelectID = -2;
	local inputstring = "";
	for i = 0 , 600 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
			inputstring = DialogGetInputResult( OwnerID() )
			if( SelectID == 0 ) then
				RunningMsg( OwnerID() , 1 , inputstring.." "..inputstring.." "..inputstring )
			--	ScriptMessage( OwnerID() , -1 , 2 ,  inputstring , 0 )
			end

			DialogClose( OwnerID() )
			break

		elseif i == 600 then
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_OVERTIME_MSG"),0)	
			DialogClose( OwnerID() )		
			break
		end
	end

	DialogClose( OwnerID() );	

end

function LuaSuez_ShakeMSG() --來電震動訊息 如果該區域全部玩家要收到請填 0
	BeginPlot( OwnerID() , "LuaSuez_ShakeMSG01" , 0 )
end
function LuaSuez_ShakeMSG01()
	DialogCreate( OwnerID() , EM_LuaDialogType_Input  , " Who will Get the Msg ? "); 
	DialogSelectStr( OwnerID() , "Accept" );
	DialogSelectStr( OwnerID() , "Cancel");

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return;
	end

	local SelectID = -2;
	local inputstring ;
	for i = 0 , 600 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
			inputstring = DialogGetInputResult( OwnerID() )
			if( SelectID == 0 ) then
				CallPlot( OwnerID() , "LuaSuez_ShakeMSG02" , inputstring )
			--	ScriptMessage( OwnerID() , -1 , 2 ,  inputstring , 0 )
			end

			DialogClose( OwnerID() )
			break

		elseif i == 600 then
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_OVERTIME_MSG"),0)	
			DialogClose( OwnerID() )		
			break
		end
	end

	DialogClose( OwnerID() );	

end

function LuaSuez_ShakeMSG02(Str)
	DialogCreate( OwnerID() , EM_LuaDialogType_Input  , " What Msg Will Be Sended ? "); 
	DialogSelectStr( OwnerID() , "Accept" );
	DialogSelectStr( OwnerID() , "Cancel");
	local Count = SetSearchAllPlayer(ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ))
	local PPL  = {}

	if count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == True then
				PPL[i] = ID
			end
		end
	else
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		return
	end

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return;
	end

	local SelectID = -2;
	local inputstring = ""
	local Who 
	if tonumber(Str) == nil or tonumber(Str) == false then
		if count ~= 0 then
			for i = 1 , Count , 1 do
				if CheckID(PPL[i]) == true and GetName(PPL[i]) == Str then
					Who = PPL[i]
					break
				end
			end
		else
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			return
		end
	else
		Who = tonumber(Str)
	end
	for i = 0 , 600 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
			inputstring = DialogGetInputResult( OwnerID() )
			if( SelectID == 0 ) then
				if Who ~= 0 then
					if CheckID( Who) == true then
						CallPlot( Who, "LuaSuez_ShakeYourBody" , inputstring )
					else
						Tell( OwnerID() , OwnerID() , "Can't Find " )
					end
				else
					for i = 1 , Count , 1 do
						if CheckID( PPL[i] ) == true then
							CallPlot( PPL[i]  , "LuaSuez_ShakeYourBody" , inputstring )
						end
					end
				end
			end

			DialogClose( OwnerID() )
			break

		elseif i == 600 then
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_OVERTIME_MSG"),0)	
			DialogClose( OwnerID() )		
			break
		end
	end

	DialogClose( OwnerID() );	

end

function LuaSuez_ShakeYourBody(str)
	local result = ""
	if BeginCastBar( OwnerID(), "You Have a Message! ", 30 , ruFUSION_ACTORSTATE_EMOTE_DANCE, ruFUSION_ACTORSTATE_NORMAL, 0 ) ~= 1 then
		return
	end	
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( OwnerID() );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- 成功
				result = "OKOK"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- 失敗
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
	ScriptMessage( OwnerID(), OwnerID(),  2 , GetName(TargetID()).." Send You a MSG :"..str , 0 );
	ScriptMessage( OwnerID(), OwnerID(),  0 , GetName(TargetID()).." Send You a MSG :"..str , 0 );
end

function LuaSuez_CheckBuffMsg()
--	BeginPlot( OwnerID() ,"LuaSuez_CheckBuffMsg_Sub" , 0)
--end
--function LuaSuez_CheckBuffMsg_Sub()
	local Target 
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 1 then
		Target= ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	else
		Target = OwnerID() 
	end
	local Count = BuffCount (Target)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Target , i , EM_BuffInfoType_BuffID )
		local LV = BuffInfo( Target, i , EM_BuffInfoType_Power )
		local Cast = BuffInfo( Target , i ,EM_BuffInfoType_OwnerID)
		local Time = BuffInfo( Target , i ,EM_BuffInfoType_Time)
		Tell( OwnerID() , OwnerID() , "Name:"..GetName(Target).." BUFFID : "..BuffID.."  NowLV:"..LV.." CastBy:"..GetName(Cast).." Timer:"..Time )
	end
end

function Discowood_Fly(HowMuch)
	local X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID(),EM_RoleValue_Dir)
	DebugMsg(0,0,"X="..X.."##Y="..Y.."%%Z="..Z)
	ChangeZone(OwnerID(),Lua_ExGetZone(OwnerID()),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),X,Y+HowMuch,Z,Dir )
	DebugMsg(0,0,"X="..ReadRoleValue(OwnerID(),EM_RoleValue_X).."##Y="..ReadRoleValue(OwnerID(),EM_RoleValue_Y).."%%Z="..ReadRoleValue(OwnerID(),EM_RoleValue_Z))
end

function LuaSuez_Writh_of_God()
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , " 2WW Destroy all creatures. They can't be regenerated "); 
	DialogSelectStr( OwnerID() , "YES" );
	DialogSelectStr( OwnerID() , "NO");

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return;
	end

	local SelectID = -2;
	local inputstring = "";
	for i = 0 , 600 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
			inputstring = DialogGetInputResult( OwnerID() )
			if( SelectID == 0 ) then
				RunningMsg( OwnerID() , 1 , GetName(OwnerID()).." Use Writh of God ! All NPC Will Be Destroy ! ")
				if  ZoneID > 29 and ZoneID < 52 then
					local NPC = SetSearchAllNPC(RoomID)
					local ID
					if NPC == 0 then
						RunningMsg( OwnerID() , 1 , "Oh......Shit......Counter Spell ! ")
					else
						for i=1, NPC ,1 do
							ID = GetSearchResult()
							if	ReadRoleValue(ID ,EM_RoleValue_OrgID) ~= 110001	then
									SetModeEX( ID , EM_SetModeType_Save , false )
									DelObj( ID )
							end
						end
					end
				else
					RunningMsg( OwnerID() , 1 , "Oh......Shit......Counter Spell ! ")
				end
			end

			DialogClose( OwnerID() )
			break

		elseif i == 600 then
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_OVERTIME_MSG"),0)	
			DialogClose( OwnerID() )		
			break
		end
	end

	DialogClose( OwnerID() );	
	
end

function LuaSuez_CheckArea()
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	Say( OwnerID() , Area )
end

function Lua_DialogClose()
	DialogClose( OwnerID() )
end