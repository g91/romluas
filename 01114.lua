function LuaS_111770_0()
	LoadQuestOption(OwnerID())

	if CheckAcceptQuest( OwnerID() , 421581 ) == true and CheckFlag( OwnerID() , 542213 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_0]","LuaS_111770_1",0) --����A�ڭn��@���ҡC
	elseif CheckAcceptQuest( OwnerID() , 421583 ) == true and CheckFlag( OwnerID() , 542289 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_0]","LuaS_111770_2",0) --����A�ڭn��@���ҡC
	elseif CheckAcceptQuest( OwnerID() , 421585 ) == true and CheckFlag( OwnerID() , 542290 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_0]","LuaS_111770_3",0) --����A�ڭn��@���ҡC
	elseif CheckAcceptQuest( OwnerID() , 421587 ) == true and CheckFlag( OwnerID() , 542291 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_0]","LuaS_111770_4",0) --����A�ڭn��@���ҡC
	end

	if CheckAcceptQuest( OwnerID() , 421589 ) == true and CheckFlag( OwnerID() , 542227 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_11]","LuaS_111770_5",0) --����F�I�ڭ�̩p�F��
	end
end

function LuaS_111770_1()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542213 ) == false then
		SetFlag( OwnerID() , 542213 , 1 )
		local Num = Rand(100)
		Num = Num - (math.floor(Num/10)*10) + 1
		AddBuff(OwnerID() , 502490 , Num , -1 )
		GiveBodyItem( OwnerID() , Card[Num] , 1)
	end
end

function LuaS_111770_2()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542289 ) == false then
		SetFlag( OwnerID() , 542289 , 1 )
		local Num = Rand(100)
		Num = Num - (math.floor(Num/10)*10) + 1
		AddBuff(OwnerID() , 502490 , Num , -1 )
		GiveBodyItem( OwnerID() , Card[Num] , 1)
	end
end

function LuaS_111770_3()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542290 ) == false then
		SetFlag( OwnerID() , 542290 , 1 )
		local Num = Rand(100)
		Num = Num - (math.floor(Num/10)*10) + 1
		AddBuff(OwnerID() , 502490 , Num , -1 )
		GiveBodyItem( OwnerID() , Card[Num] , 1)
	end
end

function LuaS_111770_4()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542291 ) == false then
		SetFlag( OwnerID() , 542291 , 1 )
		local Num = Rand(100)
		Num = Num - (math.floor(Num/10)*10) + 1
		AddBuff(OwnerID() , 502490 , Num , -1 )
		GiveBodyItem( OwnerID() , Card[Num] , 1)
	end
end

function LuaS_111770_5()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542227 ) == false then
		SetFlag( OwnerID() , 542227 , 1 )
	end
	PlayMotion( TargetID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
end

function LuaQ_421582_AfterClick()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111771 then
		Tell( OwnerID() , TargetID() , "[SC_542214]" ) 
		--�b�u�H�������v�ک`���ȴ����Y�Q��U�ӫ�A�S�@���]�ګҰ�Q�֧]�F�C�M�ӡA�]�ڤ��۪����v�O�P��g���Ԫ��A���¦b�o���j�����U�B�i�}�ۡC
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111772 then
		Tell( OwnerID() , TargetID() , "[SC_542215]" ) 
		--���ѡA���Է�J�Eű���ש�M�w����ڭ̥��e���Q�סA���y�@��i�H�פ�ɶê��Ť�C�C
		BeginPlot( TargetID() , "LuaQ_Tatasa_Curse_Result" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111773 then
		Tell( OwnerID() , TargetID() , "[SC_542216]" ) 
		--�֦��V�ï�q���T�ҲŤ�ש���F�A�o�O�׺��S���h�@�����u�Ҵ��Ӫ��A���L�L���A���Է�J�|���L�ˤW�t�@����n���A�ѲŤ奴�y�����u�C
	end
	return true
end

function LuaQ_421584_AfterClick()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111774 then
		Tell( OwnerID() , TargetID() , "[SC_542217]" ) 
		--���ѡA�ڭ̱N�֦����j�O�q���Ť�ĤJ�C���A�H�ڭ̪��P��A�k�p�E�������A��@���C���A�L�N�|ź�Ʀۤv��P�o�ⰶ�j���Ť�C�A�û��a�X���@��C
		BeginPlot( TargetID() , "LuaQ_Zone5_Epic_Zo" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111775 then
		Tell( OwnerID() , TargetID() , "[SC_542218]" ) 
		--�C���L�{�J��~�V�K�K�Ť�C�j�P�ƥ��۸T�Ҫ��u�믫�Ť�v��q�A���o�ӱƥ��{�H�A�ڭ̧���L���C
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111776 then
		Tell( OwnerID() , TargetID() , "[SC_542219]" ) 
		--���Է�J�Eű���a�^��10���s�A���Y�`---�Ӧۨ��s�n�z�����q�H���A�L�N�Y�`�b�a�W�Ʀ��k�}�A�ש�A�~�ϱo�Ť�C���A�ƥ��u�믫�Ť�v����q�C
		BeginPlot( TargetID() , "LuaQ_Tatasa_Curse_Result" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111777 then
		Tell( OwnerID() , TargetID() , "[SC_542220]" ) 
		--�i�Ȫ��Ʊ��o�ͤF�I�y�C���Ʊ���������A�Q�A�大���w�w�Ĵ��o�{......���w�묹�F�ۤv���ͩR�A�~�o�H�b�A�大�������ݤU�A�O��F�y�C�a�I�b��B�����K�C
	end
	return true
end

function LuaQ_421586_AfterClick()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111778 then
		Tell( OwnerID() , TargetID() , "[SC_542221]" ) 
		--���Է�J�Eű���M�w�N�Ť�C���ܧ����K���a�I�~��ű�y�A�çG�m�\�h�y�C�����ҨӲV�c�A�H�����A�大���w�w�Ĵ����l���C
		BeginPlot( TargetID() , "LuaQ_Zone5_Epic_Zo" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111779 then
		Tell( OwnerID() , TargetID() , "[SC_542222]" ) 
		--�ڭ̦b�_�誺���I�Q�w�w�Ĵ��o�{�F�A�ݧԪ��]���N�ڭ̦P�񨭤W���Ť�O�q�����ܨ��A�ïd�U�L�̪Ŭ}���ߴߡA�a���b�������̰��B�Aĵ���۩Ҧ����]�ڡA�j�a���W�F......
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111781 then
		Tell( OwnerID() , TargetID() , "[SC_542223]" ) 
		--���Է�J�Eű���M�w�[��ű�C���t�סA�ثe�A�ߦ��N�Ť�C�m���t�@�W�P�w�w�Ĵ���ߪ��]�N�A�~���i��O�@�ڭ̰k���w�w�Ĵ����ƪ��l���C
		BeginPlot( TargetID() , "LuaQ_Tatasa_Curse_Result" , 0 )
	end
	return true
end

function LuaQ_421588_AfterClick()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111782 then
		Tell( OwnerID() , TargetID() , "[SC_542224]" ) 
		--�b�ڭ̪��P��A�Q�A�E��˩�۳̫�@���T�ҲŤ�A�먭���Jű�C���l����A�֦��Ҧ��T�ҲŤ�O�q���Ť�C�ש�ϥͤF�I���Է�J�Eű���ΥL�F�ת��n���A��X�F�o�Ӻ���Ҧ����H�ҷ|�D�����x���W�r-�Ť�C�E���Է�J�C
		BeginPlot( TargetID() , "LuaQ_Zone5_Epic_Zo" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111783 then
		Tell( OwnerID() , TargetID() , "[SC_542225]" ) 
		--�u�Ť�C�E���Է�J�v���M�ϥ͡A�o���³B��H�Τ����A��������k�ӳ���L���ٳQ�ʦL�۪��j�j�O�q�A�Ťk�{�ȨϥΥe�R�i�D�j�a�ߤ@�������k�G�u�Q�n�r���Ť�C�E���Է�J���H�A�����ϥι�ۤv�Ө��̭��n���H���A��A�~�������H�Ϊ��O�q......�v
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111784 then
		Tell( OwnerID() , TargetID() , "[SC_542226]" ) 
		--�w�w�Ĵ��̫��٬O���ڭ̤F�I�L�����g���F�ڭ̦P���A��A�§ڨ��ӡK�K�b���_�𤧫e�A�ڥ����N�کҬݨ쪺�A�M�����O���U�ӡA�w�w�Ĵ����_�F����C�A�ӥL���Ǫ��]�k����A�h��ĳ���A�大���A�Φo���A��ӳ���Ť�C�E�O���̡E���Է�J...
		BeginPlot( TargetID() , "LuaQ_Tatasa_Curse_Result" , 0 )
	end
	return true
end

function LuaQ_Tatasa_Curse_Result()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 10 )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local MonsterID = {[111772] = 100268 , [111776] = 100267 , [111781] = 100574 , [111784] = 100367 }
	local Monster = LuaFunc_CreateObjbyObj(MonsterID[OrgID] , OwnerID() )

	local Buff = {  [1] = 501016 ,[2] = 501007 ,[3] = 502494, [4] = 502495, [5] = 502496,
			[6] = 500918 ,[7] = 502497 ,[8] = 502499 ,[9] = 501011, [10] = 502498 }
	local LV   = {  [1] = 1 ,[2] = 900 ,[3] = 4, [4] = 4,[5] = 4,[6] = 1, [7] = 4,[8] = 49 ,[9] = 74, [10] = 4 }

	local CursePos = Lua_BuffPosSearch( TargetID() , 502490 )
	local Num =  BuffInfo( TargetID(), CursePos , EM_BuffInfoType_Power )

	if AddBuff( TargetID() , Buff[Num] , LV[Num] , 60 ) then
		CancelBuff( TargetID() , 502490 )
	end
	BeginPlot( Monster , "LuaQ_Zone5_Epic_NPCDead" , 0 )
	SetAttack( Monster , TargetID() )
	while 1 do
		if CheckID( Monster ) == False or ReadRoleValue( Monster ,EM_RoleValue_IsNPC ) == 0 or ReadRoleValue( Monster ,EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep(60)
	end
	SetPlot( OwnerID() , "touch" , "" , 0 )
end

function LuaQ_Zone5_Epic_Zo()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 10 )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local MonsterID = {[111774] = 101453 , [111778] = 101454 ,[111782] = 101455 }
	local Monster = LuaFunc_CreateObjbyObj(MonsterID[OrgID] , OwnerID() )
	BeginPlot( Monster , "LuaQ_Zone5_Epic_NPCDead" , 0 )
	SetAttack( Monster , TargetID() )
	while 1 do
		if CheckID( Monster ) == False or ReadRoleValue( Monster ,EM_RoleValue_IsNPC ) == 0 or ReadRoleValue( Monster ,EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep(60)
	end
	SetPlot( OwnerID() , "touch" , "" , 0 )
end

function LuaQ_Zone5_Epic_NPCDead()
	LuaFunc_Obj_Suicide(150)
end