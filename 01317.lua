function LuaS_420909_0() --�c�l�W��Ĳ�I�@��
	SetPlot(OwnerID() , "touch" , "LuaS_420909_1" , 45 )
end

function LuaS_420909_1() --�٨S��������&�S���o���N
	if	not	CheckCompleteQuest( OwnerID(), 420910 )		and
		CountBodyItem(OwnerID() , 204395 ) < 1			then
		GiveBodyItem(OwnerID() , 204395 , 1); -- ���F��
		Say(OwnerID(),"[SC_420909_0]")
	end
	if	CountBodyItem(OwnerID(),204212) < 5	then
		GiveBodyItem(OwnerID(),204212,1)
	end
end

function LuaS_420909_2()
	if	not	CheckCompleteQuest( OwnerID(), 420910 )		and
		CountBodyItem(OwnerID() , 204395 ) < 1			then
		GiveBodyItem(OwnerID() , 204395 , 1); -- ���F��
		Say(OwnerID(),"[SC_420909_0]")
	end
	return 1
end

function LuaS_420910_0() -- �۸O��������
	ClearBorder(OwnerID());
	AddBorderPage(OwnerID(),GetQuestDetail(420910,1));
	ShowBorder( OwnerID(),420910,"[420910]","ScriptBorder_Texture_Paper");
end

function LuaS_420911_0() -- �ŧi�����ܼ�
	Zone7_420911 = 0
	SetPlot(OwnerID(),"range","LuaS_420917_0",100)
end

function LuaS_420911_1() -- �����`�@��
	SetPlot(OwnerID(),"dead","LuaS_420911_2",0)
end

function LuaS_420911_2() 
	Zone7_420911 = Zone7_420911 +1 --�W�[�p��
	if	Zone7_420911 > 35	then   --��F�ƶq��....


		local Count = SetSearchAllNPC(0)
		local NPC = {}
		local HowMany = 0
		for i = 1 , Count do
			NPC[i] = GetSearchResult()
		end
		for i = 1, Count do
			if ReadRoleValue(NPC[i] ,EM_RoleValue_OrgID) == 101784 then
				HowMany = HowMany + 1
			end
		end
		if HowMany < 1 then
			Zone7_420911 = 0	-- �k�s
			local buysome = Lua_DW_CreateObj("flag",101784 , 780088 , 1) 
			BeginPlot(buysome , "LuaS_420911_3" , 0)
			ScriptMessage( OwnerID(), -1, 0, "[SC_420911_0]", 0 ); -- �Ԧ��~��������X�{�b���L�W�I
			ScriptMessage( OwnerID(), -1, 2, "[SC_420911_0]", 0 ); -- �Ԧ��~��������X�{�b���L�W�I
		end

	end
	return true
end

function LuaS_420911_3() -- 10���������
	local sec = 0
	while	true	do
		sleep(10)
		sec = sec +1
		if	sec > 600	and
			ReadRoleValue(OwnerID() , EM_RoleValue_IsAttackMode)then
			DelObj(OwnerID())
		end
	end
end


function LuaS_420917_0() --���ɧP�_
	if	CountBodyItem(OwnerID(),204209)>9	then
		if	CheckBuff(OwnerID(),503154)	then
			SetFlag(OwnerID(),542512,1)
			return
		end
	end
	SetFlag(OwnerID(),542512,0)
end

function LuaS_420917_1()
	AddBuff(TargetID(),503154,0,600)
end

function LuaS_420917_2()
	CancelBuff(TargetID(),503154)
	SetPlot(OwnerID(),"range","LuaS_420917_0",100)
end


function LuaS_420918_0()
	BeginPlot(OwnerID(),"LuaS_420918_1",0)
end

function LuaS_420918_1()
	Say(OwnerID(),"[SC_420918_0]") -- �S�Q��ڳo�بS�Ϊ��å��٦��H�@�N���ڡK�K���§A�A�B�͡C
	sleep(20)
	Say(OwnerID(),"[SC_420918_1]") --�]�\�ڥi�H�^�h�ݬݦo�K�K�����D�o���H�F�S���C
	sleep(40)
end

function LuaS_420920_0()
	SetPlot(OwnerID(),"range","LuaS_420920_1",170)
end

function LuaS_420920_1()
	if	not CheckCompleteQuest( OwnerID(), 420920 )	and
		not CheckFlag(OwnerID(),542473)		and
		CheckAcceptQuest(OwnerID(),420920 )		then
		SetFlag(OwnerID() , 542473 , 1)
		Say(OwnerID() ,"[SC_420920_0]") -- �L�̦b�i�椰������H�ڳ̦n���I�i�D�Ծ|�d�o��ơK�K
	end
end


function LuaS_420921_0()
	SetPlot(OwnerID(),"dead","LuaS_420921_1",0)
end

function LuaS_420921_1()
	local Player = {}
	local HateSome  -- ��������H
	for i = 0 , HateListCount( OwnerID() ) do
		HateSome = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	not CheckCompleteQuest( HateSome  , 420921 )  then
			SetFlag( HateSome , 542474 , 1 )
		end
	end
end



function LuaS_420923_0() --�ϥΫe�ˬd�O���O�bzone7
	local X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	if	Lua_ExGetZone( OwnerID()) == 7	then
		if	X < 15800	and
			X > 15000	and
			Z < 15700	and
			Z > 14500	then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_DAN_111700_37]", 0 )
			return false
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_DAN_111700_37]", 0 )
		return false
	end
end

function LuaS_420923_1() --���˦����s
	AddBuff(OwnerID() , 503152 , 1 , 60 )
end

function LuaS_420923_2() --���ΰ���
	SetPlot(OwnerID() , "Range" , "LuaS_420923_3" , 70)
end

function LuaS_420923_3()
	if	CheckAcceptQuest( OwnerID() , 420923 )		then
		if 	CheckBuff( OwnerID() , 503152) 		and
			CheckFlag(OwnerID() , 542475)==false	then --��buff

			SetPlot(TargetID() , "Range" , "" , 0) --�����d��@��
			BeginPlot(TargetID() , "LuaS_420923_4" , 0) -- show time
		end
	end
end

function LuaS_420923_4()
	local Gick = Lua_DW_CreateObj("obj" , 101709 , OwnerID() ) 
	SetPlot(Gick , "dead" , "LuaS_420923_5" , 0) -- ���g���
	WriteRoleValue(Gick,EM_RoleValue_PID, TargetID())
	BeginPlot(Gick , "LuaS_420923_6" , 0) -- �ǳ�½�y
	FaceObj( Gick , TargetID() );
	Say(Gick , "[SC_420921_1]") -- ���d���A�W��"�r�D"���O�s�A�̤��n��M�|���ܡH�o��u���ɶ��ڭ̤���󴫸˳ơI�W���`�ڭ̮t�I�n�S�����٤����ܡH�����K�K�ڨS���L�A�I
	while 	CheckID(Gick) 	do
		sleep(10)
	end
	SetPlot(OwnerID() , "Range" , "LuaS_420923_3" , 70) -- �̫�n�^�_
end

function LuaS_420923_5() -- �������ȡA�����N����
	local Player = {}
	local HateSome
	for i = 0 , HateListCount( OwnerID() ) do
		HateSome = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(  HateSome , 420923 )  then
			SetFlag( HateSome , 542475 , 1 )
			GiveBodyItem(HateSome,204396,1)
		end
	end
	return true
end

function LuaS_420923_6() -- �ѯ}�H��N�۳å�
	sleep(40)
	SetRoleCamp(OwnerID() , "Monster")
	Hide(OwnerID())
	Show(OwnerID() , 0)
	SetAttack(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_PID))
	Say(OwnerID() , "[SC_420920_2]") --�A��Q���ۦ^�h���i�I
	BeginPlot(OwnerID() , "LuaS_Discowood_CheckPeace" , 0) -- �S�H�����N����
end


function LuaS_420927_0() --�M�y���~�����
	LoadQuestOption( OwnerID() );
	SetSpeakDetail( OwnerID(), "[SC_420927_5]") --�y�K�K�ϱϧڡI
	if	CheckCompleteQuest(OwnerID(),420914)	then
		SetSpeakDetail( OwnerID(), "[SC_420927_2]");--���¡A�A�u�O�n�H
	end

	if	CheckCompleteQuest(OwnerID(),420915)	then
		SetSpeakDetail( OwnerID(), "[SC_420927_3]"); -- ���K�o���r���O�Q�F
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420927_6]" ,  "LuaS_420927_2",  0 ) --�A�n�p��
	end

	if	CheckCompleteQuest(OwnerID(),420914)	then
		SetSpeakDetail( OwnerID(), "[SC_420927_4]"); --  ���§A�A�ڲש�i�H�^��H�����I�K�K
	end
	if	CheckAcceptQuest( OwnerID(), 420927 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420927_0]" ,  "LuaS_420927_1",  0 ); -- (�߰ݥL���b�˪��g���O�_�M�����y�z���۲š^
	end
end

function LuaS_420927_1()
	SetSpeakDetail( OwnerID(), "[SC_420927_1]"); -- ��I�S���A���Ӯɭԧ��٥H���ۤv�ֱ��F�I
	SetFlag(OwnerID(),542477,1)
end


function LuaS_420927_2()
	SetSpeakDetail( OwnerID(), "[SC_420927_7]") --�S���D
end

function LuaS_420928_0() -- �M�Ծ|�d�����
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420928 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420928_0]" ,  "LuaS_420928_1",  0 ); -- (��L����J���˳ơ^
	end
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_5",  0 ); -- (�X���ҩ��A���ˬd�L���˳�)
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_13]" ,  "LuaS_420930_10",  0 ); -- (�ХL�N�b�~�����ު���w�l�^)
	end
end

function LuaS_420930_5()
	SetSpeakDetail( OwnerID(), "[SC_420930_5]"); -- �Ծ|�d���ҵ�
	SetFlag(OwnerID(),542501,1)
end


function LuaS_420928_1()
	SetSpeakDetail( OwnerID(), "[SC_420928_1]"); --�Ծ|�d����J���˳Ƶ��A
	if	CountBodyItem(OwnerID() , 204397) < 1	then
		GiveBodyItem(OwnerID() , 204397 ,1 )
	end
end

function LuaS_420929_0()
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420929 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420929_0]" ,  "LuaS_420929_1",  0 ); -- (�߰�����Q��f�̮g�������s)
	end
end

function LuaS_420929_1()
	SetSpeakDetail( OwnerID(), "[SC_420929_1]"); -- �Z�_�[���^��
end

function LuaS_420929_2() --���b���s����W��
	SetPlot(OwnerID(),"touch","LuaS_420929_3",50)
	AddBuff(OwnerID(),503165,0,-1)
	LuaP_Dead()
end

function LuaS_420929_3()
	if	not CheckAcceptQuest( OwnerID(), 420929 ) 	then
		return
	end

	if	CountBodyItem(OwnerID(),204398)<1	then
		GiveBodyItem(OwnerID(),204398,1)
	end
end


function LuaS_420930_0() --��w
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_1",  0 );
	end
end

function LuaS_420930_1()
	SetSpeakDetail( OwnerID(), "[SC_420930_1]");
	SetFlag(OwnerID(),542478,1)
end

function LuaS_420930_2() --�͵�q
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_3",  0 );
	end
end

function LuaS_420930_3()
	SetSpeakDetail( OwnerID(), "[SC_420930_3]");
	SetFlag(OwnerID(),542500,1)
end



function LuaS_420930_6() -- �w�F
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_7",  0 );
	end
end

function LuaS_420930_7()
	SetSpeakDetail( OwnerID(), "[SC_420930_7]");
	SetFlag(OwnerID(),542502,1)
end

function LuaS_420930_8() -- ������
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_9",  0 );
	end
end

function LuaS_420930_9()
	SetSpeakDetail( OwnerID(), "[SC_420930_9]");
	SetFlag(OwnerID(),542503,1)
end

function LuaS_420930_10() --����420930���Ծ|�d��ܼ@��
	CloseSpeak(OwnerID());
	DisableQuest( TargetID() , true )
	MoveToFlagEnabled( TargetID(), true )--go
	SetDelayPatrolTime( TargetID(), 0 )
end

function LuaS_420930_11() --�Ծ|�d���|2
	MoveToFlagEnabled( OwnerID(), false )--stop
	Say(OwnerID(),"[SC_420930_10]") --�o���n�A�L��n�^��a��!
	sleep(20)
	local Joan = Lua_DW_CreateObj("flag" , 112569 , 780088 , 2)
	Say(Joan , "[SC_420930_11]") -- �ڡH���H��ڡH
	for i=1,30 do
		sleep(10)
	end
	Say(Joan , "[SC_420930_12]") -- ���ܲ�Ӥ[�F�A���ޮɶ��I
	sleep(10)
	DelObj(Joan)
	MoveToFlagEnabled( OwnerID(), true )--go
end



function LuaS_420931_0()
	BeginPlot(TargetID(),"LuaS_420931_1",0)
	return 1
end

function LuaS_420931_1()
	DisableQuest( OwnerID() , true )
	local Joan = Lua_DW_CreateObj("flag",101734,780088 , 3)
	SetPlot(Joan,"dead","LuaS_420931_2",0)
	Yell(Joan ,"[SC_420931_0]",2) -- �S�Q��|�Q�A���I���L�S���Y�K�K���H�O���|���ܪ��I
	SetAttack(Joan,TargetID())
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,Joan)
	BeginPlot(OwnerID(),"LuaS_420931_3",0)
	sleep(20)
	Say(TargetID(),"[SC_420931_5]") -- �S��!
end

function LuaS_420931_2()
	Say(TargetID(),"[SC_420931_1]") --��Ӭr�D�N�O��J�A�o���֧i�D�����o��ơK�K
	local Player = {}
	local HateSome  -- ��������H
	for i = 0 , HateListCount( OwnerID() ) do
		HateSome = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	not CheckCompleteQuest( HateSome  , 420931 )  then
			GiveBodyItem( HateSome , 204399 , 1 )
			SetFlag(HateSome,542488,1)
		end
	end
end

function LuaS_420931_3()
	local Joan = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while	CheckID(Joan)	do
		sleep(10)
	end
	DisableQuest( OwnerID() , false )
end

function LuaS_420931_4()
	if	Lua_ExGetZone( OwnerID()) == 7	then
		local tips = Lua_DW_CreateObj("obj" , 112399, OwnerID(),0)
		Lua_ObjDontTouch(tips)
		SetModeEx( tips , EM_SetModeType_Gravity , false ) 
		AddToPartition(tips,0)
		AddBuff(tips,502924,1,-1)
		BeginPlot(tips,"LuaS_420931_5",0)
		BeginPlot(tips,"LuaS_420931_6",0)
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_DAN_111700_37]", 0 ) --�A�L�k�b���ϰ�ϥθӪ��~
		return false
	end
end

function LuaS_420931_5()
--	LuaFunc_MoveToFlag( OwnerID() , 780088 , 4 ,0 )
	local FlagX = GetMoveFlagValue( 780088 , 4 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( 780088 , 4 , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( 780088 , 4 , EM_RoleValue_Z )
	MoveDirect( OwnerID(), FlagX , FlagY , FlagZ )
	sleep(15)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_X)/10 == FlagX/10		and
		ReadRoleValue(OwnerID(),EM_RoleValue_Z)/10 == FlagZ/10		then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_420931_2]", 0 ) --�l�ܾ����V�o�̡K�K
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_420931_2]", 0 ) --�l�ܾ����V�o�̡K�K
	end
end

function LuaS_420931_6()
	sleep(20)
	DelObj(OwnerID())	
end

function LuaS_420931_7()
	BeginPlot(OwnerID(),"LuaS_420931_8",0)
	return 1
end

function LuaS_420931_8()
	Say(OwnerID(),"[SC_420931_3]") --�o�̪��g���G�O�s���K�K
	sleep(20)
	Say(OwnerID(),"[SC_420931_4]") --ĵ�ƶ����˳ơI�������h�èS���K�Kĵ�ƶ����٦����l�I
end