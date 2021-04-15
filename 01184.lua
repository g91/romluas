---拷問任務

function LuaI_421703()	

	local npcA = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if npcA == 100336 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421703]" , 0 )	--  必須對影月遊蕩者才能使用
		return false
	end
end

function LuaI_421703_1()	

	local Player = OwnerID()
	local npc = TargetID()

	local R = Rand( 100 ) + 1
		if R >= 0 and R < 25 then
			Say( Player , "[SC_421703_1]" ) -- 告訴我關於黑帆海盜團的事情...
			Sleep(30)
			Say( npc , "[SC_421703_2]" )	 -- 黑帆海盜！...我不會說的，就算你把海水灌進我的腸子裡，我都不會透露一個字...	

		elseif R >= 25 and R < 50 then
			Say( Player , "[SC_421703_3]" ) -- 當初影月海盜和黑帆海盜之間發生了什麼事？
			Sleep(30)
			Say( npc , "[SC_421703_4]" ) -- 小子，除非你加入我們，否則休想從我這裡套出任何消息！...嘿嘿，不過加入所要付出的代價，可是「很長的一輩子」...
		
		elseif R >= 50 and R < 75 then

			Say( Player , "[SC_421703_5]" ) -- 讓我們來聊聊關於黑帆海盜的事情吧...
			Sleep(30)
			Say( npc , "[SC_421703_6]" ) -- 什麼？我寧願跟你聊聊酒吧老闆娘有幾個情人，也不願再提起黑帆海盜的事情...
		else

			Say( Player , "[SC_421703_7]" ) -- 如果你不告訴我當初和黑帆海盜之間發生的事情，我就把這根針刺塞到你的屁眼裡...
			SetFlag(Player , 542320 , 1 )
			BeginPlot(  npc  , "LuaI_421703_2" , 0 )
		end
end

function LuaI_421703_2()
	local Small_npc = LuaFunc_CreateObjByObj ( 112166 , OwnerID() )
	AddToPartition( Small_npc ,    0 )
	BeginPlot(Small_npc , "LuaS_421703_2" , 0 )
	BeginPlot( OwnerID() , "LuaS_421703_3" , 0 )
end


function LuaS_421703_2()
	Say(OwnerID() , "[SC_421703_8]") -- 不...請住手，我什麼都告訴你...
	Sleep(30)
	Say(OwnerID() , "[SC_421703_9]") -- 當初大副赫卡慫恿大家背叛雪波船長，一起分享寶藏...
	Sleep(30)
	Say(OwnerID() , "[SC_421703_10]") -- 但是誰也料想不到，詛咒！那些寶藏上頭充滿著駭人的詛咒！
	Sleep(30)
	Say(OwnerID() , "[SC_421703_11]") -- 噢～我再也不願想起那天的恐怖情景...
	Sleep(30)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )
	DelObj(OwnerID())	
end

function LuaS_421703_3()
	LuaFunc_ResetObj( OwnerID() )
end

----神秘漿汁

function LuaS_421704()

	local npc = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if npc == 100603 then
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

function LuaS_421704_1()
	if CheckFlag( TargetID() , 542497 ) == false then
		GiveBodyItem( OwnerID(), 203655, 1 )
		SetFlag( TargetID() , 542497 , 1 )
	end
--	Hide( TargetID() )
end



----沙漠毒蝶的蛹

function LuaS_101562()

	local R = Rand( 100 ) + 1

		if R >= 0 and R < 40 then

			local NPC = LuaFunc_CreateObjByObj ( 101564 , OwnerID() )
			MoveToFlagEnabled ( OwnerID() , false )
			SetAttack( NPC , TargetID() )
			BeginPlot(NPC  , "LuaS_101562_3" , 0 )	
			return true

		elseif R >= 40 and R < 90 then

			local NPCA = LuaFunc_CreateObjByObj ( 101563 , OwnerID() )
			MoveToFlagEnabled ( OwnerID() , false )
			SetAttack( NPCA , TargetID() )
			BeginPlot(NPCA  , "LuaS_101562_3" , 0 )	
			return true		
	
		else

			local NPCB = LuaFunc_CreateObjByObj ( 112167 , OwnerID() )
			AddToPartition( NPCB ,    0 )
			BeginPlot(NPCB  , "LuaS_101562_1" , 0 )	
			return true

		end

end

function LuaS_101562_1()

	sleep(400)
	DelObj(OwnerID())

end

function LuaS_101562_3()
	sleep(100)
	while true do
		local AttackTarget = ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0  then
			if ReadRoleValue(OwnerID() , EM_RoleValue_IsDead) == 0 then
				DelObj(OwnerID())
				break
			end
		end
		sleep(20)
	end
end




--------撿取完劇毒花蜜後刪除物件

function LuaS_101562_2()

	DelObj(TargetID() )
	return true
end

--------剷除背叛者(假的)

function LuaS_421706()
	
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421706)==true )and(CountBodyItem( OwnerID(), 203682 )>0)then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421706]","LuaS_421706_1",0)  
	end
end

function LuaS_421706_1()

	SetSpeakDetail(OwnerID(),"[SC_421706_1]")

end

-------剷除背叛者(真的)

function LuaS_421706_2()

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421706)==true )and(CountBodyItem( OwnerID(), 203682 )>0)and(CheckFlag( OwnerID() , 542351 )==false)then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421706]","LuaS_421706_3",0)  
	end

	if (CheckAcceptQuest(OwnerID(),421706)==true )and(CountBodyItem( OwnerID(), 203682 )>0)and(CheckFlag( OwnerID() , 542351 )==true)then

		SetSpeakDetail(OwnerID(),"[SC_421706_4]")
	end
end

function LuaS_421706_3()

	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_421706_5",0)

end


function LuaS_421706_5()							
	DisableQuest( OwnerID() , true )
	local ANPC = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542352, 0 )
	local NPC = LuaFunc_CreateObjByObj ( 101565 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(NPC,"dead" , "LuaS_421706_6",0)
	BeginPlot(NPC,"LuaS_421706_7",0)
	SetAttack( NPC , TargetID() )
	Say( NPC , "[SC_421706_2]" ) --/*像馬沙霍格那種從來就不相信朋友的陰險傢伙，根本是死有餘辜！
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			--CastSpell( OwnerID(),OwnerID(),490098)
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),ANPC,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542352 ) == true then 
				Say( OwnerID() , "[SC_421706_3]" ) --/*停停停，我知道我錯了，其實我只是害怕哪一天會先被疑心病重的「陰險」馬沙霍格給宰了，所以才想先下手為強，請你原諒我。
			SetFlag(TargetID() , 542351 , 1 )	
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end


function LuaS_421706_6()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542352, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_421706_7()
	LuaFunc_Obj_Suicide(50)
end


-----給影月海盜的驚喜

function LuaI_203683()	

	local npcA = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if npcA == 100350 then
		return true
	else
		return false
	end
end

function LuaI_203683_1()	

	SetFlag(OwnerID() , 542359 , 1 )
	local Small_npc  = CreateObjByFlag( 112210 , 780274 , 0 , 1 )
	AddToPartition( Small_npc ,    0 )
	BeginPlot(Small_npc , "LuaS_203683_2" , 0 )
	BeginPlot( TargetID() , "LuaS_203683_4" , 0 )

end

function LuaS_203683_2()
	MoveToFlagEnabled( OwnerID() , false )	
	LuaFunc_MoveToFlag( OwnerID(), 780274 , 1 ,  10)
	Say( OwnerID(),  "[SC_421538_8]" )				-- 呱！
	writerolevalue( OwnerID() , EM_RoleValue_IsWalk , 0 )	
	Sleep(20)
	LuaFunc_MoveToFlag( OwnerID(), 780274 , 2 , 15 )
	Say( OwnerID(), "[SC_421538_9]" )				-- 呱！呱呱！
	Sleep(20)
	LuaFunc_MoveToFlag( OwnerID(), 780274 , 3 , 5 )
	BeginPlot( OwnerID() , "LuaS_203683_3" , 0 )
end

function LuaS_203683_3()
	
	Sleep(50)
	Delobj( OwnerID() )
end

function LuaS_203683_4()
	
	LuaFunc_ResetObj( OwnerID() )
end






