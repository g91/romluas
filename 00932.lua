function LuaI_101030_0_0()
	sleep(10)
	SetFightMode(  OwnerID() , 0, 0, 0, 0 )
	local Samogmad = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101219, 200 , 1)       --�ļ���
--	local Stone = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101030, 300 , 1)       --�۹�
	local Golu = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101028, 200 , 1)       --���é�
	local StoneMaker = LuaFunc_SearchNPCbyOrgID( Golu[0] , 101054 , 200 , 1)             --���ü@����

	local PurpleID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register ) --�����_�c��id
	local RedID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 )  --�����_�c��id
	local StoneCow001  = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+5  ) --�۹�ID
	
--	local Xstone = Stone[0]

	WriteRoleValue( Golu[0] ,EM_RoleValue_Register , StoneCow001  )                         --�۹�ID
	WriteRoleValue( Golu[0] , EM_RoleValue_Register+1 , PurpleID )       --�����_�c��id
	WriteRoleValue( Golu[0] , EM_RoleValue_Register+2 , RedID  )         --�����_�c��id

	Stonecow1 = CreateObjByFlag( 101023, 780097, 5 , 1 );            --�U�S�E�������J

	Say( Samogmad[0], GetString("SC_101030_YU_01") )  --�}����
	sleep(20)
	PlayMotion( Samogmad[0], 115)                                  --��t�ʧ@ 
	sleep(20)
	CastSpell( Samogmad[0] , Samogmad[0], 491920)       
 
	sleep(40)  

--	Hide( Xstone ) 
--	Hide( Stone[0]) 
--	Delobj( Xstone )
	Delobj(  StoneCow001 )
	sleep(10)
	AddToPartition( Stonecow1 , 0) 

	WriteRoleValue( Stonecow1 , EM_RoleValue_Register+1  , Golu[0]  )   
	BeginPlot( Stonecow1 , "LuaI_101023_YU_0" , 0 )                                    
	Delobj( Samogmad[0] )
end