function Fun_Pets_Test_callPets(PetsID)

	GiveItem_Pet( OwnerID()   , 204507 , 1 , 1 , 3 , PetsID ); 

end
function YU_Pets_SayCamp()
	local O_ID = OwnerID()
	local Npc_Camp = ReadRoleValue( O_ID , EM_RoleValue_CampID  )   --NPC���}��,�ݯS�O�P�_�A�ư��ޯ૬�d��(EX�G�˪L���̪�)    3��Monster
	Say(O_ID,"My Camp is "..Npc_Camp)
end
function YU_Pets_GOGOEXP(EXP)--�W�[�Ĥ@���d���J���g��ȡC(�����O�u��Ĥ@���J����)
	AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_Exp , EXP )  
	ReCalPetLv(OwnerID(),0)
end

function YU_Scale_GOBig_00()
	SetModelScale( OwnerID() , 5 ) 
end

function YUTest_callPetsTEST_EXP()
	local PlayerID = OwnerID()
	local Mode = -1
	local ModePet = -1

	for i = 0,5 do

		Mode = ReadPetValue( PlayerID , i ,EM_CultivatePetStructValueType_EventType ) --�d�����A(���Q�l��(2)�B���b�Ȧ�(4)�B���b�Ͳ�(8)...etc)

		if Mode == 2 then
			ModePet = i	--�g�Ji�����b�l��X�Ӫ��d�����Ǹ�
			ModePet = ModePet+1	--�����ϥΡA�d�����q1�}�l
		end
	end

	ReCalPetLv(PlayerID,ModePet)

end

function YUTest_callPetsADD_EXP(LifeSkill)-- �C������GM���O��Pcall�I�s�u�঳�@�ӰѼ�--�W�[�Ĥ@���d���J���Ͳ��g���50%�C(�����O�u��Ĥ@���J����)


	if LifeSkill == 1 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill1 , 0.5 )  

	elseif LifeSkill == 2 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill2 , 0.5 )  

	elseif LifeSkill == 3 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill3 , 0.5 )  

	else
		Say(OwnerID() , "No Way~The Range is 1~3 !")
	end

end

function YUTest_callPetsADD_EXP2(LifeSkill)-- �C������GM���O��Pcall�I�s�u�঳�@�ӰѼ�--�W�[�Ĥ@���d���J���Ͳ��g���99%�C(�����O�u��Ĥ@���J����)


	if LifeSkill == 1 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill1 , 0.99 )  

	elseif LifeSkill == 2 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill2 , 0.99 )  

	elseif LifeSkill == 3 then
		AddPetValue( OwnerID() , 0 , EM_CultivatePetStructValueType_LifeSkill3 , 0.99 )  

	else
		Say(OwnerID() , "No Way~The Range is 1~3 !")
	end

end



function LuaYU_PetSystem_test01( Option )      -- �d������

	local PlayerID = OwnerID()
	local PackageID = 204794		-- 
--	local NeedSpace = 1
--	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
--	local ZoneID = ReadPetValue( OwnerID(), 0 ,EM_RoleValue_ZoneID )


	if ( Option == "CHECK" ) then

		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end

	elseif ( Option == "USE" ) then


--		GiveItem_Pet( OwnerID(), 204476 ,10,1,2)  --GiveItem_Pet( OwnerID(), int ItemOrgID , int Lv )   ���@���d���J(����,  �����J,  �X�Ū��J)
		--GiveItem_Pet( int GItemID , int ItemOrgID , int Lv , int Range , int MaxTotalPoint )--Range�G�ݩʤ��W�T�@MaxTotalPoint�G�W�T�`�M�W��
--ReadPetValue( GItemID , PetPos , ValueType )    Ū���d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�)
--WritePetValue( GItemID , PetPos , ValueType , Value )  �g�J�d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�,�g�J��)
--AddPetValue( GItemID , PetPos , ValueType , Value )  �[�g�J�d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�,�g�J��)

--		Say( OwnerID(), "WHO's Bad !" ) --�D�H

--		ScriptMessage(OwnerID(), OwnerID() , 1 , " START "  , C_SYSTEM )  
--		ScriptMessage(OwnerID(), OwnerID() , 0 , " START "  , C_SYSTEM )  

		local ItemOrgID = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_ItemOrgID )		-- �d���J���s��
		local CreateTime = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_CreateTime )
		local OrgObjID = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_OrgObjID )			--�d�����s��
		local Lv = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Lv )				--�d������
		local PetType = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_PetType ) 			--�d���ر�(�ө�)
		local EventColdown = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_EventColdown )
		local EventType = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_EventType )		--�d�����A(���Q�l��(2)�B���b�Ȧ�(4)�B���b�Ͳ�(8)...etc)

			--EM_CultivatePetCommandType_None		0	�S���A(����ͬ��ޯ�)
			--EM_CultivatePetCommandType_OnTimeEvent	1	client �ݨC10��q��Server �ݨ����d��(�B�z����or�S�O�ƥ�)
			--EM_CultivatePetCommandType_Summon	2	�l���d��
			--EM_CultivatePetCommandType_Feed		3	����
			--EM_CultivatePetCommandType_Trave		4	�Ȧ�
			--EM_CultivatePetCommandType_Free		5	���
			--EM_CultivatePetCommandType_Train		6	�S�V
			--EM_CultivatePetCommandType_Return		7	�l��X���d���^��
			--EM_CultivatePetCommandType_LiftSkill		8	�q�ƥͲ�


		local LifeSkillTablePos = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_LifeSkillTablePos )
		local Exp = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Exp ) 				--�g��
		local SKillPoint = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_SKillPoint )			--�ثe�ޯ��I
		local TotalSkillPoint = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_TotalSkillPoint )		--�`�ޯ��I��
		local Loyal = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Loyal )				--���۫�
		local Hunger = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Hunger )			--������
		local Talent = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Talent )				--���
		local Spirit = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Spirit )				--���m
		local Mode = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Mode )				--�d���Ҧ�
		local Str = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Str )
		local Sta = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Sta )
		local Agi = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Agi )
		local Int = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Int )
		local Mnd = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Mnd )
		local Property = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_Property )			--�d���ݩ�   0�a�B1���B2���B3���B4���B5�t
		local TrainCount = ReadPetValue( OwnerID(), 0 ,EM_CultivatePetStructValueType_TrainCount )

		ScriptMessage(OwnerID(), OwnerID() , 0 , " ItemOrgID="..ItemOrgID  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " CreateTime="..CreateTime  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " OrgObjID="..OrgObjID  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Lv="..Lv  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " PetType="..PetType  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " EventColdown="..EventColdown  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " EventType="..EventType  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " LifeSkillTablePos="..LifeSkillTablePos  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Exp="..Exp  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " SKillPoint="..SKillPoint  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " TotalSkillPoint="..TotalSkillPoint  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Loyal="..Loyal  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Hunger="..Hunger  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Talent="..Talent  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Spirit="..Spirit  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Mode="..Mode  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Str="..Str  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Sta="..Sta  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Agi="..Agi  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Int="..Int  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Mnd="..Mnd  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " Property="..Property  , C_SYSTEM )  
		ScriptMessage(OwnerID(), OwnerID() , 0 , " TrainCount="..TrainCount  , C_SYSTEM )  

	end
end
--�H�U�����ե�
-- 2013.03.11 ���E�G(5.0.10)��s�d���t�ΦU�ϰ쮷���_���J�����Ű϶��A���s�ק�H�U�@��
function LuaYU_TakePetEGG_01_test(ZoneID) --�H�U�����եμ@���A���a���J ���� /gm ? runplot LuaYU_TakePetEGG_01_test

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) 
	local PetEggLv = 1 --�d���J����

	if ZoneID == nil then
		ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	end

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
	
	if PetLvRange[ZoneID] ~= nil then	-- ��e Zone �ݩ� PetLvRange ���w�q�� Zone �ɰ���
		PetEggLv = Math.random(PetLvRange[ZoneID])
		DebugMsg( Player , RoomID , "Zone = "..ZoneID.." , MaxLv = "..PetLvRange[ZoneID].." , EggLv = "..PetEggLv )
	else	-- ��e Zone ���ݩ� PetLvRange ���w�q������ Zone �ɰ���
		local MaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- Ū���Ӧ��A����e�]�w�n�����a�̰�����
		PetEggLv = Math.random( Math.floor( MaxLv*(2/3) ) )	-- �d���J���� = (���a�̰�����*2/3)�����
		DebugMsg( Player , RoomID , "Zone = "..ZoneID.." , MaxLv = "..MaxLv.." , EggLv = "..PetEggLv )
	end	
-----------------------�H�U���F�զX�X �d���J �m�J��ID�n------------------------------

	local Egg = { }
	Egg[0] = {204476,204477,204478,204479,204480,204481}	--�����_���J		
	Egg[1] = {204482,204483,204484,204485,204486,204487}	--�����_���J2	
	Egg[2] = {204488,204489,204490,204491,204492,204493}	--�_���_���J	
	Egg[3] = {204506,204507,204508}				--�Ť��_���J		
	Egg[4] = {204494,204495,204496,204497,204498,204499}	--�_���_���J2	
	Egg[5] = {204500,204501,204502,204503,204504,204505}	--�t���_���J	

	local MouseOrgID = 103566    --�Ħ⩬�_��
	local RareEgg = 0 --�J�������ܼ�
	local EggItem = 0 --�J���ƦC��m

	if MouseOrgID==103566 then --�Ħ⩬�_��
		local RuneEggRand = Rand(100)	
		RareEgg = Rand(4)
		if RareEgg == 3 then
			if (RuneEggRand >=30) and (RuneEggRand <100) then	--70%
				EggItem = 2
			elseif (RuneEggRand >=5) and (RuneEggRand <30) then	--25%
				EggItem = 3
			else	--5%
				EggItem = 1
			end
		else
			EggItem = rand(table.getn(Egg[RareEgg]))+1
		end

	elseif MouseOrgID==103567 then --���⩬�_��
   		local RuneEggRand = Rand(100)
		RareEgg = Rand(6)    
		if RareEgg < 2 then
			RareEgg = 3
		end

		if RareEgg == 3 then
			if (RuneEggRand >=30) and (RuneEggRand <100) then	--70%
				EggItem = 2
			elseif (RuneEggRand >=5) and (RuneEggRand <30) then	--25%
				EggItem = 3
			else	--5%
				EggItem = 1
			end
		else
			EggItem = rand(table.getn(Egg[RareEgg]))+1
		end
	end	
-----------------------�H�U���F�զX�X�d���J�]�t���d��OrgID-----------------------
--�@��ϰ���d��
	local Pets = { }
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
--�}���ϰ���d��
	local ElitePets = { }
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

	local PGroup = Rand(100)    
	local PetNpcGroup = 0		--�d�������G�@������d(1)/�}�������d(2)/�@��ϰ��d(3)/�}���ϰ��d(4)/�Ť��d(5)
	local PetSet= 0			--�Ӹs���d���J����m
	local PetOrgID= 0		--�d��ID
	--DebugMsg( Player , RoomID ,"PGroup="..PGroup )
	if RareEgg == 3 then		--�������d���J���G�Ť��_���J
		PetNpcGroup = 5		--�Ť��d(5)

	elseif (ZoneID > 12) then		--12�Ϥ���s�}���ϰ�
		if (PGroup >= 20)  and  (PGroup < 100) then	--80%
			PetNpcGroup = 1	--�@������d(1)
		else						--20%
			PetNpcGroup = 2	--�}�������d(2)
		end

	elseif (PGroup >= 60)  and  (PGroup < 100) then	--40%
		PetNpcGroup = 1		--�@������d(1)

	elseif (PGroup >= 20)  and  (PGroup < 60) then		--40%
		PetNpcGroup = 3		--�@��ϰ��d(3)

	elseif (PGroup >= 10)  and  (PGroup < 20) then		--10%
		PetNpcGroup = 2		--�}�������d(2)
	else							--10%
		PetNpcGroup = 4		--�}���ϰ��d(4)
	end
	--DebugMsg( Player , RoomID ,"PetNpcGroup="..PetNpcGroup )
	if PetNpcGroup == 1 then			--�@������d(1)
		PetSet = rand(table.getn(Pets[0]))+1
		PetOrgID = Pets[0][PetSet]
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	elseif PetNpcGroup == 2 then			--�}�������d(2)
		PetSet = rand(table.getn(ElitePets[0]))+1
		PetOrgID = ElitePets[0][PetSet]
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	elseif PetNpcGroup == 3 then			--�@��ϰ��d(3)
		PetSet = rand(table.getn(Pets[ZoneID]))+1
		PetOrgID = Pets[ZoneID][PetSet]
	--DebugMsg( Player , RoomID ,"ZoneID="..ZoneID)
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	elseif PetNpcGroup == 4 then			--�}���ϰ��d(4)
		PetSet = rand(table.getn(ElitePets[ZoneID]))+1
		PetOrgID = ElitePets[ZoneID][PetSet]
	--DebugMsg( Player , RoomID ,"ZoneID="..ZoneID)
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	else						--�Ť��d(5)
		PetSet = rand(table.getn(RunePets))+1
		PetOrgID = RunePets[PetSet]
	--DebugMsg( Player , RoomID ,"PetSet="..PetSet)
	end
--	ScriptMessage( Player , Player , 2 , "You get the Egg!" , "0xff00ffff" )
--	ScriptMessage( Player , Player , 0 , "You get the Egg!" , "0xff00ffff" )
	local LvAddRange = math.ceil(2+(0.3*PetEggLv))--�L����i��A�����
	local TotalLvAdd = LvAddRange*2
	local play =  CheckFlag( Player , 542570 ) --�O�_�ѻP�L�K�O�m��
	local FreeEgg =  CheckFlag( Player , 542573 ) --�Ĥ@���K�O�J

	if ( play == true ) and ( FreeEgg == false ) and (ZoneID == 304) then--����o�L�K�O�J�A�ӥB���a���B��̩Ԫ���
		GiveItem_Pet( Player   , 204509 , 1 , LvAddRange ,    TotalLvAdd   , 103714 )
		SetFlag( Player , 542573 , 1 ) -- ��o�Ĥ@���K�O�J
	else
		GiveItem_Pet( Player , Egg[RareEgg][EggItem] , PetEggLv , LvAddRange , TotalLvAdd   , PetOrgID )
		-- �����H�B�_���JID�B�_���J�B�_���J���šB�����v�B�d��ID
	--	DebugMsg( Player , RoomID , "EggID : "..Egg[RareEgg][EggItem].." , PetID : "..PetOrgID.." , EggLv : "..PetEggLv )
	end
end