
-------------------------------------------神奇的水骨葉藥膏任務
function LuaS_422119()  

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422119)==true )and( CheckCompleteQuest( OwnerID() , 422119) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422119]","LuaS_422119_1",0) --為什麼水骨葉的產量會銳減？
	end
	if (CheckAcceptQuest(OwnerID(),422127)==true )and( CheckFlag( OwnerID() , 542485 )==false)and(CountBodyItem( OwnerID(), 204260 )>0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422127_3]","LuaS_422127_4",0) --小子！別想隱瞞了！這張字條是怎麼回事？
	end
	
end

function LuaS_422119_1()  

	SetSpeakDetail(OwnerID(),"[SC_422119_1]")
	SetFlag(OwnerID() , 542431 , 1 )
end

-----------------------------------------蒐集水元素之力(未完成)
function LuaS_204116()  

	local water = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if water == 101765 then
		if CheckFlag( TargetID() , 542497 ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ALREADY_USED]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ALREADY_USED]" , 0 )
			return false
		end
		return true
	else
		return false
	end

end

function LuaS_204116_1()  

	if CheckFlag( TargetID() , 542497 ) == false then
		GiveBodyItem( OwnerID(), 204117, 1 )
		SetFlag( TargetID() , 542497 , 1 )
	end
end

-------------------------------------灌溉水骨葉（變綠的）

function LuaS_422121()  

	if CountBodyItem( OwnerID(), 204117 )>0  then
		BeginPlot( TargetID() , "LuaS_422121_1" , 0 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422121]" , C_SYSTEM ) -- 你缺少水之能量！
		return false
	end
end

function LuaS_422121_1()  

	CastSpell( OwnerID(),OwnerID(),491010)
	sleep(10)
	local i = LuaFunc_CreateObjByObj ( 112501 , OwnerID() )
	AddToPartition( i , 0 )
	DelBodyItem( TargetID(), 204117 , 1 ) 
	SetFlag(OwnerID() , 542432 , 1 )
	sleep(100)
	Delobj( i )
end

-------------------------------------灌溉水骨葉（綠變紅）

function LuaS_422123()  

	if CountBodyItem( OwnerID(), 204118 )>0  then
		BeginPlot( TargetID() , "LuaS_422123_1" , 0 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422123]" , C_SYSTEM ) -- 你缺少水元素核心！
		return false
	end
end

function LuaS_422123_1()  

	CastSpell( OwnerID(),OwnerID(),491010)
	sleep(10)
	local i = LuaFunc_CreateObjByObj ( 112501 , OwnerID() )
	AddToPartition( i , 0 )
	SetFlag(OwnerID() , 542438 , 1 )
	DelBodyItem( TargetID(), 204118 , 1 ) 
	sleep(50)
	CastSpell( OwnerID(),OwnerID(),491010)
	Delobj( i )

	local A = LuaFunc_CreateObjByObj ( 112600 , OwnerID() )
	AddToPartition( A , 0 )
	sleep(60)
	Delobj( A )
end

-------------------------------------揭穿陰謀

function LuaS_422127()  
	
	if CountBodyItem( OwnerID(), 204260 )<1  then
		BeginPlot( OwnerID() , "LuaS_422127_1" , 0 )
		BeginPlot( OwnerID() , "LuaS_422127_2" , 0 )
		SetFlag(OwnerID() , 542486 , 1 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422127_2]" , C_SYSTEM ) -- 你已經搜查過貨物箱！
		return false
	end
end

function LuaS_422127_1()  
	
	local MonA = CreateObjByFlag( 101835 , 780349 , 1 , 0 )  
	AddToPartition( MonA ,    0 )
	SetAttack( MonA , OwnerID() )
	Say( MonA , "[SC_422127]" ) --  保護貨物！
	BeginPlot(MonA , "LuaS_422127_3" , 0 )	
end

function LuaS_422127_2()  

	local MonB = CreateObjByFlag( 101836 , 780349 , 2 , 0 )  	
	AddToPartition( MonB ,    0 )
	SetAttack( MonB , OwnerID() )
	Say( MonB , "[SC_422127_1]" )  --  休想將東西帶走！
	BeginPlot(MonB , "LuaS_422127_3" , 0 )	
end

function LuaS_422127_3()
	local Monster = OwnerID()
	while true do
		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --檢查是否離開戰鬥
			Sleep( 10 )	-- 一秒檢查一次	
		else
			if CheckID( Monster ) == true then	DelObj( Monster )	end 
			break
		end
	end
end

function LuaS_422127_4()  --問出真相
	
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_422127_5" , 0 )
end

function LuaS_422127_5()  
	
	DisableQuest( OwnerID() , true )
	local ANPC = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542487, 0 )
	local NPC = LuaFunc_CreateObjByObj ( 101837 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(NPC,"dead" , "LuaS_422127_6",0)
	BeginPlot(NPC,"LuaS_422127_7",0)
	SetAttack( NPC , TargetID() )
	Say( NPC , "[SC_422127_4]" ) --竟然被你找到字條，這下可糟了！
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),ANPC,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542487 ) == true then 
				Say( OwnerID() , "[SC_422127_5]" ) --我告訴你真相，把我知道的都告訴你，別再動手了....
				SetFlag(TargetID() , 542485 , 1 )
				DelBodyItem( TargetID(), 204260 , 1 ) 
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end

function LuaS_422127_6()  
	
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542487, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_422127_7()
	LuaFunc_Obj_Suicide(50)
end



--------------禁錮

function LuaS_422125()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_422125_1" , 0 )
	SetFlag(OwnerID() , 542439 , 1 )
end

function LuaS_422125_1()

	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422125_1]" ) --借用我的力量？
	sleep(20)
	Say( OwnerID() , "[SC_422125_2]" ) --你跟那群禁錮我的人是同一群的嗎？
	sleep(20)
	Say( OwnerID() , "[SC_422125_3]" ) --我不會原諒你們這群低等的生物，膽敢禁錮我的低等生物！
	sleep(20)

	local NPC = LuaFunc_CreateObjByObj ( 101767 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetAttack( NPC , TargetID() )
	sleep(10)
	BeginPlot(NPC,"LuaS_422125_2",0)
	BeginPlot(TargetID(), "LuaS_422125_3",0)
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			sleep( 10 )
			CancelBuff( TargetID() , 503102 )
			sleep( 10 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end

function LuaS_422125_2()

	AddBuff(OwnerID() , 503049 , 0 , 1200 )  --計時buff

	local NPCB = CreateObjByFlag( 111824 , 780300 , 1 , 0 )  --諾芙
	AddToPartition( NPCB , 0 )

	MoveToFlagEnabled( NPCB , false )
	Say( NPCB , "[SC_422125_4]" ) -- 不可以，普力席亞茲。
	sleep(30)
	Say( NPCB , "[SC_422125_5]" ) -- 縱使你的內心充滿憤怒，但不應該發洩在這些無辜的旅人身上。
	sleep(30)
	Say( NPCB , "[SC_422125_6]" ) -- 他們不是禁錮你的人，只是被那群人利用了...
	sleep(30)
	LuaFunc_MoveToFlag( NPCB , 780300 , 2 ,  0 )
	BeginPlot(NPCB,"LuaS_422125_4",0)
	sleep(20)
	Delobj( OwnerID() )
end

function LuaS_422125_3()

	AddBuff(OwnerID() , 503102 , 0 , 600 )  --計時buff
end

function LuaS_422125_4()

	CastSpell( OwnerID() , TargetID() , 491276  )
	Say( OwnerID() , "[SC_422125_7]" ) -- 請諒解普力席亞茲的行為，冒險者。當你因為不願意將力量借給別人使用，而因此被禁錮幾千年時，任何人的脾氣都不會很好的。
	sleep(30)
	Say( OwnerID() , "[SC_422125_8]" ) -- 我知道你與那些為了權力與慾望，而想借用普力席亞茲力量的人不同，出自於對岩風村村民的憐憫之心，才導致你被那群人利用。
	sleep(30)
	Say( OwnerID() , "[SC_422125_9]" ) -- 繼續保持你的善良之心，冒險者，未來如果有緣，我們會再相遇的...
	sleep(30)
	CastSpell( OwnerID() , OwnerID() , 491276  )
	sleep(20)
	Delobj( OwnerID() )
end

