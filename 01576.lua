function LuaS_422807_1()
	SetSpeakDetail(OwnerID(),"[SC_422807_2]")-------
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422807_3]","LuaS_422807_2",0)---1
end
function LuaS_422807_2()
	SetSpeakDetail(OwnerID(),"[SC_422807_4]")
	SetFlag( OwnerID() , 543420 , 1 )
end
function LuaS_422807_3()--������
	DisableQuest( OwnerID() , true)
	SetPlot(  OwnerID()  ,   "touch" ,  "LuaFunc_Obj_BUSY"  , 40  )
	local KK = Lua_DW_CreateObj("flag" ,113687,780432,0,1 )
	DW_MoveToFlag( KK,780432,1, 0,1)
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN)    
	Yell( KK , "[SC_422807_5]" , 3 ) ----����~���A�V�|�I�V�|�IruFUSION_ACTORSTATE_CAST_SP03
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
	DW_MoveToFlag( KK,780432,2, 0,1)
	Yell( OwnerID() , "[SC_422807_6]" , 3 ) ---�o�ͤF����ơH[113687]�H���n�۫�A�C�C���CruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( KK , "[SC_422807_7]" , 3 ) --[113687]��[113687]�A�ݨ�n�h�a�H�b��ϴ˪L�̪��Q�b�ƫ᪺[101795]�I
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
	sleep(30)
	Yell( KK , "[SC_422807_8]" , 3 ) --�L�̦n�a�A�n�a�I[113687]�A�u�O���L�h�s�L�̤��n�ۭt�e�̡I
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_INSTANT)  
	sleep(30)
	Yell( KK , "[SC_422807_9]" , 3 ) --�N�Q�L�̽��@�ǡA�L���ٻ��n�N[113687]����Ⱞ�A�M�e�̤@�_������M�C
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT)  
	sleep(30)
	Yell( KK , "[SC_422807_10]" , 3 ) --����~[113687]ť��L�̻����U�ӭn��[102754]�U��A�ܨ��e���W����q�A�ҥH[113687]�ܧV�O���]�^�ӡA�n�i�D���C
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP03)    
	sleep(30)
	Yell( OwnerID() , "[SC_422807_11]" , 3 ) ---�ڪ��D�F�C���n�A���F�A[113687]�A�����ڬ��A�v¡�ˤf�C
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_USE)
	sleep(20)
	CastSpell(KK,OwnerID(),494494)--�I��ޯ�C
	sleep(20)
	Yell( KK , "[SC_422807_12]" , 3 )---�h��n�h��I
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP02)  
	sleep(20)
	Yell( OwnerID() , "[SC_422807_13]" , 3 ) ---[113687]�A�ԭ@��A�A�L�@�|��N���k�F�C
--	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(20)
	Yell( KK , "[SC_422807_14]" , 3 )---[113687]�A���h�A�@�I�����h�C��......���n��[113687]���L�C
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP02)  
	sleep(20)
	Yell( KK , "[SC_422807_15]" , 3 ) ---[113687]�N�n�M[[113634]�@�ˤj�F�I�i�H�������n�h�n�h�Ʊ��I�ҥH[113687]���h�A�@�I�����h�I
	sleep(20)
--	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT)  
	Yell(  OwnerID()   , "[SC_422807_16]" , 3 )----[113687]�K�K
	sleep(20)
	DW_MoveToFlag( KK,780432,2, 0,0)
	Yell( KK , "[SC_422807_17]" , 3 )---[113687]�@�I�����h�A[113687]�٭n�~�򬰯��ʵ��˪L�A[113687]�n���W�h�I�o��[113687]�|���b�t�B�A�����n���L�C
	sleep(20)
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_END)
	DW_MoveToFlag( KK,780432,1, 0,0)
	DisableQuest(OwnerID(),false)
	SetPlot(  OwnerID()  ,   "touch" ,  ""  , 0  )
	DW_MoveToFlag( KK,780432,3, 0,1)
	sleep(20)
	delobj(kk)
end

--------------------------------------------------------
function LuaS_422808_0() --����W����l	�d��@��
	SetPlot(OwnerID(),"range","LuaS_422808_1",150)
end

function LuaS_422808_1() -- �d��@��	����
--Ĳ�I�̬O�_	��������&�|������
	if	CheckAcceptQuest(OwnerID(),422808)	and
		CheckFlag(OwnerID(),543446)==false	then
--��ܦr�괣��
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422808]", 0 );
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422808]", 0 );---���G�N�O�N�O�o�̤F�I
--�����������ȺX��
	end
end

function LuaS_422808_2()--���~�ϥ�	�ˬd�@��
--�P�_�Z���O�_�L��
	if	CheckAcceptQuest( OwnerID() , 422808 ) == false or CheckCompleteQuest( OwnerID() , 422808 ) == true or CheckFlag( OwnerID() , 543446 ) == true then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_7]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_7]",0)
		return false
	end
	if	not	DW_CheckDis(OwnerID(),780432,4,600)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_3]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_3]",0)
		return false
	end
	if	not	DW_CheckDis(OwnerID(),780432,4,400)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_4]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_4]",0)
		return false
	end
	if	not	DW_CheckDis(OwnerID(),780432,4,300)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_5]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_5]",0)
		return false
	end
	if	not	DW_CheckDis(OwnerID(),780432,4,150)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_6]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_6]",0)
		return false
	end
	return true
end


function LuaS_422808_3()--���~�ϥ�	����@��
	--AddBuff( OwnerID(),505052 , 1 , 10 )---
--�@����{	�إX�@�Ӥg��
	castspell(OwnerID(),OwnerID(),490098)---�k�N
--�r��^�X
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422808_2]", 0 )----�A�]�U�F���ɡC
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422808_2]", 0 )-----�A�]�U�F���ɡC
--���������X��
	SetFlag(OwnerID(),543446,1)
	--return true
end
function LuaS_422808_4()
	while 1 do
		AddBuff(OwnerID() , 500902 , 0 , 60 )
		sleep( 600 )
	end
end
function LuaI_113667_0()
	local KK = Lua_DW_CreateObj("flag" ,113907,780432,5,1 )
	 Lua_ObjDontTouch( KK ) 
	BeginPlot( KK , "LuaS_422808_4",0 )
	SetPlot(OwnerID(),"range","LuaS_422808_1",150)
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN )
end
function LuaS_113667_0()
	if CheckFlag( OwnerID() , 543446 ) ==true or CheckCompleteQuest( OwnerID() , 422808 ) == true then
		LoadQuestOption( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_422808_8]")
	end
end

function LuaS_113907()	--����
--	while true do
--		sleep(20)
--		CastSpell( OwnerID(), OwnerID(), 494492)
--	end
end
-------------------------------------------------------------------------------------------------------
function LuaS_422809_1()---���b�L�먭�W�C
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422809)==true )and  (CheckFlag(OwnerID(),543421)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_422579_1]","LuaS_422809_2",0)--- �@�N
	end
	if (CheckAcceptQuest(OwnerID(),422811)==true )and (CheckFlag(OwnerID(),543426)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_1]","LuaS_422811_1",0)----�ڷǳƦn�F�A�ڭ̨��a�I 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_2]","LuaS_422811_2",0)----�٨S�㵥���ڡA�A�y���ڤ@�U�I 
	end
	if (CheckAcceptQuest(OwnerID(),422811)==true )and (CheckFlag(OwnerID(),543426)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_1]","LuaS_422811_3",0) 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_2]","LuaS_422811_2",0)----�٨S�㵥���ڡA�A�y���ڤ@�U�I 
	end

end

function LuaS_422809_2()
	SetSpeakDetail(OwnerID(),"[SC_422809_1]")---�n
end

function LuaS_422809_3()---���b�c�l�W�C
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422809)==true )and  (CheckCompleteQuest( OwnerID(), 422809) ==false ) and CheckBuff( OwnerID() , 505024) == false then
		if (ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0) and CheckFlag( OwnerID() ,543421) == false then
			AddSpeakOption(OwnerID(),TargetID()," [SC_422809_2]","LuaS_422809_4",0)---���i�h�C
		else
			AddSpeakOption(OwnerID(),TargetID()," [SC_422809_2]","LuaS_422809_5",0)---���i�h�C			
		end
	end
end

function LuaS_422809_4()
	CloseSpeak( OwnerID() )
	WriteRoleValue(TargetID(),EM_RoleValue_PID,1)
    	BeginPlot( TargetID(), "LuaS_422809_6", 0)
end

function LuaS_422809_5()
	SetSpeakDetail(OwnerID(),"[SC_422809_3]")----�A�L�k���i[113763]�A���Y���G�w�g�˺��F���~�C
end

function LuaS_422809_6()---�X�Шϥ�780466--�t���Ϊ��Ⱖ�C�����n�X�СACLIENT �����쥻�������C�X�{�t�������Ⱖ�C113705
	local KK = Lua_DW_CreateObj("flag" ,113705,780466,0,1 )
	local FF = Lua_DW_CreateObj("flag" ,113813,780466,1,1 )
	local lk = Lua_DW_CreateObj("flag" ,113568,780466,3,1 )----
-----	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	AddBuff( TargetID(), 505024 , 1 , 600)---�����a�ܦ��c�l�ABUFF�٥��]�C�T�w��C�ç�쥻��NPC��CLIENT ���ð_�ӡC�p�G��BUFF�A�ݤ���c�l�C
	AddBuff( TargetID(), 505053 , 1 , 600)---
	local Me = Role:new( OwnerID() )
	ChangeZone( TargetID() , Me:ZoneID() , Me:RoomID() , Me:X() , Me:Y() , Me:Z() , Me:Dir() )
	sleep(20)
	Yell( KK , "[SC_422809_4]" , 3 )---����֬ݬݡI�֬ݬݡI[113685]�b�����̧��F����F��C
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
    sleep(30)
	Yell( FF , "[SC_422809_5]" , 3 )---����F��H
	sleep(25)
	Yell( KK , "[SC_422809_6]" , 3 )---���K�C[113685]�N�o�ӪF���b����I���n�b[113685]���}��A�b���}�CruFUSION_ACTORSTATE_EMOTE_IDLE1
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP02)
	sleep(30)
	Yell( FF , "[SC_422809_7]" , 3 )---��......�ڪ��D�F�A[113685]�C
	sleep(25)
	Yell( KK , "[SC_422809_8]" , 3 )---�٤��ॴ�}��A�n��[113685]���}......
    DW_MoveToFlag( KK,780466,2, 0,1)---�]��
    sleep(20)
	Yell( FF , "[SC_422809_9]" , 3 )---�|�O����O�H
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep(35)
	ScriptMessage( TargetID()  , TargetID(), 0 , "[SC_422809_10]" ,  "0xffbe9649" ) ---[113633]���_���m�b�@�Ǫ����~��A�o�X�F�L�L���ۮ��n�C
	ScriptMessage( TargetID()  , TargetID(), 1 , "[SC_422809_10]" ,  "0xffbe9649" ) 
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT) 
	sleep(30)
	Yell( FF , "[SC_422809_11]" , 3 )---�o������K�K
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep(20)
	Yell( FF , "[SC_422809_12]" , 3 )----�ݨӮɶ����G�ٹL�o�����[�A�٨S�[�����ڧѤF�A�A[102775]�C
	local lk = Lua_DW_CreateObj("flag" ,113936,780466,3,1 )----
	CastSpell(lk,FF,493688)---�ժܹ�v�檫��I�k�H�ժܤ�W�s�L�h���F��H[�|���D�k�N]
	sleep(10)
	local SS = Lua_DW_CreateObj("flag" ,113908,780466,3,1 )----�w�w�Ĵ��`���S���C
	sleep(20)
	Yell( FF , "[SC_422809_13]" , 3 )--�@�w���N�L�F�d�~�A���b������٬O�q���ѫo�A�K�K[102775]�C
	sleep(30)
	Yell( SS , "[SC_422809_14]" , 3 )---[113633]�A���......
	sleep(20)
	Yell( FF , "[SC_422809_15]" , 3 )---����̫�A���٬O�S�N�o����`�A��������嵹��h�C
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	sleep(30)
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_END)
	Yell( SS , "[SC_422809_16]" , 3 )---�ڸӦp���A����ڪ���}�H�p�G�A�Ҭõ����ᦷ�A��N���ڪ���}�A����o�@�ɤW���ᦷ�A�������HruFUSION_ACTORSTATE_EMOTE_POINT
	PlayMotion(  SS,ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(30)
	Yell( SS , "[SC_422809_17]" , 3 )---�ڴ��V�p���_�u��o��[���ͩR�O�_���P���[���t�W�v���ðݡC
	PlayMotion(  SS,ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(30)
	Yell( SS , "[SC_422809_18]" , 3 )---�{�b�w�g�������ѵ��C
	PlayMotion(  SS,ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(30)
	Yell( SS , "[SC_422809_19]" , 3 )---�����F�ڡA�p���ͩR�N��o����C
	Yell( FF , "[SC_422809_19]" , 3 )---�����F�ڡA�p���ͩR�N��o����C
	sleep(30)
	Yell( FF , "[SC_422809_20]" , 3 )--�ڨ�{�b�ٰO�o�A���o�Ǹܪ������C�M�ӧ��٬O�����աK�K	ruFUSION_ACTORSTATE_EMOTE_SALUTE
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	sleep(30)
	Yell( FF , "[SC_422809_21]" , 3 )--�����ճo�Ǳ��P�K�K�N�p�P������[113691]����A�����P�C
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( FF , "[SC_422809_22]" , 3 )--���ǿ@�����P�����P�A�ױN�|�ˮ`�A�B�ڡC�H���p�G���`��ۨ������P�A�ױN�ɭP�����K�K
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( FF , "[SC_422809_23]" , 3 )--�ӧA�A�`�O���ڷPı���ߩȡC�w�C���߱N�H�ۧA�@�P�_�R�C
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( SS , "[SC_422809_24]" , 3 )--[113633]�A�A�u�O���ϡA�ä��O���I���U�F���Ϫ������A�p�u�O�ӤH�A���ڵ������_���k�H�A�ҥH�߱�A���ǵL�p���R�A�M�ڤ@�_���}�o�C
	sleep(40)
	Yell( FF , "[SC_422809_25]" , 3 )--�M�ӧA�����F�K�K�ڤ��u�O�Ӥk�H�A�ӥB�O�Ө������Ϫ��H���A����P�ڪ��ѡA�Ǽ����ѡB�@�ϱY�쪺���F�o�N�O�����ɪ��ϩR�C
	sleep(30)
	Yell( FF , "[SC_422809_26]" , 3 )--�ڵL�k�P�A�@�P���}�K�K�ڱq�S�ᮬ�L�ڪ���ܡC
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( FF , "[SC_422809_27]" , 3 )---�M��[113691]�X�{��o���ܤF�ڪ��Q�k�A�o���ڵoı�ۤv�·t�B�ۨp�����@���K�K�H�εL�ର�O�K�K
	sleep(30)
	Yell( FF , "[SC_422809_28]" , 3 )--[102775]......�p�G�ɶ�����ˬy......
   	sleep(30)
	SAY(SS,"[SC_422809_30]")--[113633]�A�ڻ��L�|�O�@�p�C�Y�ϬO�o����p����A�]��Ƭ��u�@�p���O�q�C
	DW_MoveToFlag( KK,780466,3, 0,1)
	Tell(TargetID() ,KK, "[SC_4227809_29]")------�N�O�{�b�A[$PLAYERNAME]�A�M[113685]�@�_����ө_�Ǫ��H�C
	if 	CheckID(targetID()) == true and CheckBuff( targetID() , 505024)==true	then
   			CancelBuff(targetID() , 505024 )
	end
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP02)
--	SetRoleCamp(SS,"Monster")
--	SetFollow( KK ,SS )
--	SetAttack(SS,TargetID())
--	BeginPlot( SS, "LuaS_422809_7", 0 )
--	CallPlot(SS,"LuaFunc_Obj_Suicide",50)
	
--	while true do--�ˬd
		sleep( 10 )
--			if CheckID(SS) == false then
--				SetFollow( KK , -1 )
				if	CheckID( TargetID()) == true and CheckAcceptQuest( TargetID() , 422809)==true 	then
					SetFlag(TargetID() ,543421,1)
				end
				Delobj(SS)
				CastSpell(lk,FF,493688)---�ժܹ�v�檫��I�k�H�ժܤ�W�s�L�h���F��H[�|���D�k�N]
				sleep( 10)
				Delobj( lk)
				Yell( FF , "[SC_422809_31]" , 3 )---[$PLAYERNAME]�H[113685]�H
				PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
				sleep(20)
				Yell( KK , "[SC_422809_32]" , 3 )---���O���A���O���A[113685]�A�u�O�Q����ӤH�C 
				PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN)      
				sleep(20)
				Yell( KK , "[SC_422809_33]" , 3 )---�����F�ܡH[113685]�H�����㯫���n�Q��[113685]�C
				PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
				sleep(20)
				DW_MoveToFlag( KK,780466,0, 0,1)
				sleep(20)
				if CheckID(targetID()) == true and CheckBuff( targetID() , 505053)==true	then
   					CancelBuff(targetID() , 505053 )
				end
				delobj(KK)
				delobj(FF)
				WriteRoleValue(OwnerID(), EM_RoleValue_PID,0)
--				break
--			end
--	end
end

-----���b�w�w�Ĵ����W�� 
function LuaS_422809_7()---�����X�СC
	local TempID
	for	i=0 , HateListCount( OwnerID() )-1 do----- �@�}�l���ɭ� �n�D"�^��"OwnerID()���u����C��v�� "���h�֭Ӫ���"���]�ڧ�쪺�Ox   �]�@��for�j�� i=1,x-1  ���L�]�o��h��
		TempID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )-----�AEM_HateListInfoType_GItemID==>���o"����C��"�u�Ӧ�m������v���u�C����ID�v(���L���H��ID)----�h��  OwnerID() ������C�� ������ i �Ӧ�m�����󪺡u�C���� ID�v
		if	CheckAcceptQuest( TempID , 422809)==true 	then
			SetFlag(TempID,543421,1)
		end
	end
end
---------
function LuaS_422809_8()---�ժ�
	BeginPlot( TargetID() , "LuaS_422809_9" , 0 )
end
function LuaS_422809_9()
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422809_34]",  "0xffbe9649"   )--[113685]�G�A�èS����������C�O���F�K�K
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(),  0, "[SC_422809_35]",  "0xffbe9649"   )---[113683]�G�A�����ߧڦ���F�A�گ�Pı��䤤���ŷx�A�ҥH�O���F�C
end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_422810_check()---���b���~�W �����ˬd�ϥι�H�C

	if CountBodyItem( OwnerID() , 206186 ) > 0 or CheckAcceptQuest(OwneRID() , 422810 ) == false or CheckCompleteQuest( OwnerID() ,422810 ) == true then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_7]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_7]",0)
		return false
	end
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102755	then -------
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_0]", 0 ); -----�o��[206166]�L�k��[102755]�H�~���ͪ��ϥΡC
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422810_0]", 0 ); -----�o��[206166]�L�k��[102755]�H�~���ͪ��ϥΡC
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 70  then -------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_1]", 0 ); -----�Z���ӹL�����A�L�k�ϥΡC
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422810_1]", 0 ); -----�Z���ӹL�����A�L�k�ϥΡC
		return false
	end
	

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_2]", 0 ); ----[102755]���b��ܤ��A�A�L�k���Q�ϥ�[206166]�C
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422810_2]", 0 ); ----[102755]���b��ܤ��A�A�L�k���Q�ϥ�[206166]�C
		return false
	end

	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_6]" , 0 ) --�e�w�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_6]" , 0 )
		return false
	end
	UseItemDestroy() 
	return true
end	
function LuaS_422810_1()
	--CastSpell( TargetID() , OwnerID() , 492681 )----�|����ܮ������S�ġC492184
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_3]", 0 ); -------�A���[206166]�F�I
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422810_3]", 0 ); 
	--sleep(10)
	--DelBodyItem(OwnerID(),206166,1)
	GiveBodyItem(OwnerID(),206186,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end

function LuaS_422810_2()---�j��]�X�ӡA�ժܬy�媺�S�ġC
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID() ,505050 ,1 ,150 )
	SetPlot(  OwnerID()  ,   "touch" ,  "LuaFunc_Obj_BUSY"  , 40  )
	--Local FF = Lua_DW_CreateObj("flag" ,113684,780466,1,1 )
	Local TT = Lua_DW_CreateObj("flag" ,113686,780466,0,1 )
	Yell( OwnerID() , "[SC_422810_4]" , 3 )---�o�O......
	sleep(10)
	local KK = Lua_DW_CreateObj("flag" ,102755,780466,1,1 )---
	WriteRoleValue( KK , EM_RoleValue_LiveTime , 5 )
	SetRoleCamp( KK  , "Visitor" ) 	
	DisableQuest( KK , true )
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_HURT_CRITICAL) 
	CastSpell(OwnerID()  , OwnerID()   , 492667)---�ժ� ��y���aruFUSION_ACTORSTATE_HURT_CRITICAL
	BeginPlot( KK,"LuaS_422810_4" , 0)
	AddBuff( OwnerID()  , 503974 , 1 , 60 )
	Yell( OwnerID()  , "[SC_422810_5]" , 3 )---��ӯu���O�p......�{�ȮR.�A�ڨӤ��ή��Ϫ��i���F��......
	sleep(30)
	Yell( TT , "[SC_422810_6]" , 3 )---���I���F�H�y�F�n�h��......
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
	sleep(25)
	Yell(OwnerID()  , "[SC_422810_7]" , 3 )---���n�W�i......[113685].......�ڨS��.....
	local MM = Lua_DW_CreateObj("flag" ,113814,780466,5,1 )----�Ȧ̹p�J���X�{�C
	sleep(10)
	BeginPlot( MM,"LuaS_422810_3" , 0)
	sleep(50)
	Yell(OwnerID()  , "[SC_422810_20]" , 3 )---�o�ͤF����ơH�ɭP�A���p���ðݡH
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(70)
	Yell( OwnerID()  , "[SC_422810_12]" , 3 )---�]�\�O�b�Ƥ�������......[113690]�O�~�ߡA�ڱN�ɧکү઺�N�L�̪v¡�����C
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( TT , "[SC_422810_14]" , 3 )---���A���n�I�p��~�y�F�n�h��A��[113685]�h�I���d�b�o�̥𮧡I
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_SP02)
	sleep(30)
	Yell(OwnerID()  , "[SC_422810_15]" , 3 )---[113685]......�ͩR���O�C���C
	sleep(30)
	Yell( TT , "[SC_422810_16]" , 3 )---�����O�H�����ͩR�N�O�C���F�ܡH[113685]�A�����I���n���I���n�������J�M�I�����I
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	Yell( TT , "[SC_422810_17]" , 3 )---[113685]�|�M[$PLAYERNAME]�@�_�h�I[113685]�M[$PLAYERNAME]�|����[113690]�b�ơB���d�C
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_SP01)
	sleep(20)
	Yell( TT , "[SC_422810_18]" , 3 )----�������n[113685]�A�ݦb�o�̥𮧡C
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_SP01)
	sleep(30)
	Yell( OwnerID()   , "[SC_422810_19]" , 3 )----[113685].......
	if 	checkID(TargetID())==true then
		CancelBuff( TargetID() ,505050  )
	end
	delobj(TT)
	--delobj(FF)
	SetPlot(  OwnerID()  ,   "touch"   ,  ""  ,  0 )
	DisableQuest( OwnerID() , false )
end

function LuaS_422810_3()
	Yell( OwnerID() , "[SC_422810_8]" , 3 )--�ժܡA�ڦ��ܷQ�ݧA�I
	sleep(10)
	DW_MoveToFlag( OWNERID(),780466,3, 0,1)
	Yell( OwnerID() , "[SC_422810_9]" , 3 )--�A���e�һ����b�ƪ��Ʊ����O�b���F�ڶܡH
	sleep(30)
	Yell(OwnerID() , "[SC_422810_10]" , 3)--���e�A�ҭn�ڲb�ƪ����ǩǪ��A�p����[��ķ�E���b�o�ޤf����Aŧ���۩Ҧ������H�C
	sleep(30)
	Yell(OwnerID() , "[SC_422810_11]" , 3)---�L�̪����F�èS���]���ӨI�I�U�ӡA�o�s���O���^�ơH
	sleep(30)
	Yell(OwnerID() , "[SC_422810_13]" , 3)---�A�̦n�֤@�I�I
	DW_MoveToFlag( OWNERID(),780466,6, 0,1)
    	DW_MoveToFlag( OWNERID(),780466,7, 0,1)
    	delobj(OwnerID() )
end

function LuaS_422810_4()
	MoveToFlagEnabled( OwnerID() ,false )
	DW_MoveToFlag( OwnerID() ,780466,5, 0,0)
	DisableQuest( OwnerID()  , false )
	DELobj(OwnerID() )
end
-----------------------------------------------------------


function LuaS_422811_2()
	SetSpeakDetail(OwnerID(),"[SC_422811_3]")---�����㫢��㫢��㫢���A[113685]�n�[�S�s���n�X�ӧ���Q���C[$PLAYERNAME]�n�F�ܡH�����L�_�I�̪��@�U�A�N�O�@�ӧ���Q���A[113685]�w�g���F�n�X�ӧ���Q���A�w�g�L�F�n�X�U
end
function LuaS_422811_3()
	SetSpeakDetail(OwnerID(),"[SC_422811_4]")---�����A[$PLAYERNAME]�I[113685]�Q������_�@�ǦA�h�A[113685]���Q�����D�J�M�I�A�A�X�ӧ���Q���N�n�F�I�n���n�H
end
function LuaS_422811_1()
    CloseSpeak( OwnerID())
	if (CheckAcceptQuest(OwnerID(),422811)==true )and (CheckFlag(OwnerID(),543426)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)then
		BeginPlot( TargetID(), "LuaS_422811_4", 0)
	end
end
function LuaS_422811_4()---�HBUFF����A���a�U�u�B�X�l780468 �C��������--�p�G���W��BUFF �~�X�{�Ǫ��C
	CastSpell(OwnerID(),OwnerID(),   494470 )
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)----�b113685���W�g�J�A�����U�@�ӤH���C
	local KK = Lua_DW_CreateObj("flag" ,113643,780466,0,1 )--�۳�XKK
	SetModeEX( KK , EM_SetModeType_Strikback	 , true )
	SetModeEX( KK , EM_SetModeType_Fight	 , true )
	DisableQuest( KK , true )
--	WriteRoleValue( KK , EM_RoleValue_Register ,TargetID() )----�bKK���W�g�J���a�C
	SetPlot( KK , "dead" , "LuaS_KK_Dead" , 0 )
	BeginPlot(KK , "LuaS_422811_5" , 0 )
	while true do--�ˬd
		sleep( 10 )
		if CheckID(KK) == false or ReadRoleValue( KK , EM_RoleValue_IsDead)== true  then  --���` 
		   writeRoleValue( OwnerID() , EM_RoleValue_PID,0)  
			break
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end

function LuaS_KK_Dead()
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 102804 then
		local TempID
		for	i=0 , HateListCount( OwnerID() )-1 do 
			TempID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )----
			if	CheckAcceptQuest( TempID , 422813)==true	then
				SetFlag( TempID, 543445, 1 )
			end
		end
	end
	return false
end


function LuaS_MM_Dead()
	SetAttack( OwnerID() , TargetID() )
	return false
end

function LuaS_422811_5()--KK�]�k�N,�k�N���X ��BUFF  BUFF ����q �Ĥ@�q�O�ݤ��ݱo��OO �ĤG�q�O���S���ݨ����C����1.2��BUFF �A���X�СC
	local KK = OwnerID() 
	sleep(20)
	Yell( KK , "[SC_422811_5]" , 3 )-----[$PLAYERNAME]�A�ڭ�......�ڭ̨��a�C
	sleep(20)
	DW_MoveToFlag( KK,780468,0, 0,1)
	Yell( KK , "[SC_422811_6]" , 3 )----[113685]�n���b�e���I
	sleep(20)
	DW_MoveToFlag( KK,780468,1, 0,1)
	Yell( KK , "[SC_422811_7]" , 3 )----[113685]�n���w���A�ҥH�@�w�n�O�@���C���D�ܡH���O�@�ɤW�̦n���I
	sleep(20)
	DW_MoveToFlag( KK,780468,2, 0,1)
	Yell( KK , "[SC_422811_8]" , 3 )---[113685]��ۤv���L�A�n�i����j�I
	sleep(20)
	DW_MoveToFlag( KK,780468,3, 0,1)
	Yell( KK , "[SC_422811_9]" , 3 )---�����L���n�鵹���z�����b�I�û����n�۫H�ۤv�O�̰�j���I
	sleep(20)
	DW_MoveToFlag( KK,780468,4, 0,1)------
	sleep(20) 
	local MON = {}---�Ǫ��}�C
	for i=1,4,1 do
		MON[i]= Lua_DW_CreateObj("flag",102799,780468,4+i)
		SetPlot( MON[i], "dead" , "LuaS_MM_Dead" , 0 )
		SetAttack( KK,MON[i])
		SetAttack( MON[i],KK)	
	end
---	CastSpell( OwnerID()  , OwnerID()  , 494470 )--����I�k�C15��C
	local TT=ReadRoleValue(KK,EM_RoleValue_MaxHP)
	local MM = ReadRoleValue(KK,EM_RoleValue_HP)
	for i =1 ,20 ,1 do
		TT=ReadRoleValue(KK,EM_RoleValue_MaxHP)
		 MM = ReadRoleValue(KK,EM_RoleValue_HP)

		if MM/TT <0.7   then
				BREAK
		end
		sleep(10)
	end
	local Player = SearchRangePlayer( KK , 350 )
	if MM/TT <0.7   then
		SetStopAttack(KK)
		SetModeEX( KK , EM_SetModeType_Strikback	 , false )
		SetModeEX( KK , EM_SetModeType_Fight	 , false)
		Yell( KK , "[SC_422811_10]" , 3 )---�ӱj�F......[113685]�S��k���\�b��[113685]�I
		PlayMotion(  KK,ruFUSION_ACTORSTATE_CAST_SP01)
		sleep(30)
		Yell( KK , "[SC_422811_11]" , 3 )---[$PLAYERNAME]�A�֨��I
		for i=0 , table.getn(Player)-1 do
			if	CheckBuff(Player[i], 505006)==true	and CheckFlag(Player[i] ,543426) == false then
				ScriptMessage( OwnerID(), Player[i], 0, "[SC_422811_15]", 0 )
				ScriptMessage( OwnerID(), Player[i], 1, "[SC_422811_15]", 0 )
			end
		end
		sleep(30)
		delobj(KK)
		for i =1,table.getn(MON),1	do
			SetFightMode (MON[i],0, 0, 0,0 )
			SetStopAttack(MON[i])
			WriteRoleValue( Mon[i] , EM_RoleValue_LiveTime , 3 )
		end
	END
	if MM/TT >0.7   then
		for i=1,table.getn(MON),1	do
			BeginPlot(MON[i] , "LuaS_422811_0" , 0 )
		end
		sleep(20)
		SetStopAttack(KK)
		SetModeEX( KK , EM_SetModeType_Strikback	 , false )
		SetModeEX( KK , EM_SetModeType_Fight	 , false)
		PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP01)
		Yell( KK , "[SC_422811_10]" , 3 )---�ӱj�F......[113685]�S��k���\�b��[113685]�I
		sleep(30)
		Yell( KK , "[SC_422811_11]" , 3 )---[$PLAYERNAME]�A�֨��I
		DW_MoveToFlag( KK,780468,3, 0,1)
		for i=0 , table.getn(Player)-1 do
			if	CheckBuff(Player[i], 505006)==true	and CheckFlag(Player[i] ,543426) == false then
				ScriptMessage( OwnerID(), Player[i], 0, "[SC_422811_16]", 0 )
				ScriptMessage( OwnerID(), Player[i], 1, "[SC_422811_16]", 0 )
			end
		end
		sleep(30)
		DW_MoveToFlag( KK,780468,3, 0,1)
		delobj(KK)
	end
end

function LuaS_422811_0()--
	local TempID
	for	i=0 , HateListCount(OwnerID())-1 DO
		TempID = HateListInfo(OwnerID(), i , EM_HateListInfoType_GItemID )----
		if	CheckAcceptQuest( TempID , 422811)==true and CheckBuff(TempID, 505006)==true 	then
			SetFlag(TempID,543426,1)
		end
	end
	Sleep(60)
	SetFightMode (OwnerID(),0, 0, 0,0 )
	SetStopAttack(OwnerID())
	sleep(70)
	Delobj(OwnerID()) 

end



function LuaS_422811_6()--�t���X�СC---�]�i�H���n�A�|���M�w�C scriptmaseg�G���W�W�١A�b���U���C���X�СI
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422811_12]",  "0xFFFFFFFF" );	--[113685]�G�����~[113685]�n�S��......�X�{�n�h�n�h���Ǫ��C
	sleep(20)
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422811_13]",  "0xFFFFFFFF"  );-----[113633]�G�O���F�A[113685]�A�u�n�ɤF���O�A�N�O��ۤv�t�d�A�A���o�ܦn�C
	sleep(30)
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422811_14]",  "0xFFFFFFFF"  )---[113633]�G���ξ�ߡA�ڤw�g�n�h�F�A���ڨӲb�ƨ��ǥͪ��a�I
	sleep(30)
END

-------------------------------------------------
function LuaS_422812_2()
	SetSpeakDetail(OwnerID(),"[SC_422812_1]")---�y�y~[113685]���Ǥ���l�A�еy���ڤ@�|��C(�ժܬݰ_�Ӧ��G�ܵ�z�C)
	end
function LuaS_422812_1()
   	 CloseSpeak( OwnerID())
   	 if (CheckAcceptQuest(OwnerID(),422812)==true )and (CheckFlag(OwnerID(),543447)==false )and (ReadRoleValue( TargetID() , EM_RoleValue_Register)  == 0) then
		BeginPlot( TargetID(), "LuaS_422812_3", 0)
	end
end
function LuaS_422812_3()---�HBUFF����A���a�U�u�B�X�l780468 �C��������--�p�G���W��BUFF �~�X�{�Ǫ��C
	WriteRoleValue(OwnerID(),EM_RoleValue_Register,1)----�b113685���W�g�J�A�����U�@�ӤH���C
	local KK = Lua_DW_CreateObj("flag" ,113719,780466,1,1 )--�۳�XKK�C
	BeginPlot(KK , "LuaS_422812_4" , 0 )
	while true do--�ˬd
		sleep( 10 )
		if CheckID(KK) == false or ReadRoleValue( KK , EM_RoleValue_IsDead)== true  then  --���` 
		   	writeRoleValue( OwnerID() ,EM_RoleValue_Register,0 ) 
			break
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register,0)
end

function LuaS_422812_4()--KK�]�k�N,�k�N���X ��BUFF  BUFF ����q �Ĥ@�q�O�ݤ��ݱo��OO �ĤG�q�O���S���ݨ����C����1.2��BUFF �A���X�СC780472--�X�l
	CastSpell( OwnerID()  , OwnerID()  , 494488 )---
	sleep(30)
	Yell( OwnerID() , "[SC_422812_2]" , 3 )-----[$PLAYERNAME]�A���H�ۧڡC
	sleep(20)
	DW_MoveToFlag(OwnerID() ,780468,0, 0,1)
	DW_MoveToFlag( OwnerID(),780468,1, 0,1)
	DW_MoveToFlag( OwnerID(),780468,2, 0,1)
	DW_MoveToFlag( OwnerID(),780468,3, 0,1)
	Yell( OwnerID() , "[SC_422812_3]" , 3 )---[$PLAYERNAME]�A���ΤӹL��i�A�b�ƹL��A�@���N�|��_���R�C
	sleep(20)
	DW_MoveToFlag( OwnerID(),780468,4, 0,1)
	Yell( OwnerID() , "[SC_422812_4]" , 3 )------���|��A�ڱN���i��M�w���F�v¡�C
	sleep(10)
	DW_MoveToFlag( OwnerID(),780472,0, 0,1)------�ڻݭn�A�����z�����O�q�A�ڤ~���~��`�h���b�Ƥu�@�C��e�̤O�q�V���z�A�b�ƪ��O�q�N�󬰱j�j�C
	Yell( OwnerID() , "[SC_422812_5]" , 3 )
	sleep(20) 
	DW_MoveToFlag( OwnerID(),780472,1, 0,1)---��e�̤O�q�V���z�A�b�ƪ��O�q�N�󬰱j�j�C
	local MON = {}---�Ǫ��}�C
	for i=1,4,1 do
		MON[i]= Lua_DW_CreateObj("flag",102799,780472,2+i)---���U�ӥX�{�C
		SetPlot( MON[i] , "dead" , "LuaS_KK_Dead" , 0 )
		if i == 1 or i == 2 then
			SetAttack(MON[i],TargetID())
		else
			SetAttack(MON[i],OwnerID())
		end
		CastSpell( MON[i] , OwnerID()  , 494494 )--����I�k�C�V�Ǫ��̡A�K�WBUFF�A�ë���ʧ@�C(15��)
	end
	SLEEP(140)
	for i =1,table.getn(MON),1	do
	BeginPlot(MON[i] , "LuaS_422812_5" , 0 )
	end
	Yell( OwnerID() , "[SC_422812_6]" , 3 )--�A���o�ܦn�A�i�H�}�l�`�h�b�ƤF�C
	sleep(30)
	for i =1,table.getn(MON),1	do
		CastSpell( MON[i] , OwnerID()  , 494495 )---�����H�C
	end
	sleep(20)
	for i =1,table.getn(MON),1	do
		SetPlot( MON[i] , "dead" , "" , 0 )
		NPCDead( MON[i] , OwnerID())
	end
	local Player = SearchRangePlayer ( OwnerID() , 350 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   422812)==true and CheckBuff(Player[i], 505045)==true  	then
			SetFlag(Player[i], 543447,1)
		end
	end
	sleep(10)
	Yell( OwnerID() , "[SC_422812_7]" , 3 )---�b�ƥ[�t�o�ǥͪ����`......ruFUSION_ACTORSTATE_EMOTE_IDLE2
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep(30)
	Yell(OwnerID() , "[SC_422812_8]" ,3 )---�ӧڳ��M�S��ı���̨��W�ҳQ�I�����ϲb�Ƥ��N�C
	sleep(30)
	Yell(OwnerID() , "[SC_422812_9]" ,3 )--���o�ǵL�d���ͪ��P�e�ʩR�C
	sleep(30)
	Yell(OwnerID() , "[SC_422812_10]" ,3 )--�o�O�ݩ�ڪ��o�c�CruFUSION_ACTORSTATE_EMOTE_SALUTE
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	--local Player = SearchRangePlayer (OwnerID()    , 350 )
	sleep(20)
	Yell(OwnerID() , "[SC_422812_11]" ,3 )--�L�k����......�ڻݭn�@�Ƿǳ�......
	sleep(20)
	Yell(OwnerID() , "[SC_422812_12]" ,3 )--[$PLAYERNAME]�A���a�C
	DW_MoveToFlag( OwnerID(),780468,2, 0,1)
	for i =1,table.getn(MON),1	do
		delobj(MON[i] )
	end
 	delobj(OwnerID())
 end

function LuaS_422812_5()
	local TempID
	for	i=0 , HateListCount(OwnerID())-1 DO
		TempID = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID )----

		if	CheckAcceptQuest( TempID , 422812)==true and CheckBuff(TempID, 505045)==true 	then
			AddBuff( TempID ,505030 ,1 ,900 )--�����n��BUFF
		end
	end
end


--------------------------------------
function LuaS_206168_Check()---	
--	if  Lua_ExGetZone( OwnerID())  ~= 7  then
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206168_0]" , 1 ) ------�A����b[ZONE_WEEPING COAST]���~���a��ϥΦ����~
--		return false
--	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205953_1]" , 1 ) ------�A����b�԰����ϥΦ����~
		return false
	end
	if	CheckAcceptQuest( OwnerID(),   422813)==false or  CheckCompleteQuest( OwnerID(), 422813 )==true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 )
		return false
	end
	return true
end
function LuaI_206168_Use()---�����
	CastSpell( OwnerID() , OwnerID() , 494409) 
	if CheckFlag( OwnerID(),543445)==false  then
	   SetPosByFlag( OwnerID(), 780473 , 3 )---��{���C
	end
	if CheckFlag( OwnerID(),543445)==true  then
	   SetPosByFlag( OwnerID(), 780473 , 4 )----�^�ժܨ���C
	end
end


function LuaS_422813_0()---���Ϊ���C
	SetPlot( OwnerID(), "range","LuaS_422813_1", 150 )
end

function LuaS_422813_1()
	if	(CheckAcceptQuest( OwnerID() , 422813 ) == false )  or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			return false
	end
	if(CheckAcceptQuest( OwnerID() , 422813 ) == true ) and CheckFlag( OwnerID(),543445)==false and ReadRoleValue(TargetID() , EM_RoleValue_Register) == 0 then
		WriteRoleValue(  targetID(), EM_RoleValue_Register ,OwnerID() )---�b�������󨭤W�g�J���a��ID�C
		SetPlot( targetID(), "range","", 0 )	
		BeginPlot( targetID() , "LuaS_422813_2" , 0 )
	end
end

function LuaS_422813_2()
	local KK = Lua_DW_CreateObj("flag" ,102804,780473,0,1 )---�{�ȮR�C
	local CC = Lua_DW_CreateObj("flag" ,102805,780473,1,1 )
	local MM=ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	BeginPlot(OwnerID() , "LuaS_422813_2_1" , 0 )	
	BeginPlot( KK, "LuaS_422813_TELL", 0 )
	YELL(KK,"[SC_422813_20]",3)---�ݨӧڭ̦��N�~���X�ȡC
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(25)
	YELL(CC,"[SC_422813_21]",3)---�O�A�H���ɻP�ժܤ@�P�ݮ`�ͪ����å�?
	sleep(30)
	if 	checkID(MM)==true	then
		YELL(MM,"[SC_422813_1]",3)---�O�A�F�F�L�d���H�I[102804]�I
	end
	sleep(25)
	YELL(KK,"[SC_422813_2]",3)---�A�b�J������H�ڪ��W�r�O������C
	PlayMotion(  KK,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	if 	checkID(MM)==true	then
		YELL(MM,"[SC_422813_3]",3)---[102805]�A�M���@�I�a�I�o�@�����ƥ󳣬O�A���Ǫ��o�Ҥް_���I
		sleep(30)
		YELL(MM,"[SC_422813_4]",3)--�o�@���b�Q�ΧA�Ӷˮ`�ժܡB�ˮ`�@���ͪ��C
		sleep(30)
	end
	YELL(CC,"[SC_422813_5]",3)---�ڨä��۫H�A�A[$PLAYERNAME]�I�ڳ��˲��ݨ��F�I���Ӥk�H�ˤ�����F���ǥͪ��C
	sleep(35)
	BeginPlot( KK, "LuaS_422813_TELL_1", 0 )
	sleep(20)
	YELL(MM,"[SC_422813_7]",3)---�M���L�ӧa�I�_�I�̡I���ǥͪ������O���k�H�G�N�w�ƪ��C��e���ܦ��u�n�ϥβb�ƤO�q�N�|���`�A���ժܦ]���ˤߦ۳d��
	sleep(30)
	YELL(CC,"[SC_422813_8]",3)---�ھ̤���n�۫H�A�H
	PlayMotion(  KK,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_CRY)
	YELL(KK,"[SC_422813_9]",3)----���Ӥk�H�@�����b�}�a�ڪ��Ҧ��A�ݮ`�L�ƪ��ͩR......
	sleep(30)
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_CRY)
	YELL(KK,"[SC_422813_10]",3)---�Ʀ��۴b�F�o�W�i�����_�I�̡A[102805]�A�]�\�A�����L�M���@�I�H�L�~�|���D�ۤv���U�F�h�򤣥i�Ǯ����ơH
	sleep(30)
	BeginPlot( KK, "LuaS_422813_TELL_2", 0 )
	SLEEP(30)
	SetRoleCamp(KK,"Monster")
	SetRoleCamp(CC,"Monster")
	SetFightMode ( KK,1, 1, 1,1 )
	SetFightMode ( CC,1, 1, 1,1 )
	SetPlot( KK ,"dead" , "LuaS_KK_Dead" , 0 )
	SetPlot( CC, "dead" , "LuaS_KK_Dead" , 0 )
	local  TT=ReadRoleValue(KK,EM_RoleValue_MaxHP)
	local  EE= ReadRoleValue(KK,EM_RoleValue_HP)
	for i=0,180,1 do--�ˬd
 		TT=ReadRoleValue(KK,EM_RoleValue_MaxHP)
		 EE= ReadRoleValue(KK,EM_RoleValue_HP)

		if 	EE/TT<0.6	then
			break
		end
		sleep(10)
		if i > 10 and HateListCount( kk ) == 0 and HateListCount( CC ) == 0 then
			break
		end
	end
	if 	EE/TT<0.6	then
		local TempID
			for	i=0 , HateListCount( KK )-1 do 
				TempID = HateListInfo(KK ,i , EM_HateListInfoType_GItemID )----
					if	CheckAcceptQuest( TempID , 422813)==true	then
						SetFlag( TempID, 543445, 1 )
					end
				end
		sleep(20)	
		SetStopAttack(KK)
		SetStopAttack(CC)
		SetRoleCamp(KK,"Visitor")
		SetRoleCamp(CC,"Visitor")
		SetFightMode ( KK,0, 1, 0,0 )
		SetFightMode ( CC,0, 1, 0,0 )
		YELL(KK,"[SC_422813_13]",3)---�M���L�ӧa�㤣�n�Q��H�g�b�CPlayMotion(  KK,ruFUSION_ACTORSTATE_CAST_SP01)ruFUSION_ACTORSTATE_CAST_SP01
		PlayMotion(  KK,ruFUSION_ACTORSTATE_CAST_SP01)
		sleep(30)
		YELL(CC,"[SC_422813_14]",3)---�A�Qé�F�F......�A���U�h�A�@�I�N�q���S���C������A�ڭ̧֨��I
		sleep(30)
		BeginPlot( KK, "LuaS_422813_TELL_3", 0 )
		YELL(KK,"[SC_422813_15]",3)---�n�a......
		sleep(20)
		BeginPlot( KK, "LuaS_422813_2_2", 0 )
		DW_MoveToFlag( CC,780473,2, 0,1)
		DELOBJ(CC)
		sleep(300)
		SetPlot( OwnerID(), "range","LuaS_422813_1", 150 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	else
		local Player = SearchRangePlayer ( OwnerID() , 400 )
		for i=0,table.getn(Player)-1 do
				if(CheckAcceptQuest( player[i] , 422813 ) == true ) and CheckFlag( player[i],543445)==false then
					ScriptMessage( OwnerID(), player[i] , 0, "[SC_422813_22]", 0 )
					ScriptMessage( OwnerID(), player[i] , 1, "[SC_422813_22]", 0 )
				end
		end
		sleep(20)	
		SetStopAttack(KK)
		SetStopAttack(CC)
		SetRoleCamp(KK,"Visitor")
		SetRoleCamp(CC,"Visitor")
		SetFightMode ( KK,0, 1, 0,0 )
		SetFightMode ( CC,0, 1, 0,0 )
		YELL(KK,"[SC_422813_13]",3)---�M���L�ӧa�㤣�n�Q��H�g�b�C
		sleep(30)
		YELL(CC,"[SC_422813_14]",3)---�A�Qé�F�F......�A���U�h�A�@�I�N�q���S���C������A�ڭ̧֨��I
		BeginPlot( KK, "LuaS_422813_TELL_3", 0 )
		sleep(30)
		YELL(KK,"[SC_422813_15]",3)---�n�a......
		sleep(20)
		BeginPlot( KK, "LuaS_422813_2_2", 0 )
		DW_MoveToFlag( CC,780473,2, 0,1)
		DELOBJ(CC)
--		Lua_DW_CreateObj("obj",113690,OwnerID())
		sleep(200)
		SetPlot( OwnerID(), "range","LuaS_422813_1", 150 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	end
end


function LuaS_422813_TELL()
	local Player = SearchRangePlayer ( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   422813)==true and CheckFlag( player[i],543445)==false then
			Tell(player[i],OwnerID(),"[SC_422813_0]")------�A�ݰ_�ӴN���O[113633]���Ӥk�H���Ӫ��A�@�ƥi�������q���h�ҼˡC
		end
	end
end


function LuaS_422813_TELL_1()
	local Player = SearchRangePlayer ( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if(CheckAcceptQuest( player[i] , 422813 ) == true ) and CheckFlag( player[i],543445)==false then
			Tell(player[i],OwnerID() , "[SC_422813_6]")---����ժܿˤ�`���ͪ������p��H�i���ڤ���˲��ݨ��A�����٤����A�o�٭n�A��h�W�@�I��
		end
	end
end
function LuaS_422813_TELL_2()
	local Player = SearchRangePlayer ( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if(CheckAcceptQuest( player[i] , 422813 ) == true ) and CheckFlag( player[i],543445)==false then
			Tell(player[i],OwnerID() , "[SC_422813_11]")---��~�f�f�n�n�ϩR�B��ū�A�o�u�����F����H
			sleep(30)
			Tell(player[i],OwnerID() , "[SC_422813_12]")----���ӦۥH���O���k�H�`�O���ƪ������ۤ@���A��䥦�H���b�`�W�̡C
		end
	end
end

function LuaS_422813_TELL_3()
	local Player = SearchRangePlayer( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if(CheckAcceptQuest( player[i] , 422813 ) == true ) and CheckFlag( player[i],543445)==false then
			Tell(player[i], OwnerID(), "[SC_422813_16]")----�ɱ��ɨ��ثe���w�h�a��^�h�i�D���Ӱ����k�H�A���ݦw�w�Ĵ��d����A�Ĥ@�ӭn�����N�O�o�I�A�~�����o�A�A�]�k�������A[$PLAYERNAME]�I
		end
	end
end

function LuaS_422813_2_1()--���W�ˬd�j��C �p�Gnpc���� �N�R��
	while true do--�ˬd
	sleep( 10 )
	local KK = LuaFunc_SearchNPCbyOrgID( OwnerID() ,102804 ,500 )
	local CC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,102805 ,500 )
	local MM=ReadRoleValue( OwnerID() , EM_RoleValue_Register )	
		if CheckID(MM) == false  then
			YELL(CC,"[SC_422813_14]",3)---
			YELL(KK,"[SC_422813_15]",3)---
			DELOBJ(KK)
			DELOBJ(CC)
			Lua_DW_CreateObj("obj",113690,OwnerID())
			delobj(OwnerID())
		break
		end
	end
end
function LuaS_422813_2_2()--
	DW_MoveToFlag( OwnerID() ,780473,2, 0,1)
	Delobj( OwnerID() )
END
-------------------------------------------------------------------------
function LuaS_422815_0()
	LoadQuestOption(OwnerID())
	if	(CheckAcceptQuest(OwnerID(),422815)==true )and  (CheckFlag(OwnerID(),543450)==false ) and  (ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)       then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422815_0]","LuaS_422815_1",0)---�ڥi�H���I�бN�ڶǰe�L�h�a�I
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422815_1]","LuaS_422815_2",0)---���ڦA�Q�Q�H
	end
	if (CheckAcceptQuest(OwnerID(),422815)==true )and  (CheckFlag(OwnerID(),543450)==false ) and  (ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 1)       then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422815_0]","LuaS_422815_4",0)---�ڥi�H���I�бN�ڶǰe�L�h�a�I
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422815_1]","LuaS_422815_2",0)---���ڦA�Q�Q�H
	end
end
function LuaS_422815_1()
	CloseSpeak( OwnerID())
	if (CheckAcceptQuest(OwnerID(),422815)==true )and  (CheckFlag(OwnerID(),543450)==false ) and  (ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)       then
		SetFlag(OwnerID() ,543450,0)
		SetPosByFlag( OwnerID(), 780477 , 2 )
		BeginPlot( targetID() , "LuaS_422815_3" , 0 )
	end
end

function LuaS_422815_2()
	SetSpeakDetail(OwnerID(),"[SC_422815_4]")---�n�A�A�A�J�ӦҼ{�C�ӧڤ]�|�ɧ����ڪ���O��_�A�P�A�@�P�e�h�C
end

function LuaS_422815_4()
	SetSpeakDetail(OwnerID(),"[SC_422815_2]")---[113736]�Ҵݯd�U�����������O�ӹL�}���A�ڤ��L�k��쥿�T����V�C
end

function LuaS_422815_3()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID ,1)
	local KK = Lua_DW_CreateObj("flag" ,113691,780477,0,1 )---�{�ȮR�C
	local CC = Lua_DW_CreateObj("flag" ,102805,780477,1,1 )---�_�I�̡C
	MoveToFlagEnabled( KK , false )
	PlayMotionEX(  CC ,ruFUSION_ACTORSTATE_DAZED_BEGIN , ruFUSION_ACTORSTATE_DAZED_LOOP)
	AddBuff( targetID() ,505049 ,1 ,12 )------�w���N�C���î𮧡B���i���ǡC
	sleep(35)
	AdjustFaceDir( KK, CC, 0 )
	yell(KK,"[SC_422815_5]",3)---[102804]�A�A�i���D�̫�@�ӯ����O����H
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	yell(KK,"[SC_422815_6]",3)----�@�ӵ��Ϊ��F��H���C�o�O������]�O�����������A�ڤ@���b��ҭn�q������o...
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	yell(KK,"[SC_422815_7]",3)-----���{�b...�@�Ӭ��R����z���N��b���ضܡH	ruFUSION_ACTORSTATE_EMOTE_POINT	
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_POINT	)
	sleep(20)
	delobj(KK)
	local TT = Lua_DW_CreateObj("flag" ,102804,780477,0,1 )
	SetPlot( TT , "dead" , "LuaS_KK_Dead" , 0 )
	if CheckID(TargetID()) == true then
		CancelBuff_NOEvent(TargetID() , 505049 )
	end

	SetRoleCamp(TT,"Monster")
	SetFightMode ( TT,0, 1, 1,1 )---
	CastSpell( TT , CC , 494491 )--�l���H�����ʧ@�C
	for	 i=0,15,1	do
		IF  ReadRoleValue( TT , EM_RoleValue_AttackTargetID ) ~= 0 or ReadRoleValue( TT , EM_RoleValue_HP ) <= 100 Then
			AddBuff( TT , 502383 , 0 , 1 )
			break
		end
		sleep(10)
	end
	if  ReadRoleValue( TT , EM_RoleValue_AttackTargetID ) == 0 and ReadRoleValue( TT , EM_RoleValue_HP ) > 100 then
		SetStopAttack(TT)
		SetRoleCamp(TT,"Visitor")
		SetFightMode ( TT,0, 1, 0,0 )
		scriptmessage(TT, 0, 0, "[SC_422815_8]",  "0xFFF00000" )--[113691]���Q���o[102804]���F��H���C
		scriptmessage(TT, 0, 1, "[SC_422815_8]",  "0xFFF00000" )--[113691]���Q���o[102804]���F��H���C
		sleep(20)
		NPCDead( CC, TT )
		yell(TT,"[SC_422815_9]",3)---�ڪ�[102775]�A�ڱN�A�����A�_�d�C
		PlayMotion(  TT,	ruFUSION_ACTORSTATE_EMOTE_LAUGH	)	
		sleep(20)
		scriptmessage(TT, 0, 0, "[SC_422815_10]", 0)--�A�����ȨS�����\�C
		scriptmessage(TT, 0, 1, "[SC_422815_10]", 0)--�A�����ȨS�����\�C
		DW_MoveToFlag( TT,780477,2, 0,1)
		delobj(TT)
		delobj(CC)
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
		return false
		
	else
		SetStopAttack(TT)
		SetFightMode ( TT,0, 1, 0,0 )
		SetRoleCamp(TT,"Visitor")
		yell(TT,"[SC_422815_11]",3)---�ڨ��L�A�I�ժܪ������A�A�]�ӯ}�a�ڶܡHruFUSION_ACTORSTATE_ATTACK_1H_PIERCE
		PlayMotion(  TT,ruFUSION_ACTORSTATE_ATTACK_1H_PIERCE	)
		sleep(20)
		local MM = Lua_DW_CreateObj("flag" ,113812,780477,3,1 )----
		yell(MM,"[SC_422815_12]",3)------���A[113691]�I
		MoveToFlagEnabled( MM , false )
		--CastSpell( TT , MM , XXXX)---���H�H
		AdjustFaceDir( MM, TT, 0 ) 
		sleep(10)
		AdjustFaceDir( TT, MM, 0 ) 
		sleep(10)
		yell(TT,"[SC_422815_13]",3)---�p�S�ӧ�ê�ڤF�H
		PlayMotion(  TT,ruFUSION_ACTORSTATE_EMOTE_POINT	)
		sleep(30)
		yell(TT,"[SC_422815_14]",3)---��I���e���Ǥ��L�O�e�p���p§���A�p�ٺ��N�ܡH
		PlayMotion(  TT,	ruFUSION_ACTORSTATE_EMOTE_LAUGH	)
		sleep(30)
		yell(TT,"[SC_422815_20]",3)--���U�ӴN�S���o��²��F�A�p�ݵۦn�F�I�ڵ���|���p�|���ڷ�ɧ�h�W���߱��C
		PlayMotion(  TT,ruFUSION_ACTORSTATE_ATTACK_1H_PIERCE	)
		--CastSpell( TT , TT , XXXX)--���~�C
		DW_MoveToFlag( TT,780477,4, 0,1)
		if CheckID( TargetID() ) == true and CheckAcceptQuest( TargetID(),422815) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 0 then
			Setflag(TargetID(),543450,1)
		end
		delobj(TT)
		PlayMotion(  CC ,ruFUSION_ACTORSTATE_DAZED_END )
		sleep(20)
		yell(CC,"[SC_422815_15]",3)---�ڨ쩳�����F�Ǥ���HruFUSION_ACTORSTATE_SHIELD_BASH
		PlayMotion(  CC ,ruFUSION_ACTORSTATE_SHIELD_BASH)
		Sleep(20)
		yell(CC,"[SC_422815_16]",3)--��......��......
		PlayMotion(  CC ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)    	
		AdjustFaceDir( MM, CC , 0 ) 
		PlayMotion(  MM ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)  
		sleep(20)
		yell(MM,"[SC_422815_17]",3)--[102804]�Ө����F��E�ӷw�֡A�����ɧ֪v���C
		sleep(20)
		if CheckID( TargetID() ) == true then
			AdjustFaceDir( MM, TargetID(), 0 ) 
		end
		PlayMotion(  MM ,ruFUSION_ACTORSTATE_CROUCH_END)  
		yell(MM,"[SC_422815_18]",3)--���ڥ��N�L�a�^�^�����ӡC
		sleep(20)
		CastSpell(MM,MM,491276)
		yell(MM,"[SC_422815_19]",3)---�ӧA�H���W�n�ܡH
		SLEEP(35)
		delobj(MM)
		delobj(CC)
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
	end
end
-------------------------
function LuaS_422827_AF()
	if CountBodyItem( TargetID() , 206187 ) > 0 then
		GiveBodyItem( targetID(), 543452, 1 )
		DelBodyItem( targetID(),  206187 , 1 ) 
	end
END



----------------------
function LuaS_KK_LOVE()	--�S��
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(), 494493)
	end
end
---------
function LuaS_102796_KK()
	If	CheckAcceptQuest( targetID(), 422814 )==true	and	CountBodyItem (  targetID(),206169)>=1  and CheckBuff(targetID()  , 505051)==false  then
	return true
	end
	return false
end
-------------
function LuaS_422811_KK()---
	If	CheckAcceptQuest( targetID(), 422811 )==true	and  CheckFlag( targetID(),543426 )== false  then
	return true
	end
	return false
end
----------------------
function LuaS_422812_KK()---
	If	CheckAcceptQuest( targetID(), 422812 )==true	and  CheckFlag( targetID(),543447 )== false  then
	return true
	end
	return false
end