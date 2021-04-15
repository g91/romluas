---欺負小雞

function LuaS_421708()

	if CheckAcceptQuest(TargetID(),421708)==true then	

		local NPCA = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCA  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCA , TargetID() )

		local NPCB = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCB  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCB , TargetID() )

		local NPCC = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCC  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCC , TargetID() )

		local NPCD = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCD  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCD , TargetID() )

		local NPCE = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCE  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCE , TargetID() )

		local NPCF = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCF  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCF , TargetID() )
		return true
	end
end

---欺負小雞後老闆娘的對話

function LuaS_112192()

	LoadQuestOption( OwnerID() )

	if CheckCompleteQuest( OwnerID() , 421708) == true then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_112192]","LuaS_112192_1",0) --老闆娘養的小雞被殺掉了，她看起來很生氣！ 
	end

	if (CheckAcceptQuest( OwnerID() , 421698) == true)and(CheckFlag( OwnerID() , 542353 )==false)and(CountBodyItem( OwnerID(), 203684 )<1)  then

		CancelBuff( OwnerID() , 502471 )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421698]","LuaS_112192_2",0)--請再給我一壺酒。 
	end		
end

function LuaS_112192_1()

	SetSpeakDetail(OwnerID(),"[SC_112192_1]") --是你嗎？殺掉我養的小雞的人？（老闆娘怒視著你。）不是最好，要是讓我知道是誰幹的好事，一定揍到他看見上帝！		
end

function LuaS_112192_2()

	SetSpeakDetail(OwnerID(),"[SC_421698_1]") --什麼？！你沒有在時間內把酒送給客人嗎？不會是自己中途偷偷把酒喝掉了吧？好吧，我再給你一壺酒，這次要是再搞砸，酒錢就從你的薪資裡扣！		
	GiveBodyItem( OwnerID(), 203684, 1 )
	AddBuff(OwnerID() , 502471 , 0 , 600 )  	
end

