--Quest 420274 任務完成劇情 
--function LuaQ_420274_Complete()

--	local FLAG = 780029
--	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
--	MoveToFlagEnabled( OwnerID(), false );
--	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing", 10 )
--	LuaFunc_MoveToFlag( OwnerID() ,FLAG, 1 , 0 )
--	Say( OwnerID() , GetString("SAY_110242_0") ) --/*看看這個美麗的古代軍刀虎啊！這麼完整的保留下來是大自然的恩賜。
--	sleep( 30 )
--	Say( OwnerID() , GetString("SAY_110242_1") ) --/*而且…我懷疑…這隻小貓牠還活著……
--	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
--	sleep( 50 )
--	--ScriptMessage( OwnerID(), TargetID(), 0, GetString("SAY_110242_2"), 0 );
--	Say( OwnerID() , GetString("SAY_110242_2") ) --/*有了！就在這邊！！
--	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
--	sleep( 30 )
--	Say( OwnerID() , GetString("SAY_110242_3") ) --/*原來要用火眼貂油來助燃啊…這東西不難得到，不過就是麻煩。
--	LuaFunc_MoveToFlag( OwnerID() ,FLAG, 0 , 0 )
--	sleep( 30 )
--	SetPlot( OwnerID() , "touch" , "", 0 )
--	MoveToFlagEnabled( OwnerID(), true );	

--end
----------------------------------------------------------------------------------------------------------
--Quest 420275 任務完成劇情
function LuaQ_420275_Complete()

	local n =0

		--MoveToFlagEnabled( OwnerID(), false )
		--WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
		--LuaFunc_MoveToFlag( OwnerID(), 780029 , 1 , 0 )
	SetPosByFlag( OwnerID(), 780029 , 1 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing", 10 )
	local Fire       = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110751 , 50 , 1);	--say ( OwnerID() , Fire[0])
	local IceWall = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110750 , 50 , 1);	--say ( OwnerID() , IceWall[0] )
	local Wolf     = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110040 , 100 , 1);	--say ( OwnerID() , Wolf[0] )
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	sleep( 50 )
	PlayMotion( Fire[0] , ruFUSION_ACTORSTATE_NORMAL )
	sleep( 20 )
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );
	sleep( 50 )
	Say( OwnerID() , GetString("SAY_110242_4") ) --/*太好了！冰壁成功地融化了。
	Hide( IceWall[0] )
	SetPosByFlag( OwnerID(), 780029 , 0 )
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110242_5") )	-- 哇啊啊啊！古代巨狼居然活了過來！
	SetFlag( TargetID() , 540803 , 1 )
	PlayMotion( Fire[0] , ruFUSION_ACTORSTATE_DEAD )
	Hide( Wolf[0] )
	local BigWolf = LuaFunc_CreateObjByObj ( 100277 , Wolf[0] )
	SetPlot( BigWolf , "Dead" , "LuaQ_420275_Dead" , 10 )
	 SetAttack( BigWolf , TargetID() )
	sleep(60)
	while 1 do
		n = n + 1
		if n > 600 then -- 防無窮迴圈
			ScriptMessage( TargetID(), TargetID(), 0, "無窮迴圈", 0 )
			break
		else
			--ScriptMessage( TargetID(), TargetID(), 0, "合法迴圈", 0 )
		end
		if ReadRoleValue( BigWolf , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( BigWolf ) == true then  --檢查是否離開戰鬥
			sleep(600)	-- 六十秒檢查一次	
		else
			if CheckID( BigWolf ) == true then
				DelObj( BigWolf )
			end 
			sleep( 1 )
			break
		end
	sleep(1)
	end

		--WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0  )
		--LuaFunc_MoveToFlag( OwnerID() , 780029, 0 , 0 )
		--MoveToFlagEnabled( OwnerID(), true );
	sleep( 30 )
	SetPlot( OwnerID() , "touch" , "", 0 )
	Show( Wolf[0] , 0 )
	Sleep( 5 )
	Show( IceWall[0] , 0 )

end
---------------------------------------------------------------------------------------------------------
function LuaI_110242()
	SetPlot( OwnerID() , "touch" , "", 0 )
end
---------------------------------------------------------------------------------------------------------
function LuaQ_420275_Sui()
	LuaFunc_Obj_Suicide(600)
end
---------------------------------------------------------------------------------------------------------
function LuaQ_420275_Dead()

	if CheckID(TargetID()) == true and CheckFlag( TargetID() , 540803 ) == true then
		GiveBodyItem(TargetID(),200733 , 1)
		SetFlag( TargetID() , 540803 , 0 )
	end

end
--------------------------------------------------------------------------------------------------------
--軍刀虎頭顱觸發任務劇情