--節慶活動 2009年3月歡舞節
--建立時間: 2009/02/16
--修改日期: 2009/02/25
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--舞會禮盒 活動3用
------------------------------------------------------------------------------
function LuaI_dancebox( Option )
	local PlayerID = OwnerID()
	local PackageID = 203864		--舞會禮盒
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
		
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  
		sleep(10)
		If BorG == 0 then
			GiveBodyItem( PlayerID , 720361 , 1 )	
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 720362 , 1 )	
		end

	end
end