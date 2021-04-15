--SC_SASA2012_26
--240502--絲線
-----------------------------------------------對話
--※ NPC ※--

function sasa_Auction_npc01()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	local PID = ReadRoleValue( TID , EM_RoleValue_PID )  --0 = 非活動時段 , 1 = 報名開放中
	if PID == 1 then
		SetSpeakDetail( OID , "[SC_SASA2012_01]" )   --對話
		--歡迎參加這場慈善搶標會，各場我們都會隨機取樣不同的屬性飾品，讓參與這次活動的您，除了為善之外，更能獲得一點鼓勵。
		--本次紡織公會需要大量的<CS>「[240502]」</CS>當做製衣材料，用以提供更多美麗的衣裳給村民們，相信遠道而來的您，為善不落人後，事不宜遲請快點就座吧…
		AddSpeakOption( OID , OID , "[SC_COLORWEAVE_01]" , "lua_mika_weave_story" , 0 )	--綵織節的由來
		AddSpeakOption( OID , OID , "[SC_SASA2012_02]" , "sasa_Auction_npc02" , 0 )    --拍賣規範
		AddSpeakOption( OID , OID , "[SC_SASA2012_39]" , "sasa_Auction_npc05" , 0 )    -- 我想看看有哪些競標品

		if CheckBuff( OID, 623225 ) == false then   --沒報名buff
			AddSpeakOption( OID , OID , "[SC_SASA2012_03]" , "sasa_Auction_npc03" , 0 )    --join
			--我想參加
		end

	else
		SetSpeakDetail( OID , "[SC_SASA2012_06]" )   --還沒開始
		--很高興您想替紡織公會所盡的這份心力，不過搶標會目前仍在準備中，請密切注意消息喔！
		AddSpeakOption( OID , OID , "[SC_COLORWEAVE_01]" , "lua_mika_weave_story" , 0 )
		--綵織節的由來
		AddSpeakOption( OID , OID , "[SC_SASA2012_02]" , "sasa_Auction_npc02" , 0 )    --rule
		--拍賣規範
		AddSpeakOption( OID , OID , "[SC_SASA2012_39]" , "sasa_Auction_npc05" , 0 )    -- 我想看看有哪些競標品
		
	end
end

function sasa_Auction_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	SetSpeakDetail( OID , "[SC_SASA2012_05]" )   --規範內容
	--當您喊價後便不得反悔！主持人會倒數並且扣除您的<CS>「[240502]」</CS>。
	--如果您確定要參加，我會暫時借您一些小妙招，不過要小心使用就是…
	AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0 )    --back
	--回上一頁
end

function sasa_Auction_npc03()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	local PP = ReadRoleValue( TID , EM_RoleValue_Register ) --判斷本場次已報名人數
	local done = Checkflag( OID , 546875 )  --當天已玩過
	local done_string = "[SC_SASA2012_27]"	--您已經報名過囉！
	local noitem_string = "[SC_SASA2012_28]"	--您身上的<CS>「[240502]」</CS>不足！
	
	if PP > 14 then --滿員
		SetSpeakDetail( OID , "[SC_SASA2012_04]" )  --full
		--目前參加人數已滿，請稍候再試。
		AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0 )    --back
		--回上一頁
	else
		if CountBodyItem ( OID, 240502 ) < 1 then
			SetSpeakDetail( OID , noitem_string )		--警告沒物品
			AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0)    --back
			--回上一頁
		elseif CheckBuff( OID , 623225 ) == true then
			SetSpeakDetail( OID , done_string )			--警告已報名
			AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0)    --back
			--回上一頁
		elseif done == true then
			SetSpeakDetail( OID , "[SC_SASA2012_07]" )  --今天已經玩過
			--您今天已經參加過囉，請明天再來吧。
			--AddSpeakOption( OID , OID , "[SC_SASA2012_20]" , "sasa_Auction_npc04" , 0)
			--是否使用XXX兌換一次
			
			AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc01" , 0)    --back
			--回上一頁
		else
		-- 	DesignLog( OID, 120905 , "Craft event machine play number".."." )
			CloseSpeak(OID)  --關閉對話視窗
			AddRoleValue( TID , EM_RoleValue_Register , 1 ) 	--NPC記錄PP值+1
			local PP = ReadRoleValue( TID , EM_RoleValue_Register ) 
		--	Say( OID , "PP ="..PP )
			Addbuff( OID , 623225 , 0 , 900 ) --給予報名證明BUFF
			Setflag( OID , 546875 , 1 ) 	--當天已參加過BUFF
			ScriptMessage( OID , OID , 1 , "[SC_SASA2012_38]" , C_SYSTEM )   -- 請到旁邊的搶標會場區域內等待，否則將失去參與資格！
		end
	end
end

--※ 再玩一次 ※--

function sasa_Auction_npc04()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target

	if CountBodyItem( OID , 200275 ) > 0 then		--強效冥想藥水
	-- 	DesignLog( OID, 120905 , "Craft event machine play number".."." )
		CloseSpeak(OID)  --關閉對話視窗
		AddRoleValue( TID , EM_RoleValue_Register , 1 ) 	--NPC記錄PP值+1
		Addbuff( OID , 623225 , 0 , 900 ) --給予報名證明BUFF
		ScriptMessage( OID , OID , 1 , "[SC_SASA2012_38]" , C_SYSTEM )   -- 請到旁邊的搶標會場區域內等待，否則將失去參與資格！
	else
		SetSpeakDetail( OID , "[SC_SASA2012_08]" )  --數量還不夠
		--你所持有的數量不足！
		AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Auction_npc03" , 0)    --back
		--回上一頁
	end
end

-- 放競標品的商店
function sasa_Auction_shop() -- 掛 物件產生劇情 --物品
	SetShop(OwnerID() , 600356 , "Test_Shop_Close" ); 
end


function sasa_Auction_npc05()
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end


function sasa_People_say01()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target

	SetSpeakDetail( OID , "[SC_SASA2012_19]" )
	--聽說今年提供的東西還不賴！
end

function sasa_People_say02()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target

	SetSpeakDetail( OID , "[SC_SASA2012_20]" )
	--偶爾也來做點好事吧…
end

function sasa_People_say03()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target

	SetSpeakDetail( OID , "[SC_SASA2012_21]" )
	--隔壁那傢伙看起來好像虎視眈眈…
end