--====================================================================================================
--在接受422840任務後，給看見發飆波多的重要物品(543542)，開啟波多們的client script。
--在設薩滿時就將他們的pid值設定好   [113947]呃拉滿=1  [113956]嚕耳滿=2  [113957]銳法薩滿=3  [113958]嘩追薩滿=4
--正常接任務還任務，直到還422841的任務時，把看見發飆波多(543542)一併給亞爾(在422840任務得)，就看不見花轟的波多了
--重要物品[543467]請教亞爾弗列德
--====================================================================================================

function LuaS_422840_113956_0()			--掛在呃拉滿身上的初始劇情
	Setplot(OwnerID(),"range","LuaS_422840_113956_1",100)	
end

function LuaS_422840_113956_1()
	Beginplot(TargetID(),"LuaS_422840_113956_2",0)
end

function LuaS_422840_113956_2()
	Setplot(OwnerID(),"range","",0)	
--	Say(OwnerID(),"0..02")
--	Say(TargetID(),"T_T2")

	Local S1= (OwnerID())
	local NPC =SearchRangeNPC ( S1 , 200 )				--搜尋呃拉滿身邊 100範圍內的npc，放入npc的陣列內
	
	local S2	
	local S3
	local S4

	for i=0,table.getn(NPC),1 do
		if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 113956 then
			S2= NPC[i]	--嚕耳滿
		end
		if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 113957 then
			S3= NPC[i]	--銳法薩滿
		end
		if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 113958 then
			S4= NPC[i]	--嘩追薩滿
		end
	end
		

		Yell(S4,  "[SC_422840_0]", 3 )		--嘩追薩滿：米娜薇絲好精靈，自從人類開啟禁制之門後，神靈的力量就開始混亂起來……
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S1,  "[SC_422840_1]", 3 )		--呃拉滿：亂了、都亂了啦！巴拉克不在，元素全部都亂七八糟了…慈悲的地母一定是發怒了！
		PlayMotion(S1,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S2,  "[SC_422840_2]", 3 )		--嚕耳滿：完了、完蛋了吶！村子裡的圖騰柱一下下冒火，一下下噴水的……偉大的風神拋棄我們了嗎？
		PlayMotion(S2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(40)

		Yell(S3, "[SC_422840_3]", 3 )		--銳法薩滿：壞了、全壞了呀！我們村子現在連要生火煮飯都很難……強大的火靈力量從來沒這麼分散過呀！
		PlayMotion(S3,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(40)

		Yell(S4,  "[SC_422840_4]", 3)		--嘩追薩滿：糟了、太糟了啊！神靈的力量竟然亂成一團，還同時在四村湧動……再這樣下去，會發生什麼事，連我都不敢想啊！
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(40)

		Yell(S1,  "[SC_422840_5]", 3 )		--呃拉滿：都是巴拉克被人類帶走才會這樣的！地母啊！請息怒啊！
		PlayMotion(S1,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S2, "[SC_422840_6]", 3 )		--嚕耳滿：一定是那些人類弄髒了巴拉克，這可是大大的不妙啊！波多要完蛋啦！
		PlayMotion(S2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		PlayMotion(S3,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S2, "[SC_422840_9]", 3 )		--嚕耳滿：嗚哇哇~~滅亡就在眼前啊！！！
		PlayMotion(S2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(10)

		Yell(S4, "[SC_422840_10]", 3 )		--嘩追薩滿：各位薩滿們，請靜一靜、靜一靜！
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S4,  "[SC_422840_11]", 3 )		--嘩追薩滿：你們這樣吵，米娜薇絲好精靈怎麼聽得清楚我們在說什麼呢？
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(20)

		AdjustFaceDir( S1 , TargetID() ,3 )
		Yell(S1, "[SC_422840_12]", 3 )		--呃拉滿：我記起來了，就是這個冒險者拿走巴拉克的！
		PlayMotion(S1,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S2, "[SC_422840_13]", 3 )		--嚕耳滿：當初就不該讓巴拉克被帶走！
		PlayMotion(S2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S3,  "[SC_422840_14]", 3 )		--銳法薩滿：巴拉克怎會認同這個冒險者呢?
		PlayMotion(S3,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(20)

		Yell(S4,  "[SC_422840_15]", 3 )		--嘩追薩滿：哎哎～各位，這是天意，別怪他人吶。
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(150)

	Setplot(OwnerID(),"range","LuaS_422840_113956_1",100)	
end



--=======================================================================
--422845  先去呃杜村調查
--魯弗提克[113945]旗子[780496]
--重要物品[543543]魯弗提克的要求
--CLIENT:有完成任務422844的才看得到種出的魯弗提克
--=======================================================================

function LuaS_422844_3()  --掛在任務422844之後，OwnerID是米娜
	
			DisableQuest( OwnerID(), true)					--鎖住米娜薇絲的觸碰劇情
			AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--凍住玩家
			local Rufri = Lua_DW_CreateObj("flag" ,113945,780496,1) 			--種出魯弗提克
			DW_MoveToFlag(Rufri,780496,2,0,1)					--魯弗提克就演戲定位

			AdjustFaceDir(Rufri,OwnerID(),0)
			Yell(Rufri,"[SC_422844_4]",3)				--魯弗提克：女士，抱歉打斷妳原先的計劃，有件事需要妳協助。
			Sleep(30)

			AdjustFaceDir(OwnerID(),Rufri,0)
			Yell(OwnerID(),"[SC_422844_5]", 3 )			--米娜薇絲：是什麼事呢？
			Sleep(20)

			Yell(Rufri,"[SC_422844_6]", 3 )				--魯弗提克：哼！卡蓮那愛惹禍的丫頭，她失蹤了。
			PlayMotion( Rufri ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(30)

			Yell(OwnerID(),"[SC_422844_7]", 3 )			--米娜薇絲：卡蓮生性活潑，應該是去哪兒遊玩忘了時間，不久就會回來了吧。
			PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(30)

			Yell(Rufri,"[SC_422844_8]", 3 )				--魯弗提克：女士也知道，近年蛇人愈來愈猖獗，我父親幾日未見到她，就怕她被那些蛇人怎麼了。
			PlayMotion( Rufri ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--聳肩x
			Sleep(30)

			Yell(Rufri,"[SC_422844_10]", 3 )				--魯弗提克：與她最親近的人就是女士妳，我父親才讓我來與妳相商她可能的下落。
			PlayMotion( Rufri ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(20)

			ScriptMessage( TargetID()  , TargetID()   , 0 , "[SC_422844_9]" , 0 )	--魯弗提克表情敘述
			Sleep(20)

			Yell(OwnerID(),"[SC_422844_11]", 3 )			--米娜薇絲：嗯......既然是卡蓮的事，又是亞爾弗列德長老的請託，我當然不會推辭。
			PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
			Sleep(30)

			Yell(Rufri,"[SC_422844_12]", 3 )			--魯弗提克：女士，那我先行一步到議事所等妳。
			PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--鞠躬Ｘ
			Sleep(20)

			DW_MoveToFlag(Rufri,780496,3,0,1)
			Delobj(Rufri)
			if CheckID( TargetID() ) == true then
				Setflag(TargetID(),543543 , 1)			--給重要物品：魯弗提克的要求，以接422845任務
				CancelBuff( TargetID()  , 503977  ) 		--還玩家自由
			end
			DisableQuest( OwnerID(), false)				--解除鎖住米娜薇絲的觸碰劇情		

end

