-------------------------------------------------�H�UZ26��u�@��
----------------------------------------------------------------426305�@������
function Lua_jiyi_Z26_Mobile01()	--���ʥ۪O�W�U����
	local Slate = OwnerID()
	local Range = 30
	MoveToFlagEnabled( Slate , false )-- �������޼@�� 
	Hao_Obj_Mobile( Slate , 1 , Range , 1 ) -- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
						-- Mobile = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k
end

--/gm ? pcall Hao_Germany_4th_Slate(1	1 �O ���� 0 �O �W�U
--Hao_Obj_Mobile(ObjID,Mobile,Distance,Loop) -- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
-- Mobile = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k 
--MoveToFlagEnabled( ObjID , false )-- �������޼@�� 

function Lua_jiyi_Z26_Mobile02()	--���ʥ۪O���k����
	local Slate = OwnerID()
	local Range = 30
	MoveToFlagEnabled( Slate , false )-- �������޼@�� 
	Hao_Obj_Mobile( Slate , 2 , Range , 1 ) -- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
						-- ���ʤ覡 = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k
end

function Lua_jiyi_Z26_Mobile03()	--���ʥ۪O�H���W�U����
	local Slate = OwnerID()
	local Range = 50
	MoveToFlagEnabled( Slate , false )-- �������޼@�� 
	Hao_Obj_Mobile( Slate , 1 , Range , 1 ) -- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
						-- Mobile = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k
end

-----------------------------------------------------------------426301�@������
function Lua_jiyi_Z26_120775()	--�ѽX���ȹ�ܼ@��
	local player = OwnerID()
	local npc = TargetID()
	local Flag = { 548097 , 548098 , 548099 }	--�V�F���E��ù�ҡB�����E�p�ˡB�v�ҤҡE�d���˸߰ݰT���N�q
	CloseSpeak( player )	
	if CheckAcceptQuest( player , 426301 )== true then	--�P�_���a�����ѽX����
		if CheckFlag( Player , Flag[1] ) == false then
			PlayMotion( npc , 111 )
			SetSpeakDetail( player , "[SC_Z26Q426301_01]" )	
			SetFlag( Player , Flag[1] , 1 )
		else
			LoadQuestOption(player)		
		end
	else
		LoadQuestOption(player)
	end
end

function Lua_jiyi_Z26_120776()	--�ѽX���ȹ�ܼ@��
	local player = OwnerID()
	local npc = TargetID()
	local Flag = { 548097 , 548098 , 548099 }	--�V�F���E��ù�ҡB�����E�p�ˡB�v�ҤҡE�d���˸߰ݰT���N�q
	CloseSpeak( player )	
	if CheckAcceptQuest( player , 426301 )== true then	--�P�_���a�����ѽX����
		if CheckFlag( Player , Flag[2] ) == false then
			PlayMotion( npc , 111 )
			SetSpeakDetail( player , "[SC_Z26Q426301_02]" )
			SetFlag( Player , Flag[2] , 1 )
		else
			LoadQuestOption(player)		
		end
	else
		LoadQuestOption(player)
	end
end

function Lua_jiyi_Z26_120777()	--�ѽX���ȹ�ܼ@��
	local player = OwnerID()
	local npc = TargetID()
	local Flag = { 548097 , 548098 , 548099 }	--�V�F���E��ù�ҡB�����E�p�ˡB�v�ҤҡE�d���˸߰ݰT���N�q
	CloseSpeak( player )	
	if CheckAcceptQuest( player , 426301 )== true then	--�P�_���a�����ѽX����
		if CheckFlag( Player , Flag[3] ) == false then
			PlayMotion( npc , 111 )
			SetSpeakDetail( player , "[SC_Z26Q426301_03]" )
			SetFlag( Player , Flag[3] , 1 )
		else
			LoadQuestOption(player)		
		end
	else
		LoadQuestOption(player)
	end
end
--------------------------------------------------------------�H�U�A���骺Ĳ�I�@��(426302��u����)
function Lua_jiyi_Z26_121403_touch()
	local Corpse = OwnerID() 
	local Player = TargetID()	
	SetPlot( Corpse ,"touch" , "Lua_jiyi_Z26_121403" , 30 )
end

function Lua_jiyi_Z26_121403()
	local Player = OwnerID() 
	local Corpse = TargetID()
	local Quest = 426302	--�ҪO���ȥN��
	local Qitem = 242674
	if CountBodyItem( Player , Qitem ) <= 4 then
		if CheckAcceptQuest( player , Quest ) == true then
			GiveBodyItem( Player , Qitem , 1 )
			SetPlot( Corpse , "touch" , "" , 30 )
			BeginPlot( Corpse , "Lua_jiyi_Z26_121403_Hide" , 0 )
		else
			PlayMotion( Player , 111 )			
			ScriptMessage( player , player , 2 , "[SC_Z26Q426302_02]" , C_SYSTEM )	-- (�A�V�aģ�Ԧ����Ԥh�q§)
		end
	else
		ScriptMessage( player , player , 2 , "[SC_Z26Q426302_01]" , C_SYSTEM )	-- �A�L�k�A����h��[242674]�K
	end			
end

function Lua_jiyi_Z26_121403_Hide()
	local Corpse = OwnerID()
	hide(Corpse)
	sleep(100)	--����10����
	show( Corpse , 0 )
	SetPlot( Corpse , "touch" , "Lua_jiyi_Z26_121403" , 30 )
end
-----------------------------------------------------------------426303�@������
-------------------------------------����̤ޤO�����ϥ�Lua
function Lua_jiyi_Z26_242674check()
	local Player = OwnerID()
	local Sanction = 107725
	local Trap = {}
	local Monster = SearchRangeNPC( Player , 50 )
	local TOrgID = ReadRoleValue( Player , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID

	for i = 0 , table.getn(Monster) do
		if ReadRoleValue( Monster[i] , EM_RoleValue_OrgID ) == Sanction then
			table.insert( Trap , Monster[i] )
		end
	end

	if table.getn(Trap) > 0 then
--		Say( Player , "Trap="..table.getn(Trap))
		return true
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z26Q426303_01]" , 0 )
		return false
	end
end

function Lua_jiyi_Z26_242674Use()
	local Player = OwnerID()
	local TrapX = ReadRoleValue( Player , EM_RoleValue_X )
	local TrapY = ReadRoleValue( Player , EM_RoleValue_Y )
	local TrapZ = ReadRoleValue( Player , EM_RoleValue_Z )
	local Sanction = 107725
	local Monster = SearchRangeNPC( Player , 50 )

--	DelBodyItem( Player , 242674 , 1 )
	for i = 0 , table.getn(Monster) do
		if ReadRoleValue( Monster[i] , EM_RoleValue_OrgID ) == Sanction then
		--	Move( Monster[i] , TrapX , TrapY , TrapZ )
			SetPos( Monster[i] , TrapX , TrapY , TrapZ , 0 )
			DW_QietKillOne( 0 , 107461 )	--�R�R������107461�ǡA�e�̱�����̡A0�N�����a
			KillID( Player , Monster[i] )
		end
	end
end
--	Lua_MoveLine( Monster[i] , 100 )	--�ѦҪ���A�V�e���ʨ�Dis�Z������m(Dis��t�Ƭ��V�Ჾ��)		
--local Grass = Lua_Hao_NPC_Closest_Search( Sheep , 117052  , 50 )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���	
----------------------------------------------------------------426306��u����
function Lua_jiyi_Z26_426306Buff()	--�����ȫ�Npc�������a���ʧޯ�
	local NPC = OwnerID()
	local Player = TargetID()
	local Buff = 620170
	if CountBodyItem( Player , 242685 ) < 1 then
		AddBuff( Player , Buff , 0 , -1 )
	end
end

function Lua_jiyi_426306_Cancel()	--�ˬd�O�_�����ȡA�Y�����ȫh�R��BUFF
	local Player = OwnerID()
	if DW_CheckQuestAccept( "or" , Player , 426306 ) == false	then
		CancelBuff( Player , 620170 )
	end
end

function Lua_jiyi_Z26_620171Check()	--�����ޯ઺�ˬdLUA
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Brid = 120268	
	for i = 1 , 2 do
		if TOrgID == Brid then 
			return true
		end
	end
	ScriptMessage( own , own , 1 , "[SC_DE_4TH_NPC_121870_12]" , 0 )--�t�Χi��"�D���ĥؼ�"
	return false
end

function Lua_jiyi_Z26_620171()	--�򥻪k�N����@��
	local Player = OwnerID()	--���a
	local Brid = TargetID()	--��
	local TOrgID = ReadRoleValue( Brid , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local NewBrid = 120268	
	local QuestBuff = 620170
	local BridX = ReadRoleValue( Brid , EM_RoleValue_Register1 )
	local BridY = ReadRoleValue( Brid , EM_RoleValue_Register2 )
	local BridZ = ReadRoleValue( Brid , EM_RoleValue_Register3 )
	if TOrgID == NewBrid then 
		ScriptMessage( Player , Player , 1 , "[SC_Z26Q426306_01]" , 0 ) --�A����[623871]�F�C
		GiveBodyItem( Player , 242685 , 1 )		
		CancelBuff( Player , QuestBuff )
		ScriptMessage( Player , Player , 2 , "[SC_Z26Q426306_02]" , 0 )--�t�Χi��"���ȧ����A�ЦV[121870]�^�Х��ȡC"		
		CallPlot( Brid , "Lua_jiyi_Z26_620171Hide" , BridX , BridY , BridZ ) --���æA��{
	end
end

function Lua_jiyi_Z26_620171Hide( BridX , BridY , BridZ )
	local Brid = OwnerID()
	local RoomID = ReadRoleValue( Brid , EM_RoleValue_RoomID )	
	Hide( Brid )	
--	SetPos( Brid , BridX , BridY , BridZ , 0 )
	Sleep(100)
	local NewBrid = CreateObj( 120268 , BridX , BridY , BridZ , 0 , 1 )
	AddToPartition(NewBrid ,RoomID )
--	show( NewBrid , RoomID )
	DelObj ( Brid )
end

function Lua_jiyi_Z26_620171Move()	--�����ʼҦ�
	local Brid = OwnerID()
	local Range = 40
	local BridX = ReadRoleValue( Brid , EM_RoleValue_X )
	local BridY = ReadRoleValue( Brid , EM_RoleValue_Y )
	local BridZ = ReadRoleValue( Brid , EM_RoleValue_Z )
	SetModeEx( Brid , EM_SetModeType_ShowRoleHead , true )	--�Y����
	SetModeEx( Brid , EM_SetModeType_Gravity , false )	--�������O	
	WriteRoleValue( Brid , EM_RoleValue_Register1 , BridX )
	WriteRoleValue( Brid , EM_RoleValue_Register2 , BridY )
	WriteRoleValue( Brid , EM_RoleValue_Register3 , BridZ )
	MoveToFlagEnabled( Brid , false )	-- �������޼@�� 	
	Hao_Obj_Mobile( Brid , 3 , Range , 1 )	-- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
							-- Mobile = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k
end

----------------------------------------------------------------------------��q����Ĳ�I�@��(�ȵL�ϥ�)
function Lua_jiyi_Z26_116962touch()
	local Energy = OwnerID()
	local Player = TargetID()
	SetPlot( Energy , "touch" , "Lua_jiyi_Z26_116962" , 50 )
end

function Lua_jiyi_Z26_116962()
	local Player = OwnerID() 
	local Energy = TargetID()
	local Quest = { 426305 , 426324 , 426327 }	--�ҪO���ȥN��
	local Qflag = 548100	--������q�����I
	if CheckFlag( Player , Qflag ) == false then
		for i = 1 , 3 do
			if CheckAcceptQuest( player , Quest[i] ) == true then
				SetFlag( player , Qflag , 1 )
				SetPlot( Energy , "touch" , "" , 30 )
				BeginPlot( Energy , "Lua_jiyi_Z26_116962_Hide" , 0 )
			else			
				ScriptMessage( player , player , 2 , "[SC_Z26Q426305_01]" , C_SYSTEM )	-- �@�өP��R�����˯�q��������K
			end
		end
	else
		ScriptMessage( player , player , 2 , "[SC_Z26Q426305_02]" , C_SYSTEM )	-- �w�g�Q����������q��������C
	end			
end

function Lua_jiyi_Z26_116962_Hide()
	local Energy = OwnerID()
	hide(Energy)
	sleep(100)	--����10����
	show( Energy , 0 )
	SetPlot( Energy , "touch" , "Lua_jiyi_Z26_116962" , 50 )
end

----------------------------------------------------------------------------------------------------�H�U�AZ26�D�u����
---------------------426309���㪺�˱w-----------------------
function Lua_jiyi_Z26_426309_Giddy1()	--�۵۷w�t
	AddBuff( OwnerID() , 620172 , 0 , -1 )
end 

function Lua_jiyi_Z26_426309_Giddy2()	--���۷w�t
	AddBuff( OwnerID(), 620172 , 0 , -1 )
end 

function Lua_jiyi_Z26_426309_Giddy3()	--���۷w�t
	AddBuff( OwnerID() , 620172 , 0 , -1 )
end

function Lua_jiyi_Z26_242764check()	--�ʪ��o�ˬdLUA
	local Player = OwnerID()
--	local TOrgID = TargetID()
	local Injuries = { 120401 , 120402 , 120403 }
	local TOrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID

	if TOrgID == Injuries[1] or TOrgID == Injuries[2] or TOrgID == Injuries[3] then
		if CheckBuff( TargetID() , 620172 ) == true then		
			return true
		else
			npcsay( TargetID() , "[SC_Z26Q426309_03]")
			return false						
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z26Q426309_01]" , 0 )
		return false
	end
end

function Lua_jiyi_Z26_242764use()	--�ʪ��o�ϥ�LUA
	local Player = OwnerID()
	local Injuries = TargetID()

--	if CheckBuff( Injuries , 620172 ) == true then
		CancelBuff( Injuries , 620172 )
		npcsay( Injuries , "[SC_Z26Q426309_02]")
		DW_QietKillOne( 0 , 107536 )	--�R�R������107536�ǡA�e�̱�����̡A0�N�����a
--	else
--		npcsay( Injuries , "[SC_Z26Q426309_03]")
--	end
end

function Lua_jiyi_Z26_620127()
	BeginPlot( OwnerID(), "Lua_jiyi_Z26_620127_2" , 0 )
end

function Lua_jiyi_Z26_620127_2()
	Sleep(100)
	AddBuff( OwnerID() , 620172 , 0 , -1 )
end
----------------------------425679�֦b�d��-------------------------
--��ܡG �߰ݳQ���˪��p���Ԥh
function Lua_jiyi_Z26_120231speak()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 425679 ) == true and CheckFlag( OwnerID() , 548202 ) == false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z26Q425679_01]","Lua_jiyi_Z26_425679speak(1)" , 0 )
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z26_120232speak()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 425679 ) == true and CheckFlag( OwnerID() , 548201 ) == false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z26Q425679_03]","Lua_jiyi_Z26_425679speak(2)" , 0 )
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z26_120233speak()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 425679 ) == true and CheckFlag( OwnerID() , 548181 ) == false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z26Q425679_02]","Lua_jiyi_Z26_425679speak(3)" , 0 )
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z26_425679speak(num)
	local player = OwnerID()
	CloseSpeak( player )
	if num == 1 then
		SetSpeakDetail( player , "[SC_Z26Q425679_04]" )
		SetFlag( player , 548202 , 1 )		
--		DW_QietKillOne( 0 , 107408 )
	elseif num == 2 then
		SetSpeakDetail( player , "[SC_Z26Q425679_05]" )
		SetFlag( player , 548201 , 1 )			
--		DW_QietKillOne( 0 , 107328 )
	elseif num == 3 then
		SetSpeakDetail( player , "[SC_Z26Q425679_06]" )
		SetFlag( player , 548181 , 1 )
--		DW_QietKillOne( 0 , 107407 )		
	else
		LoadQuestOption( player )
	end
end
----------------------------426317�_ŧ�I�p���Ѱh-------------------------
-----------�h��	
function Lua_jiyi_Z26_426317_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623910
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
--	CancelBuff( player , 623909 )	--��ܱ�����NPC BUFF
 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
 		 WriteRoleValue(NPC, EM_RoleValue_Register1,999)          
 	 	AddBuff( Player,CliBuff,0, 15)
 	 	CallPlot(NPC, "Lua_jiyi_Z26_426317_Accept2" , NPC, Player, CliBuff)    ----���t��function      
 	end 
end

function Lua_jiyi_Z26_426317_Accept2(NPC, Player, CliBuff)
	local New_NPC =  DW_CreateObjEX("obj", 121482 , NPC) ----�ͦ��t��
 	local WalkFlag = 781304
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	Yell( New_NPC , "[SC_Z26Q426317_02]" ,  3 )   
--	NPCSAY(New_NPC, "[SC_Z26Q426317_02]")  
--	Hide(NPC)
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , WalkFlag, 0, 0, 1)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
	show( NPC , RoomID )
end

function Lua_jiyi_Z26_426317_Delete()
 	local Player = OwnerID()
 	if DW_CheckQuestAccept("or",Player, 426317) == false then
 		 CancelBuff(Player, 623910)
 	end
end
----------------------------426316�ʦL����-------------------------
-------------426317���i��
function Lua_jiyi_Z26_621895_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781304
 	local CliBuff = 621895	--��t�κt�����BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z26_621895_Complete2" , NPC , Player , Flag , CliBuff )    ----���t��function
    	else
		LoadQuestOption(Player)  
 	end 
end

function Lua_jiyi_Z26_621895_Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 120350 , Flag , 1 , 1 , 1 )     --���ͺt�� 
	ks_ActSetMode( Actor )
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
--	NPCSAY(Actor, "[SC_Z26Q426317_01]")
	Yell( Actor , "[SC_Z26Q426317_01]" ,  4 )      
	DW_MoveToFlag( Actor , Flag , 2 , 0 , 1 ) 
	Sleep(20)
--	AddBuff( player , 623909 , 0 , -1 ) 	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end

function Lua_jiyi_Z26_621895_Delete()
	local Player = OwnerID()
 	if DW_CheckQuestAccept("or",Player, 426317) == false then
 		 CancelBuff(Player, 621895)		
 	end
end