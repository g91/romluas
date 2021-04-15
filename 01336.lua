--節慶活動 5月愛樂節  音符階梯
--建立時間: 2009/04/16
--修改日期: 2009/04/27
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--掛在 任務NPC   (6號  RA)  112776  CODE
------------------------------------------------------------------------------
function LuaN_musicfes_112776_range()  
		SetPlot( OwnerID(), "touch", "LuaN_musicfes_112776_sing", 50 );
end
------------------------------------------------------------------------------
function LuaN_musicfes_112776_sing()
	local Qeasy01= CheckFlag(OwnerID()  , 542542) -- 接下挑戰簡單Q1   刪除點: 完成最後階段時
	local Qeasy02= CheckFlag(OwnerID()  , 542543) -- 接下挑戰簡單Q2   刪除點: 完成最後階段時
	local Qeasy03= CheckFlag(OwnerID()  , 542544) -- 接下挑戰簡單Q3   刪除點: 完成最後階段時
	local Qhard01= CheckFlag(OwnerID()  , 542545) -- 接下挑戰困難Q1   刪除點: 完成最後階段時
	local Qhard02= CheckFlag(OwnerID()  , 542546) -- 接下挑戰困難Q2   刪除點: 完成最後階段時
	local Qhard03= CheckFlag(OwnerID()  , 542547) -- 接下挑戰困難Q3   刪除點: 完成最後階段時

	local Aeasy= CheckFlag(OwnerID()  , 542521) -- 接下挑戰簡單  刪除點:完成最後階段時
	local Ahard= CheckFlag(OwnerID()  , 542522) -- 接下挑戰困難  刪除點: 完成最後階段時

	local Deasy= CheckFlag(OwnerID()  , 542523) -- 達成目標 簡單 Flag  刪除點:回報活動時
	local Dhard= CheckFlag(OwnerID()  , 542524) -- 達成目標 困難Flag   刪除點:回報活動時

	local todayE= CheckFlag(OwnerID()  , 542525) -- 今天過完簡單Flag
	local todayH= CheckFlag(OwnerID()  , 542526) --今天過完困難Flag

	local step00=  CheckFlag(OwnerID()  , 542530) -- 第0個音符 
	local step01=  CheckFlag(OwnerID()  , 542531) -- 第1個音符 
	local step02=  CheckFlag(OwnerID()  , 542532) -- 第2個音符 
	local step03=  CheckFlag(OwnerID()  , 542533) -- 第3個音符 
	local step04=  CheckFlag(OwnerID()  , 542534) -- 第4個音符 
	local step05=  CheckFlag(OwnerID()  , 542535) -- 第5個音符 
	local step06=  CheckFlag(OwnerID()  , 542536) -- 第6個音符 
	local step07=  CheckFlag(OwnerID()  , 542537) -- 第7個音符 
	local step08=  CheckFlag(OwnerID()  , 542538) -- 第8個音符 
	local step09=  CheckFlag(OwnerID()  , 542539) -- 第9個音符 
	local step10=  CheckFlag(OwnerID()  , 542540) -- 第10個音符 
	local step11=  CheckFlag(OwnerID()  , 542541) -- 第11個音符 

	PlaySoundToPlayer( OwnerID() , "sound/sound_new/skill/Music_Festival/scale/6.mp3", false )

		if Qhard01 == true then --Q困難1  3
			if step11 == true or step10 == true or step09 == true or step08 == true or step07 == true or step06 == true or step05 == true or step04 == true or step03 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2秒
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--你答錯囉！請重新來過吧！
				SetFlag( OwnerID()  , 542531 , 0 ) -- 刪旗標1
				SetFlag( OwnerID()  , 542532 , 0 ) -- 刪旗標2
				SetFlag( OwnerID()  , 542533 , 0 ) -- 刪旗標3
				SetFlag( OwnerID()  , 542534 , 0 ) -- 刪旗標4
				SetFlag( OwnerID()  , 542535 , 0 ) -- 刪旗標5
				SetFlag( OwnerID()  , 542536 , 0 ) -- 刪旗標6
				SetFlag( OwnerID()  , 542537 , 0 ) -- 刪旗標7
				SetFlag( OwnerID()  , 542538 , 0 ) -- 刪旗標8
				SetFlag( OwnerID()  , 542539 , 0 ) -- 刪旗標9
				SetFlag( OwnerID()  , 542540 , 0 ) -- 刪旗標10
				SetFlag( OwnerID()  , 542541 , 0 ) -- 刪旗標11
				SetFlag( OwnerID()  , 542530 , 1 ) -- 給旗標0
			else
				if step02 == true then -- 如果有step 02
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2秒
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
					SetFlag( OwnerID()  , 542533 , 1 ) -- 給 Flag Q03
					SetFlag( OwnerID()  , 542532 , 0 ) -- 刪 Flag Q02
				end
			end
		elseif Qhard02 == true then --Q困難2  11
			if step11 == true or step09 == true or step08 == true or step07 == true or step06 == true or step05 == true or step04 == true or step03 == true or step02== true or step01== true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2秒
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--你答錯囉！請重新來過吧！
				SetFlag( OwnerID()  , 542531 , 0 ) -- 刪旗標1
				SetFlag( OwnerID()  , 542532 , 0 ) -- 刪旗標2
				SetFlag( OwnerID()  , 542533 , 0 ) -- 刪旗標3
				SetFlag( OwnerID()  , 542534 , 0 ) -- 刪旗標4
				SetFlag( OwnerID()  , 542535 , 0 ) -- 刪旗標5
				SetFlag( OwnerID()  , 542536 , 0 ) -- 刪旗標6
				SetFlag( OwnerID()  , 542537 , 0 ) -- 刪旗標7
				SetFlag( OwnerID()  , 542538 , 0 ) -- 刪旗標8
				SetFlag( OwnerID()  , 542539 , 0 ) -- 刪旗標9
				SetFlag( OwnerID()  , 542540 , 0 ) -- 刪旗標10
				SetFlag( OwnerID()  , 542541 , 0 ) -- 刪旗標11
				SetFlag( OwnerID()  , 542530 , 1 ) -- 給旗標0
			else
				if step10 == true then -- 如果有step 10
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2秒
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
					SetFlag( OwnerID()  , 542541 , 1 ) -- 給 Flag Q11
					SetFlag( OwnerID()  , 542540 , 0 ) -- 刪 Flag Q10
				end
			end	
		elseif Qhard03 == true then --Q困難3   12 , 11, 10
			if step08 == true or step07 == true or step06 == true or step05 == true or step04 == true or step03 == true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2秒
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--你答錯囉！請重新來過吧！
				SetFlag( OwnerID()  , 542531 , 0 ) -- 刪旗標1
				SetFlag( OwnerID()  , 542532 , 0 ) -- 刪旗標2
				SetFlag( OwnerID()  , 542533 , 0 ) -- 刪旗標3
				SetFlag( OwnerID()  , 542534 , 0 ) -- 刪旗標4
				SetFlag( OwnerID()  , 542535 , 0 ) -- 刪旗標5
				SetFlag( OwnerID()  , 542536 , 0 ) -- 刪旗標6
				SetFlag( OwnerID()  , 542537 , 0 ) -- 刪旗標7
				SetFlag( OwnerID()  , 542538 , 0 ) -- 刪旗標8
				SetFlag( OwnerID()  , 542539 , 0 ) -- 刪旗標9
				SetFlag( OwnerID()  , 542540 , 0 ) -- 刪旗標10
				SetFlag( OwnerID()  , 542541 , 0 ) -- 刪旗標11
				SetFlag( OwnerID()  , 542530 , 1 ) -- 給旗標0
			else
				if step11 == true then -- 如果有step 11
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2秒
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_ALLRIGHT]", C_SYSTEM )--恭喜你完成挑戰囉，請回去找[112590]吧！
					SetFlag( OwnerID()  , 542524 , 1 ) -- 給 達成目標 困難Flag 
					SetFlag( OwnerID()  , 542547 , 0 ) -- 刪 接下挑戰困難Q3 		
					SetFlag( OwnerID()  , 542541 , 0 ) -- 刪 旗標11
					SetFlag( OwnerID()  , 542522 , 0 ) -- 刪 旗標 接下挑戰困難
				else
					if step10 == true then -- 如果有step 10
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
						Sleep(10) --2秒
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
						SetFlag( OwnerID()  , 542541 , 1 ) -- 給 Flag Q11
						SetFlag( OwnerID()  , 542540 , 0 ) -- 刪 Flag Q10
					else
						if step09 == true then -- 如果有step 09
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
							Sleep(10) --2秒
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
							SetFlag( OwnerID()  , 542540 , 1 ) -- 給 Flag Q10
							SetFlag( OwnerID()  , 542539 , 0 ) -- 刪 Flag Q09
						end
					end
				end
			end
		elseif Qeasy01 == true then  --Q簡單1  x
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
			Sleep(10) --2秒
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--你答錯囉！請重新來過吧！
			SetFlag( OwnerID()  , 542531 , 0 ) -- 刪旗標1
			SetFlag( OwnerID()  , 542532 , 0 ) -- 刪旗標2
			SetFlag( OwnerID()  , 542533 , 0 ) -- 刪旗標3
			SetFlag( OwnerID()  , 542534 , 0 ) -- 刪旗標4
			SetFlag( OwnerID()  , 542535 , 0 ) -- 刪旗標5
			SetFlag( OwnerID()  , 542536 , 0 ) -- 刪旗標6
			SetFlag( OwnerID()  , 542537 , 0 ) -- 刪旗標7
			SetFlag( OwnerID()  , 542538 , 0 ) -- 刪旗標8
			SetFlag( OwnerID()  , 542539 , 0 ) -- 刪旗標9
			SetFlag( OwnerID()  , 542540 , 0 ) -- 刪旗標10
			SetFlag( OwnerID()  , 542541 , 0 ) -- 刪旗標11
			SetFlag( OwnerID()  , 542530 , 1 ) -- 給旗標0
		elseif Qeasy02 == true then --Q簡單2     6.5
			if step06 == true or step03 == true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2秒
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--你答錯囉！請重新來過吧！
				SetFlag( OwnerID()  , 542531 , 0 ) -- 刪旗標1
				SetFlag( OwnerID()  , 542532 , 0 ) -- 刪旗標2
				SetFlag( OwnerID()  , 542533 , 0 ) -- 刪旗標3
				SetFlag( OwnerID()  , 542534 , 0 ) -- 刪旗標4
				SetFlag( OwnerID()  , 542535 , 0 ) -- 刪旗標5
				SetFlag( OwnerID()  , 542536 , 0 ) -- 刪旗標6
				SetFlag( OwnerID()  , 542537 , 0 ) -- 刪旗標7
				SetFlag( OwnerID()  , 542538 , 0 ) -- 刪旗標8
				SetFlag( OwnerID()  , 542539 , 0 ) -- 刪旗標9
				SetFlag( OwnerID()  , 542540 , 0 ) -- 刪旗標10
				SetFlag( OwnerID()  , 542541 , 0 ) -- 刪旗標11
				SetFlag( OwnerID()  , 542530 , 1 ) -- 給旗標0
			else
				if step05 == true then -- 如果有step 05
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2秒
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
					SetFlag( OwnerID()  , 542536 , 1 ) -- 給 Flag Q06
					SetFlag( OwnerID()  , 542535 , 0 ) -- 刪 Flag Q05
				else
					if step04 == true then -- 如果有step 04
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
						Sleep(10) --2秒
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT02]", C_SYSTEM )--再差一點就過關了，加油～！！
						SetFlag( OwnerID()  , 542535 , 1 ) -- 給 Flag Q05
						SetFlag( OwnerID()  , 542534 , 0 ) -- 刪 Flag Q04
					end
				end
			end
		elseif Qeasy03 == true then --Q簡單2     7, 6
			if step04 == true or step03 == true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2秒
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--你答錯囉！請重新來過吧！
				SetFlag( OwnerID()  , 542531 , 0 ) -- 刪旗標1
				SetFlag( OwnerID()  , 542532 , 0 ) -- 刪旗標2
				SetFlag( OwnerID()  , 542533 , 0 ) -- 刪旗標3
				SetFlag( OwnerID()  , 542534 , 0 ) -- 刪旗標4
				SetFlag( OwnerID()  , 542535 , 0 ) -- 刪旗標5
				SetFlag( OwnerID()  , 542536 , 0 ) -- 刪旗標6
				SetFlag( OwnerID()  , 542537 , 0 ) -- 刪旗標7
				SetFlag( OwnerID()  , 542538 , 0 ) -- 刪旗標8
				SetFlag( OwnerID()  , 542539 , 0 ) -- 刪旗標9
				SetFlag( OwnerID()  , 542540 , 0 ) -- 刪旗標10
				SetFlag( OwnerID()  , 542541 , 0 ) -- 刪旗標11
				SetFlag( OwnerID()  , 542530 , 1 ) -- 給旗標0
			else
				if step06 == true then -- 如果有step 06
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2秒
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_ALLRIGHT]", C_SYSTEM )--恭喜你完成挑戰囉，請回去找[112590]吧！
					SetFlag( OwnerID()  , 542523 , 1 ) -- 給 達成目標 簡單Flag 
					SetFlag( OwnerID()  , 542544 , 0 ) -- 刪 接下挑戰簡單Q3 		
					SetFlag( OwnerID()  , 542536 , 0 ) -- 刪 旗標06
					SetFlag( OwnerID()  , 542521 , 0 ) -- 刪 旗標 接下挑戰簡單
				else
					if step05 == true then -- 如果有step 05
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
						Sleep(10) --2秒
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
						SetFlag( OwnerID()  , 542536 , 1 ) -- 給 Flag Q06
						SetFlag( OwnerID()  , 542535 , 0 ) -- 刪 Flag Q05
					end
				end
			end
		else
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
		end
end		