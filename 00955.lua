function YUYULua_101028_0()
	local CoNaID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100916, 200 , 1)       --§PÂ_©P³òªº¬Y°¦©Çª«ªº¯x°}¦ì¸m ·t±þªÌ    

--	Say(OwnerID(), CoNaID[0] )
--	Say(OwnerID(), CoNaID[1] )

	local CoNaID1 = CoNaID[0]  
	local CoNaID2 = CoNaID[1]  

	WriteRoleValue( OwnerID() ,EM_RoleValue_Register , CoNaID1  )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register+1 ,CoNaID2 )

	local CoNaID1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register ) 
	local CoNaID2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 


--	Say(OwnerID(), CoNaID1 )
--	Say(OwnerID(), CoNaID2 )

	Hide( CoNaID1)
	Hide( CoNaID2)

end