function LuaYU_Mala2_Showlearn() -- �C���о�

--	Say(  OwnerID() ,"OwnerID()" )--���a
--	Say(  TargetID() ,"TargetID()" )--����
	WriteRoleValue( TargetID()  , EM_RoleValue_Register+3 , 1 ) --�������a���b�i��оǼҦ�
	SetModeEx( TargetID()  , EM_SetModeType_Show , false ) --�����
	SetModeEx( TargetID()  , EM_SetModeType_Mark, false )--���аO
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 

	local MalatinaShow = CreateObj( 111813 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	SetModeEx( MalatinaShow  , EM_SetModeType_Mark, false )--���аO
	AddToPartition( MalatinaShow , RoomID )  

	WriteRoleValue( MalatinaShow  , EM_RoleValue_Register ,  TargetID()  ) --�O����Ⱥ��Ը��R

	BeginPlot(  MalatinaShow  , "LuaYU_Mala2_learn" , 0 )  

	Hide( TargetID())
	CloseSpeak( OwnerID() ) 
end

function LuaYU_Mala2_learn() -- �C���о�

	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	local MissionMala = ReadRoleValue( OwnerID() , EM_RoleValue_Register ) --���Ⱥ���

--	Say(OwnerID(), "OwnerID")--���оǥκ���
--	Say(TargetID(), "TargetID")--���a
	sleep(10)
	PlayMotion( OwnerID(), 112)  --����
	Say( OwnerID(), "[SC_113120_MALA2_08]")	--���A�A�A�A��u�����_�I���`�O�|�d�N���ܻP�W�h�A����}�l�a�I
	sleep(40)
	Show(  MissionMala ,RoomID)
	SetModeEx( MissionMala  , EM_SetModeType_Show , false ) --�����
	PlayMotion( OwnerID(), 112)  --����
	Say( OwnerID(), "[SC_113120_MALA2_09]")	--�_�I�̡A�o���n���A������N�|�O�ݭn�B�Ϋ�ҡA�W���X�̨θ��u�A�åB�M�ɶ��v�ɪ����_�C���I
	sleep(40)
	PlayMotion( OwnerID(), 122)  --idel03
	sleep(15)
	AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( OwnerID()  , EM_SetModeType_Show , false ) --�����

--�оǤ��e�}�l�G�����ý�

	local MalaTina01 = CreateObjByFlag( 111813, 780309 , 0 , 1 );----------------------------------------�X�и��X�G0 ��t�κ���
	SetModeEx( MalaTina01 , EM_SetModeType_Move, false )--����
	SetModeEx( MalaTina01 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( MalaTina01 , RoomID )  

	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)

	PlayMotion( MalaTina01, 112)  --����
	Say( MalaTina01, "[SC_113120_MALA2_10]")	--�Q�n���Q�ܨ��_�áA�A�����n�n�O���Ӥ��P�ʽ誺��ê - �]�k�ʦL�A�ݭn�ѩ��[�H�R���~��q�L�I
	sleep(10)
	PlayMotion( MalaTina01, 75)  --�ϥΪ��~
	sleep(30)
	local Floor01 = CreateObjByFlag( 113110, 780309 , 1 , 1 );--�����ý��a�O
	SetModeEx( Floor01 , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Floor01 , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( Floor01 , RoomID )  
	sleep(10)	

	Say( MalaTina01, "[SC_113120_MALA2_11]")	--�o�O<CY>�ʦL(�����ý�)</CY> �A�ݭn<CS>�I��</CS>�Ӹѩ�L�I
	sleep(30)	

	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --�����

	local MalaTina02 = CreateObjByFlag( 111813, 780309 , 5 , 1 );----------------------------------------�X�и��X�G5 ��t�κ���
	SetModeEx( MalaTina02 , EM_SetModeType_Move, false )--����
	SetModeEx( MalaTina02 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( MalaTina02 , RoomID )  

	AdjustFaceDir( MalaTina02, TargetID() , 0 ) --���V
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	BeginPlot(  MalaTina02  , "LuaYU_111813_00" , 0 )  

	SetModeEx(  Floor01  , EM_SetModeType_Show , false ) --�����

	local Floor01_2 = CreateObjByFlag( 113104, 780309 , 1 , 1 );--�����ý�
	SetModeEx( Floor01_2 , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Floor01_2 , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( Floor01_2 , RoomID )  
	sleep(10)	
	Say( MalaTina02, "[SC_113120_MALA2_12]")	--�o�O�ѩ�᪺<CY>���ͪ������ý�</CY>�A�ʼɪ����L�u�|��o�@�Ǿ�K�A�õL�k�q�L�A���O�o�Ǿ�K�i�H�ΨӤޤ��U�N...�A�A�A�A��
	sleep(40)	
	AddBuff( Floor01_2 ,503990 ,1 , 3 ); --�U�N
	sleep(30)	
	CancelBuff( Floor01_2 ,503047 )
	sleep(10)	
	PlayMotion( Floor01_2, 145) --����ʧ@�GACTIVATE_BEGIN
	PlaySound( Floor01_2, "sound\\fx\\skill\\fire\\act_flame01_c_hand.wav", false )
	sleep(30)	
	SetModeEx(  Floor01_2  , EM_SetModeType_Show , false ) --�����
	Delobj(Floor01_2)
	SetModeEx(  Floor01  , EM_SetModeType_Show , true ) --���
	sleep(10)	
	Say( MalaTina02, "[SC_113120_MALA2_13]") --�o�O<CY>�ʦL(�����ý�)</CY> �A�n�n�O��I�A�A�A�A��
	Sleep(40)

--�оǤ��e�G�j���ڰ�
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina02    , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina01    , EM_SetModeType_Show , true ) --���
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	Delobj(Floor01)	
	PlayMotion( MalaTina01, 75)  --�ϥΪ��~
	sleep(40)
	local Floor02 = CreateObjByFlag( 113108, 780309 , 1 , 1 );--�j���ڰ��a�O
	SetModeEx( Floor02 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor02 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor02 , RoomID )  


	Say( MalaTina01, "[SC_113120_MALA2_14]") --�o�O<CY>�ʦL(���H�����K�ڰ�)</CY> �A�u�n<CS>�a��</CS>�N�|�ѩ�I
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --�����

--	SetPosByFlag( MalaTina01, 780309 , 4 )--�ǰe�� X ���X�l

	local MalaTina03 = CreateObjByFlag( 111813, 780309 , 4 , 1 );----------------------------------------�X�и��X�G4 ��t�κ���
	SetModeEx( MalaTina03 , EM_SetModeType_Move, false )--����
	SetModeEx( MalaTina03 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( MalaTina03 , RoomID )  

	AdjustFaceDir( MalaTina03, TargetID() , 0 ) --���V
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	BeginPlot(  MalaTina03  , "LuaYU_111813_00" , 0 )  

	SetModeEx(  Floor02  , EM_SetModeType_Show , false ) --�����
	local Floor02_2 = CreateObjByFlag( 102382, 780309 , 1 , 1 );--�j���ڰ�
	SetModeEx( Floor02_2 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor02_2 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor02_2 , RoomID )  

	Say( MalaTina03, "[SC_113120_MALA2_15] ") --<CY>���H�����K�ڰ�</CY>��T���X�G���H�R���A���O�A�i�H�Q��<CS>����</CS>�i��}�a�C
	sleep(40)	
	Say( MalaTina03, "[SC_113120_MALA2_16] ") --�ܩ�n�p��ϥΤ����H�ݷ|�A���A�A�A�A�A��
	sleep(40)
	SetModeEx(  Floor02_2  , EM_SetModeType_Show , false ) --�����
	Delobj(Floor02_2)
	SetModeEx(  Floor02  , EM_SetModeType_Show , true ) --���	
	Say( MalaTina03, "[SC_113120_MALA2_17] ") --�o�O<CY>�ʦL(���H�����K�ڰ�)</CY> �A�n�n�O��I�A�A�A�A��
	Sleep(30)
--�оǤ��e�G����
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina03 , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina01 , EM_SetModeType_Show , true ) --���
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
--	SetPosByFlag( MalaTina01, 780309 , 0 )--�ǰe�� X ���X�l
	Delobj(Floor02)
	sleep(10)	
	PlayMotion( MalaTina01, 75)  --�ϥΪ��~
	sleep(40)
	local Floor03 = CreateObjByFlag( 113109, 780309 , 1 , 1 );--�j�������a�O
	SetModeEx( Floor03 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor03 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor03 , RoomID )  

	Say( MalaTina01, "[SC_113120_MALA2_18] ") --�o�O<CY>�ʦL(����������)</CY> �A�ݭn<CS>�I��</CS>�Ӹѩ�L�I
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina02    , EM_SetModeType_Show , true ) --���
	AdjustFaceDir( MalaTina02, TargetID() , 0 ) --���V
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	
	SetModeEx(  Floor03  , EM_SetModeType_Show , false ) --�����
	local Floor03_2 = CreateObjByFlag( 113103, 780309 , 1 , 1 );--�j�������x
	SetModeEx( Floor03_2 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor03_2 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor03_2 , RoomID )  
	Say( MalaTina02, "[SC_113120_MALA2_19] ") --�u�n�ާ@<CY>����������</CY>�A�K�i��o�l������������ޯ�A�u�n���<CY>�����ؼ�</CY>�K�i�i������C
	sleep(30)	
	local Floor03_3 = CreateObjByFlag( 102382, 780309 , 8 , 1 );--�Q���Ωڰ�
	SetModeEx( Floor03_3 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor03_3 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor03_3 , RoomID )  
	sleep(30)
	Say( MalaTina02, "[SC_113120_MALA2_20]") --�A�����Q���T�w<CY>�����ؼ�</CY>�A�U�F�����R�O�A�O�Q�����~�ɮg���F�A���нT�{<CS>�ؼЪ��W��</CS>�a�I�A�A�A�A��
	sleep(30)
	local Floor03_4 = CreateObjByFlag( 113115, 780309 , 8 , 1 );--�F���ؼ�
	SetModeEx( Floor03_4 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor03_4 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor03_4 , RoomID )  

	AdjustFaceDir( Floor03_2, Floor03_3 , 0 ) --���V
	sleep(5)
	PlaySound( Floor03_2, "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
	PlayMotion( Floor03_2, 161)  --Buff0

	sleep(15)

	CastSpelllv( Floor03_4 , Floor03_4 , 493655 , 1 )
	PlaySound( Floor03_3, "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
	PlaySound( Floor03_3, "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	PlayMotion( Floor03_3, 145) --����ʧ@�GACTIVATE_BEGIN
	Delobj(Floor03_4)

	sleep(10)
	Say( MalaTina02, "[SC_113120_MALA2_21] ") --�����A�A�@�y����������<CS>�u���@������</CS>�I��ܥ��T�������ؼЫD�`���n�I
	sleep(10)
	Delobj(Floor03_3)
	sleep(20)
	PlayMotion( Floor03_2, 145) --����ʧ@�GACTIVATE_BEGIN
	Delobj(Floor03_2)
	sleep(20)	
	SetModeEx(  Floor03  , EM_SetModeType_Show , true ) --���
--	Show(Floor03 , RoomID )	
	Say( MalaTina02, "[SC_113120_MALA2_22] ") --�o�O<CY>�ʦL(����������)</CY> �A�n�n�O��I�A�A�A�A��
	Sleep(30)


--�оǤ��e�G�T�D
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina02    , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina01    , EM_SetModeType_Show , true ) --���
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)

--	SetPosByFlag( MalaTina01, 780309 , 0 )--�ǰe�� X ���X�l
	Delobj(Floor03)
	sleep(10)	
	PlayMotion( MalaTina01, 75)  --�ϥΪ��~
	sleep(40)
	local Floor04 = CreateObjByFlag( 113111, 780309 , 1 , 1 );--�T�D
	SetModeEx( Floor04 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor04 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor04 , RoomID )  

	Say( MalaTina01, "[SC_113120_MALA2_23] ") --�o�O<CY>�ʦL(��ťl�굲��)</CY> �A�u�n<CS>�a��</CS>�N�|�ѩ�I
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina03    , EM_SetModeType_Show , true ) --���
	AdjustFaceDir( MalaTina03, TargetID() , 0 ) --���V
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	
	SetModeEx(  Floor04  , EM_SetModeType_Show , false ) --�����

	local Floor04_2 = CreateObjByFlag( 102368, 780309 , 1 , 1 );--�T�D����
	SetModeEx( Floor04_2 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor04_2 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor04_2 , RoomID )  
	Say( MalaTina03, "[SC_113120_MALA2_24] ") --�A�A�A�A�㤣�p�߸ѩ�F<CY>��ťl�굲��</CY>�N�O�A���ڪ��}�l�A�L�|�l��<CS>�p������</CS>��A�i������I
	sleep(40)	
	local Rghost = LuaFunc_CreateObjByObj ( 102369 , Floor04_2 )
	SetModeEx( Rghost , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Rghost , EM_SetModeType_Mark, false )--�аO
	SetFightMode( Rghost , 0, 0, 0, 0 )
	AddBuff( Rghost ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(20)	
	Say( MalaTina03, "[SC_113120_MALA2_25] ") --����<CS>�p������</CS>�L�̵M�|���ͦb<CY>��ťl�굲��</CY>�A�u���R��<CY>��ťl�굲��</CY>�~��פ�L�I
	sleep(40)	
	Say( MalaTina03, "[SC_113120_MALA2_26] ") --��I��A�A�A�A�A���L�٬O�ʦL�ɡA�����ϥέ����������R���L�]�����C
	sleep(40)	
	Say( MalaTina03, "[SC_113120_MALA2_27]  ") --��������<CS>�p������</CS>�L�|�b�u�ɶ������͡A��M�A����n����k�I
	sleep(30)
	PlayMotion( Floor04_2, 145) --����ʧ@�GACTIVATE_BEGIN
	PlaySound( Floor04_2, "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	Delobj(Floor04_2)
	Delobj(Rghost)
	sleep(20)	
	SetModeEx(  Floor04  , EM_SetModeType_Show , true ) --�����
--	Show(Floor04 , RoomID )	
	Say( MalaTina03, "[SC_113120_MALA2_28] ") --����<CY>[113109]</CY> �A�n�n�O��a�I�A�A�A�A��
	Sleep(30)


--�оǤ��e�G�ǰe��

	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina03    , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina01    , EM_SetModeType_Show , true ) --���
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)

	Delobj(Floor04)
	sleep(10)	
	PlayMotion( MalaTina01, 75)  --�ϥΪ��~
	sleep(40)
	local Floor05 = CreateObjByFlag( 113113, 780309 , 1 , 1 );--�ǰe���a�O
	SetModeEx( Floor05 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor05 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor05 , RoomID )  

	Say( MalaTina01, "[SC_113120_MALA2_29]") --�o�O<CY>�ʦL(�������]�ۤ���)</CY> �A�ݭn<CS>�I��</CS>�Ӹѩ�L�I
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina02    , EM_SetModeType_Show , true ) --���
	AdjustFaceDir( MalaTina02, TargetID() , 0 ) --���V
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	
	SetModeEx(  Floor05  , EM_SetModeType_Show , false ) --�����
	local Floor05_2 = CreateObjByFlag( 113107, 780309 , 1 , 1 );--�ǰe��
	SetModeEx( Floor05_2 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor05_2 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor05_2 , RoomID )  

	Say( MalaTina02, "[SC_113120_MALA2_30]") --��A�a��<CY>�������]�ۤ���</CY> �ɡA�A�N�Q���ǰe��C�����J�f�A���L�Y�ǮɭԳo�o�O�Ӥ�K���\��A�A�A�A�A��
	sleep(40)	
	Say( MalaTina02, "[SC_113120_MALA2_31] ") --���Y�O<CS>�p������</CS>�a�񪺸ܡA�L�N�|�����öǰe�^��ŵ��ɡA�ӥB<CY>���ͪ��ɶ��N�|����</CY> �C
	sleep(20)

--************
	local Ghost = CreateObjByFlag( 102369, 780309 , 7 , 1 );--�T�D����.
	SetModeEx( Ghost , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Ghost , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Ghost , RoomID )  
	SetFightMode( Ghost , 0, 1, 0, 0 )

	AddBuff( Ghost ,503993 ,1 , 1 ); --�ǰe�S��


	Beginplot( Ghost ,"LuaYU_Mala2_playgo", 0 )
	sleep(25)
	AddBuff( Ghost ,503993 ,1 , 1 ); --�ǰe�S��
	BeginPlot( Ghost , "LuaP_Dead" , 0 )   
	sleep(30)
	SetModeEx(  Ghost  , EM_SetModeType_Show , false ) --�����
	Delobj( Ghost )
	sleep(20)
--************

	Delobj(Floor05_2)
	sleep(10)	
	Say( MalaTina02, "[SC_113120_MALA2_32] ") --�X�۳o�q�ŵ�����<CY>��ťl�굲��</CY>�i��}�a�a�I�A�A�A�A��
	sleep(30)

	SetModeEx(  Floor05  , EM_SetModeType_Show , true ) --�����		
	Say( MalaTina02, "[SC_113120_MALA2_33] ") --�o�O<CY>�ʦL(�������]�ۤ���)</CY> �A�n�n�O��I�A�A�A�A��
	Sleep(30)

--�оǤ��e�G�_��

	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina02    , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina01    , EM_SetModeType_Show , true ) --���
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)

	Delobj(Floor05)
	sleep(10)	
	PlayMotion( MalaTina01, 75)  --�ϥΪ��~
	sleep(40)
	local Floor06 = CreateObjByFlag( 113112, 780309 , 1 , 1 );--�_�ͦa�O
	SetModeEx( Floor06 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor06 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor06 , RoomID )  

	Say( MalaTina01, "[SC_113120_MALA2_34]") --�o�O<CY>�ʦL(�_�ä��_)</CY> �A�ݭn<CS>�I��</CS>�Ӹѩ�L�I
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --�����

	SetModeEx( MalaTina03    , EM_SetModeType_Show , true ) --���
	AdjustFaceDir( MalaTina03, TargetID() , 0 ) --���V
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	
	SetModeEx(  Floor06  , EM_SetModeType_Show , false ) --�����

	local Floor06_2 = CreateObjByFlag( 113106, 780309 , 1 , 1 );--�������_
	SetModeEx( Floor06_2 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Floor06_2 , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Floor06_2 , RoomID )  
	Say( MalaTina03, "[SC_113120_MALA2_35] ") --�I��<CY>�_�ä��_</CY>���o�_�ͫ��V<CY>���I���ǰe��</CY> �N�|�A���^��o�̡A���O�o�ӮɭԡA�A�֦��_�͡I
	sleep(40)	
	Say( MalaTina03, "[SC_113120_MALA2_36] ") --�}���_�c����A�p�G�٦��ɶ��A�u�n�a��j���N�|�i�J�U�@�^�X�I���ɡA�N�|����h��<CY>�ʦL(�_�ä��_)</CY>�C
	sleep(40)
	PlayMotion( Floor06_2, 145) --����ʧ@�GACTIVATE_BEGIN
	PlaySound( Floor06_2, "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	Delobj(Floor06_2)
	sleep(20)
	SetModeEx(  Floor06  , EM_SetModeType_Show , true ) --�����		
	Say( MalaTina03, "[SC_113120_MALA2_37] ") --�o�O<CY>�ʦL(�_�ä��_)</CY> �A�n�n�O��I�A�A�A�A��
	Sleep(20)
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --�ǰe�S��
	Sleep(10)

	Delobj(Floor06)
	Delobj(MalaTina03)
	Delobj(MalaTina02)
	Delobj(MalaTina01)

--	Show(OwnerID() , RoomID )
	SetModeEx(  OwnerID()  , EM_SetModeType_Show , true ) --���
	AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
	Sleep(10)

	PlayMotion( OwnerID(), 112)  --����
	Say( OwnerID() , "[SC_113120_MALA2_38] ") -- ���A�A�A�A��Ĥ@�^�X�u���@��<CY>�ʦL(�_�ä��_)</CY>�A�ĤG�^�X�h����ӡA�H�������I
	Sleep(40)
	PlayMotion( OwnerID(), 122) --idel03
	Say( OwnerID() , "[SC_113120_MALA2_39] ") --�b�C���ɭ����A�A��ܨ��h�֭��_�͡A�S��}�Ҧh�֭��_�c�O�H�A�A�A�A��
	Sleep(40)
	WriteRoleValue( MissionMala  , EM_RoleValue_Register+3 , 0 ) --�������a���b�i��оǼҦ�
	SetModeEx(  MissionMala  , EM_SetModeType_Mark, true )--�аO
	SetModeEx(  MissionMala  , EM_SetModeType_Show , true ) --���
--	Show(  MissionMala ,RoomID)
	SetModeEx(  OwnerID()  , EM_SetModeType_Show , false ) --���
	Delobj(OwnerID())

end

function LuaYU_Mala2_playgo()--�i��C������t


	MoveDirect( OwnerID(), 4079.6 , 18.7 , 3379.5 )

end



--------------------------���y�I��-----------------------------------------

function LuaYU_Mala2_exchange()--���y�I��

	local Nickname05 =  CountBodyItem( OwnerID() , 530125 )    --�ٸ�5

	if Nickname05 ==1 then

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_79]"  ) --���A�A�A�A��A�}��<CM>���P</CM>�F�ܡH�����V�h���P�A�ڷ|���A�V�n�����S���A�A�A�A��
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_71]" , "LuaYU_Mala2_exchange_01", 0 ) -- �I���ٸ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_72]" , "LuaYU_Mala2_exchange_02", 0 ) -- �I���ųN���b
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --�^�W�@��

	else

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_79]"  ) --���A�A�A�A��A�}��<CM>���P</CM>�F�ܡH�����V�h���P�A�ڷ|���A�V�n�����S���A�A�A�A��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_71]" , "LuaYU_Mala2_exchange_01", 0 ) -- �I���ٸ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_72]" , "LuaYU_Mala2_exchange_02", 0 ) -- �I���ųN���b
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --�^�W�@��

	end
end

function LuaYU_Mala2_exchange_01()--�I���ٸ�

	local Nickname01 =  CountBodyItem( OwnerID() , 530121 )    --�ٸ�1
	local Nickname02 =  CountBodyItem( OwnerID() , 530122 )    --�ٸ�2
	local Nickname03 =  CountBodyItem( OwnerID() , 530123 )    --�ٸ�3
	local Nickname04 =  CountBodyItem( OwnerID() , 530124 )    --�ٸ�4
	local Nickname05 =  CountBodyItem( OwnerID() , 530125 )    --�ٸ�5

	local Jokcard = 0

	if Nickname04 == 1 then
		Jokcard = 250
	elseif Nickname03 == 1 then
		Jokcard = 200
	elseif Nickname02 == 1 then
		Jokcard = 150
	elseif Nickname01 == 1 then
		Jokcard = 100
	elseif Nickname01 == 0 then
		Jokcard = 50
	end

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_74]"..Jokcard  ) 

--�A�A�A�A��b�o�����D�Ը̡A<CM>[205792]</CM>�O�D�`���e����o�A�ӤS�O����I���h�دS��\�ફ�~���޹D���@�I�Q��o�S�O���ٸ��ܡH�o���ڭn�D��<CM>[205792]</CM>�ƶq�G
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]" , "LuaYU_Mala2_exchangeNK", 0 ) -- 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --�^�W�@��
end

function LuaYU_Mala2_exchangeNK()--�I���ٸ�

	local Nickname01 =  CountBodyItem( OwnerID() , 530121 )    --�ٸ�1
	local Nickname02 =  CountBodyItem( OwnerID() , 530122 )    --�ٸ�2
	local Nickname03 =  CountBodyItem( OwnerID() , 530123 )    --�ٸ�3
	local Nickname04 =  CountBodyItem( OwnerID() , 530124 )    --�ٸ�4
	local Nickname05 =  CountBodyItem( OwnerID() , 530125 )    --�ٸ�5

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --���P

---------2011.08.08 �ץ����a��ƥ����P���Ը��R(113120)�I���ٸ���A��C�����I������������(113103)�ɡA�L�k�ϥί����ޯ�A�åB�b��ܵ�������ܡy�w�g�}�Ҥ@�ӹ�ܿﶵ�z���ܪ����~--------
	local RunTime = 0
	local DialogStatus = 0
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
----------------------------------------------------------------------------------------
	local Jokcard = 0

	if Nickname04 == 1 then
		Jokcard = 250
	elseif Nickname03 == 1 then
		Jokcard = 200
	elseif Nickname02 == 1 then
		Jokcard = 150
	elseif Nickname01 == 1 then
		Jokcard = 100
	elseif Nickname01 == 0 then
		Jokcard = 50
	end

	local Nickname = 0

	if JOK >= Jokcard then

		if Nickname04 == 1 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			--DelBodyItem( OwnerID() , 530124 , 1 )
			GiveBodyItem( OwnerID() , 530125 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03
			
		--	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		--		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530125] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530125] ]" )
			--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530125] ]", 0 )
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530125] ]", 0 )
		--	end
		elseif Nickname03 == 1 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			--DelBodyItem( OwnerID() , 530123 , 1 )
			GiveBodyItem( OwnerID() , 530124 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03

		--	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		--		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530124] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530124] ]" )
			--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530124] ]", 0 )
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530124] ]", 0 )
		--	end			
		elseif Nickname02 == 1 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			--DelBodyItem( OwnerID() , 530122 , 1 )
			GiveBodyItem( OwnerID() , 530123 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03
		--	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		--		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530123] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530123] ]" )
			--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530123] ]", 0 );
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530123] ]", 0 );
		--	end
		elseif Nickname01 == 1 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			--DelBodyItem( OwnerID() , 530121 , 1 )
			GiveBodyItem( OwnerID() , 530122 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03
			
		--	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		--		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530122] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530122] ]" )
			---	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530122] ]", 0 );
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530122] ]", 0 );
		--	end
		elseif Nickname01 == 0 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			GiveBodyItem( OwnerID() , 530121 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03
			
		--	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		--		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530121] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530121] ]" )
			--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530121] ]", 0 );
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530121] ]", 0 );
		--	end
		end

--���o�ٸ���ܮ�
--		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = Nickname ]" )
--		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
--		if CheckBuff( OwnerID() , 501570 ) == false then  --�W�[�ˬd�P�_
--			return
--		end
		
--		if( DialogSendOpen( OwnerID() ) == false ) then 
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
--			return 0
--		end

--		while true do
 --			Sleep(1)
 --			RunTime = RunTime + 1
 --			if RunTime  > 100 then -- ���L�a�j��A600 = �@����
 --		--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_OVERTIME_MSG]", 0 )
 --				CancelBuff( OwnerID() , 501570 )
 --				DialogClose( OwnerID() )
 --				break
 --			end
 --			DialogStatus = DialogGetResult( OwnerID() )
 --			--Say( PlayerID , DialogStatus )
 --		--	DebugMsg( OwnerID() , Room , "DialogStatus = "..DialogStatus )
 --			if DialogStatus == -2 then
 --				-- DO nothing
 --			elseif DialogStatus == 0  then
 --				CancelBuff( OwnerID() , 501570 )
 --				DialogClose( OwnerID() )
 --				break
 --			end
 --		end
--���o�ٸ���ܮ�(�H�W)
	else
		SetSpeakDetail( OwnerID() , "[SC_112502_NO]"  ) --�A�ҫ������~�ƶq����
		AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_Mala2_exchange_01" , 0 ) --�^�W�@��
	end
end

function LuaYU_Mala2_exchange_02()--�I���ųN���b

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_56]"  ) --����ũG���b
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]".."[203032]" , "LuaYU_Mala2_exchange_02_1", 0 ) -- �I���ũG���b(�����ɭ�)  10 : 1
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]".."[203029]" , "LuaYU_Mala2_exchange_02_2", 0 ) -- �I���ũG���b(�����m��)  10 : 1
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]".."[203030]" , "LuaYU_Mala2_exchange_02_3", 0 ) -- �I���ũG���b(�����ǰe)  10 : 1
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]".."[203031]" , "LuaYU_Mala2_exchange_02_4", 0 ) -- �I���ũG���b(���c�ᵲ)  10 : 1
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --�^�W�@��
end

function LuaYU_Mala2_exchange_02_1()--�ũG���b(�����ɭ�)

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --���P

	if JOK >= 10 then

		CloseSpeak( OwnerID() )   					
		DelBodyItem( OwnerID() , 205792 , 10 )
		GiveBodyItem( OwnerID() , 203032 , 1 )
		PlayMotion( TargetID(), 121)  --idel03

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --�A�ҫ������~�ƶq����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --�^�W�@��

	end
end

function LuaYU_Mala2_exchange_02_2()--�ũG���b(�����m��)						

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --���P

	if JOK >= 10 then

		CloseSpeak( OwnerID() )   					
		DelBodyItem( OwnerID() , 205792 , 10 )
		GiveBodyItem( OwnerID() , 203029 , 1 )
		PlayMotion( TargetID(), 121)  --idel03

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --�A�ҫ������~�ƶq����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --�^�W�@��

	end
end

function LuaYU_Mala2_exchange_02_3()--�ũG���b(�����ǰe)						

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --���P

	if JOK >= 10 then

		CloseSpeak( OwnerID() )   					
		DelBodyItem( OwnerID() , 205792 , 10 )
		GiveBodyItem( OwnerID() , 203030 , 1 )
		PlayMotion( TargetID(), 121)  --idel03

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --�A�ҫ������~�ƶq����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --�^�W�@��

	end
end

function LuaYU_Mala2_exchange_02_4()--�ũG���b(���c�ᵲ)						

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --���P

	if JOK >= 10 then

		CloseSpeak( OwnerID() )   					
		DelBodyItem( OwnerID() , 205792 , 10 )
		GiveBodyItem( OwnerID() , 203031 , 1 )
		PlayMotion( TargetID(), 121)  --idel03

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --�A�ҫ������~�ƶq����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --�^�W�@��

	end
end

--*********************************************************

function LuaYU_delNICKNAME()--�R���Ҧ��ٸ�

	DelBodyItem( OwnerID() , 530121 , 1 )
	DelBodyItem( OwnerID() , 530122 , 1 )
	DelBodyItem( OwnerID() , 530123 , 1 )
	DelBodyItem( OwnerID() , 530124 , 1 )
	DelBodyItem( OwnerID() , 530125 , 1 )

	Say( OwnerID(), "OK")

end