function LuaQ_420178_OnClick()
	local ItemID = 200635
	local ItemCount = 1

	local Count = CountBodyItem( OwnerID(), ItemID );

	if( Count >= ItemCount ) then
		return 1;
	else
		return -1;
	end
end
----------------------------------------------------------------------------------------------------------------------------
function LuaQ_420178_AfterClick()

	if DelBodyItem( OwnerID(),200635, 1 ) then
		BeginPlot( TargetID() , "LuaQ_420178_1" , 0 )
		return 1
	end
	return -1
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaQ_420178_1()
	
	DisableQuest( OwnerID() , true )
	Local V_Ankaria = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100074 , 500 )--找出巫妖安卡莉亞的實體ID

	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP ) --將法珠破碎做成其死亡動作			
	if CheckID(V_Ankaria) == true and ReadRoleValue( V_Ankaria , EM_RoleValue_IsDead) ~= 1 then 
--		CastSpell( V_Ankaria,OwnerID() , 490102 ) -- 幫王上一個負面BUFF
		SetPlot( V_Ankaria ,"dead", "LuaQ_420178_2" , 40 )
	else

		local Ankaria = LuaFunc_CreateObjByObj ( 110205 , OwnerID() )

		CastSpell( Ankaria, Ankaria, 490102 ) -- 安卡莉亞靈魂出現時的特效 
		local Player = LuaFunc_PartyData( TargetID() )
		for i = 1 , Player[0] , 1 do
			if CheckAcceptQuest( Player[i] , 420178 ) == true then 
				SetFlag( Player[i] , 540332 , 1 )
			end
		end
	end
	SetPlot( OwnerID() ,"Touch","LuaFunc_Obj_BUSY",40)
--	DisableQuest( OwnerID() , fasle )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaQ_420178_2()
	Say( OwnerID() ,GetString("SAY_100074_3")) --/*可惡......如果能脫離這個禁錮我的牢籠，我真正的力量......
	local Orb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110206 , 500 )
	local Ankaria = LuaFunc_CreateObjByObj ( 110205 , OwnerID() )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100074,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	CastSpell( Ankaria, Ankaria, 490102 ) -- 安卡莉亞靈魂出現時的特效 
	local Player = LuaFunc_PartyData( TargetID() )
	for i = 1 , Player[0] , 1 do
		if CheckBuff( Player[i] , 502039 ) == true and CountBodyItem( Player[i] , 530358 ) <1 then
			GiveBodyItem ( Player[i] , 530358 , 1 )	-- 頭銜：「不死摧毀者」
		end
		if CheckAcceptQuest( Player[i] , 420178 ) == true then 
			SetFlag( Player[i] , 540332 , 1 )
		end
	end
	return true	
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaQ_420179_Complet()
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk , 1 )
--	SetPlot( OwnerID(),"Touch","LuaFunc_Obj_BUSY",40)
	DisableQuest( OwnerID() , true )
	local Ankaria = CreateObjByFlag ( 110205 , 780022 , 1 , 1 )
	AdjustFaceDir( OwnerID(), Ankaria , 0 )
	AddToPartition( Ankaria , 0 )
--	SetPlot( Ankaria ,"Touch","LuaFunc_Obj_BUSY",40)
	DisableQuest( Ankaria , true )
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say( OwnerID(),GetString("SAY_110203_1")) --/*安卡莉亞……妳依舊如此的美麗……
	Sleep(20)
	Say( Ankaria,GetString("SAY_110205_1")) 
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	--/*我親愛的雨果，我的時間不多了，在長久的歲月中我的靈魂已被慢慢的削弱，即將消失在這個世界……幸好在森林女神的祝福下，讓我能再見到你一面。
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Say( Ankaria,GetString("SAY_110205_2")) 	
	--/*我有一件很重要的事要告訴你，由於我的靈魂已經沒有力量讓惡靈汲取，牠正找尋新的力量來源來代替我……那將會使牠脫離封印的控制，你一定要阻止牠……
	Sleep(50)
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Say( Ankaria,GetString("SAY_110205_3")) 	
	--/*還有，萊瑟斯汀……命運將會使她與這恐怖的過去連結，該是將我們為她準備的禮物交給她的時候了，希望這能夠保護她。
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)	
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Say( Ankaria,GetString("SAY_110205_4")) 	
	--/*我愛你，也跟萊瑟斯汀說，我愛她，並且對不起，我沒有做到一個母親該做的事……再見了，我親愛的雨果……
	Sleep(10)
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_EAT)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)	
	Say( OwnerID(),GetString("SAY_110203_2")) --/*不！不要走！安卡莉亞！
	Sleep(20)
	DelObj ( Ankaria )
	sleep(10)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(50)
	LuaFunc_MoveToFlag( OwnerID(), 780022 , 1 ,10 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	LuaFunc_MoveToFlag( OwnerID(), 780022 , 0 ,10)
	AdjustFaceDir( OwnerID(), TargetID() , 0 )
	Sleep(30)
	Say( OwnerID(),GetString("SAY_110203_3")) --/*…最後我想再拜託你一件事。
	DisableQuest( OwnerID() , false )
--	SetPlot( OwnerID(),"Touch","",40)
END
---------------------------------------------------------------------------------------------------------------------------
function LuaQ_420178_Complete() 
	local Count = CountBodyItem( TargetID() , 200635)
	if Count > 0 then
		DelBodyItem(  TargetID() , 200635 ,Count )
	end
end