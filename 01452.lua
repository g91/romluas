--�M�κX�l 780375  �]�n�ء^
-- 1�G���p���y�p�a�J�X�{�I
-- 2�A3�G�ݦu���H�����äh�X�{�I
-- 4�A5�G�ݦu���H�����äh�����I
-- 6 �G�ڥ������k���I

--�d��@��script �A�б��b�ӥ��Ƚd��ѦҪ��󪺪�l�@����
-- ���� 422472 �O�B���٬O�ĤH�H�GLuaI_422472_Range_0
-- ���� 422479 �լd�����GLuaI_422479_0

---113167 ���L���� ��ܼ@��----------
function LuaS_113167_0()
	if CheckBuff( OwnerID() , 503934 ) == true then
		SetSpeakDetail( OwnerID(),  "[SC_422472_2]" ) --( [113167]�@����A���W���U�l���W�O�L�Y�h�A�ݨӦb�����U�l�����e�L���|��A������ܡC )
	else
		LoadQuestOption(OwnerID())
	end
	if	CheckAcceptQuest(OwnerID(),422721)	and
		CountBodyItem(OwnerID(),205839)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422721_0]","LuaS_422721_3", 0 )
	end
end

--------���� 422472 �O�B���٬O�ĤH�H ------------------------
function LuaI_Zone8_MushroomDead() --�б��b�Ҧ����H�����`�@����
	if CheckAcceptQuest( TargetID() , 422472 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422472_1]" , 0 ) --�A�H�I�F�P[113167]�����w�A�ˮ`�L���P��I�ҾڴN�b�A�����W�I
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422472_1]" , 0 )
		AddBuff( TargetID() , 503934 , 1 , 300 )
	end
	return true
end


function LuaI_422472_Range_0() --�б��b�ˬd�I�W
	SetPlot( OwnerID() , "range" , "LuaI_422472_Range_1" , 100 ) --�վ�̫᪺�Ʀr�H���ܰ����d��
end

function LuaI_422472_Range_1()
	if CheckAcceptQuest( OwnerID() , 422472 ) == true and CheckFlag( OwnerID() , 542872 ) == false then
		SetFlag( OwnerID() , 542872  , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422472_0]" , 0 ) --�A�o�{���H�̤@�ʤ]���ʦa�b�_�Ǫ��j��ۣ�U������
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422472_0]" , 0 )
	end
end

----------���� 422474 �s���L�� ---------------------------
function LuaS_113168_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID() , 422474 ) == true and CountBodyItem( OwnerID() , 205260 ) < 10 then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422474_0]" ,"LuaS_113168_1", 0 ) --�A�ΤO�n�����H
	end
end

function LuaS_113168_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )

	if ReadRoleValue(TargetID() , EM_RoleValue_PID ) > 0 then
		BeginPlot( TargetID() , "LuaS_113168_2C" , 0 ) --�������G
		return
	end

	local Rand = DW_Rand( 300 ) -1
	if math.floor( Rand/100 ) == 2 then
		BeginPlot( TargetID() , "LuaS_113168_2A" , 0 ) --���}���G
	elseif math.floor( Rand/100 ) == 1 then
		BeginPlot( TargetID() , "LuaS_113168_2B" , 0 ) --�I�䵲�G	
	else
		BeginPlot( TargetID() , "LuaS_113168_2C" , 0 ) --�������G
	end 
end

function LuaS_113168_2A()
	local Str = {[1] = "[SC_422474_1]" , [2] = "[SC_422474_2]" }  --A. �ڭ����F�H�ګ��|�b�o�̡H B.�ڸӦ^��ڪ��u�@�^��W�K
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	AdjustFaceDir( OwnerID(), TargetID(), 0 ) 
	sleep( 5 )
	MoveToFlagEnabled( OwnerID() , false )
	PlayMotion (OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Yell( OwnerID() , Str[DW_Rand(2)] , 2)
	sleep( 30 )
	Move( OwnerID() , -7701 ,0 , 19896 )
	if CheckAcceptQuest( TargetID() , 422474 ) == true and CountBodyItem( TargetID()  , 205260 ) < 10 then
		ScriptMessage( TargetID() ,TargetID(), 0 , "[SC_422474_3]" , 0 ) --�A�߰_[113168]���}��ҿ�d�U�Ӫ��U�l
		ScriptMessage( TargetID() , TargetID(), 2 , "[SC_422474_3]" , 0 )
		GiveBodyItem( TargetID() , 205260 , 1 )
	end
	sleep( 50 )
	Hide( OwnerID() )
	sleep( 150 )
	Show( OwnerID() , 0 )
	SetPos( OwnerID(), X, Y, Z , Dir )
	sleep( 5 )
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() , false )
end

function LuaS_113168_2B()
	local Str = {[1] = "[SC_422474_4]" , [2] = "[SC_422474_5]" }  --A.�O�֡H�֥s�ڡH���n���_�ڪ��H��KB.�ګ��I�ڪ��D�A�K�A�Q�Ѧ��ӹL�K���ѤS�Ӱա�
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Rand = DW_Rand(2)
	AdjustFaceDir( OwnerID(), TargetID(), 0 ) 
	sleep( 5)
	PlayMotion (OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Yell( OwnerID() , Str[Rand], 2)
	if Rand == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , 748 )
	end
	sleep( 30 )
	SetDir( OwnerID(), Dir )
	sleep( 5 )
	DisableQuest( OwnerID() , false )
end

function LuaS_113168_2C()
	local BattleMushroom = LuaFunc_CreateObjByObj( 102300 , OwnerID() )
	Hide( OwnerID() )
	WriteRoleValue( BattleMushroom , EM_RoleValue_PID , TargetID() )
	BeginPlot( BattleMushroom , "LuaS_113168_2C_Battle" , 0 )
	while 1 do
		if CheckID( BattleMushroom ) == false then
			break
		end
		sleep( 10 )
	end
	sleep( 150 )
	Show( OwnerID() , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	DisableQuest( OwnerID() , false )
end

function LuaS_113168_2C_Battle()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	Yell( OwnerID() ,"[SC_422474_6]" , 3 ) --�A�O����H�H�J�I�̡I���J�I�̡I
	if CheckID( Player ) == true and CheckRelation( OwnerID() , Player, EM_CheckRelationType_Attackable  ) == true then
		SetAttack( OwnerID() , Player )
	end
	while 1 do
		if HateListCount( OwnerID() ) == 0  and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
			break
		else
			sleep( 30 )
		end
	end
	Delobj( OwnerID() )
end

------------���� 422479 �լd����------------
function LuaI_422479_0()
	SetPlot( OwnerID() , "range" , "LuaI_422479_1" , 50 )
end

function LuaI_422479_1()
	if CheckAcceptQuest( OwnerID() , 422479 ) == true and CheckFlag( OwnerID() , 542873 ) == false then
		SetPlot( TargetID()  , "range" , "" , 0 )
		BeginPlot( TargetID() , "LuaI_422479_2" , 0 )
	end
	if CheckCompleteQuest( OwnerID() , 422479 ) == true or CheckFlag( OwnerID() , 542873 ) == true then
		if CheckCompleteQuest( OwnerID() , 422489 ) == false then
			if CheckAcceptQuest( OwnerID() , 422489 ) == false and CountBodyItem( OwnerID(), 205261 )<1 then
			   SetPlot( TargetID()  , "range" , "" , 0 )
			   BeginPlot( TargetID() , "LuaI_422479_2" , 0 )
			end
		end
	end
end

function LuaI_422479_2()
	local BadGuy = CreateObjByFlag(  102302 , 780375 , 1 , 1)
	SetRoleCamp( BadGuy , "Visitor" )
	AddToPartition( BadGuy , 0 )
	SetPlot( BadGuy , "dead" , "LuaI_422479_Dead" , 0 )
	PlayMotion( BadGuy ,ruFUSION_ACTORSTATE_THROW )
	Yell( BadGuy , "[SC_422479_0]" , 5 ) --�h���I���a�I�M�������H�K
	if CheckAcceptQuest( TargetID()  , 422479 ) == true and CheckFlag( TargetID() , 542873 ) == false then
		SetFlag( TargetID() , 542873 , 1 )
	end
	sleep( 20 )
	Hide( BadGuy )
	SetRoleCamp( BadGuy , "Monster" )
	Show( BadGuy , 0 )
	Yell( BadGuy , "[SC_422479_1]" , 5 ) --�V�F�I���H�I
	SetAttack( BadGuy , TargetID() )
	BeginPlot( BadGuy , "LuaI_422479_3" , 0 )
	while 1 do
		if CheckID( BadGuy ) == false then
			break
		end
		sleep( 10 )
	end
	SetPlot( OwnerID() , "range" , "LuaI_422479_1" , 30 )
end

function LuaI_422479_3()
	LuaFunc_Obj_Suicide(100)
end

function LuaI_422479_Dead()
	local PlayerNum = HateListCount( OwnerID() ) -1
	for i = 0 ,  PlayerNum , 1 do
		local PPL = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if CountBodyItem( PPL , 205261 ) == 0 and CheckCompleteQuest( PPL , 422489 ) == false and GetDistance( OwnerID() , PPL ) < 300 then
				if CheckCompleteQuest( PPL , 422479 ) == true or CheckAcceptQuest( PPL , 422479 ) == true then
					ScriptMessage(  PPL ,  PPL , 0 , "[SC_422479_2]" , 0 ) --�A�q[102302]���W��X�@��[205261]
					ScriptMessage(  PPL  ,  PPL  , 2 , "[SC_422479_2]" , 0 )
					GiveBodyItem( PPL , 205261 , 1 )
				end
		end
	end
	return true
end

----------���� 422489 �ìV���������� ----------------------------------------
function LuaI_205261_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail(422489, 1 ) )
	ShowBorder( OwnerID(), 422489, str , "ScriptBorder_Texture_Paper" )	
end

----------���� 422486 ���H���K��  ----------------------------------------
function LuaI_205362_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail(422486, 1 ) )
	ShowBorder( OwnerID(), 422486, str , "ScriptBorder_Texture_Paper" )	
end

---------���� 422480 ���U���H�� -------------------------------------------------
function LuaS_113190_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID() , 422481 ) == true and CheckFlag( OwnerID() , 542874 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422480_0]" ,"LuaS_113190_1", 0 ) --��[113190]���i�H�}�l�F
	end
	if	CheckAcceptQuest(OwnerID(),422721)	and
		CountBodyItem(OwnerID(),205839)<1	 then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422721_0]","LuaS_422721_1", 0 )
	end
end

function LuaS_113190_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_113190_2" , 0 )
end

function LuaS_113190_2()
	local Player = TargetID()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) 
	Yell( OwnerID() , "[SC_422480_1]"  , 3 ) --���ڴN�}�l�o�I���U�A�F�C
	sleep( 30 )
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_422480_2]" , 0 ) --[113190]�o�X�_�S���I�S�n
	ScriptMessage( OwnerID() , TargetID(), 2 , "[SC_422480_2]" , 0 )
	sleep(10)
	local Guard = {}
	for i = 1 , 2 , 1 do
		Guard[i] = CreateObjByFlag(  102223 , 780375 , 1+i , 1)
		SetRoleCamp( Guard[i] , "Visitor" )
		AddToPartition( Guard[i] , 0 )
		MoveToFlagEnabled( Guard[i] , false )
		SetPlot( Guard[i] , "dead" , "LuaS_113190_Dead" , 0 )
		BeginPlot( Guard[i] , "LuaS_113190_Battle" , 0 )
		WriteRoleValue( Guard[i] , EM_RoleValue_PID , OwnerID() )
		WriteRoleValue( Guard[i] , EM_RoleValue_Register , Player )
		WriteRoleValue( Guard[i] , EM_RoleValue_Register +1 , 3+i )
		WriteRoleValue( Guard[i] , EM_RoleValue_IsWalk , 0 )
	end
	while 1 do
		if ( CheckID( Guard[1] ) == false or ReadRoleValue( Guard[2] , EM_RoleValue_IsDead) == 1 ) and ( CheckID( Guard[2] ) == false or ReadRoleValue( Guard[2] , EM_RoleValue_IsDead) == 1 ) then
			break
		end
		sleep( 10 )
	end
	sleep(10)
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) >= 2 and CheckID( Player ) == true then
		local Party = LuaFunc_PartyData(Player)
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 422481 ) == true and GetDistance( Party[i] , OwnerID()) < 300 then
				SetFlag( Party[i] , 542874 , 1 )
			end
		end
	end
	DisableQuest(OwnerID() ,false )
end

function LuaS_113190_Dead()
	local King = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	if CheckID( King ) == true and ReadRoleValue( King , EM_RoleValue_OrgID ) == 113190 then
		local PID = ReadRoleValue( King , EM_RoleValue_PID ) +1
		WriteRoleValue( King , EM_RoleValue_PID , PID )
	end 
	return true
end

function LuaS_113190_Battle()
	local Flag = ReadRoleValue( OwnerID() , EM_RoleValue_Register +1 )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local X = GetMoveFlagValue( 780375  , Flag , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780375  , Flag , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780375  , Flag , EM_RoleValue_Z )
	if Flag > 4 then
		Yell( OwnerID() , "[SC_422480_3]" , 3 ) --�֡I���å�S�}�l�j�x�F�I
	end
	Move( OwnerID(),  X , Y , Z )
	Sleep( 30) 
	if Flag < 5 then
		Yell( OwnerID() , "[SC_422480_4]" , 3 ) --�p�ߡI���H���I
	end
	Hide( OwnerID() )
	SetRoleCamp( OwnerID() , "Monster" )
	Show( OwnerID() , 0 )
	MoveToFlagEnabled( OwnerID() , true )
	SetAttack( OwnerID() , Player )
	while 1 do
		if HateListCount( OwnerID() ) == 0  and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
			break
		else
			sleep( 30 )
		end
	end
	DelObj( OwnerID() )
end

---------���� 422488 �k�X�o�ƨg���a�� -------------------------------------------------
function LuaS_113191_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422488 ) == true and CheckFlag( OwnerID() , 542879 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422488_0]" ,"LuaS_113191_1", 0 ) --�X�o
	end
	if	CheckAcceptQuest(OwnerID(),422721)	and
		CountBodyItem(OwnerID(),205839)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422721_0]","LuaS_422721_3", 0 )
	end
end

function LuaS_113191_1()
	CloseSpeak(OwnerID())
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_113191_2" , 0 )
end

function LuaS_113191_2()
	local Dummy = LuaFunc_CreateObjByOBj( 113192 , OwnerID() )
	Hide( OwnerID() )
	MoveToFlagEnabled( Dummy , false )
	WriteRoleValue( Dummy , EM_RoleValue_PID , TargetID() )
	BeginPlot( Dummy , "LuaS_113191_3" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(Dummy) == false or ReadRoleValue( Dummy , EM_RoleValue_OrgID ) ~= 113192 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )	
end

function LuaS_113191_3()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Me = Role:new( OwnerID() )
	local Pos ={["X"] = Me:X() , ["Y"] = Me:Y() , ["Z"] = Me:Z() , ["Dir"] = Me:Dir() }
	local X = GetMoveFlagValue( 780375  , 6 , EM_RoleValue_X )
	local Z = GetMoveFlagValue( 780375  , 6 , EM_RoleValue_Z )
	local Result = "Success"	
	local Party = LuaFunc_PartyData(Player)

	for i = 1 , Party[0] , 1 do
		if CheckAcceptQuest( Party[i] , 422488 ) == true and CheckFlag(Party[i] , 542879 ) == false and GetDistance(Party[i] , OwnerID() ) < 100 and ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
			AddBuff( Party[i] , 503940 , 1 , 10 )
		end
	end

	SetFollow( OwnerID() , Player )

	while 1 do
		sleep(30)

		for i = 1 , Party[0] , 1 do
			if CheckID( Party[i]  ) == false or CheckBuff( Party[i]  , 503940 ) == false then
				Result = "Fail"
			else
				Party = LuaFunc_PartyData(Party[i])
				Result = "Success"
				break
			end
		end

		if ( Me:X() - X ) ^ 2 + ( Me:Z() - Z ) ^2 <= 10000 or Result == "Fail" then
			break
		else
			for i = 1 , Party[0] , 1 do
				if CheckAcceptQuest( Party[i] , 422488 ) == true and CheckFlag(Party[i] , 542879 ) == false and GetDistance(Party[i] , OwnerID() ) < 100 and ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
					AddBuff( Party[i] , 503940 , 1 , 10 )
				end
			end
		end
	end

	if Result == "Fail" then
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 422488 ) == true and CheckFlag(Party[i] , 542879 ) == false then
				ScriptMessage( Party[i] , Party[i] , 1 , "[SC_422488_1]" , 0 ) --�@�e[113191]����
				ScriptMessage( Party[i] , Party[i] , 0 , "[SC_422488_1]" , 0 )
			end
		end
		Yell( OwnerID() , "[SC_422488_2]" , 3 ) --���I�V�F......�ڳ̦n�^���Ӫ��a����_��......
		SetFollow( OwnerID() , OwnerID() )
		Move( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] )
		sleep( 50 )
	else
		Yell( OwnerID() , "[SC_422488_3]" , 3 ) --��o��ڴN�i�H�ۤv����X�h�F�A���§A�C
		PlayMotion (OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		sleep( 30 )
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 422488 ) == true and CheckBuff(Party[i] , 503940 ) == true then
				CancelBuff_NoEvent( Party[i] , 503940 )
				SetFlag( Party[i] , 542879 , 1 )
			end
		end 
		Move( OwnerID() , X , Me:Y()  , Z )
		sleep( 50 )
	end
	Delobj( OwnerID() )
end

---------------------------------------------------------------------------------------------------