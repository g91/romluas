--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/03/20
--�ק���: 2009/04/03
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--�}��§��      204127    �a�ߤl�^�a�h ���ʥ�
------------------------------------------------------------------------------
function LuaI_204127rabbit( Option )
	local PlayerID = OwnerID()
	local PackageID = 204127		--�}��§�� 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724271 , 1 )	
	end
end
-------------------------------------------------------------------------------
--  �}��§��  ran�X���~
------------------------------------------------------------------------------
--204092 �������Ĥ�§��   
--204128 �}�ɷϤ�§��     
--204379 �m�J§��
--       
-------------------------------------------------------------------------------