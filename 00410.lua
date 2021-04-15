function Item_RandRecovery()

	local PotionList = { 490023 , 490024 , 490025 , 490026 , 490027 , 490900 , 490901 , 490902 , 490903 , 490904 }
	local Potion = PotionList [ Rand( 10 ) + 1 ]

	local Ret = CastSpell(OwnerID() , OwnerID() , Potion)
--	Say(  OwnerID() , "Recovery!!!".. Potion  )
	return Ret

end