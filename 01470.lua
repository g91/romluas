------���b�ޯ�W��Script
----P1  �ۤp�� ----102308--102309--102310--102335-�|����H���s��
-- ���۬�������e�ؼЬI�񦹧ޯ�--�@���X 6 ���A�C�j 15 ��N�X�@�i
function Lua_apon_attacktree()
	local random_tree = DW_Rand(10)
	local tree1 = Lua_DW_CreateObj( "flag" , 102308 , 780362 , random_tree )  --�X�� 1    
	local tree2 = Lua_DW_CreateObj( "flag" , 102309 , 780363 , random_tree )   --�X�� 2
	local tree3 = Lua_DW_CreateObj( "flag" , 102310 , 780376 , random_tree )    --�X�� 3
	local tree4 = Lua_DW_CreateObj( "flag" , 102335 , 780377 , random_tree )  --�X�� 4
	local tree5 = Lua_DW_CreateObj( "flag" , 102308 , 780378 , random_tree )   --�X�� 5
	local tree6 = Lua_DW_CreateObj( "flag" , 102309 , 780379 , random_tree )    --�X�� 6
	local tree7 = Lua_DW_CreateObj( "flag" , 102310, 780380 , random_tree )  --�X�� 7    
	local tree8 = Lua_DW_CreateObj( "flag" , 102335 , 780381 , random_tree )   --�X�� 8
	local tree9 = Lua_DW_CreateObj( "flag" , 102308 , 780384 , random_tree )    --�X�� 9
	local tree10 = Lua_DW_CreateObj( "flag" ,102309 , 780383 , random_tree )  --�X�� 10

	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do    --�N�������a�[�J��H�������
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		SetAttack( tree1 , ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree2 , ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree3 , ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree4 , ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree5, ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree6 , ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree7 , ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree8 , ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree9, ThesePlayer[i] ) -- �����e�i����
		SetAttack( tree10 , ThesePlayer[i] ) -- �����e�i����

	end
	BeginPlot(tree1,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree2,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree3,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree4,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree5,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree6,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree7,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree8,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree9,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	BeginPlot(tree10,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---�Ĥ@���q  �����-1--���p��H��---
function Lua_apon_tree_idle_1()
	while 1 do
		local counter1 = 0
		local counter2 = 0
		sleep(10)
		for i = 0 , 1000 , 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1			
			if counter1 == 1 then ---�u�Q����@�� 
				AddBuff ( OwnerID() , 503936 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_04]" )   ---��...��...�Y...�ڡ�u...�}...�u...�}...��...�l
				--say ( OwnerID() , "Buff-1 on")
			end
			
			if counter2 == 30 then   ----�C30�����ѷ|��ۤv�W�@��buff
				AddBuff ( OwnerID() , 503936 , 0 , 90 )
				--say ( OwnerID() , "Buff-2 on")
				Say( OwnerID() , "[SC_102307_OTHER_04]" )   ---��...��...�Y...�ڡ�u...�}...�u...�}...��...�l
				sleep(10)
				counter2 = 0
			end
			
			--if CheckBuff ( OwnerID() , 503886) == true and ( CheckID( OwnerID() ) ) == true then
				--sleep(10)
				--say ( OwnerID() , "goto P-2")
				--DelObj ( OwnerID()  )   ---�N�ۤv�R��
				--break
			--end
							
			if  CheckBuff ( OwnerID() , 503937) == true and ( CheckID( OwnerID() ) ) == true then
				Say( OwnerID() , "[SC_102307_OTHER_05]" )   ---��....��....��...��...�F ....
				sleep(10)
				Say( OwnerID() , "[SC_102307_OTHER_06]" )   ---��...��...�w...�R...�U...��...�A...��...�o...��...�p...��...��...�l !!
				SetRoleCamp( OwnerID() , "SNPC" )   --�N�ۤv���}�紫��SNPC�A�p���N�i�H���p��H
				CastSpellLV( OwnerID(), OwnerID(), 493591 , 10)----�������ѱN�Ҧ����p��H�w��
				sleep(300)
				Say( OwnerID() , "[SC_102307_OTHER_04]" )   ---��...��...�Y...�ڡ�u...�}...�u...�}...��...�l
				CastSpell( OwnerID(), OwnerID(), 493584 )  --�ǰe�N���S��
				sleep(10)
				SetPosByFlag( OwnerID(), 780385 , 0 )   ---�N����Ѷǰe��ӺX��
				AddBuff ( OwnerID() , 503936 , 0 , 90 )
				SetRoleCamp( OwnerID() , "Visitor" )  ---�A�N�ۤv���}���ഫ�^��
				break
			end
		end
	end	
end

function lua_apon_tree_cancel_1()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102303 then
		
		if CheckBuff( TargetID() , 503936) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_01]" , 1 )    --�ѺC�C���ο��F�L��--����½Ķ
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_02]" , 1 )     --����Ѥw�g�M���F�A�A�w���ݦA�ϥΥ���t��--����½Ķ
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_03]" , 1 )  --�t��ؤl�u���ľW����Ѩϥ�--����½Ķ
		return false
	end
end

function lua_apon_tree_cancel_end_1()   --�������Ѫ��~ - 1
	CastSpell( OwnerID(), TargetID(), 493583 )
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---�Ĥ@���q  �����-2--�����a�WBuff---�֫p�������

function Lua_apon_tree_idle_2()
	while 1 do
		local counter1 = 0
		local counter2 = 0
		sleep(10)
		for i = 0 , 1000 , 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1			
			if counter1 == 1 then ---�u�Q����@�� 
				AddBuff ( OwnerID() , 503880 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---�A...��...�o...��...��...��...�l...�u...�} !!
			end
			
			if counter2 == 30 then   ----�C30�����ѷ|��ۤv�W�@��buff
				AddBuff ( OwnerID() , 503880 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---�A...��...�o...��...��...��...�l...�u...�} !!
				sleep(10)
				counter2 = 0
			end
			
			--if CheckBuff ( OwnerID() , 503886) == true and ( CheckID( OwnerID() ) ) == true then
				--sleep(10)
				--DelObj ( OwnerID()  )   ---�N�ۤv�R��
				--break
			--end
							
			if  CheckBuff ( OwnerID() , 503937) == true and ( CheckID( OwnerID() ) ) == true then
				Say( OwnerID() , "[SC_102307_OTHER_08]" )   ---�H...��...�A...��...��...��...�|...�b...�o...�� �H
				sleep(10)
				CastSpell( OwnerID(), OwnerID(), 493585 )  --����ѹ���骱�a�I��y�t���ֳN�z 
				sleep(60)
				Say( OwnerID() , "[SC_102307_OTHER_09]" )   ---�H...��...��...�A...��...��...��...�t...��...�k...��...��...�a...
				sleep(20)
				CancelBuff( OwnerID() , 503937) -- �N  �������g��buff  �h��
				AddBuff ( OwnerID() , 503880 , 0 , 90 )
				sleep(10)
				--say ( OwnerID() , "Buff-3 on")
				break
			end
		end
	end	
end

function lua_apon_tree_cancel_2()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102304 then
		
		if CheckBuff( TargetID() , 503880) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_01]" , 1 )    --����ѺC�C���ο��F�L��--����½Ķ
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_02]" , 1 )     --����Ѥw�g�M���F�A�A���ݭn�ϥκؤl--����½Ķ
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_10]" , 1 )  --�t���S���u���ľW����Ѩϥ�--����½Ķ
		return false
	end
end

function lua_apon_tree_cancel_end_2()   --�������Ѫ��~ - 2
	CastSpell( OwnerID(), TargetID(), 493583 )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---�Ĥ@���q  �����-3--�����a�W�[�ˮ`��X--�j�j�ˮ`���������

function Lua_apon_tree_idle_3()
	while 1 do
		local counter1 = 0
		local counter2 = 0
		sleep(10)
		for i = 0 , 1000 , 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1			
			if counter1 == 1 then ---�u�Q����@�� 
				AddBuff ( OwnerID() , 503881 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_04]" )  ---��...��...�Y...�ڡ�u...�}...�u...�}...��...�l
			end
			
			if counter2 == 30 then   ----�C30�����ѷ|��ۤv�W�@��buff
				AddBuff ( OwnerID() , 503881 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_04]" )   ---��...��...�Y...�ڡ�u...�}...�u...�}...��...�l
				sleep(10)
				counter2 = 0
			end
			
			--if CheckBuff ( OwnerID() , 503886) == true and ( CheckID( OwnerID() ) ) == true then
				--sleep(10)
				--DelObj ( OwnerID()  )   ---�N�ۤv�R��
				--break
			--end
							
			if  CheckBuff ( OwnerID() , 503937) == true and ( CheckID( OwnerID() ) ) == true then
				Say( OwnerID() , "[SC_102307_OTHER_08]" )   ---�H...��...�A...��...��...��...�|...�b...�o...�� �H
				sleep(10)
				CastSpell( OwnerID(), OwnerID(), 493586 )  --����ѹ���骱�a�I��y�t�𥨤j�N�z 
				sleep(60)
				Say( OwnerID() , "[SC_102307_OTHER_09]" )   ---�H...��...��...�A...��...��...��...�t...��...�k...��...��...�a...
				sleep(20)
				CancelBuff( OwnerID() , 503937) -- �N  �������g��buff  �h��
				AddBuff ( OwnerID() , 503881 , 0 , 90 )
				sleep(10)
				break
			end
		end
	end	
end

function lua_apon_tree_cancel_3()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102305 then
		
		if CheckBuff( TargetID() , 503881) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_01]" , 1 )    --����ѺC�C���ο��F�L��--����½Ķ
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_02]" , 1 )     --����Ѥw�g�M���F�A�A���ݭn�ϥκؤl--����½Ķ
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_11]" , 1 )  --�{�{�ῶ�u���O�q����Ѩϥ�
		return false
	end
end

function lua_apon_tree_cancel_end_3()   --�������Ѫ��~ - 3
	CastSpell( OwnerID(), TargetID(), 493583 )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---�Ĥ@���q  �����-4--���ӫ�A�|�]�h��Boss�����A��Boss��� 5 �H  ����q----�٨S����----�ݭn�Ѿ���N�o���ͥX�ӡA���i�H�����ءA�ҥH���qscript �n������bNPC����l�@����

function Lua_apon_tree_idle_4()
	while 1 do
		local counter1 = 0
		local counter2 = 0
		sleep(10)
		for i = 0 , 1000 , 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1			
			if counter1 == 1 then ---�u�Q����@�� 
				AddBuff ( OwnerID() , 503882 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---�A...��...�o...��...��...��...�l...�u...�} !!
			end
			
			if counter2 == 30 then   ----�C30�����ѷ|��ۤv�W�@��buff
				AddBuff ( OwnerID() , 503882 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---�A...��...�o...��...��...��...�l...�u...�} !!
				sleep(10)
				counter2 = 0
			end
			
			--if CheckBuff ( OwnerID() , 503886) == true and ( CheckID( OwnerID() ) ) == true then
				--sleep(10)
				--DelObj ( OwnerID()  )   ---�N�ۤv�R��
				--break
			--end
			
			if  CheckBuff ( OwnerID() , 503937) == true  and ( CheckID( OwnerID() ) ) == true then
				local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)  --�N�����ID�qPID��Ū�X�ӡA�åB�NBoss�ŧi����ID
				Say( OwnerID() , "[SC_102307_OTHER_05]" )   ---��....��....��...��...�F ....
				sleep(20)
				Say( OwnerID() , "[SC_102307_OTHER_12]" )   ---�t...��...�k...��...��...��...�z...��...��...�� �I�I
				SetRoleCamp( OwnerID() , "SNPC" )   --���ե����ഫ�}��A�ݥi���i�H�@�˥�������
				SetAttack( OwnerID() , Boss )    --�N�����ؼг]�w�����
				CastSpell( OwnerID(), Boss, 493587 )   ---�����s��I�񤭦��k�N�A�i�H����� 5�H �� HP
				sleep(150)
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---�A...��...�o...��...��...��...�l...�u...�} !!
				CastSpell( OwnerID(), OwnerID(), 493584 )  --�ǰe�N���S��
				sleep(10)
				SetPosByFlag( OwnerID(), 780388 , 0 )   ---�N����Ѷǰe��ӺX��
				AddBuff ( OwnerID() , 503882 , 0 , 90 )
				SetRoleCamp( OwnerID() , "Visitor" )  ---�P�W�A�����Ҽ{�}�窺���D�C
				break
			end
		end
	end	
end



function lua_apon_tree_cancel_4()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102306 then
		
		if CheckBuff( TargetID() , 503882) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_01]" , 1 )    --����ѺC�C���ο��F�L��--����½Ķ
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_02]" , 1 )     --����Ѥw�g�M���F�A�A���ݭn�ϥκؤl--����½Ķ
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_13]" , 1 )  --�t�a�᯻�u���ߪk����Ѩϥ�
		return false
	end
end

function lua_apon_tree_cancel_end_4()   --�������Ѫ��~ - 4
	CastSpell( OwnerID(), TargetID(), 493583 )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�ĤG�M�ĤT���q��H�ϥ�
----�·t����Ѥ@��
 
function Lua_apon_tree_black_1()    
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if CheckBuff( OwnerID() , 503887) == true and ( CheckID( OwnerID() ) ) == true then  ----����·t���Ѫ�Buff
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )   ---���ǰe���S�ġC
			sleep(20)
			SetPosByFlag( OwnerID(), 780393 , 1 )   ---�����Ѩ���ӺX�Ы�A���W�A�ǰe�@���A�o�˩Ǥ~�|�u���b���@���I�A�ɶ������˥H���a���ի�M�w
			sleep(20)
			CancelBuff(OwnerID() , 503887)
			SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, true) --�j�M�ĤH
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----���i����
			Hide(OwnerID() )
			Show(OwnerID(),roomid1 )
			Say( OwnerID() , "[SC_102307_OTHER_14]" )   ---��...�l...�A...��...��...�R...�B...�N...�u...��...�� !!
			sleep(10)
			
			CastSpellLV( OwnerID(), AttackTarget, 493869 , 1 )  --�ӤH�q-1--�MBuff
			sleep(15)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --�ӤH�q-1--����ˮ`
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --�ӤH�q-1--����ˮ`
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --�ӤH�q-1--����ˮ`
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493869 , 1 )  --�ӤH�q-1--�MBuff
			sleep(15)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --�ӤH�q-1--����ˮ`
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --�ӤH�q-1--����ˮ`
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --�ӤH�q-1--����ˮ`
			sleep(25)
			
			AddBuff (OwnerID() , 503888 , 0 , 600)   ------�·t���ѭӤH�q������W�@��Buff
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----���i����
			CancelBuff ( OwnerID() , 503888 )
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )  --�ǰe�N���S��
			
			sleep(35)
			SetPosByFlag( OwnerID(), 780385 , 1 )   ---�N����Ѷǰe��ӺX��
			
			
			
		elseif CheckBuff( OwnerID() , 503889) == true and ( CheckID( OwnerID() ) ) == true then  ----�p�G������Ѩ��W���o��Buff�åB�O���۪��A�b�ĤT���q�A�h�|���X�H�U���y�{ 
			sleep(10)
			SetPosByFlag( OwnerID(), 780385 , 1 )
			SetFightMode ( OwnerID(),1, 1, 1,1 )
			sleep(10)
			local counter1 = 0
			local counter2 = 0
			--say(OwnerID() , "Tree_1_counter1 ="..counter1)
			--say(OwnerID() , "Tree_2_counter1 ="..counter2)
			while 1 do 
				sleep(10)
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					sleep(10)
					if counter1 == 5 then
						CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )
						counter1 = 0
						sleep(10)
					end
				
					if counter2 == 12 then
						CastSpellLV( OwnerID(), AttackTarget, 493869 , 1)
						counter2 = 0
						sleep(10)
					end
				else
					break ----�N Counter �k�s
				end
			end	
		end
	end
end

----�·t����ѤG��
 
function Lua_apon_tree_black_2()    
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if CheckBuff( OwnerID() , 503887) == true and ( CheckID( OwnerID() ) ) == true then  ----����·t���Ѫ�Buff
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )   ---���ǰe���S�ġC
			SetPosByFlag( OwnerID(), 780393 , 1 )   ---�����Ѩ���ӺX�Ы�A���W�A�ǰe�@���A�o�˩Ǥ~�|�u���b���@���I�A�ɶ������˥H���a���ի�M�w
			sleep(20)
			CancelBuff(OwnerID() , 503887)
			SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, true) --�j�M�ĤH
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----���i����
			Hide(OwnerID() )
			Show(OwnerID(),roomid1 )
			Say( OwnerID() , "[SC_102307_OTHER_15]" )   ---��...�l...��...�a !!
			sleep(10)
			
			CastSpellLV( OwnerID(), AttackTarget, 493682 , 1)  --�ӤH�q-1--�ؼЭ��v��80%
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493681 , 4)  --�ӤH�q-2--AE�޷|�_�k
			sleep(50)
			CastSpellLV( OwnerID(), AttackTarget, 493682 , 1)  --�ӤH�q-1--�ؼЭ��v��80%
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493681 , 4)  --�ӤH�q-2--AE�޷|�_�k
			sleep(50)
			CastSpellLV( OwnerID(), AttackTarget, 493682 , 1)  --�ӤH�q-1--�ؼЭ��v��80%
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493681 , 4)  --�ӤH�q-2--AE�޷|�_�k
			sleep(50)

			AddBuff (OwnerID() , 503888 , 0 , 600)   ------�·t���ѭӤH�q������W�@��Buff
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----���i����
			CancelBuff ( OwnerID() , 503888 )
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )  --�ǰe�N���S��
			
			sleep(35)
			SetPosByFlag( OwnerID(), 780386 , 1 )   ---�N����Ѷǰe��ӺX��
			
		elseif CheckBuff ( OwnerID() , 503889) == true and ( CheckID( OwnerID() ) ) == true then  ----�p�G������Ѩ��W���o��Buff�åB�O���۪��A�b�ĤT���q�A�h�|���X�H�U���y�{ 
			sleep(10)
			SetPosByFlag( OwnerID(), 780386 , 1 )
			SetFightMode ( OwnerID(),1, 1, 1,1 )
			sleep(10)
			local counter1 = 0
			local counter2 = 0
			--say(OwnerID() , "Tree_1_counter1 ="..counter1)
			--say(OwnerID() , "Tree_2_counter1 ="..counter2)
			while 1 do 
				sleep(10)
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					sleep(10)
					if counter1 == 5 then
						CastSpellLV( OwnerID(), AttackTarget , 493682 , 1)--�ؼЭ��v��80%
						counter1 = 0
						sleep(10)
					end
				
					if counter2 == 8 then
						CastSpellLV( OwnerID(), OwnerID(), 493681 , 0)--AE�޷|�_�k
						counter2 = 0
						sleep(20)
					end
				else
					break ----�N Counter �k�s
				end
			end	
		end
	end
end



----�·t����ѤT��
 
function Lua_apon_tree_black_3()    
	while 1 do
		sleep(10)
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if CheckBuff ( OwnerID() , 503887) == true and ( CheckID( OwnerID() ) ) == true then  ----����·t���Ѫ�Buff
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )   ---���ǰe���S�ġC
			SetPosByFlag( OwnerID(), 780393 , 1 )   ---�����Ѩ���ӺX�Ы�A���W�A�ǰe�@���A�o�˩Ǥ~�|�u���b���@���I�A�ɶ������˥H���a���ի�M�w
			sleep(20)
			CancelBuff(OwnerID() , 503887)
			SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, true) --�j�M�ĤH
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----���i����
			Hide(OwnerID() )
			Show(OwnerID(),roomid1 )
			Say( OwnerID() , "[SC_102307_OTHER_15]" )   ---��...�l...��...�a !!
			sleep(10)
			
			CastSpellLV( OwnerID(), OwnerID(), 493679 , 10)  --�ӤH�q-1--Buff�����ɶ���ӤH�q����
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --�ӤH�q-2--AE��--��20�H
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --�ӤH�q-2--AE��--��20�H
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --�ӤH�q-2--AE��--��20�H
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --�ӤH�q-2--AE��--��20�H
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --�ӤH�q-2--AE��--��20�H
			sleep(40)
			
			AddBuff (OwnerID() , 503888 , 0 , 600)   ------�·t���ѭӤH�q������W�@��Buff
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----���i����
			CancelBuff ( OwnerID() , 503888 )
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )  --�ǰe�N���S��
			
			sleep(35)
			SetPosByFlag( OwnerID(), 780387 , 1 )   ---�N����Ѷǰe��ӺX��
			
		elseif CheckBuff ( OwnerID() , 503889) == true and ( CheckID( OwnerID() ) ) == true then  ----�p�G������Ѩ��W���o��Buff�åB�O���۪��A�b�ĤT���q�A�h�|���X�H�U���y�{ 
			sleep(10)
			SetPosByFlag( OwnerID(), 780387 , 1 )
			SetFightMode ( OwnerID(),1, 1, 1,1 )
			sleep(10)
			local counter1 = 0
			local counter2 = 0
			--say(OwnerID() , "Tree_1_counter1 ="..counter1)
			--say(OwnerID() , "Tree_2_counter1 ="..counter2)
			while 1 do 
				sleep(10)
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					sleep(10)
					if counter1 == 10 then
						CastSpellLV( OwnerID(), OwnerID(), 493694 , 99)  --Buff�����ɶ���1000��A�ҥH�o���d�U����i�G��
						--counter1 = 0
						sleep(10)
					end
				
					if counter2 == 8 then
						CastSpellLV( OwnerID(), OwnerID(), 493693 , 2)  --�ӤH�q-2--AE��--��30�H
						counter2 = 0
						sleep(10)
					end
				else
					break ----�N Counter �k�s
				end
			end	
		end
	end
end


----�·t����ѥ|��
 
function Lua_apon_tree_black_4()    
	while 1 do
		sleep(10)	
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if CheckBuff ( OwnerID() , 503887) == true and ( CheckID( OwnerID() ) ) == true then  ----����·t���Ѫ�Buff
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )   ---���ǰe���S�ġC
			SetPosByFlag( OwnerID(), 780393 , 1 )   ---�����Ѩ���ӺX�Ы�A���W�A�ǰe�@���A�o�˩Ǥ~�|�u���b���@���I�A�ɶ������˥H���a���ի�M�w
			sleep(20)
			CancelBuff(OwnerID() , 503887)
			SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, true) --�j�M�ĤH
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----���i����
			Hide(OwnerID() )
			Show(OwnerID(),roomid1 )
			Say( OwnerID() , "[SC_102307_OTHER_14]" )   ---��...�l...�A...��...��...�R...�B...�N...�u...��...�� !!
			sleep(10)
			
			CastSpellLV( OwnerID(), OwnerID(), 493678 , 3)  --�ӤH�q-1--����Dot�A40��
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --�ӤH�q-2--AE��--��10�H
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --�ӤH�q-2--AE��--��10�H
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --�ӤH�q-2--AE��--��10�H
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --�ӤH�q-2--AE��--��10�H
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --�ӤH�q-2--AE��--��10�H
			sleep(40)
			
			AddBuff (OwnerID() , 503888 , 0 , 600)   ------�·t���ѭӤH�q������W�@��Buff
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----���i����
			CancelBuff ( OwnerID() , 503888 )
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )  --�ǰe�N���S��
			
			sleep(35)
			SetPosByFlag( OwnerID(), 780388 , 1 )   ---�N����Ѷǰe��ӺX��
			
		elseif CheckBuff ( OwnerID() , 503889) == true and ( CheckID( OwnerID() ) ) == true then  ----�p�G������Ѩ��W���o��Buff�åB�O���۪��A�b�ĤT���q�A�h�|���X�H�U���y�{ 
			sleep(10)
			SetPosByFlag( OwnerID(), 780388 , 1 )
			SetFightMode ( OwnerID(),1, 1, 1,1 )
			sleep(10)
			local counter1 = 0
			local counter2 = 0
			--say(OwnerID() , "Tree_1_counter1 ="..counter1)
			--say(OwnerID() , "Tree_2_counter1 ="..counter2)
			while 1 do 
				sleep(10)
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					sleep(10)
					if counter1 == 5 then
						CastSpellLV( OwnerID(), OwnerID(), 493678 , 2)  --�ӤH�q-1--����Dot�A���n
						counter1 = 0
						sleep(10)
					end
				
					if counter2 == 8 then
						CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --�ӤH�q-2--AE��--��20�H
						counter2 = 0
						sleep(10)
					end
				else
					break ----�N Counter �k�s
				end
			end	
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	