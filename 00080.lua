--�Q�ΰ}�C�A�Ыؤ@�ӿ��i�H�H���X�{5�Ӯy�M�A�����a��ܡA��ܫ᪱�a�|�����W�y�M�A�`�H���y�M�ƶq20�A�X�{���y�M���n��W����ܪ��@��
function Lua_practice_01()
	local Owner = OwnerID()
	local Mount = {	501417, 501418, 501440, 501441, 501444, 
			501445, 501446,	501619, 501620, 501621, 
			501622, 501623, 501624, 501625, 501626, 
			501627,	501634, 501635, 501649, 501651,	
			501652, 501653, 501654, 501655, 501656	} --�Ҧ������M
	local MountList = {} --��X�����M
	local UsedMount = ReadRoleValue( Owner , EM_RoleValue_PID) --Ū�����a��PID�ȡA�T�{�W�@���ϥΪ����M
		
	while (#MountList) < 5 do  --�Y��X�����M��������
		local R = Rand ( #Mount)  
		if Mount[R] ~= UsedMount then
			Table.insert( MountList , Mount[R] )
			Table.remove( Mount , Mount[R]	)
		end
	end


	DialogCreate( Owner , EM_LuaDialogType_Select , "choose a mount" )

	DialogSelectStr( Owner, MountList[1] )
	DialogSelectStr( Owner, MountList[2] )
	DialogSelectStr( Owner, MountList[3] )
	DialogSelectStr( Owner, MountList[4] )
	DialogSelectStr( Owner, MountList[5] )

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --��ưe�X�����D
		return 0
	end
	
	local SelectID = Hsiang_GetDialogResoult( Owner );--�����]�_�Ӫ����ݦ^�Х�function
	
	if SelectID == 1 then
		addbuff( Owner , MountList[1] , 0, -1)
	elseif SelectID == 2 then
		addbuff( Owner , MountList[2] , 0, -1)
	elseif SelectID == 3 then
		addbuff( Owner , MountList[3] , 0, -1)
	elseif SelectID == 4 then
		addbuff( Owner , MountList[4] , 0, -1)
	elseif SelectID == 5 then
		addbuff( Owner , MountList[5] , 0, -1)
	end
	WriteRoleValue( Owner , EM_RoleValue_PID , MountList[SelectID] ) --�N���M��ID�g�J���a��PID�Ȱ�����

	DialogClose( Owner )
end



--lua�i���D��1�G�b���a�e��C50�Z���إ�1�ӽc�l�@10�ӽc�l�A�b�c�l�W����10�Ӥ��@�˪�npc�A�C������W����npc�H�����t

function Lua_na_homework2()
	local Owner = OwnerID()
	local NPCList = {	110019, 110020, 110021, 110023, 110024, 
			110049, 110050, 110075, 110165, 110167	} --10��NPC
	local Box = {}	

	for i = 1 , 10 do	
		Box[i] = Lua_CreateObjByDir( Owner, 116976 , 50*i , 0 ) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
		AddToPartition(Box[i], 0 ) --���ͽc�l

		local x,y,z,dir=DW_Location(Box[i]); --��c�l���y��
		local R = DW_Rand(#NPCList)	 --�H����NPC�M��
		local NPC = CreateObj( NPCList[R] , x, y+10 , z , dir , 1 ) --����NPC
		table.remove(NPCList , R)
		SetModeEx(NPC, EM_SetModeType_Gravity, false)
		AddToPartition(NPC, 0 )			
		SetDefIdleMotion(NPC, ruFUSION_MIME_SIT_CHAIR_LOOP)	
	end
end
-----------------------------------------------------------------------------------------------------------
function na_test_fly()
	local Owner = OwnerID()
	local RNpc = SearchRangeNPC( Owner , 500)
	local Box = 116976

	for i = 0 , #RNpc do
		if ReadRoleValue( RNpc[i], EM_RoleValue_OrgID) == Box then
			local x,y,z,dir = DW_Location( RNpc[i] ) --��c�l���y��
			local x1, y1 , z1 ,dir1 = DW_Location( Owner)

			local stair =  CreateObj( 121165 , x1, y1, z1 ,dir1, 1 )
			SetModeEx(stair, EM_SetModeType_Gravity, false)
			SetModeEx(stair, EM_SetModeType_Obstruct, true)
			AddToPartition( stair , 0 )
			MoveDirect( stair, x, y, z ) 
			Say( Owner , "OK!" )
			Sleep(30)
			DelObj( stair)
			break
		end
	end
end

----------------------------------------------------------------------------------------------------------------
function Lua_na_Test_Count(ID)
	local Owner = OwnerID()
	local num = CountItem(Owner , ID)
	Say( Owner, "Count = "..num )
end

function Lua_na_delobj(ID)
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 3000)
	for i=0 , #NPC do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == ID then
			SetModeEx( NPC[i] ,EM_SetModeType_Save, false )
		end
	end
end


function Lua_na_delobj1(ID)
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 3000)
	for i=0 , #NPC do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == ID then
			DelObj( NPC[i] )
			DebugMsg( 0,0,"Del done!" )
		end
	end
end

function Z32_Q427124Msg_na() 
     local Player = OwnerID() 
     local PlayerLv = ReadRoleValue( Player, EM_RoleValue_LV ) 
     local RequiredLv = 93 
     local ZoneID = ReadRoleValue( Player, EM_RoleValue_ZoneID ) 
     local RealZoneID = ReadRoleValue( Player, EM_RoleValue_RealZoneID ) 
  	   if CheckID( Player ) == true and PlayerLv >= RequiredLv and  ZoneID == RealZoneID then 
 		--RunningMsg( Player, 0, "Hellow_World_!!" ) 
     		--ScriptMessage( Player, Player, 2, "Hellow_World_!!", 0 ) 
     	   	  RunningMsgEx( Player, 0, 3, ZoneID ) 
	end
end



function Lua_na_TESTID()
	local Owner = OwnerID()
	local Target = TargetID()
	local DBID = ReadRoleValue( Target , EM_RoleValue_DBID)
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID)
	Say( Owner , "DBID = "..DBID)
	Say( Owner , "ORGID = "..ORGID)
	local GUID = GetGUIDByDBID(DBID)
	Say( Owner , "GUID = "..GUID)
end


function Lua_na_SW_cls_gamemenu()
	local Owner = OwnerID()
--	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	SetSmallGameMenuType( Owner , 3 ,2 ) --��������
	say(owner,"123")
	return true
end


