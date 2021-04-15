function LuaYU_101340_0() 
--1216OK
	DebugMsg(0,0,"--LuaYU_101340_0--");
	local ROOM = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Fighter1 = CreateObjByFlag( 101411, 780202, 18 , 1 );            --ĵ�ƶ���
	AddToPartition( Fighter1 , ROOM) 
	WriteRoleValue( Fighter1 , EM_RoleValue_PID , OwnerID() )   
	BeginPlot( Fighter1 , "LuaYU_101340_00" , 0 )  
	local Fighter2 = CreateObjByFlag( 101411, 780202, 19 , 1 );            --ĵ�ƶ���
	AddToPartition( Fighter2 , ROOM) 
	WriteRoleValue( Fighter2 , EM_RoleValue_PID , OwnerID() )   
	BeginPlot( Fighter2 , "LuaYU_101340_00" , 0 )  
	local Fighter3 = CreateObjByFlag( 101411, 780202, 20 , 1 );            --ĵ�ƶ���
	AddToPartition( Fighter3 , ROOM ) 
	WriteRoleValue( Fighter3 , EM_RoleValue_PID , OwnerID() )   
	BeginPlot( Fighter3 , "LuaYU_101340_00" , 0 )  

	SetPlot( Fighter1  , "dead","LuaYU_101340_02",0 )    
	SetPlot( Fighter2  , "dead","LuaYU_101340_02",0 )    
	SetPlot( Fighter3  , "dead","LuaYU_101340_02",0 )    


	local Bank1 = CreateObjByFlag( 110579, 780202, 21 , 1 );            --�Ȧ���
	AddToPartition( Bank1 , ROOM) 
	BeginPlot( Bank1 , "Sys_Bank_Auto" , 0 )  
	local Bank2 = CreateObjByFlag( 110579, 780202, 22 , 1 );            --�Ȧ���
	AddToPartition( Bank2 , ROOM) 
	BeginPlot( Bank2 , "Sys_Bank_Auto" , 0 )  
	local Bank3 = CreateObjByFlag( 110579, 780202, 23 , 1 );            --�Ȧ���
	AddToPartition( Bank3 , ROOM) 
	BeginPlot( Bank3 , "Sys_Bank_Auto" , 0 )  
	local Bank4 = CreateObjByFlag( 110579, 780202, 24 , 1 );            --�Ȧ���
	AddToPartition( Bank4 , ROOM) 
	BeginPlot( Bank4 , "Sys_Bank_Auto" , 0 )  
	local Bank5 = CreateObjByFlag( 110023, 780202, 25 , 1 );            --�Ȧ���Y
	AddToPartition( Bank5 , ROOM) 
	local Bank6 = CreateObjByFlag( 110579, 780202, 26 , 1 );            --�Ȧ���
	AddToPartition( Bank6 , ROOM) 
	BeginPlot( Bank6 , "Sys_Bank_Auto" , 0 )  
	local Bank7 = CreateObjByFlag( 110579, 780202, 27 , 1 );            --�Ȧ���
	AddToPartition( Bank7 , ROOM) 
	BeginPlot( Bank7 , "Sys_Bank_Auto" , 0 )  

	----------------------------------------------�۰ʰ����Ұʬ��ʻP�_	140425 K.J. Aris
	--�Q�έ����L��NPC���˥�
	local _dummyID = CreateObjByFlag( 101340, 780202, 4 , 1 );            --�x�V�����L��
	AddToPartition( _dummyID , ROOM);--�إ߼˥� 
	local _activityCheck = ( _dummyID ~= nil ) and CheckID( _dummyID ) or false;--���ʥ��}��  ��NPC�L�k�ϥ� ��ID���L��  �]��  �H�����̾�  �P�_���ʶ}�һP�_
	DelObj( _dummyID );--�R���˥�
	DebugMsg( 0 , 0 , "Christmas Activity Activated : "..tostring(_activityCheck) );
	-------------------------------END----------�۰ʰ����Ұʬ��ʻP�_	140425 K.J. Aris

--	while true do
	while _activityCheck do--���ʥ��}�Ү�  �����次�ʾ��� Note : ���վ���]�N�Q���� 140425
		sleep(30)
--		SAY( OwnerID() , GetSystime(2) )
		local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID  ) 
		--DebugMsg( 0 , 0 , "Christmas Activity Checking Loop : "..tostring(_activityCheck) );

	--	if LD == 5 then  --�x�V�`���ʥ��}��ɶ}�o�@�q, �פU���@��
		if (GetSystime(2) == 0) or (LD == 5) then    -- �x�V�`�n�}��� �ݶ}�ҳo�q. �פW�����@�q 
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )   
			sleep(10)

			local GOBO = CreateObjByFlag( 101340, 780202, 4 , 1 );            --�x�V�����L��

			SetModeEx( GOBO  , EM_SetModeType_Strikback, false )--����
			SetModeEx( GOBO  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( GOBO , EM_SetModeType_Fight , false )--�i�������

			AddToPartition( GOBO , ROOM) 	

--			SetPlot( GOBO  , "dead","LuaYU_101340_1",0 )                              --���`�@��

			WriteRoleValue( GOBO , EM_RoleValue_PID , OwnerID() )   
			WriteRoleValue( GOBO,EM_RoleValue_Register , Fighter1 )
			WriteRoleValue( GOBO,EM_RoleValue_Register+1 , Fighter2  )
			WriteRoleValue( GOBO,EM_RoleValue_Register+2 , Fighter3  )


			MoveToFlagEnabled( GOBO , false )
			sleep(10)
			WriteRoleValue(GOBO ,EM_RoleValue_IsWalk , 0 ) 	   --�b�]
			LuaFunc_MoveToFlag( GOBO, 780202 , 33 , 0 )	
			sleep(10)
			AdjustFaceDir(GOBO, Fighter3 , 180 ) --���V
			Say( GOBO , "|cffff00ff" .. GetString("SC_YU_101340_11")  .. "|r")  --�n�h�]�_
			PlayMotion( GOBO , 85 ) 
			sleep(40)
			LuaFunc_MoveToFlag( GOBO, 780202 , 28, 0 )	
			PlayMotion( GOBO , 85 ) 
			sleep(20)
			AdjustFaceDir(GOBO, Fighter3 , 0 ) --���V
			ScriptMessage( GOBO , 0 , 1 , GetString("SC_YU_101340_02") , C_Default ) --�j�a�n�I�x�V�`�ּ֡I���O�{�b�O�m�T��I�k���k�k�w�b��W�A���¡I
			Say( GOBO , GetString("SC_YU_101340_02") )  	
			sleep(10)
			PlayMotion( GOBO , 88 ) 								
			Say( Bank1 , GetString("SC_YU_101340_03") ) --�ڰڡ�m�T�r���
			PlayMotion( Bank1, 107)      
			Say( Bank2 , GetString("SC_YU_101340_03"))  --�ڰڡ�m�T�r���
			PlayMotion( Bank2, 107)     
			Say( Bank3 , GetString("SC_YU_101340_03") ) --�ڰڡ�m�T�r���
			PlayMotion( Bank3, 107)     
			Say( Bank4 , GetString("SC_YU_101340_03"))  --�ڰڡ�m�T�r���
			PlayMotion( Bank4, 107)     
			Say( Bank5 , GetString("SC_YU_101340_03") ) --�ڰڡ�m�T�r���
			PlayMotion( Bank5, 113)     
			Say( Bank6 , GetString("SC_YU_101340_03"))  --�ڰڡ�m�T�r���
			PlayMotion( Bank6, 107)     
			Say( Bank7 , GetString("SC_YU_101340_03"))  --�ڰڡ�m�T�r���
			PlayMotion( Bank7, 107)     
			sleep(20)
			BeginPlot( Bank1 , "LuaP_Dead" , 0 )   
			BeginPlot( Bank2 , "LuaP_Dead" , 0 )   
			BeginPlot( Bank3 , "LuaP_Dead" , 0 )   
			BeginPlot( Bank4 , "LuaP_Dead" , 0 )   
			BeginPlot( Bank5 , "LuaP_Dead" , 0 )   
			BeginPlot( Bank6 , "LuaP_Dead" , 0 )   
			BeginPlot( Bank7 , "LuaP_Dead" , 0 )   
			sleep(20)
			SetPlot(  Bank1 , "touch","",0 )
			SetPlot(  Bank2 , "touch","",0 )
			SetPlot(  Bank3 , "touch","",0 )
			SetPlot(  Bank4 , "touch","",0 )
			SetPlot(  Bank5 , "touch","",0 )
			SetPlot(  Bank6 , "touch","",0 )
			SetPlot(  Bank7 , "touch","",0 )


			Delobj( Bank1)
			Delobj( Bank2)
			Delobj( Bank3)
			Delobj( Bank4)
			Delobj( Bank5)
			Delobj( Bank6)
			Delobj( Bank7)

			if ZoneID == 2 then
				RunningMsg( OwnerID() , 2 ,  GetString("SC_YU_101340_01") ) --�Z��R����ĵ�ƶ��q���A�ثe���ƦW��{���b�m�T�Z��R���Ȧ�A�ШD�ߧY�䴩�I
			end

			LuaFunc_MoveToFlag( GOBO, 780202 , 29 , 0 )	

			SetModeEx( GOBO  , EM_SetModeType_Strikback, true )--����
			SetModeEx( GOBO  , EM_SetModeType_Searchenemy, true )--����
			SetModeEx( GOBO , EM_SetModeType_Fight , true )--�i�������

			SetAttack( GOBO , Fighter3  )

			SetAttack( Fighter1 , GOBO  )
			SetAttack( Fighter2 , GOBO  )
			SetAttack( Fighter3 , GOBO  )
			break
		end
	end

end

function LuaYU_101340_1()
	local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
	local Fighter1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register )                      
	local Fighter2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	local Fighter3 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )  

	SetStopAttack( OwnerID() )

	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������

	WriteRoleValue( OwnerID(), EM_RoleValue_PID , LD )   
	WriteRoleValue( OwnerID(),EM_RoleValue_Register , Fighter1 )
	WriteRoleValue( OwnerID(),EM_RoleValue_Register+1 , Fighter2  )
	WriteRoleValue( OwnerID(),EM_RoleValue_Register+2 , Fighter3  )
	BeginPlot( OwnerID() , "LuaYU_101340_2" , 0 ) 
	BeginPlot( OwnerID() , "LuaYU_101340_2_Check" , 500 ) 
	return false
end

function LuaYU_101340_2_Check()
	DebugMsg(0,0,"--LuaYU_101340_2_Check--")
	local Fighter1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local LD = ReadRoleValue( Fighter1 , EM_RoleValue_PID  ) 
	WriteRoleValue( LD, EM_RoleValue_PID , 0 )   
	BeginPlot( LD , "LuaYU_101340_0" , 0 )  
	Delobj( OwnerID() )
end

function LuaYU_101340_2()

	local Fighter1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register )                      
	local Fighter2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	local Fighter3 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )  

	local LD = ReadRoleValue( Fighter1 , EM_RoleValue_PID  ) 

	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 	   --�b�]
	LuaFunc_MoveToFlag( OwnerID() , 780202 , 0 , 0 )
	SetStopAttack( Fighter1 )  --�������
	SetStopAttack( Fighter2 )  --�������
	SetStopAttack( Fighter3 )  --�������

	SetFightMode(Fighter1 , 0, 1, 0, 0 )
	SetFightMode(Fighter2 , 0, 1, 0, 0 )
	SetFightMode(Fighter3 , 0, 1, 0, 0 )
	sleep(10)
	BeginPlot( Fighter1 , "LuaYU_101340_17" , 0 )  
	BeginPlot( Fighter2 , "LuaYU_101340_18" , 0 )  
	BeginPlot( Fighter3 , "LuaYU_101340_19" , 0 )  	
	sleep(10)
	AdjustFaceDir(OwnerID(), Fighter1 , 0 ) --���V
	sleep(10)
	AdjustFaceDir(OwnerID(), Fighter2 , 0 ) --���V
	sleep(10)
	AdjustFaceDir(OwnerID(), LD , 0 ) --���V
	sleep(10)
	Say( OwnerID() , "|cffff00ff" .. GetString("SC_YU_101340_04" ) .. "|r" )  --�i�c...�Q�]��F�I
	sleep(10)	
	ScriptMessage( OwnerID() , 0 , 1 , GetString("SC_YU_101340_05") , C_Default ) --ť�ۡI�ڥi�n�X�ڳ̲׷��L�Ī��������ۡI
	Say( OwnerID() , "|cffff00ff" .. GetString("SC_YU_101340_05")  .. "|r")  
	sleep(10)	
	ScriptMessage( OwnerID() , 0 , 1 , GetString("SC_YU_101340_06") , C_Default ) --�����I�|�������I
	Say( OwnerID() , "|cffff00ff" .. GetString("SC_YU_101340_06") .. "|r" )  
	sleep(10)	
	SetStopAttack( OwnerID() )  --�������	
	CastSpell( OwnerID(), OwnerID(), 492165) --�|������
	sleep(10)	
	ScriptMessage( OwnerID() , 0 , 1 , GetString("SC_YU_101340_12") , C_Default ) --BYE BYE
	Say( OwnerID() , "|cffff00ff" .. GetString("SC_YU_101340_12")  .. "|r")  
	sleep(20)
	BeginPlot( OwnerID() , "LuaYU_101340_3" , 0 )  
	sleep(10)
	BeginPlot( OwnerID() , "LuaYU_101340_3" , 0 )  	
	sleep(15)
	ScriptMessage( OwnerID() , 0 , 1 , GetString("SC_YU_101340_07") , C_SYSTEM ) --�ڡI�ܦ��p�����k�]�F�I���������L�̡I


	SetStopAttack( Fighter1 ) 
	SetStopAttack( Fighter2 ) 
	SetStopAttack( Fighter3 ) 
	SetFightMode(  Fighter1  , 0, 1, 0, 0 )
	SetFightMode(  Fighter2  , 0, 1, 0, 0 )
	SetFightMode(  Fighter3  , 0, 1, 0, 0 )

	LuaFunc_MoveToFlag( OwnerID(), 780202 , 8 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 1 , 0 )
	sleep(10)
	Hide( OwnerID() )
	sleep(200)

	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID  ) 



	if ZoneID == 2 then
		RunningMsg( OwnerID() , 2 ,  GetString("SC_YU_101340_09") ) --����
	end


	Show(OwnerID(),0)
	WriteRoleValue( LD, EM_RoleValue_PID , 0 )   
	BeginPlot( LD , "LuaYU_101340_0" , 0 )  
	Delobj( OwnerID() )

end

function LuaYU_101340_3()
	local ROOM = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local GB01 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB01 , ROOM) 
	BeginPlot( GB01 , "LuaYU_101340_4" , 0 )  
	SetFightMode(GB01 , 0, 1, 0, 0 )

	local GB02 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB02 , ROOM) 
	BeginPlot( GB02 , "LuaYU_101340_5" , 0 )  
	SetFightMode(GB02 , 0, 1, 0, 0 )

	local GB03 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB03 , ROOM) 
	BeginPlot( GB03 , "LuaYU_101340_6" , 0 )  
	SetFightMode(GB03 , 0, 1, 0, 0 )

	local GB04 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB04 , ROOM) 
	BeginPlot( GB04 , "LuaYU_101340_7" , 0 )  
	SetFightMode(GB04 , 0, 1, 0, 0 )

	local GB05 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB05 , ROOM) 
	BeginPlot( GB05 , "LuaYU_101340_8" , 0 )  
	SetFightMode(GB05 , 0, 1, 0, 0 )

	local GB06 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB06 , ROOM) 
	BeginPlot( GB06 , "LuaYU_101340_5" , 0 )  
	SetFightMode(GB06 , 0, 1, 0, 0 )

	local GB07 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB07 , ROOM) 
	BeginPlot( GB07 , "LuaYU_101340_10" , 0 )  
	SetFightMode(GB07 , 0, 1, 0, 0 )

	local GB08 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB08 , ROOM) 
	BeginPlot( GB08 , "LuaYU_101340_11" , 0 )  
	SetFightMode(GB08 , 0, 1, 0, 0 )

	local GB09 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB09 , ROOM) 
	BeginPlot( GB09 , "LuaYU_101340_12" , 0 )  
	SetFightMode(GB09 , 0, 1, 0, 0 )

	local GB10 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB10 , ROOM) 
	BeginPlot( GB10 , "LuaYU_101340_13" , 0 )  
	SetFightMode(GB10 , 0, 1, 0, 0 )

	local GB11 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB11 , ROOM) 
	BeginPlot( GB11 , "LuaYU_101340_14" , 0 )  
	SetFightMode(GB11 , 0, 1, 0, 0 )

	local GB12 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB12 , ROOM) 
	BeginPlot( GB12 , "LuaYU_101340_15" , 0 )  
	SetFightMode(GB12 , 0, 1, 0, 0 )
	
	local GB13 = CreateObjByFlag( 101341, 780202, 0 , 1 )
	AddToPartition( GB13 , ROOM) 
	BeginPlot( GB13 , "LuaYU_101340_16" , 0 )  
	SetFightMode(GB13 , 0, 1, 0, 0 )




end

--1
function LuaYU_101340_4()
	SetPlot( OwnerID(),"touch","LuaYU_101340_4_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 5 , 0 )	
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 1 , 0 )
	Delobj( OwnerID() )	
end

function LuaYU_101340_4_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )   --���r�r��Q�e��F...
	GiveBodyItem( OwnerID() , 203471  , 1 ) --�B�ڳU
	Delobj( TargetID() )

end
--2
function LuaYU_101340_5()
	SetPlot( OwnerID(),"touch","LuaYU_101340_5_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 6 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 1 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_5_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") ) 
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--3
function LuaYU_101340_6()
	SetPlot( OwnerID(),"touch","LuaYU_101340_6_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 7 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 1 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_6_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )  
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--4
function LuaYU_101340_7()
	SetPlot( OwnerID(),"touch","LuaYU_101340_7_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 8 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 1 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_7_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )   
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--5
function LuaYU_101340_8()
	SetPlot( OwnerID(),"touch","LuaYU_101340_8_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 9 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 2 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_8_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )  
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--6
function LuaYU_101340_9()
	SetPlot( OwnerID(),"touch","LuaYU_101340_9_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 10 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 2 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_9_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )  
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--7
function LuaYU_101340_10()
	SetPlot( OwnerID(),"touch","LuaYU_101340_10_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 11 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 2 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_10_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )   
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--8
function LuaYU_101340_11()
	SetPlot( OwnerID(),"touch","LuaYU_101340_11_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 12 , 0 )	
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 3 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_11_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") ) 
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--9
function LuaYU_101340_12()
	SetPlot( OwnerID(),"touch","LuaYU_101340_12_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 13 , 0 )	
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 3 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_12_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )  
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--10
function LuaYU_101340_13()
	SetPlot( OwnerID(),"touch","LuaYU_101340_13_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 14 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 15 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 4 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_13_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )   
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--11
function LuaYU_101340_14()
	SetPlot( OwnerID(),"touch","LuaYU_101340_14_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 14 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 16 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 4 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_14_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )  
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end
--12
function LuaYU_101340_15()
	SetPlot( OwnerID(),"touch","LuaYU_101340_15_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 14 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 17 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 4 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_15_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )  
	GiveBodyItem( OwnerID() , 203471  , 1 )
	Delobj( TargetID() )

end
--13
function LuaYU_101340_16()
	SetPlot( OwnerID(),"touch","LuaYU_101340_16_1",20 )
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 19 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 3 , 0 )
	Delobj( OwnerID() )
end

function LuaYU_101340_16_1()

	SetPlot( OwnerID(),"touch","",0 )
	Say( TargetID() , GetString("SC_YU_101340_08") )  
	GiveBodyItem( OwnerID() , 203471  , 1 ) 
	Delobj( TargetID() )

end

--ĵ��

function LuaYU_101340_17()
	local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 31 , 0 )
	AdjustFaceDir(OwnerID(), LD , -45 ) --���V
	sleep(110)
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 7 , 0 )	
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 1 , 0 )
	sleep(10)	
	Delobj( OwnerID() )

end
function LuaYU_101340_18()
	local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 32 , 0 )
	AdjustFaceDir(OwnerID(), LD , 45 ) --���V
	sleep(110)
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 10 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 2 , 0 )
	Delobj( OwnerID() )
end
function LuaYU_101340_19()
	local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
	MoveToFlagEnabled( OwnerID() , false )
	sleep(5)	
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 30 , 0 )
	AdjustFaceDir(OwnerID(), LD , 180 ) --���V
	sleep(110)
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 14 , 0 )
	LuaFunc_MoveToFlag( OwnerID(), 780202 , 3 , 0 )
	Delobj( OwnerID() )
end

--�S��@��Ĳ�o

function LuaYU_101340_00() 

	SetCursorType( OwnerID() , 1)
	SetPlot( OwnerID(),"touch","LuaYU_101340_01",50 )

end

function LuaYU_101340_01()

	local KEY =  CountBodyItem( OwnerID() , 203477 )  --�S��@��Ĳ�o�_��
	local Cash =  CountBodyItem( OwnerID() , 203471 )  --�B�ڳU
	local KeyMan = ReadRoleValue( TargetID() , EM_RoleValue_PID  )  
	local KEYON = ReadRoleValue( KeyMan , EM_RoleValue_PID  )  
	local Q = 100
	local S = Rand( Q ) 

   	if Cash >= 1 and KEYON == 0 then
		If S >= 75 then --25%
			DelBodyItem( OwnerID() , 203471 , 1 )
			GiveBodyItem( OwnerID() , 203472  , 1 )   --��
			ScriptMessage( TargetID() , OwnerID() , 1 , GetString("SC_YU_101340_10") , C_SYSTEM ) --�P��
		elseif S < 75 and S >= 35 then --40%
			DelBodyItem( OwnerID() , 203471 , 1 )
			GiveBodyItem( OwnerID() , 203473  , 1 )   --��
			ScriptMessage( TargetID() , OwnerID() , 1 , GetString("SC_YU_101340_10") , C_SYSTEM ) --�P��
		else
			DelBodyItem( OwnerID() , 203471 , 1 )
			GiveBodyItem( OwnerID() , 203474  , 1 )   --��
			ScriptMessage( TargetID() , OwnerID() , 1 , GetString("SC_YU_101340_10") , C_SYSTEM ) --�P��
		end
	end


	if KEY >= 1 and KEYON == 0 then	

		WriteRoleValue( KeyMan , EM_RoleValue_PID , 5 )   
	--	Say( TargetID() , 5 )  	
	elseif KEY >= 1 and KEYON == 5 then

		WriteRoleValue( KeyMan , EM_RoleValue_PID , 5 )   
	--	Say( TargetID() , 5 )  

	elseif KEY >= 1 and KEYON == 1 then	
		Say( TargetID() , GetString("SC_YU_101340_00") )  	--�ڭ̥��b����԰ȡC
	else
		Say( TargetID() , GetString("SC_YU_101340_00") )  	--�ڭ̥��b����԰ȡC
	end

end

function LuaYU_101340_02() 

	return false

end