function LuaS_205066()--說明捲軸

	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_113029_0]" );
	ShowBorder( OwnerID(), 0, "[205066]", "ScriptBorder_Texture_Paper" )	
end

function LuaS_113098()--殘片換東西

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_A]" , "LuaS_113098_1", 0 ) -- 我要使用100個符能殘片換取1張中級工匠令狀
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_B]" , "LuaS_113098_2", 0 ) -- 我要使用30張中級工匠令狀換取一張專家級工匠令狀
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_C]" , "LuaS_113098_3", 0 ) -- 我要使用10張專家級工匠令狀換取1張大師工匠令狀
end

function LuaS_113098_1()--殘片換中級

	if (CountBodyItem( OwnerID(), 204918 )<100)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料

	elseif Lua_SafeGive( OwnerID() , 204898 , 1 )==true then
		DelBodyItem( OwnerID() , 204918 , 100 )
--		GiveBodyItem( OwnerID(), 204898, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_113098_2()--中級換專家

	if (CountBodyItem( OwnerID(), 204898 )<30)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料

	elseif Lua_SafeGive( OwnerID() , 204899 , 1 )==true then
		DelBodyItem( OwnerID() , 204898 , 30 )
--		GiveBodyItem( OwnerID(), 204899, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_113098_3()--專家換大師

	if (CountBodyItem( OwnerID(), 204899 )<10)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料

	elseif Lua_SafeGive( OwnerID() , 204897 , 1 )==true then
		DelBodyItem( OwnerID() , 204899 , 10 )
--		GiveBodyItem( OwnerID(), 204897, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_113100()--必爾汀代幣換大師

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_E]" , "LuaS_113100_1", 0 ) -- 我要使用2000枚必爾汀代幣換取1張大師工匠令狀
end

function LuaS_113100_1()

	if (CountBodyItem( OwnerID(), 203038 )<2000)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料

	elseif Lua_SafeGive( OwnerID() , 204897 , 1 )==true then
		DelBodyItem( OwnerID() , 203038 , 2000 )
--		GiveBodyItem( OwnerID(), 204897, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_113101()--殘塊打磨

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113101_0]" , "LuaS_113101_1", 0 ) -- 用力敲擊，將殘塊打製成符能殘片
end

function LuaS_113101_1()

	if (CountBodyItem( OwnerID(), 205631 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料

	elseif Lua_SafeGive( OwnerID() , 205644 , 1 )==true then
		DelBodyItem( OwnerID() , 205631 , 1 )
--		GiveBodyItem( OwnerID(), 205644, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_205644()--符文殘片包

	local R = Rand( 801 ) + 200
		if R==1000 then
			if (CountBodyItem( OwnerID(), 530378 )<1)then
				local A = Rand( 5 )
				if A == 4 then
					GiveBodyItem( OwnerID(), 530378, 1 )
					GiveBodyItem( OwnerID(), 204918, 30000 )
					CastSpell( OwnerID(),OwnerID(),493699)
				else
					GiveBodyItem( OwnerID(), 204918, R )
				end
			else
				GiveBodyItem( OwnerID(), 204918, R )
			end 
		else
			GiveBodyItem( OwnerID(), 204918, R )
	end
end

function LuaS_113319()--核心轉換

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319]" , "LuaS_113319_1", 0 ) -- 請幫我轉換武器核心所適用的職業
end

function LuaS_113319_1()

	if CheckBuff( OwnerID() , 504037)== true then
		SetSpeakDetail(OwnerID(),"[SC_113319_1]") --核心正處於脆弱狀態
	else
		SetSpeakDetail(OwnerID(),"[SC_113319_2]") --轉換風險警告
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_3]" , "LuaS_113319_check_1", 0 ) -- 我考慮清楚了，請幫我轉換[204900]！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_4]" , "LuaS_113319_check_2", 0 ) -- 我考慮清楚了，請幫我轉換[204901]！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_5]" , "LuaS_113319_check_3", 0 ) -- 我考慮清楚了，請幫我轉換[204902]！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_6]" , "LuaS_113319_check_4", 0 ) -- 我考慮清楚了，請幫我轉換[204903]！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_7]" , "LuaS_113319_check_5", 0 ) -- 我考慮清楚了，請幫我轉換[204904]！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_8]" , "LuaS_113319_check_6", 0 ) -- 我考慮清楚了，請幫我轉換[204905]！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_11]" , "LuaS_113319_check_7", 0 ) -- 我考慮清楚了，請幫我轉換[206692]！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_12]" , "LuaS_113319_check_8", 0 ) -- 我考慮清楚了，請幫我轉換[206693]！
	end
end

function LuaS_113319_check_1()

	if (CountBodyItem( OwnerID(), 204900 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204900 , OwnerID())
	end
end

function LuaS_113319_check_2()

	if (CountBodyItem( OwnerID(), 204901 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204901, OwnerID())
	end
end

function LuaS_113319_check_3()

	if (CountBodyItem( OwnerID(), 204902 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204902 , OwnerID())
	end
end

function LuaS_113319_check_4()

	if (CountBodyItem( OwnerID(), 204903 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204903, OwnerID())
	end
end

function LuaS_113319_check_5()

	if (CountBodyItem( OwnerID(), 204904 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204904 , OwnerID())
	end
end

function LuaS_113319_check_6()

	if (CountBodyItem( OwnerID(), 204905 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204905, OwnerID())
	end
end

function LuaS_113319_check_7()

	if (CountBodyItem( OwnerID(), 206692 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 206692, OwnerID())
	end
end

function LuaS_113319_check_8()

	if (CountBodyItem( OwnerID(), 206693 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --你缺少需要的材料
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 206693, OwnerID())
	end
end

function LuaS_113319_2(obj , PPL)
	DisableQuest( OwnerID() , true )
	local x = Rand( 100 ) + 1 
	Say(OwnerID()   , "[SC_113319_9]" ) 
	sleep( 15 )
	Say(OwnerID()    , "[SC_113319_10]" )
	sleep( 15 )
	CastSpellLv( OwnerID() ,PPL , 493698, x ) 
	if CountBodyItem( PPL , obj ) > 0 then
		DelBodyItem( PPL, obj , 1 )
		AddBuff(PPL , 504037 , 0 , 86400 )  
		local R = Rand( 8 )
		if R== 0 then
			GiveBodyItem( PPL, 204900, 1 )
		elseif R==1 then
			GiveBodyItem( PPL, 204901, 1 )
		elseif R ==2 then
			GiveBodyItem( PPL, 204902, 1 )
		elseif R ==3 then
			GiveBodyItem( PPL , 204903, 1 )
		elseif R ==4 then
			GiveBodyItem( PPL , 204904, 1 )
		elseif R == 5 then
			GiveBodyItem( PPL , 204905, 1 )
		elseif R == 6 then
			GiveBodyItem( PPL ,  206692 , 1 )
		else
			GiveBodyItem( PPL ,206693 , 1 )
		end
	end
	DisableQuest( OwnerID() , false )  
end






