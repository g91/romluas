function Init_RoleValue_ENUM2()

-- �˳Ʀ�m�C�|
Value = 0;
EM_EQWearPos_Head       = Value; Value = Value + 1;
EM_EQWearPos_Gloves	= Value; Value = Value + 1;
EM_EQWearPos_Shoes	= Value; Value = Value + 1;
EM_EQWearPos_Clothes	= Value; Value = Value + 1;
EM_EQWearPos_Pants	= Value; Value = Value + 1;
EM_EQWearPos_Back		= Value; Value = Value + 1;
EM_EQWearPos_Belt		= Value; Value = Value + 1;
EM_EQWearPos_Shoulder	= Value; Value = Value + 1;
EM_EQWearPos_Necklace   = Value; Value = Value + 1;
EM_EQWearPos_Ammo       = Value; Value = Value + 1;
EM_EQWearPos_Bow        = Value; Value = Value + 1;
EM_EQWearPos_Ring1      = Value; Value = Value + 1;
EM_EQWearPos_Ring2      = Value; Value = Value + 1;
EM_EQWearPos_Earring1   = Value; Value = Value + 1;
EM_EQWearPos_Earring2   = Value; Value = Value + 1;
EM_EQWearPos_MainHand	= Value; Value = Value + 1;
EM_EQWearPos_SecondHand = Value; Value = Value + 1;
EM_EQWearPos_Manufactory= Value; Value = Value + 1;

Value = 100;
EM_EQWearPos_BK_Head       	= Value; Value = Value + 1; 
EM_EQWearPos_BK_Gloves	   	= Value; Value = Value + 1;
EM_EQWearPos_BK_Shoes		= Value; Value = Value + 1;
EM_EQWearPos_BK_Clothes		= Value; Value = Value + 1;
EM_EQWearPos_BK_Pants		= Value; Value = Value + 1;
EM_EQWearPos_BK_Back		= Value; Value = Value + 1;
EM_EQWearPos_BK_Belt		= Value; Value = Value + 1;
EM_EQWearPos_BK_Shoulder	= Value; Value = Value + 1;
EM_EQWearPos_BK_Necklace	= Value; Value = Value + 1;
EM_EQWearPos_BK_Ammo       	= Value; Value = Value + 1;
EM_EQWearPos_BK_Bow        	= Value; Value = Value + 1;
EM_EQWearPos_BK_Ring1      	= Value; Value = Value + 1;
EM_EQWearPos_BK_Ring2      	= Value; Value = Value + 1;
EM_EQWearPos_BK_Earring1   	= Value; Value = Value + 1;
EM_EQWearPos_BK_Earring2   	= Value; Value = Value + 1;
EM_EQWearPos_BK_MainHand	= Value; Value = Value + 1;
EM_EQWearPos_BK_SecondHand 	= Value; Value = Value + 1;
EM_EQWearPos_BK_Manufactory	= Value; Value = Value + 1;
EM_EQWearPos_BK_MagicTool1	= Value; Value = Value + 1;
EM_EQWearPos_BK_MagicTool2	= Value; Value = Value + 1;
EM_EQWearPos_BK_MagicTool3	= Value; Value = Value + 1;
EM_EQWearPos_BK_Ornament	= Value; Value = Value + 1;

--��ܤ�������
EM_LuaDialogType_YesNo = 0
EM_LuaDialogType_Select =1
EM_LuaDialogType_Input=2
EM_LuaDialogType_Message=3
EM_LuaDialogType_Pet=4

-- int GetItemInfo( int GItemID , int PGType , int Pos , int ValueType ) Pos = -1 ��ܨ��ϥΤ������~���
--�]�q����
EM_ItemPacketType_Body = 0
EM_ItemPacketType_Bank = 1
EM_ItemPacketType_EQ = 2

--���~�����C�|
Value = 0;
EM_ItemValueType_OrgObjID =  Value ; Value = Value + 1;
EM_ItemValueType_Inherent1=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent2=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent3=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent4=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent5=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent6=  Value ; Value = Value + 1;
EM_ItemValueType_Rune1	=  Value ; Value = Value + 1;
EM_ItemValueType_Rune2	=  Value ; Value = Value + 1;
EM_ItemValueType_Rune3	=  Value ; Value = Value + 1;
EM_ItemValueType_Rune4	=  Value ; Value = Value + 1;
EM_ItemValueType_Level	 = Value; Value=Value+1;
EM_ItemValueType_Durable	 = Value; Value=Value+1;
EM_ItemValueType_MaxDurable= Value;Value=Value+1;
EM_ItemValueType_PowerQuality= Value;Value=Value+1;
EM_ItemValueType_RuneVolume= Value;Value=Value+1;


--OpenClientMenu( OwnerID() , EM_ClientMenuType_Bag )
-- �}Client�ݤ���
Value = 0;
EM_ClientMenuType_Bag			= Value; Value = Value + 1;	--�I�]
EM_ClientMenuType_Skill			= Value; Value = Value + 1;	--�ޯ��
EM_ClientMenuType_EQ			= Value; Value = Value + 1;	--EQ����
EM_ClientMenuType_Quest			= Value; Value = Value + 1;	--������x
EM_ClientMenuType_FriendList		= Value; Value = Value + 1;	--�B�ͦC��
EM_ClientMenuType_CardBook		= Value; Value = Value + 1;	--�d��
EM_ClientMenuType_LifeSkill		= Value; Value = Value + 1;	--�ͬ��ޯ�
EM_ClientMenuType_Guild			= Value; Value = Value + 1;	--���|����
EM_ClientMenuType_GuildList		= Value; Value = Value + 1;	--���|�C��
EM_ClientMenuType_GuildBillboard		= Value; Value = Value + 1;	--���|�d���O
EM_ClientMenuType_Loading		= Value; Value = Value + 1;	--Loading�e��
EM_ClientMenuType_SetGuildFlag                        = Value; Value = Value + 1;	--�]�w���|�X����
EM_ClientMenuType_Merchant		= Value; Value = Value + 1;	--�}�Ұӫ�
EM_ClientMenuType_GuildBank		= Value; Value = Value + 1;	--�}�Ҥ��|�Ȧ�

EM_ClientMenuType_BlackSmith		= Value; Value = Value + 1;	--�}�ҥ��K
EM_ClientMenuType_Carpenter		= Value; Value = Value + 1;	--�}�Ҥ�u
EM_ClientMenuType_MakeArmor		= Value; Value = Value + 1;	--�}�һs��
EM_ClientMenuType_Tailor			= Value; Value = Value + 1;	--�}�ҵ��_
EM_ClientMenuType_Cook			= Value; Value = Value + 1;	--�}�Ҳi��
EM_ClientMenuType_Alchemy		= Value; Value = Value + 1;	--�}�ҷҪ�
EM_ClientMenuType_Mining			= Value; Value = Value + 1;	--�}�ҫ��q
EM_ClientMenuType_Lumbering		= Value; Value = Value + 1;	--�}�Ҭ��
EM_ClientMenuType_Herblism		= Value; Value = Value + 1;	--�}�ұ���
EM_ClientMenuType_Fishing			= Value; Value = Value + 1;	--�}�ҳ���
EM_ClientMenuType_Plant			= Value; Value = Value + 1;	--�}�Һش�
EM_ClientMenuType_BillBoard		= 10000;	--�}�ұƦ�] --�}�үS�w�Ʀ�]���ءA�ϥ� EM_ClientMenuType_BillBoard+(���ظ��X)

--���t�C�|
Value = -1;
EM_RelationType_None 		= Value;Value = Value + 1; -- �S���Y
EM_RelationType_Stranger		= Value; Value = Value + 1;	--���ͤH(���i�ϥ� )
EM_RelationType_Friend		= Value; Value = Value + 1;	--�n��( ���i�ϥ� )
EM_RelationType_Enemy		= Value; Value = Value + 1;	--���H( ���i�ϥ� )
EM_RelationType_Student		= Value; Value = Value + 1;	--�ǥ�
EM_RelationType_Teacher		= Value; Value = Value + 1;	--�Ѯv
EM_RelationType_Wife		= Value; Value = Value + 1;	--�d�l
EM_RelationType_Husband		= Value; Value = Value + 1;	--����
EM_RelationType_Lover		= Value; Value = Value + 1;	--���H
EM_RelationType_Family		= Value; Value = Value + 1;	--�ˤH
EM_RelationType_BestFriend		= Value; Value = Value + 1;	--����
EM_RelationType_BadCompany	= Value; Value = Value + 1;	--�l��

--�ޯ�]�w
Value = 0;
EM_SkillValueType_Unarmed	= Value; Value = Value + 1;	--Unarmed�Ť�
EM_SkillValueType_Blade             	= Value; Value = Value + 1;	-- �C
EM_SkillValueType_Dagger            	= Value; Value = Value + 1;	--�P��
EM_SkillValueType_Wand             	 = Value; Value = Value + 1;	--�v��
EM_SkillValueType_Axe              	 = Value; Value = Value + 1;	--��
EM_SkillValueType_Bludgeon          	= Value; Value = Value + 1;	--��Ҵ�
EM_SkillValueType_Claymore          	= Value; Value = Value + 1;	--����C
EM_SkillValueType_Staff             	= Value; Value = Value + 1;	--��
EM_SkillValueType_2H_Axe            	= Value; Value = Value + 1;	--�����
EM_SkillValueType_2H_Hammer         	= Value; Value = Value + 1;	--������
EM_SkillValueType_Polearm		= Value; Value = Value + 1;	--�j(����)
EM_SkillValueType_Bow		= Value; Value = Value + 1;	--���{�Z���}
EM_SkillValueType_CossBow	= Value; Value = Value + 1;	--���{�Z���Q�r�}
EM_SkillValueType_Gun		= Value; Value = Value + 1;	--���{�Z���j
EM_SkillValueType_Define		= Value; Value = Value + 1;	--���m
EM_SkillValueType_BlackSmith	= Value; Value = Value + 1;	--���K
EM_SkillValueType_Carpenter	= Value; Value = Value + 1;	--��u
EM_SkillValueType_MakeArmor	= Value; Value = Value + 1;	--�s��
EM_SkillValueType_Tailor		= Value; Value = Value + 1;	--���_
EM_SkillValueType_Cook		= Value; Value = Value + 1;	--�i��
EM_SkillValueType_Alchemy		= Value; Value = Value + 1;	--�Ҫ�
EM_SkillValueType_Mining		= Value; Value = Value + 1;	--���q
EM_SkillValueType_Lumbering	= Value; Value = Value + 1;	--���
EM_SkillValueType_Herblism		= Value; Value = Value + 1;	--����
EM_SkillValueType_Fishing		= Value; Value = Value + 1;	--����
EM_SkillValueType_Plant		= Value; Value = Value + 1;	--�ش�

--�{���ϥήɶ��X��
Value = 0;
EM_TimeFlagEffect_BagPage3	= Value; Value = Value + 1;	--�I�]
EM_TimeFlagEffect_BagPage4	= Value; Value = Value + 1;	--�I�]
EM_TimeFlagEffect_BagPage5	= Value; Value = Value + 1;	--�I�]
EM_TimeFlagEffect_BagPage6	= Value; Value = Value + 1;	--�I�]
Value = 10;
EM_TimeFlagEffect_BankBag2	= Value; Value = Value + 1;	--�Ȧ�I�]�}��
EM_TimeFlagEffect_BankBag3	= Value; Value = Value + 1;	--�Ȧ�I�]�}��
EM_TimeFlagEffect_BankBag4	= Value; Value = Value + 1;	--�Ȧ�I�]�}��
EM_TimeFlagEffect_BankBag5	= Value; Value = Value + 1;	--�Ȧ�I�]�}��
Value = 20;
EM_TimeFlagEffect_HonorParty	= Value; Value = Value + 1;	--�a�A�ն�
EM_TimeFlagEffect_MailPaper	= Value; Value = Value + 1;	--�l��H��	
EM_TimeFlagEffect_DailyFlag	= Value; Value = Value + 1;	--�C�魫�n���~�M������	
EM_TimeFlagEffect_MailMultiItem	= Value; Value = Value + 1;	--�l��榸�ǰe�h�Ӫ��~
EM_TimeFlagEffect_HandyBank	= Value; Value = Value + 1;	--�H���Ȧ�
EM_TimeFlagEffect_HandyAuction	= Value; Value = Value + 1;	--�H��AC
EM_TimeFlagEffect_HandyMail	= Value; Value = Value + 1;	--�H���H�c

Value = 30;
EM_TimeFlagEffect_PetPage3		= Value; Value = Value + 1;	--�d���ĤT��
EM_TimeFlagEffect_PetPage4		= Value; Value = Value + 1;	--�d���ĤT��
EM_TimeFlagEffect_PetPage5		= Value; Value = Value + 1;	--�d���ĤT��
EM_TimeFlagEffect_PetPage6		= Value; Value = Value + 1;	--�d���ĤT��



--�����ϥήɶ��X�С]�����ϥαq99�����^�Ρ^
EM_TimeFlagEffect_OOXX			= 99	-- OOXX�ϥ�


--�����μ@���O���X��
Value = EM_RoleValue_LuaValueFlag;
EM_LuaValueFlag_UseItem1  	= Value; Value = Value + 1; --�ϥΪ��~�O��--���H�`�]�C��^
EM_LuaValueFlag_UseItem2  	= Value; Value = Value + 1; --�ϥΪ��~�O��--���H�`�]�p�`���^
EM_LuaValueFlag_UseItem3  	= Value; Value = Value + 1; --�ϥΪ��~�O��--���Ը��R
EM_LuaValueFlag_UseItem4  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�v�޳�����S����y
EM_LuaValueFlag_UseItem5  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�j�N�K�_
EM_LuaValueFlag_UseItem6  	= Value; Value = Value + 1; --�ϥΪ��~�O��--���ʮճ� �����Ԥh
EM_LuaValueFlag_UseItem7  	= Value; Value = Value + 1; --�ϥΪ��~�O��--black day (korea)
EM_LuaValueFlag_UseItem8  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�x�W�B��j�@��
EM_LuaValueFlag_UseItem9  	= Value; Value = Value + 1; --�ϥΪ��~�O��--���F�N��`���ʪ��~�O��(����)
EM_LuaValueFlag_UseItem10  	= Value; Value = Value + 1; --�ϥΪ��~�O��--bearevent contest
EM_LuaValueFlag_UseItem11  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�t�ӫȻs���� �H���إ�NPC �C�����I�����p
EM_LuaValueFlag_UseItem12  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�t�ӫȻs���� �H���إ�NPC ���p�I���C����
EM_LuaValueFlag_UseItem13  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�t�ӫȻs���� �w�I�إ�NPC �C�����I�����p
EM_LuaValueFlag_UseItem14  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�t�ӫȻs���� �w�I�إ�NPC ���p�I���C����
EM_LuaValueFlag_UseItem15  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I���O�q����
EM_LuaValueFlag_UseItem16  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I���ӱ�����
EM_LuaValueFlag_UseItem17  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I���@�O����
EM_LuaValueFlag_UseItem18  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I�����z����
EM_LuaValueFlag_UseItem19  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ѱa�s�t�� �I���믫����
EM_LuaValueFlag_UseItem20  	= Value; Value = Value + 1; --�ϥΪ��~�O��--���ʮճ� �����Ĭ�
EM_LuaValueFlag_UseItem21  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�x�V�` �����B��������
EM_LuaValueFlag_UseItem22  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�x�V�` ���U�䥦���a����
EM_LuaValueFlag_UseItem23  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�x�V�` �˹��x�V��
EM_LuaValueFlag_UseItem24  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�ᯫ�` �u�R�P�_��
EM_LuaValueFlag_UseItem25  	= Value; Value = Value + 1; --�ϥΪ��~�O��--���ܸ`
EM_LuaValueFlag_UseItem26  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�s������d���ثe�B�z�쪺����
EM_LuaValueFlag_UseItem27  	= Value; Value = Value + 1; --�ϥΪ��~�O��--�s������d���ثe���p
EM_LuaValueFlag_UseItem28  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --���F�N��`���ʪ��~�O��(�s�A������)
EM_LuaValueFlag_UseItem29  	= Value; Value = Value + 1; --�ϥΪ��~�O�� (Zone2 World PE �O�����a�Ѥ��ĴX��PE)
EM_LuaValueFlag_UseItem30  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�����`--����c�~
EM_LuaValueFlag_UseItem31  	= Value; Value = Value + 1; --�ϥΪ��~�O��  --�����`--�Ŧ�c�~
EM_LuaValueFlag_UseItem32  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�ᯫ�`--��H��2�H�H�Wbuff	
EM_LuaValueFlag_UseItem33  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�ᯫ�`--���Hbuff (�K�B�`�e�J�����ץ�)
EM_LuaValueFlag_UseItem34  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�ᯫ�`--����npc��즸��
EM_LuaValueFlag_UseItem35  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�K�B�`100%�J�O��
EM_LuaValueFlag_UseItem36  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�K�B�`220%�J�O��
EM_LuaValueFlag_UseItem37  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�R�ָ`���˾y�v�O��
EM_LuaValueFlag_UseItem38  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�Q�����ʰƥ��v���p�ɼҦ�
EM_LuaValueFlag_UseItem39  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --�Q�����ʰƥ��v���ͦs�Ҧ�
EM_LuaValueFlag_UseItem40  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --���ʰƥ� �j�a�ӧ���p��
EM_LuaValueFlag_UseItem41  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --2012�`�y���ܸ`�A�Q�泌�s�p�⦸��
EM_LuaValueFlag_UseItem42  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --2012�`�y�n�ʸ`�A���԰��η���������
EM_LuaValueFlag_UseItem43  	= Value; Value = Value + 1; --�ϥΪ��~�O�� --5.0.6 �B§�t�ί��Τ��ж��Ǹ�
EM_LuaValueFlag_UseItem44  	= Value; Value = Value + 1; --�ϥΪ��~�O�� -- 6.0.1 �s�W 2011�K�B�`���ʸɥ[���ȭp����
EM_LuaValueFlag_UseItem45  	= Value; Value = Value + 1; --�ϥΪ��~�O�� -- 6.0.2���ʰƥ� �j�a�ӧ����ʭp��
EM_LuaValueFlag_UseItem46  	= Value; Value = Value + 1; --�ϥΪ��~�O�� -- 2011�R�ָ` �򥢪��]�k���� �������Ȧ���
EM_LuaValueFlag_UseItem47  	= Value; Value = Value + 1; --�ϥΪ��~�O�� -- 2015���ܸ` �䴩���ܼ@�� �������Ȧ���(�N�N���ʪ�BUFF�P�_�令�P�_USEITEM)
--EM_LuaValueFlag_UseItem999  = Value; Value = Value + 1; --�ϥΪ��~�O�� -- Ĭ�� - �ˬd�h���a������Ȫ����A

-----�ƭȧޯ�ϥ�
Value = EM_RoleValue_LuaValueFlag+201;
EM_LuaValueFlag_SkillUse1  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�����ಾ
EM_LuaValueFlag_SkillUse2  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�����ಾ
EM_LuaValueFlag_SkillUse3  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�����ಾ
EM_LuaValueFlag_SkillUse4  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�����ಾ
EM_LuaValueFlag_SkillUse5  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�Z��
EM_LuaValueFlag_SkillUse6  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�v��50 �ۼv��b
EM_LuaValueFlag_SkillUse7  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�v��50 �ۼv��b
EM_LuaValueFlag_SkillUse8  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�v��50 �ۼv��b
EM_LuaValueFlag_SkillUse9  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�C��40
EM_LuaValueFlag_SkillUse10  	= Value; Value = Value + 1; --�ޯ�ϥ�	--�k�v�M�˧�-�j�a�Y��

--��^�ޯ� ��/�F50 �۴���
EM_LuaValueFlag_EliteSummon 	=Value; Value = Value + 1; --��^�ޯ� ��/�F50 �۴���

-----�s��PE�O���ϥ�
Value = EM_RoleValue_LuaValueFlag+401;
EM_LuaValueFlag_PENum		= Value; Value = Value + 1; --PE�s���A����Ʀr �e�T��O�ϰ�N�X ����O��PE�b�ӰϪ��Ǹ�
EM_LuaValueFlag_PEBuffTrace	= Value; Value = Value + 1; --�H�G�i��O���ثe�w���o��BUFF  �̦h32��
EM_LuaValueFlag_PEBuffKeep	= Value; Value = Value + 1; --�ثe�֦���BUFF�s��
EM_LuaValueFlag_PECount		= Value; Value = Value + 1; --�ثe�i�檺PE���ȧ�������
EM_LuaValueFlag_PEBuffKeep2	=Value; Value = Value + 1; --�ثe�i�檺PE�Ҫ��a�����y���A

--�t�ΰѼƳ]�w
Value = EM_RoleValue_LuaValueFlag+451;
--�I�����������P�_
EM_LuaValueFlag_IsStopBGM	=Value; Value = Value + 1; --�I�����ּ��񪬺A


--AddMoney( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )			-- ����
--AddMoney_Bonus( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )			-- ���p
--AddMoney_Account( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )		-- ���p	--�w�g����
--AddMoneyEx_Account( OwnerID() , int ActionType , 1000 , bool LockMoneyProc )		-- ��w���p LockMoneyProc �Y = true �|�B�z��w�����p �Y = false ���B�z��w�����p
--�����Ϊ��~������]
Value = 0
EM_ActionType_Unknow		= Value; Value = Value + 1; --
EM_ActionType_LevelUp		= Value; Value = Value + 1; --�ɯ�
EM_ActionType_EnterWorld		= Value; Value = Value + 1; --�J�C��
EM_ActionType_LeaveWorld		= Value; Value = Value + 1; --���}�C��
EM_ActionType_Buy		= Value; Value = Value + 1; --�R
EM_ActionType_Buy_Record	= Value; Value = Value + 1; --�R �L�h�汼��
EM_ActionType_Sell		= Value; Value = Value + 1; --��
EM_ActionType_Tran		= Value; Value = Value + 1; --���a���
EM_ActionType_Get		= Value; Value = Value + 1; --�ߨ��a�W
EM_ActionType_Drop		= Value; Value = Value + 1; --���a�W
EM_ActionType_GMGive		= Value; Value = Value + 1; --GM����
EM_ActionType_PlotGive		= Value; Value = Value + 1; --�@������
EM_ActionType_PlotDestory		= Value; Value = Value + 1; --�@���R��
EM_ActionType_KillMonster		= Value; Value = Value + 1; --���Ǫ�
EM_ActionType_DestroyItem		= Value; Value = Value + 1; --���~����
EM_ActionType_ErrorDestory	= Value; Value = Value + 1; --���~�M��
EM_ActionType_MagicSummonItem	= Value; Value = Value + 1; --�]�k�l�ꪫ�~
EM_ActionType_MagicDestory	= Value; Value = Value + 1; --�]�k�ݨD�Ĥ�	
EM_ActionType_UseItemGive	= Value; Value = Value + 1; --���~�ϥε���
EM_ActionType_UseItemDestroy	= Value; Value = Value + 1; --���~�ϥή���
EM_ActionType_OffLienDestory	= Value; Value = Value + 1; --���u����
EM_ActionType_ChangeZoneDestory	= Value; Value = Value + 1; --���Ϯ���
EM_ActionType_GiveSystem		= Value; Value = Value + 1; --���ػP�t�ε����~
EM_ActionType_CombineGet		= Value; Value = Value + 1; --�һs�o��
EM_ActionType_CombineDestory	= Value; Value = Value + 1; --�һs���h
EM_ActionType_Steal		= Value; Value = Value + 1; --����
EM_ActionType_ToAC		= Value; Value = Value + 1; --������
EM_ActionType_ToACError		= Value; Value = Value + 1; --�����Ұh�^(�����~)
EM_ActionType_ToMail		= Value; Value = Value + 1; --������
EM_ActionType_ToMailError		= Value; Value = Value + 1; --�����Ұh�^(�����~)
EM_ActionType_FromMail		= Value; Value = Value + 1; --��Mail���o
EM_ActionType_FromParty		= Value; Value = Value + 1; --��Party����
EM_ActionType_Dissolution		= Value; Value = Value + 1; --����
EM_ActionType_ACTex		= Value; Value = Value + 1; --�ϥΩ��ҩһ�
EM_ActionType_ACBuy		= Value; Value = Value + 1; --���ҶR�F��
EM_ActionType_Money		= Value; Value = Value + 1; --�Ȳ�
EM_ActionType_Card		= Value; Value = Value + 1; --�d��
EM_ActionType_Gamble		= Value; Value = Value + 1; --���
EM_ActionType_ItemExchange	= Value; Value = Value + 1; --�I�����~
EM_ActionType_Buy_Account	= Value; Value = Value + 1; --�I�ưӫ~�ʶR
EM_ActionType_Buy_Lottery	= Value; Value = Value + 1; --�R�m��
EM_ActionType_Gather		= Value; Value = Value + 1; --�Ķ�
EM_ActionType_EqBroken		= Value; Value = Value + 1; --�˳Ʒl�a
EM_ActionType_SysChannel		= Value; Value = Value + 1; --�t���W�D���Ӫ��~
EM_ActionType_ColoringShop_Player	= Value; Value = Value + 1; --�V��ө�(�󴫷ӫ�)
EM_ActionType_Lottery_Prize	= Value; Value = Value + 1; --�m��
EM_ActionType_CreateGuild		= Value; Value = Value + 1; --�إߤ��|
EM_ActionType_FixEQ		= Value; Value = Value + 1; --�׸˳�
EM_ActionType_BuyHouseEnergy	= Value; Value = Value + 1; --�R�Ыί�q
EM_ActionType_ImportAccountMoney	= Value; Value = Value + 1; --�פJ�b����		
EM_ActionType_QuestComplete	= Value; Value = Value + 1; --��������
EM_ActionType_Exp		= Value; Value = Value + 1; --�g��ȧ���
EM_ActionType_PlayerDead		= Value; Value = Value + 1; --���a���`
EM_ActionType_MonsterDead	= Value; Value = Value + 1; --�Ǫ����`
EM_ActionType_RefineFailedDestroy	= Value; Value = Value + 1; --����ɵ����Ѯ��� 
EM_ActionType_EQCombineDestroy	= Value; Value = Value + 1; --�˳ƦX������ 	
EM_ActionType_GuildWarDeclare	= Value; Value = Value + 1; --���|�žԪ���
EM_ActionType_RefineLvUp		= Value; Value = Value + 1; --����ɵ�
EM_ActionType_RefineLvDn		= Value; Value = Value + 1; --���孰��
EM_ActionType_RefineNone		= Value; Value = Value + 1; --����S����
EM_ActionType_RefineProtect	= Value; Value = Value + 1; --����O�@
EM_ActionType_ACSell		= Value; Value = Value + 1; --ac�c��
EM_ActionType_PKItemProtect	= Value; Value = Value + 1; --PK���~�g�v�O�@
EM_ActionType_PKDropItem		= Value; Value = Value + 1; --PK����
EM_ActionType_Loot		= Value; Value = Value + 1; --�˫�
EM_ActionType_MagicBox		= Value; Value = Value + 1; --�_�c�ĦX
EM_ActionType_GuildContribution	= Value; Value = Value + 1; --���|�^�m
EM_ActionType_SellMailGroup	= Value; Value = Value + 1; --�s�o�H��
EM_ActionType_TimeUp		= Value; Value = Value + 1; --�ɶ���R��
EM_ActionType_GuildStoreHouse	= Value; Value = Value + 1; --���|�ܮw
EM_ActionType_GuildHouse_Funiture	= Value; Value = Value + 1; --���|�\�]
EM_ActionType_OpenPacket		= Value; Value = Value + 1; --���}�ӫ����]
EM_ActionType_ColoringShop_Horse	= Value; Value = Value + 1; --�V��ө�(���M�V��)
EM_ActionType_Rent_BackPacket	= Value; Value = Value + 1; --���έI�]���
EM_ActionType_Rent_BankPacket	= Value; Value = Value + 1; --���λȦ����
EM_ActionType_Rent_Bank		= Value; Value = Value + 1; --�����H���Ȧ�
EM_ActionType_Rent_Mail		= Value; Value = Value + 1; --�����H���H�c
EM_ActionType_Rent_AC		= Value; Value = Value + 1; --�����H�������
EM_ActionType_Buy_Account_Gift	= Value; Value = Value + 1; --�ʶR�ӫ�§��
EM_ActionType_Buy_Account_Bonus	= Value; Value = Value + 1; --�ӫ����Q���ʶR
EM_ActionType_Buy_Account_Free	= Value; Value = Value + 1; --�ӫ������B	�ʶR
EM_ActionType_Plant_Product	= Value; Value = Value + 1; --�ش�(����)
EM_ActionType_Plant_Destroy	= Value; Value = Value + 1; --�ش�(�R��)
EM_ActionType_GuildStoreHouse_Get= Value; Value = Value + 1; --���|�ܮw(���X)
EM_ActionType_GuildHouse_Funiture_Get= Value; Value = Value + 1; --���|�\�](���X)
EM_ActionType_Card_Destroy	= Value; Value = Value + 1; --�d����J
EM_ActionType_MagicBox_Destroy	= Value; Value = Value + 1; --�]���_���R��
EM_ActionType_PetRetrain_Destroy= Value; Value = Value + 1; --�d��������R��
EM_ActionType_Attribute_Gamble	= Value; Value = Value + 1; --���~�ݩʽ��
EM_ActionType_GMDestroy		= Value; Value = Value + 1; --GM�R��
EM_ActionType_BodyShop		= Value; Value = Value + 1; --�ק鶴��
EM_ActionType_QuestDelete	= Value; Value = Value + 1; --�R������
EM_ActionType_EQCombineResult	= Value; Value = Value + 1; --���~�X�����G
EM_ActionType_MagicBoxResult	= Value; Value = Value + 1; --�]���_���X�����G
EM_ActionType_ItemtoItemResult	= Value; Value = Value + 1; --���~�磌�~�ϥε��G
EM_ActionType_MagicStoneShop	= Value; Value = Value + 1; --�]�ۧI���ө�
EM_ActionType_ServantHire	= Value; Value = Value + 1; --���Τk��
EM_ActionType_SuitSkillCost	= Value; Value = Value + 1; --�M�˧ޯ���O����
EM_ActionType_DestroyItem_Buy	= Value; Value = Value + 1; --�ʶR����
EM_ActionType_DestroyItem_PetTriMerge	= Value; Value = Value + 1; --�d���ĦX����
EM_ActionType_DestroyItem_DrawOutRune	= Value; Value = Value + 1; --���X�Ť�
EM_ActionType_DestroyItem_CoolSuit	= Value; Value = Value + 1; --�M�˦��d
EM_ActionType_DestroyItem_CloneItem	= Value; Value = Value + 1; --�ìO�ƻs���~�R��
EM_ActionType_DestroyItem_ErrItem	= Value; Value = Value + 1; --���D���~�R��
EM_ActionType_Rare3EqExchangeItem	= Value; Value = Value + 1; --�}���פT�����~�I���R��
EM_ActionType_DestroyItem_CloneItem_House= Value; Value = Value + 1; --�ìO�ƻs���~�R��(�Ы�)
EM_ActionType_PetBag_In			= Value; Value = Value + 1; --��J�d���]
EM_ActionType_PetBag_Out		= Value; Value = Value + 1; --���X�d���]
EM_ActionType_HorseBag_In		= Value; Value = Value + 1; --��J���M�]
EM_ActionType_HorseBag_Out		= Value; Value = Value + 1; --���X���M�]
EM_ActionType_ClsItemAttribute		= Value; Value = Value + 1; --
EM_ActionType_PutItemToWarDrobe		= Value; Value = Value + 1; --��F���J���o�ݨD��
EM_ActionType_BG_IndependenceGame	= Value; Value = Value + 1; --�Գ��W�߹C��
EM_ActionType_SlotMachine		= Value; Value = Value + 1; --���l�Ѫ��
EM_ActionType_BUY_COOLSUITPAGE	= Value; Value = Value + 1; --�R�]�k���o
EM_ActionType_BUY_COOLSUITSET		= Value; Value = Value + 1; --�R�Ÿ˳]�w
EM_ActionType_Item_ClsAttribute		= Value; Value = Value + 1; --�ϥ��ݩʲM���
EM_ActionType_Item_DrawAttribute	= Value; Value = Value + 1; --�ϥ��ݩʩ����
--���|�Գ��ΰO���C�|
Value = 0
EM_GuildWar_Energy		= Value; Value = Value + 1; --��q
--���|�Գ����Z��TYPE�C�|
Value = 0
EM_GuildWar_ScoreType1		= Value; Value = Value + 1; --�԰�����/15
EM_GuildWar_ScoreType2		= Value; Value = Value + 1; --�u�Ƴ���/10
EM_GuildWar_ScoreType3		= Value; Value = Value + 1; --��Գ���/10
EM_GuildWar_ScoreType4		= Value; Value = Value + 1; --�ɵ�����/10
EM_GuildWar_ScoreType5		= Value; Value = Value + 1; --�䴩����/--

_MAX_FRIENDLIST_FAMILY_COUNT_ 	= 20	

EM_RunningMsgExType_GM		= 0
EM_RunningMsgExType_Monitor	= 1
EM_RunningMsgExType_Shop		= 2
EM_RunningMsgExType_Other		= 3

--bool	SpecialMove( int GItemID , float X , float Y , float Z , int Type )
Value = 0
EM_SpecialMoveType_Dash		= Value; Value = Value + 1; --����	
EM_SpecialMoveType_StrikeBack	= Value; Value = Value + 1; --�_�h
EM_SpecialMoveType_StrikeAway	= Value; Value = Value + 1; --�_��
EM_SpecialMoveType_Bomb		= Value; Value = Value + 1; --����
EM_SpecialMoveType_Catch		= Value; Value = Value + 1; --���

--�f����X��T
Value = 0
EM_ACPriceType_GameMoney		= Value;Value=Value+1	--�C����
EM_ACPriceType_AccountMoney	= Value;Value=Value+1	--���p
EM_ACPriceType_BonusMoney		= Value;Value=Value+1	--���p
EM_ACPriceType_Phirius		= Value;Value=Value+1	--�����ťN��
EM_ACPriceType_Honor		= Value;Value=Value+1	--�a�A�I��
EM_ACPriceType_Arena		= Value;Value=Value+1	--�v�޳��I��(Arena)
EM_ACPriceType_GuildWarEnergy	= Value;Value=Value+1	--���|�ԯ�q
EM_ACPriceType_GuildWarHonor	= Value;Value=Value+1	--���|�Ծ��Z
EM_ACPriceType_TrialBadge 		= Value;Value=Value+1	--�շ�����
EM_ACPriceType_Relics 		= Value;Value=Value+1	--�j�N��
EM_ACPriceType_Dreamland		= Value;Value=Value+1	--�ڹҥ����L�O
EM_ACPriceType_PhiriusShell		= Value;Value=Value+1	--�����Ŷꨩ
EM_ACPriceType_EnergyJustice	= Value;Value=Value+1	--���q��q
EM_ACPriceType_ProofLegend		= Value;Value=Value+1	--�ǩ_����
EM_ACPriceType_DuelistReward	= Value;Value=Value+1	--�i�h����
end