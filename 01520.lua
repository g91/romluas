
function LuaS_422666()	

	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0 then
		DisableQuest( TargetID() , true )
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_422666_1" , 0 )
		BeginPlot( TargetID() , "LuaS_422666_2" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]" , 0 )  
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM )	
	end
end

function LuaS_422666_2()

	local NPC = CreateObjByFlag( 113415 , 780431 , 1 , 1 )  --賢者之眼法師
	writerolevalue( NPC , EM_RoleValue_IsWalk , 0 )
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	Say( NPC , "[SC_422666]" )             --
	LuaFunc_MoveToFlag( NPC , 780431 , 2 ,  0 )
	sleep(20)
	Say( NPC , "[SC_422666_1]" )         --  
	sleep(20)
	Say( NPC , "[SC_422666_2]" )         --  
	sleep(20)
	LuaFunc_MoveToFlag( NPC , 780431 , 3 ,  0 )
	Delobj( NPC )
	SetFlag(TargetID(),543265,1)
end

function LuaS_422666_1()	

	sleep(10)
	Say(OwnerID() , "[SC_422666_3]" ) --冷靜一點，慢慢說
	sleep(80)
	Say(OwnerID() , "[SC_422666_4]")--嗯！我瞭解了，你快去吧！
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end



function LuaS_422669()	
--780429旗子
--504352鬼火BUFF
	
	local NPC = CreateObjByFlag( 113414 , 780429 , 2 , 0 )  --巴席納斯
	AddToPartition( NPC , 0 )
	local NPC1 = CreateObjByFlag( 113429 , 780429 , 1 , 0 )  --風之禮讚
	AddToPartition( NPC1 , 0 )
	local NPC3 = CreateObjByFlag( 112047 , 780429 , 1 , 0 )  --風之禮讚
	AddToPartition( NPC3 , 0 )
	AddBuff( NPC3 , 504352 , 99 , -1 ) 

	MoveToFlagEnabled( NPC , false )
	LuaFunc_MoveToFlag( NPC , 780429 , 3 ,  0 )
	Say( NPC , "[SC_422669_1]" )               -- 我依約而來，首席。
	sleep(30)
	Say(OwnerID() , "[SC_422669_2]"  )     -- 這把充滿罪惡的魔劍，今日就交給你來摧毀了！
	sleep(30)
	Say(OwnerID() , "[SC_422669_3]"  )     -- 也唯有鑄風家族，才能擁有如此的技術...
	sleep(30)
	Say( NPC , "[SC_422669_4]" )               -- 使用禁忌符文打造武器，是我一直想抹去的家族污點。
	sleep(30)
	Say( NPC , "[SC_422669_5]" )               -- 讓我來把上頭的禁忌符文摧毀，還這把劍自由吧！
	sleep(30)
	CastSpell( NPC , OwnerID() , 491276  )
	CancelBuff( NPC3 , 504352 )

	local NPC2 = CreateObjByFlag( 113427 , 780429 , 4 , 0 )  --薩倫德
	writerolevalue( NPC2 , EM_RoleValue_IsWalk , 0 )
	AddToPartition( NPC2 , 0 )
	MoveToFlagEnabled( NPC2 , false )
	
	sleep(20)
	Say( NPC2 , "[SC_422669_6]" ) 	-- 不！住手！.....怎麼可以...怎麼可以破壞這把劍？
	Delobj( NPC1)
	sleep(10)
	Say(OwnerID() , "[SC_422669_7]"  )     -- 薩倫德？
	LuaFunc_MoveToFlag( NPC2 , 780429 , 5 ,  0 )
	sleep(30)
	Say(NPC2 , "[SC_422669_8]"  )  	-- 咳....首席，我的意思是指，我們應該藉由這把劍的力量，來對抗邪惡勢力...
	sleep(30)
	Say(OwnerID() , "[SC_422669_9]"  )     -- 這何嘗不是我的希望
	sleep(30)
	Say(OwnerID() , "[SC_422669_10]"  )   -- 即便是由賢者之眼來保管它，都不見得安全啊！
	sleep(40)
	Say(NPC2 , "[SC_422669_11]"  )           -- 是...是的....我明白，首席......
	sleep(50)
	Delobj( NPC )
	Delobj( NPC2)
end

