
function Lua_jiyi_121431_talk() --傳送NPC對話劇情
	local own=OwnerID() --玩家
	local tar=TargetID() --NPC
--	local star = ReadRoleValue(Tar, EM_RoleValue_Register1 )  --紀錄是否可以啟動 0表示可以 1表示玩家挑戰中 
	local string ={"[SC_2012HALLOWEEN_PLAYER_121431_01]",
			"[SC_2012HALLOWEEN_PLAYER_121431_02]", 
			"[SC_2012HALLOWEEN_PLAYER_121431_05]",
			"[SC_2012HALLOWEEN_PLAYER_121431_06]",
			"[SC_2012HALLOWEEN_NPC_121431_01]"}	

	if CheckFlag( own , 547019) == true then --如果玩家已經領過獎勵
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_01]" )   --謝謝你幫忙除靈
	elseif 	CheckFlag( own , 547020) ==true  then --玩家已接活動旗標
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_02]" )   --收到禮物了嗎?
			AddSpeakOption( own,tar, string[1],"Lua_jiyi_121431_talk2", 0 )  --收到
			AddSpeakOption( own, tar,string[2], "Lua_jiyi_121431_talk3", 0 )  --給獎
	else 
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_03]" )  --說明文
			AddSpeakOption( own, tar, string[3], "Lua_jiyi_121431_talk5", 0 )  --去看看
			AddSpeakOption( own, tar, string[4], "Lua_jiyi_121431_talk7", 0 )  --沒空	
	end	
end



function Lua_jiyi_121431_talk2()
	local own=OwnerID()
			SetSpeakDetail(own,"[SC_2012HALLOWEEN_NPC_121431_01]") --謝謝你幫忙除靈
end

function Lua_jiyi_121431_talk3()
	local own=OwnerID()
	local tar=TargetID() --NPC	
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_04]" )  --我送你去農場
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_121431_03]", "Lua_jiyi_121431_talk5", 0 )  --好，傳送
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_121431_04]", "Lua_jiyi_121431_talk4", 0 )  --不用了
end

function Lua_jiyi_121431_talk4()
	local own=OwnerID()
			SetSpeakDetail(own,"[SC_2012HALLOWEEN_NPC_121431_05]") --記得去領獎
end

function Lua_jiyi_121431_talk5()
	local own=OwnerID() --玩家
	local tar=TargetID() --NPC		
		SetPos( own, 30.7, 81.0, -15.0, 0 )--傳送玩家
end

function Lua_jiyi_121431_talk6()
	local own=OwnerID()
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_06]" )  --我送你去農場
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_121431_03]", "Lua_jiyi_121431_talk5", 0 )  --好，傳送
end

function Lua_jiyi_121431_talk7()
	local own=OwnerID()
			SetSpeakDetail(own,"[SC_2012HALLOWEEN_PLAYER_121431_07]") --有空再來
end