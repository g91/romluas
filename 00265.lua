function LuaI_110128_0()

	local Chest = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110128 , 150 )
	local Num = Rand(2)
	for i = 0 , 3 , 1 do
		if Chest[i] == -1 then
			break
		end
		SetPlot( Chest[i] , "touch" , "LuaI_110128_3" , 40 )
		sleep( 1 )
	end 
	SetPlot( Chest[Num] , "touch" , "LuaI_110128_1" , 40 )

end
----------------------------------------------------------------------------------
function LuaI_110128_1()
	if CheckAcceptQuest( OwnerID() , 420137 )  then
		if CountBodyItem(OwnerID(),200918) == 0 then
			SetPlot( TargetID() , "touch" , "LuaI_110128_3" , 40 )
			--ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_110128_1"), 0 ); --/*你發現了一捲像是設計圖的紙。
			Say( OwnerID(),GetString("EM_110128_1"))
			GiveBodyItem( OwnerID() , 200918 , 1) 
			Beginplot( TargetID() , "LuaI_110128_2", 0 )
		else
			--ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_110128_0"), 0 ); --/*這裡看來沒有像是設計圖的東西。
			Say( OwnerID() , GetString("EM_110128_0"))
		end
	elseif CheckAcceptQuest( OwnerID() , 420139 ) and CountBodyItem(OwnerID(),200918) > 0 then
		--ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_110128_2"), 0 ); 
		Say( OwnerID(),GetString("EM_110128_2"))
		DelBodyItem( OwnerID() , 200918 , 1) 
		SetFlag( OwnerID() , 540228 ,1) 
	end
end
----------------------------------------------------------------------------------
function LuaI_110128_2() -- 重新放置地圖位置

	sleep( 150 )		
	local Chest = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110128 , 150 )
	local Num = Rand(2)
	while 1 do

		if Chest[Num] == -1 then
			Num = Rand(2)
		else
			break
		end
		sleep( 1 )
	end
	for i = 0 , 3 , 1 do
		if Chest[i] == -1 then
			break
		end
		SetPlot( Chest[i] , "touch" , "LuaI_110128_3" , 40 )
		sleep( 1 )
	end 
	SetPlot( Chest[Num] , "touch" , "LuaI_110128_1" , 40 )

end
----------------------------------------------------------------------------------
function LuaI_110128_3()
	if CheckAcceptQuest( OwnerID() , 420137 ) then
		--ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_110128_0"), 0 ); --/*這裡看來沒有像是設計圖的東西。
		Say( OwnerID() , GetString("EM_110128_0"))
	elseif CheckAcceptQuest( OwnerID() , 420139 ) and CountBodyItem(OwnerID(),200918) > 0 then
		--ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_110128_2"), 0 ); 
		Say( OwnerID(),GetString("EM_110128_2"))
		DelBodyItem( OwnerID() , 200918 , 1) 
		SetFlag( OwnerID() , 540228 ,1) 
	end
end