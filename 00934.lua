function LuaI_101030_1_0()
	sleep(10)
	SetFightMode(  OwnerID() , 0, 0, 0, 0 )
	local Samogmad = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101219, 200 , 1)       --�ļ���
--	local Stone = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101030, 300 , 1)       --�۹�
	local Coolbo = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100044 , 200 , 1)             --���ü@����
	

	local PurpleID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register ) --�����_�c��id
	local RedID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 )  --�����_�c��id
	local StoneCow002  = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+6  )--�۹�ID

--	local Xstone = Stone[0]

	WriteRoleValue(Coolbo[0] ,EM_RoleValue_Register , StoneCow002  )                         --�۹�ID
	WriteRoleValue( Coolbo[0] , EM_RoleValue_Register+1 , PurpleID )       --�����_�c��id
	WriteRoleValue( Coolbo[0] , EM_RoleValue_Register+2 , RedID  )         --�����_�c��id

	Stonecow2 = CreateObjByFlag( 101222, 780097, 6 , 1 );             --�����E�������J

	Say( Samogmad[0], GetString("SC_101030_YU_02") )  --�}����
	sleep(20)
	PlayMotion( Samogmad[0], 115)                                  --��t�ʧ@ 
	sleep(20)
	CastSpell( Samogmad[0] , Samogmad[0], 491920)                                                                

	sleep(40)

--	Hide( Xstone ) 
--	Hide( Stone[0]) 

--	Delobj( Xstone )
	Delobj(  StoneCow002 )
	sleep(10)
	AddToPartition( Stonecow2 , 0) 

	WriteRoleValue( Stonecow2 , EM_RoleValue_Register+1  , Coolbo[0]  )   
	BeginPlot( Stonecow2 , "LuaI_101222_YU_0" , 0 )                                                   
	Delobj( Samogmad[0] )
end