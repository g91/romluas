Function LuaS_423225_complete()
	AddBuff( TargetID()  , 506699 , 1 , 300 ) 
 	SetPosByFlag( TargetID()  , 780605 , 1 )
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--凍住玩家
				
													--SetFlag(TargetID(),543951,1)
	local ith = Lua_DW_CreateObj("obj",115054,OwnerID())   --ith假人
	DisableQuest( ith , true )												--Lua_ObjDontTouch( ith ) 	---不能碰ith假人
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115146  , 1000 , 0)
	local baden = Lua_DW_CreateObj("obj",115147,NPC)   --baden假人
	DisableQuest( baden , true )													--Lua_ObjDontTouch( ith ) 	---不能碰baden假人	
	AdjustFaceDir( ith ,TargetID(), 0 )				---ith面對玩家
	sleep(5)
	say(ith,"[SC_423225_0]")					---等等！雜遝的腳步聲…你不是一個人來？
	sleep(20)
	local tony2 = Lua_DW_CreateObj("flag" ,115148,780605,2)		---tony假人
	DisableQuest( tony2 , true )													--Lua_ObjDontTouch( tony2 ) 	---不能碰tony假人
	sleep(20)
	WriteRoleValue(tony2 , EM_RoleValue_IsWalk, 1 ) 		----tony2 move to tony 
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115149  , 1000 , 0)
	local X = ReadRoleValue ( tony, EM_RoleValue_X)
	local Y = ReadRoleValue ( tony, EM_RoleValue_Y)
	local Z = ReadRoleValue ( tony, EM_RoleValue_Z)
	AdjustFaceDir( ith ,tony2, 0 )
	sleep(10)
	say(ith,"[SC_423225_1]")       		---出來吧～是誰？
	sleep(30)
	say(tony2,"[SC_423225_2]")			---是我，卡拉維。

	DW_WaitMoveTo( tony2 , X , Y, Z)
													--Move(tony2,X,Y,Z)
	say(ith,"[SC_423225_3]")			---陛下！
	sleep(30)
	say(ith,"[SC_423225_4]")			---太危險了！您一個人來的嗎？沒有護衛隨行？
	sleep(35)
	say(tony2,"[SC_423225_5]")			---才一小段路，何必要護衛？好了，現在要去解決[ZONE_SHADOR]的事情吧？
	sleep(40)
	say(ith,"[SC_423225_6]")			---我先派人回[ZONE_DAELANIS]向[114367]通報，告知他您正待在[ZONE_SHADOR]，不用擔心。
	sleep(35)
	say(tony2,"[SC_423225_7]")			---那傢伙只會生氣，怎麼可能擔心。
	sleep(30)
	say(ith,"[SC_423225_8]")			---您的安全絕對是最重要的事情！
	sleep(25)
	AdjustFaceDir( ith ,baden, 0 )
	sleep(5)
	AdjustFaceDir( baden ,ith, 0 )	
	say(ith,"[SC_423225_9]")			---[115146]，你先回[ZONE_DAELANIS]稟告[114367]這件事。
	sleep(30)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	say(baden,"[SC_423222_14]")		---是!
	sleep(30)	
	DW_MoveToFlag(baden,780605 , 3,0 ,1)
	delobj(baden)
	sleep(20)
	delobj(ith)
	delobj(tony2)
	SetFlag(TargetID(),543951,0)	
	CancelBuff( TargetID()  , 506699  ) 	--還玩家自由	
	CancelBuff( TargetID()  , 503977  ) 	--還玩家自由
end

function LuaS_423226()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423226 ) == true  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423226_0]","LuaS_423226_1",0)	--副團長，我們要進去了？
	end
end

function LuaS_423226_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --+1用於423226且副團長not buzy
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423226_2",2)
	else
		SetSpeakDetail(OwnerID(),"[SC_423226_1]")	--稍候，如果可能，我希望陛下的身份先別揭露，現在[ZONE_SHADOR]的態度不明，儘管…這裡原本是我熟悉的家鄉。
							--為了陛下的安危著想，我必須先向陛下建言一番。
	end
	
end


function Luas_423226_2()                              --ith=Owner , player = target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )			---ith is buzy
	AddBuff( TargetID()  , 506696 , 1 , 300 ) 					
	--SetFlag(TargetID(),543914,1)						--演戲開關+
	--say(TargetID(),"Owner")
	local ith = Lua_DW_CreateObj("obj",115155,OwnerID())   --ith假人
	DisableQuest( ith , true )		--Lua_ObjDontTouch( ith ) 	---不能碰ith假人	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115149 , 10000, 0)		---用kara位置創造演戲用kara假人
	local kara2 = Lua_DW_CreateObj("obj",115156,kara)   --kara假人	
	DisableQuest( kara2 , true )		--Lua_ObjDontTouch( kara ) 	---不能碰kara假人
	--local hadi = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115150 , 10000, 0)		--用hadi位置創造演戲用hadi假人
	--local hadi2 = Lua_DW_CreateObj("obj",115152,hadi)   --hadi假人
	local hadi2 = Lua_DW_CreateObj("flag" ,115152,780606,13)
	DisableQuest( hadi2 , true )	
	--say(hadi,hadi2)
	--Lua_ObjDontTouch( hadi2 ) 	---不能碰hadi假人	
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )
	WriteRoleValue(kara2 , EM_RoleValue_IsWalk, 1 )
	MoveToFlagEnabled(ith,false)
	MoveToFlagEnabled(kara2,false)

	local paper = LuaFunc_SearchNPCbyOrgID( hadi2 ,115151 , 10000 , 0)




	Check_Drama_DA( ith , 423226 , 200 ,506696) 				---check distance
	Callplot(ith,"LuaS_423226_ith_move",ith)
	DW_MoveToFlag(kara2,780606 , 11,0 ,1)	  		---move to 下一個位置

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)

		CancelBuff( TargetID()  , 506696  ) 	--還玩家自由
		--SetFlag(TargetID(),543914,0)
		return		
	end

	DW_MoveToFlag(kara2,780606 , 9,0 ,1)	  		---move to 下一個位置

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)

		CancelBuff( TargetID()  , 506696  ) 	--還玩家自由
		--SetFlag(TargetID(),543914,0)
		return		
	end
	
	DW_MoveToFlag(kara2,780606 , 10,0 ,1)	  		---move to 下一個位置

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)

		CancelBuff( TargetID()  , 506696  ) 	--還玩家自由
		--SetFlag(TargetID(),543914,0)
		return		
	end
		
	DW_MoveToFlag(kara2,780605 , 4,0 ,1)	  		---move to 下一個位置

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)

		CancelBuff( TargetID()  , 506696  ) 	--還玩家自由
		--SetFlag(TargetID(),543914,0)
		return		
	end	
	sleep(10)
 --	SetPosByFlag( TargetID()  , 780606 , 6 )
--	AddBuff( TargetID()  , 503977 , 1 , 3000 ) 				--凍住玩家	
	AdjustFaceDir( ith ,hadi2, 0 )	
	AdjustFaceDir( kara2 ,hadi2, 0 )	
	AdjustFaceDir( hadi2 ,ith, 0 )
	sleep(5)
	say(hadi2,"[SC_423226_2]")					---伊崔妮！我接獲侍衛的通報，果然是妳！
	sleep(25)
	say(ith,"[SC_423226_3]")					---王姊。
	sleep(20)
	say(hadi2,"[SC_423226_4]")					---妳呀，自從參加現任人王的加冕典禮後，竟然就留在達拉尼斯王城裡了。
	sleep(40)
	say(ith,"[SC_423226_5]")					---我現在是獅心騎士團的副團長。
	sleep(30)
	say(hadi2,"[SC_423226_6]")					---我知道，團長是「大將軍」蘭斯，對吧？
	sleep(30)
	say(ith,"[SC_423226_7]")					---咳，王姊，夏多爾這次沒有出席領主國會議，而且，據說還拒絕支援卡雅村？
	sleep(40)
	say(hadi2,"[SC_423226_8]")					---咦？…是啊，這些都是使者從達拉尼斯王城傳來的命令。妳是為此特地回來？
	sleep(35)
	say(ith,"[SC_423226_9]")					---我的確是為此前來，但是，不可能的，達拉尼斯沒有發出這樣的命令。
	sleep(35)
	say(kara2,"[SC_423226_10]")				---對，不可能！我才沒有…
	sleep(15)
	say(hadi2,"[SC_423226_11]")				---伊崔妮，他是…？
	sleep(15)	
	say(ith,"[SC_423226_12]")					---沒什麼，王姊，妳說有使者前來？
	sleep(35)
	say(hadi2,"[SC_423226_13]")				---是，而且我確實有收到「諭令」…這是怎麼回事？


	Hide(paper)					

	sleep(30)
	say(hadi2,"[SC_423226_14]")				---騎士，你上前來把「諭令」和使者遺留的徽章拿給伊崔妮看看。
	CancelBuff( TargetID()  , 503977  ) 	--還玩家自由

	AddBuff( TargetID()  , 506746 , 1 , 300 ) 
	local pig = Lua_DW_CreateObj("flag" ,115507,780606,14)
	DisableQuest( pig , true )
	DW_MoveToFlag(pig,780606 , 7,0 ,1)	
	AdjustDir( pig ,180 )
	Show(paper,0)
	--local KK = Lua_DW_CreateObj("obj",115218,paper)   --kara假人
	--SetModeEx( KK , EM_SetModeType_Gravity , false )	

	--say(ith,paper)
	
	AdjustFaceDir( kara2 ,pig, 0 )
	AdjustFaceDir( ith ,pig, 0 )	

	SetPlot(paper, "touch","LuaS_423226_3", 30)		---諭令可碰
	--AddBuff( paper  , 502140 , 1 , 3000 ) 				--paper stop shine	
	--CastSpell(paper,paper,490196)	

	SetPlot(ith, "touch","LuaS_423226_4", 30)		---ith可碰,if 有諭令碰可得到432915
	sleep(40)


	local Time = 0
		for i = 1, 70 , 1 do						
		Time = Time + 1

				if Lua_Check_Drama_Statu(ith) == false then			---離太遠
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
					--delobj(KK)
					delobj(ith)
					delobj(kara2)
					delobj(hadi2)
					delobj(pig)
					CancelBuff( TargetID()  , 506696  ) 	--
					CancelBuff( TargetID()  , 506746  ) 	--
					SetPlot(paper, "touch","", 0)
					return	
				end	
		
			if	Time>60		then				--30秒時間到就刪除其餘NPC，回復原狀
				CancelBuff( TargetID()  , 506746  ) 	--
				SetPlot(ith, "touch","", 0)		---ith假人碰無事件
				DelBodyItem(TargetID(),207269,1)
				AdjustFaceDir( ith ,hadi2, 0 )
				say(ith,"[SC_423226_27]")				---
				sleep(35)	
				Local x1,y1,z1
				x1 = GetMoveFlagValue( 780606 , 10 , EM_RoleValue_X )
				y1 = GetMoveFlagValue( 780606 , 10 , EM_RoleValue_Y )
				z1 = GetMoveFlagValue(780606 , 10 , EM_RoleValue_Z )
				move(ith,x1,y1,z1)
				move(kara2,x1,y1,z1)
				sleep(50)		
				DW_MoveToFlag(pig,780606 , 14,0 ,0)					


				--delobj(KK)
				delobj(ith)
				delobj(kara2)
				delobj(hadi2)
				delobj(pig)
				sleep(20)
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )

				CancelBuff( TargetID()  , 506696  ) 	--還玩家自由
				--SetFlag(TargetID(),543914,0)
				SetPlot(paper, "touch","", 0)

				return
					
			end

			if Time == 15	or	Time == 30	or	Time == 45	then
			Tell(TargetID(),OwnerID(),"[SC_423226_28]")			--催促
			end

			if	  CheckID( TargetID() ) == false	then		---玩家下現
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
				delobj(ith)
				--delobj(KK)
				delobj(kara2)
				delobj(hadi2)
				delobj(pig)
				CancelBuff( TargetID()  , 506746  ) 	--
				CancelBuff( TargetID()  , 506696  ) 	--還玩家自由
				--SetFlag(TargetID(),543914,0)
				SetPlot(paper, "touch","", 0)
				return
			end
			if	CheckFlag( TargetID() , 543915 ) == true 	then	---finish後continue
				---i=40	
				break		
			end
		sleep(10)
	end

	CancelBuff( TargetID()  , 506746  ) 	---看不見乓骨	
	Local x1,y1,z1
	x1 = GetMoveFlagValue( 780606 , 14 , EM_RoleValue_X )
	y1 = GetMoveFlagValue( 780606 , 14 , EM_RoleValue_Y )
	z1 = GetMoveFlagValue(780606 , 14 , EM_RoleValue_Z )
	move(pig,x1,y1,z1)

	AdjustFaceDir( ith ,hadi2, 0 )
	AdjustFaceDir( kara2 ,ith, 0 )	

	
	SetPlot(paper, "touch","", 0)
	--Lua_ObjDontTouch( ith ) 	---不能碰ith假人
	SetPlot(ith, "touch","", 0)		---ith假人碰無事件
 --	SetPosByFlag( TargetID()  , 780606 , 6 )
	AddBuff( TargetID()  , 503977 , 1 , 3000 ) 

	Local x2,y2,z2
	Local kara9 = LuaFunc_SearchNPCbyOrgID( kara2 ,115154  , 10000, 0)
	x2 = ReadRoleValue ( kara9, EM_RoleValue_X)
	y2 = ReadRoleValue ( kara9, EM_RoleValue_Y)
	z2 = ReadRoleValue ( kara9, EM_RoleValue_Z)
				--凍住玩家	
	Move(kara2,x2,y2,z2)		---kara靠近
	sleep(15)
	AdjustFaceDir( kara2 ,ith, 0 )
	PlayMotion(kara2,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point 諭令
	say(kara2,"[SC_423226_15]")			---上面的筆跡被竄改過！這不是我… 
	sleep(10)
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423226_16]" ,  "0xFFFFFF00" ) 
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423226_16]" ,  "0xFFFFFF00" ) 
	sleep(30)

	delobj(pig)

	say(hadi2,"[SC_423226_17]")			---伊崔妮？他怎麼知道筆跡有沒有被改動過？
	sleep(30)

	

	say(ith,"[SC_423226_18]")				---其實很仔細檢查的話，字體確實被修改了部分，妳能說說看使者的樣貌嗎？
	sleep(5)
	AdjustFaceDir( kara2 ,hadi2, 0 )
	sleep(30)	
	say(hadi2,"[SC_423226_19]")			---褐色短髮，身形大概與我身旁的侍衛差不多，嗯…耳後有一道長疤延伸到脖子，他轉身離去時我看見的。
	sleep(40)	
	say(ith,"[SC_423226_20]")				---妳說的使者，應該是被派遣來通知領主國會議舉行日期的那一位，只是…他前陣子已經身亡了…他來的時候，有任何異樣嗎？
	sleep(45)
	say(hadi2,"[SC_423226_21]")			---除了臉色蒼白之外，應答都算正常。
	sleep(30)	
	say(ith,"[SC_423226_22]")				---事實上，我們最近剛得知艾翁發生一件事，死亡已久的屍體被某種力量操控，還持續活動了幾年。
	sleep(45)	
	say(hadi2,"[SC_423226_23]")			---操控屍體？什麼力量可以做到這種事？操控者的目的是什麼？
	sleep(30)	
	say(ith,"[SC_423226_24]")				---目前都還不清楚，妳說的使者，我在想…
	sleep(30)	
	say(hadi2,"[SC_423226_25]")			---有可能和艾翁遭遇的事情相同？
	sleep(30)	
	say(ith,"[SC_423226_26]")				---嗯，我會請人再去驗證那位使者的確切死亡時間。
	sleep(30)	
	--say(ith,"you did")
	sleep(40)
	delobj(ith)
	delobj(kara2)
	delobj(hadi2)
	CancelBuff( TargetID()  , 506696  ) 	--
	--SetFlag(TargetID(),543914,0)
	SetFlag(TargetID(),543915,0)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
	CancelBuff( TargetID()  , 503977  ) 	--還玩家自由
	if	CheckAcceptQuest ( TargetID()   , 423226 )	 == true	then
		SetFlag(TargetID(),543913,1)
	end
end

function killpaper()
	local paper = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115151 , 10000 , 0)
	say(OwnerID(),"i catch "..paper)
	delobj(paper)
end
function LuaS_115507()
	SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND)
end

function LuaS_423226_ith_move(ith)
	Local x1,y1,z1
	Local ith9 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115153  , 10000, 0)
	x1 = ReadRoleValue ( ith9, EM_RoleValue_X)
	y1 = ReadRoleValue ( ith9, EM_RoleValue_Y)
	z1 = ReadRoleValue ( ith9, EM_RoleValue_Z)


	DW_MoveToFlag(ith,780606 , 8,0 ,1)	  		---move to 下一個位置
	DW_MoveToFlag(ith,780606 , 9,0 ,1)	  		---move to 下一個位置	
	DW_MoveToFlag(ith,780606 , 10,0 ,1)	  		---move to 下一個位置
	DW_MoveToFlag(ith,780606 , 12,0 ,1)	  		---move to 下一個位置
end


function LuaS_423226_3()                           --player=>owner ,  
	SetPlot(TargetID(),"touch","",0)
	if CountBodyItem ( OwnerID(), 207269 ) == 0 then
		GiveBodyItem(OwnerID(),207269,1)
	end
	--local KK = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115218 , 10000 , 0)
	--say(OwnerID(),KK)
	--delobj(KK)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	SetPlot(TargetID(), "touch","LuaS_423226_3", 30)		---諭令可碰	
end

function LuaS_423226_4()                           --player=>owner ,  

	--say(OwnerID(),"Owner")
	--say(TargetID(),"Target")
	if CountBodyItem ( OwnerID(), 207269 ) > 0 then
		DelBodyItem(OwnerID(),207269,1)
		SetFlag(OwnerID(),543915,1)
	end
end

function Check_Drama_DA( ObjID , QuestID , Range,Buff ) 
	if Range == nil or Type( Range ) ~= "number" then
		Range = 250
	end
	AddBuff( ObjID , 506345 , 0 , -1 )
	CallPlot( ObjID , "Check_Drama_DA_SUB" ,  QuestID , Range,Buff )
end

function Check_Drama_DA_SUB(QuestID , Range,Buff)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Players = 0
	local Count = 0
	local Name = "[QuestID]"
	local Str = "[SC_QUEST_OVER_RANGE][$SETVAR1="..Name.."]"
	while 1 do
		Players = SetSearchAllPlayer(RoomID )
		Count = 0
		for i = 1 , Players , 1 do 
			local ID = GetSearchResult()
			if CheckID(ID) == true and CheckAcceptQuest(ID , QuestID ) == true and CheckBuff(ID , BUFF) == true	then
				if GetDistance( ID , OwnerID() ) > Range then
					ScriptMessage( ID , ID , 0 , "[SC_SOFAR]" , 0 ) --你已經離開任務：[$VAR1] 的檢查範圍
					ScriptMessage( ID , ID , 1 , "[SC_SOFAR]" , 0 ) --你已經離開任務：[$VAR1] 的檢查範圍
				else
					Count = Count + 1
				end
			end
		end
		if Count == 0 then
			CancelBuff( OwnerID() , 506345 )
			break
		end
		sleep( 30 + Rand(20) )
	end
end

function LuaS_423227()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423227 ) == true and CheckFlag( OwnerID() , 543912) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423227_0]","LuaS_423227_1",0)	--我們要去詢問第一王女了？
	end
end

function LuaS_115159()

	WriteRoleValue(OwnerID()  , EM_RoleValue_IsWalk, 1 )


end
function LuaS_423227_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --+1用於423227且副團長not buzy
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423227_2",2)
	else
		SetSpeakDetail(OwnerID(),"[SC_423227_1]")	---有沒有可能…她也已經不是原本的她了？

							---我想你知道我指的是什麼…

							---但是，被控制的維多利亞夫人和使者都呈現非正常人的狀態，不可能會像現在的赫蒂爾這般…

							---([114368]陷入沉默思考…)
	end
	
end

function LuaS_423227_2()

	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )	---ith is buzy
	AddBuff( TargetID()  , 506697 , 1 , 300 ) 	

	--SetFlag(TargetID(),543952,1)	---演戲開關+

	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423227 , 506697,TargetID(),OwnerID(),100)

	local ith = Lua_DW_CreateObj("obj",115159,OwnerID())   --ith假人
	DisableQuest( ith , true )
	
	--say(OwnerID(),"OwnerID")
	--say(TargetID(),"TargetID")	
	--Lua_ObjDontTouch( ith ) 	---不能碰ith假人	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115154 , 10000 , 0)	---用kara位置創造演戲用kara假人
	local kara2 = Lua_DW_CreateObj("obj",115157,kara)   --kara假人	
	DisableQuest( kara2 , true )		--Lua_ObjDontTouch( kara ) 	---不能碰kara假人
	local hadi = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115150 , 10000 , 0)	---用hadi位置創造演戲用hadi假人
	local hadi2 = Lua_DW_CreateObj("obj",115158,hadi)   --hadi假人
	DisableQuest( hadi2 , true )

	Check_Drama_DA( ith , 423227 , 100,506697 ) 				---check distance
--	sleep(20)
	sleep(20)	
	WriteRoleValue(ith  , EM_RoleValue_IsWalk, 1 )	
	AdjustFaceDir( ith ,hadi2, 0 )	
	AdjustFaceDir( kara2 ,hadi2, 0 )	
	AdjustFaceDir( hadi2 ,ith, 0 )
	sleep(20)
	--say(ith,"[SC_423227_2]")				---嗯，不會錯的，她是我熟悉的赫蒂爾。
	--sleep(30)


	DW_MoveToFlag(ith,780606 , 1,0 ,1)

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		CancelBuff( TargetID()  , 506697  ) 	--
		return	
	end

	say(ith,"[SC_423227_3]")				---王姊，關於[ZONE_KAIYA_VILLAGE]現在的…
	local million = Lua_DW_CreateObj("flag" ,115160,780606,2)	     ---million假人	
	DisableQuest( million , true )
	WriteRoleValue(million , EM_RoleValue_IsWalk, 1 )
	DW_MoveToFlag(million,780606 , 3,0 ,1)


	AdjustFaceDir( hadi2 ,million, 0 )
	AdjustFaceDir( million ,hadi2, 0 )
	
	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		--say(ith,"no")
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(million)
		CancelBuff( TargetID()  , 506697  ) 	--
		return	
	end


	PlayMotion(million,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point  hadi	
	sleep(10)
	say(million,"[SC_423227_4]")			---沒有用的！已經走偏了，背離千羽曆的軌道，妳是歷史的罪人，妳是罪人！
	sleep(5)
	AdjustFaceDir( ith ,million, 0 )	
	AdjustFaceDir( kara2 ,million, 0 )	
	sleep(40)	

	if	CheckBuff(TargetID() , 506697 ) == true	then
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423227_19]" ,  "0xFFFFFF00" ) 		---(蜜莉恩似乎陷入一種茫然發愣的情況…)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423227_19]" ,  "0xFFFFFF00" ) 
	end	

	PlayMotion(million,	ruFUSION_MIME_DAZED)		---dazed
	say(hadi2,"[SC_423227_5]")				---蜜莉恩…
	sleep(30)	
	PlayMotion(million, ruFUSION_MIME_DAZED)
	say(ith,"[SC_423227_6]")				---小妹？
	sleep(20)	
	AdjustFaceDir( ith ,hadi2, 0 )	
	say(ith,"[SC_423227_7]")				---王姊，夏多爾還有發生什麼事情嗎？
	sleep(20)	
	say(hadi2,"[SC_423227_8]")				---唉…妳知道千羽曆對我們的重要性…
	sleep(30)	
	PlayMotion(million, ruFUSION_MIME_DAZED)
	say(million,"[SC_423227_9]")			---千羽曆…星辰的引導指點凡人走向正途，[ZONE_SHADOR]已經傳承了幾百年，是的…幾百年來…直到永遠…
	sleep(5)
	AdjustFaceDir( ith ,million, 0 )	
	sleep(40)			
	say(million,"[SC_423227_10]")			---只要星辰不滅，千羽曆永不會有出錯的一天，無論是援助[ZONE_KAIYA_VILLAGE]或是出席領主國會議，千羽曆早已指引出正確的方向。
	sleep(40)	

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		--say(ith,"no")
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(million)
		CancelBuff( TargetID()  , 506697  ) 	--
		return	
	end



	PlayMotion(million,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point hadi
	say(million,"[SC_423227_11]")			---是妳！妳不該、妳不該，妳怎麼能不聽千羽曆！怎麼能…
	sleep(30)	
	if	CheckBuff(TargetID() , 506697 ) == true	then
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423227_20]" ,  "0xFFFFFF00" ) 	---(蜜莉恩似乎再度陷入一種茫然發愣的情況…)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423227_20]" ,  "0xFFFFFF00" ) 
	end	

	PlayMotion(million,	ruFUSION_MIME_DAZED)		---dazed
	say(hadi2,"[SC_423227_12]")			---就如你們聽見的，我選擇相信[ZONE_DAELANIS]王城使者傳遞的諭令，做出違背千羽曆的決定。
	sleep(5)
	AdjustFaceDir( ith ,hadi2, 0 )	
	sleep(35)	
	PlayMotion(million, ruFUSION_MIME_DAZED)
	say(ith,"[SC_423227_13]")				---但是，王姊，小妹看起來有點…奇怪？
	sleep(30)	
	say(hadi2,"[SC_423227_14]")			---是啊…我很擔心，歷年來掌管千羽曆的王女都會變得有些異常，最近這種情況更嚴重了。
	sleep(40)	
	say(hadi2,"[SC_423227_15]")			---尤其在我與她為了出席、支援的決定發生過幾次衝突後…
	--PlayMotion(million, ruFUSION_ACTORSTATE_DAZED_END)
	sleep(30)	

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		--say(ith,"no")
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(million)
		CancelBuff( TargetID()  , 506697  ) 	--
		return	
	end


	PlayMotion(million,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point hadi	
	sleep(10)
	say(million,"[SC_423227_16]")			---盲目服從人王！背棄「千羽」潔妮．吉昂特熱愛生命的想法！
	sleep(5)
	AdjustFaceDir( ith ,million, 0 )	
	sleep(15)	
	WriteRoleValue(million , EM_RoleValue_IsWalk, 0 )

	--LuaFunc_MoveToFlag( million,780606 , 3,0 )

	
	--DW_MoveToFlag(million,780606 , 4,0 ,1)
	--sleep(5)



	DW_MoveToFlag(million,780606 , 4,0 ,1)
	AdjustFaceDir( ith ,million, 0 )	
	AdjustFaceDir( kara2 ,million, 0 )
	PlayMotion(million, ruFUSION_ACTORSTATE_ATTACK_1H)
	say(ith,"[SC_423227_17]")				---蜜莉恩！

	sleep(3)			
		
	PlayMotion(ith, ruFUSION_ACTORSTATE_PARRY_BOW)	
	sleep(2)
	PlayMotion(million, ruFUSION_ACTORSTATE_DEAD)	
	--PlayMotion(million, ruFUSION_MIME_SPAWN)
	sleep(40)	


	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --舉手禮

	say(ith,"[SC_423227_5]")				---蜜莉恩…
	sleep(20)		
	say(hadi2,"[SC_423227_18]")			---侍衛！扶第三王女去後面休息！
	local knight = Lua_DW_CreateObj("flag" ,115161,780606,5)	     ---knight假人

	DisableQuest( knight , true )	
	sleep(30)
	WriteRoleValue(knight , EM_RoleValue_IsWalk, 1 )
	say(knight,"[SC_423222_14]")
	sleep(20)
	PlayMotion( knight ,ruFUSION_ACTORSTATE_CROUCH_END)	   --舉手禮
	sleep(10)
	Local x1,y1,z1
	x1 = ReadRoleValue ( OwnerID() , EM_RoleValue_X)
	y1 = ReadRoleValue ( OwnerID() , EM_RoleValue_Y)
	z1 = ReadRoleValue ( OwnerID() , EM_RoleValue_Z)
	move(ith,x1,y1,z1)
	DW_MoveToFlag(knight,780606 , 4,0 ,1)
	sleep(20)
	AdjustFaceDir( ith ,million, 0 )		
	WriteRoleValue(knight , EM_RoleValue_IsWalk, 1 )
	PlayMotion( knight ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --舉手禮
	sleep(20)
	delobj(million)
	PlayMotion( knight ,ruFUSION_ACTORSTATE_CROUCH_END)	   --舉手禮

	DW_MoveToFlag(knight,780606 , 2,0 ,1)

	delobj(knight)	
	sleep(20)

	delobj(ith)
	delobj(hadi2)
	delobj(kara2)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---ith not buzy
	--SetFlag(TargetID(),543952,0)					---演戲開關-
	if	CheckBuff(TargetID() , 506697 ) == true	and		CheckAcceptQuest ( TargetID()   , 423227 )	 == true	then
		SetFlag(TargetID(),543912,1)
	end
	CancelBuff( TargetID()  , 506697  ) 	--

end
function reflag()
	SetFlag(OwnerID(),543952,0)
	SetFlag(OwnerID(),543914,0)
	SetFlag(OwnerID(),543913,0)
	SetFlag(OwnerID(),543912,0)
end

function LuaS_115163()
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_IDLE_SLEEP)	
end
