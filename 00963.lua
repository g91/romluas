function yuyu_111575flag_00()      
	local Owner = OwnerID()           --�p�w�g                        
	SetPlot( Owner,"touch","yuyu_111575flag_01",40 )
	ScriptMessage(Owner , 0 , 1 , "[SC_111575_FLAG_6]" , C_SYSTEM )
	Say( Owner , "[SC_111575_FLAG_6]" )  
end

function yuyu_111575flag_01()  
	local Owner = OwnerID() --���a
	local Target = TargetID() --�p�w�g
	local Softsweets01 =  CountBodyItem( Owner , 203138 )   --����
	local Softsweets02 =  CountBodyItem( Owner , 203139 )   --���q
	local Softsweets03 =  CountBodyItem( Owner , 203140 )   --�_��
	local Softsweets = Softsweets01 + Softsweets02 + Softsweets03
	local room = ReadRoleValue(Target, EM_RoleValue_RoomID )
	SetPlot( Target ,"touch", " "  ,40 )
	AdjustFaceDir(Target, Owner, 0 )   --�w�g��V���缾�a

	sleep(10)
	PlayMotion( Target, 122)                                  --��t�ʧ@ 122�N�� idle03

	ScriptMessage(Target , 0 , 1 , "[SC_TRICK_OR_TREAT]" , C_SYSTEM ) --�����}�A�N�o�J�I
	Say( Target , "[SC_TRICK_OR_TREAT]" )  --�����}�A�N�o�J�I

	sleep(20)

	if Softsweets > 0 then --�ˬd���W���n�}
		tell( Owner ,Target, "[SC_111575_FLAG_0]" )   --�K�y   ���ܤH,�o�ܤH,string
		ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_0]" , C_SYSTEM ) --�H��z��A���]�]�̭����n�}�C��ڬݬݳo�Ӧn���n�Y��
	else --���W�S���n�}
		tell(Owner,Target, "[SC_111575_FLAG_4]" )   
		ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_4]" , C_SYSTEM ) --�Q�M�ڪ��n���h���U��ϧ�کj�j�p�w�R�r�I�q��ڭn�o�J�I
		sleep(20)
		CastSpell( Target, Owner, 491983)
		sleep(30)
		BeginPlot( Target , "Lua_na_littleAnn_position" , 0 ) --���ͷs���p�w�g
		return
	end

	sleep(20)
	PlayMotion( Target, 120)                                  --��t�ʧ@ 120�N�� idle02

	if Softsweets01 > 0 then
		sleep(20)
		tell(Owner,Target, "[SC_111575_FLAG_1]" )   --�K�y   ���ܤH,�o�ܤH,string
		ScriptMessage(Target , Owner  , 1 , "[SC_111575_FLAG_1]" , C_SYSTEM ) 	--�z��n�n�Y��I�n�Φn�ΡI�n���Ū��n�}�I�H�㨺��o��§���N���A�o��

		if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then			
			DelBodyItem( Owner , 203138 , 1 )
			GiveBodyItem( Owner , 203142  , 1 )   --�ݭn�ӫ��_�ͪ�§��
		else
			sleep(10)
			tell(Owner,Target, "[SC_111575_FLAG_5]" )   
			ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_5]" , C_SYSTEM )  --���H�a�Q�h�e�A�@�ӪF��i�O�A���]�]�S����m�F�ա�
		end

	elseif  Softsweets02 > 0 then
		sleep(20)
		tell(Owner,Target, "[SC_111575_FLAG_2]" )   
		ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_2]" , C_SYSTEM ) 	--�H����D�٤����A����N���A�o�Ӥp§���a�I

		if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then			
			DelBodyItem( Owner , 203139 , 1 )
			GiveBodyItem( Owner , 203141  , 1 )  --���q§��
		else
			sleep(10)
			tell(Owner,Target, "[SC_111575_FLAG_5]" )   
			ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_5]" , C_SYSTEM ) 	--���H�a�Q�h�e�A�@�ӪF��i�O�A���]�]�S����m�F�ա�
		end

	elseif  Softsweets03 > 0 then
		sleep(20)
		tell(Owner,Target, "[SC_111575_FLAG_3]" )   
		ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_3]" , C_SYSTEM )  --�q��n���n�ġ�o�O����_�Ǫ��n�}�I���n�ۭt�ڡ����x...���L���Y���Ӳ������H
		CastSpell( Target, Owner, 491983)
		sleep(30)

		if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then			
			DelBodyItem( Owner , 203140 , 1 )
			GiveBodyItem( Owner , 203240 , 1 )  --�ɵ��Ĥ�
		else
			sleep(10)
			tell(Owner,Target, "[SC_111575_FLAG_5]" )   
			ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_5]" , C_SYSTEM )  ----���H�a�Q�h�e�A�@�ӪF��i�O�A���]�]�S����m�F�ա�
		end
	end
	sleep(20)
	BeginPlot( Target , "Lua_na_littleAnn_position" , 0 ) --���ͷs���p�w�g
end



function Lua_na_littleAnn_position()
	local Owner = OwnerID()
	local Z = Rand( 35)  --0~34 �H���X�Хέ�
	local Reg = ReadRoleValue( Owner , EM_RoleValue_Register)  --Ū���p�w�g�ثe����m
	local room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	if Z == Reg then
		Z = Z+1 
		if Z > 34 then  --�p�GZ=35�A�X�Хu��34�A�ҥH�N�X�и��g��0 
			Z = 0
		end
	elseif Z == 6 then
		if Reg ~= 7 then
			Z = 7;
		else
			Z = 8;
		end
	end

	local CCC= CreateObjByFlag( 101296, 780198 , Z , 1 )
	AddToPartition( CCC , room )                                                             
	WriteRoleValue( CCC, EM_RoleValue_Register , Z ) --�g�i�ثe����m
	WriteRoleValue( CCC, EM_RoleValue_PID , 0 ) --�i�H���ʪ��}��
	local RegNew = ReadRoleValue( CCC , EM_RoleValue_Register)
	DebugMsg( 0,0,"Ann's Reg = " ..RegNew)
	Delobj( Owner )
end