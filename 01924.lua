function un_GW_Siege_Born() --�i����𨾥[�I��l�@���j
--�� OrgID�P�_ ���n��PCALL

	local OwnerIDOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --�ثe���㤧OrgID
	local Siege = {102756,--�����x
			 102757,--�s����
			 102758,--�X�v������
			 102759,--�Ī���
			 102760,--�K���Ĩ�
			 102761,--�L�ȶ�����
			 102762,--�o�ۥx
			 102763,--��ۨ�
			 102764}--�P�K������

	local BuffKind = 0 

	for i = 1,9 do

		if Siege[i]==OwnerIDOrgID then
			BuffKind = i
		end
	end

	local SiegeA={505513,80,505516,300,505514,100,505512,25}--�����x 		��NPC�I�z�B�W��NPC�B�𪱮a�W�ˡB�Q���a��I�z
	local SiegeB={505513,75,505516,300,505514,100,505512,25}--�s����
	local SiegeC={505513,70,505516,300,505514,100,505512,25}--�X�������� 
	--{ ��NPC�˴�B�QNPC��[�B�𪱮a�˥[�B�Q���a��[ }
	local SiegeD={505923,160,505516,300,505515,70,505921,5}--�Ī���
	local SiegeE={505923,180,505516,300,505515,65,505921,5}--�K���Ĩ�
	local SiegeF={505923,200,505516,300,505515,60,505921,5}--�L�ȶ����� 
	--{ ��NPC�˥[�B�QNPC��[�B�𪱮a�˴�B�Q���a��� }
	local SiegeG={505923,160,505516,300,505514,80,505512,25}--�o�ۥx
	local SiegeH={505923,160,505516,300,505514,80,505512,25}--��ۨ� 
	local SiegeI={505923,180,505516,300,505514,80,505512,25}--�P�K������
	--{ ��NPC�˥[�B�QNPC��[�B�𪱮a�˥[�B�Q���a��[ }
	local Buff ={SiegeA,SiegeB,SiegeC,SiegeD,SiegeE,SiegeF,SiegeG,SiegeH,SiegeI}

	AddBuff( OwnerID() ,Buff[BuffKind][1] ,Buff[BuffKind][2] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][3] ,Buff[BuffKind][4] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][5] ,Buff[BuffKind][6] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][7] ,Buff[BuffKind][8] ,-1 );  
	AddBuff( OwnerID() ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

	if BuffKind == 1 then
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
		--local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

		local StageNpc = CreateObj( 113694 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)--�����x�ؿv�I
		AddToPartition( StageNpc , RoomID )  
		--SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

		sleep(5)
		SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--�аO
		SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
		SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
		SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
		SetPlot( StageNpc , "touch" , "" , 0 )	--���|���Ԯ�
		WriteRoleValue( OwnerID() , EM_RoleValue_Register, StageNpc ) --�O��ؿv��a���X
		SetPlot(  OwnerID(), "dead","Yuyu_GW_Siege_eq_2_05",0 )     
	end
end
function un_GuildWarAC_1_00(Seat,UpDown) -- ���|�ԮɡA�i�����l�@���j
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

	SkillID[1] = -1
	SkillID[2] = -1
	SkillID[3] = -1
	SkillID[4] = -1
	SkillID[5] = -1
	SkillID[6] = -1
	SkillID[7] = -1
	SkillID[8] = -1

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
function un_21345345334()
	addbuff(OwnerID(),508111,0,-1)
end		
function V()
	say(OwnerID(),"123")
end
function un_monsterskill_test()
	local silltime = 0
	local AttackTarget
	while true do
	sleep(10)
		silltime=silltime+1
		if silltime%7 ==0 then
			AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			CastSpell ( OwnerID() , AttackTarget , 496468  )
		end
	end
end
function un_BUFF_test()
	addbuff(OwnerID(),506738,0,-1)
end
function un_testsearch()
	local TableA ={}
	local TableB ={}
	local TableC ={}
	TableA = SearchRangeNPC ( OwnerID() , 100 )
	TableB = SearchRangePlayer ( OwnerID() ,100 )
	--say(OWnerID(),"tableA = "..table.getn(TableA))
	--say(OWnerID(),"tableb = "..table.getn(Tableb))
	local x = table.getn(TableA)  --X =  TableA�����ƶq �A�]���t��table�O�q1�}�l�P�w�A���OŪ���O�q0�}�lŪ��
	local y = table.getn(Tableb)  -- �ҥH�p�G�n�Ψ�FOR�j�����ܭn���X�@�ӼȦs�� -1�ƶq�}�lŪ��
	for i=0 , x-1 do              
		table.insert(TableC,TableA[i])  --��TableA[i]�����F����TableC
	end
	for i=0 , y-1 do
		table.insert(TableC,Tableb[i])  --��Tableb[i]�����F����TableC
	end
	local z = table.getn(TableC)
	--say(OWnerID(),"tablec = "..table.getn(TableC))
	for i=0 , z-1 do
		say(OwnerID(),"tableC"..i+1 .."= "..TableC[i+1])
	end
end

