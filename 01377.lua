--Hsiang_PetLootTreasure  �d���۰ʾ��_  script�s���G700533
--event_module  ���a/NPC ���`�@��  script�s���G701584
function CultivatePet_AutoPlot( )--�d���l��ɪ�l�P�_

--OwnerID()  �d��
--TargetID()  �D�H

--ReadPetValue( GItemID , PetPos , ValueType )    Ū���d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�)
--WritePetValue( GItemID , PetPos , ValueType , Value )  �g�J�d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�,�g�J��)
--AddPetValue( GItemID , PetPos , ValueType , Value )  �[�g�J�d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�,�g�J��)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Mode = -1
	local ModePet = -1
	local PetSayTime = 60
	local PetEvent = 10

	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--����

	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+7 , 0  ) --�����LZONE �d�������_�\�ॢ�Ī����D�C

	for i = 0,5 do

		Mode = ReadPetValue( TargetID(), i ,EM_CultivatePetStructValueType_EventType ) --�d�����A(���Q�l��(2)�B���b�Ȧ�(4)�B���b�Ͳ�(8)...etc)

		if Mode == 2 then
			ModePet = i	--�g�Ji�����b�l��X�Ӫ��d�����Ǹ�
		end
	end
		
	local PetType = ReadPetValue( TargetID(), ModePet ,EM_CultivatePetStructValueType_Property ) --�d���ݩ�   -1�L 0�a�B1���B2���B3���B4���B5�t
	local PetLv = ReadPetValue( TargetID(), ModePet ,EM_CultivatePetStructValueType_Lv )--Ū���d���J����

PetType = 1 --�]���ثe�u���@���d�����ܡA�L���ݩ�
	local Hunger = ReadPetValue( TargetID(), ModePet ,EM_CultivatePetStructValueType_Hunger )--������
	local PetHelp = 0
	if (Hunger >= 80) then
		PetHelp = 100
	elseif (Hunger >= 60) and (Hunger < 80) then
		PetHelp = 80
	elseif (Hunger >= 40) and (Hunger < 60) then
		PetHelp = 60
	elseif (Hunger >= 20) and (Hunger < 40) then
		PetHelp = 40
	elseif (Hunger >= 0) and (Hunger < 20) then
		PetHelp = 20
	end
	local PetStr = "[SC_PETSYS_75][$SETVAR1="..PetHelp.."]" -- �l�ꦨ�\�A���U�OX%
	ScriptMessage( TargetID() , TargetID() , 1 , PetStr , "0xff00ffff" )
	ScriptMessage( TargetID() , TargetID() , 0 , PetStr , "0xff00ffff" )

	local Master_Lv = ReadRoleValue( TargetID() , EM_RoleValue_LV )--Ū���D�H����
	WriteRoleValue(  OwnerID() , EM_RoleValue_LV , Master_Lv  ) --�d�������Y�Ƶ���D�H����

	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+9 , ModePet  ) --���d���O��L�O�ĴX��
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+6 , 1010  ) --�O����NPC���d��(����jP�d���A�d�����`�]�X�óJ��)
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+8 , TargetID()  ) --���d���O��L���D�H
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+3 , PetSayTime  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+4 , PetEvent  ) --�ѼơA���d��10�����Y��@���O�_�o�ͨƥ�A�Y���o�ͨƥ�F�A�h�j���@�p�ɫ�~��A�Y
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+1 , PetHelp  ) --�O���d���ثe�����U�O( �w�i�D�L���a�F )

	AddBuff( OwnerID() ,505517 ,85 ,-1 )--�QNPC�����ˮ`���
	AddBuff( OwnerID() ,505921 ,85 ,-1 )--�Q���a�����ˮ`���
	AddBuff( OwnerID() , 503480 , 0 , -1 ) -- 2012.03.08 �s�W�Ҧ��d��ˮ`�L��

	local ScalePet = math.ceil(PetLv/20)--�L����i��A�����

--	Say( TargetID() , "ScalePet="..ScalePet)
	ScalePet = 0.5+ScalePet/10

	if ScalePet >= 0.8 then
		ScalePet = 0.8
	end

--	Say( TargetID() , "ScalePet_2="..ScalePet)
	SetModelScale( OwnerID() , ScalePet ) --SetModelScale( Ownerid(),�Y���� ) 
--	Say( OwnerID(),"What's Pet="..ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  ))

	local Loyal = ReadPetValue( TargetID(), ModePet ,EM_CultivatePetStructValueType_Loyal )--���۫� �ĤG�ѼƬ��ĴX���d
--	Say( OwnerID() , "Loyal="..Loyal)

	sleep(10)

	YU_PetAI_CallAiFun( PetType , PetLv )--�}�l����AI
end

function YU_PetAI_CallAiFun( PetType , PetLv )
	YU_PetAI[PetType]( PetLv );	
end

function Init_YU_PetAI_List() --�d������CALL "function" (�d��AI)

	YU_PetAI ={}

	YU_PetAI[0] = Fun_YU_PetAI_00		--�L�ݩ�
	YU_PetAI[1] = Fun_YU_PetAI_00		--�a�ݩ�
	YU_PetAI[2] = Fun_YU_PetAI_00		--���ݩ�
	YU_PetAI[3] = Fun_YU_PetAI_00		--���ݩ�
	YU_PetAI[4] = Fun_YU_PetAI_00		--���ݩ�
	YU_PetAI[5] = Fun_YU_PetAI_00		--���ݩ�
	YU_PetAI[6] = Fun_YU_PetAI_00		--�t�ݩ�
end

function Fun_YU_PetAI_00( Lv )--�L�ݩ�
	local ThePet = OwnerID()	--�d��
	local Master = TargetID()	--�D�H
	local SleepTime = 10 
	local idelTime = 20 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local PetSayTime = 60

	local TrickKEY =  CountBodyItem( Master , 204226 ) --�d���r�ġA�������~�A��D�H�i�J�԰��ɡA�d�����ѾԡC

	BeginPlot( ThePet , "Fun_YU_Pet_GettingHunger_00" , 0 )    --�d���Q�l��A�}�Ҧ۵M�����פU���@�� �����G200 / ���۫�+50  (�C10��U���@��)

--	Say( OwnerID() , "Func0 LV= " .. Lv );

	SetModeEx( ThePet , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( ThePet  , EM_SetModeType_Strikback, false )--����
	SetModeEx( ThePet , EM_SetModeType_Searchenemy, false )--����

	local ModePet = ReadRoleValue( ThePet,  EM_RoleValue_Register+9  )--�ĴX���d��
	local PetType = ReadPetValue( Master, ModePet ,EM_CultivatePetStructValueType_Property ) --�d���ݩ�   -1�L 0�a�B1���B2���B3���B4���B5�t�AŪ���̭n���D�H
--Say(ThePet,"PetType="..PetType)
--Say(ThePet,"ModePet="..ModePet)
	sleep(15)
	BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_Start" , 0 )    --��l�ꤧ�ݭԻy
	sleep(15)
	while true do
	sleep(SleepTime)	
		local P_Count = ReadRoleValue( ThePet,  EM_RoleValue_Register+3  )--�ѼơA���d��60��~����@�Ӹ��D/����
		local Loyal = ReadPetValue( Master, ModePet ,EM_CultivatePetStructValueType_Loyal )--���۫� �ĤG�ѼƬ��ĴX���d�AŪ���̭n���D�H
		local Hunger = ReadPetValue( Master, ModePet ,EM_CultivatePetStructValueType_Hunger )--������
		local MasterIsAttack = ReadRoleValue(Master ,EM_RoleValue_IsAttackMode  )--�D�H�B��԰��Ҧ� 0 �D�԰��A 1 �԰���
		local PetIsAttack = ReadRoleValue(ThePet ,EM_RoleValue_IsAttackMode  )--�d���B��԰��Ҧ� 0 �D�԰��A 1 �԰���
		local AttackTarget = ReadRoleValue( Master , EM_RoleValue_AttackTargetID )
		local AutoTreasures = ReadRoleValue( ThePet ,EM_RoleValue_Register+7) --���d���O�_�w�}�_�۰ʾ��_�\��
		if (CheckBuff( Master , 503479 ) == true) and (AutoTreasures ~= 530) then
			BeginPlot( ThePet , "Hsiang_PetLootTreasure" , 0 )    --�d���۰ʾ��_�@��
			WriteRoleValue(  ThePet , EM_RoleValue_Register+7 , 530  ) --�O�����d���}�Ҧ۰ʾ��_�\��
		elseif (CheckBuff( Master , 503479 ) == FALSE ) and (AutoTreasures == 530) then
			WriteRoleValue(  ThePet , EM_RoleValue_Register+7 , 0  ) --�O�����d�������۰ʾ��_�\��
		end
--DebugMsg( 0, RoomID ,"PetIsAttack="..PetIsAttack)
		local P = 30
		local PetSay = Rand( P )      
--DebugMsg( 0, RoomID ,"Loyal="..Loyal)
--DebugMsg( 0, RoomID ,"Hunger="..Hunger)
--DebugMsg( 0, RoomID ,"MasterIsAttack="..MasterIsAttack)
--DebugMsg( 0, RoomID ,"PetIsAttack="..PetIsAttack)
--DebugMsg( 0, RoomID ,"P_Count="..P_Count)

		if (ReadRoleValue( Master , EM_RoleValue_IsDead ) == 1 ) then	--�p�G���a��¼¼�A�d���]�O�Q��...
			SetModeEx( ThePet , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( ThePet  , EM_SetModeType_Strikback, false )--����
			SetModeEx( ThePet , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( ThePet  , EM_SetModeType_Move, false )--����
			SetModeEx( ThePet , EM_SetModeType_DisableRotate, true )--����V
			SetModeEx( ThePet , EM_SetModeType_NotShowHPMP, true )--����ܦ��
			PlayMotion( ThePet , 12)--���`�ʧ@
			BeginPlot( ThePet , "YU_MasterPet_dead" , 0 )--�����d��
			break
		elseif MasterIsAttack == 0 then--�D�H�D�԰���
			SetModeEx( ThePet , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( ThePet  , EM_SetModeType_Strikback, false )--����
			SetModeEx( ThePet , EM_SetModeType_Searchenemy, false )--����
			if P_Count == 0 then
				if (Hunger < 40) then

					if (PetSay == 1) then --�C�� 1/30 �����v����
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_Hunger" , 0 )--�d���{�l�j
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
					end

				elseif (Hunger >= 40) then
					if (PetSay == 1) then --�C�� 1/30 �����v����
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_Pop" , 0 )--�D�H�D�԰��d���S�ư�
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
					end
				end
			else
				AddRoleValue(  ThePet , EM_RoleValue_Register+3 , -1  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
			end
		elseif (MasterIsAttack == 1) and (PetIsAttack == 0) then--�D�H�԰����A�d���|���ѻP
			if (P_Count == 0) or (P_Count == 30) then
				if (TrickKEY > 0) then --�d���r�ġA�������~�A��D�H�i�J�԰��ɡA�d�����ѾԡC

					SetModeEx( ThePet , EM_SetModeType_Fight , true )--�i�������
					SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--����
					SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--����
					BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
					SetAttack( ThePet , AttackTarget ) --��§���  
					WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
					WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --�O���d���ثe�������ؼ�
					BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--�ؼЬO���O���F

				elseif (PetSay == 1) then --�C�� 1/30 �����v����
					BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_Fight" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����

				elseif (Loyal <= 75) and (Loyal > 60) then --�d�����۫�60~75
					local F = 100
					local YY = Rand( F )    

					if YY >= 0 and YY < 5 then   --5%���v�Ѿ�
						SetModeEx( ThePet , EM_SetModeType_Fight , true )--�i�������
						SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--����
						SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--����
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
						SetAttack( ThePet , AttackTarget ) --��§���  
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
						WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --�O���d���ثe�������ؼ�
						BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--�ؼЬO���O���F
					end
				elseif (Loyal <= 90) and (Loyal > 75) then --�d�����۫�75~90
					local F = 100
					local YY = Rand( F )      

					if YY >= 90 and YY < 100 then   --10%���v�Ѿ�
						SetModeEx( ThePet , EM_SetModeType_Fight , true )--�i�������
						SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--����
						SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--����
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
						SetAttack( ThePet , AttackTarget ) --��§���  
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
						WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --�O���d���ثe�������ؼ�
						BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--�ؼЬO���O���F
					end
				elseif (Loyal <= 100) and (Loyal > 90) then --�d�����۫�90~100
					local F = 100
					local YY = Rand( F )      

					if YY >= 70 and YY < 85 then   --15%���v�Ѿ�
						SetModeEx( ThePet , EM_SetModeType_Fight , true )--�i�������
						SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--����
						SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--����
						BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
						SetAttack( ThePet , AttackTarget ) --��§���  
						WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
						WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --�O���d���ثe�������ؼ�
						BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--�ؼЬO���O���F
					end
				end
			elseif (TrickKEY > 0) then --�d���r�ġA�������~�A��D�H�i�J�԰��ɡA�d�����ѾԡC

				SetModeEx( ThePet , EM_SetModeType_Fight , true )--�i�������
				SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--����
				SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--����
				BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )  
				SetAttack( ThePet , AttackTarget ) --��§���  
				WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
				WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --�O���d���ثe�������ؼ�
				BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--�ؼЬO���O���F

			else
				AddRoleValue(  ThePet , EM_RoleValue_Register+3 , -1  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
			end
		elseif (MasterIsAttack == 1) and (PetIsAttack == 1) then--�D�H�԰����A�d���԰���
			local TheTarget = ReadRoleValue(ThePet ,EM_RoleValue_Register+2  )--�d���ѻP�԰��ᤧ�ؼ�

			if (TheTarget == 0) then
				sleep(15)
				local AttackTarget = ReadRoleValue( Master , EM_RoleValue_AttackTargetID )
				SetModeEx( ThePet , EM_SetModeType_Fight , true )--�i�������
				SetModeEx( ThePet  , EM_SetModeType_Strikback, true )--����
				SetModeEx( ThePet , EM_SetModeType_Searchenemy, true )--����
				SetAttack( ThePet , AttackTarget ) --��§���  
				WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , 60  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
				WriteRoleValue(  ThePet , EM_RoleValue_Register+2 , AttackTarget  ) --�O���d���ثe�������ؼ�
				BeginPlot( ThePet , "YU_AttackTarget_isDead_00" , 0 )--�ؼЬO���O���F
			
			elseif P_Count == 0 then
				if (PetSay == 1) then --�C�� 1/30 �����v����
					BeginPlot( ThePet , "Fun_YU_PetAI_ToSay_PetFight" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+3 , PetSayTime  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
				end
			else
				AddRoleValue(  ThePet , EM_RoleValue_Register+3 , -1  ) --�ѼơA���d��60��~����@�Өƥ�/���D/����
			end
		end
	end

end

function YU_AttackTarget_isDead_00()								--�P�_ �d�� �ѾԮɩҿ�w���ؼЬO�_�w��
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	while true do
	sleep(10)
		local TheTarget = ReadRoleValue(OwnerID() ,EM_RoleValue_Register+2  )--�d���ѻP�԰��ᤧ�ؼ�
		local TargetIsDead = ReadRoleValue( TheTarget , EM_RoleValue_IsDead )

		if (TargetIsDead == 1) or (CheckID(TheTarget) == FALSE) or (TheTarget==0) then --���ѾԪ��ؼФw��
--DebugMsg( 0, RoomID ,"TheTarget is dead")
--DebugMsg( 0, RoomID ,"TheTarget = "..TheTarget)
--DebugMsg( 0, RoomID ,"TargetIsDead = "..TargetIsDead)

			SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
			SetStopAttack( OwnerID() )  --�������
			WriteRoleValue(  OwnerID() , EM_RoleValue_Register+2 , 0  ) --�M�ŧ����ؼ�
			break
		end
	end
end

function Fun_YU_Pet_GettingHunger_00( ) -- �d�������צ۵M�U��   �����G200 / ���۫�+50  (�C10��U���@��)

	local ThePet = OwnerID()	--�d��
	local Player = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+8  )--�D�H
	local ModePet = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  )--�ĴX���d��
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local SleepTime = 6000 --10����
	local PerHunger = 250 --�C10�����T�w�U���q

	local Trick =  CountBodyItem( Player , 203477 ) --�S��@��Ĳ�o�_�͡A�����_�͡A�ƥ�o���W�v�令30���ˬd�@���A�ƥ�o�;��v�q15%�W�[��50%
	if Trick > 0 then
		SleepTime = 300
		PerHunger = 1
	end

	while true do
		sleep(SleepTime)	
		local Hunger = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Hunger )--������
		local P_Event = ReadRoleValue( ThePet,  EM_RoleValue_Register+4 ) --�ѼơA���d��10�����Y��@���O�_�o�ͨƥ�A�Y���o�ͨƥ�F�A�h�j���@�p�ɫ�~��A�Y
		local Loyal = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Loyal )--���۫�
		local GetHunger = math.ceil(PerHunger/(Loyal+50))--�L����i��A�����
		local PetHelpSay = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+1  )--�d���ثe�w�i�D�L���a�����U�O�ĪG

		if (Hunger-GetHunger) < 0 then
			WritePetValue( Player , ModePet , EM_CultivatePetStructValueType_Hunger , 0 )  
		else
			AddPetValue( Player , ModePet , EM_CultivatePetStructValueType_Hunger , -GetHunger )  
		end

		Hunger = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Hunger )--������

		local PetHelp = 0
		if (Hunger >= 80) then
			PetHelp = 100
		elseif (Hunger >= 60) and (Hunger < 80) then
			PetHelp = 80
		elseif (Hunger >= 40) and (Hunger < 60) then
			PetHelp = 60
		elseif (Hunger >= 20) and (Hunger < 40) then
			PetHelp = 40
		elseif (Hunger >= 0) and (Hunger < 20) then
			PetHelp = 20
		end
	
		if (PetHelpSay ~= PetHelp) then

			if (Hunger >= 80) then
				local PetStr = "[SC_PETSYS_76][$SETVAR1="..PetHelp.."]" -- ���U�OX%
				ScriptMessage( Player , Player , 1 , PetStr , "0xff00ffff" )
				ScriptMessage( Player , Player , 0 , PetStr , "0xff00ffff" )
			elseif (Hunger >= 60) and (Hunger < 80) then
				local PetStr = "[SC_PETSYS_77][$SETVAR1="..PetHelp.."]" -- ���U�OX%
				ScriptMessage( Player , Player , 1 , PetStr , 0 )
				ScriptMessage( Player , Player , 0 , PetStr , 0 )
			elseif (Hunger >= 0) and (Hunger < 60) then
				local PetStr = "[SC_PETSYS_78][$SETVAR1="..PetHelp.."]" -- ���U�OX%
				ScriptMessage( Player , Player , 1 , PetStr , 0 )
				ScriptMessage( Player , Player , 0 , PetStr , 0 )
			end
			WriteRoleValue(  OwnerID() , EM_RoleValue_Register+1 , PetHelp  ) --�O���d���ثe�����U�O( �w�i�D�L���a�F )

		end

		if Trick > 0 then
			P_Event = 0
			WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 0  )--�ѼơA���d��10�����Y��@���O�_�o�ͨƥ�A�Y���o�ͨƥ�F�A�h�j���@�p�ɫ�~��A�Y
		end

		if (P_Event == 0) then
------------------------------------------------------------------------------------------------------"*--�m�_�I�ƥ�n--*"-----------------------------------------------------------------------------------------------------------------------
			local AA = Rand( 100 )

			local RA = 15--�w�d�ǲ��d���ޯ��A�W�[Ĳ�o���v���Ŷ�
			if Trick > 0 then
				RA = 50
			end
			RA = 50+RA
			P_Event = ReadRoleValue( ThePet,  EM_RoleValue_Register+4 )
			if (AA >= 50) and (AA < RA) then   --15%���vĲ�o�ƥ�
				if (P_Event == 0) then 
					ScriptMessage( Player , Player , 1 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )
					ScriptMessage( Player , Player , 0 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )

					BeginPlot( Player , "Yuyu_Pet_Event_Adventure_01" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 10  )
				end
			end
------------------------------------------------------------------------------------------------------"*--�m���P�ƥ�n--*"-----------------------------------------------------------------------------------------------------------------------
			local BB = Rand( 100 )

			local RB = 15--�w�d�ǲ��d���ޯ��A�W�[Ĳ�o���v���Ŷ�
			if Trick > 0 then
				RB = 50
			end
			RB = 30+RB
			P_Event = ReadRoleValue( ThePet,  EM_RoleValue_Register+4 )
			if (BB >= 30) and (BB < RB) then   --15%���vĲ�o�ƥ�
				if (P_Event == 0) then 
					ScriptMessage( Player , Player , 1 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )
					ScriptMessage( Player , Player , 0 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )

					BeginPlot( Player , "Yuyu_Pet_Event_Emotion_01" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 10  )
				end
			end
------------------------------------------------------------------------------------------------------"*--�m�ͬ��ƥ�n--*"-----------------------------------------------------------------------------------------------------------------------
			local CC = Rand( 100 )

			local RC = 15--�w�d�ǲ��d���ޯ��A�W�[Ĳ�o���v���Ŷ�
			if Trick > 0 then
				RC = 50
			end
			RC = 10+RC
			P_Event = ReadRoleValue( ThePet,  EM_RoleValue_Register+4 )
			if (CC >= 10) and (CC < RC) then   --15%���vĲ�o�ƥ�
				if (P_Event == 0) then 
					ScriptMessage( Player , Player , 1 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )
					ScriptMessage( Player , Player , 0 , "[SC_PETS_EVENT_00_00_09]" , "0xff00ff00" )

					BeginPlot( Player , "Yuyu_Pet_Event_Life_01" , 0 )    
					WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 10  )
				end
			end
		else
			local DD = Rand( 2 ) + 1
			if (P_Event - DD) < 0 then
				WriteRoleValue(  ThePet , EM_RoleValue_Register+4 , 0  )
			else
				AddRoleValue(  ThePet , EM_RoleValue_Register+4 , -DD  )
			end
		end
	end
end
------------------------------------------------------------------------------------------------------"*--�m�J�ô��աn--*"-----------------------------------------------------------------------------------------------------------------------
function Fun_YU_PetAI_00_TEST_TEST( )
	SetModelScale( OwnerID() , 10 ) 
	sleep(30)
	SetModelScale( OwnerID() , 2 ) 
end

function YU_MasterPet_dead( )
	sleep(30)
	Delobj(OwnerID())
end