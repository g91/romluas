--��u=======================================
--424485  �M�z����o�W�t��
---------------------------------------------------------------------------
--�@���ǡG105971
function LuaPG_424485()
	local Player = OwnerID()

	if	CheckAcceptQuest(Player , 424485)==true	then
--		CheckCompleteQuest( Player , 424485) == false	then
		DW_QietKillOne(0,105971)			----�R�R�������ǡA�e�̱�����̡A0�N�����a
		ScriptMessage( Player, Player, 1, "[SC_424485_CLEAN]",  0  )
		ScriptMessage( Player, Player, 0, "[SC_424485_CLEAN]",  0  )  
	end
	return 1						----�קK�I�������O�����
end




---------------------------------------------------------------------------
--424493  �p����
---------------------------------------------------------------------------
--�r��GSC_424493_00�BSC_424493_01�BSC_424493_02�BSC_424493_03�BSC_424493_04�BSC_424493_05
--���~�G240528
function LuaPG_424493()
	SetCursorType( OwnerID() , 23)				----�����I�����ϥ�
	SetPlot( OwnerID(),"touch","LuaPG_424493_01",30 )
end

function LuaPG_424493_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local Num01=ReadRoleValue(NPC,EM_RoleValue_Register1)

	DW_CancelTypeBuff(68,Player)				----�����M�����A

	if 	CheckAcceptQuest(Player , 424493)==true		and
--		CheckCompleteQuest( Player , 424493) == false	and	
		CountBodyItem(Player,240528)<5		 	then
								----�P�_����
								----�P�_���~
		if	Num01==0					then
								----�P�_�Ѽ�
			WriteRoleValue(NPC , EM_RoleValue_Register1 , 999)
								----�N�p��functuon��_��									
			ScriptMessage( Player , Player, 1,"[SC_424493_00]", 0 )
								----�Q�β��ʱ���񦬦^���ɶ�
			CallPlot(NPC,"LuaPG_424493_03",NPC,Player)

			if 	BeginCastBarEvent( Player, NPC ,"[SC_424493_04]", 80, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424493_02" ) ~= 1 then
								----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
					ScriptMessage( Player, Player, 1,"[SC_424493_05]", 0 )		
								----�ؼЦ��L��
					ScriptMessage( Player, Player, 0,"[SC_424493_05]", 0 )		
								----�ؼЦ��L��		
			end
		end

	elseif 	CheckAcceptQuest(Player , 424487)==true		and
--		CheckCompleteQuest( Player , 424487) == false	and	
		CountBodyItem(Player,240542)<10		 	then
								----�P�_����
								----�P�_���~
		if	Num01==0					then
								----�P�_�Ѽ�
			WriteRoleValue(NPC , EM_RoleValue_Register1 , 999)
								----�N�p��functuon��_��									
			ScriptMessage( Player , Player, 1,"[SC_424493_00]", 0 )
								----�Q�β��ʱ���񦬦^���ɶ�
			CallPlot(NPC,"LuaPG_424487_03",NPC,Player)

			if 	BeginCastBarEvent( Player, NPC ,"[SC_424487_04]", 80, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424487_02" ) ~= 1 then
								----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
					ScriptMessage( Player, Player, 1,"[SC_424493_05]", 0 )		
								----�ؼЦ��L��
					ScriptMessage( Player, Player, 0,"[SC_424493_05]", 0 )		
								----�ؼЦ��L��		
			end

		else
			ScriptMessage( Player, Player, 1,"[SC_424493_05]", 0 )	
								----�ؼЦ��L��
			ScriptMessage( Player, Player, 0,"[SC_424493_05]", 0 )		
								----�ؼЦ��L��	
		end
	else
		ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )			--�ϥα��󤣲�
		return	
	end
end

function LuaPG_424493_02(Player, CheckStatus)
	local Player = OwnerID()
	local NPC = TargetID()
	EndCastBar( Player, CheckStatus )
	WriteRoleValue(NPC , EM_RoleValue_Register1 , 0)
	Sleep(10)

	local Num02=ReadRoleValue(NPC,EM_RoleValue_Register2)
		if( CheckStatus ~= 0 ) then
			if Num02 <= 40 then
				ScriptMessage( Player, Player, 1,"[SC_424493_01]", 0 )

			elseif Num02 <=60 then
				ScriptMessage( Player, Player, 1,"[SC_424493_02]", 0 )
				GiveBodyItem(Player,240528,1)
			else
				ScriptMessage( Player, Player, 1,"[SC_424493_03]", 0 )
			end
		else
			-- ����
			EndCastBar( Player, CheckStatus )
		end
	WriteRoleValue(NPC , EM_RoleValue_Register2,0)
end

function LuaPG_424493_03(NPC , Player)
	for i=1,80,1 do
		local Num01=ReadRoleValue(NPC,EM_RoleValue_Register1)
		if Num01==0 then
			return
		end
		Sleep(1)

		local y=i%10					----�C10�]1��^�@���P�_�A�@8��						
			if y==0 then
				WriteRoleValue(NPC,EM_RoleValue_Register2,i)
			end
		--Say(NPC,y..","..i)
	end
	return			
end




---------------------------------------------------------------------------
--424494  ���{�̪��p���Y
---------------------------------------------------------------------------
--FLAG�G545480�B545481
--���~�G240531�B240536
function LuaPG_424494()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	secret_people_start()

	if	CheckAcceptQuest(Player , 424494 )==true		and
		CheckCompleteQuest( Player , 424494) == false	and
		CountBodyItem(Player,240531)==1			and
		CheckFlag(Player,545480)==false			and
		CheckFlag(Player,545481)==false			then	
	
			AddSpeakOption(Player, NPC , "[SC_424494_01]","LuaPG_424494_01",0)		
	end

	if	CheckAcceptQuest(Player , 424495 )==true		and
		CheckCompleteQuest( Player , 424495) == false	and
		CheckFlag(Player,545483)==false			then

		if	CheckBuff(Player,620665)==true		then
			AddSpeakOption(Player, NPC , "[SC_424495_01]","LuaPG_424495_01",0)
		end		
	end
end

function LuaPG_424494_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	DelBodyItem(Player , 240531 , 1)
	SetSpeakDetail(Player,"[SC_424494_02]")
	SetFlag(Player,545480,1)
	Sleep(30)
	GiveBodyItem(Player , 240536 , 1)
end

function LuaPG_424494_02()	
	local Player = OwnerID()
	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player,424494)==true	and
		CheckCompleteQuest( Player , 424494) == false	and
		CountBodyItem(Player,240536)==1			and
		CheckFlag(Player,545480)==true			and
		CheckFlag(Player,545481)==false			then

		DelBodyItem(Player , 240536 , 1)
		SetFlag(Player,545481,1)
	end	
end

---------------------------------------------------------------------------
--424494 ���ȵ�����t��
--�t���G119097�B
--����G781001��no1��2
function LuaPG_424494_Complete()
	local Player = TargetID()
	local Mart = OwnerID()
	
	local Num = ReadRoleValue(Mart,EM_RoleValue_Register1)
	AddBuff(Player , 620732 , 1 , -1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		SetFlag(Player,545482,1)
		CallPlot(Mart , "LuaPG_424494_Complete_01" , Mart ,Player)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424494_Complete_01(Mart , Player)
	WriteRoleValue(Mart,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	

	local Aruty = Lua_DW_CreateObj("flag",119097,781001,1)		----�ͦ��t��119097
	ks_ActSetMode( Aruty )				

	DW_MoveToFlag( Aruty , 781001,2, 0 ,1)				----119097��781001��1����2
				
	NPCSAY(Aruty,"[SC_424494_COMPLETE_01]")				----119097�G�ڷQ�A�̳Q�F�F
	Sleep(30)
	DelObj(Aruty)								----119097����								
	SetFlag(Player,545482,0)

	CancelBuff(Player, 620732)			
	WriteRoleValue(Mart,EM_RoleValue_Register1,0)			----�g�^Mart�Ȧs��
end



---------------------------------------------------------------------------
--424495  �ۧ@�ۨ�
---------------------------------------------------------------------------
--���˳N
---------------------------------------------------------------------------
function LuaPG_424495_Check()							----���˦��ӤH�A�ϥΪ��~�e���ˬd
	local Player = OwnerID()
								
	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_423191_D_1]" , 0 ) 		----�԰����L�k���ˡC
		ScriptMessage( Player , Player , 0 , "[SC_423191_D_1]" , 0 )
		return false
	end
	if CheckBuff( Player , 620665 ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_424495_CHECK]" , 0 ) 		----�A�w�g���W[240537]�F
		ScriptMessage( Player , Player , 0 , "[SC_424495_CHECK]" , 0 )
		return false
	end
	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_423191_D_3]" , 0 ) 	----�A�L�k�b�M���ɴ���
			ScriptMessage( Player , Player , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaPG_424495_Use()
	local Player = OwnerID()							----���˦��ӤH

	AddBuff(Player ,620665,0,-1)
	ScriptMessage( Player , Player , 1 , "[SC_424495_WEAR]" , 0 ) 		----����
	ScriptMessage( Player , Player , 0 , "[SC_424495_WEAR]" , 0 )
end

--function LuaPG_424495_Complete()								----�������ȡA�����ӤH����
--	CancelBuff(TargetID() ,620665)
--end


--�F�^�ï]���
---------------------------------------------------------------------------
--���~�G���U240538
--flag�G545483
--buff�G620665
function LuaPG_424495_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	SetSpeakDetail(Player,"[SC_424495_02]")

	if	CountBodyItem(Player,240538)==1		and
		CheckBuff(Player,620665)==true		then

		AddSpeakOption(Player, NPC , "[SC_424495_03]","LuaPG_424495_02",0)
	end		
end

function LuaPG_424495_02()
	local Player = OwnerID()
	local NPC = TargetID()	
							
	SetSpeakDetail(Player,"[SC_424495_04]")
	DelBodyItem(Player, 240538 , 1)
	SetFlag(Player , 545483 , 1)
end


---------------------------------------------------------------------------
--424495 ���ȵ�����t��
--�t���G118799�B
--����G781001��no1��2
function LuaPG_424495_Complete()
	local Player = TargetID()
	local Mart = OwnerID()

	CancelBuff(Player ,620665)
	local Num = ReadRoleValue(Mart,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		SetFlag(Player,545482,1)
		CallPlot(Mart , "LuaPG_424495_Complete_01" , Mart ,Player)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424495_Complete_01(Mart , Player)
	WriteRoleValue(Mart,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	

	local Aruty = Lua_DW_CreateObj("flag",118799,781001,2)		----�ͦ��t��119097
	ks_ActSetMode( Aruty )				

	NPCSAY(Aruty,"[SC_424495_COMPLETE_01]")				----119097�G���߮��^�ۤv���F��
	Sleep(30)
	DW_MoveToFlag( Aruty , 781001,1, 0 ,1)				----119097��781001��2����1

	DelObj(Aruty)								----119097����								
							
	WriteRoleValue(Mart,EM_RoleValue_Register1,0)			----�g�^Mart�Ȧs��
end





---------------------------------------------------------------------------
--424496  �ǲ߿O��H��
---------------------------------------------------------------------------
--flag�G545478
function LuaPG_424496()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424496 )==true		and
		CheckCompleteQuest( Player , 424496) == false	and
		CheckFlag(Player,545478)==false			then	
	
			SetSpeakDetail(Player,"[SC_424496_00]")
			AddSpeakOption(Player, NPC , "[SC_424496_01]","LuaPG_424496_01",0)
			AddSpeakOption(Player, NPC , "[SC_424496_02]","LuaPG_424496_02",0)
	else
			LoadQuestOption(Player)
	end
end

function LuaPG_424496_01()					----�O��ۨ�����
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424496_03]")
	AddSpeakOption(Player, NPC , "[SC_424496_02]","LuaPG_424496_02",0)
	AddSpeakOption(Player, NPC , "[SC_424496_04]","LuaPG_424496_03",0)
end

function LuaPG_424496_02()					----�q����D
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424496_05]")
	AddSpeakOption(Player, NPC , "[SC_424496_01]","LuaPG_424496_01",0)
	AddSpeakOption(Player, NPC , "[SC_424496_04]","LuaPG_424496_03",0)
end

function LuaPG_424496_03()					----�^�������F
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424496_06]")
	AddSpeakOption(Player, NPC , "[SC_424496_07]","LuaPG_424496_05",0)
	AddSpeakOption(Player, NPC , "[SC_424496_08]","LuaPG_424496_05",0)
	AddSpeakOption(Player, NPC , "[SC_424496_09]","LuaPG_424496_04",0)
end

function LuaPG_424496_04()					----�^�����T
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424496_12]")
	SetFlag(Player , 545478 , 1)
end

function LuaPG_424496_05()					----�^�����~
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424496_10]")
	AddSpeakOption(Player, NPC , "[SC_424496_11]","LuaPG_424496_03",0)
end



---------------------------------------------------------------------------
--424497  �B�y�����G��
---------------------------------------------------------------------------
--flag�G545479
function LuaPG_424497()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424497 )==true		and
		CheckCompleteQuest( Player , 424497 ) == false	and
		CheckFlag(Player,545479)==false			then	
	
			SetSpeakDetail(Player,"[SC_424497_00]")
			AddSpeakOption(Player, NPC , "[SC_424497_01]","LuaPG_424497_01",0)
			AddSpeakOption(Player, NPC , "[SC_424497_02]","LuaPG_424497_02",0)
	else
			LoadQuestOption(Player)
	end
end

function LuaPG_424497_01()					----�~��������
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424497_03]")
	AddSpeakOption(Player, NPC , "[SC_424497_02]","LuaPG_424497_02",0)
	AddSpeakOption(Player, NPC , "[SC_424497_04]","LuaPG_424497_03",0)
end

function LuaPG_424497_02()					----�`�Ҫ�����
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424497_05]")
	AddSpeakOption(Player, NPC , "[SC_424497_01]","LuaPG_424497_01",0)
	AddSpeakOption(Player, NPC , "[SC_424497_04]","LuaPG_424497_03",0)
end

function LuaPG_424497_03()					----�^������ť�L�F
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424497_06]")
	SetFlag(Player , 545479 , 1)
end






--PE������=======================================
--424507  �o�����̱����
---------------------------------------------------------------------------
--�r��GSC_SECRET_SIGN_01�BSC_SECRET_SIGN_02�BSC_424507_01
--Flag�G545477
function LuaPG_424507()
	local Player = OwnerID()
	LoadQuestOption(Player)
	if	CheckCompleteQuest(Player,424515) == true then
			AddSpeakOption(Player, TargetID(),"[SC_SECRET_SIGN_01]","LuaPG_424507_01",0)
	end								----�Ѯ�o��n�A������S������
end

function LuaPG_424507_01()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_SECRET_SIGN_02]")		----�]���ɭ��B�b�n�p�_�Ҥ���A�ҥH���ø��b�_�̡C								

	if	CheckAcceptQuest(Player , 424507 )==true		and
		CheckFlag(Player,545477)==false			and
		CountBodyItem(Player,240529)==1			then
		
		AddSpeakOption(Player, TargetID(),"[SC_424507_01]","LuaPG_424507_02",0)
								----�ⱡ�����R�ܸ�
	end
end

function LuaPG_424507_02()
	local Player = OwnerID()
	DelBodyItem(Player,240529, 1)
	CloseSpeak(Player)
	SetFlag(Player , 545477 , 1)
end