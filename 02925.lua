-----------------------------------------------------------------------------
--Z26_����
-----------------------------------------------------------------------------
--���٥��Ȫ�t�ɡAOwnerID�Onpc
function lua_quest426185_1()--�������D�ҹy���}����
	local newnpc = 122292
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		--�t�����⤣�i�Q�I���A��������������
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		--�t������n�������|�A�H�K�t���L�{����^�����I
		MoveToFlagEnabled( obj ,false )
		--�إߨ���
		AddToPartition( obj,0 )
		--�����Y�W���
		Say( obj, "[SC_Q426185_1]" )	--�M�h�j�H�A�ڥ����}�F�A�A�ۤv�p���I�C
		--���ʦܬY�X�Ц�m
		LuaFunc_moveToFlag( obj,781285,1,0 )	--���� �X�l ID �d��
		--�R������
		DelObj( obj)
end

function lua_quest426193_1()--���S�D�ҷ����}����
	local newnpc = 122293
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		AddBuff( TargetID(),504004,0,3 )	
		--�t�����⤣�i�Q�I���A��������������
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		--�t������n�������|�A�H�K�t���L�{����^�����I
		MoveToFlagEnabled( obj ,false )
		AddToPartition( obj,0 )
		Say( obj, "[SC_Q426193_1]" )	--�Ĥl�̡A[$playername]�|�n�n���U�A�̪��A�n�Ĩĵ��ڦ^�ӳ�C
		LuaFunc_moveToFlag( obj,781285,2,0 )	--���� �X�l ID �d��
		DelObj( obj)
end
-----------------------------------------------------------------------------
--Z26_�m��
-----------------------------------------------------------------------------
-----------------------------------------------------426209�����B��˸m
--�^���e�U������
--122351 �p���Ԥh
function lua_Z26Q426209_1()
	--���J���ȭ��O
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426209 )==true  and  CheckFlag( OwnerID() ,548103 )==false then
		--�����@�ӿﶵ�ù����@�ӧt��
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426209_0]","lua_Z26Q426209_1_1",0 )
	end
end
--122352 �p���Ԥh
function lua_Z26Q426209_2()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426209 )==true and CheckFlag( OwnerID() ,548104 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426209_0]","lua_Z26Q426209_2_1",0 )
	end
end
--122353 �p���Ԥh
function lua_Z26Q426209_3()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426209 )==true and CheckFlag( OwnerID() ,548105 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426209_0]","lua_Z26Q426209_3_1",0 )
	end
end
--���������X��
function lua_Z26Q426209_1_1()
	--�I�s���
	SetSpeakDetail( OwnerID(), "[SC_426209_1]" )
	SetFlag( OwnerID(), 548103  ,1)
end
function lua_Z26Q426209_2_1()
	SetSpeakDetail( OwnerID(), "[SC_426209_2]" )
	SetFlag( OwnerID(), 548104  ,1)
end
function lua_Z26Q426209_3_1()
	SetSpeakDetail( OwnerID(), "[SC_426209_3]" )
	SetFlag( OwnerID(), 548105  ,1)
end



-----------------------------------------------------426206�X���e���ǳ�
--�������Ȯɵ��X��
--122342 ���J
--426208�ǻ������Ʋz
--���٥��Ȫ�t�ɡAOwnerID�Onpc
function lua_Z26Q426208_1_0()
	--Say�L�kŪ������
	--Say( TargetID(), 1 )
	SetFlag( TargetID(),548101,1 )
end
--122343 �d�d
--426210���Ŧ��
function lua_Z26Q426210_1()
	SetFlag( TargetID(),548102,1 )
end



-----------------------------------------------------426207�N�O�n�Y����(6/14�[�J�e�U�P����)
--Ĳ�o�@��
--122347 �i�ê��_��
--242636 ���㪺�J
function lua_Z26Q426207_1()
	LoadQuestOption( OwnerID() )
	--���Ȯ�
	if CheckAcceptQuest( OwnerID() ,426207 ) or CheckAcceptQuest( OwnerID() ,426364 ) or CheckAcceptQuest( OwnerID() ,426368 )==true  then
		--�D��ƶq�O�_�F�W��
		--�ﶵ�G�߬B�_�ޤ����J
		if CountBodyItem( OwnerID(),242636 )>=4 then
			AddSpeakOption(  OwnerID(),TargetID(),"[SC_426207_1_0]","lua_Z26Q426207_2",0 )
		else
			AddSpeakOption(  OwnerID(),TargetID(),"[SC_426207_1_0]","lua_Z26Q426207_3",0 )
		end
	end
end
--�D��W�L�W��,���o��ܡG�A�w�g�����������ƶq�C
function lua_Z26Q426207_2()
	CloseSpeak( OwnerID())
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426207_2]", 0 )
end
--�����D��,�����v�۩�
--1/3�۩�,2/3��o���~
function lua_Z26Q426207_3()
	--�������O
	CloseSpeak( OwnerID())
	--rand 0~99(��0�}�l,+1�~�|��1�}�l)
	local num =Rand( 100 )
	--Say( OwnerID(),num)
	if num<= 69 then
		--�קK�Q�P��Ĳ�o�A�����u�����������аO
		SetModeEx( TargetID()  , EM_SetModeType_Mark, false )--�аO
		--�I�s�Y��H����Y�禡
		CallPlot( TargetID(),"lua_Z26Q426207_3_1",0 )
		--����ʧ@
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		Sleep(20)
		GiveBodyItem( OwnerID(), 242636, 1 )
	else
		SetModeEx( TargetID()  , EM_SetModeType_Mark, false )--�аO
		CallPlot( TargetID(),"lua_Z26Q426207_3_1",0 )
		--�I�s�Ǫ��n���b���a���W
		CallPlot( OwnerID(),"lua_Z26Q426207_3_2",0 )
		--�ۤު���Ǫ�,��ܡG���Y�S�����󧹾㪺�J
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426207_3]", 0 )
	end
end
--���s�}��
function lua_Z26Q426207_3_1()
	Sleep( 600)
	SetModeEx( OwnerID()  , EM_SetModeType_Mark, true )--�аO
end
--�ީ�
function lua_Z26Q426207_3_2()
	--SearchRangeNPC�|�^�Ǥ@�Ӱ}�C{}�A�o�Ӱ}�C�Ǹ��q0�}�l
	local tmp = SearchRangeNPC( OwnerID(),180 )
	--Ū���}�C��ƥ����b�ܼƫe�[#
	for i = 0 , #tmp , 1 do
		--���k2�G�ؼЬO�YID
		if ReadRoleValue( tmp[i],EM_RoleValue_OrgID ) ==107718 then
			CastSpell( tmp[i] , tmp[i] , 850896 )
			--�`�N���n�b�L�ĤU��
			SetAttack( tmp[ i ],OwnerID() )
		end
	end

end


-----------------------------------------------------426208�ǻ������Ʋz(6/14�[�J�e�U�P����)
--�����D��
--242639 ���ΥͳJ(�i���Ư���,��a��5)
--122342 ���J
function lua_Z26Q426208_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426208 ) or CheckAcceptQuest( OwnerID() ,426365 ) or CheckAcceptQuest( OwnerID() ,426369 )==true  then
		--�D��ƶq�O�_�F�W��
		if CountBodyItem( OwnerID(),242640 )<5 then--�b���J
			--�D��w��
			--�ﶵ�G�������ΥͳJ
		 	if CountBodyItem( OwnerID(),242639 )>=5 then--���ΥͳJ
				AddSpeakOption(  OwnerID(),TargetID(),"[SC_426208_1_0]","lua_Z26Q426208_1_1",0 )
			else
				AddSpeakOption(  OwnerID(),TargetID(),"[SC_426208_1_0]","lua_Z26Q426208_1_2",0 )
			end
		end
	end
end

--�D��W�L�W��,���o��ܡG�@�f�𮳳o��h�A�ܮe���L�}���C
function lua_Z26Q426208_1_1()
	CloseSpeak( OwnerID())
	Say( TargetID(), "[SC_426208_1_1]" )
end
--�ɵ��D��,��ܡG�p�߮��n�A�O���F�C
function lua_Z26Q426208_1_2()
	CloseSpeak( OwnerID())
	Say( TargetID(), "[SC_426208_1_2]" )
	GiveBodyItem( OwnerID(), 242639, 1 )
end

--�﨤��ϥΪ��~
--122350 �諬�o��
-- 242640 �b���J(�ؼ�:5)*�����v�L���ί}��
function lua_Z26_122350_1()
	if CountBodyItem( OwnerID(),242639 ) > 0 then--242639 ���ΥͳJ
		return true
	else
		--�G�A���W�w�g�S���ͪ��J�F
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122350_0_1]", 0 )
		return false
	end
end
function lua_Z26_122350_1_1()
		--���v��
		local num =Rand( 100 )
		--Say( OwnerID(),num)
		----1/3��o���~�G���\�N�X�b�����Ŭu�J�C
		if num>= 30 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426208_2_3]", 0 )
			GiveBodyItem( OwnerID(), 242640, 1 )
		----1/3�}���G�񪺤O�D�L�j�A�J�}���F�C
		elseif num>= 15 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426208_2_2]", 0 )
		----1/3�L���G�N�Ӥ[�A�J�L���F�C
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426208_2_1]", 0 )
		end
		DelBodyItem( OwnerID(), 242639, 1 )
		return 1
end



-----------------------------------------------------426210���Ŧ��
--122355 �����B��˸mX-86
--242641 �N�o�Ť�(�ؼ�:1)
--548106 �b�X�A���˸m�W�w�˧N�o�Ť�
function lua_Z26_122355_1()
	LoadQuestOption( OwnerID() )
	--�P�_������
	--�ﶵ�G�w�˦X�A���Ť�
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122355_1_1",0)
	end
end
function lua_Z26_122355_1_1()
	CloseSpeak( OwnerID() )
	--���w��
	if   CheckFlag( OwnerID() ,548106 )==false then
		--���D��,�ƶq�����G�N�Ť�w�˦b�˸m�W
		if CountBodyItem( OwnerID(),242641 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242641, 1 )
			SetFlag( OwnerID(),548106,1 )
		--�ƶq�����G�˸m�P�Ť�@���}�ҤF���ê����O�A�A�o�{�W�Y�~�M��3���^�O�լ}
		--elseif CountBodyItem( OwnerID(),242641 ) >= 1 then
		--	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_1]", 0 )
		--�L�D��G���֦��X�A���Ť�i�H�i��w��
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	--�w�w�˧����G�Ӹ˸m�w�g�w�˧���
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end
--122356 �����B��˸mX-93
--242642 ���ƲŤ�(�ؼ�:1) 
--548107 �b�X�A���˸m�W�w�ˬ��ƲŤ�
function lua_Z26_122356_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122356_1_1",0)
	end
end
function lua_Z26_122356_1_1()
	CloseSpeak( OwnerID() )
	if   CheckFlag( OwnerID() ,548107 )==false then
		if CountBodyItem( OwnerID(),242642 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242642, 1 )
			SetFlag( OwnerID(),548107,1 )
		--elseif CountBodyItem( OwnerID(),242642 ) >= 1 then
		--	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_2]", 0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end
--122357 �����B��˸mC-29
--242643 ���ѲŤ�(�ؼ�:1)
--548108 �b�X�A���˸m�W�w�ˤ��ѲŤ�
function lua_Z26_122357_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122357_1_1",0)
	end
end
function lua_Z26_122357_1_1()
	CloseSpeak( OwnerID() )
	if   CheckFlag( OwnerID() ,548108 )==false then
		if CountBodyItem( OwnerID(),242643 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242643, 1 )
			SetFlag( OwnerID(),548108,1 )
		--elseif CountBodyItem( OwnerID(),242643 ) >= 1 then
		--	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_3]", 0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end
--122358 �����B��˸mL-1
--242644 �ҰʲŤ�(�ؼ�:2)
--548109 �b�X�A���˸m�W�w�� �ҰʲŤ�
function lua_Z26_122358_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122358_1_1",0)
	end
end
function lua_Z26_122358_1_1()
	CloseSpeak( OwnerID() )
	if   CheckFlag( OwnerID() ,548109 )==false then
		if CountBodyItem( OwnerID(),242644 ) >= 2 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242644, 2 )
			SetFlag( OwnerID(),548109,1 )
		elseif CountBodyItem( OwnerID(),242644 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_4]", 0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end
--122359 �����B��˸mL-2
--242645 �B��C��(�ؼ�:3)
--548110 �b�X�A���˸m�W�w�˹B��C��
function lua_Z26_122359_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426210 )==true  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122355_0]","lua_Z26_122359_1_1",0)
	end
end
function lua_Z26_122359_1_1()
	CloseSpeak( OwnerID() )
	if   CheckFlag( OwnerID() ,548110 )==false then
		if CountBodyItem( OwnerID(),242645 ) >= 3 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_1]", 0 )
			DelBodyItem( OwnerID(), 242645, 3 )
			SetFlag( OwnerID(),548110,1 )
		elseif CountBodyItem( OwnerID(),242645 ) >= 1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_2_1]", 0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_3]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_122355_1_4]", 0 )
	end
end



-----------------------------------------------------426214����¼v
--122361 �ǿ�t��
--242648 �j�O�z���˸m
--���j�O�z���˸m�A�I���Y�i����(�ؼ�:6)
function lua_Z26_122361_1()
	LoadQuestOption( OwnerID() )
	--���D��G�w���z���˸m
	if CountBodyItem( OwnerID(),242648 ) > 0 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_122361_0]","lua_Z26_122361_1_1",0)
	end
end
function lua_Z26_122361_1_1()
	CloseSpeak( OwnerID() )
	SetModeEx( TargetID()  , EM_SetModeType_Mark, false )--�аO
	--�̫�@�ӭȥi�^�Ǩ����禡��
	CallPlot( TargetID(),"lua_Z26_122361_1_2",OwnerID() )
end
function lua_Z26_122361_1_2( player)
	PlayMotion( player ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	DW_QietKillOne( player ,107824 )--�w���z���˸m
	DelBodyItem( player, 242648, 1 )
	--�ީ�
	CallPlot( player ,"lua_Z26_122361_1_4",0 )
	--�G�z���˸m�i�J�˼�Ū��
	ScriptMessage( player, player, 2, "[SC_122361_1]", 0 )
	Sleep(20)

	--�Ѫ�l�Ȼ����0
	--�˼�3��
	for i = 3 ,0,-1 do
		ScriptMessage( player, player, 2, "[SC_122361_2]"..i.."[SC_122361_3]", 0 )
		Sleep( 10 )
	end
	--���W��tBuff
	AddBuff( player , 624435 , 0 , 5 )
	CastSpell( TargetID() , TargetID() , 850896 )
	CallPlot( player,"lua_Z26_122361_1_2_1",player )--���
	CallPlot( TargetID(),"lua_Z26_122361_1_2_2",0 )--�쫬
end
function lua_Z26_122361_1_2_1( player)
	--�O���Ȧb���a���W,�̧ǼW�[��O�o�k�s
	local num = ReadRoleValue( player,EM_RoleValue_Register1 )
	--���Բ���S&�ɦ�X�w�����
	if num ==0 then
		WriteRoleValue( player,EM_RoleValue_Register1,1)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_0]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_1]", 0 )
		Sleep( 30 )
	elseif num ==1 then
		WriteRoleValue( player,EM_RoleValue_Register1,2)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_2]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_3]", 0 )
		Sleep( 30 )
	elseif num ==2 then
		WriteRoleValue( player,EM_RoleValue_Register1,3)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_4]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_5]", 0 )
		Sleep( 30 )
	elseif num ==3 then
		WriteRoleValue( player,EM_RoleValue_Register1,4)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_6]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_7]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_8]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_9]", 0 )
		Sleep( 30 )
	elseif num ==4 then
		WriteRoleValue( player,EM_RoleValue_Register1,0)
		ScriptMessage( player, player, 2, "[SC_122361_1_2_10]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_11]", 0 )
		Sleep( 30 )
		ScriptMessage( player, player, 2, "[SC_122361_1_2_12]", 0 )
		Sleep( 30 )
	end
end
function lua_Z26_122361_1_2_2()
	--���]ownerid()���쫬�A�s����sobj
	local x,y,z,dir = DW_Location(  OwnerID() )
	local obj = CreateObj( 122362,x,y,z,dir,1 )
	--CastSpell( OwnerID() , OwnerID() , 850908 )
	CastSpell( OwnerID() , OwnerID() , 850908 )
	SetModeEx( obj,EM_SetModeType_Mark,false )
	SetFightMode ( obj,0, 0, 0,0 ) 
	--CastSpell( OwnerID(),OwnerID(),492453 )
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )
	AddToPartition( obj,0 )
	CallPlot( obj,"lua_Z26_122361_1_2_2_1",OwnerID())
end
function lua_Z26_122361_1_2_2_1( MRO )
	Sleep( 600)
	SetModeEx( MRO, EM_SetModeType_Show, true )	
	SetModeEx( MRO , EM_SetModeType_Mark, true )
	DelObj( OwnerID() )
end
--�ީ�
function lua_Z26_122361_1_4()
	--SearchRangeNPC�|�^�Ǥ@�Ӱ}�C{}�A�o�Ӱ}�C�Ǹ��q0�}�l
	local tmp = SearchRangeNPC( OwnerID(),200 )
	for i = 0 , #tmp , 1 do
		--���k1�G�ؼХu�n�O�Ĥ�
		if ReadRoleValue( tmp[ i ] ,EM_RoleValue_CampID ) ==3  then--�Ĥ�}�笰3
			CastSpell( tmp[ i ] , tmp[ i ] , 850896 )
			SetAttack( tmp[ i ],OwnerID() )
		end
	end

end

function lua_Z26_122361_1_2_test()
DebugMsg( OwnerID() , 1, "star" )
WriteRoleValue( OwnerID(),EM_RoleValue_Register1,0)
end

--���٥��Ȫ�t�ɡAOwnerID�Onpc
---��ܼ@���A��ܳ��O���b���a���W