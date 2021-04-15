-- the Light of the Lost ( 迷途之光 )

function LuaS_lol()
	SetSpeakDetail( OwnerID() , "你需要什麼服務呢？" )

	AddSpeakOption( OwnerID() , TargetID() ,  "ＸＸＸ在哪裡？（占卜）"     , "LuaS_lol_Augur" , 0 )	-- 增加一個選項：
	AddSpeakOption( OwnerID() , TargetID() ,  "ＸＸＸ任務做了沒？（指引）" , "LuaS_lol_Quest" , 0 )	-- 增加一個選項：
	AddSpeakOption( OwnerID() , TargetID() ,  "我要希望之水！（藥水）"     , "LuaS_lol_Potion" , 0 )	-- 增加一個選項：

end

function LuaS_lol_Augur()
	SetSpeakDetail( OwnerID() , "這裡是占卜" )	-- 
end

function LuaS_lol_Quest()
	CloseSpeak( OwnerID() )		-- 關閉對話視窗

	local Zone1Quest = {}
	Zone1Quest = LuaS_lol_LoadZone1Quest()

	local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )

	local QuestTotal = table.getn( Zone1Quest )
	for i = 1 , QuestTotal do
		if ( CheckAcceptQuest( OwnerID() , Zone1Quest[i][1] ) == true ) then	-- 檢查任務是否接取
			    if ( Zone1Quest[i][1] == 420711 or Zone1Quest[i][1] == 420716 or Zone1Quest[i][1] == 420724 or Zone1Quest[i][1] == 420725 or Zone1Quest[i][1] == 420726 or Zone1Quest[i][1] == 420624 or Zone1Quest[i][1] == 420625 ) then		-- (打怪、採集、點擊)取物類型
				--Say( OwnerID() , "i = "..i )
				--Say( OwnerID() , "test4" )
				Say( TargetID() , "你已經接取了任務|cff00ff00"..Zone1Quest[i][2].."|r，你需要取得|cffff00ff"..Zone1Quest[i][5].."|r交給|cffffff00"..Zone1Quest[i][4].."|r…" )
			elseif ( Zone1Quest[i][1] == 420712 ) then	-- 地點類型
				--Say( OwnerID() , "i = "..i )
				--Say( OwnerID() , "test6" )
				Say( TargetID() , "你已經接取了任務|cff00ff00"..Zone1Quest[i][2].."|r，你可以到|cffffff00"..Zone1Quest[i][4].."|r去看看…" )
			else	-- 一般、找人類型
				--Say( OwnerID() , "i = "..i )
				--Say( OwnerID() , "test5" )
				Say( TargetID() , "你已經接取了任務|cff00ff00"..Zone1Quest[i][2].."|r，你需要去見見|cffffff00"..Zone1Quest[i][4].."|r…" )
			end
			break;
		else	-- 任務已完成或是未接取
			    if ( CheckCompleteQuest( OwnerID() , Zone1Quest[i][1] ) == true ) then
			elseif ( job == 1 and ( Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- 新手職業選戰士
			elseif ( job == 2 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- 新手職業選遊俠
			elseif ( job == 3 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- 新手職業選盜賊
			elseif ( job == 4 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- 新手職業選法師
			elseif ( job == 5 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- 新手職業選祭司
			elseif ( job == 6 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- 新手職業選騎士
			elseif ( job == 7 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420708 ) ) then	-- 新手職業選言靈使
			elseif ( job == 8 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 ) ) then	-- 新手職業選德魯伊
			else
				    if ( Zone1Quest[i][1] == 420712 ) then	-- 地點類型
					--Say( OwnerID() , "i = "..i )
					--Say( OwnerID() , "test1" )
					Say( TargetID() , "|cffffff00"..Zone1Quest[i][3].."|r似乎有點狀況，你可以試著去看看…|cf0f00000"..Zone1Quest[i][2].."|r" )
				else
			--    if ( i == 1 or CheckCompleteQuest( OwnerID() , Zone1Quest[i][1] ) == true ) then
					--Say( OwnerID() , "i = "..i )
					--Say( OwnerID() , "test1" )
					Say( TargetID() , "|cffffff00"..Zone1Quest[i][3].."|r需要協助，你可以試著去見見他…|cf0f00000"..Zone1Quest[i][2].."|r" )
				end
				break;
			end

			--elseif ( CheckFlag( OwnerID() , 540808 ) == true and ( Zone1Quest[i][1] == 420722 or Zone1Quest[i][1] == 420723 or Zone1Quest[i][1] == 420725 or Zone1Quest[i][1] == 420726 ) ) then	-- 重要物品：需要礦石
			--elseif ( CheckFlag( OwnerID() , 540809 ) == true and ( Zone1Quest[i][1] == 420721 or Zone1Quest[i][1] == 420723 or Zone1Quest[i][1] == 420724 or Zone1Quest[i][1] == 420726 ) ) then	-- 重要物品：需要木頭
			--elseif ( CheckFlag( OwnerID() , 540810 ) == true and ( Zone1Quest[i][1] == 420721 or Zone1Quest[i][1] == 420722 or Zone1Quest[i][1] == 420724 or Zone1Quest[i][1] == 420725 ) ) then	-- 重要物品：需要草藥
			--else
			--end
		end
	end
end

function LuaS_lol_Potion()
	-- SetSpeakDetail( OwnerID() , "這裡是賣藥水" )
	CloseSpeak( OwnerID() )		-- 關閉對話視窗
	OpenShop()			-- 打開商店
end

-- 賣藥水
function LuaFunc_Shop_lol()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600088 , "Test_Shop_Close" );
end