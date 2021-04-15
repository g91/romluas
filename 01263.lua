function CheckSummonPet(MonsterID)
	local Obj
	local Count = SetSearchRangeInfo( OwnerID(), 200 )
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:OrgID() == MonsterID and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and ReadRoleValue( ID , EM_RoleValue_OwnerDBID ) == ReadRoleValue( OwnerID() , EM_RoleValue_DBID ) then
			DelObj(ID)
			local Name = Obj:OrgID()
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--�A�^���F�d��
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--�A�^���F�d��
			return false
		end
	end
	return true
end
function CheckRideHorse(BaseMagicID)
--	Say(OwnerID(),"CheckBuffing...")
--	Say(OwnerID(),"BaseMagicID = "..BaseMagicID)
	-- 2013.02.05 �s�W�T���M�����@��Buff
	local Player = OwnerID()
	local Buff = 624013 --�T���M��
	if CheckBuff( Player , Buff ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_THANKS_2011_12]" , C_SYSTEM )	-- ���ʶi�椤�A���B�L�k�M�����M�I
		ScriptMessage( Player , Player , 0 , "[SC_THANKS_2011_12]" , C_SYSTEM )
		return false
	end
	--
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	-- 2013.02.19 �s�W�ܨ����A�U�T���M�����ˬd
	for Pos = 0 , Count , 1 do
		local BuffID = BuffInfo( Player , Pos , EM_BuffInfoType_BuffID )		-- Ū����Buff��ID
		local ChangeID	= GameObjInfo_Int( BuffID ,"ChangeID" )		-- Ū����Buff���ܨ��ϧ�ID
		if ChangeID ~= 0 then
			ScriptMessage( Player , Player , 1 , "[SC_NORIDE]" , C_RED )	-- �ܨ����A���i�H�M�����M�A�иѰ��ܨ����A�A�M�����M�C
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
		if BuffType == 68 and BuffID ~= BaseMagicID then		--/*���M��
		--	--Say(OwnerID(),"DialogCreate")
		--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_CANCELHORSE]")
		--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		--	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		--	if( DialogSendOpen( OwnerID() ) == false ) then 
		--		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--		--��ưe�X�����D
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

-- 2013.08.13 �ץ��l���[����d����A��ƹ���в����d���ɡA�L�k����d����T�����D�C
function Hao_Pet_SetModeEx()

	local Pet = OwnerID()
	local Zone = ReadRoleValue( Pet , EM_RoleValue_ZoneID )

	if Zone == 402 or Zone >= 440 and Zone <= 450 then
		SetModeEx( Pet , EM_SetModeType_Mark , false )	-- �����аO
	else
		SetModeEx( Pet , EM_SetModeType_Mark , true )	-- �}�ҼаO
	end
end