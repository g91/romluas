------------------------------------------------------------------------
function Z22CavyOff_01() --�Ϸ|�ۤ��������Ǫ����|���ͩ��_��
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID)==106463 or --�@�r�j����
	   ReadRoleValue( TargetID() , EM_RoleValue_OrgID)==106464 then --���r���Ĥ��
	   SetFlag( OwnerID(), 544801, 1 )
	end
end
------------------------------------------------------------------------
function Z22CavyOff_02() --�Ϸ|�ۤ��������Ǫ����|���ͩ��_��
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID)==106465 or --�s�ͪ�������
	   ReadRoleValue( TargetID() , EM_RoleValue_OrgID)==106466 then --�n�Ԫ�������
	   SetFlag( OwnerID(), 544801, 1 )
	end
end
------------------------------------------------------------------------
function Z22killedbuff_01() --��o�����A���p�ʪ��|�Q���������׭��Ǭ��
	AddBuff ( OwnerID(),621301,0,-1)
	ic_MOB_BUFF_22()
end
------------------------------------------------------------------------
function Z22SearchFireElemental_01() --�Ϥ������ۤ�����(�C3�����1��)
	ic_MOB_BUFF_22()
	while 1 do
		if ReadRoleValue( OwnerID() ,EM_RoleValue_IsAttackMode ) ==0 then
			local FireElemental=SearchRangeNPC ( OwnerID(),120 )
			for i = 0 , table.getn(FireElemental), 1 do
				if FireElemental[i]~=OwnerID()   then
			   	SetAttack( OwnerID() , FireElemental[i] )
				end
			end
		end
	sleep(30)
	end
end
------------------------------------------------------------------------
function Z22ReSetFireElemental_01() --�b�ۨ�����50���Y���i�J�԰��h���m�ۤv
	ic_MOB_BUFF_22()
	Sleep(500)
	if ReadRoleValue( OwnerID() ,EM_RoleValue_IsAttackMode ) ==0 then
	   CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
	end
end
------------------------------------------------------------------------
Function Z22ForgingIron_01() --���u�u�K��y�ʧ@
	local ForgingFire=SearchRangeNPC ( OwnerID(),20 )
	local y=0
	for i = 0 , table.getn(ForgingFire), 1 do
		if ReadRoleValue( ForgingFire[i], EM_RoleValue_OrgID)==119867 then
			while 1 do
			y=rand(50)+10
			PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_2H, ruFUSION_ACTORSTATE_COMBAT_2H)
			Sleep(y)
			CastSpell( OwnerID(), ForgingFire[i], 498752 )
			Sleep(15)
			End
		End
	End
End
------------------------------------------------------------------------
function Z22ForgingFire_buff01() --��o��Buff��|�_�@��
	Sleep(15)
	AddBuff ( OwnerID(),621452,1,-1)
	--Sleep(15)
	--AddBuff ( OwnerID(),621493,1,-1)
end
------------------------------------------------------------------------
Function Z22phoenixFX_01() --���ͪ��_���~�[�S��
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( OwnerID(), EM_SetModeType_HideName, true )--�W��
	AddBuff ( OwnerID() ,621554 , 1, -1)
	Sleep(10)
	AddBuff ( OwnerID() ,621555 , 1, -1)
	Sleep(10)
	AddBuff ( OwnerID() ,621625 , 1, -1)
End
------------------------------------------------------------------------
function Z22AddFire_buff01() --��o��Buff��|�_��
	while 1 do
		local X=Rand(3)+1
		local Y=Rand(5)+10
		local Z=Rand(50)+100
		if X==1 or X==2 then
		AddBuff ( OwnerID(), 621639 , 1, Y )
		end
	Sleep(Z)
	end
end
------------------------------------------------------------------------
function Z22AddFire_buff02() --�_���G�m�Ϊk�}
	Sleep(10)
	AddBuff ( OwnerID(),621648,1,-1)
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_Monster01() --�԰��ճ���t�@��
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" )--��w�ۨ���q
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false )--���i�I��
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false )--���q�Y��
	SetModeEx( OwnerID()  ,EM_SetModeType_NotShowHPMP , false )--����ܦ��
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true )--�����󤣷|�Q�j�M��
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , true )--�i���
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , true )--�D�ʯ���
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , true )--�|����

	local x=ReadRoleValue(OwnerID(),EM_RoleValue_X) --Ū���ۨ�X�b�y��
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Y) --Ū���ۨ�Y�b�y��
	local z=ReadRoleValue(OwnerID(),EM_RoleValue_Z) --Ū���ۨ�Z�b�y��
	
	local xyz1={x-40,y,z}--�ŧi�n�����p���Ԥh1����m
	local xyz2={x,y, z-30}--�ŧi�n�����p���Ԥh2����m
	--local xyz3={x,y,z+30}--�ŧi�n�����p���Ԥh3����m

	local npc1=Lua_DW_CreateObj( "xyz" , 106573, xyz1, 1 , 180 , 1 )--�̫e���w�ŧi����m�����p���Ԥh1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,npc1)--�N�p���Ԥh1��GitemID�b�ۨ����W������
	WriteRoleValue(npc1,EM_RoleValue_Register1,OwnerID())--�N�ۨ���GitemID�b�p���Ԥh1���W������

	local npc2=Lua_DW_CreateObj( "xyz" , 106574, xyz2, 1 , 270 , 1 )--�̫e���w�ŧi����m�����p���Ԥh2
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,npc2)--�N�p���Ԥh2��GitemID�b�ۨ����W������
	WriteRoleValue(npc2,EM_RoleValue_Register1,OwnerID())--�N�ۨ���GitemID�b�p���Ԥh2���W������

	--local npc3=Lua_DW_CreateObj( "xyz" , 106575, xyz3, 1 , 90 , 1 )--�̫e���w�ŧi����m�����p���Ԥh3
	--WriteRoleValue(OwnerID(),EM_RoleValue_Register3,npc3)--�N�p���Ԥh3��GitemID�b�ۨ����W������
	--WriteRoleValue(npc3,EM_RoleValue_Register1,OwnerID())--�N�ۨ���GitemID�b�p���Ԥh3���W������

	--SetAttack( OwnerID() ,npc1 ) --���p���Ԥh�i�����
	SetPlot( OwnerID(),"dead","Z22TRAINING_GROUNDS_Monster02",0 ) 
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_Monster02() --�԰��ճ���t�@��
	local NPC1=ReadRoleValue(OwnerID(),EM_RoleValue_Register1) --���������b�ۨ�Register1��m���Ȩöi��ŧi
	local NPC2=ReadRoleValue(OwnerID(),EM_RoleValue_Register2) --���������b�ۨ�Register2��m���Ȩöi��ŧi
	--local NPC3=ReadRoleValue(OwnerID(),EM_RoleValue_Register3) --���������b�ۨ�Register3��m���Ȩöi��ŧi
	WriteRoleValue(NPC1,EM_RoleValue_LiveTime,4)--4���R��NPC1
	WriteRoleValue(NPC2,EM_RoleValue_LiveTime,4)--4���R��NPC2
	--WriteRoleValue(NPC3,EM_RoleValue_LiveTime,4)--4���R��NPC3
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC01() --�԰��ճ���t�@��
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" )--��w�ۨ���q
	MoveToFlagEnabled( OwnerID() , false )--�Ϧۤv�Ȯɩ����w�]�����޸��|
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false )--���i�I��
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false )--���q�Y��
	SetModeEx( OwnerID()  ,EM_SetModeType_NotShowHPMP , false )--����ܦ��
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true )--�����󤣷|�Q�j�M��
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , true )--�i���
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , true )--�D�ʯ���
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , true )--�|����
	sleep(10)
	local Target=ReadRoleValue(OwnerID(),EM_RoleValue_Register1) --���������b�ۨ�Register1��m���Ȩöi��ŧi
	SetAttack( OwnerID() ,Target ) --��Target�i�����
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC02() --�԰��ճ���t�@��
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.99 , "Lua_424225_LockHP" )--��w�ۨ���q
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , true )--�i���
	MoveToFlagEnabled( OwnerID() , false )--�Ϧۤv�Ȯɩ����w�]�����޸��|
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC03() --�԰��ճ���t�@��
	while 1 do
		local x=Rand(9)+1
			if x==1 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_1H)
			elseif x==2 then CallPlot(OwnerID(),"Lua_PG_Point",OwnerID())		
			else CallPlot(OwnerID(),"Lua_DW_Idle",OwnerID())
			end
		sleep(100)
	end
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC04() --�԰��ճ���t�@��
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_1H, ruFUSION_ACTORSTATE_COMBAT_1H)
	while 1 do
		local Motion=Rand(4)+1
			if Motion==1 then CastSpell(OwnerID(),OwnerID(),498931)
			elseif Motion==2 then CastSpell(OwnerID(),OwnerID(),498930)
			else CastSpell(OwnerID(),OwnerID(),498929)
			end
	sleep(90)
	end
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC05() --�԰��ճ���t�@��
	while 1 do
		local Speak= Rand(17)+1
		if Speak==1 then 	CastSpell(OwnerID(),OwnerID(),498932)
				Sleep(05)
				npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_01]")--�C���ʧ@�������N�t�׻P�O�q�ĤJ�C
		elseif Speak==2 then	 CastSpell(OwnerID(),OwnerID(),498932)
				 Sleep(05)
				 npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_02]")--�Фj�a�J�ӬݥL���X��ʧ@ .....�O�q��������b��y���O�q���t�X�I		
		elseif Speak==3 then CastSpell(OwnerID(),OwnerID(),498932)
				 Sleep(05)
				 npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_03]")--�t�~~���m�]�O���੿�����A���m�ʧ@�����T��...�C		
		elseif Speak==4 then CastSpell(OwnerID(),OwnerID(),498932)
				 Sleep(05)	
				 npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_04]")--�ܽd��M���O�ݧ��N��F�A�C�ӤH�������n���_�a�m�ߡC
		elseif Speak==5 then CastSpell(OwnerID(),OwnerID(),498932)
				 Sleep(05)
				 npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_05]")--�ҫ᪺�m�߮ɶ��A���P��A��ڦb�Գ��W���s���ɶ��C		
		elseif Speak==6 then npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_06]")--�����󤣲M�����a��i�H�H�ɴ��ݡI
		end
	sleep(100)
	end
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_01()
	CallPlot( OwnerID() , "LuaP_Speak_A" , OwnerID() )
	sleep(10)
	local RandID = rand(7)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_01]" ) return end--���檺�������D�N����....
	if RandID==2 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_02]" ) return end--���O�]���A�̮ڥ����A�ѫe�u���Ԫp�I
	if RandID==3 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_03]" ) return end--....�A��[ZONE_LOGISTICAL_WAREHOUSE]�H�⤣���H�{�b���ӳ�줣�O�O�H
	if RandID==4 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_04]" ) return end--��ı�o�A�ڭ̪��͸ܦ��G�S����i�i....
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_02()
	CallPlot( OwnerID() , "LuaP_Speak_A" , OwnerID() )
	sleep(10)
	local RandID = rand(7)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_05]" ) return end--�¤j����....�H���ȷ|�Ӥ���o....
	if RandID==2 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_06]" ) return end--�ڭ��ٻݭn���u�u�K�Ӷi��[�u....
	if RandID==3 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_07]" ) return end--���N��[ZONE_LOGISTICAL_WAREHOUSE]�Ө�U�B�e�a�I
	if RandID==4 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_08]" ) return end--�ѤU��....�ڭ̥����n�F�I
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_03()
	CallPlot( OwnerID() , "LuaP_Speak_A" , OwnerID() )
	sleep(10)
	local RandID = rand(5)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_09]" ) return end--�T��....�t�e���t�פ]�O���D�I
	if RandID==2 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_10]" ) return end--"�ǰe"�������i���K�y�r�I
	if RandID==3 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_11]" ) return end--���I�]�\�ڭ����ӦҼ{�X�@....�C
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_04()
	CallPlot( OwnerID() , "LuaP_dr_WAVE" , OwnerID() )
	sleep(10)
	local RandID = rand(3)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_12]" ) return end--�ӫ~�ҳѤ��h....�֨Ӭݬ���I
	if RandID==2 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_13]" ) return end--�Z����M�񤰻򳣭��n....
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_05()
	CallPlot( OwnerID() , "Lua_DW_Craft" , OwnerID() )
	sleep(10)
	local RandID = rand(3)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_14]" ) return end --�]�o�ǤH.....�s���O���S���o�򦣧r....�^
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_06()
	CallPlot( OwnerID() , "Lua_DW_Craft" , OwnerID() )
	sleep(30)
	local RandID = rand(2)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_15]" ) return end --�I....�쩳�ٮt�֩O�I
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_07()
	local RandID = rand(4)

	if RandID==1 
	then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_16]" ) --�L���į󵹧A�L���Ʊ��....�I
	sleep(10)
	CallPlot( OwnerID() , "LuaP_dr_WAVE" , OwnerID() )
	return end

	if RandID==2
	then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_17]" ) --�Ӭݬݳ�....�s�j���A�ѻ�����I
	sleep(10)
	CallPlot( OwnerID() , "LuaP_dr_WAVE" , OwnerID() )
	return end

	if RandID==3
	then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_18]" ) --�B�ͧo....�@���ǳƤ~���@���w����I
	sleep(10)
	CallPlot( OwnerID() , "LuaP_dr_STRETCH" , OwnerID() )
	return end
end
------------------------------------------------------------------------
