function LuaDan_112757_0()
	local captialflag = CheckFlag(OwnerID(), 542520)
	local guardflag = CheckFlag(OwnerID(), 542551)
	local Musicbox  = CountBodyItem( OwnerID() , 204426)		 --音樂盒
	local Passticket = CountBodyItem( OwnerID() , 204526)                       --簽到卷
	local Signflag1 = CheckFlag(OwnerID(), 542529)

	if captialflag == true or guardflag == true then
			if  Signflag1 == false then
				if Passticket  >0 then
					if guardflag == true then 
						SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --簽哨員對話：哎呀呀～這裡是第一個簽哨點！趕快來簽到吧！請先確認身上有沒有簽到卷或是音樂盒喔！
						AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_3]", "Lua_Dan_112757_2", 0) --我是隊員，我要簽到！
					elseif captialflag == true then
						if Musicbox >0  then
							SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --簽哨員對話：哎呀呀～這裡是第一個簽哨點！趕快來簽到吧！請先確認身上有沒有簽到卷或是音樂盒喔！
							AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_2]", "Lua_Dan_112757_1", 0) --我是隊長，我要簽到！
						else
							SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_03]")      --請確認你身上是否有[204426]。musicbox
						end
					end
				else
					SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_01]")      --請確認你身上是否有[204526]。簽到券
				end
			else
				SetSpeakDetail(OwnerID(), "[SC_DAN_112757_8]" )        		--你已經簽到過了喔!  
			end 
	else
		SetSpeakDetail(OwnerID(), "[SC_DAN_112757_7]")        		--你有報名音樂馬術比賽嗎？請確認你是否持有簽到卷喔！    
	end
end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112757_1() --隊長簽到 簽到點1
	local captialflag = CheckFlag(OwnerID(), 542520)
	local guardflag = CheckFlag(OwnerID(), 542551)
	local Musicbox  = CountBodyItem( OwnerID() , 204426)				  --音樂盒
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --簽到卷
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())
	SetFlag( OwnerID()  , 542529 , 1 )  
	SetFlag( OwnerID()  , 542448 , 0 )
	SetFlag( OwnerID()  , 542630 , 0 )
	DelBodyItem( OwnerID() , 204526 , Passticket)		
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_4]" , C_SYSTEM ) --這是第一個簽哨點，你已經簽到了！
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_4]" , C_SYSTEM ) --這是第一個簽哨點，你已經簽到了！
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT02]" , C_SYSTEM ) --第二個簽哨點的位置為[ZONE_MAC DOUGAL FARMSTEAD]風車附近，請把握時間快速到達。
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT02]" , C_SYSTEM ) --第二個簽哨點的位置為[ZONE_MAC DOUGAL FARMSTEAD]風車附近，請把握時間快速到達。

end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112757_2() --隊員簽到 簽到點1
	local Protect  = CheckFlag(OwnerID()  , 542551)                                   --護衛旗標
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --簽到卷
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())   --關閉對話視窗 
	SetFlag( OwnerID()  , 542529 , 1 )  
	DelBodyItem( OwnerID() , 204526 , Passticket)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_4]" , C_SYSTEM ) --這是第一個簽哨點，你已經簽到了！
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_4]" , C_SYSTEM ) --這是第一個簽哨點，你已經簽到了！
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT02]" , C_SYSTEM ) --第二個簽哨點的位置為[ZONE_MAC DOUGAL FARMSTEAD]風車附近，請把握時間快速到達。
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT02]" , C_SYSTEM ) --第二個簽哨點的位置為[ZONE_MAC DOUGAL FARMSTEAD]風車附近，請把握時間快速到達。
end
---------------------------------------------------------------------------------------------------
function LuaDan_112881_0()

	local captialflag = CheckFlag(OwnerID(), 542520)
	local guardflag = CheckFlag(OwnerID(), 542551)
	local Musicbox  = CountBodyItem( OwnerID() , 204426)		 --音樂盒
	local Passticket = CountBodyItem( OwnerID() , 204526)                       --簽到卷
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)

	if captialflag == true or guardflag == true then
			if Signflag1 == true then
				if  Signflag2 == false then
					if Passticket  >0 then
						if guardflag == true then 
							SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --簽哨員對話：哎呀呀～這裡是第一個簽哨點！趕快來簽到吧！請先確認身上有沒有簽到卷或是音樂盒喔！
							AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_3]", "LuaDan_112881_2", 0) --我是隊員，我要簽到！
						elseif captialflag == true then
							if Musicbox >0  then
								SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --簽哨員對話：哎呀呀～這裡是第一個簽哨點！趕快來簽到吧！請先確認身上有沒有簽到卷或是音樂盒喔！
								AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_2]", "LuaDan_112881_1", 0) --我是隊長，我要簽到！
							else
								SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_03]")      --請確認你身上是否有[204426]。musicbox
							end
						end
					else
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_01]")      --請確認你身上是否有[204526]。簽到券
					end
				else
					SetSpeakDetail(OwnerID(), "[SC_DAN_112757_8]" )        		--你已經簽到過了喔!  
				end 
			else
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_02]")      --你上一個簽到點尚未簽到喔！
			end
	else
		SetSpeakDetail(OwnerID(), "[SC_DAN_112757_7]")        		--你有報名音樂馬術比賽嗎？請確認你是否持有簽到卷喔！    
	end
end
---------------------------------------------------------------------------------------------------
function LuaDan_112881_1() --隊長簽到 簽到點2

	local Musicbox  = CountBodyItem( OwnerID() , 204426)				  --音樂盒
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --簽到卷
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())
	SetFlag( OwnerID()  , 542548 , 1 ) 
	SetFlag( OwnerID()  , 542448 , 0 )
	SetFlag( OwnerID()  , 542630 , 0 )
	DelBodyItem( OwnerID() , 204526 , Passticket)     	
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_5]" , C_SYSTEM ) --這是第二個簽哨點，你已經簽到了！
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_5]" , C_SYSTEM ) --這是第二個簽哨點，你已經簽到了！
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT03]" , C_SYSTEM ) --第三個簽哨點的位置為[ZONE_DORIANS FARM]水塔附近，終點就在眼前了。
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT03]" , C_SYSTEM ) --第三個簽哨點的位置為[ZONE_DORIANS FARM]水塔附近，終點就在眼前了。

end

---------------------------------------------------------------------------------------------------
function LuaDan_112881_2()  --隊員簽到 簽到點2

	local Protect  = CheckFlag(OwnerID()  , 542551)                                   --護衛旗標
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --簽到卷
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())   --關閉對話視窗 
	SetFlag( OwnerID()  , 542548 , 1 ) 
	DelBodyItem( OwnerID() , 204526 , Passticket)        	
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_5]" , C_SYSTEM ) --這是第二個簽哨點，你已經簽到了！
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_5]" , C_SYSTEM ) --這是第二個簽哨點，你已經簽到了！
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT03]" , C_SYSTEM ) --第三個簽哨點的位置為[ZONE_DORIANS FARM]水塔附近，終點就在眼前了。
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT03]" , C_SYSTEM ) --第三個簽哨點的位置為[ZONE_DORIANS FARM]水塔附近，終點就在眼前了。

end
---------------------------------------------------------------------------------------------------
function LuaDan_112882_0()
	local captialflag = CheckFlag(OwnerID(), 542520)
	local guardflag = CheckFlag(OwnerID(), 542551)
	local Musicbox  = CountBodyItem( OwnerID() , 204426)		 --音樂盒
	local Passticket = CountBodyItem( OwnerID() , 204526)                       --簽到卷
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	if captialflag == true or guardflag == true then
			if Signflag2 == true then
				if  Signflag3 == false then
					if Passticket  >0 then
						if guardflag == true then 
							SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --簽哨員對話：哎呀呀～這裡是第一個簽哨點！趕快來簽到吧！請先確認身上有沒有簽到卷或是音樂盒喔！
							AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_3]", "LuaDan_112882_2", 0) --我是隊員，我要簽到！
						elseif captialflag == true then
							if Musicbox >0  then
								SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --簽哨員對話：哎呀呀～這裡是第一個簽哨點！趕快來簽到吧！請先確認身上有沒有簽到卷或是音樂盒喔！
								AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_2]", "LuaDan_112882_1", 0) --我是隊長，我要簽到！
							else
								SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_03]")      --請確認你身上是否有[204426]。musicbox
							end
						end
					else
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_01]")      --請確認你身上是否有[204526]。簽到券
					end
				else
					SetSpeakDetail(OwnerID(), "[SC_DAN_112757_8]" )        		--你已經簽到過了喔!  
				end 
			else
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_02]")      --你上一個簽到點尚未簽到喔！
			end
	else
		SetSpeakDetail(OwnerID(), "[SC_DAN_112757_7]")        		--你有報名音樂馬術比賽嗎？請確認你是否持有簽到卷喔！    
	end
end
---------------------------------------------------------------------------------------------------
function LuaDan_112882_1() --隊長簽到 簽到點3

	local Musicbox  = CountBodyItem( OwnerID() , 204426)				  --音樂盒
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --簽到卷
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())   --關閉對話視窗
	SetFlag( OwnerID()  , 542549 , 1 )
	SetFlag( OwnerID()  , 542448 , 0 ) 
	SetFlag( OwnerID()  , 542630 , 0 )
	DelBodyItem( OwnerID() , 204526 , Passticket)     		
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_6]" , C_SYSTEM )       --這是第三個簽哨點，你已經簽到了！
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_6]" , C_SYSTEM )       --這是第三個簽哨點，你已經簽到了！
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT04]" , C_SYSTEM ) --恭喜你已完成活動，請到[ZONE_DORIANS FARM]北方的橋旁找[112756]兌換獎勵。
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT04]" , C_SYSTEM ) --恭喜你已完成活動，請到[ZONE_DORIANS FARM]北方的橋旁找[112756]兌換獎勵。	
end 
---------------------------------------------------------------------------------------------------
function LuaDan_112882_2() --隊員簽到
	local Protect  = CheckFlag(OwnerID()  , 542551)                                   --護衛旗標
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --簽到卷
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)
		
	CloseSpeak(OwnerID())   --關閉對話視窗 
	SetFlag( OwnerID()  , 542549 , 1 ) 
	DelBodyItem( OwnerID() , 204526 , Passticket)       		
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_6]" , C_SYSTEM )       --這是第三個簽哨點，你已經簽到了！
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_6]" , C_SYSTEM )       --這是第三個簽哨點，你已經簽到了！
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT04]" , C_SYSTEM ) --恭喜你已完成活動，請到[ZONE_DORIANS FARM]北方的橋旁找[112756]兌換獎勵。
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT04]" , C_SYSTEM ) --恭喜你已完成活動，請到[ZONE_DORIANS FARM]北方的橋旁找[112756]兌換獎勵。
end
---------------------------------------------------------------------------------------------------
function LuaDan_112757_Signer_01()
	SetPlot( OwnerID() ,"range",  "LuaDan_112757_Signer_02" , 100 )
end

function LuaDan_112757_Signer_02() 
	 local MusicBox =  CountBodyItem( TargetID() , 204426 ) 
	 local LeadFlag = CheckFlag(TargetID()  , 542520)   --隊長旗標        
	local Flag1 =   CheckFlag(TargetID()  , 542529)  --第一簽哨點
	local Flag2 =   CheckFlag(TargetID()  , 542548)  --第二簽哨點
	local Flag3 =   CheckFlag(TargetID()  , 542549 ) --第三簽哨點                
	if MusicBox ~= 0 and LeadFlag == true and Flag1 == false  then 
		ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_3]" , C_SYSTEM ) --真是不簡單，可以到達這裡，不過沒有簽到卷向我簽到也不行喔！
	end 
end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112881_Signer_01()
	SetPlot( OwnerID() ,"range",  "LuaDan_112881_Signer_02" , 100 )
end

function LuaDan_112881_Signer_02() 
	 local MusicBox =  CountBodyItem( TargetID() , 204426 ) 		
	 local LeadFlag = CheckFlag(TargetID()  , 542520)   --隊長旗標        
	local Flag1 =   CheckFlag(TargetID()  , 542529)  --第一簽哨點
	local Flag2 =   CheckFlag(TargetID()  , 542548)  --第二簽哨點
	local Flag3 =   CheckFlag(TargetID()  , 542549 ) --第三簽哨點                
	if MusicBox ~= 0 and LeadFlag == true and Flag2== false  then 
		ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_3]" , C_SYSTEM ) --真是不簡單，可以到達這裡，不過沒有簽到卷向我簽到也不行喔！
	end 
end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112882_Signer_01()
	SetPlot( OwnerID() ,"range",  "LuaDan_112882_Signer_02" , 100 )
end

function LuaDan_112882_Signer_02() 
	 local MusicBox =  CountBodyItem( TargetID() , 204426 ) 		
	 local LeadFlag = CheckFlag(TargetID()  , 542520)   --隊長旗標        
	local Flag1 =   CheckFlag(TargetID()  , 542529)  --第一簽哨點
	local Flag2 =   CheckFlag(TargetID()  , 542548)  --第二簽哨點
	local Flag3 =   CheckFlag(TargetID()  , 542549 ) --第三簽哨點                
	if MusicBox ~= 0 and LeadFlag == true and Flag3 == false then 
		ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_3]" , C_SYSTEM ) --真是不簡單，可以到達這裡，不過沒有簽到卷向我簽到也不行喔！
	end
end