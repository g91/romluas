
--SC_BEERDAY_SASA_01-13
--541866--�����n�s����
--546266--�������W
--546267--���q�@
--546701--���q�G
--546702--���q�T
--113961--�ƩԡD����
--781185--�X��
--205941--��s�`����
-----------------------------------------------���

--�� NPC ��--

function sasa_Beerday_npc01()
	LoadQuestOption(OwnerID())
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Ok = CheckAcceptQuest( OwnerID() , 425208 )		--���W
	if Ok == false then
		--SetSpeakDetail( OID , "[SC_BEERDAY_SASA_02]" )   	--���
		--������@����հs�ܡH
		AddSpeakOption( OID , OID , "[SC_BEERDAY_02]" , "lua_mika_beercontest_02" , 0 )
		--�ڷQ���D<CB>��s�`</CB>���Ѩ�
		AddSpeakOption( OID , OID , "[SC_BEERDAY_SASA_01]" , "sasa_Beerday_npc02" , 0 )
		--�հt����k�P����
	elseif Ok == true then
		--SetSpeakDetail( OID , "[SC_BEERDAY_SASA_02]" )   	--���
		--������@����հs�ܡH
		AddSpeakOption( OID , OID , "[SC_BEERDAY_02]" , "lua_mika_beercontest_02" , 0 )
		--�ڷQ���D<CB>��s�`</CB>���Ѩ�
		AddSpeakOption( OID , OID , "[SC_BEERDAY_SASA_01]" , "sasa_Beerday_npc02" , 0 )
		--�հt����k�P����
		AddSpeakOption( OID , OID , "[SC_BEERDAY_SASA_11]" , "sasa_Beerday_npcgive" , 0 )
		--�ȤH�i��
	end
end

function sasa_Beerday_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	SetSpeakDetail( OID , "[SC_BEERDAY_SASA_03]" )   --�հt����k�P����
	--�հt���覡��²��A�u�n�T�{�ȤH�n���s�A���n���ơA�ɧֱN�s���ȤH�N�n�C
	--�b�T�Ӷ��q���A�u�n�U�������ȤH���T���s�Y��A�ή�F�K(�C���q�ҥ����������ȤH���T���s�Y��A�ή�K)
	--��M�p�G�A�Q�D�Ԧۤv�������A���]�L���I
	
	--�Q�n�����@�y���հs�v�A�o�ǰt��O�򥻭n�F�Ѫ����ƽҵ{�C
	--�O���ڨp�ä��ֳz�S�O�I�ڥi�O�����g�U�ӧi�D�A�F�A�A�i�n�O�n�K
	--<CN>��S�[�ܩi�G��S�[ + �ܩi��</CN>
	--<CN>�ۥѥj�ڡG�i�� + ���i�s</CN>
	--<CN>�����a�İs�G�����a + �f�c��</CN>
	--<CN>�����s�G�j����s + �����</CN>
	
	--<CS>�`�N�G�i�O���ȤH�[�Գ�C</CS>
	AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Beerday_npc01" , 0 )    --back
	--�^�W�@��
end

function sasa_Beerday_npcgive()		--���U���Ȱ���@��
	CloseSpeak(OwnerID())
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--���W
	local IsBegun = ReadRoleValue( TargetID() , EM_RoleValue_register1 )
	if GetM == false then								--�p�G�S�����W
		--GiveBodyItem( TargetID() , 241639 , 1 )		--����XX
		--Setflag( TargetID() , 546266 , 1 )			--��FLAG
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	else
		if IsBegun == 0 then
			BeginPlot( TargetID() , "sasa_Bartending_Beer2012" , 0 )	--�D���H
			Sleep(10)
			WriteRoleValue( TargetID() , EM_RoleValue_register1 , 1 )
		elseif IsBegun == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_12]" , 1 )
			--���ʤw�g�}�l�o�I
		end
	end		
end

function sasa_Beerday_reward()	--��������
	local Player = TargetID()
	local WineBuff = { 505999 , 509115 , 507714 , 621878 , 507712 , 622724 , 621865 , 507713 }
					--��S�[ , �ܩi�� , �i�� , ���i�s , �����a , �f�c�� , �j����s , �����
	local point_buff = { 623372 , 623405 , 623406 }		--�T�Ӷ��q�Ȯɲ֭p��
	
	--Say( Player , "flag get" )
	Setflag( Player , 541866 , 1 )			--��������KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 113961 , "BEERDAY Girl-Bedy Lv"..Lv )
	Sleep(20)
	Lua_Festival_09_All(Player)
	--Say( Player , "WineBuff ="..table.getn(WineBuff) )
	--Say( Player , "point_buff ="..table.getn(point_buff) )
	for s = 1 , table.getn(WineBuff) do
		if CheckBuff( Player , WineBuff[s] ) == true then
			CancelBuff( Player , WineBuff[s] )
		end
	end
	for t = 1 , table.getn(point_buff) do
		if CheckBuff( Player , point_buff[t] ) == true then
			CancelBuff( Player , point_buff[t] )
		end
	end	
end

------------------------------�H�W---------���Ȱ�-----

-----���-----------�H�U----------------------------

function sasa_Bartending_Ctrl()
	Beginplot( OwnerID() , "sasa_Bartending_beer" , 0 )		--�Ͱs
	Sleep(10)
end

function sasa_Bartending_beer()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 781185
	local Obj = { 113964 , 113980 , 120336 , 120340 , 120343 , 121153 , 121166 , 121167 }
				--��S�[ , �����a , ����� , �i�� , �ܩi�� , ���i�s , �f�c�� , �j����s
	local WineScript = { "sasa_Bartending_01" , "sasa_Bartending_02" , "sasa_Bartending_03" , "sasa_Bartending_04" , 
	                     "sasa_Bartending_05" , "sasa_Bartending_06" , "sasa_Bartending_07" , "sasa_Bartending_08" }
	for i=1 , table.getn(Obj) do
		local Beer = CreateObjByFlag( Obj[i] , Flag , i , 1 )
		SetModeEx( Beer , EM_SetModeType_Gravity , false )		--�L���O
		AddToPartition( Beer , Room )
		Beginplot( Beer , WineScript[i] , 0 )
	end
end
--------------------------------�@�ΧP�_���W���s
function sasa_Bartending_WineCheck()
	local WineBuff = { 505999 , 509115 , 507714 , 621878 , 507712 , 622724 , 621865 , 507713 }
					--��S�[ , �ܩi�� , �i�� , ���i�s , �����a , �f�c�� , �j����s , �����
	--local count = BuffCount( OwnerID() )
	local WineTable = {}
	for x = 1 , table.getn(WineBuff) do
		if CheckBuff( OwnerID() , WineBuff[x] ) == true then
			WineTable[table.getn(WineTable)+1] = WineBuff[x]
		end
	end
	return WineTable
end

function sasa_Bartending_MixCheck()
	local WineTemp = {}
	WineTemp = sasa_Bartending_WineCheck()		--�N���W���sŪ�i�Ȧstable
	--Say( OwnerID() , "WineTemp ="..table.getn(WineTemp) )
	if table.getn(WineTemp) >= 2 then
		if CheckBuff( OwnerID() , 509115 ) == true and CheckBuff( OwnerID() , 505999 ) == true then
			AddBuff( OwnerID() , 623377 , 0 , 10 )	--��S�[�ܩi
		elseif CheckBuff( OwnerID() , 507714 ) == true and CheckBuff( OwnerID() , 621878 ) == true then
			AddBuff( OwnerID() , 623378 , 0 , 10 )	--�ۥѥj��
		elseif CheckBuff( OwnerID() , 507712 ) == true and CheckBuff( OwnerID() , 622724 ) == true then
			AddBuff( OwnerID() , 623379 , 0 , 10 )	--�����a�İs	
		elseif CheckBuff( OwnerID() , 621865 ) == true and CheckBuff( OwnerID() , 507713 ) == true then
			AddBuff( OwnerID() , 623381 , 0 , 10 )	--�����s	
		else	
			AddBuff( OwnerID() , 622039 , 0 , 20 )	--���s
		end	
		for j=1 , table.getn(WineTemp) do
			CancelBuff( OwnerID() , WineTemp[j] )
		end
	end	
end

-------------------------------------------------

function sasa_Bartending_01()	--��S�[=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_01_1" , 30 )	--Ĳ�I�@��
	--AddBuff( OwnerID() , 508370 , 0  -1 )		--���~�o��
end

function sasa_Bartending_01_1()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--�O�_���W
	local Tar = TargetID()	
	if GetM == true then 
		AddBuff( OwnerID() , 505999 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	end	
end

function sasa_Bartending_02()	--�����a=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_02_1" , 30 )	--Ĳ�I�@��
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--���~�o��
end

function sasa_Bartending_02_1()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--�O�_���W
	local Tar = TargetID()
	if GetM == true then
		AddBuff( OwnerID() , 507712 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	end	
end

function sasa_Bartending_03()	--�����=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_03_1" , 30 )	--Ĳ�I�@��
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--���~�o��
end

function sasa_Bartending_03_1()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--�O�_���W
	local Tar = TargetID()
	if GetM == true then
		AddBuff( OwnerID() , 507713 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	end	
end

function sasa_Bartending_04()	--�i��=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_04_1" , 30 )	--Ĳ�I�@��
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--���~�o��
end

function sasa_Bartending_04_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--�O�_���W
	if GetM == true then
		AddBuff( OwnerID() , 507714 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	end	
end

function sasa_Bartending_05()	--�ܩi��=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_05_1" , 30 )	--Ĳ�I�@��
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--���~�o��
end

function sasa_Bartending_05_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--�O�_���W
	if GetM == true then
		AddBuff( OwnerID() , 509115 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	end	
end

function sasa_Bartending_06()	--���i�s=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_06_1" , 30 )	--Ĳ�I�@��
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--���~�o��
end

function sasa_Bartending_06_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--�O�_���W
	if GetM == true then
		AddBuff( OwnerID() , 621878 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	end	
end

function sasa_Bartending_07()	--�f�c��=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_07_1" , 30 )	--Ĳ�I�@��
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--���~�o��
end

function sasa_Bartending_07_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--�O�_���W
	if GetM == true then
		AddBuff( OwnerID() , 622724 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	end	
end

function sasa_Bartending_08()	--�j����s=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_08_1" , 30 )	--Ĳ�I�@��
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--���~�o��
end

function sasa_Bartending_08_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--�O�_���W
	if GetM == true then
		AddBuff( OwnerID() , 621865 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--�A�������������ȭ�I
	end	
end

-------------------------------------------------

function sasa_Bartending_Beer2012()--TargetID = Player
	local human = { 121357 , 121358 , 121359 }
	local pp = 0
	local b = math.random(3)
	local step = 0 
	local Xtime = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	
	while true do
		if step == 0 then  --�T�{�}�l�C���F�ܡH
			NPCSay( OwnerID() , "[GUILD_TC_HITPLATYPUS_9]" )
			--ScriptMessage( TargetID() , TargetID() , 1 , "[GUILD_TC_HITPLATYPUS_9]" , 0 )
			--�ǳƦn�F�ܡH�˼ƶ}�l�I
			--sasa_Beer_TimeCheck( 5 , 5 , 0 )	--���aClient��ܭ˼�
			Sleep(10)
			NPCSay( OwnerID() , " 3 " )
			--ScriptMessage( TargetID() ,  TargetID() , 1 , " 3 " , C_SYSTEM )
			Sleep(10)
			NPCSay( OwnerID() , " 2 " )
			--ScriptMessage( TargetID() ,  TargetID() , 1 , " 2 " , C_SYSTEM )
			Sleep(10)
			NPCSay( OwnerID() , " 1 " )
			--ScriptMessage( TargetID() ,  TargetID() , 1 , " 1 " , C_SYSTEM )
			step = 1
		elseif step == 1 then	--�Ĥ@��
			NPCSay( OwnerID() , "[SC_BEERDAY_SASA_08]" )
			--ScriptMessage( TargetID() , TargetID() , 1 , "[SC_BEERDAY_SASA_08]" , 0 )
			--�Ĥ@���q
			Sleep(10)
			pp = CreateObjByFlag( human[b] , 781185 , 9 , 1 )		--�ͥX����
			SetModeEx( pp , EM_SetModeType_ShowRoleHead , true )
			AddToPartition( pp , RoomID )
			WriteRoleValue( pp , EM_RoleValue_register2 , 1 )
			BeginPlot( pp , "sasa_Beer_NPC_AInew" , 0 )			--npc���ʶ}�lAI
			while Xtime < 60 do
				--say(OwnerID(),"111")
				Xtime = sasa_Bartending_BeerBoy01(Xtime , 1)
			end
			step = 2
		elseif step == 2 then	--�ĤG��
			if  Xtime > 590 then
				--���ܬ��ʽd�򤺵L�H�Y�N����
			else
				NPCSay( OwnerID() , "[SC_THANKS_2011_16]" )
				--ScriptMessage( TargetID() , TargetID() , 1 , "[SC_THANKS_2011_16]" , 0 )
				--�ĤG���q�n���o��
				Sleep(10)
			end	
			while Xtime >= 60 and Xtime < 120 do	
				--say(OwnerID(),"222")
				Xtime = sasa_Bartending_BeerBoy01(Xtime , 2)
			end
			step = 3
		elseif step == 3 then	--�ĤT��
			if  Xtime > 590 then
				--���ܬ��ʽd�򤺵L�H�Y�N����
			else
				NPCSay( OwnerID() , "[SC_BEERDAY_SASA_13]" )
				--ScriptMessage( TargetID() , TargetID() , 1 , "[SC_BEERDAY_SASA_13]" , 0 )
				--�ĤT���q�}�l�I
				Sleep(10)
			end	
			while Xtime >= 120 and Xtime < 180 do
				--say(OwnerID(),"333")
				Xtime = sasa_Bartending_BeerBoy01(Xtime , 3)			 
			end
			step = 4
		elseif step == 4 then	--�����y
			Sleep(40)
			NPCSay( OwnerID() , "[GUILD_TC_HITPLATYPUS_16]" )
			--ScriptMessage( TargetID() , TargetID() , 1 , "[GUILD_TC_HITPLATYPUS_16]" , 0 )
			--�C�������I
			WriteRoleValue( OwnerID() , EM_RoleValue_register1 , 0 )
			--sasa_Beerday_reward()
			sleep(10)
			break	
		end
		sleep(10)
	end
end

function sasa_Bartending_BeerBoy01(Xtime , phase)	--���q
	local Flag = 781185
	local moveflag = { 10 , 11 , 12 }
	local People = { 121357 , 121358 , 121359 }
	local Counter = 0
	local NPC = {}
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X = 0
	local showtime = { 10 , 7 , 5 }   --�C���X���������j�ɶ�
	local npctemp = 0
	local AcceptQuestNumber = 0
	while 1 do
		Counter = Counter + 1
		local a = math.random(3)
		if Counter >= showtime[phase] then
			AcceptQuestNumber = sasa_Bartending_CheckRange()			--�ˬd���񦳥��Ȫ����a��
			if AcceptQuestNumber == -1 then
				Xtime = 600								--��ثe���ʫ���ɶ��]�w���W�L180���@�ӭ�
				break
			end
			--Say( OwnerID() , showtime[phase] )
			npctemp = CreateObjByFlag( People[a] , Flag , 9 , 1 )		--�ͥX����
			NPC[table.getn(NPC)+1]= npctemp
			SetModeEx( npctemp , EM_SetModeType_ShowRoleHead , true )
			AddToPartition( npctemp , RoomID )
			WriteRoleValue( npctemp , EM_RoleValue_register2 , phase )
			BeginPlot( npctemp , "sasa_Beer_NPC_AInew" , 0 )			--npc���ʶ}�lAI
			Counter = 0
		end		
		--Say( OwnerID() , "Xtime ="..Xtime )
		--Say( OwnerID() , "X ="..X )
		X = X + 1
		Xtime = Xtime + 1	
		sleep(10)
		if X >= 60 then
			break 	
		end	
	end
	return Xtime
end

function sasa_Beer_NPC_AInew()
	local npctemp = OwnerID()
	local phase = ReadRoleValue( npctemp , EM_RoleValue_register2 )
	local Flag = 781185
	local moveflag = { 10 , 11 , 12 }
	local point_buff = { 623372 , 623405 , 623406 }  --�T�Ӷ��q�Ȯɲ֭p��
	local Ok_Flag = { 546267 , 546701 , 546702 }     --�T�Ӷ��q�����X��
	local Ok_Num = { 2 , 2 , 2 }                     --�T�Ӷ��q�ؼЦ���
	local speaklist = { "[SC_BEERDAY_SASA_04]" ,
						"[SC_BEERDAY_SASA_05]" ,
						"[SC_BEERDAY_SASA_06]" ,
						"[SC_BEERDAY_SASA_07]" }
	--�ڭn��S�[�ܩi�I--���ڦۥѥj�ڡC--�����a�İs�K--�@�M�����s�I
	local speaklist02 = { "[SC_PETS_SAY_G_1]" ,
						"[SC_COOKING_03]" ,
						"[SC_422966_24]" ,
						"[SC_422993_9]" }
	--���I������I--�ӴΤF�I�o���D�u���I--��...�ܧ��F...--�n�ܡI�ݨӫݷ|�઺�E�|�i�H�Z���@�f�F�I
	local winelist = { 623393 , 623394 , 623395 , 623397 }
				--��S�[�ܩi , �ۥѥj�� , �����a�İs , �����s
    local counter = 0	
	local PRandom = math.random(3)
	--local R = math.random(5)
	local R2 = math.random(4)
	local speak_switch1 = 0 	--���ܶ}��1
	local speak_switch2 = 0 	--���ܶ}��2
	NPCSay( npctemp , speaklist[R2] )							--npc�H���r������
	DW_MoveToFlag( npctemp , Flag , moveflag[PRandom] , 0 , 1 )	--���ʨ�Ѥl�W
	--NPCSay( npctemp , speaklist[R2] )							--npc�H���r������
	--sleep(45)										--���b�a�x���ɶ�(�n�p��ĤT���q���ͧ����ɶ�)
	while counter < 2 do
		sleep(20)
		counter = counter + 1
		--Say( npctemp , "A" )
		local count = BuffCount( npctemp )
		if CheckBuff( npctemp , winelist[R2] ) == true then
			for x=0 , count do
				if BuffInfo( npctemp , x , EM_BuffInfoType_BuffID ) == winelist[R2] then
					local player = BuffInfo( npctemp , x , EM_BuffInfoType_OwnerID )
					--Say( player , "B" )
					AddBuff( player , point_buff[phase] , 0 , -1 )   --�Ȯɲ֭p���\����
					local count1 = BuffCount( player )
					for y = 0 , count1 do					--�˹�a���W�b�����q�ֿn���ƬO�_���F�ؼ�
						if BuffInfo( player , y , EM_BuffInfoType_BuffID ) == point_buff[phase] then		
							if BuffInfo( player , y , EM_BuffInfoType_Power ) >= (Ok_Num[phase] - 1) then
								Setflag( Player , Ok_Flag[phase] , 1 )		--���qOK
								break
							end	
						end
					end
					CancelBuff( npctemp , winelist[R2] )	--�M��npc���W���հsbuff
				end
			end
			--CancelBuff( npctemp , winelist[R2] )   �p�Gcancel�O�@�����M�P�s�����N�n�ĥγo��
			if speak_switch1 == 0 then
				NPCSay( npctemp , speaklist02[R2] )			--npc�H���r������
				--���ܦ��\��npc����
				speak_switch1 = 1
			end
		elseif CheckBuff( npctemp , 623398 ) == true then		--�ܨ����s
			if speak_switch2 == 0 then
				NPCSay( npctemp , "[SC_BEERDAY_SASA_09]" )
				--�d����r�K�I
				speak_switch2 = 1
			end
		end
	end
	DW_MoveToFlag( npctemp , Flag , 13 , 0 , 1 )	--���ʨ���I
	Delobj(npctemp)
end

function sasa_Beer_TimeCheck(Time,NowTime,type)		--�ɶ��˼ưO�ƾ�
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--���aClient��ܭ˼�5��
				sleep(15)
			end
		end	
	end
end

function sasa_Bartending_Check()		--�ˬdLua
	local GID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )	--�ˬd�I�k�ؼЪ�ID
	if GID == 121357 or GID == 121358 or GID == 121359 then		--�O�o�T�H�~�i�H�I��
		return true
	elseif GID ~= 121357 or GID ~= 121358 or GID ~= 121359 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_2]" , 0 )
		--�ؼп��~
		return false
	end
end

--�� ���Z�� ��--

function sasa_Bartending_CheckRange()
	local range = 140
	local AcceptQuestNumber = 0
	local Player = SearchRangePlayer( OwnerID() , range )		--�j�M�P�򪱮a
	for i = 0, table.getn(Player)-1 do
		if CheckAcceptQuest( Player[i] , 425208 ) == true then		--�O�_���W
			AcceptQuestNumber = AcceptQuestNumber + 1
		end
	end
	if AcceptQuestNumber == 0 then		--�䤣����󦳱����Ȫ��H
		 AcceptQuestNumber = -1
	end
	return AcceptQuestNumber
end

