function OpenBagMessage( Player , Message, Area )

	local PlayerName = GetName( Player )
	local MessageString = ""
	if Message == "MSG_OPENBAG_01" then
		MessageString = "[MSG_OPENBAG_01][$SETVAR1="..PlayerName.."]"
	elseif Message == "MSG_OPENBAG_02" then
		MessageString = "[MSG_OPENBAG_02][$SETVAR1="..PlayerName.."]"
	end
	RunningMsg( Player , Area , MessageString )
	-- ����[$VAR1]�A�q�L �u�����������M�]�v ��o�ä[���M���I�C
end

function ReplaceString( AllString , OriginalString , Replacestring )
	local i , j = string.find( AllString , OriginalString )
	if i==nil or j==nil then
		return AllString
	end
	local TempString = string.sub( AllString , 1 , i - 1 )..Replacestring..string.sub( AllString , j + 1 , -1 )
	return TempString
end

function HorseBag_Forever( Option )
	local PlayerID = OwnerID()
	local PackageID = 202076		-- �ä[�y�M���I�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if GiveBodyItem( PlayerID , 201130 , 1 ) then	-- �ä[�M�����I
			OpenBagMessage( PlayerID , "MSG_OPENBAG_01", 2 )
		end
	end
end
function HorseBag_OneMonth( Option )
	local PlayerID = OwnerID()
	local PackageID = 202094		-- �@�Ӥ�y�M�İ��]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if GiveBodyItem( PlayerID , 201698 , 1 ) then	-- �@�Ӥ�y�M�İ�
			OpenBagMessage( PlayerID , "MSG_OPENBAG_02", 2 )
		end
	end
end

