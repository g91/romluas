------------
--���_�X�{
function lua_quest426029_0()
	if CountBodyItem( OwnerID(),242336 )>=1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Q426029_0]", 0 );
		--��q�V���t�Υ��b����B�@�ۡA�@�a��N��P����@�ѱj�P���������O�C
		return false
	end
end
function lua_quest426029_1()
	local pachi =121981
	local tmp = SearchRangeNPC( TargetID(),100 )	--�j�M�d��100����npc�s���Atmp�O�@��table
	--���B�n�i�� SearchRangeNPC
		for i=0,#tmp,1 do		
			if ReadRoleValue( tmp[i],EM_RoleValue_OrgID ) == pachi then	--orgid =�b��Ʈw�����s��
				CastSpell( TargetID(),tmp[i],850690 )
				break
			end
		end
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Q426029_1]", 0 );
	--�_�Ǫ��y��b��R����q���M�o�X���~�A�q�y�餤��������}�l�V�~�@�@�i�}�A�ܧΦ��@�Ӥp�p�����@�̼˻��C
		--���B���_�n�X�{
		if DelBodyItem( OwnerID(), 242336, 1 ) then
			SetFlag( OwnerID(), 547694 ,1 )		--���y���R��q
		end
		return 1	--���L���q"�A�S�����o�F��" ���T��
end
-----------
--���٥��Ȫ�t�ɡAOwnerID�Onpc
function lua_quest426030_1()--���_���}����
	--���ͩ��_
	local newpachi = 122000
	local x,y,z,dir = DW_Location( OwnerID() )	--���o�Ө���y��
	local obj =CreateObj( newpachi,x,y,z,dir,1 )	--�إ߷s����
		--�t�����⤣�i�Q�I���A��������������
		SetModeEx( obj  , EM_SetModeType_Mark, false )	 --�]�w���⪺�ݩʡGscript���ͪ�����O�L�k�Τu��]�w��
		--�t������n�������|�A�H�K�t���L�{����^�����I
		MoveToFlagEnabled( obj ,false )	--�����Ჾ�ʤ覡�|�۰��ܦ�����
		AddToPartition( obj,0 )			--�N������J�a��
		Say( obj, "[SC_Q426030_1(1)]" )	--�ءK�ءK���ڡA���W�^�ӡK
		--���_����
		LuaFunc_moveToFlag( obj,781205,1,0 )	--���� �X�l ID �d��
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_Q426030_1(2)]", 0 );--���_�n�n�̮̪����e�Ĩ�A�B��۷�Y�O�C
		--���B���_�n����
		--Sleep( 30 )
		DelObj( obj)
end

function lua_quest426030_2()
	if CheckFlag( OwnerID(),547696 )==true then	--�p�G�w�g��^[121986]
		DebugMsg( OwnerID() , 1, "������" )
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Q426030_2(2)]", 0 );--���e�����O���G�Q�������L�����A�}��B�W���i�a���C
	else
		--���
		DebugMsg( OwnerID() , 1, "1" )
		--�T���o��,�i���w�o�ܪ�,0 ���U�T��   1 ����-��   2 ����-��   3 �P�ɨq2�M0
		--���ȱ���/����(����t�Φr)�|�P���r�۽ĦӵL�k���
		--�۽��ܳq�覡���G
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Q426030_2(1)]", C_YELLOW );--�V�|�I[121986]�}�H�����鱲���@��ᦱ�۽��b�a�W�A�ݨӬO�b�ĥX�h��P��ɳQ���b���ު���������̤@�}��󪺡I
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_Q426030_2(1)]", 0 );--���U�ؤ]���
		DebugMsg( OwnerID() , 1, "2" )
		GiveBodyItem( OwnerID(), 242230, 1 )
		DebugMsg( OwnerID() , 1, "���쪫�~" )
	end
	return 1
end

-----------
-----------
function lua_quest426031_0()
	--�]�w�Ө��⪺�d��@��(���b���󲣥ͼ@����)
	SetPlot( OwnerID() ,"Range" , "lua_quest426031_1" , 50 )
	DebugMsg( OwnerID() , 1, "�a��" )
	
	
End
function lua_quest426031_1()
	DebugMsg( OwnerID() , 1, "�}�l" )

	if CheckAcceptQuest( OwnerID(),426031 ) ==true then	--�p�G������
		--if CheckFlag( OwnerID(),547697 )==true then	--�p�G�w�����q���
		if CountBodyItem( OwnerID(),242335 )>=1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Q426031_1(2)]", 0 );--�b�Q���q�Ķ��̵o�{�e�������}�a�C
			DebugMsg( OwnerID() , 1, "�����q���" )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Q426031_1(1)]", 0 );--�t�d�Ķ��q��ƪ����@�̥��B�b���ת��A�A�X�o�Ӿ��|�������������W���귽�C
			Sleep(20)
			DebugMsg( OwnerID() , 1, "�L���q���" )
			--SetFlag( OwnerID(), 547697 ,1 )	--���o���q���
			GiveBodyItem( OwnerID(), 242335, 1 )
			DebugMsg( OwnerID() , 1, "�����~" )
		end
	--	LoadQuestOption(OwnerID())
	end
end
--���٥��Ȫ�t�ɡAOwnerID�Onpc
function lua_quest426031_2()--���d���D�d�����}����
	--���ͼ��d��
	local newmo= 122001
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newmo,x,y,z,dir,1 )
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		--�t������n�������|�A�H�K�t���L�{����^�����I
		DebugMsg( OwnerID() , 1, "�إ�" )
		MoveToFlagEnabled( obj ,false )	--�����Ჾ�ʤ覡�|�۰��ܦ�����
		AddToPartition( obj,0 )			--�N������J�a��
		DebugMsg( OwnerID() , 1, "�����a" )
		LuaFunc_moveToFlag( obj,781205,2,0 )	--���� �X�l ID �d��
		DebugMsg( OwnerID() , 1, "881" )
		DelObj( obj)
end

-----------
---��ܼ@���A��ܳ��O���b���a���W
function lua_Z25Q121979_SZ()--�N���_�浹���d���D�d��
	LoadQuestOption( OwnerID() )--���J���ȭ��O
	if CheckAcceptQuest( OwnerID(),426030 )==true and CountBodyItem( OwnerID(),242230 )==1 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_423034_5]","lua_Z25Q121979_1",0)	--��ܿﶵ�G�A���o�{����u���ܡH
	end
end
function lua_Z25Q121979_1()
	CloseSpeak( OwnerID())--�������O
	DelBodyItem( OwnerID(),242230,1 )
	SetFlag( OwnerID(),547696,1)
	Tell( TargetID(),OwnerID(),"[SC_Z25Q121979_1]" )--�����ܡG[$playername]�A���ڭ̬ݬݧA���F����u���C
end 



function lua_Z25_man_test()

	--SetPlot( OwnerID() ,"touch" , "lua_Z25_man_test_touch" , 50 )
	SetPlot( OwnerID() ,"Range" , "lua_Z25_man_test_Range" , 50 )
	DebugMsg( OwnerID() , 1, "���չ��&�ʧ@��" )

	
end
function lua_Z25_man_test_touch_1()
--	local roomid =ReadRoleValue( OwnerID(), EM_RoleValue_RoomID)
--	Show( OwnerID(), roomid ) 
	SetModeEx( OwnerID(), EM_SetModeType_Show, TRUE )

end

function lua_Z25_man_test_touch_2()

	LuaP_RidingBlackHouse(OwnerID)

end

function lua_Z25_man_test_touch_3()

	DW_CancelTypeBuff(68,OwnerID())
	Sleep(20)
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )

end


function lua_Z25_man_test_Range()
	Tell( TargetID(),OwnerID(),"[SC_Z25Q121979_1]" )--�����ܡG[$playername]�A���ڭ̬ݬݧA���F����u���C	

end

