function Initialize()
	Init_RoleValue_ENUM1();	-- �]�w����ƭȦC�|

	Init_RoleValue_ENUM2();

	Init_RoleValue_ENUM3();

	Init_MinimapIcon_ENUM();

	Init_Actorstate_ENUM();

	Init_Color_Enum();

	Init_RoleValue_GlobalValue();

	Init_Role_ModeValue();	--�t��_��l_�]�w�㹳�X��

	Init_RoleDataTable();	-- ���ը�����

	Init_Drama_Script();	-- �@���Υ����ܼ�

	Init_Cursor_Enum();

--	Init_RoleValue_ENUM1();	-- �]�w����ƭȦC�|
--	Init_RoleValue_ENUM2();
--	Init_RoleValue_GlobalValue();
--	Init_Role_ModeValue();	--�t��_��l_�]�w�㹳�X��
--	Init_RoleDataTable();	-- ���ը�����
--	Init_Drama_Script();	-- �@���Υ����ܼ�

	Init_PetEnvironment( ); -- �d�������ܼ�

	Init_QuestTitle();--�ٸ��P�_�����ܼ�

	Init_YU_PetAI_List();     --(�d��AI)

	Hsiang_GuildPet_Init();  --�s���d������event Init

	SuitSKillEqFunctionInit();  --�M�˧ޯ��l

	AddyClass_initialize();  --��l��ROM Class�A���B20130429�W�[

	ChristineClass_initialize();  --��l��ROM Class�A���B20130724�W�[

	Init_VectorTable();	-- �V�q���� ���E 20150723�W�[
end