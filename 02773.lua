--==================================================
--			����NPC��ܼ@��
--==================================================
function Lua_jiyi_thanks_121492() --NPC��ܼ@��
	local player = OwnerID() --���a
	local npc = TargetID() --NPC

	if CheckFlag( player , 547135 ) == true then --�����w����X�Ю�
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_01]" )  --���§A���ڷ��U�b�k
	elseif CheckFlag( player , 547134 ) == true then --�����ʶi�椤�X�Ю�
		if CheckFlag( player , 547136 ) or CheckFlag( player , 547137 ) or  CheckFlag( player , 547138 ) == true then --�ˬd�O�_�������L���@���ȡA�u�n���䤤�@�ӺX�Ю�
			SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_02]" )  --�O�_�n���?
			AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_03]" , "Lua_jiyi_thanks_121492_reward" , 0 )  --�n���
		else 
			SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_05]" )  --�Цܤַ��U�@���b�k
		end
	else			
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_06]" )  --�A�@�N���ڷ��U�b�k��?
		AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_07]" , "Lua_jiyi_thanks_121492_2" , 0 )  --�@�N
		AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_08]" , "Lua_jiyi_thanks_121492_3" , 0 )  --���@�N
	end		
end

function Lua_jiyi_thanks_121492_2() --�@�N���U�b�k
	local player = OwnerID() --���a
	local npc = TargetID() --npc
		CloseSpeak( player )	--������ܵ���
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_09]" )  --���ʻ���
		AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_10]", "Lua_jiyi_thanks_121492_4" , 0 )  --�ѥ[
		AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_11]" , "Lua_jiyi_thanks_121492_3" , 0 )  --���ѥ[
end

function Lua_jiyi_thanks_121492_3() --�������
	local player = OwnerID() --���a
		CloseSpeak( player )	--������ܵ���
end

function Lua_jiyi_thanks_121492_4() --�������ʶi�椤�X��
	local player = OwnerID() --���a
		CloseSpeak( player )	--������ܵ���
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_12]" )  --�Ш������U�b�k
		DesignLog( player , 121492 , " Turkey Code event STAR" )	--�O���ѥ[�H��
		SetFlag( player , 547134 , 1 ) --�}�Ҫ��a���ʶi�椤�X��
end

function Lua_jiyi_thanks_121492_reward() --����y
	local player = OwnerID() --���a
	CloseSpeak( player )
	local npc = TargetID() --npc
	local BuffID = 623670 --�p��BUFF
	local reward = { 206266 , 724509 } --���y�G���ʼ���B�������Ĥ�
	local BuffLv =  FN_CountBuffLevel( player , BuffID ) --�ˬd���a���WBUFF
	local chicken = ReadRoleValue( player , EM_RoleValue_Register+1 ) --Ū���O�bplayer���W���b�k
	local PID = ReadRoleValue( chicken , EM_RoleValue_PID )
	WriteRoleValue( PID , EM_RoleValue_PID , 0 ) --�N�O�����a���W���b�kpid�ȼg��0
	if BuffLv <= 0 then --BuffLv���1
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[2] , 1 ) --���@���Ĥ�
	elseif BuffLv >= 1 and BuffLv < 14 then --BuffLv>=1<15
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 1 ) --���@�i���ʼ���
	elseif BuffLv >= 14 and BuffLv <23 then --BuffLv>=15<23
 		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 2 ) --���G�i���ʼ���
	elseif BuffLv >= 23 and BuffLv < 29 then --BuffLv>=24<30
 		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 3 ) --���T�i���ʼ���
	elseif BuffLv >= 29 then --BuffLv���>=30
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 3 ) --���T�i���ʼ���
		GiveBodyItem( player , reward[2] , 1 ) --���@���Ĥ�	
	end
	WriteRoleValue( player , EM_RoleValue_Register+1 , 0 ) --�N���a���W�����b�k���ȼg�^0
	SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_01]" ) --���§A���ڷ��U�b�k
	SetFlag( player , 547135 , 1 ) -- �w�g����L���y
	DesignLog( player , 1214921 , " Turkey Code event OVER" )	--�O�������H��
	Lua_Festival_11_All(player)--���Լ�
end
--========================================================================
--			�b�k�@��
--========================================================================
function Lua_jiyi_thanks_turkey() --�P�b�k����ܼ@��
	local player = OwnerID() --���a
	local turkey = TargetID() --�b�k
	CloseSpeak( player )
	local PID = ReadRoleValue( turkey , EM_RoleValue_PID ) --�O���b�b�k���W��PID�ȡA=0�}�ҥi���
	local Mode = { 547136, 547137, 547138 , 547134 , 547135 } --����1,2,3�X�СB���ʶi�椤�B��L���y
	local Care = 623698 --�P�_���a�w�g�b���U�b�k

	if PID == 0 and CheckBuff( player , Care ) == false then --��PID�Ȭ�0�ɥB���a���W�S���w�g�b���U�b�k��BUFF�A�}�ҥi��ܪ��A
 		if CheckFlag( player , Mode[4] ) == true then --�ˬd���ʤ��X�ЬO�_�}�ҡA==1���}��
			if CheckFlag( player , Mode[5] ) == false then --�p�G�S��L���y
				if CheckFlag( player , Mode[1] ) == false then --�ˬd�O�_�����L����1(Mode[1])�A�p�G�S���L
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --�@���� �b�k��A�n�_
					AddSpeakOption( player , turkey , "[SC_2012THANKS_PLAYER_121493_01]" , "Lua_jiyi_thanks_turkey2" , 0 )  --�ѥ[				
					--�i�次��(����1)
				elseif CheckFlag( player , Mode[1] ) == true or CheckFlag( player , Mode[2] ) == true then --�ˬd�O�_������1�B����2�X��			
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --�@���� �b�k��A�n�_
				elseif CheckFlag( player , Mode[3] ) == true then --�ˬd�O�_�����L����3(Mode[3])		
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_02]" ) --�@���ܡu�B�B�v�b�k���Q�z�A
				end
			else
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --�@���� �b�k��A�n�_						
			end
		else
			SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" )  --�@�����b�k��A�n�_
		end
	elseif PID == 1 and CheckBuff( player , Care ) == false then --��PID�Ȭ�1�ɥB���a���W�S���w�g�b���U�b�k��BUFF�A�}�ҥi��ܪ��A
 		if CheckFlag( player , Mode[4] ) == true then --�ˬd���ʤ��X�ЬO�_�}�ҡA==1���}��
			if CheckFlag( player , Mode[5] ) == false then --�p�G�S��L���y
				if CheckFlag( player , Mode[1] ) == false then --�ˬd�O�_�����L����1(Mode[1])�A�p�G�S���L
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_03]" )  --�@�����b�k�S���`�N��A
					ScriptMessage( turkey , player , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_01]" , C_SYSTEM )--ĵ�i�T���G�w���H�b���U�b�k
				end
			else
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --�@���� �b�k��A�n�_			
			end
		end
	elseif PID == 1 and CheckBuff( player , Care ) == true then --��PID�Ȭ�1�ɥB���a���W���w�g�b���U�b�k��BUFF�A�}�ҥi��ܪ��A
		if CheckFlag( player , Mode[4] ) == true then --�ˬd���ʤ��X�ЬO�_�}�ҡA==1���}��
			if CheckFlag( player , Mode[5] ) == false then --�p�G�S��L���y
				if CheckFlag( player , Mode[1] ) == false then
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --�@���� �b�k��A�n�_					 
				elseif CheckFlag( player , Mode[1] ) == true or CheckFlag( player , Mode[2] ) == true then --�ˬd�O�_������1�B����2�X��			
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --�@���� �b�k��A�n�_
				elseif CheckFlag( player , Mode[3] ) == true then --�ˬd�O�_�����L����3(Mode[3])	
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_02]" ) --�@���ܡu�B�B�v�b�k���Q�z�A
				end
			else
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --�@���� �b�k��A�n�_
			end
		end								
	else	
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_03]" )  --�@�����b�k�S���`�N��A
	end
end		

function Lua_jiyi_thanks_turkey2() --�X�D��
	local player = OwnerID() --���a
	local turkey = TargetID() --�b�k
	local Care = 623698 --�P�_���a�w�g�b���U�b�k
	local Reg9 = ReadRoleValue( turkey , EM_RoleValue_Register+9 )
	WriteRoleValue( player , EM_RoleValue_Register+1 , turkey ) --�����a�O�o�b�k
	WriteRoleValue(turkey,EM_RoleValue_PID, 1) --�N�b�k���W��PID�ȼg��1
	WriteRoleValue( turkey , EM_RoleValue_Register+9 , player )
	AddBuff( player , Care , 0 , 60 ) --�����P�_���a�w�g�b���U�b�kBUFF
	DW_CancelMount( 68, player ) --�i�J�C�����i�M��
	CloseSpeak( player )
	BeginPlot( turkey , "Lua_jiyi_thanks_turkey3" , 0 ) --����X�D��
	BeginPlot( turkey , "Lua_jiyi_thanks_turkey5" , 0 ) --�����ˬd�����ɶ��B�Z���B���u�B���Ϯ����B����y
end
		
function Lua_jiyi_thanks_turkey5() --���b�k���氻�����a�P�b�k�������Z���çP�_�O�_�N�b�k��PID�ȼg�^0
	local turkey = OwnerID() --�b�k
	local Reg9 = ReadRoleValue( turkey , EM_RoleValue_Register+9 ) --�O�b�b�k���W�����a 
	local PID = ReadRoleValue( turkey , EM_RoleValue_PID ) --�O���b�b�k���W��PID��
	local reward = 547135 --�w��L���X��
	local Dis = GetDistance( turkey , Reg9 ) --�ˬd�b�k�M���a�������Z��
	local Time = 0
	local Mode = 547136
	local buff = { 623686 , 623696 , 623698 } --���ȧޯ�B�P�_�ޯබ��BUFF�B���a�w�g�b���U�b�kBUFF

	while true do	
		Dis = GetDistance( turkey , Reg9 ) --�ˬd�b�k�M���a�������Z��
		if CheckID( Reg9 ) == false then--�p�G���a���u�A���X�j��
			break
		end
		if Dis >= 100 and Dis < 150 then --�p�G�Z���ӻ��A���Xĵ�i�T��
			ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_02]" , C_SYSTEM )--ĵ�i�T�� �G�Z���L��	
		elseif Dis >= 150 then
			ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_03] " , C_SYSTEM )--ĵ�i�T�� �G�Z���ӻ��F		
			break
		end
	   	Time = Time + 1
		if Time == 60 then
	   		ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_05]" , C_SYSTEM )--�ɶ�����X�j��
			WriteRoleValue( turkey , EM_RoleValue_PID , 0 ) --���b�k���WPID�ȼg��0	
			break
		end						
		if CheckFlag( Reg9 , reward ) == true then --�p�G���a���W����L���y�X�СA���X�j��
			break
		end
		Sleep( 10 )
	end
	for i = 1 , 3 do --���X�j��N�N���a���W������BUFF�R��
		CancelBuff( Reg9 , buff[i] ) --�R�����a���W����BUFF
	end
	if CheckFlag( Reg9 , Mode ) == false then
		SetFlag( Reg9 , Mode , 1 ) --�}�ҧ�������1�X��
	end	
end

function Lua_jiyi_thanks_turkey3() --���ȶ}�l
	local turkey = OwnerID() --�b�k
	local player = TargetID() --���a
	local Mode = { 547136, 547137, 547138 , 547134 , 547135 } --����1,2,3�X�СB���ʶi�椤�B��L���y
	local Reg = ReadRoleValue( turkey , EM_RoleValue_Register+0 )
	local String = "[SC_2012THANKS_NPC_121493_SYSTEM_14]"
	local Word = { [1]="[SC_2012THANKS_NPC_121493_SYSTEM_06]" ,
			 [2]="[SC_2012THANKS_NPC_121493_SYSTEM_07]" ,
			 [3]="[SC_2012THANKS_NPC_121493_SYSTEM_08]" ,
			 [4]="[SC_2012THANKS_NPC_121493_SYSTEM_09]" ,
			 [5]="[SC_2012THANKS_NPC_121493_SYSTEM_10]" } --�D�ئr��
	local RandNum
	local BuffID = 623686 --�����^���D�ت��ޯ�
	local BuffLv = 623696 --�P�_���ȶ���buff
	local buff = 623698	--���b���U�b�k��BUFF
	WriteRoleValue( turkey , EM_RoleValue_PID , 1 ) --�N�b�k���W��PID�ȼg��1
	local PID = ReadRoleValue( turkey , EM_RoleValue_PID ) --�O���b�b�k���W��PID��

	if CheckBuff( player , buff ) == true then --���a���W�����b���U�b�kBUFF�~�X�D
		for i = 1 , 3 do
			RandNum = DW_Rand( table.getn ( Word ) )
			String = String..Word[RandNum]
			if i == 3 then
				ScriptMessage( turkey , player , 1 , String , C_SYSTEM )--�D�ئr��
			end
			WriteRoleValue( turkey , EM_RoleValue_Register + i , RandNum ) --�N����1���r��O�bturkey���W
		end
		AddBuff( player , BuffID , 0 , 10 ) --�������ȧޯ�A10�����
		AddBuff( player , BuffLv , 0 , 10 ) --�����P�_����1�O�_���T��buff�A10�����
		Sleep(100)
	end
		String = "[SC_2012THANKS_NPC_121493_SYSTEM_14]"
	if CheckBuff( player , buff ) == true then --���a���W�����b���U�b�kBUFF�~�X�D
		for i = 1 , 5 do --����2
			RandNum = DW_Rand( table.getn( Word ) )
			String = String..Word[RandNum]
			WriteRoleValue( turkey , EM_RoleValue_Register + i , RandNum ) --�N����1���r��O�bturkey���W
			if i == 5 then
				ScriptMessage( turkey , player , 1 , String , C_SYSTEM )--�D�ئr��
			end
		end
		AddBuff( player , BuffID , 0 , 20 ) --�������ȧޯ�A15�����
		AddBuff( player , BuffLv , 0 , 20 ) --�����P�_����1�O�_���T��buff�A15�����
		Sleep(200)
	end
		String = "[SC_2012THANKS_NPC_121493_SYSTEM_14]"
	if CheckBuff( player , buff ) == true then --���a���W�����b���U�b�kBUFF�~�X�D
		for i = 1 , 7 do --����3
			RandNum = DW_Rand( table.getn( Word ) )
			String = String..Word[RandNum]
			WriteRoleValue( turkey , EM_RoleValue_Register + i , RandNum ) --�N����1���r��O�bturkey���W
			if i == 7 then
				ScriptMessage( turkey , player , 1 , String , C_SYSTEM )--�D�ئr��
			end
		end
		AddBuff( player , BuffID , 0 , 30 ) --�������ȧޯ�A20�����
		AddBuff( player , BuffLv , 0 , 30 ) --�����P�_����3�O�_���T��buff�A20�����
		Sleep(300)
	end
		WriteRoleValue( turkey , EM_RoleValue_PID , 0 )	
end

function Lua_jiyi_thanks_turkey6() --���b�k�N�������ˬd���a�O�_���������Ȫ��X�СA�p�G�L�h�}�ҧ������ȺX��
	local player = OwnerID() --���a
	local turkey = TargetID() --�b�k
	local Mode = { 547136 , 547137 , 547138 }	--����1,2,3�X��
	local buff = 623698	--���b���U�b�k��BUFF

	if CheckBuff( player , buff ) == true then --���a�����b���U�b�kBUFF�ɤ~�P�_
		if CheckFlag( player , Mode[1] ) == false then
			SetFlag( player , Mode[1] , 1 ) --�}�ҧ�������1�X��
		elseif CheckFlag( player , Mode[2] ) == false then
			SetFlag( player , Mode[2] , 1 ) --�}�ҧ�������2�X��
		elseif CheckFlag( player , Mode[3] ) == false then	
			SetFlag( player , Mode[3] , 1 ) --�}�ҧ�������3�X��
		end
	end	
end	
--==========================================================================
--			���a�ޯ�
--==========================================================================
function Lua_jiyi_thanks_buffid(Answer) --���b�ޯ઺����@���W�A�ˬd����1�O�_�^�����T Answer = �ޯ�1 , 2 , 3 , 4 , 5
	local player = OwnerID() --���a
	local turkey = TargetID()
	local BuffLv = 623670	-- ����
	local Mode={ [1] = 547136 , [2] = 547137 , [3] = 547138 }	--����1,2,3�X��
	local Quest = { [1] = 3 , [2] = 5 , [3] = 7 }				-- �C���q���X���D��
	local Key = 0	-- �ΨӧP�_�O�_�w�g�ѧ��ӥ���
	local Topic = {}	

	Lua_FE_Reset(Player)	-- �C���I��ޯ઺�ɭԡA�M���̲״Nū

	for i = 1 , #Mode , 1 do	-- ���� 1 ~ 3
		if CheckFlag( player , Mode[i] )== false then --�ˬd���a�O�_�����L����1.2.3
			for j = 1 , Quest[i] , 1 do	-- i = 0
				Topic[j] = ReadRoleValue( turkey , EM_RoleValue_Register+j )
			end
			break
		end
	end	

	for i = 1 , #Topic , 1 do	-- ���Ȫ��D�ئr��ƶq
		if Topic[i] ~= 0 then	-- 1 ~ 5
			if Answer == Topic[i] then	-- �ޯ൹���Ʀr�A�P�b�k�X�D���Ʀr�ŦX�A���ﵹ2���C
				CallPlot( player , "Lua_jiyi_thanks_buffid_motion" , Answer )
				AddBuff( player , BuffLv , 1 , -1 )
				ScriptMessage( turkey , player , 0 , "[SC_2012THANKS_NPC_121493_SYSTEM_12]" , C_SYSTEM )--���ܰT���G�A����F				
			else				-- �ޯ൹���Ʀr�A�P�b�k�X�D���Ʀr���ŦX�A�����������C
				CallPlot( player , "Lua_jiyi_thanks_buffid_motion" , Answer )
				ScriptMessage( turkey , player , 0 , "[SC_2012THANKS_NPC_121493_SYSTEM_13]" , C_SYSTEM )--���ܰT���G�A�����F
			end
			WriteRoleValue( turkey , EM_RoleValue_Register+i , 0 ) --�N�b�k���W�O�r�ꪺREG�ȼg�^0
			break
		end
	end	
end

function Lua_jiyi_thanks_buffid_goal()--�P�_�ؼЬO�_���b�k
	local own = OwnerID()
	local tar = TargetID()
	local chicken = ReadRoleValue( own , EM_RoleValue_Register+1 )
	if tar == chicken then
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_2012THANKS_NPC_121493_SYSTEM_11]" , 0 )--�t�Χi��"�D���ĥؼ�"	
		return false
	end
end

function Lua_jiyi_thanks_buffid_motion(id) --�����ޯ�ʧ@
	local own = OwnerID()
	if id == 1 then
		PlayMotionex ( own , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END ) --����
	elseif id == 2 then
		PlayMotion( own , 112 ) --�ۺq
	elseif id == 3 then
		PlayMotion( own , 261 ) --��R
	end
end


--=====================================================================================
--			���ի��O
--=====================================================================================
function Lua_jiyi_thanks_test() --�R���Ҧ��X��
	local own = OwnerID()
	local Mode = { 547134 , 547135 , 547136 , 547137 , 547138 }	--����1,2,3�X��
	local buff = { 623670 , 623686 , 623696 , 623698 } --�b�k�߱�����(����BUFF)�B���ȧޯ�B�P�_�ޯබ��BUFF�B�P�_���a�w�g�b���U�b�k

	for i = 1 , 5 do
		setflag( own , Mode[i] , 0 ) --�����Ҧ��X��
	end

	for i = 1 , 3 do
		CancelBuff( own , buff[i] ) --�R������BUFF
	end
end