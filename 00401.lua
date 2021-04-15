
function Hsiang_RandHairColor( )
	--  紫紅色,中粉紅,紅,寶藍,深灰,咖啡色,粉紅
	local ColorList = {"0x0f800080" , "0x0fff4dff" , "0x0fff0000" , "0x0f0080ff" , "0x0f757575" ,  "0x0f400000" , "0x0ffb2b92" }
	local RandID = Rand( 7 ) + 1 
	local Color = Hex(  ColorList [ RandID ] );
--	Say ( OwnerID() , ColorList [ RandID ] )
--	喊出目前變換的髮色
	SetLook( OwnerID() , 0 , 0 , Color , 0 );

--	local HairColorList = { 4278848010 , 4278848010 , 4278848010 , 4278848010 }
--	十進位的寫法
--	local HairColor = HairColorList[ Rand( 4 )+1 ]
	

	
end