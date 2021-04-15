
--�u�w���v������

function LuaS_421958_0() --�������ȫ�	Ĳ�o�@��
--�������a����
	DisableQuest(OwnerID(),true)
--���å��L
	Hide(OwnerID())
--�إ߾԰��δ��� &����԰���d�s�����D &���w�ؼ� &��������
	local StandIn = Lua_DW_CreateObj("obj",102354,OwnerID())
	SetPlot(StandIn,"dead","LuaS_421958_1",0)
	Say(StandIn,"[SC_421958_0]")
	BeginPlot(StandIn,"LuaS_Discowood_CheckPeace",0)
	SetAttack(StandIn,TargetID())
--�ˬd��ɵ���
	while	CheckID(StandIn)	do
		sleep(10)
	end
--�{�X���L	&���Ҥ���
	Show(OwnerID(),0)
	DisableQuest(OwnerID(),false)
end

function LuaS_421958_1() --���`�@�� �������X��
	local Tar
	for i=0,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,421958)	and
			CheckFlag(Tar,542913)==false	then
			SetFlag(Tar,542913,1)
		end
	end
	DelObj(OwnerID())
	return true
end


--�լd����s�I�F��  �ϥ� 780091�X  1��

function LuaS_422559_0() --����W����l	�d��@��
	SetPlot(OwnerID(),"range","LuaS_422559_1",150)
end

function LuaS_422559_1() -- �d��@��	����
--Ĳ�I�̬O�_	��������&�|������
	if	CheckAcceptQuest(OwnerID(),422559)	and
		CheckFlag(OwnerID(),542915)==false	then
--��ܦr�괣��
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422559]", 0 );
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422559]", 0 );
--�����������ȺX��
		SetFlag(OwnerID(),542915,1)
	end
end

function LuaS_422559_2()--���~�ϥ�	�ˬd�@��
--�P�_�Z���O�_�L��
	if	not	DW_CheckDis(OwnerID(),780091,1,150)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SYS_TOUCH_TARGET_TOFAR]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SYS_TOUCH_TARGET_TOFAR]",0)
		return false
	end
	return true
end


function LuaS_422559_3()--���~�ϥ�	����@��
--���������X��
	SetFlag(OwnerID(),542914,1)
--�@����{	�إX�@�Ӥg��
	local StandIn = Lua_DW_CreateObj("obj",113266,OwnerID())
	BeginPlot(StandIn,"LuaS_Discowood_CheckPeace",0)
--�r��^�X
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422559_1]", 0 );
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422559_1]", 0 );
	return true
end


--�I�ӸO�C�C�o��t��


function LuaS_421962_2()-- �I����������
--�R�����
	DelBodyItem(OwnerID(),205646,1)
--����NPC����
	DisableQuest(TargetID(),true)
--�إX�t�������C	&��������	&�}�l����
	local Older = Lua_DW_CreateObj("flag",113272,780091,2)
	DisableQuest(Older,true)
--����U�@�q�@�� &�ǤJ�ӸOid
	WriteRoleValue(Older,EM_RoleValue_PID,OwnerID())
	CallPlot(Older,"LuaS_421962_3",TargetID())
	Say(Older,"[SC_421962_7]")
--�Ҫ�Ĳ�o
	return 1
end

function LuaS_421962_3(Rock)-- ���򪺪�t
	local Tar = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
--���ʨ���w��m
	DW_MoveToFlag( OwnerID(),780091,3,0,1)
	Say(OwnerID(),"[SC_421962_8]")
--���������X��	&���s�㹳
	SetFlag(Tar,542928,1)
--��XNPC ���s���J
--	local NPC = SearchRangeNPC(OwnerID(),100)
--	for i=0,table.getn(NPC)-1,1 do
--		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 113283	then
--			Hide(NPC[i])
--			Show(NPC[i],0)
--		end
--	end
--���ҹӸONPC����
	DisableQuest(Rock,false)
	DelObj(OwnerID())
end



--�¹�ܼ@��

function LuaS_422570_0()--���b����NPC����ܼ@��
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422570)	and
		CheckFlag(OwnerID(),542917)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422570_1]","LuaS_422570_1",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422570_2]","LuaS_422570_2",0)
	end
end

function LuaS_422570_1()
	SetSpeakDetail(OwnerID(),"[SC_422570_3]")
	SetFlag(OwnerID(),542917,1)
end

function LuaS_422570_2()
	SetSpeakDetail(OwnerID(),"[SC_422570_4]")	
end


--�¹�ܼ@��

--���b�Ⱥ����C�w����NPC����ܼ@��
function LuaS_422572_0() --���b�Ⱥ����C�w����NPC����ܼ@��
	LoadQuestOption(OwnerID())

	if	CheckAcceptQuest(OwnerID(),422572)	and
		CheckFlag(OwnerID(),542923)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422572]","LuaS_422572_1",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422572_1]","LuaS_422572_2",0)
	end

	if	(CheckAcceptQuest(OwnerID(),422897 )== true )and( CheckCompleteQuest( OwnerID(),422897)== false)	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_0]","LuaS_422897_1",0)				--�ڧ�۵M���۱a�^�ӤF�A���h�M�̮R�������L�K
	end

	if	(CheckAcceptQuest(OwnerID(),422842)==true ) 		and
		(CheckCompleteQuest( OwnerID() , 422842) == false ) 	and
		(CheckFlag(OwnerID(),543468)== false)			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422842_0]","LuaS_422842_1",0) 		--�u�i�h���������V�áA�|�O�T����}�Ҫ����Y�ܡH�v
	end

	if	(CheckAcceptQuest(OwnerID(),422855)==true ) 		and
		(CheckCompleteQuest( OwnerID() , 422855) == false )	and
		(CheckFlag(OwnerID(),543427)==false)		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422855_0]","LuaS_422855_1",0) 		--�u�٨S���A�ڷǳƵ��@�U�h���X�o�C�v
	end

end

function LuaS_422572_1()
	SetSpeakDetail(OwnerID(),"[SC_422572_2]")
	SetFlag(OwnerID(),542923,1)
end

function LuaS_422572_2()
	SetSpeakDetail(OwnerID(),"[SC_422572_3]")	
end




-- ���ȧ����~�X�{���U�l

function LuaS_422568_1()--���b���~�ϥ�	����@��	�����~
	GiveBodyItem(OwnerID(),205614,1)
	GiveBodyItem(OwnerID(),205615,1)
	GiveBodyItem(OwnerID(),205616,1)
end


function LuaS_422568_2() --���b���~�ϥ�	����@��	���o����
--��l�ƥ۸O����
	ClearBorder( OwnerID())	
--�۸O���e
	AddBorderPage( OwnerID(), GetQuestDetail(422568,1))
--�۸O���D
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 422568, str ,"ScriptBorder_Texture_Paper" )
end

function LuaS_422568_3() --Ĳ�I�@��
	SetPlot(OwnerID(),"touch","LuaS_422568_4",50)
end

function LuaS_422568_4() --Ĳ�I�@������
--�ϥΪ��~
	GiveBodyItem(OwnerID(),205617,1)
--���s���J
--	Hide(TargetID())
--	Show(TargetID(),0)
end


--422565


function LuaS_422565_0()--���b���~�ϥ�	����@��	���o����
	SetFlag(OwnerID(),542916,1)
--��l�ƥ۸O����
	ClearBorder( OwnerID())	
--�۸O���e
	AddBorderPage( OwnerID(), GetQuestDetail(422566,1))
--�۸O���D
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 422566, str , "ScriptBorder_Texture_Paper" )
end

function LuaS_422565_1()--��l�@��	���WĲ�I�@��
	SetPlot(OwnerID(),"touch","LuaS_422565_2",50)
end

function LuaS_422565_2()--Ĳ�I�@��������@��
--�קK����Ĳ�o
	SetPlot(TargetID(),"touch","",0)
--���ˬd���ȶ��q &��������
	if	CheckAcceptQuest(OwnerID(),422565)	and
		CheckFlag(OwnerID(),542916)==false	then
		SetFlag(OwnerID(),542916,1)
	end
--���ˬd���ȶ��q &��������
	if	CheckAcceptQuest(OwnerID(),422566)==false	and
		CheckCompleteQuest(OwnerID(),422566)==false	and
		CountBodyItem(OwnerID(),205598)<1		then
		GiveBodyItem(OwnerID(),205598,1)
	end
--����Ĳ�o
	SetPlot(TargetID(),"touch","LuaS_422565_2",50)
end

--�ݵ��D�T��@


--���b�̮R��������NPC����ܼ@��
function LuaS_421962_4() --���b����NPC����ܼ@��
	LoadQuestOption(OwnerID())
--�p�G�������ȫo�٨S����
	if	CheckAcceptQuest(OwnerID(),421962)	and
		CheckFlag(OwnerID(),542930)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_421962_1]","LuaS_421962_5",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_421962_2]","LuaS_421962_6",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_421962_3]","LuaS_421962_7",0)
	end

	if (CheckAcceptQuest(OwnerID(),422628)==true )and(CheckCompleteQuest( OwnerID() , 422628) == false )then	--�Ӫ줧�Ұƥ�����
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_0]","LuaS_422628_1",0)
	end

	if ( CheckAcceptQuest(OwnerID(),422876)==true) and (CheckBuff( OwnerID() , 505441)== true) then
		SetFlag( OwnerID() , 543505, 1 )
	end

	if (CheckBuff( OwnerID() , 505441)== false)and( CheckAcceptQuest(OwnerID(),422876)==true) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696_101]" , C_SYSTEM ) --�A�w�g�W�ɶ��A�Щ����ȭ��s�ӹL
	end

	if	(CheckAcceptQuest(OwnerID(),422841)==true )		and					--�v�֥|����
		(CheckCompleteQuest( OwnerID() , 422841) == false ) 	and
		(CheckFlag(OwnerID(),543467)==false)  		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422841_0]","LuaS_422841_2",0) 		--�u�ର[113282]�k�h�z�ĳҡA�O�ڪ��a���C�v
	end

	if	(CheckAcceptQuest(OwnerID(),422844)==true ) 		and
		(CheckCompleteQuest( OwnerID() , 422844) == false )	 and
		(CheckFlag(OwnerID(),543541)==false)  		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422844_0]","LuaS_422844_1",0)		--�u�O�o�A���O[113274]���ѻ��A�����t�C���O�^���u�洵�ڡC�v
	end


end

function LuaS_421962_5()
	SetSpeakDetail(OwnerID(),"[SC_421962_4]")
	SetFlag(OwnerID(),542930,1)
end

function LuaS_421962_6()
	SetSpeakDetail(OwnerID(),"[SC_421962_5]")
end

function LuaS_421962_7()
	SetSpeakDetail(OwnerID(),"[SC_421962_6]")
end



--���~���޾�

function LuaS_422575_1()
	SetSpeakDetail(OwnerID(),"[SC_422575_1]")
	SetFlag(OwnerID(),542936,1)
end



--�U�l���ߩ�	422554	& 422555	�ϥκX��	780092	1(�x�l)	2(�p�U�l�X���I)	3(�U�l�����x�l�Ǫ��I)	4(���o���I�k��)

function LuaS_422554_0() -- �������ȼ@��
--��������
	DisableQuest(OwnerID(),true)
--��U�x�l	&�x��
	local Bag = Lua_DW_CreateObj("flag",113329  ,780092,1)
	Say(OwnerID(),"[SC_422554_1]")
	sleep(15)
--�гy�p�U	&����	&����	&�k��	&�R��
	local Monkey = Lua_DW_CreateObj("flag",113256,780092,2 )
	DW_MoveToFlag( Monkey , 780092 , 3 , 0 ,1 )
	PlayMotion(Monkey,ruFUSION_ACTORSTATE_CAST_INSTANT)
	sleep(10)
	BeginPlot(Monkey,"LuaS_422554_1",0)
	sleep(15)
	DelObj(Monkey)
--�x��		&�R�h�x�l
	Say(OwnerID(),"[SC_422554_2]")
	sleep(15)
	DelObj(Bag)
--���Ҥ���
	DisableQuest(OwnerID(),false)
end


function LuaS_422554_1() --���ʩI�s�@��
--���ʨ���w��m
	DW_MoveToFlag( OwnerID() , 780092 , 4 , 0 ,1 )
end



function LuaS_422555_0()  --�������ȼ@��
--��������
	DisableQuest(OwnerID(),true)
--��U�x�l	&�x��
	local Bag = Lua_DW_CreateObj("flag",113329  ,780092,1)
	Say(OwnerID(),"[SC_422554_3]")
	sleep(15)
--�гy�p�U	&����	&����	&�k��	&�R��
	local Monkey = Lua_DW_CreateObj("flag",113256,780092,2 )
	DW_MoveToFlag( Monkey , 780092 , 3 , 0 ,1 )
	PlayMotion(Monkey,ruFUSION_ACTORSTATE_CAST_INSTANT)
	sleep(10)
	BeginPlot(Monkey,"LuaS_422554_1",0)
	sleep(15)
	DelObj(Monkey)
--�x��		&�R�h�x�l
	Say(OwnerID(),"[SC_422554_4]")
--�����X��
	SetFlag(TargetID(),542922,1)
	sleep(15)
	DelObj(Bag)
--���Ҥ���
	DisableQuest(OwnerID(),false)
end
