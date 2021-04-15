----------------------------423314---------------------------
function LuaS_115584()
	LoadQuestOption( OwnerID() )					---讀取任務模板

	----423314
	if	CheckAcceptQuest( OwnerID() , 423314 ) == true	and	CheckFlag( OwnerID(),544203 ) == false  then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_1]","LuaS_423314_1",0)	--上次說到這麼做只為了追求力量，那麼是為什麼要追求力量呢？
	end	--<=423314用
	----423316
	if	CheckAcceptQuest( OwnerID() , 423316 ) == true	and	CheckFlag( OwnerID(),544205 ) == true	and	CheckFlag( OwnerID(),544206 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423316_13]","LuaS_423316_3",0)		---剛才有感覺到什麼？
	end	--<=423316用
	-------423317
	if CheckAcceptQuest( OwnerID() , 423317 ) == true  and	CheckFlag( OwnerID(),544207 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423317_1]","LuaS_423317_1",0)	--你還好吧？我們想要跟你說些話。
	end	--<=423317用
	-------423318
	if	CheckAcceptQuest( OwnerID() , 423318 ) == true	and	CheckFlag( OwnerID(),544208 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_1]","LuaS_423318_1",0)		---為了終止兩族的戰鬥，有一些問題想要問你。
	end	--<=423318用	
	if	CheckAcceptQuest( OwnerID() , 423318 ) == true	and	CheckFlag( OwnerID(),544208 ) == true	and	CheckFlag( OwnerID(),544209 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_4]","LuaS_423318_2",0)		---為了兩族的和平，我想知道居爾納精靈如何操作自然之力。
	end	--<=423318用	
	if	CheckAcceptQuest( OwnerID() , 423318 ) == true	and	CheckFlag( OwnerID(),544209 ) == true	and	CheckFlag( OwnerID(),544210 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_7]","LuaS_423318_3",0)		---上次說到吸收自然之力，是在哪裡吸收？又流向何處呢？
	end	--<=423318用	
	if	CheckAcceptQuest( OwnerID() , 423318 ) == true	and	CheckFlag( OwnerID(),544210 ) == true	and	CheckFlag( OwnerID(),544211 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_10]","LuaS_423318_4",0)		---上次說到吸收自然之力是為了讓精靈居住，這是誰的命令？
	end	--<=423318用	
	-------423319
	if	CheckAcceptQuest( OwnerID() , 423319 ) == true	and	CheckFlag( OwnerID(),544212 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_1]","LuaS_423319_1",0)		---我可以跟聖樹妮克絲對話嗎？
	end	--<=423318用	
	if	CheckAcceptQuest( OwnerID() , 423319 ) == true	and	CheckFlag( OwnerID(),544212 ) == true	and	CheckFlag( OwnerID(),544213 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_4]","LuaS_423319_2",0)		---上次說到聖樹妮克絲可以溝通，但我擅闖是必會傷人，可否由你帶路呢？
	end	--<=423318用	
	if	CheckAcceptQuest( OwnerID() , 423319 ) == true	and	CheckFlag( OwnerID(),544213 ) == true	and	CheckFlag( OwnerID(),544214 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_7]","LuaS_423319_3",0)		---上次你的要求我想過了，我保證不會破壞居爾納塔瑞的一切。
	end	--<=423318用
	--------423320
	
end


function LuaS_423314_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423314_2]")	---我...不清楚...記憶還很模糊...只知眾人皆是如此...至於原因...無人為此困惑...也無人為此煩惱...目的...不清楚...
		if  CheckFlag( OwnerID(),544200 ) == false  then                   ---
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_3]","LuaS_423314_2",0)	--是為了家園？
		end
		if  CheckFlag( OwnerID(),544201 ) == false  then                   ---
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_5]","LuaS_423314_3",0)	--是為了族人？
		end
		if  CheckFlag( OwnerID(),544202 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_7]","LuaS_423314_4",0)	--是為了世界和平？
		end
		if CheckFlag( OwnerID(),544200 ) == true	and	CheckFlag( OwnerID(),544201 ) == true and	CheckFlag( OwnerID(),544202 ) == true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_9]","LuaS_423314_5",0)	--還是想不起來嗎？
		end
	end
end

function LuaS_423314_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
	if	CheckAcceptQuest ( OwnerID()   , 423314 )	 == true	then
		SetFlag(OwnerID(),544200,1)
	end
		SetSpeakDetail(OwnerID(),"[SC_423314_4]")			---不...居爾納塔瑞森林本身充斥自然之力...不需要...不是為了家園。
		if  CheckFlag( OwnerID(),544201 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_5]","LuaS_423314_3",0)	--是為了族人？
		end
		if  CheckFlag( OwnerID(),544202 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_7]","LuaS_423314_4",0)	--是為了世界和平？
		end
		if CheckFlag( OwnerID(),544200 ) == true	and	CheckFlag( OwnerID(),544201 ) == true and	CheckFlag( OwnerID(),544202 ) == true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_9]","LuaS_423314_5",0)	--還是想不起來嗎？
		end
	end
end

function LuaS_423314_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
	if	CheckAcceptQuest ( OwnerID()   , 423314 )	 == true	then
		SetFlag(OwnerID(),544201,1)
	end
		SetSpeakDetail(OwnerID(),"[SC_423314_6]")			---不...精靈族自古遵從自然法則...不與自然為敵...和平共處...不是為了族人。
	
		if  CheckFlag( OwnerID(),544200 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_3]","LuaS_423314_2",0)	--是為了家園？
		end
		if  CheckFlag( OwnerID(),544202 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_7]","LuaS_423314_4",0)	--是為了世界和平？
		end
		if CheckFlag( OwnerID(),544200 ) == true	and	CheckFlag( OwnerID(),544201 ) == true and	CheckFlag( OwnerID(),544202 ) == true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_9]","LuaS_423314_5",0)	--還是想不起來嗎？
		end
	end
end

function LuaS_423314_4()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
	if	CheckAcceptQuest ( OwnerID()   , 423314 )	 == true	then
		SetFlag(OwnerID(),544202,1)
	end
		SetSpeakDetail(OwnerID(),"[SC_423314_8]")			---不...與千年相比...今非亂世...不是為了和平。
	
		if  CheckFlag( OwnerID(),544200 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_3]","LuaS_423314_2",0)	--是為了家園？
		end
		if  CheckFlag( OwnerID(),544201 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_5]","LuaS_423314_3",0)	--是為了族人？
		end
		if CheckFlag( OwnerID(),544200 ) == true	and	CheckFlag( OwnerID(),544201 ) == true and	CheckFlag( OwnerID(),544202 ) == true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_9]","LuaS_423314_5",0)	--還是想不起來嗎？
		end
	end
end

function LuaS_423314_5()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
	if	CheckAcceptQuest ( OwnerID()   , 423314 )	 == true	then
		SetFlag(OwnerID(),544203,1)
	end	
		SetSpeakDetail(OwnerID(),"[SC_423314_10]")			---是的...真的想不起來...思緒...被阻礙...力量...渴望...回去...回居爾納塔瑞森林。
	end
end

---------------------------------------423315--------------------------------------------------

function LuaS_423315()
	SetPlot(OwnerID(),"range","LuaS_423315_1",100)
end

function LuaS_423315_1()						---範圍劇情,道地點後拿到旗標
	if 	CheckAcceptQuest( OwnerID() , 423315 ) == true	and	
		CheckFlag( OwnerID() , 544204) == false	then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423315_1]" ,  "0xFFFFFF00" ) 	---你發現安格爾勇士與菲恩彌爾已經在門口等你。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423315_1]" ,  "0xFFFFFF00" )	
		SetFlag(OwnerID(),544204,1)			
	end	
end

-------------------------------------423316-----------------------------------------

function LuaS_115648()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if	CheckAcceptQuest( OwnerID() , 423316 ) == true	and	CheckFlag( OwnerID(),544205 ) == false	then	---有423316任務且無544205旗標
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423316_1]","LuaS_423316_1",0)	--那我們出發了。
	end	
end

function LuaS_423316_1()
	if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then		---精靈不忙
		WriteRoleValue(TargetID(),EM_RoleValue_Register +1,1)			---精靈很忙	
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423316_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423316_2]")	
	end
	
end

function LuaS_423316_2()		---Target=>玩家,Owner=>NPC

	AddBuff(TargetID(),506969,1,-1)						---給予BUFF
	local dischecker = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115653  , 1000 , 0)	
	local fen = Lua_DW_CreateObj("obj",115651,OwnerID())   --fen假人	---菲恩彌爾假人
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115649  , 1000 , 0)
	local fighter = Lua_DW_CreateObj("obj",115652,NPC)   --baden假人	---勇士假人
	MoveToFlagEnabled(fen,false)
	MoveToFlagEnabled(fighter,false)
	DisableQuest( fen , true )	
	DisableQuest( fighter , true )	
	CallPlot(fen,"LuaS_423316_in",fighter,OwnerID(),NPC,dischecker,TargetID())	---向內跑則失敗
	CallPlot(fen,"LuaS_423316_longtime",fighter, OwnerID() ,NPC,dischecker,TargetID())	---長時間待在範圍內則任務失敗
	CallPlot(fen,"LuaS_423316_start",fighter,OwnerID(),NPC,dischecker,TargetID())		---跑超過400則劇情開始
	CallPlot(OwnerID(),"LuaS_Check_noquest_single",1,1,423316,506969,TargetID(),fen,300)		---放棄任務就失去BUFF
	CallPlot(OwnerID(),"LuaS_423316_nobuff",fen,fighter,TargetID())				---沒有BUFF就重置
	SetPlot(OwnerID(),"range","LuaS_423316_return",100)					---重新回到距離100則提醒玩家往外跑
	SetFollow( fen, TargetID() )						---跟隨玩家
	SetFollow( fighter, fen )						---跟隨fen
end

function LuaS_423316_false()
	SetSpeakDetail(OwnerID(),"[SC_423316_2]")			---不...能量...自然之力...不詳的能量...太多東西從我腦中湧現，請你再多等我一下。
									---(說完菲恩彌爾低頭不語...)
end

function LuaS_423316_start(fighter,boss,NPC,dischecker,player)
	while	true	do
		sleep(10)
		if	GetDistance( OwnerID() , boss ) > 400	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)
			yell(OwnerID(),"[SC_423316_6]",3)		---很微妙...但確實一點一點在流失...
			sleep(30)
			yell(OwnerID(),"[SC_423316_7]",3)		---難過...發自內心的哀傷...
			sleep(30)
			yell(OwnerID(),"[SC_423316_8]",3)		---這些...難道是我們親手造成的嗎？
			sleep(30)
			yell(OwnerID(),"[SC_423316_9]",3)		---或許...真的錯了...
			sleep(30)
			yell(OwnerID(),"[SC_423316_10]",3)		---到底...為什麼追求力量呢...
			sleep(30)
			yell(fighter,"[SC_423316_11]",3)		---該回去了！
			SetFollow( OwnerID(), 0 )			---停止跟隨
			SetFollow( fighter, 0 )
			sleep(20)
			yell(OwnerID(),"[SC_423316_12]",3)		---嗯...
			WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )	---走路
			WriteRoleValue(fighter , EM_RoleValue_IsWalk, 1 )	
			sleep(20)

			local x = ReadRoleValue ( boss, EM_RoleValue_X)
			local y = ReadRoleValue ( boss, EM_RoleValue_Y)
			local z = ReadRoleValue ( boss, EM_RoleValue_Z)
			local x1 = ReadRoleValue ( NPC, EM_RoleValue_X)
			local y1 = ReadRoleValue ( NPC, EM_RoleValue_Y)
			local z1 = ReadRoleValue ( NPC, EM_RoleValue_Z)
			move(OwnerID(),x,y,z)				---回到初始點
			move(fighter,x1,y1,z1)
			sleep(20)
			delobj(fighter)					---刪除演員
			Hide(OwnerID())
			sleep(20)
			WriteRoleValue(boss,EM_RoleValue_Register +1,0)	---精靈不忙		
			CancelBuff( player  , 506969  )			---刪除BUFF
			if	CheckAcceptQuest ( player   , 423316 )	 == true	then
				SetFlag( player ,544205,1)
			end
			delobj(OwnerID())

		end
	end	
end

function LuaS_423316_return(fighter,boss,NPC,dischecker,player)				---出去後又往回跑,出現警告
	local fighter = LuaFunc_SearchNPCbyOrgID( TargetID() ,115652  , 500 , 0)
	local fen = LuaFunc_SearchNPCbyOrgID( TargetID() ,115651  , 500 , 0)
	if	ReadRoleValue(fen,EM_RoleValue_Register +1) == 0	then
		yell(fighter,"[SC_423316_5]",3)						---幹嘛往回跑，不更深入森林嗎？
	end
end

function LuaS_423316_in(fighter,boss,NPC,dischecker,player)				---往回跑則取消劇情
	while	true	do
		sleep(10)

		if	GetDistance( OwnerID() , boss ) > GetDistance( OwnerID() , dischecker )	and	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 0	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)
			yell(fighter,"[SC_423316_3]",3)				---搞什麼，不是說要出城嗎？別浪費我時間。
			SetFollow( OwnerID(), 0 )				---停止跟隨
			SetFollow( fighter, 0 )
			sleep(20)
			WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )	---走路
			WriteRoleValue(fighter , EM_RoleValue_IsWalk, 1 )	
			local x = ReadRoleValue ( boss, EM_RoleValue_X)
			local y = ReadRoleValue ( boss, EM_RoleValue_Y)
			local z = ReadRoleValue ( boss, EM_RoleValue_Z)
			local x1 = ReadRoleValue ( NPC, EM_RoleValue_X)
			local y1 = ReadRoleValue ( NPC, EM_RoleValue_Y)
			local z1 = ReadRoleValue ( NPC, EM_RoleValue_Z)
			move(OwnerID(),x,y,z)					---回到原點
			move(fighter,x1,y1,z1)
			sleep(20)
			delobj(fighter)						---刪除演員
			Hide(OwnerID())
			sleep(20)
			WriteRoleValue(boss,EM_RoleValue_Register +1,0)		---精靈不忙		
			CancelBuff( player  , 506969  )				---刪除BUFF
			delobj(OwnerID())
		end
	end				---
end
function LuaS_423316_longtime(fighter,boss,NPC,dischecker,player)				---算時間內沒觸發劇情則取消
	local time = 0
	while	true	do
		sleep(10)			
		time = time +1			---10秒後仍未離開提出警告
		if	time == 10	and	GetDistance( OwnerID() , boss ) < 400	and	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 0	then
			yell(fighter,"[SC_423316_4]",3)		---幹嘛待在這，不更深入森林嗎？
		end				---時間到30秒,距離起始位置小於200,且未啟動劇情,取消劇情
		if	time == 30	and	GetDistance( OwnerID() , boss ) < 400	and	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 0	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)
			yell(fighter,"[SC_423316_3]",3)		---搞什麼，不是說要出城嗎？別浪費我時間。
			SetFollow( OwnerID(), 0 )		---停止跟隨
			SetFollow( fighter, 0 )
			sleep(20)
			WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )	---走路
			WriteRoleValue(fighter , EM_RoleValue_IsWalk, 1 )	
			local x = ReadRoleValue ( boss, EM_RoleValue_X)
			local y = ReadRoleValue ( boss, EM_RoleValue_Y)
			local z = ReadRoleValue ( boss, EM_RoleValue_Z)
			local x1 = ReadRoleValue ( NPC, EM_RoleValue_X)
			local y1 = ReadRoleValue ( NPC, EM_RoleValue_Y)
			local z1 = ReadRoleValue ( NPC, EM_RoleValue_Z)
			move(OwnerID(),x,y,z)					---回到原點
			move(fighter,x1,y1,z1)
			sleep(20)
			delobj(fighter)						---刪除演員
			Hide(OwnerID())
			sleep(20)
			WriteRoleValue(boss,EM_RoleValue_Register +1,0)		---精靈不忙		
			CancelBuff( player  , 506969  )				---刪除BUFF
			delobj(OwnerID())
		end
	end	
end

function LuaS_423316_nobuff(fen,fighter,player)				---出去後又往回跑,出現警告
	while	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 1	do
		sleep(10)			
		if	CheckID(player) == false	or	CheckBuff(player,506969) == false	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,0)
			delobj(fighter)
			delobj(fen)
			break
		end
	end
end

function LuaS_423316_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423316_14]")			---雖然十分細微，但安格爾森林的自然之力確實不斷在流失，隨著在森林中移動，心裡的也越來越平靜，但逐漸被哀傷取代，我不知道為什麼...來自內心的哀傷，無法解釋。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423316_15]","LuaS_423316_4",0)	--這是精靈的天性，如今會覺得哀傷正是脫離奇怪能量的徵兆。
	end
end

function LuaS_423316_4()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423316_16]")			---但我仍然可以感受到身體裡那股想回居爾納塔瑞森林的衝動，恐怕要完全擺脫那種能量還需要一段時間，如果我有任何失常的行為，希望你可以阻止我。
	if	CheckAcceptQuest ( OwnerID()   , 423316 )	 == true	then
		SetFlag(OwnerID(),544206,1)
	end				---得到旗標
	end
end
---------------------------------423317----------------------------------------

function LuaS_423317_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --精靈不忙
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )			---精靈很忙
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423317_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423317_2]")			---你們？除了你以外還有其他人嗎？
									---不明能量還在影響我的情緒，我不保證會不會影響到自己的想法，請給我時間整理思緒。
									---(說完菲恩彌爾低頭不語)
	end
end

function LuaS_423317_false()
	SetSpeakDetail(OwnerID(),"[SC_423317_2]")			---你們？除了你以外還有其他人嗎？
									---不明能量還在影響我的情緒，我不保證會不會影響到自己的想法，請給我時間整理思緒。
									---(說完菲恩彌爾低頭不語)
end

function LuaS_423317_2()

	AddBuff( TargetID()  , 506970 , 1 , -1 ) 	
	local fen = Lua_DW_CreateObj("obj",115654,OwnerID())   --fen假人	
	local tony = Lua_DW_CreateObj("flag" ,115655,780677,1)		---tony假人
	CallPlot(OwnerID(),"LuaS_Check_noquest_single",1,1,423317,506970,TargetID(),OwnerID(),100)	---失去任務即失去BUFF
	CallPlot(OwnerID(),"LuaS_423317_nobuff",fen,tony,TargetID())			---無BUFF則砍掉演員
	DisableQuest( fen , true )							---演員不可對話
	DisableQuest( tony , true )	
	sleep(20)
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---用走的
	MoveToFlagEnabled(fen,false)							
	MoveToFlagEnabled(tony,false)
	sleep(20)
	local tony2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115656  , 200 , 0)		---湯尼走到定位
	local X = ReadRoleValue ( tony2, EM_RoleValue_X)
	local Y = ReadRoleValue ( tony2, EM_RoleValue_Y)
	local Z = ReadRoleValue ( tony2, EM_RoleValue_Z)
	DW_WaitMoveTo( tony , X , Y, Z)
	sleep(10)
	AdjustFaceDir( tony ,fen, 0 )	
	AdjustFaceDir( fen ,tony, 0 )		
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(tony,"[SC_423317_3]",3)		---你好，我是卡拉維?卡薩姆。
	sleep(30)
	Yell(fen,"[SC_423317_4]",3)		---卡薩姆...人王後代嗎？
	sleep(30)
	Yell(tony,"[SC_423317_5]",3)		---是的，看來不明能量並沒有影響您的記憶。
	sleep(30)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(fen,"[SC_423317_6]",3)		---確實沒有，事實上那也不影響我們的思考與邏輯，卡拉維?卡薩姆陛下。
	sleep(15)
	PlayMotion( fen ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --下跪
	sleep(20)
	Yell(tony,"[SC_423317_7]",3)		---不用多禮，在這座森林中我也只是一個渺小的存在，既然已經互相介紹過了，那麼就直接進入正題吧。
	sleep(10)
	PlayMotion( fen ,ruFUSION_ACTORSTATE_CROUCH_END)	   --下跪
	sleep(30)
	Yell(fen,"[SC_423317_8]",3)		---....
	sleep(20)
	Yell(tony,"[SC_423317_9]",3)		---你知道安格爾人為什麼要跟居爾納精靈戰鬥嗎？
	sleep(30)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(fen,"[SC_423317_10]",3)		---以前不知道，現在了解了。
	sleep(30)
	Yell(tony,"[SC_423317_11]",3)		---是的...居爾納精靈們不斷讓安格爾古林的自然之力流失，影響生態環境，安格爾人就是為此與精靈交戰。
	sleep(50)
	Yell(fen,"[SC_423317_8]",3)		---....
	sleep(20)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(tony,"[SC_423317_12]",3)		---相信你也感受到來自安格爾森林的訊息，那麼在這裡生活千年之久的安格爾人會對你們的行為感到憤怒也不是無法理解。
	sleep(50)
	Yell(fen,"[SC_423317_13]",3)		---是的...
	sleep(25)
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(tony,"[SC_423317_14]",3)		---精靈本也是維護自然與和平的種族，相信影響安格爾古林的自然之力也不是你們的本意。
	sleep(50)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(tony,"[SC_423317_15]",3)		---或許開始時一定有你們的原因，但可能隨著時間流逝眾人慢慢的遺忘了。
	sleep(40)
	Yell(tony,"[SC_423317_16]",3)		---如今這項行為卻成為安格爾獸人與精靈戰鬥的理由，是否已與你們的目的有所偏差呢？我相信引發戰爭跟破壞自然絕不是精靈的本意。
	sleep(50)
	Yell(fen,"[SC_423317_17]",3)		---精靈絕不主動挑起戰爭。
	sleep(30)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(tony,"[SC_423317_18]",3)		---沒錯，但如今鬥爭卻因此而起，那麼是否需要重新回想一開始的原因，盡可能避免掉兩族間的衝突，相信可以減少雙方的傷亡，對精靈族來說也不是壞事。
	sleep(50)
	Yell(fen,"[SC_423317_19]",3)		---陛下有話直說...
	sleep(30)
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(tony,"[SC_423317_20]",3)		---我要終止雙方的鬥爭，但必須先了解居爾納精靈為何影響安格爾古林的自然之力，我需要你的協助，菲恩彌爾。
	sleep(50)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(fen,"[SC_423317_21]",3)		---願盡棉薄之力，為了終止鬥爭...
	sleep(30)	
	delobj(fen)				---刪除演員
	delobj(tony)
	
	if	CheckAcceptQuest ( TargetID()   , 423317 )	 == true	and	CheckBuff( TargetID() , 506970 ) == true	then
		SetFlag(TargetID(),544207,1)
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--- 精靈不忙
	CancelBuff( TargetID()  , 506970 )	
end

function LuaS_423317_nobuff(fen,tony,player)				---出去後又往回跑,出現警告
	while	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 1	do
		sleep(10)			---時間到30秒,距離起始位置小於200,且未啟動劇情
		if	CheckID(player) == false	or	CheckBuff(player,506970) == false	then
			delobj(tony)
			delobj(fen)
			break
		end
	end
end

----------------------423318------------------------------
function LuaS_423318_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423318_2]")			---是的，為了兩族的和平，與安格爾古林的自然。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_3]","LuaS_423318_2",0)	--居爾納精靈如何操作自然之力？
		if	CheckAcceptQuest ( OwnerID()   , 423318 )	 == true	then
			SetFlag(OwnerID(),544208,1)
		end	
	end
end

function LuaS_423318_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423318_5]")			---我們透過聖樹妮克絲來吸取自然之力...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_6]","LuaS_423318_3",0)	--他在哪裡吸收自然之力？所吸收的自然之力又將流向哪裡？
		if	CheckAcceptQuest ( OwnerID()   , 423318 )	 == true	then
			SetFlag(OwnerID(),544209,1)
		end
	end
end

function LuaS_423318_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423318_8]")			---聖樹妮克絲是個會活動的生命體...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_9]","LuaS_423318_4",0)	--是誰命令聖樹妮克絲吸收自然之力？
		if	CheckAcceptQuest ( OwnerID()   , 423318 )	 == true	then
			SetFlag(OwnerID(),544210,1)
		end	
	end
end

function LuaS_423318_4()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423318_11]")			---聖樹妮克絲是為了呼應精靈而存在的生命...
		if	CheckAcceptQuest ( OwnerID()   , 423318 )	 == true	then
			SetFlag(OwnerID(),544211,1)
		end
	end
end

-------------------------423319------------------------------
function LuaS_423319_0()
	AddBuff( TargetID()  , 506971 , 1 , 300 ) 
	DisableQuest(OwnerID(),true)
	local tony = Lua_DW_CreateObj("obj",115657,OwnerID())   --tony假人		
	DisableQuest( tony , true )	
	sleep(20)	
	MoveToFlagEnabled(tony,false)
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---用走的
	sleep(10)
	DW_MoveToFlag(tony,780677 , 1,0 ,1)	
	delobj(tony)
	Sleep(20)
	DisableQuest(OwnerID(),false)
	CancelBuff( TargetID()  , 506971  ) 	--
end
function LuaS_423319_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423319_2]")			---聖樹妮克絲具有自我意識，也具有與人對話的能力。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_3]","LuaS_423319_2",0)	--我擅自闖入勢必會傷了你的族人，可否由你帶路呢？
		SetFlag(OwnerID(),544212,1)		
	end
end

function LuaS_423319_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423319_5]")			---也好，避免無謂的殺戮...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_6]","LuaS_423319_3",0)	--好，我保證，為了自然與和平。
		SetFlag(OwnerID(),544213,1)	
	end
end

function LuaS_423319_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423319_8]")			---我也保證，將會提供協助，直到恢復自然與和平。
		SetFlag(OwnerID(),544214,1)	
	end
end

