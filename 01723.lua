-----���ԧ��Ǵ��إX�]��
function LuaS_114366_Born()
	local Car = Lua_DW_CreateObj("flag" , 114563 ,780560 , 1 )	--�Ǵ��إX�]��
	WriteRoleValue ( OwnerID() , EM_RoleValue_PID, Car )
	WriteRoleValue ( Car , EM_RoleValue_PID, OwnerID() )		
end

----�ѳ��H�H��
function LuaS_422997()	
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422997 ) == true	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422997_0]" , "LuaS_422997_Answer", 0 )	--��β{�b�O���^�ơH����n�ʫ��H 
	end
end

function LuaS_422997_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422997_1]")						--�����άO���j��D�ꤧ�@�A���b�X�d�~�e...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422997_2]" , "LuaS_422997_Answer_1", 0 )	--���h�Q�ȤҤH�H�O�Ǵ������˶ܡH
end

function LuaS_422997_Answer_1()	
	SetSpeakDetail(OwnerID(),"[SC_422997_3]")						--�e����D�P�S�����ҤH�ͤU�Ǵ��ַݮ�...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422997_4]" , "LuaS_422997_Answer_2", 0 )	--�ͽͳҺ���ǿը��ַݧa�C
end

function LuaS_422997_Answer_2()	
	SetSpeakDetail(OwnerID(),"[SC_422997_5]")						--����o���ַݡA�ڪ��ߤ��S���L���P�n...
	SetFlag(OwnerID() , 543703 , 1 )
end

------�ǿժ����

function LuaS_422998()	
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422998 ) == true	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422998_0]" , "LuaS_422998_1", 0 )	--�ǿ���h�A���ԥN��F�ԥ�����...
	end
	if	CheckAcceptQuest( OwnerID() ,423002 ) == true	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423002_1]" , "LuaS_423002_1", 0 )	--�ǿդַݡA�o�ͤ���ƤF�H
	end
end

function LuaS_422998_1()	
	SetSpeakDetail(OwnerID(),"[SC_422998_1]")							--�˷R���ϸ`���͡A��b��p...						
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422998_2]" , "LuaS_422998_2", 0 )			--�Һ���h������n�o�򰵡H
end

function LuaS_422998_2()	
	SetSpeakDetail(OwnerID(),"[SC_422998_3]")							--��I�ڷQ�L�O��ߧڧ�L���ɦ�V�F�ԥ��������i...						
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422998_4]" , "LuaS_422998_3", 0 )			--�Һ���h���Q�k�u���H��ѡC
end

function LuaS_422998_3()	
	SetSpeakDetail(OwnerID(),"[SC_422998_5]")							--�i���O�ܡH�ϸ`���͡A�Э�̧ڦb�z���e���o��...				
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422998_6]" , "LuaS_422998_4", 0 )			--�z����Һ���h�͹L�o�˪��ƶܡH
end

function LuaS_422998_4()	
	SetSpeakDetail(OwnerID(),"[SC_422998_7]")							--��M�͹L�A�٤��u�@���A�ڭ̴X�G�C�����q��o��...		
	SetFlag(OwnerID() , 543723 , 1 )
end

function LuaS_422998_Complete()	
	DisableQuest( OwnerID() ,true )
	local Soldier = CreateObjByFlag( 114737 , 780548 , 1 , 0 )  --�Ҥp�L
	WriteRoleValue( Soldier , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Soldier , 0 )

	local KK = LuaFunc_CreateObjByOBj( 114594 , OwnerID() )			--�إX�ǿ�
	WriteRoleValue(KK , EM_RoleValue_IsWalk, 0 )	
	Hide( KK )
	Show( KK ,0)
	

	MoveToFlagEnabled( Soldier , false )
	MoveToFlagEnabled( KK , false )
	sleep(10)
	Say( Soldier , "[SC_422998_8]")			--�ǿդַݡA���n�F�I
	LuaFunc_MoveToFlag( Soldier , 780548 , 2 ,  0 )
	Say( KK , "[SC_422998_9]")				--�o�ͤ���ơH
	sleep(30)
	Say( Soldier , "[SC_422998_10]")			--[114595]�]���X[114557]�ַݤ��b�ɾ����ж�
	sleep(30)
	Say( KK , "[SC_422998_11]")			--����I�i�c���Һ��A�ڱo�h����L�I
	sleep(20)
	LuaFunc_MoveToFlag( KK , 780548 , 3 ,  0 )
	Delobj( KK )
	LuaFunc_MoveToFlag( Soldier , 780548 , 3 ,  0 )	
	Delobj(Soldier )
	DisableQuest( OwnerID() ,false )
end

------�ǿյo��

function LuaS_423002_1()	
	SetSpeakDetail(OwnerID(),"[SC_423002_2]")							--�ڤw�g���u�@���q���ˤf���o��...			
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423002_3]" , "LuaS_423002_2", 0 )			--�Һ��ַݯu���o�򰵤F�H	
end

function LuaS_423002_2()	
	SetSpeakDetail(OwnerID(),"[SC_423002_4]")							--�G�M�ڤ~�����}���˪��ж��A�N�ݨ��Һ����L��...		
	SetFlag(OwnerID() , 543734 , 1 )
end

-------�Q�p�H��ŧ
function LuaS_423003()	
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423003 ) == true	and
		CheckFlag( OwnerID() , 543735) == false	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423003_1]" , "LuaS_423003_1", 0 )	--�Һ���h�A�ڷQ�аݧA������o�ͪ���...
	end
end

function LuaS_423003_1()	
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_423003_2" , 0 )
end

function LuaS_423003_2()	
	local NPC = LuaFunc_CreateObjByOBj( 114395, OwnerID() )
	Hide(OwnerID())
	WriteRoleValue( NPC , EM_RoleValue_PID , TargetID() )

	BeginPlot( NPC , "LuaS_423003_3" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(NPC) == false or ReadRoleValue( NPC , EM_RoleValue_OrgID ) ~= 114395 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
end

function LuaS_423003_3()
	local SP = Lua_DW_CreateObj("flag" , 114633 ,780549 , 3 )				--�إX�l��
	MoveToFlagEnabled( OwnerID() , false )
	MoveToFlagEnabled( SP , false )

	LuaFunc_MoveToFlag( SP , 780549 , 4 ,  0 )
	Say( SP , "[SC_423003_2]")							--�Һ��ַݡA���ǨƱ��ݭn�бz�w��...
	AdjustFaceDir( SP , OwnerID(), 0 )
	AdjustFaceDir( OwnerID() , SP, 0 )
	sleep(30)
	Say( OwnerID() , "[SC_423003_3]")						--�n�A�ڳo�N�h�C
	sleep(20)
	LuaFunc_MoveToFlag( OwnerID() , 780549 , 5 ,  0 )
	Hide( OwnerID() )
	sleep(20)
	Say( SP , "[SC_423003_4]")							--�A�o�ӥ~�Ӫ̤��Ӥz�A�Ӧh��......
	sleep(30)
	Say( SP , "[SC_423003_5]")							--����z�A��ΤӦh���H�A���ӳQ�а��I
	sleep(30)
	LuaFunc_MoveToFlag( SP , 780549 , 3 ,  0 )
	Delobj( SP )


	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Monster = {}
	local amount = 2
	local Group = {}

	For i=1, amount  do		--�s�X����
		Monster[i] = CreateObjByFlag( 103496 , 780549 , i , 0 )  
		CallPlot( Monster[i] , "LuaFunc_Obj_Suicide" , 300 )
		AddToPartition( Monster[i] , 0 )
		SetPlot(Monster[i],"dead","LuaS_423003_4",0 )	--�Ǧ�����Ĳ�o���`�@��
		SetAttack(Monster[i],Player)
		BeginPlot(Monster[i], "LuaS_423003_5" , 0 )
		Lua_Drama_Radar( Monster[i], 423003 )
	End

	for i = 0 , 100 , 1 do
		if	CheckID(Monster[1]) == false  and
			CheckID(Monster[2]) == false	then
			break
		end
		if	Lua_Check_Drama_Statu(Monster[1]) == false  and
			Lua_Check_Drama_Statu(Monster[2]) == false	then
			Delobj( Monster[1] )
			Delobj( Monster[2] )
			break
		end
		sleep( 20 )
	end

	Delobj( OwnerID() )
end

function LuaS_423003_4()		--�Ǧ�����Ĳ�o���`�@��
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 423003 )	then
			SetFlag( Player   , 543735, 1 )
		end	
	end	
	return true
end

function LuaS_423003_5()

	while true do
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	and 
			CheckID( OwnerID() ) == true				then  --�ˬd�O�_���}�԰�
			Sleep( 20 )
		else
			if CheckID( OwnerID() ) == true	then	
				DelObj( OwnerID() )	
			end 
			break
		end
	end
end





-------���O��������
function LuaS_423004_Complete()
	local Car = ReadRoleValue(OwnerID(),EM_RoleValue_PID)		--���o�]��
	DisableQuest( Car ,true )
	DisableQuest( OwnerID() ,true )

	SetDefIdleMotion( Car, ruFUSION_MIME_EMOTE_SPEAK)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)


	Say( Car , "[SC_423004_1]")			--�o�Ʊ��ݰ_�Ӥ���¡A�Ǵ��A�A�o���@�_�ӳB�z���C
	sleep(30)
	Say( OwnerID() , "[SC_423004_2]")		--�ک��աA�{�b���O�����~��H���b�s�ˤ����ɭ�......
	sleep(30)
	Say( OwnerID() , "[SC_423004_3]")		--�ڭn��X�I�᪺��]�A���������O�������o�������աC
	sleep(30)
	Say( Car , "[SC_423004_4]")			--���A�٦��A�Ǵ��A�A�o���֬��H�h���U���O����������A����i��|�Q��۳B�z���C
	sleep(30)
	Say( OwnerID() , "[SC_423004_5]")		--�B�z�H�o�O������H
	sleep(30)
	Say( Car , "[SC_423004_6]")			--����|���ܡA��L���e�g�����Ʊ��A�i�D�i�H��Ū���H
	sleep(30)
	Say( OwnerID() , "[SC_423004_7]")		--�ڭn��򪾹D���O�������e�o�ͤ���ơH�p��ť������n������H
	sleep(30)
	Say( Car , "[SC_423004_8]")			--�O��ߡA�ڦ��@�Ӧn�;֦��o�譱���M���A���O�L�b�F�ԥ������A�ڱo�L�h��L�C
	sleep(30)
	Say( Car , "[SC_423004_9]")			--�t�~�A���ٻݭn����ۥѶi�X��Ϊ��q���ҡC
	sleep(30)
	Say( OwnerID() , "[SC_423004_10]")		--�o�S���D�A���§A�@�N���U�ڡA�ڪ��n�͡C
	SetDefIdleMotion( Car, ruFUSION_MIME_NONE)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE)


	sleep(10)
	DisableQuest( Car ,false )
	DisableQuest( OwnerID() ,false )	
end

function LuaS_423005_Complete()
	Addbuff( TargetID() , 506242, 1 , 60 )
	local Car = Lua_DW_CreateObj("flag" , 114708 ,780561 , 1 )	
	local MN = Lua_DW_CreateObj("flag" , 114707 ,780561 , 2 )	
	local Flag = 780561
	
	MoveToFlagEnabled( Car , false )
	MoveToFlagEnabled( MN , false )
	LuaFunc_MoveToFlag( MN , 780561 , 4 ,  0 )	
	AdjustFaceDir( MN , OwnerID(), 0 )

	Say( MN , "[SC_423005_1]")			--�����A�˦ۥX���A�j�ѻ�����کԨӳo�A�Q���O�D�`�O�H���Ī��u���N�~�v�a�H
	sleep(30)
	Say( Car , "[SC_423005_2]")			--�H�A�������A��O�a�C
	sleep(30)
	Say( MN , "[SC_423005_3]")			--���ڴN���Ȯ�A�C�C�ɥ��o�I�K�K�K�K��
	LuaFunc_MoveToFlag( Car , 780561 , 3 ,  0 )	
	sleep(5)
	AdjustFaceDir( Car , MN, 0 )

	sleep(30)
	Delobj( Car )
	Delobj( MN )
	if	CheckBuff( TargetID() , 506242) == true	 then
		CancelBuff( TargetID() , 506242)  
	end
end

--------�U���Ǵ�
function LuaS_114366_0()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422995 ) == true	and
		CheckFlag( OwnerID() , 543737) == false	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422995_1]" , "LuaS_422995", 0 )	--�A�u��������^��ΡH
	end
	if	CheckAcceptQuest( OwnerID() ,422992 ) == true	and( CheckCompleteQuest( OwnerID(),422992 )==false) 	and
		CheckFlag( OwnerID() , 543698) == false	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_1]","LuaS_422992_2",0)	--�F�ԥ������譱�Q�F�ѡA�o���|�檺��D��|ĳ
	end
	if	CheckAcceptQuest( OwnerID() ,422993 ) == true	and
		CheckFlag( OwnerID() , 543751) == false	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422993_0]" , "LuaS_422993_1", 0 )	--�бa�ڥh�{�ѥ��ԧ����H��
	end
end

function LuaS_422995()
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422995_1" , 0 )
end

function LuaS_422995_1()
	local Car = ReadRoleValue(OwnerID(),EM_RoleValue_PID)		--���o�]��
	DisableQuest( Car ,true )

	Say( OwnerID() , "[SC_422995_2]")			--������z�i�Oť�j�a�������D��D���A�]�Ʊ�ڦ^��ΰڡI
	local PA = Lua_DW_CreateObj("flag" , 114723 ,780574 , 1 )	
	local PB = Lua_DW_CreateObj("flag" , 114724 ,780574 , 2 )	
	MoveToFlagEnabled( PA , false )
	MoveToFlagEnabled( PB , false )
	LuaFunc_MoveToFlag( PA , 780574 , 3 ,  0 )
	LuaFunc_MoveToFlag( PB , 780574 , 4 ,  0 )

	Say( PA , "[SC_422995_3]")				--�i�O�z�~�O�̦���O������D�A�a���Ϊ��H�ڡI 
	PlayMotion( PA , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( PB , "[SC_422995_4]")				--�S���I�A�����}�P���p�A�H�ΫO�@�j�a���M�ߡA���ڭ̦p���R���z�A���i�H���C�C�ݵ۱z���S�̹ܨ��z�ӱo�쪺��m�O�H
	PlayMotion( PB , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( OwnerID() , "[SC_422995_5]")			--�j�a���~�|�F�I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)	
	Say( OwnerID() , "[SC_422995_6]")			--�ڪ��̧̭̯�O��ڦn�Ӧh�F�A�Һ����w��a�⪺��O�D�`�ǥX�A�ǿյ���H�N�A��K�o�o�A��Υ浹�L�̡A�~�|���w�w�����ӡC
	sleep(30)
	Say( PA , "[SC_422995_7]")				--�i�O�{�b����Τ@�I�����w�w�A�]�������l�����Y�A�v�O�����Q���Y���ڡI	
	PlayMotion( PA , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( OwnerID() , "[SC_422995_8]")			--�o�u�O�]���L�̤������@�ǻ~�|�A�L�ǮɭԻ~�|�۵M�|�Ѷ}�A�@�_�a�����ڦV�c�a�C
	sleep(30)
	Say( Car , "[SC_422995_9]")				--�A���ݪ����G���|�̪ťX�{�C
	sleep(30)
	Say( OwnerID() , "[SC_422995_10]")			--�d���H	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	sleep(30)
	Say( Car , "[SC_422995_11]")			--�ݭn���H�D�ʤ��J�A�ѨM�y���L�̻~�|���_�]�C		
	sleep(30)
	Say( OwnerID() , "[SC_422995_12]")			--���O�����ݦb��θ̡A�w�g�V�O�b�i��o���u�@�F�C		
	sleep(30)
	Say( Car , "[SC_422995_13]")			--�o��h�~�L�h�A�A���ݪ����G�å��X�{�C		
	PlayMotion( Car , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( OwnerID() , "[SC_422995_14]")			--�o....���ڷQ�Q�A���A�Ѥj�a�����A�i�O�ڵ����L���Z�A�ڪ����}�i�H���Ʊ��ܱo�����¡A�{�b�p�G�n�A�^����.....���ڷQ�Q.....	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( PA , "[SC_422995_15]")			--�j�a���O�n�G�z�A�ڭ̿˷R���Ǵ��E���J���һ�D�A���O�Ʊ�z�i�H��j�a����ť�i�h�A�{�u��ҥi��ʡC		
	PlayMotion( PA , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( PB , "[SC_422995_16]")			--�ڭ̥����}�a�I���Ǵ��E���J���һ�D�@�Ӧw�R���Ŷ���ҡC
	PlayMotion( PB , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)	

	local Group = {}
	Group = SearchRangePlayer(OwnerID() , 350)	--�j�M���񪱮a
	For i=0,table.getn(Group)-1 do
		if	CheckAcceptQuest( Group[i], 422995 )==true	then
			SetFlag(Group[i] , 543737 , 1)
		end
	end

	LuaFunc_MoveToFlag( PA , 780574 , 1 ,  0 )
	Delobj( PA )
	LuaFunc_MoveToFlag( PB , 780574 , 2 ,  0 )
	Delobj( PB )

	DisableQuest( Car , false )
	DisableQuest( OwnerID() , false )
end

-----�ʨ��H��

function LuaS_423013_Complete()
	Addbuff( TargetID() , 506403, 1 , -1 )
	local KK = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114961 , 100 )	
	Hide( OwnerID() )
	DisableQuest( KK ,true )
	local Jazz = Lua_DW_CreateObj("flag" , 114955 ,780588 , 1 )
	DisableQuest( Jazz ,true )
	MoveToFlagEnabled( Jazz , false )
	LuaFunc_MoveToFlag( Jazz , 780588 , 2 ,  0 )	
	AdjustFaceDir( Jazz , OwnerID(), 0 )

	Say( Jazz , "[SC_423013_1]")				--�ڨӤF�I[114369]���U
	sleep(20)
	PlayMotionEX( Jazz, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say( KK , "[SC_423013_2]")			--[114955]��h�A�ܰ���ť��A�@�N�[�J����M�h�Ϊ������I
	sleep(30)
	Say( Jazz , "[SC_423013_3]")				--�ڷ|�ܺɦۤv���O�q�A�������U����ޡA�u�@[ZONE_SAVILLEPLAINS]�I�o�]�O��������V
	sleep(30)
	Say( KK , "[SC_423013_4]")			--�A�|�O�ګܦn���U�O�A���F[ZONE_SAVILLEPLAINS]�����ǡA���F����H�����aģ�I�u�@���u�@�N�浹�A�F�I
	sleep(20)
	Say( Jazz , "[SC_423013_5]")			--��R�I
	LuaFunc_MoveToFlag( Jazz , 780588 , 4 ,  0 )

	sleep(30)
	Delobj( Jazz )
	if	CheckBuff( TargetID() , 506403) == true	 then
		CancelBuff( TargetID() , 506403)  
	end
	Show( OwnerID() , 0 )
end












