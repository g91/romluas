--節慶活動 2009年4月春雨節
--建立時間: 2009/03/24
--修改日期: 2009/04/03
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--彩蛋變身藥水禮盒      204357   帶兔子回家去 活動用
------------------------------------------------------------------------------
function LuaI_204357box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204357		--彩蛋變身藥水禮盒 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

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
			GiveBodyItem( PlayerID , 724443 , 1 )	 --跑男生的
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724442 , 1 )	 --跑女生的
		end
	end
end
-------------------------------------------------------------------------------
--  彩蛋變身藥水禮盒  ran出物品    
------------------------------------------------------------------------------
-- 男生 724443
-- 鷹羽彩蛋變身藥水袋 (15分)
-- 鷹羽彩蛋變身藥水袋 (1小時)
-- 鷹羽彩蛋變身藥水袋 (2小時)
-- 鷹羽彩蛋變身藥水袋 (24小時)

-- 女生 724442
--  蕾絲彩蛋變身藥水袋(15分)
--  蕾絲彩蛋變身藥水袋(1小時)
--  蕾絲彩蛋變身藥水袋(2小時)
--  蕾絲彩蛋變身藥水袋(24小時)
-------------------------------------------------------------------------------