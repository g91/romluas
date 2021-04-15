--ZONE_TAPATAPA_GORGE	�𩬶𩬮l
--------------------------------426628�C�m��--------------------------------------
function Lua_Z28_123100_speak()
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426628 ) == true and CheckFlag( player , 548366 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426628_01]","Lua_Z28_123100_speak2(1)" , 0 )	--"�߰ݤC�m�ɭn�����o"		
	else
		LoadQuestOption( player )
	end
end

function Lua_Z28_123100_speak2(num)
--	CloseSpeak( OwnerID() )
	if num == 1 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426628_02]" )	--�C�m�ۥ�����𩬶𩬮l��A�ǻ��u���i�̥i�H��o�A�]���ǻ��C�m�۷|�l�޳��~�e�ӡA�p�G���⳥�~���ˬO�L�k��o�C�m�۪�
		SetFlag( OwnerID() , 548366 , 1 )
--	elseif num == 2 then
--		SetSpeakDetail( OwnerID() , "[SC_Z28Q426639_06]" )	--�̪񦣵۷ǳƲ���A�S�Ųz�R�i��A�ЧA���ڸ�R�i�໡���¡C
--		Delbodyitem( OwnerID() , 243067 , 1 )
--		SetFlag( OwnerID() , 548423 , 1 )
	end					
end
----------------------------------426629�L�۱ڪ��ڪ�----------------------------------------
function Lua_Z28_426629_ChickobjBegin()	--�C�m��Ĳ�I�@��
	local player = OwnerID()
	local stone = TargetID()
	if DW_CheckQuestAccept("or",player,426629) == true and Countbodyitem( player , 242980 ) == 0 then	
		return true
	else		
		ScriptMessage( Player , Player , 1 , "[SC_Z28Q426629_01]" , 0 ) 	--�o�O�@���ӥ��z�X�C�m�C�⪺���R���Y
		return false
	end
end

function Lua_Z28_426629_ChickobjEnd()
	local player = OwnerID()	--���a
	local stone = TargetID()
	GiveBodyItem( player , 242980 , 1 )
	CallPlot( player , "Lua_jiyi_Round_0415" , stone , 106877 , 3 , 80 , 0 )
	-- �ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|�B�إߪ���O�_����
	ScriptMessage( Player , Player , 1 , "[SC_Z28Q426629_02]" , 0 ) 	--�A�N�C�m�ۮ��_�ӡA�P�򳺥X�{���̤C�m�۪����~...
end
----------------------------------426630�i�̳ͱ�-------------------------------
-------�������ȫ�h��
function Lua_jiyi_Z28_426630_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623835
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
 		 WriteRoleValue(NPC, EM_RoleValue_Register1,999)          
 	 	AddBuff( Player, CliBuff , 0 , 10 )
 	 	CallPlot(NPC, "Lua_jiyi_Z28_426630_Accept2" , NPC, Player, CliBuff)    ----���t��function      
 	end 
end

function Lua_jiyi_Z28_426630_Accept2(NPC, Player, CliBuff)
	local New_NPC =  DW_CreateObjEX("obj", 123157 , NPC) ----�ͦ��t��
 	local WalkFlag = 781360
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	NPCSAY(New_NPC, "[SC_Z28Q426630_01]")	--�Ƥ��y��A�ڭ̧֥h���§a�I
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , WalkFlag , 0 , 0 , 1)
 	Sleep(10)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end
--DW_MoveToFlag( ObjID , FlagObjID , FlagID, Range , Enable  )
--ObjID ���沾�ʪ���H
--FlagObjID �X�l����Ʈw�s��
--FlagID �X�l�s��
--Range �üƨM�w���ʨ�w�I���d��
--Enable  0�A������movotoflag   1�A����movetoflag
function Lua_jiyi_Z28_623835_Delete()
 	local Player = OwnerID()

 	if DW_CheckQuestAccept("or",Player, 426630) == false then
 		 CancelBuff(Player, 623835)
 	end
end

function Lua_jiyi_Z28_123158speak()	--123158�˩��˩���ܼ@��
	local player = ownerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426630 ) == true and CheckFlag( player , 548436 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426630_02]","Lua_jiyi_Z28_123158speak2" , 0 )	--�ڷǳƦn�ѥ[�����F
	else
		LoadQuestOption( player )
	end
end

function Lua_jiyi_Z28_123158speak2()
	CloseSpeak( OwnerID() )	
	NPCSay( TargetID() , "[SC_Z28Q426630_03]" )	--���F���A�L�̡ۭA���ڭ̤@�_�ּ֦a�ۺq�B���R�A�w��ڭ̪��s�^��
	PlayMotion(OwnerID() , 261 )
	PlayMotion( TargetID() , ruFUSION_ACTORSTATE_CAST_SP01 )
	SetFlag( OwnerID() , 548436 , 1 )
end
------------------------------426631�ͩR���i�Q-------------------------------
-------�٥��ȫ��t
function Lua_jiyi_Z28_426631_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623836
 	local Num = ReadRoleValue( NPC , EM_RoleValue_Register1 )

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
 		WriteRoleValue( NPC , EM_RoleValue_Register1 , 999 )          
 	 	AddBuff( Player , CliBuff , 0 , 10 )
 	 	CallPlot( NPC , "Lua_jiyi_Z28_426631_Complete2" , NPC , Player , CliBuff )    ----���t��function      
 	end 
end

function Lua_jiyi_Z28_426631_Complete2(NPC, Player, CliBuff)
	local New_NPC =  DW_CreateObjEX("obj", 122875 , NPC) ----�ͦ��t��
 	local WalkFlag = 781360
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local OrgID = SearchRangeNPC( New_NPC , 100 )
	local fegar = 123144	--���
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	NPCSAY(New_NPC, "[SC_Z28Q426631_01]")	--���F�O���A���i�̪��B�ͦ^�k�ͩR�a�C
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , WalkFlag , 1 , 0 , 1)
	for i = 0 , table.getn(OrgID) do
		if ReadRoleValue( OrgID[i] , EM_RoleValue_OrgID ) == fegar then
			SetDefIdleMotion(New_NPC,	ruFUSION_MIME_ATTACK_1H )  
			CastSpell( New_NPC , OrgID[i] , 498298 ) 
	--		Addbuff(New_NPC , 623899 , 0 , 5 )
		end
	end
	NPCSay( New_NPC , "[SC_Z28Q426631_02]")	--�Ӧn�F�A�L���W���ͩR���r�w�g�Ѱ��F
	sleep(20)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 )
end
--DW_MoveToFlag( ObjID , FlagObjID , FlagID, Range , Enable  )
--ObjID ���沾�ʪ���H
--FlagObjID �X�l����Ʈw�s��
--FlagID �X�l�s��
--Range �üƨM�w���ʨ�w�I���d��
--Enable  0�A������movotoflag   1�A����movetoflag
--function Lua_jiyi_Z28_623836_Delete()
-- 	local Player = OwnerID()
-- 	if DW_CheckQuestAccept("or",Player, 426631) == false then
-- 		 CancelBuff(Player, 623836)
-- 	end
--end
---------------------------------426632�A�G�B�t�~�B�u�@��-----------------------------------
function Lua_jiyi_Z28_123155speak()	--��´���ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )

	if CheckAcceptQuest( player , 426632 ) == true and CheckFlag( player , 548437 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426632_03]","Lua_jiyi_Z28_123155speak2(1)" , 0 )	--��ť�������˥[�i�H�Ѱ��´��۪��A�G...
	elseif CheckAcceptQuest( player , 426633 ) == true and Countbodyitem( player , 209986 ) == 0 and Checkflag( player , 547381 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426633_08]","Lua_jiyi_Z28_123155speak2(2)" , 0 )	--�ڦn���ѤF���´���...(426633��ܼ@��)		
	else
		LoadQuestOption( player )
	end
end

function Lua_jiyi_Z28_123155speak2(Options)
	CloseSpeak( OwnerID() )
	if Options == 1 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426632_04]" )
		SetFlag( OwnerID() , 548437 , 1 )
	elseif Options == 2 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426633_09]" )	--�A��´��ۿ�Ѧb�o�F	
		Givebodyitem( OwnerID() , 209986 , 1 )
	end		
end
-------------------------------------426633�a���t�~------------------------------------------
--function Lua_Z28_426633accept()
--	local Player = TargetID()
-- 	local NPC = OwnerID()
--	Addbuff( Player , 623292 , 0 , 60 )
--end

function Lua_Z28_426633complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	CancelBuff_NoEvent( Player , 623292 )  
--	Cancelbuff( Player , 623292 )
end

function Lua_Z28_108118StartLua()	--�o�g�������˥[��l�@��(�Ω����)
	local Papa = OwnerID()
	local MaxHP = ReadRoleValue( Papa , EM_RoleValue_MaxHP )		--�`��q
	LockHP( Papa , ReadRoleValue( Papa , EM_RoleValue_MaxHP )*0.1 , "" )
end

function Lua_jiyi_Z28_119405speak()	--�����˥[��ܼ@��
	local player = OwnerID()
	local PaPa = TargetID()
	local star = ReadRoleValue( PaPa , EM_RoleValue_Register1 )	--�����O�_�i�H�i�次�ʪ�REG�� 0��ܥi�H 1��ܪ��a�D�Ԥ� 
	LoadQuestOption( player )	
	if CheckAcceptQuest( player , 426633 ) == true and CheckFlag( player , 547381 ) == false then
		if Countbodyitem( player ,  209986 ) == 1 then
--			if star == 1 then	--REG1��==1��ܦ����a���b�D�Ԥ�
--				SetSpeakDetail( player , "Please wait" ) --���@��
--			else
				SetSpeakDetail( player , "[SC_Z28Q426633_01]" )	--(�y�z�����˥[���G�P����A���W���´���)		
				AddSpeakOption( player , player ,"[SC_Z28Q426633_02]","Lua_jiyi_Z28_119405speak2" , 0 )	--(�A��´��۩�쩬���˥[���e)
--			end
		else
			SetSpeakDetail( player , "[SC_Z28Q426633_03]" )	--(�����˥[�n�_�a�ݵۧA...)
		end			
	else
		LoadQuestOption( player )
	end	
end		

function Lua_jiyi_Z28_119405speak2()	--�����˥[�i�J�԰�
	local player = OwnerID()
	local papa = TargetID()
	local star = ReadRoleValue( papa , EM_RoleValue_Register1 ) --�O�bNPC���W��REG1�ȡA�ΨӧP�_NPC�O�_�i�H����L���a������
	local hideitem = Lua_jiyi_Z28_boxborn(papa)	--�������ê���P�ɱN���a�O�bREG10��
	local npc=ReadRoleValue( hideitem , EM_RoleValue_Register5 )
	CloseSpeak( player )	
	WriteRoleValue( hideitem , EM_RoleValue_Register5 , papa )	--�����ê���bREG5���O�����NPC 
--	if star==0 then	--NPC�}�ҥi�i�J�C��
		Delbodyitem( player , 209986 , 1 )
		Addbuff( Player , 623292 , 0 , 30 )	--�����a"�u�@�̪�����"�ޯ�BUFF
		local new_papa = DW_CreateObjEX("obj", 108118 , papa )	--�ͦ��g�ɪ������˥[
		hide(papa)
--		WriteRoleValue( papa , EM_RoleValue_Register1 , 1 )	--�NNPC���W��REG1�ȼg��1�A������L���a������
		BeginPlot( hideitem , "Lua_Z28_hideitem" , 0 )	--�����ê���}�Ҥ�����
		WriteRoleValue( papa , EM_RoleValue_Register4 , player ) --��NPC�O���b���C�������a
--	end
--	WriteRoleValue( papa , EM_RoleValue_Register1 , 1 ) --�NNPC���W��REG1�ȼg��1�A�קK��L���a�]�i�H������	
--	SetSpeakDetail( player , "what a while" )
end

function Lua_jiyi_Z28_boxborn(papa)
	local player = OwnerID()
	local hidebox = Lua_DW_CreateObj( "obj" , 123169 , papa , 1 , 1 )
	WriteRoleValue( hidebox , EM_RoleValue_Register10 , player ) --�N���a�O�b���ê���
	return hidebox --�^�����ê����
end

function Lua_Z28_hideitem()
	local hideitem = OwnerID()
	local Time = 0 
	local Player = ReadRoleValue( hideitem , EM_RoleValue_Register10 )	--�N���a�O���bREG10��
	local Dis

	while true do 	--�C����
		if CheckBuff( Player , 623292 ) == false then	--�ˬd���a�O�_��"���P�_�ޯ�"(623346)��BUFF>>���a�b���ʤ��@�w�|����BUFF
			break
		end	

		if CheckID( Player ) == false then --�ˬd���a�O�_���u
			break
		else	--���a�b�u�W
			Dis = GetDistance( Player , hideitem )	--�ˬd��U���a�M���ê��󤧶����Z��
	   		if Dis < 100 then
	   			--�i�椤
	   		elseif Dis >= 90 and Dis < 150 then 
	   			ScriptMessage( hideitem , Player , 2 , "[SC_Z28Q426633_04]" , C_SYSTEM ) 	--�t�����ĵ�i�T���G�Y�N�W�L�����˥[�������d��
	   		elseif Dis >=150 then
	   			ScriptMessage( hideitem , Player , 2 , "[SC_Z28Q426633_05]" , C_SYSTEM )	--�t�����ĵ�i�T���G�Z���ӻ��A�L�k���\�w�������˥[		
	   			break
	   		end
           	
	   		if CheckFlag( Player , 547381 ) == true then --�ˬd���a�p�G�w�g�o��"�w�������˥["���X��
	  			ScriptMessage( hideitem , Player , 2 , "[SC_Z28Q426633_10]" , C_SYSTEM ) 	--�t����ܰT���G�^�h�i�D�f�����A�����˥[�����w�g���R�U��
		   		Sleep(10) --���@����
				break
			end
			Time = Time + 1 --�ɶ��i�椤�A�C��+1
	   		if Time == 20 then	
	   	--		ScriptMessage( hideitem , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_07]" , C_SYSTEM )--��ܨt�ΰT���G�ѤU10��
	   		elseif Time == 30 then
	   			ScriptMessage( hideitem , Player , 2 , "[SC_Z28Q426633_06]" , C_SYSTEM )	--�t����ܰT���G���֮ɶ��w�g�����K
	  			break	--�ɶ���A���X�j��
			end				
		end
	Sleep(10)	--����while�j�饲����1��b�~��
	end
	CancelBuff( Player , 623292 )	--�R�����ʥΧޯ�
	local npc = ReadRoleValue( hideitem , EM_RoleValue_Register5 ) --�O���b���ê���W������NPC
	local RoomID = ReadRoleValue( hideitem , EM_RoleValue_RoomID )
	Show( npc , RoomID )
	WriteRoleValue( npc , EM_RoleValue_Register1 , 0 ) --�NREG1�g�J0�Ȧb����NPC�W
	beginplot( npc , "Lua_Z28_hideitemReset" , 0 ) --�u�n���X�j��A�N���m����
	DelObj( hideitem ) --�R�����ê���
end	

function Lua_Z28_hideitemReset()
	local PaPa = OwnerID()	--�����˥[
	local OrgID = SearchRangeNPC( PaPa , 200 )
	local New_Papa = 108118	--�o�㪺�����˥[
	local RoomID = ReadRoleValue( PaPa , EM_RoleValue_RoomID )
	for i = 0 , table.getn(OrgID) do
		if ReadRoleValue( OrgID[i] , EM_RoleValue_OrgID ) == New_Papa then
			DelObj( OrgID[i] ) --�R���o�㪺�����˥[			
		end
	end	
--	sleep(10) --���@���
--	show( PaPa , RoomID )	
end

function Lua_Z28_497457check()	--���F���ɧޯ��ˬd�ؼ�
	local player = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local papa = 108118	--�o�g�������˥[
	if TOrgID == papa then	 
		return true
	else 
		ScriptMessage( tar , player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )--�t�Χi��"�D���ĥؼ�"
		return false
	end
end

function Lua_Z28_623293use()	--���F���ɧޯ�ϥ�
	local Player = OwnerID()
	local Papa = TargetID()	--�o�g�������˥[
	local MaxHP = ReadRoleValue( Papa , EM_RoleValue_MaxHP )		--�`��q
	local NowHP = ReadRoleValue( Papa , EM_RoleValue_HP )			--��e��q
	local HPPercent = ( NowHP / MaxHP )*100					--��q�ʤ���
	if HPPercent <= 50  then
		setflag( Player , 547381 , 1 )
		ScriptMessage( player , player , 1 , "[SC_Z28Q426633_07]" , 0 )--�t�Χi��"�A���\�w�������˥[�������A�e�{�b���R�h�F..."
		Beginplot( Papa , "Lua_Z28_623293use2" , 0 )
	else
		ScriptMessage( player , player , 1 , "[SC_Z28Q426633_11]" , 0 )--�t�Χi��"[119405]���B��L�רg�ɪ����A�A�|�L�k�w���e�������K"						
	end
end

function Lua_Z28_623293use2()
	Sleep(10)	
	DelObj( OwnerID() )	--�R���o�g�������˥[
end	

function Lua_Z28_625115time()	--625115���֮ɶ���@��
	local Player = OwnerID()
	if Checkflag( Player , 547381 ) == false then
		ScriptMessage( player , player , 1 , "[SC_Z28Q426633_06]" , 0 )	--�t�Χi��"���֮ɶ��w�g�����K"
	end
end		
----------------------------------426635�N�Ӯ��I�����----------------------------------------
function Lua_jiyi_Z28_123198speak()	--�º��D���_����ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426635 ) == true and CheckFlag( player , 548438 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426635_01]","Lua_jiyi_Z28_123143speak2" , 0 )	--�����ͲM���F�A���O�K
	else
		LoadQuestOption( player )
	end
end

function Lua_jiyi_Z28_123143speak2()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z28Q426635_02]" )	--������ �M���F�ܡH�Ӧn�F�C�L���ͩR���r���Ӿ�ӸѰ��F�a�H
	SetFlag( OwnerID() , 548438 , 1 )
end
---------------------------------426636���U���k------------------------------
--426636���ȵ����º����i�Ӫ�t
function Lua_Z28_426636complete()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 625072
	local Flag = 781360
 	local Num = ReadRoleValue( NPC , EM_RoleValue_Register1 )

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
 		WriteRoleValue( NPC , EM_RoleValue_Register1 , 999 )          
 	 	AddBuff( Player , CliBuff , 0 , 10 )
 	 	CallPlot( NPC , "Lua_Z28_426636complete2" , NPC , Player , CliBuff , Flag)    ----���t��function      
 	end 
end

function Lua_Z28_426636complete2(NPC, Player, CliBuff, Flag)
	local New_NPC =  Lua_DW_CreateObj("flag" , 123199 , Flag , 4 , 1 , 1 )     --���ͺt��
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , Flag , 5 , 0 , 1)
--	NPCSAY(New_NPC, "test")
	sleep(20)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 )
end