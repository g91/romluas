------------------------------------------------------------------------------
--���M�]�Ϊ�function
--	Option		(1) "CHECK"	���~�ϥΫe�ˬd
--			(2) "USE"	���~�ϥήĪG
--	PackageID			���o��function���]���s��
--	GiveID				�}�]����n���������M���s��
--	NeedSpace			�ˬd���a���W������ƥH�ε������ƶq

--���|�Ϊ��ܽаѦҪ��~��208215�B208216�B208217�B208218
------------------------------------------------------------------------------
function LuaI_FN_OPENRIDEPACKAGE( Option,PackageID,GiveID,NeedSpace)
	local PlayerID = OwnerID()
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , GiveID , NeedSpace )	
	end
end