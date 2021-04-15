function Lua_na_hannorika_check() --美味的雜燴湯NPC判斷任務道具是否已經丟棄涵諾莉卡
local a = CheckCompleteQuest( OwnerID(), 423986 ) --美味的雜燴湯
local b = CheckCompleteQuest( OwnerID(), 423985 )  --無法抗拒的好味道
--local c = CheckAcceptQuest( OwnerID(), 423986 )  --無法抗拒的好味道
	LoadQuestOption( OwnerID() )
	if a == true and b == false  then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_117734_0"), "Lua_na_hannorika_give", 0 ) -- 能再給我一份雜燴湯嗎？
	end
end



function Lua_na_hannorika_give()
	local X=Countbodyitem( OwnerID(), 209249)
	if  X< 1 then
		Setspeakdetail (OwnerID(), GetString("SC_117734_1") ) --你怎麼把[209249]弄丟了呀！這些湯可是很珍貴的，我這裡還剩一些，快點帶去給[117733]吧！
		Givebodyitem ( OwnerID(), 209249, 1 )
	else
		Setspeakdetail (OwnerID(), GetString("SC_117734_2") ) --你不是已經拿到雜燴湯了嗎？　[117733]還在等你，快點趁熱送去給他吧。
	end
end




function Lua_na_117590_0()--幻化藥劑NPC判斷任務道具是否已經丟棄　米斯洛果
local a = CheckCompleteQuest( OwnerID(), 424013 ) --產生幻化的藥草
local b = CheckCompleteQuest( OwnerID(), 424012 )  --協助臥底的工作
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
	LoadQuestOption(OwnerID())
	if a == true and b == false  then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_117590_0"), " Lua_na_117590_1", 0 ) -- 我把幻化藥劑弄丟了
	end
end

function Lua_na_117590_1()--小宏協助修正：重新給藥劑
	local Player=OwnerID();
	CloseSpeak(Player);
	if CountBodyItem(Player,209254)==0 then
		GiveBodyItem(Player,209254,1);
	end
end

function Lua_ying_118300_01() --npc瑪琳．銅環 對話

	local Quest = CheckAcceptQuest( OwnerID() , 424323 ) --任務：偏方不可信
	local Quest2 = CheckAcceptQuest( OwnerID() , 424333 )

	LoadQuestOption( OwnerID() )
	if Quest == true  then
		if CountBodyItem( OwnerID() , 240020 ) == 0 then
			AddSpeakOption( OwnerID() , TargetID() , "[SC_424323_02]" , "Lua_ying_118300_02" , 0 ) --你向瑪琳．銅環說明了你的來意…
		end
	end
	
	if CheckAcceptQuest(OwnerID(),424333)==true and CheckFlag( OwnerID(),545137 )==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424333_1]","LuaS_118300_2",0)
	end
end

function Lua_ying_118300_02()

	local Count = CountBodyItem( OwnerID() , 240020 )

	SetSpeakDetail( OwnerID() , "[SC_424323_01]" ) 		
	if Count <= 0 then
		GiveBodyItem( OwnerID() , 240020 , 1 ) --給予一個療傷藥膏
	end
end