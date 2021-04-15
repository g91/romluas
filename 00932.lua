function LuaI_101030_0_0()
	sleep(10)
	SetFightMode(  OwnerID() , 0, 0, 0, 0 )
	local Samogmad = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101219, 200 , 1)       --薩摩格
--	local Stone = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101030, 300 , 1)       --石像
	local Golu = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101028, 200 , 1)       --隱藏怪
	local StoneMaker = LuaFunc_SearchNPCbyOrgID( Golu[0] , 101054 , 200 , 1)             --隱藏劇情怪

	local PurpleID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register ) --紫色寶箱的id
	local RedID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 )  --紅色寶箱的id
	local StoneCow001  = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+5  ) --石像ID
	
--	local Xstone = Stone[0]

	WriteRoleValue( Golu[0] ,EM_RoleValue_Register , StoneCow001  )                         --石像ID
	WriteRoleValue( Golu[0] , EM_RoleValue_Register+1 , PurpleID )       --紫色寶箱的id
	WriteRoleValue( Golu[0] , EM_RoleValue_Register+2 , RedID  )         --紅色寶箱的id

	Stonecow1 = CreateObjByFlag( 101023, 780097, 5 , 1 );            --沃特‧賓普斯克

	Say( Samogmad[0], GetString("SC_101030_YU_01") )  --開場白
	sleep(20)
	PlayMotion( Samogmad[0], 115)                                  --表演動作 
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