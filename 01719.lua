-------�ȯZ�զ��Ĥl����Y
function LuaS_422985_Complete()
	DisableQuest( OwnerID() ,true )
	local Kid = Lua_DW_CreateObj("flag" , 114535 ,780542 , 2 )		--�إX���Ĥl
	WriteRoleValue(Kid , EM_RoleValue_IsWalk, 0 )
	Hide( Kid )
	Show( Kid ,0)
	MoveToFlagEnabled( Kid , false )
	LuaFunc_MoveToFlag( Kid , 780542 , 3 ,  0 )
	CastSpell(Kid,OwnerID(),494805)	
	Say( Kid , "[SC_422985_1]")			--�A�̡A���}�A�u�X�h�㳣�O�A�̮`���I
	sleep(25)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_DODGE)
	Say( Kid , "[SC_422985_2]")			--�ȯZ�դ��w��A�̡A���}�I
	sleep(10)
	CastSpell(Kid,OwnerID(),494805)
	sleep(25)
	Say( OwnerID() , "[SC_422985_3]")		--�����
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_DODGE)
	sleep(20)
	local Woman = Lua_DW_CreateObj("flag" , 114536 ,780542 , 2 )		--�إX���H
	WriteRoleValue(Woman , EM_RoleValue_IsWalk, 0 )
	Hide( Woman )
	Show( Woman ,0)
	MoveToFlagEnabled( Woman , false )
	LuaFunc_MoveToFlag( Woman , 780542 , 4 ,  0 )
	Say( Woman , "[SC_422985_4]")		--�ȳs�A���i�H�I
	AdjustFaceDir( Kid , Woman, 0 )
	AdjustFaceDir( Woman , Kid, 0 )
	sleep(20)
	Say( Woman , "[SC_422985_5]")		--�U�@�S�L�̥ͮ����H
	sleep(30)
	Say( Kid , "[SC_422985_6]")			--�ڤ~���ȥL�̩O�I���O�L�̮`���I����M�h�γ̥i�c�F
	sleep(30)
	Say( Woman , "[SC_422985_7]")			--�N�I�O���F�A�ڭ̧֨���	
	WriteRoleValue(Kid , EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(Woman , EM_RoleValue_IsWalk, 0 )
	sleep(15)
	LuaFunc_MoveToFlag( Kid , 780542 , 5 ,  0 )
	Delobj( Kid )
	LuaFunc_MoveToFlag( Woman , 780542 , 5 ,  0 )
	Delobj( Woman )
	DisableQuest( OwnerID() ,false )
end


-------�߰ݨȯZ�թ~��
function LuaS_422986_Woman()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422986 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422986_0]" , "LuaS_422986_Woman_Answer", 0 )	--�аݧA���D�������診��p�ĭn��ۧڭ̥���Y�ܡH
	end
end

function LuaS_422986_Woman_Answer()
	SetSpeakDetail(OwnerID(),"[SC_422986_1]")	--�]���H��몺�ݤF�A�@���C�^...
	SetFlag(OwnerID() , 543669 , 1 )
end

function LuaS_422986_Oldman()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422986 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422986_0]" , "LuaS_422986_Oldman_Answer", 0 )	--�аݧA���D�������診��p�ĭn��ۧڭ̥���Y�ܡH
	end
end

function LuaS_422986_Oldman_Answer()
	SetSpeakDetail(OwnerID(),"[SC_422986_2]")	--����F�ԥ������Ӫ��j�H...
	SetFlag(OwnerID() , 543670 , 1 )
end

function LuaS_422986_Boy()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422986 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422986_0]" , "LuaS_422986_Boy_Answer", 0 )	--�аݧA���D�������診��p�ĭn��ۧڭ̥���Y�ܡH
	end
end

function LuaS_422986_Boy_Answer()
	SetSpeakDetail(OwnerID(),"[SC_422986_3]")	--�o�O�ӷM���U�������D...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422986_4]" , "LuaS_422986_Boy_Answer_1", 0 )		--������j�a�|�o�������M�h�ΡH
end

function LuaS_422986_Boy_Answer_1()
	SetSpeakDetail(OwnerID(),"[SC_422986_5]")	--�ڭ̤��u������M�h�ΡA�٫��ۤH���I...
	SetFlag(OwnerID() , 543671 , 1 )
end

-------�j�N�x���������
function LuaS_422989()
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),424223) == true 	and
		CountBodyItem(OwnerID(),209473) == 0 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424213_01]","LuaAS_424223_02",0)
	end
	if 	CheckAcceptQuest(OwnerID(),424214) == true 	and
		CountBodyItem(OwnerID(),209413) == 0 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424214_01]","LuaAS_424214_01")
	end
	if	CheckAcceptQuest( OwnerID() ,422989 ) == true	and
		CheckFlag( OwnerID() , 543672) == false	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_0]" , "LuaS_422989_0", 0 )	--�z�n�ݧڤ�����D�H�����դU�C
	end
	if	(CheckAcceptQuest(OwnerID(),423012)==true )and( CheckCompleteQuest( OwnerID(),423012)==false)	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423012_0]","LuaS_423012_1",0)	--�����ӭn���D����H
	end
	if	CheckAcceptQuest( OwnerID() , 422990 ) == true and CheckFlag( OwnerID() , 543750 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422990_0]","LuaS_422990_1",0)	--�ڤw�g�ǳƦn�F
	end
	if	CheckAcceptQuest( OwnerID() , 423222 ) == true and CheckFlag( OwnerID() , 543928) == false	then                                              --����423222�B�j�N�x����
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423222_0]","LuaS_423222_0",0)	--�j�N�x?
	end
	if	CheckAcceptQuest( OwnerID() ,423291 ) == true	and    CountBodyItem ( OwnerID() , 207341 ) >0	then  
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_0_0]" , "LuaS_423291_0", 0 )	
	end	
end

function LuaS_422989_0()
	SetSpeakDetail(OwnerID(),"[SC_422989_1]")		--�A���L�h�O����A�ڤ��b�G...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_2]" , "LuaS_422989_1", 0 )		--��������M�h�Ϊ��W�n�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_3]" , "LuaS_422989_2", 0 )		--�ڦ��D�����i����H�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_4]" , "LuaS_422989_3", 0 )		--���ɦۧڹ�O�A�����@�y�M�h�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_5]" , "LuaS_422989_4", 0 )		--���̦��n�������̥h�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_6]" , "LuaS_422989_5", 0 )		--�Ȯɤ���]���Q���C
end

function LuaS_422989_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_7]")		--�]�A�ݨ������S�X�����I�Ǫ������C�^...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_8]" , "LuaS_422989_1_1", 0 )		--�ڤ��|���߿i�m���I
end

function LuaS_422989_1_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_9]")		--�]���M�u�ȡA���o���A�M�����ݨ��o��j�N�x���o�����e�F�C�^...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543673 , 1 )			--��������M�h�Ϊ��W�n
end

function LuaS_422989_2()
	SetSpeakDetail(OwnerID(),"[SC_422989_10]")		--�_���|�Ϥ@�ӤH��j...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_11]" , "LuaS_422989_2_1", 0 )		--�ڵ����|�ݱ��L�d�I
end

function LuaS_422989_2_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_12]")		--�p�G���@�ѧA�b�_��...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543674 , 1 )			--��������M�h�Ϊ��W�n
end

function LuaS_422989_3()
	SetSpeakDetail(OwnerID(),"[SC_422989_13]")		--��H����M�h�θ̡A�i���A�����]�˪��ؼСH
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_14]" , "LuaS_422989_3_1", 0 )		--���A�j�N�x�A�N�O�ڪ��ؼСC
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_15]" , "LuaS_422989_3_2", 0 )		--���A�ڷQ�������ƹΪ���Z�g���˪��@�y�M�h�I
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_16]" , "LuaS_422989_3_3", 0 )		--���A�ڷQ�����͡E�ͦ]�����˪��@�y�M�h�I
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_17]" , "LuaS_422989_3_4", 0 )		--���A�ڷQ�����������E�N�ҰҨ��˪��@�y�M�h�I
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_18]" , "LuaS_422989_3_5", 0 )		--�S���A�ڪ��ؼХt����H�A�ëD����M�h�θ̪��M�h�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_19]" , "LuaS_422989_3_6", 0 )		--�S���A�ڷQ���ۤv���M�h�����C
end

function LuaS_422989_3_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_20]")		--�]���������U�Q���f���ۧA�A�̫�A�L�u�O�H�H�@���A�S���h������C�^
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543675 , 1 )			--�Q��������
end

function LuaS_422989_3_2()
	SetSpeakDetail(OwnerID(),"[SC_422989_21]")		--��Z�g�O�ӫD�`���d���P���M�h...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543676 , 1 )			--�Q������Z�g
end

function LuaS_422989_3_3()
	SetSpeakDetail(OwnerID(),"[SC_422989_22]")		--�A�i���D�ͪë����N���O����H...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_23]" , "LuaS_422989_3_3_1", 0 )		--���@�R�P�M���I	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_24]" , "LuaS_422989_3_3_2", 0 )		--���q�L�Ҥ��b�I�½å��q�I
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_25]" , "LuaS_422989_3_3_3", 0 )		--���q�ۤv����ı�I
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_26]" , "LuaS_422989_3_3_4", 0 )		--��....�ڤ��O�ܲM��......	
end

function LuaS_422989_3_3_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_27]")		--��A���ݧA���@�Ѥ]�|�����p�P�ͳo��ŷx...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543677 , 1 )			--�Q��������
end

function LuaS_422989_3_3_2()
	SetSpeakDetail(OwnerID(),"[SC_422989_28]")		--�b����R�����q�����c��...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543677 , 1 )			--�Q��������
end

function LuaS_422989_3_3_3()
	SetSpeakDetail(OwnerID(),"[SC_422989_29]")		--�γ\....�A�u���O�̤@�ӱ���ͥ��誺�M�h....
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543677 , 1 )			--�Q��������
end

function LuaS_422989_3_3_4()
	SetSpeakDetail(OwnerID(),"[SC_422989_30]")		--����A�n�n���[��͡A�L�|�O�A�ܦn����d�C...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543677 , 1 )			--�Q��������
end

function LuaS_422989_3_4()
	SetSpeakDetail(OwnerID(),"[SC_422989_31]")		--�]�������G�N�N�����F�C�^...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543678 , 1 )			--�Q��������
end

function LuaS_422989_3_5()
	SetSpeakDetail(OwnerID(),"[SC_422989_32]")		--������A�p�����R�H...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543679 , 1 )			--��L�M�h
end

function LuaS_422989_3_6()
	SetSpeakDetail(OwnerID(),"[SC_422989_33]")		--�]�������F�A���e���o�y�S�X�����x�N�C�^...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543680 , 1 )			--���ۤv����
end


function LuaS_422989_4()
	SetSpeakDetail(OwnerID(),"[SC_422989_34]")		--�b�٬O�M�����ɥN...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543681 , 1 )			--��B��
end

function LuaS_422989_5()
	SetSpeakDetail(OwnerID(),"[SC_422989_35]")		--�b����M�h���D���W�A�`���@�ѧA�|���A���ؼСC...
	SetFlag(OwnerID() , 543672 , 1 )			--���ȧ����X��
	SetFlag(OwnerID() , 543702 , 1 )			--������
end


--------------------------------------------------------------------
--15�ƥ�����--�`�c���v��������

function LuaS_423291_0()
	SetSpeakDetail(OwnerID(),"[SC_423291_0]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_1]" , "LuaS_423291_1", 0 )
end

function LuaS_423291_1()
	SetSpeakDetail(OwnerID(),"[SC_423291_2]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_3]" , "LuaS_423291_2", 0 )
end

function LuaS_423291_2()
	SetSpeakDetail(OwnerID(),"[SC_423291_4]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_5]" , "LuaS_423291_3", 0 )
end

function LuaS_423291_3()
	SetSpeakDetail(OwnerID(),"[SC_423291_6]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_7]" , "LuaS_423291_4", 0 )
end


function LuaS_423291_4()
	SetFlag(OwnerID(), 543917, 1 )
	SetSpeakDetail(OwnerID(),"[SC_423291_8]")

end
------------------------------------------------------------------------------



