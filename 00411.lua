function Item_RandHairStyle( )

	--  µµ¬õ¦â,¤¤¯»¬õ,¬õ,Ä_ÂÅ,²`¦Ç,©@°Ø¦â,¯»¬õ
	local ColorList = {"0x0f800080" , "0x0fff4dff" , "0x0fff0000" , "0x0f0080ff" , "0x0f757575" ,  "0x0f400000" , "0x0ffb2b92" }
	local Color = Hex(  ColorList [ Rand( 7 ) + 1 ] );
	local HairList = {2008 , 2009 , 2010 , 2011 , 2012 , 2013 , 2014 , 2015 , 2016 , 2017 , 2018 , 2019 , 2020 , 2021}
	local Hair = HairList [ Rand ( 14 ) + 1]
	SetLook( OwnerID() , 0 , Hair , Color , 0 );
--	Say(  OwnerID() , "Change Style!!!"..Color  )
--			Áy«¬,¾v«¬,		¡@¡@¾v¦â,½§¦â

end
