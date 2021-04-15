function Lua_GuessNumber_0()
	local NumTable = { [1] = 1, [2] = 2 , [3] = 3 , [4] = 4 , [5] = 5 , [6] = 6 , [7] = 7 , [8] = 8 , [9] = 9 }

	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "Welcome to Guess Number , Do You Want to Start Game ? "); 
	DialogSelectStr( OwnerID() , "Yes" );
	DialogSelectStr( OwnerID() , "No");

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return;
	end

	local SelectID = -2;
	for i = 0 , 600 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
			inputstring = DialogGetInputResult( OwnerID() )
			if( SelectID == 0 ) then
				for i = 1 , 4 , 1 do
					local Num
					local RandNum = DW_Rand( table.getn(NumTable) )
					Num = NumTable[RandNum]
					table.remove(NumTable, RandNum )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register + i , Num )
				end
				WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
				BeginPlot( OwnerID() , "Lua_GuessNumber_1" , 0 )
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

function Lua_GuessNumber_1()
	DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "Please Input 4 Number , Every Number onle be 1 ~ 9 , Every Number can't be same for another :"); 
	DialogSelectStr( OwnerID() , "Get It " );
	DialogSelectStr( OwnerID() , "Give Up");

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return;
	end

	local SelectID = -2;
	local inputstring
	for i = 0 , 600 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
			inputstring = DialogGetInputResult( OwnerID() )
			if tonumber(inputstring) == nil or tonumber(inputstring) == false then
				inputstring = 0
			else
				inputstring = tonumber(inputstring) 
			end
			if( SelectID == 0 ) then
				CallPlot( OwnerID() , "Lua_GuessNumber_2" , inputstring )
			elseif( SelectID == 1 ) then
				BeginPlot( OwnerID() , "Lua_GuessNumber_3" ,0)
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

function Lua_GuessNumber_2( Number)
	local Check = 1
	local CheckNum = {}
	if Number < 1234 or Number > 9876 then
		Check = 0
	else
		CheckNum[1] = math.floor( Number/1000 )
		CheckNum[2] = math.floor( Number/100 ) - 10*CheckNum[1]
		CheckNum[3] = math.floor( Number/10 ) - 100*CheckNum[1] - 10*CheckNum[2]
		CheckNum[4] = Number - 1000*CheckNum[1] - 100*CheckNum[2] - 10*CheckNum[3] 
		for i = 1 , 3 , 1 do
			for j = 1 , 4 , 1 do
				if ( i ~= j and CheckNum[i] == CheckNum[j] ) or CheckNum[i] == 0 then
					Check = 0
					break
				end
			end
			if Check == 0 then
				break
			end
		end
	end
	if Check == 0 then
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "Error Number , Please input Again"); 
		DialogSelectStr( OwnerID() , "Continue" );
		DialogSelectStr( OwnerID() , "Exit");

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return;
		end

		local SelectID = -2;
		for i = 0 , 600 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
				inputstring = DialogGetInputResult( OwnerID() )
				if( SelectID == 0 ) then
					BeginPlot( OwnerID() , "Lua_GuessNumber_1" ,0)
				--	ScriptMessage( OwnerID() , -1 , 2 ,  inputstring , 0 )
				end

				DialogClose( OwnerID() )
				break

			elseif i == 600 then
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_OVERTIME_MSG"),0)	
				BeginPlot( OwnerID() , "Lua_GuessNumber_1" ,0)
				DialogClose( OwnerID() )
				break
			end
		end
	else
		local Time = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
		local A = 0
		local B = 0
		Time = Time + 1
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , Time )
		for i = 1 , 4 , 1 do
			for j = 1 , 4 , 1 do
				if CheckNum[i] == ReadRoleValue( OwnerID() , EM_RoleValue_Register + j ) then
					if i == j then
						A = A + 1
					else
						B = B + 1
					end
				end
			end
		end
		if A == 4 then
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "This is "..Time.."th Input , Your Number "..Number.." Is the Answer ! "); 
			DialogSelectStr( OwnerID() , "Continue" );
			DialogSelectStr( OwnerID() , "exit");
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "This is "..Time.."th Input , the Reslt of Your Number "..Number.." is "..A.." A "..B.." B"); 
			DialogSelectStr( OwnerID() , "Continue" );
			DialogSelectStr( OwnerID() , "Give Up");
		end
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return;
		end

		local SelectID = -2;
		for i = 0 , 600 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
				inputstring = DialogGetInputResult( OwnerID() )
				if( SelectID == 0 ) then
					if A == 4 then
						BeginPlot( OwnerID() , "Lua_GuessNumber_0" ,0)
					else
						BeginPlot( OwnerID() , "Lua_GuessNumber_1" ,0)
					end
				elseif( SelectID == 1 ) and A ~= 4 then
					BeginPlot( OwnerID() , "Lua_GuessNumber_3" ,0)
				end

				DialogClose( OwnerID() )
				break

			elseif i == 600 then
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_OVERTIME_MSG"),0)	
				BeginPlot( OwnerID() , "Lua_GuessNumber_1" ,0)
				DialogClose( OwnerID() )
				break
			end
		end
	end
	DialogClose( OwnerID() );
end

function Lua_GuessNumber_3()
	local Num
	local A = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	local B = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	local C = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 3 )
	local D = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 4 )
	Num = 1000*A + 100*B + 10*C + D
	ScriptMessage( OwnerID() , OwnerID() , 2 , "The Answer is :"..Num , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "The Answer is :"..Num , 0 )
end
