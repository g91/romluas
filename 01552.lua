function LuaS_422743()----
	if  CheckFlag(OwnerID(), 543336) == false and CheckAcceptQuest( OwnerID(),  422743 ) == true then
		if CountBodyItem( OwnerID() , 205890) <1 then  
			SetSpeakDetail( OwnerID(), "[SC_422743_0]"  ) --�A���|�b�o�H
		end
		if  CheckFlag(OwnerID(), 543336) == false and CheckAcceptQuest( OwnerID(),  422743 ) == true and CountBodyItem( OwnerID() , 205890 ) >0 then
			SetSpeakDetail(OwnerID(),"[SC_422743_2]")---�A......���M�S���H
			AddSpeakOption( OwnerID(), TargetID(), "[SC_422743_1]" , "LuaS_422743_1", 0)--- [113443]�A�U�ڱN�s��e�^���A�C
		end
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_422743_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_422743_2", 0)
end
function LuaS_422743_2()------
	DisableQuest(OwnerID() ,true)
	DelBodyItem ( TargetID(), 205890 , 1 )	
	SAY(OwnerID(),"[SC_422743_3]" )-----�J�M�A�S���A�]�N�N���A�H����......
	sleep(20)
	SAY(OwnerID(),"[SC_422743_4]" )----�q�H�e�ڤ@�����ݵ۳o�@�Ѫ���ӡC
	sleep(20)
	SAY(OwnerID(),"[SC_422743_5]" )----�M�Ӧ���A�o���M�Y���C
	sleep(20)
	SAY(OwnerID(),"[SC_422743_6]" )----�}�F�s�A�ڴN���U�I
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
	SAY(OwnerID(),"[SC_422743_7]" )----��a���A�^�h�i�D
	sleep(20)
	SAY(OwnerID(),"[SC_422743_8]" )---�L��ڪ������R�A�q�{�b�_�@���Į��I
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SHIELD_BASH)
	SAY(OwnerID(),"[SC_422743_9]" )--�U���b�����A�N�O���ġC
	sleep(20)
	CastSpell(OwnerID(),TargetID(),491276)
	sleep(20)
	Hide(OwnerID())
	sleep(60)
	if CheckID( TargetID() ) == true and CheckAcceptQuest( TargetID(),422743) == true then
	Setflag(TargetID(),543336,1)
	end
	sleep(20)
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false)
end
---------------------------------------------------
---------------------------------���O�L�h
function LuaQ_422744()
	SetPlot( OwnerID() , "touch" , "LuaQ_422744_1" , 40 )
end
function LuaQ_422744_1()
	if (CheckAcceptQuest(OwnerID(),422744)==true )and(CheckFlag(OwnerID(),543343)==false )and(CountBodyItem (OwnerID() ,204067)>0) then
		DisableQuest( TargetID(), true )
		DelBodyItem ( OwnerID() , 204067 , 1 )
		local Ball = LuaFunc_CreateObjByObj( 113440, TargetID() ) 
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		Lua_ObjDontTouch( Ball ) 
		AddToPartition( Ball , RoomID )
		CastSpell( Ball , Ball , 493776 )
		sleep(20)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_1]" , "0xffffc600" )--- �w�g�֤ܲF.......�ڤ��Q�A���F�A�I�ڪ�����[113443]�I�ҥH�ڿ�ܤF�o�ؤ覡�K�K�ӧi�D�A�A�ڪ��W�J�I
		ScriptMessage( Ball ,  0 ,  0, "[SC_422744_1]" , "0xffffc600" )--- �w�g�֤ܲF.......�ڤ��Q�A���F�A�I�ڪ�����[113443]�I�ҥH�ڿ�ܤF�o�ؤ覡�K�K�ӧi�D�A�A�ڪ��W�J�I
		sleep(40)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_2]" , "0xffffc600"  )---�H�e���`�O�{���j�j���O�q�~�O�ڥͩR���@���I����{�ѤF�A�A�{�ѤF���p��g���A�ڤ~���ܦۤv���Q�k�C
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_2]" , "0xffffc600"  )---�H�e���`�O�{���j�j���O�q�~�O�ڥͩR���@���I����{�ѤF�A�A�{�ѤF���p��g���A�ڤ~���ܦۤv���Q�k�C
		sleep(30)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_3]" ,"0xffffc600" )--[113443]......�A���g���L�H�������P�ܩ_���A����ƪ��u�n��J�F�P���A�N�|���ƪ������ܱo���@�ˡC
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_3]" ,"0xffffc600" )--[113443]......�A���g���L�H�������P�ܩ_���A����ƪ��u�n��J�F�P���A�N�|���ƪ������ܱo���@�ˡC
		sleep(30)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_4]" , "0xffffc600"  )--�{�b���ڴN�b��|�o�ؤ߹ҡK�K��ڦӨ��A�A�M���p��g�����O�ڥͩR���̭��n���H�C
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_4]" , "0xffffc600"  )--�{�b���ڴN�b��|�o�ؤ߹ҡK�K��ڦӨ��A�A�M���p��g�����O�ڥͩR���̭��n���H�C
		sleep(40)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_5]" , "0xffffc600"  )--�ҥH�ڨM�w��ܹ�A�Z�աA�ñN�o���]�k������e���A�A���R�B�ӨM�w���U�ӨƱ����o�i
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_5]" , "0xffffc600"  )--�ҥH�ڨM�w��ܹ�A�Z�աA�ñN�o���]�k������e���A�A���R�B�ӨM�w���U�ӨƱ����o�i
		sleep(30)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_6]" , "0xffffc600"  )--�ڥH�μƤQ�~������~�Ӫ̡A�ƹ�W�O�Ӧ۬Y�Ӱl�D�j�j�O�q����´�������C
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_6]" , "0xffffc600"  )--�ڥH�μƤQ�~������~�Ӫ̡A�ƹ�W�O�Ӧ۬Y�Ӱl�D�j�j�O�q����´�������C
		sleep(30)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_7]" , "0xffffc600"  )--�ڭ̨��R�Ө�[ZONE_DIMARKA]�A�æb���i�}��s���d�A�H�Ψ��o[ZONE_DIMARKA]���j���K�K�H�ΰ���Ҧ��o�쪺���O
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_7]" , "0xffffc600"  )--�ڭ̨��R�Ө�[ZONE_DIMARKA]�A�æb���i�}��s���d�A�H�Ψ��o[ZONE_DIMARKA]���j���K�K�H�ΰ���Ҧ��o�쪺���O
		sleep(60)
		if CheckID( OwnerID() ) == true and CheckAcceptQuest( OwnerID() , 422744) == true then
		SetFlag(OwnerID(),543343,1)
		end
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_8]" , "0xffffc600" )--�ڥ����A�t��Ҧ����R�O�K�K�M�ӡA�ڪ��߫o�ɱ`�b�A�P��´���\���ۡC
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_8]" , "0xffffc600" )--�ڥ����A�t��Ҧ����R�O�K�K�M�ӡA�ڪ��߫o�ɱ`�b�A�P��´���\���ۡC
		sleep(40)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_9]" , "0xffffc600"  )--�ڴ��i�D�A�L�ڬO�t��K�K�@�ͤ����S������ˤH�A�b���p��g������A�ڴN��A���ڪ��ˤH�F�K�K
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_9]" , "0xffffc600"  )--�ڴ��i�D�A�L�ڬO�t��K�K�@�ͤ����S������ˤH�A�b���p��g������A�ڴN��A���ڪ��ˤH�F�K�K
		sleep(40)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_10]" , "0xffffc600"  )--�M�Ӳ�´�o�O�ڱq�p��j�Ҩ̾a���H���H�Ψ̾a�K�K
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_10]" , "0xffffc600"  )--�M�Ӳ�´�o�O�ڱq�p��j�Ҩ̾a���H���H�Ψ̾a�K�K
		sleep(40)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_11]" , "0xffffc600" )--�ڵL�k���˩����@��A�u��Q�X�o�˥i������k�A���R�B�ӨM�w�@���K�K
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_11]" , "0xffffc600" )--�ڵL�k���˩����@��A�u��Q�X�o�˥i������k�A���R�B�ӨM�w�@���K�K
		sleep(40)
		ScriptMessage( Ball, 0 , 1 ,  "[SC_422744_12]" ,"0xffffc600" )--�����A�o�{�o�ӪF������ê����K�ɡA�]�\�ڭ̤w�g���}�y�F�H�]�\�٨S���H
		ScriptMessage( Ball, 0 , 0 ,  "[SC_422744_12]" ,"0xffffc600" )--�����A�o�{�o�ӪF������ê����K�ɡA�]�\�ڭ̤w�g���}�y�F�H�]�\�٨S���H
		sleep(30)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_13]" , "0xffffc600"  )--��I���L�֦b�N�O�H�ڥu�Ʊ�A��̸ѧڪ��W�J�I
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_13]" , "0xffffc600"  )--��I���L�֦b�N�O�H�ڥu�Ʊ�A��̸ѧڪ��W�J�I
		sleep(30)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_14]" , "0xffffc600"  )--[113443]�A�A���g���L���B�͡A�A�N�����L�񪺫H���A�M�ӧڭI�q�F�A���H���C
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_14]" , "0xffffc600"  )--[113443]�A�A���g���L���B�͡A�A�N�����L�񪺫H���A�M�ӧڭI�q�F�A���H���C
		sleep(30)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_15]" , "0xffffc600" )--�ڨëD�������A.......�u�O.......
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_15]" , "0xffffc600" )--�ڨëD�������A.......�u�O.......
		sleep(40)
		CastSpell( Ball , Ball , 493776 )
		sleep( 10)
		Delobj( Ball )
		DisableQuest( TargetID(), false )
		else
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_421177_16]", 0 )-------�A�S������F��ݭn�U�N�I
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_421177_16]", 0 )-------
		end
end
--------------------------------------------------------------------------------------
function LuaS_422772_AK()
	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422772_AK1]" )----�y�y�y��Ӧ��I�u�Ӧ��I
	SLEEP(20)
	Say( OwnerID() , "[SC_422772_AK2]" )----�گu�O�ӲV�b.......�]���ڪ��t�G�A���ڪ����ͻX���M��......
	---PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	SLEEP(20)
	Say( OwnerID() , "[SC_422772_AK3]" )---�y�y��ڮڥ��S�����A�b�o�̾i�f�I
	---PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	SLEEP(20)
	DisableQuest( OwnerID() , false ) 
END

















