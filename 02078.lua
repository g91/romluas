--�}�Һٸ��]�Ϊ�function
--	Option		(1) "CHECK"	���~�ϥΫe�ˬd
--			(2) "USE"	���~�ϥήĪG
--	PackageID			���o��function���]���s��
--	GiveID				�}�]����n�������ٸ��s��
--	NeedSpace			�ˬd���a���W������ƥH�ε������ƶq

------------------------------------------------------------------------------
function LuaI_mika_opentitleitem( Option,PackageID,GiveID)
	local PlayerID = OwnerID()
	local Pcount = CountBodyItem( PlayerID , PackageID ) -- �]�]���ƶq
	local Tcount = CountBodyItem( PlayerID , GiveID ) -- �ٸ����ƶq

	if ( Option == "CHECK" ) then
		if Pcount < 1 then  -- �S���]�]
			return false
		elseif Tcount >= 1 then --�w�g�����ٸ�
			ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GOBLINTITLE05]",0)  --�A�w�g�֦����ٸ��C
			ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_GOBLINTITLE05]",0)  
			return false
		else
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , GiveID , 1 ) --���ٸ�
	end
end