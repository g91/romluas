function LuaI_420263() --編號暫代
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["DLS"] = OwnerID()
	Setplot( OwnerID() , "dead" , "LuaQ_420263_Dead", 40 )
	Beginplot( OwnerID() , "LuaB_DSL_AI_SYSYTEM" , 0 )
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420263_Dead()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100611,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local Player = LuaFunc_PartyData(TargetID())
	local Check = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	for i = 1 , Player[0] , 1 do
		if CheckAcceptQuest( Player[i] , 420560 ) == true and CountBodyItem( Player[i], 201008 ) == 0  then
			GiveBodyItem( Player[i] , 201008 , 1 ) --給予任務物品，所有玩家都要拿到
			Check = Player[i] 
			if CheckBuff( Player[i] , 502042 ) == true and CountBodyItem( Player[i] , 530360 ) <1 then
				GiveBodyItem ( Player[i] , 530360 , 1 )	-- 頭銜：「索雷爾頓通緝犯」
			end
		end 
	end

	if Ver_Zone103_Trap[RoomID]["DRAMA"] == 0 then
		yell( OwnerID() ,GetString("SAY_100178_3") , 5 )
		yell( OwnerID() ,"[SAY_100178_4]" , 5 ) --/*別得意......看看你們回去的路吧！我留了一個禮物給你們......哈哈哈！
		local COGD = CreateObjByFlag( 100274 , 780030 , 4 , 1 ) --產生屍骸奧古達
		AddToPartition( COGD ,RoomID )
		Ver_Zone103_Trap[RoomID]["DRAMA"] = COGD
		SetPlot( COGD , "Dead" , "LuaQ_420280" , 40 )
		Beginplot( COGD ,"LuaB_OGD_AI_SYSYTEM" , 0 )	
	else
		Say( OwnerID() ,GetString("SAY_100178_3") )
	end

	--王死後開啟密道--
	local Trap = {}
	Trap[1] = Ver_Zone103_Trap[RoomID]["Fire1"] 
	Trap[2]  = Ver_Zone103_Trap[RoomID]["Fire2"] 
	Trap[3]  = Ver_Zone103_Trap[RoomID]["BOX1"] 
	Trap[4] = Ver_Zone103_Trap[RoomID]["BOX2"] 
	Trap[5] = Ver_Zone103_Trap[RoomID]["Door1"] 
	Trap[6] = Ver_Zone103_Trap[RoomID]["Door2"] 
	Trap[7] = Ver_Zone103_Trap[RoomID]["OGD"] 
	Trap[8] = Ver_Zone103_Trap[RoomID]["Soldiers"] 
	Trap[9] = Ver_Zone103_Trap[RoomID]["STATE"] 
	Trap[10] = Ver_Zone103_Trap[RoomID]["FIRECONTROL"]
	if Ver_Zone103_Trap[RoomID]["DRAMA"] == 0 then
		for i = 1 , 7 , 1 do
			Hide( Trap[i])
		end
		for i = 0 , 11 , 1 do
			Hide(Trap[8][i])
		end
		BeginPlot( OwnerID() , "LuaQ_420279_Corpse" , 0 )
		BeginPlot( Trap[9] , "LuaQ_110248_End" , 0 )
		BeginPlot( Trap[10] , "LuaQ_110250_End" , 0)
	end
	
	return true
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420560_Play()

		local Altar = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110291 , 150 )
		local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		MoveToFlagEnabled( OwnerID() , false );
		DisableQuest( OwnerID() , true )
		AdjustFaceDir( OwnerID(), Altar, 0 )
--		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		sleep( 30 )
--		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END )	
		PlayMotion( Altar , ruFUSION_ACTORSTATE_ACTIVATE_END )
		Say( OwnerID() , GetString("SAY_110147_4") )--/*哈哈哈！藍色符文盤現在也到手了！
		sleep( 20 )
		AdjustFaceDir( OwnerID(), Player, 0 )
		sleep( 50 )
--		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--		Say( OwnerID() , GetString("SAY_110147_5") )--/*嗯？這不是多魯梭的『部下』嗎？又見面啦！
--		sleep( 30 )
		Say( OwnerID(), GetString("SAY_110147_6") )--/*可惜我還有事要忙，沒辦法久留。
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		sleep( 30 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
		Say( OwnerID() , GetString("SAY_110147_7") )--/*下次見面我就不會這麼失禮了。親手將你殺死是我的榮幸，假如你還能活到那個時候的話，再見了！
		sleep( 30 )
		CastSpell( OwnerID() , OwnerID() , 491008 )
		sleep(5)
		DelObj( OwnerID() )

end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420560_Complete()
	DisableQuest( OwnerID() , true ) 
	MoveToFlagEnabled( OwnerID(), false );
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
	local Cage = LuaFunc_SearchNPCbyOrgID( OwnerID() ,110366 , 50 , 0)
	local SandGlass = LuaFunc_SearchNPCbyOrgID( OwnerID() ,110783 , 250 , 0)
--	Hide( Cage )
	sleep( 20 )
	local Guard = {}
	--780030旗標在此回收利用，與副本中所代表的意義不同
	LuaFunc_MoveToFlag( OwnerID() , 780030 , 1 , 0 ) --有轉彎
	AdjustFaceDir( OwnerID(), SandGlass, 0 )
	sleep( 30 )
	yell( OwnerID() , GetString("SAY_110251_0") , 5 ) --/*哇～如果可以在裡面研究一定很棒！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	AdjustDir( OwnerID(), 180 ) --接轉身180度的動作
	sleep( 30 )
	yell( OwnerID() , GetString("SAY_110251_1"),5 ) --/*不過我得趕快回去把這些重要的資料給記下來。 
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	yell( OwnerID() , GetString("SAY_110251_2"),5 ) --/*走吧！愈快愈好！我把資料整理好之後還要趕回這裡繼續研究呢！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 5 )
	for i = 1 , 5 , 1 do --陸續產生5個黑曜騎士團的到達定位，定位為 3 ~ 7
		Guard[i] = CreateObjByFlag( 110311 , 780030 , 2 , 1 )
		AddToPartition( Guard[i] , 0 )
		MoveToFlagEnabled( Guard[i], false );
		DisableQuest( Guard[i] , true ) 
		Say( Guard[i] , Guard[i]  )
		WriteRoleValue( Guard[i] ,EM_RoleValue_PID , i )
		if i ~= 5 then
			BeginPlot( Guard[i] , "LuaQ_420263_Play", 0 )
		else
			WriteRoleValue( Guard[i] ,EM_RoleValue_IsWalk , 0  )
			LuaFunc_MoveToFlag( Guard[i] , 780030 , 2+i , 0 )
		end
		sleep( 5 )
	end		
	yell( OwnerID() , GetString("SAY_110251_3") ,5) --/*喔！是援軍耶！
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0  )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 5 )
	LuaFunc_MoveToFlag( OwnerID() , 780030 , 0 , 0 )
	yell( Guard[5] ,GetString("SAY_110251_4") , 5) --/*謝謝你的協助，夏麥爾隊長派我們來接應你們，接下來就交給我們吧！ 
	PlayMotion( Guard[5]  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 5 )
	yell( OwnerID() ,GetString("SAY_110251_5") , 5 ) --/*太好了！快走吧！我受不了這些慢吞吞的傢伙了！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	yell( Guard[5] ,GetString("SAY_110251_6") , 5 ) --/*<玩家姓名>大人，夏麥爾隊長希望您在回到哈洛夫之時能夠找他談談，他希望能當面感謝您的幫助。
	PlayMotion( Guard[5]  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 5 )
	yell( OwnerID() ,GetString("SAY_110251_7") , 5 ) --/*拖拖拉拉做什麼？我還趕著要把這些資料給記下來呢！紙，你們有帶紙嗎？
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	yell( Guard[5] ,GetString("SAY_110251_8") , 5 ) --/*那我們先告辭了。
	PlayMotion( Guard[5]  , ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1 )
	sleep( 10 )
	for i = 1 , 5 , 1 do 
		WriteRoleValue( Guard[i] ,EM_RoleValue_IsWalk , 1  )
		if i == 5 then
			yell( OwnerID() ,GetString("SAY_110251_9"), 5 ) --/*我們回去整理完這些資料之後，還要準備回來這裡研究……
			PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			sleep( 10 )
			yell( Guard[i] ,GetString("SAY_110251_10") , 5 ) --/*抱歉，我們在這個任務之後還有其他勤務要執行。
			PlayMotion( Guard[i]  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		end
		BeginPlot( Guard[i] , "LuaQ_420263_BACK" ,  5*i )
	end
	
	while 1 do
		if LuaFunc_MoveToFlag( OwnerID() , 780030 , 2 , 0 ) then
			DisableQuest( OwnerID() , false )
			Show( Cage , 0 )
			Hide( OwnerID() )
			sleep( 300 )
			LuaFunc_ResetObj( OwnerID() );
			break
		end
		sleep( 1 )
	end	
end
------------------------------------------------------------------------------------------------------------
function LuaQ_420263_Play()
	local i = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0  )
	LuaFunc_MoveToFlag( OwnerID(), 780030 , 2+i , 0 )
end

function LuaQ_420263_BACK()
	while 1 do
		if LuaFunc_MoveToFlag( OwnerID() , 780030 , 2 , 0 ) then
			DelObj( OwnerID() )
			break
		end
		sleep( 1 )
	end
end
------------------------------------------------------------------------------------------------------------