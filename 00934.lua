function LuaI_101030_1_0()
	sleep(10)
	SetFightMode(  OwnerID() , 0, 0, 0, 0 )
	local Samogmad = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101219, 200 , 1)       --薩摩格
--	local Stone = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101030, 300 , 1)       --石像
	local Coolbo = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100044 , 200 , 1)             --隱藏劇情怪
	

	local PurpleID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register ) --紫色寶箱的id
	local RedID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 )  --紅色寶箱的id
	local StoneCow002  = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+6  )--石像ID

--	local Xstone = Stone[0]

	WriteRoleValue(Coolbo[0] ,EM_RoleValue_Register , StoneCow002  )                         --石像ID
	WriteRoleValue( Coolbo[0] , EM_RoleValue_Register+1 , PurpleID )       --紫色寶箱的id
	WriteRoleValue( Coolbo[0] , EM_RoleValue_Register+2 , RedID  )         --紅色寶箱的id

	Stonecow2 = CreateObjByFlag( 101222, 780097, 6 , 1 );             --里昂‧賓普斯克

	Say( Samogmad[0], GetString("SC_101030_YU_02") )  --開場白
	sleep(20)
	PlayMotion( Samogmad[0], 115)                                  --表演動作 
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