function LuaS_117324()

-- Zone13專用取得新手職業旗標

	LoadQuestOption( OwnerID() )

	if ( CheckFlag( OwnerID() , 540804 ) == false ) then

		local jobflag = ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) + 544753 	-- 直接取得玩家職業flag編號（544754~544761）
	
		    if ( jobflag == 544753 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YOUAREGM]", 0 ) -- 你是遊戲管理者，你無法由遊戲中職業導師NPC取得副職業。請使用GM命令。
		elseif  ( jobflag > 544761 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_NEWJOBADDED]", 0 ) -- 注意，取得職業時發生了不明錯誤！可能是玩家選擇了新版本新增的職業造成了錯誤！
		elseif  ( jobflag < 544753 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_ERROR_GETJOB]", 0 ) -- 注意，取得職業時發生了不明錯誤！
		else
			SetFlag( OwnerID() , jobflag , 1 )	-- 直接照新手職業插flag
		end
		SetFlag( OwnerID() , 540804 , 1 )	-- 新手職業已選
	end
end


function LuaS_117407_0() --信箱
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENMAIL]", "LuaS_117407_1", 0 ) --/*開啟信箱
end

function LuaS_117407_1()
	CloseSpeak( OwnerID() )
	MyOpenMail()	
end

function LuaS_117307_1()
	if CheckAcceptQuest( OwnerID(), 423863 ) == true then
		SetSpeakDetail(OwnerID(), "[SC_423863_1]") -- 你好，今天要點什麼呢？雖然我們在補給供應上遇到不少困難，但你都可以跟我提看看。
		AddSpeakOption(OwnerID(), TargetID() ,"[SO_423863_1]" ,"LuaS_117307_2", 0) -- 不好意思，請問有可以用來泡花茶的花瓣嗎？
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_117307_2()
	SetSpeakDetail(OwnerID(), "[SC_423863_2]") -- 咦？你是說花茶嗎？（下略）
	SetFlag(OwnerID(), 544749, 1)
end

function LuaS_117305_1()
	if CheckAcceptQuest( OwnerID(), 423860 ) == true then
		SetSpeakDetail(OwnerID(), "[SC_423860_1]") -- 抱怨虧本
		AddSpeakOption(OwnerID(), TargetID() ,"[SO_423860_1]" ,"LuaS_117305_2", 0) -- 您好，鐵匠老漢生讓我來跟你拿貴商會承諾贊助的符文…
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_117305_2()
	if CountBodyItem(OwnerID(), 209034) <= 0 then
		SetSpeakDetail(OwnerID(), "[SC_423860_2]") -- 符文？啊，對對，似乎確實是有這麼一回事…（下略
		AddSpeakOption(OwnerID(), TargetID() ,"[SO_423860_2]" ,"LuaS_117305_3", 0) -- 謝謝貴會的慷慨捐助，銀野冒險者協會會永遠記得你們的貢獻的。
	else
		SetSpeakDetail(OwnerID(), "[SC_423860_3]") -- 這…如果你拿了還想再拿，我會很困擾的。那可不是普通的石頭，是珍貴的符文吶…
		AddSpeakOption(OwnerID(), TargetID() ,"[SO_423860_3]" ,"LuaS_117305_3", 0) -- 對、對不起，我一時忙糊塗了，都忘記跟你拿過符文了。
	end
end

---- 鑲嵌

function LuaFA_117290_01()
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckFlag(Owner,544779) == TRUE and CheckFlag(Owner,544741) == FALSE
	and CheckAcceptQuest(Owner,423861) == TRUE then
		DebugMsg(0,0,"in")
		SetSpeakDetail(Owner,"[SC_117290_01]")	-- 你鑲嵌好了嗎？
		AddSpeakOption(Owner,Target,"[SC_117290_O_01]","LuaFA_117290_Check",0)	-- 鑲嵌好了，請驗收
		AddSpeakOption(Owner,Target,"[SC_117290_O_02]","LuaFA_117290_Skip",0)	-- 呃，你給我的東西弄丟了…
	else
		DebugMsg(0,0,"out")
		LoadQuestOption(Owner)
	end
end

function LuaFA_117290_Check(Mode)
	local TempRune
	local Owner
	local Target

	if Mode == 1 then
		Target = OwnerID()
		Owner = TargetID()
	else
		Owner = OwnerID()
		Target = TargetID()
	end

	local Rune1 = EM_ItemValueType_Rune1

	for i = 0 , 30	do
		for j = 0, 3	do
			TempRune = GetItemInfo( Owner , EM_ItemPacketType_EQ , i , Rune1 + j )
			if TempRune == 520121 then
				if Mode == 1 then
					FA_Dialog_Choose( Owner, "[SC_117290_OK]", nil, nil, 1, 1 ) -- 喔喔，你在xxx上面鑲了ooo啊
					SetFlag(Owner,544741,1)	-- 過關					
				else
					SetSpeakDetail(Owner,"[SC_117290_OK]")	-- 喔喔，你在xxx上面鑲了ooo啊
					SetFlag(Owner,544741,1)	-- 過關
--					LoadQuestOption(Owner)
				end
				return
			end
		end
	end
	if Mode == 1 then
		FA_Dialog_Choose( Owner, "[SC_117290_NO]", nil, nil, 1, 1 ) -- 喔喔，你在xxx上面鑲了ooo啊
	else
		SetSpeakDetail(Owner,"[SC_117290_NO]")	-- 我沒看到你身上有啊，如果你有，就穿在身上給我看吧。
	end
end

function LuaFA_117290_Skip(Mode)
	local Owner
	local Target

	if Mode == 1 then
		Target = OwnerID()
		Owner = TargetID()
	else
		Owner = OwnerID()
		Target = TargetID()
	end

	if Mode == 1 then
		FA_Dialog_Choose( Owner, "[SC_117290_SKIP]", nil, nil, 1, 1 ) -- ...再給你就不夠了，放棄吧。
	else
		SetSpeakDetail(Owner,"[SC_117290_SKIP]")	-- ...再給你就不夠了，放棄吧。
	end
	SetFlag(Owner,544741,1)	-- 只好給你過關
end

function LuaFA_423861()

	local Target = TargetID()
	local Option = {	{ "[SC_117290_O_01]",	function ()
								LuaFA_117290_Check(1)
							end				},

				{ "[SC_117290_O_02]",	function ()
								LuaFA_117290_Skip(1)
							end				}	}

	if CheckFlag( Target, 544779 ) == FALSE then

		FA_Dialog_Choose( Target, "[SC_423861_GIVE]", nil, nil, 1 ) -- 這個符文跟打洞器給你
		SetFlag( Target, 544779, 1)
		GiveBodyItem( Target, 520121, 1)
		GiveBodyItem( Target, 209307, 1)
	elseif CheckFlag( Target, 544741 ) ~= TRUE then
		DebugMsg(0,0,"test")
		FA_Dialog_Choose( Target, "[SC_117290_01]", Option, nil, 1 ) -- 你鑲嵌好了嗎？
	end
end

function LuaFA_423861_Done()
	local Target = TargetID()
	SetFlag( Target, 544779, 0)
	SetFlag( Target, 544741, 0)
end

-----


function LuaS_117305_3()
	if CountBodyItem(OwnerID(), 209034) <= 0 then
		GiveBodyItem(OwnerID(), 209034, 1)
	end
	CloseSpeak(OwnerID())
end

function LuaS_423863_Teatime()
	addbuff(TargetID(),508708,1,600) -- 記得改回600
	LuaS_423863_Count()
end

function LuaS_423863_Count()
	local x
	x = FN_CountBuffLevel(TargetID(), 508709)	-- 取得508709這個buff的堆疊量（計數）
	if x >= 4 then				-- 若超過3次，則
		SetFlag(TargetID(), 544751, 1)	-- 給「娜可的友情」
	else					-- 沒超過就繼續往上疊
		if x == -1 then
			x = 0
		end
		x = x + 1
		CancelBuff(TargetID(), 508709)
		AddBuff(TargetID(),508709, x, -1)
		x = FN_CountBuffLevel(TargetID(), 508709)
	end
end

function LuaS_209054_book_0()	--掛在209054之下
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_209054_BOOK]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_209054_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

function LuaS_117289_1()
	if CheckAcceptQuest(OwnerID(), 423896) == true and DW_CheckRide(OwnerID()) == true then
		SetFlag (OwnerID(), 544750, 1)
	else
		SetFlag (OwnerID(), 544750, 0)
	end

	LoadQuestOption( OwnerID() )

end

function LuaS_117394_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest(OwnerID(), 423824) == true and CheckFlag(OwnerID(), 544753) == false then
		AddSpeakOption(OwnerID(), TargetID(), "[SO_423824_1]", "LuaS_117394_2", 0)	--你好，請問您是艾希莉女士嗎？我有包裹要轉送給您。
	end
end

function LuaS_117394_2()
	PlayMotion( TargetID(),  ruFUSION_ACTORSTATE_EMOTE_ANGRY )  
	SetSpeakDetail(OwnerID(),"[SC_423824_1]")	-- …什麼？女士？！你在侮辱我嗎？我是「艾希利」沒錯，但你看我哪裡像是女人了？！
	AddSpeakOption(OwnerID(), TargetID(), "[SO_423824_2]", "LuaS_117394_3", 0)	--咦…咦？！可是[117294]說您是「女士」……
end

function LuaS_117394_3()
	SetSpeakDetail(OwnerID(),"[SC_423824_2]")	-- 哼！我早該猜到又是[117294]在欺負人！太過分了，我只是天生長得比較清秀一點，難道我錯了嗎？…算了，生你的氣也於事無補。算了算了。
	AddSpeakOption(OwnerID(), TargetID(), "[SO_423824_3]", "LuaS_117394_4", 0)	--真的很對不起…
end

function LuaS_117394_4()
	CloseSpeak( OwnerID() ); 
	npcSay( TargetID(), "[SC_423824_3]")	-- 為什麼一天到晚都要被人誤認成女人啊，我實在受夠了…
	PlayMotion(  TargetID(),  ruFUSION_ACTORSTATE_EMOTE_CRY ) 
	SetFlag(OwnerID(), 544753, 1)
end

function LuaS_117294_1()	--笑
	PlayMotion( OwnerID(),   ruFUSION_ACTORSTATE_EMOTE_LAUGH )  
	npcsay(OwnerID(), "[SC_117294_1]")
end

function LuaFA_423868_Comp ()
	local Player = TargetID()
	ScriptMessage(Player,Player,1,"[SC_423868_COMP]",C_Red)		-- 聽完歌了，該去找伊士蘭．賈了。系統中央紅字
	ScriptMessage(Player,Player,0,"[SC_423868_COMP]",C_Red)		-- 聽完歌了，該去找伊士蘭．賈了。對話框紅字
end