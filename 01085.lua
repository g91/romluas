---------------------------------------賈斯汀
function LuaS_110500_Quest()           
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(), 203356 ) > 0  then  --擁有上鎖的箱子
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421534_1]","LuaS_110500_2",0)  --請問你是「南瓜頭」大叔嗎？		
	end

	if	CountBodyItem( OwnerID(), 203356 ) > 0	and
		CheckAcceptQuest(OwnerID(),421533)==true 	and
		CheckCompleteQuest( OwnerID() , 421533) == false	and
		CheckCompleteQuest(OwnerID(),421534)==true then  --已解完鑰匙製作任務

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421534_4]","LuaS_110500_4",0)  --可以請您再幫我開一次箱子嗎？	
	end		
end

function LuaS_110500_2() 

	SetSpeakDetail(OwnerID(),"[SC_421534_2]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421534_3]","LuaS_110500_3",0)	
end

function LuaS_110500_3()

	SetFlag(OwnerID() , 542231 , 1 )
	CloseSpeak( OwnerID() )
end

function LuaS_110500_4()
	SetSpeakDetail(OwnerID(),"[SC_421534_5]")
	GiveBodyItem( OwnerID(), 203365, 1 )
	DelBodyItem( OwnerID() , 203356 , 1 ) 
end



-----------------------------------------夏琳
function LuaS_110060_Quest()           
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(), 203367 ) > 0 then  --擁有治療泉水
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421536_1]","LuaS_110060_1",0)  --諾芙請我送治療之泉給妳。		
	end	
end

function LuaS_110060_1() 

	if DelBodyItem( OwnerID() , 203367 , 1 ) then
		SetSpeakDetail(OwnerID() , "[SC_421536_2]" )
		SetFlag(OwnerID() , 542181 , 1 )
	end

end

-------------------------卡翠娜
function LuaS_110491_Quest()           
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(), 203370 ) > 0 then  --擁有諾芙驚喜箱
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421538_1]","LuaS_110491_1",0)  		
	end	
end 

function LuaS_110491_1() 
	CloseSpeak( OwnerID() )
	if DelBodyItem( OwnerID(), 203370 , 1 ) then
		--SetSpeakDetail(OwnerID(),"[SC_421538_2]")
		SetFlag(OwnerID() , 542183 , 1 )
		BeginPlot( TargetID() , "LuaS_110491_2" , 0 )
	end
end

function LuaS_110491_2()
	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_421538_2]" )				-- 喔？箱子裡有什麼？
	Sleep( 10 )	
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_421538_3]" , 0 )	-- 卡翠娜打開箱子
	local Frog = CreateObjByFlag( 111817 , 780213 , 0 , 1 )
	AddToPartition( Frog , 0 )
	Sleep( 5 )
	Say( OwnerID() , "[SC_421538_4]" )				-- 啊！青蛙！！
	Say( Frog , "[SC_421538_8]" )				-- 呱！
	Sleep( 5 )
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_421538_5]" , 0 )	-- 你看到卡翠娜驚慌失措的表情
	Say( OwnerID() , "[SC_421538_6]" )				-- 走開！！！
	CastSpell( OwnerID() , Frog , 492224 )	-- 表演特效 火球術
	Sleep( 20 )
	CastSpell( OwnerID() , Frog , 492224 )	-- 表演特效 火球術
	Sleep( 5 )
	Say( OwnerID() , "[SC_421538_7]" )				-- 可惡！快給我走開！！
	Say( Frog , "[SC_421538_9]" )				-- 呱！呱呱！
	LuaFunc_MoveToFlag( Frog , 780213 , 1 , 0 )
	Sleep( 5 )
	CastSpell( OwnerID() , Frog , 492224 )	-- 表演特效 火球術
	Sleep( 20 )
	CastSpell( OwnerID() , Frog , 492224 )	-- 表演特效 火球術
	Sleep( 5 )
	LuaFunc_MoveToFlag( Frog , 780213 , 2 , 0 )
	LuaFunc_MoveToFlag( Frog , 780213 , 3 , 0 )
	if CheckID( Frog ) == true then DelObj( Frog ) end
	DisableQuest( OwnerID() , false )
end

---------------------------------瑪麗安夫人
function LuaS_111830()

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421534)==true )and(CountBodyItem( OwnerID(), 203363 )<1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421534]","LuaS_421534_1",0)
	end
end

function LuaS_421534_1()

	GiveBodyItem( OwnerID(), 203363, 1 )
	CloseSpeak( OwnerID() )
end






