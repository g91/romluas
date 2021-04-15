--節慶活動 2009年4月春雨節
--建立時間: 2009/03/19
--修改日期: 2009/04/06
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--花語彩蛋 春言采語活動用
------------------------------------------------------------------------------
function LuaI_204122ranbowegg( Option )
	local PlayerID = OwnerID()
	local PackageID = 204122		--花語彩蛋
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724268 , 1 )	
	end
end
-------------------------------------------------------------------------------
--  花語彩蛋 ran出物品  204122
------------------------------------------------------------------------------
--櫻花之歌	204123    30%
--風鈴木之歌	204124    28%
--勿忘我之歌	204125    22%
--杜鵑花之歌	204126    20%
-------------------------------------------------------------------------------
------------------------------------------------------------------------------
--春雨盒子      204223    帶兔子回家去 活動用
------------------------------------------------------------------------------
function LuaI_204223box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204223		--春雨盒子 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724332 , 1 )	
	end
end
-------------------------------------------------------------------------------
--  春雨盒子  ran出物品
------------------------------------------------------------------------------
--204224 金色代幣 x 3    55% 
--204119 寵物箱 x2       45%
-------------------------------------------------------------------------------
 -- 道具寵物箱           
------------------------------------------------------------------------------
--使用道具執行抓兔子法術 成功後兔子會變成道具"找回的拉比兔"  
------------------------------------------------------------------------------
function LuaI_204119_Check()  --檢查此物品是否在特定NPC身上
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 112581 --拉比兔 任務npc

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_204119_01") , C_SYSTEM )	--請使用於帶回拉比兔上。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_204119_01") , C_SYSTEM )	--請使用於帶回拉比兔上。
		return false	
	end
end
------------------------------------------------------------------------------
function LuaI_204119_Effect()   --機率判定 
	local RANDOWN = rand(100)
	if RANDOWN >35 then  -- 抓到兔子 機率為65%
		BeginPlot( OwnerID() , "LuaI_204119_Delgoods" , 0 )  
		BeginPlot( TargetID() , "LuaI_204119_Reset" , 0 )
	else --兔子閃躲  35%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_204119_02") , C_SYSTEM )	--兔子閃避了你的捕捉。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_204119_02") , C_SYSTEM )	--兔子閃避了你的捕捉。
	end

end
------------------------------------------------------------------------------
function LuaI_204119_Reset()
	Hide(OwnerID() )
	sleep(1200)
	LuaFunc_ResetObj( OwnerID() )	
end
------------------------------------------------------------------------------
function LuaI_204119_Delgoods()   --成功抓回        
	sleep(20)	
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_204119_03") , C_SYSTEM )	--你成功地帶回兔子！
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_204119_03") , C_SYSTEM )	--你成功地帶回兔子！
	GiveBodyItem( OwnerID() , 204120, 1 )
	DelBodyItem( OwnerID() , 204119 , 1) 
end
------------------------------------------------------------------------------
