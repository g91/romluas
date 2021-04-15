function LuaI_114416_0()
	SetPlot( OwnerID() , "range" , "LuaI_114416_1" , 50 )
end

function LuaI_114416_1()
	local KeyItem = 543731
	if CheckAcceptQuest( OwnerID() , 423027 ) == true  and CheckFlag( OwnerID() , KeyItem ) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		BeginPlot( TargetID() , "LuaI_114416_2" , 0 )
	end
end

function LuaI_114416_2()
	Yell( OwnerID() , "[SC_423027_0]" , 3 ) --小子，你帶來的麻煩，最好自己解決。
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 111 )
	local Rouge = {}
	local Service = 0
	local Flag = 780546
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep( 30 )
	for i = 1 , 4 , 1 do
		if i ~= 1 then
			Rouge[i] = CreateObjByFlag( 103159 , Flag , i , 1 )
		else
			Rouge[i] = CreateObjByFlag( 103161 , Flag , i , 1 )
		end
		AddToPartition( Rouge[i] , RoomID )
		MoveToflagEnabled( Rouge[i] , false )
		SetRoleCamp( Rouge[i] , "Visitor" )
		if i ~= 1 then
			SetPlot( Rouge[i] , "Dead" , "LuaI_114416_4" , 0 )
			FaceObj( Rouge[i] , TargetID() )
			WriteRoleValue( Rouge[i] , EM_RoleValue_PID , i )
		else
			SetPlot( Rouge[i] , "dead" , "LuaI_114416_6" , 0 )
			WriteRoleValue( Rouge[i] , EM_RoleValue_PID , TargetID() )
		end
	end
	Yell( Rouge[1] , "[SC_423027_1]" , 3 ) --肥羊來了，宰掉肥羊你們可以獲得更多。
	PlayMotion( Rouge[1] , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	sleep( 30 )
	for i = 1 , 4 , 1 do
		WriteRoleValue( Rouge[1] , EM_RoleValue_Register + i , Rouge[i] )
		WriteRoleValue( Rouge[2] , EM_RoleValue_Register + i , Rouge[i] )
		WriteRoleValue( Rouge[3] , EM_RoleValue_Register + i , Rouge[i] )
		WriteRoleValue( Rouge[4] , EM_RoleValue_Register + i , Rouge[i] )
	end
	for i = 1 , 4 , 1 do
		if i ~= 1 then
			SetRoleCamp( Rouge[i] , "Monster" )
			SetAttack( Rouge[i] , TargetID() )
			BeginPlot( Rouge[i] , "LuaI_114416_3" , 0 )
		else
			BeginPlot( Rouge[i] , "LuaI_114416_5" , 0 )
		end
		Lua_Drama_Radar( Rouge[i] , 423027 )
	end
	while 1 do
		Service = 0
		for pry , obj in pairs(Rouge) do
			if CheckID( obj ) == true and Lua_Check_Drama_Statu(obj) == true then
				Service = Service + 1
			end
		end
		if Service == 0 then
			for pry , obj in pairs(Rouge) do
				if CheckID( obj ) == true and ReadRoleValue( obj , EM_RoleValue_IsDead ) == 0 then
					Delobj( obj )
				end
			end
			break
		end
		sleep( 30 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_114416_3()
	local Flag = 780546
	local FlagNum = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Count = 0
	while 1 do
		
		if HateListCount( OwnerID() ) == 0 and Count > 15 then
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
			break
		end
		sleep( 10 )
		Count = Count + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 and ReadRoleValue(  OwnerID() , EM_RoleValue_IsDead ) == 0 then
		DelObj( OwnerID() )
	else
		Yell( OwnerID() , "[SC_423027_2]" , 3 ) -- 不要殺我~
		WriteRoleValue( OwnerID() , EM_RoleValue_LiveTime , 10 )
		LuaFunc_MoveToFlag( OwnerID() , Flag , FlagNum , 0 )
		DelObj( OwnerID() )
	end
end

function LuaI_114416_4()
	local Rouge
	for i = 2 , 4 , 1 do
		Rouge = ReadRoleValue( OwnerID() , EM_RoleValue_Register + i )
		if Rouge ~= OwnerID() then
			WriteRoleValue( Rouge , EM_RoleValue_Register , 111 )
			Lua_CancelAllBuff( Rouge ) 
			SetStopAttack(Rouge )
			SetRoleCamp( Rouge , "Visitor" )
		end
	end
	WriteRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 ) , EM_RoleValue_Register , 111 )
	return true
end

function LuaI_114416_5()
	local Rouge = {}
	for i = 2 , 4 , 1 do
		Rouge[i-1] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + i )
	end
	local Result = 0
	while 1 do
		Result = 0
		for pry , obj in pairs(Rouge) do
			if CheckID(obj) == false or ReadRoleValue(obj , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( obj , EM_RoleValue_OrgID ) ~= 103159 then
				Result = Result + 1
			end
		end
		if Result >= 3 then
			break
		end
		sleep( 10 )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		SetPlot( OwnerID() , "dead" , "LuaI_114416_6" , 0 )
		Yell( OwnerID() , "[SC_423027_3]" , 3 ) -- 沒有用的雜碎。
		local Player = ReadRoleValue( OwneRID() , EM_RoleValue_PID )
		SetRoleCamp( OwnerID() , "Monster" )
		if CheckID( Player ) == true then
			SetAttack( OwnerID() , Player )
		end
		sleep( 50 )
		while 1 do
				if HateListCount( OwnerID() ) == 0 then
					if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
						DelObj( OwnerID() )	
					else
						break
					end
				end
				sleep( 10 )
		end
	else
		if ReadRoleValue(  OwnerID() , EM_RoleValue_IsDead ) == 0 then
			DelObj( OwnerID() )
		end
	end
end

function LuaI_114416_6()
	local PlayerTeam = HateListCount( OwnerID() )
	local KeyItem = 543731
	for i = 1 , PlayerTeam, 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
		if	CheckAcceptQuest( ID , 423027 ) == true then
			SetFlag( ID , KeyItem , 1)
		end
	end 
	return true
end

function LuaS_114450_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423033 ) == true and CheckFlag( OwnerID() , 543657 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_114450_0]" ,  "LuaS_114450_1",  0 );  --對不起......我還有其他事要忙。
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_114450_1]" ,  "LuaS_114450_2",  0 );  --好，快帶我去。
	end
end

function LuaS_114450_1()
	SetSpeakDetail (  OwnerID() ,"[SC_114450_2]" )  --求求您......拜託您，我真的需要你的幫助。求求您......拜託您......求求您......我什麼事都願意做，拜託您......
	AddSpeakOption(  OwnerID(), TargetID(),"[SC_114450_1]" ,  "LuaS_114450_2",  0 );  --好，快帶我去。
end

function LuaS_114450_2()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
		BeginPlot(TargetID(), "LuaS_423033_PLAY" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1,GetString("SAY_NPC_BUSY"), 0 );
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("SAY_NPC_BUSY"), 0 );
	end
end

function LuaS_423033_PLAY()
	local Flag =780547
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Girl = CreateObjByObj( 114572 , OwnerID() )
	local Buff = 506111
	Hide( OwnerID() )
	WriteRoleValue( Girl , EM_RoleValue_IsWalk , 0 )
	Hide( Girl )
	Show( Girl , RoomID )
	MoveToFlagEnabled( Girl , false )
	Lua_Drama_Radar(Girl , 423033)
	LuaFunc_MoveToFlag( Girl , Flag , 1 , 0 )
	local Soldier = {}
	local Sister = CreateObjByflag( 114625 , Flag , 7 , 1 )
	AddToPartition( Sister  , RoomID )
	SetIdleMotion( Sister , ruFUSION_ACTORSTATE_DEAD)
	FaceObj( Girl , Sister )
	for i = 1 , 5 , 1 do
		Soldier[i] = CreateObjByflag( 103295 , Flag , i + 1 , 1 )
		if i < 4 then
			AddToPartition( Soldier[i] , RoomID )
			AdjustFaceDir( Soldier[i]  , Sister , 0 ) 
			SetRoleCamp( Soldier[i] , "Visitor" )
		end
	end
	if 	Lua_Check_Drama_Statu( Girl ) == false then
		Delobj( Girl )
		Delobj( Sister )
		if CheckID( Morok ) == true then
			Delobj( Morok )
		end
		for pry ,obj in pairs(Soldier) do
			if CheckID( obj ) == true and ReadRoleValue( obj , EM_RoleValue_OrgID ) == 103295 then
				Delobj( obj )
			end
		end
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		Show( OwnerID() , RoomID )
		return 
	else
		CancelBuff_NoEvent( Girl , 506348 )
	end
	sleep( 10 )
	Yell( Girl , "[SC_114450_3]" , 3 ) --住手......求求您......住手。
	PlayMotion( Girl , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	AdjustFaceDir( Soldier[1]  , Girl , 0 ) 	
	sleep( 10 )
	SetIdleMotion( Girl , ruFUSION_MIME_EMOTE_IDLE )
	Yell( Soldier[1] , "[SC_114450_4]" , 3 )--哼……還會找援兵來？那就讓我來試試看你的援兵可不可靠吧。
	for i = 1 , 3 , 1 do
		SetRoleCamp( Soldier[i] , "Monster" )
		Lua_Drama_Radar( Soldier[i] , 423033 )
		if CheckID( TargetID() ) == true then
			if CheckBuff( TargetID() , Buff )  == false then
				AddBuff( TargetID() , Buff , 0 , 60 )
				ScriptMessage( TargetID() , TargetID() , 2 , "[SC_114450_5]" , 0 ) --你感到有一股力量經由大地竄入你體內
				ScriptMessage( TargetID() , TargetID() , 0 , "[SC_114450_5]" , 0 ) 
			end
			SetAttack( Soldier[i] , TargetID() )
		end
	end
	local Count = 0
	local Morok = CreateObjByFlag( 103296 , Flag , 1 , 1 )
	local DeadTable = {}
	local DramaStop = 0
	local LiveCount = 0
	local Result = 0
	while 1 do
		if Count == 10 then
			for i = 4 , 5 , 1 do
				AddToPartition( Soldier[i] , RoomID )
				if i == 4 then
					Yell( Soldier[i] , "[SC_114450_6]" , 3 )--殺了他，他就是那個四處詢問我們的傢伙。
				else
					Yell( Soldier[i] , "[SC_114450_7]" , 3 )--他在暗巷區中殺掉了我的兄弟，殺了他。
				end
				Lua_Drama_Radar( Soldier[i] , 423033 )
				sleep( 10 )
			end
			Count = 11 
		end

		if Count == 12 then
			AddToPartition( Morok , RoomID )
			Yell( Morok , "[SC_114450_8]" , 3 )--抱歉，我來晚了。
			SetAttack( Morok , Soldier[5] )
		end

		if Count > 15 then
			DramaStop = 0
			LiveCount = 0
			for pry , obj in pairs(Soldier) do
				if CheckID( obj ) == true and ReadRoleValue( Obj , EM_RoleValue_IsDead ) == 0 then
					LiveCount = LiveCount + 1
				end
			end
			if LiveCount == 0 then --所有士兵皆死亡或消失就完成階段
				Result = 1
				break
			else
				
				for pry , obj in pairs(Soldier) do --讓士兵不會沒有目標
					if CheckID( obj ) == true and ReadRoleValue( Obj , EM_RoleValue_IsDead ) == 0 and HateListCount( Obj )== 0 then
						if CheckID( TargetID() ) == true then 
							SetAttack( obj  , TargetID() )
						elseif CheckID( Morok ) == true then
							SetAttack( obj  , Morok )
						end
					end
				end
				
				for pry , obj in pairs(Soldier) do --檢查士兵周圍有沒有正在解任務的玩家
					if Lua_Check_Drama_Statu( Obj) == true then
						DramaStop = DramaStop + 1
					end
				end			
				
				if DramaStop == 0 then
					break
				end			
			end
		end
		Count = Count + 1
		sleep( 10 )
	end
	if CheckID( TargetID() ) == true then
		CancelBuff( TargetID() , Buff )
	end
	if Result == 1 then
		SetRoleCamp( Morok , "Visitor" )
		Yell( Girl , "[SC_114450_9]" , 3 ) --嗚嗚嗚嗚嗚嗚......[114451]姐姐死了......[114451]姐姐死了......
		LuaFunc_MoveToFlag( Girl , Flag , 2 , 0 )
		sleep( 10 )
		AdjustFaceDir( Girl  , Sister , 0 ) 	
		SetIdleMotion( Girl , ruFUSION_MIME_EMOTE_IDLE )
		Yell( Morok , "[SC_114450_10]" , 3 ) --是亞班諾的士兵......看這盔甲的樣式不會有錯，而流浪漢口中的羔羊，就是這女孩。	
		LuaFunc_MoveToFlag( Morok , Flag , 3 , 0 )
		AdjustFaceDir( Morok  , Girl , 0 ) 
		sleep( 30 )
		AdjustFaceDir( Morok  , Sister , 0 ) 
		Yell( Morok , "[SC_114450_11]" , 3 ) --回應羔羊的眼淚，問題將會迎刃而解......
		sleep( 30 )
		PlayMotionEX( Morok , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
		Yell( Morok , "[SC_114450_12]" , 3 ) --[$PLAYERNAME]，謎底就在小女孩的身上。
		sleep( 30 )
		PlayMotion( Morok , ruFUSION_ACTORSTATE_CROUCH_END)
		Yell( Morok , "[SC_114450_13]" , 3 ) --不過我必須先去解決這附近的元素問題。
		sleep( 30 )
		if CheckID( TargetID() ) == true then
			AdjustFaceDir( Morok  , TargetID() , 0 ) 
		end
		Yell( Morok , "[SC_114450_14]" , 3 ) --接下來的部份就交給你了，協助羔羊揭開獲得謎底。
		sleep( 10 )
		PlayMotion( Morok , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep( 30 )
		LuaFunc_MoveToFlag( Morok , Flag , 8 , 0 )
		Delobj( Morok )
		SetPlot( Sister , "range" , "LuaS_423033_Range" , 150 )
		sleep( 10 )		
	end
	Delobj( Girl )
	Delobj( Sister )
	if CheckID( Morok ) == true then
		Delobj( Morok )
	end
	for pry ,obj in pairs(Soldier) do
		if CheckID( obj ) == true and ReadRoleValue( obj , EM_RoleValue_OrgID ) == 103295 then
			Delobj( obj )
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	Show( OwnerID() , RoomID )
end

function LuaS_423033_Range()
	if CheckAcceptQuest( OwnerID() , 423033 ) == true then
		SetFlag( OwnerID() , 543657 , 1 )
	end
end

function LuaI_114453_0()
	sleep( 30 )
	local Flag =780562
	local Morek = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114454 , 100 )
	local Wagon = CreateObjByFlag( 114547 , Flag , 2 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Morek )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9  , Wagon )
	Lua_ObjDontTouch( Wagon ) 
	AddToPartition( Morek , RoomID )
	AddToPartition( Wagon , RoomID )
end

function LuaS_114453_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423037 ) == true and CheckFlag( OwnerID() , 543659 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_423037_0]" ,  "LuaS_114453_1",  0 );  --來吧~讓我們來迎接這場盛宴吧。
	end
end

function LuaS_114453_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
		BeginPlot(TargetID(), "LuaS_423037_PLAY" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1,GetString("SAY_NPC_BUSY"), 0 );
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("SAY_NPC_BUSY"), 0 );
	end
end

function LuaS_423037_PLAY()

	local Morek = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Wagon = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780562
	local Fighter_Morek = CreateObjByFlag( 103296 , Flag , 1 , 1 )
	local Fighter_Self = CreateObjByObj( 103298 , OwnerID() )
	local Wagon2 = CreateObjByObj( 114547 , Wagon )
	local MathewGroup = {}
	local VillageGroup = {}
	local Count = 0
	
	Hide( OwnerID() )
	Hide( Morek )
	Hide( Wagon )
	AddToPartition( Fighter_Morek , RoomID )
	Lua_ObjDontTouch( Wagon2 ) 
	SetPlot( Fighter_Morek , "dead" , "LuaS_423037_NODEAD" , 0 )
	SetPlot( Fighter_Self , "dead" , "LuaS_423037_NODEAD" , 0 )
	SetRoleCamp( Fighter_Morek , "Visitor" )
	SetRoleCamp( Fighter_Self , "Visitor" )
	MoveToFlagEnabled( Fighter_Morek , false )
	MoveToFlagEnabled( Fighter_Self , false )
	MoveToFlagEnabled( Wagon2 , false )

	Lua_Drama_Radar( Fighter_Morek , 423037 )
	Lua_Drama_Radar( Fighter_Self , 423037 )

 	Yell( Fighter_Morek, "[SC_423036_1]" , 3 )----摩瑞克：我感覺得出有股混亂的元素再逼近。	
	LuaFunc_MoveToFlag( Fighter_Morek , Flag , 15 , 0 )	
	sleep( 5 )
	AdjustFaceDir( Fighter_Self  , Fighter_Morek  , 0 )
	sleep( 5 )
	AdjustFaceDir( Fighter_Morek  , Fighter_Self  , 0 )
	sleep( 5 )
	PlayMotion( Fighter_Self , ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell( Fighter_Self , "[SC_423036_2]" , 3 )---菲利：你是什麼人？
	sleep(30)
	PlayMotion( Fighter_Morek , ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	Yell( Fighter_Morek, "[SC_423036_3]" , 3 )---摩瑞克：我和[]是伙伴，都是來協助你們的人。
	SLEEP(20)
	PlayMotion(Fighter_Self , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Yell( Fighter_Self , "[SC_423036_4]" , 3 )---菲利：很好，那麼我們奮力一戰吧！
	
	SetFollow( Wagon2 , Fighter_Self )
--	SetFollow( Fighter_Morek , Wagon2 )
	WriteRoleValue( Fighter_Self , EM_RoleValue_PID , Wagon2 )
	
	sleep( 20 )
	if Lua_Check_Drama_Statu( Fighter_Self) == false and Lua_Check_Drama_Statu( Fighter_Morek) == false then
		Delobj( Fighter_Self )
		Delobj( Fighter_Morek )
		DelObj( Wagon2 )	
		Show( OwnerID() , RoomID )
		Show( Morek , RoomID )
		Show( Wagon , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return 
	end
	BeginPlot( Fighter_Morek , "LuaS_423037_MOVE_A" , 10 )
	LuaFunc_MoveToFlag( Fighter_Self , Flag , 3 , 0 )
	sleep( 10 )
	if Lua_Check_Drama_Statu( Fighter_Self) == false and Lua_Check_Drama_Statu( Fighter_Morek) == false then
		Delobj( Fighter_Self )
		Delobj( Fighter_Morek )
		DelObj( Wagon2 )	
		Show( OwnerID() , RoomID )
		Show( Morek , RoomID )
		Show( Wagon , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return 
	end
	for i = 1 , 6 , 1 do
	
		local ID = 103295
		
		if i == 1 then ID = 103292 end
		if i == 6 then ID = 103293 end
		
		MathewGroup[i] = CreateObjByFlag( ID , Flag , 3+i , 1 )
		AddToPartition( MathewGroup[i] , RoomID )
		SetRoleCamp(MathewGroup[i] , "Visitor" ) 
		MoveToFlagEnabled( MathewGroup[i] , false )
		WriteRoleValue( MathewGroup[i] , EM_RoleValue_PID  , 3+i )		
		
		if i == 1 or i == 6 then
			SetPlot( MathewGroup[i] , "dead" , "LuaS_423037_NODEAD" , 0 )
		end
 		Lua_Drama_Radar( MathewGroup[i] , 423037 )		
	end
	AdjustFaceDir( MathewGroup[6]  , Fighter_Self   , 0 )
	sleep( 5 )
	Yell( MathewGroup[6] , "[SC_423037_1]" , 3 ) --這一次的貨物，都準備好了嗎？
	PlayMotion( MathewGroup[6] , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 30 )
	Yell( MathewGroup[1] , "[SC_423037_2]" , 3 ) --[103293]，那些一點都不重要，這一次的重點是要來試試看我的力量提升到哪裡！
	PlayMotion( MathewGroup[1] , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	PlayMotion( MathewGroup[1] , ruFUSION_ACTORSTATE_COMBAT_UNARMED )
	sleep( 20 )	
	Yell( MathewGroup[1] , "[SC_423037_3]" , 3 ) --我等不及看藍斯鐵青的表情，我要讓他後悔羞辱了我。
	PlayMotion( MathewGroup[1] , ruFUSION_ACTORSTATE_ATTACK_UNARMED )	
	AdjustFaceDir( MathewGroup[6]  , MathewGroup[1]  , 0 )
	sleep( 20 )
	if Lua_Check_Drama_Statu( Fighter_Self) == false and Lua_Check_Drama_Statu( Fighter_Morek) == false and Lua_Check_Drama_Statu(MathewGroup[1]) == false and Lua_Check_Drama_Statu(MathewGroup[6]) == false then
		for pry , obj in pairs( MathewGroup ) do
			if CheckID( obj ) == true then
				DelObj( obj )
			end
		end
		Delobj( Fighter_Self )
		Delobj( Fighter_Morek )
		DelObj( Wagon2 )	
		Show( OwnerID() , RoomID )
		Show( Morek , RoomID )
		Show( Wagon , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return 
	end
	Yell( MathewGroup[6] , "[SC_423037_4]" , 3 ) --那麼搬走所有貨物後，滅掉這個村，您覺得如何呢？
	PlayMotion( MathewGroup[6] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	PlayMotion( MathewGroup[1] , ruFUSION_ACTORSTATE_ATTACK_UNARMED )
	SetIdleMotion( Fighter_Self , ruFUSION_MIME_ATTACK_1H )
	sleep( 30 )
	Yell( MathewGroup[1] , "[SC_423037_5]" , 3 ) --哈哈哈哈~好提議，就這麼做，首先就由眼前這群殺起吧。
	PlayMotion( MathewGroup[1] , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )	
	sleep( 20 )	
	AdjustFaceDir( MathewGroup[6]  , Fighter_Self , 0 )
	PlayMotion( MathewGroup[1] , ruFUSION_ACTORSTATE_EMOTE_POINT )	
	sleep( 20 )
	if Lua_Check_Drama_Statu( Fighter_Self) == false and Lua_Check_Drama_Statu( Fighter_Morek) == false and Lua_Check_Drama_Statu(MathewGroup[1]) == false and Lua_Check_Drama_Statu(MathewGroup[6]) == false then
		for pry , obj in pairs(MathewGroup) do
			if CheckID( obj ) == true then
				DelObj( obj )
			end
		end
		Delobj( Fighter_Self )
		Delobj( Fighter_Morek )
		DelObj( Wagon2 )	
		Show( OwnerID() , RoomID )
		Show( Morek , RoomID )
		Show( Wagon , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return 
	end
	SetRoleCamp( Fighter_Morek , "SNPC" )
	SetRoleCamp( Fighter_Self , "SNPC" )

 	for i = 1 , 6 , 1 do
 		local MyParty = {Fighter_Morek,Fighter_Self}
 		SetRoleCamp(MathewGroup[i] , "Monster" ) 
 		if i == 1 or i == 6 then
 			BeginPlot(  MathewGroup[i] , "LuaS_423037_Fight" , 0 )
 			SetAttack( MathewGroup[i] , MyParty[1]  )
 		else
 		 	SetAttack( MathewGroup[i] , MyParty[DW_Rand(2)] )
 		end		
 	end
 	
	Yell( MathewGroup[1] , "[SC_423037_6]" , 3 ) --獵人頭，然後一顆顆送到達拉尼斯城外吧！	
	Yell( Fighter_Self , "[SC_423037_7]" , 3 ) --來不及了，讓我們衝吧！
	SetAttack( Fighter_Morek , MathewGroup[1+DW_Rand(4)] )
	SetAttack( Fighter_Self , MathewGroup[1+DW_Rand(4)] )
	SetFollow( Wagon2 , 0 )
--	SetFollow( Fighter_Morek , 0 )	
	while 1 do
	
		if ReadRoleValue( MathewGroup[1] , EM_RoleValue_Register ) > 0 then
			break
		end
		
		if ReadRoleValue( MathewGroup[6] , EM_RoleValue_Register ) > 0 then
			break
		end

		if Lua_Check_Drama_Statu( Fighter_Self) == false and Lua_Check_Drama_Statu( Fighter_Morek) == false and Lua_Check_Drama_Statu(MathewGroup[1]) == false and Lua_Check_Drama_Statu(MathewGroup[6]) == false then
			for pry , obj in pairs(MathewGroup) do
				if CheckID( obj ) == true then
					DelObj( obj )
				end
			end
			if Count > 15 then
				for pry , obj in pairs(VillageGroup) do
					if CheckID( obj ) == true then
						DelObj( obj )
					end
				end			
			end
			Delobj( Fighter_Self )
			Delobj( Fighter_Morek )
			DelObj( Wagon2 )	
			Show( OwnerID() , RoomID )
			Show( Morek , RoomID )
			Show( Wagon , RoomID )
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
			return 
		end
		
		if Count == 10 then
		
			for i = 1 , 4 , 1 do
				MathewGroup[i+6] = CreateObjByFlag( 103295 , Flag , 4+i , 1 )
				AddToPartition( MathewGroup[i+6] , RoomID )
				MoveToFlagEnabled( MathewGroup[i+6] , false )
				WriteRoleValue( MathewGroup[i+6] , EM_RoleValue_PID , 4+i )
				SetAttack( MathewGroup[i+6] , Fighter_Morek )
			end
			
		end
		
		if Count == 15 then
			for i = 1 , 5 , 1 do
			
				if i == 1 then
					VillageGroup[i] = CreateObjByFlag( 103167 , Flag , 9+i , 1 )
				else
					VillageGroup[i] = CreateObjByFlag( 103166 , Flag , 9+i , 1 )
				end
				
				AddToPartition( VillageGroup[i] , RoomID )
				MoveToFlagEnabled( VillageGroup[i] , false )
				WriteRoleValue( VillageGroup[i] , EM_RoleValue_PID  , 9+i )	
				
				if i == 1 then
					SetPlot( VillageGroup[i] , "dead" , "LuaS_423037_NODEAD" , 0 )
				end
				SetAttack( VillageGroup[i] , MathewGroup[DW_Rand(10)] )				
			end			
		end
		
		Count = Count + 1
		
		sleep( 10 )
	end
	
	for i = 1 , 10 , 1 do
		if MathewGroup[i] ~= nil and CheckID(MathewGroup[i]) == true and ReadRoleValue(MathewGroup[i] , EM_RoleValue_IsDead ) == 0 then
			WriteRoleValue( MathewGroup[i] , EM_RoleValue_Register , 777 )
			Lua_CancelAllBuff( MathewGroup[i] ) 
			SetStopAttack(MathewGroup[i] )
			SetRoleCamp( MathewGroup[i] , "Visitor" )
			if i ~= 1 and i ~= 6 then
				CallPlot( MathewGroup[i]  , "LuaS_423037_MoveAndDispear" , 0 )
			end
		end
	end

	for i = 1 , 5 , 1 do
		if VillageGroup[i] ~= nil and CheckID(VillageGroup[i]) == true and ReadRoleValue(VillageGroup[i] , EM_RoleValue_IsDead ) == 0 then
			Lua_CancelAllBuff( VillageGroup[i] ) 
			SetStopAttack( VillageGroup[i] )
			SetRoleCamp( VillageGroup[i] , "Visitor" )
		end
	end
	
	Lua_CancelAllBuff( Fighter_Self ) 	
	Lua_CancelAllBuff( Fighter_Morek  ) 
	SetStopAttack( Fighter_Self )
	SetStopAttack( Fighter_Morek )	
	SetRoleCamp( Fighter_Self , "Visitor" )
	SetRoleCamp( Fighter_Morek , "Visitor" )	
	
	Yell( MathewGroup[1] , "[SC_423037_8]" , 3 ) --可惡的混帳東西們！[103293]！跟他們拼了！
	PlayMotion( MathewGroup[1]  , ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	sleep( 30 )
	Yell( MathewGroup[6] , "[SC_423037_9]" , 3 ) --大人，我們還是先保命要緊，快逃吧！
	AdjustFaceDir( MathewGroup[6]  , MathewGroup[1]  , 0 )
	sleep( 10 )
	PlayMotion( MathewGroup[6]  , ruFUSION_ACTORSTATE_EMOTE_BEG )
	sleep( 20 )
	Yell( MathewGroup[1] , "[SC_423037_10]" , 3 ) --混帳東西！給我記著！
	CallPlot( MathewGroup[1] , "LuaS_423037_MoveAndDispear" , 0 )
	CallPlot( MathewGroup[6] , "LuaS_423037_MoveAndDispear" , 0 )
	
	if VillageGroup[1] ~= nil then
		AdjustFaceDir( Fighter_Self  , OwnerID() , 0 )
		sleep( 20 )
		Yell( Fighter_Self , "[SC_423037_11]" , 3 ) --我們贏了！
		PlayMotion( Fighter_Self , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		sleep( 20 )
		for i = 2 , 5 , 1 do
			if VillageGroup[i] ~= nil and CheckID(VillageGroup[i]) == true and ReadRoleValue(VillageGroup[i] , EM_RoleValue_IsDead ) == 0 then
				local Num = DW_Rand(3)
				Yell( VillageGroup[i] , "[SC_423037_12]" , 3 ) --贏了！我們贏了！
				if Num == 1 then
					PlayMotion( VillageGroup[i] , ruFUSION_ACTORSTATE_EMOTE_ANGRY )
				else
					PlayMotion( VillageGroup[i] , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
				end
			end
		end	
		Yell( VillageGroup[1] , "[SC_423037_13]" , 3 ) --[114451]......我們贏了，妳看到了嗎？
		PlayMotion( VillageGroup[1] , ruFUSION_ACTORSTATE_EMOTE_CRY)
		sleep( 20 )
		Yell( VillageGroup[1] , "[SC_423037_14]" , 3 ) --各位村民，讓我們回到村裡，我們必須治療傷患，也要把這個好消息帶回去給大家知道！
		PlayMotion( VillageGroup[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK)		
		sleep( 20 )
		for i = 1 , 5 , 1 do
			if VillageGroup[i] ~= nil and CheckID(VillageGroup[i]) == true and ReadRoleValue(VillageGroup[i] , EM_RoleValue_IsDead ) == 0 then
				CallPlot( VillageGroup[i] , "LuaS_423037_MoveAndDispear" , 0 )
			end
		end
	end
	
	SetFollow( Wagon2 , Fighter_Self )
	SetPlot(  Fighter_Morek , "range" , "LuaS_423037_RANGE" , 300 )
	sleep( 10 )
	SetPlot(  Fighter_Morek , "range" , "" , 0 )
	sleep( 10 )
	LuaFunc_MoveToFlag( Fighter_Self , Flag , 2 , 0 )
	LuaFunc_MoveToFlag( Fighter_Morek , Flag , 15 , 0 )
	Delobj( Fighter_Self )
	Delobj( Fighter_Morek )
	DelObj( Wagon2 )	
	Show( OwnerID() , RoomID )
	Show( Morek , RoomID )
	Show( Wagon , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	
end

function LuaS_423037_MOVE_A()
	local Flag = 780562
	LuaFunc_MoveToFlag( OwnerID() , Flag , 16 , 0 )	
end

function LuaS_423037_NODEAD()
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	if ID == 103292 or ID == 103293 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 777 )
	end
	return false
end

function LuaS_423037_Fight()

	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	
	while ReadRoleValue( OwnerID() , EM_RoleValue_HP ) > MaxHP/2 do
		sleep( 10 )
	end
	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, 777 )
	
end

function LuaS_423037_MoveAndDispear(PID)

	if PID == 0 then
		PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	end
	
	local Flag = 780562
	local Running = 1
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	
	if ID == 103292 or ID == 103293 or ID == 103295 then
		Running = 0
	end
	
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , Running )
	Hide( OwnerID() )
	Show( OwnerID() , RoomID )
	
	LuaFunc_MoveToFlag( OwnerID() , Flag , PID , 0 )
	
	if ID == 103298 then
		local Wagon = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		if ReadRoleValue( Wagon , EM_RoleValue_OrgID ) == 114547 then
			DelObj( Wagon )
		end
	end
	
	DelObj( OwnerID() )
	
end

function LuaS_423037_RANGE()
	if CheckAcceptQuest( OwnerID() , 423037 ) == true and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
		SetFlag( OwnerID() , 543659 , 1 )
	end
end

function LuaI_114576_0()
	local Num = DW_Rand(4)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )
end

--function LuaS_114576_0()
--	local String = {"LuaS_114576_1" , "LuaS_114576_2" , "LuaS_114576_3" , "LuaS_114576_4" , "LuaS_114576_5" }
--	SetSpeakDetail( OwnerID(), "["..String[DW_Rand(5)].."]" )
--	if CheckAcceptQuest( OwnerID() , 423038 ) == true then
--		AddSpeakOption( OwnerID() , TargetID() , "[LuaS_114576_0]" , "LuaS_114576_1" ) --請問你有沒有看到亞班諾領主[103292]？
--	end
--end

--function LuaS_114576_1()
--	local String = {"LuaS_114576_6" , "LuaS_114576_7" , "LuaS_114576_8" , "LuaS_114576_9" }
--	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
--	SetSpeakDetail( OwnerID(), "["..String[PID].."]" )	
--end

function LuaI_114455_0()
	local Villageer = Lua_CreateObjByDir( OwnerID() , 114577 , 150 , 90) 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	WriteRoleValue( Villageer , EM_RoleValue_PID , OwnerID() )
	AddToPartition( Villageer , RoomID )
end

function LuaS_114577_0()
	local KeyItem = 543663
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423038 ) == true and CheckFlag( OwnerID() , KeyItem ) == false then
		AddSpeakOption( OwnerID() , TargetID()  , "[SC_114576_0]" , "LuaS_114577_1", 0 ) --請問你有沒有看到亞班諾領主[103292]？
	end
	if CheckAcceptQuest( OwnerID() , 423039 ) == true and CheckFlag( OwnerID() , 543732 ) == false then
		AddSpeakOption( OwnerID() , TargetID()  , "[SC_114577_2]" , "LuaS_114577_3", 0 ) --我願意幫忙你向[103292]要回你的貨物。
	end
end

function LuaS_114577_1()
	local KeyItem =543663
	SetSpeakDetail( OwnerID(), "[SC_114577_0]" )
	--你們要找他嗎？我剛剛看見了，看見了他......他們一群人，帶著一堆貨物由那邊走過。

	--他們還搶走了我的東西，我可以帶你們過去找他們，希望你們能從他們身上找回我的東西。
	if CheckAcceptQuest( OwnerID() , 423038 ) == true and CheckFlag( OwnerID() , KeyItem ) == false then
		SetFlag( OwnerID() , KeyItem , 1 )
		BeginPlot( OwnerID() , "LuaS_114577_2" , 0 )
	end
end

function LuaS_114577_2()
	sleep( 50 )
	if CheckFlag( OwnerID() , 543660 ) == true and CheckFlag( OwnerID() , 543661 ) == true and CheckFlag( OwnerID() , 543662 ) == true  then  
		ScriptMessage( OwnerID() , OwnerID() , 0 ,  "[SC_114577_1]" , 0 ) --我到了，我在XXX等你。
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 ,  "[SC_114577_7]" , 0 ) --我到了，我先去附近探查一下，等下我們在這裡會合。
	end
end

function LuaS_114577_3()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
		BeginPlot(TargetID(), "LuaS_423039_PLAY" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1,GetString("SAY_NPC_BUSY"), 0 );
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("SAY_NPC_BUSY"), 0 );
	end
end

function LuaS_423039_PLAY()
	local Morek = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Morek_Fight = CreateObjByObj( 103296 , Morek )
	local AnotherMe = CreateObjByObj( 114577 , OwnerID() )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780563
	local Trap = CreateObjByFlag( 112399 , Flag , 1 , 1 )
	local Trigger = 0
	local Ambush = { 0 , 0 , 0 }
	local Me = Role:new( AnotherMe )
	local Alive = 0
	local Count = 0
	
	Lua_ObjDontTouch( Trap ) 
	AddToPartition( Trap , RoomID )
	WriteRoleValue( Trap , EM_RoleValue_PID , AnotherMe )
	SetPlot( Trap , "range" , "LuaS_423039_Trap" , 50 )
	
	Hide( OwnerID() )
	Hide( Morek )
	DisableQuest( AnotherMe , true )
	WriteRoleValue( AnotherMe , EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( Morek_Fight ,  EM_RoleValue_IsWalk, 1 )
	Hide( AnotherMe )
	Hide( Morek_Fight )
	Show( AnotherMe  , RoomID)
	Show( Morek_Fight  , RoomID )
	MoveToFlagEnabled( AnotherMe , false )
	MoveToFlagEnabled( Morek_Fight , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 )
	SetRoleCamp( Morek_Fight , "Visitor" )
	
	Yell( AnotherMe , "[SC_114577_3]" , 3 )  --跟我來......
	Lua_Drama_Radar( AnotherMe , 423039 )
	local X , Y , Z = GetMoveFlagValue( Flag , 9 , EM_RoleValue_X ) , GetMoveFlagValue( Flag , 9 , EM_RoleValue_Y ) , GetMoveFlagValue( Flag , 9 , EM_RoleValue_Z )
	local PassPoint = 0
	
	while 1 do
		if ( CheckID( Trap ) == false or ReadRoleValue( Trap , EM_RoleValue_OrgID ) ~= 112399 ) and Trigger == 0 then
			Trigger = 1 
		end
		if Trigger == 0 then
			if Lua_Check_Drama_Statu(AnotherMe ) == false then
				break
			end			
			if ( ( Me:X() - X ) ^ 2 + ( Me:Y() - Y ) ^ 2 + ( Me:Z() - Z ) ^ 2 ) < 25 then
				if PassPoint > 0 then
					if CheckID( Trap ) == true and ReadRoleValue( Trap , EM_RoleValue_OrgID ) == 112399 then
						DelObj( Trap )
					end
				else
					X , Y , Z = GetMoveFlagValue( Flag , 2 , EM_RoleValue_X ) , GetMoveFlagValue( Flag , 2 , EM_RoleValue_Y ) , GetMoveFlagValue( Flag , 2 , EM_RoleValue_Z )
					PassPoint = PassPoint + 1
				end
			end
			Move( AnotherMe , X , Y , Z )
			if Count >= 3 then
				Move( Morek_Fight , X , Y , Z )
			end
		else
			if Trigger == 1 then
				WriteRoleValue( AnotherMe , EM_RoleValue_IsWalk, 0 )		
				Hide( AnotherMe )
				Show( AnotherMe , RoomID )
				Yell( AnotherMe , "[SC_114577_4]" , 3 ) --趕快把他們解決了！
				BeginPlot( AnotherMe , "LuaS_423039_Move1" ,0 )
				for i = 1 , 3 , 1 do
					Ambush[i] = CreateObjByFlag( 103295 , Flag , i + 2 , 1 )
					WriteRoleValue( Ambush[i] , EM_RoleValue_Register , OwnerID() )
					AddToPartition( Ambush[i] , 0 )
					SetPlot( Ambush[i] , "dead" , "LuaS_423039_DEAD" , 0 )
					if CheckID( TargetID() ) == true then
						SetAttack( Ambush[i] , TargetID() )
					end
					CallPlot( Ambush[i] , "LuaFunc_Obj_Suicide" , 150 )
					Lua_Drama_Radar( Ambush[i] , 423039 )
				end
				SetRoleCamp( Morek_Fight , "SNPC" )
				Lua_Drama_Radar( Morek_Fight , 423039 )
				Yell( Ambush[1] , "[SC_114577_5]" , 3 ) --那倒是，趕快解決完，趕快交差。
				SetAttack( Morek_Fight , Ambush[1] )
				Trigger = 2
			end
			Alive = 0
			for i = 1 , 3 , 1 do
				if CheckID(Ambush[i]) == true and ReadRoleValue( Ambush[i] , EM_RoleValue_OrgID ) == 103295 and ReadRoleValue( Ambush[i] , EM_RoleValue_IsDead ) == 0 and Lua_Check_Drama_Statu(Morek_Fight ) == true then
					Alive = Alive + 1
				end
			end
			if Lua_Check_Drama_Statu(AnotherMe ) == false and Lua_Check_Drama_Statu(Morek_Fight) == false then
				break
			end	
			if Alive == 0 then
				for i = 1 , 3 , 1 do
					if CheckID( Ambush[i] ) == true then
						DelObj( Ambush[i] )
					end
				end
				break
			end
		end
		Count = Count + 1
		sleep( 10 )
	end
	if ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 9 ) >= 3 then
		PlayMotion( AnotherMe , ruFUSION_ACTORSTATE_CROUCH_END )
		SetStopAttack( Morek_Fight )
		Lua_CancelAllBuff( Morek_Fight ) 
		SetRoleCamp( Morek_Fight , "Visitor" )
		Hide( AnotherMe )
		WriteRoleValue(AnotherMe , EM_RoleValue_IsWalk , 0 )
		Show( AnotherMe , RoomID )
		LuaFunc_MoveToFlag( AnotherMe , Flag , 7 , 0 )
		Yell( Morek_Fight , "[SC_114577_6]" , 3 )
		CastSpell( Morek_Fight , Morek_Fight , 492359 )
		sleep( 5 )
		SetPosByFlag( Morek_Fight , Flag  , 8 )
		CastSpell( Morek_Fight , Morek_Fight , 492359 )
		sleep( 5 )
		PlayMotion( Morek_Fight , ruFUSION_ACTORSTATE_CAST_INSTANT )
		sleep( 5 )
		PlayMotion( AnotherMe , ruFUSION_ACTORSTATE_HURT_CRITICAL )	
		AddBuff( AnotherMe , 505974, 0 , -1 )
		sleep( 10 )
		SetPlot( Morek_Fight , "range" , "LuaS_423039_Range" , 400 )
		sleep( 10 )
	end 
	DelObj( AnotherMe )
	DelObj( Morek_Fight )
	Show( OwnerID() , RoomID )
	Show( Morek , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 )
end

function LuaS_423039_Trap()
	local Villageer = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	if CheckAcceptQuest( OwnerID() , 423039 ) == true and CheckID( Villageer ) == true and GetDistance( Villageer , TargetID() ) < 100 then
		WriteRoleValue( TargetID() , EM_RoleValue_LiveTime , 30 )
		SetPlot( TargetID() , "range" , "" , 0 )
		BeginPlot( TargetID() , "LuaS_423039_Trap_2" , 0 )
	end
	if CheckID( Villageer ) == false then
		DelObj( TargetID() )
	end
end

function LuaS_423039_Trap_2()
	local Spell = 492359
	CastSpell( OwnerID() , OwnerID() , Spell )
	sleep( 10 )
	CastSpell( OwnerID() , OwnerID() , 492667 )
	sleep( 10 )
	DelObj( OwnerID() )
end

function LuaS_423039_DEAD()
	local Recorder = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Record = ReadRoleValue( Recorder , EM_RoleValue_Register + 9)
	Record = Record + 1
	WriteRoleValue( Recorder , EM_RoleValue_Register + 9 , Record )
	return true
end

function LuaS_423039_Move1()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780563
	Hide( OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	Show( OwnerID() , RoomID )
	LuaFunc_MoveToFlag( OwnerID() , Flag , 6 , 0 )
	sleep( 5 )
	local Dir = GetMoveFlagValue( Flag , 6 , EM_RoleValue_Dir )
	SetDir( OwnerID(), Dir )
	sleep( 5 )
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
end

function LuaS_423039_Move2()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780563
	Hide( OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	Show( OwnerID() , RoomID )
	LuaFunc_MoveToFlag( OwnerID() , Flag , 7 , 0 )
	sleep( 5 )
	local Dir = GetMoveFlagValue( Flag , 6 , EM_RoleValue_Dir )
	SetDir( OwnerID(), Dir )
	sleep( 5 )
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
end

function LuaS_423039_Range()
	local KeyItem = 543732
	if CheckAcceptQuest( OwnerID() , 423039 ) == true then
		SetFlag( OwnerID() , KeyItem , 1 )
	end
end

function LuaI_114597_0()
	SetIdleMotion( OwnerID(),ruFUSION_MIME_EMOTE_IDLE0)
	AddBuff( OwnerID() , 505974, 0 , -1 )
end

function LuaS_114597_0()
	local KeyItem = 543724
	if CheckFlag( OwnerID() ,  KeyItem ) == true or CheckCompleteQuest( OwnerID() , 423040 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_114597_9]" ) --拜託！放過我吧！我只是個小角色，我知道的真的就那些了！拜託你！放過我吧！
	else
		if CountBodyItem( OwnerID() , 206797 ) > 0 then
			LoadQuestOption( OwnerID() )
			if CheckAcceptQuest( OwnerID() , 423040 ) == true then
				AddSpeakOption( OwnerID() , TargetID() , "[SC_114597_0]" , "LuaS_114597_1" , 0 ) --說！你們為什麼要偷取亞龍龍蛋？
			end
		else
			SetSpeakDetail( OwnerID() , "[SC_114597_10]" ) 
		end
	end
end

function LuaS_114597_1()
	SetSpeakDetail( OwnerID() , "[SC_114597_1]" ) --我不知道~我真的不知道。
	AddSpeakOption( OwnerID() , TargetID() , "[SC_114597_2]" , "LuaS_114597_2" , 0 ) --(把小刀架在居民的手腕上。)
end

function LuaS_114597_2()
	SetSpeakDetail( OwnerID() , "[SC_114597_3]" ) --我真的不知道~上面的人只說要做什麼實驗，要這些素材，我們就做了，我怎麼會知道他們到底要做什麼？
	AddSpeakOption( OwnerID() , TargetID() , "[SC_114597_4]" , "LuaS_114597_3", 0  ) --真的嗎？
end

function LuaS_114597_3()
	SetSpeakDetail( OwnerID() , "[SC_114597_5]" ) --真的~真的~我真的也不明白為什麼要偷龍蛋？那些亞龍殘暴的模樣，我到現在都還沒辦法忘記。
	AddSpeakOption( OwnerID() , TargetID() , "[SC_114597_6]" , "LuaS_114597_4" , 0 ) --那麼[103292]的藏身之地，你總該知道了吧？
end

function LuaS_114597_4()
	SetSpeakDetail( OwnerID() , "[SC_114597_1]" ) --我不知道~我真的不知道。
	AddSpeakOption( OwnerID() , TargetID() , "[SC_114597_7]" , "LuaS_114597_5", 0  ) --(把小刀架在居民的脖子上。)
end

function LuaS_114597_5()
	local KeyItem = 543724
	SetSpeakDetail( OwnerID() , "[SC_114597_8]" ) --我真的不知道......上面的什麼都沒告訴我，只說[103293]副官今天要到皇宮的暗房搬運東西，要我們清除你們這些麻煩，他真的沒有再告訴我們到底要做什麼？是真的，我用生命發誓。你現在過去，他們一定還在那邊。
	if CheckAcceptQuest( OwnerID() , 423040 ) == true then
		SetFlag( OwnerID() , KeyItem , 1 )
	end
end

function LuaI_423041_HINT_0()
	SetPlot( OwnerID() , "range" , "LuaI_423041_HINT_1" , 50 )
end

function LuaI_423041_HINT_1()
	local KeyItem = 543761
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )

	if CheckAcceptQuest( OwnerID() , 423041 ) == true and CheckFlag( OwnerID() , KeyItem ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423041_HINT]" , 0 ) --樓梯下方傳來有人說話的聲音
		if ReadRoleValue( PID ,EM_RoleValue_Register ) > 0 then
			return
		end
		sleep( 20 )
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423041_0]" , 0 ) --[103293]：你們，把這堆寶石送往秘密基地。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423041_0]" , 0 ) 
		sleep( 20 )
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423041_1]" , 0 ) --[103293]：至於這堆比較小堆的寶石，就送到下水道那吧！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423041_1]" , 0 ) 
		SetFlag( OwnerID() , KeyItem , 1 )
	end
end

function LuaI_423041_0()
	local Flag = 780564
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Trigger = CreateObjByFlag( 114357 , Flag , 10 , 1 )
	Lua_ObjDontTouch( Trigger ) 
	AddToPartition( Trigger , RoomID )
	WriteRoleValue( Trigger , EM_RoleValue_PID , OwnerID() )
	BeginPlot( Trigger , "LuaI_423041_HINT_0" , 0 )
	SetPlot( OwnerID() , "range" , "LuaI_423041_1" , 50 )
end

function LuaI_423041_1()
	local KeyItem1 = 543761
	local KeyItem2 = 543733
	if CheckAcceptQuest( OwnerID() , 423041 ) == true and CheckFlag( OwnerID() , KeyItem1 ) == true and CheckFlag( OwnerID() , KeyItem2 ) == false then
		if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then 
			WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
			BeginPlot( TargetID() , "LuaI_423041_2" , 0 )
		end
		AddBuff( OwnerID() , 506111 , 0 , 60 )
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_114450_5]" , 0 ) --你感到有一股力量經由大地竄入你體內
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_114450_5]" , 0 ) 
	end
end

function LuaI_423041_2()
	local Flag = 780564
	local Rock = {}
	local Morek = CreateObjByFlag( 103296 , Flag , 10 , 1 )
	local Check = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local LiveCount = 0
	local Result = 0
	for i = 1 , 15 , 1 do
		local ID = 103295
		if i == 1 then
			ID = 103293
		end
		if i <= 9 then
			Rock[i] = CreateObjByFlag( ID , Flag , i , 1 )
		else
			Rock[i] = CreateObjByFlag( ID , Flag , 10 , 1 )
		end
		if i <= 3 then
			WriteRoleValue( Rock[i] , EM_RoleValue_IsWalk , 0 )
			AddToPartition( Rock[i] , RoomID)
			MoveToflagEnabled( Rock[i], false )
			SetRoleCamp(  Rock[i], "Visitor" )
			AddBuff( Rock[i] , 505975 , 0 , -1 )
		elseif i <= 9 and i > 3 then
			SetRoleCamp(  Rock[i], "Visitor" )
		end
		if i >3 and i <= 9 then
			AddToPartition( Rock[i] , RoomID)
			Lua_Drama_Radar( Rock[i] , 423041 )
		end
	end
	for i = 1 , 6 , 1 do
		SetAttack(  Rock[i+3] , TargetID() )
	end
	if CheckID( TargetID() ) == true then
		AdjustFaceDir( Rock[1] , TargetID(), 0 ) 
	end
	Yell( Rock[1] , "[SC_423041_2]" , 3 ) --看來還有餘孽沒有清除乾淨......
	sleep( 20 )
	Yell( Rock[1] , "[SC_423041_3]" , 3 ) --你們，快把東西送往老地方。
	AdjustFaceDir( Rock[1] , Rock[2], 0 ) 
	AdjustFaceDir( Rock[2] , Rock[1], 0 )
	AdjustFaceDir( Rock[3] , Rock[1], 0 )
	sleep( 10 )
	PlayMotion( Rock[1] , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 20 )
	if CheckID( TargetID() ) == true then
		for i = 1 , 9 , 1 do
			AdjustFaceDir( Rock[i] , TargetID(), 0 ) 
		end
	end
	Yell( Rock[1] , "[SC_423041_4]" , 3 ) --剩下的人，合力把他解決掉，沒有把這麻煩解決掉，就別回來見我。
	PlayMotion( Rock[1] , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 20 )
	for i = 4 , 9 , 1 do
		SetRoleCamp( Rock[i] , "Monster" )
		SetAttack(  Rock[i] , TargetID() )
	end
	Setfollow( Rock[2] , Rock[1] )
	Setfollow( Rock[3] , Rock[1] )
	LuaFunc_MoveToFlag( Rock[1] , Flag , 10 , 0 )
	DelObj( Rock[1] )
	DelObj( Rock[2] )
	DelObj( Rock[3] )
	sleep( 10 )
	for i = 1 , 6 , 1 do
		AddToPartition( Rock[i+9] , RoomID )
		SetAttack(  Rock[i+9] , TargetID() )
		Lua_Drama_Radar( Rock[i+9]  , 423041 )
	end
	for i = 1 , 50 , 1 do
		Check = 0
		result = 0
		if i == 5 then
			AddToPartition( Morek , RoomID )
			Yell( Morek , "[SC_423041_5]" , 3 ) --撐著點！我來了！
		end
		for pry , obj in pairs(Rock) do
			if i > 10 and HateListCount( obj ) == 0 and ReadRoleValue( obj , EM_RoleValue_IsDead ) == 0 then
				SetStopAttack( obj )
				Lua_CancelAllBuff( obj ) 
				SetRoleCamp( obj , "Visitor" )
				WriteRoleValue( obj , EM_RoleValue_IsWalk , 0 )
				WriteRoleValue( obj , EM_RoleValue_LiveTime , 10 )
				MoveToFlagEnabled( obj , false )
				BeginPlot( obj , "LuaI_423041_Flee" , 0 )
				LiveCount = LiveCount + 1
			end
			if CheckID( obj ) == true and ReadRoleValue( obj , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( obj , EM_RoleValue_OrgID ) == 103295 then
				Check = 1
			end
		end
		if Lua_Check_Drama_Extra_OneTime( Morek , 423041 , 350 ) == true then
			result = 1
		end
		if i > 2 and Check == 0 then
			if i < 5 then
				AddToPartition( Morek , RoomID )
			end
			break
		end
		if result == 0 then
			break
		end
		sleep( 10 )
	end

	for pry , obj in pairs( Rock ) do
		if CheckID( obj ) == true and ReadRoleValue( obj , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( obj , EM_RoleValue_OrgID ) == 103295 then
			SetStopAttack( obj )
			Lua_CancelAllBuff( obj ) 
			SetRoleCamp( obj , "Visitor" )
			WriteRoleValue( obj , EM_RoleValue_IsWalk , 0 )
			WriteRoleValue( obj , EM_RoleValue_LiveTime , 10 )
			MoveToFlagEnabled( obj , false )
			BeginPlot( obj , "LuaI_423041_Flee" , 0 )
			LiveCount = LiveCount + 1
		end
	end
	if result == 0 then
		DelObj( Morek )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end	
	if ReadRoleValue( Morek , EM_RoleValue_RoomID ) ~= RoomID then
		AddToPartition( Morek , RoomID )
	end
	SetStopAttack( Morek )
	Lua_CancelAllBuff( Morek ) 
	SetRoleCamp( Morek , "Visitor" )
	LuaFunc_MoveToFlag( Morek , Flag , 10 , 0 )	
	sleep( 10 )
	SetPlot( Morek , "range" , "LuaI_423041_Range" , 300 )
	if LiveCount <= 0 then
		Yell( Morek , "[SC_423041_8]" , 3 ) --[$PLAYERNAME]，你沒事吧？
		sleep( 20 )
	end
	Yell( Morek , "[SC_423041_6]" , 3 ) --別追，這些人逃走的樣子太過從容了......八成有詐。
	if CheckID( TargetID() ) == true then
		AdjustFaceDir( Morek , TargetID(), 0 ) 
	end
	sleep( 5 )
	PlayMotion( Morek , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 15 )
	SetPlot( Morek , "range" , "" , 0 )	
	LuaFunc_MoveToFlag( Morek , Flag , 11 , 0 )	
--	Yell( Morek , "[SC_423041_7]" , 3 ) --對了，你有找到[103293]嗎？
	DelObj( Morek )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_423041_Flee()
	LuaFunc_MoveToFlag( OwnerID() , 780564 , 10 , 0 )
	Delobj( OwnerID() )
end

function LuaI_423041_Range()
	local KeyItem = 543733
	if CheckAcceptQuest( OwnerID() , 423041 ) == true then
		SetFlag( OwnerID() , KeyItem , 1 )
	end
end