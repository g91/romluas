function Lua_GiveObject_Batch()
	DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "Input Object ID" )
	DialogSelectStr( OwnerID() , "[SC_202800_2]" )	-- 確定
	DialogSelectStr( OwnerID() , "[SC_202800_3]" )	-- 取消

	if ( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	--資料送出有問題
		return
	end

	local SelectID = -2
	local ObjectID = 0
	for i = 0 , 600 do
		Sleep( 1 )
		SelectID = DialogGetResult( OwnerID() )
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) then
			ObjectID = DialogGetInputResult( OwnerID() )
			ObjectID = tonumber(ObjectID)
			if( SelectID == 0 ) then
				DialogClose( OwnerID() )
				--if ObjectID >= 210000 and tonumber(ObjectID) < 230000 then
					CallPlot( OwnerID() , "Lua_GiveObject_Batch_01" , tonumber(ObjectID) )
				--end
				break
			else
				DialogClose( OwnerID() )
				break
			end
		end
	end
end

function Lua_GiveObject_Batch_01( ObjectID )
	DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "Input Object Number" )
	DialogSelectStr( OwnerID() , "[SC_202800_2]" )	-- 確定
	DialogSelectStr( OwnerID() , "[SC_202800_3]" )	-- 取消

	if ( DialogSendOpen( OwnerID() ) == false ) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	--資料送出有問題
		return
	end

	local SelectID = -2
	local ObjectNum = 0
	for i = 0 , 600 do
		Sleep( 1 )
		SelectID = DialogGetResult( OwnerID() )
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) then
			ObjectNum = DialogGetInputResult( OwnerID() )
			ObjectNum = tonumber(ObjectNum)
			if( SelectID == 0 ) then
				DialogClose( OwnerID() )
				if ObjectNum >= 0 and ObjectNum < 150 then
					for i = 1 , ObjectNum do
						ObjectID = ObjectID + 1
						GiveBodyItem( OwnerID() , ObjectID , 1 )
						Sleep( 7 )
					end
					break
				end
			else
				DialogClose( OwnerID() )
				break
			end
		end
	end
end