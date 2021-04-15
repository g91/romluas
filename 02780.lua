--�X�нs��
--781210
--780688   �����X��(�`�@12��  0~11)
--Lua_Zone24BossQQQQ  (�����禡)702506
--0	--Boss
--1~4	--�˸m�سy�̫سy�I
--5	--���������x6+�˸m�سy�̪�x4+�ޯ�y

--����s��
--local BossID = 107213			--�ĥC�N�կ�
--local Mob1ID = 107372		--���������
--local Mob2ID = 107373		--�˸m�سy��
--local Mob3ID = 107374		--���Űl����
--local SystemID =  107371		--��q��Ƹ˸m
--local MoveBallID = 107417		--�z���y
--local PartsID = 107375			--�������s��
--local PassageID = 107331~107334	--���B�q�D (�Ȯɨϥ�107331)
--local FlyLight = 107494~107496

function Z24_worldBoss_Ctrl_AI(Controller)
	local WilliamCtrl = Controller
	WriteRoleValue( WilliamCtrl , EM_RoleValue_Register1, 1 )
	local BossID = 107213		--�ĥC�N�կ�
	local Mob1ID = 107372		--���������
	local Mob2ID = 107373		--�˸m�سy��
	local Mob3ID = 107374		--���Űl����
	local SystemID =  107371	--��q��Ƹ˸m
	local BallID = 107417		--�z���y
	local ShowBallID = 107417	--��t�k�}dsssss
	local MagicBallID = 107481	--�I�k����
	local TreasureID = 107375	--�����s��
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Treasure = CreateObjByFlag( TreasureID , 781210 , 0 , 1 )
	local distime = 0
	
	local MagicBall = CreateObjByFlag( MagicBallID , 781210 , 0 , 1 )
	SetModeEx( MagicBall , EM_SetModeType_NotShowHPMP , true )		----����ܦ��
	SetModeEx( MagicBall , EM_SetModeType_Mark , false )			----���i�Q�аO
---	SetModeEx( MagicBall , EM_SetModeType_Show , false )			----����
	SetModeEx( MagicBall , EM_SetModeType_Strikback , false )			----������
	SetModeEx( MagicBall , EM_SetModeType_Searchenemy , false )		----������
	SetModeEx( MagicBall , EM_SetModeType_Fight , false )			----���i���
	AddToPartition( MagicBall , RoomID )
	AddBuff(MagicBall , 623830 , 0 , -1 )
	
	local Bx = ReadRoleValue( MagicBall , EM_RoleValue_X ) 
	local By = ReadRoleValue( MagicBall , EM_RoleValue_Y )
	local Bz = ReadRoleValue( MagicBall , EM_RoleValue_Z )
	
	local MoveBall = CreateObj( BallID , Bx , By+300 , Bz ,  0 , 1 )
	SetModeEx( MoveBall , EM_SetModeType_NotShowHPMP , true )		----����ܦ��
	SetModeEx( MoveBall , EM_SetModeType_Mark , false )			----���i�Q�аO
	SetModeEx( MoveBall , EM_SetModeType_Show , false )			----����
	SetModeEx( MoveBall , EM_SetModeType_Strikback , false )			----������
	SetModeEx( MoveBall , EM_SetModeType_Searchenemy , false )		----������
	SetModeEx( MoveBall , EM_SetModeType_Fight , false )				----���i���
	SetModeEx( MoveBall , EM_SetModeType_Gravity , false )			----�L���O
	SetModeEx( MoveBall , EM_SetModeType_AlignToSurface , false )		----���K���a��
	AddToPartition( MoveBall , RoomID ) 
	WriteRoleValue( Ctrl , EM_RoleValue_Register1 , MoveBall )
	WriteRoleValue( MoveBall , EM_RoleValue_PassengerAttackable , 1)
	
	MoveToFlagEnabled( MoveBall , false )
		
	local Boss = CreateObj( BossID , Bx , By+300, Bz ,  0 , 1 )
	SetModeEx( Boss , EM_SetModeType_Gravity , false )			----�L���O
	SetModeEx( Boss , EM_SetModeType_AlignToSurface , false )		----���K���a��
	SetModeEx( Boss , EM_SetModeType_Move , false )			----������
	SetModeEx( Boss , EM_SetModeType_Searchenemy , false )		----������
	SetModeEx( Boss , EM_SetModeType_Fight , false )			----���i���
	AddToPartition( Boss , RoomID )
	SetPlot(Boss,"dead","Z24_WorldBoss_DeadPlot",0);			--�]�w���`�@�������X�аO��
	WriteRoleValue( Ctrl , EM_RoleValue_PID , Boss )
	WriteRoleValue( Boss , EM_RoleValue_PID , Ctrl )	
	AttachObj( Boss , MoveBall , 1 , "p_name_title" , "p_down" )
	AddBuff( Boss , 623855 , 0 , -1 )					--����T��

	WriteRoleValue( MoveBall , EM_RoleValue_PassengerAttackable , 1)	--�]�wBoss�i�H�Q�����A�����g�J����
	MoveToFlagEnabled( Boss , false )
	MoveDirect( MoveBall , Bx , By+39 , Bz )

	sleep(180)
	CallPlot(Boss,"Lua_DW_WBGUIDRecord",1);				--�]�w�����ϰ쪺��1���@�ɤ�
	BeginPlot(Boss,"Z24_WorldBoss_ScanHateList",0);
	SetModeEx( Boss , EM_SetModeType_Move , true )
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true )		----����
	SetModeEx( Boss , EM_SetModeType_Fight , true )			----�i���
	MoveDirect( MoveBall , Bx , By+40 , Bz )
--	SysCastSpellLv( boss ,boss , 850540 , 0 )

	WriteRoleValue( Ctrl , EM_RoleValue_Register2 , MagicBall )
	WriteRoleValue( MagicBall , EM_RoleValue_PID , MoveBall )
	WriteRoleValue( MagicBall , EM_RoleValue_Register1 , Boss )
	WriteRoleValue( MoveBall , EM_RoleValue_Register2 , MagicBall )
	WriteRoleValue( MoveBall , EM_RoleValue_Register4 , ctrl )
	
	local CombatBegin = 0

	local Npc_Table = {}

	Mob1_Table = {}			--�D�ʩ�
	Mob1Pick = 0
	Mob2_Table = {}			--�Q�ʩ�
	Mob2Pick = 0
	System_table = {}
 	SystemDie = {}
	SystemDie[1] = 0
	SystemDie[2] = 0
	SystemDie[3] = 0
	SystemDie[4] = 0
----------------------------------
	local PTL={}--���`�����B�q�D
	local NUM=0--�O���ܼ�	
	
---------------------------------------------------------------------------------------------------------------------------------------------------
	while 1 do 
	sleep(10)
			PTL=SearchRangeNpc ( ctrl , 500 )
			for k = 0 , table.getn(PTL) do
				if ReadRoleValue( PTL[k], EM_RoleValue_OrgID )==107331 or
				   ReadRoleValue( PTL[k], EM_RoleValue_OrgID )==107332 or
				   ReadRoleValue( PTL[k], EM_RoleValue_OrgID )==107333 or
				   ReadRoleValue( PTL[k], EM_RoleValue_OrgID )==107334 then
						NUM=NUM+1
				end
			end
			
		distime = distime + 1
		if distime == 90 and HateListCount( Boss ) == 0 then			--�}��90���S�H����boss, ��boss���}
		SetModeEx( Boss , EM_SetModeType_Searchenemy , false )		----������
		SetModeEx( Boss , EM_SetModeType_Fight , false )			----���i���
		MoveDirect( MoveBall , Bx , By+300 , Bz )
		sleep(100)	
			Npc_Table = SearchRangeNPC( Ctrl , 500 )
			for i = 0 , (#Npc_Table)-1 do
				if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BallID then
	 				DelObj( Npc_Table[i] )
	 			end
	 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == MagicBallID then
	 				DelObj( Npc_Table[i] )
	 			end
	 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BossID then
	 				DelObj( Npc_Table[i] )
	 			end
	 		end
	 		System_table = {}				
			SystemDie = {}		
		end			
		
		if HateListCount( Boss ) ~= 0 then
			if CombatBegin == 0 then				--�԰��}�� 0
				Boss = ReadRoleValue( Ctrl , EM_RoleValue_PID )
				BeginPlot( MoveBall , "Z24_WorldBoss_MoveBall" , 0 )
				BeginPlot( MagicBall , "Z24_worldBoss_MagicBallAI" , 0 )
				CancelBuff( MagicBall , 623830 )
			CombatBegin = 1
			end
		end		
--------------------------�⦺�`���˸m�]0----------------------------------		
		if #System_table >= 1 then
--		System_table = {}
--		DebugMsg(0,0,"SystemDie1="..SystemDie[1].." SystemDie2="..SystemDie[2].." SystemDie3="..SystemDie[3].." SystemDie4="..SystemDie[4])
			for i= 1 , #System_table do
				if System_table[i]~=nil then
					if ReadRoleValue( System_table[i] , EM_RoleValue_IsDead ) == 1  then --or CheckID( System_table[i] ) == false
					SystemDie[i] = 0				
					end
				end
			end
		end
--------------------------�⦺�`���D�ʩǲ��Xtable--------------------------------				
		if #Mob1_Table ~= 0 then
			for i = #Mob1_Table , 1 , -1 do				--�p��1�p�G���`,���X�p��1table
				if ReadRoleValue( Mob1_Table[i] , EM_RoleValue_IsDead ) == 1 or CheckID(Mob1_Table[i]) == false then
				table.remove( Mob1_Table , i )
				Mob1Pick = 0	
				end
			end
		end
--------------------------�⦺�`���Q�ʩǲ��Xtable--------------------------------		
		if #Mob2_Table ~= 0 then
			for i = #Mob2_Table , 1 , -1 do
				if ReadRoleValue( Mob2_Table[i] , EM_RoleValue_IsDead ) == 1 or CheckID(Mob2_Table[i]) == false then
				table.remove( Mob2_Table , i )
				Mob2Pick = 0
				end
			end
		end		
----------------------------------------------------------------------------------------------------------------------------------------------
		if HateListCount( Boss ) == 0 then
			 if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0   then --and NUM == 4
			 	if CombatBegin ==1 then
			 		Npc_Table = SearchRangeNPC( Ctrl , 500 )
			 		for i = 0 , (#Npc_Table)-1 do
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob1ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob2ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob3ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == SystemID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BallID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == MagicBallID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BossID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107494 then
			 				DelObj( Npc_Table[i] )
			 			end 
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107495 then
			 				DelObj( Npc_Table[i] )
			 			end 
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107496 then
			 				DelObj( Npc_Table[i] )
			 			end 			 			
			 		end
			 		CombatBegin = 0
			 		Mob1_Table = {}
					Mob2_Table = {}
					System_table = {}				
					SystemDie = {}
					Mob1Pick = 0
					Mob2Pick = 0	
					WriteRoleValue( WilliamCtrl , EM_RoleValue_Register1, 0 )
					break		 						
			 	end
			 end
--------------------------------------------------------------------------------------------------------------------------------------
			if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1  then --or CheckID( Boss ) == false
					local X = ReadRoleValue( MoveBall , EM_RoleValue_X )
					local Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
					local Z = ReadRoleValue( MoveBall , EM_RoleValue_Z )
					AddBuff( Boss , 623857 , 0 , -1 )
					MoveDirect( MoveBall , X , Y+500 , Z )
					Treasure = CreateObjByFlag( TreasureID , 781210 , 0 , 1 )
					SetModeEx( Treasure , EM_SetModeType_Show, false)   	    --���
					SetModeEx( Treasure , EM_SetModeType_Searchenemy, false)   	    --����
					SetModeEx( Treasure , EM_SetModeType_Fight, false) 		    --���
					SetModeEx( Treasure , EM_SetModeType_Move, false)		    --����
					SetModeEx( Treasure , EM_SetModeType_Strikback, false)	    --����
					SetModeEx(Treasure,EM_SetModeType_NotShowHPMP,true)           --����ܦ��
					AddToPartition( Treasure , RoomID )
					Lua_DW_WBGUIDSwitch(1,Treasure);--�N�@�ɤ������y�з��ಾ���_�c�W
					Sleep(150)
					SetModeEx( Treasure , EM_SetModeType_Show, true)   	    --���
					AddBuff( Treasure , 623831 , 0 , -1 )
					ScriptMessage( Ctrl , -1 , 2 , "[SC_ZONE24_WORLDBOSS_DEAD]" , 0 )
					BeginPlot( Treasure , "Z24_WorldBoss_Treasure", 0 )				
					Npc_Table = SearchRangeNPC( Ctrl , 500 )
					for i = 0 , (#Npc_Table)-1 do
						if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob1ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob2ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == Mob3ID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == SystemID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BallID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == MagicBallID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == BossID then
			 				DelObj( Npc_Table[i] )
			 			end
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107494 then
			 				DelObj( Npc_Table[i] )
			 			end 
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107495 then
			 				DelObj( Npc_Table[i] )
			 			end 
			 			if ReadRoleValue( Npc_Table[i] , EM_RoleValue_OrgID ) == 107496 then
			 				DelObj( Npc_Table[i] )
			 			end 	
					end
					CombatBegin = 0
					System_table = {}
					Mob1_Table = {}
					Mob2_Table = {}
					SystemDie = {}
					Mob1Pick = 0
					Mob2Pick = 0
					CallPlot( WilliamCtrl, "LuaFunc_ResetObj", WilliamCtrl ) --WriteRoleValue( WilliamCtrl , EM_RoleValue_Register1, 0 )
					break
			end
		end				
	end
end

function Z24_WorldBoss_MoveBall()
	local MoveBall = OwnerID()
	local MagicBall = ReadRoleValue( MoveBall , EM_RoleValue_Register2 )
	local Boss = ReadRoleValue( MagicBall , EM_RoleValue_Register1 )
	local HighPick = 0
	local MBy = ReadRoleValue (MagicBall , EM_RoleValue_Y )
	local X = ReadRoleValue( MoveBall , EM_RoleValue_X )
	local Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
	local Z = ReadRoleValue( MoveBall , EM_RoleValue_Z )
	local Ynow
	local Y1 = MBy + 40		--�C
	local Y2 = MBy + 150		--��	
	local Y3 = MBy + 300		--��
	local H	= 1			--���q�P�_
	local H1 = 0
	WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )			--���קP�_
	local Npc_Table = {}
	local Playertable	
	
while 1 do
	sleep(10)
	H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )
	Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
--	DebugMsg(0,0,"Y="..Y.." Y1="..Y1)
	if H1 == 0 and Y == Y1 then
			ScriptMessage( MagicBall , -1  , 3 , "[SC_107213_WORLDBOSS_1]" , C_SYSTEM )
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_SLEEP_BEGIN ,ruFUSION_ACTORSTATE_SLEEP_LOOP )
			MoveDirect( MoveBall , X , Y1+1 , Z )					
			H = 1								--P1
			WriteRoleValue( MoveBall , EM_RoleValue_Register1 , H )
			sleep(150)							--���d15��
			MoveDirect( MoveBall , X , Y2 , Z )
		SysCastSpellLv( MagicBall , MagicBall , 499763 , 0 )			--�ඥ�q  �j�Ʋ{���Ҧ��p��
		H1 = 1
		WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )
		WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 )			--�}�������g�u����
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_SLEEP_LOOP ,ruFUSION_ACTORSTATE_SLEEP_END )	
	end
	H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )	
	Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
--	DebugMsg(0,0,"Y="..Y.." Y2="..Y2)
	if H1 == 1 and Y== Y2 then
			ScriptMessage( MagicBall , -1 , 3 , "[SC_107213_WORLDBOSS_2]" , C_SYSTEM )	
		LightTag = {}
		farplayer = {}
		farplayertable={}	
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )			
			MoveDirect( MoveBall , X , Y2+1 , Z )					
			H = 2			--P2
			WriteRoleValue( MoveBall , EM_RoleValue_Register1 , H )
			sleep(150)		--���d15��		
			MoveDirect( MoveBall , X , Y3 , Z )
		SysCastSpellLv( MagicBall , MagicBall , 499763 , 0 )	
		H1 = 2
		WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )		
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CROUCH_LOOP , ruFUSION_ACTORSTATE_CROUCH_END )					
	end	
	H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )	
	Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
--	DebugMsg(0,0,"Y="..Y.." Y3="..Y3)
	if H1 == 2 and Y == Y3 then	
			ScriptMessage( MagicBall , -1 , 3 , "[SC_107213_WORLDBOSS_3]" , C_SYSTEM )	
			MoveDirect( MoveBall , X , Y3+1 , Z )			
			H = 3			--P3
			WriteRoleValue( MoveBall , EM_RoleValue_Register1 , H )
			sleep(100)		--���d10��		
			MoveDirect( MoveBall , X , Y2 , Z )
		SysCastSpellLv( MagicBall , MagicBall , 499763 , 0 )
		H1 = 3	
		WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )											
	end	
	H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )	
	Y = ReadRoleValue( MoveBall , EM_RoleValue_Y )
--	DebugMsg(0,0,"Y="..Y.." Y2="..Y2)
	if H1 == 3 and Y== Y2 then
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )	
			ScriptMessage( MagicBall , -1 , 3 , "[SC_107213_WORLDBOSS_2]" , C_SYSTEM )		
			MoveDirect( MoveBall , X , Y2+1 , Z )		
			H = 0			--P2
			WriteRoleValue( MoveBall , EM_RoleValue_Register1 , H )
			sleep(150)		--���d15��		
			MoveDirect( MoveBall , X , Y1 , Z )
		SysCastSpellLv( MagicBall , MagicBall , 499763 , 0 )
		H1 = 0	
		WriteRoleValue( MoveBall , EM_RoleValue_Register3 , H1 )
	PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CROUCH_LOOP , ruFUSION_ACTORSTATE_CROUCH_END )		
	end			
end
end

function Z24_worldBoss_MagicBallAI()
	local MagicBall = OwnerID()
	local RoomID = ReadRoleValue( MagicBall , EM_RoleValue_RoomID )
	local MoveBall = ReadRoleValue( MagicBall , EM_RoleValue_PID )
	local Boss = ReadRoleValue( MagicBall , EM_RoleValue_Register1 )
	local H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
	local skilltime = 0
	local Light = 499779
	local Fireshow = 499777
	local FireBallID = 107417
	local Mob1ID = 107372 		--���������
	local Mob2ID = 107373		--�˸m�سy��
	local Mob3ID = 107374		--���Űl����
	local Npc_Table = {}
	local P1_FireLight_Table = {}
	local BossPick = 0
while 1 do
sleep(10)
--------------------------�⦺�`���˸m�]��0-------------------------------------
	H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
	skilltime = skilltime +1 
	if skilltime % 20 == 0 then
		CastSpell( MagicBall , MagicBall , Light )
	end	
-------------------------�C���q--------------------------------------------------		
		H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
		if H == 1 then	
			if BossPick == 0 then
				CallPlot( Boss , "Z24_WorldBoss_BossAI" , 0 )				
-------------------------�D�ʩǪ����X-------------------------------------------							
				if #Mob1_Table < 6 and Mob1Pick == 0 then			--�p�G�p��1table�̭��p��6���A�Ӥp�Ǣ��}���B��
					for i=1 , 6-#Mob1_Table do				--�N�p��1�ɺ�
						Mob1 = CreateObjByFlag( Mob1ID , 781210 , 5 , 1 )
						AddToPartition( Mob1 , 0 )
						SetFlag( Mob1, 544801, 1 )
						table.insert( Mob1_Table , Mob1 )	
					end	
					if #Mob1_Table == 6 then
						Mob1Pick = 1
					end			
				end
-------------------------�Q�ʩǪ����X-------------------------------------------	
				if #Mob2_Table < 4  and Mob2Pick == 0 then			--�p�G�p��2table�̭��p�Ǥp��4���A�Ӥp�Ǣ��}���B��
					for i = 1  , 4-#Mob2_Table  do				--�N�p��2�ɺ�
						Mob2 = CreateObjByFlag( Mob2ID , 781210 , 5 , 1 )
						AddToPartition( Mob2 , 0 )
						SetFlag( Mob2, 544801, 1 )
						CallPlot( Mob2 , "Z24_worldBoss_Mob2AI" , 0 )
						table.insert( Mob2_Table , Mob2 )				
					end				
					if #Mob2_Table == 4 then
						Mob2Pick = 1
					end	
				end	
			BossPick = 1
			end					
		end
-------------------------�����q-------------------------------------------------	
		H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )		
		if H == 2  then	
			if BossPick == 1 then
				CallPlot( MagicBall , "Lua_Zone24BossQQQQ" , 0 )		
-------------------------�D�ʩǪ����X-------------------------------------------						
				if #Mob1_Table < 6 and Mob1Pick ==0 then
					for i=1 , 6-#Mob1_Table do
						Mob1 = CreateObjByFlag( Mob3ID , 781210 , 5 , 1 )		--�ɭ��Űl����
						AddToPartition( Mob1 , 0 )
						SetFlag( Mob1, 544801, 1 )
						table.insert( Mob1_Table , Mob1 )
					end
					if #Mob1_Table == 6 then
						Mob1Pick = 1
					end
				end
-------------------------�Q�ʩǪ����X-------------------------------------------			
				if #Mob2_Table < 4 and Mob2Pick == 0 then
					for i = 1 , 4-#Mob2_Table do
						Mob2 = CreateObjByFlag( Mob2ID , 781210 , 5 , 1 )
						AddToPartition( Mob2 , 0 )
						SetFlag( Mob2, 544801, 1 )
						CallPlot( Mob2 , "Z24_worldBoss_Mob2AI" , 0 )
						table.insert( Mob2_Table , Mob2 )
					end				
					if #Mob2_Table == 4 then
						Mob2Pick = 1
					end	
				end
			BossPick = 0
			end
		end
--------------------------�����q--------------------------------------------------		
		H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
		if H == 3 then	
				local randSystem = DW_rand(#System_table)
				CastSpell( System_table[randSystem] , Boss , 499780 )	
			BossPick = 1
		end					
-------------------------�����q-------------------------------------------------		
		H = ReadRoleValue( MoveBall , EM_RoleValue_Register1 )
		if H == 0 then	
			if BossPick == 1 then
				CallPlot( MagicBall , "Lua_Zone24BossQQQQ" , 0 )			
-------------------------�D�ʩǪ����X-------------------------------------------							
				if #Mob1_Table < 6 and Mob1Pick == 0 then
					for i=1 , 6-#Mob1_Table do
						Mob1 = CreateObjByFlag( Mob3ID , 781210 , 5 , 1 )		--�ɭ��Űl����
						AddToPartition( Mob1 , 0 )
						SetFlag( Mob1, 544801, 1 )--�������_��
						table.insert( Mob1_Table , Mob1 )
					end
					if #Mob1_Table == 6 then
						Mob1Pick = 1
					end
				end
-------------------------�Q�ʩǪ����X-------------------------------------------			
				if #Mob2_Table < 4 and Mob2Pick == 0 then
					for i = 1 , 4-#Mob2_Table do
						Mob2 = CreateObjByFlag( Mob2ID , 781210 , 5 , 1 )
						AddToPartition( Mob2 , 0 )
						SetFlag( Mob2, 544801, 1 )
						CallPlot( Mob2 , "Z24_worldBoss_Mob2AI" , 0 )
						table.insert( Mob2_Table , Mob2 )
					end
					if #Mob2_table == 4 then
						Mob2Pick = 1
					end					
				end
			BossPick = 0
			end
		end
end
end

function Z24_worldBoss_Mob2AI()
	local Mob2 = OwnerID()
	local SystemID = 107371		--��q��Ƹ˸m
	local FlagTable = {}
	FlagTable[1] = 1
	FlagTable[2] = 2
	FlagTable[3] = 3
	FlagTable[4] = 4
-----------------------------------------------------------------------------------------	
	SetModeEx( Mob2 , EM_SetModeType_Strikback , false )	--������
	SetModeEx( Mob2 , EM_SetModeType_Searchenemy , false )	--������
	SetModeEx( Mob2 , EM_SetModeType_Fight , false )		--���i���
	if SystemDie[1] == 1  and SystemDie[2] == 1 and SystemDie[3] == 1 and SystemDie[4] == 1 then 
		SetModeEx( Mob2 , EM_SetModeType_Strikback , true )	--�i����
		SetModeEx( Mob2 , EM_SetModeType_Searchenemy , true )	--�i����
		SetModeEx( Mob2 , EM_SetModeType_Fight , true )		--�i���
		return
	end
	for i= 1 , 4 do
		if SystemDie[i] == 0 then
			SystemDie[i] = 1 
			LuaFunc_MoveToFlag( Mob2 , 781210 , FlagTable[i] , 100 )
			FA_FaceFlagEX( Mob2 , 781210 , FlagTable[i] , 0 , 0  )
			Sleep(10)
			CastSpell( Mob2 , Mob2 , 499782 )	
			Sleep(100)
			System_table[i] = CreateObjByFlag ( SystemID , 781210 , FlagTable[i]  , 0 )				
			SetModeEx( System_table[i] , EM_SetModeType_Mark , true )		--�аO
			SetModeEx( System_table[i] , EM_SetModeType_HideName , false )		--�����æW��
			SetModeEx( System_table[i] , EM_SetModeType_NotShowHPMP , false )	--��ܦ��
			SetModeEx( System_table[i] , EM_SetModeType_Strikback , false )		--������			
			SetModeEx( System_table[i] , EM_SetModeType_Move , false )		--������
			SetModeEx( System_table[i] , EM_SetModeType_Fight , true )		--�i���
			SetModeEx( System_table[i] , EM_SetModeType_Searchenemy , false )	--������
			SetModeEx( System_table[i] , EM_SetModeType_Obstruct , false )		--����
			AddToPartition( System_table[i] , 0 )
			SetFlag( System_table[i], 544801, 1 )--�������_��
			BeginPlot( System_table[i] , "Z24_WorldBoss_SystemAI" , 0 )	
			MoveToFlagEnabled( Mob2 , false )
			SetModeEx( Mob2 , EM_SetModeType_Strikback , true )	--�i����
			SetModeEx( Mob2 , EM_SetModeType_Searchenemy , true )	--�i����
			SetModeEx( Mob2 , EM_SetModeType_Fight , true )		--�i���
			return	
		end	
	end
end

function Z24_WorldBoss_BossAI()
	local Boss = OwnerID()
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_PID )
	local MoveBall = ReadRoleValue( Ctrl , EM_RoleValue_Register1 )
	local H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local hate_table = HateListCount( Boss )
	local RandPlayer = Rand(hate_table)
	local TempGID = 0
	local BallPick = 0 	
	farplayer = {}
	farplayertable={}
	LightTag = {}	
	while 1 do
	sleep(10)
		H1 = ReadRoleValue( MoveBall , EM_RoleValue_Register3 )	
		if H1 ==0  then 			
			farplayer = KS_GetHateList( Boss, 2 )--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a)
			for i = 1 , #farplayer do
				if GetDistance( Boss, farplayer[i])>= 150 then
					table.insert( farplayertable , farplayer[i] )
				end	
			end	
			if ReadRoleValue( Boss , EM_RoleValue_Register1 ) == 0 then			--�����g�u���}����0��
				if #farplayertable ~= 0  then	--�̻����a���S���H����
					DebugMsg(0,0,"step="..1)				
					local followman = DW_rand(#farplayertable)	--rand�X�̻����a���Ǹ�
					local Firstplayer= farplayertable[followman]	--�̷ӧǸ��h�䪱�a
						table.insert( LightTag , Firstplayer )	
					for i =1 , #farplayer do
						ScriptMessage( Boss , farplayer[i] , 3 , "[SC_107213_WORLDBOSS_0]".."|cffff0000" ..GetName(Firstplayer).. "|r" , C_SYSTEM )
					end																	
							local Bx = ReadRoleValue( Firstplayer , EM_RoleValue_X )
							local By = ReadRoleValue( Firstplayer , EM_RoleValue_Y )
							local Bz = ReadRoleValue( Firstplayer , EM_RoleValue_Z )
							local ball = CreateObj( 107417 , Bx , By , Bz , 0 , 1 )  ------------�ͥX�l�ܲy
							SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
							SetModeEx( ball , EM_SetModeType_Mark, false)---�i�I��(�O)
							SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
							SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
							SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
							SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
							AddToPartition( ball , RoomID )
							CastSpell( Boss , ball , 499777 )				--��t�Υ���
							WriteRoleValue( ball , EM_RoleValue_Livetime, 19 )  		--�s���ɶ�
							WriteRoleValue ( ball , EM_RoleValue_PID , Boss )
							BeginPlot( ball,"Z24_World_FollowBallAI_01", 0 )
					WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 )					
				else				--�̻����a���S���H����
					DebugMsg(0,0,"step="..2)
					TempGID = HateListInfo( Boss , RandPlayer , EM_HateListInfoType_GItemID )		--Boss������H�N�@�Ӫ��a	
					table.insert( LightTag , TempGID )	
					for i =1 , #farplayer do
						ScriptMessage( Boss , farplayer[i] , 3 , "[SC_107213_WORLDBOSS_0]".."|cffff0000" ..GetName(TempGID).. "|r" , C_SYSTEM )
					end
						local Bx = ReadRoleValue( TempGID , EM_RoleValue_X )
						local By = ReadRoleValue( TempGID , EM_RoleValue_Y )
						local Bz = ReadRoleValue( TempGID , EM_RoleValue_Z )
						local ball = CreateObj( 107417 , Bx , By , Bz , 0 , 1 )  ------------�ͥX�l�ܲy
						SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
						SetModeEx( ball , EM_SetModeType_Mark, false)---�i�I��(�O)
						SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
						SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
						SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
						SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
						AddToPartition( ball , RoomID )
						CastSpell( Boss , ball , 499777 )				--��t�Υ���
						WriteRoleValue( ball , EM_RoleValue_Livetime, 19 )  		--�s���ɶ�
						WriteRoleValue ( ball , EM_RoleValue_PID , Boss )
						BeginPlot( ball,"Z24_World_FollowBallAI_02", 0 )
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 )	
				end	
			end
		 end
	end	
end

function Z24_World_FollowBallAI_01()		--�l�̻������a�s
	local boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
	while true do
	Sleep(10)
		if ReadRoleValue( LightTag[1] , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( LightTag[1] , EM_RoleValue_IsPlayer ) ~= 1 then
				LightTag = {}
				local followman = DW_rand(#farplayertable)	--rand�X�̻����a���Ǹ�
				local Firstplayer= farplayertable[followman]	--�̷ӧǸ��h�䪱�a	
				table.insert( LightTag , Firstplayer )
				for i =1 , #farplayer do
					ScriptMessage( Boss , farplayer[i] , 3 , "[SC_107213_WORLDBOSS_0]".."|cffff0000" ..GetName(Firstplayer).. "|r" , C_SYSTEM )
				end
				SetFollow( OwnerID(), Firstplayer )
				SysCastSpellLv( OwnerID() , OwnerID() , 499781 , 0  )
		elseif ReadRoleValue( LightTag[1] , EM_RoleValue_IsDead ) == 0 then
				SetFollow( OwnerID(), LightTag[1] )
				SysCastSpellLv( OwnerID() , OwnerID() , 499781 , 0 )
		end
	end
end

function Z24_World_FollowBallAI_02()		--�l������H�����a
	local boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local hate_table = HateListCount( Boss )
	local RandPlayer = Rand(hate_table)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
	while true do
	Sleep(10)
		if ReadRoleValue( LightTag[1] , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( LightTag[1] , EM_RoleValue_IsPlayer ) ~= 1 then
				LightTag = {}
				TempGID = HateListInfo( Boss , RandPlayer , EM_HateListInfoType_GItemID )		--Boss������H�N�@�Ӫ��a	
				table.insert( LightTag , TempGID )
				for i =1 , #farplayer do
					ScriptMessage( Boss , farplayer[i] , 3 , "[SC_107213_WORLDBOSS_0]".."|cffff0000" ..GetName(TempGID).. "|r" , C_SYSTEM )
				end
				SetFollow( OwnerID(), TempGID )
				SysCastSpellLv( OwnerID() , OwnerID() , 499781 , 0  )
		elseif ReadRoleValue( LightTag[1] , EM_RoleValue_IsDead ) == 0 then
				SetFollow( OwnerID(), LightTag[1] )
				SysCastSpellLv( OwnerID() , OwnerID() , 499781 , 0 )
		end
	end
end

Function Z24_worldBoss_FireBall()
	while 1 do
		sleep(10)
		SysCastSpellLv( OwnerID() , OwnerID() , 499764 , 0 )
		SysCastSpellLv( OwnerID() , OwnerID() , 499783 , 0 )		
	end
end

function Z24_WorldBoss_SystemAI()
	local System = OwnerID()
	local player_table = {}
	local bufflv  
	AddBuff(System , 623802 , 0 , -1 )
	while 1 do
		sleep(10)
		player_table = SearchRangePlayer( System , 60 )
		for i=0 , #player_table do
			if CheckBuff( player_table[i] , 623759 ) == true then
				bufflv = FN_CountBuffLevel( player_table[i] , 623759 )	--Ū���ؼШ��W�o��Buff���X�h -1�N��SBuff
				if bufflv == 0 then					--�p�G�u���@�h�A�N�����R��
				CancelBuff( player_table[i] , 623759 )
				SysCastSpellLv( System , System , 850497 , 0 )
				else
				CancelBuff( player_table[i] , 623759 )
				AddBuff( player_table[i] , 623759 , bufflv-1 , -1 )
				SysCastSpellLv( System , System , 850497 , 0 )
				end
			end
		end
	end	
end

function Z24_WorldBoss_623783()
	local own = OwnerID()
	local tar = TargetID()
	local TagID =  ReadRoleValue( tar , EM_RoleValue_OrgID ) 
	if TagID == 107372 or TagID == 107373 or TagID == 107374  then
		return true
	else
		return false
	end
end

function Z24_WorldBoss_Treasure()
	SetPlot( OwnerID() ,"touch", "Z24_WorldBoss_Treasure_Open" ,40 )
end

function Z24_WorldBoss_Treasure_Open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	Sleep(20)
	KillID( OwnerID() , TargetID() )
end

function Lua_Zone24BossQQQQ()
local own = OwnerID()
local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	CallPlot( own, "Lua_Zone24BossQQQ", RoomID )
end

function Lua_Zone24BossQQQ( RoomID )--�s����
	local own = OwnerID()
	Sleep(10)
	--if KS_InCombat( own ) == true then
		for i=1, 2 do
			--local Wind = kg_GetPosRX( own, 107494, 85, 0, ((i-1)*180)-90 );
			local Wind = LuaFunc_CreateObjByObj(107494,own)
			SetModeEx( Wind, EM_SetModeType_Fight, false );	--�L�k���
			SetModeEx( Wind, EM_SetModeType_Searchenemy, false );	-- ����
			SetModeEx( Wind, EM_SetModeType_Strikback , false );	-- ����
			SetModeEx( Wind, EM_SetModeType_Mark , false );	-- �аO
			SetModeEx( Wind, EM_SetModeType_NotShowHPMP, true );--�S�����
			SetModeEx( Wind, EM_SetModeType_HideName, true )
			AddToPartition( Wind, RoomID );
			WriteRoleValue(Wind,EM_RoleValue_register1,own)
			AddBuff( Wind, 623288, 0, -1 );--�~�[
			BeginPlot( Wind, "Lua_Zone24_WindAI", 0 );
		end
	--end
end

function Lua_Zone24_WindAI()--�s����
	local Wind = OwnerID();
	local RoomID = ReadRoleValue( Wind, EM_RoleValue_RoomID );
	local Global = ReadRoleValue(Wind,EM_RoleValue_register1)
	local _Global = 780688
	local Site = rand(9)+3;
	local X;	
	local Z;
	local Y = ReadRoleValue( Wind, EM_RoleValue_Y );
	local Fx = GetMoveFlagValue( _Global, Site, EM_RoleValue_X )
	local Fz = GetMoveFlagValue( _Global, Site, EM_RoleValue_Z )
	local monster1 = LuaFunc_CreateObjByObj ( 107496 , Wind ) --��
	local monster2 = LuaFunc_CreateObjByObj ( 107496 , Wind ) --��
	local monster3 = LuaFunc_CreateObjByObj ( 107496 , Wind ) --��
	SetModeEx( monster1, EM_SetModeType_Fight, false );	--�L�k���
	SetModeEx( monster1, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( monster1, EM_SetModeType_Strikback , false );	-- ����
	SetModeEx( monster1, EM_SetModeType_Mark , false );	-- �аO
	SetModeEx( monster1, EM_SetModeType_NotShowHPMP, true );--�S�����
	SetModeEx( monster1, EM_SetModeType_Gravity, false )
	SetModeEx( monster1, EM_SetModeType_Show, false )
	SetModeEx( monster1, EM_SetModeType_HideName, true )
	SetModeEx( monster3, EM_SetModeType_Fight, false );	--�L�k���
	SetModeEx( monster3, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( monster3, EM_SetModeType_Strikback , false );	-- ����
	SetModeEx( monster3, EM_SetModeType_Mark , false );	-- �аO
	SetModeEx( monster3, EM_SetModeType_NotShowHPMP, true );--�S�����
	SetModeEx( monster3, EM_SetModeType_Gravity, false )
	SetModeEx( monster3, EM_SetModeType_Show, false )
	SetModeEx( monster3, EM_SetModeType_HideName, true )
	
		SetModeEx( monster2, EM_SetModeType_Fight, false );	--�L�k���
		SetModeEx( monster2, EM_SetModeType_Searchenemy, false );	-- ����
		SetModeEx( monster2, EM_SetModeType_Strikback , false );	-- ����
		SetModeEx( monster2, EM_SetModeType_Mark , false );	-- �аO
		SetModeEx( monster2, EM_SetModeType_NotShowHPMP, true );--�S�����
		SetModeEx( monster2, EM_SetModeType_Gravity, false )
		SetModeEx( monster2, EM_SetModeType_HideName, true )
		
	AddToPartition( monster1, RoomID )
	AddToPartition( monster2, RoomID )
	AddToPartition( monster3, RoomID )
	WriteRoleValue(Wind , EM_RoleValue_Livetime , 15)
	WriteRoleValue(monster1 , EM_RoleValue_Livetime , 15)
	WriteRoleValue(monster2 , EM_RoleValue_Livetime , 15)
	WriteRoleValue(monster3 , EM_RoleValue_Livetime , 15)
	AttachObj(  monster1,Wind, 1, "p_down", "p_name_title" )
	AttachObj(  monster3,monster1, 1, "p_down", "p_name_title" )
	AttachObj(  monster2,monster3, 1, "p_down", "p_name_title" )
	KS_Move( Wind, 30, Fx, Y, Fz );
	WriteRoleValue( Wind, EM_RoleValue_PID, Site )
	sleep(10)
	SysCastSpellLv(monster2,Wind,850498,0)
	local MoveBall = ReadRoleValue( Global , EM_RoleValue_PID )
	local BicoCtrl = ReadRoleValue( MoveBall , EM_RoleValue_Register4 )
	while true do
--		if ReadRoleValue( MoveBall , EM_RoleValue_Register1 ) == 1 or ReadRoleValue( MoveBall , EM_RoleValue_Register1 ) == 3 then  --�o��P�_��ɵ����A�M��R���ۤv
--			WriteRoleValue(Wind , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster1 , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster2 , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster3 , EM_RoleValue_Livetime , 1)
--		end
		--[[if KS_InCombat( Global) ~= true then
			--ks_WaitToDie( 1 );--Time�ɶ�  X���ۤv���ۤv
--			WriteRoleValue(Wind , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster1 , EM_RoleValue_Livetime , 1)
--			WriteRoleValue(monster2 , EM_RoleValue_Livetime , 1)
--			return
--		end--]]
		
		--SysCastSpellLv( Wind, Wind, _Global["SkillID"][4], _Global["Lv"][4] );--�q�y
		SysCastSpellLv(Wind,Wind,850499,0)
		SysCastSpellLv(monster2,monster2,850500,0)		
		X = ReadRoleValue( Wind, EM_RoleValue_X );
		Z = ReadRoleValue( Wind, EM_RoleValue_Z );
		local Dis = math.floor( ( ( X - Fx )^2 +( Z - Fz )^2 )^0.5)
		if Dis <=60 then
			local Array = {};
			for i=1, 9 do
				if i+2 ~= Site then
					table.insert( Array, i+2);
				end
			end
			Site = Array[rand(8)+1];
			WriteRoleValue( Wind, EM_RoleValue_PID, Site )
			Fx = GetMoveFlagValue( _Global, Site, EM_RoleValue_X )
			Fz = GetMoveFlagValue( _Global, Site, EM_RoleValue_Z )
		end
		KS_Move( Wind, 30, Fx, Y, Fz );
		Sleep(10)
	end
end

function Z24_bico_BoxAi()
	local FollowBall 
	local Px
	local Py 
	local Pz 
	local TempGID=TargetID()
		Px = ReadRoleValue( TempGID , EM_RoleValue_X )
		Py = ReadRoleValue( TempGID , EM_RoleValue_Y )
		Pz = ReadRoleValue( TempGID , EM_RoleValue_Z )
		FollowBall = CreateObj( 107417 , Px , Py ,Pz , 0 , 1 )
		SetModeEx( FollowBall , EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( FollowBall , EM_SetModeType_Move, false) ---����	(�_)
		SetModeEx( FollowBall , EM_SetModeType_Searchenemy, false)--����(�_)
		SetModeEx( FollowBall , EM_SetModeType_Mark, false)			---�i�I��(�O)
		SetModeEx( FollowBall , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
		SetModeEx( FollowBall , EM_SetModeType_Fight, false) ---�i���(�O)
		SetModeEx( FollowBall , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��				
		AddToPartition( FollowBall , 0 )
		AddBuff( FollowBall , 623826 ,0 , -1 )
		BeginPlot( FollowBall , "Z24_worldBoss_FireBall" , 0 )
		WriteRoleValue( FollowBall , EM_RoleValue_Livetime, 10 )	
	
end

function Z24_WorldBoss_OnlyBoss()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID) == 107213 then
	return true
	else
	return false
	end
end

function Z24_WorldBoss_OnlyPlayer()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ==1 then
	return true
	else
	return false
	end
end
-----------------------
function Z24_WorldBoss_ScanHateList()--�T�w�C���ˬd����C��
	local Boss=OwnerID();
	while CheckID(Boss)==true and ReadRoleValue(Boss,EM_RoleValue_IsDead)==0 do
		Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
		sleep(10);
	end
end
function Z24_WorldBoss_DeadPlot()--���`�@��:�汵���y�X��
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(Boss);
	local Box=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(Box,EM_SetModeType_Show,false);
	SetModeEx(Box,EM_SetModeType_Mark,false);
	AddToPartition(Box,RoomID);
	Lua_DW_WBGUIDSwitch(1,Box);--�N�@�ɤ������y�з��ಾ�����νc�l�W
	WriteRoleValue(Box,EM_RoleValue_LiveTime,60);
end