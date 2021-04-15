--z25��u�BPE�B�e�U=======================================
--=======================================
--425826 �̩]���n
---------------------------------------------------------------------------
function LuaPG_425826_TalktoGirl()
	local Player = OwnerID()
	local Mist_Girl = TargetID()

	if DW_CheckQuestAccept("or",Player, 425826) == true	then
		if CheckFlag(Player, 547371)==false		then
			SetSpeakDetail(Player, "[SC_Z25Q425826_1]")
			AddSpeakOption(Player,Mist_Girl, "[SC_Z25Q425826_2]", "LuaPG_425826_TalktoGirl_02(1)", 0 )
		else
			LoadQuestOption(Player)
		end
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425826_TalktoGirl_02(Action)
	local Player = OwnerID()
	local Mist_Girl = TargetID()
	local Num = ReadRoleValue(Mist_Girl,EM_RoleValue_Register1)
	local BUFF = 623966

	if Action==1	then
		SetSpeakDetail(Player,"[SC_Z25Q425826_3]")
		AddSpeakOption(Player,Mist_Girl, "[SC_Z25Q425826_4]", "LuaPG_425826_TalktoGirl_02(2)", 0 )

	elseif Action==2	then
		CloseSpeak(Player)
		SetFlag(Player,547371, 1)
		if Num==0	then
			WriteRoleValue( Mist_Girl, EM_RoleValue_Register1, 999)					----�W�� ��ܥ��b�t��
			AddBuff(Player, BUFF, 0,10)
			CallPlot(Mist_Girl, "LuaPG_425826_TalktoGirl_Show" , Mist_Girl, Player,BUFF,Num)
		elseif Num>0	then
			ScriptMessage( Player, Player, 1, "[SC_Z25Q425826_6]","0xffbf0b2b" )
			ScriptMessage( Player, Player, 0, "[SC_Z25Q425826_6]","0xffbf0b2b" )
		end
	end
end

function LuaPG_425826_TalktoGirl_Show(Mist_Girl, Player,BUFF,Num)
	local Mist_Girl_02 = DW_CreateObjEX("obj",121754,Mist_Girl)
	NPCSAY(Mist_Girl_02, "[SC_Z25Q425826_5]")
	Sleep(15)
	DelObj(Mist_Girl_02)
	ScriptMessage( Player, Player, 1, "[SC_Z25Q425826_6]","0xffbf0b2b" )
	ScriptMessage( Player, Player, 0, "[SC_Z25Q425826_6]","0xffbf0b2b" )
	CancelBuff(Player, 623966)
	WriteRoleValue( Mist_Girl, EM_RoleValue_Register1, 0)
end


--���y������
--Flag:781257  NO.4
function LuaPG_425826_Lead()
	local Player = OwnerID()
	if	DW_CheckMap(Player,551)==true		then
		local tips = Lua_DW_CreateObj("obj" , 112399, Player,0)
		Lua_ObjDontTouch(tips)
		SetModeEx( tips , EM_SetModeType_Gravity , false ) 
		AddToPartition(tips,0)
		AddBuff(tips,502924,1,-1)
		if CheckAcceptQuest( Player,425826) == true	then
			BeginPlot(tips,"LuaPG_425826_Lead_2",0)
			BeginPlot(tips,"LuaPG_425826_Lead_3",0)
		else
			ScriptMessage( Player,Player,3,"[SC_Z25Q425826_7]",0)
		end
		return true
	else
		ScriptMessage( Player,Player, 1, "[SC_DAN_111700_37]", 0 ) --�A�L�k�b���ϰ�ϥθӪ��~
		return false
	end
end
function LuaPG_425826_Lead_2()
	local Player = OwnerID()	
	local flag = 781257
	local FlagX = GetMoveFlagValue( flag , 4 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( flag , 4 , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( flag , 4 , EM_RoleValue_Z )
	MoveDirect( Player, FlagX , FlagY , FlagZ )
	sleep(15)
	if	ReadRoleValue(Player,EM_RoleValue_X)/10 == FlagX/10		and
		ReadRoleValue(Player,EM_RoleValue_Z)/10 == FlagZ/10		then
		ScriptMessage( Player, Player, 1, "[SC_420931_2]", 0 ) --�l�ܾ����V�o�̡K�K
		ScriptMessage(  Player, Player, 0, "[SC_420931_2]", 0 ) --�l�ܾ����V�o�̡K�K
	end
end

function LuaPG_425826_Lead_3()
	sleep(20)
	DelObj(OwnerID())	
end

function LuaPG_425826_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player, 425826) == true	and
	CountBodyItem(Player, 242135)==0			then
		AddSpeakOption(Player,NPC, "[SC_Z25Q425826_8]", "LuaPG_425826_Retake_02", 0 )
	end
end

function LuaPG_425826_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242135, 1)
end



--=======================================
--425819 ���λPĨۣ
---------------------------------------------------------------------------
function LuaPG_425819_Mushroom_Check()
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local BuffCheck=Lua_BuffPosSearch( NPC ,623975)				--��BUFF����l
	local BuffLv = BuffInfo( NPC, BuffCheck , EM_BuffInfoType_Power )			--�������Ϊ�buff�h��
--	Say(Player, "00")
	if CountBodyItem(Player, 242108)>=5	then
		ScriptMessage( Player, Player, 1,"[SC_Z25Q425819_2]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z25Q425819_2]", 0 )
		return false		
	end
	if BuffLv>=2	then
		ScriptMessage( Player, Player, 1,"[SC_Z25Q425819_1]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z25Q425819_1]", 0 )
		return false
	end
	if DW_CheckQuestAccept("or",Player, 425819) == true	then
		if OrgID==107500				then		--�ˬd�ϥΥؼСA�p�G�O����
--			Say(Player, "11")
			return true
		else
			ScriptMessage( Player, Player, 1,"[SC_204425_1]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_204425_1]", 0 )	
			return false
		end
	end
end

function LuaPG_425819_Mushroom_Use()
	local Player = OwnerID()
	local NPC = TargetID()
	local BuffCheck=Lua_BuffPosSearch( NPC ,623975)				--��BUFF����l
	local BuffLv = BuffInfo( NPC, BuffCheck , EM_BuffInfoType_Power )			--�������Ϊ�buff�h��
	local x,y,z,dir = DW_Location(NPC)
--	say(NPC,BuffLv)
	if BuffLv==2	then								--�p�Gbuff��F�h��
		Hide( NPC)							--�N���ä���
		CallPlot( NPC, "LuaFunc_ResetObj", NPC)					--���m����
		local Mushroom = CreateObj(121731, X, Y, Z , Dir, 1 )			--���ζi�J���͡A��a�ͭ�Ĩۣ
		AddToPartition( Mushroom, 0 )
		Sleep(100)
		if  Mushroom~=nil	then						--�ɶ���F�A�R��Ĩۣ
			DelObj(Mushroom)
		end
	elseif BuffLv<2	then
			ScriptMessage( Player, Player, 1,"[SC_Z25Q425819_4]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_Z25Q425819_4]", 0 )		
	end
end

function LuaPG_425819_Before_Click()
	local Player = OwnerID()
	if CountBodyItem(Player, 242108)<5	then
		return true
	else
		ScriptMessage( Player, Player, 1,"[SC_Z25Q425819_2]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z25Q425819_2]", 0 )
		return false		
	end
end

function LuaPG_425819_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player, 425819) == true	and
	CountBodyItem(Player, 242112)==0			then
		AddSpeakOption(Player,NPC, "[SC_Z25Q425819_3]", "LuaPG_425819_Retake_02", 0 )
	end
end

function LuaPG_425819_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242112, 1)
end



--=======================================
--425862 �g�����
---------------------------------------------------------------------------
function LuaPG_425862_After_Click()
	local Player = OwnerID()
	ScriptMessage( Player, Player, 1,"[SC_Z25Q425862_1]", 0 )
	ScriptMessage( Player, Player, 0,"[SC_Z25Q425862_1]", 0 )
	return 1		
end

---------------------------------------------------------------------------
--�����᪺�t��
---------------------------------------------------------------------------
--Flag:781257  NO.2~3
--Actor:121764 �����D�v�Z����, 121776 �d�A�R�D���ɺ�
--BUFF:509332
function LuaPG_425862_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local Flag = 781257
	local BUFF = 509332
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		local New_NPC= DW_CreateObjEX("obj", 121764, NPC)	----�ͦ��t��
		ks_ActSetMode( New_NPC )
		AddBuff( Player,509332,0, 20)
		CallPlot(NPC, "LuaPG_425862_Complete_02" , New_NPC, NPC, Player, Flag, BUFF)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425862_Complete_02(New_NPC, NPC, Player, Flag, BUFF)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO

	local Soilder = Lua_DW_CreateObj("flag",121776, Flag, 2)			----���ͳq�����h�L
	ks_ActSetMode( Soilder )
	Sleep(10)
	WriteRoleValue(Soilder , EM_RoleValue_IsWalk , 0)
	NPCSAY(Soilder, "[SC_Z25Q425863_1]")
	DW_MoveToFlag( Soilder , Flag, 3, 0, 1)					--���W�e������
	PlayMotion(Soilder, ruFUSION_ACTORSTATE_EMOTE_CRY)
	NPCSAY(Soilder, "[SC_Z25Q425863_2]")
	Sleep(20)
	PlayMotion(New_NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSAY(New_NPC, "[SC_Z25Q425863_3]")
	Sleep(25)
	DelObj(Soilder)
	DelObj(New_NPC)

	CancelBuff(Player, BUFF)	
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
end


--=======================================
--425863 �L�Y�M�h
---------------------------------------------------------------------------
--Flag:781257  NO.1
function LuaPG_425863_Call_Monster()
	SetPlot( OwnerID(),"range","LuaPG_425863_Call_Monster_02",40 )
end

function LuaPG_425863_Call_Monster_02()
	local Player = OwnerID()
	local Center = TargetID()
	if CheckAcceptQuest(Player, 425863) == true	and
	CheckFlag(Player,547377)==false then
		SetPlot(Center,"Range","",0);
		CallPlot(Center, "LuaPG_425863_Call_Monster_03", Center,Player)
	end
end

function LuaPG_425863_Call_Monster_03(Center,Player)
	local Flag = 781257
	local Headless = Lua_DW_CreateObj("flag",107571, Flag, 1)		 --�I�s�L�Y�M�h
	SetAttack(Headless,Player)
	WriteRoleValue(Headless, EM_RoleValue_Register1 , Center)
end	

function LuaPG_425863_Headless_Died()		--�L�Y�M�h�����ˬd�����
	local Headless = OwnerID()
	local Center = ReadRoleValue(Headless, EM_RoleValue_Register1)
	local Playerlist = DW_HateSequence( 0 )
	for i=1,table.getn(Playerlist) do
		if CheckAcceptQuest(Playerlist[i], 425863) == true and
			CheckFlag(Playerlist[i], 547377)==false then
			SetFlag(Playerlist[i], 547377, 1)
		end
	end
	BeginPlot(Center,"LuaPG_425863_Call_Monster",10);
end

function LuaPG_425863_Headless_Delete()	--�L�Y�M�h�R������]1.���ӻ� 2.�L�[�S���i�J�԰��^
	local Headless = OwnerID()
	local Center = ReadRoleValue(Headless, EM_RoleValue_Register1)
	local Hate = 0 
	while 1 do
		if CheckDistance(Headless,Center, 200)==false	then
			ScriptMessage( Headless, 0, 1,"[SC_Z25Q425863_4]", 0 )
			ScriptMessage( Headless, 0, 0,"[SC_Z25Q425863_4]", 0 )
			BeginPlot(Center,"LuaPG_425863_Call_Monster",10);
			DelObj(Headless)
			break
		end
		Hate = HateListCount(Headless)
		if Hate==0 and  ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  ==  0 then
			ScriptMessage( Headless, 0, 1,"[SC_Z25Q425863_4]", 0 )
			ScriptMessage( Headless, 0, 0,"[SC_Z25Q425863_4]", 0 )
			BeginPlot(Center,"LuaPG_425863_Call_Monster",10);
			DelObj(Headless)
			break			
		end
		Sleep(20)
	end
end


--=======================================
--425864 �ͩR���N
---------------------------------------------------------------------------
function LuaPG_425826_Ask()
	local Player = OwnerID()
	local Ichard = TargetID()

	if DW_CheckQuestAccept("or",Player, 425864) == true	then
		if CheckFlag(Player, 547383)==false		then
			SetSpeakDetail(Player, "[SC_Z25Q425864_1]")
			AddSpeakOption(Player,Ichard, "[SC_Z25Q425864_2]", "LuaPG_425826_Ask_1(1)", 0 )
		else
			LoadQuestOption(Player)
		end
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425826_Ask_1(Ask)
	local Player = OwnerID()
	local Ichard = TargetID()
	if Ask == 1	then
		SetSpeakDetail(Player, "[SC_Z25Q425864_3]")
		AddSpeakOption(Player,Ichard, "[SC_Z25Q425864_4]", "LuaPG_425826_Ask_1(2)", 0 )
	elseif Ask == 2	then
		SetSpeakDetail(Player, "[SC_Z25Q425864_5]")
		AddSpeakOption(Player,Ichard, "[SC_Z25Q425864_6]", "LuaPG_425826_Ask_1(3)", 0 )
	elseif Ask == 3	then
		CloseSpeak(Player)
		SetFlag(Player, 547383, 1)
	end
end


--=======================================
--425865 �}�k�O��
---------------------------------------------------------------------------
function LuaPG_425865_Touch()
	local Stone = OwnerID()
	SetCursorType( Stone , 23)							----�����I�����ϥ�
	SetPlot( Stone, "touch", "LuaPG_425865_Destroy", 10 )
end

function LuaPG_425865_Destroy()		--�IĲ�@��
	local Player = OwnerID()
	local Stone = TargetID()
	local Num01=ReadRoleValue(Stone, EM_RoleValue_Register3)

	DW_CancelTypeBuff(68,Player)						----�����M�����A
	if DW_CheckQuestAccept("or",Player,425865)==true	then		--�p�G����ŦX
		if Num01 == 0					then
			if 	BeginCastBarEvent( Player, Stone ,"[SC_Z24Q425865_01]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_425865_Destroy_01" ) ~= 1 then
										----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player, Player, 1,"[SC_Z24Q425865_02]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_Z24Q425865_02]", "0xffbf0b2b" )
			end
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
	end	
end

function LuaPG_425865_Destroy_01(Player, CheckStatus)
	local Stone = TargetID()
	EndCastBar( Player, CheckStatus)
	if (CheckStatus ~= 0) then
		if (CheckStatus>0) then
			CallPlot(Stone, "LuaPG_425865_Destroy_02", Stone,Player)			--Ĳ�o�@��
			DW_QietKillOne(Player,107569)						 --�R�R�������ǡA�e�̱�����̡A0�N�����a
		else
			EndCastBar( Player, CheckStatus)
		end
	end
end

function LuaPG_425865_Destroy_02(Stone,Player)
	AddBuff(Stone,621170,0,10)
	Hide( Stone)
	Sleep(200)
	Show(Stone, 0)		
end



--=======================================
--425854 �R�Ш�§
---------------------------------------------------------------------------
function LuaPG_425854_Dance()
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

	if DW_CheckQuestAccept("or",Player,425854)==true	then			--�ˬd����
		if OrgID==121789				then			--�ˬd�s���Mflag
			if CheckFlag(Player,547499)==false	then
				if Num==0			then			--�ˬd���S���Q���
					SetSpeakDetail(Player, "[SC_Z25Q425854_1]")
					AddSpeakOption(Player,NPC, "[SC_Z25Q425854_2]", "LuaPG_425854_Dance_02(1)", 0 )	--�ǲ�
				elseif Num>0			then
					SetSpeakDetail(Player, "[SC_Z25Q425854_4]")
				end
			else
				LoadQuestOption(Player)
			end
		elseif OrgID~=121789				then
			SetSpeakDetail(Player, "[SC_Z25Q425854_12]")
			AddSpeakOption(Player,NPC, "[SC_Z25Q425854_3]", "LuaPG_425854_Dance_02(2)", 0 )	--�����L��
		end
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425854_Dance_02(Dance)
	local Player = OwnerID()
	local NPC = TargetID()
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local BUFF = 623966
	local FlagList = {}
	FlagList[121790] = 547495
	FlagList[121791] = 547496
	FlagList[121792] = 547497
	if Dance==1		then
		CloseSpeak(Player)
		WriteRoleValue( NPC, EM_RoleValue_Register1, 999)			--�W�� ��ܥ��b�t��
		AddBuff(Player, BUFF, 0,10)
		CallPlot(NPC, "LuaPG_425854_Dance_03", Player,NPC,Num,FlagList,OrgID)		

	elseif Dance==2	then
		if CheckFlag(Player,547499)==false	then			--�ˬd���S���ǹL
			ScriptMessage( Player, Player, 1, "[SC_Z25Q425854_11]", 0 )
			ScriptMessage(  Player, Player, 0, "[SC_Z25Q425854_11]", 0 )
			CloseSpeak(Player)
		elseif CheckFlag(Player,547499)==true	then 
			if CheckFlag(Player, FlagList[OrgID])==false	then 
				if Num~=0	then
					SetSpeakDetail(Player, "[SC_Z25Q425854_4]")
				else		
					WriteRoleValue( NPC, EM_RoleValue_Register1, 999)	--�W�� ��ܥ��b�t��
					CallPlot(NPC, "LuaPG_425854_Dance_03" , Player,NPC,Num,FlagList,OrgID)
				end
			else
				ScriptMessage( Player, Player, 1, "[SC_Z25Q425854_10]", 0 )
				ScriptMessage(  Player, Player, 0, "[SC_Z25Q425854_10]", 0 )	
			end
		end
	end
end

function LuaPG_425854_Dance_03(Player,NPC,Num,FlagList,OrgID)
	local RandNum = Rand(5)+1
	local BUFF = 623966
	if OrgID==121789	then
		local New_NPC= DW_CreateObjEX("obj", 121813, NPC)			--�ͦ��t��
		ks_ActSetMode(New_NPC)
		AddBuff(Player, 624061, 0,12)
		NPCSAY(New_NPC, "[SC_Z25Q425854_13]")
		PlayMotion(New_NPC, ruFUSION_ACTORSTATE_CAST_SP01)		
		Sleep(30)
		PlayMotion(Player, ruFUSION_ACTORSTATE_EMOTE_DANCE)
		Sleep(30)
		NPCSAY(New_NPC, "[SC_Z25Q425854_14]")
		PlayMotion(New_NPC, ruFUSION_ACTORSTATE_BUFF_SP02)
		Sleep(30)
		PlayMotion(Player, ruFUSION_ACTORSTATE_EMOTE_DANCE)
		DelObj(New_NPC)
		SetFlag(Player, 547499, 1)
	else
		CloseSpeak(Player)
		AddBuff(Player, 624061, 0,12)
		PlayMotion(Player, ruFUSION_ACTORSTATE_EMOTE_DANCE)
		Sleep(30)
		Say(NPC,"[SC_Z25Q425854_"..(RandNum+4).."]")
		Sleep(25)
		SetFlag(Player, FlagList[OrgID], 1)
		if CheckFlag(Player, 547495)==true	and
		CheckFlag(Player, 547496)==true	and
		CheckFlag(Player, 547497)==true	then
			SetFlag(Player, 547498, 1)
		end
	end
	CancelBuff(Player,BUFF)
	CancelBuff(Player,624061)
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0)				--����
end

function LuaPG_425854_Buff_Check()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,425854)==false	then
		CancelBuff(Player,624061)
	end
end


--=======================================
--425856 ���Y���ߨ�
---------------------------------------------------------------------------
function LuaPG_425856_Water()			--����
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425856)==true	and
	CountBodyItem(Player, 242138)==0			then
		AddSpeakOption(Player,NPC, "[SC_Z25Q425856_6]", "LuaPG_425856_Water_02(1)", 0 )
	end
end

function LuaPG_425856_Water_02(Option)
	local Player = OwnerID()
	local NPC = TargetID()	
	if Option==1		then
		SetSpeakDetail(Player, "[SC_Z25Q425856_1]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q425856_2]", "LuaPG_425856_Water_02(2)", 0 )
	elseif Option==2	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 242138, 1)
	end
end

function LuaPG_425856_Touch()
	local Kub = OwnerID()
	SetCursorType( Kub , 23)							----�����I�����ϥ�
	SetPlot( Kub, "touch", "LuaPG_425856_WakeUp", 10 )
end

function LuaPG_425856_WakeUp()		--�I���w��
	local Player = OwnerID()
	local Kub = TargetID()
	local Num01=ReadRoleValue(Kub, EM_RoleValue_Register1)

	DW_CancelTypeBuff(68,Player)						----�����M�����A
	if DW_CheckQuestAccept("or",Player,425856)==true	and		--�p�G����ŦX
	CountBodyItem(Player, 242138)>0			then
		if Num01 == 0					then
			if 	BeginCastBarEvent( Player, Kub ,"[SC_Z25Q425856_4]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_425856_WakeUp_01" ) ~= 1 then
										----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player, Player, 1,"[SC_Z25Q425856_3]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_Z25Q425856_3]", "0xffbf0b2b" )
			end
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
	end	
end

function LuaPG_425856_WakeUp_01(Player, CheckStatus)
	local Kub = TargetID()
	EndCastBar( Player, CheckStatus)
	if (CheckStatus ~= 0) then
		if (CheckStatus>0) then
			DelBodyItem(Player, 242138, 1)
			CallPlot(Kub, "LuaPG_425856_WakeUp_02", Kub,Player)			--Ĳ�o�@��
			AddBuff(Player, 623998, 0, 10)
			SetFlag(Player, 547502, 1)
		else
			EndCastBar( Player, CheckStatus)
		end
	end
end

function LuaPG_425856_WakeUp_02(Kub,Player)
	WriteRoleValue(Kub,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO
	local New_Kub = DW_CreateObjEX("obj", 121839, Kub)			----�ͦ��t��
	ks_ActSetMode( New_Kub )
	PlayMotion( New_Kub, ruFUSION_ACTORSTATE_SLEEP_LOOP)
	Sleep(10)
	NPCSAY(New_Kub, "[SC_Z25Q425856_5]")
	Sleep(10)
	PlayMotion(New_Kub, ruFUSION_ACTORSTATE_SLEEP_END)
	Sleep(25)
	DelObj(New_Kub)

	CancelBuff(Player, 623998)	
	WriteRoleValue(Kub,EM_RoleValue_Register1,0)			
end



--=======================================
--425857 �������ڹ�
---------------------------------------------------------------------------
function LuaPG_425857_Ask()
	local Player = OwnerID()
	local Kub = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player, 425857) == true	then
		if CheckFlag(Player, 547503)==false		then
			AddSpeakOption(Player,Kub, "[SC_Z25Q425857_1]", "LuaPG_425857_Ask_1(1)", 0 )
		end
	end
end

---------------------------------------------------------------------------
--Flag:781257  NO.5
--BUFF:623999
function LuaPG_425857_Ask_1(Ask)
	local Player = OwnerID()
	local Kub = TargetID()
	local Num = ReadRoleValue(Kub,EM_RoleValue_Register1)
	if Ask == 1	then
		SetSpeakDetail(Player, "[SC_Z25Q425857_2]")
		AddSpeakOption(Player,Kub, "[SC_Z25Q425857_3]", "LuaPG_425857_Ask_1(2)", 0 )
	elseif Ask == 2	then		--���t��
		CloseSpeak(Player)
		SetFlag(Player, 547503, 1)
		CallPlot(Kub, "LuaPG_425857_Show", Player, Kub,Num)
	end
end

function LuaPG_425857_Show(Player, Kub,Num)
	WriteRoleValue(Kub,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO
	local BUFF = 623999
	AddBuff(Player, BUFF, 0, 20)
	local Flag = 781257
	local New_Kub = DW_CreateObjEX("obj", 121858, Kub)			----�ͦ��t��
	local New_Kerdor =  Lua_DW_CreateObj("flag",121859, Flag, 5)		----�ͦ��t��
	ks_ActSetMode( New_Kub )
	ks_ActSetMode( New_Kerdor )
	Sleep(10)
	PlayMotion(New_Kerdor, ruFUSION_ACTORSTATE_EMOTE_THINK)
	NPCSAY(New_Kerdor, "[SC_Z25Q425857_4]")
	Sleep(25)
	PlayMotion(New_Kerdor, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(New_Kerdor, "[SC_Z25Q425857_5]")
	Sleep(25)
	PlayMotion(New_Kerdor, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(New_Kerdor, "[SC_Z25Q425857_6]")
	Sleep(25)
	SetDefIdleMotion(New_Kub,ruFUSION_MIME_RIDE_IDLE2)
	NPCSAY(New_Kub, "[SC_Z25Q425857_7]")
	Sleep(20)
	DelObj(New_Kub)
	DelObj(New_Kerdor)
	CancelBuff(Player, BUFF)	
	WriteRoleValue(Kub,EM_RoleValue_Register1,0)
end

function LuaPG_425857_Delete()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player, 425857) == false	then
		CancelBuff(Player, 623999)
	end
end