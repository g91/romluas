--1172

function LuaYU_112150_0()

	local flower =  CheckFlag( OwnerID()  , 542173 ) --有無領過
	local change =  CheckFlag( OwnerID()  , 542174 ) --有無領過


	if flower == false and change == false  then

		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

	end


	SetSpeakDetail( OwnerID(), "[SC_112150_YU_01]"   )--每年花神節的時候，玫瑰總是開得特別燦爛、艷麗～在這戀人們的節日裡，你是否願意付出你的真心、耐心來守護你的愛情呢？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_02]" , "LuaYU_112150_1", 0 ) --花神節的由來
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_03]" , "LuaYU_112150_2", 0 ) --魔法玫瑰培植
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_24]" , "LuaYU_112150_9", 0 ) --兌換魔法玫瑰種子
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_25]" , "LuaYU_112150_11", 0 ) --玫瑰培植活動

end

function LuaYU_112150_1()

	SetSpeakDetail( OwnerID(), "[SC_112150_YU_05]"   )--花神節的故事
	AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_0", 0 ) --確認

end

function LuaYU_112150_2()

	local flower =  CheckFlag( OwnerID()  , 542173 ) --有無領過
	local change =  CheckFlag( OwnerID()  , 542174 ) --有無領過

	if flower == false   then

		SetSpeakDetail( OwnerID(), "[SC_112150_YU_06]"   )--擁有花神的祝福，無論是尋找愛情或者是守護愛情都會變得非常順利，你願意付出你的真心、耐心來培植魔法玫瑰嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_07]" , "LuaYU_112150_5", 0 ) --願意，我要守護愛情
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_08]" , "LuaYU_112150_6", 0 ) --願意，我要尋找愛情

	else
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_26]"   )--感謝您的參與！每人每日魔法玫瑰種子的配額有限，您可以明天再來參與喔！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_24]" , "LuaYU_112150_9", 0 ) --兌換魔法玫瑰種子
	end



end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_112150_4()--關閉對話

	CloseSpeak( OwnerID() )                     

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaYU_112150_5() --紅色玫瑰

	local flower =  CheckFlag( OwnerID()  , 542173 ) --有無領過
	local change =  CheckFlag( OwnerID()  , 542174 ) --有無領過


		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end
		
			SetFlag( OwnerID()  , 542173 , 1 )

			GiveBodyItem( OwnerID() , 203204  , 1 ) --紅玫瑰種子
			GiveBodyItem( OwnerID() , 203647  , 1 ) --可裝水的容器

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_09]"   )--能夠被你守護的戀人真是幸福，帶著這個魔法玫瑰種子到<CM>[111815]</CM>好好的培植他！魔法玫瑰能夠快速的吸收並且茁壯，所以培植過程中可能吸引蟲害，一定要好好的保護他！另外這瓶容器給你取水用，播種後要先澆水，種子才會發芽成長，成長中要注意水份的補充喔！真心、耐心的呵護才能培植出受花神祝福的燦爛玫瑰！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		end


end

function LuaYU_112150_6() --藍色玫瑰

	local flower =  CheckFlag( OwnerID()  , 542173 ) --有無領過
	local change =  CheckFlag( OwnerID()  , 542174 ) --有無領過


		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	


			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end


			SetFlag( OwnerID()  , 542173 , 1 )		

			GiveBodyItem( OwnerID() , 203205  , 1 ) --藍玫瑰種子
			GiveBodyItem( OwnerID() , 203647  , 1 ) --可裝水的容器

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_10]"   )--祝福你能夠順利找到永恆的愛情，帶著這個魔法玫瑰種子到<CM>[111815]</CM>好好的培植他！魔法玫瑰能夠快速的吸收並且茁壯，所以培植過程中可能吸引蟲害，一定要好好的保護他！另外這瓶容器給你取水用，播種後要先澆水，種子才會發芽成長，成長中要注意水份的補充喔！真心、耐心的呵護才能培植出受花神祝福的燦爛玫瑰！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		end




end


--取水的桶子

function LuaYU_112150_7() 

		SetPlot( OwnerID()  ,"touch",  "LuaYU_112150_8" , 20 )   

end

function LuaYU_112150_8() 

	local Waterbattle =  CountBodyItem( OwnerID() , 203647 ) --空瓶子


	if  Waterbattle == 0  then  

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_39]" , C_SYSTEM  ) --你需要容器來收集魔法培養液。
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_112150_YU_39]" , 0 ) --

	elseif  Waterbattle > 0  then  

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_37]" , C_SYSTEM  ) --你將容器裝滿了魔法培養液。
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_112150_YU_37]" , 0 ) --

		DelBodyItem( OwnerID() , 203647 , 1 )
		GiveBodyItem( OwnerID() , 203646  , 1 ) --裝滿水的容器
	end
end


function Lua_Valentine_blessing_talk()
	SetSpeakDetail( OwnerID(), "[SC_VALENTINE_BLESSING_2]"   )--每年花神節，我們會與慈善協會舉辦送愛心關懷弱勢活動，發揮您的愛心只需捐獻999金，弱勢團體將獲得您的幫助，我們也將為您祈求花神的祝福，請問您是否願意？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_VALENTINE_BLESSING_3]" , "Lua_Valentine_blessing_talk1", 0 ) --是的，我願意！
end

function Lua_Valentine_blessing_talk1()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money) >= 999 then
		GiveBodyItem( OwnerID() , 203024 , 1 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -999 )
		CloseSpeak( OwnerID() )
	else 
		SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaYU_112150_9() --*

		SetSpeakDetail( OwnerID(), "[SC_112150_YU_27]"   )--為了散播愛與和平到世界的各個角落，如果您願意捐獻1個<CN>[202904]</CN>或者8朵<CN>[203648]</CN>，我們將提供<CN>[203204]</CN>給您兌換，如果你細心培植魔法玫瑰，一天最多可以獲得5朵<CN>[203648]</CN>喔！努力呵護你的玫瑰吧！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_41]" , "LuaYU_112150_10", 0 ) --用[202904]兌換
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_42]" , "LuaYU_112150_10_2", 0 ) --用[203648]兌換

end


function LuaYU_112150_10() 

	local Rune =  CountBodyItem( OwnerID() , 202904 ) --傳送者符文

	if Rune > 0 then
		
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_06]"   )--擁有花神的祝福，無論是尋找愛情或者是守護愛情都會變得非常順利，你願意付出你的真心、耐心來培植魔法玫瑰嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_07]" , "LuaYU_112150_5_2", 0 ) --願意，我要守護愛情
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_08]" , "LuaYU_112150_6_2", 0 ) --願意，我要尋找愛情
	else
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_28]"   )--抱歉，您身上沒有<CN>[202904]</CN>喔！
	end

end

function LuaYU_112150_10_2() 

	local Rose =  CountBodyItem( OwnerID() , 203648 ) --浪漫玫瑰花束

	if Rose >= 8 then
		
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_06]"   )--擁有花神的祝福，無論是尋找愛情或者是守護愛情都會變得非常順利，你願意付出你的真心、耐心來培植魔法玫瑰嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_07]" , "LuaYU_112150_5_3", 0 ) --願意，我要守護愛情
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_08]" , "LuaYU_112150_6_3", 0 ) --願意，我要尋找愛情
	else
		SetSpeakDetail( OwnerID(), "[SC_112150_YU_40]"   )--抱歉，您身上沒有<CN>[203648]</CN>喔！--*
	end

end

function LuaYU_112150_11() 

		SetSpeakDetail( OwnerID(), "[SC_112150_YU_29]"   )--花神節擴大舉辦<CN>玫瑰培植活動</CN>，凡<CN>當日成功培育10朵玫瑰</CN>者將致贈花神的祝福禮盒，有機會獲得夢幻座騎 - 獨角獸，或在<CN>活動期間內成功培育30朵玫瑰</CN>者將獲得一個特殊稱號喔！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_30]" , "LuaYU_112150_12", 0 ) --兌換花神的祝福禮盒
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_31]" , "LuaYU_112150_13", 0 ) --兌換花神節稱號

end

function LuaYU_112150_12() 
	
	local UseItem1 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1)
	local UseItem0 = 0

	if UseItem1 >= 10 then

		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	
			UseItem0 = UseItem1 - 10
			GiveBodyItem( OwnerID() , 203649  , 1 ) 
--			GiveBodyItem( OwnerID() , 204073  , 3 )  --因應4.0.0版推出魔法衣櫥系統 將融合之石獲得取消 (4.0.1 版後取消)

			WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , UseItem0 )   

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_32]"   )--感謝您的參與！這是花神給予您的祝福！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		end	
	else
			SetSpeakDetail( OwnerID(), "[SC_112150_YU_33]" .. "|cffff00ff" .. UseItem1 .. "|r"  )--凡<CN>當日成功培育10朵玫瑰</CN>者將致贈花神的祝福禮盒，有機會獲得夢幻座騎 - 獨角獸喔！您目前完成的次數：
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
	end

end

function LuaYU_112150_13() 

	local Rose =  CountBodyItem( OwnerID() , 530051 ) --稱號
	local UseItem2 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2)
	local UseItem0 = 0

	if UseItem2 >= 30 and Rose == 0 then
	
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			UseItem0 = UseItem2 - 30
			GiveBodyItem( OwnerID() ,  530051  , 1 ) --稱號
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2 , UseItem0 )   


			SetSpeakDetail( OwnerID(), "[SC_112150_YU_32]"   )--感謝您的參與！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		end	
	elseif Rose > 0 then

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_32]"   )--感謝您的參與！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
	
	elseif UseItem2 < 30 and Rose == 0 then

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_35]" .. "|cffff00ff" .. UseItem2 .. "|r"  )--凡<CN>活動期間內成功培育30朵玫瑰</CN>者將獲得一個特殊稱號喔！您目前完成的次數：
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
	end

end



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------傳送者之門兌換用

function LuaYU_112150_5_2() --紅色玫瑰

	local flower =  CheckFlag( OwnerID()  , 542173 ) --有無領過
	local change =  CheckFlag( OwnerID()  , 542174 ) --有無領過


		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end

			DelBodyItem( OwnerID() , 202904 , 1 )
			SetFlag( OwnerID()  , 542174 , 1 ) --兌換過的旗標	
		
			SetFlag( OwnerID()  , 542173 , 1 )

			GiveBodyItem( OwnerID() , 203204  , 1 ) --紅玫瑰種子
			GiveBodyItem( OwnerID() , 203647  , 1 ) --可裝水的容器

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_09]"   )--能夠被你守護的戀人真是幸福，帶著這個魔法玫瑰種子到<CM>[111815]</CM>好好的培植他！魔法玫瑰能夠快速的吸收並且茁壯，所以培植過程中可能吸引蟲害，一定要好好的保護他！另外這瓶容器給你取水用，播種後要先澆水，種子才會發芽成長，成長中要注意水份的補充喔！真心、耐心的呵護才能培植出受花神祝福的燦爛玫瑰！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		end


end

function LuaYU_112150_6_2() --藍色玫瑰

	local flower =  CheckFlag( OwnerID()  , 542173 ) --有無領過
	local change =  CheckFlag( OwnerID()  , 542174 ) --有無領過

		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end

			DelBodyItem( OwnerID() , 202904 , 1 )
			SetFlag( OwnerID()  , 542174 , 1 ) --兌換過的旗標

			SetFlag( OwnerID()  , 542173 , 1 )		

			GiveBodyItem( OwnerID() , 203205  , 1 ) --藍玫瑰種子
			GiveBodyItem( OwnerID() , 203647  , 1 ) --可裝水的容器

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_10]"   )--祝福你能夠順利找到永恆的愛情，帶著這個魔法玫瑰種子到<CM>[111815]</CM>好好的培植他！魔法玫瑰能夠快速的吸收並且茁壯，所以培植過程中可能吸引蟲害，一定要好好的保護他！另外這瓶容器給你取水用，播種後要先澆水，種子才會發芽成長，成長中要注意水份的補充喔！真心、耐心的呵護才能培植出受花神祝福的燦爛玫瑰！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		end




end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------浪漫玫瑰花束兌換用

function LuaYU_112150_5_3() --紅色玫瑰

	local flower =  CheckFlag( OwnerID()  , 542173 ) --有無領過
	local change =  CheckFlag( OwnerID()  , 542174 ) --有無領過


		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end




			DelBodyItem( OwnerID() , 203648 , 8 )
			SetFlag( OwnerID()  , 542174 , 1 ) --兌換過的旗標	
		
			SetFlag( OwnerID()  , 542173 , 1 )

			GiveBodyItem( OwnerID() , 203204  , 1 ) --紅玫瑰種子
			GiveBodyItem( OwnerID() , 203647  , 1 ) --可裝水的容器

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_09]"   )--能夠被你守護的戀人真是幸福，帶著這個魔法玫瑰種子到<CM>[111815]</CM>好好的培植他！魔法玫瑰能夠快速的吸收並且茁壯，所以培植過程中可能吸引蟲害，一定要好好的保護他！另外這瓶容器給你取水用，播種後要先澆水，種子才會發芽成長，成長中要注意水份的補充喔！真心、耐心的呵護才能培植出受花神祝福的燦爛玫瑰！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		end


end

function LuaYU_112150_6_3() --藍色玫瑰

	local flower =  CheckFlag( OwnerID()  , 542173 ) --有無領過
	local change =  CheckFlag( OwnerID()  , 542174 ) --有無領過

		if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then	

			if flower == false and change == false  then

				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )   

			end

			DelBodyItem( OwnerID() , 203648 , 8 )
			SetFlag( OwnerID()  , 542174 , 1 ) --兌換過的旗標

			SetFlag( OwnerID()  , 542173 , 1 )		

			GiveBodyItem( OwnerID() , 203205  , 1 ) --藍玫瑰種子
			GiveBodyItem( OwnerID() , 203647  , 1 ) --可裝水的容器

			SetSpeakDetail( OwnerID(), "[SC_112150_YU_10]"   )--祝福你能夠順利找到永恆的愛情，帶著這個魔法玫瑰種子到<CM>[111815]</CM>好好的培植他！魔法玫瑰能夠快速的吸收並且茁壯，所以培植過程中可能吸引蟲害，一定要好好的保護他！另外這瓶容器給你取水用，播種後要先澆水，種子才會發芽成長，成長中要注意水份的補充喔！真心、耐心的呵護才能培植出受花神祝福的燦爛玫瑰！
			AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		else
			SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]" , "LuaYU_112150_4", 0 ) --確認
		end




end