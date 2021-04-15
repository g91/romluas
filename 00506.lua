--function setNewRoleJobFlag()	-- 新手職業選ＸＸ的重要物品

--	if ( CheckCompleteQuest( TargetID() , 420701 ) == false and CheckCompleteQuest( TargetID() , 420702 ) == false and CheckCompleteQuest( TargetID() , 420703 ) == false and CheckCompleteQuest( TargetID() , 420704 ) == false and CheckCompleteQuest( TargetID() , 420705 ) == false and CheckCompleteQuest( TargetID() , 420706 ) == false and CheckCompleteQuest( TargetID() , 420707 ) == false and CheckCompleteQuest( TargetID() , 420708 ) == false ) then
--		local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	
--		    if ( job == 0 ) then
--			-- return "管理者"
--		elseif  ( job == 1 ) then
--			SetFlag( TargetID() , 540811 , 1 )	-- 新手職業選戰士
--		elseif  ( job == 2 ) then
--			SetFlag( TargetID() , 540812 , 1 )	-- 新手職業選遊俠
--		elseif  ( job == 3 ) then
--			SetFlag( TargetID() , 540813 , 1 )	-- 新手職業選盜賊
--		elseif  ( job == 4 ) then
--			SetFlag( TargetID() , 540814 , 1 )	-- 新手職業選法師
--		elseif  ( job == 5 ) then
--			SetFlag( TargetID() , 540815 , 1 )	-- 新手職業選祭司
--		elseif  ( job == 6 ) then
--			SetFlag( TargetID() , 540816 , 1 )	-- 新手職業選騎士
--		elseif  ( job == 7 ) then
--			SetFlag( TargetID() , 540817 , 1 )	-- 新手職業選言靈使
--		elseif  ( job == 8 ) then
--			SetFlag( TargetID() , 540818 , 1 )	-- 新手職業選德魯伊
--		end
--		return true
--	end
--end
--function RandomsLivingFlag()	-- 亂數產生一個生產導師任務的重要物品
--	local RND = Rand( 9 ) + 1	-- 產生 1~10 的亂數
--	    if ( RND > 0 and RND <= 4 ) then
--		SetFlag( TargetID() , 540808 , 1 )	-- 需要礦石( 機率 2/5 )
--	elseif ( RND > 4 and RND <= 8 ) then
--		SetFlag( TargetID() , 540809 , 1 )	-- 需要木頭( 機率 2/5 )
--	elseif ( RND > 8 and RND <= 10 ) then
--		SetFlag( TargetID() , 540810 , 1 )	-- 需要藥草( 機率 1/5 )
--	end
--end

--function LuaS_110583()	-- 開墾聚落告示板
--	LoadQuestOption( OwnerID() )	--載入任務模板
--	if ( CheckAcceptQuest( OwnerID() , 420712 ) == true ) then	-- 任務：委託張貼
--	elseif ( CheckAcceptQuest( OwnerID() , 420713 ) == true or CheckCompleteQuest( OwnerID() , 420713 ) == true ) then	-- 任務：愛情困擾
--		if ( CheckFlag( OwnerID() , 540804 ) == true ) then	-- 重要物品：委託任務門檻
--		else
--			SetFlag( OwnerID() , 540804 , 1 )
--		end
--	end
--end

--function AlreadyGiveWeapon()	-- 完成武器領取任務
--	if ( CheckFlag( TargetID() , 540805 ) == true ) then	-- 重要物品：跟武器商人馬洛領武器
--	else
--		SetFlag( TargetID() , 540805 , 1 )
--	end
--	if ( CheckFlag( TargetID() , 540806 ) == true ) then	-- 重要物品：已領取分配的精良武器
--	else
--		SetFlag( TargetID() , 540806 , 1 )
--	end
--end

function LuaS_110658()	-- 武器商人馬洛
	--if ( CheckFlag( OwnerID() , 540805 ) == true ) then	-- 重要物品：跟武器商人馬洛領武器
		LoadQuestOption( OwnerID() )	--載入任務模板
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110658_OpenShop" , 0 )	-- 增加一個選項：開啟商店
	--elseif (CountBodyItem( OwnerID() , 201164 ) >= 1 ) then
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_02") )	-- 雷頓隊長請你過來的嗎？\n\n他委託我幫每位新手冒險者準備一把精良的武器，不過別急，在把武器交給你之前，要不要先參考看看我賣的武器啊？我這個武器商人賣的武器可是保證便宜的喔！
	--	AddSpeakOption( OwnerID() , TargetID() ,  GetString("SO_110658_YES") , "LuaS_110658_Yes" , 0 )	-- 增加一個選項：好，我想參考看看
	--	AddSpeakOption( OwnerID() , TargetID() ,  GetString("SO_110658_NO") ,  "LuaS_110658_No"  , 0 )	-- 增加一個選項：不了，我想趕快領取我分配到的武器
	--else
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_03") )	-- 你是新手冒險者啊，想找我購買武器嗎？\n\n不過我想在這之前，你應該先去見見開墾隊的雷頓隊長才是。
	--end

end
--function LuaS_110658_Yes()	-- 武器商人馬洛
	--SetFlag( OwnerID() , 540805 , 1 )		-- 重要物品：跟武器商人馬洛領武器
	--local RND = Rand( 99 ) + 1	-- 產生 1~100 的亂數
	--    if ( RND > 0 and RND <= 95 ) then
	--elseif ( RND > 95 and RND <= 100 ) then
	--	Say( TargetID() , GetString("ST_NEW_04") )	-- 參考看看，我這個武器商人賣的武器可是保證便宜的喔！( 機率 1/210 )
	--end
	--CloseSpeak( OwnerID() )			-- 關閉對話視窗
	--OpenShop()				-- 打開商店
--end
--function LuaS_110658_No()	-- 武器商人馬洛
--	SetFlag( OwnerID() , 540805, 1 )	-- 重要物品：跟武器商人馬洛領武器
--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_05") )	-- 真是可惜…\n\n好吧，沒關係，那我準備一下分配給你的武器，你等一下再來找我。
--end
function LuaS_110658_OpenShop()	-- 武器商人馬洛一般開商店
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	OpenShop()				-- 打開商店
end

function LuaS_110482()	-- 雷頓
	LoadQuestOption( OwnerID() )	--載入任務模板

--	if ( CheckCompleteQuest( OwnerID() , 420701 ) == false and CheckCompleteQuest( OwnerID() , 420702 ) == false and CheckCompleteQuest( OwnerID() , 420703 ) == false and CheckCompleteQuest( OwnerID() , 420704 ) == false and CheckCompleteQuest( OwnerID() , 420705 ) == false and CheckCompleteQuest( OwnerID() , 420706 ) == false and CheckCompleteQuest( OwnerID() , 420707 ) == false and CheckCompleteQuest( OwnerID() , 420708 ) == false ) then
--		local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- 如果不報到，一開始就來解的話
	
--		    if ( job == 0 ) then
--			-- return "管理者"
--		elseif  ( job == 1 ) then
--			SetFlag( OwnerID() , 540811 , 1 )	-- 新手職業選戰士
--		elseif  ( job == 2 ) then
--			SetFlag( OwnerID() , 540812 , 1 )	-- 新手職業選遊俠
--		elseif  ( job == 3 ) then
--			SetFlag( OwnerID() , 540813 , 1 )	-- 新手職業選盜賊
--		elseif  ( job == 4 ) then
--			SetFlag( OwnerID() , 540814 , 1 )	-- 新手職業選法師
--		elseif  ( job == 5 ) then
--			SetFlag( OwnerID() , 540815 , 1 )	-- 新手職業選祭司
--		elseif  ( job == 6 ) then
--			SetFlag( OwnerID() , 540816 , 1 )	-- 新手職業選騎士
--		elseif  ( job == 7 ) then
--			SetFlag( OwnerID() , 540817 , 1 )	-- 新手職業選言靈使
--		elseif  ( job == 8 ) then
--			SetFlag( OwnerID() , 540818 , 1 )	-- 新手職業選德魯伊
--		end
--	end

end

function LuaS_110489()	-- 藥水商人萊丁
--	if ( CheckAcceptQuest( OwnerID() , 420714 ) == true ) then

		LoadQuestOption( OwnerID() )	--載入任務模板
-- and CountBodyItem( OwnerID() , 200595 ) < 1 ) then	-- 任務：醫治腰痛，物品：舒活藥水
--		SetSpeakDetail( OwnerID() , "古汀老伯的藥水啊？有啊，我已經幫他買回來了，只是一直忘了送過去給他，你可以幫我送過去給他嗎？" )
--		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110489_YES") , "LuaS_110489_Yes" , 0 )	-- 增加一個選項：好的，我可以將藥水過去給古汀老伯
--	else
--		SetSpeakDetail( OwnerID() , GetString("ST_NEW_06") )	-- 當你覺得生命受到威脅，你最好喝個一瓶急救藥水！\n\n當你覺得法術無法施展，你最好喝個一瓶魔力藥水！\n\n覺得我的話有道理嗎？快來買個幾瓶藥水隨身攜帶吧！
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110489_OpenShop" , 0 )	-- 增加一個選項：開啟商店
--	end
end

