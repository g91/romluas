--------------------------------------- ���_�C��
function LuaYU_MalaTina2_01()

	local Key =  CountBodyItem( OwnerID() , 203477 )  --�S��@��Ĳ�o
	local play =  CheckFlag( OwnerID()  , 542991 ) --���Ѥw�g�ӹL
	local UseItem3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem3)


	if Key >= 1 then

		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_03]"   )--���A�A�A�A��_�I�̡A�o���A�ڷQ�M�A���ӹC��...�@��²�檺�C��~�A�A�A�A�A�u�n�A��b���w�ɶ����q�L������ê�A���o�_�c���_�ͨö}���_�c�A�����_�ôN�O�A���I�u�n��O<CS>30�ӥ����ťN��</CS>�A�N��ѥ[�A�A�n...�����D�ԶܡH...�_�I�̡I�H
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_MalaTina2_02", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_03]" , "LuaYU_111813_3", 0 ) --�˰��Sť��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --�^�W�@��

	elseif  play == true then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]"   )--���A�A�A�A��O�N�S���ɶܡH�C�H�C�ѥu���@�����|��I���ѦA�ӧa�I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --�^�W�@��

	elseif play == false then

		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_03]"   )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_MalaTina2_02", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_03]" , "LuaYU_111813_3 ", 0 ) --�˰��Sť��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --�^�W�@��

	end

end
---------------------------------����2�����ŭp��
function LuaYU_MalaTina2_02()
	local Cash =  CountBodyItem( OwnerID() , 203038 )  --�����ťN��
	local Key =  CountBodyItem( OwnerID() , 203477 )  --�S��@��Ĳ�o
	SetFlag( OwnerID()  , 542992 , 0 ) --���}���m�X��

	if Key >= 1 then


		BeginPlot( OwnerID() , "LuaYU_MalaTina2_03" , 0 )  


	elseif Cash >= 30 then


		BeginPlot( OwnerID() , "LuaYU_MalaTina2_03" , 0 )  

	else
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_36]"   )--�A�S�������������ťN��
	end
end

-------------------------------����2 �Y�p�ǰe
function LuaYU_MalaTina2_03()
	CloseSpeak( OwnerID() )      
	-- 2013.08.30 ���E:�ץ����a�󺿩Ը��R-�ͦs�C���ɡA�b�C���ɶ������S�٦b����Ĳ�I�@���I�k�������p�U�Q�ǥX�C����A�|�L�k�����LĲ�I�@�������D�C
	Hao_SetPlot_Touch_Reset( OwnerID() )
	--
	ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) --���A�A�A�A��G�M���_�I�̪��i��r��A�A�A�A�㵥���A�O�|���٬O�|���O�H�ڭ����ΫݷQ�ݨ�F�I�A�A�A�A��I
	ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) 
	CastSpell( OwnerID(), OwnerID(), 491272)
	sleep(40)

	BeginPlot( OwnerID() , "LuaYU_MalaTina2_04" , 0 )  

end

------------------------�ǰe�N
function LuaYU_MalaTina2_04()

	if ChangeZone( OwnerID(), 353 , -1 , 4081.6, 18.7 , 3335.8, 269.5) then   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		DesignLog(OwnerID(),353," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��

	end

end


--*****************�ƥ���


function LuaYU_Mala2_rANGE() --��l�d��@��

	SetPlot( OwnerID(),"range","LuaYU_Mala2_rANGE2",50 )                                                                     --���@�Ӫŭ�function�A�����A��Ĳ�o�d��@�����i��C     
end

function LuaYU_Mala2_rANGE2()

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	Hide( TargetID() )
	Show(  TargetID() ,RoomID)

--OwnerID  ���a
--TargetID   ���Ⱥ���NPC
	local play =  CheckFlag( OwnerID()  , 542992 ) 

	if play ~= true then	--���ѲĤ@���i�ƥ�   �Ұʭ��m����C
		SetModeEx(  TargetID()  , EM_SetModeType_Show , true ) --���
		BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )  --�����p�ɾ�
		SetFlag( OwnerID()  , 542992 , 1 ) --��������Ĳ�o�d��@��
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 , 0 ) --���a���I�ũG���b�ɷ|�����O��
		WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass ���a���W��PID�M��
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+4 , 0 )  --�S��KEY���o�ɭ��M��
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --���a��^�_�c�ϡA���i�ϥ�"�������b"���X�СC
		WriteRoleValue( TargetID()  , EM_RoleValue_Register+3 , 0 ) --�������a���b�i��оǼҦ�
	--���;���  �ݥ[�J�G���m�_�c�B���m���Ⱥ��Ը����B�R���������d���Ը���


		local MALATINA = LuaFunc_SearchNPCbyOrgID(OwnerID(), 113120, 200 , 1)       --�d��@���G�Y��HIDE�����Ը��R�h�s�X��

		local ToDel = {}

		ToDel[1] = LuaFunc_SearchNPCbyOrgID( TargetID() , 111813, 300 , 1)     --���m����A����Ĳ�I�ɡA�R�����d�̭p�����d�B��t���Ը���
		ToDel[2] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100044, 60 , 1)     --�оǥ�NPC
		ToDel[3] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113114, 300 , 1)     --�_�c
		ToDel[4] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113137, 300 , 1)     --�S�O�_�c
		ToDel[5] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113110, 300 , 1)     
		ToDel[6] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113104, 300 , 1)     
		ToDel[7] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113108, 300 , 1)     
		ToDel[8] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102382, 300 , 1)     
		ToDel[9] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113109, 300 , 1)  
		ToDel[10] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113103, 300 , 1)     
		ToDel[11] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102382, 300 , 1)     
		ToDel[12] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113115, 300 , 1)  
		ToDel[13] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113111, 300 , 1)     
		ToDel[14] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102368, 300 , 1)     
		ToDel[15] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113113, 300 , 1)  
		ToDel[16] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113107, 300 , 1)     
		ToDel[17] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102369, 300 , 1)     
		ToDel[18] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113112, 300 , 1)  
		ToDel[19] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113106, 300 , 1)    
		ToDel[20] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113118, 300 , 1)    
		ToDel[21] = LuaFunc_SearchNPCbyOrgID( TargetID() , 111814, 300 , 1)    --�ƺ���J


 
		for i=1 , table.getn(ToDel) do	

			if ToDel[i] ~= -1 then
				for j = 0 ,table.getn(ToDel[i])  do

					Delobj(ToDel[i][j])
				end
			end
		end

		local door = LuaFunc_SearchNPCbyOrgID( TargetID() , 101473, 300 , 1)--�j��
		PlayMotion( door[0], 133) --���������A
--		sleep(10)
		SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--����
		Hide( door[0] )
		Show(  door[0] , RoomID )

--		sleep(10)
		
		if CheckID( MALATINA[0] ) == true then
			SetModeEx( MALATINA[0]   , EM_SetModeType_Show , true ) --�����
			SetModeEx( MALATINA[0]  , EM_SetModeType_Mark, true )--�аO

			Hide(MALATINA[0])
			Show(  MALATINA[0],RoomID)

		end

		local Chest = {}
		for j = 1 , 10 do
			Chest[j] = CreateObjByFlag( 113114, 780309 , j+14 , 1 );

			Hide(Chest[j])
			Show(  Chest[j],RoomID)
			AddToPartition( Chest[j] , RoomID )  
			Beginplot( Chest[j]  ,"LuaYU_Mala2_Treasure", 0 )
		end

		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_04]".. "|r" , 0 ) --���A�A�A�A��_�I��...�ݬݥ|�P���_�c�A�߰ʤF�ܡI�H���өM�ڹ�ܧa�I
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_113120_MALA2_04]".. "|r" , 0 ) 

		AddBuff( OwnerID() ,502864 ,1 , -1 ); --�w��
		AddBuff( OwnerID() ,503995 ,1 , -1 ); --�B�i�I��
	end
end

function LuaYU_Mala2_00()

	local Key =  CountBodyItem( OwnerID() , 203477 )  --�S��@��Ĳ�o
	local play =  CheckFlag( OwnerID()  , 542991 ) --���Ѥw�g�ӹL
	local playover =  CheckFlag( OwnerID()  , 543170 ) --�q��
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	local Cash =  CountBodyItem( OwnerID() , 203038 )  --�����ťN��

	local Teach = ReadRoleValue( TargetID() ,EM_RoleValue_Register+3 )  --���a�O�_�b�i��оǼҦ�

	if playover == true then -- �q���ɺ��j�j���ﶵ

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_68]"  ) --�A�A�A�A��~�M�}���F
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_Mala2_leave", 0 ) --�ڭn���}

	elseif Teach > 0 then
		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_99]"  ) --�A�A�A�A��M�߬ݱоǳ�
	elseif Key >= 1 then
		PlayMotion( TargetID(), 121)  --idel03

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_05]"  ) --���A�A�A�A��_�I�̡��w��Ө�...���Ը��R��...���_�C�������A�A�A�A��C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_69]" , "LuaYU_Mala2_01", 0 )--�W�h����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_Mala2_star", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_58]" , "LuaYU_Mala2_exchange", 0 ) --�I���S����y
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_Mala2_leave", 0 ) --�ڭn���}
	elseif Cash >= 30 then
		PlayMotion( TargetID(), 121)  --idel03

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_05]"   ) --
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_69]" , "LuaYU_Mala2_01", 0 )--�W�h����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_Mala2_star", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_58]" , "LuaYU_Mala2_exchange", 0 ) --�I���S����y
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_Mala2_leave", 0 ) --�ڭn���}
	else
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_36]"   )--�A�S�������������ťN��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_Mala2_leave", 0 ) --�ڭn���}
	end

end

function LuaYU_Mala2_star()--�W�h����
		PlayMotion( TargetID() , 120) 
		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_80]"   ) --�ǳƦn�F�ܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_27]" , "LuaYU_Mala2_04", 0 ) --�����D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_57]" , "LuaYU_Mala2_other_01", 0 ) -- �ϥΧũG���b�i��D��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --�^�W�@��
end


function LuaYU_Mala2_01()--�W�h����

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_06]"  ) --�W�h��²��A�u�n�b���w�ɶ����A��V��ê�ܨ��C�^�X���w�ƶq���_�ͨåB��V�ǰe���^��o�̡A�N�i�H�ɱ����}���_�c�I�A�A�A�A��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_07]" , "LuaYU_Mala2_Showlearn", 0 ) -- �C������
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --�^�W�@��
end

function LuaYU_Mala2_other_01()--�ϥΧũG���b�ɭ������i��D��

	local Card =  CountBodyItem( OwnerID() , 203032 )  --�ũG���b

	if Card >= 1 then

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_59]"  ) --���A�A�A�A��A�~�M����F�o�ӡI����A�A�N�֦�<CM>20����</CM>���R�άD�Ԯɶ��I�A�T�w�ϥζܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GETTITLE_1]" , "LuaYU_Mala2_other_02", 0 ) -- �T�w
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --�^�W�@��

	else

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_60]"  ) --�A�A�A�A��ګ��S�ݨ����<CM>[203032]</CM>�O�H

	end

end

function LuaYU_Mala2_other_02()--�ϥΧũG���b�ɭ������i��D��

	CloseSpeak( OwnerID() ) 
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 , 666 ) 
	Beginplot( TargetID() ,"LuaYU_Mala2_04_2", 0 )
	WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 ) 

	DelBodyItem( OwnerID() , 203032 , 1 )
	DelBodyItem( OwnerID() , 203038 , 30 )
	SetFlag( OwnerID()  , 542991 , 1 ) -- ���n���~


end

function LuaYU_Mala2_04()--�i��C������t

	CloseSpeak( OwnerID() ) 
	Beginplot( TargetID() ,"LuaYU_Mala2_04_2", 0 )
	WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 ) 

	DelBodyItem( OwnerID() , 203038 , 30 )
	SetFlag( OwnerID()  , 542991 , 1 ) -- ���n���~
end


function LuaYU_Mala2_04_2()--�i��C������t

--Say( OwnerID(),"OwnerID()_2" )   --���Ⱥ��Ը���
--Say( TargetID(),"TargetID()_2" )   --���a

	local MalaTina = OwnerID()
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	SetModeEx( MalaTina  , EM_SetModeType_Move, false )--����
	SetModeEx( MalaTina  , EM_SetModeType_Mark, false )--�аO
	Hide(MalaTina)
	Show(MalaTina , RoomID )

	PlayMotion( MalaTina, 112)  --����
	Say( MalaTina , "[SC_113120_MALA2_40] ") -- ���A�A�A�A��ڤ]�����Ϋݭn�}�l�F�I���ڬݬݧA�����Ƨa�I
	sleep(20)	
	PlayMotion( MalaTina, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)


	SetModeEx( MalaTina  , EM_SetModeType_Show , false )--�����
	
	Hide( MalaTina)
	MalaGOGO = CreateObjByFlag( 111813, 780309 , 0 , 1 );--��t & �p�����d��
--	SetModeEx( MalaGOGO  , EM_SetModeType_Move, false )--����
	SetModeEx( MalaGOGO  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( MalaGOGO , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( MalaGOGO  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( MalaGOGO , EM_SetModeType_Fight , false )--�i�������

	AddToPartition( MalaGOGO , RoomID )  

	WriteRoleValue( MalaTina , EM_RoleValue_Register+1 , MalaGOGO )   --�O�� (�p�����d��)�����Ը��R
	WriteRoleValue( MalaTina , EM_RoleValue_Register+2 , TargetID() )   --�O�� ���a
	WriteRoleValue( MalaGOGO , EM_RoleValue_Register+1 , MalaTina )   --�O�� ���Ⱥ��Ը��R
	WriteRoleValue( MalaGOGO , EM_RoleValue_Register+2 , TargetID() )   --�O�� ���a

	sleep(10)
	PlayMotion( MalaGOGO, 122)  --idel03
	sleep(10)
	Say( MalaGOGO , "[SC_113120_MALA2_41]") -- ����N�}�l�a�I�ڪ����H�̡A�X�ө۩I�o��_�I�̧a~���A�A�A�A��
	sleep(10)
	PlayMotion( MalaGOGO, 121)  --idel03	
	sleep(45)
	Show(  MalaTina ,RoomID)
	SetModeEx( MalaTina  , EM_SetModeType_Show , false )--�����

	Magiccirle = CreateObjByFlag( 113118, 780309 , 0 , 1 );--�S���]�k�}
	SetModeEx( Magiccirle  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( Magiccirle , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Magiccirle  , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Magiccirle , RoomID )  

	WriteRoleValue( MalaTina , EM_RoleValue_Register+4 , Magiccirle )   --�O�� �S���]�k�}


	BeginPlot( MalaGOGO , "LuaYU_111813_00" , 0 )
	local Jok = {}
	for i = 2, 7 do

		Jok[i] = CreateObjByFlag( 111814, 780309 , 9 , 1 );
		AddToPartition( Jok[i] , RoomID )  

		SetModeEx( Jok[i]   , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Jok[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Jok[i]    , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Jok[i]  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Jok[i]  , EM_SetModeType_Show , false )--���

		MoveToFlagEnabled(Jok[i] , false )
		WriteRoleValue( Jok[i]  ,EM_RoleValue_IsWalk , 1 )

		Hide(Jok[i])  
		Show(Jok[i] , RoomID )

		WriteRoleValue(  Jok[i]  , EM_RoleValue_PID ,  i ) 
		Beginplot( Jok[i]  ,"LuaYU_Mala2_04_3", 0 )	

	end
	
--	Show(MalaTina , RoomID )
	sleep(100)
	BeginPlot(  MalaTina  , "LuaYU_Mala2_02" , 0 )  


end

function LuaYU_Mala2_04_3()--�ƺ���J����


	local NUM = ReadRoleValue( OwnerID()  ,EM_RoleValue_PID) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	if NUM == 4 or NUM == 5  then

		sleep(20)
--		AddBuff( OwnerID()  ,503993 ,1 , 1 ); --�ǰe�S��
		sleep(10)

	end


	if NUM == 6 or NUM == 7  then

		sleep(40)
--		AddBuff( OwnerID()  ,503993 ,1 , 1 ); --�ǰe�S��
		sleep(10)

	end

	SetModeEx( OwnerID()  , EM_SetModeType_Show , true )--���
	Hide(OwnerID() )  
	Show(OwnerID() , RoomID )	


	LuaFunc_MoveToFlag( OwnerID() , 780309 , NUM , 0 )
	SetPosByFlag( OwnerID(), 780309 , NUM )
	Beginplot( OwnerID() ,"LuaYU_Mala2_04_4", 0 )

--	Say(  OwnerID() , NUM.."  5" )



end

function LuaYU_Mala2_04_4()--�ƺ���J��t
	local NUM = ReadRoleValue( OwnerID()  ,EM_RoleValue_PID) 
	while true do

		if NUM == 2 or NUM ==  4 or NUM ==  6 then
			PlayMotion( OwnerID(), 123) 
			sleep(40)
		else

			PlayMotion( OwnerID(), 121) 
			sleep(20)
			PlayMotion( OwnerID(), 122) 
			sleep(30)

		end
	end

end

function LuaYU_Mala2_04_killed()--�����ƺ���J
	local Jok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111814, 60 , 1)     


	for i = 0 ,table.getn(Jok)  do

		Delobj(Jok[i])
	end

end


function LuaYU_Mala2_02()--�ǳƧ����}���@��

--Say( OwnerID(),"OwnerID()_2".."GOGO" )   --���Ⱥ��Ը���


	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
 -- 	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  	
  --	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
	local BoxMala = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+1) --���d�p�⪺���Ը���
	local PlayerID = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+2) --���a
	local PlayerLV = ReadRoleValue( PlayerID , EM_RoleValue_LV )
	local Magiccirle = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+4) --�S���]�k�}

	Delobj(Magiccirle)

	local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 );
	SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --�����

	AddToPartition( ffdeler , RoomID )  

	WriteRoleValue( ffdeler  , EM_RoleValue_Register , PlayerLV ) --�O���a����
	BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --�w���M���Ҧ��a�O

	sleep(10)

	local floors = CreateObjByFlag( 113105, 780309 , 11 , 1 );
	SetModeEx( floors  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( floors   , EM_SetModeType_HideName, true )--�W��
	SetModeEx( floors , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( floors , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( floors  , EM_SetModeType_Show , false ) --�����
	AddToPartition( floors , RoomID )  
	WriteRoleValue( floors , EM_RoleValue_PID , OwnerID() )   --�O����Ⱥ��Ը��R
	BeginPlot( floors , "LuaYU_Mala2_hidemala3" , 0 )  -- ����a�O���m�� �A�}��
end

function LuaYU_Mala2_03()--�}�l�p��

	local PlayerID = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+2) --���a
	local GOGOticket = ReadRoleValue( PlayerID ,EM_RoleValue_Register+6) --�P�_���a�O�_�ϥΤF�����ɶ����ũG���b

	ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_42]".. "|r" , 0 ) --����N�}�l�p�ɧa�I���A�A�A�A��]�_�ӧa�I�_�I�̡I
	Say(  OwnerID(), "[SC_113120_MALA2_42]") 

	CancelBuff( PlayerID ,502864 ); --�w��


	if GOGOticket == 666 then

		ClockOpen( PlayerID ,EM_ClockCheckValue_2,1200,1200,0,"Lua_Clockending","Lua_Clockending")

		sleep(11990)--���W�C���ɶ��G20����  20*60 = 1200  1200-1 = 1199       11990�@��
		-- 2013.08.30 ���E:�ץ����a�󺿩Ը��R-�ͦs�C���ɡA�b�C���ɶ������S�٦b����Ĳ�I�@���I�k�������p�U�Q�ǥX�C����A�|�L�k�����LĲ�I�@�������D�C
			Hao_SetPlot_Touch_Reset( PlayerID )
		--
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) --���A�A�A�A��ɶ���X�h�a�I
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) 
		sleep(10)

		ChangeZone( PlayerID, 2 , 0 , 4871.9, 104.9, -1885.2, 92)

	else

		ClockOpen( PlayerID ,EM_ClockCheckValue_2,900,900,0,"Lua_Clockending","Lua_Clockending")

		sleep(8990)--���W�C���ɶ��G15����  15*60 = 900  900-1 = 899       8990�@��
		-- 2013.08.30 ���E:�ץ����a�󺿩Ը��R-�ͦs�C���ɡA�b�C���ɶ������S�٦b����Ĳ�I�@���I�k�������p�U�Q�ǥX�C����A�|�L�k�����LĲ�I�@�������D�C
			Hao_SetPlot_Touch_Reset( PlayerID )
		--		
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) --���A�A�A�A��ɶ���X�h�a�I
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) 
		sleep(10)

		ChangeZone( PlayerID, 2 , 0 , 4871.9, 104.9, -1885.2, 92)

	end

end

function LuaYU_Mala2_doorclose()--�����@��   TargetID�O floors + �O��

--Say( OwnerID(),"OwnerID()_1" )--���a
--Say( TargetID(),"TargetID()_1" )--�ͦ��a�ONPC
	SetPlot( TargetID(),"range","",70 )    


	local Malatina = ReadRoleValue( TargetID() ,EM_RoleValue_PID) --���Ⱥ���
	local BoxMala = ReadRoleValue( Malatina ,EM_RoleValue_Register+1) --���íp������
	local Class = ReadRoleValue( BoxMala ,EM_RoleValue_PID) --���d���Ԩ��W��PID  �ĴX��
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( TargetID() , 101473, 200 , 1)--�j��
	PlayMotion( door[0], 147) 
	sleep(5)
	SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--����
	Hide( door[0] )
	Show(  door[0] , RoomID )

	AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
	SetPosByFlag( OwnerID() , 780309 , 10 )--�ǰe�� X ���X�l

	BeginPlot( Malatina , "LuaYU_Mala2_04_killed" , 0 )  -- �����ƺ���J
	SetModeEx( BoxMala  , EM_SetModeType_Show , false ) --�����
	Hide( BoxMala )
	Show(  BoxMala , RoomID )
	sleep(10)

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 1314  )   --���a���b�����A�i�ϥ�"�������b"���X�СC

	local CountClass = ReadRoleValue( BoxMala ,EM_RoleValue_PID) 

	WriteRoleValue( BoxMala , EM_RoleValue_PID , CountClass+1 )   --�������d���X�A�Ĥ@�� PID�� 0


	local MRclass = CreateObjByFlag( 113105, 780309 , 13 , 1 ); -- �ǰe���U����������

	SetModeEx( MRclass  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( MRclass   , EM_SetModeType_HideName, true )--�W��
	SetModeEx( MRclass , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( MRclass , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( MRclass  , EM_SetModeType_Show , false ) --�����

	AddToPartition( MRclass , RoomID )  

	local CountClass = ReadRoleValue( BoxMala ,EM_RoleValue_PID) 


	WriteRoleValue( MRclass , EM_RoleValue_PID , CountClass  )   --�O���Ը��R���d
	WriteRoleValue( MRclass , EM_RoleValue_Register+7 , BoxMala  )   --�O�����ú��Ը��R

	SetPlot( MRclass,"range","LuaYU_Mala2_trans",20 )  --�ǰe�ܪ��f

	SetPlot( BoxMala,"range","LuaYU_Mala2_hidemala",50 )  

--	Say(OwnerID() ,"CLASS=".. Class)

	if Class == 3 then

		--** �q�� �q�X���Ը��R
		SetModeEx( Malatina  , EM_SetModeType_Mark, true )--�аO   
		SetModeEx( Malatina  , EM_SetModeType_Show , true ) --�����
		Hide(Malatina)
		Show( Malatina ,RoomID )

		--BeginPlot( Malatina , "LuaYU_111813_00" , 0 )
		SetFlag( OwnerID()  , 543170 , 1 ) -- �q��

	end

end

function LuaYU_Mala2_hidemala()--���έp�����d�����Ը����@��

--Say( OwnerID(),"OwnerID()_1" )--���a
--Say( TargetID(),"TargetID()_1" )--���íp������
	
	SetPlot( TargetID() ,"range","",50 )  
	local Class = ReadRoleValue( TargetID() ,EM_RoleValue_PID) --���d���Ԩ��W��PID  �ĴX��
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	local Malatina = ReadRoleValue( TargetID() ,EM_RoleValue_Register+1) --���Ⱥ���
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )

	if Class < 4 then
		local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 )
		SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --�����
		AddToPartition( ffdeler , RoomID )  
		WriteRoleValue( ffdeler  , EM_RoleValue_Register , PlayerLV ) --�O���a����
		BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --�w���M���Ҧ��a�O

		sleep(10)

		local floors = CreateObjByFlag( 113105, 780309 , 11 , 1 );
		SetModeEx( floors  , EM_SetModeType_Mark, false )--�аO
		SetModeEx( floors   , EM_SetModeType_HideName, true )--�W��
		SetModeEx( floors , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( floors , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( floors  , EM_SetModeType_Show , false ) --�����
		AddToPartition( floors , RoomID )  
		WriteRoleValue( floors , EM_RoleValue_PID , Malatina )   --�O����Ⱥ��Ը��R
		BeginPlot( floors , "LuaYU_Mala2_hidemala2" , 0 )  -- �a�O���m �A�}��
   
	end
end

-- ����a�O���m�� �A�}��
function LuaYU_Mala2_hidemala2()  --Ĳ�o��floor
	local floors = OwnerID()

	LuaYu_Ma2floor_matrix()  -- Floor ����a�O���m�@��
		
	local door = LuaFunc_SearchNPCbyOrgID( floors , 101473, 200 , 1)--�j��
	SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--����
	PlayMotion( door[0], 145) 
	SetPlot( floors ,"range","LuaYU_Mala2_doorclose",100 )       
end

-- ����a�O���m�� �A�}�� , �M��A�}�p�ɾ�
function LuaYU_Mala2_hidemala3()  --Ĳ�o��floor
	local floors = OwnerID()
	local Malatina = ReadRoleValue( floors ,EM_RoleValue_PID) --���� ����
	local BoxMala = ReadRoleValue( Malatina ,EM_RoleValue_Register+1) --����Ĳ�o�κ���

	LuaYu_Ma2floor_matrix()  -- Floor ����a�O���m�@��
		
	local door = LuaFunc_SearchNPCbyOrgID( floors , 101473, 200 , 1)--�j��
	SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--����
	PlayMotion( door[0], 145) 
	SetPlot( floors ,"range","LuaYU_Mala2_doorclose",100 )       

	sleep(10)
	BeginPlot( BoxMala , "LuaYU_Mala2_03" , 0 )
end

function LuaYU_Mala2_trans()--�L���ǰe����f�AOwnerID �O���a   TargetID  ����

	local Class = ReadRoleValue( TargetID() ,EM_RoleValue_PID) --���d���Ԩ��W��PID
	local BoxMala = ReadRoleValue( TargetID() ,EM_RoleValue_Register+7) --���d����
	local SPPASS = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+9) --�O�_�q�L�S�O�ؼ�
	local Malatina = ReadRoleValue( BoxMala ,EM_RoleValue_Register+1) --���Ⱥ���

	local PClass = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --���a���W��PID
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Timecount = ClockRead(OwnerID(),EM_ClockValueType_NowTime) -- �^�Ǫ��a���W���p�ɾ��ƭȡC
	local GOGOticket = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+6) --�P�_���a�O�_�ϥΤF�����ɶ����ũG���b
	local KEYTIME = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+4) --�ܨ��_�ͪ��ɶ�
	local Player = OwnerID()
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV )	
--	Say(OwnerID(), "SPPASS="..SPPASS )
	if Class == 1 then
		if PClass == 1 then
-------------------------------------------------2013.03.14 (6.0.0)�f����X�վ� ------------------------------------------------
			if PlayerLV >= 50 then
				Hao_Monetary_Union_240181(Player , 10)
			end
--------------------------------------------------------------------------------------------------------------------------------------		
			AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
			SetPosByFlag( OwnerID() , 780309 , 14 )--�ǰe�� X ���X�l
			WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass ���a���W��PID�M��
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --���a��^�_�c�ϡA���i�ϥ�"�������b"���X�СC
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1 , 168  )   --�����q��
		elseif PClass < 1 then
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_44]" , 0 ) 
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_44]" , 0 ) 
		end
	elseif Class == 2 then

		if PClass == 2 then
-------------------------------------------------2013.03.14 (6.0.0)�f����X�վ� ------------------------------------------------
			if PlayerLV >= 50 then
				Hao_Monetary_Union_240181(Player , 10)
			end
-------------------------------------------------------------------------------------------------------------------------------------
			if GOGOticket == 666 then --�p�ɾ��q 20���� �}�l�˼�    �q1200 ��˼�

				if Timecount >=840 then  --6�������q�L�ĤG���X�{�S���_�c�@�� ( 1200 - X = 360(6����= 60*6=360) �A X = 840 )

					if SPPASS ~= 5566 then --�p�G���a�S����"�������b"

						local SPBOX = CreateObjByFlag( 113137, 780309 , 25 , 1 )

						SetModeEx( SPBOX  , EM_SetModeType_Mark, true )--�аO
						SetModeEx( SPBOX   , EM_SetModeType_HideName, false )--�W��
						SetModeEx( SPBOX , EM_SetModeType_ShowRoleHead, false )--�Y����

						AddToPartition( SPBOX , RoomID )  

						Beginplot( SPBOX  ,"LuaYU_Mala2_Treasure2", 0 )

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Timecount )   --�O��{�b���ɶ�
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 2222 )   --�Ĥ@�S�O�ؼаO��

						ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_64]" , 0 ) --�S�O�ؼйF���I�X�{�S���_�c�I5��������}�ĥ|�^�X�A�N�B�~��o�_�c���_�͡I
						ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_64]" , 0 ) 
					end


				end

			else--�p�ɾ��q 15���� �}�l�˼�   �q900 ��˼�

				if Timecount >=540 then  --6�������q�L�ĤG���X�{�S���_�c�@�� ( 900 - X = 360(6����= 60*6=360) �A X = 540 )

					if SPPASS ~= 5566 then --�p�G���a�S����"�������b"

						local SPBOX = CreateObjByFlag( 113137, 780309 , 25 , 1 )

						SetModeEx( SPBOX  , EM_SetModeType_Mark, true )--�аO
						SetModeEx( SPBOX   , EM_SetModeType_HideName, false )--�W��
						SetModeEx( SPBOX , EM_SetModeType_ShowRoleHead, false )--�Y����

						AddToPartition( SPBOX , RoomID )  

						Beginplot( SPBOX  ,"LuaYU_Mala2_Treasure2", 0 )

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Timecount )   --�O��{�b���ɶ�
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 2222 )   --�Ĥ@�S�O�ؼаO��

						ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_64]" , 0 ) --�S�O�ؼйF���I�X�{�S���_�c�I5��������}�ĥ|�^�X�A�N�B�~��o�_�c���_�͡I
						ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_64]" , 0 ) 
			
					end

				end


			end

			AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
			SetPosByFlag( OwnerID() , 780309 , 14 )--�ǰe�� X ���X�l
			WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass ���a���W��PID�M��
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --���a��^�_�c�ϡA���i�ϥ�"�������b"���X�СC
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1 , 168  )   --�����q��


		elseif PClass < 2 then
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_44]" , 0 ) 
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_44]" , 0 ) 
		end
	elseif Class == 3 then
		if PClass == 3 then
-------------------------------------------------2013.03.14 (6.0.0)�f����X�վ� ------------------------------------------------
			if PlayerLV >= 50 then
				Hao_Monetary_Union_240181(Player , 10)
			end
--------------------------------------------------------------------------------------------------------------------------------------
			if GOGOticket == 666 then --�p�ɾ��q 20���� �}�l�˼� �q1200 ��˼�

				if Timecount >=660 then  --9�������q�L�ĤT���X�{�S���_�c�@�� ( 1200 - X = 540(9����= 60*9=540) �A X = 660 )

					if SPPASS ~= 5566 then --�p�G���a�S����"�������b"

						local SPBOX = CreateObjByFlag( 113137, 780309 , 26 , 1 )

						SetModeEx( SPBOX  , EM_SetModeType_Mark, true )--�аO
						SetModeEx( SPBOX   , EM_SetModeType_HideName, false )--�W��
						SetModeEx( SPBOX , EM_SetModeType_ShowRoleHead, false )--�Y����

						AddToPartition( SPBOX , RoomID )  

						Beginplot( SPBOX  ,"LuaYU_Mala2_Treasure2", 0 )

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Timecount )   --�O��{�b���ɶ�
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 3333 )   --�ĤG�S�O�ؼаO��

						ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_65]" , 0 ) --�S�O�ؼйF���I�X�{�S���_�c�I5��������}�ĥ|�^�X�A�N�B�~��o�_�c���_�͡I
						ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_65]" , 0 ) 

					end

				end

			else--�p�ɾ��q 15���� �}�l�˼� �q900 ��˼�

				if Timecount >=360 then  --9�������q�L�ĤT���X�{�S���_�c�@�� ( 900 - X = 540(9����= 60*9=540) �A X = 360 )

					if SPPASS ~= 5566 then --�p�G���a�S����"�������b"

						local SPBOX = CreateObjByFlag( 113137, 780309 , 26 , 1 )

						SetModeEx( SPBOX  , EM_SetModeType_Mark, true )--�аO
						SetModeEx( SPBOX   , EM_SetModeType_HideName, false )--�W��
						SetModeEx( SPBOX , EM_SetModeType_ShowRoleHead, false )--�Y����

						AddToPartition( SPBOX , RoomID )  

						Beginplot( SPBOX  ,"LuaYU_Mala2_Treasure2", 0 )

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Timecount )   --�O��{�b���ɶ�
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 3333 )   --�ĤG�S�O�ؼаO��

						ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_65]" , 0 ) --�S�O�ؼйF���I�X�{�S���_�c�I5��������}�ĥ|�^�X�A�N�B�~��o�_�c���_�͡I
						ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_65]" , 0 ) 
					end
				end
			end

			if SPPASS == 2222 then

				if Timecount >= (KEYTIME-180)  then--�p�G�{�b���ɶ� �j�� ��ɰO�����ɶ�-3����

					GiveBodyItem( OwnerID() , 205791  , 1 )  

					ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_66]".."|r" , 0 ) --�S�O����F���I�ܱo�Q�����_�͡I
					ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_113120_MALA2_66]".. "|r" , 0 ) 

				end
			end
			AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
			SetPosByFlag( OwnerID() , 780309 , 14 )--�ǰe�� X ���X�l
			WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass ���a���W��PID�M��
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --���a��^�_�c�ϡA���i�ϥ�"�������b"���X�СC
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1 , 168  )   --�����q��


		elseif PClass < 3 then
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_44]" , 0 ) 
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_44]" , 0 ) 
		end
	elseif Class == 4 then
		if PClass == 4 then
-------------------------------------------------2013.03.14 (6.0.0)�f����X�վ� ------------------------------------------------
			if PlayerLV >= 50 then
				Hao_Monetary_Union_240181(Player , 20)
			end
--------------------------------------------------------------------------------------------------------------------------------------		
-------------------------------------------------2011.08.22 �s�W�ٸ������P�_---------------------------------------------------
			if CountBodyItem( Player , 530087 ) < 1 then
				DebugMsg( Player , RoomID , "Get new title" )
				GiveBodyItem( Player , 530087 , 1 )
			else
				DebugMsg( Player , RoomID , "You already have the title." )
			end
--------------------------------------------------------------------------------------------------------------------------------------
--	Say(OwnerID(), "SPPASS3="..SPPASS )

			if SPPASS == 3333 then
				if Timecount >= (KEYTIME-180) then --�p�G�{�b���ɶ� �p�� ��ɰO�����ɶ�-3����

					GiveBodyItem( OwnerID() , 205791  , 1 )  

					ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_66]".."|r" , 0 ) --�S�O����F���I�ܱo�Q�����_�͡I
					ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_113120_MALA2_66]".. "|r" , 0 ) 

				end
			end


			AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
			SetPosByFlag( OwnerID() , 780309 , 14 )--�ǰe�� X ���X�l
			WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass ���a���W��PID�M��
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --���a��^�_�c�ϡA���i�ϥ�"�������b"���X�СC
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1 , 168  )   --�����q��



		elseif PClass < 4 then
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_44]" , 0 ) 
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_44]" , 0 ) 
		end
	end

	local PassOK = ReadRoleValue( TargetID() ,EM_RoleValue_Register+1 )  --�����q��?

	if PassOK == 168 then

		local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 );


		SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --�����

		AddToPartition( ffdeler , RoomID )  


		WriteRoleValue( ffdeler  , EM_RoleValue_Register , PlayerLV ) --�O���a����
		BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --�w���M���Ҧ��a�O

	end

end

function LuaYU_Mala2_leave()--�ڭn���}

	SetSpeakDetail( OwnerID(), "[SC_111813_YU_43]"   )  --�A�u���T�w�n���}�H���n�a�H�H���w��A�A�ӬD�ԡI�A�A�A�A��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GETTITLE_1]" , "LuaYU_Mala2_leaveOK", 0 ) --�T�w

end

function LuaYU_Mala2_leaveOK()

	CloseSpeak( OwnerID() )
	SetFlag( OwnerID()  , 542992 , 0 ) --���}���m�X��
	CancelBuff( OwnerID() ,502859 ); --�w��
	CancelBuff( OwnerID() ,503995 ); --�B�i�I��
	ChangeZone( OwnerID() , 2 , 0 , 4871.9, 104.9, -1885.2, 92)

end


function LuaYU_Mala2_JOKDEL()--���d�����ƺ���J

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_83]"   ) --���I���ա�˷R���_�I�̡H���D...�A�ާ@�����F�����ؼСA�S��k�~���o�H��A�A�A�A��n�ݲM���A�F���r��I

	AddSpeakOption( OwnerID(), TargetID(), "[SO_110989_1]" , "LuaYU_Mala2_leave", 0 ) --�ڷQ���
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_11]" , "LuaYU_Mala2_JOKDEL_01", 0 ) --��L��ĳ

end

function LuaYU_Mala2_JOKDEL_01()--���d�����ƺ���J��L��ĳ

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_82]"   ) --�A�A�A�A��p�G�A�O�]��<CM>�ɶ�����</CM>�F�A�Q�n�����X�h�}�_�c���ܡA�A�i�H�ϥ�<CM>[203030]</CM>...���O�p�G�A�S������...�A�A�A�A�㵹��<CM>3��[202903]</CM>�ڰ������A�ȥX�h�a�I

	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_13]" , "LuaYU_Mala2_JOKDEL_02", 0 ) --�F����ĳ

end

function LuaYU_Mala2_JOKDEL_02()--���d�����ƺ���J��L��ĳ
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )   -- 2013.04.19 �ɤW
	local transport =  CountBodyItem( OwnerID() , 202903 )    --�ǰe�̲Ť�
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )

	if transport >=3 then		

		CloseSpeak( OwnerID() )

		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_81]".. "|r" , 0 ) --�֥X�h�a
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_113120_MALA2_81]".. "|r" , 0 ) --�֥X�h�a
		sleep(10)


		AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
		SetPosByFlag( OwnerID() , 780309 , 14 )--�ǰe�� X ���X�l
		WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass ���a���W��PID�M��

		DelBodyItem( OwnerID() , 202903 , 3 )

		local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 );

		SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --�����

		AddToPartition( ffdeler , RoomID )  

		WriteRoleValue( ffdeler  , EM_RoleValue_Register , PlayerLV ) --�O���a����
		BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --�w���M���Ҧ��a�O

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --�A�ҫ������~�ƶq����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_JOKDEL_01", 0 ) --�^�W�@��

	end

end