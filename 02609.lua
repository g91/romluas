--z23��u�BPE�B�e�U=======================================
--=======================================
--424958  ���Ѵ���
---------------------------------------------------------------------------
--FLAG:546242
--���~�G240894
function LuaPG_424958_Ask()		--�M�ݥǤH	
	local Player = OwnerID()
	local Prisoner = TargetID()
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local PrisonerList = {120520, 120522, 120562}			--�ǤH�C��
--	local QuestNum= table.getn(QuestList)
	LoadQuestOption(Player)

--�p�G�������ȡA�Ĥ@������åǻ��ܫ�~�}�l�O�U�����ǤH
--	for i=1,QuestNum do
		if DW_CheckQuestAccept("or",Player,424958,425460,425446)==true	then
			if Num== 0	then				--���W�S�����ǤH
				local RanNum = Rand(3)+1		--�H���Ʀr�A�M�w�����ǤH
				WriteRoleValue(Player, EM_RoleValue_Register2, PrisonerList[RanNum])
									--�N���ǤH��orgid�O�b���a���WEM_RoleValue_Register2
--				LuaPG_424958_CheckNum()
			end
			AddSpeakOption(Player, Prisoner, "[SC_424958_ASK_01]", "LuaPG_424958_Ask_02", 0)
		end
--		break
--	end		
end

function LuaPG_424958_Ask_02()
	local Player = OwnerID()
	local Prisoner = TargetID()
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local OrgID = ReadRoleValue( Prisoner, EM_RoleValue_OrgID )	--���󪺸�Ʈw�s��
	
	if DW_CheckQuestAccept("or",Player,424958,425460,425446)==true	and
	OrgID == Num							then	--��Ӫ��a���ȩM���Ǫ���
		if CheckFlag(Player, 545814)==false	and
		CountBodyItem( Player, 240894 )==0	then

			SetSpeakDetail(Player, "[SC_424958_PRISONER01]")	
			AddSpeakOption(Player, Prisoner, "[SC_424958_ASK_01]", "LuaPG_424958_Ask_03", 0)

		elseif CheckFlag(Player, 545814)==true	or
		CountBodyItem( Player, 240894 )==1	then

			SetSpeakDetail(Player, "[SC_424958_PRISONER03]")

		end
	else
		SetSpeakDetail(Player, "[SC_424958_INNOCENT]")
	end
end

function LuaPG_424958_Ask_03()
	local Player = OwnerID()
	local Prisoner = TargetID()

	SetSpeakDetail(Player, "[SC_424958_PRISONER02]")
	GiveBodyItem(Player, 240894, 1)
end

function LuaPG_424958_Give()		--�N�F�赹�w��
	local Player = OwnerID()
	local Anti = TargetID()

	LoadQuestOption(Player)

	if DW_CheckQuestAccept("or",Player,424958,425460,425446)==true	and
	CheckFlag(Player, 546242)==false					and
	CountBodyItem(Player, 240894)==1					then
		AddSpeakOption(Player, Anti, "[SC_424958_GIVE]", "LuaPG_424958_Give_02", 0)
	end
end

function LuaPG_424958_Give_02()
	local Player = OwnerID()

	SetFlag(Player, 546242, 1)
	DelBodyItem(Player, 240894, 1)
	CloseSpeak(Player)	
end

function LuaPG_424958_Complete()
	Lua_ZonePE_3th_GetScore(250)
	local Player = TargetID()
	WriteRoleValue(Player, EM_RoleValue_Register2, 0)
	CancelBuff(Player, 622522)
--	LuaPG_424958_CheckNum()
end

function LuaPG_424958_CheckNum()
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	Say(OwnerID(), Num)	
end

function LuaPG_424958_CheckQuest()
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local Player = OwnerID()
	
	if DW_CheckQuestAccept("or",Player,424958,425460,425446)==true	then
		return true
	else
		CancelBuff(Player, 622522)
		WriteRoleValue(Player, EM_RoleValue_Register2, 0)
	end
end

function LuaPG_424958_Accept()
	local Player = TargetID()
	AddBuff( Player, 622522, 1, -1)
end




--=======================================
--425248  �P�v��̪�����
---------------------------------------------------------------------------
function LuaPG_425248_Cancel_Buff()		--�p�G�������ȡAbuff�N����
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,425248,425480,425494)==true	then
		return true
	else
		CancelBuff(Player,622182)
	end
end

function LuaPG_425248_Give_Buff()		--�����ȫᵹ�ӭp��ɶ���buff
	local Player = TargetID()
	
	AddBuff( Player, 622182, 1, 600)
	Sleep(10)
	ScriptMessage( Player, Player, 1,"[SC_423836_2]", 0 )	
	ScriptMessage( Player, Player, 0,"[SC_423836_2]", 0 )		----(���ɥ��ȡA�w�}�l�˼ƭp��)
end

function LuaPG_425248_Compete()		--�ӭt�P�_
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425248,425480,425494)==true		and
	CheckBuff(Player, 622182)==true						then
		if CountBodyItem(Player, 241193)>=10			and
		CheckFlag(Player, 546243)==false				then
			SetFlag(Player, 546243, 1)
			CancelBuff(Player, 622182)
		end
	elseif DW_CheckQuestAccept("or",Player,425248,425480,425494)==true	and
	CheckFlag(Player, 546243)==false					and
	CheckBuff(Player, 622182)==false					then
		ScriptMessage( Player, Player, 1,"[SC_425248_LOSE]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_425248_LOSE]", 0 )		
	end
end




--=======================================
--425237  �����P��
---------------------------------------------------------------------------
function LuaPG_425237_Click()
	local Player = OwnerID()
	local NPC = TargetID()

	if DW_CheckQuestAccept("or",Player,425237,425464,425450)==true	then
		DW_QietKillOne(0,106733)		 ----�R�R�������ǡA�e�̱�����̡A0�N�����a
		Sleep(5)
	end
	return 1					----�קK�I�������O�����
end


--=======================================
--425249  �v�椧�窺�ٲ��k
---------------------------------------------------------------------------
--BUFF�G622272�]���|�Ρ^
--FLAG�G546245
function LuaPG_425249_Accept()
	local Player = TargetID()
	if CheckBuff(Player, 622272)==false	then
		AddBuff(Player, 622272, 0, -1)
	end	
end

function LuaPG_425249_Create()		--�ͦ����~�A�����X�ͼ@��
	local Center = OwnerID()
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Center, EM_RoleValue_X )
	local Y = ReadRoleValue( Center, EM_RoleValue_Y )
	local Z = ReadRoleValue( Center, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Center, EM_RoleValue_Dir )	--�|��
	local MagicCircle = CreateObj( 120750, X, Y, Z , Dir, 1 )
	
	AddToPartition(MagicCircle, RoomID )
	WriteRoleValue(Center,(EM_RoleValue_Register-1)+1, MagicCircle)
		--���ͤ@�ө�m�I�M�@�ӧl���I�A�ñN���O�bCenter�W
	SetModeEx( MagicCircle  ,EM_SetModeType_Mark , false ) 		--�аO
	SetModeEx( MagicCircle  ,EM_SetModeType_Move , false ) 		--����
end

function LuaPG_425249_Recharge_01()	--�I���k��ϥβŤ�
	local Player = OwnerID()
	local NPC = SearchRangeNPC (Player, 30 )						--�Ψӷ�@����I
	local Num = table.getn(NPC)	
	local BuffCheck=Lua_BuffPosSearch( Player ,622272)					--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--�T�{BUFF�h��
	local Got = 0

--	Say(Player, BuffLv+1)

	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_425249_CANTUSE]" , 0 ) 		--�԰����L�k���k�}�R��
		ScriptMessage( Player , Player , 0 , "[SC_425249_CANTUSE]" , 0 )
		return false
	end

	if DW_CheckQuestAccept("or",Player,425249,425481,425495)==true	and		--��������
	BuffLv<=3								and
	NPC~=nil								then
		for i=0,Num do						--�ˬd�����������
			local PID = ReadRoleValue( NPC[i] , EM_RoleValue_PID ) 
			local EnergyPoint = ReadRoleValue(NPC[i], EM_RoleValue_OrgID)								
				if EnergyPoint==120646				and
				PID==BuffLv						then
					Got = Got+1
--					Say(Player, "right")
					break
				elseif EnergyPoint==120646				and
				PID~=BuffLv						then
					ScriptMessage( Player, Player, 1, "[SC_425249_RECHARGE_03]", 0 )	--�k�}�R�බ�ǿ��~
					ScriptMessage( Player, Player, 0, "[SC_425249_RECHARGE_03]", 0 )
					CancelBuff(Player, 622272)
					AddBuff(Player, 622272, 0, -1)
--					Say(Player, "wrong")
					return false
				end
		end
	end

--	Say(Player, Got)

	if Got == 1	then
		return true
	else
		ScriptMessage( Player, Player, 1, "[SC_425249_RECHARGE_02]", 0 )		--�o�O�Ψ����k�}�R�઺�A�䥦�a��L�k�ϥΡC
		ScriptMessage( Player, Player, 0, "[SC_425249_RECHARGE_02]", 0 )
		return false
	end
end

function LuaPG_425249_RechargeOK()		--�ϥΫ�
	local Player = OwnerID()
	local MagicPoint = LuaFunc_SearchNPCbyOrgID( Player, 120646, 70, 0 )
	local BuffCheck=Lua_BuffPosSearch( Player ,622272)			--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )	--�T�{BUFF�h��

	BeginPlot(Player,"LuaPG_425271_Act",10)
	AddBuff(Player, 622272, 0, -1)
	CallPlot(MagicPoint , "LuaPG_425249_RechargeOK_04" , MagicPoint)
--	Say(Player, BuffLv+1)
	CallPlot(Player , "LuaPG_425249_RechargeOK_02",Player,BuffLv)
end

function LuaPG_425249_RechargeOK_02(Player,BuffLv)	
	if BuffLv+1==3	then
		ScriptMessage( Player, Player, 1, "[SC_425249_RECHARGE_04]", 0 )
		ScriptMessage( Player, Player, 0, "[SC_425249_RECHARGE_04]", 0 )
		SetFlag(Player, 546245, 1)
	end
end

function LuaPG_425249_RechargeOK_03()
	AddBuff(OwnerID(), 622272, 0, -1)
end

function LuaPG_425249_RechargeOK_04(MagicPoint)
	CastSpell(MagicPoint,MagicPoint,850125)
end

function LuaPG_425249_Clear()		--�S�����ȫ�M��buff
	local Player = OwnerID()

	if CheckAcceptQuest(Player, 425249)==false	and
	CheckAcceptQuest(Player, 425481)==false	and
	CheckAcceptQuest(Player, 425495)==false	then
		CancelBuff(Player,622272)
	end
end

function LuaPG_425249_Complete()		--�S�����ȫ�M��buff
	local Player = TargetID()
	Lua_ZonePE_3th_GetScore(50)
	if CheckAcceptQuest(Player, 425249)==false	and
	CheckAcceptQuest(Player, 425481)==false	and
	CheckAcceptQuest(Player, 425495)==false	then
		CancelBuff(Player,622272)
	end
end

function LuaPG_425249_ReTake()		--���s����
	local Player = OwnerID()

	if DW_CheckQuestAccept("or",Player,425249,425481,425495)==true	and
	CountBodyItem(Player, 241196)<3					and
	CheckFlag(Player, 546245)==false					then
		SetSpeakDetail(Player, "[SC_425249_RETAKE]")
		Repeat
			GiveBodyItem(Player, 241196, 1)
		until
			CountBodyItem(Player, 241196)==3
	else
		LoadQuestOption(Player)
	end
end



--=======================================
--425253  ���I���@����a
---------------------------------------------------------------------------
function LuaPG_425253_CheckFlag()		--�}�ҫe�m
	SetFlag(TargetID(), 546246, 1)
end

function LuaPG_425253_Complete()
	Lua_ZonePE_3th_GetScore(300)
	SetFlag(TargetID(), 546246, 0)
end

function LuaPG_425253_Give()
	local Player = OwnerID()
	local NPC = TargetID()
	
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425253,425485,425499)==true	and
	CountBodyItem(Player, 240858)>=1					and
	CheckFlag(Player, 546256)==false					then
		AddSpeakOption(Player, NPC, "[SC_425253_GIVE]", "LuaPG_425253_Give_02(1)", 0)
	end
	if DW_CheckQuestAccept("or",Player,425354,425368,425382)==true	and
	CountBodyItem(Player, 209469)==0			then
		AddSpeakOption(Player, NPC, "[SC_425354_GIVE]", "LuaPG_425253_Give_02(2)", 0)
	end
end

function LuaPG_425253_Give_02(Which)
	local Player = OwnerID()

	if Which==1	then
		SetSpeakDetail(Player, "[SC_425253_TAKE]")
		DelBodyItem(Player, 240858, 1)
		SetFlag(Player, 546256, 1)
	elseif Which==2	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 209469, 5)
	end
end

function LuaPG_425253_ReTake()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425253,425485,425499)==true	and
	CountBodyItem(Player, 240858)==0					and
	CheckFlag(Player, 546256)==false					then
		AddSpeakOption(Player, NPC, "[SC_425253_RETAKE_01]", "LuaPG_425253_ReTake_01", 0)
	end
end

function LuaPG_425253_ReTake_01()
	local Player = OwnerID()
	SetSpeakDetail(Player, "[SC_425253_RETAKE]")
	GiveBodyItem(Player, 240858, 1)
end


--=======================================
--425241  ��𥼨쪺�\��
---------------------------------------------------------------------------
function LuaPG_425241_TakeFoodBox()
	local Player = OwnerID()
	local NPC = TargetID()
	
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425241,425454,425468)==true	and
	CountBodyItem(Player, 241201)==0			then
		AddSpeakOption(Player, NPC, "[SC_425241_TAKE_FOODBOX_01]", "LuaPG_425241_TakeFoodBox_02", 0)
	end
end

function LuaPG_425241_TakeFoodBox_02()
	local Player = OwnerID()
	local NPC = TargetID()
	
	SetSpeakDetail(Player, "[SC_425241_TAKE_FOODBOX_02]")
	AddSpeakOption(Player, NPC, "[SC_425241_TAKE_FOODBOX_03]", "LuaPG_425241_TakeFoodBox_03", 0)
end

function LuaPG_425241_TakeFoodBox_03()
	local Player = OwnerID()
	local NPC = TargetID()
	
	CloseSpeak(Player)
	GiveBodyItem(Player, 241201, 1)
end




--=======================================
--425242  �ƫe���@�L�дo
---------------------------------------------------------------------------
function LuaPG_425242_TakeMedicine()
	local Player = OwnerID()
	local NPC = TargetID()
		LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425242,425455,425469)==true	and
	CountBodyItem(Player, 241266)<5					then
--		SetSpeakDetail(Player, "[SC_425242_ASK_01]")
		AddSpeakOption(Player, NPC, "[SC_425242_ASK_02]", "LuaPG_425242_TakeMedicine_02", 0)
	end	
end

function LuaPG_425242_TakeMedicine_02()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	Repeat 
		GiveBodyItem(Player, 241266, 1)
	until 	CountBodyItem(Player, 241266)==5
end




--=======================================
--425256  �䴩�Ť�D��
---------------------------------------------------------------------------
function LuaPG_425256_MaHouDouGu()
	local Player = OwnerID()

	if DW_CheckQuestAccept("or",Player,425256,425488,425502)==true	and
	CheckFlag(Player, 546284)==false			and
	CountBodyItem(Player, 241268)>0			then
		SetSpeakDetail(Player, "[SC_425256_GIVE]")
		DelBodyItem(Player, 241268, 1)
		SetFlag(Player, 546284, 1)
	else
		LoadQuestOption(Player)	
	end
end

function LuaPG_425256_MaHouDouGu_02()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425256,425488,425502)==true	and
	CheckFlag(Player, 546284)==false			and
	CountBodyItem(Player, 241268)==0			then
		SetSpeakDetail(Player, "[SC_425256_GIVE]")
		AddSpeakOption(Player, NPC, "[SC_425256_GIVE_04]", "LuaPG_425256_MaHouDouGu_03", 0)
	end
end

function LuaPG_425256_MaHouDouGu_03()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_425256_GIVE_02]")
	AddSpeakOption(Player, NPC, "[SC_425256_GIVE_03]", "LuaPG_425256_MaHouDouGu_04", 0)
end

function LuaPG_425256_MaHouDouGu_04()
	local Player = OwnerID()

	CloseSpeak(Player)
	GiveBodyItem(Player, 241268, 1)
end

function LuaPG_425256_Accept()
	local Player = TargetID()
	SetFlag(Player, 547012, 1)
end

function LuaPG_425256_Accept_02()
	local Player = TargetID()
	SetFlag(Player, 547016, 1)
end


--=======================================
--425274  �̫᪺���B
---------------------------------------------------------------------------
function LuaPG_425274_Arrow()
	local Player = OwnerID()
	local Str = "["..GetUseItemGUID(Player).."]"
	ClearBorder( Player)							--��l�ƥ۸O����
	
	if ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--��u
	CheckCompleteQuest( Player, 425274) == false		then
		AddBorderPage( Player, GetQuestDetail( 425274 , 1 ) )	
		ShowBorder( Player,425274, Str,"ScriptBorder_Texture_Paper" )

	elseif ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--�Lpe
	CheckCompleteQuest( Player, 425274) == true			and
	CheckAcceptQuest( Player, 425490) == false			then
		AddBorderPage( Player, GetQuestDetail( 425490 , 1 ) )
		ShowBorder( Player,425490, Str,"ScriptBorder_Texture_Paper" )
		
	elseif ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--��pe
	CheckAcceptQuest( Player, 425490) == true			and
	CheckAcceptQuest( Player, 425504) == false			then	
		AddBorderPage( Player, GetQuestDetail( 425504 , 1 ) )
		ShowBorder( Player,425504, Str,"ScriptBorder_Texture_Paper" )

	elseif CheckAcceptQuest( Player, 425490) == true		and
	CheckAcceptQuest( Player, 425504) == true			then
		ScriptMessage(Player,Player,1,"[SC_425274]",0)
		ScriptMessage(Player,Player,0,"[SC_425274]",0)
		return
	else
		ScriptMessage(Player,Player,1,"[SC_LV_NOT_ENOUGH]",0)
		return
	end
end



--=======================================
--425271  �s�ڭ̪��J
---------------------------------------------------------------------------
--BUFF�G622308�]�p�ƥΡ^�B850115
--����NPC�G120703�]��m�I�^�B120704�]�l���I�^
function LuaPG_425271_Create()		--�ͦ����~�A�����X�ͼ@��
	local Center = OwnerID()
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Center, EM_RoleValue_X )
	local Y = ReadRoleValue( Center, EM_RoleValue_Y )
	local Z = ReadRoleValue( Center, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Center, EM_RoleValue_Dir )	--�|��
	local radian = (math.pi/180)*Dir
	
	local DraList = {}
	
	DraList[1] = CreateObj( 120703, X+30*math.cos(radian), Y, Z +40*math.sin(radian), Dir, 1 )	--��m�I
--	DraList[2] = CreateObj( 121376, X+30*math.cos(radian), Y, Z +40*math.sin(radian), Dir, 1 )	--�S�Ĩϥ��I

--	for i =1,2 do	
		AddToPartition(DraList[1], RoomID )
		WriteRoleValue(Center,(EM_RoleValue_Register-1)+1, DraList[1])
		--���ͤ@�ө�m�I�M�@�ӧl���I�A�ñN���O�bCenter�W
		SetModeEx( DraList[1]  ,EM_SetModeType_Mark , false ) 		--�аO
		SetModeEx( DraList[1]  ,EM_SetModeType_Move , false ) 		--����
--	end
end

function LuaPG_425271_Put()		--�ϥΤ����U���ˬd
	local Player = OwnerID()
	local Place = SearchRangeNPC(Player, 15)
	local Num = table.getn(Place)
	local BuffCheck=Lua_BuffPosSearch( Player ,622308)					--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--�T�{BUFF�h��	
	local Got = 0
	local PutPlace

	if DW_CheckQuestAccept("or",Player,425271,425457,425471)==true	and		--��������
	BuffLv<3								and
	Place~=nil								then
--		Say(Player,BuffLv)
		for i =0,Num do
			PutPlace = ReadRoleValue(Place[i], EM_RoleValue_OrgID)
				if PutPlace ==120703					then	--���񦳫��w�a�I����
--					Say(Player, "GOT")
					Got=Got+1
					break
				else
--					Say(Player, "None")
--					Say(Place[1], "None")
--					Say(Place[2], "None")
					return false
				end
		end
	end
	
	if Got==1	then
		DW_CancelTypeBuff(68,Player)							----�����M�����A
		return true
	end
end

function LuaPG_425271_Put_02()	--�ϥΫᲣ�ͪ��ĪG
	local Player = OwnerID()
	local Absorb = LuaFunc_SearchNPCbyOrgID( Player, 120704, 70, 0 )
	local Place = ReadRoleValue(Absorb, EM_RoleValue_Register1)
	local BuffPlace = DW_CreateObjEX("obj",121376,Place) 
	local RoomID = ReadRoleValue(Absorb, EM_RoleValue_RoomID)
	AddToPartition(BuffPlace,  RoomID)
	ks_ActSetMode(BuffPlace)

	BeginPlot(Player,"LuaPG_425271_Act",10)							--���a��m�ʧ@
--	CastSpell( Place, Absorb, 850115)							--��ӫ��w���󲣥�BUFF
	CallPlot(BuffPlace , "LuaPG_425271_Act_02" , Place, Absorb,BuffPlace)
	AddBuff(Player, 622308, 0, -1)								--���|�p�ƥ�BUFF
	DW_QietKillOne(0,106830)								--�R�R�������ǡA�e�̱�����̡A0�N�����a
	BeginPlot(Place, "luaPG_425271_HideandShow", 0 )					-- �\��O��HIDE
end

function luaPG_425271_HideandShow()								-- HIDE����g�L�@�w��ƥX�{
	local Place = OwnerID()  
	Sleep(15)
	Hide(Place)
	sleep(200)
	Show( Place, 0) 
end

function LuaPG_425271_Act()
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_END)
end

function LuaPG_425271_Act_02(Place, Absorb,BuffPlace)
	CastSpell( BuffPlace, Absorb, 850115)
	Sleep(50)
	DelObj(BuffPlace)
end

function LuaPG_425271_ReTake()	--�������~
	local Player = OwnerID()
	local NPC = TargetID()
	local BuffCheck=Lua_BuffPosSearch( Player ,622308)					--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--�T�{BUFF�h��

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425271,425457,425471)==true	and		--��������
	CountBodyItem(Player, 241273)==0					and
	BuffLv<3								then
		AddSpeakOption(Player, NPC, "[SC_425271_01]", "LuaPG_425271_ReTake_02", 0)
	end
end

function LuaPG_425271_ReTake_02()	--�������~
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_425271_02]")
	AddSpeakOption(Player, NPC, "[SC_425271_01]", "LuaPG_425271_ReTake_03", 0)	
end

function LuaPG_425271_ReTake_03()	--�������~
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 241273, 3)
end

function LuaPG_425271_Complete()
	Lua_ZonePE_3th_GetScore(30)
	local Player = TargetID()
	CancelBuff(Player, 622308)			--���ȧ�����A���h���WBUFF

end

function LuaPG_425271_Cancel()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,425271,425457,425471)==true	then
		return true
	else
		CancelBuff(Player, 622308)		--�p�G�R�����ȡA�������WBUFF
	end
end

function LuaPG_425271_Accept()
	local Player = TargetID()
	SetFlag(Player, 547011, 1)
end

function LuaPG_425271_Accept_02()
	local Player = TargetID()
	SetFlag(Player, 547015, 1)
end



--=======================================
--425272  §�|���ӬO�򥻹D�z
---------------------------------------------------------------------------
function LuaPG_425272_Present()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425272,425472,425458)==true	and
	CountBodyItem(Player, 241272)==0			then
		AddSpeakOption(Player, NPC, "[SC_425272_PRESENT_01]", "LuaPG_425272_Present_02", 0)
	end
end

function LuaPG_425272_Present_02()
	local Player = OwnerID()
	GiveBodyItem(Player, 241272, 1)
	SetSpeakDetail(Player, "[SC_425272_PRESENT_02]")
end



--=======================================
--425276  ����K�Ѧ��
---------------------------------------------------------------------------
--�������ͥX�Ǫ��A�`�@2�H�[�@������
-- �����ͼ˻�
--�K�|�շ|�b5�Ӧa�I�X�S�A�@���X�{��10�����A�M��N�|���a�I�A����Ӭ��P�@�ɶ��A�t�T�Ӭ��P�@�ɶ�
--�p�G3�H���u�Ѩ䤤�@��A�N���m
--�u�n���줤���`����@�w���ƥH�U�A�B�C���ǬҨS���i�J�԰��A�N���m

function LuaPG_425276_Center()		--�������ͥX��
	local Center = OwnerID()
	local Min = GetSystime(2)							--����{�b�ɶ��]���^
	local CenterPID = ReadRoleValue( Center , EM_RoleValue_PID )
	local TimeList = {}
	TimeList[1] = {0,21,41,11,31,51}
	TimeList[2] = {11,31,51,0,21,41}

	if Min == TimeList[CenterPID][1] or Min == TimeList[CenterPID][2] or Min == TimeList[CenterPID][3]		then		--���Ǫ��ɶ�
		LuaPG_425276_Reborn()
		BeginPlot(Center, "LuaPG_425276_10MR" ,0)
		Sleep(6100)
	elseif Min == TimeList[CenterPID][4] or Min == TimeList[CenterPID][5] or Min == TimeList[CenterPID][6]	then		--�p�G��F�𮧪�10�����٦��Ǫ���
		BeginPlot(Center, "LuaPG_425276_Check", 0)
		Sleep(6000)
		CallPlot(Center,"LuaFunc_ResetObj",Center)
	end
	BeginPlot(Center,"LuaPG_425276_Center_02", 0)
end

function LuaPG_425276_Center_Test()		--�������ͥX��(testversion)
	local Center = OwnerID()
	LuaPG_425276_Reborn()
	BeginPlot(Center, "LuaPG_425276_10MR_02" ,0)
	Sleep(6100)
	BeginPlot(Center, "LuaPG_425276_Check", 0)
	Sleep(6000)
	CallPlot(Center,"LuaFunc_ResetObj",Center)
end

function LuaPG_425276_Center_02()
	BeginPlot(OwnerID(),"LuaPG_425276_Center", 2)
end	

function LuaPG_425276_Reborn()
	local Center = OwnerID()
	local DeleteList = {}
	DeleteList[1] = ReadRoleValue(Center,EM_RoleValue_Register1)
	DeleteList[2] = ReadRoleValue(Center,EM_RoleValue_Register2)
	DeleteList[3] = ReadRoleValue(Center,EM_RoleValue_Register3)	
	local DeadorNot
--	DebugMsg(0,0,"--REBORN IS RUN --")
	for i=1,3 do
		DeadorNot = ReadRoleValue(DeleteList[i], EM_RoleValue_IsDead)
--		SAY(DeleteList[i],"1")
		Sleep(10)
		if DeadorNot == 0 then
			NPCSAY(DeleteList[i],"[SC_425276_DISAPPEAR]")
			Sleep(10)
			DelObj(DeleteList[i])
		end
	end
--	WriteRoleValue(Center,EM_RoleValue_Register7, 3)
	Sleep(160)
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Center, EM_RoleValue_X )
	local Y = ReadRoleValue( Center, EM_RoleValue_Y )
	local Z = ReadRoleValue( Center, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Center, EM_RoleValue_Dir )			--�|��
	
	local ChatList = {}
	ChatList[1] = CreateObj( 106828, X-30, Y, Z+15, (Dir/4), 1)			--��ĳ��
	ChatList[2] = CreateObj( 106828, X-30, Y, Z-15, (Dir/4), 1)			--��ĳ��
	ChatList[3] = CreateObj( 106720, X+30, Y, Z, (Dir/4)+180, 1)			--�ʭx��	
	for i =1,3 do
		AddToPartition(ChatList[i], RoomID )
		WriteRoleValue(Center,(EM_RoleValue_Register-1)+i, ChatList[i])
		--���ͤ@�ө�m�I�M�@�ӧl���I�A�ñN���O�bCenter�W
		WriteRoleValue(ChatList[i],EM_RoleValue_Register6,Center)	--�N�����O�b�Ǫ����W
	end
	AdjustFaceDir( ChatList[1], ChatList[3], 0)
	AdjustFaceDir( ChatList[2], ChatList[3], 0)
end

function LuaPG_425276_Check()
	local Center = OwnerID()

	local NPCList = {ReadRoleValue(Center,EM_RoleValue_Register1),ReadRoleValue(Center,EM_RoleValue_Register2),ReadRoleValue(Center,EM_RoleValue_Register3)}
	local AttackCount = 0
	local AttackTarget

	for i=1,60 do	
		for j = 1,3 do
			AttackTarget = HateListCount(NPCList[j])			--�P�_�O�_�i�J�԰� 1= �O 0= �_
				if AttackTarget ==0	then				--�p�G�S���b�԰�
					AttackCount = AttackCount+1
--					DebugMsg(0,0,"OLA")					
				end
		end
		if AttackCount == 3	then
			for k=1,3	do
				DelObj(NPCList[k])
			end
--			DebugMsg(0,0,"BITTE")	
			break
		end
--		DebugMsg(0,0,"HateListCount1"..HateListCount(NPCList[1]))
--		DebugMsg(0,0,"HateListCount2"..HateListCount(NPCList[2]))
--		DebugMsg(0,0,"HateListCount3"..HateListCount(NPCList[3]))	
		Sleep(100)
	end
end

function LuaPG_425276_Chat()			--��Ѫ�t�A���b�X�ͼ@��
	local NPC = OwnerID()
	local AttackCount
	local Speak={}
	local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD 	-- 1/5 ���v���X�I�Y�ʧ@
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_POINT		-- 1/5 ���v���X���H�ʧ@
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK

	while true do
		AttackCount = ReadRoleValue(NPC,EM_RoleValue_IsAttackMode)
		if AttackCount == 0		then 
			local i = rand(5)
			Motion = Speak[i]
			PlayMotion( NPC, Motion)
		elseif AttackCount == 1	then
			break	
		end
		sleep(50)
	end
end

function LuaPG_425276_10MR()
	local Center = OwnerID()
	local Chat1
	local Chat2
	local Ant

	local X=0
	local Y=0
	local Z=0

	local IsAntDead,IsChat1Dead,IsChat2Dead=false,false,false;
	local IsAntFight,IsChat1Fight,IsChat2Fight=false,false,false;

	local HC=0

	for i=1,130	do
		Chat1 = ReadRoleValue(Center,EM_RoleValue_Register1)
		Chat2 = ReadRoleValue(Center,EM_RoleValue_Register2)
		Ant = ReadRoleValue(Center,EM_RoleValue_Register3)

		IsAntDead=(ReadRoleValue(Ant, EM_RoleValue_IsDead)==1);
		IsChat1Dead=(ReadRoleValue(Chat1, EM_RoleValue_IsDead)==1);
		IsChat2Dead=(ReadRoleValue(Chat2, EM_RoleValue_IsDead)==1);

		IsAntFight=(HateListCount(Ant)~=0);
		IsChat1Fight=(HateListCount(Chat1)~=0);
		IsChat2Fight=(HateListCount(Chat2)~=0);

		local TargetList={};

		if IsAntDead then
			if X==0 then
				X = X+1
			end
		else
			TargetList[3]=ReadRoleValue(Ant,EM_RoleValue_AttackTargetID);
		end

		if IsChat1Dead then
			if Y==0 then
				Y = Y+1
			end
		else
			TargetList[1]=ReadRoleValue(Chat1,EM_RoleValue_AttackTargetID);
		end

		if IsChat2Dead then
			if Z==0 then
				Z = Z+1
			end
		else
			TargetList[2]=ReadRoleValue(Chat2,EM_RoleValue_AttackTargetID);
		end

		for SN=1,3 do
			if TargetList[SN]~=nil and CheckID(TargetList[SN]) then
				SysCastSpellLv(TargetList[SN],Ant,495751,1);
				SysCastSpellLv(TargetList[SN],Chat1,495751,1);
				SysCastSpellLv(TargetList[SN],Chat2,495751,1);
			end
		end

		if Z==1 and Y==1 and X==0	then
			if IsAntFight==false then
----				DebugMsg(0,0,"ADIOS")
				HC=HC+1
			end
		end

		if X==1 and Y==0 and Z==0	then
			if IsChat1Fight==false and IsChat2Fight==false then			
----				DebugMsg(0,0,"MIAO")
				HC=HC+1
			end
		end

		if X==1 and Y==1 and Z==0	then
			if IsChat2Fight==false	then			
----				DebugMsg(0,0,"OHAYO")
				HC=HC+1
			end
		end

		if X==1 and Y==0 and Z==1	then
			if IsChat1Fight==false then			
----				DebugMsg(0,0,"SAWADICA")
				HC=HC+1
			end
		end

		if X==1 and Y==1 and Z==1 and HC==0		then
----			DebugMsg(0,0,"CHAO")
			HC=HC+1
		end

		if HC==1	then
----			DebugMsg(0,0,"ALOHA")
----			DelObj(Chat1)
----			DelObj(Chat2)
----			DelObj(Ant)
			X=0
			Y=0
			Z=0
			HC=0
			IsAntDead,IsChat1Dead,IsChat2Dead=false,false,false;
			IsAntFight,IsChat1Fight,IsChat2Fight=false,false,false;
			Sleep(50)
			LuaPG_425276_Reborn()
		end
----		DebugMsg(0,0,"X"..X)
----		DebugMsg(0,0,"Y"..Y)
----		DebugMsg(0,0,"Z"..Z)
----		DebugMsg(0,0,"HC"..HC)
		Sleep(50)
	end
end

function LuaPG_425276_10MR_02()
	local Center = OwnerID()
	local Chat1
	local Chat2
	local Ant

	local SurviveNum
	for i=1,120	do
--		Say(Center,"YEAH")
		Chat1 = ReadRoleValue(Center,EM_RoleValue_Register1)
		Chat2 = ReadRoleValue(Center,EM_RoleValue_Register2)
		Ant = ReadRoleValue(Center,EM_RoleValue_Register3)
		SurviveNum = ReadRoleValue(Center,EM_RoleValue_Register7)
		if SurviveNum==0	then
			Sleep(50)
			CallPlot(Center,"LuaPG_425276_Reborn",Center)
--			Say(Center,"BIBI")
		end
		Sleep(50)
	end
end

function LuaPG_425276_Dead()
	local Monster = OwnerID()
	local OrgID = ReadRoleValue( Monster, EM_RoleValue_OrgID )
	if OrgID== 106720	then
		Lua_PG_CancelAntBuff()
	end
	local Center = ReadRoleValue(Monster,EM_RoleValue_Register6)
	local SurviveNum = ReadRoleValue(Center,EM_RoleValue_Register7)
--	if Center~=0	then
--		SurviveNum = SurviveNum-1
--		WriteRoleValue(Center,EM_RoleValue_Register7, SurviveNum)
--	end
end




--=======================================
--425277  �h���ƧZ
---------------------------------------------------------------------------
function LuaPG_425277_AntEgg()
	local Player = OwnerID()
	local Str = "["..GetUseItemGUID(Player).."]"
	ClearBorder( Player)							--��l�ƥ۸O����
	
	if ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--��u
	CheckCompleteQuest( Player, 425277) == false		then
		AddBorderPage( Player, GetQuestDetail( 425277 , 1 ) )	
		ShowBorder( Player,425277, Str,"ScriptBorder_Texture_Paper" )

	elseif ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--�Lpe
	CheckCompleteQuest( Player, 425277) == true			and
	CheckAcceptQuest( Player, 425493) == false			then
		AddBorderPage( Player, GetQuestDetail( 425493 , 1 ) )
		ShowBorder( Player,425493, Str,"ScriptBorder_Texture_Paper" )
		
	elseif ReadRoleValue(Player,EM_ROLEVALUE_LV)>=72		and	--��pe
	CheckAcceptQuest( Player, 425493) == true			and
	CheckAcceptQuest( Player, 425507) == false			then	
		AddBorderPage( Player, GetQuestDetail( 425507 , 1 ) )
		ShowBorder( Player,425507, Str,"ScriptBorder_Texture_Paper" )

	elseif CheckAcceptQuest( Player, 425493) == true			and
	CheckAcceptQuest( Player, 425507) == true			then
		ScriptMessage(Player,Player,1,"[SC_425274]",0)
		ScriptMessage(Player,Player,0,"[SC_425274]",0)
	else
		ScriptMessage(Player,Player,1,"[SC_LV_NOT_ENOUGH]",0)
	end
end



--=======================================
--425273  ���ᤧ�a
---------------------------------------------------------------------------
function LuaPG_425273_KillinDark()		--�Ǧ��`���ɭ�
	local Monster = OwnerID()
	local Playerlist = {}
	Playerlist = DW_HateRemain(0)
	if type(Playerlist)~="table" then
		return;
	end
	local Num = table.getn(Playerlist)

--	Say(Playerlist[1],"Hey!")
	for i=1,Num	do						--Ū�������
		if DW_CheckQuestAccept("or",Playerlist[i],425273,425473,425459)==true	then
--			Say(OwnerID(),"OMG!")
			DW_QietKillOne(Playerlist[i],107058)		--���������@����(0�h����OwnerID() ��1�h����TargetID())
		end
	end
end


--=======================================
--�䴩  �p������
---------------------------------------------------------------------------
function LuaPG_425353_ReTake()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425353,425367,425381)==true	and
	CountBodyItem(Player, 209468)==0					then
		AddSpeakOption(Player, NPC, "[SC_425353_RETAKE]", "LuaPG_425353_ReTake_01", 0)
	end
end

function LuaPG_425353_ReTake_01()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 209468, 4)
end