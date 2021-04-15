--z33�G�m=======================================
--=======================================
--===============�a��
function LuaPG_Z33_Group()
--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	
	local NPC = OwnerID()
	local dis = 30
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 100  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local LeaderPID = ReadRoleValue(NPC, EM_RoleValue_PID)
--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local MonPID = ReadRoleValue(NPC, EM_RoleValue_PID)
	
--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}

	if  MonPID==0	then		--�u�\�x��
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109040,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109039,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109039,Matrix,3,-1 )

	elseif  MonPID==1	then	--�R���a�x��
		dis = 40
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109035,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109175,Matrix,3,1 )

	elseif  MonPID==2	then	--�R���P��
		dis = 25
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109035,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109178,Matrix,3,1 )

	elseif  MonPID==3	then	--�@�ûP��
		dis = 30
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109058,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109182,Matrix,3,1 )

	elseif  MonPID==4	then	--�Z�L�P�����~
		dis = 35
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108707,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109179,Matrix,3,1 )

	elseif  MonPID==5	then	--���x�P�����~
		dis = 35
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109045,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109179,Matrix,3,1 )

	elseif  MonPID==6	then	--�Ĥ@�Ϥ`�F�h�f�ͤ�p��
		dis = 20
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(124054,Matrix,2,0 )
		SetModeEX ( ObjMatrix[1] , EM_SetModeType_Mark , false );
		SetModeEX ( ObjMatrix[1] , EM_SetModeType_ShowRoleHead , false );
		WriteRoleValue(NPC, EM_RoleValue_Register1, ObjMatrix[1])
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(124054,Matrix,2,1 )
		SetModeEX ( ObjMatrix[2] , EM_SetModeType_Mark , false );
		SetModeEX ( ObjMatrix[2] , EM_SetModeType_ShowRoleHead , false );
		WriteRoleValue(NPC, EM_RoleValue_Register2, ObjMatrix[2])

	elseif  MonPID==7	then	--�G�H�p�Ī����x
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(124052,Matrix,2,0 )
		SetModeEX ( ObjMatrix[1] , EM_SetModeType_Mark , false );
		SetModeEX ( ObjMatrix[1] , EM_SetModeType_ShowRoleHead , false );
		SetModeEx( ObjMatrix[1], EM_SetModeType_HideName, true )

	elseif  MonPID==8	then	--�ǭ^�x�n�몺�x�H.3�H��
		dis = 20
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(124086,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(124081,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(124087,Matrix,3,-1 )
	end

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( NPC, "LuaPG_Z33_Group_02" , 0 );
end

function LuaPG_Z33_Group_02()
	BeginPlot( OwnerID() , "LuaPG_Z33_Group" , 2 );
end

function LuaPG_Z33_Group_03()
	local NPC = OwnerID()
	local P1 = ReadRoleValue(NPC, EM_RoleValue_Register1)
	local P2 = ReadRoleValue(NPC, EM_RoleValue_Register2)

	for i=1,3 do
		AdjustFaceDir( P1,P2,0)
		PlayMotion(P1, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		AdjustFaceDir( P2,P1,0)
		PlayMotion(P2, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Sleep(20)
	end
end

-----------------------------------------------------�����@�íx����
function LuaPG_Z33_Talk1()
	local Player = OwnerID()
	SetPlot(Player,"touch","LuaPG_Z33_Talk1_1",30)
	SetCursorType( Player, eCursor_Speak) 
end
function LuaPG_Z33_Talk1_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local num = Rand(5)+1
	--AdjustFaceDir( NPC,Player,0)
	NpcSay(NPC,"[SC_Z33_TALK1_"..num.."]")
end


-----------------------------------------------------�G�H��ϻ���
function LuaPG_Z33_Talk2()
	local Player = OwnerID()
	SetPlot(Player,"touch","LuaPG_Z33_Talk2_1",30)
	SetCursorType( Player, eCursor_Speak) 
end
function LuaPG_Z33_Talk2_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local num = Rand(5)+1
	--AdjustFaceDir( NPC,Player,0)
	NpcSay(NPC,"[SC_Z33_TALK2_"..num.."]")
end

function LuaPG_Z33_Talk2_2()
	local Player = OwnerID()
	SetPlot(Player,"touch","LuaPG_Z33_Talk2_2_1",30)
	SetCursorType( Player, eCursor_Speak) 
end
function LuaPG_Z33_Talk2_2_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local num
	local NPCPID = ReadRoleValue(NPC, EM_RoleValue_PID)
	if NPCPID==0		then
		num = Rand(5)+1
		NpcSay(NPC,"[SC_Z33_TALK2_2_"..num.."]")
	elseif NPCPID==1	then
		NpcSay(NPC,"[SC_Z33_TALK2_2_6]")
	elseif NPCPID==2	then
		num = Rand(3)+1
		NpcSay(NPC,"[SC_Z33_TALK2_2_"..(num+10).."]")		
	end
end

function LuaPG_Z33_Talk2_2_2()
	local NPC = OwnerID()
	local NPCPID = ReadRoleValue(NPC, EM_RoleValue_PID)
	if NPCPID==2		then
		NpcSay(NPC,"[SC_Z33_TALK2_2_7]")
	elseif NPCPID==3	then
		NpcSay(NPC,"[SC_Z33_TALK2_2_8]")
	elseif NPCPID==4	then
		NpcSay(NPC,"[SC_Z33_TALK2_2_9]")
	elseif NPCPID==5	then
		NpcSay(NPC,"[SC_Z33_TALK2_2_10]")
	end
end

-----------------------------------------------------�]�L�ϻ���
function LuaPG_Z33_Talk3()
	local Player = OwnerID()
	SetPlot(Player,"touch","LuaPG_Z33_Talk3_1",30)
	SetCursorType( Player, eCursor_Speak) 
end
function LuaPG_Z33_Talk3_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local num = Rand(5)+1
	local NPCPID = ReadRoleValue(NPC, EM_RoleValue_PID)
	if NPCPID==0		then
		NpcSay(NPC,"[SC_Z33_TALK3_"..num.."]")
	elseif NPCPID==2	then
		NpcSay(NPC,"[SC_Z33_TALK3_"..(num+5).."]")
	elseif NPCPID==3	then
		NpcSay(NPC,"[SC_Z33_TALK3_"..(num+10).."]")
	end
end

function LuaPG_Z33_Talk3_1_1()
	local NPC = OwnerID()
	NpcSay(NPC,"[SC_Z33_TALK3_16]")
end

-----------------------------------------------------�˹�����
function LuaPG_Z33_Talk1_2_1()
	local NPC = OwnerID()
	NpcSay(NPC,"[SC_Z33_TALK1_2_1]")
end

function LuaPG_Z33_Talk1_3_1()
	local Player = OwnerID()
	SetPlot(Player,"touch","LuaPG_Z33_Talk1_3_2",30)
	SetCursorType( Player, eCursor_Speak) 
end
function LuaPG_Z33_Talk1_3_2()
	local Player = OwnerID()
	local NPC = TargetID()
	local num = Rand(3)+1
	--AdjustFaceDir( NPC,Player,0)
	NpcSay(NPC,"[SC_Z33_TALK1_3_"..num.."]")
end

function LuaPG_Z33_Z1_01()	--�_�Ǫ��R��
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE)
end

function LuaPG_Z33_Z1_02()
	local NPC = OwnerID()
	NpcSay(NPC,"[SC_Z33_TALK1_2_2]")
end


-----------------------------------------------------�B�~���y����
function LuaPG_Z33_Npc123974()	--��̤������B�~
	local Player = OwnerID()
	local Npc = TargetID()
	local BonusItemID = 243219
	local BonusLock = 544318
	local OptionStr = "[SC_Q123974_1]"
	if ( CountBodyItem( Player, BonusItemID ) >= 10 and CheckFlag( Player, BonusLock ) == false ) then
		AddSpeakOption( Player, Npc, OptionStr, "LuaPG_Z33_Npc123974_1", 0 )
	end
	LoadquestOption( Player )
end
function LuaPG_Z33_Npc123974_1()
	local Player = OwnerID()
	local Npc = TargetID()
	local NpcOrgID = ReadRoleValue( Npc, EM_RoleValue_OrgID )
	local BonusItemID = {243219,204821}
	local BonusLock = {544318, 544319,544320}
	local BonusMoney = 332542
	local BonusExp = 14367230
	local BonusTp = 1436722
	local SpeakStr = "[SC_Q427290_6]"--�P�§A�I
	local MsgStr1 = "[SC_Q427290_7]"--�A��o�F
	local MsgStr2 = "[SC_Q427290_8]"--�g���
	local MsgStr3 = "[SC_Q427290_9]"--�ޯ��I��
	local MsgStr4 = "[SC_Q427290_10]"--��o�F�B�~�����ȼ��y�I
	if NpcOrgID==123974		then
		if ( CountBodyItem( Player, BonusItemID[1] ) >= 10 and CheckFlag( Player, BonusLock[1] ) == false ) then
			ScriptMessage( Npc, Player, 1, MsgStr4, C_LightGreen )
			ScriptMessage( Npc, Player, 0, MsgStr4, C_LightGreen )
			AddRoleValue ( Player, EM_RoleValue_Money, BonusMoney )
			AddRoleValue ( Player, EM_RoleValue_EXP, BonusExp )
			AddRoleValue ( Player, EM_RoleValue_TpExp, BonusTp )
			ScriptMessage( Npc, Player, 0, MsgStr1..BonusExp..MsgStr2, 0 )
			ScriptMessage( Npc, Player, 0, MsgStr1..BonusTp..MsgStr3, 0 )
			DelBodyItem( Player, BonusItemID[1], 10 )
			SetFlag( Player, BonusLock[1], 1 )
		else
			CloseSpeak( Player )
		end

	elseif NpcOrgID==123965	then
		local Successflag = 544063
		--local Girl = SearchRangeNPC ( Npc , 200 )  --search�g��200�����Ҧ�npc
		if CheckFlag( Player, Successflag) == true and CheckFlag( Player, BonusLock[2] ) == false then
			ScriptMessage( Npc, Player, 1, MsgStr4, C_LightGreen )
			ScriptMessage( Npc, Player, 0, MsgStr4, C_LightGreen )
			AddRoleValue ( Player, EM_RoleValue_Money, BonusMoney )
			AddRoleValue ( Player, EM_RoleValue_EXP, BonusExp )
			AddRoleValue ( Player, EM_RoleValue_TpExp, BonusTp )
			ScriptMessage( Npc, Player, 0, MsgStr1..BonusExp..MsgStr2, 0 )
			ScriptMessage( Npc, Player, 0, MsgStr1..BonusTp..MsgStr3, 0 )
			SetFlag( Player, BonusLock[2], 1 )
			WriteRoleValue( Player, EM_RoleValue_Register5, 0 )
		else
			CloseSpeak( Player )
		end		
	
	elseif NpcOrgID==123957	then
		if CheckFlag( Player, BonusLock[3] ) == false then
			ScriptMessage( Npc, Player, 1, MsgStr4, C_LightGreen )
			ScriptMessage( Npc, Player, 0, MsgStr4, C_LightGreen )
			AddRoleValue ( Player, EM_RoleValue_Money, BonusMoney )
			AddRoleValue ( Player, EM_RoleValue_EXP, BonusExp )
			AddRoleValue ( Player, EM_RoleValue_TpExp, BonusTp )
			ScriptMessage( Npc, Player, 0, MsgStr1..BonusExp..MsgStr2, 0 )
			ScriptMessage( Npc, Player, 0, MsgStr1..BonusTp..MsgStr3, 0 )
			DelBodyItem( Player, BonusItemID[2], 1)
			SetFlag( Player, BonusLock[3], 1 )
		else
			CloseSpeak( Player )
		end	
	else
		CloseSpeak(Player)
	end
	SetSpeakDetail( Player, SpeakStr )
end


-----------------------------------------------------�B�~���y����
function LuaPG_Z33_Npc123966_1()	--�a�^�g�����k�l
	local Player = OwnerID()
	local NPC = TargetID()
	local BonusLock = 544319
	if CheckFlag( Player, BonusLock ) == false	then
		AddSpeakOption( Player, NPC, "[SC_Q123966_1]", "LuaPG_Z33_Npc123966_2", 0 )
	end
	LoadquestOption( Player )
end

function LuaPG_Z33_Npc123966_2()
	local Player = OwnerID()
	local NPC = TargetID()
	local Follower
	local Follower_ID = 124097
	if CheckCompleteQuest( Player, 427292) == true	then
		CloseSpeak( Player )
		Follower = CreateZ33NPCforShow( NPC, Follower_ID )
		WriteRoleValue( Follower, EM_RoleValue_Register5, Player )
		WriteRoleValue( Player, EM_RoleValue_Register5, Follower )
		CallPlot( Follower, "Z33_Q123966Event", NPC, Player, Follower)
	else 
		SetSpeakDetail( Player, "[SC_Q123966_2]" )
	end
end

function Z33_Q123966Event( NPC, Player, Follower)
	local SaveDis = 200
	local ActBuff = 626273
	local Successflag = 544063
	local BonusLock = 544319
	local BuffLv = nil
 	local StopMove = 623132
	local MessageStr = {}
	MessageStr[ 1 ] = "[SC_Q427251_8]"
	MessageStr[ 2 ] = "[SC_Q427251_9]"
	SetModeEX ( NPC, EM_SetModeType_Show , false );
	--SetFlag( Player, Successflag, 1 )
	while 1 do
		if ( Player == nil or CheckID( Player ) == false )	then
			break
		elseif CheckDistance( Follower, Player, SaveDis ) == false then
			ScriptMessage( Follower, Player, 1, MessageStr[ 1 ], 0 )
			ScriptMessage( Follower, Player, 0, MessageStr[ 1 ], 0 )	
			break
		elseif CheckBuff( Player, ActBuff ) == true	then
			BuffLv = KS_CheckBuffLV( Player, ActBuff )
			if BuffLv >= 30 then
				ScriptMessage( Follower, Player, 1, MessageStr[ 2 ], 0 )
				ScriptMessage( Follower, Player, 0, MessageStr[ 2 ], 0 )
				break
			end
		elseif CheckFlag(Player, BonusLock)==true	then
			break
		end
		AddBuff( Player, ActBuff, 0, -1 )
		RandStr = DW_Rand( 20 )
		Sleep( 10 )
		SetFollow( Follower, Player )
		Sleep( 10 )
	end
	SetFollow( Follower, 0 )
	Sleep( 10 )
	AddBuff( Follower, StopMove, 0, -1 )
	PlayMotion( Follower, ruFUSION_ACTORSTATE_EMOTE_TIRED )
	Sleep( 30 )
	--SetFlag( Player, Successflag, 0 )
	DelObj( Follower )
	SetModeEX ( NPC, EM_SetModeType_Show , true );
	WriteRoleValue( Player, EM_RoleValue_Register5, 0 )
	return
end

function LuaPG_Z33_Npc123965()	--�a�^���R�i��
	local Player = OwnerID()
	local Npc = TargetID()
	local BonusLock = 544319
	local Successflag = 544063
	local Follower = ReadRoleValue( Player, EM_RoleValue_Register5)
	local FollowerOrgID = ReadRoleValue( Follower, EM_RoleValue_OrgID )
	local ActBuff = 626273
	local OptionStr ="[SC_Q123966_3]"
	if CheckFlag( Player, BonusLock ) == false and
	FollowerOrgID==124097		then
		AddSpeakOption( Player, Npc, OptionStr, "LuaPG_Z33_Npc123974_1", 0 )
	end
	LoadquestOption( Player )
end



-----------------------------------------------------�������c�lĲ�I�@��
--function LuaPG_Z33_123978_Touch()
--	local Box = OwnerID()
--	SetCursorType( Box , 23)							----�����I�����ϥ�
--	SetPlot( Box, "touch", "LuaPG_Z33_123978_Touch_02", 10 )
--end

--function LuaPG_Z33_123978_Touch_02()
--	local Player = OwnerID()
--	local Box = TargetID()
--	local BonusLock = 544320
--	local Num01=ReadRoleValue(Fire,EM_RoleValue_Register1)
--
--	DW_CancelTypeBuff(68,Player)						----�����M�����A
--	if Num01==0	then
--		if CheckFlag(Player, BonusLock)==false	then
--				if 	BeginCastBarEvent( Player, Box ,"[SC_Z24Q425860_03]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_Z33_123978_Touch_03" ) ~= 1 then
--											----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
--					ScriptMessage( Player, Player, 1,"[SC_Z24Q425860_06]", "0xffbf0b2b" )
--					ScriptMessage( Player, Player, 0,"[SC_Z24Q425860_06]", "0xffbf0b2b" )
--				end
--		else
--			ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
--			ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
--		end
--	else
--		ScriptMessage( Player, Player, 1,"[SC_Z26Q426168_04]", "0xffbf0b2b" )
--		ScriptMessage( Player, Player, 0,"[SC_Z26Q426168_04]", "0xffbf0b2b" )
--	end
--end

--function LuaPG_Z33_123978_Touch_03(Player, CheckStatus)
--	local Box = TargetID()
--	local Paper = 204821
--	EndCastBar( Player, CheckStatus)
--	if (CheckStatus ~= 0) then
--		if (CheckStatus>0) then
--			GiveBodyItem(Player, Paper, 1)
--		else
--			EndCastBar( Player, CheckStatus)
--		end
--	end
--end

function LuaPG_Z33_Npc123957()	--�a�^�����S�S
	local Player = OwnerID()
	local Npc = TargetID()
	local BonusLock = 544320
	local Paper = 204821
	local OptionStr ="[SC_Q123957_1]"
	if CheckFlag( Player, BonusLock ) == false	and
	CountBodyItem(Player, Paper)>=1		then
		AddSpeakOption( Player, Npc, OptionStr, "LuaPG_Z33_Npc123974_1", 0 )
	end
	LoadquestOption( Player )
end



-----------------------------------------------------�ƥ�����
function LuaPG_427295_Range()
	SetPlot( OwnerID(),"range","LuaPG_427295_Range_02",50 )  	----���b���βy���W	
end

function LuaPG_427295_Range_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local QuestID = 427295
	local FlagID = 544062

	CallPlot(NPC , "LuaPG_427295_Range_03" , Player , NPC, QuestID, FlagID)
end

function LuaPG_427295_Range_03(Player , NPC, QuestID, FlagID)
	local PlayerList = SearchRangePlayer( NPC, 50 )
	local Num = table.getn(PlayerList)
	for i=0, Num do
		if DW_CheckQuestAccept("or",PlayerList[i],QuestID)==true	and
		CheckFlag(PlayerList[i], FlagID)==false			then
			SetFlag(PlayerList[i], FlagID, 1)
		end
	end
end


-----------------------------------------------------�Ĥ@�ӥ��Ȫ��[��������
function LuaPG_427122_Accept()	--������
	local Player = TargetID()
	local NPC = OwnerID()
	local Soldier = LuaFunc_SearchNPCbyOrgID( NPC, 123703, 100, 0 )
	Tell(Player ,Soldier ,"[SC_Z33Q427122_3]")
end


-----------------------------------------------------���ɥ��ȥΪ��S��
function LuaPG_427320_BUFF()
	local NPC = OwnerID()
--	Say(NPC, "00")
--	AddBuff(NPC, 626277, 0, 10)
	CastSpell(NPC, NPC, 852275)
end

-----------------------------------------------------�G�H���q
function LuaPG_Z33_MINING()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_MINING_LOOP )
end


-----------------------------------------------------���]���q������
function LuaPG_Z33_TODGN_MARDROKE_01()	--�q���쥨�]�s
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_Z33_TODGN_MARDROKE_02" , 40 )
end

function LuaPG_Z33_TODGN_MARDROKE_02()
	local Player = OwnerID()
	ChangeZone( Player , 33 , 0 , -13153.1, 657.0 , 1726.5, 346 )
end


function LuaPG_Z33_TOMINES_01()	--���]�s���q��
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_Z33_TOMINES_02" , 50 )
end

function LuaPG_Z33_TOMINES_02()
	local Player = OwnerID()
	ChangeZone( Player , 33 , 0 , -8433.6 , 285.5 , 5747.4 , 55.4 )
end
