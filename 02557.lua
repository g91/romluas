function un_RangeSkill_498744() --�R�q�@��
	Lua_CDtime_set(OwnerID(),491156,0)	--�վ�ObjID���ޯ�MagicID���N�o�ɶ��ATime�p�G��0�άO�j��0�A�|������ޯ઺CD�]��Time�F�p�G�]�t�ƫh�O���ޯ�CD���Time	
end
function un_RangeSkill_498758() --�`�h�ҵo
	Lua_CDtime_set(OwnerID(),490251,0) --��q����
	Lua_CDtime_set(OwnerID(),490225,0) --�W�T
end

function un_RangeSkill_498759()
	local own = OwnerID()
	local tar = TargetID()
	CallPlot(own,"un_RangeSkill_498759_plot",tar)
end
function un_RangeSkill_498759_plot(tar) --�p�V�n�o
	local own = OwnerID()
	Sleep(5)
	if ReadRoleValue( tar , EM_RoleValue_IsDead)==0  and checkbuff(own,621514)== false then
		Lua_CDtime_set(own,498759,0) --�p�V�n�o
		addbuff(own,621514,0,6)
	end
end
------------------------------------------------------------------------�v/�u
function un_RangeSkill_498826() --�g�b����
	local own = OwnerID()
	local tar = TargetID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local monster = LuaFunc_CreateObjByObj ( 106517 , tar )
	WriteRoleValue(monster,EM_RoleValue_register2,tar)
	WriteRoleValue(monster,EM_RoleValue_register3,own)
	addbuff(monster,621602,0,-1) 					   --�����buff
	WriteRoleValue(monster,EM_RoleValue_register1,tar) --�ؼмg������
	WriteRoleValue(monster,EM_RoleValue_Livetime,4)
		SetModeEx(monster,EM_SetModeType_Mark,true)
		SetModeEx(monster,EM_SetModeType_Searchenemy,false)
		SetModeEx(monster, EM_SetModeType_Move, false)
		SetModeEx(monster,EM_SetModeType_Fight, true) 
		SetModeEx(monster,EM_SetModeType_Strikback, false) 
		SetModeEx(monster,EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
		SetModeEx(monster,EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
		SetModeEx(monster,EM_SetModeType_NotShowHPMP,false)           ---����ܦ��
	AddToPartition( monster, RoomID)
	beginplot(monster,"un_RangeSkill_498826_2",0)
end
function un_RangeSkill_498826_2() --�g�b����2
	local own = OwnerID()
	local tar = ReadRoleValue(own,EM_RoleValue_register1)
	local master =ReadRoleValue(own,EM_RoleValue_register3)
	local skilllv = ReadRoleValue( master , EM_RoleValue_MagicPowerLv_SP+88 )

	while 1 do
		sleep(10)
		SysCastSpellLv(own,tar,498827,skilllv)
	end
end
function un_RangeSkill_498828() --�l������1
	SetPlot( OwnerID(),"range","un_RangeSkill_498828_1",20 ) --Ĳ�o35�X
end
function un_RangeSkill_498828_1() --�l������2--���ɪ��uOwnerID�v�O�����a�A�uTargetID�v�O�l������
	local tar = TargetID()
	local point = ReadRoleValue(tar,EM_RoleValue_register1)
	local own = OwnerID()
	local master = ReadRoleValue ( tar , EM_RoleValue_OwnerGUID )
	SetPlot( tar,"range","",0 )
	SysCastSpellLv(master,own,498829,0)
	sleep(5)
	WriteRoleValue(tar,EM_RoleValue_register1,point+1)
	point = ReadRoleValue(tar,EM_RoleValue_register1)
	--say(tar,"point = "..point)
	if point == 6 then
		delobj(tar)
	end
	BeginPlot(tar , "un_RangeSkill_498828" , 0)
end
function un_RangeSkill_498830()--�B�E����
	local own = OwnerID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )-- ���D�H
	local x = ReadRoleValue(own,EM_RoleValue_X)
	local y = ReadRoleValue(own,EM_RoleValue_Y)
	local z = ReadRoleValue(own,EM_RoleValue_Z)
	local monster = CreateObj ( 106524 , x , y , z, 0 , 1)
	--local monster = LuaFunc_CreateObjByObj ( 106524 , own ) 
		SetModeEx(monster,EM_SetModeType_Mark,false)
		SetModeEx(monster,EM_SetModeType_Searchenemy,false)
		SetModeEx(monster, EM_SetModeType_Move, false)
		SetModeEx(monster,EM_SetModeType_Fight, false) 
		SetModeEx(monster,EM_SetModeType_Strikback, false) 
		SetModeEx(monster,EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
		SetModeEx(monster,EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
		SetModeEx(monster,EM_SetModeType_NotShowHPMP,true)           ---����ܦ��
	AddToPartition(monster,RoomID)
	WriteRoleValue(monster,EM_RoleValue_register1,Master)
	WriteRoleValue(monster,EM_RoleValue_Livetime,5)
	Beginplot(monster,"un_RangeSkill_498830_1",0)
end
function un_RangeSkill_498830_1()--�B�E�����ĪG
	local own = OwnerID()
	local master = ReadRoleValue(own,EM_RoleValue_register1)
	local skilllv = ReadRoleValue( master , EM_RoleValue_MagicPowerLv_SP+90 )
	while 1 do
		sleep(10)
		SysCastSpellLv(master,own,498832,skilllv)
	end
end