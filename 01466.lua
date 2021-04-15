
--※ 共用函式-刪重複任務用 ※--
function sasa_keydel_01( key1 )
	setflag( TargetID() , key1 , 0 )
	--Say( TargetID() , "GET" )
end

function sasa_keydel_02( key1 , key2 )
	setflag( TargetID() , key1 , 0 )
	setflag( TargetID() , key2 , 0 )
end

--------------------------------------------------------------------

--※ 草藥NPC初階 ※--
function sasa_Collection_Herb01()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Herb = CheckFlag( OID , 547681 )		--完成草藥
	local Ing = CheckFlag( OID , 547688 )		--任務進行中

	if Herb == true then		--如果完成任務
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--感謝你的協助，今天的量已經足夠了，請明天再來吧！
	elseif Ing == true then		--如果任務進行中
		LoadQuestOption(OID)	--載入任務模板
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--你是這次來幫忙的人嗎？
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Herb02" , 0 )
		--是的。
	end
end

function sasa_Collection_Herb02()
	local Player = OwnerID()
	local Herb_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Herblism )		--23採藥等級
	local Keyitem = { 547606 , 547607 , 547608 , 547609 , 547610 , 547611 , 547612 , 547613 }
				--野漿草 , 苦葉草 , 艾爾香草 , 暮色蘭 , 巴沙石葉草 , 月石斛 , 罪人掌 , 龍葵
	local Keyitem_SP = { 547654 , 547655 , 547656 , 547657 , 547658 }
						--迷薰草 , 飛凌果 , 綠迷薊 , 腐草菇 , 鏡莎花
	local Keyitem2 = { 547614 , 547615 , 547616 , 547617 , 547618 , 547619 , 547620 , 547621 }
				--曼陀蘿 , 馬鞭草 , 夜燈籠草 , 雷蹄葉草 , 伊斯夜芯草 , 冷松葉蕨 , 積雪草 , 紫貝花草
	local Keyitem_SP2 = { 547659 , 547660 , 547661 , 547662 }
						--地精靈草 , 鳩尾花 , 龍芽草 , 月見草
	
	for a = 1 , #Keyitem do
		setflag( Player , Keyitem[a] , 0 )
	end
	for b = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[b] , 0 )
	end
	for aa = 1 , #Keyitem2 do
		setflag( Player , Keyitem2[aa] , 0 )
	end
	for bb = 1 , #Keyitem_SP2 do
		setflag( Player , Keyitem_SP2[bb] , 0 )
	end
	if Herb_Lv <= 10 then
		setflag( Player , Keyitem[1] , 1 )		--野漿草
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 11 and Herb_Lv <= 20 then
		setflag( Player , Keyitem[2] , 1 )		--苦葉草
		setflag( Player , Keyitem[3] , 1 )		--艾爾香草
		setflag( Player , Keyitem_SP[1] , 1 )	--迷薰草
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 21 and Herb_Lv <= 30 then
		setflag( Player , Keyitem[4] , 1 )		--暮色蘭
		setflag( Player , Keyitem_SP[2] , 1 )	--飛凌果
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 31 and Herb_Lv <= 40 then
		setflag( Player , Keyitem[5] , 1 )		--巴沙石葉草
		setflag( Player , Keyitem[6] , 1 )		--月石斛
		setflag( Player , Keyitem_SP[3] , 1 )	--綠迷薊
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 41 and Herb_Lv <= 50 then
		setflag( Player , Keyitem[7] , 1 )		--罪人掌
		setflag( Player , Keyitem_SP[4] , 1 )	--腐草菇
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 51 and Herb_Lv <= 60 then
		setflag( Player , Keyitem[8] , 1 )		--龍葵
		setflag( Player , Keyitem_SP[5] , 1 )	--鏡莎花
		LoadQuestOption(Player)		--載入任務模板
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[116473]]" )
		--抱歉，目前我這裡的採收量已經足夠，也許你可以向<CN>[$VAR1]</CN>問問。(高階)
	end
end

--※ 草藥NPC高階 ※--
function sasa_Collection_Herb01_1()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Herb = CheckFlag( OID , 547681 )		--完成草藥
	local Ing = CheckFlag( OID , 547688 )		--任務進行中

	if Herb == true then		--如果完成任務
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--感謝你的協助，今天的量已經足夠了，請明天再來吧！
	elseif Ing == true then		--如果任務進行中
		LoadQuestOption(OID)	--載入任務模板
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--你是這次來幫忙的人嗎？
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Herb02_1" , 0 )
		--是的。
	end
end

function sasa_Collection_Herb02_1()
	local Player = OwnerID()
	local Herb_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Herblism )		--23採藥等級
	local Keyitem1 = { 547606 , 547607 , 547608 , 547609 , 547610 , 547611 , 547612 , 547613 }
				--野漿草 , 苦葉草 , 艾爾香草 , 暮色蘭 , 巴沙石葉草 , 月石斛 , 罪人掌 , 龍葵
	local Keyitem_SP1 = { 547654 , 547655 , 547656 , 547657 , 547658 }
						--迷薰草 , 飛凌果 , 綠迷薊 , 腐草菇 , 鏡莎花
	local Keyitem = { 547614 , 547615 , 547616 , 547617 , 547618 , 547619 , 547620 , 547621 }
				--曼陀蘿 , 馬鞭草 , 夜燈籠草 , 雷蹄葉草 , 伊斯夜芯草 , 冷松葉蕨 , 積雪草 , 紫貝花草
	local Keyitem_SP = { 547659 , 547660 , 547661 , 547662 }
						--地精靈草 , 鳩尾花 , 龍芽草 , 月見草
	
	for cc = 1 , #Keyitem1 do
		setflag( Player , Keyitem1[cc] , 0 )
	end
	for dd = 1 , #Keyitem_SP1 do
		setflag( Player , Keyitem_SP1[dd] , 0 )
	end
	for c = 1 , #Keyitem do
		setflag( Player , Keyitem[c] , 0 )
	end
	for d = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[d] , 0 )
	end
	if Herb_Lv >= 51 and Herb_Lv <= 60 then
		setflag( Player , Keyitem[1] , 1 )		--曼陀蘿
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 61 and Herb_Lv <= 70 then
		setflag( Player , Keyitem[2] , 1 )		--馬鞭草
		setflag( Player , Keyitem[3] , 1 )		--夜燈籠草
		setflag( Player , Keyitem_SP[1] , 1 )	--地精靈草
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 71 and Herb_Lv <= 80 then
		setflag( Player , Keyitem[4] , 1 )		--雷蹄葉草
		setflag( Player , Keyitem_SP[2] , 1 )	--鳩尾花
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 81 and Herb_Lv <= 90 then
		setflag( Player , Keyitem[5] , 1 )		--伊斯夜芯草
		setflag( Player , Keyitem[6] , 1 )		--冷松葉蕨
		setflag( Player , Keyitem_SP[3] , 1 )	--龍芽草
		LoadQuestOption(Player)		--載入任務模板
	elseif Herb_Lv >= 91 and Herb_Lv <= 100 then
		setflag( Player , Keyitem[7] , 1 )		--積雪草
		setflag( Player , Keyitem[8] , 1 )		--紫貝花草
		setflag( Player , Keyitem_SP[4] , 1 )	--月見草	
		LoadQuestOption(Player)		--載入任務模板
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[114207]]" )
		--抱歉，目前我這裡的採收量已經足夠，也許你可以向<CN>[$VAR1]</CN>問問。(初階)
	end
end

--------------------------------------------------------------------

--※ 木頭NPC初階 ※--
function sasa_Collection_Wood01()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Wood = CheckFlag( OID , 547682 )		--完成木頭
	local Ing = CheckFlag( OID , 547689 )		--任務進行中

	if Wood == true then		--如果完成任務
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--感謝你的協助，今天的量已經足夠了，請明天再來吧！
	elseif Ing == true then		--如果任務進行中
		LoadQuestOption(OID)	--載入任務模板
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--你是這次來幫忙的人嗎？
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Wood02" , 0 )
		--是的。
	end
end

function sasa_Collection_Wood02()
	local Player = OwnerID()
	local Wood_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Lumbering )		--22木頭等級
	local Keyitem = { 547622 , 547623 , 547624 , 547625 , 547626 , 547627 , 547628 , 547629 }
					--柳木 , 楓木 , 橡木 , 青斑松 , 冬青木 , 紫杉木 , 塔斯林魔木 , 龍巢巨木
	local Keyitem_SP = { 547663 , 547664 , 547665 , 547666 , 547667 }
						--地藤根 , 千年木 , 龍鬚根 , 聖木 , 妖精木
	local Keyitem2 = { 547630 , 547631 , 547632 , 547633 , 547634 , 547635 , 547636 , 547637 }
		--古靈橡樹 , 法斯坦巨榕 , 諾斯檜木 , 托多銀杏樹 , 那達紫藤木 , 馬雅夏櫟 , 火山毛櫸 , 坎帝岑木
	local Keyitem_SP2 = { 547668 , 547669 , 547670 , 547671 }
						--遠古木 , 石松木 , 血棕櫚木 , 落羽珊木
	
	for e = 1 , #Keyitem do
		setflag( Player , Keyitem[e] , 0 )
	end
	for f = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[f] , 0 )
	end
	for ee = 1 , #Keyitem2 do
		setflag( Player , Keyitem2[ee] , 0 )
	end
	for ff = 1 , #Keyitem_SP2 do
		setflag( Player , Keyitem_SP2[ff] , 0 )
	end
	if Wood_Lv <= 10 then
		setflag( Player , Keyitem[1] , 1 )		--柳木
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 11 and Wood_Lv <= 20 then
		setflag( Player , Keyitem[2] , 1 )		--楓木
		setflag( Player , Keyitem[3] , 1 )		--橡木
		setflag( Player , Keyitem_SP[1] , 1 )	--地藤根
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 21 and Wood_Lv <= 30 then
		setflag( Player , Keyitem[4] , 1 )		--青斑松
		setflag( Player , Keyitem_SP[2] , 1 )	--千年木
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 31 and Wood_Lv <= 40 then
		setflag( Player , Keyitem[5] , 1 )		--冬青木
		setflag( Player , Keyitem[6] , 1 )		--紫杉木
		setflag( Player , Keyitem_SP[3] , 1 )	--龍鬚根
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 41 and Wood_Lv <= 50 then
		setflag( Player , Keyitem[7] , 1 )		--塔斯林魔木
		setflag( Player , Keyitem_SP[4] , 1 )	--聖木
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 51 and Wood_Lv <= 60 then
		setflag( Player , Keyitem[8] , 1 )		--龍巢巨木
		setflag( Player , Keyitem_SP[5] , 1 )	--妖精木
		LoadQuestOption(Player)		--載入任務模板
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[116474]]" )
		--抱歉，目前我這裡的採收量已經足夠，也許你可以向<CN>[$VAR1]</CN>問問。(高階)
	end
end

--※ 木頭NPC高階 ※--
function sasa_Collection_Wood01_1()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Wood = CheckFlag( OID , 547682 )		--完成木頭
	local Ing = CheckFlag( OID , 547689 )		--任務進行中

	if Wood == true then		--如果完成任務
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--感謝你的協助，今天的量已經足夠了，請明天再來吧！
	elseif Ing == true then		--如果任務進行中
		LoadQuestOption(OID)	--載入任務模板
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--你是這次來幫忙的人嗎？
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Wood02_1" , 0 )
		--是的。
	end
end

function sasa_Collection_Wood02_1()
	local Player = OwnerID()
	local Wood_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Lumbering )		--22木頭等級
	local Keyitem1 = { 547622 , 547623 , 547624 , 547625 , 547626 , 547627 , 547628 , 547629 }
					--柳木 , 楓木 , 橡木 , 青斑松 , 冬青木 , 紫杉木 , 塔斯林魔木 , 龍巢巨木
	local Keyitem_SP1 = { 547663 , 547664 , 547665 , 547666 , 547667 }
						--地藤根 , 千年木 , 龍鬚根 , 聖木 , 妖精木
	local Keyitem = { 547630 , 547631 , 547632 , 547633 , 547634 , 547635 , 547636 , 547637 }
		--古靈橡樹 , 法斯坦巨榕 , 諾斯檜木 , 托多銀杏樹 , 那達紫藤木 , 馬雅夏櫟 , 火山毛櫸 , 坎帝岑木
	local Keyitem_SP = { 547668 , 547669 , 547670 , 547671 }
						--遠古木 , 石松木 , 血棕櫚木 , 落羽珊木
	
	for gg = 1 , #Keyitem1 do
		setflag( Player , Keyitem1[gg] , 0 )
	end
	for hh = 1 , #Keyitem_SP1 do
		setflag( Player , Keyitem_SP1[hh] , 0 )
	end
	for g = 1 , #Keyitem do
		setflag( Player , Keyitem[g] , 0 )
	end
	for h = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[h] , 0 )
	end
	if Wood_Lv >= 51 and Wood_Lv <= 60 then
		setflag( Player , Keyitem[1] , 1 )		--古靈橡樹
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 61 and Wood_Lv <= 70 then
		setflag( Player , Keyitem[2] , 1 )		--法斯坦巨榕
		setflag( Player , Keyitem[3] , 1 )		--諾斯檜木
		setflag( Player , Keyitem_SP[1] , 1 )	--遠古木
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 71 and Wood_Lv <= 80 then
		setflag( Player , Keyitem[4] , 1 )		--托多銀杏樹
		setflag( Player , Keyitem_SP[2] , 1 )	--石松木
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 81 and Wood_Lv <= 90 then
		setflag( Player , Keyitem[5] , 1 )		--那達紫藤木
		setflag( Player , Keyitem[6] , 1 )		--馬雅夏櫟
		setflag( Player , Keyitem_SP[3] , 1 )	--血棕櫚木
		LoadQuestOption(Player)		--載入任務模板
	elseif Wood_Lv >= 91 and Wood_Lv <= 100 then
		setflag( Player , Keyitem[7] , 1 )		--火山毛櫸
		setflag( Player , Keyitem[8] , 1 )		--坎帝岑木
		setflag( Player , Keyitem_SP[4] , 1 )	--落羽珊木	
		LoadQuestOption(Player)		--載入任務模板
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[114208]]" )
		--抱歉，目前我這裡的採收量已經足夠，也許你可以向<CN>[$VAR1]</CN>問問。(初階)
	end
end

--------------------------------------------------------------------

--※ 礦石NPC初階 ※--
function sasa_Collection_Mine01()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Mine = CheckFlag( OID , 547683 )		--完成礦石
	local Ing = CheckFlag( OID , 547690 )		--任務進行中

	if Mine == true then		--如果完成任務
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--感謝你的協助，今天的量已經足夠了，請明天再來吧！
	elseif Ing == true then		--如果任務進行中
		LoadQuestOption(OID)	--載入任務模板
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--你是這次來幫忙的人嗎？
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Mine02" , 0 )
		--是的。
	end
end

function sasa_Collection_Mine02()
	local Player = OwnerID()
	local Mine_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Mining )		--21礦石等級
	local Keyitem = { 547638 , 547639 , 547640 , 547641 , 547642 , 547643 , 547644 , 547645 }
					--錫礦 , 赤鐵礦 , 紫銅礦 , 闇晶礦 , 白銀礦 , 巫鐵礦 , 祕銀礦 , 深淵水銀
	local Keyitem_SP = { 547672 , 547673 , 547674 , 547675 , 547676 }
						--藍冰石 , 大水晶 , 奧利哈爾 , 米斯里魯 , 寒岩結晶
	local Keyitem2 = { 547646 , 547647 , 547648 , 547649 , 547650 , 547651 , 547652 , 547653 }
		--符文黑曜石 , 鐵橄欖石 , 紫晶瑪瑙 , 俄勒岡石 , 白銀星石 , 異變輝石 , 塔格納霓石 , 雅卡角銀礦
	local Keyitem_SP2 = { 547677 , 547678 , 547679 , 547680 }
						--海神雲母 , 結勒結晶 , 鐵斧石 , 藍海晶石
	
	for i = 1 , #Keyitem do
		setflag( Player , Keyitem[i] , 0 )
	end
	for j = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[j] , 0 )
	end
	for ii = 1 , #Keyitem2 do
		setflag( Player , Keyitem2[ii] , 0 )
	end
	for jj = 1 , #Keyitem_SP2 do
		setflag( Player , Keyitem_SP2[jj] , 0 )
	end
	if Mine_Lv <= 10 then
		setflag( Player , Keyitem[1] , 1 )		--錫礦
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 11 and Mine_Lv <= 20 then
		setflag( Player , Keyitem[2] , 1 )		--赤鐵礦
		setflag( Player , Keyitem[3] , 1 )		--紫銅礦
		setflag( Player , Keyitem_SP[1] , 1 )	--藍冰石
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 21 and Mine_Lv <= 30 then
		setflag( Player , Keyitem[4] , 1 )		--闇晶礦
		setflag( Player , Keyitem_SP[2] , 1 )	--大水晶
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 31 and Mine_Lv <= 40 then
		setflag( Player , Keyitem[5] , 1 )		--白銀礦
		setflag( Player , Keyitem[6] , 1 )		--巫鐵礦
		setflag( Player , Keyitem_SP[3] , 1 )	--奧利哈爾
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 41 and Mine_Lv <= 50 then
		setflag( Player , Keyitem[7] , 1 )		--祕銀礦
		setflag( Player , Keyitem_SP[4] , 1 )	--米斯里魯
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 51 and Mine_Lv <= 60 then
		setflag( Player , Keyitem[8] , 1 )		--深淵水銀
		setflag( Player , Keyitem_SP[5] , 1 )	--寒岩結晶
		LoadQuestOption(Player)		--載入任務模板
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[116475]]" )
		--抱歉，目前我這裡的採收量已經足夠，也許你可以向<CN>[$VAR1]</CN>問問。(高階)
	end
end

--※ 礦石NPC高階 ※--
function sasa_Collection_Mine01_1()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Mine = CheckFlag( OID , 547683 )		--完成礦石
	local Ing = CheckFlag( OID , 547690 )		--任務進行中

	if Mine == true then		--如果完成任務
		SetSpeakDetail( OID , "[QUEST_COLLECTION_01]" )
		--感謝你的協助，今天的量已經足夠了，請明天再來吧！
	elseif Ing == true then		--如果任務進行中
		LoadQuestOption(OID)	--載入任務模板
	else
		SetSpeakDetail( OID , "[QUEST_COLLECTION_02]" )
		--你是這次來幫忙的人嗎？
		AddSpeakOption( OID , TID , "[QUEST_COLLECTION_03]" , "sasa_Collection_Mine02_1" , 0 )
		--是的。
	end
end

function sasa_Collection_Mine02_1()
	local Player = OwnerID()
	local Mine_Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Mining )		--21礦石等級
	local Keyitem1 = { 547638 , 547639 , 547640 , 547641 , 547642 , 547643 , 547644 , 547645 }
					--錫礦 , 赤鐵礦 , 紫銅礦 , 闇晶礦 , 白銀礦 , 巫鐵礦 , 祕銀礦 , 深淵水銀
	local Keyitem_SP1 = { 547672 , 547673 , 547674 , 547675 , 547676 }
						--藍冰石 , 大水晶 , 奧利哈爾 , 米斯里魯 , 寒岩結晶
	local Keyitem = { 547646 , 547647 , 547648 , 547649 , 547650 , 547651 , 547652 , 547653 }
		--符文黑曜石 , 鐵橄欖石 , 紫晶瑪瑙 , 俄勒岡石 , 白銀星石 , 異變輝石 , 塔格納霓石 , 雅卡角銀礦
	local Keyitem_SP = { 547677 , 547678 , 547679 , 547680 }
						--海神雲母 , 結勒結晶 , 鐵斧石 , 藍海晶石
	
	for kk = 1 , #Keyitem1 do
		setflag( Player , Keyitem1[kk] , 0 )
	end
	for ll = 1 , #Keyitem_SP1 do
		setflag( Player , Keyitem_SP1[ll] , 0 )
	end
	for k = 1 , #Keyitem do
		setflag( Player , Keyitem[k] , 0 )
	end
	for l = 1 , #Keyitem_SP do
		setflag( Player , Keyitem_SP[l] , 0 )
	end
	if Mine_Lv >= 51 and Mine_Lv <= 60 then
		setflag( Player , Keyitem[1] , 1 )		--符文黑曜石
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 61 and Mine_Lv <= 70 then
		setflag( Player , Keyitem[2] , 1 )		--鐵橄欖石
		setflag( Player , Keyitem[3] , 1 )		--紫晶瑪瑙
		setflag( Player , Keyitem_SP[1] , 1 )	--海神雲母
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 71 and Mine_Lv <= 80 then
		setflag( Player , Keyitem[4] , 1 )		--俄勒岡石
		setflag( Player , Keyitem_SP[2] , 1 )	--結勒結晶
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 81 and Mine_Lv <= 90 then
		setflag( Player , Keyitem[5] , 1 )		--白銀星石
		setflag( Player , Keyitem[6] , 1 )		--異變輝石
		setflag( Player , Keyitem_SP[3] , 1 )	--鐵斧石
		LoadQuestOption(Player)		--載入任務模板
	elseif Mine_Lv >= 91 and Mine_Lv <= 100 then
		setflag( Player , Keyitem[7] , 1 )		--塔格納霓石
		setflag( Player , Keyitem[8] , 1 )		--雅卡角銀礦
		setflag( Player , Keyitem_SP[4] , 1 )	--藍海晶石	
		LoadQuestOption(Player)		--載入任務模板
	else
		SetSpeakDetail( Player , "[QUEST_COLLECTION_04][$SETVAR1=[114209]]" )
		--抱歉，目前我這裡的採收量已經足夠，也許你可以向<CN>[$VAR1]</CN>問問。(初階)
	end
end

--------------------------------------------------------------------

--※ 完成任務觸發 ※--
function sasa_Collection_reward01()		--完成草藥任務
	local Player = TargetID()
	Setflag( Player , 547681 , 1 )		--完成任務KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 114207 , "Collection Herb Lv"..Lv )
end

function sasa_Collection_reward02()		--完成木頭任務
	local Player = TargetID()
	Setflag( Player , 547682 , 1 )		--完成任務KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 114208 , "Collection Wood Lv"..Lv )
end

function sasa_Collection_reward03()		--完成礦石任務
	local Player = TargetID()
	Setflag( Player , 547683 , 1 )		--完成任務KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 114209 , "Collection Mine Lv"..Lv )
end

--※ 清除所有完成旗標 ※--
--/GM ? runplot sasa_ClearAllFlag_01
function sasa_ClearAllFlag_01()
	local Player = OwnerID()
	Setflag( Player , 547681 , 0 )
	Setflag( Player , 547682 , 0 )
	Setflag( Player , 547683 , 0 )
	--完成任務旗標↑
end

--------------------------------------------------------------------
