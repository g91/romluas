function LuaI_YU_PetSystem_GetEgg_00()    --���_���A���ת��a�@��

	local ID = OwnerID()--�ѹ�
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local stime = 10
	SetModeEx( ID , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( ID , EM_SetModeType_Obstruct, false )--����
	SetModeEx( ID  , EM_SetModeType_Strikback, false )--����
	SetModeEx( ID , EM_SetModeType_Searchenemy, false )--����
--	MoveToflagEnabled( ID , false )
	WriteRoleValue( ID,EM_RoleValue_IsWalk ,0)--�ζ]��
	SetModeEx( ID  , EM_SetModeType_Move, true )--����

	Beginplot( ID ,"LuaYU_TakePetEGG_00", 0 )--�d�򤺦������h�Q���C

	while true do 
		local P = 100			--���d���a�Z��	�F�ӫ�	�H������
		local XX = Rand( P )    

		if XX < 30 then
			XX = 30
		end

		local Player = SearchRangePlayer( ID , XX ) --�P�_����O�_�����a
		local PetPID = ReadRoleValue( ID , EM_RoleValue_PID  ) --�Ӧѹ��O�_�w�Q�����O���F���a��ID

		if (PetPID>0) then
			break
		elseIf CheckID( Player[0] ) == true then	--�p�G����XX�������a

			local M = 60		--�����a�h���ʤ��Z��
			local ZZ = Rand( M )    
			if ZZ < 20 then
				ZZ = 20
			end

			AdjustFaceDir(ID, Player[0] , 180 ) --���V �I��
--			WriteRoleValue( ID  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
			sleep(5)
			local Dis = ZZ	
			Lua_MoveLine( ID , Dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
			sleep(stime)
		end
		sleep(stime)
	end
end

function LuaYU_TakePetEGG_00() --�ѹ��Q���@��
	local ID = OwnerID()--�ѹ�
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local stime = 5

	while true do 

		local Trap = LuaFunc_SearchNPCbyOrgID( ID, 103565, 15 , 1)       --���y����

		If (CheckID( Trap[0] ) == true) then	--�p�G����15��������
			local N = 10		--�Y���񦳳����A30%���v�{�פ��C <---����i�@�� �������_���A�{�ײv�����C
			local YY = Rand( N )    

			local Mark = ReadRoleValue( Trap[0] , EM_RoleValue_Register)--�Ӭ��y�����O�_�����ǤF
			if Mark == 0 then
				if YY >=3 then
					local PlayerID = ReadRoleValue( Trap[0] , EM_RoleValue_PID  ) --��������"���a"ID
					local OwnerX = ReadRoleValue( Trap[0] , EM_RoleValue_X ) 
					local OwnerY = ReadRoleValue( Trap[0] , EM_RoleValue_Y ) 
					local OwnerZ = ReadRoleValue( Trap[0] , EM_RoleValue_Z ) 
					local OwnerDIR = ReadRoleValue( Trap[0] , EM_RoleValue_Dir ) 
					OwnerDIR = OwnerDIR+180
					SetPos( ID, OwnerX, OwnerY , OwnerZ , OwnerDIR )--�N�өǶǰe�쳴���B
--					SetModeEx( ID , EM_SetModeType_Mark, true )--�аO
--					SetModeEx( ID  , EM_SetModeType_HideName, false )--�W��
--					SetModeEx( ID , EM_SetModeType_ShowRoleHead, true )--�Y����
					SetModeEx( ID , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( ID  , EM_SetModeType_Move, false )--����
					SetModeEx( ID , EM_SetModeType_Obstruct, false )--����
					SetModeEx( ID  , EM_SetModeType_Strikback, false )--����
					SetModeEx( ID , EM_SetModeType_DisableRotate, true )--����V
					SetModeEx( ID , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( ID , EM_SetModeType_NotShowHPMP, true )--����ܦ��
			--		PlayMotion( Trap[0] , 12) --deadth ���������ʧ@
					WriteRoleValue( Trap[0]  ,EM_RoleValue_Register , 110  )--���O���A�ӳ����w�������y��
					WriteRoleValue( ID , EM_RoleValue_PID, PlayerID ) --���ѹ��O���a
					WriteRoleValue( ID , EM_RoleValue_Register+2, Trap[0] ) --���ѹ��O����
					If (CheckID(PlayerID) == true) then
						ScriptMessage( PlayerID , PlayerID , 2 , "[SC_PETSYS_34]" , "0xff00ffff" )--�Ӧn�F�I���\����F[103567]�I
						ScriptMessage( PlayerID , PlayerID , 0 , "[SC_PETSYS_34]" , "0xff00ffff" )

						SetPlot( OwnerID(),"touch","LuaYU_TakePetEGG_01",30 )
					end
					Beginplot( ID ,"LuaYU_TakePetEGG_03", 0 )--�۳Q�x��_�A60���A�۰ʱò�C
					break
				else										--�d���o�{�������A�O�]
					AddBuff( ID ,503141 ,1 ,3 )--��Y
					AdjustFaceDir(ID, Trap[0] , 180 ) --���V �I��
--					WriteRoleValue( ID  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
					local Dis = 50	
					Lua_MoveLine( ID , Dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
				end
			end
		end
		sleep(stime)
	end
end


function LuaYU_TakePetEGG_01() --Ĳ�I�@���A���a���J
--OwnerID() --���a
--TargetID() --�ѹ�

	local PlayerID = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) --"���a"ID
	local play =  CheckFlag( PlayerID , 542570 ) --�O�_�ѻP�L�K�O�m��
	local FreeEgg =  CheckFlag( PlayerID , 542573 ) --�Ĥ@���K�O�J

	if (PlayerID ~= OwnerID()) then --�I�������̫D�ӳ����Ҧ���
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_62]" , 0 )--�A���O�Ӭ��y�������]�m�̡A�L�k�Ѱ����C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_62]" , 0 )
		return
	elseif (PlayerID == OwnerID()) then
		SetPlot( TargetID(),"touch","",0 )
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
		local ZoneID = Zone-1000*math.floor( Zone/1000 )
		local PetEggLv	 --�d���J����
		-- 2013.03.11 ���E�G(5.0.10)�վ�U�ϰ쮷�����_�d���J�ɪ��H�����Ű϶�
		local Player = OwnerID()		
		local PetLvRange = {	[1] = 7 ,	-- Zone ID , ���_�d��(�d���J)���ͮɪ������H���϶��C
					[2] = 14 , 	-- Zone 2�A���_�d�����ͮɪ������H���϶��� 1 ~ 14
					[3] = 33 ,
					[4] = 20 ,
					[5] = 27 ,
					[6] = 33 ,
					[7] = 34 ,
					[8] = 36 ,
					[9] = 36 ,
					[10] = 14 ,
					[11] = 23 ,
					[12] = 6 ,
					[13] = 28 ,
					[14] = 33 ,
					[15] = 38 ,
					[16] = 38 ,
					[17] = 40 ,
					[18] = 41 ,
					[19] = 43 ,
					[20] = 44 ,
					[21] = 46 ,
					[22] = 50 ,
					[23] = 50 ,
					[24] = 51 ,
					[25] = 53 ,
					[26] = 54 ,
					[27] = 56 ,
					[28] = 58 ,
					[29] = 60 ,
					[30] = 61 ,
					[31] = 6 ,
					[32] = 63 ,
					[33] = 64 ,
					[34] = 66	}

		if play == true and FreeEgg == false and ZoneID == 304 then	--���a��̩Ԫ����A�B��������L�K�O���d���J
			PetEggLv = 5
		elseif PetLvRange[Zone] ~= nil then	-- ��e Zone �ݩ� PetLvRange ���w�q�� Zone �ɰ���
			PetEggLv = Math.random(PetLvRange[Zone])
			DebugMsg( Player , RoomID , "Zone = "..ZoneID.." , MaxLv = "..PetLvRange[Zone].." , EggLv = "..PetEggLv )
		else	-- ��e Zone ���ݩ� PetLvRange ���w�q������ Zone �ɰ���
			local MaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- Ū���Ӧ��A����e�]�w�n�����a�̰�����
			PetEggLv = Math.random( Math.floor( MaxLv*(2/3) ) )	-- �d���J���� = (���a�̰�����*2/3)�����
			DebugMsg( Player , RoomID , "Zone = "..ZoneID.." , MaxLv = "..MaxLv.." , EggLv = "..PetEggLv )
		end
		-- 2013.03.11 ���E�G�H�W�������ק諸����
	-----------------------�H�U���F�զX�X �d���J �m�J��ID�n------------------------------

		local Egg = { }
		Egg[0] = {204476,204477,204478,204479,204480,204481}	--�����_���J		
		Egg[1] = {204482,204483,204484,204485,204486,204487}	--�����_���J2	
		Egg[2] = {204488,204489,204490,204491,204492,204493}	--�_���_���J	
		Egg[3] = {204506,204507,204508}			--�Ť��_���J		
		Egg[4] = {204494,204495,204496,204497,204498,204499}	--�_���_���J2	
		Egg[5] = {204500,204501,204502,204503,204504,204505}	--�t���_���J	

		local MouseOrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --�өǦb��Ʈw���Τ@ID
		local RareEgg = 0 --�J�������ܼ�
		local EggItem = 0 --�J���ƦC��m

		if (MouseOrgID==103566) then --�Ħ⩬�_��
			RareEgg = Rand( 4 )    
			local RuneEggRand = Rand( 100 )    

			if RareEgg == 3 then
				if (RuneEggRand >=30) and (RuneEggRand <100) then 			--70%
					EggItem = 2
				elseif (RuneEggRand >=5) and (RuneEggRand <30) then 		--25%
					EggItem = 3
				else									--5%
					EggItem = 1
				end
			else
				EggItem = rand(table.getn(Egg[RareEgg]))+1
			end

		elseif (MouseOrgID==103567) then --���⩬�_��
			RareEgg = Rand( 6 )    
			if RareEgg < 2 then
				RareEgg = 3
			end

			local RuneEggRand = Rand( 100 )    

			if RareEgg == 3 then
				if (RuneEggRand >=30) and (RuneEggRand <100) then 			--70%
					EggItem = 2
				elseif (RuneEggRand >=5) and (RuneEggRand <30) then 		--25%
					EggItem = 3
				else									--5%
					EggItem = 1
				end
			else
				EggItem = rand(table.getn(Egg[RareEgg]))+1
			end

		end	


	-----------------------�H�U���F�զX�X �d���J �]�t�� �d��OrgID------------------------------

		local Pets = { }--***************************************�@��ϰ���d��***************************************--
		Pets[0] = {103610,103611,103612,103613,103614,103615,103616,103617,103618,103619,
		                    103622,103629,103624,103630,103642,103628,103710,103693,103694,103695,
		                    103691,103636,103660,103668}									--�@������d
		Pets[1] = {103622,103624,103625,103626,103627,103628}							--Zone1
		Pets[2] = {103629,103630,103631,103632,103633,103634}							--Zone2
		Pets[3] = {103635,103636,103637}										--Zone3
		Pets[4] = {103642,103643,103644,103645}									--Zone4
		Pets[5] = {103649,103650,103651,103652}									--Zone5
		Pets[6] = {103657,103658,103659,103660,103661}								--Zone6
		Pets[7] = {103666,103667,103668,103669,103670,103671,103672}						--Zone7
		Pets[8] = {103676,103677,103678,103679}									--Zone8
		Pets[9] = {103684,103685,103686,103687}									--Zone9
		Pets[10] = {103691,103692,103693,103694,103695}								--Zone10
		Pets[11] = {103697,103698,103699,103701,103700}								--Zone11
		Pets[12] = {103706,103707,103708,103709,103710}								--Zone12

		local ElitePets = { }--***************************************�}���ϰ���d��***************************************--
		ElitePets[0] = {103620,103621,103718,103719,103720,103721,103722,103723,103724,103725,103726,
			            103711,103681,103713,103696,103623 }								--�}�������d
		ElitePets[1] = {103623}												--Zone1
		ElitePets[2] = {103717}												--Zone2
		ElitePets[3] = {103639,103640,103638}										--Zone3
		ElitePets[4] = {103646,103647,103648}										--Zone4
		ElitePets[5] = {103653,103654,103655,103656}									--Zone5
		ElitePets[6] = {103662,103663,103664,103665}									--Zone6
		ElitePets[7] = {103673,103674,103675}										--Zone7
		ElitePets[8] = {103680,103681,103682,103683}									--Zone8
		ElitePets[9] = {103690}												--Zone9
		ElitePets[10] = {103696}												--Zone10
		ElitePets[11] = {103702,103703}											--Zone11
		ElitePets[12] = {103711,103712,103713}										--Zone12

		local RunePets = {103714,103715,103716}--�Ť��d��

		local PGroup = Rand( 100 )    
		local PetNpcGroup = 0		--�d�������G�@������d(1)/�}�������d(2)/�@��ϰ��d(3)/�}���ϰ��d(4)/�Ť��d(5)
		local PetSet= 0			--�Ӹs���d���J����m
		local PetOrgID= 0		--�d��ID

		if RareEgg == 3 then		--�������d���J���G�Ť��_���J
			PetNpcGroup = 5		--�Ť��d(5)

		elseif (ZoneID > 12) then		--12�Ϥ���s�}���ϰ�
			if (PGroup >= 10)  and  (PGroup < 100) then		--80%
				PetNpcGroup = 1	--�@������d(1)
			else						--10%
				PetNpcGroup = 2	--�}�������d(2)
			end

		elseif (PGroup >= 50)  and  (PGroup < 100) then		--50%
			PetNpcGroup = 1		--�@������d(1)

		elseif (PGroup >= 20)  and  (PGroup < 50) then		--30%
			PetNpcGroup = 3		--�@��ϰ��d(3)

		elseif (PGroup >= 10)  and  (PGroup < 20) then		--10%
			PetNpcGroup = 2		--�}�������d(2)
		else							--10%
			PetNpcGroup = 4		--�}���ϰ��d(4)
		end

		if PetNpcGroup == 1 then				--�@������d(1)
			PetSet = rand(table.getn(Pets[0]))+1
			PetOrgID = Pets[0][PetSet]
		elseif PetNpcGroup == 2 then			--�}�������d(2)
			PetSet = rand(table.getn(ElitePets[0]))+1
			PetOrgID = ElitePets[0][PetSet]
		elseif PetNpcGroup == 3 then			--�@��ϰ��d(3)
			PetSet = rand(table.getn(Pets[ZoneID]))+1
			PetOrgID = Pets[ZoneID][PetSet]
		elseif PetNpcGroup == 4 then			--�}���ϰ��d(4)
			PetSet = rand(table.getn(ElitePets[ZoneID]))+1
			PetOrgID = ElitePets[ZoneID][PetSet]
		else						--�Ť��d(5)
			PetSet = rand(table.getn(RunePets))+1
			PetOrgID = RunePets[PetSet]
		end

		if PlayerID == OwnerID() then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_35]" , "0xff00ffff" )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_35]" , "0xff00ffff" )

			local LvAddRange = math.ceil(2+(0.3*PetEggLv))--�L����i��A�����
			local TotalLvAdd = LvAddRange*2

			if ( play == true ) and ( FreeEgg == false ) and (ZoneID == 304) then--����o�L�K�O�J�A�ӥB���a���B��̩Ԫ���
				GiveItem_Pet( OwnerID()   , 204509 , 1 , LvAddRange ,    TotalLvAdd   , 103714 ); 
				SetFlag( OwnerID() , 542573 , 1 ) -- ��o�Ĥ@���K�O�J
			else
				GiveItem_Pet( OwnerID()   , Egg[RareEgg][EggItem] , PetEggLv , LvAddRange ,    TotalLvAdd   , PetOrgID ); 
		--bool		GiveItem_Pet( int GItemID ,      int ItemOrgID          ,    int Lv   ,    int Range   , MaxTotalPoint , int NpcOrgID ); 
		--�@�@�@�@�@�@�@     �@�@	              ����                 �JID                        ����         �ݩʼW�T     �W�T�`�M�W��         �d��ID
			end
			Beginplot( TargetID() ,"LuaYU_TakePetEGG_02", 0 )--�۳Q�x��_�A60���A�۰ʱò�C

		end

	--TargetID()   �ѹ�
	--OwnerID()   ���a
	end
end

function LuaYU_TakePetEGG_02() --���_���ò�
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --"���a"ID
	local Trap = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --"����"ID
	Delobj(Trap)
--	sleep(10)
	PlayMotion( OwnerID() , 161) --�ѹ����D�ò�
	sleep(20)
	Delobj(OwnerID())
end

function LuaYU_TakePetEGG_03() --�۳Q�x��_�A60���A�۰ʱò�C
	local Trap = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --"����"ID
	PlayMotion( Trap , 12) --deadth ���������ʧ@
	PlayMotion( OwnerID() , 21) --�ä㪺�ʧ@ -- 
	sleep(600)
	Beginplot( OwnerID() ,"LuaYU_TakePetEGG_03_2", 0 )
end

function LuaYU_TakePetEGG_03_2() --���_���ò�
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --"���a"ID
	local Trap = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --"����"ID
	Delobj(Trap)
--	sleep(10)
	PlayMotion( OwnerID() , 161) --�ѹ����D�ò�
	ScriptMessage( OwnerID() , 0 , 2 , "[SC_PETSYS_36]" , "0xff00ffff" )
	ScriptMessage( OwnerID() , 0 , 0 , "[SC_PETSYS_36]" , "0xff00ffff" )
	sleep(20)
	Delobj(OwnerID())
end

function LuaI_YU_PetSystem_GetEgg_01(Option)    --���a�w�˳����@��
	local ID = OwnerID()
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)

	if ( Option == "CHECK" ) then
		local BuffType = 0
		local Count = BuffCount (ID)
		for i = 0 , Count do
			local BuffID = BuffInfo (ID, i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end
		if BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�
			ScriptMessage(ID,ID, 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false
		else
			return true
		end
	elseif ( Option == "USE" ) then
		BeginPlot( ID , "LuaI_YU_PetSystem_GetEgg_02" , 0 )  
	end

end

function LuaI_YU_PetSystem_GetEgg_02() --�w�˳���
	local ID = OwnerID() --���a
	-- 2013.03.11 ���E�G���K�Q���աA�w�վ㬰�������_�d���_��(204512)�ίS��@��Ĳ�o�_��(203477)�ɡA�L��Ū��A�ϥΫ᪺�I�k�ɶ������o�C
	local Item = { 204512 , 203477 }
	local Sec = 15
	for i = 1 , #Item , 1 do
		if CountBodyItem( ID , Item[i] ) > 0 then
			Sec = 0
			break
		end
	end		

	if BeginCastBarEvent( ID, ID,"[SC_YU_GUILDWAR_BUILD_13]", Sec , ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaI_YU_PetSystem_GetEgg_03" ) ~= 1 then
		ScriptMessage( ID, ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	end
end

function LuaI_YU_PetSystem_GetEgg_03(ObjID,CheckStatus)--��˦w�˳���

	local ID = OwnerID() --���a
	if ( CheckStatus ~= 0 ) then
		if ( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( ID, CheckStatus );

			local RoomID = ReadRoleValue( ID ,EM_RoleValue_RoomID) 

			local OwnerX = ReadRoleValue( ID , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( ID , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( ID , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( ID , EM_RoleValue_Dir ) 
			OwnerY = OwnerY+15

			local StageNpc = CreateObj( 103565 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1) --100989 ������ NPC  �����ʧ@�G���` 13
			AddToPartition( StageNpc , RoomID )  
			WriteRoleValue( StageNpc , EM_RoleValue_PID, ID ) --�O���a

			SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
			SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
			SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
			SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
			SetModeEx( StageNpc , EM_SetModeType_DisableRotate, true )--����V
			SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--����ܦ��
			BeginPlot( ID , "LuaYU_PetSystem_TrapOFF" , 0 )  
			BeginPlot( StageNpc , "LuaYU_PetSystem_TrapDead" , 0 )  
		else
			-- ����
			EndCastBar( ID, CheckStatus );
		end
	end
end

function LuaYU_PetSystem_TrapOFF() --�G�m����
	local ID = OwnerID() --���a
	DelBodyItem( ID , 206776 , 1 )
end

function LuaYU_PetSystem_TrapDead() --����60������
	sleep(600)
	local Mark = ReadRoleValue( OwnerID() , EM_RoleValue_Register)--�Ӭ��y�����O�_�����ǤF
	if Mark == 0 then--�S������
		DelObj(OwnerID())
	end
end