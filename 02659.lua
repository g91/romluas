---register vlaue used---
-- monster register 8 and 9 are for destination navigations
--- monster register 2 are target hit lock

--player register 1 ==WriteRoleValue(player, EM_RoleValue_Register+1,  ) for timer system 
-- player em register 2= attack cooldown
--player register 3== 1==timed mode 0==survival
-- player register 4== 1= timed 2= survival
--	WriteRoleValue(player, EM_RoleValue_Register+7, 5 )  for player sp 1hko  weapon count
--	WriteRoleValue(player, EM_RoleValue_Register+8, 5 )  for player sp slow down  weapon count
--	WriteRoleValue(player, EM_RoleValue_Register+9, 5 )  for player sp 1hko  weapon count


function lua_skwerl_mobius_movetest() --�ͥX�S�O�ؼХΪ�script
	local player= OwnerID()
	local BaseX = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_X )
	local BaseY = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_y )
	local BaseZ = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_z )
	local BaseDir = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( player, EM_RoleValue_RoomID )
	local j= 0
	local i= 0
	monster= CreateObj(106885, BaseX, BaseY, BaseZ, BaseDir , 1 )
	SetModeEx( monster , EM_SetModeType_ShowRoleHead, false) --���Y�ۮ�
	SetModeEx( monster , EM_SetModeType_HideName, true )--�����W��
	AddToPartition( monster , RoomID )
	addbuff(monster, 623108, 120, -1) --�[�t
	Addbuff(monster, 622599, 1, -1) --�ۤ��S��
	sleep(10)
	WriteRoleValue(monster, EM_RoleValue_LiveTime, 20 )
	Callplot(monster, "lua_skwerl_mobius_move",j, i) --���ʨ�X��
end


function lua_skwerl_mobius_test()
	local player = OwnerID()
	Addbuff(Player, 622377, 1, -1)	
	AddBuff(Player , 621826 , 1 , -1)
end


function lua_skwerl_mobius_impact()  ---���u�@��
	local target= TargetID() --�ؼ�
	local Player=OwnerID() --���a
	local hp= FN_CountBuffLevel(target, 622401)+1 --�ثe�ؼЪ���q
	local speed=FN_CountBuffLevel(target, 622403)+1---�ثe�ؼЪ��t�ץ[��
	local modifier=2^speed --(�t�׵������ƶq�O�o�˺⪺: �[�t�@��=����x2   �[�t�⦸:����x2x2�A�[�t�T��= ����x2x2x2) 
	local score= modifier*2 --(2 �O�C�wHP�����򥻤��ơAmodifier���W����X�Ӫ����ƥ[��)
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	local hit= ReadRoleValue( target , EM_RoleValue_Register+2  ) --�ˬd�ؼЬO�_�H���u �A��hit��1�ɡA�ؼФw�g�n���F�A���bdelobj�A�ҥH�k�N���|�A����A�p�G�S�o�ӧP�_�A�|���ܦh"plot is already running"
	local spellcast= ReadRoleValue(player , EM_RoleValue_Register+2  ) --�ˬdspellcast�O�_�b����
	if spellcast==0 then 
		callplot(player, "lua_skwerl_mobius_tgttest")--(����CD�t�ΡA�ҪO��CD�t�η|���"�N�o��"�T���A�ڧ�Ψ��register�]�w�Ӱ����N��CD�C
		CastSpell(player, target, 499390) --�y�������S�ġA�o�ӯS�Ħۤv�����CD���קK"�w�b�I�k��"�T���~�W. ��register2��1�ɡA�k�N�L�k�I��) !!!!�����k�N�����S��CD�A���L�����S�Ħ�CD!!!!!
	else 
	--	say(player, "busy")
	end


	PlayMotion( player , 88 ) ---�o�k�ʧ@(�]���k�N�����a�������a�S��o���I�k�ʧ@�A�ҥH�N�h�y��)


	if target==player then  --�p�G�ؼЬO���a�A��ܿ��~�T��
		ScriptMessage(player,player,2, "[EM_200928_2]", C_SYSTEM)
		ScriptMessage(player,player,0, "[EM_200928_2]", C_SYSTEM)
		return  false
	end

	
	if tgtid~=106881 and tgtid~=106882 and tgtid~=106883 and tgtid~= 106884 and tgtid~=106885 then  --�u�������ʥؼ�
		return false
	end
	if checkbuff (target, 622606)== true then --�˼Ʈɪ��ؼеL��(�b�@�ޫ᪺�ؼЬO�L�Ī��A���L��buff return false)
		return false
	end
	
	if hit==1 then ---�p�G�P�_�ؼФw�g���u(�ؼЦ��`��)�A�k�N�L��
	--	say (target, "hit2")
		return false
	end
	----------��H�W���󳣩��M�A�����k�N�}�l�P�_�ؼк���------
	SysCastSpellLv(target, Player, 499386, 1 ) --�o���S�� (�o�����y�����a��)
	if tgtid==106885 then --�S��ؼ�(�����S��ؼ�:106885�|�����a�S��ޯ�)
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- target hit 
		local powerup=rand(2)
		if powerup==0 then --���d��ʧ���
			addbuff(player, 622601, 1, -1)  
			addbuff(player, 622646, 1, -1) --��2�o�����s�u�q
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_07]", C_SYSTEM)
		end
		
		if powerup==1 then --- ���w�t��
			addbuff(player, 622602, 1, -1)
			addbuff(player, 622647, 1, -1)--��2�o�w�t�ަs�u�q
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_06]", C_SYSTEM)
		end

	end

	if tgtid==106882 then --�p�G�ؼЬO�z���� 
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 )-- �קK�Q�����h�� (�ؼФ@���N�i�H�Q�����A�ҥH�Q�����@���N�ŧi���`)
		callplot(target, "lua_skwerl_mobius_scan", Player) ---�z��������script
	--	SysCastSpellLv(target, target, 499370, 1)
		SysCastSpellLv(target, target, 499310,1) ---�z���S��
		SetModeEx( target, EM_SetModeType_Mark, false ) --���аO�A�H�K�s������
	end
	if tgtid==106883 then       --�p�G�ؼЬO�[���� 
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- �קK�Q�����h�� (�ؼФ@���N�i�H�Q�����A�ҥH�Q�����@���N�ŧi���`)
		SysCastSpellLv(target, target, 499311,1) --�����񪺥ؼХ[��
		SetModeEx( target, EM_SetModeType_Mark, false ) --���аO�A�H�K�s������
	end
	if tgtid== 106884 then       --�p�G�ؼЬO�[�t��
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- �קK�Q�����h��
		lua_skwerl_mobius_explosionfx(target, 121070, 499312)  --�z�}�S�ġA�����P��ؼХ[�t
		SetModeEx( target, EM_SetModeType_Mark, false ) --���аO�A�H�K�s������

	end
	if hp<=2 then --�p�GHP�֩�2�A�ؼз|�Q����
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- �קK�Q�����h��
		if tgtid==106881 or tgtid==106885 then 
   			SysCastSpellLv( target, target, 497005,1 )
   		end
		AddBuff(target , 622727 , 1 , -1) ---�������ؼгQ�w��
		Addbuff(player, 622402, score-1, -1) --���a�[��
	--	Addbuff(player, 622543, 0, -1)
	--	say(target, score)
		SetModeEx( target, EM_SetModeType_Mark, false ) --���аO�A�H�K�s������
   		Callplot(target, "lua_skwerl_mobius_death")--����0.8���R���t��(���M�S�ķ|����)
	else --�p�G�ؼЦ��j��2���ͩR�ȡA���@�I���ͩR��
		Cancelbuff(target,  622401) --�R���즳�ͩR��
		local hp2=hp-3 --�����ثe��hp�q(����w) �]���C�������ƬO�H2����¦
		Addbuff(player, 622402, score-1, -1)--�����a����
	--	say(target, score)
		addbuff(target, 622401, hp2, -1)
	end

end


function lua_skwerl_mobius_death() --����0.8���R���t��(���U�S�ķ|����)
	sleep(8)
	delobj(OwnerID())
end


function lua_skwerl_mobius_move()--�Ǫ����ʨt�ΡAŪ�����ʺX��781130�A���۫��w�ؼв��ʦܺX�Ъ��񪺮y��
	local owner=OwnerID()
	local x
	local y
	local z
	local j= ReadRoleValue( owner , EM_RoleValue_Register+8  )  --Ū���ۤv���ؼ�
	local i=ReadRoleValue( owner , EM_RoleValue_Register+9  ) --Ū���ۤv���ؼ�
	x = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_X )
	y = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_y )
	z = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_z )
	movedirect(owner, x+13*j, y , z+13*i )
end


function lua_skwerl_mobius_spawn(player, loop, time)
	local BaseX = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_X )--��ǥκX��[781131]���y��
	local BaseY = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_y )--��ǥκX��[781131]���y��
	local BaseZ = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_z )--��ǥκX��[781131]���y��
	local BaseDir = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( player, EM_RoleValue_RoomID )
	local timemode= ReadRoleValue(player, EM_RoleValue_Register+3) --�p�Gtimemode=1�A�N��O���p�ɼҦ�
	local monsterlist={}
	local wall
--	cancelbuff(Player, 622543)
	wall= CreateObj(114771, BaseX+64 , BaseY, BaseZ+95  , BaseDir , 1 ) --�ͩǮɡA�Ǫ��e���|��������
	SetModeEx( wall, EM_SetModeType_Mark, false ) --���аO
	AddToPartition( wall , RoomID )
	if loop~=1 and timemode==1 then --�p�G�p�ɹC�����b�i�椤�A�Ȱ��p�ɾ�
		lua_skwerl_mobius_clockpause(player)
	end
-----�ͩǨt�ΡAŪ���X��781131����m�A���ۦA�H9x5���Φ��ͩ�
	for i= 0, 8, 1 do	
 		for j=0, 4, 1 do
			local spawnid
 			local monster
			local random=5
			if (i==1 and j==3) or  (i==4 and j==3) or (i==7 and j==3) then --�j��b(1, 3) (4, 3) �P(7,3)����m���z�}��
				random=0		
			end

			if j==1 and (i==0 or i==2 or i==4 or i==6 or i==8) then --�b(1, 0), (1, 2), (1,4), (1,6), �P(1,8)����m�ͯS�O��
				random=rand(3)
			end

			if random==0 then ---�z�}��
					spawnid=106882 ---�[����
				elseif random==1 then
					spawnid=106883
				elseif random ==2 then --�[�t��
					spawnid=106884
				elseif random > 2 then
					spawnid=106881 --�@��ؼ�
			end
 			monster= CreateObj(spawnid, BaseX+16*j , BaseY, BaseZ+16*i  , BaseDir , 1 )--(�C���Ǫ���m�O�Ѯy�ЧP�_)
			Addbuff(monster, 622401, 1, -1) --�]hp��2(�WHP buff)
			SetModeEx( monster , EM_SetModeType_NotShowHPMP , true )	------��show���
			SetModeEx( monster , EM_SetModeType_ShowRoleHead, false) --���Y�ۮ�
			SetModeEx( monster , EM_SetModeType_HideName, true )--�����W��
			SetModeEx( monster  , EM_SetModeType_Searchenemy, false )--���i����
			SetModeEx( monster  , EM_SetModeType_Strikback, false )--���i����
 			AddToPartition( monster , RoomID )
			lua_skwerl_mobius_levelspeed(monster, loop) --�t�η|�P�_���a�O�b�ĴX���A�ӽվ�Ǫ����]�t: (loop=���d��)
			WriteRoleValue( monster , EM_RoleValue_Register+1 , player )  ---�Ǫ��O���a
			WriteRoleValue(monster , EM_RoleValue_Register+8, j )    --�Ǫ��O��ۤv���ؼ� (�ؼХH�ۤv��register 8�P9�ӨM�w�n������m�A�H�O�����ʶ���)
			WriteRoleValue(monster, EM_RoleValue_Register+9, i ) --�Ǫ��O��ۤv���ؼ�  (�ؼХH�ۤv��register 8�P9�ӨM�w�n������m�A�H�O�����ʶ���)
			WriteRoleValue(monster, EM_RoleValue_LiveTime, 200 ) --�]�w�Ǫ��ͦs�ɶ�(��ꤣ�O�ܭ��n�A�ƥ��t�ΥH�K�Ǫ��R�������D)
			MoveToFlagEnabled( monster, false ); --  �קK�t�η|�b NPC ���}�X���I�ӻ����ɭԤU�O NPC �]�^�X���I
			table.insert(monsterlist, monster) 
			addbuff(monster, 622606, 1, -1) --�Ǫ���ͥX�ɵ{�L�Ī��A�A���M�N�Q���a���W�����F

		sleep (1)
 		end

	end	
	
	lua_skwerl_mobius_countdown(player, wall)
	if loop==1 and timemode==1 then --�p�G�O���p�ɩʹC��
		 lua_skwerl_mobius_clockstart(player, time) --�p�G�C���O��}�l�A�гy�p�ɾ�
	elseif timemode==1 then  --�p�G�O���p�ɩʹC��
		 lua_skwerl_mobius_clockcontinue(player)--�p�G�p�ɼȰ��A�~��p��
	end
	For i= 1, table.getn(monsterlist), 1 do
		cancelbuff(monsterlist[i], 622606)--�Ǫ��}�l���ʡA�����L��
		Callplot(monsterlist[i], "lua_skwerl_mobius_move")--���ʨ�X��
	end
end


function lua_skwerl_mobius_scan(Player) ---���z�}�ؼФ��z�ɡA�|�p��Ҧ�����ؼЪ�����
	local target
	local total=0
	target= LuaFunc_SearchNPCbyOrgID(OwnerID() , 106881, 25 , 1 )   	--�j�M�d�򤺪��@��ؼ�
	for i=0, table.getn(target), 1 do
		local hit= ReadRoleValue( target[i] , EM_RoleValue_Register+2  ) --�ˬd�ؼЬO�_�H���u 
		if hit==0 then	
			local hp= FN_CountBuffLevel(target[i], 622401)+1 --�p��ؼЦ�q
			local speed=FN_CountBuffLevel(target[i], 622403)+1 --�p��ؼЪ��t��buff
			local modifier=2^speed 
			local score= modifier*hp
		--	say(target[i], score.." modifier:"..modifier.." ")
			total =total+score
	
		--	say(target[i], "scanned")
			SysCastSpellLv(target[i], player, 499386, 1 )
			WriteRoleValue(target[i], EM_RoleValue_Register+2, 1 ) -- �N��ؼФw�g�Q�����A�קK�@�ӥؼгQ����h���M��y��script already running
			SetModeEx( target[i]   , EM_SetModeType_Mark, false ) --���аO�A�H�K�s������
			addbuff(target[i], 622727, 1, -1)
			callplot(target[i], "lua_skwerl_mobius_death")--�R���Q���쪺�ؼ�
		--------------^��Ҧ�����ؼЪ����ƥ[�_�� ^-------------------------
		end
	end
--	say(player, "total1: "..total)
	total=total/2 --�]���O�z�}�ؼЩҥH�o����b
--	Addbuff(player, 622543, table.getn(target)-1, -1)
--	say (Player, total)
	Addbuff(player, 622402, total-1, -1) --�����a�[��
	if total >2 then --�z�X���a�o���z�}����F�X��
		ScriptMessage(player, player, 2, "+".." "..total+2, C_SYSTEM )	
	end
	
	if total >28 then --�p�G�@�����z28���A�����N
		if CountBodyItem(player, 530924)==0 then-- �ˬd�O�_���z�}���ٸ��A�S���~��
			givebodyitem(player, 530924, 1) --�z�O����
		end
	end
end



function lua_skwerl_mobius_hp_buff() --�[��ؼм@��(���b499311�U)
	local target= TargetID()
	local Player=OwnerID()
	local hp= FN_CountBuffLevel(Target, 622401)+1
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	if tgtid==106881 then --�p�G�O�@��ؼ�
	local hp2= (2*hp)	--hpx2
	--	say (target, "hp2".." "..hp2)
		cancelbuff(target, 622401) ---�R�����hp
		addbuff(target, 622401, hp2-1, -1) ---�a�J�shp�ƭ� 
		addbuff(target, 622400, 1, -1) ---�S��
	end
end


function lua_skwerl_mobius_speed()---�[�t�ؼ��z�}�@�� (���b499312�U)
	local target= TargetID()
	local owner=OwnerID()
	local j= ReadRoleValue( target , EM_RoleValue_Register+8  )  --Ū���ۤv���ؼ�
	local i=ReadRoleValue( target , EM_RoleValue_Register+9  ) --Ū���ۤv���ؼ�
	local hp= FN_CountBuffLevel(Target, 622401)+1
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	if tgtid~=106881  then --�u�|���T�@��ؼ�
		return false
	end
--	addbuff(target, 622403, 0, -1)
	--say(target, "test2")
	if owner==target then
		delobj(owner)
		return false
	end


	local bufflv= FN_CountBuffLevel(target, 622403)+1  --�ؼХ[�tbuff�h��
	local speedlv= FN_CountBuffLevel(target, 623108)+1 --�ؼЭ즳���t��
	addbuff(target, 622403, bufflv, -1) --(��ؼХ[�t)
	StopMove(target, true)--������ؼмȰ�
	ReCalculate(target)--�����A�����s�p��ؼз|��F�ت��a���t�v
	callplot(target, "lua_skwerl_mobius_move", j, i)--���s���沾�ʼ@��

end








function lua_skwerl_mobius_scantest()
	addbuff(OwnerID(), 622521, 1, -1)

end


function lua_skwerl_mobius_line()
	local owner= OwnerID()
	local target= TargetID()
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9  ) --Ū�����a
	if tgtid==106885 then--�����R���S�O�ؼСA�S��ؼжV�ɤ���game over
		delobj(target)
	end
	if tgtid==106881 or tgtid==106882 or tgtid==106883 or tgtid== 106884 then  --�u���y���ʥؼ�
		Addbuff(Owner, 622401, 0, -1) --��ؼФ@�V�ɡA�[�@�h622401(�p��V�ɥؼжq)
		local bufflv= FN_CountBuffLevel(Owner, 622401)+1 --(�p�G�ؼжV�ɡA622401�|�Q�[�h�A�[��5���ɭ�game over)
		local playerbuff= FN_CountBuffLevel(player, 622576)+1  ---���a�ٳѦh�֥ؼЬ�V���|(Ū�X�ӡA�p���)
		if bufflv<6 then
			ScriptMessage( player , player , 2 ," ".. bufflv.."[SKWERL_MOBIUS_04]" , 0 )
		end 
		cancelbuff(player, 622576) ---���a�ٳѦh�֥ؼЬ�V���|
		if playerbuff>0 then
			addbuff(player, 622576, playerbuff-2, -1)--(��s�i�V�ɥؼмƦr)<---��ܦb�p���O�W�Ϊ�
		end
		delobj(target)		
	end
end




function lua_skwerl_mobius_linescan(npc, player)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+9, player ) --�O���a

	while true do
------�O���O����--------------------------
	local playerscore=FN_CountBuffLevel(player, 622402)+1--���ܰO���O����
	local playerhp=FN_CountBuffLevel(player, 622576)+1--�i�V�ɦ���

	SetSmallGameMenuStr( PLAYER , 15 , 1 , "[SKWERL_MOBIUS_05][$SETVAR1="..playerhp.."]" ) --�i�V�ɦ���
	SetSmallGameMenuStr( PLAYER , 15 , 2 , "[SC_DDR_STRING07_STATE][$SETVAR1="..playerscore.."]" ) --���ܰO���O����
------------------------------------------
	SysCastSpellLv( OwnerID(), OwnerID(), 499352,1 )--�����V�ɥؼХΪ�������]�k��
	sleep(10)
	end

end



function lua_skwerl_mobius_loop(player, npc, timersystem)
	local owner= OwnerID()
	local BaseX = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_X ) --781130 ���ͩǥκX�СA����y��
	local BaseY = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_y )--781130 ���ͩǥκX�СA����y��
	local BaseZ = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_z )--781130 ���ͩǥκX�СA����y��
	local BaseDir = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( npc, EM_RoleValue_RoomID )
	local timemode= ReadRoleValue(player, EM_RoleValue_Register+3) --�p�G�O���p�ɩʹC���Atimemode=1�A�p�G���ͦs�ԡAtimemode==0
	local x=0
	local time=0
	local scanner
	local randomspawn=0
	Closespeak(Player) --�������a�Pnpc��ܮ�
	lua_skwerl_mobius_npcswitch(false, true) --�קK���a�b���ʮ��I�쬡��npc(�]���@�}�l��NPC���)
	Setflag(player, 546722, 1) --���L���ʪ��X��
	ClientSkyType( EM_ClientSkyProcType_Day ) --�ܦ��դѡA���M�C�t�Ϊ��a�ݤ��M��
	AddBuff(Player , 622727 , 1 , -1)--�⪱�a�w��
	SetSmallGameMenuType( Player, 15 , 1 ) --�O���O�A��1���гy�A��2������				--�O���O
	scanner= CreateObj(120687, BaseX+13*4 , BaseY, BaseZ+13*2  , BaseDir , 1 ) --�b���I�u�y�X���y��:scanner (scanner�|���y�V�ɪ��ĤH�q)
	SetModeEx( scanner, EM_SetModeType_Show , false ) --�����scanner
	AddToPartition( scanner , RoomID )
	Callplot(scanner, "lua_skwerl_mobius_linescan", npc, player)
	ChangeZone(player , 360, RoomID, 53.2, 963.2, 411.3, 270) ---�⪱�a�Ǩ�g���a�I	
	sleep(10)
	addbuff(player, 622576, 4, -1)--�i�V�ɦ���(��ܦb���aUI�W���V�ɴ���) (Game over�Ϊ��t�άOŪscanner�W��buff 622401
	Addbuff(Player, 622377, 1, -1) --�������a�򥻧����ޯ�
	
--	Hide(owner)
	sleep(30)
--	Show(Owner, RoomID)
	while true do --��Ҧ��C���}�l�B�J���ǳƦn��A�}�l�]�C������j��
		x=x+1
		--say(Owner, "loop"..x.." ") --x �����d��(�o�N�O������q0�}�l��)
		ScriptMessage(player,0,2, "[SKWERL_MOBIUS_01][$SETVAR1="..x.."]", C_SYSTEM)
	--	callplot(Owner, "lua_skwerl_mobius_spawn", player, x)
		lua_skwerl_mobius_spawn(player, x, timersystem) --�ͥؼХΪ�script�A�ͧ��ؼЫ��~�����j��
		sleep (20)  --�o�Ӱj��D�n�OŪ�����I�uscanner�����p�A�P�C���ɶ��˼ƪ��A
 			while true do
 		
 				local bufflv= FN_CountBuffLevel(scanner, 622401)+1 --scanner��buff level�O�M�w��X�ӥؼжV�ɡA�p�G5�ӥؼжV�ɡAbuff level�N�|�O5
				local countdown
				if timemode==1 then --��C���Ҧ����p�ɼҦ��ɡA�|�hŪ���ثe�˼Ʈɶ�
					countdown=ClockRead(player , EM_ClockValueType_NowTime )
				else 
					countdown=100 --�b�L�p�������Ҧ������t�ΥH���٦��Ѯɶ� (�ҥH�b�D�p�ɼҦ��A�ɶ��û��ݦb100��)
				end
		
 				if bufflv> 4 or countdown<1  then  --�p�G�ɶ�������5�ӥؼжV�ɡAgame over
					if bufflv>4 then
						ScriptMessage( player , player , 2 ,"[SKWERL_MOBIUS_08]", 0 ) --�ŧi�L�h�ؼжV�ɡAgame over
					end
					lua_skwerl_turtlecleanup() ---�p�Ggame over�A�R���Ҧ����W�ؼ�
					lua_skwerl_mobius_endgame(player, countdown, x, timemode, scanner)--����C���������ơA���y�p��@��
					return false	
 				end
 		
 				local number=lua_skwerl_mobius_tgtcount() --�ƥX���W�s���ؼмƶq(�ƶq�T�{�O0�|�w��U�@���A���M���a�|�@����)

 				if number<1 then --�p�G�ؼмƬ�0�A�����i�J�U�@��
 					ScriptMessage(player,0,2, "[SKWERL_MOBIUS_03][$SETVAR1="..x.."]", C_SYSTEM)
					local wavebonus= (x*30) --�����a�L�����Q�A���Q==���d��x30
 					ScriptMessage(player,0,2, "[SKWERL_MOBIUS_13]".." + "..wavebonus.." ", C_SYSTEM)
					ScriptMessage(player,0,0, "[SKWERL_MOBIUS_13]".." + "..wavebonus.." ", C_SYSTEM)
					Addbuff(player, 622402, wavebonus, -1)
					sleep(20)
					if timemode==0 and  x==10 then ---�p�G�������Ҧ������X���A���a���}
						lua_skwerl_mobius_endgame(player, countdown, x, timemode, scanner)
						return false	
					end
					break
 				end

				time= time +1
			--	say(OwnerID(), x.." :  "..time)
 				sleep(10)
				if (x==3 or x==6 or x==9 or x== 12 or x==15 or x==18 or x== 21 or x==24 or x==27 or x==30) and time==1 then ----�b�o�Ǧ^�X���Ĥ@���ͥX�S��ؼ�
					lua_skwerl_mobius_movetest()
				end

 			end
	time=0
	sleep(1)
	end
end


function lua_skwerl_mobius_tgtcount() --�j�M�t�ΡA�^�����a�W���ؼЪ����`�ơA�p�G��X�Ӭ�0�A�C���|�i�J�U�@��
	local tgt1
	local tgt2
	local tgt3
	local tgt4
	local count1
	local count2
	local count3
	local count4
	count1= LuaFunc_SearchNPCbyOrgID(OwnerID() , 106881, 650 , 1 )
	count2 = LuaFunc_SearchNPCbyOrgID(OwnerID() ,106882 , 650 , 1 )
	count3= LuaFunc_SearchNPCbyOrgID(OwnerID() , 106883, 650 , 1 )  	
	count4= LuaFunc_SearchNPCbyOrgID(OwnerID() , 106884, 650 , 1 )  	
	tgt1= table.getn(count1)
	tgt2= table.getn(count2)
	tgt3= table.getn(count3)
	tgt4= table.getn(count4)
	local total= tgt1+tgt2+tgt3+tgt4
	return total
end


Function lua_skwerl_mobius_countdown(player, wall)
	--	local count= 5-(i-1)
		ScriptMessage( player, player, 2, "Get ready!!!" , C_SYSTEM)  
		sleep (35)
		delobj(wall)
		ScriptMessage( player, player, 2, "Go!!!" , C_SYSTEM)  

end

function lua_skwerl_turtlecleanup() ---�R�����W�Ҧ��ؼХ�
	lua_skwerl_tgtdelete(106881)
	lua_skwerl_tgtdelete(106882)
	lua_skwerl_tgtdelete(106883)
	lua_skwerl_tgtdelete(106884)
	lua_skwerl_tgtdelete(106885)
end

function lua_skwerl_tgtdelete(object)--�����d�򤺥ؼШç�ؼЧR��
	local tgt
	tgt= LuaFunc_SearchNPCbyOrgID(OwnerID() , object, 650 , 1 )   	
	for i=0, table.getn(tgt), 1 do
	Delobj(tgt[i])
	end
end



---------------------------�C�������t��---------------------------------

function lua_skwerl_mobius_endgame(player, countdown, x, timemode, scanner) --x �O���d��
		lua_skwerl_mobius_npcswitch(true, false) --���ʵ����ANPC��_��i��ܪ��A
		local scorerecord 
		local gamemode=ReadRoleValue(player, EM_RoleValue_Register+3) --�p�G�O1���ܡA�N��p�ɼҦ��C
		local bonuslv=  FN_CountBuffLevel(player, 622576)+1 --�έp���a���V�ɦ���
		clockclose(player)  ---�����˼ƭp��
------------------------------------------------v  ���\���}�~�|����bonus v------------------------------------------------------------------
	 	if countdown<1 or (timemode==0  and x==10 and bonuslv>1) then --�Ĥ@���O���]�p�ɼҦ����ɶ���A�ĤG���O���b�ͦs�ԯ}��(mode: �ͦs�ԡA��X���A�s�����\)
			if countdown<1 then		
				ScriptMessage( player , player , 2 ,"[SKWERL_MOBIUS_31]", 0 ) --�ɶ���
			elseif x==10 then ---�D��10�����}
				ScriptMessage( player , player , 2 ,"[SKWERL_MOBIUS_44]", 0 ) --�ͦs���\�I
			end
			ScriptMessage( player , player , 2 ,"[SKWERL_MOBIUS_09]", 0 ) --�V�m�����I
			sleep(25)
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_11]", C_SYSTEM) --���u�[��
			ScriptMessage(player,player,0, "[SKWERL_MOBIUS_11]", C_SYSTEM) --���u�[��
			sleep(10)
			local defbonus= bonuslv*50 --�Υ��V�ɦ��ƨӭp�⨾�ubonus
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_12]".." "..bonuslv.." x ".."50 ", C_SYSTEM) -- �i�V�ɦ���x50
			ScriptMessage(player,player,0, "[SKWERL_MOBIUS_12]".." "..bonuslv.." x ".."50 ", C_SYSTEM) 	-- �i�V�ɦ���x50
			sleep(20)
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_17]"..defbonus.."[SKWERL_VAL_34]", C_SYSTEM) --�B�~X��
			ScriptMessage(player,player,0, "[SKWERL_MOBIUS_17]"..defbonus.."[SKWERL_VAL_34]", C_SYSTEM)  --�B�~X��
			Addbuff(player, 622402, defbonus-1, -1)
			sleep(30)
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_10]".." + 100" , C_SYSTEM)  --�ͦs���y
			ScriptMessage(player,player,0, "[SKWERL_MOBIUS_10]".." + 100" , C_SYSTEM)  --�ͦs���y
			Addbuff(player, 622402, 99, -1) --�����a�[��

			-- defense bonus

		end
		---------------------^�H�W�����\�L����bonus�A����game over�N���|��^-------------------------------------------------	
		sleep(15)

		local playerscore=FN_CountBuffLevel(player, 622402)+1
		ScriptMessage(player,player,2, "[SKWERL_MOBIUS_38]"..x, C_SYSTEM) ---�������d�ơG
		ScriptMessage(player,player,0, "[SKWERL_MOBIUS_38]"..x, C_SYSTEM)----�������d�ơG

		--ScriptMessage(player,player,2, "[SKWERL_MOBIUS_10]", C_SYSTEM)
		sleep(30)

		ScriptMessage(player,player,2, "[SKWERL_VAL_33]"..":"..playerscore.."[SKWERL_VAL_34]", C_SYSTEM) --�`�� ____��
		ScriptMessage(player,player,0, "[SKWERL_VAL_33]"..":"..playerscore.."[SKWERL_VAL_34]", C_SYSTEM) --�`�� ____��
		sleep(30)
---------------------------------------------------���N�p��--------------------------------------------------------------------------
		lua_skwerl_mobius_achievements (player, playerscore, gamemode, x)--player==���a playerscore= ���� gamemode=�C���Ҧ��A�p�ɼҦ���1�A�ͦs�Ԭ�0  level=���d��
---------------------------------------------------�����p��--------------------------------------------------------------------------
		local Rank
		if playerscore >= 3300 then
			Rank = "A"
		elseif playerscore >= 2700 then
			Rank = "B"
		elseif playerscore >= 2100 then
			Rank = "C"
		else
			Rank = "D"
		end
		-- 2013.05.13 ���E:�l�[�N�J���a����
 		lua_skwerl_mobius_prizeroll(player,gamemode,Rank,playerscore)
 		--
		sleep(30)
------------------------------------------------------�O���O------------------------------------------------------------------------------
		If gamemode==1 then  --�p�G�O�p�ɼҦ��A�}�ҭp�ɤ��ƪ��p���t��
			Billboard_TopUpdate(Player, EM_BillboardSortType_Range, playerscore) --�W�Ǫ��a������(�u�|�W�Ǥj��ۤv�b�p���O�̰����ƪ�����)
	 		OpenClientMenu(player , EM_ClientMenuType_BillBoard+102 )---�}�p�ɼҦ��Ʀ�]
		end
		--******�`�N�A���P���p���Ҧ��|�}�X���P���O���O*******-------------
		If gamemode==0 then  --�p�G�O�ͦs�Ҧ��A�}�ҭp�ɤ��ƪ��p���t��
			Billboard_TopUpdate(Player, EM_BillboardSortType_Range_Survival, playerscore)--�W�Ǫ��a������(�u�|�W�Ǥj��ۤv�b�p���O�̰����ƪ�����)
	 		OpenClientMenu(player , EM_ClientMenuType_BillBoard+103 ) ---�}�X�ͦs�ԱƦ�]
		end
----------------------------------------------------------------------------------------------------------------------------------------------------
	SetSmallGameMenuType( Player, 15 , 2 ) --�O���O�A��1���гy�A��2������	
	WriteRoleValue(player, EM_RoleValue_Register+1, 0 )--�p�ɾ��t�βM��
	WriteRoleValue(player, EM_RoleValue_Register+2, 0 )  --���a�k�NCD�M��(�h���M�ŨӽT�O�w��)
	WriteRoleValue(player, EM_RoleValue_Register+3, 0 ) --�����p���Ҧ�tag 
		cancelbuff(player, 622576)
		cancelbuff(player, 622402)
--		cancelbuff(Player, 622543)
		cancelbuff(Player, 622377)	
		cancelbuff(Player , 622727)
		cancelbuff(Player, 622601) 
		cancelbuff(Player, 622602) 
		cancelbuff(player, 622604) 
----------------------------------------------------
		cancelbuff(player, 622646)
		cancelbuff(player, 622647)
		cancelbuff(player, 622648)
	
		sleep(10)
		sleep(10)
		delobj(scanner)

end











-----------------------------------------timer system------------------------�p�ɨt��
function lua_skwerl_mobius_clockstart(player, time) --�}�l�p��
ClockOpen(player, EM_ClockCheckValue_28, time, time, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )
end

function Lua_skwerl_mobius_clockend() --�ɶ�����
	ClockClose(OwnerID())
	--say(OwnerID(), "clock ends")
end

function lua_skwerl_mobius_clockpause(player) ---�ɶ��Ȱ�
	--ClockStop(player)
	local time=ClockRead(player , EM_ClockValueType_NowTime ) --��ثe�ɶ�
	WriteRoleValue(player, EM_RoleValue_Register+1, time-1)--��ɶ��O�b���a��register�W
	
	ClockClose(player) --�������a�ثe���˼�
	ClockOpen(player, EM_ClockCheckValue_28, time-1, time-1, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )
	ClockStop(player)
end

function lua_skwerl_mobius_clockcontinue(player) --�~��˼�
	local time =ReadRoleValue(player, EM_RoleValue_Register+1 ) --Ū���O���b���a���W���ݾl�ɶ�
	ClockClose(player) --�������a�ثe���˼�
	ClockOpen(player, EM_ClockCheckValue_28, time, time, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )--�δݾl�ɶ��}�l�b�p��
end

---------------------------------------------------------------------------
function lua_skwerl_clockteststart()
	ClockOpen(OwnerID(), EM_ClockCheckValue_28, 60, 60, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )
end

function lua_skwerl_clocktestpause()
	local time=ClockRead(OwnerID() , EM_ClockValueType_NowTime ) --��ثe�ɶ�
--	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1, time-1 )--��ɶ��O�b���a��register�W
	ClockClose(OwnerID()) --�������a�ثe���˼�
	ClockOpen(OwnerID(), EM_ClockCheckValue_28, time-1, time-1, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )
	ClockStop(OwnerID())
	sleep(30)
	ClockClose(OwnerID())
end

function lua_skwerl_clocktestcontinue() --�~��˼�
	local time =ReadRoleValue(OwnerID(), EM_RoleValue_Register+1 ) --Ū���O���b���a���W���ݾl�ɶ�
	ClockClose(OwnerID()) --�������a�ثe���˼�
	ClockOpen(OwnerID(), EM_ClockCheckValue_28, time, time, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )--�δݾl�ɶ��}�l�b�p��
end

-------------------------------------�O���O--------------------------------------------
function lua_skwerl_scoreboard(player) ---�}�X���T���Ʀ�]
OpenClientMenu(player , EM_ClientMenuType_BillBoard+102 )
--EM_ClientMenuType_BillBoard+016 )
end
-----------------------------------�N�o�t��------------------
function lua_skwerl_mobius_tgttest() ---����Cooldown�t��(���Ϊk�N���X��CD���קK�I�k���P�N�o�����T��)
		WriteRoleValue(OwnerID(), EM_RoleValue_Register+2, 1 ) 

		sleep(20)
		WriteRoleValue(OwnerID(), EM_RoleValue_Register+2, 0) 
end


function lua_skwerl_mobius_attackcd()  ---�p�GCD�t�γ]���aregister 2��1�A�t�Τ��|���\�I�k
	local spellcast= ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  ) --�ˬdspellcast�O�_�b����(�Q��register�ȨӧP�_)
	if spellcast==1 then 
		return false
	end
	if spellcast==0 then
		return true
	end
end


function lua_skwerl_mobius_achievements(player, playerscore, gamemode, level) --player=���a playerscore=���a���ơAgamemode==�C���Ҧ�(0==�ͦs 1==�p��) (level=���a�}�����d��)
	--	say(player, "playerscore:"..playerscore.."  gamemode:"..gamemode.."  level:" ..level)
		if gamemode==1 then  --�p�ɼҦ��S���ٸ�
			if playerscore>2500 then       --���ƺٸ�          �W�V�q�p    --harder                 
				if CountBodyItem(player, 530920)==0 then-- �ˬd�O�_���ٸ��A�S���~��
					givebodyitem(player, 530920, 1) --�W�V�q�p 
				end
			end
			if level>=10 then ---�p�ɼҦ��L���ٸ�  ---�t�Գt�M---easer
				if CountBodyItem(player, 530921)==0 then-- �ˬd�O�_���ٸ��A�S���~��
					givebodyitem(player, 530921, 1) --�t�Գt�M-
				end
			end	
		end

		if gamemode==0 then ---�ͦs�Ҧ�
			if playerscore >=1800 then --���ƺٸ�--�ͦs��--harder
				if CountBodyItem(player, 530923)==0 then-- �ˬd�O�_���ٸ��A�S���~��
					givebodyitem(player, 530923, 1) --�ͦs��
				end
			end
			if level>9 then --���}�ٸ�--�]�k�u����--easier
				if CountBodyItem(player, 530922)==0 then-- �ˬd�O�_���ٸ��A�S���~��
					givebodyitem(player, 530922, 1) --�w�w���u����
				end
			end		
	
		end
end

function lua_skwerl_mobius_levelspeed(monster, level) ---�վ����d�ؼгt�ת�script
	if level==1 then --��1���t��
		addbuff(monster, 623108, 500, -1) --�w�t 
 	end

	if level==2 then--��2���t��
		addbuff(monster, 623108, 440, -1) --�w�t 
	end
	
	if level==3  then--��3���t��
		addbuff(monster, 623108, 360, -1) --�w�t 
	end
	
	if level==4  then--��4���t��
		addbuff(monster, 623108, 220, -1) --�w�t 
	end

	if level==5  then--��5���t��
		addbuff(monster, 623108, 120, -1) --�w�t 
	end

	if level==6  then--��6���t��
		addbuff(monster, 623108, 80, -1) --�w�t 
	end

	if level==7  then--�� 7���t��
		addbuff(monster, 623108, 20, -1) --�w�t 
	end

	if level==8  then--��8���t��
		addbuff(monster, 623108, 0, -1) --�w�t 
	end

	if level==9  then--��9���t��
		addbuff(monster, 623110, 30, -1) --�[�t
	end

	if level==10 then--��10���t��
		addbuff(monster, 623110, 60, -1) --�[�t
	end
	
	if level>10  then--�� ���t��
		addbuff(monster, 623110, 30*(level-7), -1) --�[�t
	end
end


function lua_skwerl_mobius_npcswitch(mode1, mode2)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, mode1) --���Y�ۮ�  true==�} false==��
	SetModeEx( OwnerID(), EM_SetModeType_HideName, mode2 )--�����W��           true==�� false==�}
end

function lua_skwerl_mobius_explosionfx(owner, explosiveid, spell) --owner==����function������Aexplosiveid==�z�}�����βyID�Aspell==�z�}�k�N
	local Obj = Role:new(owner)  -- ���oowner X.Y.Z.Dir��  �Ψӥ��z�}�����Ϊ��� explosiveid
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local RoomID = ReadRoleValue( owner , EM_RoleValue_RoomID )
	local explosive 
	explosive= CreateObj(explosiveid, BaseX , BaseY, BaseZ , BaseDir , 1 )--�ͥX�z�}�����Ϊ��� 
	SetModeEx( explosive, EM_SetModeType_ShowRoleHead, false) --���Y�ۮ�
	SetModeEx( explosive , EM_SetModeType_HideName, true )--�����W��
	SetModeEx( explosive , EM_SetModeType_NotShowHPMP , true )	------��show���
	SetModeEx( explosive , EM_SetModeType_Mark, false )--�аO
	AddtoPartition (explosive, RoomID)
	WriteRoleValue(explosive, EM_RoleValue_LiveTime, 3 ) --���Ϊ��󤭬��R��
	SysCastSpellLv(explosive, explosive, spell, 0 )--�z�}�k�N 

end

--AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem38 , 1 )   --�ٸ��O��

--	local UseItem5 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem38)

--	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem38 , 50 )   --�ٸ��O��
 --700510 �Q�����ʰƥ��v��

--�`�y���ʦw�w���v��

--\\dev1\Server\Resource
--\\GS2\Runewaker\Resource