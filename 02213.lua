function kg_104590_Skillinfo(  )
	local Skill = {}
		--	      1	         2	        3	          4	           	5	      6		7	8	   9	    10
	Skill["SkillId"] = { 496931 , 496932 , 496933 , 496934  ,   496936  ,   496937,      496245  ,  496938 ,  496940  ,497444     }
	          	       --��l���  ��l�}��  ��lAE      ���q�ľW    �@����l   �����ʧ@     �K����¶      4����  ��l��,�g������
	Skill["SkillLv"] = {      0, 	       0 ,          0 ,              3 ,                    400 ,              0 ,         	8      ,	49	,   3     	,      14  }
	--SkillLv ��0�� �Ш�ҪO���վ�j��
	--�����ʧ@(�g������) �ݨ� kg_104590_BossSkill07_RealCast ���վ�j��
	Skill["SkillString"] = { "496931" , "496932" , "496933"  , "[SC_104590_04]" , "[SC_104590_05]" , "[SC_104590_06]"   , "[SC_104590_07]"  , "[SC_104590_08]" , "496940" ,"[SC_104590_09]"}
	
	return Skill
end

function kg_104590_Buffinfo(  )
	local Buff = {}
		--	      1	        2
	Buff["BuffId"] = { 508551  ,  508555  }
	          	           --��l�[�t   �V�~�v�g��
	Buff["BuffLv"] = { 20	,         50  }
	return Buff
end

--------------------------������-----------------------------------
function kg_104590_01()	--Zone19 ��Ԥҥj�� Boss�V�~�v������
--EM_RoleValue_Register1 �V�~�v
--EM_RoleValue_Register2 ��l
--EM_RoleValue_Register3 �w�����boss�P�ɦ��`�P��Ĳ�o���_�c
--EM_RoleValue_Register9 �J�f
--EM_RoleValue_Register10 �X�f
	local Ctrl= OwnerID()	--�������ۨ�
	local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID )
	local TempString = "Zone136_Boss2_AtkRange_"..RoomID
	kg_BossGV[TempString]={}	--�g�������䪱�a
	WriteRoleValue( Ctrl , EM_RoleValue_Register3 , 0 )
	
	local ExitDoor = CreateObjByFlag( 103126, 780862 , 1 , 1 )--�X�f���ת�
	kg_DoorInit( ExitDoor )
	WriteRoleValue( Ctrl , EM_RoleValue_Register10 , ExitDoor )
	AddToPartition( ExitDoor , RoomID )
	
	kg_104590_CreateBoss( Ctrl )
	kg_104591_CreateBucket()--�H���ͤ��ӱ�l
end

function kg_104590_ResetBoss()
	local Ctrl =OwnerID()
	Sleep(50)
	kg_104590_CreateBoss( Ctrl )
end

function kg_104590_CreateBoss( Ctrl )
	--780862	--�X�нs��	--0:�J�f  1: �X�f  2:Boss��l��m
	--103126	--���ת��s��
	local FlagID = 780862
	local BossID = 104590	--�V�~�v����s��
	local LionID = 104591	--�p�ߪ���s��
	local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID )
	
	local Boss = kg_GetRangePos( FlagID , BossID , 20 , 90 , -3 , 2 )--�������k��20�X�B
	WriteRoleValue( Ctrl , EM_RoleValue_Register1 , Boss )
	WriteRoleValue( Boss , EM_RoleValue_Register1 , Ctrl )
	--MoveToFlagEnabled( Boss, false )	--�������޸��|�@��
	SetModeEx( Boss , EM_SetModeType_Revive, false )	--�i����
	AddToPartition( Boss , RoomID )
	BeginPlot( Boss,"kg_104590_BossAI", 1 )
	SetPlot( Boss ,"dead","kg_104590_BossDead", 30 )
	
	
	local Lion = kg_GetRangePos( FlagID , LionID , 20 , -90 , -3 , 2 )--����������20�X�B(�����ܼ�)
	local LionName = "Zone136_Boss2_Lion_"..RoomID
	kg_BossGV[LionName]=Lion
	WriteRoleValue(Ctrl,EM_RoleValue_Register2,Lion)
	WriteRoleValue(Lion,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Lion,EM_RoleValue_Register2,Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register2,Lion)
	WriteRoleValue(Lion,EM_RoleValue_Register4,0)--�g�ɱҰ�
	--MoveToFlagEnabled( Lion, false )	--�������޸��|�@��
	SetModeEx( Lion , EM_SetModeType_Revive, false )	--�i����
	AddToPartition( Lion , RoomID )
	SetPlot( Lion,"dead","kg_104591_LionDead",30 )
end

function kg_104590_BossAllDead()
	DebugMsg(0,0,"BossAllDead..")
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	DelObj(ReadRoleValue( Ctrl , EM_RoleValue_Register9 ))--�R���J�f
	DelObj(ReadRoleValue( Ctrl , EM_RoleValue_Register10 ))--�R���X�f
	kg_104590_BornBox( RoomID )
	BeginPlot(OwnerID(), "ic_ha_de_136_02" , 0)----���b��
	local TempString = "Zone136_Boss2_AtkRange_"..RoomID
	kg_BossGV[TempString]=nil
	kg_104591_SetBucket( RoomID,2 )
end

function kg_104590_CheckHight( Boss )
	local Lion = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	--local FlagY = GetMoveFlagValue( 780862 , 2 , EM_RoleValue_Y )
	--local BossY = ReadRoleValue(Boss,EM_RoleValue_Y)
	--local LionY = ReadRoleValue(Lion,EM_RoleValue_Y)
	--DebugMsg(0,0," dBossY = "..(BossY-FlagY).." ,dLionY"..(LionY-FlagY) )
	--local Height = 60
	--if ( (BossY-FlagY)>=Height ) or ( (LionY-FlagY)>=Height ) then
		if (DW_CheckDis(Boss,780862,2,428)~=true and CheckID(Boss)==true ) or (DW_CheckDis(Lion,780862,2,428)~=true and CheckID(Lion)==true ) then
			DebugMsg(0,0,"Boss2 Error!!!")
			local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
			local EnterDoor = ReadRoleValue( Ctrl,EM_RoleValue_Register9 )
			DelObj(EnterDoor)--�R���J�f
			DelObj(Lion)
			BeginPlot( Ctrl,"kg_104590_ResetBoss",1 )
			DelObj(Boss)--�R���ۤv
		end
	--end
end
--[[
function kg_104590_CheckLionCombat(Boss,Lion)--�V�~�v�i�J�԰��᤭���l�S�i�J�԰��N���m
	Sleep(50)
	if KS_InCombat(Lion)~=true then
		DebugMsg(0,0,"Boss2 Error!!!")
		local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
		local EnterDoor = ReadRoleValue(Ctrl,EM_RoleValue_Register9)
		DelObj(EnterDoor)--�R���J�f
		DelObj(Lion)
		BeginPlot( Ctrl,"kg_104590_ResetBoss",1 )
		DelObj(Boss)--�R���ۤv
	end
end
]]--
------------------------�V�~�v----------------------------------
function kg_104590_BossAI()
--EM_RoleValue_Register1 ������
--EM_RoleValue_Register2 ��l
	local Boss = OwnerID()
	local timer =0
	local EnterBattle = 0
	local EndBattle = 1
	local Skill = kg_104590_Skillinfo()
	local Buff = kg_104590_Buffinfo()
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
	local Lion = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	while 1 do
		if KS_InCombat(Boss)==true then
			if EnterBattle == 0 then	--��i�J�԰����}����
				--SysCastSpellLv(Boss,Boss,497085,0)
				--SysCastSpellLv(Lion,Lion,497085,0)
				BeginPlot(Ctrl,"kg_104590_BossCrazy",0)
				--CallPlot(Boss,"kg_104590_CheckLionCombat",Boss,Lion)
				local EnterDoor = CreateObjByFlag( 103126, 780862 , 0 , 1 )--�J�f���ת�
				kg_DoorInit( EnterDoor )
				WriteRoleValue(Ctrl,EM_RoleValue_Register9,EnterDoor)
				AddToPartition( EnterDoor , RoomID )
				
				ScriptMessage( Boss , -1 , 2 , "[SC_104590_01]" , C_SYSTEM )
				--[104591]�A���H�n���ڭ̤@�_���F
				DebugMsg(0,0,"Atom EnterBattle!")
				EnterBattle = 1
				EndBattle = 0
				kg_104591_SetBucket( RoomID,0 )--��l�i�H�I��
			end
			kg_104590_CheckHight( Boss )
			if timer>0 and timer%11==0 then
				kg_104590_BossSkill10s( Boss , Lion , Skill , Buff )
			elseif timer>0 and timer%17==0  then
				kg_104590_BossSkill15s( Boss , Lion , Skill , Buff )
			elseif timer>0 and timer%23==0  then
				kg_104590_BossSkill20s( Boss , Lion , Skill , Buff )
			elseif timer>0 and timer%31==0 then
				kg_104590_BossSkill30s( Boss , Lion , Skill , Buff )
			end
			timer = timer +1 
		else
			if EndBattle==0 then
				kg_104591_SetBucket( RoomID,1 )
				EnterBattle = 0
				EndBattle = 1
				timer = 0
				local EnterDoor = ReadRoleValue(Ctrl,EM_RoleValue_Register9)
				DelObj(EnterDoor)--�R���J�f
				DelObj(Lion)
				BeginPlot( Ctrl,"kg_104590_ResetBoss",1 )
				DelObj(Boss)--�R���ۤv
			end
		end
		
		sleep(10)
	end
end

function kg_104590_BossDead()
	local Boss = OwnerID()
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
	local Lion = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	if kg_CheckLive( Lion )==TRUE then
		WriteRoleValue(Lion,EM_RoleValue_Register4,1)--��l�i�J�g��
		BeginPlot(Lion,"kg_104591_CrazyLionAI",1 )--�Ұʷ�l�g��AI
		ScriptMessage( Boss , -1 , 2 , "[SC_104590_02]" , C_SYSTEM )	--[104591]..........����........�r�H�L��......
	else
		DebugMsg(0,0,"BossDead")
		ScriptMessage( Boss , -1 , 2 , "[SC_104590_10]" , C_SYSTEM )	--.......[104591]..............
		if ReadRoleValue(Ctrl,EM_RoleValue_Register3)==0 then
			WriteRoleValue(Ctrl,EM_RoleValue_Register3,1)
			BeginPlot(Ctrl,"kg_104590_BossAllDead",0)
		end
	end
end

function kg_104590_BornBox( RoomID )--�����_�c
	local Box = kg_GetRangePos( 780862 , 105456 , 0 , 0 , -3 , 2 )
	kg_BoxInit( Box )
	AddToPartition(Box,RoomID)
end

------------------------�V�~�v�ޯ�------------------------------
function  kg_104590_BossCrazy()--Boss�i�J�g��
	local Ctrl = OwnerID()
	local CrazyBuff = 507744
	local Boss= ReadRoleValue(Ctrl,EM_RoleValue_Register1)
	local Lion = ReadRoleValue(Ctrl,EM_RoleValue_Register2)
	local timer = 0
	while 1 do
		if KS_InCombat(Boss)~=TRUE and KS_InCombat(Lion)~=TRUE then
			DebugMsg(0,0,"BattleEnd")
			break
		elseif  timer==480 then
			if KS_InCombat(Boss)==TRUE then
				AddBuff(Boss,CrazyBuff,0,-1)
			end
			if KS_InCombat(Lion)==TRUE then
				AddBuff(Lion,CrazyBuff,0,-1)
			end
			break
		else
			
		end
		sleep(10)
		timer=timer+1
	end
end

function kg_104590_BossSkill10s( Boss , Lion , Skill , Buff )--��l:�}��+���, �V�~�v:���@�l����l,���⭫��,�K��
	local Skillindex = 1
	local Buffindex = 1
	local randSkill = kg_Rand(100)
	DebugMsg(0,0,"randSkill = "..randSkill )
	local atkTarget = ReadRoleValue( Lion , EM_RoleValue_AttackTargetID )--Ū��lion�������ؼ�
	if kg_CheckLive( Lion )==TRUE and CheckBuff( Lion , 508544 )==FALSE and GetDistance(Lion,atkTarget)<=60 and kg_CheckAtk( atkTarget )==TRUE then
		SysCastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--�y��
		Skillindex = 2
		SysCastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--�}��
	end
	
	if randSkill>66 then--���⭫��(�ݤ���)
		Skillindex = 6
		local atkTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )--Ū��Boss�������ؼ�
		CastSpellLv( Boss , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
		--�]�a �ɱ��a�]�a
		--DebugMsg(0,0,Skillindex )
		Sleep(20)
	elseif randSkill>33 and randSkill<=66 then
		Skillindex = 10
		CastSpellLv( Boss , Boss , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
		--�~�|�@�U�ڪ�����a
		Sleep(20)
	else	--�K��
		Skillindex = 7
		local PlayersInHate = KS_GetHateList( Boss , 1 )
		atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]	--�H�����@�W
		if kg_CheckAtk(atkTarget)==TRUE then
			CastSpellLv( Boss , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
			ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
			--�O�ö]�A�n�n�n�a�ѻP�t�X��
			--DebugMsg(0,0,Skillindex )
			Sleep(30)
		end
	end
end

function kg_104590_BossSkill07_CountObj()
	local O_id = OwnerID()
	local T_id = TargetID()
	local OrgID = ReadRoleValue( T_id , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue(O_id,EM_RoleValue_RoomID)
	local TempString = "Zone136_Boss2_AtkRange_"..RoomID
	if OrgID~=117200 and kg_CheckAtk( T_id )==TRUE then
		table.insert( kg_BossGV[TempString] , T_id )
	end
	DebugMsg(0,0,table.getn(kg_BossGV[TempString]))
end

function kg_104590_BossSkill07_Cast()--�u�g������
	local Boss = OwnerID()
	CallPlot( Boss ,"kg_104590_BossSkill07_RealCast",Boss )--���F���sleep
end

function kg_104590_BossSkill07_RealCast( Boss )
	Sleep(10)--�k�N����
	local Skillid = 496939--�u�g������
	local SkillLv = 399
	local RoomID = ReadRoleValue(Boss , EM_RoleValue_RoomID)
	local TempString = "Zone136_Boss2_AtkRange_"..RoomID
	local FanRange = kg_BossGV[TempString]
	local ShareNum = table.getn( FanRange )
	if ShareNum<=0 then ShareNum=1 end
	DebugMsg(0,0,"ShareCount = "..ShareNum )
	local Damage = math.ceil( ( SkillLv/ShareNum ) )	-- 200*1000/share
	for i=1 , table.getn( FanRange ) do
		SysCastSpellLv( Boss , FanRange[i] , Skillid , Damage )
	end
	kg_BossGV[TempString] = {}
	DebugMsg(0,0,table.getn(kg_BossGV[TempString]))
end

function kg_104590_BossSkill15s( Boss , Lion , Skill , Buff )--��l�j�q
	DebugMsg(0,0,"15s")
	local Buffindex = 1
	local Skillindex = 3
	if kg_CheckLive( Lion )==TRUE and CheckBuff( Lion , 508544 )==FALSE then
		SysCastSpellLv( Lion , Lion , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
	end
	Skillindex = 5
	if GetDistance( Boss , Lion )<=550 and kg_CheckLive(Lion)==TRUE then
		CastSpellLv( Boss , Lion , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		AddBuff( Lion , Buff["BuffId"][Buffindex] , Buff["BuffLv"][Buffindex] , 10 )
		ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
		--�b�]�a   [104591]
		--DebugMsg(0,0,Skillindex )
		Sleep(10)
	end
end

function kg_104590_BossSkill20s( Boss , Lion , Skill , Buff )--��l�ľW
	DebugMsg(0,0,"20s")
	local Skillindex = 4
	--local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
	local PlayersInHate = KS_GetHateList( Boss , 1 )
	local atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]	--�H�����@�W
	if kg_CheckLive( Lion )==TRUE and CheckBuff( Lion , 508544 )==FALSE and kg_CheckAtk(atkTarget)==TRUE then
		Hide(Lion)
		SetModeEx( Lion , EM_SetModeType_Strikback, false) ---����(�_)
		Show(Lion,ReadRoleValue(Boss,EM_RoleValue_RoomID))
		CallPlot(Lion,"kg_104590_LionStrikback",Lion)
		CastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		local messageString = Skill["SkillString"][SkillIndex].."[$SETVAR1="..GetName( atkTarget ).."]"
		ScriptMessage( Boss , -1 , 2 ,messageString , C_SYSTEM )
		--[104591]�A[$VAR1]�b���i��
	end
	Sleep(10)
end

function kg_104590_LionStrikback( Lion )
	Sleep(70)
	local RoomID =ReadRoleValue(Lion,EM_RoleValue_RoomID)
	Hide(Lion)
	SetModeEx( Lion , EM_SetModeType_Strikback, true) ---����(�_)
	Show(Lion,RoomID)
end

function kg_104590_BossSkill30s( Boss , Lion , Skill , Buff )--4��۪k���Χ���,��l�񨭡A��l��D�Z4���۰ʶ]�^��ؼ�
	DebugMsg(0,0,"30s")
	local Skillindex = 9
	local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
	if GetDistance( Boss,atkTarget )<50 and kg_CheckAtk(atkTarget)==TRUE then
		if kg_CheckLive( Lion )==TRUE then
			CancelBuff( Lion , 508544 )--�����ת��J��
			SysCastSpellLv( atkTarget , Lion, 496930, 3 )--�i�M�w��ƪ��D�]
			CastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--��l��
			Skillindex = 8
			ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
			--[104591]  �ӧa  ���ڭӦ�
		end
		Skillindex = 8	--4��۪k���Χ���
		CastSpellLv( Boss , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		Sleep(70)
		CancelBuff( Lion , 508544 )--�����J��
	end
end

------------------------------��l�g��--------------------------------
function kg_104591_CrazyLionAI()--�V�~�v���`�ɤ~�|����
--EM_RoleValue_Register1 ������
--EM_RoleValue_Register2 Boss
--EM_RoleValue_Register4 �g�ɤ�
	local Lion = OwnerID()
	AddBuff(Lion ,508680,0,-1)--���ശ��
	local EnterBattle = 0
	local EndBattle = 1
	local PlayersInHate ={}
	local atkTarget
	local Skill = kg_104590_Skillinfo()
	local SkillIndex = 4
	
	while 1 do
		if KS_InCombat( Lion )==true then
			if EnterBattle == 0 then	--�i�J�԰�
				EnterBattle = 1
				EndBattle = 0
				
				PlayersInHate = KS_GetHateList( Lion , 1 )
				atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]	--�H�����@�W
				if  kg_CheckAtk(atkTarget)==TRUE then
					CancelBuff( Lion , 507181 )--�����D�]
					SysCastSpellLv( atkTarget, Lion, 495767, 0 )--����̰��ŬD�]
					CastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
					Sleep(20)
				end
			end
			
			if GetDistance( Lion, atkTarget)<=60 then
				SkillIndex = 1
				SysCastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--�y��
				PlayersInHate = KS_GetHateList( Lion , 1 )
				if table.getn(PlayersInHate)>1 then
					local RandVar = math.random(table.getn(PlayersInHate))
					local TempTarget = PlayersInHate[RandVar]--�q����C���H�N��@��
					if TempTarget == atkTarget or kg_CheckAtk(TempTarget)==FALSE  then--�H���ؼЭ�n����e�����ؼ�
						table.remove( PlayersInHate , RandVar )--�N�H���ؼбq����C������
						atkTarget = PlayersInHate[ math.random(table.getn(PlayersInHate)) ]--���s����H���ؼ�
					else
						atkTarget = PlayersInHate[ RandVar ]
					end
				elseif table.getn(PlayersInHate)==1 then
					atkTarget = PlayersInHate[1]
				end
				SkillIndex = 4
				CancelBuff( Lion , 507181 )--�������W���D�]
				SysCastSpellLv( atkTarget , Lion, 495767, 0 )--����̰��ŬD�]
				CastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--�ľW
				Sleep(12)
			else
				if ReadRoleValue( Lion, EM_RoleValue_AttackTargetID )~=atkTarget then--�ؼФ����T�ɦA�[�j�D�]
					CancelBuff( Lion , 507181 )--�����D�]
					SysCastSpellLv( atkTarget , Lion , 495767, 0 )--����̰��ŬD�]
				end
			end
		else
			if EndBattle==0 then	--�p����ӡA���a���ΡABoss���s����
				local RoomID =ReadRoleValue(Lion,EM_RoleValue_RoomID)
				kg_104591_SetBucket( RoomID,1 )
				EnterBattle = 0
				EndBattle = 1
				local Ctrl = ReadRoleValue(Lion,EM_RoleValue_Register1)
				local EnterDoor = ReadRoleValue(Ctrl,EM_RoleValue_Register9)
				DelObj(EnterDoor)--�R���J�f
				BeginPlot( Ctrl,"kg_104590_ResetBoss",1 )
				DelObj(Lion)--�R���ۤv
				break
			end
		end
		sleep(10)
	end
end

function kg_104591_LionDead()
	DebugMsg(0,0,"Lion Dead...")
	local Lion = OwnerID()
	local Boss = ReadRoleValue( Lion,EM_RoleValue_Register2 )
	local Ctrl = ReadRoleValue( Lion , EM_RoleValue_Register1 )
	local Buff = kg_104590_Buffinfo()
	ScriptMessage( Lion , -1 , 2 , "[SC_104590_03]" , C_SYSTEM )	--.........�q............
	if kg_CheckLive( Boss )==TRUE then
		AddBuff( Boss , Buff["BuffId"][2] , Buff["BuffLv"][2] , -1 )	--�V�~�v�g��
	else
		DebugMsg(0,0,"Lion Dead...")
		if ReadRoleValue(Ctrl,EM_RoleValue_Register3)==0 then
			WriteRoleValue(Ctrl,EM_RoleValue_Register3,1)
			BeginPlot(Ctrl,"kg_104590_BossAllDead",1)
		end
	end
end

function kg_104591_CheckLion()--��l�Q�@�l���줣�|�l��
	local monsterid = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if monsterid == 104591 or monsterid == 105457 or monsterid == 105543 or monsterid == 105545 then
		return FALSE
	else
		return TRUE
	end
end

---------------------------��l�P�׶�------------------------------
function kg_104591_PutMeatDown()	--���a�ϥΦװ��檺Script
--meatID  117200
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player,EM_RoleValue_RoomID)
	local meat = kg_GetRangePos( Player , 105457 , 10 )  --��a�� kg_GetPos( Player , 117200 )
	kg_Target( meat )
	SetModeEx( meat , EM_SetModeType_Fight, false) ---�i���(�_)
	AddToPartition( meat,RoomID )
	BeginPlot(meat,"kg_104591_MeatAI",0 )
end

function kg_104591_MeatAI()	--�J�اa!��!
--496930 �J�ط�l
	local meat = OwnerID()
	local RoomID = ReadRoleValue(meat,EM_RoleValue_RoomID)
	local LionName = "Zone136_Boss2_Lion_"..RoomID
	local Lion = kg_BossGV[LionName]
	DebugMsg(0,0,"LionGID = "..Lion )
	for i=1 , 6 do
		local Player = KS_GetHateList( Lion, 3 )--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a)
		if table.getn(Player)~=0 then
			Hide(meat)
			SetModeEx( meat , EM_SetModeType_Fight, TRUE) ---�i���(�_)
			Show(meat,RoomID)
			if GetDistance( meat, Lion )<=100 and ReadRoleValue(Lion,EM_RoleValue_Register4)~=1 then
				SysCastSpellLv( meat , Lion, 496930, 3 )--�i�M�w��ƪ��D�]
				DebugMsg(0,0,"come on , Lion!! ")
			end
		else
			Hide(meat)
			SetModeEx( meat , EM_SetModeType_Fight, false) ---�i���(�_)
			Show(meat,RoomID)
		end
		Sleep(10)
	end
	DelObj(meat)
end

function kg_104591_CreateBucket()
--BucketID 117201
--EM_RoleValue_Register8 ��lCD��
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue(Ctrl ,EM_RoleValue_RoomID)
	local Buckets = kg_CreateMultiObj( Ctrl , 117201 , 1 , 5 , -3 , 100 , 150 , 0 , 360 ,"kg_104591_BucketInit" )--�гy�h�ӱ�l�ê�l��
	local TempString = "Zone136_Boss2_Buckets_"..RoomID
	kg_BossGV[TempString] = Buckets
end

function kg_104591_BucketInit()
	local Bucket = OwnerID()
	WriteRoleValue( Bucket , EM_RoleValue_Register8,0 )
	--SetPlot( Bucket , "touch" , "kg_104591_TouchBucket" , 30 )
	--Sleep(300)
	--DelObj(Bucket)
end

function kg_104591_SetBucket( RoomID,Mode )--0:����l�i�H��  1:����l���ள  2:�N��l�R��
	local TempString = "Zone136_Boss2_Buckets_"..RoomID
	local Buckets = kg_BossGV[TempString]
	if Buckets~=nil then
		for i in pairs(Buckets) do
			if Mode==0 then
				SetPlot( Buckets[i] , "touch" , "kg_104591_TouchBucket" , 30 )
			elseif Mode==1 then
				SetPlot( Buckets[i],"touch","",0 )
			elseif Mode==2 then
				DelObj( Buckets[i] )
			end
		end
	end
	if Mode==2 then kg_BossGV[TempString]=nil end
end

function kg_104591_TouchBucket()
--���~��id 208712
	local Player=OwnerID()
	local Bucket = TargetID()
	if CountBodyItem( Player, 208712 )==0 then
		if ReadRoleValue(Bucket,EM_RoleValue_Register8)==0 then
			WriteRoleValue( Bucket,EM_RoleValue_Register8,1 )
			GiveBodyItem( Player , 208712 , 1  )
			CallPlot( Bucket,"kg_104591_BucketCD", Bucket )
		else
			ScriptMessage( Bucket,Player,0,"[SC_104590_11]", C_SYSTEM )
			--�o��l�ܰ�T�A��l���S���F��
		end
	else
		ScriptMessage( Bucket,Player,0,"[SC_104590_12]", C_SYSTEM )
		--�@�H�@���A���n�g��
	end
end

function kg_104591_BucketCD( Bucket )
	Sleep(300)--CD30��
	DebugMsg(0,0,"time's up")
	WriteRoleValue( Bucket,EM_RoleValue_Register8,0 )
end