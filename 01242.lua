function LuaS_422016()

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422016)==true )and(CountBodyItem( OwnerID(), 204063 )<1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422016]","LuaS_422016_1",0)
	end
end

function LuaS_422016_1()

	GiveBodyItem( OwnerID(), 204063, 1 )
	CloseSpeak( OwnerID() )
end



--   柯利墨

function LuaS_112419()  

	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest(OwnerID(),422032)==true and CheckFlag( OwnerID() , 542418 )==false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422032_1]","LuaS_newnew_422032",0) 	
	end
	if CheckCompleteQuest( OwnerID() , 422032) == false and CheckFlag( OwnerID() , 542418 )==true and CountBodyItem( OwnerID(), 204048 )<1  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422032_2]","LuaS_new_422032_3",0) 
	end

	if CheckAcceptQuest( OwnerID() , 422041) == true and CountBodyItem( OwnerID(), 204056 )<1  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422041]","LuaS_new_422032_4",0) 
	end

end

function LuaS_newnew_422032()

	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_new_422032",0)

end

function LuaS_new_422032()	                                                                                      
	DisableQuest( OwnerID() , true )
	local DBIDB = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542419, 0 )
	local AFB = LuaFunc_CreateObjByObj ( 101684 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(AFB,"dead" , "LuaS_new_422032_1",0)
	BeginPlot(AFB,"LuaS_new_422032_2",0)
	SetAttack( AFB , TargetID() )
	sleep( 10 )
	while true do
		if CheckID(AFB) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),DBIDB,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542419 ) == true then 
				Say( OwnerID() , "[SC_422032]" ) --別打了，我免費給你鑰匙就是了！
				SetFlag(TargetID() , 542418 , 1 )
				GiveBodyItem( TargetID(), 204048, 1 )
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end


function LuaS_new_422032_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542419, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_new_422032_2()
	LuaFunc_Obj_Suicide(50)
end

function LuaS_new_422032_3()
	SetSpeakDetail(OwnerID(),"[SC_422032_3]")
	GiveBodyItem( OwnerID(), 204048, 1 )
end

function LuaS_new_422032_4()
	GiveBodyItem( OwnerID(), 204056, 1 )
	CloseSpeak( OwnerID() )
end


-----說明書籍



function LuaS_422033_1()

	SetSpeakDetail(OwnerID(),"[SC_422033_1]")
	SetFlag(OwnerID() , 542420 , 1 )
end

----領取魔法石

function LuaS_422034_Quest()

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422034)==true )and(CountBodyItem( OwnerID(), 204049 )<1 )then	

		AddSpeakOption(OwnerID(),TargetID(),"[SC_422034]","LuaS_422034_1",0)
	end
end

function LuaS_422034_1()

	GiveBodyItem( OwnerID(), 204049, 1 )
	CloseSpeak( OwnerID() )
end

---判斷有無空的魔法石

function LuaI_422035() 

	if CountBodyItem( OwnerID(), 204050 )>0  then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422035]" , C_SYSTEM ) -- 你缺少空的能量魔法石！
		return false
	end
end

function LuaI_422035_1() 

	DelBodyItem( OwnerID(), 204050 , 1 ) 
	return true
end

---召喚儀式

function LuaS_422040()

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422040)==true )and(CheckFlag( OwnerID() , 542421 )==false)then	

		AddSpeakOption(OwnerID(),TargetID(),"[SC_422040]","LuaS_422040_1",0)
	end	
	if (CheckAcceptQuest(OwnerID(),422033)==true )and(CheckFlag( OwnerID() , 542420 )==false)then	

		AddSpeakOption(OwnerID(),TargetID(),"[SC_422033]","LuaS_422033_1",0)
	end

end

function LuaS_422040_1()
	SetFlag(OwnerID() , 542421 , 1 )
	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_422040_2",0)	
end

function LuaS_422040_2()

	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422040_1]" )
	sleep(20)
	Say( OwnerID() , "[SC_422040_2]" )
	CastSpell( OwnerID() , OwnerID() , 491276  )
	sleep(50)
	local NPC = CreateObjByFlag( 112425 , 780291 , 1 , 1 )  --黑暗生物
	AddToPartition( NPC , 0 )	
	sleep(30)
	Say( OwnerID() , "[SC_422040_3]" )
	sleep(30)
	Say( OwnerID() , "[SC_422040_4]" )
	sleep(50)
	Delobj( NPC )
	SetFlag(OwnerID() , 542421 , 1 )
	DisableQuest( OwnerID() , false )		
end





