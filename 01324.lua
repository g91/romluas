
function LuaS_422073()  --掛在科達身上
	if (CheckAcceptQuest(OwnerID(),422073)==true )and( CheckCompleteQuest( OwnerID() , 422073) == false) then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422073]","LuaS_422073_1",0) --呱瓦請我來找你。                                                      
	end
End

function LuaS_422073_1()
	CloseSpeak( OwnerID())
	local CODA =LuaFunc_CreateObjByObj ( 112735,TargetID())
	WriteRoleValue(TargetID(), EM_RoleValue_PID, CODA )
	WriteRoleValue( CODA , EM_RoleValue_PID , OwnerID() )
	Say( CODA , "[SC_422073_1]" )	--哦～就是你嗎
	BeginPlot(TargetID(),"LuaS_422073_2",0)		
	Hide( TargetID())               		  --隱藏任務NPC 
	BeginPlot(CODA, "LuaS_422073_3",0)
end


function LuaS_422073_2()
	sleep(150)
	Show(OwnerID() , 0)
end	

function LuaS_422073_3()
	Yell( OwnerID(),"[SC_422073_2]",2)	--跟我來吧，請小心行走，老祭司在一路上佈下許多陷阱。
	sleep(20)
	Yell( OwnerID(),"[SC_422073_3] ",2)	--這是為了要防止有不好念頭的…其他種族，也可能是你的另一個
	--LuaFunc_MoveToFlag(OwnerID() , 780353, 1 , 0 )	
	--MoveToFlagEnabled(OwnerID(),false  )
	sleep(30)
	Yell( OwnerID(),"[SC_422073_4] ",2)	
	sleep(30)
	Yell( OwnerID(),"[SC_422073_14] ",2)	
	sleep(30)
	BeginPlot(OwnerID(), "LuaS_422073_4",0)
 	DisableQuest(OwnerID() , true )	--開關NPC頭上的任務提示以及對話劇情(true關閉)
	
end

function LuaS_422073_4()
	BeginPlot(OwnerID(),"LuaS_422073_5",0)
	BeginPlot(OwnerID(),"LuaS_422073_7",0)
end

function LuaS_422073_5()											--47行
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	MoveToFlagEnabled(OwnerID(), false )
	for i =1,12 do
		LuaFunc_MoveToFlag( OwnerID(),780354, i,0)
		if	i==2 	then
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				sleep(20)
				Yell(OwnerID(), "[SC_422073_5]",2)	--嗯，被冰起來了啊～老祭司說這時候就用火！
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID(),"[SC_422073_6]",2)	--來吧，繼續前進。
			
			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--沒想到...你會中這個陷阱，潑點水讓你清醒一下......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--我們繼續走吧
			
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--呃...你還好嗎？
				sleep(60)
				Yell(OwnerID(),"[SC_422073_10]",2)	--就快到了，小心一點。
			
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				say(OwnerID(), "[SC_422073_15]")	--非常好
			end
	
		end
		
		if	i==4 	then													--90行
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				Yell(OwnerID(), "[SC_422073_5]",2)	--嗯，被冰起來了啊～老祭司說這時候就用火！
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(50)
				Yell(OwnerID(),"[SC_422073_6]",2)	--來吧，繼續前進。
			
			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--沒想到...你會中這個陷阱，潑點水讓你清醒一下......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--我們繼續走吧
	
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--呃...還好嗎？
				sleep(60)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(50)
				Yell(OwnerID(),"[SC_422073_10]",2)	--就快到了，小心一點。
		
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				say(OwnerID(), "[SC_422073_15]")	--非常好
				sleep(10)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(50)
			end
		end

		if	i==6 	then													--126行
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				Yell(OwnerID(), "[SC_422073_5]",2)	--嗯，被冰起來了啊～老祭司說這時候就用火！
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(30)
				Yell(OwnerID(),"[SC_422073_6]",2)	--來吧，繼續前進。

			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--沒想到...你會中這個陷阱，潑點水讓你清醒一下......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--我們繼續走吧
		
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--呃...還好嗎？
				sleep(60)
				Yell(OwnerID(),"[SC_422073_10]",2)	--就快到了，小心一點。
		
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				Yell(OwnerID(), "[SC_422073_15]",2)	--非常好
			end
		end
		
		if	i==7	then	
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(50)
			end
	
		if	i==8	then													--162行
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				Yell(OwnerID(), "[SC_422073_5]",2)	--嗯，被冰起來了啊～老祭司說這時候就用火！
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_6]",2)	--來吧，繼續前進。

			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--沒想到...你會中這個陷阱，潑點水讓你清醒一下......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--我們繼續走吧
				
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--呃...還好嗎？
				sleep(60)
				Yell(OwnerID(),"[SC_422073_10]",2)	--就快到了，小心一點。
				
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				Yell(OwnerID(), "[SC_422073_15]",2)	--非常好
			end
		end

		if	i==10 	then
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				Yell(OwnerID(), "[SC_422073_5]",2)	--嗯，被冰起來了啊～老祭司說這時候就用火！
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(30)
				Yell(OwnerID(), "[SC_422073_6]",2)	--來吧，繼續前進。

			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--沒想到...你會中這個陷阱，潑點水讓你清醒一下......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(30)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--我們繼續走吧
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--呃...還好嗎？
				sleep(60)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(30)
				Yell(OwnerID(),"[SC_422073_10]",2)	--就快到了，小心一點。
			
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				Yell(OwnerID(), "[SC_422073_15]",2)	--非常好
				sleep(10)
				Yell(OwnerID(), "[SC_422073_17]",2)	--暫時休息一下。
				sleep(30)
			end
		end



		if	i==11 	then
					
				if (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) and (CheckFlag( player,542414)==false) and (CheckFlag( player,542415)==false) and (CheckFlag( player,542416)==false) then	
	 			Yell(OwnerID(),"[SC_422073_11]",2)	--了不起！你是少數沒碰到任何陷阱的人類！
				SetFlag(player ,542513, 1 )		--任務完成旗標
				GiveBodyItem(player ,200277, 1 )
				sleep(30)
					
				end
				Yell(OwnerID(),"[SC_422073_12]",2)	--現在，我們總算來到老祭司附近，就在前方不遠處的洞穴，保持你的禮貌，人類。
				SetFlag(player ,542513, 1 )	--任務完成旗標
				sleep(30)		
				end
		
		end
		if	i==12 	then
				sleep(10)			
			return
			end
		DelObj(OwnerID())
	
end	
		

function LuaS_422073_6()	--放在基本法術的執行劇情
	CancelBuff( TargetID(), 503149 )
end


function LuaS_422073_9()	--放在基本法術的執行劇情
	CancelBuff( TargetID(), 503151 )
end




function LuaS_422073_7()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while 	CheckID(player)	and
		GetDistance(player,OwnerID()) < 500	and
		ReadRoleValue( Player , EM_RoleValue_IsDead) == 0 do

		if	GetDistance(player,OwnerID()) > 350	then
			scriptmessage(player,player,0, "[SC_422073_13]",0)
			sleep(30)
		end
		sleep(20)
	end
	if	checkID(player)	then
		scriptmessage(player,player,0, "[SC_422073_16]",0)
		scriptmessage(player,player,2," [SC_422073_16]",0)

	end
	DelObj(OwnerID())
end


