
------------------------------------------裡線任務NO.27

function LuaS_423202_CHECK() --掛在檢查點上
	SetPlot( OwnerID() , "range" , "LuaS_423202_CHECK_1" , 150 ) 		--調整最後的數字以改變偵測範圍
end

function LuaS_423202_CHECK_1() 
	if	CheckAcceptQuest( OwnerID() , 423202 ) == true		then
		if	CheckFlag( OwnerID() , 544030 ) == false		and
			CheckBuff( OwnerID() , 506763) == false 		then
			AddBuff( OwnerID() , 506763 , 1 , -1 )	
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423181_2]" , 0 ) 		--週遭傳出細微的吵雜聲！
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423181_2]" , 0 )
		end
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register ) < 1	then
			BeginPlot( TargetID() , "LuaS_423202_Main" , 0 )
			WriteRoleValue ( TargetID() , EM_RoleValue_Register , 1 )
		end
	end
end

function LuaS_423202_Main()
	local Gill = Lua_DW_CreateObj("flag" , 115473 ,780654 , 1 )				--吉兒	
	local Lour = Lua_DW_CreateObj("flag" , 115474 ,780654 , 2 )				--勞伯	
	DisableQuest( Gill ,true )
	DisableQuest( Lour ,true )
	MoveToFlagEnabled( Gill , false )
	MoveToFlagEnabled( Lour , false )
	Yell( Gill , "[SC_423202_1]" , 3 )
	sleep(30)
	Yell( Lour , "[SC_423202_2]" , 3 )
	sleep(30)
	BeginPlot( Lour , "LuaS_423202_Lour_Go" , 0 )
	LuaFunc_MoveToFlag( Gill , 780654 , 3 ,  0 )
	Delobj( Gill)
	for i = 0 , 100 , 1 do
		if	CheckID(Lour) == false	and
			CheckID(Gill) == false	then
			break
		end
		sleep( 20 )
	end
	if	CheckBuff( TargetID() , 506763) == true	then 
		SetFlag(TargetID() , 544030 , 1 )
		CancelBuff( TargetID() , 506763 )	
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register , 0 )	
end

function LuaS_423202_Lour_Go() 
	LuaFunc_MoveToFlag( OwnerID() , 780654 , 4 ,  0 )	
	Delobj( OwnerID())
end

function LuaS_423202_Player_CHECK()
	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115472	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423202_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 506763 )
end

------------------------------------------裡線任務NO.29

function LuaS_423204_Note() 	--筆記本的對話
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423204 ) == true		then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423204_1]" , "LuaS_423204_NoteAns", 0 )		
	end
end

function LuaS_423204_NoteAns() 	
	SetSpeakDetail(OwnerID(),"[SC_423204_2]")	
	SetFlag(OwnerID() , 543926 , 1 )
end

function LuaS_423204_Stone() 	--石頭的對話
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423204 ) == true		then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423204_11]" , "LuaS_423204_StoneCHECK", 0 )		
	end
end



function LuaS_423204_StoneCHECK() 	--石頭的劇情
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0		then
		BeginPlot(TargetID(), "LuaS_423204_StoneOK" , 0 )	
		CloseSpeak( OwnerID() )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804]", 0 )	--目標忙碌中
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804]", 0 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_423204_StoneOK() 	
	writerolevalue( OwnerID() , EM_RoleValue_PID , 1 )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	BeginPlot(OwnerID(), "LuaS_423204_Main" , 0 )	
	return	true
end

function LuaS_423204_Main() 	
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	local PP = {}
	local Mon = {}	
	for i =1, 5, 1 do
		PP[i] = CreateObjByFlag( 115478 , 780664 , i , 0 )  
		AddToPartition( PP[i] , 0 )
		DisableQuest( PP[i] ,true )
		MoveToFlagEnabled( PP[i] , false )
	end
	Yell( PP[1] , "[SC_423204_3]" , 3 )
	PlayMotion( PP[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( PP[2] , "[SC_423204_4]" , 3 )
	PlayMotion( PP[2] , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	sleep(30)
	Yell( PP[1] , "[SC_423204_5]" , 3 )
	PlayMotion( PP[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	for i =6, 10, 1 do
		Mon[i] = CreateObjByFlag( 115533 , 780664 , i , 0 )  
		WriteRoleValue(Mon[i] , EM_RoleValue_IsWalk, 0 )
		AddToPartition( Mon[i] , 0 )
		writerolevalue( Mon[i] , EM_RoleValue_PID , i-5 )
		writerolevalue( Mon[i] , EM_RoleValue_Register4  , PP[i-5] )
		DisableQuest( Mon[i] ,true )
		MoveToFlagEnabled( Mon[i] , false )
		BeginPlot(Mon[i], "LuaS_423204_Go" , 0 )	
	end
	Yell( PP[3] , "[SC_423204_6]" , 3 )		--走開   
	PlayMotion( PP[3] , ruFUSION_ACTORSTATE_ATTACK_1H  )	 
	Yell( PP[4] , "[SC_423204_7]" , 3 )		--不要過來
	PlayMotion( PP[3] , ruFUSION_ACTORSTATE_ATTACK_1H  )	
	sleep(20)
	local Gill = Lua_DW_CreateObj("flag" , 115540 ,780664 , 11 )
	DisableQuest( Gill ,true )
	MoveToFlagEnabled( Gill , false )
	LuaFunc_MoveToFlag( Gill , 780664 , 12 ,  0 )
	sleep(10)
	PlayMotionEX( Gill , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Yell( Gill , "[SC_423204_8]" , 3 )
	sleep(30)
	PlayMotion( Gill, ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(10)
	Yell( Gill , "[SC_423204_9]" , 3 )
	CastSpell( Gill , Mon[6] , 492224 )
	sleep(10)
	AddBuff( Mon[6] , 506770 , 1 , -1 )	
	sleep(20)
	Yell( Gill , "[SC_423204_10]" , 3 )
	sleep(20)
	for i =6, 10, 1 do
		Delobj( Mon[i])
	end
	CastSpell( Gill , Gill , 491276 )
	sleep(20)
	Delobj( Gill)
	sleep(10)
	if	GetDistance(Player , OwnerID() ) < 200		and
		CheckAcceptQuest( Player ,423204 ) == true	then
		SetFlag(Player , 543927 , 1 )
	end

	WriteRoleValue ( OwnerID() , EM_RoleValue_PID , 0 )	
end

function LuaS_423204_Go() 	
	local A =ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) 
	local B =ReadRoleValue( OwnerID() ,EM_RoleValue_Register4  ) 
	LuaFunc_MoveToFlag( OwnerID() , 780664 , A ,  0 )
	SetDefIdleMotion(B,ruFUSION_MIME_DEATH_LOOP)
	sleep(20)
	Delobj( B)
end

--------------506769		--鬧鬼營地BUFF
function LuaS_423204_CHECK() 
	local Player
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		Player = SetSearchAllPlayer(RoomID)
		for i = 1 , Player , 1 do 
			local ID = GetSearchResult()
			if	GetDistance(ID , OwnerID() ) < 200		then
				if	CheckCompleteQuest(ID,423204)==false		and
					CheckBuff( ID , 506769) == false 		and
					CheckBuff( ID , 506771) == false		then
					AddBuff(ID , 506769 , 1 , 60 )  
				end
			else
				if	CheckBuff( ID , 506769) == true 	then
					CancelBuff( ID , 506769 )	
			end	end
		end		
		sleep( 20 )
	end
end

------使用黏液上去的BUFF

function LuaS_423204_USENINI() 
	if	CheckBuff( OwnerID() , 506769) == true 		then	
		CancelBuff( OwnerID() , 506769 )	
	end
	if	CheckBuff( OwnerID() , 506771) == false 		then	
		AddBuff(OwnerID() , 506771 , 100 , 60 )  
	end
end






