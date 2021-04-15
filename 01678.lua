function LuaS_113948()
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_0]" , "LuaS_113948_Speak1" , 0 )	-- �u�G�H�B���F...�U�ھ��v�媫�X�{�b�o�̡A��ı�o�����ߡC�v
	end

end
function LuaS_113948_Speak1()
	local QuestID = 422851

	SetSpeakDetail( OwnerID() , "[SC_422851_1]" )	-- �A���o�Ǫ��~�O�ݩ�U�ڪ��H�C��ݨӳ����y�������v�ڡI�_�I�̡A�j�Ѫ��F��`�a���ڭ̤��F�Ѫ��O�q�A�]�\�O�o�Ǫ��~�v�T�F�ڭ̪����ˬW�A�Ʀܦ]���y�����F�O�q���Ť]���L�i��......
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_2]" , "LuaS_113948_Speak2" , 0 )	-- �u�P�պ��ĺ��A�ڥi�H�`�۳o�ǽu���~��լd�C�v
	end
end
function LuaS_113948_Speak2()
	SetSpeakDetail( OwnerID() , "[SC_422851_3]" )	-- �n�A�A�h�d�@�U�o���O�֩�b���ˬW���䪺�A�Y�O���̪��i�h�̰����˨S�ơA�ڬ۫H���̪��i�h���O�n�i�h�A���|���X�a�ƨӡA�N�Ȧ��ǪF��O�Ӹ��������A�����D�N�j�F�C
end

function LuaS_113989()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false and CheckFlag( OwnerID() , 543537 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113989_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113989_Speak()
	local ItemID = 206378	-- �u���@�G�G�H�����Y
	local KeyItemID = 543537	-- �٦^�u���@
	local Message = "[SC_GIVEITEMTOSOMEONE][$SETVAR1=[206378]][$SETVAR2=[113989]]"

	if CountBodyItem( OwnerID() , ItemID ) >= 1 then
		if DelBodyItem( OwnerID() , ItemID , 1 ) == true then
			SetSpeakDetail( OwnerID() , "[SC_422851_4]" )	-- �o�O�ڪ��B�o�O�ڪ��I�a�J�I�����ڭ̪��کԧJ�٤����A�٭n�m�ڪ��a�ǩ��Y�A�ٵ��ڡI
			ScriptMessage( OwnerID() , OwnerID() , 1 , Message , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , Message , C_SYSTEM )

			SetFlag( OwnerID() , KeyItemID , 1 )
			LuaS_422851_CheckComplete()	-- �P�_�O�_�|�ӽu�����٦^
		end
	else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
	end
end

function LuaS_113990()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false and CheckFlag( OwnerID() , 543538 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113990_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113990_Speak()
	local ItemID = 206379	-- �u���G�G���F���J
	local KeyItemID = 543538	-- �٦^�u���G
	local Message = "[SC_GIVEITEMTOSOMEONE][$SETVAR1=[206379]][$SETVAR2=[113990]]"

	if CountBodyItem( OwnerID() , ItemID ) >= 1 then
		if DelBodyItem( OwnerID() , ItemID , 1 ) == true and CheckFlag( OwnerID() , KeyItemID ) == false then
			SetSpeakDetail( OwnerID() , "[SC_422851_5]" )	-- �ڭ��P�٪i�h�{���A�����R�ɱN�̬öQ�����~���X�ө�b���ˬW��A���󯪥��]�@�_�ѻP�C�o�O�ڪ��a�Ǥ��J�ڡA�A�������H�S���Y�A�A���F�ѧڭ̪��߫U�A�ٵ��ڴN�n�F�C
			ScriptMessage( OwnerID() , OwnerID() , 1 , Message , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , Message , C_SYSTEM )
			SetFlag( OwnerID() , KeyItemID , 1 )
			LuaS_422851_CheckComplete()	-- �P�_�O�_�|�ӽu�����٦^
		end
	else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
	end
end

function LuaS_113991()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false and CheckFlag( OwnerID() , 543539 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113991_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113991_Speak()
	local ItemID = 206380	-- �u���T:�H���u���~
	local KeyItemID = 543539	-- �٦^�u���T
	local Message = "[SC_GIVEITEMTOSOMEONE][$SETVAR1=[206380]][$SETVAR2=[113991]]"

	if CountBodyItem( OwnerID() , ItemID ) >= 1 then
		if DelBodyItem( OwnerID() , ItemID , 1 ) == true then
			SetSpeakDetail( OwnerID() , "[SC_422851_6]" )	-- �ڪ��a���_�����b�A��W�H���i�O�ڥ@�N�������H�U�o�A�֩�^���ˬW����I
			ScriptMessage( OwnerID() , OwnerID() , 1 , Message , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , Message , C_SYSTEM )
			SetFlag( OwnerID() , KeyItemID , 1 )
			LuaS_422851_CheckComplete()	-- �P�_�O�_�|�ӽu�����٦^
		end
	else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
	end
end

function LuaS_113992()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false and CheckFlag( OwnerID() , 543540 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113992_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113992_Speak()
	local ItemID = 206381	-- �u���|:���H������
	local KeyItemID = 543540	-- �٦^�u���|
	local Message = "[SC_GIVEITEMTOSOMEONE][$SETVAR1=[206381]][$SETVAR2=[113992]]"

	if CountBodyItem( OwnerID() , ItemID ) >= 1 then
		if DelBodyItem( OwnerID() , ItemID , 1 ) == true then
			SetSpeakDetail( OwnerID() , "[SC_422851_7]" )	-- �����R�N�n�}�l�F�A�ڪ��a�ǰ��éO�H�S�F���áA�����̭n���ѻP�O�H�ګ����I�A���ڧ��աH���§A�աC
			ScriptMessage( OwnerID() , OwnerID() , 1 , Message , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , Message , C_SYSTEM )
			SetFlag( OwnerID() , KeyItemID , 1 )
			LuaS_422851_CheckComplete()	-- �P�_�O�_�|�ӽu�����٦^
		end
	else
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
	end
end

function LuaS_113993()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113993_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113993_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_8]" )	-- �S�H�йL�A�a�W���F�褣�n�þߡH�A�û������D�A�|�ߨ줰��j�·СI�ڷ|�n�ۧA���A�s���کԧJ���_�I�̡C

end

function LuaS_113994()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113994_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113994_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_9]" )	-- �O���L�աA���O�ڹj���F�~���A�L�Ѥ������A�_�������o�F�A���|�b�A���̰ڡH
end

function LuaS_113995()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113995_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113995_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_10]" )	-- �n�����L�A�S�n���S���L�C�I
end

function LuaS_113996()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113996_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113996_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_11]" )	-- �o�O�O�H�a���_���a�H�ڮa����b���ˬW��A���ӳ����ܦn�ݧa�I
end

function LuaS_113997()	-- 422851�a���_���H
	local QuestID = 422851

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , QuestID ) == true and CheckFlag( OwnerID() , 543472 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_422851_13]" , "LuaS_113997_Speak" , 0 )	-- �A���L�o�ǪF��ܡH
	end
end
function LuaS_113997_Speak()
	SetSpeakDetail( OwnerID() , "[SC_422851_12]" )	-- �A�������ǪF�賣�O�n�e�ڪ��ܡH
end

function LuaS_422851_CheckComplete()
	if CheckFlag( OwnerID() , 543537 ) == true and 
	   CheckFlag( OwnerID() , 543538 ) == true and 
	   CheckFlag( OwnerID() , 543539 ) == true and 
	   CheckFlag( OwnerID() , 543540 ) == true then
		SetFlag( OwnerID() , 543472 , 1 ) 	-- ���a�Ǯa�_���լd
	end
end
--==================================================================================================================
function LuaI_113998()	-- ��l�����P���ĺ�
	local BodoShamanID = { 113948 , 113999 , 114000 , 114001 , 114002 , 114003 }
	local BodoShaman = {}
	local FlagID = 780519
	local BodoBronFlag = { 1 , 2 , 3 , 4 , 5 , 6 }	-- ���ͪ��X�Ц�m
	local RoomID = 0

	for i = 1 , 6 do
		BodoShaman[i] = CreateObjByFlag( BodoShamanID[i] , FlagID , BodoBronFlag[i] , 1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+i , BodoShaman[i] )		-- �N���ͥX�Ӫ��P���ĺ��O�첣�;��W��
		SetModeEx( BodoShaman[i] , EM_SetModeType_Gravity , false )	-- �L���O
		AddToPartition( BodoShaman[i] , RoomID )
		MoveToFlagEnabled( BodoShaman[i] , false )			-- �������޼@��
		Sleep( 1 )
	end

	WriteRoleValue( BodoShaman[1] , EM_RoleValue_PID , OwnerID() )		-- �N���;��O���P�պ����W

end

function LuaS_422852()

	DisableQuest( OwnerID() , true )	-- ��������

	local RoomID = 0

	local BodoLeader = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	-- �q�P�պ����WŪ�����;���GID

	local BodoShaman = {}			-- ���^��L�P���ĺ���GID
	for i = 1 , 6 do
		BodoShaman[i] = ReadRoleValue( BodoLeader , EM_RoleValue_Register+i )
		BeginPlot( BodoShaman[i] , "LuaS_422852_BodoShow" , 0 )
		Sleep( 1 )
	end

	Sleep( 10 )
	CastSpell( BodoShaman[1] , BodoShaman[1] , 494746 )	-- �������{ �S��
	Sleep( 20 )
	local BodoX = ReadRoleValue( BodoShaman[1] , EM_RoleValue_X )
	local BodoY = ReadRoleValue( BodoShaman[1] , EM_RoleValue_Y )
	local BodoZ = ReadRoleValue( BodoShaman[1] , EM_RoleValue_Z )
	local BodoDir = ReadRoleValue( BodoShaman[1] , EM_RoleValue_Dir )

	SetIdleMotion( BodoShaman[1] , ruFUSION_ACTORSTATE_COMBAT_1H )	-- ���ܹw�]�ʧ@ �԰�
--	for i = 1 , 20 do	-- �P�պ��B�_
--		SetPos( BodoShaman[1] , BodoX , BodoY+i , BodoZ , BodoDir )
--		DelFromPartition( BodoShaman[1] )			-- �ϥ�Partition�ӧ�s��m�A���K���_�L���W�Ҧ���Script
--		AddToPartition( BodoShaman[1] , RoomID )
--		Sleep(1)	-- �S��Sleep�|����
--	end
	local Sleeptime = MoveDirect( BodoShaman[1] , BodoX , BodoY+10 , BodoZ )
	sleep( Sleeptime + 10 )
	local Sleeptime = MoveDirect( BodoShaman[1] , BodoX , BodoY+20 , BodoZ )
	sleep( Sleeptime + 10)
	BeginPlot( BodoShaman[1] , "LuaS_422852_BodoFly" , 0 )	-- �B�_�@������S��

	PlayMotionEX( BodoShaman[2] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[2] , "[SC_422852_0]" , 2 )	-- �^�D���A�������������C�^�D���A�`��`�s�`�b�C
	Sleep( 30 )

	PlayMotionEX( BodoShaman[3] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[3] , "[SC_422852_1]" , 2 )	-- ���e�d���A���c����C
	Sleep( 30 )

	PlayMotionEX( BodoShaman[4] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[4] , "[SC_422852_2]" , 2 )	-- �P�I~~�|�U�ڤ���A�ظT����C
	Sleep( 30 )

	PlayMotionEX( BodoShaman[6] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[6] , "[SC_422852_3]" , 2 )	-- ����~~�����𤧭T�A�ݵ��O���ޡC
	Sleep( 30 )

	PlayMotionEX( BodoShaman[5] , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	Yell( BodoShaman[5] , "[SC_422852_4]" , 2 )	-- �I��~~�I��~~
	Sleep( 30 )

	Yell( BodoShaman[1] , "[SC_422852_15]" , 2 )	-- �P�I�I~~�I����~~��~~
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422852_5]" , C_SYSTEM )	-- (�@�ػa��y�����s�b�z�L�ĺ����ܡA͢���F�ܦh�A�A�u�ஷ���䤤�X�y���N��)
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_422852_5]" , 0 )
	Sleep( 30 )
	Yell( BodoShaman[1] , "[SC_422852_16]" , 2 )	-- �P�I�P�P~~���I~~�㫦~~
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422852_6]" , C_SYSTEM )	-- (�A�V�O�nť�M�A�o�uť���I�I�����n)
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_422852_6]" , 0 )
	Sleep( 30 )

	PlayMotionEX( BodoShaman[2] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[2] , "[SC_422852_7]" , 2 )	-- �Ať���������٥ܶܡH�����A�N���ڭ̬��A�����a�I
	Sleep( 30 )

	PlayMotionEX( BodoShaman[4] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[4] , "[SC_422852_8]" , 2 )	-- �����O�ë��s�b�A�d�~���e͢���b�o�̬ݨ��K�K
	Sleep( 30 )

	PlayMotionEX( BodoShaman[3] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[3] , "[SC_422852_9]" , 2 )	-- �λ����P���H�ءA�L�׬O�i�h�B���F�٬O�H���C
	Sleep( 30 )

	PlayMotionEX( BodoShaman[5] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[5] , "[SC_422852_10]" , 2 )	-- �L�̵L���������t���A�������U�߫��K�K
	Sleep( 30 )

	PlayMotionEX( BodoShaman[6] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[6] , "[SC_422852_11]" , 2 )	-- ���F���ר��c���O�q�A�P�ߨ�O�B���Ȩ��W�C
	Sleep( 30 )

	PlayMotionEX( BodoShaman[2] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[2] , "[SC_422852_12]" , 2 )	-- �j���U�ا��ơA�سy�_�O�q�j�j���̻١K�K
	Sleep( 30 )

	PlayMotionEX( BodoShaman[3] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[3] , "[SC_422852_13]" , 2 )	-- ���j�����ɦb���H�w�I���ݰ_�F�C
	Sleep( 30 )

	PlayMotionEX( BodoShaman[4] , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	Yell( BodoShaman[4] , "[SC_422852_14]" , 2 )	-- �o�ӫٰ̻��F�O��ꪺ�O�١A��O���j�ͽ˪����ҡC
	Sleep( 30 )

	--for i = 20 , 1 , -1 do		-- �P�պ����U
	--	SetPos( BodoShaman[1] , BodoX , BodoY+i-1 , BodoZ , BodoDir )
	--	DelFromPartition( BodoShaman[1] )			-- �ϥ�Partition�ӧ�s��m�A���K���_�L���W�Ҧ���Script
	--	AddToPartition( BodoShaman[1] , RoomID )
	--	Sleep(1)
	--end
	Sleeptime = MoveDirect( BodoShaman[1] , BodoX , BodoY , BodoZ )
	sleep( Sleeptime + 20)
	SetPos( BodoShaman[1] , BodoX , BodoY , BodoZ , BodoDir )
	for i = 1 , 6 do
		SetIdleMotion( BodoShaman[i] , ruFUSION_ACTORSTATE_NORMAL )	-- ���ܹw�]�ʧ@ �@��
		DelFromPartition( BodoShaman[i] )				-- ���Ҧ����P���ĺ�����ʧ@
		AddToPartition( BodoShaman[i] , RoomID )
		Sleep( 1 )
	end

	SetFlag( TargetID() , 543473 , 1 )	-- �������� ���ȧ����X��

	DisableQuest( OwnerID() , false )	-- �}�Ҥ���

end
function LuaS_422852_BodoShow()
	while true do
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP )	-- �i�h�n�\�R
		Sleep( 30 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CHANNEL_END )
		Sleep( 5 )
	end
end
function LuaS_422852_BodoFly()
	while true do
		CastSpell( OwnerID() , OwnerID() , 493668 )	-- ������¶ �S��
		Sleep(15)
	end
end