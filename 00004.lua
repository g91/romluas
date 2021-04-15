function Initialize()
	Init_RoleValue_ENUM1();	-- 設定角色數值列舉

	Init_RoleValue_ENUM2();

	Init_RoleValue_ENUM3();

	Init_MinimapIcon_ENUM();

	Init_Actorstate_ENUM();

	Init_Color_Enum();

	Init_RoleValue_GlobalValue();

	Init_Role_ModeValue();	--系統_初始_設定顯像旗標

	Init_RoleDataTable();	-- 測試角色資料

	Init_Drama_Script();	-- 劇情用全域變數

	Init_Cursor_Enum();

--	Init_RoleValue_ENUM1();	-- 設定角色數值列舉
--	Init_RoleValue_ENUM2();
--	Init_RoleValue_GlobalValue();
--	Init_Role_ModeValue();	--系統_初始_設定顯像旗標
--	Init_RoleDataTable();	-- 測試角色資料
--	Init_Drama_Script();	-- 劇情用全域變數

	Init_PetEnvironment( ); -- 寵物全域變數

	Init_QuestTitle();--稱號判斷全域變數

	Init_YU_PetAI_List();     --(寵物AI)

	Hsiang_GuildPet_Init();  --新手寵物指導event Init

	SuitSKillEqFunctionInit();  --套裝技能初始

	AddyClass_initialize();  --初始化ROM Class，蝌蚪20130429增加

	ChristineClass_initialize();  --初始化ROM Class，蝌蚪20130724增加

	Init_VectorTable();	-- 向量相關 阿浩 20150723增加
end