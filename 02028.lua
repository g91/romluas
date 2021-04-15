function LuaS_423506_USECHECK()------780750
	if	  CheckFlag( OwnerID(),  544357) == true  then
			return -1
	end
		return 1
end


function LuaS_423506_1()----104332
---1.種出拉法埃爾‧貝克德104332和3隻死氣沉沉的士兵104333。
---2.種出摩瑞克104330與晨星104334。
---3.演戲....
---4.戰鬥....
----種出混世大摩王
---780751
	local KK = Lua_DW_CreateObj("flag" ,116187,780751,1,0 )---種出一個掌控全部的NPC的魔王。
	DisableQuest(  TargetID() ,true )
	SetPlot( TargetID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition( KK, 0 )
	WriteRoleValue( KK, EM_RoleValue_Register9 ,OwnerID() )---把玩家寫到裡頭
	BeginPlot( KK , "LuaS_423506_4" , 0 )
	Callplot( targetID(), "LuaS_423506_1_sub",KK)
END
function LuaS_423506_1_sub(KK)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
					DisableQuest(  OwnerID() ,false)
					SetPlot(  OwnerID() , "touch" , "" , 50 )
			break
		end
	end
end
function LuaS_423506_4()
	local  FF = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)--	
	local CK= Lua_DW_CreateObj("flag" ,104332,780751,2,1)
	SetRoleCamp( CK  , "Visitor" ) 
	local DD= Lua_DW_CreateObj("flag" ,104333,780751,21,1)     
	local CC= Lua_DW_CreateObj("flag" ,104333,780751,22,1)
	local KK= Lua_DW_CreateObj("flag" ,104333,780751,19,1)
	local MM= Lua_DW_CreateObj("flag" ,104333,780751,20,1)
	SetRoleCamp( DD  , "Visitor" )
	SetRoleCamp( CC  , "Visitor" )
	SetRoleCamp( KK  , "Visitor" )
	SetRoleCamp( MM  , "Visitor" )		
	local MORK = Lua_DW_CreateObj("flag" ,104330,780751,3,0 )
	local STAR = Lua_DW_CreateObj("flag" ,104334,780751,4,0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register1 ,MM) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 ,CK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,DD) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,CC) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,KK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register6 ,MORK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register7 ,STAR)
	BeginPlot( OwnerID()  , "LuaS_423506_5" , 0 )
	Say(CK,"[SC_423506_1]")--自～還是將你引上鉤了吧？	
PlayMotion(CK, ruFUSION_ACTORSTATE_EMOTE_IDLE0   )
	sleep(35)
	Say(CK,"[SC_423506_2]")--礙事者，看在小麻雀的面子上，我會讓你死得快一點。	
PlayMotion(CK,   ruFUSION_ACTORSTATE_EMOTE_IDLE1   )
----PlayMotion(CK,   ruFUSION_MIME_ATTACK_1H  )
	sleep(35)
	AddToPartition( MORK , 0 )
	AddToPartition( STAR , 0 )
	AdjustFaceDir( CK , STAR, 0 )
	Say(CK,"[SC_423506_3]")--小麻雀，你終究還是出來了？。	
---- ruFUSION_MIME_CAST_BEGIN     
SetDefIdleMotion(CK, ruFUSION_MIME_CAST_BEGIN          )---
sleep(10)
SetDefIdleMotion(CK,  ruFUSION_MIME_CAST_LOOP          )---
	sleep(20)
	Say(CK,"[SC_423506_4]")--還有我們的半龍人？血液的提供者，少了你，我們的實驗就不會成功。	
	sleep(30)
SetDefIdleMotion(CK, ruFUSION_MIME_CAST_END    )---
	Say(CK,"[SC_423506_5]")--來得正好，讓我抽光你的血液，將你的軀體奉獻給我的主子。
SetDefIdleMotion(CK,    ruFUSION_MIME_CAST_INSTANT          )---
	sleep(30)

SetDefIdleMotion(CK, ruFUSION_MIME_IDLE_STAND     )---常時間的形態
	Say(CK,"[SC_423506_6]")--動手吧！讓我來看看摯愛的小麻雀身手如何？
	sleep(30)
	Say(STAR,"[SC_423506_7]")--殺了他，我的噩夢才會結束。
	sleep(20)
	SetRoleCamp( DD  , "Monster"  )
	SetRoleCamp( CC  , "Monster"  )
	SetRoleCamp( KK  , "Monster"  )
	SetRoleCamp( MM  , "Monster"  )
	SetRoleCamp( CK  , "Monster" )
---	SetPlot( DD , "dead" , "LuaS_MM_Dead" , 0 )
---	SetPlot( CC , "dead" , "LuaS_MM_Dead" , 0 )
---	SetPlot( KK , "dead" , "LuaS_MM_Dead" , 0 )
	SetPlot( CK , "dead" , "LuaS_423506_2" , 0 )
	SetAttack( DD , MORK )
	SetAttack( CC , MORK )
	SetAttack( KK , STAR )
	if  CheckID( FF) == true then
			SetAttack( CK , FF )
			SetAttack( MM , FF )
	else
			SetAttack( CK , MORK )
			SetAttack( MM , MORK)
	end
	local Group = {}
	Group = SearchRangePlayer(OwnerID(), 350)
	for QR=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[QR] , 423506 ) == true ) and CheckFlag( Group[QR],544357)==false then
			ScriptMessage( Group[QR], Group[QR], 1 , "[SC_423506_8]" , 0 ) 
			Tell(Group[QR],MORK , "[SC_423506_8]")---我們必須守護住[104334]，同時必須攻擊[104332]，這是一場硬戰。
		end
	end
	local Num = 0
	local TT=ReadRoleValue(CK,EM_RoleValue_MaxHP)
	local EE = ReadRoleValue(CK,EM_RoleValue_HP)
	for i=1, 180, 1 do
		EE = ReadRoleValue(CK,EM_RoleValue_HP)
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423506 ) == true	and
				CheckFlag( Group[K], 544357) == false	then
				Num = Num + 1
			end
		end
		if	Num == 0  then
		
			break
		end
		if ReadRoleValue( STAR , EM_RoleValue_IsDead  )== 1 or EE/TT <0.5  then
			if ReadRoleValue( STAR , EM_RoleValue_IsDead  )~= 1 and EE/TT <0.5 then
				BeginPlot( CK , "LuaS_423506_2" , 0)	
			end	
			break
		end
		if 	CheckID( CK ) == true and CheckID( MORK) == true and  CheckID(STAR) == true    and    i==180 then
			for M=0,table.getn(Group)-1 do
				if	CheckAcceptQuest( Group[M], 423506 ) == true	and
					CheckFlag( Group[M], 544357) == false	then
					ScriptMessage(Group[M], Group[M],  1 , "[SC_423353_6]" , 0 ) --超出時間，劇情中斷。
					ScriptMessage( Group[M], Group[M], 0 , "[SC_423353_6]" , 0 )
							
				end
			end
			break
		end
		sleep(10)
	end
	if	 ReadRoleValue( STAR , EM_RoleValue_IsDead  )== 1 then
			for M=0,table.getn(Group)-1 do
				if	CheckAcceptQuest( Group[M], 423506 ) == true	and
					CheckFlag( Group[M], 544357) == false	then
					ScriptMessage(Group[M], Group[M],  1 , "[SC_423506_9]" , 0 ) --你沒有保護好[104334]，任務失敗。
					ScriptMessage( Group[M], Group[M], 0 , "[SC_423506_9]" , 0 )
				end
			end
			delobj(MM)
			delobj(DD)
			delobj(CC)
			delobj(KK)
			delobj(CK)
			delobj(MORK)
			delobj(STAR)
			delobj(  OwnerID())
	end
	if	 ReadRoleValue( STAR , EM_RoleValue_IsDead  )~= 1 and EE/TT >0.5  then
			delobj(MM)
			delobj(DD)
			delobj(CC)
			delobj(KK)
			delobj(CK)
			delobj(MORK)
			delobj(STAR)
			delobj(  OwnerID())
	end
	if  ReadRoleValue( STAR , EM_RoleValue_IsDead  )~= 1 and EE/TT <0.5 then
		if ReadRoleValue( DD , EM_RoleValue_IsDead  )== 1 then
		      delobj(DD)
		end
		if ReadRoleValue( CC , EM_RoleValue_IsDead  )== 1 then
			delobj(CC)
		end
		if ReadRoleValue( KK , EM_RoleValue_IsDead  )== 1 then
			delobj(KK)
		end
		if ReadRoleValue( MM , EM_RoleValue_IsDead  )== 1 then
			delobj(MM)
		end
		if ReadRoleValue( DD , EM_RoleValue_IsDead  )~= 1  then
			SetRoleCamp( DD  , "Visitor" )
			SetStopAttack( DD )
		end
		if ReadRoleValue( CC , EM_RoleValue_IsDead  )~= 1  then
			SetRoleCamp( CC  , "Visitor" )
			SetStopAttack( CC )
		end
		if ReadRoleValue( KK , EM_RoleValue_IsDead  )~= 1  then
			SetRoleCamp( KK  , "Visitor" )
			SetStopAttack( KK )
		end
		if ReadRoleValue( MM , EM_RoleValue_IsDead  )~= 1  then
			SetRoleCamp( MM  , "Visitor" )
			SetStopAttack( MM )
		end
		Sleep(20)	
		SetStopAttack( Mork )
		SetStopAttack( STAR )
		SetStopAttack( CK )
		Sleep(20)	
		SetRoleCamp( CK  , "Visitor" )
		SetRoleCamp( MORK  , "Visitor" )
		SetRoleCamp( STAR  , "Visitor" )
		Say(CK,"[SC_423506_12]")---小麻雀...一個好的遊戲，值得讓人慢慢回味。
		sleep(30)
		Say(CK,"[SC_423506_13]")--這一次就先點到為止，期待下一次見面！
		if 	CheckID( CK) == true and  ReadRoleValue( CK, EM_RoleValue_IsDead  )~= 1 then
			CastSpell(CK,CK,491276)
		end
		if 	CheckID( KK) == true and  ReadRoleValue( KK , EM_RoleValue_IsDead  )~= 1 then
			CastSpell(KK,KK,491276)
		end
		if 	CheckID( DD) == true  and  ReadRoleValue( DD , EM_RoleValue_IsDead  )~= 1 then
			CastSpell(DD,DD,491276)
		end
		if 	CheckID( CC) == true and ReadRoleValue( CC , EM_RoleValue_IsDead  )~= 1 then
			CastSpell(CC,CC,491276)
		end
		sleep(20)
		Hide(CK)
		Hide(KK)
		Hide(DD)
		Hide(CC)
		Hide(MM)
		Say(MORK,"[SC_423506_10]")---糟了！康葛斯還在這附近！希望他別出事！
		BeginPlot( MORK, "LuaS_423506_3" , 0)	
		sleep(10)
		BeginPlot(STAR, "LuaS_423506_3" , 0)
		Say(STAR,"[SC_423506_11]")---走吧...
		sleep(40)
		delobj(DD)
		delobj(CC)
		delobj(KK)
		delobj(MM)
		delobj(  OwnerID())
	end	
end
		
function LuaS_423506_3()
	DW_MoveToFlag( OwnerID() ,780751,5, 0,1)
	Delobj( OwnerID() )
end	
			
function LuaS_423506_2()
----	SetAttack( OwnerID() , TargetID() )
	local TempID
	for	i=0 , HateListCount(OwnerID())-1 DO
		TempID = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID )----
--debugmsg(  0,0, HateListCount(OwnerID()) )
--debugmsg(  0,0, TempID )
		if	CheckAcceptQuest( TempID , 423506)==true  	then
			SetFlag(TempID  ,544357, 1 )
		end
	end
	return false
end



function LuaS_423506_5()
	local MM = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)--
	local CK = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local DD = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local CC = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local KK = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)--
	local STAR = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--	
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 500)
	for i=1, 25, 1 do
		Num = 0
			for K=0,table.getn(Group)-1 do
				if	CheckAcceptQuest( Group[K], 423506 ) == true	and
					CheckFlag( Group[K], 544357) == false and GetDistance( Group[K] , OwnerID() ) < 500  	then
					Num = Num + 1
				end
			end
		if	Num == 0  then
			if 	CheckID( MM ) == true  then
				delobj(MM)
			end
			if 	CheckID( CC ) == true  then
				delobj(CC)
			end
			if 	CheckID( DD ) == true  then
				delobj(DD)
			end
			if 	CheckID( KK) == true  then
				delobj(KK)
			end
			if 	CheckID( CK ) == true  then
				delobj(CK)
			end
			if 	CheckID(MORK ) == true  then
				delobj(MORK)
			end
			if 	CheckID( STAR ) == true  then
				delobj(STAR)
			end
			delobj(OwnerID())
		end
		sleep(10)
	end
end