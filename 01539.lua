function Lua_Hao_BeerDDR_Action() --��ܵ���
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_35]"   ) -- 
	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_DRINK ) --
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_05]" , "Lua_Hao_BeerDDR_AboutRules", 0 ) -- �����s�j��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_12]" , "Lua_Hao_BeerDDR_GetReady", 0 ) -- �ѥ[
--	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_36]" , "Lua_Hao_BeerDDR_Close", 0 ) --  ���n
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_AboutRules() -- �������C���W�h
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT03C]"   ) 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_BeerDDR_Action", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_GetReady() -- �P�w���a�O�_���� �@��A�ȥ� �o�ӥ��ȡC
		local today= CheckFlag(OwnerID()  , 543322) -- ���Ѱѥ[�L

		if CheckBuff( OwnerID() , 504627  ) == true then
			CloseSpeak( OwnerID() )  
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_59]" , C_SYSTEM )  -- �A�L�k�P�ɰѻP��Ӱ�s�`����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_59]" , C_SYSTEM )  -- �A�L�k�P�ɰѻP��Ӱ�s�`����
		elseif CheckBuff( OwnerID() ,504656  ) == true then
			CloseSpeak( OwnerID() )  
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_60]" , C_SYSTEM )  -- �o�Ӭ��ʤw�b�i�椤
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_60]" , C_SYSTEM )  -- �o�Ӭ��ʤw�b�i�椤
		elseif today == true then
			SetSpeakDetail( OwnerID(), "[SC_BEERDAY_13]"   )  --�A���Ѥw�g�ѥ[�L�F
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_BeerDDR_Action", 0 ) --�^��W�@�h
		else
			CloseSpeak( OwnerID() )  
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+7 , TargetID() ) --�����a�O������ȡE����
			Beginplot( OwnerID() , "Lua_Hao_BeerDDR_Give_Buff" , 0  )
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Give_Buff() --��s�j�v����Buff   -- OwnerID ���a  --TargetID ����NPC

	-- 2012.08.22 �s�W�d�� DesignLog
	DesignLog( OwnerID() , 111667 , "Accept" )
	--
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID ) -- Ū�����aroom��
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 113105, BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, false )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, false )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, false )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	BeginPlot ( NPC , "Lua_Hao_DelNPC" , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , NPC ) --�����a�O�����ê���
	WriteRoleValue( NPC , EM_RoleValue_Register+8 , OwnerID() ) --�����ê���O���a
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5 , 1 ) --�N���a���W Register+5 �]�w�� 1
	AddBuff( OwnerID() ,504796 , 1, -1)  --�w��
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_52]" , C_SYSTEM ) --�A���M�`����Ҧp���D�A���G�ѫo�F����...
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_52]" , C_SYSTEM ) --�A���M�`����Ҧp���D�A���G�ѫo�F����...
	--���ܪ��a
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "5" , 0 ) --��ܵ���
	ScriptMessage( OwnerID() , OwnerID() , 1 , "5" , C_SYSTEM ) --�e������
	sleep(10)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "4" , 0 ) --��ܵ���
	ScriptMessage( OwnerID() , OwnerID() , 1 , "4" , C_SYSTEM ) --�e������
	sleep(10)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "3" , 0 ) --��ܵ���
	ScriptMessage( OwnerID() , OwnerID() , 1 , "3" , 0 ) --�e������
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_58]" , C_SYSTEM  ) --�Цb�p�ɤ��A�ھڴ��X�����D�A�I�ﴣ�Ѫ����s�@���C���D���T�N�[ 1 �I���ơA���D���~�h�� 2 �I���ơC
	sleep(10)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "2" , 0 ) --��ܵ���
	ScriptMessage( OwnerID() , OwnerID() , 1 , "2" , 0 ) --�e������
	sleep(10)
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_BEERDAY_51") , C_SYSTEM ) -- <CS>�Ъ`�N�G�p�G�C���i�椤���U�����s�A�N������o���y�C</CS>
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "1" , 0 ) --��ܵ���
	ScriptMessage( OwnerID() , OwnerID() , 1 , "1" , 0 ) --�e������
	sleep(10)
	AddBuff( OwnerID() ,504656 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() ,504657 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() ,504658 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() ,504659 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() ,504660 , 1, -1)
	sleep(1)
	ScriptMessage( OwnerID() ,  OwnerID() , 0 , "[SC_BEERDAY_16]" , C_SYSTEM ) -- �C���}�l
	ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_BEERDAY_16]" , C_SYSTEM )  
	sleep(1)
	ClockOpen( OwnerID() ,EM_ClockCheckValue_8,60,60,0,"Lua_Hao_BeerDDR_Buff_ClockClose3","Lua_Hao_BeerDDR_Buff_ClockClose") --�˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "GO" , 0 ) --��ܵ���
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "GO" , 0 ) --�e������
	BeginPlot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Start() --�X�D

	SetFlag ( OwnerID(), 543322, 1 ) -- �P�_���a�X��
--	local Player = ReadRoleValue( NPC , EM_RoleValue_Register+8 ) --��NPC ���D Register+8 �����a
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --�����a���D Register+9 ��NPC
	local LastAnswer = ReadRoleValue( NPC , EM_RoleValue_Register+2 ) --��NPC���D Register+2 ��LastAnswer
--------------------------------------------------------------------------------------------------------------------------------------------
	SetSmallGameMenuType( OwnerID() , 2 , 1 ) --�}�Ҥ��� 
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
--	SetSmallGameMenuStr( OwnerID() , 2 , 1 , "Beer Day" ) -- Change Stage((++)) ���d
	SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_45]" ) -- Change Stage((++)) ���d
--	SetSmallGameMenuStr( OwnerID(), 2 , 2 , Score ) -- Change grade (++String�Ʀr"))  �Ʀr
	SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
--	Say( OwnerID() , "Score=" ..Score )
--------------------------------------------------------------------------------------------------------------------------------------------
	local X = Rand(4) + 1

			if ( LastAnswer == X ) and ( X~=4 ) then
				X=X+1
			elseif (LastAnswer == X) and ( X==4 ) then
				X =  Rand(3) + 1
			end

			WriteRoleValue ( NPC , EM_RoleValue_Register+2 , X ) --�X�D

			if X == 1 then
				Addbuff( OwnerID() , 504690 , 0 , -1)
--				ScriptMessage( OwnerID() , OwnerID() , 0 , "UP" , C_YELLOW  ) -- �W
--				ScriptMessage( OwnerID() , OwnerID() , 1 , "UP" ,  C_YELLOW  ) 
			elseif X == 2 then
				Addbuff( OwnerID() , 504691 , 0 , -1 )
--				ScriptMessage( OwnerID() , OwnerID() , 0 , "Down" , C_Red ) -- �U
--				ScriptMessage( OwnerID() , OwnerID() , 1 , "Down" , C_Red ) 
			elseif X == 3 then
				Addbuff( OwnerID() , 504692 , 0 , -1 )
--				ScriptMessage( OwnerID() , OwnerID() , 0 , "Left" , C_Blue ) -- ��
--				ScriptMessage( OwnerID() , OwnerID() , 1 , "Left" , C_Blue ) 
			elseif X == 4 then
				Addbuff( OwnerID() , 504693 , 0 , -1)
--				ScriptMessage( OwnerID() , OwnerID() , 0 , "Right" , C_DEFAULT  ) -- �k
--				ScriptMessage( OwnerID() , OwnerID() , 1 , "Right" , C_DEFAULT  ) 
			end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Buff_ClockClose()

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --�g�J�����ȡE���ۭȵ����a
 
		ScriptMessage( OwnerID() ,  OwnerID() , 0 , "[SC_BEERDAY_23]" , C_SYSTEM )
		ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_BEERDAY_23]" , C_SYSTEM )  
		AttachCastMotionTool( OwnerID() , 212076 ) -- �N�Z���m�����Ť�
		DelObj( NPC )
		ClockClose( OwnerID() ) 
--		sleep(10)

		if  Score <= 10 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target , "[SC_BEERDAY_39]") -- �L���y
		elseif  Score >10 and Score <= 30 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target , "[SC_BEERDAY_40]") -- �w����
			GiveBodyItem( OwnerID() , 205898 , 1 )
		elseif  Score >30 and Score <= 50 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target, "[SC_BEERDAY_41]") --  ����
			GiveBodyItem( OwnerID() , 205941 , 1 ) -- ��s�`���ʰѥ[����
			GiveBodyItem( OwnerID() , 205898 , 1 ) -- �K����s
		elseif  Score >50 and Score <= 80 then -- �G��
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target, "[SC_BEERDAY_42]")
			GiveBodyItem( OwnerID() , 205941 , 1 )
			GiveBodyItem( OwnerID() , 205898 , 3 )
		elseif  Score >80  then -- ����
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target, "[SC_BEERDAY_44]")
			GiveBodyItem( OwnerID() , 205941 , 2 )
			GiveBodyItem( OwnerID() , 205898 , 5 )
--		elseif  Score >91 then -- �S��
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
--			Tell( OwnerID() , Target, "[SC_BEERDAY_44]")
--			GiveBodyItem( OwnerID() , 205941 , 3 )
		end

		Writerolevalue ( OwnerID() , EM_RoleValue_Register+1 , 0 ) -- �NRegister+1�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2 , 0 ) -- �NRegister+2�k�s
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+3 , 0 ) --�NRegister+3�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4 , 0 ) --�NRegister+4�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5 , 0 ) --�NRegister+5�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 0 ) --�NRegister+7�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8 , 0 ) --�NRegister+8�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+9 , 0 ) --�NRegister+9�k�s
		sleep(5)
		Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Buff_ClockClose2" , 0 )
end

function Lua_Hao_BeerDDR_Buff_ClockClose2()

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )

		sleep(10)
--------------------------------------------------------------------------------------------------------------------------------------------
		SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- ��������
--------------------------------------------------------------------------------------------------------------------------------------------
--		ClockClose( OwnerID() ) 
--		DelObj( NPC )
		local BUFFALL = {	504690,
				 	504691,
			               	504692,
			               	504693,
					504656,
			               	504657,
			               	504658,
			               	504659,
			               	504660,
				 	504652,
				 	504653,
				 	504654,
				 	504655, 	
					504661,
					504796		}
		for i = 1 , 15 do

			if  CheckBuff( OwnerID() , BUFFALL[i]  ) == true then

				CancelBuff( OwnerID() ,  BUFFALL[i]  ) -- 

			end
		end
--		ClockClose( OwnerID() ) 
--		DelObj( NPC )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Buff_ClockClose3() -- ���

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --�g�J�����ȡE���ۭȵ����a

		DelObj( NPC )
		ClockClose( OwnerID() ) 
 		sleep(10)
		ScriptMessage( OwnerID() ,  OwnerID() , 0 , "[SC_BEERDAY_50]" , C_SYSTEM )
		ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_BEERDAY_50]" , C_SYSTEM )  
--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_50]") --����
		AttachCastMotionTool( OwnerID() , 212076 ) -- �N�Z���m�����Ť�
--		DelObj( NPC )
--		ClockClose( OwnerID() ) 
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+1 , 0 ) -- �NRegister+1�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2 , 0 ) -- �NRegister+2�k�s
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+3 , 0 ) --�NRegister+3�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4 , 0 ) --�NRegister+4�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5 , 0 ) --�NRegister+5�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 0 ) --�NRegister+7�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8 , 0 ) --�NRegister+8�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+9 , 0 ) --�NRegister+9�k�s
--		sleep(5)
		Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Buff_ClockClose2" , 0 )
end

--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_up()--��

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --�����a���D Register+9 ��NPC
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --�����a���D Register+7 ��Target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3 , 1 ) 
	local Q = ReadRoleValue ( NPC , EM_RoleValue_Register+2  ) --�D��
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ) --���a����
	local Enter = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) -- �P�_�ɭ��ᤣ�i��J���O

	if Enter == 1 then
--	Say ( OwnerID() , A )
		if Q == A then
--			sleep(3)
			CancelBuff( OwnerID() , 504690 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DRINK )
			AttachCastMotionTool( OwnerID() , 212075 ) --�m���Z������s�M
--			Tell( OwnerID() ,  NPC ,"Good") --�[��
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_47]" , C_YELLOW ) -- ���T�T��
			AddRoleValue (OwnerID() ,  EM_RoleValue_Register+4 , 1 ) 
			local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
--			Tell( OwnerID() , NPC , Score )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		else
			if Q==1 then
			CancelBuff( OwnerID() , 504690 )
			elseif Q==2 then
			CancelBuff( OwnerID() , 504691 )
			elseif Q==3 then
			CancelBuff( OwnerID() , 504692 )
			elseif Q==4 then
			CancelBuff( OwnerID() , 504693 )
			end
--			Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_48]") --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_48]" , C_Red ) -- ���~�T��
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 2 then 
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -2 ) 
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) < 2  and ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 1 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -1 )
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) == 0 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , 0  )
				end
			local Score2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
--			Tell( OwnerID() , NPC , Score2 )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		end
	else
		CancelBuff( OwnerID() , 504690 )
		CancelBuff( OwnerID() , 504691 )
		CancelBuff( OwnerID() , 504692 )
		CancelBuff( OwnerID() , 504693 )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_down()--��

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --�����a���D Register+9 ��NPC
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --�����a���D Register+7 ��Target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3 , 2 ) 
	local Q = ReadRoleValue ( NPC , EM_RoleValue_Register+2  ) --�D��
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ) --���a����
	local Enter = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) -- �P�_�ɭ��ᤣ�i��J���O
--	Say ( OwnerID() , A )
	if Enter == 1 then
		if Q == A then
	--		sleep(3)
			CancelBuff( OwnerID() , 504691 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DRINK )
			AttachCastMotionTool( OwnerID() , 212075 ) --�m���Z������s�M
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_47]") --�[�� --�K�y.���ܤH.�o�ܤH.string
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_47]" , C_YELLOW  ) --- �U
			AddRoleValue (OwnerID() ,  EM_RoleValue_Register+4 , 1 ) 
			local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC  , Score )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		else
			if Q==1 then
			CancelBuff( OwnerID() , 504690 )
			elseif Q==2 then
			CancelBuff( OwnerID() , 504691 )
			elseif Q==3 then
			CancelBuff( OwnerID() , 504692 )
			elseif Q==4 then
			CancelBuff( OwnerID() , 504693 )
			end
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_48]") --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_48]" , C_Red ) -- ���~�T��
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 2 then 
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -2 ) 
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) < 2  and ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 1 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -1 )
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) == 0 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , 0  )
				end
			local Score2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score2 )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		end
	else
		CancelBuff( OwnerID() , 504690 )
		CancelBuff( OwnerID() , 504691 )
		CancelBuff( OwnerID() , 504692 )
		CancelBuff( OwnerID() , 504693 )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Left()--��
	
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --�����a���D Register+9 ��NPC
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --�����a���D Register+7 ��Target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3 , 3 ) 
	local Q = ReadRoleValue ( NPC , EM_RoleValue_Register+2  ) --�D��
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ) --���a����
	local Enter = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) -- �P�_�ɭ��ᤣ�i��J���O
--	Say ( OwnerID() , A )
	if Enter ==1 then
		if Q == A then
	--		sleep(3)
			CancelBuff( OwnerID() , 504692 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DRINK ) --����ܪ��ʧ@
			AttachCastMotionTool( OwnerID() , 212075 ) --�m���Z������s�M
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_47]") --�[��
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_47]" , C_YELLOW  ) --- ��
			AddRoleValue (OwnerID() ,  EM_RoleValue_Register+4 , 1 ) 
			local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		else
			if Q==1 then
			CancelBuff( OwnerID() , 504690 )
			elseif Q==2 then
			CancelBuff( OwnerID() , 504691 )
			elseif Q==3 then
			CancelBuff( OwnerID() , 504692 )
			elseif Q==4 then
			CancelBuff( OwnerID() , 504693 )
			end
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_48]") --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_48]" , C_Red ) -- ���~�T��
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 2 then 
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -2 ) 
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) < 2  and ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 1 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -1 )
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) == 0 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , 0  )
				end
			local Score2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score2 )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		end
		else
			CancelBuff( OwnerID() , 504690 )
			CancelBuff( OwnerID() , 504691 )
			CancelBuff( OwnerID() , 504692 )
			CancelBuff( OwnerID() , 504693 )
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_right()--��

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --�����a���D Register+9 ��NPC
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --�����a���D Register+7 ��Target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3 , 4 ) 
	local Q = ReadRoleValue ( NPC , EM_RoleValue_Register+2  ) --�D��
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ) --���a����
	local Enter = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) -- �P�_�ɭ��ᤣ�i��J���O
--	Say ( OwnerID() , A )
	if Enter == 1 then
		if Q == A then
	--		sleep(3)
			CancelBuff( OwnerID() , 504693 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DRINK )
			AttachCastMotionTool( OwnerID() , 212075 ) --�m���Z������s�M
	--		Tell( OwnerID() , NPC , "[SC_BEERDAY_47]") --�[��
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_47]" , C_YELLOW  ) -- �k
			AddRoleValue (OwnerID() ,  EM_RoleValue_Register+4 , 1 ) 
			local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		else
			if Q==1 then
			CancelBuff( OwnerID() , 504690 )
			elseif Q==2 then
			CancelBuff( OwnerID() , 504691 )
			elseif Q==3 then
			CancelBuff( OwnerID() , 504692 )
			elseif Q==4 then
			CancelBuff( OwnerID() , 504693 )
			end
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_48]") --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_48]" , C_Red ) -- ���~�T��
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 2 then 
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -2 ) 
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) < 2  and ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 1 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -1 )
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) == 0 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , 0  )
				end
			local Score2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score2 )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		end
		else
			CancelBuff( OwnerID() , 504690 )
			CancelBuff( OwnerID() , 504691 )
			CancelBuff( OwnerID() , 504692 )
			CancelBuff( OwnerID() , 504693 )
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Buff_PlayerDead() -- ���a���`

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --�g�J�����ȡE���ۭȵ����a

		DelObj( NPC )
		ClockClose( OwnerID() ) 
		SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- ��������
		AttachCastMotionTool( OwnerID() , 212076 ) -- �N�Z���m�����Ť�
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+1 , 0 ) -- �NRegister+1�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2 , 0 ) -- �NRegister+2�k�s
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+3 , 0 ) --�NRegister+3�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4 , 0 ) --�NRegister+4�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5 , 0 ) --�NRegister+5�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 0 ) --�NRegister+7�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8 , 0 ) --�NRegister+8�k�s
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+9 , 0 ) --�NRegister+9�k�s

		local BUFFALL = {	504690,
				 	504691,
			               	504692,
			               	504693,
					504656,
			               	504657,
			               	504658,
			               	504659,
			               	504660,
				 	504652,
				 	504653,
				 	504654,
				 	504655, 	
					504661,
					504796		}
		for i = 1 , 15 do

			if  CheckBuff( OwnerID() , BUFFALL[i]  ) == true then

				CancelBuff( OwnerID() ,  BUFFALL[i]  ) -- 

			end
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_test1()
	SetFlag ( OwnerID(), 543322, 0 )
	SetFlag ( OwnerID(), 543323, 0 )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DelNPC()
	Sleep(900)
	DelObj( OwnerID() )
end
--------------------------------------------------------------------------------------------------------------------------------------------