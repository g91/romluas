
function Yuyu_GuildWarAC_1_00(Seat,UpDown) -- ���|�ԮɡA�i�����l�@���j
--Say(OwnerID(),OwnerID())--���a
--Say(TargetID(),TargetID())--����
--Seat �^�Ǫ��a�ثe�Ҧb�������m
--Kind �^�Ǹ������
--SetExSkill()( int GItemID , int SpellerID , int SkillID , int SkillLv );
--�]�w����Ϊk�N�b���a���W 
--DelExSkill( int GItemID , int SpellerID , int SkillID );
--�R�������]�w�k�N SpellID = -1 ��ܩ����ˬd�I�k��, SkillID = -1 ��ܩ����ޯ�����
--Seat		���㭼����m
--UpDown	�W�� �O 1 �U���O 0
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local TargetIDOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�ثe���㤧OrgID
	local AC_Kind = {102756,--�����x	1
			 102757,--�s����	2
			 102758,--�X�v������	3

			 102759,--�Ī���	4
			 102760,--�K���Ĩ�	5
			 102761,--�L�ȶ�����	6

			 102762,--�o�ۥx	7
			 102763,--��ۨ�	8
			 102764}--�P�K������	9

	local Kind = 0 

	for i = 1,9 do

		if AC_Kind[i]==TargetIDOrgID then
			Kind = i
			break
		end
	end

--Say(OwnerID(),"Kind="..Kind)
--Say(TargetID(),"TargetIDSeat="..Seat)
--Say(OwnerID(),"OwnerIDSeat="..Seat)
--Say(TargetID(),"TargetIDUpDown="..UpDown)
--Say(OwnerID(),"OwnerIDUpDown="..UpDown)
	
	local Skill_AC_A = {	495085,--�����g��	--��
				495090,--�s�򱽮g	
				495091,--�d�򱽮g	
				495099,--�u�@���b	
				495238}--�e�����b	


	local Skill_AC_B = {	495083,--���l����	--��
				495240,--�R���аO	
				495092,--�w�߭ײz��	
				495093,--���r����	
				495241,--�R���аO	
				495239,--������	
				495242,--�R���аO	
				495094}--�e���ļ�	

	local Skill_AC_C = {	495082,--���y���Y	--��
				495084,--�H�ۧ��Y							
				495088,--�۶����Y	
				495089}--�J�o���Y	

	local Skill_ALL = {Skill_AC_A,Skill_AC_B,Skill_AC_C}

	local SkillID = {}

	SkillID[1] = 0
	SkillID[2] = 0
	SkillID[3] = 0
	SkillID[4] = 0
	SkillID[5] = 0
	SkillID[6] = 0
	SkillID[7] = 0
	SkillID[8] = 0

	local SkillLV = {}

	SkillLV[1] = 0
	SkillLV[2] = 0
	SkillLV[3] = 0
	SkillLV[4] = 0
	SkillLV[5] = 0
	SkillLV[6] = 0
	SkillLV[7] = 0
	SkillLV[8] = 0

	local sB = 5
	local sV = 70


	if (Kind == 1) or (Kind == 2) or (Kind == 3) then		--����
		for i = 1,table.getn(Skill_ALL[1]) do
			SkillID[i] = Skill_AC_A[i]
			SkillLV[i] = (SkillLV[i] + (Kind-1))*sB+sV+sB
		end

	elseif (Kind == 4) or (Kind == 5) or (Kind == 6) then		--�Ĩ�
		for i = 1,table.getn(Skill_ALL[2]) do
			SkillID[i] = Skill_AC_B[i]
			SkillLV[i] = (SkillLV[i] + (Kind-1))*sB+sV+sB
		end

	elseif (Kind == 7) or (Kind == 8) or (Kind == 9) then		--���
		for i = 1,table.getn(Skill_ALL[3]) do
			SkillID[i] = Skill_AC_C[i]
			SkillLV[i] = (SkillLV[i] + (Kind-1))*sB+sV+sB
		end
	end
--�����x	1
--�s����	2
--�X�v������	3

--�Ī���	4
--�K���Ĩ�	5
--�L�ȶ�����	6

--�o�ۥx	7
--��ۨ�	8
--�P�K������	9

	if UpDown == 1 then--�W����
		SetFlag( OwnerID()  , 543769 , 1 )--���a�b����W���X��
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , TargetID())	
		if (Kind == 1) or (Kind == 4) or (Kind == 7) then --�ާ@�M��ޯ�O�P�@�ӤH (���b��m0)

			if PassCard > 0 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
			elseif Seat == 0 then --���b��m1�� 
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
			elseif Seat == 1 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
			end

		elseif (Kind == 2)  or (Kind == 5) or (Kind == 8) or (Kind == 3) or (Kind == 6) or (Kind == 9) then

			if PassCard > 0 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
				SetExSkill( OwnerID() , TargetID() , SkillID[3] , SkillLV[3] )
				SetExSkill( OwnerID() , TargetID() , SkillID[4] , SkillLV[4] )
				SetExSkill( OwnerID() , TargetID() , SkillID[5] , SkillLV[5] )
				SetExSkill( OwnerID() , TargetID() , SkillID[6] , SkillLV[6] )
				SetExSkill( OwnerID() , TargetID() , SkillID[7] , SkillLV[7] )
				SetExSkill( OwnerID() , TargetID() , SkillID[8] , SkillLV[8] )
			elseif Seat == 0 then --���b��m1�� 
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
			elseif Seat == 1 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
			elseif Seat == 2 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[3] , SkillLV[3] )
			elseif Seat == 3 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[4] , SkillLV[4] )
			elseif Seat == 4 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[5] , SkillLV[5] )
			elseif Seat == 5 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[6] , SkillLV[6] )
			elseif Seat == 6 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[7] , SkillLV[7] )
			elseif Seat == 7 then
				SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
				SetExSkill( OwnerID() , TargetID() , SkillID[8] , SkillLV[8] )
			end
		end
--�H�U�����ȼW�q--


		local BuildStr = {
				  "[SC_YU_GUILDWAR_BUILD_79]",	--��

				  "[SC_YU_GUILDWAR_BUILD_81]",	--��

				  "[SC_YU_GUILDWAR_BUILD_80]"}	--��	 --��޻�����

		local UPStr = 0	--�����k�N

		local SkillBuffID = 0

		if (Kind == 1) or (Kind == 2) or (Kind == 3) then --�����t�C
			SkillBuffID = 506157
			UPStr = BuildStr[1]
		elseif (Kind == 4) or (Kind == 5) or (Kind == 6) then --�Ĩ��t�C
			SkillBuffID = 506159
			UPStr = BuildStr[2]
		elseif (Kind == 7) or (Kind == 8) or (Kind == 9) then --�o�ۨt�C
			SkillBuffID = 506158
			UPStr = BuildStr[3]
		end

		local Set_A =-1
		local Count = BuffCount ( TargetID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
			if BuffID == SkillBuffID then
				local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
				Set_A = BuffLv

			end
		end

		if Set_A>-1 then
			Set_A = Set_A+1
			CancelBuff( TargetID() , SkillBuffID )
			AddBuff( TargetID() , SkillBuffID , Set_A , -1 )
		else
			AddBuff( TargetID() , SkillBuffID , 0 , -1 )
		end

		ScriptMessage( OwnerID() , OwnerID() , 1 , UPStr, C_SYSTEM ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , UPStr, C_SYSTEM ) 



--****************--


	elseif UpDown == 0 then--�U����
		SetFlag( OwnerID()  , 543769 , 0 )--���a�b����W���X��
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
		for i = 1, 3 do
			for j=1 , table.getn(Skill_ALL[i]) do
				DelExSkill( OwnerID() , TargetID() , Skill_ALL[i][j] )
			end
		end



--�H�U�����ȼW�q--
		local SkillBuffID = 0

		if (Kind == 1) or (Kind == 2) or (Kind == 3) then --�����t�C
			SkillBuffID = 506157
		elseif (Kind == 4) or (Kind == 5) or (Kind == 6) then --�Ĩ��t�C
			SkillBuffID = 506159
		elseif (Kind == 7) or (Kind == 8) or (Kind == 9) then --�o�ۨt�C
			SkillBuffID = 506158
		end

		local Set_A =-1
		local Count = BuffCount ( TargetID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
			if BuffID == SkillBuffID then
				local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
				Set_A = BuffLv

			end
		end

		if Set_A == 0 then
			CancelBuff( TargetID() , SkillBuffID )
		else
			Set_A = Set_A-1
			CancelBuff( TargetID() , SkillBuffID )
			AddBuff( TargetID() , SkillBuffID , Set_A , -1 )
		end

--****************--

		DelExSkill( OwnerID() , -1 , -1 )
	
		DelExSkill( OwnerID() , TargetID() ,495085 )
		DelExSkill( OwnerID() , TargetID() ,495090 )
		DelExSkill( OwnerID() , TargetID() ,495091 )
		DelExSkill( OwnerID() , TargetID() ,495099 )
		DelExSkill( OwnerID() , TargetID() ,495238 )
		DelExSkill( OwnerID() , TargetID() ,495083 )
		DelExSkill( OwnerID() , TargetID() ,495240 )
		DelExSkill( OwnerID() , TargetID() ,495092 )
		DelExSkill( OwnerID() , TargetID() ,495093 )
		DelExSkill( OwnerID() , TargetID() ,495241 )
		DelExSkill( OwnerID() , TargetID() ,495239 )
		DelExSkill( OwnerID() , TargetID() ,495242 )
		DelExSkill( OwnerID() , TargetID() ,495094 )
		DelExSkill( OwnerID() , TargetID() ,495082 )
		DelExSkill( OwnerID() , TargetID() ,495084 )
		DelExSkill( OwnerID() , TargetID() ,495088 )
		DelExSkill( OwnerID() , TargetID() ,495089 )

		DelExSkill( OwnerID() , TargetID() ,495085 )
		DelExSkill( OwnerID() , TargetID() ,495090 )
		DelExSkill( OwnerID() , TargetID() ,495091 )
		DelExSkill( OwnerID() , TargetID() ,495099 )
		DelExSkill( OwnerID() , TargetID() ,495238 )
		DelExSkill( OwnerID() , TargetID() ,495083 )
		DelExSkill( OwnerID() , TargetID() ,495240 )
		DelExSkill( OwnerID() , TargetID() ,495092 )
		DelExSkill( OwnerID() , TargetID() ,495093 )
		DelExSkill( OwnerID() , TargetID() ,495241 )
		DelExSkill( OwnerID() , TargetID() ,495239 )
		DelExSkill( OwnerID() , TargetID() ,495242 )
		DelExSkill( OwnerID() , TargetID() ,495094 )
		DelExSkill( OwnerID() , TargetID() ,495082 )
		DelExSkill( OwnerID() , TargetID() ,495084 )
		DelExSkill( OwnerID() , TargetID() ,495088 )
		DelExSkill( OwnerID() , TargetID() ,495089 )
	end
end

--====================================================================================================================

function Yuyu_GuildWarAC_2_0() -- �i����j�w�߭ײz�l
--Say(OwnerID(),"OwnerID")--���㥻��
--Say(TargetID(),"TargetID")--�Q�v����

	local OwnerIDOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --�ثe���㤧OrgID
	local TarOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�Q�v���̤�OrgID

	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )--�Q�v����

	local AC_Kind = {102756,--�����x		
			 102757,--�s����		
			 102758,--�X�v������		
			 102759,--�Ī���		4
			 102760,--�K���Ĩ�		5
			 102761,--�L�ȶ�����		6
			 102762,--�o�ۥx	
			 102763,--��ۨ�	
			 102764}--�P�K������	

	local Kind = 0 
	local Cure = 0 

	for i = 1,9 do

		if AC_Kind[i]==OwnerIDOrgID then
			Kind = i
			break
		end
	end

--Say(OwnerID(),"Kind="..Kind)
--Say(OwnerID(),"MaxHP="..MaxHP)


	if Kind > 0 then
		MaxHP = MaxHP *0.05
		Cure = (Kind-4)*MaxHP
		Cure = math.ceil(Cure)--�p���I�H�U���˥h
		AddRoleValue( TargetID()  , EM_RoleValue_HP ,  Cure  )

	--	Say(OwnerID(),"Cure="..Cure)
	--	Say(OwnerID(),"Cure=".."["..TarOrgID.."]")


		local TargetIDName = "|cffffff20".."["..TarOrgID.."]".."|r"
		local str = "[SC_YU_GUILDWAR_BUILD_70][$SETVAR1="..TargetIDName.."][$SETVAR2="..Cure.."]"--�ײz�F�h��HP

		ScriptMessage( OwnerID() , 0 , 1 , str, 0 ) 
		ScriptMessage( OwnerID() , 0 , 0 , str, 0 ) 

	else
		ScriptMessage( OwnerID() , 0 , 1 , "[SC_YU_GUILDWAR_BUILD_56]", C_SYSTEM ) --�I�k��H�����T
		ScriptMessage( OwnerID() , 0 , 0 , "[SC_YU_GUILDWAR_BUILD_56]", C_SYSTEM ) 

	end

end



--====================================================================================================================

function Yuyu_GW_SBSkill_0_0( ) --�i����o�ۨ��j�J�o���Y

	local OID = OwnerID()
	local TID = TargetID()	

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( TargetID() )--���a���}��

	local VOC = ReadRoleValue( TID , EM_RoleValue_VOC )--���a¾�~

--Say(OwnerID(),"OwnerID")--��������
--Say(TargetID(),"TargetID")--���a

	local StageNpc = CreateObj( 103136 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

	AddToPartition( StageNpc , RoomID )  

--Say(StageNpc , "StageNpc")--�s����
	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--����ܦ��

	BeginPlot( StageNpc , "Yuyu_GW_SBSkill_0_1" , 0 )  
	BeginPlot( StageNpc , "Yuyu_GW_BigSkill_0_03" , 0 )  
end

function Yuyu_GW_SBSkill_0_1( ) --�i����o�ۨ��j�J�o���Y �c���v�h

--Say(OwnerID(),"OwnerID")--�s����
--Say(TargetID(),"TargetID")--�s����
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

--	local StageNpc = CreateObj( 113693 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	local Npc_1 = CreateObj( 103136 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	AddToPartition( Npc_1 , RoomID )  

	SetModeEx( Npc_1 , EM_SetModeType_Strikback, false )--����
	SetModeEx( Npc_1 , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Npc_1 , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Npc_1 , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Npc_1 , EM_SetModeType_Move, false )--����
	SetModeEx( Npc_1 , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Npc_1 , EM_SetModeType_HideName, true )--�W��
	SetModeEx( Npc_1 , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Npc_1 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Npc_1 , EM_SetModeType_DisableRotate, true )--��V
	SetModeEx( Npc_1  , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	SetRoleCampID( Npc_1, PlayerGuildID )--�g�J�}��
	BeginPlot( Npc_1 , "Yuyu_GW_SBSkill_0_4" , 0 )  
	BeginPlot( Npc_1 , "Yuyu_GW_SBSkill_0_2" , 0 )  
	AddBuff( Npc_1 , 506161 , 0 , -1 )	--�����S��

	sleep(50)

	local Npc_2 = Lua_Davis_BornByMultilateral( 103136 , 3 , 40 ) --(����ID,�ͥX�X��,�b�|)

	for j=1 , table.getn(Npc_2) do	

		SetModeEx( Npc_2[j] , EM_SetModeType_Strikback, false )--����
		SetModeEx( Npc_2[j] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Npc_2[j] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Npc_2[j] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Npc_2[j] , EM_SetModeType_Move, false )--����
		SetModeEx( Npc_2[j] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Npc_2[j] , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Npc_2[j] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Npc_2[j] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Npc_2[j] , EM_SetModeType_DisableRotate, true )--��V
		SetModeEx( Npc_2[j]  , EM_SetModeType_NotShowHPMP, true )--����ܦ��
		SetRoleCampID( Npc_2[j], PlayerGuildID )--�g�J�}��
		BeginPlot( Npc_2[j] , "Yuyu_GW_SBSkill_0_4" , 0 )  
		BeginPlot( Npc_2[j] , "Yuyu_GW_SBSkill_0_3" , 0 )  
		AddBuff( Npc_2[j] , 506161 , 0 , -1 )	--�����S��
	end

end

function Yuyu_GW_SBSkill_0_2( ) --�i�j���ۡj�c���v�h �ͦs�ɶ�
	sleep(50)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

function Yuyu_GW_SBSkill_0_3( ) --�i�j���ۡj�c���v�h �ͦs�ɶ�
	sleep(50)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

function Yuyu_GW_SBSkill_0_4( ) --�i�c���v�h����I�k�j

	while true do
		CastSpelllv( OwnerID() , OwnerID() , 495096 , 1 )
		sleep(10)
	end
end

--====================================================================================================================

function Yuyu_GW_SBSkill_1_0( ) --�i����Ĩ��j�e���ļ�

--Say(OwnerID(),"OwnerID()")
--Say(TargetID(),"TargetID()")

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	------------------- �b�ؼЫe���@�w�Z�������ͤ@�Ӫ���A�p�G���I�L�k���ͪ��~�A�h�b�ؼЦ�m���͡]���|addToPartition�^---------------
	local StageNpc = Lua_CreateObjByDir( OwnerID() , 103447 , 100 , 0) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���

	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
--Say(OwnerID(),PlayerGuildID)

	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, true )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	WriteRoleValue( StageNpc  , EM_RoleValue_Register , OwnerID()) 
	AddToPartition( StageNpc , RoomID ) 
 
--Say(StageNpc,"StageNpc()")
--Say(StageNpc , "StageNpc")--�s����
--	if PlayerGuildID == 7 then
--		SetRoleCampID(StageNpc,8)--�g�J�}��
--		PlayerGuildID = GetRoleCampID( StageNpc )--���a���}��
--Say(StageNpc,PlayerGuildID.."StageNpc")
--	elseif PlayerGuildID == 8 then
--		SetRoleCampID(StageNpc,7)--�g�J�}��
--		PlayerGuildID = GetRoleCampID( StageNpc )--���a���}��
--Say(StageNpc,PlayerGuildID.."StageNpc")
--	end

	BeginPlot( StageNpc , "Yuyu_GW_SBSkill_1_1" , 0 )  
	BeginPlot( StageNpc , "Yuyu_GW_SBSkill_1_2" , 0 )  

end

function Yuyu_GW_SBSkill_1_1( ) --�i����Ĩ��j�e���ļ�
	sleep(20)
	local Monster = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register )
--Say(OwnerID(),"OwnerID")--�s����
--Say(TargetID(),"TargetID")--�s����
--Say(Monster,"Monster")--�s����

--	CastSpelllv( OwnerID() , Monster , 495095 , 30 )
	CastSpelllv( Monster , OwnerID() , 495095 , 30 )

end

function Yuyu_GW_SBSkill_1_2( ) --�i����Ĩ��j�e���ļ� �ͦs�ɶ�
	sleep(50)
	Delobj(OwnerID())
end

--====================================================================================================================