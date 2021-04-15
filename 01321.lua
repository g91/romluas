function LuaDan_112756_0()
	
	SetSpeakDetail(OwnerID(), "[SC_DAN_112756_1]" )					  --兌獎員對話內容
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112756_2]", "Lua_Dan_112756_1", 0) --我要送回音樂盒 --隊長
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112756_3]", "Lua_Dan_112756_2", 0) --我要兌換團隊獎勵 --隊員
end

---------------------------------------------------------------------------------------------------
function Lua_Dan_112756_1() --隊長獎勵
	
	local Flag1 =	 CheckFlag(OwnerID()  , 542520)                                         --第一次接任務
	local Flag2 =	 CheckFlag(OwnerID()  , 542527)                                         --第二次接任務
	local Flag3 =	 CheckFlag(OwnerID()  , 542528)                                         --第三次接任務
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)
	local FinishMission = CheckFlag(OwnerID()  , 542550)    				--已經完成音樂馬術比賽
	local Musicbox  = CountBodyItem( OwnerID() , 204426)
	local locationpapaer =  CountBodyItem( OwnerID() , 204604 ) --地理資訊
	
	if FinishMission == false then
		
		if Flag1 == true then           --接過任務
				
				if Musicbox ~= 0 and Signflag1 == true and Signflag2 == true and Signflag3 == true then  --身上有音樂盒
					SetSpeakDetail(OwnerID(), "[SC_DAN_112756_4]")   --哇！你們平安到達終點了！謝謝你送回音樂盒！就給你這個做為回報吧！ 
					GiveBodyItem( OwnerID() , 204457, 5 ) 	 --給樂譜 
					SetFlag(OwnerID(), 542552, 0) --防止重覆報名
					SetFlag( OwnerID()  , 542529 , 0 ) --第一個簽哨點
					SetFlag( OwnerID()  , 542548 , 0 ) --第二個簽哨點
					SetFlag( OwnerID()  , 542549 , 0 ) --第三個簽哨點
					SetFlag( OwnerID()  , 542448 , 0 ) --防止不斷產出怪或簽哨員   
					SetFlag( OwnerID()  , 542630 , 0 ) --再度生怪 
					SetFlag(OwnerID()  , 542520  , 0) --隊長旗標
					SetFlag(OwnerID()  , 542550  , 1) --今天已完成隊長
				--	CastSpelllv  (TargetID(), OwnerID() , 493096, 0)  --施放一個範圍法術
					ClockClose( OwnerID() )	
					CancelBuff( OwnerID(), 501635 )
					CancelBuff( OwnerID(), 503212)	
					DelBodyItem(OwnerID() , 204426 , MusicBox) --收走玩家身上音樂盒
					DelBodyItem(OwnerID() , 204604 , locationpapaer) --收走玩家身上道具
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)				
				else
				
					SetSpeakDetail (OwnerID(), "[SC_DAN_112698_18]")  --你身上沒有音樂盒喔～！請找約翰．巴哈領取喔！有音樂盒？請確認 3 個簽哨點都簽到過了！
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
				end


		else 
			SetSpeakDetail (OwnerID(), "[SC_DAN_112756_5]")  --你有去找約翰．巴哈報名音樂馬術比賽嗎？趕快去確認看看喔！
			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
		end
	else 
		SetSpeakDetail (OwnerID(), "[SC_DAN_112756_6]")  --你今天已經參加過
		AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
	
	end
end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112756_2() --隊員獎勵

--say(OwnerID(), "1") --玩家
--say(TargetID(), "2") --NPC
	local Guardflag = CheckFlag(OwnerID()  , 542551) 
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)
	local locationpapaer =  CountBodyItem( OwnerID() , 204604 ) --地理資訊	
		if Guardflag == true and Signflag1 == true and Signflag2 == true and Signflag3 == true then --有所有簽哨點的flag

			SetSpeakDetail(OwnerID(), "[SC_DAN_112756_7]")   --你真是一名值得信賴的好隊友，這是感謝你將音樂盒送回給我的獎勵喔！
			GiveBodyItem( OwnerID() , 204457, 3 ) 	 --給樂譜 
		--	CastSpelllv  (TargetID(), OwnerID() , 492964, 0)  --施放一個範圍法術
			DelBodyItem(OwnerID() , 204604 , locationpapaer) --收走玩家身上音樂盒
			CancelBuff( OwnerID(), 501635 )
			CancelBuff( OwnerID(), 503215)
			SetFlag(OwnerID(), 542551, 0) --護衛旗標
			SetFlag(OwnerID() ,542527, 1) --今天已完成隊員
			SetFlag(OwnerID(), 542552, 0) --防止重覆報名
			SetFlag( OwnerID()  , 542529 , 0 ) --第一個簽哨點
			SetFlag( OwnerID()  , 542548 , 0 ) --第二個簽哨點
			SetFlag( OwnerID()  , 542549 , 0 ) --第三個簽哨點
			SetFlag( OwnerID()  , 542448 , 0 ) --防止不斷產出怪或簽哨員   
			SetFlag( OwnerID()  , 542630 , 0 ) --再度生怪 
			ClockClose( OwnerID() )
			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
		else 
			SetSpeakDetail (OwnerID(), "[SC_DAN_112756_8]")  --你有向約翰．巴哈報名參加音樂馬術比賽嗎？記得確認自己有沒有跟簽哨員簽到喔！
			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
		end	
end
---------------------------------------------------------------------------------------------------