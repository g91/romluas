function LuaS_118868()
	local Fidelina = OwnerID()
	local Lorde = LuaFunc_SearchNPCbyOrgID( Fidelina , 114794 , 15 )

	SetDefIdleMotion( Fidelina, ruFUSION_MIME_EMOTE_SWEEP2 )

	npcsay( Lorde , "[SC_243_CHATTING_00]" )		-- 姐姐陪我玩啦，我好無聊！！
	sleep(30)

	npcsay( Fidelina , "[SC_243_CHATTING_01]" )		-- 羅德你去找小艾德玩啦，姐姐要先把這些東西清乾淨。
	sleep(40)

	npcsay( Lorde , "[SC_243_CHATTING_02]" )		-- 我才不要找艾德玩，他每次都會耍賴！！
	sleep(40)


end


function LuaS_118877()
	local Godoy = OwnerID()
	local Bella = LuaFunc_SearchNPCbyOrgID( Godoy , 116493 , 40 )
	local Diana = LuaFunc_SearchNPCbyOrgID( Godoy , 118867 , 40 )

	PlayMotion( Godoy , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Godoy , "[SC_243_CHATTING_03]" )		-- 天啊，[118840]怎麼又開始說他的大道理了。
	sleep(30)

	PlayMotion( Diana , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Diana , "[SC_243_CHATTING_04]" )		-- 天知道他是腦袋哪個地方出問題。
	sleep(30)

	PlayMotion( Diana , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Diana , "[SC_243_CHATTING_05]" )		-- 我們光是要顧好自己都不容易了，還去理那些傷兵幹嘛？
	sleep(40)

	PlayMotion( Bella , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Bella , "[SC_243_CHATTING_06]" )		-- 就是說啊，而且搞不好薩爾多堡那邊會來抓人。
	sleep(40)

	PlayMotion( Godoy , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Godoy , "[SC_243_CHATTING_07]" )		-- 小聲點，如果他真的被抓走了搞不好會怪到我們身上！
	sleep(40)

	PlayMotion( Bella , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Bella , "[SC_243_CHATTING_08]" )		-- 不過，其實[118840]這樣子還蠻帥的耶......
	sleep(40)

	npcsay( Diana , "[SC_243_CHATTING_09]" )		-- 呃......
	npcsay( Godoy , "[SC_243_CHATTING_09]" )
	sleep(30)


end

function LuaS_118875()
	local Cabarrus = OwnerID()
	local Fiallos =  LuaFunc_SearchNPCbyOrgID( Cabarrus , 118876 , 50 )

	PlayMotion( Cabarrus , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Cabarrus , "[SC_243_CHATTING_10]" )		-- 最近農田邊的河變成奇怪的顏色了。
	sleep(40)

	PlayMotion( Fiallos , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Fiallos , "[SC_243_CHATTING_11]" )		-- 是啊，還流下一堆垃圾。
	sleep(40)

	PlayMotion( Cabarrus , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Cabarrus , "[SC_243_CHATTING_12]" )		-- 如果再這樣下去的話根本不能耕田了......
	sleep(40)

	PlayMotion( Fiallos , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Fiallos , "[SC_243_CHATTING_13]" )		-- 有差嗎，種田的是我又不是你。
	sleep(40)

	PlayMotion( Cabarrus , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Cabarrus , "[SC_243_CHATTING_14]" )		-- 當然有差啊，不然我要吃的東西要從哪來！
	sleep(40)

	PlayMotion( Fiallos , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Fiallos , "[SC_243_CHATTING_15]" )		-- ...我又不是專程種給你吃的...
	sleep(40)

end