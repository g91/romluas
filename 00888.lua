function JobLimitUP( Option )

	local Player = OwnerID()
	local PackageID = 202831	-- 職業取得上限擴充券
	local Job_Num = ReadRoleValue( Player , EM_RoleValue_VocCount )
	local NUM = Job_Num+1
	--WriteRoleValue( Player , EM_RoleValue_VocCount , 1 )
	if ( Option == "CHECK" ) then
		if CountBodyItem( Player , PackageID ) >= 1 and Job_Num < 6 then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		AddRoleValue( Player , EM_RoleValue_VocCount , 1 )
		--SetRoleValue( Player , EM_RoleValue_VocCount , Job_Num+1 )
		--Say(OwnerID() , NUM)
		local MessageString = "[SC_202831_1][$SETVAR1="..NUM.."]"	-- 你目前可取得職業數增加為 [$VAR1] 個。
		ScriptMessage( OwnerID(), OwnerID(), 1, MessageString , C_SYSTEM )
	end

end