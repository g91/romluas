------------------------------------------------------------------------�@�ɤ��@�����O
Function Z24_NPC107493_00()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
Function Z24_NPC107493_01()
	local Controller=OwnerID()
	local PlayerID={}
	local Status=ReadRoleValue( Controller, EM_RoleValue_Register1 )--�N��@�ɤ��O�_�b�԰���0���_	
	if Status==0 then
		WriteRoleValue( Controller, EM_RoleValue_Register1, 1 )
		PlayerID=SearchRangePlayer ( Controller, 600 )
		for i= 1, table.getn(PlayerID) do
			ScriptMessage( Controller, PlayerID[i], 2, "[SC_Z24WMWARNING_00]", 0 )
		end
		Sleep(20)
		CallPlot( Controller, "Z24_worldBoss_Ctrl_AI", Controller )
		Sleep(40)
		PlayerID=SearchRangePlayer ( Controller, 600 )
		for j= 1, table.getn(PlayerID) do
			ScriptMessage( Controller, PlayerID[j], 2, "[SC_Z24WMWARNING_01]", 0 )
		end
		Sleep(60)
		PlayerID=SearchRangePlayer ( Controller, 600 )
		for k= 1, table.getn(PlayerID) do
			ScriptMessage( Controller, PlayerID[k], 2, "[SC_Z24WMWARNING_02]", 0 )
		end
	else return
	end
End
------------------------------------------------------------------------���B�@������
Function Z24_NPC121316_00()
	while 1 do
		Sleep(10)
		local Controller=OwnerID()
		local WorldMonster={}
		local RealBoss=0
		local FakeBoss=0
		local Status=0
		local Machine={}
		local Num=0
		local Portal={}
		local Count=0
		local Process={}
		WorldMonster=SearchRangeNPC ( Controller, 10 )
		for i=0, table.getn(WorldMonster) do
			if ReadRoleValue( WorldMonster[i], EM_RoleValue_OrgID)==107493 then
				RealBoss=WorldMonster[i]
				Status=ReadRoleValue( RealBoss, EM_RoleValue_Register1 )
			end
		end
		Machine=SearchRangeNPC ( Controller, 500 )		
		for k=0, table.getn(Machine) do
			if ReadRoleValue( Machine[k], EM_RoleValue_OrgID)==107331 or
			   ReadRoleValue( Machine[k], EM_RoleValue_OrgID)==107332 or
			   ReadRoleValue( Machine[k], EM_RoleValue_OrgID)==107333 or
			   ReadRoleValue( Machine[k], EM_RoleValue_OrgID)==107334 then
				Num=Num+1
				Portal[Num]=Machine[k]
			end
		end
		if RealBoss~=0 then
			if Num==0 and Status==0 then
				CallPlot( RealBoss, "Z24_NPC107493_01", 0 )
			else	for m=1, table.getn(Portal) do
					if ReadRoleValue( Portal[m], EM_RoleValue_Register1 )==1 then
						Count=Count+1
					end
				end
				if Count==0 and Status==0 then
					Process=AG_RandenArray(Portal)
					WriteRoleValue( Process[1], EM_RoleValue_Register1, 1 )
				end
			end
		end
		WorldMonster=nil
		Machine=nil
		Portal=nil
		Process=nil
	end
end
------------------------------------------------------------------------���B�q�D��l�@��
Function Z24_NPC107331_00()
	local npcfx=SearchRangeNPC ( OwnerID(), 160 )
	for sn=0, table.getn(npcfx) do
		if ReadRoleValue( npcfx[sn], EM_RoleValue_OrgID)==121128 or--�����z���S�Ĳy
		ReadRoleValue( npcfx[sn], EM_RoleValue_OrgID)==121129 or--�U�N�����K
		ReadRoleValue( npcfx[sn], EM_RoleValue_OrgID)==121306 or--�U�N���@��
		ReadRoleValue( npcfx[sn], EM_RoleValue_OrgID)==121362 or--���I�S��
		ReadRoleValue( npcfx[sn], EM_RoleValue_OrgID)==121363 or--�k�}�S��
		ReadRoleValue( npcfx[sn], EM_RoleValue_OrgID)==121364 or--�ĥC�N�կ�
		ReadRoleValue( npcfx[sn], EM_RoleValue_OrgID)==121315 then--�l�a�����B�q�D
			delobj( npcfx[sn] )
		end
	end
	MoveToFlagEnabled( OwnerID(), false )
	AddBuff( OwnerID(), 502707, 0, -1 )--����^��
	SetFlag( OwnerID(), 544801, 1 )--�������_��
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
	local x=ReadRoleValue( OwnerID(), EM_RoleValue_X )
	local y=ReadRoleValue( OwnerID(), EM_RoleValue_Y )
	local z=ReadRoleValue( OwnerID(), EM_RoleValue_Z )
	while 1 do
		sleep(10)
		status=ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
		if status==1 then
			local pos1={ x, y+25, z }
			local pos2={ x, y+120, z }
			local pos3={ x, y+200, z }
			local newfx1=Lua_DW_CreateObj( "xyz", 121363, pos1, 0, 1, 1 )
			local newfx2=Lua_DW_CreateObj( "xyz", 121363, pos2, 0, 1, 1 )
			local Guardian=Lua_DW_CreateObj( "xyz", 121364, pos3, 0, 1, 1 )
			SetModeEx( newfx1, EM_SetModeType_Gravity, false )
			SetModeEx( newfx2, EM_SetModeType_Gravity, false )
			SetModeEx( Guardian, EM_SetModeType_Gravity, false )
			SetModeEx( newfx1, EM_SetModeType_AlignToSurface, false )
			SetModeEx( newfx2, EM_SetModeType_AlignToSurface, false )
			SetModeEx( Guardian, EM_SetModeType_AlignToSurface, false )
			SetModeEx( Guardian, EM_SetModeType_Mark, false )
			SetModeEx( Guardian, EM_SetModeType_Save, false )
			SetModeEx( Guardian, EM_SetModeType_Revive, false )
			SetModeEx( Guardian, EM_SetModeType_Fight, false )
			SetModeEx( Guardian, EM_SetModeType_ShowRoleHead, false )
			SetModeEx( Guardian, EM_SetModeType_HideName, true )
			SetModeEx( Guardian, EM_SetModeType_NotShowHPMP, true )
			SetModeEx( Guardian, EM_SetModeType_SearchenemyIgnore, true )
			MoveToFlagEnabled( newfx1, false )
			MoveToFlagEnabled( newfx2, false )
			MoveToFlagEnabled( Guardian, false )
			AddToPartition( Guardian, 0 )
			Sleep(20) MoveDirect( Guardian, x, y+150, z )
			Sleep(20) PlayMotionEX( Guardian, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP )
			Sleep(20) AddToPartition( newfx1, 0 )
			Sleep(10) AddToPartition( newfx2, 0 )
			for times=1, 5, 1 do
				local num=Rand(2)*10		
				sleep(35+num) CallPlot( OwnerID(), "Z24_NPC106811_FX01", x, y, z )		
				sleep(35+num) CallPlot( OwnerID(), "Z24_NPC106811_FX02", x, y, z )		
				sleep(35+num) CallPlot( OwnerID(), "Z24_NPC106811_FX03", x, y, z )
				sleep(35+num) CallPlot( OwnerID(), "Z24_NPC106811_FX04", x, y, z )
				times=times+1
			end
			Sleep(25) Delobj( newfx1 )
			Sleep(25) Delobj( newfx2 )
			Sleep(25) PlayMotionEX( Guardian, ruFUSION_ACTORSTATE_CROUCH_END, ruFUSION_ACTORSTATE_CROUCH_END )
			Sleep(25) MoveDirect( Guardian, x, y+200, z )
			Sleep(25) Delobj( Guardian )
			Sleep(25) WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
		end
	end
End

------------------------------------------------------------------------���B�q�D���`�@��
Function Z24_NPC106811_DEAD00()
	local PlayerID={}
	PlayerID[1]=HateListInfo( OwnerID(), 0, EM_HateListInfoType_GItemID )
	PlayerID[2]=HateListInfo( OwnerID(), 1, EM_HateListInfoType_GItemID )
	PlayerID[3]=HateListInfo( OwnerID(), 2, EM_HateListInfoType_GItemID )
	PlayerID[4]=HateListInfo( OwnerID(), 3, EM_HateListInfoType_GItemID )
	PlayerID[5]=HateListInfo( OwnerID(), 4, EM_HateListInfoType_GItemID )
	DW_QietKillOne( PlayerID[1], 107212 )
	DW_QietKillOne( PlayerID[2], 107212 )
	DW_QietKillOne( PlayerID[3], 107212 )
	DW_QietKillOne( PlayerID[4], 107212 )
	DW_QietKillOne( PlayerID[5], 107212 )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
	local portal=SearchRangeNPC ( OwnerID() ,50 )
	for sn=0, table.getn(portal) do
		if ReadRoleValue( portal[sn], EM_RoleValue_OrgID)==121362 or--�R�����I�S��
		ReadRoleValue( portal[sn], EM_RoleValue_OrgID)==121363 or--�R���k�}�S��
		ReadRoleValue( portal[sn], EM_RoleValue_OrgID)==121364 then--�ĥC�N�կ�
			Delobj( portal[sn] )
		end
	end
	local x, y, z, dir=DW_Location( OwnerID() )
	local portalfx=CreateObj( 121128, x, y-3, z, dir, 1 )--�Ыؾ����z���S�Ĳy
	local portalbk=CreateObj( 121315, x, y, z, dir, 1 )--�ЫؼȮɪ��l�a�~�[
	CallPlot( portalfx, "Z24_InceptionMachine_00", portalfx )
	CallPlot( portalbk, "Z24_InceptionMachine_00", portalbk )
	MoveToFlagEnabled( portalfx, false )
	MoveToFlagEnabled( portalbk, false )
	AddtoPartition( portalfx, 0 )
	AddtoPartition( portalbk, 0 )
	return
End
------------------------------------------------------------------------����Ͳ������l�@��
Function Z24_NPC106849_00()
	MoveToFlagEnabled( OwnerID(), false )
	AddBuff( OwnerID(), 502707, 0, -1 )--����^��
	SetFlag( OwnerID(), 544801, 1 )--�������_��
	local machine01=SearchRangeNPC ( OwnerID() ,10 )
	local machine02=SearchRangeNPC ( OwnerID() ,40 )
	for sni=0, table.getn(machine01) do
		if ReadRoleValue( machine01[sni], EM_RoleValue_OrgID)==121119 or--�l�a������Ͳ�����
		ReadRoleValue( machine01[sni], EM_RoleValue_OrgID)==121128 or--�����z���S�Ĳy
		ReadRoleValue( machine01[sni], EM_RoleValue_OrgID)==121129 or--�U�N�����K
		ReadRoleValue( machine01[sni], EM_RoleValue_OrgID)==121306 then--�U�N���@��
			Delobj( machine01[sni] )--�R���l�a������Ͳ�����
		end
	end
	for snj=0, table.getn(machine02) do
		if ReadRoleValue( machine02[snj], EM_RoleValue_OrgID)==121356 then
			CancelBuff_NoEvent( machine02[snj], 623134 ) 
		end
	end
End
------------------------------------------------------------------------����Ͳ����㦺�`�@��
Function Z24_NPC106849_DEAD00()
	local PlayerID={}
	PlayerID[1]=HateListInfo( OwnerID(), 0, EM_HateListInfoType_GItemID )
	PlayerID[2]=HateListInfo( OwnerID(), 1, EM_HateListInfoType_GItemID )
	PlayerID[3]=HateListInfo( OwnerID(), 2, EM_HateListInfoType_GItemID )
	PlayerID[4]=HateListInfo( OwnerID(), 3, EM_HateListInfoType_GItemID )
	PlayerID[5]=HateListInfo( OwnerID(), 4, EM_HateListInfoType_GItemID )
	DW_QietKillOne( PlayerID[1], 107211 )
	DW_QietKillOne( PlayerID[2], 107211 )
	DW_QietKillOne( PlayerID[3], 107211 )
	DW_QietKillOne( PlayerID[4], 107211 )
	DW_QietKillOne( PlayerID[5], 107211 )
	local x, y, z, dir=DW_Location( OwnerID() )
	local machinefx=CreateObj( 121128, x, y-3, z, dir, 1 )--�Ыؾ����z���S�Ĳy
	local machinebk=CreateObj( 121119, x, y, z, dir, 1 )--�ЫؼȮɪ��l�a�~�[
	CallPlot( machinefx, "Z24_InceptionMachine_00", machinefx )
	CallPlot( machinebk, "Z24_InceptionMachine_00", machinebk )
	MoveToFlagEnabled( machinefx, false )
	MoveToFlagEnabled( machinebk, false )
	AddtoPartition( machinefx, 0 )
	AddtoPartition( machinebk, 0 )
	AddBuff( machinebk, 623134, 0, -1 )
	return
End
------------------------------------------------------------------------�����z���S�Ĳy��l�@��
Function Z24_NPC121128_00()
	Sleep(05) CastSpell( OwnerID(), OwnerID(), 850351 )--�����z���S��
	local x, y, z, dir=DW_Location( OwnerID() )
	local BurningFire=CreateObj( 121129, x, y, z, dir, 1 )--�ЫؿU�N�����K
	local Smoke=CreateObj( 121306, x, y+10, z, dir, 1 )--�ЫؿU�N���@��
	CallPlot( BurningFire, "Z24_InceptionMachine_00", BurningFire )
	CallPlot( Smoke, "Z24_InceptionMachine_00", Smoke )
	MoveToFlagEnabled( BurningFire, false )
	MoveToFlagEnabled( Smoke, false )
	Sleep(15) AddToPartition( BurningFire, 0 )
	Sleep(05) AddToPartition( Smoke, 0 )
	local control=SearchRangeNPC ( OwnerID() ,40 )
	for sn=0, table.getn(control) do
		if ReadRoleValue( control[sn], EM_RoleValue_OrgID)==121356 then
			AddBuff( control[sn], 623134, 0, -1 )
		end
	end
	Sleep(10) DelObj( OwnerID() )
End
------------------------------------------------------------------------���B�q�D�S�ļ@��01
Function Z24_NPC106811_FX01( x, y, z )
	local pos=0
	local portalfx=0
	local num=Rand(4)
	if num==0 then
		pos={ x, y+18, z }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x, y+150, z )
	end
	if num==1 then
		pos={ x+5, y+18, z+5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x+5, y+150, z+5 )
	end
	if num==2 then
		pos={ x+5, y+18, z-5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x+5, y+150, z-5 )
	end
	if num==3 then
		pos={ x-5, y+18, z-5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x-5, y+150, z-5 )
	end
	sleep( 70 )
	Delobj( portalfx )
end
------------------------------------------------------------------------���B�q�D�S�ļ@��02
Function Z24_NPC106811_FX02( x, y, z )
	local pos=0
	local portalfx=0
	local num=Rand(4)
	if num==0 then
		pos={ x, y+18, z }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x, y+150, z )
	end
	if num==1 then
		pos={ x+5, y+18, z+5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x+5, y+150, z+5 )
	end
	if num==2 then
		pos={ x+5, y+18, z-5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x+5, y+150, z-5 )
	end
	if num==3 then
		pos={ x-5, y+18, z-5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x-5, y+150, z-5 )
	end
	sleep( 70 )
	Delobj( portalfx )
end
------------------------------------------------------------------------���B�q�D�S�ļ@��03
Function Z24_NPC106811_FX03( x, y, z )
	local pos=0
	local portalfx=0
	local num=Rand(4)
	if num==0 then
		pos={ x, y+18, z }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x, y+150, z )
	end
	if num==1 then
		pos={ x+5, y+18, z+5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x+5, y+150, z+5 )
	end
	if num==2 then
		pos={ x+5, y+18, z-5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x+5, y+150, z-5 )
	end
	if num==3 then
		pos={ x-5, y+18, z-5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x-5, y+150, z-5 )
	end
	sleep( 70 )
	Delobj( portalfx )
end
------------------------------------------------------------------------���B�q�D�S�ļ@��04
Function Z24_NPC106811_FX04( x, y, z )
	local pos=0
	local portalfx=0
	local num=Rand(4)
	if num==0 then
		pos={ x, y+18, z }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x, y+150, z )
	end
	if num==1 then
		pos={ x+5, y+18, z+5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x+5, y+150, z+5 )
	end
	if num==2 then
		pos={ x+5, y+18, z-5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x+5, y+150, z-5 )
	end
	if num==3 then
		pos={ x-5, y+18, z-5 }
		portalfx=Lua_DW_CreateObj( "xyz", 121362, pos, 0, 0, 1 )
		SetModeEx( portalfx, EM_SetModeType_Mark, false )
		SetModeEx( portalfx, EM_SetModeType_Gravity, false )
		SetModeEx( portalfx, EM_SetModeType_AlignToSurface, false )
		MoveToFlagEnabled( portalfx, false )
		AddToPartition( portalfx, 0 )
		sleep( 10 )
		MoveDirect( portalfx, x-5, y+150, z-5 )
	end
	sleep( 70 )
	Delobj( portalfx )
end
------------------------------------------------------------------------
Function Z24_NPC107108_IDLE00()
	Sleep(10) PlayMotionEX ( OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP )
	Sleep(60) PlayMotionEX ( OwnerID(), ruFUSION_ACTORSTATE_CAST_LOOP, ruFUSION_ACTORSTATE_CAST_END )
	Sleep(10) 
	local num=Rand(2)+1
	if num==1 then
		PlayMotionEX ( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE0, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	else	PlayMotionEX ( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE1, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	end
End
------------------------------------------------------------------------
Function Z24_NPC121419_00()
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )--���
	SetModeEx( OwnerID(), EM_SetModeType_SearchenemyIgnore, true )--���i�j�M
	PlayMotionEX( OwnerID(), 146, 146 )
End
------------------------------------------------------------------------�l�a���u�����㪫��]�w
Function Z24_InceptionMachine_00()
	SetModeEx( OwnerID(), EM_SetModeType_Show, true )--���
	SetModeEx( OwnerID(), EM_SetModeType_Searchenemy, false )--����
	SetModeEx( OwnerID(), EM_SetModeType_Mark, false )--�аO
	SetModeEx( OwnerID(), EM_SetModeType_Save, false )--�x�s
	SetModeEx( OwnerID(), EM_SetModeType_Revive, false )--����
	SetModeEx( OwnerID(), EM_SetModeType_Obstruct, true )--����
	SetModeEx( OwnerID(), EM_SetModeType_Strikback, false )--����
	SetModeEx( OwnerID(), EM_SetModeType_Fight, false )--���
	SetModeEx( OwnerID(), EM_SetModeType_Gravity, true )--���O
	SetModeEx( OwnerID(), EM_SetModeType_Move, false )--����
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, false )--�Y��
	SetModeEx( OwnerID(), EM_SetModeType_HideName, true )--�W��
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )--���
	SetModeEx( OwnerID(), EM_SetModeType_SearchenemyIgnore, true )--���i�j�M
end
------------------------------------------------------------------------�ˬd�@�ɤ��O�_�X�{�b���W
Function Z24_PapforsaBossChecking_00()
	local Punisher=OwnerID()
	local BossID={}
	local Num=0
	BossID=SearchRangeNPC( Punisher, 500 )
	if BossID~=nil then
		for i=0, table.getn(BossID), 1 do
			if ReadRoleValue( BossID[i], EM_RoleValue_OrgID)==107213 then
				Num=Num+1
			end
		end
	end
	if Num==0 then
		SetModeEx( Punisher, EM_SetModeType_Searchenemy ,true )
		SetModeEx( Punisher, EM_SetModeType_Fight ,true )
		SetModeEx( Punisher, EM_SetModeType_Strikback ,true )
		SetModeEx( Punisher, EM_SetModeType_Mark, true )
		SetModeEx( Punisher, EM_SetModeType_Show, true )
	else
		CallPlot( Punisher, "LuaFunc_ResetObj", Punisher )
	end
End
------------------------------------------------------------------------