


	
--======================================================================================================
--423260���b�}�̪��w�S�Jù���W
--======================================================================================================	
function LuaS_423260_Move()
	LoadQuestOption(OwnerID()) 	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423260_MOVE]","LuaS_423260_Move1",0)
				--�бa��ڴM�䰡�U�C
		
	
end

function LuaS_423260_Move1()
	CloseSpeak(OwnerID())
	Say(TargetID(),"[SC_422693_6]")
	BeginPlot( OwnerID() , "LuaQ_423260_Accept_Do" , 0 )
end

function LuaQ_423260_Accept_Do()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	ChangeZone( OwnerID() , 16 , 0 , -2905.7 ,-794.9, 24806 , 2.3 )
	SetFlag(OwnerID(),544034,1)
end

--======================================================================================================
--423260
--======================================================================================================



function LuaS_423260_ACT0()		--���b�������Ȥ��� 
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )

	DisableQuest(OwnerID(),true)	
	DisableQuest( OwnerID() , true )
--	Hide(OwnerID())
	AddBuff( TargetID()  , 506807 , 1 , -1 ) 	--�Ϊ̵�buff
	CallPlot(OwnerID(),"LuaS_Check_noquest", 1 , 1 , 423260 , 506807,TargetID(),OwnerID(),200)	
	Local Ann = LuaFunc_CreateObjByObj(115283, OwnerID() )
	DisableQuest(Ann, true )
	Setflag(TargetID(),544039,1)
	Say(Ann,"[SC_423260_ACT0]")							--�X�ӧa�A�ڪ��D�A�b�o�̡C
	Sleep(40)
	local Derek = Lua_DW_CreateObj("flag" ,115284,780635,1)
	Hide(Derek)
	local Chip = Lua_DW_CreateObj("flag" ,115285,780635,2)
	Hide(Chip)
	DisableQuest(Derek, true )
	DisableQuest(Chip, true )
	
	Show(Derek,0)
	Show(Chip,0)
	
	Sleep(20)
	WriteRoleValue (Derek, EM_RoleValue_IsWalk, 1)
	WriteRoleValue (Chip, EM_RoleValue_IsWalk, 1)
	
	Beginplot(Derek,"LuaS_423260_ACT1",0)	
	Beginplot(Chip,"LuaS_423260_ACT2",0)
	Sleep(40)
	AdjustFaceDir( Ann , Derek ,3 )
	AdjustFaceDir( Derek ,Ann , 3 )
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say(Derek,"[SC_423260_ACT1]")						--�Q���աH���F�A�A���O�q�j�j��ڬݤ��X�`�L�A�쩳�O�q���̫_�X�Ӫ��H���|�O�@�몺���F�A�S�����O�~���Ǻ��F......
	Sleep(50)
	
	Say(Ann,"[SC_423260_ACT2]")							--�d�Ժ��i���w�L�ơH
	Sleep(30)
		
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Derek,"[SC_423260_ACT3]")						--�A���O�H�ϥ��ګ��]�����L�A�A�����A�̦b�o�̯ӤF�A�����C
	Sleep(30)
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_CAST_SP01)	--POSE:���_
	Sleep(20)

	CastSpell(Chip,TargetID(),491276)		--��� 
	Sleep(30)
	
	Delobj(Derek)
	Delobj(Chip)

	if CheckAcceptQuest(TargetID(),423260)==true then
		SetFlag(TargetID() , 544034 , 1)		--���ȧ����X�СG�M����̨���
	end
	
--	Show(OwnerID(),0)
	CancelBuff( TargetID()  , 506807  )
	if	CheckAcceptQuest(TargetID(),423260)==true 	then
		Setflag(TargetID(),544039,0)
	end
	Delobj(Ann)
	DisableQuest( OwnerID() , false )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end


function LuaS_423260_ACT1()
	Show(OwnerID(),0)
	DW_MoveToFlag(OwnerID(),780635,5,0,1)
end

function LuaS_423260_ACT2()
	Show(OwnerID(),0)
	DW_MoveToFlag(OwnerID(),780635,6,0,1)
end




--======================================================================================================
--423261	���U���ȼ@���G
--======================================================================================================
function LuaS_423261_ACT0()
	DisableQuest(OwnerID(),true)	
	
	DisableQuest(OwnerID() ,true )
	AddBuff( TargetID()  , 506808 , 1 , 300 )	--�Ϊ̵��w��buff
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	Beginplot(OwnerID(),"LuaS_423261_AK_CHECK",0)

	local Jx1 = Lua_DW_CreateObj("flag" ,115438,780639,1)
	local Jx2 = Lua_DW_CreateObj("flag" ,115290,780639,2)
	DisableQuest(Jx1, true )
	DisableQuest(Jx2, true )
	Hide(Jx2)

	Say(Jx1 ,"[S_423261_ACT1]")				--���a�A�S���֤�ڧ󦳸�檾�D�C
	DW_MoveToFlag(Jx1,780639,2,0,1)
	CastSpell(Jx1,Jx1,494518)
	Sleep(30)
	Show(Jx2,0)
	Hide(Jx1)
	CastSpell(Jx2,Jx2,494518)	
	Sleep(50)
--	ScriptMessage(OwnerID(), TargetID() , 1 , "[S_423261_ACT2]" , 0 )		--[115287]��Y���ݵ��ܦ��ܼ}���H��[115438]�C
--	ScriptMessage(OwnerID(), TargetID() , 0 , "[S_423261_ACT2]" , 0 )		--[115287]��Y���ݵ��ܦ��ܼ}���H��[115438]�C
	
--	SetFlag(TargetID() , 544037 , 1)		--���X�СA�ݱo����a���ä�
--	AddBuff( TargetID()  , 506810 , 1 , 300 )
	--SetFlag(TargetID() , _____ , 0)		--�����t��npc���{�κX��
	CancelBuff( TargetID()  , 506808  ) 	--�٪��a�ۥ�	
	Delobj(Jx1)
	Delobj(Jx2)
	DisableQuest(OwnerID() ,false )
end

function LuaS_423261_AK_CHECK()
local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player, 423261 )==false		and	
			CheckBuff( Player , 506808) == true		then
			break
		end
		if	CheckBuff( Player , 506808) == false		then
			break
		end
		sleep( 20 )
	end
	CancelBuff( Player  , 506808  )	
end
--======================================================================================================
--423261	�V�Ѥ��H�ݸ�
--======================================================================================================
function LuaS_423261_0()
	LoadQuestOption(OwnerID()) 
	--�ڹ�A�̬O�@�L�ķN���A���Ѽw�U�J���غذ����A�ڧ����������A�󤣩��եL���ت��O����C
	if CheckAcceptQuest(OwnerID(),423261)==true 	and
		Checkflag(OwnerID(),544013)== false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423261_0]","LuaS_423261_1",0)
		--�u�A���|�b�o�̡H�v
	end
end

function LuaS_423261_1()
	SetSpeakDetail(OwnerID(),"[SC_423261_1]")
	--�ڭ̬O�K�����ڤ����@��A�d�~���e�N�Ө�o�ӫo���窺�G�m�A
	--���U���j�������d�U�J�D������Ԥ͢w�w�o���礧���_���A�b�_���u�h��A�@�@�N�N�~��b�o�̦u�ۨe����N�M�l���C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423261_2]","LuaS_423261_2",0)
	--�u�w�U�J�O�A���ڤH�A�A���|�����D�L���p���H�v
end	
	
function LuaS_423261_2()
	SetSpeakDetail(OwnerID(),"[SC_423261_3]")
	--(�Ѥ��H�ݤF���Ӥ@��)
	--�ڭ̳o�@�䪺�s�b�A�@�V�u�������d�U�J�����t�ڤH�~���D�A�������������pô�A
	--�u�O��Ӧ]���Y�ǭ�]......���Ӻ��֡A�ڭ̤��A����L�̪������A����Q�Ʀ~�e�A
	--�w�U�J�a�ۤG�Q�X�H���p����Ө�o�̡C�b�ڭ̪��D�L�N�O��N�����t��˫�A
	--�N�����L�d�U���n�D�A�o�q���L�ݩΤz�A�L���ͬ��C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423261_4]","LuaS_423261_3",0)
	--�u�o���稦�a�������r���~���Ǩ��A�O�A�̩�X�h���H�v
end

function LuaS_423261_3()
	SetSpeakDetail(OwnerID(),"[SC_423261_5]")
	--�ڭ̤@�V���~�b���a�̥��R�פ�A�o�̪��o���禳�ܱj�P���a�L�N�ѡA
	--�ڥ��S�H���i�ӡA�ڭ̤]���Q���ܳo�˪��ͬ��A���|��X�o�˪��Ǩ��A�h�l�ޥ~�H���`�ءH
	--
	--�Ѥ��H�Թ껡��~�ơA�L�̹�N�x��~�O�_�ѻP��Iù�Y���M���A���_���������T�O�b�N�x�Ӥ���X�~�~�����A

	AddSpeakOption(OwnerID(),TargetID(),"[SC_423261_6]","LuaS_423261_4",0)
	--�u�ڪ��D�F�C�v
end

function LuaS_423261_4()
	SetFlag(OwnerID(),544013,1)	--���X�СA����������

	CloseSpeak(OwnerID())
end



--======================================================================================================
--423262
--======================================================================================================
function LuaQ_423262_Accept()	 --���b�������Ȥ���A�ǰe���a
	BeginPlot( TargetID() , "LuaQ_423262_Accept_Do" , 0 )
end

function LuaQ_423262_Accept_Do()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	Sleep( 20)
	ChangeZone( OwnerID() , 16 , 0 , -4707.1  , -157.8  , 22811.3   , 101.1 )
	SetFlag(OwnerID(),544035,1)
end

-------------------------



function LuaS_423262_ACT0()		--���b���ȱ�������	
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID()  , 503977 , 1 , 300 )	--�Ϊ̵��w��buff
	local Ann = LuaFunc_CreateObjByObj	( 115524 , OwnerID() )
	DisableQuest(Ann, true )
--	AddBuff(OwnerID(),506116,1,300)		--���ݪ����t����buff
	local Star = Lua_DW_CreateObj("flag" ,115521,780637,1)
	local Cral = Lua_DW_CreateObj("flag" ,115522,780637,2)
	local Rose = Lua_DW_CreateObj("flag" ,115523,780637,3)	
	DisableQuest(Star, true )
	DisableQuest(Cral, true )
	DisableQuest(Rose, true )
	SetFlag(TargetID() , 544014 , 1)	--������owner���X��

--Hide(OwnerID())
	
	
	PlayMotion(Star   ,ruFUSION_ACTORSTATE_EMOTE_KISS) 
	Say(Star ,"[S_423262_ACT0]")					--���A�o��j�H�N�A�̥��w�a�^�ӤF�C
	Sleep(30)
	Hide(Cral)
	Show(Cral,0)
	
	PlayMotion(Ann   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 
	Say(Ann  ,"[S_423262_ACT1]")					--�b�P�A�̤��O���e�A�ڦ��Ӱ��D�Q�ݩ]���A�Ť�b�ĺ����j���W�u�Ω�Z���H
	Sleep(30)
	WriteRoleValue (Cral , EM_RoleValue_IsWalk, 0)
	
	AdjustFaceDir( Cral , Ann ,3 )
	PlayMotion(Cral  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 	--����
	Say(Cral ,"[S_423262_ACT2]")					--�Ť��^�O�b�Z���۷��ΡA��L�γ~�S���Q�s�x�y�ǡA�A�����O......�H
	Sleep(40)
	
	PlayMotion(Ann  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD) 	--�C�Y	
	Say(Ann ,"[S_423262_ACT3]")						--�t�@���j���A�H�Τ[�����e�A�����Q�ݥΩ�H��C
	Sleep(30)
	
	PlayMotion(Cral ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 
	Say(Cral ,"[S_423262_ACT4]")					--�A�O���˯Ǧh�ָM���쨫�\�h�H���A�ä����M�O�]���v�޳��Aù�Y�D�Ǻ����b�i��Ť��s�H
	Sleep(40)
	
	PlayMotion(Ann   ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE) 	--�n�Y
	Say(Ann  ,"[S_423262_ACT5]")					--�o�I�ڤ��M���A���L......���v�`�O���_�`���C
	Sleep(30)
	
	PlayMotion(Rose  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 	--
	Say(Rose  ,"[S_423262_ACT6]")					--�βŤ��y�H��A�N�O�ҿת��]��.....�ڴ��b�d�о�W�ݹL�ʦL���Ԫ������C
	Sleep(30)
	PlayMotion(Rose  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 	--
	Say(Rose  ,"[S_423262_ACT7]")					--�o�̪��a�ΥR���|�}�B�ǩ��Aù�Y�D�Ǻ���~�O�_����󦹦Ӹ��ѡA��Ӱl�D��j�j���O�q�A�ҥH�N�إ�����]�ڪ��j�j......
	Sleep(40)
	
	AdjustFaceDir( Cral , Rose ,3 )
	AdjustFaceDir( Star , Cral ,3 )
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_ROCK)
	Say(Cral ,"[S_423262_ACT8]")					--���I���i��A����ù�Y�D�Ǻ���~���Ǳo�N�ѧΡA�L��ź�Ƴ����|���\�L�]���a�ΦӸ���....�@�w����L����]......
	Sleep(40)
	
	DW_MoveToFlag(Star,780637 ,5 ,0,1)
	Say(Star,"[S_423262_ACT9]")						--�d���A�N�R�I�I
	Sleep(30)
	
	PlayMotion(Cral  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Say(Cral ,"[S_423262_ACT10]")					--�`���A�u�n����L�A�N�ദ��@���A�U��A�ڥ����F�C
	Sleep(30)
	
	BeginPlot( Cral , "LuaS_423262_ACT1" , 0 )
	Sleep(20)
	
	PlayMotion(Star ,ruFUSION_ACTORSTATE_EMOTE_CUTE2)	--���`
	Say(Star ,"[S_423262_ACT11]")					--�R�B������|���H�̡A�ڭ̷|�A�ۨ����C	
	Sleep(30)
	BeginPlot( Star , "LuaS_423262_ACT2" , 0 )
	
	Sleep(20)
	PlayMotion(Ann ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Say(Ann  ,"[S_423262_ACT12]")					--�ڱN�h�l�ܤ�~���ܼ}�H�A�A�̤��᪺��ʽЭn�@���p�ߡC
	Sleep(40)
	CastSpell( Ann , Ann , 491008 )
	Sleep(30)
	Hide(Ann)
	
	CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�
	Delobj(Star)
	Delobj(Cral)
	Delobj(Rose)
	Delobj(Ann)

	if 	CheckAcceptQuest(TargetID(),423262)== true then
			Setflag(TargetID(),544016,1)			--�������ȺX��
	end
	DisableQuest( OwnerID() , false )
	SetFlag(TargetID() , 544014 , 0)		--�����X�СA�q�Xownerid
--	Show(OwnerID(),0)
end

function LuaS_423262_ACT1()
	DW_MoveToFlag(OwnerID(),780637,6,0,1)
	Hide(OwnerID())
end

function LuaS_423262_ACT2()
	DW_MoveToFlag(OwnerID(),780637,7,0,1)
	Hide(OwnerID())
end

function LuaS_423262_115291()	--���b�w�S�Jù115291����ܼ@��
	LoadQuestOption(OwnerID()) 
	if 	CheckAcceptQuest(OwnerID(),423262)==true 	and
		CheckCompleteQuest(OwnerID(),423262)==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_50]","LuaS_423262_115291_1",0)
		--���¡C
	end
end

function LuaS_423262_115291_1()
	SetSpeakDetail(OwnerID(),"[SC_423262_115291_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423236_10]","LuaS_423262_115291_2",0)--�O��
end

function LuaS_423262_115291_2()
	CloseSpeak(OwnerID())
	Beginplot(TargetID(),"LuaS_423262_ACT0",1)
end
		

--======================================================================================================
--423287	�M��Ϫ��d�Ժ����
--======================================================================================================
function LuaS_423287_0()
	LoadQuestOption(OwnerID()) 
	--......[$playername]�C
	if 	CheckAcceptQuest(OwnerID(),423287)==true 	and
		Checkflag(OwnerID(),544015)==false 			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423260_0]","LuaS_423287_1",0)
		--�u���U�A�z�٦n�ܡH�v
	end
end

function LuaS_423287_1()
	SetSpeakDetail(OwnerID(),"[SC_423260_1]")
	--(�d�Ժ��ݵۧA�A�S�X���ǽ���������)�ڨS�ơA��...���§A�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423260_2]","LuaS_423287_2",0)
	--�u�O�w�S�Jù�j�H�ϤF�ڭ̡A�ݤU�����~�\�C�v
end

function LuaS_423287_2()
	if 	CheckAcceptQuest(OwnerID(),423287)==true 	and
		Checkflag(OwnerID(),544015)==false 			then
		SetFlag(OwnerID(),544015,1)	--���X�СA����������
	end
	CloseSpeak(OwnerID())
end


--======================================================================================================
--423288		�������ȫ�script
--======================================================================================================
function LuaS_423288_ACT0()		
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 
	local tony = LuaFunc_CreateObjByOBj( 115547, OwnerID() )
	DisableQuest(tony, true )		
	local Arni = Lua_DW_CreateObj("flag" ,115372,780636,1)

	DisableQuest(Arni, true )
	DW_MoveToFlag(Arni,780636,2,0,1)
--	Sleep(20)
	AdjustFaceDir( Arni , OwnerID() ,3 )
	AdjustFaceDir( tony , Arni ,0 )	
	Say(Arni,"[S_423288_ACT0]")						--�o�B�o�u���O�_���������ܡH
	PlayMotion(Arni ,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	Sleep(30)	
	local A1 = Lua_DW_CreateObj("flag" ,115373,780636,3)
	local A2 = Lua_DW_CreateObj("flag" ,115374,780636,3)
	DisableQuest(A1, true )
	DisableQuest(A2, true )
	Hide(A1)
	Show(A1,0)
	Hide(A2)
	Show(A2,0)
	Hide(Arni)
	Show(Arni,0)
	Sleep(30)
	WriteRoleValue (A1, EM_RoleValue_IsWalk, 0)
	WriteRoleValue (A2, EM_RoleValue_IsWalk, 0)
	WriteRoleValue (Arni, EM_RoleValue_IsWalk, 0)
	
	BeginPlot( A1, "LuaS_423288_ACT1" , 0 )
	BeginPlot( A2, "LuaS_423288_ACT2" , 0 )
	Sleep(20)
	AdjustFaceDir( A1 , Arni ,3 )	
	AdjustFaceDir( A2 , Arni ,3 )	
	
	PlayMotion(A1   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)		
	Say( A1,"[S_423288_ACT1]")							--���������A���n�F�A��観�H���J�����a�A�����n�X�ӤH�C
	Sleep(30)
	
	PlayMotion(A2   ,ruFUSION_ACTORSTATE_EMOTE_FEAR)
	Say( A2,"[S_423288_ACT2]")							--��...�ڸ��b����A�S�Q�L�̵o�{�~�ߦ^�@�R�A�����a�H��۹��O�h�L����A�A�b�@�Ӵݼɪ��k�H�a��U�A�L�̥s�o���ԵX���F�x�C
	Sleep(30)
	
	PlayMotion(Arni   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say( Arni,"[S_423288_ACT3]")						--�_�I�̡A���ǧڡA�p�G�ڬ۫H�A�̻����A���ѴN���|�o�ͳo��ơC
	Sleep(30)
	
	PlayMotion(Arni  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say( Arni,"[S_423288_ACT4]")						--�A�̤@���յۧi�D�گu�ۡA�ګo......
	Sleep(30)
	
	PlayMotion(tony   ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say( tony,"[S_423288_ACT5]")					--�����A���O�۳d�A�{�b�̭��n���O�Ϧ^�Q�������H�C
	Sleep(30)
	
	PlayMotion(Arni   ,ruFUSION_ACTORSTATE_EMOTE_BEG)
	Say(Arni ,"[S_423288_ACT6]")						--�u���A�̥i�H���ڭ̡A���U�A�̡A�����ڭ̨�˯Ǧh�ֳ��Ϧ^�ڭ̳Q�����������a�H
	Sleep(40)
	
	PlayMotion(A1   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(A1 ,"[S_423288_ACT7]")							--�����A�n���򨺨ǳQ�ۨ����a�H���O�H
	Sleep(30)
	
	PlayMotion(tony   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(tony ,"[S_423288_ACT8]")					--�������A�A�h�w�������̧a�A�l���ۤH���˯Ǧh�ָM�����h�L�N�浹�ڭ̤F�C
	Sleep(30)
	
	PlayMotion(Arni   ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Say( Arni,"[S_423288_ACT9]")						--���§A�̡I
	Sleep(30)
	BeginPlot( A1, "LuaS_423288_ACT3" , 0 )
	BeginPlot( A2, "LuaS_423288_ACT3" , 0 )
	BeginPlot( Arni, "LuaS_423288_ACT3" , 0 )
	Sleep(60)
	Delobj(tony)
	Delobj(A1)
	Delobj(A2)
	Delobj(Arni)
	CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�
	SetFlag(TargetID() , 544036 , 1)			--�����n�X�СA�}�ҤU�ӥ���
	DisableQuest( OwnerID() , false )
end

function LuaS_423288_ACT1()	
	DW_MoveToFlag(OwnerID(),780636,4,0,1)
end

function LuaS_423288_ACT2()	
	DW_MoveToFlag(OwnerID(),780636,5,0,1)
end

function LuaS_423288_ACT3()	
	DW_MoveToFlag(OwnerID(),780636,6,0,1)
	Hide(OwnerID())
end


	
	
function LuaS_423289_0()
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423289_0]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423289_0]" , 0 )
	--�r�ڰڰڡI�I�I
	Sleep(20)
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423289_1]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423289_1]" , 0 )
	--(�M�����ǨӼ����몺�Y�G�F�s�I�I)
end	
	