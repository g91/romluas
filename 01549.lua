function LuaS_113467_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420945 ) == true then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113467_A00]",  "LuaS_113467_A1",  0 ) --ť[ZONE_TITANS HILL]���ǻ�
	end
	if CheckAcceptQuest( OwnerID() , 420948 ) == true then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113467_B00]",  "LuaS_113467_B1",  0 ) --�߰���������ڪ��Ʊ�
	end
end

function LuaS_113468_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest( OwnerID() , 420944 ) == false and CountBodyItem( OwnerID() , 205946 ) == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113468_0]",  "LuaS_113468_1",  0 ) --�ˬd�O����F��b�o��
	end
end

function LuaS_113468_1()
	CloseSpeak( OwnerID() )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_113468_1]" , C_SYSTEM ) --�A�q�F�Ф��߰_�@��[205946]
	GivebodyItem( OwnerID() , 205946 , 1 )
end

function LuaS_113467_A1()
	SetSpeakDetail( OwnerID(),"[SC_113467_A01]")
	--���O�ܤ[�ܤ[���e���Ʊ��A���Ӯɭ�[ZONE_THE GREAT BARRIER]�������O�q���פF�D�H�V�L[ZONE_DAEMONS MOUTH]�A�ϧڭ̯���b�o���g�a�W�ͦs�ۡA���Ӯɭԧڭ̪��ڤH����w���a�ͬ��b�a���W�A���񦳵��״I�����P�y���A�ĩ��u�b[ZONE_DAEMONS MOUTH]���y�ʡC

	--�����즳�@�ѡA�����ӤF�A�@���N���ܤF�C

	AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113467_A02]",  "LuaS_113467_A2",  0 ) --�߰ݥ����O����
end

function LuaS_113467_A2()
	SetSpeakDetail(OwnerID(),"[SC_113467_A03]")
	--�����N�O�A�ݨ�[ZONE_TITANS HILL]�W��d�����ǥ��j�۹��C

	--���̬O���۪��۹��A�����F��H�Υ��j���O�q�A���̬O�ӲM���o���a��ݦs���o�c�A�l�ܵ۹L�h�c�]�̯d�U������ӨӡC

	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113467_A04]",  "LuaS_113467_A3",  0 ) --�߰ݤ���O�ݦs���o�c
end

function LuaS_113467_A3()
	SetSpeakDetail(OwnerID(),"[SC_113467_A05]")
	--�A�̥~�Ӫ̬ݨӨä����D�o�ӥ@�ɪ��L�h�C

	--�L�h�A�o�ӥ@�ɦ��ۤ@���H���M����͹�ܵ۴c�]���Ԫ��A�b�̮���A�Ϊv�۳o�����a���c�]�̫᪺���S�N�b���B�A�H�����M�R���F���S�H�δc�]�A�����a�����c�o�L�k�ڰ��A�ҥH�u�n�سy�F[[ZONE_THE GREAT BARRIER]]�A�N�Ҧ����c�ʦL�b�o���g�a�W�C

	--�ڭ̪������N�O���F�T�O[ZONE_THE GREAT BARRIER]���إߦӯd�b���B�A���׵ۨ��c�x�Ϊ��^���C

	--��F�A�ڭ�軡����F�H

	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113467_A06]",  "LuaS_113467_A4",  0 ) --�^�쥨�������D
end

function LuaS_113467_A4()
	SetSpeakDetail(OwnerID(),"[SC_113467_A07]")
	--��I�����A���̨ӳo�̧�M�L�h�c�]�d�U���O�q�ӨӡA���̭n�N���ǤO�q�ʦL�_�ӡA�קK���c�A���_�d�C

	--���L�����̤����D�o�̦��@�Y�I�Ϊ����s�A�����̵L�N������F�e�A�e������N���߱q�a�����A�����ڱq�e���O�q���X�{�A�Ӫ��]�����\�A�y���]�D���I�N�A�����̫h�Q���������������کҧ]���C

	--�ڭ̪������]�����b�a�U�Ӱk�L�F�@�T�A��ӯ��������}�}�ޡA�ݨ쪺�u�ѤU�@���J�g�H�Υ����̴��������e�A�N�s[ZONE_DAEMONS MOUTH]�ﭱ���D�H�]�������h�F�ܸ�C

	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113467_A08]",  "LuaS_113467_A5",  0 ) --�߰ݤ��s����
end

function LuaS_113467_A5()
	SetSpeakDetail(OwnerID(),"[SC_113467_A09]")

	--�o�����s�O�ƨg���A�e���U�@��������O�q�A���O���F���ѼĤH�A�]���O���F�O�@�ۤv�A��¬O���F�}�a�A���F����ۤv�ߤ������C
	--���s���O�q���_�q�e���餺����X�ӡA�j�a�W��B�M���F���K�C
	--�̫�A�e�ӺɤF�Ҧ����O�q�A�Y���b[ZONE_TOWER OF RAGE]������A��F�I�N�O�A�̩һ���......[ZONE_GESTEROS SHRINE]�C
	--���e���O�q���d�b�o���j�a�A���Ǩ`���������N�O�e����G�A�y�U���¦⩥�۴N�O�e������C

	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113467_A10]",  "LuaS_113467_A6",  0 ) --�߰ݤ����ڪ���
end

function LuaS_113467_A6()
	SetSpeakDetail(OwnerID(),"[SC_113467_A11]")

	--�����ڡA�X�{����N�S���A�^��a���A�{�b���Ϊv�ۿĩ��A�A�Ʀܥi�H�b[ZONE_DAEMONS MOUTH]�ݨ����̪��ܸ�A�A�̺٥��̬����]�C
	--���F�ͦs�A�ڭ̱ڤH��ӾǷ|�P�����ڬ۳B����k�A�ڭ̦V���̪�ܷq�ȡA�ӥ��̫h�i�D�ڭ̦b�o���j�a�ͦs�����ѡC
	--�ѩ��s������٦b�����餺�U�N�A�]�����̤����ݾ԰��C
	--�����̮ڥ����d�@�U�A�̻P�D�H���Ԫ��A�u���j�j���ĤH�~�ມ�����̯}�a������C

	if CheckAcceptQuest( OwnerID() , 420945 ) == true then
		SetFlag( OwnerID() , 543312 , 1 )
	end

end

function LuaS_113467_B1()
	SetSpeakDetail(OwnerID(),"[SC_113467_B01]")
	--�A�Q�ݤ����ڬ���|ŧ���A�̪��H�a......
	--�����ڥ��ӴN�O�x�ޯ}�a���O�q�A���̥��ӴN�J�n�ԤS�M�I�C
	--���u�n���I�ǥ��̪����A�h�b���|��������A�Ʀܥu�n�復�̪�ܷq�ȡA�����ٷ|�Ǳ§A���ѡA�ЧA�p���׶}�M�I�C
	--���L�N�⥦�̷|ŧ���H�A�ڤ]�q�Sť���L���̷|�ܨ����~......�]�����~�復�̨ӻ��S���N�q�A�Ҧ��F��̲׳��|�b���̤⤤���ơC
	--�ӥB�ڤ]���{�������ڬO�����L�H�����ϡA���̽ϥͩ��s�������A�����s��ź�ơA���i��̩�Q�����C
	--��......�γ\�u����ڸ߰ݤ����ڤ~���D���̬�����n�o�򰵡C
	--��P�����ڷ��q����k�u����ӡA�@�ӬO�����ڥl��A�A�A�g�Ѥ����ڪ��q�D��F���̪���a�C
	--�t�@�ӴN�O�z�L���姢���H�Φo�������l������ڪ��Ϫ̨�ӡC
	--�Ψ�L�覡�J������ڡA���̥u�|�N�A�N���J��......
	--
	--�p�G�A�̯�����姢���û��A�o�|������A�����w�����|�o��A�̷Q�n�����סC
	if CheckAcceptQuest( OwnerID() , 420948 ) == true then
		SetFlag( OwnerID() , 543314 , 1 )
	end
end

function LuaI_113467_SPEAK()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , DW_Rand(3) )
end

function LuaS_113467_SPEAK()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420948 ) == true then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113467_B00]",  "LuaS_113467_B2",  0 ) --�߰����������ŧ���H���Ʊ�
	end
end

function LuaS_113467_B2()
	local Str = {"[SC_113467_B02]" , "[SC_113467_B03]" , "[SC_113467_B04]"}
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	--�����ڡH���̬O[ZONE_DAEMONS MOUTH]������A�u�n���a��N���|�������......���D�A�̳o�ǥ~�Ӫ̤����D�ܡH�ڭ̹J�줣���D���Ʊ����|�h����ѾǲߡA�γ\�A�̤]���ӾǵۦV���̾ǲߤ~��C
	--�����������ڬO�ڭ̪����͡A���p�G�ڭ̫I�ǤF���̪����A���̴N�|�ܦ��ĤH�A�ҥH�ڭ̳Q�T��ӱ�������ڪ���a......�ԲӪ����ΧA�ݪ��ѥi��|����M���C
	--�����ګܮ��ƪ��I���M���ѻ����̬O�ڭ̪����͡A�����̯u���n���ưڡI�N�s�D�H�]�|���ߥ��̩O�I
	SetSpeakDetail(OwnerID(), Str[PID])
end

function LuaI_113468_0()
	SetModeEX( OwnerID() , EM_SetModeType_ShowRoleHead , false )	
	SetCursorType( OwnerID() , 37)
	AddBuff( OwnerID() , 502840 , 1 , -1 )	
end

function LuaI_113492_0()
	SetModeEX( OwnerID() , EM_SetModeType_ShowRoleHead , false )
	SetCursorType( OwnerID() , 37)
	AddBuff( OwnerID() , 504345 , 1 , -1 )
	AddBuff( OwnerID() , 504098 , 1 , -1 )
end

function LuaI_113495_0()
	AddBuff( OwnerID() , 504345 , 1 , -1 )
	local Me = Role:new( OwnerID() )
	local Auro = CreateObj( 113531 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1 )
	Lua_ObjDontTouch( Auro ) 
	AddToPartition( Auro , 0 )
end

function LuaS_113455_SUEZ_0()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 ) --��l�ƪ��a���W���Ȧs��

	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_01]") 
	--�����]�ڭ̩Ҫ������h�A���L���̬O�P�������������ͪ��o�I�O�L�e�m�ê��C
	--�]���ڭ̪��ؼЬO�D�H�A�]�����o�Ǥ����ͪ��ڭ̱Ĩ��H���ǧڡA�ڤ��ǤH���ǫh�A�ɶq�P���̫O���Z���C
	--��.......
	--�o�����ƥ󤤡A�ڪ����Ԧb���p���y��s�a�I���ɱo��F�L�̭��n����s���ơA�ӫ�N�b[ZONE_INFERNAL GATE]����D�쪢�]�����C
	--��ӴN���A���D���A�F��Q�ܨ��A�ӧڪ����Ԩ��F���ˡC
	--�p�G�O�ڪ����ԫI�Ǩ쪢�]����a�Ө�������A���ٮe�������A���o�䦳�X�Ӻ��I�C
	--�Ĥ@�A�L�h�S���L[ZONE_INFERNAL GATE]���񦳥X�{���]�����i�A�ڭ̪��H���e�]�`�`�g�L�o�����A�èS���o�͹L�������Ʊ��C
	--�ĤG�A�p�G�u���O�I�Ǩ쪢�]����a�A�����ӥu���H�|���ˡA�S���D�z�F��]�Q�m���A�o�P���e�Ҫ����������šC
	--����o�Өƥ�A������Q�k�H
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_02]",  "LuaS_113455_SUEZ_1",  0 ) --��F�N��
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_03]",  "LuaS_113455",  0 ) --�S���S�O���Q�k
end

function LuaS_113455_SUEZ_1()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_04]") --�A���N���O�H
	local Check = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	if Check - 10*math.floor( Check / 10 ) < 1 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_05]",  "LuaS_113455_SUEZ_2",  0 ) 
		--�N���G���]����a���b�X�i
	end
	if Check - 100*math.floor( Check / 100 ) < 10 then
		--�N���G���]���D�n�ت��O���o���Ӭ�s����
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_06]",  "LuaS_113455_SUEZ_3",  0 ) 
	end
	if Check - 1000*math.floor( Check / 1000 ) < 100 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_07]",  "LuaS_113455_SUEZ_4",  0 ) 
		--�N���G���]������p���y���ޱ�
	end
	if Check - 10000*math.floor( Check / 10000 ) < 1000 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_08]",  "LuaS_113455_SUEZ_5",  0 ) 
		--�N���G�Y�ӥ������H�����Ϫ��]ŧ������
	end
	if Check - 100000*math.floor( Check / 100000 ) < 10000 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_09]",  "LuaS_113455_SUEZ_6",  0 ) 
		--�N���G���]���欰�]���Y�ǭ�]�o�Ͳ���
	end
	if (Check - 100*math.floor( Check / 100 ) >= 10) and (Check - 10000*math.floor( Check / 10000 ) >= 1000) then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_10]",  "LuaS_113455_SUEZ_7",  0 ) 
		--�N���G���ӥ��`����h����o�Ӱϰ쪢�]������
	end
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_11]",  "LuaS_113455_SUEZ_0",  0 ) --���sť������
end

function LuaS_113455_SUEZ_2()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_13]") 
	--���]����a���b�X�i......
	--�o�@�I���M���O���i��A���o�L�k�������󥦭̰��F�����H�H�~�ٷm���F���Ӭ�s���ơC
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 1 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --���s���
end

function LuaS_113455_SUEZ_3()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_14]") 
	--�ڤ]�O�o��{���I
	--���L�ھڱ����A���Ӭ�s���Ʀ��G�O���p���y�q�o�̪��j�ѥ۹����W���U���C
	--�ڤ����ժ��]�ݭn�o�Ӭ�s���ư�����H
	--�γ\�o�ӪF��W�������򯵱K�A���J�M�w�g�Q�ܨ��F�A�{�b�ڭ̤]���i�ા�D�F�C
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 10 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --���s���
end

function LuaS_113455_SUEZ_4()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_15]") 
	--......�p�G�ĤH�u���x���F�j�j�������ͪ��A�o��ڭ̨ӻ���b���O�Ӧn�����C
	--���L[ZONE_TUMBLING VALLEY]��������ܡA�D�H���M���ФF�@�������]�A���o�Ǫ��]�ëD���ӧ@�ԡA�ӬO�Q��@���l�����q�ӷ��C
	--���ڭ̴��g�չL�}�a�D�H�������]���˸m�A���������]�|��D�H�i�}�����A�o�N��ĤH�u�������]����ʡA�ӵL�k���a���̡C
	--��M�A���ư����p���y���޳N�P�D�H�����P�A���L�ثe������p���y���������å���ܥ���L�̦���s�ޱ����]����k�C
	--�ӥB......�ڭ��s���������Ԧ^�����o�Ӭ�s���Ʀ��G�èS���^��L�̤⤤�C
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 100 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --���s���
end

function LuaS_113455_SUEZ_5()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_16]") 
	--�����H����......�o�O���Y�h���C
	--�S���������å�ڭ̮ڥ��S��k�P�w......
	--���L��ı�o�ܦ��i��A�]���ھڳ̷s�������A�o�Ӭ�s���Ʀ��G�èS���^����p���y���⤤�C
	--���o�̰��F�ڭ̻P�D�H�H�~�A�٦��֩O�H
	--�p�G�O�ĤH���ܡA�S�D�z�o���ڭ̪������٤��i������C
	--�p�G�O�ͭx���ܡA�o��Ƨ�S���D�z�C
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 1000 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --���s���
end

function LuaS_113455_SUEZ_6()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_17]") 
	--�Y�ǭ�]��......�O�����]�|�����]���}�ۤv����a�ӷm�ܧڭ̪����ԩO�H
	--�ӥB�A�ڭ̪����ԨӨө����A���u���o�@���D���쪢�]��ŧ���C
	--���Q�����өM�o���o�쪺��s���Ʀ���......
	--�γ\���]���欰�u�����P���e���P���a��A���ڻ{�����Ӧ��󪽱����z�ѻ����o�����ƥ�C
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 10000 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --���s���
end

function LuaS_113455_SUEZ_7()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_18]") 
	--����������......
	--�p�G����o��h�����]�������A���T�����M�@�Ǻ��I�C
	--���L�ѤW�O�������ѨèS��k�����ثe�ڭ̹J�쪺���p......�p�G����o�Ӧa�誺���]���x���H��߰ݬO�̦n�C
	--.......
	--�A�J�M���X�o�@�I�A�Ӥ��|���o��@�Ǭ����������a�H
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_19]",  "LuaS_113455_SUEZ_8",  0 ) --�i�D[113455]����[113467]�i�D�A���ǻ�
end

function LuaS_113455_SUEZ_8()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_20]") 
	--��H�o��ƧڭˬO�Ĥ@��ť���C
	--�o�˻��ӡA[ZONE_DIMARKA]�ܤ����Ӥ��P���]�������p......
	if CheckAcceptQuest( OwnerID() , 420947 ) == true then
		SetFlag( OwnerID() , 543313 , 1 )
	end
end

function LuaS_113470_0()
	LoadQuestOption( OwnerID() ) 
	if CheckAcceptQuest( OwnerID() , 420950 ) == true  and CheckFlag( OwnerID() , 543315 ) == false then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113470_0]",  "LuaS_113470_1",  0 ) --�}�l�լd
	end
end

function LuaS_113470_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) ~= 1 then
		DisableQuest( TargetID() , true )
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		BeginPlot( TargetID() , "LuaS_113470_2" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );
	end
end

function LuaS_113470_2()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID() , "LuaS_113470_3" , 0 )
	local Result = "false"
	for i = 1 , 180 , 1 do
		if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 0 then
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 2 then
			Result = "ok"
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
			Result = "false"
			break
		end
		sleep(10)
	end
	if Result ~= "false" then
		local Flag = 780435
		local Fire = CreateObjByFlag( 102665 , Flag , 1 , 1 )
		AddToPartition( Fire , 0 )
		SetPlot( Fire , "dead" , "LuaS_113470_Dead" , 0 )
		CallPlot( Fire , "LuaFunc_Obj_Suicide" , 30 )
		SetAttack( Fire , TargetID() )
		for i = 1 , 600 , 1 do
			if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then
				break
			end
			if CheckID( Fire ) == false or ReadRoleValue( Fire , EM_RoleValue_OrgID ) ~= 102665 then
				break 
			end
			sleep(10)
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	DisableQuest( OwnerID() , false )
end

function LuaS_113470_Dead()
	if CheckAcceptQuest( TargetID() , 420950 ) == true  and CheckFlag( TargetID() , 543315 ) == false then
		SetFlag( TargetID() , 543315 , 1 ) 
	end
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end

function LuaS_113470_3()
	local result = ""
	if BeginCastBar( OwnerID(), "[SC_113470_1]", 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 ) ~= 1 then
		return
	end	
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( OwnerID() );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- ���\
				result = "OKOK"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- ����
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
	if result == "OKOK" then
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 2 )
	else
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
	end
end

function LuaS_113471_0()
	if CheckAcceptQuest( OwnerID() , 420951 ) == true  and CheckFlag( OwnerID() , 543316 ) == false then
		SetSpeakDetail(OwnerID(), "[SC_113471_00]") --�A�{�b�ǳƦn�^���ڪ����D�F�ܡH
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_01]",  "LuaS_113471_1",  0 ) --�Цo�o��
	else
		LoadQuestOption( OwnerID() )
		if CheckCompleteQuest( OwnerID() , 420953 ) == true or CheckFlag( OwnerID() , 543342 ) == true then
			AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_28]",  "LuaS_113471_HOWGO",  0 ) --�߰ݦp���F���]���Ҧb�a
		end
	end
end

function LuaS_113471_HOWGO()
	SetSpeakDetail(OwnerID(), "[SC_113471_29]") --�����ڤw�g��\�A�ϥΥ��̪��D���A�u�n��J�e�誺�ĩ������A���K�N�|�e�A��F�����ڪ���a�C
end

function LuaQ_420950_Complete()
	DisableQuest( OwnerID() , true )
	local Flag = 780435
	AddBuff( TargetID() , 504004 , 1 , -1 )
	sleep(20)
	local Kenya = CreateObjByFlag( 113504 , Flag , 2 , 1 )
	AddToPartition( Kenya , 0 )
	MoveToFlagEnabled( Kenya , false )
	WriteRoleValue( Kenya , EM_RoleValue_IsWalk , 0 )
	Hide( Kenya )
	Show( Kenya , 0 )
	sleep( 10 )
	DW_MoveToFlag( Kenya ,Flag , 3  , 0 )
	AdjustFaceDir( Kenya , OwnerID(), 0 )
	sleep( 10 )
	CancelBuff_NoEvent( TargetID() , 504004 )
	Delobj( Kenya )
	DisableQuest( OwnerID() , false )
end

function LuaS_113471_1()
	SetSpeakDetail(OwnerID(), "[SC_113471_02]") 
	--����o���H���A�ЧA�i�D�ڬ���n�����o���H���H
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_03]",  "LuaS_113471_2",  0 ) --�^���G�ۤv�èS�������o���H��������
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_04]",  "LuaS_113471_3",  0 ) --�^���G��[113455]�ҰU�e�ӽլd
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_05]",  "LuaS_113471_4",  0 ) --�^���G�u�O�n�_
end

function LuaS_113471_2()
	SetSpeakDetail(OwnerID(), "[SC_113471_06]") 
	--���ڧ��ܧڪ����k�A�A�|�S�O�Ӧ����ӬO���F�o���H���A�ЧA�i�D�ڭ�]�C
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_04]",  "LuaS_113471_3",  0 ) --�^���G��[113455]�ҰU�e�ӽլd
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_07]",  "LuaS_113471_4",  0 ) --�^���G�u�O��n���L
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_08]",  "LuaS_113471_4",  0 ) --�^���G���F�@�ɩM��
end

function LuaS_113471_3()
	SetSpeakDetail(OwnerID(), "[SC_113471_09]") 
	--���ӥ~�Ӫ̪�����H�ڪ��D�L�C
	--�L������n�լd�o�ӸH���H
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_10]",  "LuaS_113471_4",  0 ) --�^���G�i�D�o[113455]�n�D�ۤv�O�K
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_11]",  "LuaS_113471_5",  0 ) --�^���G�i�D�o�Ʊ����g�L
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_12]",  "LuaS_113471_6",  0 ) --�^���G�s�y�@�ӥi�q�i�_���G�Ƨi�D�o
end

function LuaS_113471_4()
	SetSpeakDetail(OwnerID(), "[SC_113471_16]") 
	--......
	--�p�G�A���@�N�i�D�ڭ�]���ܡA���N��F�C
	--���ڦ��d���ݺ޳o���H���A�����ڤ]�|�ݵۥ��A�]���ЧA��󥴳o���H�����D�N�C
end

function LuaS_113471_5()
	SetSpeakDetail(OwnerID(), "[SC_113471_13]") 
	--��Ӧp���A�O�]�������ڧ����A�̪��H�÷m���o�ӸH���A�ҥH�A�̧Ʊ檾�D��]�C
	--��......
	if CheckAcceptQuest( OwnerID() , 420951 ) == true then
		SetFlag( OwnerID() , 543316 , 1 )
	end
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_15]",  "LuaS_113471_0",  0 ) --�߰ݦo�O�_�٦���L���D
end

function LuaS_113471_6()
	SetSpeakDetail(OwnerID(), "[SC_113471_14]") 
	--�][113471]�����x�۲\���^
	--��p�A�ڦ��d���ݺ޳o���H���A�����ڤ]�|�ݵۥ��A�ҥH......�u���ܩ�p�C
end

function LuaQ_420952_Complete()
	DisableQuest( OwnerID() , true )
	MoveToFlagEnabled( OwnerID() , false )
	local Flag = 780435
	AddBuff( TargetID() , 504004 , 1 , -1 )
	local Ball = CreateObjByFlag( 112307 , Flag , 1 , 1 )
	WriteRoleValue( Ball , EM_RoleValue_LiveTime , 30 )
	Lua_ObjDontTouch( Ball ) 
	AddToPartition( Ball , 0 )
	CastSpell( OwnerID() , Ball , 493632 )
	sleep(35)
	MoveToFlagEnabled( OwnerID() , true )
	CastSpell( Ball , Ball , 493894 )
	sleep(20)
	CancelBuff_NoEvent( TargetID() , 504004 )
	DisableQuest( OwnerID() , false )
end

function LuaQ_420953_Accept()
	DisableQuest( OwnerID() , true )
	Hide( OwnerID() )
	local Dummy = CreateObjByObj( 113473 , OwnerID() )
	AddBuff(Dummy , 504345 , 0 , -1 )
	MoveToFlagEnabled( Dummy , false )
	sleep( 10 )
	DW_MoveToFlag( Dummy  , 780435 , 1 , 20 , 1)
	sleep( 5 )
	CastSpell( Dummy , Dummy , 493919 )
	sleep( 5 )
	Delobj( Dummy )
	DisableQuest( OwnerID() , false )
	Show( OwnerID() , 0 )
end

function LuaM_504342_0()
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) < ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )/10  then
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsNPC ) == 1 then
		return false
	end
	if CheckCompleteQuest(  TargetID(), 420953 ) == true then
		return false
	end
end

function LuaM_504344_0()
	if CheckFlag( TargetID() , 543342 ) == true then
		return true
	end
	if CheckAcceptQuest(  TargetID(), 420953 ) == true and CheckCompleteQuest(  TargetID(), 420953 ) == false then
		local HPRate = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP ) / 2
		if ReadRoleValue( TargetID() , EM_RoleValue_HP ) < HPRate then
			SetFlag( TargetID() , 543342 , 1 )
			return true
		else
			ScriptMessage( TargetID() , TargetID() , 2 , "[SC_420953_0]" , 1 )
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_420953_0]" , 1 )
			--�q���K�����ǨӤF�n�����n���G�N�a�I�N�a�I�~��N�a�I������K���q�ȯO�L�b�F��W�I
			return false
		end
	end

	if CheckCompleteQuest(  TargetID(), 420953 ) == true or CheckCompleteQuest(TargetID(), 420956 ) == true then
		return true
	end
	return false
end

function LuaM_504344_1()
	if ( CheckAcceptQuest( TargetID(), 420953 ) == true or CheckCompleteQuest(  TargetID(), 420953 ) == true ) and CheckCompleteQuest(  TargetID(), 420955 ) == false then
		if CastSpell( TargetID() , TargetID() , 493919 ) then
			ChangeZone( TargetID() , 9 , 0 , -11938 , 181 , 28533 , 320 )
		end
		return
	end
	if ( CheckAcceptQuest(  TargetID(), 420956 ) == true or CheckCompleteQuest(TargetID(), 420956 ) == true  ) and CheckCompleteQuest(  TargetID(), 420959 ) == false then
		if CastSpell( TargetID() , TargetID() , 493919 ) then
			ChangeZone( TargetID() , 9 , 0 , -18523 , 628 , 30144 , 300 )
		end
		return
	end
	if CheckCompleteQuest(  TargetID(), 420955 ) == true and CheckCompleteQuest(  TargetID(), 420959 ) == true and CheckBuff(TargetID() , 504004) == false then
		CallPlot( TargetID() , "LuaM_504344_2" , OwnerID() )
	end
end

function LuaM_504344_2(obj)
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		if CheckBuff( OwnerID() , 504004 ) == false then
			AddBuff( OwnerID() , 504004 , 0 , 30 )
		end
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , "[SC_504344_0]"); --�A�Q�g��[ZONE_INFERNAL GATE]��F���쪢�]���Ҧb�a�H
		DialogSelectStr( OwnerID() , "[113473]");
		DialogSelectStr( OwnerID() , "[113491]");

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return 0
		end
	
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 150 , obj )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
		DialogClose( OwnerID() )
		
		if SelectID == 0  then
			if CastSpell( OwnerID(),OwnerID(), 493919 ) then
				sleep(5)
				ChangeZone( OwnerID(), 9 , 0 , -11938 , 181 , 28533 , 320 )
				CancelBuff_NoEvent( OwnerID() , 504004 )
			end
			return 1
		elseif SelectID == 1  then
			if CastSpell(OwnerID(),OwnerID(), 493919 ) then
				sleep(5)
				ChangeZone( OwnerID(), 9 , 0 , -18523 , 628 , 30144 , 300 )
				CancelBuff_NoEvent( OwnerID() , 504004 )
			end
			return 1
		else 
			CancelBuff_NoEvent( OwnerID() , 504004 )
			return 0
		end
		
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaI_113472_0()
	AddBuff( OwnerID() , 504345 , 0 , -1 )
	local FireDoor = CreateObjByFlag( 113510 , 780435 , 1 , 1 )
	SetModeEX( FireDoor , EM_SetModeType_Gravity , false )
	SetModeEX( FireDoor  , EM_SetModeType_Fight , false )
	SetModeEX( FireDoor  , EM_SetModeType_Searchenemy, false )
	SetModeEX( FireDoor  , EM_SetModeType_Strikback, false )
	Lua_ObjDontTouch( FireDoor  )
	AddToPartition( FireDoor , 0 )
	AddBuff( FireDoor , 504351 , 0 , -1 )
end

function LuaS_113473_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420954 ) == true and CheckFlag( OwnerID() , 543318 ) == false then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_00]",  "LuaS_113473_1",  0 ) --���q�a�߰����󥸭ԳQŧ�����Ʊ�
	end
	if CheckAcceptQuest( OwnerID() , 420955 ) == true then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_FIGHT]",  "LuaS_113473_FIGHT",  0 ) --�A�@���Ƭ����]��[ZONE_TUMBLING VALLEY]�԰�
	end
--�P�_�ण�୫��
	if	CheckCompleteQuest(OwnerID(),422950)	and
		CountBodyItem(OwnerID(),206555)==0	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_PE_9_1_45]","LuaPE_9_1_DW52", 0 )
	end
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_BACK]",  "LuaS_113473_BACK",  0 ) --�ШD[113473]�e�ۤv�^[ZONE_INFERNAL GATE]
end

function LuaS_113473_BACK()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_113473_GateReturn" , 0 )
end

function LuaS_113473_GateReturn()
	sleep(5)
	if CastSpell(OwnerID(),OwnerID(), 493919 ) then
		sleep(5)
		ChangeZone( OwnerID(), 9 , 0 , -11153 , 905 , 22598 , 350 )
	end
end
function LuaS_113473_FIGHT()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_113473_FIGHT_2" , 0 )
end
function LuaQ_420955_Accept()
	BeginPlot( TargetID() , "LuaS_113473_FIGHT_2" , 0 )
end
function LuaS_113473_FIGHT_2()
	if CastSpell(OwnerID(),OwnerID(), 493919 ) then
		sleep(5)
		ChangeZone( OwnerID(), 9 , 0 , -15896 , 5 , 23282 , 270 )
		BeginPlot( OwnerID(), "Lua_420955_0" , 0 )
	end
end

function Lua_420955_0()
	AddBuff( OwnerID() , 504316 , 60 , 600 )
	AddBuff( OwnerID() , 504946 , 0 , 600 )
	sleep(30)
	for i = 1 , 6000 , 1 do
		sleep( 5+DW_Rand(5) )
		if Lua_ObjAreaCheck(OwnerID() , 718 ) == false then
			break
		end
		if CheckBuff( OwnerID()  , 504316 ) == false then
			break
		end
		if CheckAcceptQuest( OwnerID() , 420955 ) == false then
			break
		end
	end
	if CheckBuff( OwnerID()  , 504316 ) == true then
		CancelBuff( OwnerID()  , 504316 )
	end
end

function LuaS_113473_1()
	SetSpeakDetail(OwnerID(), "[SC_113473_01]") --�u�n�_�ǤF�ڭ̡A�N�|������K������I�A�٦����D�ܡH
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_02]",  "LuaS_113473_2",  0 ) --�G�ѥ��ԨèS���_�Ǫ��]
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_03]",  "LuaS_113473_3",  0 ) --�ɥR�Ʊ��P[113470]����
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_04]",  "LuaS_113473_4",  0 ) --���d[113473]���ƺC
end

function LuaS_113473_2()
	SetSpeakDetail(OwnerID(), "[SC_113473_05]") --��H�A���饸�ڡH�ܦn�I�ڴN���A�@�Ӿ��|�A�A�⨺�å밵���Ʊ�������ť�I�p�G���å몺�T�_�ǤF�ڭ̡A�A���Ӫ��D�ۤv���U���I
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_06]",  "LuaS_113473_5",  0 ) --������[113473]�����
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_07]",  "LuaS_113473_3",  0 ) --�ɥR���]�m��[113470]������
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_08]",  "LuaS_113473_5",  0 ) --���q���D�p
end

function LuaS_113473_3()
	SetSpeakDetail(OwnerID(), "[SC_113473_09]") 
	--��H���T�I�ڱڥ��`���|�ܨ��H�̪����~�A�����Ӫ��~���~�C
	--��ڭ̨ӻ��A���������Ӫ��~���J�ޱ��Ť媺�H�⤤�I���L�ڭ̵L�k�����P�����A�ҥH�ڭ̥������o���I
	--�A��軡���ӳQ�ڭ̧������å�S���O�a�H�o�O�]���ڭ̪��ت����O�L�A�ӬO���ӪF��A��ڱڨӻ����ӳå�ڥ��L�����D�C
	--�ڷQ�H�A�����Ѥj���]���|���D�o��ơA�ڴN�e���A��~��ڪ��_�ǧa�I
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_10]",  "LuaS_113473_6",  0 ) --�ձ�����[113470]���Ʊ�
end

function LuaS_113473_4()
	SetSpeakDetail(OwnerID(), "[SC_113473_12]") 
	--�]�A�����٨S���X�f�A[113473]��M���o�X�j�j����եH�Τj�q�����O�A�����A�ݤ��L��ӡC�^
	--�A�I�A���O���򲴯��H�O�Q�D�԰��j��[113473]�ܡH
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_08]",  "LuaS_113473_5",  0 ) --���q���D�p
end

function LuaS_113473_5()
	SetSpeakDetail(OwnerID(), "[SC_113473_13]") 
	--�ܦn�I�ݨӧA�èS���ѰO��ڭ̪��q�Ȥ��ߡA�ڴN�A���A�@�Ӿ��|�I
	--�A�⨺�å밵���Ʊ�������ť�I�p�G���å몺�T�_�ǤF�ڭ̡A�A���Ӫ��D�ۤv���U���I
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_07]",  "LuaS_113473_3",  0 ) --�ɥR���]�m��[113470]������
end

function LuaS_113473_6()
	SetSpeakDetail(OwnerID(), "[SC_113473_14]") 
	--���H�A�墨�ӪF�観����H
	--��......
	--�ڬݧA�]������ޱ��Ť媺���A�A�]�O�ӡu�ޱ��Ť媺�H�v......�A�Ӥ��|�]�Q�Q�Ψ��ӪF��a�H
	--���......
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_11]",  "LuaS_113473_7",  0 ) --�бФ���O�u�ޱ��Ť媺�H�v
end

function LuaS_113473_7()
	SetSpeakDetail(OwnerID(), "[SC_113473_15]") 
	--�P�������I�A�u�O�Ӧ��쪺�å�I
	--�J�M�A�s�ۤv�O���򳣤��M���A�ڬݧA�]���|���D���ӪF��O����C
	--ť�n�F�I�p�å�I
	--�Ť媺�O�q�ܱj�j�A�C�ӤH�]���i�H�ϥβŤ�A���j�����H�o���X�Ӫ��O�q�N�������e�����P�@�˷L�z�A�ӡu�ޱ��Ť媺�H�v�~��o���X�p�P����U�N���O�q�C
	--���ǥ��Y�å�N�O���u�ޱ��Ť媺�H�v�Q�βŤ媺�O�q�s�y�X�Ӫ��C
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_16]",  "LuaS_113473_8",  0 ) --�߰ݥL���p���y�O���O�u�ޱ��Ť媺�H�v
end

function LuaS_113473_8()
	SetSpeakDetail(OwnerID(), "[SC_113471_17]") 
	--���p���y�H�A�̳o�Ǥp�å뤧�����ϧO��ڭ̨ӻ����ȱo�@���C
	--�u�n��ڭ̩���۷q�Ȥ��ߡA���_�ǧڱڡA�A�̹�ڱڨӻ����O�@�˪��C
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_18]",  "LuaS_113473_9",  0 ) --�i�D�L[113470]�O���p���y��s�~������
end

function LuaS_113473_9()
	SetSpeakDetail(OwnerID(), "[SC_113471_19]") 
	--��H��ӬO�L�̷Q�n���ӪF��ڡI���......
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_20]",  "LuaS_113473_10",  0 ) --�A�i�D�L[102512]������
end

function LuaS_113473_10()
	SetSpeakDetail(OwnerID(), "[SC_113471_21]") 
	--�o��Ƨڪ��D�A�ڱڤ����@�ǭ���Q���L���ͪ��ҥ��СA��I�O�q���������ۤv���L�Y�A�o�˪��z�̧ڤ��h�@�U�I
	--���L�A�����Ǥ�����p���y���M���Ǫ�������p�å�O�@�٪��A�o�i���N��A�O�Q��ڱګžԬO�ܡH
	--���I�L�̮ڥ��S���d�M���ۤv���L�p�I
	--�ڱڰ��W�N������o��[ZONE_MOUNT AL TURAJ]�W���@���Ƭ������̪��ݴ�I
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_22]",  "LuaS_113473_11",  0 ) --���O�٦P�L
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_23]",  "LuaS_113473_12",  0 ) --�Q��k����L
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_24]",  "LuaS_113473_13",  0 ) --����]����
end

function LuaS_113473_11()
	SetSpeakDetail(OwnerID(), "[SC_113471_25]") 
	--�����I�ڳ��w�A�o�p�l�I
	--���I�ڷQ��@�Ӧn�I�l�I�A���A���b�M���ǳå르�M�a�H
	--�p�G�Χڱڪ��O�q�A�b�L�̷P��q�Ȥ��e�L�̴N���F......�o�ˤӫK�y�L�̤F�I
	--�̦n���L�̪��D�N��ڱڤ��˦ۥX���]�൹���L�̮��ߡI
	--�ڨM�w�ѧA�ӥN��ڭ��U����I
	if CheckAcceptQuest( OwnerID() , 420954) == true then
		SetFlag( OwnerID() , 543317 , 1 )
	end
end

function LuaS_113473_12()
	SetSpeakDetail(OwnerID(), "[SC_113471_26]") 
	--��H�A���o�ǷL�����D���å뤣�ݭn�ڱڿ˦۰ʤ�ѧA�̨ӴN�n�H
	--��......�A�����ܦn�I�ګܺ��N�I
	--�A������ڱڪ�ܷq�ȡA���@�N���ڱڱаV���ǵL�����å�......�ܦn�I
	--�N�ѧA�ӥN��ڭ��U����I
	if CheckAcceptQuest( OwnerID() , 420954) == true then
		SetFlag( OwnerID() , 543317 , 1 )
	end
end

function LuaS_113473_13()
	SetSpeakDetail(OwnerID(), "[SC_113471_27]") 
	--��H���H�ݧA�~�o�@�I�n���]�o���X�ӡA�������I
	--�o�~�s���q�ȡI���ǵL§���å����ӭn�V�A�ǲߤ���~�O��ڱڪ��q�Ȥ��ߡI
	--�n�I�ڨM�w�F�I�n�����L�̪��D����O�q�ȦA�����L�̡I
	--�A�I�N��ڪ��Ϫ̡I��L�̪����e����ڪ��O�q�I
	if CheckAcceptQuest( OwnerID() , 420954) == true then
		SetFlag( OwnerID() , 543317 , 1 )
	end
end

function LuaM_504346_0()
	if CheckBuff( TargetID() , 504348 ) == true then
		CancelBuff( TargetID() , 504348)
	end	
end

function LuaM_504315_0()
	if CheckBuff( TargetID() , 504316 ) == true then
		CancelBuff_NoEvent( TargetID() , 504316 )
	end
	if CheckBuff( TargetID() , 504347 ) == true then
		CancelBuff_NoEvent( TargetID() , 504347 )
	end
	if CheckBuff( TargetID() , 504946 ) == true then
		CancelBuff_NoEvent( TargetID() , 504946 )
	end
	BeginPlot( TargetID() , "LuaS_113473_GateReturn" , 0 )
end

function LuaM_504315_Check()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsNPC ) == 1 then
		return false
	end
	return true
end

function LuaS_113492_0()
	if CheckAcceptQuest( OwnerID() , 420957 ) == true then
		SetSpeakDetail(OwnerID(), "[SC_113492_0]") 
		--�]�ݵۥ��y���{�{�A�A�������C�C�B�{�F�@�}�ҽk���n���C�^
		--����......�T����......�F�F......��......
		--���s�}��......�F�F......�T���ǹF.....����......
		--����......�F�F......�෽�֤�......�F�F......
		SetFlag( OwnerID() , 543318 , 1 )
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_113495_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420959 ) == true then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_00]", "LuaS_113495_1",  0 ) --�߰ݥL���Ӫ��ت�
	end
	if CheckCompleteQuest( OwnerID() , 420959 ) == true then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_34]", "LuaS_113495_Q",  0 ) --�A���߰ݱ���
	end
end

function LuaS_113495_1()
	SetSpeakDetail(OwnerID(), "[SC_113495_01]") 
	--�b�^���A�����D���e�A�ڥ������T�{�A�������C
	--�A�O[102438]����U�ܡH
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_02]", "LuaS_113495_2",  0 ) --�^���ۤv�����D�֬O[102438]
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_03]", "LuaS_113495_2",  0 ) --�^���ۤv�O[102438]���ĤH
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_04]", "LuaS_113495_3",  0 ) --�^���ۤv�O[102438]����U
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_05]", "LuaS_113495_4",  0 ) --�^���ۤv�N�O[102438]
end

function LuaS_113495_2()
	SetSpeakDetail(OwnerID(), "[SC_113495_06]") 
	--�^�����R��......
	--�ڱ����A�����סA���ڦ^���A���ðݧa�I
	--[102438]�A�O[ZONE_MOUNT AL TURAJ]�ثe���Ϊv�̡A�]�ڡA�ڪ��ĤH�C
	--�ڳQ������ت��N�O���F�N��ܥL����k�ǹF���N��ܥL���H�C
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_10]", "LuaS_113495_5",  0 ) --�߰ݽ֬O���[102438]���H
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_11]", "LuaS_113495_6",  0 ) --�߰ݹ��[102438]����k
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_12]", "LuaS_113495_7",  0 ) --�߰ݻP[102438]���Ī���]
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_13]", "LuaS_113495_8",  0 ) --�߰ݥL�P���]���������Y
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_14]", "LuaS_113495_9",  0 ) --��ثe[ZONE_MOUNT AL TURAJ]���Ϊv�̳o�I���X���
end

function LuaS_113495_3()
	SetSpeakDetail(OwnerID(), "[SC_113495_07]") 
	--�^�����R��......
	--�ڵL�k�����A�����סA�Чi�D�ڧA�u���������C
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_02]", "LuaS_113495_2",  0 ) --�^���ۤv�����D�֬O[102438]
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_03]", "LuaS_113495_2",  0 ) --�^���ۤv�O[102438]���ĤH
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_05]", "LuaS_113495_4",  0 ) --�^���ۤv�N�O[102438]
end

function LuaS_113495_4()
	SetSpeakDetail(OwnerID(), "[SC_113495_08]") 
	--�аݳo�O�@�ث��q����{�ܡH�ڬO�_���ӫ����j���H
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_09]", "LuaS_113495_1",  0 ) --���s�^��
end

function LuaS_113495_5()
	SetSpeakDetail(OwnerID(), "[SC_113495_17]") 
	--����Y�N�P[102438]��ܪ��H�C
	--�o�ӰT���ڵL�k���T���^���A�A�]���ڱo�쪺���O�O���ݳo�˪��H��ӡA�èS���o���L����o�ǤH���T���C
	--�R�B�ױN�޾ɳo�˪��H��ڪ����e......
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 1)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_6()
	SetSpeakDetail(OwnerID(), "[SC_113495_18]") 
	--[102438]�A�L�{�b�H���ߤ������W�r�Ϊv���a�A�ǥѱj�j���Ť大�O�A�L�b�ۤv���g�D�غc�F�@���]�k�پ��C
	--�o�ӻپ��ϬM�F�L���O�q�A�ĤH���̲߳`�����߱N�Ƭ��L�k�������۶H�C
	--�o�Ӥ۶H�N�a���L���ĤH�L�k�����ߡA�o�O�]�k�a�Ӫ��O�q�A���O���q�H���N�ӯ����ܪ��C
	--���N��O���ߤ����]�����ߪ��ƪ��A�Z�������s[102670]���a��[102438]�L�k�i�����O�СC
	--���[102670]�A�ñN[102670]��Ŧ������G������A�u�n��Ĳ��[102438]���]�k�پ��A�L�N�q�۶H���ݨ�[102670]���F��C
	--��[102670]���۶H�N�|�ǥ��]�k���s���i�J�L�����ߡA�����ߤϾ��L�ۨ��A�o�N�|���ϥL�Ѱ��پ��C
	--�u�n�����[102438]���h���H�������ߪ��O�q�A�N�����ѥL�����|�C
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 10)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_7()
	SetSpeakDetail(OwnerID(), "[SC_113495_19]") 
	--�]�ڡA�N�j�j���Ť大�O�P�ۨ����X���H�̡A�ڵ������l���òM������H�C
	--�u���N�]�ڷ��ɡA�ä޾ɩҦ��T�ҲŤ孫�s�k��y���̪�����U�A�~��ϥ@�ɧK�����g���P�������x���C
	--
	--[102438]���]�ڡA���Ѩ��F�ڵ��ҫO�@���T�ҲŤ�A�w�ŦX�N��@�ɦ����j�M�`�̪��зǡC
	--
	--�Ҧ��i���@�ɳy�����j�M�`���H�A�Y���ڵ����ĤH�C
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 100)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_8()
	SetSpeakDetail(OwnerID(), "[SC_113495_20]") 
	--���]�A�A���P����ͪ������ͪ��C
	--�ڵ��Ӧ�����P���s[102670]�D�J�A�o�Ǥ����ͪ��K�q��O�q���ϥ͡A�ûP�ڵ��԰��C
	--���̬O[102670]�}�H�F��@�����A�ϬM�F[102670]������H�η���������C
	--�ڵ����ϩR�O����]�ڥH�Φ^���T�ҲŤ�A��ڵ��Ө��A���̬O�۵M�ɩҳХͪ���ê�A���ëD�ĤH�C
	--���Y���̳Q�]�کҾޱ��A�h�笰�ڵ������M������H�C
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 1000)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_9()
	SetSpeakDetail(OwnerID(), "[SC_113495_21]") 
	--�b�ڵ����@���e�A�D�H�N�O�L�h�Ϊv���a���]�کҾ֦������СA�]�O�L���h�L�C
	--[102438]�����ګO�@���T�ҲŤ�ɤw�~�ӤF�o��x���C
	--�Ӳ{���ڵd������Ҩ��A[102438]���O�q���]��ۦ��a�A�D�H�x�����⪺�d��]�X�j�F�C
	--�]���i�P�w���a���Ϊv�̤���[102438]�C
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 10000)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_10()
	SetSpeakDetail(OwnerID(), "[SC_113495_22]") 
	--�L�h���Ʊ��w�g�Q�H�̿�ѡA���L�h�����c���d�s�F�U�ӡC
	--�۱q�ڪ����߷l���Y���A�N�w�g�Q�Ѱ��F��ܨ��c���ϩR�C
	--�ڲ{�b���ϩR�O�o��ĵ�i���ܻy�ǹF���A�̡A�Ӥ��A����ӡA���ڪ��ϩR�o�H�����C
	--���A�̪��ϩR�~���n�}�l�C
	--���ѧA��ť�쪺�ܻy�N���U�A������[102438]�C
	--��o�Ǹܻy�ǹF�X�h�A���o�ӥ@�ɪ��Ť�O�q�����L�����H������a�I
	if CheckAcceptQuest( OwnerID() , 420959 ) == true then
		SetFlag( OwnerID() , 543319 , 1 )
	end
end

function LuaS_113495_Q()
	SetSpeakDetail(OwnerID(), "[SC_113495_23]") 
	--[102438]�A�O[ZONE_MOUNT AL TURAJ]�ثe���Ϊv�̡A�]�ڡA�ڪ��ĤH�C
	--�ڳQ������ت��N�O���F�N��ܥL����k�ǹF���N��ܥL���H�C
	local Check = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	if Check >= 11111 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_15]", "LuaS_113495_10",  0 ) --�߰ݥL�٦��S������Ʊ��n��
	end
	if Check - 10*math.floor( Check / 10 ) < 1 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_10]", "LuaS_113495_5",  0 ) --�߰ݽ֬O���[102438]���H
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_24]", "LuaS_113495_13",  0 ) --�߰ݦۤv�O���O�L�b���ݪ��H
	end
	if Check - 100*math.floor( Check / 100 ) < 10 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_11]", "LuaS_113495_6",  0 ) --�߰ݹ��[102438]����k
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_25]", "LuaS_113495_14",  0 ) --�߰ݫ����[102670]
	end
	if Check - 1000*math.floor( Check / 1000 ) < 100 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_12]", "LuaS_113495_7",  0 ) --�߰ݻP[102438]���Ī���]
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_26]", "LuaS_113495_15",  0 ) --�߰ݸT�ҲŤ媺�Ʊ�
	end
	if Check - 10000*math.floor( Check / 10000 ) < 1000 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_13]", "LuaS_113495_8",  0 ) --�߰ݥL�P���]���������Y
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_27]", "LuaS_113495_16",  0 ) --�߰�[102670]���Ʊ�
	end
	if Check - 100000*math.floor( Check / 100000 ) < 10000 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_14]", "LuaS_113495_9",  0 ) --��ثe[ZONE_MOUNT AL TURAJ]���Ϊv�̳o�I���X���
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_28]", "LuaS_113495_17",  0 ) --�߰�[ZONE_MOUNT AL TURAJ]�L�h�P�]�ڪ����Y
	end
end

function LuaS_113495_13()
	SetSpeakDetail(OwnerID(), "[SC_113495_29]") 
	--�p�G�A�N�P[102438]��ܡA���A�N�O�ڦb���ݪ��H�C
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_14()
	SetSpeakDetail(OwnerID(), "[SC_113495_30]") 
	--[102670]�A�b�ڨ�F���a����P�ڵ��o�;԰��A�ڵ��]���Y���󦹦a�A���H�ҷl���A�u�l�ڤ��i������������ñ����~�ɡC
	--�e���ɤO��ө󦹦a��[ZONE_DRAGONS NEST]�����I�ΡC
	--[102438]�q�ڨ��W�����کҦu�@���T��Ť大��A�紿�Q�ܨ�[102670]���O�A���ϦӨ�[102670]�ҶˡC
	--�]����[102670]������_�O�q������_�A[102438]�K�X[102670]����z�ɥH�������ɱN[102670]�ʦL��[ZONE_DRAGONS NEST]�C
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_15()
	SetSpeakDetail(OwnerID(), "[SC_113495_31]") 
	--�T�ҲŤ�A�O�֦��j�j�O�q���ťۡA�������m�����䬰���٪��@�����C
	--��֦����O�q���D�@��ϥΪ��Ť�ү�B���A�]���Y����丨�J�L���g�������⤤�A�N��@�ɳy�����j�M�`�C
	--�L�h�]�ڤ��ëK�O�������ƹ�C
	--�ڭ̪��ϩR���@�N�O�^���o�ǸT�ҲŤ�ëO�ޡA�קK�A�Q����H�Ҧk�ΡC
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_16()
	SetSpeakDetail(OwnerID(), "[SC_113495_32]") 
	--[102670]�A���s���l�A�����H�����ͫo�ϫq���]�ڪ��Z�����s�C
	--�O�����e�Q���s�������ѨåH�k�N�����A�Ϩ�ϥί�O�ɥ�Q���O�ҿN�`�A������Q�]�کұϦӤ����h�V�C
	--����ڵ��Ө즹�a�A�~�o�{�e�@���b���a�a�U�I�v�C
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaS_113495_17()
	SetSpeakDetail(OwnerID(), "[SC_113495_33]") 
	--[ZONE_MOUNT AL TURAJ]�A�L�h�O[ZONE_YGGNO LAND]�Ϊv�̤ک`���ȴ�����a�A�D�H�O�L���x���A��[102670]�O�L�����͡C
	--�L�̫ᦺ�󳡱N�w�w�Ĵ����ϫq�A�Ө�Ѿl�դO����]�Q�H�������d�ĩi�Ҳv�⪺�x�������ѡC
	--�ʦL���ԫ�A��������ƭӸT�ҲŤ夣���h�V�A�ڵ��Ӧ����ت��Y���M��æ^���o�ǸT�ҲŤ�C
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --�߰ݨ�L�����D
end

function LuaQ_420958_Complete()
	DisableQuest( OwnerID() , true )
	local Flag = 780435
	AddBuff( TargetID() , 504004 , 1 , -1 )
	MoveToFlagEnabled(  OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	sleep( 10 )
	DW_MoveToFlag(  OwnerID() ,Flag , 5  , 0 )
	AdjustDir( OwnerID(), -90 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_113491_0]" , 3 ) --�ڰO�o�n���O�q�o�̳Q���X�Ӫ�......
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_SP01 )
	sleep( 30 )
	Yell( OwnerID() , "[SC_113491_1]" , 3 ) --�n�աI���ڵo�ͧ@�Χa�I
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 50 )
	Yell( OwnerID() , "[SC_113491_2]" , 3 ) --......
	sleep( 20 )
	Yell( OwnerID() , "[SC_113491_3]" , 3 ) --�ʰ_�ӰڡI�V�b�å�I
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 10 )
	CancelBuff_NoEvent( TargetID() , 504004 )
	sleep( 10 )
	DW_MoveToFlag(  OwnerID() ,Flag , 4  , 0 )
	AdjustDir( OwnerID(), -90 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_113491_4]" , 3 ) --�u�O��......
	DisableQuest( OwnerID() , false )
	MoveToFlagEnabled(  OwnerID() , true )
end

function LuaS_113491_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420958 ) == true and CountBodyItem( OwnerID() , 205950 ) < 1 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113491_5]",  "LuaS_113491_2",  0 ) --�ШD[113491]�N�ۤv�e����񪺦a���W
	end
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113491_6]",  "LuaS_113473_BACK",  0 ) --�ШD[113491]�e�ۤv�^[ZONE_INFERNAL GATE]
end

function LuaS_113491_2()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_113491_3" , 0 )
end

function LuaS_113491_3()
	if CastSpell(OwnerID(),OwnerID(), 493919 ) then
		sleep(5)
		ChangeZone( OwnerID(), 9 , 0 , -17649 , 839 , 29976 , 250 )
	end
end

function LuaI_205953_Check()
	if Lua_ExGetZone( OwnerID())  ~= 9 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205953_0]" , 1 ) --�A����b[ZONE_MOUNT AL TURAJ]���~���a��ϥΦ����~
		return false
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205953_1]" , 1 ) --�A����b�԰����ϥΦ����~
		return false
	end
	return true
end

function LuaI_205953_Use()
	if CastSpell( OwnerID() , OwnerID() , 493919 ) then
		UseItemDestroy()
		ChangeZone( OwnerID(), 9 , 0 , -18523 , 628 , 30144 , 300 )
	end
end

function LuaQ_420959_Complete()
	SetFlag(TargetID() , 543319 , 1 )
end

function LuaQ_420952_OnClick()
	if CountBodyItem( OwnerID() , 205947 ) >= 3 and CountBodyItem( OwnerID() , 205948 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_420952_0]" , 0 ) --�A�w�g�����쨬�������~�F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_420952_0]" , 0 )
		return -1
	else
		return 1
	end
end

function LuaQ_420952_AfterClick()
	local Num = DW_Rand(1000)
	if Num > 700 and CountBodyItem( OwnerID() , 205947 ) < 3 then
		GiveBodyItem( OwnerID() , 205947 , 1 )
	elseif Num < 500 and CountBodyItem( OwnerID() , 205948 ) < 5 then
		GiveBodyItem( OwnerID() , 205948 , 1 )
	else
		GiveBodyItem( OwnerID() , 205949 , 1 )
	end
	return 1
end

function LuaI_113467_0()
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113467 , 70)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , NPC )
	SetPlot( OwnerID(),"collision","LuaI_113467_1",40 )
end

function LuaI_113467_1()
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	if CheckID( NPC ) == true then
		tell( OwnerID() , NPC , "[SC_113467_0]" )
	end
end
function Lua_Test_504316()
	AddBuff( OwnerID() , 504316 , 60 , -1)
end

function LuaM_504349_Check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID == 102512 or OrgID == 102669 or OrgID == 102500 or OrgID == 102543 then
		local Name = GetName(TargetID())
		local Str = "[SC_504349_0][$SETVAR1="..Name.."]"--[$VAR1]�l���F[494191]���ˮ`
		local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
		if ReadRoleValue( TargetID() , EM_RoleValue_HP ) ~= MaxHP and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then
		AddRoleValue( TargetID() , EM_RoleValue_HP , MaxHP)
		ScriptMessage( OwnerID() , OwnerID() , 0 , Str , 0 )
		end
		return false
	end
	return true
end