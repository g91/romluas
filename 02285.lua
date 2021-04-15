-- Pcall�Ψ禡�A�\�h�v�Tnpc�Ϊ��е��� %t_id �ӧ���Owner�A�b�@�ǧG�m�W�i�o�_��

-- FA_SetHP�G�����]�wHP�q
-- FA_SetHP_Per�G�����]�wHP�]�H�ʤ���^
-- FA_Buff�G���o�θѰ�buff
-- FA_SearchGetPos�G�HOrgID�j�M�A����|���m��T�K�X�ӡA�d��300
-- FA_SearchGetPos_Insane�G�HOrgID�j�M�A����|���m��T�K�X�ӡA�d��300
-- FA_SearchDel�G�HOrgID�j�M�A����N�����C�|�Ǭ�����T���ϥΪ̡A�O�d�Ϧ^���|�C�d��300
-- FA_SearchDel_Insane�G�W�����d��3000���A����ڤW���D������ܪ���A�_�h�i��S��k����o��j
-- FA_SearchModeShow�G�HOrgID�j�M�A��������ܤĿ�C�d��300
-- FA_SearchModeShow_Insane�G�W�����d��3000���A����ڤW���D������ܪ���A�_�h�i��S��k����o��j
-- FA_SearchModeHide�G�HOrgID�j�M�A��������ܨ����Ŀ�C�d��300
-- FA_SearchModeHide_Insane�G�W�����d��3000���A����ڤW���D������ܪ���A�_�h�i��S��k����o��j
-- FA_NonSaveDel�G�HOrgID�j�M�A������u�S���Ŀ��x�s������v�R���C�d��300
-- FA_NonSaveDel_Insane�G�W�����d��3000���A����ڤW���D������ܪ���A�_�h�i��S��k����o��j
-- FA_GOTO�G�i�H��NPC�W�r�������Τ��q�@�����A���X�ӫ��H���ǰe�L�h�C���W�L�d��800������줣��...
-- FA_Fly�G���A���SetPos�ӫDChangeZone�C�p�G���t�ƨ��N�|�ܦ����U�p�C
-- FA_Rotate�G�⪫�������w�����סA�������C
-- FA_Tele�G���e�ǡA�|�W�U�u�ɤO�v��a�O�]�򭸹��������u��@���a�O�����P�^�A�ҥH���D�O�D�`���ݪ��Ҥl�A�_�h�����|�p�i�g�̩β�����
-- FA_TeleInto�G���e�ǡA�������|��a�O�������A�i�H�Ψ��p����A���ɥ����������ܤ�K
-- FA_Digg�G���U�p�A�u�O��Fly�ϹL�Ӿާ@�A���t�ƴN�|�ܦ���
-- FA_GOGO�G������Owner�Ǩ���w�s���]GUID�^������W
-- FA_Who�G��DebugMSG��Owner��GUID�]�]�A���a�^�A�Y�Ǳ��p�U���ΡA�ר�O�Q���D��L���a�Φۤv��GUID��
-- FA_FollowMe�G��ۧڨ��]���ե�Func
-- FA_AttachMe�G�K�ۧڨ��]���ե�Func
-- FA_X�G�̵�X�b���ʫ��w���ȡA�i���t��
-- FA_Y�G�̵�Y�b���ʫ��w���ȡA�i���t��
-- FA_Z�G�̵�Z�b���ʫ��w���ȡA�i���t��
-- FA_Dir�G���ܪ���Dir�]���V
-- FA_GoHigh�G�ѱ�A�b�A���w�����ש�@���a�j�M���A��W�h�A���A���b�Ѫŭ����a���C�A�����F�L�N�۵M�|�����C
-- FA_OverLook�G�����A��ѱ�@�ˡA���O�|�A��a�j���ΡA�i�H�糾���ϡC�����F����@�����|��_
-- FA_Show�G����w����uShow�v�X�ӡ]����Hide�Ϊ̥�AddToPartition���A���Q�u����b�a�ϤW������^
-- FA_CreateByObj�G�HOwner���ǡA�إߤ@�ӧA���w��Ʈw�s����NPC�C�ɺحn��client������npc�������ɭԫܤ�K
-- FA_FaceTo�G��Owner���V�A���w��GUID�s��������C



function FA_SetHP (Int)
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,Int)
end

function FA_SetHP_Per (Int)
	local Owner = OwnerID()
	local NewHP = math.ceil(int * (ReadRoleValue(Owner,EM_RoleValue_MaxHP)/100))
	WriteRoleValue(Owner,EM_RoleValue_HP,NewHP)
end

function FA_Buff (BuffID)
	if CheckBuff(OwnerID(), BuffID) == false then
		AddBuff(OwnerID(),BuffID,0,-1)
	else
		CancelBuff(OwnerID(), BuffID)
	end
end

function FA_SearchGetPos(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 300 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
		end
	end
end

function FA_SearchGetPos_Insane(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 3000 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
		end
	end
end

function FA_SearchDel(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 300 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
			Tell(Owner,Temp,"I'm deleted.")
			DelObj(Temp)
		end
	end
end

function FA_SearchDel_Insane(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 3000 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
			Tell(Owner,Temp,"I'm deleted.")
			DelObj(Temp)
		end
	end
end

function FA_SearchModeShow(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 300 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", i'm showing")
			SetModeEx(Temp,EM_SetModeType_Show,TRUE)
		end
	end
end

function FA_SearchModeShow_Insane(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 3000 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", i'm showing")
			SetModeEx(Temp,EM_SetModeType_Show,TRUE)
		end
	end
end

function FA_SearchModeHide(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 300 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", i'm hiding")
			SetModeEx(Temp,EM_SetModeType_Show,FALSE)
		end
	end
end

function FA_SearchModeHide_Insane(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 3000 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", i'm hiding")
			SetModeEx(Temp,EM_SetModeType_Show,FALSE)
		end
	end
end

function FA_NonSaveDel(ID)
	local Owner = OwnerID()
	local Array = {}
	local Temp
	local TempPos
	local TempOrgID

	ID = ID or 0
	Array = SearchRangeNPC ( Owner , 300 )

	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		TempOrgID = ReadRoleValue(Temp,EM_RoleValue_OrgID)

		if (TempOrgID < 780000 or TempOrgID > 789999)
		and (ID == 0 or TempOrgID == ID)
		and GetModeEx(Temp, EM_SetModeType_Save) == FALSE then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
			Tell(Owner,Temp,"I'm deleted.")
			DelObj(Temp)
		end
	end
end

function FA_NonSaveDel_Insane(ID)
	local Owner = OwnerID()
	local Array = {}
	local Temp
	local TempPos
	local TempOrgID

	ID = ID or 0
	Array = SearchRangeNPC ( Owner , 3000 )

	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		TempOrgID = ReadRoleValue(Temp,EM_RoleValue_OrgID)

		if (TempOrgID < 780000 or TempOrgID > 789999)
		and (ID == 0 or TempOrgID == ID)
		and GetModeEx(Temp, EM_SetModeType_Save) == FALSE then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
			Tell(Owner,Temp,"I'm deleted.")
			DelObj(Temp)
		end
	end
end

function FA_GOTO(Target)
	CallPlot(OwnerID(), "FA_GOTO_02",Target)
end

function FA_GOTO_02(Target)
	local ArgType = Type(Target)
	if ArgType ~= "string" and ArgType ~= "number" then return end
	local Owner = OwnerID()
	local Array = {}
	local Temp
	local IfNext
	Array = SearchRangeNPC ( Owner , 1000 )
	for	i=0,table.getn(Array),1	do
		Temp = Array[i]
		if	(ArgType == "number" and ReadRoleValue(Temp,EM_RoleValue_OrgID) == Target)	or
			(ArgType == "string" and string.find(GetName(Temp),Target) ~= nil)	then
			FA_SetPosByObj(Owner,Temp)
			DialogCreate( Owner,EM_LuaDialogType_YesNo,"Next?")
			DialogSelectStr( Owner , "[SO_YES]" )
			DialogSelectStr( Owner , "[SO_NO]" );
			IfNext = ks_DialogRePort_TwoChoose(Owner,100,100)
			if	IfNext == "No"	then
				return
			end
		end
	end

end

function FA_Fly( Dis )
	local AddHeight = Dis or 200
	local Owner = OwnerID()
	local Pos = {	ReadRoleValue(Owner,EM_RoleValue_X)		,
			ReadRoleValue(Owner,EM_RoleValue_Y) + AddHeight	,
			ReadRoleValue(Owner,EM_RoleValue_Z)		,
			ReadRoleValue(Owner,EM_RoleValue_Dir)			}

	SysCastSpellLv( Owner, Owner, 496177, 0 )

	SetPos(Owner, Unpack(Pos))
	
end

function FA_Rotate( Angle )
	local Owner = OwnerID()
	AdjustDir(Owner,Angle )
end

function FA_Tele( Dis )
	local Owner = OwnerID()
	local Dis = Dis or 300
	local Pos

	SysCastSpellLv( Owner, Owner, 496177, 0 )

	SetPos( Owner , kg_GetPosRX( Owner , nil , Dis ,0) )
--	SetPos( Owner , kg_GetPosRX( Owner , nil , 0 ,0) )

	AddBuff(Owner, 508560, 0, -1)

	Pos = {	ReadRoleValue(Owner,EM_RoleValue_X)		,
		ReadRoleValue(Owner,EM_RoleValue_Y) + 10000	,
		ReadRoleValue(Owner,EM_RoleValue_Z)			}

	Pos[2] = GetHeight(Unpack(Pos))
	Pos[4] = ReadRoleValue(Owner,EM_RoleValue_Dir)

	SetPos( Owner , Unpack(Pos))

	for i = 1, 20	do
--		Sleep(1)
		Pos[2] = Pos[2] - 500
		SetPos( Owner , Unpack(Pos))
	end

	CancelBuff(Owner,508560)
end

function FA_TeleInto( Dis )
	local Owner = OwnerID()
	local Dis = Dis or 300

	SysCastSpellLv( Owner, Owner, 496177, 0 )

	SetPos( Owner , kg_GetPosRX( Owner , nil , Dis ,1) )
end

function FA_Digg( Dis )
	FA_Fly( Dis * -1 )
end

function FA_GOGO(goal)
	FA_SetPosByObj(OwnerID(),goal)
end

function FA_Who ()
	DebugMsg(0,0,OwnerID())
end

function FA_FollowMe(who)
	AddBuff( who, 504312, 0, -1)
	AttachObj( who, OwnerID(), 0, "p_down","p_top" )
end

function FA_AttachMe(who)
	AddBuff( who, 504312, 0, -1)
	AttachObj( who, OwnerID(), 1, "back_shield","hit_point01" )
end

function FA_X(add)
	local Owner = OwnerID()
	local Pos = kg_GetPosTable(Owner)
	Pos[1] = Pos[1] + add

	SetPos( Owner , Unpack(Pos))
end

function FA_Y(add)
	local Owner = OwnerID()
	local Pos = kg_GetPosTable(Owner)
	Pos[2] = Pos[2] + add

	SetPos( Owner , Unpack(Pos))
end

function FA_Z(add)
	local Owner = OwnerID()
	local Pos = kg_GetPosTable(Owner)
	Pos[3] = Pos[3] + add

	SetPos( Owner , Unpack(Pos))
end

function FA_Dir(add)
	local Owner = OwnerID()
	local Pos = kg_GetPosTable(Owner)
	Pos[4] = Pos[4] + add

	SetPos( Owner , Unpack(Pos))
end

function FA_GoHigh(Dis,OverLook)
	local AddHeight = Dis or 200
	local Owner = OwnerID()
	local RoomID =	ReadRoleValue( Owner, EM_RoleValue_RoomID )
	local Floor
	local Pos = {	ReadRoleValue( Owner, EM_RoleValue_X )			,
			ReadRoleValue( Owner, EM_RoleValue_Y ) + AddHeight + 5	,
			ReadRoleValue( Owner, EM_RoleValue_Z )			,
			ReadRoleValue( Owner, EM_RoleValue_Dir )			}

	Floor = CreateObj(113042, Pos[1], Pos[2] - 5, Pos[3], Pos[4], 1)
	AddToPartition( Floor , RoomID )
	SetModeEx(Floor, EM_SetModeType_Gravity, FALSE)
	SetModeEx(Floor, EM_SetModeType_Obstruct, TRUE)
	SetModeEx(Floor, EM_SetModeType_HideName, TRUE)
	SetModeEx(Floor, EM_SetModeType_Mark, TRUE)
	SetModeEx(Floor, EM_SetModeType_Show, not OverLook)

	SysCastSpellLv( Owner, Owner, 496177, 0 )
	SetPos(Owner, Unpack(Pos))

	Sleep(40)
	SysCastSpellLv( Owner, Owner, 497848, 0 )
	addbuff(Owner,500535,0,-1)
	CallPlot(Floor,"FA_GoHigh_CheckDis",Owner,OverLook)
end

function FA_GoHigh_CheckDis(Player,OverLook)
	local Floor = OwnerID()
	local DisY = 0

	While CheckID(Player) and CheckDistance(Floor, Player, 50) and DisY < 50 do
		sleep(100)
		DisY = math.abs((ReadRoleValue( Floor, EM_RoleValue_Y ) - ReadRoleValue( Player, EM_RoleValue_Y )))
	end
	DelObj (Floor)
	if OverLook == true then CancelBuff(Player,620024) end
end

function FA_OverLook(Dis)
	FA_GoHigh(Dis,true)
	AddBuff( OwnerID(), 620024, 0, -1 )
end

function FA_Show(GUID)
	Show(GUID,ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID))
end

function FA_CreateByObj( OrgID )
	Lua_DW_CreateObj("obj", OrgID, OwnerID(), 1, 1 )
end

function FA_FaceTo(Target)
	AdjustFaceDir(OwnerID(), Target, 0)
end