-------------------------------------------
--���s�X�� 546708
--invisiball ���Ϊ���register+1�A1=���T���� 2=���~������
--invisiball ���Ϊ���register+2�A���y���A  1=�p  2=��  3=�j
--invisiball ���Ϊ��� register +3 bucket
--invisiball ���Ϊ��� register +4 ball
-- bucket register +1 ==�ؼ������P�_


--bucket register +1 �O�ӿ�{bonus�Ҧ��O�_�Ұ� (1== bonus mode on      0== bonus mode off)
--bucket register+4 �ΨӧP�_�o��/��������O�_�b���椤
-- bucket register+6 �M register+7 �O�Ψӿ�{�ۤv�ͥX�Ӫ����Ϊ���P���y
--bucket register +9 �O���a
--�s�y������register+1�O�ӿ�{���S���H���b�i��C��
--�s�y������register+2�ӿ�{���a�o�����A


------����npc-------------

function lua_skwerl_craft1_machine() --�o��������ܮ�
	SetSpeakDetail( OwnerID(), "[SKWERL_CRAFT1_07]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SKWERL_CRAFT1_06]" , "lua_skwerl_craft1_begin1", 0) --�}�l�C��
	AddSpeakOption( OwnerID(), TargetID(), "[SKWERL_CRAFT1_05]" , "lua_skwerl_craft1_manual", 0 ) --�ϥλ���
end


function lua_skwerl_craft1_manual() --������U(������)
	SetSpeakDetail( OwnerID(), "[SKWERL_CRAFT1_08]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "lua_skwerl_craft1_machine", 0 ) --�^�W�@��
end


function  lua_skwerl_craft1_npc() --����NPC���
	SetSpeakDetail( OwnerID(), "[SKWERL_CRAFT1_04]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SKWERL_CRAFT1_05]" , "lua_skwerl_craft1_npcmanual", 0 ) --�ϥλ���
	AddSpeakOption( OwnerID(), TargetID(), "[SKWERL_CRAFT1_10]" , "lua_skwerl_craft1_exchange", 0 ) --�I���U�ιs��
end


function lua_skwerl_craft1_npcmanual() --������U(NPC��)
	SetSpeakDetail( OwnerID(), "[SKWERL_CRAFT1_09]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "lua_skwerl_craft1_npc", 0 ) --�^�W�@��
end


function lua_skwerl_craft1_exchange()--�I�����y
	local player=OwnerID()
	local count= CountBodyItem( player, 241606);   --�p�⪱�a���W���U�ιs��
	if count==0 then
  		closespeak(player)
  		ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_12]", C_SYSTEM) --�A�S���U�ιs��i�H�I���A�Χڵo����[120905]�Ӱ��X�X�ӧa�I
  		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_12]", C_SYSTEM)  --�A�S���U�ιs��i�H�I���A�Χڵo����[120905]�Ӱ��X�X�ӧa�I
	else
  		CloseSpeak(player)
  		DelBodyItem(player, 241606, count) --�������a���W���U�ιs��
  		Givebodyitem(player,240060, count)--�����a���ƪ����ʨ�
		GiveBodyItem(player, 241479, count*4)--���ɭ����� (�@�ӸU�ιs��i�H��4�Ӽɭ����� )
  		ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_11]", C_SYSTEM) --�ڱq�ӳ����|�����Ӧh�U�ιs��!
  		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_11]", C_SYSTEM) --�ڱq�ӳ����|�����Ӧh�U�ιs��!
	end
end




---------------------�륵�@��---------------------------------------
--�륵�t�λ���:���a�I�i�k�N�C�k�N�|�����}�f�W�����Ϊ���C���Ϊ���|���D�ثe���y���j�p�A���y��ID�A�P�}�f�C
--���a�����ؼЮɡA�k�N�|�P�_�ؼЬO�_���T�A�P�ؼЪ��A�C���ۡA�ؼ����Ϊ���|�Q�R���A�M��}�f�|����[���Φ��������


function lua_skwerl_craft1_toss0() --���k�N
	local player=OwnerID()
	local target=TargetID() --�Q�k�N���������Ϊ���
	local state=ReadRoleValue( target, EM_RoleValue_Register+2  ) --Ū���ؼЪ��A(�ثe���y���j�p)
	local bucket=ReadRoleValue( target, EM_RoleValue_Register+3  ) --Ū��bucket
	local ball=ReadRoleValue( target, EM_RoleValue_Register+4  ) --Ū�����y
	local playerid=ReadRoleValue( target, EM_RoleValue_Register+5)--Ū�����y�Ӧ������a(���~�����a���|�v�T����y) 
	if player~=playerid then  --�p�G�O���~�����a�A���|��J����
		return false
	end
	
	local tgtid=ReadRoleValue( TargetID(), EM_RoleValue_OrgID) --���ѥؼЬO�_�����ʥؼ�
	if tgtid~= 120917 and tgtid~= 120918 and tgtid~= 120919  then  --�p�G���O�I���}�f�Areturn false
		return false
	end
	

	if tgtid==120917 then
		delobj(target) --�R�����Ϊ���
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 1) --�}�f����[���@��

		
	else
		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 2)--�}�f���榩���@��
		addbuff(player, 622799, 0, 75)--���~�k�N�n���A�[��Q�����|�z��
	end
end

function lua_skwerl_craft1_toss1() --�Ŧ�k�N
	local player=OwnerID()
	local target=TargetID()
	local state=ReadRoleValue( target, EM_RoleValue_Register+2  ) --Ū���ؼЪ��A
	local bucket=ReadRoleValue( target, EM_RoleValue_Register+3  ) --Ū��bucket
	local ball=ReadRoleValue( target, EM_RoleValue_Register+4  ) --Ū�����y
	local playerid=ReadRoleValue( target, EM_RoleValue_Register+5)--Ū�����y�Ӧ������a(���~�����a���|�v�T����y) 
	if player~=playerid then  --�p�G�O���~�����a�A���|��J����
		return false
	end

	local tgtid=ReadRoleValue( TargetID(), EM_RoleValue_OrgID) --���ѥؼЬO�_�����ʥؼ�
	if tgtid~= 120917 and tgtid~= 120918 and tgtid~= 120919 then  --�p�G���O�I���}�f�Areturn false
		return false
	end
	
	if tgtid==120918 then
		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 1)--�}�f����[���@��
	else
		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 2)--�}�f���榩���@��
		addbuff(player, 622799, 0, 75)--���~�k�N�n���A�[��Q�����|�z��
	end
end

function lua_skwerl_craft1_toss2()--����k�N
	local player=OwnerID()
	local target=TargetID()
	local state=ReadRoleValue( target, EM_RoleValue_Register+2  ) --Ū���ؼЪ��A
	local bucket=ReadRoleValue( target, EM_RoleValue_Register+3  ) --Ū��bucket
	local ball=ReadRoleValue( target, EM_RoleValue_Register+4  ) --Ū�����y
	local playerid=ReadRoleValue( target, EM_RoleValue_Register+5)--Ū�����y�Ӧ������a(���~�����a���|�v�T����y) 
	if player~=playerid then  --�p�G�O���~�����a�A���|��J����
		return false
	end


	local tgtid=ReadRoleValue( TargetID(), EM_RoleValue_OrgID) --���ѥؼЬO�_�����ʥؼ�
	if tgtid~= 120917 and tgtid~= 120918 and tgtid~= 120919 then --�p�G���O�I���}�f�Areturn false
		return false
	end
	
	if tgtid==120919 then

		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 1) --�}�f����[���@��

	else
		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 2)--�}�f���榩���@��
		addbuff(player, 622799, 0, 75)--���~�k�N�n���A�[��Q�����|�z��
	end
end

-------------------------------------------------------------------------------------------------
function lua_skwerl_craft1_begin1() ---�ͤ�����
	local Player= OwnerID()
	local Machine= TargetID()
	local state=ReadRoleValue( machine, EM_RoleValue_Register+1  ) --�p�G�O1�A�N���H�b�� �A�p�G�O0�A�C���|�}�l
	Closespeak(Player)
	If Checkflag(Player, 546708)== true then  --�p�G���a���Ѥw�g���L
		ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_01]", C_SYSTEM) --�ާ@[120905]�ݭn�j�q����q�A�N��O���g�ʾԪ��_�I�̤]�u��@�Ѿާ@�@���I
		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_01]", C_SYSTEM) --�ާ@[120905]�ݭn�j�q����q�A�N��O���g�ʾԪ��_�I�̤]�u��@�Ѿާ@�@���I
		return false
	end
	If checkbuff(player, 622847)== true then
		return false
	end
	if state==1 then   --�p�G���H�b���A���X
		ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_16]", C_SYSTEM) --�q�����a���H���b�i��C��
		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_16]", C_SYSTEM)
		return false
	end
 	Callplot (machine, "lua_skwerl_craft1_begin2", player, machine)	
end




----------------------------------------------------------------------------------------------------
function lua_skwerl_craft1_begin2(player, machine)
	local PID = ReadRoleValue( machine , EM_RoleValue_PID )--Ū��������PID�ӿ�{�X��
	local RoomID = ReadRoleValue( player , EM_RoleValue_RoomID )
	local controller1 -- ������
	local controller2 -- ������
	local controller3 -- ������
	local Table={controller1, controller2, controller3, controller4, controller5}
	local Buff={622752, 622753, 622754, 622847, 622799}
	local state=ReadRoleValue( machine, EM_RoleValue_Register+1  ) --�p�G�O1�A�N���H�b�� �A�p�G�O0�A�C���|�}�l
	local buckettable={} --�O����y���;���table
---------------------------�έp�t�ΡA�p�⦳�h�֪��a���o�Ӭ���-------------------------------
	DesignLog( Machine, 120905 , "Craft event machine play number".."." )
---------------------------------------------------------------------------------------------------------------------------------

	WriteRoleValue(machine, EM_RoleValue_Register+1, 1 ) --�g�Jregister+1���קK��L���a�}�l�i��C��

--------------------���F�קK�����A�C���}�l�ɵ��w�����[�X�лP����---------------------------
	setFlag(player, 546708,1)--���C�駹��flag
--	SkillCraft_AllFinish(player)--������
	Lua_Festival_06_All(player)  -- 6.0.1 ����O
	ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_18]", C_SYSTEM) --�����j�X�F�@�Ǽɭ�����
	ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_18]", C_SYSTEM) --�����j�X�F�@�Ǽɭ�����
	GiveBodyItem(player, 241479, 4)--��4�Ӽɭ����� 
--	----------------------------�������ʧޯ�------------------------------------------
	for i=1, 4, 1 do
		addbuff(player, Buff[i], 1, 100) ---����100�����ʧޯ�
	end
-------------------------------------------------------------------------------------------
sleep(15)

------------------------------�⪱�a�ǰe�쥿�T����m-------------------------------
	local ZoneID = ReadRoleValue(Player, EM_RoleValue_ZoneID)
	local BaseX = GetMoveFlagValue( 781167 , PID , EM_RoleValue_X )
	local BaseY = GetMoveFlagValue( 781167 , PID , EM_RoleValue_y )
	local BaseZ = GetMoveFlagValue( 781167 , PID , EM_RoleValue_z )
	local BaseDir = GetMoveFlagValue( 781167 , PID , EM_RoleValue_Dir )
	ChangeZone(player , ZoneID, RoomID, BaseX, BaseY, BaseZ, BaseDir) ---�⪱�a�Ǩ���a
	sleep(10)	
----------------------------------------------------------------------------------------



	lua_skwerl_craft1_countdown(player) --�˼�(ready???? Go!)
--	-----------------------------------------------------------------------------------
	for i=1, 5, 1 do
		Table[i]= CreateObjByFlag(120907, 781166, i-1+(PID*5), 1)	-- �b�X�Хͤ�����(���ͪ���ID , ���ͺX�lID , �X�l��mID , ���ͼƶq)
--		SetModeEx(Table[i], EM_SetModeType_Show, false )--���
		SetModeEx(Table[i] , EM_SetModeType_Mark, false )--�аO
		SetModeEx(Table[i], EM_SetModeType_ShowRoleHead, false) --���Y�ۮ�
		SetModeEx(Table[i], EM_SetModeType_HideName, true )--�����W��
		AddToPartition( Table[i] , RoomID )
		WriteRoleValue(Table[i], EM_RoleValue_Register+9, player ) -- �������O���a
	--	WriteRoleValue(Table[i], EM_RoleValue_LiveTime, 70 )
		Callplot(Table[i], "lua_skwerl_craft1_controller2")--�ͥX���ؼв��;��}�l���ͥؼ�
--�}�l����˼ƧR���t��
	end

	Callplot(machine, "lua_skwerl_craft1_machinelock", player, table, buff, RoomID) --(�C�������ɷ|�A���\���a�[�J������H�ιC����������)	
	Callplot(machine, "lua_skwerl_craft1_product", player) --(���浹�����y������)
end

function lua_skwerl_craft1_countdown(player) --�˼ƭp�ɾ���
	ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_02]", C_SYSTEM)--�w��
	ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_02]", C_SYSTEM) --�w��
	sleep(30) 
	ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_03]", C_SYSTEM)--�}�l!
	ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_03]", C_SYSTEM) --�}�l!
end

function lua_skwerl_craft1_machinelock(player, table, buff, RoomID)--�C���������� �P �קK��L���a�b�C���i��ɶ}�ҷs�C���A���۷|��C������
--table ���Ҧ����}�f����Abuff�����ʬ����ޯ�AroomID������Ҧb��roomID
	local Distance
	local score
	local machine= OwnerID()
--	sleep(760) --���ʷ|�i��76��
	for i= 1, 75, 1 do
		local explosivescore= FN_CountBuffLevel(player, 622799)+1  --Ū���z�}����(��25�|���z)

--		say(player, explosivescore)
-----------------------------------------------------------------------�p�G���a�U�u
		If CheckID(player)== false then
			for i=1,5,1 do
				break
			end
		end
--------------------------------------------------------------------- �p�G���a�X��/���}
		if Checkbuff(player, 622847)==false then
			for i=1,5,1 do
				Callplot(Table[i], "lua_skwerl_craft1_bucketdel") --�ͥ��y�����ۧڧR��
			end
			for i=1, 5, 1 do
				cancelbuff(Player, buff[i]) --�M������buff
			end
			sleep(15)
			cancelbuff(player, 622830)
			WriteRoleValue(machine, EM_RoleValue_Register+1, 0 ) --�M��register+1�Ӥ��\��L���a�}�l�i��C��
			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_13]", C_SYSTEM) ---���ƹL�C�A���ʥ��ѡA�ݭn����
			ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_13]", C_SYSTEM) 
			return false

		end
--------------------------------------------------------------------------------------------------
		if explosivescore >=24 then --���a�C������ؼз|�o�z�}���A�p�G���a��N����ƥ[���������ܡA�����|���z
			local Obj = Role:new(machine)  -- ���omachine X.Y.Z.Dir��  �Ψӥ��z�}�����Ϊ��� 121016
			local BaseX = Obj :X()
 			local BaseY = Obj :Y()
			local BaseZ = Obj :Z()
			local BaseDir = Obj:Dir()
			local explosive = CreateObj(121016, BaseX , BaseY+18 , BaseZ , BaseDir , 1 )--�z�}�����Ϊ��� 
			SetModeEx( explosive , EM_SetModeType_NotShowHPMP , true )	------��show���
			AddtoPartition (explosive, RoomID)
			


			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_15]", C_SYSTEM) ---�A....�쩳�O���F����?!
			ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_15]", C_SYSTEM) ---�A....�쩳�O���F����?!
			
			if CountBodyItem(player, 530897)==0 then-- �ˬd�O�_���z�����ٸ��A�S���~��
				givebodyitem(player, 530897, 1)
			end
			Hide(machine)  --�z�}��A�����Ȯɮ���	
			SysCastSpellLv(explosive, explosive, 499402, 0 ) --�����z�}�S��
			SysCastSpellLv(explosive, explosive, 499449, 0 ) --�����z�}�S��2
			addbuff(player, 622829, 1, 4)--���a�˦a
			
			cancelbuff(player, 622830)
			for i=1,5,1 do
				Callplot(Table[i], "lua_skwerl_craft1_bucketdel") --�ͥ��y�����ۧڧR��
			end
			sleep(30)
			WriteRoleValue(machine, EM_RoleValue_Register+1, 0 ) --�M��register+1�Ӥ��\��L���a�}�l�i��C��
			for i=1, 5, 1 do
				cancelbuff(Player, buff[i]) --�M������buff
			end
			delobj(explosive)
			sleep(150)
			Show(Machine, RoomID) --�������s�X�{
			return false
		end
		sleep(10)
	end

--------------------------------------bonus �Ҧ�------------------------------------------
	score= FN_CountBuffLevel(player, 622830)+1  --Ū������
	if score>= 220 then 
		ScriptMessage(player, player, 1, "[SKWERL_CRAFT1_17]", C_SYSTEM ) --�ť����a����
		sleep(20)	
		for i=1,5,1 do
			WriteRoleValue(Table[i], EM_RoleValue_Register+1, 1 ) --�ͥ��y�� register 1�g��1�A�}��bonus mode
		end
		sleep (160)
	end
---------------------------------------------------------------------------------------------
	score= FN_CountBuffLevel(player, 622830)+1  --Ū������
	ScriptMessage(player, player, 1, "[SKWERL_VAL_08]", C_SYSTEM ) --�ť����ʵ���
	for i=1,5,1 do
		Callplot(Table[i], "lua_skwerl_craft1_bucketdel") --�ͥ��y�����ۧڧR��
	end
	sleep(15)
	for i=1, 5, 1 do
		cancelbuff(Player, buff[i]) --�M������buff
	end
	sleep(15)
	ScriptMessage(player, player, 1, "[SKWERL_VAL_33]"..": "..score, C_SYSTEM ) --�ť����a����
	cancelbuff(player, 622830)
	WriteRoleValue(machine, EM_RoleValue_Register+1, 0 ) --�M��register+1�Ӥ��\��L���a�}�l�i��C��

	if score >=365 then --(�p�G�o��365���H�W��)
		if CountBodyItem(player, 530919)==0 then-- �ˬd�O�_���s���ާ@�����ٸ��A�S���~��
			givebodyitem(player, 530919, 1)
		end
	end

  end

function lua_skwerl_craft1_product(player)--���U�ιs���script --�C��X�����@��
	local machine= OwnerID()
	local mode ---0 �N��S���L���A1�N���Ĥ@�����A2�N���ĤG����
	local score
	for i=1, 100, 1 do
 			mode=ReadRoleValue( machine, EM_RoleValue_Register+2  )
 			score= FN_CountBuffLevel(player, 622830)+1  --Ū������
		
		if Checkbuff(player, 622847)==false or CheckID(player)== false  then           --- �p�G���a�����k�N�ΤU�u�A���s�A����script
			WriteRoleValue(machine, EM_RoleValue_Register+2, 0)--�g�J�P�_�Areset
			return false
		end

 		if score >119 and mode==0 then--120����
 			Givebodyitem(player,241606, 1)--�����a�U�ιs��x1
 			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_14]", C_SYSTEM) 
 	 		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_14]", C_SYSTEM)    --�s�y���\
 			WriteRoleValue(machine, EM_RoleValue_Register+2, 1 ) --�g�J�P�_�A�����Ĥ@��	
 		end
 	
 		if score >209 and mode==1 then --210����
 			Givebodyitem(player,241606, 1)--�����a�U�ιs��x1
 			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_14]", C_SYSTEM) 
 	 		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_14]", C_SYSTEM)    --�s�y���\
 			WriteRoleValue(machine, EM_RoleValue_Register+2, 2 )--�g�J�P�_�A������2��	
 		end
 		
 		if score >359 and mode==2 then --360����
 			Givebodyitem(player,241606, 1)--�����a�U�ιs��x1
 			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_14]", C_SYSTEM) 
 	 		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_14]", C_SYSTEM)    --�s�y���\
 			WriteRoleValue(machine, EM_RoleValue_Register+2, 0)--�g�J�P�_�Areset
 			return false	
 		end


	sleep(10)
	end
end



function lua_skwerl_craft1_bucketdel() --�R�����y�Ͳ����Ϊ��@��
local bucket= OwnerID()
local ball=ReadRoleValue( bucket , EM_RoleValue_Register+6 )--Ū�����y (register+6)
local invisiball=ReadRoleValue( bucket , EM_RoleValue_Register+7 )--Ū�����Ϊ���� (register+7)
Delobj(ball) --�R��������y
Delobj(invisiball)--�R���������Ϊ���
Delobj(bucket)--�R���Ͳ����Ϊ���P���y���Ͳ���

end



function lua_skwerl_craft1_controller2()
	local bucket= OwnerID()
	local player=ReadRoleValue(bucket, EM_RoleValue_Register+9  )
	----Ū���}�f��m ---����y�ͦb�ۤv����m�W
	local RoomID = ReadRoleValue(bucket , EM_RoleValue_RoomID )
	local Obj = Role:new(bucket)  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	--�ХX���y---�H����X�Ӧ������y����
	local choice
	local choice2
	local random= rand(3)
	if random==0 then --��y 
		choice=120910   --��y 
		choice2=120917--������βy
		elseif random==1 then --�Ųy
		choice=120911 --�Ųy
		choice2=120918--�Ŧ����βy
		elseif random==2 then--���y
		choice=120912--���y
		choice2=120919--�������βy
	end 
	local ball = CreateObj( choice, BaseX , BaseY+18 , BaseZ , BaseDir , 1 )--���y(���ƻݨD����)
	local invisiball= CreateObj( choice2, BaseX , BaseY, BaseZ , BaseDir , 1 ) --�Х����Ϊ���A�]�����y�S���Ѧ��I�A�o���@���O�ѳo�Ӫ������A�ҥH�i�H����������
	SetModeEx(invisiball, EM_SetModeType_ShowRoleHead, false) --�����Ϊ����Y�ۮ�
	SetModeEx(invisiball, EM_SetModeType_HideName, true )--�������Ϊ���W��
	SetModeEx(invisiball, EM_SetModeType_Mark, false )--�������Ϊ���W�P 
	SetModeEx(invisiball, EM_SetModeType_Show, false )--��������Ϊ������
	SetModeEx(ball, EM_SetModeType_ShowRoleHead, false) --�����Ϊ����Y�ۮ�
	SetModeEx(ball, EM_SetModeType_HideName, true )--�������Ϊ���W��
	SetModeEx(ball, EM_SetModeType_Mark, false )--�������Ϊ���W�P 
	SetModeEx( ball, EM_SetModeType_Gravity, false )--���y�������O�v�T
	Addbuff(ball, 500988, 1, -1) ---��y���Y�p
	sleep(21)
	AddToPartition(ball , RoomID )
	AddtoPartition (invisiball, RoomID)
	WriteRoleValue(bucket, EM_RoleValue_Register+6, ball ) ---���������{�ѥ��y��(�g�J register+6)
	WriteRoleValue(bucket, EM_RoleValue_Register+7, invisiball ) ---���������{�����Ϊ���� (�g�Jregister+7)
	Callplot(invisiball, "lua_skwerl_craft1_ball2", ball, bucket, player)--���Ϊ���}�l����o���@���C
end




function lua_skwerl_craft1_ball2(ball, bucket, player) --���Ϊ�����檺�@���A�D�n������y���j�p�P���y���a�O�_���磌��I�k
	local invisiball=OwnerID()
	local time0
	local time1
	local time2
	local switch
	WriteRoleValue(invisiball, EM_RoleValue_Register+3, bucket)  --�g�Jbucket
	WriteRoleValue(invisiball, EM_RoleValue_Register+4, ball)  --�g�J���y
	WriteRoleValue(invisiball, EM_RoleValue_Register+5, player)  --�g�J���a(��{�o�ʥ��y�O�Q���T���a����)
	
	local mode= ReadRoleValue(bucket, EM_RoleValue_Register+1  ) ---�p�Gregister+1��0==�@��Ҧ�  1==bonus �Ҧ�
--	say(bucket, mode)
	if mode==0 then
		time0= Rand(41)+5 --�H���M�w��2���q���s���ɶ�
		time1= Rand(41)+5--�H���M�w��2���q���s���ɶ�
		time2= Rand(31)+21--�H���M�w�ĤT���q���s���ɶ�
	elseif mode==1 then
		time0= 1  --�H���M�w��2���q���s���ɶ�
		time1= 1 --�H���M�w��2���q���s���ɶ�
		time2= 150 --�H���M�w�ĤT���q���s���ɶ�
	end
	
	WriteRoleValue(invisiball, EM_RoleValue_Register+2, 1)  --�g�J���y���A(�ثe���y���j�p)--�p--�Ȥ@��
	for i=1,time0,1 do --�Ĥ@���q�ͦs�ɶ�
		sleep(1)
	end
	
	cancelbuff(ball, 500988) --�R���Y�p�N�ϥ��y�ܤj

	WriteRoleValue(invisiball, EM_RoleValue_Register+2, 2)  --�g�J���y���A(�ثe���y���j�p)--�� �Ȩ��

	for i=1, time1, 1 do --�ĤG���q�ͦs�ɶ�
		sleep(1)
	end
	
	WriteRoleValue(invisiball, EM_RoleValue_Register+2, 6)  --�g�J���y���A(�ثe���y���j�p)--�j �Ȥ���
	addbuff(ball, 505454, 1, -1) --�ϥ��y�ܤj

	for i=1, time2, 1 do --�ĤT���q�ͦs�ɶ�
		sleep(1)
	end


	Delobj(ball)--�R�����y
	delobj(invisiball)
	callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, 3, 2)---���y�z���A����

end


function lua_skwerl_craft1_score(player, bucket, ball, points, choice) --�o��/���� ���u�@�� --points�����y�ȴX��--choice�����a���S���ϥΥ��T���k�N�A���T��1���~��2
				
	If choice==1 then
		addbuff(player, 622830, points-1, -1) --�̷ӥ��y�j�p�����a����
		ScriptMessage(player, player, 1, "+"..points, C_SYSTEM )
		SysCastSpellLv(bucket, bucket, 499108, 0 ) --�o���S��

		Addbuff(Bucket, 621985, 1, 1) --killer visual fx
		Delobj(ball)--�R�����y
		Callplot(bucket, "lua_skwerl_craft1_controller2") --�q���������h�ͷs�����y
	elseif choice==2 then --�p�G�ޯ��ܿ��~�A����
		CastSpell(bucket , bucket , 497005 ) ---�z�}�S��
		--�����t��--
		local score= FN_CountBuffLevel(player, 622830)  --��Ū���ثe������
		cancelbuff(player, 622830) --�R���ثe����
		addbuff(player, 622830, score-1, -1) --��s���� 
		ScriptMessage(player, player, 1, "-1", 0 )
		 --�q���������h�ͷs�����y
		Delobj(ball)--�R�����y
		Callplot(bucket, "lua_skwerl_craft1_controller2")--�q���������h�ͷs�����y
	end
end



function lua_skwerl_craft1_reset()
	local player=OwnerID()
	DelBodyItem(player, 546708, 1)
	DelBodyItem(player, 530897, 1)
	DelBodyItem(player, 530919, 1)
end

