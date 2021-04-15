-----------------------------420090_備齊的物資_完成任務劇情_夏琳------------------------------------------
Function LuaQ_420090_Complet()
	
--	SetPlot( OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	DisableQuest( OwnerID() , true )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_END )
	sleep(15)
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	sleep(5)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() ,GetString("SAY_110060_420090_1") ) --/*請安靜，現在我要開始建構符文的力量。
	sleep(20)
	AddBuff( OwnerID() , 504935 , 0 , -1 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END )
	CancelBuff( OwnerID() , 504935 )
	if CheckID( TargetID() ) == true then
		GiveBodyItem( TargetID() , 201075 , 1 )
	end
	sleep( 20 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() ,GetString("SAY_110060_420090_2") ) --/*這樣就可以了。
	sleep(30)
	SetDir( OwnerID(), Dir )
	sleep( 5)
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep( 10 )
	DisableQuest( OwnerID() , false )
--	SetPlot( OwnerID(),"touch","",40)

end
---------------------------420066_晦暗的魔蛛_完成任務劇情_神醫士------------------------------------------
Function LuaQ_420066_Complet()

--	SetPlot( OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
	sleep(5)
	Say( OwnerID(),GetString("SAY_110051_420066_1") )--/*請稍待片刻。
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep(10)
	Say( OwnerID(),GetString("SAY_110051_420066_2") )--/*一切都準備好了，結果很快就會出來...
	sleep(10)
	CastSpell( OwnerID(),OwnerID(),490099)
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( OwnerID(),GetString("SAY_110051_420066_3") )--/*這個結果...嗯...看來大事不妙。
	sleep(10)
--	SetPlot( OwnerID(),"touch","",40)

end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

--------------------------420068_令人戰慄的壕叫聲_巨石魔法陣------------------------------------------------
------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------
--Function LuaQ_420068_ClickObj() --點擊時觸發的劇情--可用小輝已經寫好的函式代替
--------------------------------------------------------------------------------------------------------------
Function LuaQ_420068_AfterClickObj() --點擊後觸發的劇情--有插動作，不可用已有的代替
	
	local Count = CountBodyItem( OwnerID(), 200186);

	if( Count >= 1 ) then

		local Result = DelBodyItem( OwnerID(), 200186, 1 );
		if( Result ) then

			BeginPlot( TargetID(),"LuaFunction_420068_Clear",0) 
			--因為要傳回值才能處理，所以用呼叫的方式來表演動作
  			return 1;
		end
	end

	return -1;
END
---------------------------------------------------------------------------------------------------------------
Function LuaFunction_420068_Clear()

	CancelBuff( OwnerID(), 500900 );--清掉原有的特效BUFF--注意，由於是被呼叫過來執行，因此巨石陣變為Owner

	CastSpell( OwnerID(), OwnerID(), 490102 );-- 命令巨石陣施展一個法術產生新特效
	sleep(300)--休息30秒，等待系統回復到可再次被點擊的狀態

	CancelBuff( OwnerID(), 500902 );--清掉新特效BUFF
	CastSpell( OwnerID(),OwnerID(),490101) --重新上原有的特效魔法
END
---------------------------------------------------------------------------------------------------------------
---------------------------------------------庫柏人的背包-----------------------------------------------------
function LuaI_200167()
	local LuckyNum = Rand(5)
	DelBodyItem( OwnerID() , 200167 , 1 )

	if LuckyNum == 1 then
		if CheckAcceptQuest( OwnerID() , 420065 ) and CountItem( OwnerID(),200164) == 0 then
			GiveBodyItem( OwnerID() , 200164 , 1 )
		else
			GiveBodyItem( OwnerID() , 200622 , 1 )
		end
	elseif LuckyNum == 2 then
		if CheckAcceptQuest( OwnerID() , 420065 ) and CountItem( OwnerID(),200165) == 0 then
			GiveBodyItem( OwnerID() , 200165 , 1 )
		else
			GiveBodyItem( OwnerID() , 200620 , 1 )
		end
	elseif LuckyNum == 3 then
		if CheckAcceptQuest( OwnerID() , 420065 ) and CountItem( OwnerID(),200166) == 0 then
			GiveBodyItem( OwnerID() , 200166 , 1 )
		else
			GiveBodyItem( OwnerID() , 200619 , 1 )
		end
	elseif LuckyNum == 4 then
			GiveBodyItem( OwnerID() , 200618 , 1 )
	else
			GiveBodyItem( OwnerID() , 200620 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------
--潔兒 完成湯料理任務
Function LuaQ_420093_Complete()

	MoveToFlagEnabled( OwnerID(), false );
--	setplot( OwnerID(), "touch" , "LuaFunc_Obj_nothing", 40);	--NPC鎖定
	sleep(10);
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_APPLAUSE );		--潔兒動作
	sleep(20);
	WaitMoveTo( OwnerID(),  63 , 22 , -6258 );	--移動到指定座標
	sleep(20);
	Say( OwnerID(), "只要加上這些肉就完成了...");		--潔兒範圍發話
	sleep(30);
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_INSTANT);	--潔兒施法動作
	sleep(50);
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_VICTORY );	--潔兒勝利動作
--	setplot( OwnerID(), "touch" , "", 40);	--NPC解除鎖定
	sleep(600);
	MoveToFlagEnabled(  OwnerID(), true);
	
End
------------------------------------------------------------------------------------------------------------
------------------------------迪恩------------------------------------------------------
function LuaQ_420088_Accept()
	SetRoleEquip( OwnerID(), EM_EQWearPos_MainHand, 0, 1 );
	sleep( 100 )
	SetRoleEquip( OwnerID(), EM_EQWearPos_MainHand, 210054, 1 );
end
