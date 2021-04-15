function LuaS_113030()
	LoadQuestOption( OwnerID() )
	if (CheckFlag( OwnerID() , 542741 )==false)then	
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_1]" , "LuaS_113030_1", 0 ) -- 我要替詭秘套牌蓄積能量
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_2]" , "LuaS_113030_0", 0 ) -- 我要領取詭秘套牌 
	end

	if (CheckFlag( OwnerID() , 542732 )==true)then	
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_12]" , "LuaS_113030_6", 0 ) -- 我想查詢我的詭秘套牌已經蓄積多少能量？
	end  
end

function LuaS_113030_0() -- 刪除繳交卡片旗標

	GiveBodyItem( OwnerID(), 204896, 1 )
	CloseSpeak( OwnerID() )
	local Keyflag = { 542732, 542733, 542734, 542735, 542736, 542737, 542738, 542739, 542740, 542741 }
	for i = 1 , 10 , 1 do
		SetFlag(OwnerID(),Keyflag[i],0)
	end
end

function LuaS_113030_1() 

	SetSpeakDetail(OwnerID(),"[SC_113030_3]") -- 你想繳交何處的卡片來為詭秘套牌蓄積能量？
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_4]" , "LuaS_113030_2", 0 ) -- 我要繳交喀里恩神殿的卡片
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_5]" , "LuaS_113030_3", 0 ) -- 我要繳交藏寶密窟的卡片
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_6]" , "LuaS_113030_4", 0 ) -- 我要繳交獨眼巢城的卡片
	if CountBodyItem( OwnerID() , 205642 ) >= 1 then	-- 有 詭秘無名卡片
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113292_06]" , "LuaS_113030_EX", 0 ) -- 我要以[205642]來蓄積能量
	end

end

function LuaS_113030_2() --喀里恩神殿卡片列

	SetSpeakDetail(OwnerID(),"[SC_113030_7]") 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_71]" , "LuaS_113030_2_1", 0 ) -- 我要繳交鋼鐵符文衛士770296
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_72]" , "LuaS_113030_2_2", 0 ) -- 我要繳交恩絲雅770300
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_73]" , "LuaS_113030_2_3", 0 ) -- 我要繳交洛卡魚人770298
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_74]" , "LuaS_113030_2_4", 0 ) -- 我要繳交尤薩里安770297
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_75]" , "LuaS_113030_2_5", 0 ) -- 我要繳交藝術之神的僕從770299
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_76]" , "LuaS_113030_2_6", 0 ) -- 我要繳交赫龍770301
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_113030_1", 0 ) -- 返回上一頁

end

function LuaS_113030_3() --藏寶密窟卡片列

	SetSpeakDetail(OwnerID(),"[SC_113030_8]") 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_81]" , "LuaS_113030_3_1", 0 ) -- 我要繳交威爾的詛咒770323
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_82]" , "LuaS_113030_3_2", 0 ) -- 我要繳交忠心的塔倫墨770324
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_83]" , "LuaS_113030_3_3", 0 ) -- 我要繳交巨岩希達歐770325
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_84]" , "LuaS_113030_3_4", 0 ) -- 我要繳交觀察員路克770326
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_85]" , "LuaS_113030_3_5", 0 ) -- 我要繳交雪波布雷克770327
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_113030_1", 0 ) -- 返回上一頁
end

function LuaS_113030_4() --獨眼巢城卡片列

	SetSpeakDetail(OwnerID(),"[SC_113030_9]")  
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_91]" , "LuaS_113030_4_1", 0 ) -- 我要繳交索雷爾頓協商者770317
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_92]" , "LuaS_113030_4_2", 0 ) -- 我要繳交波達哥770318
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_93]" , "LuaS_113030_4_3", 0 ) -- 我要繳交馬修770319
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_94]" , "LuaS_113030_4_4", 0 ) -- 我要繳交蓋亞770320
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_95]" , "LuaS_113030_4_5", 0 ) -- 我要繳交奧爾迪加770321
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_96]" , "LuaS_113030_4_6", 0 ) -- 我要繳交兀格達770322
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_113030_1", 0 ) -- 返回上一頁
end

function LuaS_113030_5() --檢查繳交卡片張數

	local Keyflag = { 542732, 542733, 542734, 542735, 542736, 542737, 542738, 542739, 542740, 542741 } 
	for i = 1 , 10 , 1 do
		if (CheckFlag( OwnerID() , Keyflag[i] )==false)then	
			SetFlag(OwnerID(),Keyflag[i],1)
			break
		end
	end 
end

function LuaS_113030_6() --查詢已繳交卡片張數

	local Keyflag = { 542732, 542733, 542734, 542735, 542736, 542737, 542738, 542739, 542740, 542741 } 
	local Num = 0
	for i = 1 , 10 , 1 do
		if (CheckFlag( OwnerID() , Keyflag[i] )==true)then	
			Num = Num+1 
		else
			break
		end
	end
	if Num == 1 then
		SetSpeakDetail(OwnerID(),"[SC_113030_121]")
	end
	if Num == 2 then
		SetSpeakDetail(OwnerID(),"[SC_113030_122]")
	end
	if Num == 3 then
		SetSpeakDetail(OwnerID(),"[SC_113030_123]")
	end
	if Num == 4 then
		SetSpeakDetail(OwnerID(),"[SC_113030_124]")
	end
	if Num == 5 then
		SetSpeakDetail(OwnerID(),"[SC_113030_125]")
	end
	if Num == 6 then
		SetSpeakDetail(OwnerID(),"[SC_113030_126]")
	end
	if Num == 7 then
		SetSpeakDetail(OwnerID(),"[SC_113030_127]")
	end
	if Num == 8 then
		SetSpeakDetail(OwnerID(),"[SC_113030_128]")
	end
	if Num == 9 then
		SetSpeakDetail(OwnerID(),"[SC_113030_129]")
	end
	if Num == 10 then
		SetSpeakDetail(OwnerID(),"[SC_113030_1210]") -- 你的詭秘套牌已經充滿能量，是否要領取你的詭秘套牌？
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_2]" , "LuaS_113030_0", 0 )-- 我要領取詭秘套牌
	end
end

function LuaS_113030_EX() --詭秘無名卡片
	if ( CountBodyItem( OwnerID(), 205642 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 205642 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

-----------------------------------------------喀里恩神殿卡片
function LuaS_113030_2_1() 
	if ( CountBodyItem( OwnerID(), 770296 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770296 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_2() 
	if ( CountBodyItem( OwnerID(), 770300 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770300 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_3() 
	if ( CountBodyItem( OwnerID(), 770298 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770298 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_4() 
	if ( CountBodyItem( OwnerID(), 770297 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770297 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_5() 
	if ( CountBodyItem( OwnerID(), 770299 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770299 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_6() 
	if ( CountBodyItem( OwnerID(), 770301 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770301 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

-----------------------------------------------藏寶密窟卡片
function LuaS_113030_3_1() 
	if ( CountBodyItem( OwnerID(), 770323 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770323 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_3_2() 
	if ( CountBodyItem( OwnerID(), 770324 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770324 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_3_3() 
	if ( CountBodyItem( OwnerID(), 770325 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770325 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_3_4() 
	if ( CountBodyItem( OwnerID(), 770326 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770326 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_3_5() 
	if ( CountBodyItem( OwnerID(), 770327 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770327 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

-----------------------------------------------獨眼巢城卡片
function LuaS_113030_4_1() 
	if ( CountBodyItem( OwnerID(), 770317 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770317 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_2() 
	if ( CountBodyItem( OwnerID(), 770318 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770318 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_3() 
	if ( CountBodyItem( OwnerID(), 770319 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770319 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_4() 
	if ( CountBodyItem( OwnerID(), 770320 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770320 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_5() 
	if ( CountBodyItem( OwnerID(), 770321 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770321 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_6() 
	if ( CountBodyItem( OwnerID(), 770322 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- 你缺少此張卡片！
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- 我已經將此張卡片的能量蓄積在詭秘套牌中！
		DelBodyItem( OwnerID(), 770322 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end









