----------------------------------------------------------
--需要鑰匙才能打開的寶箱
----------------------------------------------------------
function LuaI_treasure( Option, KeyID , SelfID , Item )	--(狀態,鑰匙ID,自己ID,給予的物件ID)
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( PlayerID, PlayerID, 0, GetString("SC_TREASURE_NOSPACE"), 0 )	--你的背包空間不足
			return false
		elseif ( CountBodyItem( PlayerID , SelfID ) >= 1 ) and ( CountBodyItem( PlayerID , KeyID ) >= 1 ) then
			return true
		else
			ScriptMessage( PlayerID, PlayerID, 0, GetString("SC_TREASURE_NOKEY"), 0 )		--你沒有古老的鑰匙
			return false
		end
		
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item , 1 )
		DelBodyItem( PlayerID , KeyID , 1 )

		local Lv90ChestID = { 208358 , 208359 , 208360 }	--Lv.90以上的寶箱
		local ExtraChan = 181	--風野之靈額外套裝材料掉落機率（18.1%）不可大於MaxChan
		local MaxChan = 1000	--100%的機率數字
		
		for i = 1 , #Lv90ChestID do
			if	SelfID == Lv90ChestID[ i ] then	--檢查額外套裝材料掉落資格
				if RandRange( 1 , MaxChan ) <= ExtraChan then	--檢查機率
					GiveBodyItem ( OwnerID() , 720369 , 1 )	--風野之靈額外套裝材料掉落
				end
			end
		end
		
	end
end

----------------------------------------------------------
--不需鑰匙即可打開的寶箱
----------------------------------------------------------
function LuaI_freetreasure( Option , SelfID , Item )	--(狀態,自己ID,給予的物件ID)
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( PlayerID, PlayerID, 0, GetString( "SC_TREASURE_NOSPACE" ) , 0 )	--你的背包空間不足
			return false
		elseif ( CountBodyItem( PlayerID , SelfID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item , 1 )					
	end
end