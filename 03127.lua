--Z30��u
--==========�G�m��
function Lua_Z30_108501_LuaEvent_BeginAttack()	--����l�i�J�԰��l�ꤽ��l
	local owner = OwnerID()
	local pid = ReadRoleValue( owner , EM_RoleValue_PID )
	if pid == 0 then
		WriteRoleValue( owner , EM_RoleValue_PID , 1 )
		local x,y,z,dir=DW_Location(owner);	--�ھڪ����m
		local Obj=CreateObj( 108500 , x+30 , y , z , dir, 1 );
		AddToPartition( Obj , 0 ); 
	end
end

function Lua_Z30_108501_LuaEvent_EndAttack()	--����l�����԰��@��
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end	

function Lua_Z30_108500_LuaEvent_EndAttack()	--����l�����԰���R���ۤv
	DelObj ( OwnerID() )
end
----------------------------------426987----------------------------------
function Lua_Z30_426987_Accept()	--�����ȫᵹ��426988���Ȫ��e�m����X��
	local Player = TargetID()
 	local NPC = OwnerID()
	Setflag( Player , 548865 , 1 )
end
------------------------------------426989-------------------------------------
function Lua_Z30_121963_spaek()	--121963�Q�ǩ�����ܼ@��
	local player = OwnerID()
	local NPC = TargetID()
	local PID = ReadRoleValue( NPC , EM_RoleValue_PID )
	LoadQuestOption( player )
	if PID == 0 then
		if CheckAcceptQuest( player , 426991 ) == true and CheckFlag( player , 548860 ) == false then
			AddSpeakOption( player , player , "[SC_Z30_Q426990_00]","Lua_Z30_121963_Activity" , 0 )
		elseif CheckAcceptQuest( player , 426993 ) == true and Countbodyitem( player , 243176 ) == 0 then
			AddSpeakOption( player , player , "[SC_Z30_Q426993_01]","Lua_Z30_121963_spaek2(1)" , 0 )				
		elseif CheckAcceptQuest( player , 426990 ) == true and CheckFlag( player , 548859 ) == false then
			AddSpeakOption( player , player , "[SC_Z30_Q426990_11]","Lua_Z30_121963_spaek2(2)" , 0 )
		elseif CheckAcceptQuest( player , 427046 ) == true and CheckFlag( player , 548862 ) == false then	--�e�U����
			AddSpeakOption( player , player , "[SC_Z30_Q426990_00]","Lua_Z30_121963_Activity" , 0 )
		elseif CheckAcceptQuest( player , 427056 ) == true and CheckFlag( player , 548862 ) == false then	--��������
			AddSpeakOption( player , player , "[SC_Z30_Q426990_00]","Lua_Z30_121963_Activity" , 0 )
		else
			LoadQuestOption( player )
		end
	else
		SetSpeakDetail( Player , "[SC_Z30_Q426989_01]" )
	end
end

function Lua_Z30_121963_spaek2(Option)
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak( Player )
	if Option == 1 then
		SetSpeakDetail( Player , "[SC_Z30_Q426993_02]" )
		Givebodyitem( player , 243176 , 1 )
	elseif Option == 2 then
		SetSpeakDetail( Player , "[SC_Z30_Q426990_12]" )
		SetFlag( Player , 548859 , 1 )
	end
end
------------------------------------426988-------------------------------------
function Lua_Z30_426988_Complete()	--426988���ȧ�������426987��������X��
	local Player = TargetID()
 	local NPC = OwnerID()
	Setflag( Player , 548858 , 1 )
end

function Lua_Z30_123368_touch()	--123368�N�~���󲣥ͼ@��
	local Flask = OwnerID()
	SetPlot( Flask , "touch", "Lua_Z30_123368_touch2", 30 )
end

function Lua_Z30_123368_touch2()
	local Player = OwnerID()
	local Flask = TargetID()
	
	if CheckAcceptQuest( Player , 426988 ) == true or CheckAcceptQuest( Player , 427048 ) == true or CheckAcceptQuest( Player , 427058 ) == true then
		if Countbodyitem( Player , 243179 ) > 0 then	--�w�g���ťۭ�G
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_01]" , 0 )	--�A�w�g�s�@�n[243179]�K
		else
		--	SetPlot( Flask , "touch" , "" , 30 )	--����L�H�L�k�A�I��
			CallPlot( Flask , "Lua_Z30_123368_touch3" , Flask , Player )		
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_02]" , 0 )	--�@�~��������s�e���A�٬O�O�ðʧa�K
	end
end

function Lua_Z30_123368_touch3(Flask , Player)
	local Buff = { [1]=506230 , [2]=507224 , [3]=507225 , [4]=509937 }	--�N�~ , �����G , �����G�� , ���ʭ�G
	local OrgID = { [1]=123368 , [2]=123369 , [3]=123508 }	--�N�~ , �����G , �����G��
	if ReadRoleValue( Flask , EM_RoleValue_OrgID ) == OrgID[1] then
		if CheckBuff( Player , Buff[4] ) == true then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_03]" , 0 )	--�A�w�g�N[509937]���b��W	
		elseif CheckBuff( Player , Buff[2] ) == true then
			Addbuff( Player , Buff[4] , 0 , 10 )
			Cancelbuff( Player , Buff[2] )
			Cancelbuff( Player , Buff[1] )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_04]" , 0 )	--�A�p�ߦa���_[506230]�K
			Cancelbuff( Player , Buff[1] )
			Addbuff( Player , Buff[1] , 0 , 10 )
		end
	elseif ReadRoleValue( Flask , EM_RoleValue_OrgID ) == OrgID[2] then
		if CheckBuff( Player , Buff[4] ) == true then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_03]" , 0 )	--�A�w�g�N[509937]���b��W	
		elseif CheckBuff( Player , Buff[2] ) == true then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_05]" , 0 )	--�A������[507224]�K
		else
			Addbuff( Player , Buff[2] , 0 , 10 )
		end
	elseif ReadRoleValue( Flask , EM_RoleValue_OrgID ) == OrgID[3] then
		if CheckBuff( Player , Buff[4] ) == true then
			for i = 1 , 4 , 1 do
				Cancelbuff( Player , Buff[i] )
			end
			Givebodyitem( Player , 243179 , 1 )	
		else
			Cancelbuff( Player , Buff[3] )
			Addbuff( Player , Buff[3] , 0 , 10 )
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426988_06]" , 0 )	--�A���_[507225]�K
		end		
	end
end			
------------------------------------426991 �]���V�m-------------------------------------
function Lua_Z30_121963_Activity()	--PID=0 ���次�ʼ@��
	local Player = OwnerID()
	CloseSpeak( Player )
	local NPC = TargetID()
	local PID = ReadRoleValue( NPC , EM_RoleValue_PID )	--����NPC�O�_�}�Ҿ԰��V�m

	if PID == 0 then
		WriteRoleValue( NPC , EM_RoleValue_PID , 1 )
		DW_CancelMount( 68 , player )	--�i�J�C�����i�M��
		WriteRoleValue( NPC , EM_RoleValue_Register+9 , Player )	--�N���a�O�bNPC��Reg1
		Addbuff( Player , 509946 , 0 , 34 )
		Beginplot( NPC , "Lua_Z30_121963_Activity2" , 0 )	--�����ˬd
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z21_Q424542_03]" , 0 )	--�ؼЦ��L��
	end
end	

function Lua_Z30_121963_Activity2()
	local NPC = OwnerID()
	local reward = { [1]=548860 , [2]=548862 , [3]=548863 }
	local Player = ReadRoleValue( NPC , EM_RoleValue_Register+9 )
--	local PID = ReadRoleValue( NPC , EM_RoleValue_PID ) --�O���bNPC���W��PID��
	local Time = 0
	local Dis
	local buff = 509946	--���ȧޯ�

	Lua_Z30_121963_Activity3()	-- ����X�D
--	Beginplot( NPC , "Lua_Z30_121963_Activity3" , 0 )	--����X�D
	while true do	
		Dis = GetDistance( NPC , Player )	--�ˬdNPC�M���a�������Z��
		if CheckID( Player ) == false then	--�p�G���a���u�A���X�j��
			break
		end
		if Dis >= 100 then
			ScriptMessage( NPC , Player , 2 , "[SC_Z30_Q426990_01]" , C_SYSTEM )	--ĵ�i�T�� �G�Z���ӻ��A���ȥ��ѡK	
			break
		end
		Time = Time + 1
		if Time == 30 then
	   		ScriptMessage( NPC , Player , 2 , "[SC_Z30_Q426990_02]" , C_SYSTEM )	--�ɶ���A���ʵ����C	
			break
		end
		local Fraction = ReadRoleValue( NPC , EM_RoleValue_Register+8 )	
		if Fraction == 5 then
			ScriptMessage( NPC , Player , 1 , "[SC_Z30_Q426990_03]" , C_SYSTEM )	--���ߧA�����԰��V�m�C
			if CheckAcceptQuest( player , 426991 ) == true and CheckFlag( player , reward[1] ) == false then	--��u
				Setflag( Player , reward[1] , 1 )
			elseif CheckAcceptQuest( player , 427046 ) == true and CheckFlag( player , reward[2] ) == false then	--�e�U����
				Setflag( Player , reward[2] , 1 )
			elseif CheckAcceptQuest( player , 427056 ) == true and CheckFlag( player , reward[2] ) == false then	--��������
				Setflag( Player , reward[2] , 1 )
			end
			break
		end
		for i = 1 , 3 , 1 do					
			if CheckFlag( Player , reward[i] ) == true then	--�p�G���a���W���w�����X�СA���X�j��
				break
			end
			break
		end
		Sleep( 10 )
	end
--	PlayMotion( player , ruFUSION_ACTORSTATE_NORMAL )
	WriteRoleValue( NPC , EM_RoleValue_Register+9 , 0 )
	WriteRoleValue( NPC , EM_RoleValue_Register+8 , 0 )
	WriteRoleValue( NPC , EM_RoleValue_PID , 0 ) --��NPC���WPID�ȼg��0
	CancelBuff( Player , buff ) --�R�����a���W����BUFF
end

function Lua_Z30_121963_Activity3()
	local NPC = OwnerID()
	local player = ReadRoleValue( NPC , EM_RoleValue_Register+9 )
	local Time = 0
	local String
	local Word = { [1]="[SC_Z30_Q426990_08]" ,
			 [2]="[SC_Z30_Q426990_09]" ,
			 [3]="[SC_Z30_Q426990_10]" }	--�D�ئr��
	local RandNum
--	WriteRoleValue( NPC , EM_RoleValue_PID , 1 )	--�NNPC���W��PID�ȼg��1
--	local PID = ReadRoleValue( NPC , EM_RoleValue_PID )	--�O���bNPC���W��PID��
	Sleep(10)
	say( NPC , "3" )
	Sleep(10)
	say( NPC , "2" )
	Sleep(10)
	say( NPC , "1" )
	Sleep(10)	
	String = "[SC_Z30_Q426990_07]"
	for i = 1 , 7 do	--�D��
		RandNum = DW_Rand( table.getn( Word ) )
		String = String..Word[RandNum]
		WriteRoleValue( NPC , EM_RoleValue_Register+i , RandNum )	--�N���Ȫ��r��O�bNPC���W
		local REG = ReadRoleValue( NPC , EM_RoleValue_Register+i )
	--	say( NPC , "REG="..REG )
		if i == 7 then
			ScriptMessage( NPC , player , 1 , String , C_SYSTEM )	--�D�ئr��
		end
	end
--	PlayMotion( player , ruFUSION_ACTORSTATE_NORMAL )
--	Sleep(300)
--	WriteRoleValue( NPC , EM_RoleValue_Register+9 , 0 )
--	WriteRoleValue( NPC , EM_RoleValue_PID , 0 )	
end

function Lua_Z30_426990_buffid(Answer)	--���b�ޯ઺����@���W�A�ˬd���ȬO�_�^�����T Answer = �ޯ�1 , 2 , 3 
	local player = OwnerID() --���a
	local NPC = TargetID()
	local Quest = { [1] = 3 , [2] = 5 , [3] = 7 }	-- �C���q���X���D�ءG����K�վ����סA���N�D�ؤ���3������
	local Topic = {}	

	Lua_FE_Reset(Player)	-- �C���I��ޯ઺�ɭԡA�M���̲״Nū

	for j = 1 , Quest[3] , 1 do	-- i = 0
		Topic[j] = ReadRoleValue( NPC , EM_RoleValue_Register+j )
	end
	CallPlot( player , "Lua_Z30_426990_BuffAnswer" , Answer )
	for i = 1 , #Topic , 1 do	-- ���Ȫ��D�ئr��ƶq
		if Topic[i] ~= 0 then	-- 1 ~ 7
			if Answer == Topic[i] then	-- �ޯ൹���Ʀr�A�PNPC�X�D���Ʀr�ŦX�A����C
		--		CallPlot( player , "Lua_Z30_426990_BuffAnswer" , Answer )
				local Fraction = ReadRoleValue( NPC , EM_RoleValue_Register+8 )	
				WriteRoleValue( NPC , EM_RoleValue_Register+8 , Fraction+1 )
				ScriptMessage( NPC , player , 0 , "[SC_Z30_Q426990_04]"..Fraction+1 .."[SC_Z30_Q426990_05]" , C_SYSTEM )	--���ܰT���G�A����F				
			else				-- �ޯ൹���Ʀr�A�PNPC�X�D���Ʀr���ŦX�A�����C
		--		CallPlot( player , "Lua_Z30_426990_BuffAnswer" , Answer )
				ScriptMessage( NPC , player , 0 , "[SC_Z30_Q426990_06]" , C_SYSTEM )	--���ܰT���G�A�����F
			end
			WriteRoleValue( NPC , EM_RoleValue_Register+i , 0 ) --�NNPC���W�O�r�ꪺREG�ȼg�^0
			break
		end
	end	
end

function Lua_Z30_426990_buffid_goal()	--�P�_�ؼЬO�_��NPC
	local own = OwnerID()
	local tar = TargetID()
	local NPC = 121963
	if ReadRoleValue( tar , EM_RoleValue_OrgID ) == NPC then
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_2012THANKS_NPC_121493_SYSTEM_11]" , 0 )	--�t�Χi��"�D���ĥؼ�"	
		return false
	end
end

function Lua_Z30_426990_BuffAnswer(id)
	local player = OwnerID()
	if id == 1 then
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN )
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_BOW_END )
	elseif id == 2 then
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN )
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_GUN_END )
	elseif id == 3 then
		PlayMotion( player , ruFUSION_ACTORSTATE_ATTACK_POLEARM_SP )
	end
end
------------------------------------426993-------------------------------------
function Lua_Z30_119965_spaek()	--�áD�v���O��ܼ@��
	local player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426993 ) == true and Countbodyitem( player , 243102 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z30_Q426992_01]","Lua_Z30_119965_spaek2(1)" , 0 )	--�p�̪񦳬ݨ�I�P�����B���۩����M�z�ԩ����ܡH
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_119965_spaek2(num)
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak( Player )
	if num == 1 then
		SetSpeakDetail( Player , "[SC_Z30_Q426992_02]" )
		Givebodyitem( player , 243102 , 1 )		
	end
end

function Lua_Z30_115807_Speak()	--115807��ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426993 ) == true and Countbodyitem( player , 242973 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z30_Q426993_03]","Lua_Z30_115807_Speak2(1)" , 0 )	--�ڦb��I�P�����B���۩����M�z�ԩ����K
	elseif CheckAcceptQuest( player , 426985 ) == true and Checkflag( player , 548864 ) == false then	--426985
		AddSpeakOption( player , player , "[SC_Z30_Q426985_01]","Lua_Z30_115807_Speak2(2)" , 0 )	--[121772]�s�ڨӧ�A�K
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_115807_Speak2(Option)
	local player = OwnerID()
	CloseSpeak( Player )
	if Option == 1 then
		SetSpeakDetail( Player , "[SC_Z30_Q426993_04]" )
		Givebodyitem( player , 242973 , 1 )
	elseif Option == 2 then
		SetSpeakDetail( Player , "[SC_Z30_Q426985_02]" )	--[121772]�s�A�Ө�U�ڭ̡H�����A�u�n���A�L�������Ԥh�������ܡH��F�A�֥s�L�O�ڪ��A�L��򻡡A�ڴN�t�X�L�a�C
		Setflag( player , 548864 , 1 )
	end	
end		
------------------------------------426995�\�@-------------------------------------
function Lua_Z30_243178check()	--243178��N�������@��Ť�ϥΫe�ˬd
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Pool = 123268	--�Ʊ����
	if DW_CheckQuestAccept("or", Player , 426995 ) == true or DW_CheckQuestAccept("or", Player , 427054 ) == true or DW_CheckQuestAccept("or", Player , 427064 ) == true then
						--��u								--�e�U								--����
		if TOrgID == Pool then
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--�t�Χi��"�D���ĥؼ�"
			return false									
		end
	else	
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , 0 )	--�t�Χi��"�ϥα��󤣲ŦX�C"
		return false
	end
end

function Lua_Z30_506229use()
	local Player = OwnerID()
	local Food = TargetID()
	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426994_01]" , 0 )
	if DW_CheckQuestAccept("or", Player , 426995 ) == true then	--��u	
		Setflag( Player , 548861 , 1 )
	elseif DW_CheckQuestAccept("or", Player , 427054 ) == true or DW_CheckQuestAccept("or", Player , 427064 ) == true then	--�e�U	
		Setflag( Player , 548165 , 1 )
	end
end

function Lua_Z30_123366_Speak()	--���s���@��Ť�
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if CountBodyItem( Player , 243178 ) == 0 then
		if DW_CheckQuestAccept( "or" , Player , 426995 ) == true and CheckFlag( Player ,  548861 ) == false then
			AddSpeakOption( Player , NPC , "[SC_Z30_Q426995_01]" , "Lua_Z30_123366_SpeakRetake" , 0 )	--�@��Ť�Q�ڧ˥�F...
		elseif CheckFlag( Player ,  548165 ) == false then
			if DW_CheckQuestAccept( "or" , Player , 427054 ) == true or DW_CheckQuestAccept("or", Player , 427064 ) == true then
				AddSpeakOption( Player , NPC , "[SC_Z30_Q426995_01]" , "Lua_Z30_123366_SpeakRetake" , 0 )	--�@��Ť�Q�ڧ˥�F...
			end				
		end
	end
end

function Lua_Z30_123366_SpeakRetake()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426995_02]" )	--�A���A�@�����|�A���n�A�˥�[243178]�F�I
	GiveBodyItem( Player , 243178 , 1 )		
end
--Z30�e�U+PE
------------------------------------427047+427057-------------------------------------
function Lua_Z30_208970check()	--��÷�ϥ��ˬdLua
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local beast = 108500	--�����ͷ��s�~
	if CheckAcceptQuest( player , 427047 ) == true or CheckAcceptQuest( player , 427057 ) == true then
		if Countbodyitem( player , 208971 ) > 0 then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q427047_01]" , 0 )	--�A�w�g���[208971]
			return false
		elseif TOrgID == beast then 
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z28Q426650_05]" , 0 )	--�t�Χi��"�D���ĥؼ�"
			return false
		end
	end
end

function Lua_Z30_208970use()	--��÷�ϥ�Lua
	local player = OwnerID()
	local tar = TargetID()
	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q427047_01]" , 0 )	--�A�w�g���[208971]
	GiveBodyItem( player , 208971 , 1 )
	Callplot( player , "Lua_Z30_208970use2" , player , tar )
end

function Lua_Z30_208970use2( player , tar )
	local RoomID = ReadRoleValue( player , EM_RoleValue_RoomID)
	hide( tar )
	sleep(100)
	show( tar , RoomID )
--	AddToPartition( tar , RoomID )
end
------------------------------------427049+427059-------------------------------------
function Lua_Z30_427049_Objend()	--�I�������@��
	local player = OwnerID()
	DW_QietKillOne( 0 , 106290 )	--�R�R������106290�ǡA�e�̱�����̡A0�N�����a
	return true
end
			