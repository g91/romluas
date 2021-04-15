------------------------------------------�̽u����NO.1�]����J���W����ܼ@���^
function LuaS_423176()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423176 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423176_0]" , "LuaS_423176_1", 0 )		--�ڷǳƦn�F�I�@�_�e���ǿմ���˪L�a�I
	end
end

function LuaS_423176_1()	

	CloseSpeak( OwnerID() )	
	if	ChangeZone( OwnerID() , 16 , 0 , -9298.7, -454.7 , 18009.5 , 227.4 )	then	
		SetFlag(OwnerID() , 543918 , 1 )
	end
end

function LuaS_423176_Complete()	
	AddBuff( TargetID() , 506613 , 1 , -1 )	--�n�[�b���a���W��BUFF
	DisableQuest( OwnerID() ,true )
	local Kid = Lua_DW_CreateObj("flag" , 115058 ,780592 , 2 )		--�إX���H��
	WriteRoleValue(Kid , EM_RoleValue_IsWalk, 0 )
	Hide( Kid )
	Show( Kid ,0)
	DisableQuest( Kid ,true )
	MoveToFlagEnabled( Kid , false )
	LuaFunc_MoveToFlag( Kid , 780592 , 3 ,  0 )	
	Say( Kid , "[SC_423176_1]")						--���O����J�C��O����J�C���٦��@�W......�ݰ_�Ӧn���ͪ��_�I�̡H
	PlayMotion( Kid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( Kid , "[SC_423176_2]")						--��F�I����J�A�@�_�L�ӶܡH�����S���b�e�褣�����a��A�A�n���n�@�_�L�өO�C
	sleep(30)
	Say( Kid , "[SC_423176_3]")						--�����S�ݨ��A�A�@�w�|�ܶ}�ߡC
	PlayMotion( Kid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Delobj( Kid )
	CancelBuff( TargetID() , 506613)	--�R�����a���W��BUFF 
	DisableQuest(OwnerID() ,false )
end

---------------------------------------�̽u����NO.2(����J115060���W����ܼ@��)--�@�eco�o��
function LuaS_423177()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423177 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423177_0]" , "LuaS_423177_CHECK", 0 )		--�ڷǳƦn�F�I
	end
end

function LuaS_423177_CHECK()	
	local Player=OwnerID();
	CloseSpeak(Player);
	BeginPlot(Player,"LuaRB_423177_AfterSpeak",0);
--[[�ª����e
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_423177_1" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423177_1]")			--�����A�ڦ��G�P����F�@�Ǥ������O�C
	end--]]
end
function LuaRB_423177_AfterSpeak()--��U��ܿﶵ����, �⪱�a�ǹL�h�A���L�����X�СA�d�w(�@��function�N�⥦�d�w) �^�פ��o�W�L5.0.3
	local Player=OwnerID();
	local FadePlayerWithBlack=620001
	AddBuff(Player,FadePlayerWithBlack,0,4);
	sleep(10);
	SetPos(Player,-9076,-380,18779,289);
	SetDir(Player,289);
	SetFlag(Player,543919,1);
	local x,y,z,dir=DW_Location(780601,3);
	local NewCentaur=CreateObj(115063,x,y,z,dir,1);
	AddToPartition(NewCentaur,ReadRoleValue(Player,EM_RoleValue_RoomID));
	Say(NewCentaur,"[SC_423177_8]");
	SetFlag(Player,543920,1);
	CancelBuff_NoEvent(Player,FadePlayerWithBlack);
end
function LuaS_423177_1()	
	local Party = {}
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423177 ) == true		and
			GetDistance(Party[i] , OwnerID() ) < 150			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			SetFlag(Party[i] , 543919 , 1 )	
			AddBuff(Party[i] , 506614 , 100 , -1 )  
		end
	end
	local Morrok = LuaFunc_CreateObjByOBj( 115062, OwnerID() )			--�X�{�t��������J
	DisableQuest( Morrok ,true )
	WriteRoleValue ( Morrok , EM_RoleValue_PID, OwnerID() )

	BeginPlot( Morrok , "LuaS_423177_Range_CHECK" , 0 )
	BeginPlot( Morrok , "LuaS_423177_2" , 0 )
end

function LuaS_423177_2()		--�D�n�@��	
	local OMorrok = ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	local OKid = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115059 , 400 )		--�]�j�M���W���訽�S�^
	local Kid = LuaFunc_CreateObjByOBj( 115061, OKid )				--�X�{�t�����訽�S
	DisableQuest( Kid ,true )
	WriteRoleValue ( Kid , EM_RoleValue_PID, OwnerID() )
	BeginPlot( Kid , "LuaS_423177_Kid_CHECK" , 0 )

	MoveToFlagEnabled( OwnerID() , false )
	MoveToFlagEnabled( Kid , false )
	LuaFunc_MoveToFlag( Kid , 780601 , 1 ,  0 )
	sleep(10)
	AdjustFaceDir( Kid , OwnerID(), 0 )
	sleep(10)
	PlayMotion( Kid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Kid , "[SC_423177_2]" , 3 ) 				--���a�I ���a�I ����J�I
	sleep(20)
	Yell( OwnerID() , "[SC_423177_3]" , 3 ) 			--�訽�S�Eģ�~�A���U�ӴN�·ЧA�a�ڭ̨�F���J�Ҧb���a��C
	AdjustFaceDir( OwnerID() , Kid, 0 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Yell( Kid , "[SC_423177_4]" , 3 )				--�n�� 
	BeginPlot( Kid , "LuaS_423177_Kid_go" , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780601 , 2 ,  0 )		--�P�����ͪ����S
	BeginPlot( OwnerID() , "LuaS_423177_Art" , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780601 , 4 ,  0 )
	local Art = ReadRoleValue(OwnerID(),EM_RoleValue_Register)
	
	sleep(20)
	Yell( Art , "[SC_423177_7]" , 3 ) 				--����o�@�����O�P�������ްڡ�ר�O�o�컷�D�ӨӪ��s�B�͡�
	sleep(30)
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_THINK ) 
	Yell( Art , "[SC_423177_8]" , 3 ) 				--�u�O�ꥩ�ڡ�ڱo�N���̤l��n�e�s�L�ӡI�A�̤@�w�n�~���ݬݳo�Ӭ��s�I�J�����S���f��
	sleep(30)
	PlayMotion( Art ,  ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell( Art , "[SC_423177_9]" , 3 ) 				--�訽�S�Eģ�~�A�h�s�㺸�S�E��P�]�@�_�L�ӡC
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	BeginPlot( OwnerID() , "LuaS_423177_Finish" , 0 )
	sleep(10)
	Delobj( Art )
	Delobj( Kid )
	writerolevalue( OMorrok , EM_RoleValue_PID , 0 )
	Delobj( OwnerID() )
end

function LuaS_423177_Range_CHECK()
	local OMorrok = ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 250)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423177 ) == true	and
				CheckFlag( Group[i] , 543919 ) == true		then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue( OMorrok , EM_RoleValue_PID , 0 )
	Delobj( OwnerID() )
end

function LuaS_423177_Player_CHECK()
	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115062	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423177_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 506614 )
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 543919 , 0 )
end

function LuaS_423177_Finish()
	local Gp = {}
	Gp = SearchRangePlayer(OwnerID() , 250)
	for i=0,table.getn(Gp)-1 do
		if	CheckAcceptQuest( Gp[i], 423177 ) == true	and
			CheckFlag( Gp[i] , 543919 ) == true		then
			SetFlag(Gp[i] , 543920 , 1 )
			CancelBuff( Gp[i] , 506614 )
		end
	end
end

function LuaS_423177_Kid_CHECK()	
	local Morrok = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	for i = 0 , 100 , 1 do
		if	CheckID(Morrok) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423177_Art_CHECK()	
	local Morrok = ReadRoleValue(OwnerID(),EM_RoleValue_Register )
	for i = 0 , 100 , 1 do
		if	CheckID(Morrok) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423177_Kid_go()	
	LuaFunc_MoveToFlag( OwnerID() , 780601 , 15 ,  0 )
	LuaFunc_MoveToFlag( OwnerID() , 780601 , 5 ,  0 )
	Yell( OwnerID() , "[SC_423177_6]" , 3 ) 			--�O�ڦb�˪L�J���L����I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
end

function LuaS_423177_Art()	
	local Art = Lua_DW_CreateObj("flag" , 115063 ,780601 , 3 )
	BeginPlot( Art , "LuaS_423177_Art_CHECK" , 0 )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register , Art )
	WriteRoleValue ( Art , EM_RoleValue_Register , OwnerID() )
	DisableQuest( Art ,true )
	Yell( Art , "[SC_423177_5]" , 3 ) 			--�o���O����J�ܡH�n�[�����F�C
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
end

---------------------------------------�̽u����NO.3
function LuaS_423178_Accept()	
	local Art = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115065 , 100 )		--���o�쥻�������S
	local Morrok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115067 , 100 )	--���o�쥻������J
	DisableQuest( Art ,true )
	DisableQuest( OwnerID() ,true )
	DisableQuest( Morrok ,true )
	Yell( Morrok , "[SC_423178_1]" , 3 )					--�����S�A�̪�o���˪L���S���_�����ܤơC
	PlayMotion( Morrok , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Art , "[SC_423178_2]" , 3 )					--����J�A�A�ٰO�o�L�h�ڬ��A�e�P�����G�ܡH
	PlayMotion( Art ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(30)
	Yell( Morrok , "[SC_423178_3]" , 3 )					--�A�O���K�K
	sleep(30)
	Yell( Art , "[SC_423178_4]" , 3 )					--�ڷ��ҶD�����R�B�A�ܤ��̵M�S������......
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	DisableQuest( OwnerID() ,false )
	DisableQuest( Art ,false )
	DisableQuest( Morrok ,false )
end

function LuaS_423178_Complete()	
	AddBuff( TargetID() , 506616 , 1 , -1 )					--�n�[�b���a���W��BUFF
	local Star = Lua_DW_CreateObj("flag" , 115068 ,780614 , 1 )		--��P�X�{
	local OArt = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115065 , 200 )		--�]�j�M���W�������S�^
	local Art = LuaFunc_CreateObjByOBj( 115069, OArt )				--�X�{�t���������S
	DisableQuest( OwnerID() ,true )
	DisableQuest( Art ,true )
	DisableQuest( Star ,true )
	Yell( OwnerID() , "[SC_423178_13]" , 3 )									--�n���ַǳƤ@�ǰs......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	MoveToFlagEnabled( Star , false )
	LuaFunc_MoveToFlag( Star , 780614 , 2 ,  0 )
	Yell( Star , "[SC_423178_5]" , 3 )					--�S�����F�I�d�����Q�ȡ�
	PlayMotion( Star ,  ruFUSION_ACTORSTATE_EMOTE_WAVE )
	sleep(30)
	Yell( Art , "[SC_423178_6]" , 3 )					--�㺸�S�A�A�̻{�ѡH
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423178_7]" , 3 )					--�u�����ެP�H�����סC
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	Yell( OwnerID() , "[SC_423178_14]" , 3 )									--�o�Ӱs���@�k�O....
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423178_8]" , 3 )					--����o�@�����D�O�s�P�Ǫ������������Ǩ��H�O��ۧ_�{�A�ڭ�b�᭱ť���F�C
	sleep(30)
	Yell( Star , "[SC_423178_9]" , 3 )					--�o�򻡨ӡA�ڪ��T���b��L���ϰ�ť���������Ǩ�...
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Art , "[SC_423178_10]" , 3 )					--�㺸�S�A�A�٪��D�Ǥ���H����ťť�a�H
	Yell( OwnerID() , "[SC_423178_15]" , 3 )									--���ڥ��J�ӷQ�@�Q....
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423178_11]" , 3 )					--�Ѯv��o�@���ڥi�O�M�{�e�s�Ӫ��A�i���O���F��L�H�Ѵb���ȡC
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	sleep(30)
	Yell( Art , "[SC_423178_12]" , 3 )					--����J�B�s�B�͡A���D�ȥB��b�@��a�I
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep(30)
	DisableQuest( OwnerID() ,false )
	Delobj( Art )
	Delobj( Star )
	CancelBuff( TargetID() , 506616)					--�R�����a���W��BUFF 
end

---------------------------------------�̽u����NO.4(����J115060���W����ܼ@��)
function LuaS_423179_Complete()	
	AddBuff( TargetID() , 506617 , 1 , -1 )						--�n�[�b���a���W��BUFF
	local Star = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115072 , 200 )		--�]�j�M���W����P�^
	local Morrok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115073 , 200 )		--�]�j�M���W������J�^

	DisableQuest( OwnerID() ,true )
	DisableQuest( Morrok ,true )
	DisableQuest( Star ,true )
	Yell( OwnerID() , "[SC_423179_1]" , 3 )				--�ӡ㼯��J�A�A�]�L�ӳܰs�C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Morrok , "[SC_423179_2]" , 3 )					--�ڳܹL�F�C
	PlayMotion(  Morrok , ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(30)
	Yell( OwnerID() , "[SC_423179_3]" , 3 )				--�㺸�S�A�A�]�ӳܡC�ڳ̬öQ���̤l�C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423179_4]" , 3 )					--�A�K�F�A�Ѯv�C
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_DRINK )
	sleep(30)
	Yell( OwnerID() , "[SC_423179_5]" , 3 )				--�J������H�H���O���|�ܾK���I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DODGE )
	sleep(30)
	Yell( Star , "[SC_423179_6]" , 3 )					--����Ѯv......�C���A�o�򻡴N�N��A�K�F�C
	sleep(30)
	Yell( OwnerID() , "[SC_423179_7]" , 3 )				--�ګ��i��K�I�ڷN�ѳo��M���I....
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_AMAZED )
	sleep(30)
	Yell( OwnerID() , "[SC_423179_8]" , 3 )				--���ٰO�o�o���W�諸��A�᯾�A�n���n�ڼƵ��Aťť�H..
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep(30)
	Yell( Star , "[SC_423179_9]" , 3 )					--�訽�S�Eģ�~�A�ڷQ�i�H�ǳƦ����F�����L�����s�C
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID() , "[SC_423179_10]" , 3 )				--�㺸�S�A�ڻ��ڮڥ��S�K�I�o�I�s��o�F����H
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep(30)
	Yell( OwnerID() , "[SC_423179_11]" , 3 )				--��������n�[�S���o����P�F�I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	DisableQuest( OwnerID() ,false )
	DisableQuest( Morrok ,false )
	DisableQuest( Star ,false )
	CancelBuff( TargetID() , 506617)
end

------------------------------------------�̽u����NO.5�]�����S���W����ܼ@���^
function LuaS_423180()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423180 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423180_1]" , "LuaS_423180_1", 0 )		--�ҥH�H
	end
end

function LuaS_423180_1()	
	SetSpeakDetail(OwnerID(),"[SC_423180_2]")						--����P�~��������@�w���N�q�s�b......
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423180_3]" , "LuaS_423180_2", 0 )		--�A���N��O�H
end

function LuaS_423180_2()	
	SetSpeakDetail(OwnerID(),"[SC_423180_4]")						--�С�u�ΪA�A���ڭ̨Ӳ���L���p��H......
	SetFlag(OwnerID() , 543921 , 1 )
end

function LuaS_423180_Complete()	
	local MA = Lua_DW_CreateObj("flag" , 115307 ,780615 , 1 )		--�إX�H��A
	DisableQuest( MA ,true )
	MoveToFlagEnabled( MA , false )
	MoveToFlagEnabled( OwnerID() , false )
	local Morrok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115076 , 200 )		--�]�j�M���W������J�^
	DisableQuest( OwnerID() ,true )
	DisableQuest( Morrok ,true )

	LuaFunc_MoveToFlag( MA , 780615 , 2 ,  0 )	
	AdjustFaceDir( MA , OwnerID(), 0 )
	AdjustFaceDir( OwnerID() , MA, 0 )
	Yell( MA , "[SC_423180_5]" , 3 )						--�����S�A�ѪŤS�X�{�_�Ǫ��v�l�b�L�ۡC
	PlayMotion( MA , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Yell( OwnerID() , "[SC_423180_6]" , 3 )					--��A�ڪ��D�F�C
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_THINK) 
	sleep(30)
	AdjustFaceDir( OwnerID() , Morrok, 0 )
	Yell( Morrok , "[SC_423180_7]" , 3 )						--�ѪťX�{�_�Ǫ��v�l�H�����S�A�o�O�A�һ����˪L�̪񪺲����ܡH
	PlayMotion(  Morrok  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID() , "[SC_423180_8]" , 3 )					--�S�����C
	PlayMotion(  OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  ) 
	sleep(20)
	LuaFunc_MoveToFlag( MA , 780615 , 1 ,  0 )
	Delobj( MA )
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() ,false )
	DisableQuest( Morrok ,false )
end

------------------------------------------�̽u����NO.6
function LuaS_423181_Accept()	
	local Morrok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115076 , 200 )	
	Tell(TargetID(),Morrok,"[SC_423181_1]")				 --�ڷ|�P�A�@�P�e���Ǭ�����OOO�A�Ť����¼v�����i��O�ڭ̰l����䤧�@�C
end

function LuaS_423181_CHECK() --���b�ˬd�I�W
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	SetPlot( OwnerID() , "range" , "LuaS_423181_CHECK_1" , 150 ) 		--�վ�̫᪺�Ʀr�H���ܰ����d��
end

function LuaS_423181_CHECK_1()
	if	CheckAcceptQuest( OwnerID() , 423181 ) == true		then
		if	CheckFlag( OwnerID() , 543922 ) == false		and
			CheckBuff( OwnerID() , 506618) == false 		then
			AddBuff( OwnerID() , 506618 , 1 , -1 )	
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423181_2]" , 0 ) 		--�g�D�ǥX�ӷL���n���n�I
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423181_2]" , 0 )
		end
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register ) < 1	then
			BeginPlot( TargetID() , "LuaS_423181_MP" , 0 )
			WriteRoleValue ( TargetID() , EM_RoleValue_Register , 1 )
		end
	end
end

function LuaS_423181_MP()
	local MP = Lua_DW_CreateObj("flag" , 115309 ,780616 , 1 )				--�u�z����A	
	WriteRoleValue ( MP , EM_RoleValue_Register4 , TargetID() )
	DisableQuest( MP ,true )
	WriteRoleValue ( MP , EM_RoleValue_Register , OwnerID() )
	BeginPlot( MP , "LuaS_423181_Main" , 0 )		
end

function LuaS_423181_Main()	

	local Atac = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	local Box = ReadRoleValue(OwnerID(),EM_RoleValue_Register )												
	BeginPlot( OwnerID() , "LuaS_423181_FC" , 0 )
	local Hand = Lua_DW_CreateObj("flag" , 115311 ,780616 , 2 )				--�u�z����B
	local Gill = Lua_DW_CreateObj("flag" , 115310 ,780616 , 3 )				--�N��
	WriteRoleValue ( Gill , EM_RoleValue_PID , OwnerID() )
	WriteRoleValue ( Hand , EM_RoleValue_PID , OwnerID() )
	BeginPlot( Gill , "LuaS_423181_Gill_CHECK" , 0 )
	BeginPlot( Hand , "LuaS_423181_Gill_CHECK" , 0 )
	DisableQuest( Hand ,true )
	DisableQuest( Gill ,true )
	MoveToFlagEnabled( Hand , false )
	MoveToFlagEnabled( Gill , false )
	
	Yell( OwnerID() , "[SC_423181_3]" , 3 )						--�t���h�ӱN�L��^�h�F�C
	sleep(20)
	Yell( Gill , "[SC_423181_4]" , 3 )							--ê��......
	sleep(20)
	Yell( Gill , "[SC_423181_5]" , 3 )							--�ӧa�I
	sleep(20)
	BeginPlot( Gill , "LuaS_423181_Gillrun" , 0 )						--�]�N��]���^

	local MonNoDa = Lua_DW_CreateObj("flag" , 115313 ,780616 , 9 )	
	WriteRoleValue ( MonNoDa , EM_RoleValue_PID , OwnerID() )
	BeginPlot( MonNoDa , "LuaS_423181_Gill_CHECK" , 0 )
	DisableQuest( MonNoDa ,true )
	MoveToFlagEnabled( MonNoDa , false )
--�ζ]��

	LuaFunc_MoveToFlag( MonNoDa , 780616 , 1 ,  0 )
--������
	Yell( OwnerID() , "[SC_423181_6]" , 3 )						--�֨��I
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)

	local Mon = Lua_DW_CreateObj("flag" , 103898 ,780616 , 4 )	
	SetAttack( Mon , Atac )
	WriteRoleValue ( Mon , EM_RoleValue_Register6 , OwnerID() )
	CallPlot( Mon, "LuaFunc_Obj_Suicide" , 300 )
	AddToPartition( Mon , 0 )
	SetPlot(Mon,"dead","LuaS_423181_Dead",0 )						--�Ǧ�����Ĳ�o���`�@��
	BeginPlot(Mon, "LuaS_423003_5" , 0 )							--���}�԰���R���ۤv
	BeginPlot( Hand , "LuaS_423181_Handrun" , 0 )						--�]�u�z����B�k���]���^
	BeginPlot( MonNoDa , "LuaS_423181_MonNoDa" , 0 )	

	for i = 0 , 100 , 1 do
		if	CheckID(Mon) == false  or
			ReadRoleValue(Mon ,EM_RoleValue_IsDead) == 1	then
			break
		end
		sleep( 20 )
	end
--	sleep(10)

	if	ReadRoleValue ( OwnerID() , EM_RoleValue_Register3 ) >0		then
		local Morrok = Lua_DW_CreateObj("flag" , 115314 ,780616 , 7 )
		WriteRoleValue ( Morrok , EM_RoleValue_PID , OwnerID() )
		BeginPlot( Morrok , "LuaS_423181_Gill_CHECK" , 0 )
		DisableQuest( Morrok ,true )
		MoveToFlagEnabled( Morrok , false )
		LuaFunc_MoveToFlag( Morrok , 780616 , 8 ,  0 )
		Yell( Morrok , "[SC_423181_7]" , 3 )						--�o�O���^�ơH
		sleep(20)
		BeginPlot( Morrok , "LuaS_423181_SeeMo" , 0 )
	end
	WriteRoleValue ( Box , EM_RoleValue_Register , 0 )					--���cRegister�g�^0
	Delobj( OwnerID() )
end

function LuaS_423181_Dead()
	local OO = ReadRoleValue ( OwnerID() , EM_RoleValue_Register6 )
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 423181 )		and
			CheckBuff( Player , 506618) == true 	then
			SetFlag( Player   , 543922, 1 )
		end	
	end
	WriteRoleValue ( OO , EM_RoleValue_Register3 , 1 )	
	return true
end

function LuaS_423181_FC()									--�ˬd���񦳵L���a�A���_�@����
	local Box = ReadRoleValue(OwnerID(),EM_RoleValue_Register )	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 300)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423181 ) == true	and
				CheckBuff(Group[i]  , 506618) == true 	then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	WriteRoleValue ( Box , EM_RoleValue_Register , 0 )
	Delobj( OwnerID() )
end

function LuaS_423181_Gillrun()
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 5 ,  0 )
	Delobj( OwnerID() )
end

function LuaS_423181_Handrun()
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 6 ,  0 )
	Delobj( OwnerID() )
end

function LuaS_423181_MonNoDa()
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 1 ,  0 )
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 6 ,  0 )
	Delobj( OwnerID() )
end

function LuaS_423181_Gill_CHECK()	
	local MP = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	for i = 0 , 100 , 1 do
		if	CheckID(MP) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423181_Player_CHECK()
	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 300)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115308	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423181_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 506618 )
end

function LuaS_423181_SeeMo()
	local Qp = {}
	Qp = SearchRangePlayer(OwnerID() , 300)
	for i=0,table.getn(Qp)-1 do
		if	CheckAcceptQuest( Qp[i], 423181 ) == true	and
			CheckFlag( Qp[i] , 543922 ) == true		then
			SetFlag(Qp[i] , 543923 , 1 )
			CancelBuff( Qp[i] , 506618)
		end
	end
	Delobj( OwnerID() )
end

------------------------------------------�̽u����NO.7
function LuaS_423182_Complete()
	AddBuff( TargetID() , 506620 , 1 , -1 )		
	DisableQuest( OwnerID() ,true )
	MoveToFlagEnabled( OwnerID() , false )
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 10 ,  0 )
--�ۤU
	PlayMotionEX( OwnerID()  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Yell( OwnerID() , "[SC_423182_1]" , 3 )			--�o�O......
	sleep(30)
	PlayMotion( OwnerID()  , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(10)
	CancelBuff( TargetID() , 506620 )
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() ,false )
end

------------------------------------------�̽u����NO.8
function LuaS_423183_Complete()
	AddBuff( TargetID() , 506621 , 1 , -1 )		
	DisableQuest( OwnerID() ,true )
--�����S�ۤU
--�����S����
	local Art = LuaFunc_CreateObjByOBj( 115321, OwnerID() )
	local Star = Lua_DW_CreateObj("flag" , 115322 ,780614 , 2 )	
	DisableQuest( Art ,true )
	DisableQuest( Star ,true )
	MoveToFlagEnabled( Art , false )
	MoveToFlagEnabled( Star , false )
	Yell( Star , "[SC_423183_1]" , 3 )		--�Ѯv�A�A�������Ӥ��|�O�A�\�b�s����񪺨��@�ӡH	
	PlayMotion( star , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	sleep(30)
	Yell( Star , "[SC_423183_2]" , 3 )		--�p�G�������O�R�����P���H�x�A����b�C�Ӷǻ����Q�s�P�Ǫ�ŧ�����a�賣���g�X�{�L�۪񪺤���...
	PlayMotion( star , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	local Morrok = Lua_DW_CreateObj("flag" , 115323 ,780601 , 2 )	
	DisableQuest( Morrok ,true )
	MoveToFlagEnabled( Morrok , false )
	LuaFunc_MoveToFlag( Morrok , 780601 , 4 ,  0 )
	Yell( Morrok , "[SC_423183_3]" , 3 )		--����A���D���Ǧa�賣������@�P���H�x�H
	PlayMotion( Morrok , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423183_4]" , 3 )		--�@�q�I�u���@�ӡA�u�z����I�b�����񳣴��g���u�z���⬡�ʪ���H�I	
	PlayMotion( Star ,  ruFUSION_ACTORSTATE_EMOTE_POINT  ) 
	sleep(30)
	Yell( Art , "[SC_423183_5]" , 3 )		--�R���S�A��A�Ҫ��D�����X�ӧa�I����J�P�s�B�ͬO��ʥ@�ɪ��@�ӫ����C
	PlayMotion( Art ,ruFUSION_ACTORSTATE_EMOTE_THINK) 
	sleep(30)
	Yell( Star , "[SC_423183_6]" , 3 )		--�ڪ��D�F�I�v�ŬJ�M�z���o�򻡤F��ڤS���|���z����O�H
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_SALUTE2) 
	sleep(30)
	Yell( Star , "[SC_423183_7]" , 3 )		--���Ӧa��γ\���L�̩ҷQ�n�����סA�֦��j�N���@�̪���y�̡B�Q�٬��d�����������C
	PlayMotion( Star ,  ruFUSION_ACTORSTATE_EMOTE_IDLE2  ) 
	sleep(30)
	Yell( Morrok , "[SC_423183_8]" , 3 )		--�ک��դF�A�ڭ̷|�����Ӥ�V�l�d�C
	PlayMotion( Morrok ,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  ) 
	sleep(20)
	CancelBuff( TargetID() , 506621 )
	Delobj( Art )
	Delobj( Star )
	Delobj( Morrok )
	DisableQuest( OwnerID() ,false )
end






