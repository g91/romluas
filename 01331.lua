--節慶活動 5月愛樂節  音符階梯
--建立時間: 2009/04/16
--修改日期: 2009/04/27
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--掛在 任務NPC   (1號   DO)  112771  CODE
------------------------------------------------------------------------------
function LuaN_musicfes_112771_range()  
		SetPlot( OwnerID(), "touch", "LuaN_musicfes_112771_sing", 50 );
end
------------------------------------------------------------------------------
function LuaN_musicfes_112771_sing()
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

	PlaySoundToPlayer( OwnerID() , "sound/sound_new/skill/Music_Festival/scale/1.mp3", false )  --2011.04.11 NEW SOUND

		if Qhard01 == true then --Q困難1  12
			if step10== true or step09== true or step08== true or step07== true or step06== true or step05== true or step04== true or step03== true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_ALLRIGHT]", C_SYSTEM )--恭喜你完成挑戰囉，請回去找[112590]吧！
					SetFlag( OwnerID()  , 542524 , 1 ) -- 給 達成目標 困難Flag 
					SetFlag( OwnerID()  , 542545 , 0 ) -- 刪 接下挑戰困難Q1 		
					SetFlag( OwnerID()  , 542541 , 0 ) -- 刪 旗標11
					SetFlag( OwnerID()  , 542522 , 0 ) -- 刪 旗標 接下挑戰困難
				end
			end
		elseif Qhard02 == true then --Q困難2  9
			if step11 == true or step10 == true or step09 == true or step07 == true or step06 == true or step05 == true or step04 == true or step03 == true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step08 == true then  -- 如果有step 08
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT02]", C_SYSTEM )--再差一點就過關了，加油～！！
					SetFlag( OwnerID()  , 542539 , 1 ) -- 給 Flag Q9 
					SetFlag( OwnerID()  , 542538 , 0 ) -- 刪 Flag Q8 			
				end
			end
		elseif Qhard03 == true then --Q困難3  9.8.1
			if step11== true or step10== true or step09== true or step06 == true or step05== true or step04== true or step03 == true or step02 == true or step01 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step08== true then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT02]", C_SYSTEM )--再差一點就過關了，加油～！！
					SetFlag( OwnerID()  , 542539 , 1 ) -- 給 Flag Q9 
					SetFlag( OwnerID()  , 542538 , 0 ) -- 刪 Flag Q8 
				else
					if step07== true then
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
						SetFlag( OwnerID()  , 542538 , 1 ) -- 給 Flag Q8
						SetFlag( OwnerID()  , 542537 , 0 ) -- 刪 Flag Q7 
					else
						if step00== true then
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
							SetFlag( OwnerID()  , 542531 , 1 ) -- 給 Flag Q01
							SetFlag( OwnerID()  , 542530 , 0 ) -- 刪 Flag Q00 
						end
					end
				end
			end
		elseif Qeasy01 == true then  --Q簡單1  6.4.1
			if step06 == true or step04 == true or step02 == true or step01 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step05== true then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
					SetFlag( OwnerID()  , 542536 , 1 ) -- 給 Flag Q6
					SetFlag( OwnerID()  , 542535 , 0 ) -- 刪 Flag Q5
				else
					if step03== true then
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
						SetFlag( OwnerID()  , 542534 , 1 ) -- 給 Flag Q
						SetFlag( OwnerID()  , 542533 , 0 ) -- 刪 Flag Q3 
					else
						if step00== true then
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
							SetFlag( OwnerID()  , 542531 , 1 ) -- 給 Flag Q01
							SetFlag( OwnerID()  , 542530 , 0 ) -- 刪 Flag Q00 
						end
					end
				end
			end
		elseif Qeasy02 == true then  -- 2 , 1
			if step06 == true or step05 == true or step04 == true or step03 == true or step02 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step01 == true then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
					SetFlag( OwnerID()  , 542532 , 1 ) -- 給 Flag Q2
					SetFlag( OwnerID()  , 542531 , 0 ) -- 刪 Flag Q1 
				else
					if step00== true then
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
						SetFlag( OwnerID()  , 542531 , 1 ) -- 給 Flag Q01
						SetFlag( OwnerID()  , 542530 , 0 ) -- 刪 Flag Q00 
					end
				end
			end
		elseif Qeasy03 == true then  -- 2 , 1	
			if step06 == true or step05 == true or step04 == true or step03 == true or step02 == true then
	 			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step01 == true then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
					SetFlag( OwnerID()  , 542532 , 1 ) -- 給 Flag Q2
					SetFlag( OwnerID()  , 542531 , 0 ) -- 刪 Flag Q1 
				else
					if step00== true then
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--你答對囉，繼續保持下去吧！
						SetFlag( OwnerID()  , 542531 , 1 ) -- 給 Flag Q01
						SetFlag( OwnerID()  , 542530 , 0 ) -- 刪 Flag Q00 
					end
				end
			end		
		else
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
		end
end
------------------------------------------------------------------------------