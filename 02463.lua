---------------------------------------------------------------------------
--424477  ���������
---------------------------------------------------------------------------
--function LuaPG_424477()
--	LoadQuestOption(OwnerID())
--
--	if	CheckAcceptQuest(OwnerID(),424477)==true		and
--		CheckCompleteQuest(OwnerID(),424477)==false 	and
--		CheckFlag(OwnerID(),545511)==false			then
--		SetFlag(OwnerID(),545511,1)
--	end
--end


--���ȵ����ᱵ�@��
---------------------------------------------------------------------------
--�t���G119283�B119333
--BUFF�G620756
function LuaPG_424477_Complete()
	Lua_ZonePE_3th_GetScore(100)

	local Player = TargetID()
	local Lord = OwnerID()

	local New_Lord = DW_CreateObjEX("obj",119333,Lord)			----�ͦ��t���H��
	ks_ActSetMode( New_Lord )	
	SetModeEx( New_Lord , EM_SetModeType_HideName, true)

	local Num = ReadRoleValue(Lord,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Lord , "LuaPG_424477_Complete_01" , Lord , Player, New_Lord)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424477_Complete_01( Lord , Player, New_Lord)
	WriteRoleValue(Lord,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	
	
	local  Arton = LuaFunc_SearchNPCbyOrgID( Lord, 119159, 200, 0 )
	local New_Arton = DW_CreateObjEX("obj",119333,Arton)
	ks_ActSetMode( New_Arton )	
	SetModeEx( New_Arton , EM_SetModeType_HideName, true)
	
	NPCSAY(New_Lord,"[SC_424477_COMPLETE_01]") 				----�d�Ժ��G�]�\�ڥi�H������ȦN���ͤ@��
	Sleep(25)
	NPCSAY(New_Arton,"[SC_424477_COMPLETE_02]")			----�����y�G���ڪ����A���ȦN������|�_�{
	Sleep(20)
	NPCSAY(New_Arton,"[SC_424477_COMPLETE_03]")			----�����y�G�S���Y�A�ک��դH�����x��
	DelObj( New_Arton )														
	DelObj( New_Lord )

	WriteRoleValue(Lord,EM_RoleValue_Register1,0)				----�g�^��̧B��Ȧs��
end



---------------------------------------------------------------------------
--424478  ��U�P�˵����
---------------------------------------------------------------------------
--flag�G���n���� 545514
function LuaPG_424478()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424478 )==true		and
		CheckCompleteQuest( Player , 424478 ) == false	and
		CheckFlag(Player,545514)==false			then	
	
			SetSpeakDetail(Player,"[SC_424478_00]")
			SetFlag(Player, 545514 , 1)
	else
			LoadQuestOption(Player)
	end
end

function LuaPG_424478_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424478 )==true		and
		CheckFlag(Player,545595)==false			then	
	
			SetSpeakDetail(Player,"[SC_424478_01]")
			SetFlag(Player, 545595 , 1)
	else
			LoadQuestOption(Player)
	end
end




---------------------------------------------------------------------------
--424479  �Sù��Ӷ�������
---------------------------------------------------------------------------
--flag�G������e���d�� 545515
function LuaPG_424479()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424479 )==true		and
		CheckCompleteQuest( Player , 424479 ) == false		and
		 CheckFlag(Player,545515)==false			then
			if CheckFlag(Player,545719)==false then
				if CountBodyItem(Player , 240589) >=5 then	
					DelBodyItem(Player , 240589,5)
					SetFlag(Player,545719,1)			
					SetSpeakDetail(Player,"[SC_424479_01]")
					AddSpeakOption(Player, NPC , "[SC_424479_02]","LuaPG_424479_01",0)
				else
					LoadQuestOption(Player)
				end
			elseif CheckFlag(Player,545719)==true then
					AddSpeakOption(Player, NPC , "[SC_424479_02]","LuaPG_424479_01",0)
			end
	else
			LoadQuestOption(Player)
	end
end

function LuaPG_424479_01()
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424479_03]")
	SetFlag(Player, 545515 , 1)
end






---------------------------------------------------------------------------
--424492  �ɥ����D�v��������s
---------------------------------------------------------------------------
--���ȱ��U�ᱵ�@��
---------------------------------------------------------------------------
--�t���G�ɥ���119173
--����X�l�G781002	no.1
function LuaPG_424492_Accept()
	local Player = TargetID()
	local Script = OwnerID()

	local New_Script = DW_CreateObjEX("obj",119173,Script)
	ks_ActSetMode( New_Script )

	local Num = ReadRoleValue(Script,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Script , "LuaPG_424492_Accept_01" , Player , Script, New_Script)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424492_Accept_01(Player , Script, New_Script)
	WriteRoleValue(Script,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	

	DW_MoveToFlag( New_Script , 781002,1, 0 ,1)				----�ɥ�����781002����쨫��1
	DelObj(New_Script)												

	WriteRoleValue(Script,EM_RoleValue_Register1,0)				----�g�^�ɥ����Ȧs��
end


function LuaPG_424492()	
	local Player = OwnerID()
	LoadQuestOption(Player)
	if	CheckAcceptQuest(OwnerID(),424477)==true		and
		CheckCompleteQuest(OwnerID(),424477)==false 	and
		CheckFlag(OwnerID(),545511)==false			then
		SetFlag(OwnerID(),545511,1)
	end

	if	CheckAcceptQuest(Player,424492)==true	and
		CheckFlag(Player,545521)==false		then
		SetFlag(Player,545521,1)
	end
end



---------------------------------------------------------------------------
--424480  �N�~�o�͡I
---------------------------------------------------------------------------
--�d��t������
---------------------------------------------------------------------------
--�t���G�d�w����119174�B�s���d�w����119175�B�s����쨺��119295
--����J119182�B�ҫk119183
--����X�l�G781002	no.2��no.8
--���s��buff�G620757�B620758
function LuaPG_424480_Show()
	local Player = OwnerID()
	local Merick = TargetID()

	local Num = ReadRoleValue(Merick,EM_RoleValue_Register1)

	LoadQuestOption(Player)
	if	CheckAcceptQuest( Player, 424480 ) == true		 and
		CheckFlag(Player,545522)==false			and
		Num > 0 						then 		----�ˬd���a�O�_������ �åB�{�b�O�_���b�t��
		SetSpeakDetail( Player, "[SC_424480_001]" )				----(���b�t�����p�U �����i��)
	elseif	CheckAcceptQuest( Player, 424480 ) == true 		and
		CheckFlag(Player,545522)==false			and
		Num == 0						then		----�p�G�Ȧs�Ȭ�0
		AddSpeakOption(Player, Merick,"[SC_424480_00]","LuaPG_424480_Show_02",0)
											----���t��function	
	end
end


function LuaPG_424480_Show_02()
	local Player = OwnerID()
	local Merick = TargetID()
	CloseSpeak( Player )								----������ܵ���

	WriteRoleValue( Merick, EM_RoleValue_Register1, 999 )				----�W�� ��ܥ��b�t��	
	BeginPlot( Merick, "LuaPG_424480_Show_03", 0 )				
end


function LuaPG_424480_Show_03()
	local Merick = OwnerID()			--���bNPC���W���t���@��
	local QuestID = 424480			--���Ƚs��
	local FinishFlagID = 545522			--����������o���X��
	local CheckBuffID = 620756			--�ˬd�O�_���b�t����BUFF
	local CheckRange = 350			--�t�����ˬd�d��
	local ActorArray = {}				--(�s���ק�)�t���}�C��
	
	local FlagID = 781002				--�X��ID
	-- �ƥ���Ҧ��|�Ψ쪺�t�����ͥX�� �i�H��AddToPartition(�u�ݭnGUID)
	ActorArray[1] = CreateObjByFlag( 119174, FlagID, 6, 1 ) 	 --�d�w�����]�H���^
	ActorArray[2] = CreateObjByFlag( 119177, FlagID, 3, 1 ) 	--��쨺�š]�H���^
	ActorArray[3] = CreateObjByFlag( 119182, FlagID, 4, 1 ) 	--����J
	ActorArray[4] = CreateObjByFlag( 119183, FlagID, 5, 1 ) 	--�ҫk
	ActorArray[5] = CreateObjByFlag( 119295, FlagID, 3, 1 )  	--��쨺�š]�s���^

	CallPlot( Merick, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--�d������Ϊ��ˬd�禡
	for i=1, 4 do
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )
	end
	SetModeEx( ActorArray[4] , EM_SetModeType_HideName, true)		----�����W��

	sleep(10)


	--�t����
	Sleep(10)
	Yell( ActorArray[1], "[SC_424480_01]",3)		----�B�G��Z�H���B����H���A�Ӥ��|�A�Q�R�@�������߹��粣�ͪ��C�H�ءI
	sleep(30)
	Yell( ActorArray[1], "[SC_424480_02]",3)		----�B�G�s���̹�L�̥i���|���Ӧn�L�H�A�L�̪��s�b���N�O�V�d�s�ڡA�ӥB�֪��D�L�̰��L���Ǧn�ơA�s�ڮe���U�L�̡A�U�A�̦n�˦ۧ�L�̸ѨM���C
	PlayMotion( ActorArray[1], ruFUSION_ACTORSTATE_emote_point)
	sleep(40)
	Yell( ActorArray[3], "[SC_424480_03]",3)		----���G�]�n�Y�^���A�N��L�̨ëD���@�ܦ��p���A�ڦ۷|���s���̸����A�ӥB�{�b���n���O��X�b�s�H���窺�u������C
	PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(40)
	Yell( ActorArray[1], "[SC_424480_04]",3)		----�B�G���������H���������A���h�çA�ڥ��N�b���礤���F�@��I
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Yell( ActorArray[2], "[SC_424480_05]",3)		----���šG�d�w�����A�A�̦n�`�N�@�U�ۤv������A����J�i�O���s�諸�s�ϡA�A�O���s���d�ֶܡH�ӥB���٦�����J�����A�̭��n�O�˲M���u�ۡC
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_emote_head_shake)
	sleep(50)
	Yell( ActorArray[1], "[SC_424480_06]",3)		----�B�G�ֻ��o�ܡI�ڥ��ӴN�S�ӻ{�L�o���جO�����s�ϡI
	PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(30)

	
--	DW_MoveToFlag( ActorArray[1] , FlagID, 6, 0 ,1)				----�B�s�����������m
--	FA_FaceFlagEX(ActorArray[1], FlagID , 2)
	AddBuff( ActorArray[1], 620757, 1, -1 )						----�ܨ����s
	ScriptMessage( ActorArray[1], TargetID(), 1 , "[SC_424480_12]", 0 )		--�����T���G�][119174]�ܦ��s�Ρ^
	ScriptMessage( ActorArray[1], TargetID(), 0 , "[SC_424480_12]", 0 )		--�����T���G�][119174]�ܦ��s�Ρ^
	sleep(10)
	ScriptMessage( ActorArray[1], TargetID() ,1 , "[SC_424480_07]", "0xffffff80" )	----(�������r�T��)�s���B�G���F�s�ڡA����N�A�̳o�s���ؤ@�_�ѨM���I
	ScriptMessage( ActorArray[1], TargetID(), 0 , "[SC_424480_07]", "0xffffff80" )
	sleep(5)
	Yell( ActorArray[2], "[SC_424480_08]",3)					----���šG�M�I�I
	sleep(5)
--	AddBuff( ActorArray[2], 620758, 1, -1 )						----�����ܦ^�s��
	DelObj(ActorArray[2])
		AddToPartition( ActorArray[5], 0 )
--		DebugMsg(ActorArray[5],1,"11")
--		Say(ActorArray[5],"00")
		ks_ActSetMode( ActorArray[5] )

	WriteRoleValue(ActorArray[5]  ,EM_RoleValue_IsWalk , 0 )
	Hide(ActorArray[5])
	Show(ActorArray[5], 0)
	DW_MoveToFlag( ActorArray[5] , FlagID, 7, 0 ,1)				----���ŽĹL�h							
	PlayMotion( ActorArray[1] , ruFUSION_ACTORSTATE_ATTACK_1H )		----�s���B�����ʧ@									
	sleep(10)
	PlayMotion( ActorArray[5], ruFUSION_ACTORSTATE_DYING)			----���Ŧ��`
	sleep(5)
	Yell( ActorArray[3], "[SC_424480_11]",3)
	PlayMotion( ActorArray[3], ruFUSION_ACTORSTATE_EMOTE_ANGRY)				
	sleep(10)	

	ScriptMessage( ActorArray[1], TargetID(), 1 , "[SC_424480_09]", "0xffffff80" )	----(�������r�T��)�s���B�G��......
	ScriptMessage( ActorArray[1], TargetID(), 0 , "[SC_424480_09]", "0xffffff80" )
	DW_MoveDirectToFlag( ActorArray[1] , FlagID, 16, 0 ,1)				--�s���B����
	SetDefIdleMotion(ActorArray[1],ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotionEX(ActorArray[1], ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	SetModeEx(ActorArray[1],EM_SetModeType_Drag,true) 
	sleep(30)
	DelObj(ActorArray[1])
	sleep(20)
	Yell( ActorArray[4], "[SC_424480_10]",3)		----�ҫk�G���I�n�n�I�n�n�I���ΪA�I�����I�]emote_surrender�^
--	PlayMotion( ActorArray[4], ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
	sleep(20)


	--���t���F
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- �����X��\���~
end





---------------------------------------------------------------------------
--424470  ���h�h�ɪ�����
---------------------------------------------------------------------------
function LuaPG_424470_Click()
	local Player = OwnerID()
	local NPC = TargetID()

	if	CheckAcceptQuest(Player,424470)==true		and
		CheckCompleteQuest( Player , 424470) == false	and	
		CheckFlag(Player,545523)==false			then
			
			ScriptMessage( Player, Player, 1, "[SC_424470_01]",  "0xffbf0b2b"  )
			ScriptMessage( Player, Player, 0, "[SC_424470_01]",  "0xffbf0b2b"  )  
			Sleep(15)
			SetFlag(Player,545523,1)
	end
	return 1  ----�קK�I�������O�����
end



--���ȵ����ᱵ�@��
---------------------------------------------------------------------------
--�t���G119185�B119186
--����X�l�G781002	no.10
--BUFF�G620771
function LuaPG_424470_Accept()
	local Player = TargetID()
	local Robert = OwnerID()

	local Num = ReadRoleValue(Robert,EM_RoleValue_Register1)
	
	AddBuff( Player,620771,1,-1)

	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Robert , "LuaPG_424470_Accept_01" , Player , Robert)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424470_Accept_01(Player , Robert)
	WriteRoleValue(Robert,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	

	local Gill = Lua_DW_CreateObj("flag",119186,781002,11)
	local Merick = Lua_DW_CreateObj("flag",119185,781002,10)	

	local NeedChange = {Gill,Merick}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )	
	end

	DW_MoveDirectToFlag( Gill , 781002,12, 0 ,1)				----�N�ਫ��
	DW_MoveToFlag( Merick , 781002,13, 0 ,1)				----����J����
	NPCSay( Gill, "[SC_424470_02]")					----�N��G�o�ǫ���O���^�ơI					
	Sleep(20)

	for index,value in pairs(NeedChange) do
		DelObj(value)	
	end

	CancelBuff(Player,620771)
	WriteRoleValue(Robert,EM_RoleValue_Register1,0)			----�g�^�ҫk�Ȧs��
end




---------------------------------------------------------------------------
--424491  �s�P�T�ҲŤ�
---------------------------------------------------------------------------
--�t���G119171 �ɦ�
--BUFF�G620880
--�IĲ��A�u�|Ĳ�o�@���A��L�|���G���F�����Z��L�H���լd�A�еy���@�U......
function LuaPG_424491_Touch()
	SetCursorType( OwnerID() , 23)	
	SetPlot( OwnerID(),"touch","LuaPG_424491_Touch_01",30 )
end


function LuaPG_424491_Touch_01()						----�N�t��function��^NPC���W
	local Player = OwnerID()
	local DeadDragan = TargetID()

	DW_CancelTypeBuff(68,Player)				----�����M�����A
	local Num = ReadRoleValue(DeadDragan,EM_RoleValue_Register1)

	if	CheckAcceptQuest(Player,424491)==true		and    
		CheckCompleteQuest(Player,424491)==false  	 and
		CheckFlag(Player,545482)==false		and	
		CheckBuff(Player,620672)==false		then
		if	Num==0					then
			BeginCastBarEvent( Player, DeadDragan ,"[SC_424491_01]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424491_Touch_02" )
--			CallPlot(DeadDragan , "LuaPG_424491_Touch_02" , Player,DeadDragan)	
		else
			ScriptMessage( Player, Player, 1,"[SC_424491_TOUCH]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_424491_TOUCH]", 0 )
		end	
	end
end


--�IĲ��A�|�ݨ�ɮv���ӡA���@��
function LuaPG_424491_Touch_02(Player, CheckStatus)
	local Player = OwnerID()
	local DeadDragan = TargetID()
	EndCastBar( Player, CheckStatus )

--	Say(Player,"33")
--	Say(DeadDragan,"44")

	if	CheckStatus>0	then
		AddBuff(Player,620880,1,-1)
		CallPlot(DeadDragan , "LuaPG_424491_Touch_03" , Player,DeadDragan)		----���t��function	
	end
end

function LuaPG_424491_Touch_03(Player,DeadDragan)
	WriteRoleValue(DeadDragan , EM_RoleValue_Register1,999)

--	Say(Player,"00")
--	Say(DeadDragan,"11")

	local Serv = Lua_DW_CreateObj("flag",119171,781002,14)		----�����ɦ�
	DW_MoveToFlag( Serv , 781002,15, 0 ,1)				----�ɦ򺸨���
	AdjustFaceDir( Serv, DeadDragan, 0 )
	CastSpell(  Serv, DeadDragan, 498324 ) 				----�ɦ򺸹��s������I��k�N
	Sleep(50)
	ScriptMessage( Player, Player, 1,"[SC_424491_TOUCH_01]", 0 )
	ScriptMessage( Player, Player, 0,"[SC_424491_TOUCH_01]", 0 )	----SCRIPTM�G�H�ۦ�쨺�Ū���������A�ɦ򺸡D�v��������W�h�X�@���Ť�C

	DelObj(Serv)							----�R���t�����ɦ�
	
	CancelBuff(Player,620880)
	SetFlag(Player,545482,1)
	WriteRoleValue(DeadDragan , EM_RoleValue_Register1,0)
end

----�p�G�������ȡA�N����
function LuaPG_424491_Cancel_Buff()
--	Say(OwnerID(),"00")
	if	CheckAcceptQuest(OwnerID(),424491)==false	then
		CancelBuff(OwnerID(),620880)
	end
end


--�@����t��
---------------------------------------------------------------------------
--�t���G�ҫk119121  �N��119186  ����J119185
function LuaPG_424491_Accept()
	local Player = TargetID()
	local Merick = OwnerID()

	local Gill = LuaFunc_SearchNPCbyOrgID( Merick, 119216, 200, 0 )
	local Lobert = LuaFunc_SearchNPCbyOrgID( Merick, 119270, 200, 0 )

	local Num = ReadRoleValue(Merick,EM_RoleValue_Register1)
	
	AddBuff( Player,620672,1,-1)

	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Merick , "LuaPG_424491_Accept_01" , Player , Merick,Gill,Lobert)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424491_Accept_01(Player , Merick,Gill,Lobert)
	WriteRoleValue(Merick,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	

	local New_Merick = DW_CreateObjEX("obj",119102,Merick)
	local New_Gill = DW_CreateObjEX("obj",119103,Gill)
	local New_Lobert = DW_CreateObjEX("obj",119104,Lobert)	


	local NeedChange = {New_Merick,New_Gill,New_Lobert}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )	
	end

	PlayMotion(New_Merick,ruFUSION_ACTORSTATE_emote_head_shake)
	Sleep(10)
	DW_MoveToFlag( New_Merick , 781002,20, 0 ,1)				----����J���L�h
	NPCSAY(New_Merick,"[SC_424491_ACCEPT_01]")
	Sleep(20)

	for index,value in pairs(NeedChange) do
		SetDefIdleMotion(value,ruFUSION_ACTORSTATE_FLY_LOOP)
		PlayMotionEX(value, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
		SetModeEx(value,EM_SetModeType_Drag,true) 
	end

	Sleep(10)

	for index,value in pairs(NeedChange) do
		DelObj(value)	
	end

	CancelBuff(Player,620672)
	WriteRoleValue(Merick,EM_RoleValue_Register1,0)			----�g�^����J�Ȧs��
end