
function Hsiang_RandHairColor( )
	--  ������,������,��,�_��,�`��,�@�ئ�,����
	local ColorList = {"0x0f800080" , "0x0fff4dff" , "0x0fff0000" , "0x0f0080ff" , "0x0f757575" ,  "0x0f400000" , "0x0ffb2b92" }
	local RandID = Rand( 7 ) + 1 
	local Color = Hex(  ColorList [ RandID ] );
--	Say ( OwnerID() , ColorList [ RandID ] )
--	�ۥX�ثe�ܴ����v��
	SetLook( OwnerID() , 0 , 0 , Color , 0 );

--	local HairColorList = { 4278848010 , 4278848010 , 4278848010 , 4278848010 }
--	�Q�i�쪺�g�k
--	local HairColor = HairColorList[ Rand( 4 )+1 ]
	

	
end