function LuaS_110159_0()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110439_0") , "LuaS_110159_SHOP", 0 );
	--/*買賣物品 
	if CheckAcceptQuest( OwnerID() , 420304 ) == true and CountBodyItem(OwnerID(),200880)==0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110159_1") , "LuaS_110159_1", 0 ); 
		--/*我是塔尼洛夫派來的人，希望能把他訂的酒拿回去。
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110159_SHOP()

	CloseSpeak( OwnerID() ); 
	OpenShop()

end
-------------------------------------------------------------------------------------------------------------
function LuaS_110159_1()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	SetPlot( TargetID() , "touch","LuaFunc_Obj_Nothing",40)
	Say( TargetID() , GetString("SAY_110159_0") ) --/*你是塔尼洛夫派來的人啊！真是抱歉，一直沒能把酒送過去。
	sleep( 20 )
	local Obj = Role:new( TargetID() )
	local Cask = LuaFunc_SearchNPCbyOrgID( TargetID(),110283 , 50 , 1)
	Say( TargetID() , GetString("SAY_110159_1") ) --/*〈玩家姓名〉這桶酒就麻煩你囉！有點重，請小心拿。
	if Cask[0] == -1 then
		Cask[0] = CreateObj( 110283 , Obj:X()+10 , Obj:Y() , Obj:Z() , 0 , 1 )
		AddToPartition( Cask[0] , 0 )
		SetPlot( Cask[0] , "touch" ,"LuaI_110283" , 40 )
		BeginPlot( Cask[0] ,"LuaI_110283_B",0)
	else
		SetPlot( TargetID() , "touch","",0)
		return
	end
	SetPlot( TargetID() , "touch","",0)	

end
-------------------------------------------------------------------------------------------------------------
function LuaI_110283() --讓酒桶消失
	if CheckAcceptQuest( OwnerID() , 420304 ) == true and CountBodyItem(OwnerID(),200880)==0 then
		GiveBodyItem( OwnerID() , 200880 , 1 )
	end
	DelObj( TargetID() )
end

function LuaI_110283_B()
	sleep( 100 )
	DelObj( OwnerID() )
end