function CheckSummonPet(MonsterID)
	local Obj
	local Count = SetSearchRangeInfo( OwnerID(), 200 )
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:OrgID() == MonsterID and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and ReadRoleValue( ID , EM_RoleValue_OwnerDBID ) == ReadRoleValue( OwnerID() , EM_RoleValue_DBID ) then
			DelObj(ID)
			local Name = Obj:OrgID()
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--你回收了寵物
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--你回收了寵物
			return false
		end
	end
	return true
end
function CheckRideHorse(BaseMagicID)
--	Say(OwnerID(),"CheckBuffing...")
--	Say(OwnerID(),"BaseMagicID = "..BaseMagicID)
	-- 2013.02.05 新增禁止騎乘的共用Buff
	local Player = OwnerID()
	local Buff = 624013 --禁止騎乘
	if CheckBuff( Player , Buff ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_THANKS_2011_12]" , C_SYSTEM )	-- 活動進行中，此處無法騎乘坐騎！
		ScriptMessage( Player , Player , 0 , "[SC_THANKS_2011_12]" , C_SYSTEM )
		return false
	end
	--
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	-- 2013.02.19 新增變身狀態下禁止騎乘的檢查
	for Pos = 0 , Count , 1 do
		local BuffID = BuffInfo( Player , Pos , EM_BuffInfoType_BuffID )		-- 讀取該Buff的ID
		local ChangeID	= GameObjInfo_Int( BuffID ,"ChangeID" )		-- 讀取該Buff的變身圖形ID
		if ChangeID ~= 0 then
			ScriptMessage( Player , Player , 1 , "[SC_NORIDE]" , C_RED )	-- 變身狀態不可以騎乘坐騎，請解除變身狀態再騎乘坐騎。
			return false
		end
	end
	--
	for i = 0 , Count do
		local BuffID = BuffInfo( OwnerID() , i , EM_BuffInfoType_BuffID )
--		Say(OwnerID(),"BuffID = "..BuffID)
		if BuffID == BaseMagicID then
			CancelBuff_NoEvent( OwnerID() , BuffID )
			return false
		end
		if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
--			Say(OwnerID(),"BuffType = "..BuffType)
		end
		if BuffType == 68 and BuffID ~= BaseMagicID then		--/*有騎乘
		--	--Say(OwnerID(),"DialogCreate")
		--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_CANCELHORSE]")
		--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		--	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		--	if( DialogSendOpen( OwnerID() ) == false ) then 
		--		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--		--資料送出有問題
		--		return
		--	end
		--	local Answer
		--	for i = 0 , 100 , 1 do
		--		Sleep( 1 );
		--		SelectID = DialogGetResult( OwnerID() );
		--		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
		--			if ( SelectID == 0 ) then
		--				Answer = true
		--				DialogClose( OwnerID() )
		--				break;
		--			elseif ( SelectID == 1 ) then
		--				Answer = false
		--				DialogClose( OwnerID() )		
		--				break
		--			end
		--		elseif i == 100 then
		--			Answer = false
		--			DialogClose( OwnerID() )		
		--			break
		--		end
		--	end
		--	if Answer == true then
		--		return true
		--	else
		--		return false
		--	end
		--	CancelBuff_NoEvent( OwnerID() , BuffID )
			return true
		end
	end
	return true
end

-- 2013.08.13 修正召換觀賞用寵物後，當滑鼠游標移至寵物時，無法顯示寵物資訊的問題。
function Hao_Pet_SetModeEx()

	local Pet = OwnerID()
	local Zone = ReadRoleValue( Pet , EM_RoleValue_ZoneID )

	if Zone == 402 or Zone >= 440 and Zone <= 450 then
		SetModeEx( Pet , EM_SetModeType_Mark , false )	-- 關閉標記
	else
		SetModeEx( Pet , EM_SetModeType_Mark , true )	-- 開啟標記
	end
end