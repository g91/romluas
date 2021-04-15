--1289
--2011.03.03 取消給予融合之石 因應4.0.0已開放魔法衣櫥

--節慶活動 2009年4月春雨節
--建立時間: 2009/03/24
--修改日期: 2009/04/03
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--彩蛋裝禮盒      204121    帶兔子回家去 活動用
------------------------------------------------------------------------------
function LuaI_204121eggbox( Option )
	local PlayerID = OwnerID()
	local PackageID = 204121		--彩蛋裝禮盒 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( PlayerID , 203178 ) --古老的鑰匙
		if ( NeedSpaceStatus  == false ) then
                                ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_DAN_111700_22]",0)
                                ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_DAN_111700_22]",0)
			return false
		elseif  CountBodyItem( PlayerID , PackageID ) >= 1  and KEY > 0  then
			return true
		else 
               		  ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_DAN_111700_30]",0)
                               	 ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_DAN_111700_30]",0)
			return false
		end
	elseif ( Option == "USE" ) then		
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  
		sleep(10)
		If BorG == 0 then
			GiveBodyItem( PlayerID , 724333 , 1 )	 --跑男生的
		--	GiveBodyItem( PlayerID , 204073 , 1 )	 --2011.03.03 取消給予融合之石 因應4.0.0已開放魔法衣櫥
			DelBodyItem( PlayerID , 203178, 1 )
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724409 , 1 )	 --跑女生的
		--	GiveBodyItem( PlayerID , 204073 , 1 )	 --2011.03.03 取消給予融合之石 因應4.0.0已開放魔法衣櫥
			DelBodyItem( PlayerID , 203178, 1 )
		end
	end
end