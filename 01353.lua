

function LuaS_MusicFestival_Phamtom()	--�p�ɾ�
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Step = 0
	local Array = {}
	local Xtime = 0
	local Flag = 780304		--�X�l�s��
	local MonsterID = 0
	local BornString
	local Obj = Role:new( OwnerID() )
	local Phamtom = 0
	local MonsterID = 0
	local LittlePhamtom
	local Angel = 0
	local Box = {}
------------------------------------------------
	while true do
----------------------------------------------�ɶ��B�z
		if Step == 0 then
			local NPCBOSS = "dead"
			local Obj
			local List = SearchRangeNPC( OwnerID() , 500 );
			local Owner = Role:new( OwnerID() );
			for i = 0 , table.getn(List)-1 do
				Obj = Role:New( List [i] )
				if Obj:OrgID() == 101844 then
					NPCBOSS = "life"
				end
			end
			if NPCBOSS == "dead" then 
				Phamtom  = CreateObjByFlag( 101844, 780330, 0, 1)        
				SetModeEx( Phamtom   , EM_SetModeType_Strikback, true )--����
				SetModeEx( Phamtom   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( Phamtom   , EM_SetModeType_Obstruct, false )--����
				SetModeEx( Phamtom   , EM_SetModeType_Mark, true )--�аO
				SetModeEx( Phamtom   , EM_SetModeType_Move, true )--����
				SetModeEx( Phamtom   , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Phamtom   , EM_SetModeType_HideName, true )--�W��
				SetModeEx( Phamtom   , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( Phamtom   , EM_SetModeType_Fight , true )--�i�������
				SetModeEx( Phamtom   , EM_SetModeType_Show , true ) --�����
				AddToPartition( Phamtom  , 0)  
				Step = 1
			else
				Step = 1
			end
		elseif Step == 1 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				ScriptMessage( Phamtom , 0 , 1 , "[SC_DAN_101844_5]", C_SYSTEM ) --�O���x�����Z�ڡI��Q���ڱq�L���W�����I���ۧa�I
			    	Say( Phamtom , "[SC_DAN_101844_5]")  				 --��NPC�o�e�T��
				MonsterID = 101843
				LittlePhamtom = Lua_MusicFestival_BornPhamtom(MonsterID)
				Step = 2
			else
				Step = 99
			end
		elseif Step == 2 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				--�ˬd�ѴX����
				MonsterID = 101843
				local Survivor = 0
				local T2Obj
				local T2Count = SetSearchRangeInfo( OwnerID() , 400 )
				for i = 1 , T2Count , 1 do
					local T2ID = GetSearchResult()
					T2Obj = Role:New( T2ID )
					if T2Obj:RoomID() == RoomID and T2Obj ~= OwnerID() then
						local FlagOrgID = T2Obj:OrgID()
						if (FlagOrgID == MonsterID) then  --
							--DebugMsg( 0, RoomID ,"**Survivor1 Add")
							Survivor = Survivor + 1
						end
					end
				end
				if Survivor == 0 then
					Step = 3
				end
			else
				Step = 99				
			end
		elseif Step == 3 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				ScriptMessage( Phamtom , 0 , 1 , "[SC_DAN_101844_5]", C_SYSTEM ) --�O���x�����Z�ڡI��Q���ڱq�L���W�����I���ۧa�I
			    	Say( Phamtom , "[SC_DAN_101844_5]")  				 --��NPC�o�e�T��
				MonsterID = 101994
				LittlePhamtom = Lua_MusicFestival_BornPhamtom(MonsterID)
				Step = 4
			else
				Step = 99
			end
		elseif Step == 4 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				--�ˬd�ѴX����
				MonsterID = 101994
				local Survivor = 0
				local T2Obj
				local T2Count = SetSearchRangeInfo( OwnerID() , 400 )
				for i = 1 , T2Count , 1 do
					local T2ID = GetSearchResult()
					T2Obj = Role:New( T2ID )
					if T2Obj:RoomID() == RoomID and T2Obj ~= OwnerID() then
						local FlagOrgID = T2Obj:OrgID()
						if (FlagOrgID == MonsterID) then  --
							--DebugMsg( 0, RoomID ,"**Survivor1 Add")
							Survivor = Survivor + 1
						end
					end
				end
				if Survivor == 0 then
					Step = 5
				end
			else
				Step = 99				
			end
		elseif Step == 5 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				ScriptMessage( Phamtom , 0 , 1 , "[SC_DAN_101844_5]", C_SYSTEM ) --�O���x�����Z�ڡI��Q���ڱq�L���W�����I���ۧa�I
			    	Say( Phamtom , "[SC_DAN_101844_5]")  				 --��NPC�o�e�T��
				MonsterID = 101995
				LittlePhamtom = Lua_MusicFestival_BornPhamtom(MonsterID)
				--DeadPlot = LuaDan_101844_WhokillPhamtom ()
				--SetPlot( LittlePhamtom , "dead" , "LuaDan_101844_WhokillPhamtom" , 0 )
				Step = 6
			else
				Step = 99
			end
		elseif Step == 6 then
			local Buff = CheckBuff( Phamtom, 503325)
			if Buff == true then
				--�ˬd�ѴX����
				MonsterID = 101995
				local Survivor = 0
				local T2Obj
				local T2Count = SetSearchRangeInfo( OwnerID() , 400 )
				for i = 1 , T2Count , 1 do
					local T2ID = GetSearchResult()
					T2Obj = Role:New( T2ID )
					if T2Obj:RoomID() == RoomID and T2Obj ~= OwnerID() then
						local FlagOrgID = T2Obj:OrgID()
						if (FlagOrgID == MonsterID) then  --
							--DebugMsg( 0, RoomID ,"**Survivor1 Add")
							Survivor = Survivor + 1
						end
					end
				end
				if Survivor == 0 then
					Step = 7
				end
			else
				Step = 99				
			end
		elseif Step == 7 then
			local Obj = Role:new( Phamtom )
			DelObj(Phamtom)
			MonsterID = 102012 
	--		local angenpc = LuaFunc_SearchNPCbyOrgID( TargetID() , 102012, 3000 , 0)       --���j��
			Angel = CreateObjByFlag( MonsterID, 780330, 0, 1)  --�ͥX�Ѩ�
			SetModeEx( Angel   , EM_SetModeType_Strikback, false )--����
			SetModeEx( Angel   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Angel   , EM_SetModeType_Obstruct, false )--����
			SetModeEx( Angel   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( Angel   , EM_SetModeType_Move, false )--����
			SetModeEx( Angel   , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Angel   , EM_SetModeType_HideName, true )--�W��
			SetModeEx( Angel   , EM_SetModeType_ShowRoleHead, true )--�Y����
			SetModeEx( Angel   , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Angel   , EM_SetModeType_Show , true ) --�����
			AddToPartition(Angel,0)
			Say( Angel , "[SC_DAN_101844_6]")  	--�P�§A�N�ڱq�o�Ǵc�]��W�Ϧ^�ӡI���§A�a�ӯ��R�����ֱ۫ߡI���ڦA�׫�_�}�Ԫ��߱��I
			BeginPlot( OwnerID(), "Lua_MusicFestival_BornTresure", 0 )
			Xtime = 0
			Step = 8
		elseif Step == 8 then
			if Xtime <= 300 then
			--	ScriptMessage( Phamtom , 0 , 1 , "[SC_DAN_101844_7]", C_SYSTEM ) --�O���x�����Z�ڡI��Q���ڱq�L���W�����I���ۧa�I
			--	Say( Phamtom , "[SC_DAN_101844_7]")  				 --��NPC�o�e�T��
				sleep(1200)  --�̨έק� �쬰sleep(400)
				DelObj(Angel)
				sleep(300)				
				Step = 0
			end
		elseif Step == 99 then
			local T2Obj = SearchRangeNPC(OwnerID() , 1000)
			for i = 1 , table.getn( T2Obj ) do
				local ObjOrgID = ReadRoleValue( T2Obj[i] , EM_RoleValue_OrgID )
				local ObjRoomID = ReadRoleValue(T2Obj[i] , EM_RoleValue_RoomID)
				if ObjRoomID == RoomID then
					if (ObjOrgID == 101843) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101994) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101995) then
						DelObj(T2Obj[i])
					end
				end
			end
			Step = 0
		end
		--DebugMsg( 0, RoomID ,"Xtime = "..Xtime)
		Xtime = Xtime + 1
		sleep(10)
	end
end
--------------------------------------------------------------------------------------------------
function Lua_MusicFestival_BornTresure()
	local Box = {}
	for i = 0, 4 do 
		Box[i] = CreateObjByFlag( 114320, 780331, i, 1)  
		SetModeEx( Box[i]  , EM_SetModeType_Strikback, false )--����
		SetModeEx( Box[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Box[i]  , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Box[i]  , EM_SetModeType_Mark, true )--�аO
		SetModeEx( Box[i]   , EM_SetModeType_Move, false )--����
		SetModeEx( Box[i]  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Box[i]  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Box[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( Box[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Box[i]   , EM_SetModeType_Show , true ) --���
		AddToPartition( Box[i]  , 0)  
		SetPlot(Box[i],"touch","LuaDan_101844_treasure",30)
		BeginPlot( Box[i], "Lua_MusicFestival_boxdie", 1200 )
	end
end
--------------------------------------------------------------------------------------------------
function Lua_MusicFestival_boxdie() --�_�c�X�{��2��������
	--Say(OwnerID(), "box die")
	sleep(10)
	DelObj(OwnerID())
end	

function Lua_MusicFestival_BornPhamtom(MonsterID)
	local LittlePhamtom = {}
	for i = 1, 5 do 
		LittlePhamtom[i] = CreateObjByFlag( MonsterID, 780331, i-1, 1)  --�ͥX�p�y�v
		SetModeEx( LittlePhamtom[i]  , EM_SetModeType_Strikback, true )--����
		SetModeEx( LittlePhamtom[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( LittlePhamtom[i]  , EM_SetModeType_Obstruct, false )--����
		SetModeEx( LittlePhamtom[i]  , EM_SetModeType_Mark, true )--�аO
		SetModeEx( LittlePhamtom[i]   , EM_SetModeType_Move, true )--����
		SetModeEx( LittlePhamtom[i]   , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( LittlePhamtom[i]    , EM_SetModeType_HideName, true )--�W��
		SetModeEx( LittlePhamtom[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( LittlePhamtom[i], EM_SetModeType_Fight , true )--�i�������
		SetModeEx( LittlePhamtom[i]   , EM_SetModeType_Show , true ) --�����
		AddToPartition( LittlePhamtom[i]  , 0)  
	end
	return LittlePhamtom
end
--------------------------------------------------------------------------------------------------
function LuaDan_101844_treasure()
--	Say(OwnerID(), "OwnerID 1")			
--	Say(TargetID(), "TargetID 1")

--	local Flag =  CheckFlag(OwnerID()  , 542666)  
	local Flag2 =  CheckFlag(OwnerID()  , 542553)                                                  

	if Flag2 ==  false  then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112502_NOSTART]" , C_SYSTEM ) --�A�٨S�ѥ[�o�Ӭ��ʳ��I
	else
		SetPlot( TargetID(),"touch","",0 )
		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--���L���A�еy�ԦA�աC
			return										--
		end											--
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )					--
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
						GiveBodyItem( OwnerID(), 720627, 1)  
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						DelObj(TargetID())  
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
						WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
						SetPlot( TargetID(),"touch","LuaDan_101844_treasure",50 )
					end	
				end
			elseif ( result == "DAME" ) then
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C 
				SetPlot( TargetID(),"touch","LuaDan_101844_treasure",50 )
			end
		end
	end
end

function lua_mika_musicfes_boxtest()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_PID) 
	Say(OwnerID(), "OwnerID")
	Say(OwnerID(), X)
end

--------------------------------------------------------------------------------------------------
function LuaDan_101844_Item_check()  --�ˬd�����~�O�_�b�S�wNPC���W
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 101844 

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_101844_item]" , C_SYSTEM )	--�ШϥΩ�y�v���W�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_101844_item]" , C_SYSTEM )	--�ШϥΩ�y�v���W�C
		return false	
	end
end
--------------------------------------------------------------------------------------------------
function LuaDan_101844_WhokillPhamtom()
--Say(OwnerID(), "3")
--Say(TargetID(), "4")
	SetPlot( OwnerID() , "dead" , "LuaDan_101844_WhokillPhamtom2" , 40 )

end
--------------------------------------------------------------------------------------------------
function LuaDan_101844_WhokillPhamtom2()
--Say(OwnerID(), "5")
--Say(TargetID(), "6")

	--local Player = OwnerID()

	SetFlag( TargetID()  , 542666 , 1 )   

	return true

end