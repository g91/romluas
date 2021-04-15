function LuaS_110176_0()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_0")   );--/*歡迎光臨！要吃點喝點什麼就跟我說，馬上幫您準備！

	if CheckAcceptQuest( OwnerID(), 420220 ) == true then
	 	if CheckFlag( OwnerID(),540330 ) == true and CheckFlag(OwnerID(),540331)==false then --有對話過  
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_5") , "LuaS_110176_5", 0 )
			--/*可以請你再跟我說一次魯安達的下落嗎？
		else 
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_1") , "LuaS_110176_1", 0 ) 
			--/*你有看到一個名字叫魯安達的黑曜騎士團使節嗎？
		end 
	end
	
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_0") , "LuaS_110176_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_1")   );
	--/*黑曜騎士團的使節？說到這個就有氣！
	--  昨天的確有個黑曜騎士團的人來喝酒，一直喝到打烊才被我摔出酒吧，這個小子身上的錢還不夠付我酒錢呢！
	--  除非你先把他酒錢給付了，不然別想從我口中得到聽到任何消息！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_4") , "LuaS_110176_4", 0 ) 
	--/*好吧！總共多少錢？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_6") , "LuaS_110176_EXIT", 0 ); --/*讓我考慮一下。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_2")   );--/*3個銅幣加50個青銅幣。
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 350  then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_3") , "LuaS_110176_3", 0 ) --/*拿去吧！你有看到他往哪裡去嗎？
	end
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_7") , "LuaS_110176_EXIT", 0 ); --/*下次吧！我的錢也不太夠...

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_3()
	
	local WinePay = ReadRoleValue( OwnerID() , EM_RoleValue_Money ) - 350
	SetSpeakDetail( OwnerID(), GetString("ST_110176_3")   );--/*我管他到哪裡去！！ 
	WriteRoleValue( OwnerID() , EM_RoleValue_Money , WinePay ) --扣掉玩家身上3銅50青銅
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_4") , "LuaS_110176_4", 0 ) 
	--/*請小聲一點！這件事可能會演變成一個嚴重的外交事件！
	SetFlag( OwnerID(),540330,1 ) 

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_4()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_4")   );
	--/*什麼嚴重的外交事件？他一定是醉倒在哪個偏僻的角落了，你去房子後面或是水溝旁邊找找，一定可以找到這醉漢的！
	SetFlag( OwnerID(),540330,1 ) 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_8") , "LuaS_110176_EXIT", 0 ); --/*謝謝你的消息。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_5()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_5")   );
	--/*房子後面或是水溝旁邊找找，愈是酒醉的人愈會往偏僻的角落去，真是奇怪～

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_8") , "LuaS_110176_EXIT", 0 ); --/*謝謝你的消息。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end