function Init_RoleValue_ENUM3()

--SetModeEx( int GItemID , int Type , bool Flag ) �]�w�����ݩ�
Value = 0;
EM_SetModeType_Show		= Value; Value = Value + 1;	--�q�X(���רq�X������, �аO/�P��)
EM_SetModeType_Mark		= Value; Value = Value + 1;	--�i�аO/�I��(�i�H�����a�I��)
EM_SetModeType_Obstruct		= Value; Value = Value + 1;	--�|����(���ר�L������)
EM_SetModeType_Gravity		= Value; Value = Value + 1;	--�����O
EM_SetModeType_Save		= Value; Value = Value + 1;	--������O�_�n�x�s
EM_SetModeType_Drag		= Value; Value = Value + 1;	--�O�_�|�O�������ɨ�
EM_SetModeType_GMHide		= Value; Value = Value + 1;	--��������
EM_SetModeType_IsAllZoneVisible	= Value; Value = Value + 1;	--����i������
EM_SetModeType_DisableRotate	= Value; Value = Value + 1;	--�T��۰ʱ���
EM_SetModeType_Strikback		= Value; Value = Value + 1;	--����
EM_SetModeType_Move		= Value; Value = Value + 1;	--����
EM_SetModeType_Searchenemy	= Value; Value = Value + 1;	--�j�M�ĤH
EM_SetModeType_Revive		= Value; Value = Value + 1;	--�i����
EM_SetModeType_Fight		= Value; Value = Value + 1;	--�i�������
EM_SetModeType_Escape		= Value; Value = Value + 1;	--�k�]
EM_SetModeType_SearchenemyIgnore	= Value; Value = Value + 1;	--�����󤣷|�Q�j�M��
EM_SetModeType_AlignToSurface	= Value; Value = Value + 1;	--�K����
EM_SetModeType_HideName		= Value; Value = Value + 1;	--NPC �Ϊ����Y�W���W�٬O�_���
EM_SetModeType_HideMinimap	= Value; Value = Value + 1;	--NPC �Ϊ���b�p�a�ϤW���O�_���
EM_SetModeType_ShowRoleHead	= Value; Value = Value + 1;	--�I�������,�O�_�n����Y����
EM_SetModeType_CollisionPlot	= Value; Value = Value + 1;	--�O�_�֦��I���@��
EM_SetModeType_Treasure		= Value; Value = Value + 1;	--�_�c
EM_SetModeType_IgnoreNpcKill	= Value; Value = Value + 1;	--����npc����
EM_SetModeType_NotShowHPMP	= Value; Value = Value + 1;	--����ܦ��
EM_SetModeType_DisableAction	= Value; Value = Value + 1	--�Ȯɧ��ܰʧ@

--int HateListInfo( int GItemID , int Pos , int Type ) ���o������� ��T
Value = 0;
EM_HateListInfoType_DBID		= Value; Value = Value + 1;	--��ƮwDBID
EM_HateListInfoType_GItemID	= Value; Value = Value + 1;	--�C�����󸹽X
EM_HateListInfoType_HitPoint	= Value; Value = Value + 1;	--�ˮ`�Ǫ��I��(���_��)
EM_HateListInfoType_HatePoint	= Value; Value = Value + 1;	--�����	
EM_HateListInfoType_TempHatePoint	= Value; Value = Value + 1;	--�Ȯɪ������

-- int BuffInfo( int ItemGUID , int Pos , int Type )���oBuff���
Value = 0;
EM_BuffInfoType_OwnerID		= Value; Value = Value + 1;	--Buff �I�i��
EM_BuffInfoType_BuffID		= Value; Value = Value + 1;	--�]�kID
EM_BuffInfoType_Time		= Value; Value = Value + 1;	--�ѤU�ɶ�(��)
EM_BuffInfoType_Power		= Value; Value = Value + 1;	--�¤O( �]�k�ֿn����)
EM_BuffInfoType_Point		= Value; Value = Value + 1;	--�I��( �]�k�ޥi���I��or ����)

--	bool	CheckRelation	( int OwnerID , int TargetID , int Type  )
Value = 0;
EM_CheckRelationType_Attackable	= Value; Value = Value + 1;	--�i�_����
EM_CheckRelationType_Enemy	= Value; Value = Value + 1;	--�O�_�O�ĤH
EM_CheckRelationType_CheckLine	= Value; Value = Value + 1;	--�����O�_�S������
EM_CheckRelationType_InHateList	= Value; Value = Value + 1;	--�O�_�b�����

--void	ClientSkyType( int Type )	 �]�wClient �ݤѪŪ���ܤ覡
Value = 0;
EM_ClientSkyProcType_Normal	= Value; Value = Value + 1;	--�@��
EM_ClientSkyProcType_Day		= Value; Value = Value + 1;	--�դ�
EM_ClientSkyProcType_NightFall	= Value; Value = Value + 1;	--����
EM_ClientSkyProcType_Night	= Value; Value = Value + 1;	--�ߤW
EM_ClientSkyProcType_Dawn	= Value; Value = Value + 1;	--����

--lua����
--bool	ClockOpen( int GItemID , int CheckValue , int BeginTime , int NowTime , int EndTime  , const char* ChangeZonePlot , const char* TimeUpPlot );�ɶ��H���
--bool      ClockStop( int GItemID );�Ȱ��ɶ�
--bool      ClockClose( int GItemID );�����ɶ�
--int	ClockRead( int GItemID , int Type ); Ū���������
Value = 0;
EM_ClockValueType_CheckValue = Value; Value = Value + 1;
EM_ClockValueType_BeginTime  = Value; Value = Value + 1;
EM_ClockValueType_NowTime  = Value; Value = Value + 1;
EM_ClockValueType_EndTime  = Value; Value = Value + 1;
EM_ClockValueType_Type  = Value; Value = Value + 1;   -- 0 close 1 open 2 stop
--lua�����ŧi�B
Value = 0;
EM_ClockCheckValue_1 = Value; Value = Value + 1;	--���ʰƥ� �����j�D
EM_ClockCheckValue_2 = Value; Value = Value + 1;	--���ʰƥ� ���Ը���
EM_ClockCheckValue_3 = Value; Value = Value + 1;	--�`�y���� - �w�R�`  480s
EM_ClockCheckValue_4 = Value; Value = Value + 1;	--���|�ճ� �R�B�n�n��
EM_ClockCheckValue_5 = Value; Value = Value + 1;	--���ʰƥ� �����L�v�t
EM_ClockCheckValue_6 = Value; Value = Value + 1;	--���|�ճ� �ͦs�C��
EM_ClockCheckValue_7 = Value; Value = Value + 1;	--�`�y���� 2009 ��s�` �A�ȥͪ��@��
EM_ClockCheckValue_8 = Value; Value = Value + 1;	--�`�y���� 2009 ��s�` ��s�j�v
EM_ClockCheckValue_9 = Value; Value = Value + 1;	--���|�ճ� �����T�_
EM_ClockCheckValue_10 = Value; Value = Value + 1;	--�`�y���� 2009 �P���` ³��x��
EM_ClockCheckValue_11 = Value; Value = Value + 1;	--���|�ճ� �����Ԥh
EM_ClockCheckValue_12 = Value; Value = Value + 1;	--���|�Գ� �@�ɩ_�[�p��
EM_ClockCheckValue_13 = Value; Value = Value + 1;	--���|�ճ� ��ϯS�V
EM_ClockCheckValue_14 = Value; Value = Value + 1;	--���|�ճ� �϶˸շ�
EM_ClockCheckValue_15 = Value; Value = Value + 1;	--���ʰƥ� ���j�ڹ�
EM_ClockCheckValue_16 = Value; Value = Value + 1;	--�J�I�ƥ�1
EM_ClockCheckValue_17 = Value; Value = Value + 1;          --190�ɶ��ϥ�
EM_ClockCheckValue_18 = Value; Value = Value + 1;          --190�ɶ��ϥ�
EM_ClockCheckValue_19 = Value; Value = Value + 1;          --191�ɶ��ϥ�
EM_ClockCheckValue_20 = Value; Value = Value + 1;	--�`�y���� 2011 �����`�B�w�R�`  --60sec
EM_ClockCheckValue_21 = Value; Value = Value + 1;	--�`�y���� 2011 �w�R�`
EM_ClockCheckValue_22 = Value; Value = Value + 1;	--�`�y����2011-�K�B�` �ߤl�ֻ�
EM_ClockCheckValue_23 = Value; Value = Value + 1;	--���|�ճ� �����Ĭ�
EM_ClockCheckValue_24 = Value; Value = Value + 1; 	-- ���|�г� �T�ӤF
EM_ClockCheckValue_25 = Value; Value = Value + 1;          --Access Control -1�ɶ��ϥ�
EM_ClockCheckValue_26 = Value; Value = Value + 1;         --�����`--���c�~��
EM_ClockCheckValue_27 = Value; Value = Value + 1;	--�R�ָ`--���y�v��
EM_ClockCheckValue_28 = Value; Value = Value + 1;          -- ���ʰƥ�:Mobius
EM_ClockCheckValue_29 = Value; Value = Value + 1;  	--���ʰƥ�:�j�a�ӧ���
EM_ClockCheckValue_30 = Value; Value = Value + 1;    -- �`�y���� : �n�ʸ` - ���Ԫ����ιC�� (�w��6����)
EM_ClockCheckValue_31 = Value; Value = Value + 1;   -- ���B�t�� : �s���B§�|�� �p��120���� , 2�p��
EM_ClockCheckValue_32 = Value; Value = Value + 1;  --�w�꤭�P�~�A�_�c�}½�� 1 min
EM_ClockCheckValue_33 = Value; Value = Value + 1;  --��@�ɰƥ��p��15����
EM_ClockCheckValue_34 = Value; Value = Value + 1;
EM_ClockCheckValue_35 = Value; Value = Value + 1;
EM_ClockCheckValue_36 = Value; Value = Value + 1;
EM_ClockCheckValue_37 = Value; Value = Value + 1;
EM_ClockCheckValue_38 = Value; Value = Value + 1;
EM_ClockCheckValue_39 = Value; Value = Value + 1;
EM_ClockCheckValue_40 = Value; Value = Value + 1;

--int		GuildInfo( int GItemID , int Type )	--���o���|���
Value = 0;
EM_GuildInfoType_Rank			= Value; Value = Value + 1;
EM_GuildInfoType_GuildMemberCount	= Value; Value = Value + 1;
EM_GuildInfoType_GuildLv			= Value; Value = Value + 1;
EM_GuildInfoType_GuildHouse		= Value; Value = Value + 1;
EM_GuildInfoType_GuildState		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_Gold		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_BonusGold	= Value; Value = Value + 1;
EM_GuildInfoType_Resource_Mine		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_Wood		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_Herb		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_GuildRune	= Value; Value = Value + 1;
EM_GuildInfoType_Resource_GuildStone	= Value; Value = Value + 1;

--�d���ƭȰ���(  �[�C���d�����X100 ) �Ω�ReadRoleValue 
Value = 0;	
EM_CultivatePetStructValueType_ItemOrgID		= Value; Value = Value + 1; -- �d���J���s��
EM_CultivatePetStructValueType_CreateTime		= Value; Value = Value + 1; 
EM_CultivatePetStructValueType_OrgObjID		= Value; Value = Value + 1; --�d�����s��
EM_CultivatePetStructValueType_Lv			= Value; Value = Value + 1; --�d������
EM_CultivatePetStructValueType_PetType		= Value; Value = Value + 1; --�d���ر�(�ө�)
EM_CultivatePetStructValueType_EventColdown		= Value; Value = Value + 1;		
EM_CultivatePetStructValueType_EventType		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkillTablePos	= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Exp			= Value; Value = Value + 1; --�g��
EM_CultivatePetStructValueType_SKillPoint		= Value; Value = Value + 1; --�ثe�ޯ��I
EM_CultivatePetStructValueType_TotalSkillPoint		= Value; Value = Value + 1; --�`�ޯ��I��
EM_CultivatePetStructValueType_Loyal			= Value; Value = Value + 1; --�˱K��
EM_CultivatePetStructValueType_Hunger		= Value; Value = Value + 1; --������
EM_CultivatePetStructValueType_Talent		= Value; Value = Value + 1; --���O��
EM_CultivatePetStructValueType_Spirit			= Value; Value = Value + 1; --���
EM_CultivatePetStructValueType_Mode			= Value; Value = Value + 1; --�d�����A(���Q�l��B���b�Ȧ�B���b�Ͳ�...etc)
EM_CultivatePetStructValueType_Str			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Sta			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Agi			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Int			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Mnd			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Property		= Value; Value = Value + 1;--�d���ݩ�   0�a�B1���B2���B3���B4���B5�t
EM_CultivatePetStructValueType_TrainCount		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID0		= Value; Value = Value + 1;		
EM_CultivatePetStructValueType_MagicID1		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID2		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID3		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID4		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID5		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID6		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID7		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID8		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID9		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv0		= Value; Value = Value + 1;		
EM_CultivatePetStructValueType_MagicLv1		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv2		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv3		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv4		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv5		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv6		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv7		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv8		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv9		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicCount		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkill1		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkill2		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkill3		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkill4		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MergeCount		= Value; Value = Value + 1;

--�d����EventType
Value = 0;
EM_CultivatePetCommandType_None		= Value; Value = Value + 1;--�S���A(����ͬ��ޯ�)
EM_CultivatePetCommandType_OnTimeEvent	= Value; Value = Value + 1;--client �ݨC��q��Server �ݨ����d��(�B�z����or�S�O�ƥ�)
EM_CultivatePetCommandType_Summon	= Value; Value = Value + 1;--�l���d��
EM_CultivatePetCommandType_Feed		= Value; Value = Value + 1;--����
EM_CultivatePetCommandType_Travel		= Value; Value = Value + 1;--�Ȧ�
EM_CultivatePetCommandType_Free		= Value; Value = Value + 1;--���
EM_CultivatePetCommandType_Train		= Value; Value = Value + 1;--�S�V
EM_CultivatePetCommandType_Return		= Value; Value = Value + 1;--�l��X���d���^��
EM_CultivatePetCommandType_LiftSkill	= Value; Value = Value + 1;--�ͬ��ޯ�


--int		ReadGuildBuilding( int ItemGUID , int Type )
Value = 0;
EM_GuildBuildValueType_GuildID		= Value; Value = Value + 1;
EM_GuildBuildValueType_BuildingDBID	= Value; Value = Value + 1;
EM_GuildBuildValueType_ParentDBID		= Value; Value = Value + 1;
EM_GuildBuildValueType_BuildingID		= Value; Value = Value + 1;
EM_GuildBuildValueType_IsActive		= Value; Value = Value + 1;
EM_GuildBuildValueType_Value1		= Value; Value = Value + 1;
EM_GuildBuildValueType_Value2		= Value; Value = Value + 1;
EM_GuildBuildValueType_Value3		= Value; Value = Value + 1;


---	bool	SetSmallGameMenuType	( int GItemID , int MenuID , int Type );                                       --����ID, ��������ID, �}�����A
--	bool	SetSmallGameMenuValue	( int GItemID , int MenuID , int ID , int Value );                          --����ID, ��������ID, �i�ܰʼƭ�ID, �ܰʼƭ�
--	bool	SetSmallGameMenuStr	( int GItemID , int MenuID , int ID , const char* Content );         --����ID, ��������ID, �i�ܰʼƭ�ID, ���e��r

--SetSmallGameMenuType( OwnerID() , Value , Switch )( �ϥΪ� , Value = �r��Ǹ� , Switch = 1�}/2�� )
--�r��Ǹ�
-- 1	���|(�d��)
-- 2	���|�ճ�-�����Ԥh
-- 3	���|�ճ�-�����T�_
-- 4	�`�y����-�G�ĸ`(�@��A�ȥ�)
-- 5	���|�ճ�-�R�B�n�n��
-- 6	���|�ճ�-�w��շ�
-- 7	���|�ճ�-�����Ԥh
-- 8	���|�ճ�-�����Ĭ�
-- 9	���|�ճ�-�N�˸շ�
--10	���ʰƥ�-���j�ڹ�
--11	�`�y����-�����`(�����ɤ���)
--12	�����U���u��
--13	�`�y����-�]���g��y
--14         
--15	�`�y���ʦw�w���v��
--XX�бa�J�r��Ǹ�
--INSTANCE_SCORE_XX
--INSTANCE_STATE_XX
--INSTANCE_TIPS_XX

EM_SmallGameMenuType_Menu_ScoreBoard  = 0  -- �i���ܼƭ� ID= 1 , 2 ,3
EM_SmallGameMenuType_Open = 1
EM_SmallGameMenuType_Close = 2

-- �k���ƭ�
Value = 0;
EM_HouseServantValueType_NPCObjID	= Value; Value = Value + 1;  --
EM_HouseServantValueType_Character		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Sex		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Tired		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value0		= Value; Value = Value + 1;  --// 0-7 �򥻼ƭ�
EM_HouseServantValueType_Value1		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value2		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value3		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value4		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value5		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value6		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value7		= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue0	= Value; Value = Value + 1;  --	// 0-7 �̤j�򥻼ƭ�
EM_HouseServantValueType_MaxValue1	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue2	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue3	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue4	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue5	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue6	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue7	= Value; Value = Value + 1;  --
EM_HouseServantValueType_ClothColor0	= Value; Value = Value + 1;  --	// 0-1 ��A�C��
EM_HouseServantValueType_ClothColor1	= Value; Value = Value + 1;  --
EM_HouseServantValueType_Flag		= 1000; 		             --	// 0-255 �k���M�ݺX��	

--����Event_Module ����
EM_Event_Module_Type_LevelUp 	= 0
EM_Event_Module_Type_PlayerDead 	= 1
EM_Event_Module_Type_ChangeZone	= 2
EM_Event_Module_Type_Login	= 3
EM_Event_Module_Type_NPCDead	= 4
EM_Event_Module_Type_RoleLogin	= 5

--Billboard sorttype �Ʀ�]�����C�|
--�t��
--String���Y��SSB_SORTTYPE_XXX�����U��A�Ĥ@��EM_BillboardSortType_Money�N�O����XXX=001
Value = 0;
EM_BillboardSortType_Money			= Value; Value = Value + 1;  --//�֦�������   
EM_BillboardSortType_Money_Account		= Value; Value = Value + 1;  --//�֦������p   
EM_BillboardSortType_Money_Bonus			= Value; Value = Value + 1;  --//�֦������p   
EM_BillboardSortType_STR				= Value; Value = Value + 1;  --//�O�q          
EM_BillboardSortType_AGI				= Value; Value = Value + 1;  --//�ӱ�          
EM_BillboardSortType_STA				= Value; Value = Value + 1;  --//�@�O          
EM_BillboardSortType_INT				= Value; Value = Value + 1;  --//���z          
EM_BillboardSortType_MND				= Value; Value = Value + 1;  --//�믫          
EM_BillboardSortType_ATK				= Value; Value = Value + 1;  --//�����j��      
EM_BillboardSortType_MATK			= Value; Value = Value + 1;  --//�k�N�j��      
EM_BillboardSortType_DEF				= Value; Value = Value + 1;  --//���z���m      
EM_BillboardSortType_MDEF			= Value; Value = Value + 1;  --//�k�N���m     
EM_BillboardSortType_Honor			= Value; Value = Value + 1;  --//�a�A�I��     
EM_BillboardSortType_TitleCount			= Value; Value = Value + 1;  --//���쪺�ٸ��ƶq     
EM_BillboardSortType_QuestCompleteCount		= Value; Value = Value + 1;  --//�w�g���������ȼƶq 
--����
-- Billboard_Update		( OwnerID() , EM_BillboardSortType_Guildwarrior , 100 )
--EM_BillboardSortType_xxxxEvent	= 100
--�W�����檺=100�A�� SSB_SORTTYPE_100
EM_BillboardSortType_AncientDreamSpace = 100
EM_BillboardSortType_Range = 101                                               --//�v�����ʰƥ��p�ɼҦ�
EM_BillboardSortType_Range_Survival = 102                               --//�v�����ʰƥ��ͦs�Ҧ�
--------------------------------------------------------------
--����ƭȴ��ЦC�|
--value = 0
--EM_LuaValueFlag_GuidePetLvState 		= Value; Value = Value + 1;--//�s������d���ثe�B�z�쪺����
--EM_LuaValueFlag_GuidePetState	 		= Value; Value = Value + 1;--//�s������d���ثe���p

--------------------------------------------------------------
--Vip �|�� �X�� �N��N��
Vip_Member_Flag_Teleport	= 	0	-- �K�O�ϥζǰe���ѰO�I
Vip_Member_Flag_Sys1		= 	1	-- �K�O�ϥζǰe���Ѷǰe
Vip_Member_Flag_Sys2		= 	2
Vip_Member_Flag_Sys3		= 	3
Vip_Member_Flag_Sys4		= 	4
Vip_Member_Flag_Sys5		= 	5
Vip_Member_Flag_Sys6		= 	6
Vip_Member_Flag_Sys7		= 	7

value = 8	--������
Vip_Member_Flag_design1		= 	Value;Value = Value + 1	-- 1�Ѥ��A�W�[�԰��ұo�g���50%�C
Vip_Member_Flag_design2		= 	Value;Value = Value + 1	-- 1�Ѥ��A�W�[�԰��ұo�ޯ��I��50%�C
Vip_Member_Flag_design3		= 	Value;Value = Value + 1	-- 1�Ѥ��A�W�[���~�����v50%�C
Vip_Member_Flag_design4		= 	Value;Value = Value + 1	-- �O�d
Vip_Member_Flag_design5		= 	Value;Value = Value + 1	-- �I�]�ĤT���Ŷ����ΤѼƼW�[1��
Vip_Member_Flag_design6		= 	Value;Value = Value + 1	-- �I�]�ĥ|���Ŷ����ΤѼƼW�[1��
Vip_Member_Flag_design7		= 	Value;Value = Value + 1	-- �I�]�Ĥ����Ŷ����ΤѼƼW�[1��
Vip_Member_Flag_design8		= 	Value;Value = Value + 1	-- �I�]�Ĥ����Ŷ����ΤѼƼW�[1��
Vip_Member_Flag_design9		= 	Value;Value = Value + 1	-- �Ȧ�ĤG���Ŷ����ΤѼƼW�[1��
Vip_Member_Flag_design10		= 	Value;Value = Value + 1	-- �Ȧ�ĤT���Ŷ����ΤѼƼW�[1��
Vip_Member_Flag_design11		= 	Value;Value = Value + 1	-- �Ȧ�ĥ|���Ŷ����ΤѼƼW�[1��
Vip_Member_Flag_design12		= 	Value;Value = Value + 1	-- �Ȧ�Ĥ����Ŷ����ΤѼƼW�[1��
Vip_Member_Flag_design13		= 	Value;Value = Value + 1	-- 1�ӨC����ȭ��m��
Vip_Member_Flag_design14		= 	Value;Value = Value + 1	-- 1�ӵᥧ�J������ū 
Vip_Member_Flag_design15		= 	Value;Value = Value + 1	-- 1�Ӻ��Ը��R���ʭ��m��B1�ӥj�N���_���լd����
Vip_Member_Flag_design16		= 	Value;Value = Value + 1	-- 1���@�����M( �H���q 203571�B203572�B203573 ���1�� )
Vip_Member_Flag_design17		= 	Value;Value = Value + 1
--mode bit info
--------------------------------------------------------------
--�H���|������ �X�� �N��N��
--EM_RoleValue_UnTrust_Flag
--�{����
Trusted_Player_Flag_Mail		=	0	-- �L�k�ϥΫH�c
Trusted_Player_Flag_Item_Shop_Mail	=	1	-- �L�k�ϥΰӫ��e§
Trusted_Player_Flag_AC			=	2	-- �L�k�ϥΩ���
Trusted_Player_Flag_Trade		=	3	-- �L�k�P���a���
Trusted_Player_Flag_Whisper_Chat	=	4	-- �L�k�ϥαK�y
Trusted_Player_Flag_Word_Chat		=	5	-- �L�k�ϥΥ@���W�D
Trusted_Player_Flag_Zone_Chat		=	6	-- �L�k�ϥΰϰ��W�D
Trusted_Player_Flag_Sys7		=	7
Trusted_Player_Flag_Sys8		=	8
Trusted_Player_Flag_Sys9		=	9
Trusted_Player_Flag_Sys10		=	10
Trusted_Player_Flag_Sys11		=	11
Trusted_Player_Flag_Sys12		=	12
Trusted_Player_Flag_Sys13		=	13
Trusted_Player_Flag_Sys14		=	14
Trusted_Player_Flag_Sys15		=	15
--������
value = 18
Trusted_Player_Flag_Design1		= 	Value;Value = Value + 1	-- �L�k�ϥΪ����I�����p
Trusted_Player_Flag_Design2		= 	Value;Value = Value + 1	-- �L�k�ϥδ��p�ﴫ����
Trusted_Player_Flag_Design3		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design4		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design5		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design6		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design7		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design8		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design9		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design10		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design11		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design12		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design13		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design14		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design15		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design16		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design17		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design18		= 	Value;Value = Value + 1


--�W�߹C���Գ�									
--bool	InitBgIndependence( int GItemID , int Mode ) 
--�� Mode = Def_InitBgIndependence_RoleLv1 + Def_InitBgIndependence_MaxWeaponSkill+Def_InitBgIndependence_MaxMagicSkill;

value = 1;
Def_InitBgIndependence_RoleLv1		= Value;Value = Value * 2;	--�����ƲM��1�A���P�s�Ш���
Def_InitBgIndependence_MaxWeaponSkill	= Value;Value = Value * 2;	--�ɯŮɦ۰ʴ��ɼ��m�צ̰ܳ�
Def_InitBgIndependence_MaxMagicSkill	= Value;Value = Value * 2;	--�ɯŮɦ۰ʴ��ɧޯ൥�Ŧ̰ܳ�
Def_InitBgIndependence_TitleClear		= Value;Value = Value * 2;	--�M���Y��
Def_InitBgIndependence_KeyItemClear		= Value;Value = Value * 2;	--�M�ŭ��n���~
Def_InitBgIndependence_PetClear		= Value;Value = Value * 2;	--�M���d����T
Def_InitBgIndependence_QuestClear		= Value;Value = Value * 2;	--�M�ť���
Def_InitBgIndependence_BuffClear		= Value;Value = Value * 2;	--�M��Buff

--�򥻪k�N	���GLua�ǤJ��
--EM_MagicAtkResult_Miss		--0 	
--EM_MagicAtkResult_Normal	--1
--EM_MagicAtkResult_Critial		--2
--EM_MagicAtkResult_NoEffect	--3
--EM_MagicAtkResult_Absorb	--4
--EM_MagicAtkResult_NoEffect_Dead 	--5
--EM_MagicAtkResult_Cancel	--6
--EM_MagicAtkResult_SpecialAction	--7
--EM_MagicAtkResult_Parry		--8
--EM_MagicAtkResult_ShieldBlock	--9
--EM_MagicAtkResult_Dodge		--10

--�W�[�S��f��
--	bool	AddSpeicalCoin( int GItemID , int ActionType , int MoneyType , int Money );
--��d�S��f��
--	bool	CheckSpeicalCoin( int GItemID , int MoneyType , int Money );

Value = 0
EM_ACPriceType_GameMoney		= Value;Value=Value+1	--�C����
EM_ACPriceType_AccountMoney	= Value;Value=Value+1	--�b����
EM_ACPriceType_BonusMoney		= Value;Value=Value+1	--���Q��
EM_ACPriceType_Phirius		= Value;Value=Value+1	--���դB
EM_ACPriceType_Honor			= Value;Value=Value+1	--�Գ��a�A
EM_ACPriceType_Arena			= Value;Value=Value+1	--�v�޳��I��(Arena)
EM_ACPriceType_GuildWarEnergy	= Value;Value=Value+1	--���|�ԯ�q
EM_ACPriceType_GuildWarHonor	= Value;Value=Value+1	--���|�Ծ��Z
EM_ACPriceType_TrialBadge 		= Value;Value=Value+1	--�շ�����
EM_ACPriceType_Relics 		= Value;Value=Value+1	--�j�N��
EM_ACPriceType_Dreamland		= Value;Value=Value+1	--�ڹҥ����L�O
EM_ACPriceType_PhiriusShell	= Value;Value=Value+1	--�����Ŷꨩ
EM_ACPriceType_EnergyJustice	= Value;Value=Value+1	--���q��q
EM_ACPriceType_ProofLegend		= Value;Value=Value+1	--�ǻ�����
EM_ACPriceType_DuelistReward	= Value;Value=Value+1	--�i�h����



end