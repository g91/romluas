
--------------------詢問音貝

function LuaS_422137()  

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422137)==true )and( CheckCompleteQuest( OwnerID() , 422137) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422137]","LuaS_422137_1",0) --水元素王，我想詢問關於「音貝」的事情。
	end

	if (CheckAcceptQuest(OwnerID(),422125)==true )and( CheckFlag( OwnerID() , 542439 )==false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422125]","LuaS_422125",0) --偉大的水元素王，希望可以借用您的力量，將這個蒐集器的能量充滿。
	end

	if (CheckAcceptQuest(OwnerID(),422351)==true )and( CheckFlag( OwnerID() , 542697) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422351]","LuaS_422351_0",0) --
	end

	if (CheckAcceptQuest(OwnerID(),422830)==true )and( CountBodyItem( OwnerID(), 206172 )<1  )	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_ 422830]","LuaS_422830",0) --史詩任務淨化之石
	end

	if	(CheckAcceptQuest(OwnerID(),422814)==true ) and (ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )==0) and CheckFlag(OwnerID(),543451) == false then	--對話，可叫
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422814_0]","LuaS_102796_2",0)	--水元素王？
	end
		
	if	(CheckAcceptQuest(OwnerID(),422824)==true ) and (ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )==0) and CheckFlag(OwnerID(),543417) == false then	--對話，可叫
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422824_2]","LuaS_102796_2",0)	--水元素王，我是來...
	end

	if	(CheckAcceptQuest(OwnerID(),422814)==true ) and (ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )==1) and CheckFlag(OwnerID(),543451) == false then	--對話
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422814_0]","LuaS_102796_1",0)	--水元素王？
	end

	if	(CheckAcceptQuest(OwnerID(),422824)==true ) and (ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )==1) and CheckFlag(OwnerID(),543417) == false then	--對話，不可叫
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422824_2]","LuaS_102796_1",0)	--水元素王，我是來...
	end
end

function LuaS_422137_1()  

	SetSpeakDetail(OwnerID(),"[SC_422137_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422137_2]","LuaS_422137_2",0) --水元素王，請問您知道現在「音貝」發生什麼事情了嗎？
end

function LuaS_422137_2()  

	SetSpeakDetail(OwnerID(),"[SC_422137_3]")
	SetFlag(OwnerID() , 542442 , 1 )
end

------------------水元素王的恩澤

function LuaS_422138()	

	if CountBodyItem( OwnerID(), 204133 )>0  then
		DelBodyItem( OwnerID() , 204133 , 1 ) 
		BeginPlot( OwnerID() , "LuaS_422138_1" , 0 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422138_10]" , C_SYSTEM ) -- 你缺少水之能量！
		return false
	end
end

function LuaS_422138_1()	

	local NPC = CreateObjByFlag( 112574 , 780297 , 1 , 1 )  --莫卡姆
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	Say( NPC , "[SC_422138]" )             --  啊！這不是水之能量嗎？
	LuaFunc_MoveToFlag( NPC , 780297 , 2 ,  0 )
	sleep(20)
	Say( NPC , "[SC_422138_1]" )         --  原來你想要將它放進水之渦心，來使附近生物的生長獲得滋潤阿！  
	sleep(20)
	Say( NPC , "[SC_422138_2]" )         --  我是岩風村的村民，如果你能把水之能量交給我，我將它帶回岩風村在釋放能量的話，可以讓水骨葉等等植物生長得更順利....
	sleep(20)
	Say( NPC , "[SC_422138_3]" )         --  交給我吧...
	sleep(20)
	BeginPlot( OwnerID() , "LuaS_422138_2" , 0 )
	LuaFunc_MoveToFlag( NPC , 780297 , 5 ,  0 )
	sleep(30)
	BeginPlot( OwnerID() , "LuaS_422138_3" , 0 )
	BeginPlot( NPC , "LuaS_422138_4" , 0 )
end

function LuaS_422138_2()	

	local NPCA = CreateObjByFlag( 112576 , 780297 , 3 , 1 )  --伊利恩‧長鬚
	AddToPartition( NPCA , 0 )

	MoveToFlagEnabled( NPCA , false )
	Say( NPCA , "[SC_422138_4]" )         --  不可以交給他！
	LuaFunc_MoveToFlag( NPCA , 780297 , 4 ,  0 )
	sleep(20)
	Say( NPCA , "[SC_422138_5]" )         --  竟然想偽裝成人類騙人！
	sleep(20)
	Say( NPCA , "[SC_422138_6]" )         --  走開！走開！
	LuaFunc_MoveToFlag( NPCA , 780297 , 8 ,  0 )
	sleep(20)
	Say( NPCA , "[SC_422138_8]" )         --  走開！快走開！
	sleep(30)
	BeginPlot( NPCA , "LuaS_422138_4" , 0 )
end

function LuaS_422138_3()	

	local NPCB = CreateObjByFlag( 112596 , 780297 , 5 , 1 )  --莫卡姆(蛇)
	AddToPartition( NPCB , 0 )
	CastSpell( OwnerID() , OwnerID() , 491276  )

	MoveToFlagEnabled( NPCB , false )
	sleep(20)
	LuaFunc_MoveToFlag( NPCB , 780297 , 6 ,  0 )
	sleep(20)
	LuaFunc_MoveToFlag( NPCB , 780297 , 9 ,  0 )
	Say( NPCB , "[SC_422138_7]" )         --  可惡，要不是上頭交代，不能讓太多人知道我們的行蹤....
	sleep(20)
	Say( NPCB , "[SC_422138_9]" )         --  哼！咱們走著瞧！
	sleep(20)
	LuaFunc_MoveToFlag( NPCB , 780297 , 7 ,  0 )
	BeginPlot( NPCB , "LuaS_422138_4" , 0 )
end

function LuaS_422138_4()	

	sleep(10)		
	Delobj( OwnerID() )
end

----------------淨化植物

function LuaS_422139()	

	BeginPlot( TargetID() , "LuaS_422139_1" , 0 )
	return true
end

function LuaS_422139_1()	

	local R = Rand( 4 ) 
	for i =R, 4, 1 do
		local i = LuaFunc_CreateObjByObj ( 101830 , OwnerID() )
		WriteRoleValue( i  , EM_RoleValue_LiveTime , 120 ) --時間以秒計
		AddToPartition( i , 0 )
	end
end








