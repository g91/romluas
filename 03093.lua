function WY_Z163_B6_KRYPSE()
	local time = 0
	local TheTwoWinds = {123195,123196}
	local winds = {}
	local chace = {1,-1}
	local r = 0
	local coin = 0
	local r_target = {}
	local boss_reset = false
	local MyRoom = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Rotate = 0
	local rage = false
	local x,y,z,direction = 0,0,0,0
	local door = 0
	local last_skill = 0
	r_target.id = 0
	r_target.x , r_target.y , r_target.z = 0, 0, 0
	--�гyBOSS
	x,y,z,direction = DW_Location(OwnerID())
	local CreatedBoss = WY_Create_an_obj(108281,x,y,z,direction)
	--�إ߻ݭn�ϥΪ�BOSS��T
	local boss = WY_get_objStatus(CreatedBoss)
	while boss.hp > 0 do
	--�ˬd��e�I�i���k�N�W��
	local casting = ReadRoleValue(boss.id, EM_RoleValue_SpellMagicID)
	if casting ~= 0 and casting ~= last_skill then
		if casting == 851299 then --���b�I�i�ͩR�\��
			local temp_target = ReadRoleValue(boss.id, EM_RoleValue_AttackTargetID)
			scriptMessage(OwnerID(),temp_target,2,"[$MUTE]".."[WY_Z163_B6_LIFEDRAIN]",0)
		elseif casting == 497470 then --���b�I�i�G�Ƨl�� 
			scriptMessage(OwnerID(),0,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIEHEAL]",0)
		end
	end
	--��sBOSS��T
		boss = WY_get_objStatus(CreatedBoss)
	--�P�_�O�_�b�԰���
		if boss.hatecount ~= 0 then boss.combating = 1; boss_reset = true;  else boss.combating = 0 end
	--�Y�԰��N����AI�þת�
		if boss.combating ==1 then
			if door == 0 then
				x,y,z,direction = 5420, 795, 2761, 1
				door = WY_Create_an_obj(106247,x,y,z,direction)
				SetModeEx( door , EM_SetModeType_Mark , false );	--���i�I��
				SetModeEx( door , EM_SetModeType_HideName , true );	--����ܦW��
				SetModeEx( door , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
				SetModeEx( door , EM_SetModeType_Strikback , false );	--���|����
				SetModeEx( door , EM_SetModeType_Move , false );	--���|����
				SetModeEx( door , EM_SetModeType_Fight , false );	--���i����
				SetModeEx( door , EM_SetModeType_Searchenemy , false );	--���|����
				SetModeEx( door , EM_SetModeType_Obstruct , true );	--�����׮ĪG
				scriptMessage(OwnerID(),0,2,"[$MUTE]".."[WY_Z163_B6_START]",0);
			end
	--�p��
			time = time +1
	--�ˬd�O�_�g��
			if not rage then
				if time >= 360 and ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) ~= 163 then
					addBuff(boss.id, 625099,0,-1)
					rage = true
				elseif time >= 480 and ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) == 163 then
					addBuff(boss.id, 625099,0,-1)
					rage = true	
				end
			end
	--�C9���ˬd�ۭ��ƶq�A�Y���h�󴫥ثe�ۭ�����m�A�S���N�I��s����D�ۭ��C
			if #winds == 0 then
				for n = 1,2 do
					r = RandRange(1,boss.hatecount)-1
					r_target.x = ReadRoleValue(OwnerID(), EM_RoleValue_X)
					r_target.y = ReadRoleValue(OwnerID(), EM_RoleValue_Y)
					r_target.z = ReadRoleValue(OwnerID(), EM_RoleValue_Z)
					r = WY_CoinStyle_Random(25, 55) --���o25~55�����H���@�ӥ��Ʃέt��
					local x = r_target.x + r
					r = WY_CoinStyle_Random(25, 55) --���o25~55�����H���@�ӥ��Ʃέt��
					local z = r_target.z + r
 					local obj = CreateObj(TheTwoWinds[n],x,r_target.y,z,0,1)
					winds[n] = obj
					addToPartition(obj,boss.room_id)
				end
			else
				Rotate = Rotate +18					
				x,y,z,direction = DW_Location(OwnerID())
				x,y,z,direction = DW_NewLocation(Rotate,125,x,y,z,direction)
				move(winds[1],x,y,z)
				x,y,z,direction = DW_Location(OwnerID())
				x,y,z,direction = DW_NewLocation(Rotate+180,125,x,y,z,direction)
				move(winds[2],x,y,z)
			end
		--�I�i�d���L�ͤ��ˬd
		SysCastSpellLv(OwnerID(),OwnerID(),851301,0)
		end
		--�ˬd�O�_�����԰�
		if boss_reset  and boss.combating == 0 then
			sleep(20)
			for n=1,2 do
				delobj(winds[n])
			end
			winds = {}
			for i,v in pairs(boss.hatelist) do
				cancelBuff(v,624998)
				cancelBuff(v,623973)
				cancelBuff(v,624999)
			end
			delobj(door)
			door = 0
			boss_reset = false
			time = 0
			if boss.hp > 0 then
				delobj(boss.id)
				x,y,z,direction = DW_Location(OwnerID())
				CreatedBoss = WY_Create_an_obj(108281,x,y,z,direction)
				boss = WY_get_objStatus(CreatedBoss)
			else
				scriptMessage(OwnerID(),0,2,"[$MUTE]".."[WY_Z163_B6_END]",0)
			end
		end
		sleep(10)
	end
	--if boss.hp <= 0 and CheckID(door) then
	--if boss.hp <= 0 or CheckID( boss.id ) == false then
		for n=1,2 do
			if( winds[n] ~= nil )then delobj(winds[n]) end;
		end
		winds = {}
		for i,v in pairs(boss.hatelist) do
			cancelBuff(v,624998)
			cancelBuff(v,623973)
			cancelBuff(v,624999)
		end
		delobj(door)
		door = 0
		boss_reset = false
		time = 0

		Sleep( 50 );
		Lua_703019_Boss7_Init( MyRoom );
	--end
end

function WY_Z163_B6_ADJUST()
--	AdjustDir(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_Dir)+1)
	return true
end

function WY_Z163_B6_LeftAndRight()
	local x,y,z,direction = DW_Location(OwnerID());
	local MyRoom = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Obj = 0
--	CastSpellPos( OwnerID(),x, y, z, 496898, 0 )
	x,y,z,direction = DW_NewLocation(90, 50,x,y,z,direction)
	x,y,z,direction = DW_NewLocation(180, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z, 0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,4)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( Obj , EM_SetModeType_Move , false );			--����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--����
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_NewLocation(0, 100,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z, 0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,4)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( Obj , EM_SetModeType_Move , false );			--����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--����
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_NewLocation(270, 100,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z, 0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,4)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( Obj , EM_SetModeType_Move , false );			--����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--����
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_NewLocation(180, 100,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z, 0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,4)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( Obj , EM_SetModeType_Move , false );			--����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--����
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
end

function WY_Z163_B6_FrontAndBack()
	local x,y,z,direction = DW_Location(OwnerID());
	local MyRoom = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Obj = 0
--	CastSpellPos( OwnerID(),x, y, z, 497454, 0 )
	x,y,z,direction = DW_NewLocation(0, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z,0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,5)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( Obj , EM_SetModeType_Move , false );			--����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--����
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_Location(OwnerID());
	x,y,z,direction = DW_NewLocation(90, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z,0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,5)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( Obj , EM_SetModeType_Move , false );			--����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--����
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_Location(OwnerID());
	x,y,z,direction = DW_NewLocation(180, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z,0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,5)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( Obj , EM_SetModeType_Move , false );			--����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--����
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_Location(OwnerID());
	x,y,z,direction = DW_NewLocation(270, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z,0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,5)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( Obj , EM_SetModeType_Move , false );			--����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--����
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
end

function WY_Z163_B6_SWEEP_OR_WING()
	local me =  OwnerID()
	if ReadRoleValue(me,EM_RoleValue_Register1) == 5 then
		SysCastSpellLv(me,me , 497454, 0 )
		sleep(10)
		DelObj(me)
	elseif ReadRoleValue(me,EM_RoleValue_Register1) == 4 then
		SysCastSpellLv(me,me , 496898, 0 )
		sleep(10)
		DelObj(me)
	end
end
--�b�Ƥ����C���P��I�iAE�k�N�A�M���L�ͤƨýw�t
function WY_Z163_B6_CleansingWind()
	while true do
		SysCastSpellLV(OwnerID(),OwnerID(),851343,6)--�C���Žw�t5%�A�j�ץi��
		sleep(10)
	end
end
--�G�Ƥ����C���P��I�iAE�k�N�A�|�[�L�ͤƨýw�t
function WY_Z163_B6_CurruptingWind()
	while true do
		SysCastSpellLV(OwnerID(),OwnerID(),851342,0)--�C���Žw�t5%�A�j�ץi��
		sleep(10)
	end
end
--�P�_�ؼЪ��L�ͤƵ{�סA�Y�j�󵥩�3�h�Ncancel���L�ͤ�(���F�Y�Ǫv���ĪG)�æ^��True�Ϥ��hFalse
function WY_Z163_B6_zombie_check()
	local pos = 0
	local Target_id = TargetID()
	--[[
	for n = 1,BuffCount(Target_id) do
		pos = n-1
		if BuffInfo(Target_id,pos,EM_BuffInfoType_BuffID) == 623973 and BuffInfo(Target_id, pos,EM_BuffInfoType_Power) >= 2 then
			cancelBuff(Target_id, 624998)
			scriptMessage(OwnerID(),Target_id,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIE_PASS]",0)
			return true
		end
	end
	scriptMessage(OwnerID(),Target_id,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIE_FAIL]",0)
	return false
	]]--


	local _thisBuffGUID = 624998;--624998�L�ͤ�
	local _dischargeBuffGUID = 625071;--625071�ͩR�\��
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( Target_id , _thisBuffGUID );
	local _showMsgOrNot = RandRange( 1 , 300 );
	--DebugMsg( 0 , 0 , "WY_Z163_B6_zombie_check : ".._currentBuffLv.."  Rand : ".._showMsgOrNot );
	
	if ( _currentBuffLv >= 2 ) then--�j��T�h�Ѱ�
		--cancelBuff(Target_id, 624998)
		CancelBuff( Target_id , 620433 );--620433�ͩR�\�ܦ���
		--AddBuff( Target_id , 624999 , 0 , -1 );
		if( _showMsgOrNot < 33 ) then
			scriptMessage(OwnerID(),Target_id,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIE_PASS]",0)
		end
		return false;--�j��T�h�h�L��
	end
	AddBuff( Target_id , 620433 , 0 , -1 );--620433�ͩR�\�ܦ���
	--CancelBuff( Target_id , 624999 );
	if( _showMsgOrNot < 33 ) then
		scriptMessage(OwnerID(),Target_id,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIE_FAIL]",0)
	end
	return true;

end
--�ϥιL�L�ͤƵ{�קP�_���k�N�b�I�񦨥\�����A���L�ͤƸɻ���P��ܥ�BUFF�@�P������
function WY_Z163_B6_zombie_check_fin()
	local pos = 0
	local temp_pow = -1
	if CheckBuff(TargetID(),623973) then
		for n = 1, BuffCount(TargetID()) do
			pso = n-1
			if BuffInfo(TargetID(),pos,EM_BuffInfoType_BuffID) == 623973 then
				temp_pow = BuffInfo(TargetID(),pos,EM_BuffInfoType_Power)
			end
		end
		if temp_pow ~= -1 then
			addBuff(TargetID(),624998,temp_pow,-1)
		end
	end
end
--����ܥ�BUFF�Q�������ɭԧ�s����L�ͤƪ����|���ŻP��ܪ��P��
function WY_Z163_B6_ZOMBIE_CLEAR()
	local temp_pow = 0
	local pos = 0
	cancelBuff(TargetID(),624998)
	if CheckBuff(TargetID(),623973) then
		for n = 1, BuffCount(TargetID()) do
			pos = n-1
			if BuffInfo(TargetID(),pos,EM_BuffInfoType_BuffID) == 623973 then
				temp_pow = BuffInfo(TargetID(),pos,EM_BuffInfoType_Power)
			end
		end
		if CheckBuff(TargetID(),623973) then
			addBuff(TargetID(),624998,temp_pow,-1)
		end
	end
end
--�b�Ƥ��������L�ͤƪ��k�NSCRIPT
function WY_Z163_B6_CLEAR_ZOMBIE()
	--[[
	local temp_pow = -1
	local pos = 0
	for n = 1,BuffCount(TargetID()) do
		pos = n-1
		if BuffInfo(TargetID() ,pos ,EM_BuffInfoType_BuffID) == 623973 then
			temp_pow = BuffInfo(TargetID(),pos,EM_BuffInfoType_Power)-1
		end
	end
	cancelBuff(TargetID(),623973)
	if temp_pow >= 0 then
		AddBuff(TargetID(),623973,temp_pow,-1)
		AddBuff(TargetID(),624998,temp_pow,-1)
	end	
	]]--
	local _targetID = TargetID();
	local _targetBuff = 624998;--624998�L�ͤ�
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _targetBuff );
	_currentBuffLv = _currentBuffLv - 1;
	CancelBuff_NoEvent( _targetID , _targetBuff );
	if( _currentBuffLv > -1 ) then AddBuff( _targetID , _targetBuff , _currentBuffLv , -1 ); end

end
--�����̯f�ǬV���k�N�ĪGSCRIPT
function WY_Z163_B6_CLEAR_PLAGUE()
	CancelBuff(TargetID(),624999)
end
--�ˬd�O�_�����L�L�ͤ�
function WY_Z163_B6_HUMAN_CHECK()
	if CheckBuff(TargetID(),623973) then
		return false
	else
		return true
	end
end
--�ˬd���W��ܥ�BUFF���j�סA�ç����L�ͤƮ���@�˱j��
function WY_Z163_B6_ZOMBILIZED()
	local temp_pow = 0
	addBuff(TargetID(),623973,0,-1)
	local pos = 0
	for n = 1, BuffCount(TargetID()) do
		pos = n-1
		if BuffInfo(TargetID(),pos,EM_BuffInfoType_BuffID) == 623973 then
			temp_pow = BuffInfo(TargetID(),pos,EM_BuffInfoType_Power)
		end
	end
	addBuff(TargetID(),624998,temp_pow,-1)
end
--�Q�G�Ƨl���ɡA�^�Ǥ@�ӿ`���@�޵�BOSS
function WY_Z163_B6_Absorb()
	--local boss = OwnerID()
	--addBuff(boss,624997,0,-1)--�ҪO�w�g���F ��O�N�Q�����F
end
--�קK����������BUFF�ˬd
function WY_Z163_B6_DONT_HIT_TWICE()
	local player = TargetID()
	if CheckBuff(player, 625079) then
		return false
	else
		return true
	end
end

function WY_Z163_B7_Summon()
	DebugMsg(0,0,"WY_Z163_B7_Summon")
	local x,y,z,direction = DW_Location(781361,1)
	local me = OwnerID()
	local players = SearchRangePlayer(me, 600)
	if DW_GetDistance(playerID ,x,y,z) > 200 then
		scriptMessage(me, -1 , 2 ,"[WY_STRING_Z163_OOR_SUMMON]", 0)
	elseif DW_GetDistance(playerID ,x,y,z) < 200  then
		scriptMessage(me, -1 , 2 ,"[WY_STRING_Z163_IR_SUMMON]", 0)
	end
	--CreatedBoss = WY_Create_an_obj(108282,x,y,z,direction)
	DelBodyItem( OwnerID(), 243098, 1 );
end

function WY_Z163_Check_B7()
	local key = CountBodyItem( OwnerID(), 243098 )
	DebugMsg(0,0,"key = "..key)
	if key ~= 0 then 
		return true
	else
		return false
	end
end

function Lua_703093_Zombilize()
	local _ownerID = TargetID();
	local _thisBuffGUID = 624998;--624998�L�ͤ�
	local _dischargeBuffGUID = 625071;--625071�ͩR�\��
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID );
	DebugMsg(0,ReadRoleValue( _ownerID , EM_RoleValue_RoomID ),"Lua_703093_Zombilize : ".._currentBuffLv );
	if ( _currentBuffLv >= 1 ) then--�j��T�h�Ѱ�
		CancelBuff( _ownerID , _dischargeBuffGUID );
		CancelBuff( _ownerID , 625076 ); --�Ѱ��ͩR�\�ܶA�G
		AddBuff( _ownerID , 624999 , 0 , -1 );
--		return true;
	else
		CancelBuff( _ownerID , 624999 );
	end
	
	return true;
end

function Lua_703093_CheckZombilize()--625076�ͩR�\�ܶA�G �ˬd
--	DebugMsg(0,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ),"--Lua_703093_CheckZombilize--");
	local _ownerID = TargetID();
	local _thisBuffGUID = 624998;--624998�L�ͤ�
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID );
	DebugMsg(0,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ),"Lua_703093_CheckZombilize : ".._currentBuffLv );
	if ( _currentBuffLv >= 2 ) then--�j��T�h�Ѱ�
		AddBuff( _ownerID , 624999 , 0 , -1 );
		CancelBuff_NoEvent( _ownerID , 625076 );
		DebugMsg(0,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ),"--false--");
--		return false;
	else
		CancelBuff_NoEvent( _ownerID , 624999 );
		AddBuff( _ownerID , 625076 , 0 , -1 );		
	end
--	CancelBuff_NoEvent( _ownerID , 624999 );
--	AddBuff( _ownerID , 625076 , 0 , -1 );
	DebugMsg(0,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ),"--true--");
	return true;
end

function Lua_703093_CheckZombilize_Plage()--624999�̯f�ǬV �ˬd
	local _ownerID = TargetID();
	local _thisBuffGUID = 624998;--624998�L�ͤ�
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID );
	--DebugMsg(0,0,"Lua_703093_CheckZombilize : ".._currentBuffLv );
	if ( _currentBuffLv >= 2 ) then--�j��T�h�Ѱ�
		--AddBuff( _ownerID , 624999 , 0 , -1 );
		return true;
	end
	CancelBuff_NoEvent( _ownerID , 624999 );
	return false;

end
