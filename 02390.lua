---------------------------------------------------------------------------
--424260  �A�Ф@�����䧽
---------------------------------------------------------------------------
function LuaPG_424260_Give_Buff()
	local Player = TargetID()
	if	CheckAcceptQuest(Player,424260)==true	and
		CheckCompleteQuest(Player,424260)==false	then
		if	CheckBuff( Player , 509922)==false			then	----�����ȫᵹ�@��buff�]509922�^
			AddBuff( Player,509922,1,480)
--			AddBuff( Player,620376,1,480)
--			CastSpell(OwnerID(),Player,497196)
			sleep(20)
			ScriptMessage( Player, Player, 1,"[SC_423836_2]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_423836_2]", 0 )
										----(���ɥ��ȡA�w�}�l�˼ƭp��)
		elseif	CheckBuff( Player , 509922)==true			then
			CancelBuff(Player,509922)
			CancelBuff( Player,620376)
			AddBuff( Player,509922,1,480)
			AddBuff( Player,620376,1,480)
			sleep(20)
			ScriptMessage( Player, Player, 1,"[SC_423836_2]", 0 )	
			ScriptMessage( Player, Player, 0,"[SC_423836_2]", 0 )
		end
	end
end

function LuaPG_424260_Time_Limitation()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424260)==true		and
		CheckCompleteQuest(OwnerID(),424260)==false	then	----�p�G�����ȥB�|������
		if	CheckBuff(OwnerID() , 509922)==true		and	----�P�_buff
			CountBodyItem(OwnerID(),240224)>=8	then	----�P�_���~
			SetFlag(OwnerID(), 545129, 1)
		elseif	CheckBuff(OwnerID() , 509922)==false		then
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_424260_TIME_LIMITATION]", 0 )	
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_424260_TIME_LIMITATION]", 0 )
										----�A�S���b�ɶ����a��Ĺ�o�䧽�Ӧ����F��A�Щ����ȭ����C
		end
	end
end

function LuaPG_424260_Complete()
--	SAY(OwnerID(),"00")
	local General=OwnerID()
	local Player=TargetID()
	if	CheckBuff(Player,509922)==true	then			----�p�G���W��buff�A�h����
		CancelBuff(Player,509922)	
	end

	local Num = ReadRoleValue(General,EM_RoleValue_Register1)
	AddBuff( Player,620700,1,12)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(General , "LuaPG_424260_Complete_02" , General,Player)
	end
end

function LuaPG_424260_Complete_02(General,Player)
	local King=Lua_DW_CreateObj("flag",118521,780961,1)
	local New_General=DW_CreateObjEX("obj",118523,General)
	local Soldier=Lua_DW_CreateObj("flag",118522,780961,2)
	WriteRoleValue(General,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO----���ͺt���λ�D

	local NeedChange = {King,New_General,Soldier}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )	
	end
	
	SetModeEx( New_General , EM_SetModeType_HideName, true)	----�W��
--	Hide(King)
--	Show(King,0)
	DW_MoveDirectToFlag( King , 780961,3,0 ,1) 				----�t���λ�D���L��(�X�l�G780961)NO3
	WriteRoleValue(Soldier  ,EM_RoleValue_IsWalk , 0 ) 
	DW_MoveToFlag( Soldier , 780961,4,0 ,1) 				----�t���ΫO�çL���L��NO4

	Sleep(10)
	PlayMotion(General,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Say(New_General,"[SC_424260_GENERAL]")
	Sleep(20)

	local NeedDelNPC={King,Soldier,New_General}
	for index,value in pairs(NeedDelNPC) do
		DelObj(value)
	end
	
	CancelBuff(Player,620700)
--	SetFlag(Player,545130,1)
	WriteRoleValue(General,EM_RoleValue_Register1,0) 
end

----�p�G�������ȡA�N����
function LuaPG_424260_Cancel_Buff()
--	Say(OwnerID(),"00")
	if	CheckAcceptQuest(OwnerID(),424260)==false	then
		CancelBuff(OwnerID(),509922)
	end
end

---------------------------------------------------------------------------
--424262 �����e�O 
---------------------------------------------------------------------------
function LuaPG_424262_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424262)==true		and
		CheckFlag(OwnerID(),545123)==false			and
		CountBodyItem(OwnerID(),240223)>0			then
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424262_PROVE]","LuaPG_424262_02",0)
	end
	if	CheckAcceptQuest(OwnerID(),424326)==true		and
		CheckFlag(OwnerID(),545162)==false			then
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_11]","LuaS_424326_MSG_1",0);
	end
	if	CheckAcceptQuest(OwnerID(),424332)==true	then
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424332_1]","Lua_AG424332_1",0);
	end
end

function LuaPG_424262_02()
	LoadQuestOption(OwnerID())
	DelBodyItem(OwnerID(),240223,1)
	SetFlag(OwnerID(), 545123,1)
end

function LuaS_424326_MSG_1()
	local npcs=ReadRoleValue(TargetID(),EM_RoleValue_Register10)
	local plays=ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
	CloseSpeak(OwnerID());
		if	plays~=0	then
			Tell(OwnerID(),TargetID(),"[SC_424326_3]".."[SC_424326_"..(plays-1).."]");
			return
		end
	Tell(OwnerID(),TargetID(),"[SC_424326_"..npcs.."]");
	WriteRoleValue(OwnerID(),EM_RoleValue_Register10,npcs+1)
		if	npcs==0	then
			WriteRoleValue(TargetID(),EM_RoleValue_Register10,1)
		elseif	npcs==1	then
			WriteRoleValue(TargetID(),EM_RoleValue_Register10,2)
		else
			WriteRoleValue(TargetID(),EM_RoleValue_Register10,0)
		end
end
---------------------------------------------------------------------------
--424261 �W�H��򺸤��W
---------------------------------------------------------------------------
--BUFF(509960)
--�t���G��򺸡]118538�^�B�N�x�]118539�^
--flag�G������ҡ]545143�^
--����X�l�G780961�]�qno5�}�l�^

function LuaPG_424261_Show()
	local Num = ReadRoleValue(TargetID(),EM_RoleValue_Register1)
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( OwnerID(), 424261 ) == true	 and
		CheckFlag(OwnerID(),545143)==false			and
		Num > 0 					then 			----�ˬd���a�O�_������ �åB�{�b�O�_���b�t��
		SetSpeakDetail( OwnerID(), "[SC_424261_SAY_WAIT]" )			----(���b�t�����p�U �����i��)
	elseif	CheckAcceptQuest( OwnerID(), 424261 ) == true 	and
		CheckFlag(OwnerID(),545143)==false			and
		Num == 0					then			----�p�G�Ȧs�Ȭ�0
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424261_SAY_OK]","LuaPG_424261_Show_02",0)
											----���t��function	
	end
end

function LuaPG_424261_Show_02()
	local Player = OwnerID()
	local King = TargetID()
	CloseSpeak( Player )								----������ܵ���
	local General = LuaFunc_SearchNPCbyOrgID( King, 118469, 200)

	WriteRoleValue( King, EM_RoleValue_Register1, 999 )				----�W�� ��ܥ��b�t��	
	CallPlot(King , "LuaPG_424261_Show_03" , Player,King,General)	
end

function LuaPG_424261_Show_03(Player,King,General)			
	while true do									--�`�N �o�O�j��
		local QuestID = 424261						--���Ƚs��
		local FinishFlagID = 545143						--����������o���X��
		local CheckBuffID = 509960						--�ˬd�O�_���b�t����BUFF
		local CheckRange = 100						--�t�����ˬd�d��
		local DoScript = "LuaPG_424261_Show_break"				--�t�������n������


		CallPlot( King, "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )	
											--�d������Ϊ��ˬd�禡

	--�t����	
		local New_King = DW_CreateObjEX("obj",118538,King)			----�ͦ��t�����
		local New_General = DW_CreateObjEX("obj",118539,General)		----�ͦ��t���N�x

		local NeedChange = {New_King,New_General}
		for index,value in pairs(NeedChange) do
			ks_ActSetMode( value )	
		end

		Sleep(10)
		AdjustFaceDir(New_King, New_General, 0 )
		Say(New_King,"[SC_424261_SAY_01]")					----�N�x�A�ڪ��D���[�H�ӡA�A�@���{���ڤ񤣤W����		
		Sleep(20)
	
		PlayMotion(New_King,ruFUSION_ACTORSTATE_emote_point)		----��򺸷n�Y
		Say(New_King,"[SC_424261_SAY_02]")					----�ڰ����ƧA�`�{���ӹL�Įz�ӬƤ֤��......	
		Sleep(30)	
	
		PlayMotion(New_King,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	----���ܰʧ@
		Say(New_King,"[SC_424261_SAY_03]")					----�ר�{�b�o�ر��p.....
		Sleep(25)

		Say(New_King,"[SC_424261_SAY_04]")					----���ѡA�ڽ�W���u�M�ۤv�����ӡA�V�A�D�ԡI
		PlayMotion(New_King,ruFUSION_ACTORSTATE_emote_point)		----��򺸮��۩��Y���۱N�x
		Sleep(25)

		Say(New_General,"[SC_424261_SAY_05]")				----��I�A���N��O�n�������D�ԧڡH
		PlayMotion(New_General,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	----�N�x�ͮ�
		Sleep(20)

		PlayMotion(New_King,ruFUSION_ACTORSTATE_emote_head_shake)
		Say(New_King,"[SC_424261_SAY_06]")					----���I�\����W�������N��ۯ���������......
		PlayMotion(New_King,ruFUSION_ACTORSTATE_emote_point)		----��򺸮��۩��Y���۱N�x
		Sleep(25)	

		WriteRoleValue(New_King  ,EM_RoleValue_IsWalk , 0 )
		DW_MoveToFlag( New_King , 780961,5,0 ,1)   				----���ʨ�X�l���Z��

		for	i=1,4	do
		PlayMotion( New_King , ruFUSION_ACTORSTATE_ATTACK_1H )		----��򺸾԰�
--		CastSpell( New_King, New_General, 497196 )
		Sleep(5)
		PlayMotion( New_General , ruFUSION_ACTORSTATE_ATTACK_1H )	----�N�x�԰�
--		CastSpell( New_General, New_King, 497196 )
		Sleep(5)
		PlayMotion( New_General , ruFUSION_ACTORSTATE_ATTACK_2H  )
--		CastSpell( New_General, New_King, 497196 )
		Sleep(5)
		PlayMotion( New_King , ruFUSION_ACTORSTATE_ATTACK_2H )
		Sleep(10)
		end

		Sleep(10)
		Say(New_General,"[SC_101352_13]")					----��I
		PlayMotion( New_King , ruFUSION_ACTORSTATE_NORMAL )		----��򺸰���԰�
		PlayMotion( New_General , ruFUSION_ACTORSTATE_NORMAL )	----�N�x����԰�

		PlayMotionEX( New_General, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
											----�N�x���b�a�W
		Sleep(10)
		DW_MoveToFlag( New_King , 780961,3,0 ,1) 				----��򺸩��ᨫ
		AdjustFaceDir(New_King, New_General, 0 )				----��򺸭���N�x
		Sleep(10)
		Say(New_General,"[SC_424261_SAY_07]")				----�N�x�G�����A�u�Q�����......
		Sleep(20)

		CallPlot( King, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
											--���t���F ���t����m��NPC �����ѻP���������a ���n�X��(keyitem)
		break									--�b�̫᭱�O�o�[break���_
	end
end

function LuaPG_424261_Show_break()							----�o�q�����_/�����ɭn�@���Ʊ�(�ݭn���禡���U�P�_)
--	Say(OwnerID(),"00")								----���B�����

	local New_General = LuaFunc_SearchNPCbyOrgID( OwnerID(), 118538, 300, 0 )	----�j�M����ѥ[��NPC�t��
	local New_King = LuaFunc_SearchNPCbyOrgID( OwnerID(), 118539, 300, 0 )
	
	if New_General ~= nil then delobj(New_General) end				----�p�G�s�b �h�R��
	if New_King ~= nil then delobj(New_King) end
	ks_resetObj( OwnerID(), nil )							----�D�`���n �R�������t���@����NPC �@���m
end



---------------------------------------------------------------------------
--424263 Ī�d���s�M��
---------------------------------------------------------------------------
--FLAG�G545155
function LuaPG_424263_Give_Meat()
	local Player=OwnerID()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( Player, 424263 ) == true	and
		CountBodyItem(Player,240245)==10		then
		AddSpeakOption(Player, TargetID(),"[SC_424263_GIVE_MEET]","LuaPG_424263_Give_Meat_02",0)
	end
end

function LuaPG_424263_Give_Meat_02()
	LoadQuestOption(OwnerID())
	DelBodyItem(OwnerID(),240245, 10)
	SetFlag(OwnerID(),545155,1)
end

function LuaPG_424263_Give_Meat_03()
	local Player=OwnerID()
	if	CheckAcceptQuest( Player, 424263 ) == true	and
		CountBodyItem(Player,240245)<10		then
		SetSpeakDetail(OwnerID(),"[SC_424263_GIVE_MEET_02]")
		AddSpeakOption(Player, TargetID(),"[SC_424263_GIVE_MEET_03]","LuaPG_424263_Give_Meat_04",0)	
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaPG_424263_Give_Meat_04()
	CloseSpeak(OwnerID())
	repeat
	GiveBodyitem( OwnerID(), 240245, 1 )
	until CountBodyItem( OwnerID(), 240245 )==10
end

--function LuaPG_424263_Eat_Meat()
--	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424263_EAT_MEAT]", 0 ) 			 ----���Y��
--	DELOBJ(TargetID())
--end

---------------------------------------------------------------------------
--�ǰe��
---------------------------------------------------------------------------
function LuaPG_Z20_TO_Z211_0()
	SetPlot( OwnerID() , "range" , "LuaPG_Z20_TO_Z211_1" , 60 )
end

function LuaPG_Z20_TO_Z211_1()
	ChangeZone( OwnerID() , 80 , 0 , 3022 , 1130 , 4268 , 90 )
end

function LuaPG_Z211_TO_Z20_0()
	SetPlot( OwnerID() , "range" , "LuaPG_Z211_TO_Z20_1" , 50 )
end

function LuaPG_Z211_TO_Z20_1()
	ChangeZone( OwnerID() , 20 , 0 , -17115.9 , 401.6 , 43146 , 40 )
end