function LuaS_111256_0()
	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Flag = {[1] = 541313 ,[2] = 541314 , [3] = 542297 , [4] = 541315 ,[5] = 541316 ,[6] = 541317 ,[7]=542498, [8] = 542744 ,[9] = 542997 , [10] = 541318 ,[11] = 541319 , [12] = 542557, [31]=546255 }
	if Area > 99 or Area < 1 then
		LoadQuestOption( OwnerID() )		
	else
		SetSpeakDetail( OwnerID() , GetString("SC_111256_0") )--�I��p�l�A�A�Q������ֻ��F�ڡA�i�O�ܨS�@�ߪ��C
		if CheckFlag( OwnerID() , Flag[Area] ) == false then
			SetFlag( OwnerID() , Flag[Area] , 1)
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111256_OT"), C_SYSTEM );
		end
		if CheckFlag( OwnerID()  , 540001 ) == false then
			SetFlag( OwnerID()  , 540001 , 1 )
		end
		--2012/09/17�s�W�ѨM�y���b�~���G�H���W�S���^�a�X�ЮɡA�Ϊ������^�a�X�СC
		local Race = ReadRoleValue( OwnerID(), EM_RoleValue_RACE ) 
		local goHomeFlag = CheckFlag( OwnerID()  , 546255 ) 
		if Race == 2 and goHomeFlag == false then
			SetFlag( OwnerID()  , 546255, 1 )
		end
		--2012/09/17 end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); --�ǰe�O����H
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SC_111256_S") , "LuaS_111256_S", 0 ); --�ڭn�N�^�{�N�a�I�n�O��
		if CheckBuff( OwnerID() , 501638 ) == false then
			LuaS_Area_List(Area,Flag)
		end
	end
	--2012/09/04�A���ѨMzone2���ر��z�����D�A���s�����Fzone2���ϰ�A�N���ֶǰe���ϰ�[�J�U�@��,LuaS_111256_Additional
	--�o�ӥu�O�ȮɸѨMzone2�������A�N�Ӧp�G�٭n�s�W�ϰ�A�Х[�J�U�@�������A�έ��s�g�@�o��script
	--���ȮɥΪ����^�צ�5.0.0	�H�W by ����
	if Area == 2 then
		if 	CheckFlag( OwnerID() , Flag[3] ) == true or
			CheckFlag( OwnerID() , Flag[4] ) == true or
			CheckFlag( OwnerID() , Flag[12] ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_205764_2]" ,"LuaS_111256_Additional", 0 ); --�U�@��
		end
	end
end
--2012/09/04�A���ѨMzone2���ر��z�����D�A���s�����Fzone2���ϰ�A�N���ֶǰe���ϰ�[�J�U�@��,LuaS_111256_Additional
--�o�ӥu�O�ȮɸѨMzone2�������A�N�Ӧp�G�٭n�s�W�ϰ�A�Х[�J�U�@�������A�έ��s�g�@�o��script
--���ȮɥΪ����^�צ�5.0.0
function LuaS_111256_Additional()
	local Flag = {[3] = 542297 , [4] = 541315 , [12] = 542557 }
		SetSpeakDetail( OwnerID() , GetString("SC_111256_0") )--�I��p�l�A�A�Q������ֻ��F�ڡA�i�O�ܨS�@�ߪ��C
		if CheckFlag( OwnerID() , Flag[4] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_4") , "LuaS_111256_4", 0 ); --�ǰe����r��
		end
		if CheckFlag( OwnerID() , Flag[3] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_3") , "LuaS_111256_3", 0 ); --�ǰe��o�󫰹�
		end
		if CheckFlag( OwnerID() , Flag[12] ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_111256_12]"  , "LuaS_111256_12", 0 ); --�ǰe�컷�椧�I
		end
		AddSpeakOption( OwnerID(), TargetID(),  "[SO_110068_2]" ,"LuaS_111256_0", 0 ); --��^�W�@��
end
--2012/09/04 end by ��
function LuaS_118586_0()
	LoadQuestOption(OwnerID())
	if CheckFlag( OwnerID() , 541314 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --�ǰe��Z��R����
	end
	if CheckBuff( OwnerID() , 501638 ) == false then
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10") , "LuaS_111256_10", 0 ); --�ǰe��㺸���Ӷ�
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_6") , "LuaS_111256_6", 0 ); --�ǰe����`�ۭn��
	end
end
function LuaS_111256_Q()

	SetSpeakDetail( OwnerID(), GetString("SC_111256_QD"));
	--�A�Q���D�Ѥl�O��ԣ���H
	--�I��ڰڡA�O��O�J��s�Ϊ��ǰe�v�F�W�r...�w�g�����n�F�C
	--
	--�A�u�n���D�A�ܩ��B�A��O�J��s�Τ��\�A�ϥΧڭ̪��ǰe�˸m�A�o���_���ڡ�u�n�A���D��L�˸m����m�A���N�i�H���A�ǰe��F�񪺦P�����˸m�C
	--���L�]���C���ϥη|�ӶO�@�w���]�O�A�ҥH�ڭ̥u���w�S�w�H�h�i�H�ϥΡA�ӥB�����I�O�ӥ��ŧڭ̪���X�F�ڡA�N�O�t�d�����B���O�B���a���H�C
	--�p�l�A���A�̳o�ر`�`�]�Ӷ]�h���_�I�̯���Q���\�ϥγo���_���A�n���h�P�E�I���D�ܡH
	--
	--�I���٦��A�A���D�^�{�N�ܡH��O�J��s�δN�O�]���A�ѥ;֦��o�˪��O�q�ҥH�~�|���\�A�ϥΧڭ̪��ǰe�˸m�C
	--...���M�ܳ·СA�����٬O�����@�U�n�F�C
	--�^�{�N�i�H�ϧA�^��A�]�O�������a�I�A���@�ӤH���]�O�u��O���b�@�Ӧa��F�ӭn����������즳�Y�ӯS��ޯ઺�H�F
	--�A�����A�A�n�P�E�A�]���ڴN���o�ا޳N�C
	--
	--���L��������ګܤ��n�A�ڬ�����o�K�O���ѳo���A��...�I���F�A�`���o�ǧ޳N�O�ܬöQ���A�A�n�ñ��ۨϥΰڡI

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_111256_0", 0 ); 	--�ڷQ�^���誺���

end

function LuaS_111256_S()

	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )

	if Area > 99 or Area < 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	local Point = {[1] = "ST_TRANSFER_2" , [2] = "ST_TRANSFER_9" , [3] = "ST_TRANSFER_13", [4] = "ST_TRANSFER_4" , [5] = "ST_TRANSFER_5" , [6] = "ST_TRANSFER_10" , [7] = "ST_TRANSFER_14" , [8] = "ST_TRANSFER_16" ,[9] = "ST_TRANSFER_17" , [10] = "ST_TRANSFER_11" ,[11] = "ST_TRANSFER_12" , [12] = "ST_TRANSFER_15" }
	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then

		if CheckAcceptQuest( OwnerID() , 420664 ) == true then	-- for �s��ɤޥ���
			SetFlag( OwnerID() , 540866 , 1 )	-- �����^�{�a�I�n�O
		end

		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString(Point[Area])  , C_SYSTEM )	--�e�������T���G�z�N�^�{�a�I�n�O�b�}���E���I
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString(Point[Area]) , 0 )	--�z�N�^�{�a�I�n�O�b�}���E���I
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--�e�������T���G�^�{�a�I�n�O���ѡI
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--�^�{�a�I�n�O���ѡI
	end

	CloseSpeak( OwnerID() );	--������ܵ���

end

function LuaI_111272_0()
	SetPlot(OwnerID() , "Range" , "LuaI_111272_1" , 20 )
end
function LuaI_111272_1()
	local n = 0
	local DialogStatus = 0
	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Flag = {[1] = 541313 ,[2] = 541314 , [3] = 542297 , [4] = 541315 ,[5] = 541316 ,[6] = 541317 ,[7]=542498, [8] = 542744 ,[9] = 542997 , [10] = 541318 ,[11] = 541319 , [12] = 542557 }
	if CheckFlag( OwnerID() , Flag[Area] ) == false then
		SetFlag( OwnerID() , Flag[Area] , 1)
	end
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_

		DialogCreate( OwnerID(), EM_LuaDialogType_Select , "Go TO Where ?" )
		local ResultGO = LuaS_Area_ListDialog(Area,Flag)
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		if( DialogSendOpen(OwnerID() ) == false ) then 
			ScriptMessage(OwnerID() ,OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
			return 0
		end

		while 1 do
			sleep( 1 )
			n = n + 1
			DialogStatus = DialogGetResult( OwnerID() )
			if n > 300 then -- ���L�a�j��A300 = �T�Q��
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			end
			
			if ( DialogStatus == 0 ) or ( DialogStatus == -1 ) then
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

				break
			elseif ( DialogStatus ~= -2 ) then
				--DialogStatus = DialogStatus + 1
				DialogClose(OwnerID() )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				BeginPlot(OwnerID() , ResultGO[DialogStatus] , 0)
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_111272_Close()
	--NO Action
	DialogClose(OwnerID() )
	CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
end