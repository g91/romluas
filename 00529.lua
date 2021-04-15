function LuaS_110782_0()
	LoadQuestOption( OwnerID() ) 
	if CheckFlag(OwnerID() , 540839 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110782_1") , "LuaS_110782_1", 0 )  --/*聽說你可以免費提供我坐騎
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_A") , "LuaS_MOUTH_SHOP_A", 0 ) --/*租借坐騎
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_B") , "LuaS_MOUTH_SHOP_B", 0 ) --/*租借坐騎

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_AA") , "LuaS_MOUTH_SHOP_AA", 0 ) --/*租借坐騎
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_BB") , "LuaS_MOUTH_SHOP_BB", 0 ) --/*租借坐騎

	end		
	
end

function LuaS_110782_1()
	if CheckFlag(OwnerID() , 540840 ) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_110782_1")   ); 
		--/*的確，因為銀湧冒險者協會會長跟我有段交情，所以我願意提供免費一次的騎乘，不過只有一次機會喔！
		--/*我借給你的馬匹15分鐘後會自己回來，所以別浪費了啊！
		--/*你準備好了嗎？
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110782_2") , "LuaS_110782_2", 0 )  --/*請借我ㄧ匹坐騎	
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110782_2")   ); 
		--/*我上次不是已經借給你一次了嗎？我應該有提醒過只有一次機會吧！
		--/*這是我謀生的工具，我可不能老是免費幫人啊！而且租借坐騎 15 分鐘只要 9 銀，算很便宜的價錢了呢！
		SetFlag( OwnerID() , 540839 , 0 )
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP") , "LuaS_110782_4", 0 ) --/*租借坐騎
	end
end

function LuaS_110782_2()
	CloseSpeak( OwnerID() )
	SetFlag( OwnerID() , 540839 , 0 )
	SetFlag( OwnerID() , 540840 , 1 )
	CastSpell( OwnerID() , TargetID() , 491035 )
end

function LuaS_110782_3()

	SetSpeakDetail( OwnerID(), GetString("ST_110782_3")   ); 
	--/*你要租哪一個？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110782_3") , "LuaS_110782_4", 0 ) --/*白馬，15 分鐘 9 銀

end

function LuaS_110782_4()
	CloseSpeak( OwnerID() )
--	BeginPlot( OwnerID() , "LuaS_MOUTH_SHOP_A" , 0 )
	OpenShop()
end