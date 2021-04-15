function Item_RandColorDye( )

	local DyeList = {201143 , 201144 , 201146 , 201147 , 201148 , 201149 , 201150 , 201151 , 201090 , 201153 , 201154 , 201159 , 201163 , 201091 , 201092 } 
	local Dye = DyeList[Rand ( 15 ) + 1]
	GiveBodyItem( OwnerID() , Dye , 1  )
--	Say( OwnerID()  ,  " Give Success "..Dye)

end