function K_2008xmss_1()  --測試完成
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s1") , "K_2008xmss_2", 0 ) --我也想要新年祝福
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s2") , "K_2008xmss_3", 0 ) --我想用10個襪子餅換取黃色聖誕禮物
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s3") , "K_2008xmss_4", 0 ) --我想用20個襪子換取綠色聖誕禮物
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s4") , "K_2008xmss_5", 0 ) --我想用50個襪子換取紅色聖誕禮物
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s9") , "K_2008xmss_7", 0 ) --我想知道暖冬節的由來
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_2()
SetSpeakDetail( OwnerID(), GetString("K_2008xmss_1_s5")   )--因為要籌備下次活動的經費，所以要跟您酬收的費用是3000元。
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s6")  , "K_2008xmss_6", 0 ) --花3000元獲得新年祝福
end

function K_2008xmss_6()
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) >= 3000 then

			if CheckBuff(OwnerID() , 492099) == false then		
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -3000 )
			CastSpell( OwnerID() , OwnerID()  ,492233 )
			CloseSpeak( OwnerID() )
			else
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -3000 )
			CastSpell( OwnerID() , OwnerID()  ,492233 )
			CloseSpeak( OwnerID() )
			end

		else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
		end
--		Say( OwnerID(), "ownerRun1" )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_3()
----我想用10個襪子餅換取黃色聖誕禮物
	if CountBodyItem( OwnerID() , 203484 ) >= 10 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 203484 , 10 )
		GiveBodyItem( OwnerID() , 203481  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_2008xmss_1_s7")   )--祝您聖誕節愉快
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_4()
--我想用10個襪子換取綠色聖誕禮物
	if CountBodyItem( OwnerID() , 203484 ) >= 20 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 203484 , 20 )
		GiveBodyItem( OwnerID() , 203482  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_2008xmss_1_s7")   )--祝您聖誕節愉快
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_5()
--我想用20個襪子換取紅色聖誕禮物
	if CountBodyItem( OwnerID() , 203484 ) >= 50 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 203484 , 50 )
		GiveBodyItem( OwnerID() , 203483  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_2008xmss_1_s7")   )--祝您聖誕節愉快
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function K_2008xmss_7()
----我想知道暖冬節的由來

	SetSpeakDetail( OwnerID(), GetString("K_2008XMSS_1_S10")   )--暖冬節
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "K_2008xmss_1", 0 ) --回到上一頁	
	end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------