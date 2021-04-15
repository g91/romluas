--�e�U=======================================
--424944  �B�e��q
---------------------------------------------------------------------------
function LuaPG_424944_Give()			--�[�[�ơD�Ψ�
	local Player = OwnerID()
	local NPC = TargetID()								

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424944 )==true	and
		CountBodyItem(Player, 240820)>=5		and
		CheckFlag(Player, 545807)==false		then
	
			AddSpeakOption(Player, NPC , "[SC_424944_GIVE]","LuaPG_424494_Give_01",0)		
	end
end

function LuaPG_424494_Give_01()
	local Player = OwnerID()
	
	DelBodyItem(Player, 240820, 5)
	CloseSpeak(Player)
	SetFlag(Player, 545807, 1)
end

function LuaPG_424944_ReGet()			--�i�̩g
	local Player = OwnerID()
	local NPC = TargetID()								

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424944 )==true	and
		CountBodyItem(Player, 240820)<5		and
		CheckFlag(Player, 545807)==false		then
			SetSpeakDetail(Player, "[SC_424494_REGET]")
			AddSpeakOption(Player, NPC , "[SC_424944_GET]","LuaPG_424494_ReGet_01", 0)		
	end
end

function LuaPG_424494_ReGet_01()
	local Player = OwnerID()
	
	GiveBodyItem(Player, 240820, 5)
	CloseSpeak(Player)	
end




---------------------------------------------------------------------------
--424950  �����U���M��
---------------------------------------------------------------------------
function LuaPG_Talk_Yukin()				--�ת�
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424920 )==true			and
		CheckFlag(Player, 545814)==false				then
			AddSpeakOption(Player, NPC , "[SC_424920_YUKIN]","LuaPG_424920_AskFlag", 0)

	elseif	CheckAcceptQuest(Player, 424921 )==true			and
		CheckFlag(Player, 545815)==false				then		
			AddSpeakOption(Player, NPC , "[SC_424921_04]","LuaPG_424921_Understand_00", 0)

	elseif	CheckAcceptQuest(Player, 424922 )==true			and
		CheckFlag(Player, 545819)==true				and
		CheckFlag(Player, 545818)==false				then		
			AddSpeakOption(Player, NPC , "[SC_424922_01]","LuaPG_424922_Tell", 0)

	elseif	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545808)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)

	elseif	CheckAcceptQuest(Player, 424951 )==true			and
		CheckFlag(Player, 545817)==false				then
			AddSpeakOption(Player, NPC , "[SC_424951_RECOMMEND]","LuaPG_424951_Recommend", 0)

	elseif	CheckAcceptQuest(Player, 424954 )==true			and
		CheckFlag(Player, 545861)==false				then
			AddSpeakOption(Player, NPC , "[SC_424954_TELL]","LuaPG_424954_Tell", 0)
	elseif	CheckAcceptQuest(Player, 424930 )==true			and
		CheckFlag(Player, 545866)==false				then
			AddSpeakOption(Player, NPC , "[SC_424930_TELL]","LuaPG_424930_Tell", 0)
	end		
end

function LuaPG_Talk_Behel()				--������
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545809)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)
	end		
end

function LuaPG_Talk_Bil()				--�Ѩ�A
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545810)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)

	elseif	CheckAcceptQuest(Player, 424927 )==true			and
		CountBodyItem(Player, 240848)>=10				and
		CheckFlag(Player, 545821)==false				then
			SetSpeakDetail(Player, "[SC_424927_03]")
			AddSpeakOption(Player, NPC, "[SC_424927_04]", "LuaPG_424927_Collect", 0)

	elseif	CheckAcceptQuest(Player, 424953 )==true			and
		CheckFlag(Player, 545860)==false				then
			AddSpeakOption(Player, NPC, "[SC_424953_ASK]", "LuaPG_424953_Medicine", 0)

	elseif	CheckAcceptQuest(Player, 424928 )==true			and
		CountBodyItem(Player, 240852)<5				then
			AddSpeakOption(Player, NPC , "[SC_424928_ASK]","LuaPG_424928_ReTake", 0)
	end		

end

function LuaPG_Talk_Tock()				--��J
	local Player = OwnerID()
	local NPC = TargetID()
	LuaS_ZONE21_Formula()
	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545811)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)
	end		
end

function LuaPG_Talk_Hua()				--�س���
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424950 )==true			and
		CheckFlag(Player, 545812)==false				then
			AddSpeakOption(Player, NPC , "[SC_424950_ASK]","LuaPG_424950_Talk", 0)
	end		
end

function LuaPG_424950_Talk()
	local Player = OwnerID()
	local NPC = TargetID()

	local OrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )--���󪺸�Ʈw�s��
	local NPCList = {}
	NPCList[119727] = {"[SC_424950_TALK_01]"; 545808}	--�ת�
	NPCList[119726] = {"[SC_424950_TALK_02]"; 545809}	--������
	NPCList[119360] = {"[SC_424950_TALK_03]"; 545810}	--�Ѩ�A
	NPCList[119725] = {"[SC_424950_TALK_04]"; 545811}	--��J
	NPCList[119616] = {"[SC_424950_TALK_05]"; 545812}	--�س���
	
	SetSpeakDetail(Player, NPCList[OrgID][1])
	SetFlag(Player, NPCList[OrgID][2], 1)
end





--��u=======================================
--424951  �Q�����^�����H
---------------------------------------------------------------------------
function LuaPG_424951_Recommend()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424951_REJECT]")
	SetFlag(Player, 545817, 1)	
end

--424951  ���ȵ�����t
---------------------------------------------------------------------------
--�t���G�ĭC�_119783
--����X�l�G781045	no.1
--�����a������BUFF�G621125
function LuaPG_424951_Complete()
	local Player = TargetID()
	local Saye = OwnerID()
	local Flag = 781045

	Lua_ZonePE_3th_GetScore(70)
	local New_Saye = DW_CreateObjEX("obj", 119783, Saye)		----�ͦ��t���ĭC�_
	ks_ActSetMode( New_Saye )

	local Num = ReadRoleValue(New_Saye,EM_RoleValue_Register1)
	AddBuff( Player,621125,1,20)
	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		CallPlot(Saye , "LuaPG_424951_Complete_01" , New_Saye , Saye, Player, Flag)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424951_Complete_01(New_Saye , Saye, Player, Flag)
	WriteRoleValue(Saye,EM_RoleValue_Register1,999) 		----�}�l�t�X���аO

	Sleep(10)
	PlayMotion(New_Saye, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSAY(New_Saye, "[SC_424951_ANGRY]")
	Sleep(25)
	NPCSAY(New_Saye, "[SC_424951_ANGRY_01]")
	Sleep(10)	
	DW_MoveToFlag( New_Saye , Flag, 1, 0, 1)
	DelObj(New_Saye)

	CancelBuff(Player, 621125)	
	WriteRoleValue(Saye,EM_RoleValue_Register1,999) 		----�g�^�Ȧs��
end



---------------------------------------------------------------------------
--424953  �ĭC�_���⮩
---------------------------------------------------------------------------
----�p�G�������ȡABUFF�N����
function LuaPG_424953_Cancel_Buff()
	if	CheckAcceptQuest(OwnerID(),424953)==false	then
		CancelBuff(OwnerID(),621126)
	end
end

function LuaPG_424953_Buff()
	local Player = TargetID()
	local NPC = OwnerID()
	if CheckAcceptQuest(Player,424953)==true	then
		AddBuff(Player, 621126, 1, 600)			----��BUFF
		ScriptMessage( Player, Player, 1,"[SC_424953_HURRY]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_424953_HURRY]", "0xffbf0b2b" )
									----SCRIPM���ܮɶ�����
	end
end

function LuaPG_424953_Medicine()
	local Player = OwnerID()
	local NPC = TargetID()
	if CountBodyItem(Player, 240849)==0 and CountBodyItem(Player, 240850)==0	then
		SetSpeakDetail(Player, "[SC_424953_ASK_01]")
		AddSpeakOption(Player, NPC, "[SC_424953_TAKE_RIGHT]", "LuaPG_424953_Medicine_01(1)", 0)
		AddSpeakOption(Player, NPC, "[SC_424953_TAKE_WRONG]", "LuaPG_424953_Medicine_01(2)", 0)
	else
		SetSpeakDetail(Player, "[SC_424953_ASK_02]")
	end
end

function LuaPG_424953_Medicine_01(MedicineType)
	local Player = OwnerID()

	if MedicineType==1	then
--		Say(Player,"00")
		GiveBodyItem(Player, 240849, 1)
	elseif MedicineType==2	then
--		Say(Player,"22")
		GiveBodyItem(Player, 240850, 1)		
	end
	CloseSpeak(Player)
end

function LuaPG_424953_Cure()
	local Player = OwnerID()
--	LoadQuestOption(Player)

	if CheckAcceptQuest(Player, 424953)==true	and
	CheckFlag(Player, 545860)==false		then
		--Say(Player,"33")
		if CheckBuff( Player , 621126)==true		then
			if CountBodyItem(Player, 240849)==1			then
				LoadQuestOption(Player)
				--Say(Player,"44")
				SetFlag(Player, 545860, 1)
				DelBodyItem(Player, 240849, 1)
			elseif CountBodyItem(Player, 240850)==1		then
				--Say(Player,"55")
				SetSpeakDetail(Player, "[SC_424953_NOUSE]")
				Sleep(10)
				DelBodyItem(Player, 240850, 1)
--				ScriptMessage( Player, Player, 1,"[SC_424953_NOUSE_02]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424953_NOUSE_02]", "0xffbf0b2b" )
			end
		elseif 	CheckBuff( Player , 621126)==false	then
				--Say(Player,"66")
				LoadQuestOption(Player)
				ScriptMessage( Player, Player, 1,"[SC_424953_TOOLATE]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424953_TOOLATE]", "0xffbf0b2b" )
		end
	else
		--Say(Player,"77")
		LoadQuestOption(Player)
	end
end



---------------------------------------------------------------------------
--424954  �̪쪺�p�N
---------------------------------------------------------------------------
function LuaPG_424954_Tell()
	local Player = OwnerID()
	CloseSpeak(Player)
	SetFlag(Player, 545861, 1)
end



---------------------------------------------------------------------------
--424955  �̫᪺����
---------------------------------------------------------------------------
function LuaPG_424955_Ask()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424955 )==true			and
		CheckFlag(Player, 545869)==false				then
			AddSpeakOption(Player, NPC , "[SC_424955_01]","LuaPG_424955_Ask_01", 0)
	end
end

function LuaPG_424955_Ask_01()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424955_02]")
	AddSpeakOption(Player, NPC , "[SC_424955_03]","LuaPG_424955_Ask_02", 0)
end

function LuaPG_424955_Ask_02()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424955_04]")
	AddSpeakOption(Player, NPC , "[SC_424955_05]","LuaPG_424955_Ask_03", 0)
end

function LuaPG_424955_Ask_03()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424955_06]")
	SetFlag(Player, 545869, 1)
end




--=======================================
--424956  ��s�����ѻ�
---------------------------------------------------------------------------
function LuaPG_Talk_Stein()
	local Player = OwnerID()
	local NPC = TargetID()

	if	CheckAcceptQuest(Player, 424956 )==true			and
		CheckFlag(Player, 545879)==false				then
			SetSpeakDetail(Player, "[SC_424956_TELL_01]")
			AddSpeakOption(Player, NPC , "[SC_424956_TELL_02]","LuaPG_Talk_Stein_01", 0)
	else	
		LoadQuestOption(Player)
	end		

	if	(CheckAcceptQuest(Player, 424957 )==true or CheckAcceptQuest(Player, 424938) == true)	and
		CountBodyItem(Player, 240859)==0							and
		(CountBodyItem(Player, 240860)<1 or CountBodyItem(Player, 240861)<1 or  CountBodyItem(Player, 240862)<1) then
			AddSpeakOption(Player, NPC , "[SC_424957_TELL_01]","LuaPG_424957_Paper", 0)
	end
end

function LuaPG_Talk_Stein_01()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424956_TELL_03]")
	AddSpeakOption(Player, NPC , "[SC_424956_TELL_04]","LuaPG_Talk_Stein_02", 0)		
end

function LuaPG_Talk_Stein_02()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424956_TELL_05]")
	AddSpeakOption(Player, NPC , "[SC_424956_TELL_06]","LuaPG_Talk_Stein_03", 0)		
end

function LuaPG_Talk_Stein_03()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545879, 1)		
end





--=======================================
--424957  ø�s�c�y��
--------------------------------------------------------------------------
function LuaPG_424957_Check()		----ø�ϽT�{��H
	local Player = OwnerID()
	local NPC = TargetID()
	local PatientList = {}
	PatientList[106426]=240862
	PatientList[106453]=240861
	PatientList[106452]=240860	
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)

	for key,value in pairs(PatientList) do
		if (CheckAcceptQuest(Player, 424957) == true or CheckAcceptQuest(Player, 424938) == true) and
		key==OrgID and
		CountBodyItem(Player, value)==0 then
			return true						
		elseif key==OrgID and
		CountBodyItem(Player, value)==1  then
			ScriptMessage( Player , Player , 1 , "[SC_424957_01]" , 0 ) 	----�A�w�g�e�L�o�x�����F
			ScriptMessage( Player , Player , 0 , "[SC_424957_01]" , 0 )
			return false	
		end
	end

	if OrgID~=106426 or OrgID~=106453 or OrgID~=106452 then
		ScriptMessage( Player , Player , 1 , "[SC_424957_02]" , 0 ) 	----�й�ۥ��T������ø��
		ScriptMessage( Player , Player , 0 , "[SC_424957_02]" , 0 )
		return false			
	end

	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_424957_03]" , 0 ) 		----�԰����L�kø��
		ScriptMessage( Player , Player , 0 , "[SC_424957_03]" , 0 )
		return false
	end

	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_424957_04]" , 0 ) 	----�A�L�k�b�M����ø��
			ScriptMessage( Player , Player , 0 , "[SC_424957_04]" , 0 )
			return false
		end
	end
end

function LuaPG_424957_Use()
	local Player = OwnerID()
	local NPC = TargetID()

	local PatientList = {}
	PatientList[106426]=240862
	PatientList[106453]=240861
	PatientList[106452]=240860	
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	
	DelBodyItem(Player, 240859, 1)
	GiveBodyItem(Player, PatientList[OrgID], 1)	
end

function LuaPG_424957_Paper()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	repeat 
	GiveBodyitem( Player, 240859, 1 )
	until 
	CountBodyItem( Player, 240859 )==3
end




--PE�u=======================================
--424607  ����H��������
---------------------------------------------------------------------------
function LuaPG_424607_Document()
	local Player = OwnerID()
	local NPC = TargetID()
	local AgentList = {}
	AgentList[119914] = {240853, "[SC_424607_AGENT_01]"}
	AgentList[119915] = {240854, "[SC_424607_AGENT_02]"}
	AgentList[119916] = {240855, "[SC_424607_AGENT_03]"}

	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)

	if CheckAcceptQuest(Player, 424607)==true	then
		if CountBodyItem(Player, AgentList[OrgID][1])<1	then
			SetSpeakDetail(Player, AgentList[OrgID][2])
			GiveBodyItem(Player, AgentList[OrgID][1], 1)
		elseif CountBodyItem(Player, AgentList[OrgID][1])>0 then
			LoadQuestOption(Player)
			ScriptMessage( Player, Player, 1,"[SC_424607_AGENT_04]", "0xffbf0b2b" )
			ScriptMessage( Player, Player, 0,"[SC_424607_AGENT_04]", "0xffbf0b2b" )
		end
	else
		LoadQuestOption(Player)
	end
end



--=======================================
--424609  ��q�˴�
---------------------------------------------------------------------------
function LuaPG_424609_Machine()		--���b�˴������W�����X�ͼ@��
	local Machine = OwnerID()
	local RoomID = ReadRoleValue(Machine, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Machine, EM_RoleValue_X )
	local Y = ReadRoleValue( Machine, EM_RoleValue_Y )
	local Z = ReadRoleValue( Machine, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Machine, EM_RoleValue_Dir )	--�|��
	local radian = (math.pi/180)*Dir
	
	local MaList = {}
	
	MaList[1] = CreateObj( 119919, X+30*math.cos(radian), Y, Z +20*math.sin(radian), Dir, 1 )	--���q
	MaList[2] = CreateObj( 119920, X-30*math.cos(radian), Y, Z +20*math.sin(radian), Dir, 1 )	--���

	for i =1,2 do	
		AddToPartition(MaList[i], RoomID )
		WriteRoleValue(Machine,(EM_RoleValue_Register-1)+i, MaList[i])
		--���ͤ@�Ӵ��q�M�@�Ӥ���A�ñN���O�bmachine�W
		SetModeEx( MaList[i]  ,EM_SetModeType_Mark , false ) 	--�аO
		SetModeEx( MaList[i]  ,EM_SetModeType_Move , false ) 	--����
	end
	SetPlot( Machine, "touch", "LuaPG_424609_Use_Machine", 10 )	--�����@��
--	SetPlot( MaList[2], "range", "LuaPG_424609_BlockCanSee", 100 )	--����@��
end

function LuaPG_424609_Use_Machine()		--���b�˴������W����Ĳ�I�@��
	local Player = OwnerID()
	local Machine = TargetID()
	local Num01=ReadRoleValue(Machine, EM_RoleValue_Register3)

	DW_CancelTypeBuff(68,Player)						----�����M�����A
	if CheckAcceptQuest(Player, 424609)==true	and			--�p�G����ŦX
	CheckFlag(Player, 545867)==false		then
		if Num01 == 0					then		--�p�G�S�H�λ���
			if 	BeginCastBarEvent( Player, Machine ,"[SC_424609_USE]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424609_Lighting" ) ~= 1 then
										----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player, Player, 1,"[SC_424609_USE_01]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424609_USE_01]", "0xffbf0b2b" )
--			else						--�]���G�ާ@����
--				CallPlot(Machine, "LuaPG_424609_Lighting", Player, CheckStatus)
			end
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_119918_DONOTTOUCH]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_119918_DONOTTOUCH]", "0xffbf0b2b" )
	end
end

function LuaPG_424609_Lighting(Player, CheckStatus)		--�{�q��buff�b���q�M�����
	local Machine = TargetID()
--	Say(Player, CheckStatus)
	EndCastBar( Player, CheckStatus)

	if (CheckStatus ~= 0) then
		if (CheckStatus>0) then
			CallPlot(Machine, "LuaPG_424609_Lighting_02", Machine,Player)	--Ĳ�o�@���A�i�H�ݨ��{�q��buff�b���q�M�����
		else
			EndCastBar( Player, CheckStatus)
		end
	end
end

function LuaPG_424609_Lighting_02(Machine,Player)			--�{�q��buff�b���q�M�����
	WriteRoleValue(Machine , EM_RoleValue_Register3 , 999)
--	Say(Machine, "33")	
	local Rock = ReadRoleValue(Machine, EM_RoleValue_Register1)
	local Block = ReadRoleValue(Machine, EM_RoleValue_Register2)
	Sleep(10)
--	Say(Rock,"11")
--	Say(Block,"22")
	CastSpell( Rock, Block , 498519 )
	Sleep(70)
	ScriptMessage( Player, Player, 1,"[SC_424609_BROKEN]", "0xffbf0b2b" )
	ScriptMessage( Player, Player, 0,"[SC_424609_BROKEN]", "0xffbf0b2b" )

--	CancelBuff(Player, 621145)
	SetFlag(Player,545867,1)
	WriteRoleValue(Machine , EM_RoleValue_Register3,0)	
end

function LuaPG_424609_Del_Flag()
	local Player = TargetID()

	Lua_ZonePE_3th_GetScore(350)
	SetFlag(Player,545868,0)
end

function LuaPG_424608_TrustFlag()
	local Player = TargetID()

	Lua_ZonePE_3th_GetScore(50)
	SetFlag(Player,545868,1)
end


--=======================================
--424932  �s������
---------------------------------------------------------------------------
--���b106470�W��Ĳ�I�@��
function LuaPG_106470_Touch_00()
	SetCursorType( OwnerID(), eCursor_Interact )
	SetPlot( OwnerID(),"touch","LuaPG_106470_Touch",35 )
end

function LuaPG_106470_Touch()
	local Player = OwnerID()
	local Machine_106470 = TargetID()
	local Num=ReadRoleValue(Machine_106470, EM_RoleValue_Register1)

	if CheckAcceptQuest(Player, 424932)==true	and			--�p�G����ŦX
	CountBodyItem(Player, 240857)<5		then
		if Num == 0					then		--�p�G�S�H�λ���
			if BeginCastBarEvent( Player, Machine_106470 ,"[SC_424932_01]", 30, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424932_Take" ) ~= 1 then
										----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player, Player, 1,"[SC_424932_TAKE]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424932_TAKE]", "0xffbf0b2b" )						
			end
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_424932_02]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_424932_02]", "0xffbf0b2b" )			
	end
end

function LuaPG_424932_Take(Player, CheckStatus)
	local Player = OwnerID()
	local Machine_106470 = TargetID()
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			GiveBodyItem(Player, 240857, 1)
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end


