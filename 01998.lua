--�D�u1

------����423518�D�]����]----
function LuaS_423518()	--���b�¬��d���W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423518 ) == true  and	checkFlag( OwnerID() , 544360 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423518_1]", "LuaS_423518_1", 0 )--�A�Q������H�����򤣸�����}�H
	end
end

function LuaS_423518_1()
	SetSpeakDetail(	OwnerID() , "[SC_423518_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423518_3]", "LuaS_423518_2" , 0 )
end

function LuaS_423518_2()
	SetSpeakDetail( OwnerID() , "[SC_423518_4]" )
	AddSpeakOption( OwnerID() ,TargetID(), "[SC_423518_5]" , "LuaS_423518_3" , 0 )
end

function LuaS_423518_3()
	SetSpeakDetail( OwnerID() , "[SC_423518_6]" )
	SetFlag( OwnerID() , 544360 , 1 )
end
--------------------------------------------------------

--------------------------------------------------------
function LuaS_423522()	--���b423522.423523.423524[�������ȫ���檺LUA��]
	if  CheckFlag( TargetID() , 544362 )	==	true and CheckFlag( TargetID() , 544363 ) == true and CheckFlag( TargetID() , 544364 ) == true then
		SetFlag( TargetID() , 544365 , 1 )
		SetFlag( TargetID() , 544635 , 1 )
	end
end

------------------------------------------------------------

-----------423519�i�@�B��Ĳ------------
--116205 ���̱Z�g   116206 ���¬��d  116207 ������
--116202 �u�̱Z�g	226203 �u�¬��d  116204 �u����

--/GM ? createflag
--780727-�¬��d�X�l  780726-��Z�g�X�l

function LuaS_423519()	--���H�]���禡 �i�P�_�h�H�@��
	local T_ID = TargetID() --�ŧi��NPC��TargetID
	local O_ID = OwnerID() --���a	
	if CheckAcceptQuest( O_ID, 423519 ) == true and CheckFlag( OwnerID(), 544361 ) == false and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		--�P�_������  �S���X��  �åB��NPC���L��
		SetSpeakDetail( O_ID, "[SC_423519_0]" ) --�еy���ڤ@�U�C
	elseif CheckAcceptQuest( O_ID, 423519 ) == true and CheckFlag( OwnerID(), 544361 ) == false then 
		--�_�h�i��ĤG�P�_  ������ �S���X�� �ø�NPC�����L��
		AddSpeakOption( O_ID, T_ID, "[SC_423519_9]", "Lua_423519_1",0) --�ڷǳƦn�F�C
		SetSpeakDetail(OwnerID(),"[SC_423519_1]")
	else
		LoadQuestOption( O_ID )	--�p�G�����o�ӡA��NPC��L���ȱN���|�Q���a�ݨ�
	end
end

function Lua_423519_1()
	local T_ID = TargetID() --�̱Z�g
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )	--�����Ҧ���ܵ���
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )	--��NPC�ܦ��L
	BeginPlot( T_ID, "Lua_423519_2", 0 )	--�I�s�U�@�q�禡
end

function Lua_423519_2()
	while true do							--�`�N �o�O�j�� �N�۰ʤWBUFF �۰ʧP�_���a���L���}�@���d��
		local O_ID = OwnerID()				--���bNPC���W���t���@��
		local QuestID = 423519				--���Ƚs�� (�u�n��ʦ��s��)
		local FinishFlagID = 544361			--����������o���X��	(�u�n��ʦ��s��)
		local CheckBuffID = 507178			--�ˬd�O�_���b�t����BUFF(�u�n��ʦ��s��) 507178���t��BUFF 503977���ɦ�BUFF
		local CheckRange = 150				--�t�����ˬd�d��(�u�n��ʦ��d��)
		local DoScript = "Lua_423519_break"	--��@�������Ϊ̨S�H�b�����ɧ@���B�z	(423519�n�אּ�ۤv�����Ƚs��)
				
		--�t����
		local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116204, 120, 0 )	--�ŧi�j�M�쪺������tony
		tony = LuaFunc_CreateObjByObj ( 116207 , tony ) --�åBtony����������H�A�æbtony����m�W�إX116207�o�Ӵ������H
		local icl = LuaFunc_CreateObjByObj ( 116205 , OwnerID() ) --�̱Z�g���H		
		local BK = Lua_DW_CreateObj("flag" ,116206,780727,1)	--�N116206����b780727���Ĥ@�ںX�l�W�إX�� �ëŧi��BK
		ks_ActSetMode( tony )	--�t���M�Ψ禡  ���H�]��(�������ʼ@�� �O���������A �L�k����'����'����'�I��'���æ��'��ܦW��)
		ks_ActSetMode( icl )
		ks_ActSetMode( BK )
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--�d������Ϊ��ˬd�禡(�n�[�J �I���ˬd�禡)
		Sleep(10)
		DW_MoveToFlag(icl,780726 , 1 ,0 ,1)		--��icl����780726����1�ںX�l
		DW_MoveToFlag(BK,780727 , 2 ,0 ,1)		--��BK����780727����2�ںX�l
		Sleep(20)
		AdjustFaceDir ( BK, tony ,0 )		--�϶¬��d�������
		AdjustFaceDir ( icl, BK ,0 )		--�Ϩ̱Z�g����¬��d
		Sleep(5)
		Say(tony,"[SC_423519_2]")
		Sleep(20)
		Say(BK,"[SC_423519_3]")
		Sleep(20)
		Say(tony,"[SC_423519_4]")
		Sleep(20)
		Say(BK,"[SC_423519_5]")
		Sleep(80)
		Say(BK,"[SC_423519_6]")
		Sleep(60)
		Say(tony,"[SC_423519_7]")
		Sleep(20)
		Say(BK,"[SC_423519_8]")
		Sleep(10)
		DW_MoveToFlag(BK,780727 , 3 ,0 ,1)		--��BK����780727����3�ںX�l
		delobj(BK)
		DW_MoveToFlag(icl,780726 , 2 ,0 ,1)		--��icl����780726����1�ںX�l				
		Sleep(10)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --���t���F �۰ʵ����X��(�n�[�J �I���禡)
		break								--�b�̫᭱�O�o�[break���_
	end
end

function Lua_423519_break()					--�o�q�����_/�����ɭn�@���Ʊ�(�ݭn���禡���U�P�_)(423519�n�אּ�ۤv�����Ƚs��)
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116207, 150, 0 )--�j�M����ѥ[��NPC�t��
	local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116205, 100, 0 )
	local bk = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116206, 100, 0 )
	
	if tony ~= nil then delobj(tony) end							--�p�G�s�b �h�R��
	if icl ~= nil then delobj(icl) end
	if bk ~= nil then delobj(bk) end
	ks_resetObj( OwnerID(), nil )									--�D�`���n �R�������t���@����NPC �@���m
end

-----------------------------------------------

---------423525�j�𦳦�-------------

function LuaS_423525()			--���b115597����NPC�����~�U
	SetPlot( OwnerID(), "range","LuaS_423525_1", 100 )
end

function LuaS_423525_1()--  OwnerID�O���a  �t�X�@�����i�b���a���W����
	if	CheckAcceptQuest( OwnerID() ,423525 ) == true	and 	CheckFlag( OwnerID() , 544366 ) == false and CheckBuff( OwnerID(), 507178 ) == false and 
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then--��NPC���L���ɭ�
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )	--��NPC��
		--SetPlot(TargetID(), "range","", 0 )
		BeginPlot( TargetID(), "LuaS_423525_2", 0 )		
	elseif CheckAcceptQuest( OwnerID() , 423525 ) == true	and CheckFlag( OwnerID() , 544366 ) == false and CheckBuff( OwnerID(), 507178 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423525_0]" , "0xFFFFF266" ) --�i�D���a�A�����a�����A��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423525_0]" , "0xFFFFF266" )
	end	
end

function LuaS_423525_2()
	--SetPlot( OwnerID(), "range","", 0 )
	while true do							--�`�N �o�O�j��
		local O_ID = OwnerID()				--���bNPC���W���t���@��
		local QuestID = 423525				--���Ƚs��
		local FinishFlagID = 544366			--����������o���X��
		local CheckBuffID = 507178			--�ˬd�O�_���b�t����BUFF
		local CheckRange = 150				--�t�����ˬd�d��
		local DoScript = "Lua_423525_break"	--��@�������Ϊ̨S�H�b�����ɧ@���B�z	
				
		local tony = Lua_DW_CreateObj("flag" ,116214,780725,1)	--�N116214����b780725���Ĥ@�ںX�l�W�إX�� �ëŧi��tony
		local SK = Lua_DW_CreateObj("flag" ,116215,780724,1)	--�N116215����b780661���Ĥ@�ںX�l�W�إX�� �ëŧi��SK			
		ks_ActSetMode( tony )	--����
		ks_ActSetMode( SK )		
		
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		Sleep(10)
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423525_0_1]" , "0xFFFFF266" ) 
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423525_0_1]" , "0xFFFFF266" )
		Sleep(20)
		say(tony , "[SC_423525_1]" )
		Sleep(20)
		say(SK , "[SC_423525_2]" )
		Sleep(20)
		say(tony , "[SC_423525_3]" )
		Sleep(50)
		say(SK , "[SC_423525_4]" )
		Sleep(40)
		say(tony , "[SC_423525_5]" )
		Sleep(20)
		say(SK , "[SC_423525_6]" )
		Sleep(20)
		say(tony , "[SC_423525_7]" )
		Sleep(40)
		say(tony , "[SC_423525_8]" )
		Sleep(40)
		say(SK , "[SC_423525_9]" )
		Sleep(50)
		say(tony , "[SC_423525_10]" )
		Sleep(40)
		say(tony , "[SC_423525_11]" )
		Sleep(30)
		say(SK , "[SC_423525_12]" )
		Sleep(30)
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423525_13]" , "0xFFFFF266" ) 
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423525_13]" , "0xFFFFF266" )
		Sleep(20)
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423525_14]" , "0xFFFFF266" ) 
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423525_14]" , "0xFFFFF266" )
		Sleep(20)
		--delobj(tony)
		--delobj(SK)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --���t���F �����X��
		break
	end
end


function Lua_423525_break()					--�o�q�����_/�����ɭn�@���Ʊ�
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116214, 300, 0 )--�j�M����ѥ[��NPC�t��
	local SK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116215, 300, 0 )

	if tony ~= nil then delobj(tony) end							--�p�G�s�b �h�R��
	if SK ~= nil then delobj(SK) end
	local obj = ks_resetObj( OwnerID(), nil )									--�D�`���n �R�������t���@����NPC �@���m
	ks_SetController( obj )--�]�w���α����
end
----------------------------------------

---------����423526���N�լd���i---------
function Luas_423526()	--���b116212�������W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423526 ) == true and	checkFlag( OwnerID() , 544367 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423526_1]", "Luas_423526_1", 0 )
	end
end

function Luas_423526_1()
	SetSpeakDetail(	OwnerID() , "[SC_423526_2]" )
	AddSpeakOption( OwnerID() , TargetID() ,"[SC_423526_3]", "Luas_423526_2" , 0 )
end

function Luas_423526_2()
	SetSpeakDetail( OwnerID() , "[SC_423526_4]" )
	AddSpeakOption( OwnerID() ,TargetID() , "[SC_423526_5]" , "Luas_423526_3" , 0 )
end

function Luas_423526_3()
	SetSpeakDetail( OwnerID() , "[SC_423526_6]" )
	SetFlag( OwnerID() , 544367 , 1 )
end
--------------------------------------------