function halloween_121414_NPC()	--���b����NPC�����󲣥ͼ@��
	local Owner = OwnerID()	--����NPC 
	local NPC = SearchRangeNPC( Owner , 400 )
	local OrgID = 100132	--�ť���
	LuaN_miyon_action02() --��NPC�`�y�лx
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID then
			DelFromPartition( NPC[i] )
		end
	end
	Beginplot( Owner , "Lua_jiyi_halloween_check" , 0 )
end

function Lua_jiyi_halloween_check()	--2013.11.12�s�WNPC����������
	local Npc = OwnerID()
	while true do
		Lua_jiyi_halloween_search() --�ˬd��U�����a�ƶq
		sleep(10)		
		local PlayerCount = ReadRoleValue( Npc , EM_RoleValue_Register5 )
	--	say( Npc , "Npc="..Npc )		
		if PlayerCount == 0 then		
			WriteRoleValue( Npc , EM_RoleValue_PID , 0 )
			local PID = ReadRoleValue( Npc , EM_RoleValue_PID )	-- �P�_Npc�O�_���즸�ͦ��n��
--			say( Npc , "PID="..PID )
		end			
	end
end

function Lua_jiyi_halloween_search()	--2013.11.12�s�WNPC����������
	local Npc = OwnerID()
	local count = 0
	local Player = SearchRangePlayer( Npc , 400 )
	for i = 0 , table.getn(Player) do
		if Checkflag(Player[i] , 547020 ) == true then
			count = count + 1		
		end
	end
	WriteRoleValue( Npc , EM_RoleValue_Register5 , count )
	local PlayerCount = ReadRoleValue( Npc , EM_RoleValue_Register5 )
--	Say( Npc , "PlayerCount="..PlayerCount )
end

function jiyi_halloween_Hideitem( _bol )--NPC��l�@�����ͳ�������
	local own=OwnerID() --Npc
	local popkin={}
	local ghost ={}
	local Room = ReadRoleValue( own , EM_RoleValue_RoomID )
	local PID = ReadRoleValue( own , EM_RoleValue_PID )	-- �P�_Npc�O�_���즸�ͦ��n��

--	DebugMsg( 0 , Room , "--Room--  "..Room);
--	DebugMsg( 0 , Room , "--jiyi_halloween_Hideitem == ".._bol);
	local _ghostNum = 0;

	if not _bol then
		local NPC = SearchRangeNPC( own , 400 );
		for i = 0 , table.getn(NPC) do
			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == 107326 then
				_ghostNum = _ghostNum + 1;
			end
		end
		if _ghostNum == 0 then
			_bol = true;
		end
	end	
	
	if _bol then
		for j=0,5 do
			ghost[j]= CreateObjByFlag( 107326 , 781190 , j , 1) --���ͫ��F
			WriteRoleValue( ghost[j] , EM_RoleValue_Register6 , 0 ) --���F���ͪ��A
			SetModeEx( ghost[j]   , EM_SetModeType_Strikback, false )--����
			SetModeEx(ghost[j]  , EM_SetModeType_Searchenemy, false )--����
		--	SetModeEx( ghost[j] , EM_SetModeType_ShowRoleHead, true )--�Y����
		--	SetModeEx( ghost[j]    , EM_SetModeType_HideName, false )--�W��
		--	SetModeEx( ghost[j]    , EM_SetModeType_Mark, true )--�аO
		--	SetModeEx( ghost[j] , EM_SetModeType_Fight , false )--�i�������
		--	SetModeEx( ghost[j] , EM_SetModeType_Revive , true )--�i����	
			AddBuff (ghost[j] , 623499, 0, -1 )
			WriteRoleValue( ghost[j] , EM_RoleValue_PID , own )	-- �����F�O��Npc
			AddToPartition(ghost[j] , Room )
			_ghostNum = _ghostNum + 1;
			BeginPlot( ghost[j] , "jiyi_halloween_move" , 0 )	
		end
	end
	DebugMsg( 0 , Room , "--_ghostNum--  ".._ghostNum);

	if PID == 0 then	
		Lua_jiyi_Pumpkin_search() --�ˬd��U���n�ʼƶq
		sleep(10)		
		local PumpkinCount = ReadRoleValue( own , EM_RoleValue_Register7 )
	--	say( Npc , "PumpkinCount="..PumpkinCount )		
		if PumpkinCount == 0 then			
			for i=0, 4 do
				popkin[i]=CreateObjByFlag( 121171 , 781189 , i , 1) --�����Q���n��
				SetModeEx(popkin[i]    ,EM_SetModeType_Show , true ) --���
				SetModeEx( popkin[i]    , EM_SetModeType_Strikback, false )--����
				SetModeEx( popkin[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( popkin[i]    , EM_SetModeType_Obstruct, true )--����
				SetModeEx( popkin[i]    , EM_SetModeType_Mark, true )--�аO
				SetModeEx( popkin[i]   , EM_SetModeType_Move, false )--����
				SetModeEx( popkin[i]   , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( popkin[i]    , EM_SetModeType_HideName, false )--�W��
				SetModeEx( popkin[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( popkin[i] , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( popkin[i]   , EM_SetModeType_Gravity, true )--���O
				AddToPartition(popkin[i] ,Room )
			end
		end
		WriteRoleValue( own , EM_RoleValue_PID , 1 )
	end
end

function Lua_jiyi_Pumpkin_search()	--2013.11.26�s�W�ˬd���W�O�_���n��
	local Npc = OwnerID()
	local count = 0
	local Pumpkin = SearchRangeNPC( Npc , 400 )
	local OrgID = 121171
	for i = 0 , table.getn(Pumpkin) do
		if ReadRoleValue( Pumpkin[i] , EM_RoleValue_OrgID ) == OrgID then
			count = count + 1		
		end
	end
	WriteRoleValue( Npc , EM_RoleValue_Register7 , count )	--�N�n�ʦa�ƶq�O�bNPC��Register7
	local PumpkinCount = ReadRoleValue( Npc , EM_RoleValue_Register7 )
end	

function jiyi_halloween_ghost() --���F�����ޯ�
	local own=OwnerID() --���F
	local ghost=ReadRoleValue(own , EM_RoleValue_Register6)
	local X = ReadRoleValue( own , EM_RoleValue_X )
	local Y = ReadRoleValue( own , EM_RoleValue_Y )
	local Z = ReadRoleValue( own , EM_RoleValue_Z )
	while true do
	Sleep(10)			
		local player =SearchRangePlayer(own,30) --�j�Mnpc�d�򤺪����a
		for i=0,table.getn(player) do
			if CheckBuff( player[i] , 502307) == true then	-- ���a���ѻP�ɵ������T��I��ޯ�Buff�ɤ~����
				local R=Rand(10)
				if R <=2  then --��20%�����v
					CastSpell( own, player[i],  499737 )	--���F�|�����a�ܫn��
				else											
					CastSpell( own, player[i],  499673 )	--���F�������a�w�t
				end
			else
				SetStopAttack(own)  
			end					
		end
	end
end

function jiyi_halloween_ghost_Recheck() --���a�Q�ܨ����p�n�ʮɡAN�����F�L�k�A�缾�a�I���ܨ��p�n�ʡC
	local Player = TargetID()
	local Buff = 623542
	
	if CheckBuff( Player , Buff ) == true then
		return false
	else
		return true
	end
end

function jiyi_halloween_move() --�����F�H������
	local Owner = OwnerID() --���F
	WriteRoleValue( Owner , EM_RoleValue_IsWalk , 0 )	--�ζ]��
	local X = ReadRoleValue( Owner , EM_RoleValue_X )
	local Y = ReadRoleValue( Owner , EM_RoleValue_Y )
	local Z = ReadRoleValue( Owner , EM_RoleValue_Z )
	local Range = 10 + rand(10)
	local NewX , NewY , NewZ

	while true do
		Range = 20 + rand(20)
		NewX = X+Math.random( -Range , Range )
		NewZ = Z+Math.random( -Range , Range )
	 	NewY = GetHeight( NewX , Y , NewZ )	-- 
		if CheckLine( Owner , NewX , NewY , NewZ ) == true then
			MoveDirect( Owner , NewX , NewY , NewZ )
		end
		sleep(10)
	end
end
--=====================================
--			�������a�Z���ήɶ�
--=====================================
function jiyi_halloween_Hideitem2( player , own , Npc , time ) --�������a�Z���ήɶ�(���a�B��������BNpc�B�C���ɶ�)
--	DebugMsg( 0 , 0 , "2 player = "..player.." own = "..own.." time = "..time  )
--	local own=OwnerID() --���ê���
--	local time=0
	local ghost=107326
	local Key = 0
	local Reg

	while true do
		Reg = ReadRoleValue( Npc , EM_RoleValue_Register3 )
		if CheckID( player ) == false then --�p�G���a���u�A�Ѱ��j��
			WriteRoleValue( Npc , EM_RoleValue_Register3 , Reg-1 )
			break
		else
			local dis=GetDistance( player ,own  )
			if dis < 250 then
				--�i�椤
			elseif dis >= 250 and dis < 300 then 
	   			ScriptMessage( own ,player,2,"[SC_2012HALLOWEEN_DIS_SYSTEM_01]",C_SYSTEM )--ĵ�i�T�� 
			elseif dis >=300 then
			--	DebugMsg( Player , 0 , "Running" )
	   			ScriptMessage( own ,player,2,"[SC_2012HALLOWEEN_DIS_SYSTEM_02]",C_SYSTEM )--ĵ�i�T�� 	
				CancelBuff(  player, 502307)--�R�������H�B�T���M��BUFF	
				CancelBuff(  player, 623481)--�R�������ޯ�
				CancelBuff(  player, 623483)--�R���w�tBUFF
				CancelBuff( player, 623449 )--�R���w���A�G
--				SetFlag(player , 547020 , 0 )--��������w�ѥ[���ʺX��
--				SetFlag(player , 547129 ,1 ) --�}�ҥi����X��						
	   			ScriptMessage( own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_01]",C_SYSTEM)--�^��
	   			WriteRoleValue( Npc , EM_RoleValue_Register3 , Reg-1 )
	   			break		
	   		end
		end			
		if CheckFlag( player, 547019 ) == true then --�ˬd�O�_����L���y
			WriteRoleValue( Npc , EM_RoleValue_Register3 , Reg-1 )
			break
		end
		if  Time == 60 then
   			ScriptMessage(own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_02]",C_SYSTEM )--�ѤU�@����	
		elseif Time ==30 then	
			ScriptMessage(own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_03]",C_SYSTEM )--�ѤU30��
		elseif Time == -1 then
		--	if CheckBuff( Npc , 623546 ) == false then --�S�����ʶi�椤BUFF
		--		Key = 1
		--	end
   			ScriptMessage(own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_04]",C_SYSTEM )--�ɶ���
   			Sleep(10)
   			ScriptMessage( own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_01]",C_SYSTEM)--�^��
			CancelBuff(  player, 502307)	--�ɶ���R���ޯ���w	
			CancelBuff(  player, 623481)	--�ɶ���R���ޯ�
			CancelBuff(  player, 623483)	--�ɶ���R���w�tBUFF
			CancelBuff( player, 623449 )	--�R���w���A�G
--			SetFlag(player , 547020 , 0 )  --��������w�ѥ[���ʺX��
--			SetFlag(player , 547129 ,1 ) --�}�ҥi����X��
			WriteRoleValue( Npc , EM_RoleValue_Register3 , Reg-1 )
			break
--			WriteRoleValue(npc,EM_RoleValue_Register1,0)		
   		end
		sleep(10)
		time= time - 1
	end
	SetFlag(player , 547129 ,1 ) --�}�ҥi����X��
	if Reg-1 == 0 then
	--	DebugMsg( Player , 0 , "Del" )	   
		BeginPlot( Npc , "jiyi_halloween_reset" , 0 )	-- 2012.10.17 �� Npc ����R�����W�Ҧ�������(���F�P�Q���n��)
  	end
  	DelObj(own) --�R�����ê���
--	SetFlag(player , 547020 , 0 )  --��������w�ѥ[���ʺX��
--	jiyi_halloween_reset()
end

function jiyi_halloween_reset() --���m����
	local own=OwnerID() -- Npc
--	Lua_jiyi_Del_na() --�R���n�ʡB���F
	Lua_jiyi_Del_na(1)	-- �R���n��
--	jiyi_halloween_popkin() --���ͫn��
end

function jiyi_halloween_popkin()
	local own=OwnerID() --���ê���
	local popkin={}
	say( own ,"popkin born")
	for i=0, 4 do
		popkin[i]=CreateObjByFlag( 121171 , 781189 , i , 1) --�����Q���n��
		WriteRoleValue( popkin[i] , EM_RoleValue_Register2 , 0 )
		AddToPartition(popkin[i] , 0 )
	end
end
--=====================================
--			NPC��ܼ@��
--=====================================
function jiyi_halloween_NPC() --��ܼ@��
	local own=OwnerID() --���a
	local tar=TargetID() --NPC
	local Key = {547020 , 547019 , 547129 }	-- ���W���ʡB���w������y�B��������

	if CheckFlag( own , Key[2] ) == true then --�p�G���a�w�g��L���y
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_04]" )  --���§A���ڰ��F
	elseif  CheckFlag( own , Key[1] ) ==true then --���a���ѥ[���ʺX��
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_05]" )  --���F�F��?
		AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_06]", "jiyi_halloween_over2", 0 )  --����
	else 
		if CheckFlag( own , Key[1] ) == false and CheckFlag( own , Key[2] ) == false then	-- ���W
--			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_05]" )  --���F�F��?
--		else
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_01]" )  --�A�@�N���ڰ��F��?
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_01]", "jiyi_halloween_game", 0 )  --�@�N
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_02]", "jiyi_halloween_NPC2", 0 )  --���@�N
		end
	end	
end

function jiyi_halloween_NPC2()
	local own=ownerID()
	SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_08]" ) --�u���ڥu�n���L�H�����F�v
end

function jiyi_halloween_NPC3()
	local own=ownerID()
	SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_03]" ) --�u�ǳƦn�A�ӧ�ڡv
end

function jiyi_halloween_game() --�����W�h
	local own=OwnerID()
	local tar=TargetID()
	SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_02]" )  --�����W�h	
	AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_03]", "jiyi_halloween_game1", 0 )  --����
	AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_04]", "jiyi_halloween_NPC3", 0 )  --������
end

function jiyi_halloween_over2() --�����y
	local own=OwnerID() --���a
	local tar =TargetID() --NPC
	local BuffID = 623480
	local BuffLv =  FN_CountBuffLevel(own,623480) --�ˬd���a���WBUFF

	if BuffLv <1 then
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_09]" )
		CancelBuff( own, 623480 )
		GiveBodyItem( own , 724509 , 1)
	elseif BuffLv >=1 and BuffLv <=14 then
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_09]" )
		CancelBuff( own, 623480 )
		GiveBodyItem( own , 209433 , 1)
	elseif BuffLv >14 and BuffLv <=19 then
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_10]" )
		CancelBuff( own, 623480 )
		GiveBodyItem( own , 209433 , 2)
	elseif BuffLv >19 then
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_11]" )
		CancelBuff( own, 623480 )
		GiveBodyItem( own , 209433 , 3)
	end
	CloseSpeak( own)
	SetFlag(own , 547019 , 1 ) -- �w�g����L���y
	SetFlag(own , 547020 , 0 )--��������w�ѥ[���ʺX��	
	Lua_Festival_10_All(own)--���Լ�
end

function jiyi_halloween_game1() --�i�J�C��
	local own=OwnerID() --���a
	local tar=TargetID() --NPC
	local Room = ReadRoleValue( tar , EM_RoleValue_RoomID )	-- Ū��Npc�Ҧb�����y
--	local star = ReadRoleValue(Tar, EM_RoleValue_Register1 )
	local Lv = ReadRoleValue( own , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( own , EM_RoleValue_LV_SUB )
	local timer = 120	-- ���ʮɶ�
	local Key = ReadRoleValue( tar, EM_RoleValue_Register1 )
	local Buff = 623546
	local Status = CheckBuff( tar , Buff )
	local Reg = ReadRoleValue( tar , EM_RoleValue_Register3 )
	local Zone = ReadRoleValue( own , EM_RoleValue_ZoneID )
--	local PID = ReadRoleValue( tar , EM_RoleValue_PID )
	CloseSpeak(own)
--	if star==0 then
--	if Status == false then	-- 2012.10.17 �p�G NPC ���W�S�����ʶi�椤��Buff�A�N����ͦ����F�P�Q���n��
	DebugMsg( 0 , 0 , "--Reg="..Reg )
	if Reg <= 0 then
	--	DebugMsg( own , 0 , "Buff False" )
	--	BeginPlot( tar , "jiyi_halloween_Hideitem" , 0 )	--��Npc���ͫ��F�P�n��
		CallPlot( tar , "jiyi_halloween_Hideitem" , true )
	else
		DebugMsg( 0 , 0 , "--check--" );
		CallPlot( tar , "jiyi_halloween_Hideitem" , false )
	end
		WriteRoleValue( tar , EM_RoleValue_Register3 , Reg+1 )
		DW_CancelTypeBuff(68, own)
		DesignLog( own , 121414 , "Lv = "..Lv.." SubLv = "..SubLv )  --�^�Ǭ��ʰѻP��
		AddBuff( tar , 623546 , 0 , timer ) --����NPC���ʶi�椤BUFF120��
	--	WriteRoleValue( tar , EM_RoleValue_PID , Timer )	-- �����a���W�ɡA�h�� 1 �ATimer���L��L���a���W�A�h�^�g�� 0 �A�k 0 �ɡA�R���n�ʻP���F
		SetFlag(own , 547020 , 1 )  --���}����w�ѥ[���ʺX��
		local hideitem = CreateObjByFlag( 121429 ,781191 , 0 , 1) --���ê���
		SetModeEx( hideitem ,EM_SetModeType_Show ,false ) --�������
		SetModeEx( hideitem , EM_SetModeType_Mark, false )--�аO
		AddToPartition( hideitem , Room )	-- ���ͦb���������y
	--	BeginPlot(hideitem, "jiyi_halloween_Hideitem2", 0)	--�i�J�p�ɾ�
		CallPlot( hideitem , "jiyi_halloween_Hideitem2", own , hideitem , tar , timer )	-- ����������b function jiyi_halloween_Hideitem2 �O�o���a�Φۤv�B�٦�����NPC�B�C���ɶ�
		WriteRoleValue(tar, EM_RoleValue_Register4, own)
		if Zone == 2 then
			SetPos( own, 216.8, 73.4, -244.0, 0 )--�ǰe���a
		end
		AddBuff ( own, 502307, 0, timer )--�����a�ȮɵL�Ī�BUFF		
--	end
end

function jiyi_halloween_born4() --���F���ͼ@��

	local own=OwnerID() -- Npc
	local R= Rand(6)
	local Buff = 623499
	local soul= CreateObjByFlag( 107326 , 781190 , R , 1)--�üƲ��ͫ��F
	WriteRoleValue(soul , EM_RoleValue_Register6 , 0 ) --���F���ͪ��A
	SetModeEx( soul  , EM_SetModeType_Strikback, false )--����
	SetModeEx( soul , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( soul , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( soul , EM_SetModeType_Mark, true )--�аO
	SetModeEx( soul , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( soul , EM_SetModeType_Revive , true )--�i����	
	AddBuff (soul , Buff , 0, -1 )
	WriteRoleValue( soul , EM_RoleValue_PID , own )-- �����F�O��Npc
	AddToPartition( soul , 0 )
	BeginPlot( soul , "jiyi_halloween_move" , 0 )						
end
--=====================================
--			���a�ޯ�
--=====================================

function jiyi_halloween_king1() --�I���n�ʲ��ͼ@�� ���b����NPC�W
	local own=OwnerID() -- �Q���n��
	local tar=TargetID() --���a
	SetPlot( own ,"touch","jiyi_halloween_king",30 )
end

function jiyi_halloween_king() --�I���Q���n����o�b�� 
	local own=OwnerID()--���a
	local tar=TargetID() --�n��
	local Key = 547129 -- ���ȧ���(��������y)
--	local popkin = ReadRoleValue( tar , EM_RoleValue_Register9) --�n�ʶ}���� 0���}��1������

	if CheckBuff( own , 502307) == true then	-- ���a�ѻP�ɡA�������T��I��ޯ�Buff
	--	DebugMsg( own , 0 , "Buff ok" )
		if CheckBuff( own ,623449 ) == true then --���a�Q�ܨ����p�n�ʪ��ɭ�
			ScriptMessage( own ,own,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_07]",C_SYSTEM )	-- �A�Q�A�G�F...
			SetPlot( tar ,"touch","jiyi_halloween_king",30 )	-- ���m�n�ʪ�Ĳ�I�@��
		else
			if CheckFlag( own , Key ) == false then --�ˬd���a���W�O�_����������y���X�СA�p�G�S��...
				if CheckBuff(own,623481)==false then --�ˬd���a���W�O�_�w�g���b��BUFF�A�p�G�S���~���b�Ƨޯ�
		--			if popkin==0 then --�n�ʭȬ��}�Ҫ��A
					AddBuff ( own, 623481, 0, 15 ) --�b��
			--		WriteRoleValue(tar,EM_RoleValue_Register9 ,1) --�N�n�ʭ�����
					SetPlot( tar , "touch" , "" , 30 )
					BeginPlot(tar, "jiyi_halloween_kinghide", 0)
				else
					ScriptMessage( own ,own,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_08]",C_SYSTEM )	-- �L�k���ƨ��o�b�Ư�O	
				end
			else
				ScriptMessage( own ,own,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_06]",C_SYSTEM )	-- �o�u�O�@�Ӥj�n��
			end
		end
	--	SetPlot( tar , "touch" , "" , 30 )
	else
		ScriptMessage( own ,own,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_06]",C_SYSTEM )
	end
end

function jiyi_halloween_kinghide() --�Q���n�ʮ���
	local Owner = OwnerID() --�n��
	Hide( Owner)
	sleep(100) --����10����
	Show( Owner , 0 )
	WriteRoleValue(Owner,EM_RoleValue_Register9 ,0) --�}�ҫn�ʥi�I����
	SetPlot( Owner ,"touch","jiyi_halloween_king",30 )
end

function jiyi_halloween_popkin2() --�βb�Ƨ������F�@��
	local own=OwnerID() --���a
	local tar=TargetID() --���F
	local Npc = ReadRoleValue( tar , EM_RoleValue_PID )	-- 121414
	local scre=107326
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID)
	local player=ReadRoleValue(tar, EM_RoleValue_IsPlayer)

	if TOrgID == scre then
		DelObj( tar)
		BeginPlot( Npc , "jiyi_halloween_born4" , 0 )	-- ���s�ͦ�1�����F
		AddBuff( own, 623480, 0, -1 ) --��o1��
	elseif CheckBuff(tar,623449)==true and tar~=own then --��ؼЬO��L�Q�w�������a
		CancelBuff( tar , 623449) --�Ѱ��w�����A
		AddBuff( own, 623480, 2, -1 )	--��o3��
	end
end

function jiyi_halloween_popkin1() --�ˬd���F
	local own=OwnerID() --���a
	local tar=TargetID() --���F�Ψ�L���a
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID)
	local player=ReadRoleValue(tar, EM_RoleValue_IsPlayer)
	local scre=107326
	local ghost=ReadRoleValue(tar , EM_RoleValue_Register6)

	if CheckBuff(own,623449)==true then --���a�ۤv�Q�w�����ɭ�
		return false --�b�Ƨޯ�L��
	else				
		if TOrgID == scre then	--��ؼЬO���F���ɭ�
			WriteRoleValue(tar , EM_RoleValue_Register6, 1)
			return true
		elseif CheckBuff(tar,623449)==true then --��ؼЬO��L�Q�w�������a		
			return true
		else
			ScriptMessage( own ,own, 1 ,"[SC_2012HALLOWEEN_GAME_SYSTEM_05]", 0 )--�t�Χi��"�D���ĥؼ�"
			return false
		end	  
	end
end
		
function Lua_jiyi_Del_na(Choise)  --�R���n�ʻP���F�P���ê���
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local Npc

	if Choise == 1 then
		NPC = { 107326 , 121429 }	-- ���R���n�� 121171,
	else
		NPC = { 121171 , 107326 , 121429 }	-- �R���n��121171,
	end
	local ID , Name

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						DelObj( ID)
					end
				end
			end
		end
	end
end

function jiyi_halloween_623480() --���a�p��BUFF"�Q�b�ƪ����F"������Ĳ�o�������a�i������X��
	local own=OwnerID() --���a
--	DebugMsg( own , 0 , "Steal" )
	SetFlag(own , 547129 ,1 ) --�}�Ҫ��a�i����X��
end
--======================================================================================
--		���ի��O
--======================================================================================
function jiyi_halloween_over3() --�R���Ҧ����n���~
	local own=OwnerID()

	CancelBuff(  own, 502307)--�R���ޯ���w	
	CancelBuff(  own, 623481)--�R�������ޯ�
	CancelBuff(  own, 623483)--�R���w�tBUFF
	CancelBuff( own, 623480 )--�R���u�Q�b�ƪ����F�v
	CancelBuff( own, 623449 )--�R���w���A�G
	setflag(own,547019,0) --�����w����L���y�X��
	setflag(own,547020,0) --�����ѥ[���ʺX��
	setflag(own,547129,0) --�����i����X��
end

function jiyi_halloween_over4() --���ջ��
	local own=OwnerID()

	CancelBuff(  own, 502307)--�R���ޯ���w	
	CancelBuff(  own, 623481)--�R�������ޯ�
	CancelBuff(  own, 623483)--�R���w�tBUFF
	CancelBuff( own, 623449 )--�R���w���A�G
	setflag(own,547129,1) --�}�ҥi����X��
end