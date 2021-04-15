function kg_104592_Skillinfo(  )
		--	      1	         2	        3	          4	           5          	6	     7
	local SkillId = { 496248 , 496775 , 496774 , 496776 , 496777 ,   496779  ,    496780  }
	          	       --���K�Q�g  �H���ؼ�  ��_Hot   ��_����  ������v��  ��_����    ��ZDot    
	local SkillLv = { 200, 	       200 ,          0 ,          200 ,            0 ,         	0 ,         0      }
	--���Ŭ�0�������ܼҪO�վ�A���A�y�վ㪺��%�ơA�����z�����վ�b kg_104592_DollExplode �o�Ө禡���վ�
	--���a�I����������ˮ`�ݦb kg_104592_TouchDoll ���վ�
	--��D�L����ɪ��g�ɮĪG�ݦA kg_104592_BossForm ���վ�
	--��D�����A�y�ݦA kg_104592_Form0_3Ball ���վ�
	--��_���� �ݦA kg_104592_BossSkill06_Cast ���վ�
	local SkillString = { "[SC_104592_07]" , "[SC_104592_08]" , "496774"  , "[SC_104592_09]" , "496777" , "[SC_104592_10]"   , "499780"  }
	return SkillId,SkillLv,SkillString
end
--------------------------������-----------------------------------
function kg_104592_01()	--Zone19 ��Ԥҥj�� Boss��D������
--EM_RoleValue_Register1 BossID
--EM_RoleValue_Register2 ����ID
--EM_RoleValue_Register9 �J�f
--EM_RoleValue_Register10 �X�f
	local FlagID = 780851	--0:�J�f 1.�X�f 2.Boss�԰���m  3. ���� 4~9. �����H���Ѧ��I
	local Ctrl= OwnerID()	--�������ۨ�
	local BossID = 104592	--��D����s��
	local DollID = 117212	--�����s��
	local DoorID = 105078	--���ת��s��
	local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID )
	local TempString = "Graf_FanRange_"..RoomID
	kg_BossGV[TempString] = {}	--�s�����νd�򪺪��a
	
	local Boss6_ExitDoor = CreateObjByFlag( DoorID, FlagID , 1 , 1 )--�X�f���ת�
	kg_DoorInit( Boss6_ExitDoor )
	WriteRoleValue(Ctrl,EM_RoleValue_Register10,Boss6_ExitDoor)
	AddToPartition( Boss6_ExitDoor , RoomID )
	
	local Boss = CreateObjByFlag( BossID, FlagID , 2 , 1 )
	WriteRoleValue(Ctrl,EM_RoleValue_Register1,Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register3,0)
	WriteRoleValue(Boss,EM_RoleValue_Register5,1)
	MoveToFlagEnabled( Boss, false )	--�������޸��|�@��
	SetModeEx( Boss , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Boss , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Boss , EM_SetModeType_Searchenemy, false )	--����
	SetModeEx( Boss , EM_SetModeType_Revive, false )	--�i����
	AddToPartition( Boss , RoomID )
	
	local Doll = kg_GetRangePos( FlagID , DollID , 75 , 0 ,-1 , 2 )--�b�X�l2�����e��30�X�B
	SetModeEx( Doll , EM_SetModeType_Gravity , false )	-- ���O
	WriteRoleValue(Ctrl,EM_RoleValue_Register2,Doll)
	WriteRoleValue(Doll,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register2,Doll)
	WriteRoleValue(Doll,EM_RoleValue_Register2,Boss)
	WriteRoleValue(Doll,EM_RoleValue_Register8,0 )
	SetModeEx( Doll , EM_SetModeType_Mark, false)---�i�I��
	SetModeEx( Doll , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Doll , EM_SetModeType_Move, false) ---����
	SetModeEx( Doll , EM_SetModeType_Revive, false)--�i����
	AddToPartition( Doll , RoomID )
	SetPos( Doll ,ReadRoleValue( Doll , EM_RoleValue_X ), ReadRoleValue( Doll , EM_RoleValue_Y )+18 ,ReadRoleValue( Doll , EM_RoleValue_Z ),ReadRoleValue( Doll , EM_RoleValue_Dir ) )
	setplot(Boss,"range","LuaS_kg_hell_show",250)
	SetPlot(Boss,"dead","kg_104592_BossDead",30)
end

function kg_104592_ResetBoss()
	Sleep(50)
	local FlagID = 780851	--0:�J�f 1.�X�f 2.Boss�԰���m  3. ���� 4~9. �����H���Ѧ��I
	local Ctrl= OwnerID()	--�������ۨ�
	local BossID = 104592	--��D����s��
	local DollID = 117212	--�����s��
	local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID )
	--local Boss = CreateObjByFlag( BossID, FlagID , 2 , 1 )
	local Boss = kg_GetRangePos( FlagID , BossID , 0 , 0 ,-2 , 2 )
	WriteRoleValue(Ctrl,EM_RoleValue_Register1,Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register3,0)
	WriteRoleValue(Boss,EM_RoleValue_Register5,1)
	MoveToFlagEnabled( Boss, false )	--�������޸��|�@��
	SetModeEx( Boss , EM_SetModeType_Revive, false )	--�i����
	SetModeEx( Boss , EM_SetModeType_Strikback, TRUE) ---����
	SetModeEx( Boss , EM_SetModeType_Fight, TRUE) ---�i���
	SetModeEx( Boss , EM_SetModeType_Searchenemy, TRUE)	--����
	AddToPartition( Boss , RoomID )
	
	local Doll = kg_GetRangePos( FlagID , DollID , 75 , 0 ,-1 , 2 )--�b�X�l2�����e��30�X�B
	SetModeEx( Doll , EM_SetModeType_Gravity , false )	-- ���O
	WriteRoleValue(Ctrl,EM_RoleValue_Register2,Doll)
	WriteRoleValue(Doll,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register2,Doll)
	WriteRoleValue(Doll,EM_RoleValue_Register2,Boss)
	WriteRoleValue(Doll,EM_RoleValue_Register8,0 )
	SetModeEx( Doll , EM_SetModeType_Mark, false)---�i�I��
	SetModeEx( Doll , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Doll , EM_SetModeType_Move, false) ---����
	SetModeEx( Doll , EM_SetModeType_Revive, false)--�i����
	AddToPartition( Doll , RoomID )
	SetPos( Doll ,ReadRoleValue( Doll , EM_RoleValue_X ), ReadRoleValue( Doll , EM_RoleValue_Y )+18 ,ReadRoleValue( Doll , EM_RoleValue_Z ),ReadRoleValue( Doll , EM_RoleValue_Dir ) )
	SetPlot(Boss,"dead","kg_104592_BossDead",30)
	BeginPlot(Boss,"kg_104592_BossAI",1)
end

function LuaS_kg_hell_show()	--��D�@����t
	if kg_CheckGM(OwnerID())==TRUE then--���a����GM
		setplot(TargetID(),"range","",250)
		local graf = TargetID()
		local RoomID = ReadRoleValue( graf,EM_RoleValue_RoomID)
		local ena = ReadRoleValue(graf,EM_RoleValue_Register2)	--LuaFunc_SearchNPCbyOrgID( graf ,117212  , 1000 , 0)

		AdjustFaceDir(graf,ena,0)
		sleep(5)
		PlayMotion(graf,ruFUSION_ACTORSTATE_EMOTE_IDLE)
		sleep(10)
		yell(graf,"[SC_HELL_GRAF_1]",3)
		sleep(40)
		PlayMotion(graf,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		yell(graf,"[SC_HELL_GRAF_2]",3)
		sleep(40)
		yell(graf,"[SC_HELL_GRAF_5]",3)
		PlayMotion(graf,ruFUSION_ACTORSTATE_BUFF_SP01)
		sleep(40)
		yell(graf,"[SC_HELL_GRAF_6]",3)
		sleep(40)
		yell(graf,"[SC_HELL_GRAF_3]",3)
		sleep(20)
		AdjustFaceDir(graf,ena,90)
		sleep(5)
		PlayMotion(graf,ruFUSION_ACTORSTATE_CAST_SP01)
		sleep(30)
		AdjustFaceDir(graf,OwnerID(),0)
		sleep(5)
		PlayMotion(graf,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
		yell(graf,"[SC_HELL_GRAF_4]",3)
		sleep(30)

		local Ctrl = ReadRoleValue(graf,EM_RoleValue_Register1)
		SetModeEx( graf , EM_SetModeType_Strikback, TRUE) ---����
		SetModeEx( graf , EM_SetModeType_Fight, TRUE) ---�i���
		SetModeEx( graf , EM_SetModeType_Searchenemy, TRUE)	--����
		BeginPlot(graf,"kg_104592_BossAI",1)
	end
end

function kg_104592_BossAI()
--EM_RoleValue_Register1 ������ID
--EM_RoleValue_Register2 ����ID
--EM_RoleValue_Register3 Boss����κA
--EM_RoleValue_Register5 Boss�����ഫ��
	local Boss = OwnerID()
	local Form = 0
	local timer = 0
	local EnterBattle = 0
	local EndBattle = 1
	local SkillId,SkillLv,SkillString = kg_104592_Skillinfo()
	local SkillIndex = 0
	local Ctrl = ReadRoleValue(Boss,EM_RoleValue_Register1)
	local Doll = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	
	while 1 do
		if KS_InCombat(Boss)==true then
			if EnterBattle == 0 then	--�԰���l��
				DebugMsg(0,0,"EnterBattle")
				--SysCastSpellLv(Boss,Boss,497085,0)
				BeginPlot(Ctrl,"kg_104592_BossCrazy",0 )
				CallPlot(Doll , "kg_104592_DollAI" , Doll)--�����}�l�H���ǰe
				local Boss6_EnterDoor = CreateObjByFlag( 105078, 780851 , 0 , 1 )--�J�f���ת�
				kg_DoorInit( Boss6_EnterDoor )
				WriteRoleValue(Ctrl,EM_RoleValue_Register9,Boss6_EnterDoor)
				AddToPartition( Boss6_EnterDoor , RoomID )
				
				ScriptMessage( Boss , -1 , 2 , "[SC_104592_01]" , C_SYSTEM )
				--�A�̩~�M�����Z��!!
				WriteRoleValue(Boss,EM_RoleValue_Register5,1)
				WriteRoleValue(Boss,EM_RoleValue_Register3,1)	--�@�}���N��
				EnterBattle = 1
				EndBattle = 0
			end
			
			Form = ReadRoleValue( Boss,EM_RoleValue_Register3 )
			if ReadRoleValue(Boss,EM_RoleValue_Register5)==1 then
				WriteRoleValue(Boss,EM_RoleValue_Register5,0)
				kg_104592_BossForm(Boss,Form)
			else
				if Form == 0 then
					kg_104592_Form0_Skill(Boss , SkillId, SkillLv , SkillString ,timer )
				elseif Form == 1 then--��
					kg_104592_Form1_Skill(Boss , SkillId, SkillLv , SkillString ,timer )
				elseif Form ==2 then--�s
					kg_104592_Form2_Skill(Boss , SkillId, SkillLv , SkillString ,timer )
				elseif Form ==3 then--��
					kg_104592_Form3_Skill(Boss , SkillId, SkillLv , SkillString ,timer )
				end
			end
			timer = timer +1 
		else
			if EndBattle==0 then
				BeginPlot(Ctrl,"kg_104592_ResetBoss",1)
				local EnterDoor = ReadRoleValue(Ctrl,EM_RoleValue_Register9)
				DelObj( EnterDoor )--�R���J�f
				DelObj(Doll)
				DelObj(Boss)
				break
			end
		end
		sleep(10)
	end
end

function kg_104592_BossDead()
	local Boss = OwnerID()
	local Doll = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	kg_104592_BossForm(Boss)--�M����DBuff
	DelObj( Doll )
	local QuestDoll = kg_GetRangePos( 780851 , 117213 , 75 , 0 ,-1 , 2 )--�b�X�l2�����e��30�X�B
	SetModeEx( QuestDoll , EM_SetModeType_Gravity , false )	-- ���O
	SetModeEx( QuestDoll , EM_SetModeType_Move, false) ---����
	AddToPartition( QuestDoll , ReadRoleValue( Boss , EM_RoleValue_RoomID ) )
	SetPos( QuestDoll ,ReadRoleValue( QuestDoll , EM_RoleValue_X ), ReadRoleValue( QuestDoll , EM_RoleValue_Y )+18 ,ReadRoleValue( QuestDoll , EM_RoleValue_Z ),ReadRoleValue( QuestDoll , EM_RoleValue_Dir ) )
	SysCastSpellLv( QuestDoll , QuestDoll , 496177 , 0 )	--�ǰe�S��
	ScriptMessage( Boss , -1 , 2 , "[SC_104592_02]" , C_SYSTEM )	--[115301].....��̧�............
	
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	local TempString = "Graf_FanRange_"..RoomID
	kg_BossGV[TempString] = nil	--�s�����νd�򪺪��a
	
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
	local Boss6_EnterDoor = ReadRoleValue( Ctrl , EM_RoleValue_Register9 )
	local Boss6_ExitDoor = ReadRoleValue( Ctrl , EM_RoleValue_Register10 )
	DelObj(Boss6_EnterDoor)--�R���J�f
	DelObj(Boss6_ExitDoor)--�R���X�f
end


------------------------��D�ޯ�------------------------------
function  kg_104592_BossCrazy()--Boss�i�J�g��
	local Boss= ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local timer = 0
	while 1 do
		if KS_InCombat(Boss)~=TRUE  then
			DebugMsg(0,0,"BattleEnd")
			break
		elseif  timer==480 and KS_InCombat(Boss)==TRUE then
			AddBuff(Boss,507744,0,-1)
			break
		else
			
		end
		sleep(10)
		timer=timer+1
	end
end

function kg_104592_BossForm(Boss,Form)	--���ܭ���
--EM_RoleValue_Register3--Boss����κA
--AddBuff(Boss,508482,0,-1) --�L����(���a�g��)
--AddBuff(Boss,508411,0,-1) --���y
--AddBuff(Boss,508412,0,-1) --���y
--AddBuff(Boss,508413,0,-1) --���y
--508416 ��_hot
--508419 �����s��ؤl
--508422 ���K��
--508423 �]�K��

	magicinterrupt(Boss)	--��Boss�I���_�k
	Form = Form or -1	--Form��nil �h�]�w��-1
	WriteRoleValue(Boss,EM_RoleValue_Register3,Form )
	local BuffArray = { 508482 , 508411 , 508412 , 508413 , 508416 , 508419 , 508422 , 508423 }
	kg_ClearBuff( Boss , BuffArray )
	AddBuff( Boss ,508560,1,-1 )--���i����
	
	if Form == 1 then
		AddBuff(Boss,508411,0,-1) --���y
		ScriptMessage( Boss , -1 , 2 , "[SC_104592_14]" , C_YELLOW )	--[104592] ���W�F���� !
		PlayMotion(Boss , ruFUSION_ACTORSTATE_BUFF_SP03)
	elseif Form == 2 then
		AddBuff(Boss,508412,0,-1) --���y
		CallPlot( Boss , "kg_104592_Form2_AddShield" , Boss )
		ScriptMessage( Boss , -1 , 2 , "[SC_104592_14]" , C_YELLOW )	--[104592] ���W�F���� !
		PlayMotion(Boss , ruFUSION_ACTORSTATE_BUFF_SP03)
	elseif Form == 3 then
		AddBuff(Boss,508413,0,-1) --���y
		ScriptMessage( Boss , -1 , 2 , "[SC_104592_14]" , C_YELLOW )	--[104592] ���W�F���� !
		PlayMotion(Boss , ruFUSION_ACTORSTATE_BUFF_SP03)
	elseif  Form == 0 then
		AddBuff(Boss,508482,0,-1) --�L����(�վ�g�ɵ��Ŧb�o��վ�) �C�ӵ��Žվ�10%
		ScriptMessage( Boss , -1 , 2 , "[SC_104592_06]" , C_YELLOW )	--[104592] ������]�z���}�H�F!
		PlayMotion(Boss , ruFUSION_ACTORSTATE_BUFF_SP01)
	end
	Sleep(30)
end

function kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )	--�H��2��@�I��k�N
--SkillIndex=1--���K�Q�g
--SkillIndex=2--��D���V
	local SkillIndex=1--���K�Q�g
	--if timer>1 and timer%7==0 then
		local randSkill = math.random(100)
		local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
		if randSkill >=50 then
			if GetDistance( Boss,atkTarget )<=60 and kg_CheckAtk(atkTarget)==TRUE then--���K�Q�g
				CastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
				ScriptMessage( Boss , -1 , 2 ,SkillString[SkillIndex] , C_SYSTEM )
				--���A�̪Y��ڪ��s����!!!
				Sleep(20)
			else
				SkillIndex=2--��D���V
				local PlayersInHate = KS_GetHateList( Boss , 1 )
				atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]	--�H�����@�W
				if kg_CheckAtk(atkTarget)==TRUE then
					AddBuff( Boss ,508560,1,-1 )--���i����
					PlayMotion( Boss,ruFUSION_ACTORSTATE_CAST_SP02)
					sleep(10)
					SysCastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
					local messageString = SkillString[SkillIndex].."[$SETVAR1="..GetName( atkTarget ).."]"
					ScriptMessage( Boss , -1 , 2 ,messageString , C_SYSTEM )
					--[$VAR1]!! �ӳ����R�����K�q�a!
					Sleep(10)
				end
			end
		else
			SkillIndex=2--��D���V
			local PlayersInHate = KS_GetHateList( Boss , 1 )
			atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]
			if kg_CheckAtk(atkTarget)==TRUE then
				AddBuff( Boss ,508560,1,-1 )--���i����
				PlayMotion( Boss,ruFUSION_ACTORSTATE_CAST_SP02)
				sleep(10)
				SysCastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
				local messageString = SkillString[SkillIndex].."[$SETVAR1="..GetName( atkTarget ).."]"
				ScriptMessage( Boss , -1 , 2 ,messageString , C_SYSTEM )
				--[$VAR1]!! �ӳ����R�����K�q�a!
				Sleep(10)
			end
		end
	--end
end

function kg_104592_Form0_Skill(Boss , SkillId, SkillLv , SkillString ,timer )--�L����_�ޯ�

	local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
	if timer>1 and timer%7==0 then
		kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )
	elseif timer>1 and timer%3==0 then
		CastSpellLv( Boss, atkTarget  ,496786 , 0 )--��y
		Sleep(20)
	end
end

function kg_104592_Form0_3Ball()
	--WriteRoleValue(OwnerID(),EM_RoleValue_Register6,1)
	local Boss = OwnerID()
	local SkillId = 496785
	local SkillLv = 60
	local SkillString = "[SC_104592_12]"
	local PlayersInHate = KS_GetHateList( Boss , 1 )	--�줳��C��
	local UnluckyPlayers = KS_RegroupArray( PlayersInHate , 6 )	--����C���H�N��T��
	ScriptMessage( Boss , -1 , 2 ,SkillString , C_SYSTEM )
	--�o�y�ܦn���A�N�e�A�̤F!
	for i in pairs(UnluckyPlayers) do
		if kg_CheckAtk( UnluckyPlayers[i] ) == TRUE then
			SysCastSpellLv( Boss , UnluckyPlayers[i] , SkillId , SkillLv )
		end
	end
end

function kg_104592_Form1_Skill( Boss , SkillId, SkillLv , SkillString ,timer )--��_�ޯ�
--SkillIndex=3--��_Hot
--SkillIndex = 4--��_����	--ť�ڻ��ӧN���ܧa!
	local SkillIndex = 0
	if CheckBuff(Boss,508416 )== false then
		SkillIndex=3--��_Hot
		CastSpellLv( Boss , Boss , SkillId[SkillIndex] , SkillLv[SkillIndex] )
	end
	if timer>1 and timer%7==0 then
		kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )
	elseif timer>1 and timer%13==0 then
		local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
		if GetDistance( Boss,atkTarget )<=60 and kg_CheckAtk(atkTarget)==TRUE then
			SkillIndex = 4--��_����
			CastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
			ScriptMessage( Boss , -1 , 2 ,SkillString[SkillIndex] , C_SYSTEM )
			--ť�ڻ��ӧN���ܧa!
			Sleep(40)
		end
	end
end

function kg_104592_Form2_Skill(Boss , SkillId, SkillLv , SkillString ,timer )--�s_�ޯ�
--SkillIndex=7	--�s�褧�\
--508421 �s�褧�\ dot 
	local SkillIndex = 0
	if timer>1 and timer%3==0 then
		SkillIndex = 7
		local PlayersInHate = KS_GetHateList( Boss , 1 )
		local atkTarget = PlayersInHate[1]	--���o�Z�J
		--PlayMotion(Boss,ruFUSION_ACTORSTATE_CAST_SP02)
		SysCastSpellLv(Boss, atkTarget ,SkillId[SkillIndex],SkillLv[SkillIndex])
		Sleep(10)
	end
	if timer>1 and timer%7==0 then
		kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )
	end
end

function kg_104592_Form2_AddShield( Boss )
--[SC_104592_11]	--[104592]�i�}�F�@��!
--SkillIndex=9		--�s�ˤ���
--SkillIndex=10	--�s�褧��
--508422 ���K��
--508423 �]�K��
	local timer = 0
	local SkillIndex = 0
	local Shield = { 508422 , 508423 }
	math.randomseed( math.random(10000, 99999) )
	SkillIndex = math.random(1,2)--���]�@���H����
	AddBuff( Boss, Shield[SkillIndex] , 0 , -1 )
	while 1 do
		if  ReadRoleValue( Boss , EM_RoleValue_Register3 )==2 then
			if timer>1 and timer%11==0 then
				kg_ClearBuff( Boss , Shield )	--�M�����W����
				SkillIndex = math.random(1,2)
				AddBuff( Boss, Shield[SkillIndex] , 0 , -1 )
				ScriptMessage( Boss , -1 , 2 , "[SC_104592_11]" , C_YELLOW )
				--[104592]�i�}�F�@��
			end
		else 
			break
		end
		Sleep(10)
		timer=timer+1
	end
end

function kg_104592_Form3_Skill(Boss , SkillId, SkillLv , SkillString ,timer )--��_�ޯ�
--SkillIndex=5--����z�o
--SkillIndex = 6--�������(������)	--�ݧڧ�A�̤��H!!!
--AddBuff( 508419 )	--��Boss�C�T��N�X���@���ؤl
	local SkillIndex = 0
	if CheckBuff( Boss,508419 )== false then	--�s�魰�v��
		--SkillIndex=5--����z�o
		AddBuff( Boss, 508419 , 0 , -1 )
	end
	
	if timer>1 and timer%7==0 then
		kg_104592_RandSkill(Boss , SkillId, SkillLv , SkillString ,timer )
	elseif timer>1 and timer%11==0 then	--�Y�ޯ঳�I�k�ɶ��ݧ�gscript
		local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
		if GetDistance( Boss,atkTarget )<=100 and kg_CheckAtk(atkTarget)==TRUE then
			SkillIndex = 6--�������(������)
			CastSpellLv(Boss, atkTarget ,SkillId[SkillIndex] , 0 )
			ScriptMessage( Boss , -1 , 2 ,SkillString[SkillIndex] , C_SYSTEM )
			--�ݧڧ�A�̤��H!!!
			sleep(30)
		end
	end
end

function kg_104592_BossSkill06_CountObj()--���������H��
	local O_id = OwnerID()
	local T_id = TargetID()
	local RoomID = ReadRoleValue( O_id , EM_RoleValue_RoomID )
	local TempString = "Graf_FanRange_"..RoomID
	table.insert( kg_BossGV[TempString] , T_id )
end
function kg_104592_BossSkill06_Cast()--��}�C�I��������
	local O_id = OwnerID()
	local SkillId = 496787
	local SkillLv = 400
	local RoomID = ReadRoleValue( O_id , EM_RoleValue_RoomID )
	local TempString = "Graf_FanRange_"..RoomID
	local FanRange = kg_BossGV[TempString]
	local ShareNum = table.getn( FanRange )
	for i=1 ,  table.getn( FanRange ) do
		if GetDistance( O_id , FanRange[i] )>60  then--��j��60�����H����b���ɽd�򤺡A���٬O�|����
			ShareNum = ShareNum-1
		end
	end
	if ShareNum<=0 then ShareNum=1 end--�w��sever���~�t����t��
	DebugMsg(0,0,"ShareCount = "..ShareNum )
	local Damage = math.ceil( (SkillLv/ShareNum) )	-- 200*1000/share
	for i=1 , table.getn( FanRange ) do
		SysCastSpellLv(O_id , FanRange[i] , SkillId , Damage )
	end
	kg_BossGV[TempString]={}--�M�Ű}�C
end
function kg_104592_BossSkill05()--����ؤl�@��
	local Boss = OwnerID()
	local PlayersInHate = KS_GetHateList( Boss , 1 )
	for i=1,table.getn(PlayersInHate) do
		AddBuff( PlayersInHate[i] , 508418 , 0 , 10 )--���ؤl
	end
end
-----------------------����AI--------------------------------------------
function kg_104592_DollExplode( Doll )	--�����I�i�z�}�ޯ�
	local SkillId = 496784	--�����z�}
	local SkillLv = 2
	local Boss = ReadRoleValue( Doll , EM_RoleValue_Register2 )
	SysCastSpellLv( Doll, Doll ,SkillId , SkillLv )	--�������z
	SetPlot( Doll,"touch","",30 )
	if CheckDistance( Doll , Boss , 50 )==true then	--���ի����P��D�O�_�b�Z����
		magicinterrupt(Boss)	--��Boss�I���_�k
		kg_104592_BossForm(Boss,0)
		--WriteRoleValue(Boss,EM_RoleValue_Register5,1)
		--WriteRoleValue(Boss,EM_RoleValue_Register3,0)
	end
	CallPlot( Doll , "kg_104592_DollReBorn" , Doll )--���p����call function �|�L��sleep()
end

function kg_104592_DollReBorn( Doll )	--��������
	local Ctrl = ReadRoleValue( Doll , EM_RoleValue_Register1 )
	local Boss = ReadRoleValue( Doll , EM_RoleValue_Register2 )
	local timer=0
	Sleep(3)--���F���z���ʵe����
	SetModeEx( Doll , EM_SetModeType_Show, FALSE)--����
	math.randomseed(math.random(10000, 99999))
	while 1 do
		if KS_InCombat(Boss)==true then
			if timer>0 and timer==20 then --����20������D���^����
				if CheckBuff( Boss , 508482 )==TRUE then	--�T�wBoss�B�b����}�H���A
					--magicinterrupt(Boss)	--��Boss�I���_�k
					--kg_104592_BossForm( Boss , math.random(1,3) )--�j���ഫ���A
					WriteRoleValue(Boss,EM_RoleValue_Register5,1)
					WriteRoleValue(Boss,EM_RoleValue_Register3, math.random(1,3) )
				end
			elseif timer>0 and timer==40 then--40��ɫ�������
				DebugMsg(0,0,"Reborn")
				local ranNum = math.random(4,9)
				SetPosByFlag( Doll , 780851 , ranNum )
				SetModeEx( Doll , EM_SetModeType_Show, TRUE)--���
				SysCastSpellLv( Doll,Doll,496177,0 )	--�ǰe�S��
				SetPlot( Doll,"touch","kg_104592_TouchDoll",30 )
				break
			end
		else	--��D���}�԰��^���l��m
			break
		end
		--DebugMsg(0,0,timer)
		Sleep(10)
		timer=timer+1
	end
end

function kg_104592_DollAI( Doll )
--EM_RoleValue_Register1 ������ID
--EM_RoleValue_Register2 BossID
--EM_RoleValue_Register8 ����"���b"�Q���a�j�w�I��ɬ�1
	local Ctrl = ReadRoleValue( Doll , EM_RoleValue_Register1 )
	WriteRoleValue( Doll,EM_RoleValue_Register5,0)
	math.randomseed(math.random(10000, 99999))
	Sleep(30)	--3���ǰe
	SysCastSpellLv( Doll,Doll,496177,0 )
	local ranNum = math.random(4,9)
	SetPosByFlag( Doll , 780851 , ranNum )
	SysCastSpellLv( Doll,Doll,496177,0 )
	SetModeEx( Doll , EM_SetModeType_Mark, TRUE)---�i�I��
	Sleep(10)
	SetPlot( Doll,"touch","kg_104592_TouchDoll",30 )
end

function kg_104592_TouchDoll()
--EM_RoleValue_Register8 "���b"�Q���a�j�w�I��ɬ�1
--508493 �޾ɶˮ`
	local Player = OwnerID()
	local Doll = TargetID()
	if ReadRoleValue(Doll,EM_RoleValue_Register8)==0 then
		WriteRoleValue(Doll,EM_RoleValue_Register8, 1 )	--�ƹ��I�����w
		AddBuff( Player , 508493 ,0,-1 )--�޾ɶˮ`( �ޯ൥�Żݦb�o�̽վ� ) �C��-1000�ˮ`
		if BeginCastBarEvent( Player, Doll , "[SC_104592_13]", 30, ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_END, 0 , "kg_104592_DollCastBarTriger")~=1 then
			ScriptMessage( Doll, Player, 0,"[SAY_NPC_BUSY]", 0 )
		end
	else
		ScriptMessage( Doll, Player, 0,"[SAY_NPC_BUSY]", 0 )
	end
end

function kg_104592_DollCastBarTriger( ObjID, CheckStatus )
--OwnerID ���a
--TargetID ����
	local Player = OwnerID()
	local Doll = TargetID()
	if CheckStatus >0  then
		CancelBuff( Player, 508493 )
		EndCastBar( Player,CheckStatus )
		WriteRoleValue( Doll,EM_RoleValue_Register8,0)
		kg_104592_DollExplode( Doll )
	else
		CancelBuff( Player, 508493 )
		WriteRoleValue( Doll,EM_RoleValue_Register8,0)
		EndCastBar( Player,CheckStatus)
	end
end
