--423355精靈的異變--放在米克701907
--function LuaS_423355_0()	--放到聖樹妮克絲的function內；測試期間先放	115795	
--	LoadQuestOption( OwnerID() )
--	if	(CheckAcceptQuest(OwnerID(),423355)==true )	and	( CheckCompleteQuest( OwnerID(),423355)==false)	and	
--		CheckFlag( OwnerID() , 544261 ) ==false		then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423355_0]","LuaS_423355_1",0)		--精靈王讓我來...
--	end
--end

function LuaS_423355_1()
	SetSpeakDetail(OwnerID(),"[SC_423355_1]")
	SetFlag( OwnerID() , 544261 , 1 )	
end

--423356
--點擊物品前：
function Lua_423356_STONE_before()
	if	(CheckAcceptQuest(OwnerID(),423356)==true )and( CheckCompleteQuest( OwnerID(),423356)==false) and	CheckFlag( OwnerID() , 544262) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			--目標正在忙碌中
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(), 2, "[SC_423356_7]",0)
	ScriptMessage(OwnerID(),OwnerID(), 0, "[SC_423356_7]",0)
	return false
	end
end

--點擊物品後：旗子：780691
function Lua_423356_STONE_after()
	if 	CheckAcceptQuest( OwnerID() , 423356) == true		and
		(CheckFlag( OwnerID(), 544262)==false)		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(OwnerID() , 544330, 1 )						--544330判斷距離用		
		AddBuff(OwnerID() , 507159, 1 , 40)  						
	end

--	if 	CheckAcceptQuest( OwnerID() , 423356) == true	and	(CheckFlag( OwnerID(), 544262)==false)		and
--		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then

		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
		local STONEB = LuaFunc_CreateObjByObj (115991, TargetID())				--115991石板B	
		Lua_ObjDontTouch( STONEB ) 
		SetModeEX( STONEB , EM_SetModeType_Obstruct , true )
		SetModeEX( STONEB , EM_SetModeType_Mark , true )
		WriteRoleValue( STONEB,EM_RoleValue_Register+2,TargetID())				--把石板寫進石板B
		WriteRoleValue( STONEB,EM_RoleValue_Register+3,OwnerID())				--把玩家寫進石板B
		BeginPlot( STONEB, "LuaS_423356_Range_CHECK" , 0 )					--掛石板B迴圈檢查--玩家不在就刪除石板B
		BeginPlot( STONEB  , "Lua_423356_LOOP" , 0 )
--		else
--		return false
--	end
	return true
end

function Lua_423356_LOOP()
	local stone =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	

	local BOX= Lua_DW_CreateObj("flag" ,116093,780703,1,1)				--產生特效球116093，780703，1
	WriteRoleValue( BOX,EM_RoleValue_Register+2,OwnerID())				--把石板B寫進特效
	BeginPlot( BOX, "LuaS_423356_22" , 0 )						--特效球也掛迴圈檢查，石板B不在就刪除
	CastSpell( BOX, BOX, 495606)	
	sleep(30)
	ScriptMessage(TargetID(),TargetID(), 2, "[SC_423356_0]",0)				--石板的周圍縈繞淡淡幽光......
	ScriptMessage(TargetID(),TargetID(), 0, "[SC_423356_0]",0)				--石板的周圍縈繞淡淡幽光......
	
	local PREANT = Lua_DW_CreateObj("flag" ,115800,780691,1,1)				--產生假安特克羅780691，編號115800
	WriteRoleValue( PREANT,EM_RoleValue_Register+2,OwnerID())				--把石板B寫進假安特
	BeginPlot( PREANT , "LuaS_423356_22" , 0 )						--種出假安特也掛迴圈檢查，石板B不在就刪除
	DisableQuest( PREANT , true )							--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(PREANT , false )
	WriteRoleValue( PREANT ,EM_RoleValue_IsWalk , 1 )

	sleep(10)
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( PREANT , "[SC_423356_1]" , 3 )							--伊利雅爾...
	sleep(30)
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( PREANT , "[SC_423356_2]" , 3 )							--讓我過去，繁星湧泉的能量強大...
	sleep(30)
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( PREANT , "[SC_423356_3]" , 3 )							--那不是妳能支配的。
	sleep(30)
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( PREANT , "[SC_423356_4]" , 3 )							--妳知道...我會保護妳...
	sleep(20)
	CastSpell( BOX, PREANT , 491923)							--特效
	sleep(10)
	AddBuff( PREANT, 506135, 1 , -1 )							
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_ATTACK_2H)
	Yell( PREANT , "[SC_423356_5]" , 3 )							--啊！
	sleep(20)
	DelObj(PREANT)									--<安特克羅變成黑影>
	local BLACK = Lua_DW_CreateObj("flag" ,115990,780691,1,1)				--產生黑影，編號要換！
	WriteRoleValue( BLACK,EM_RoleValue_Register+2,OwnerID())				--把石板B寫進黑影
	BeginPlot( BLACK , "LuaS_423356_22" , 0 )						--種出黑影也掛迴圈檢查，石板B不在就刪除
	DisableQuest( BLACK , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(BLACK , false )
	WriteRoleValue( BLACK ,EM_RoleValue_IsWalk , 0 )
	sleep(20)
	
	Yell( BLACK , "[SC_423356_6]" , 3 )							--黑影：該死！又被識破，先撤退！
	sleep(10)
	LuaFunc_MoveToFlag( BLACK,780691,2,0)						--<黑影背對.消失>
	CancelBuff(TargetID() , 507159)
	sleep(20)
	SetFlag( TargetID() , 544262 , 1 )							--給完成旗標
	WriteRoleValue( stone , EM_RoleValue_Register+1 , 0 )
	DelObj(OwnerID())
end

function LuaS_423356_Range_CHECK()
	local stone =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )		
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local Num
	for i = 0 , 50 , 1 do
		Num = 0
			if	CheckAcceptQuest( player , 423356) == true	and
				CheckFlag( player , 544330) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	WriteRoleValue( stone , EM_RoleValue_Register+1 , 0 )
	Delobj( OwnerID() )
end


--function LuaS_423356_11()
--	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
--	local stone =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	
--	for i = 1, 40 , 1 do									--秒數配合劇情調整
--		if	CheckID( player ) == false or ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 or CheckAcceptQuest(player ,423356)==false	then
--			CancelBuff(player , 507159)
--			DelObj(OwnerID())
--			WriteRoleValue( stone , EM_RoleValue_Register+1 , 0 )
--			break
--		end
--		sleep(10)
--	end
--end

function LuaS_423356_22()
	local STONEB =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )		 
	for i = 1, 40 , 1 do									--秒數配合劇情調整
		if  CheckID( STONEB ) == false	then
			DelObj(OwnerID())
			break
		end
		sleep(10)
	end
end

function LuaS_423356_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423356)==false )	then
		if 	CheckBuff( OwnerID(), 507159) == true	then
			CancelBuff( OwnerID() , 507159)  
		end
		return false
	end
	local STONEB= {}
	STONEB= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(STONEB)-1 do
		if	ReadRoleValue(STONEB[i] , EM_RoleValue_OrgID) == 115991	
			or	ReadRoleValue(STONEB[i] , EM_RoleValue_OrgID) == 115794
			then
			return false
		end
		if	i == table.getn(STONEB)	then
			return true
		end
	end
end

function LuaS_423356_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507159)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544330, 0 )
end



--423358
--點擊物品前檢查：
function Lua_423358_before()
	if	(CheckAcceptQuest(OwnerID(),423358)==true )and( CheckCompleteQuest( OwnerID(),423358)==false) and	CheckFlag( OwnerID() , 544263) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			if	CountBodyItem(OwnerID(),207700) > 0 	then
				return true
				else
				ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423358_0]",0)	 --你身上沒有星辰禱文！
				ScriptMessage(OwnerID(),OwnerID(), 0, "[SC_423358_0]",0)	 --你身上沒有星辰禱文！
				return false
			end
		else
		ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0) --目標正在忙碌中
		return false
		end
	else
	return false
	end
end

--點擊物品後：
function Lua_423358_after()
	if 	CheckAcceptQuest( OwnerID() , 423358) == true	and	(CheckFlag( OwnerID(), 544263)==false)	and
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then	
		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
		DelBodyItem(OwnerID(), 207700, 1 )				--星辰禱文	
		AddBuff( OwnerID() , 507160, 1 , 30 )				--CLIENT判斷用507160	
		local WATERB = LuaFunc_CreateObjByObj (116006, TargetID())				--116006瀑布水源B	 
		WriteRoleValue( WATERB ,EM_RoleValue_Register+2,TargetID())				--把WATER寫進WATERB
		WriteRoleValue( WATERB ,EM_RoleValue_Register+3,OwnerID())				--把玩家寫進WATERB
		BeginPlot( WATERB , "LuaS_423358_11" , 0 )						--掛WATERB迴圈檢查--玩家不在就刪除WATERB
		BeginPlot( WATERB  , "Lua_423358_loop" , 0 )
		else
		return false
	end
	return true
end

function Lua_423358_loop()
	local WATER=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	
	ScriptMessage(TargetID(),TargetID(), 2, "[SC_423358_1]",0)				--......
	sleep(20)
	ScriptMessage(TargetID(),TargetID(), 2, "[SC_423358_2]",0)				--......？
	sleep(20)
	local BODO = Lua_DW_CreateObj("flag" ,115803,780691,3,1)				--115803波多，780691，3
	DisableQuest( BODO , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(BODO , false )
	WriteRoleValue( BODO ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( BODO,EM_RoleValue_Register+3,OwnerID())				--把WATERB寫進波多
	BeginPlot( BODO	, "LuaS_423358_22" , 0 )						--掛波多迴圈檢查--WATERB就刪除波多
	PlayMotion(  BODO ,  ruFUSION_ACTORSTATE_PARRY_UNARMED )
	Yell( BODO , "[SC_423358_3]" , 3 )							--波多：咳咳...咳！ 
	sleep(20)
	PlayMotion(  BODO ,  ruFUSION_ACTORSTATE_PARRY_UNARMED )
	sleep(10)
	AdjustFaceDir(BODO , TargetID(), 0 )
	Yell( BODO , "[SC_423358_4]" , 3 )							--波多：咦？你？星辰禱文？ 
	sleep(20)
	PlayMotion( BODO ,ruFUSION_ACTORSTATE_CAST_SP02)
	Yell( BODO , "[SC_423358_5]" , 3 )							--波多：啊！～～～～～ 
	sleep(20)
	PlayMotion( BODO ,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	Yell( BODO , "[SC_423358_6]" , 3 )							--波多：你是好傢伙！對嗎？好精靈、好神提到的好傢伙！ 
	sleep(30)
	PlayMotion( BODO ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( BODO , "[SC_423358_7]" , 3 )							--波多：嗯...讓我想想你們是怎麼說的...
	sleep(30)
	PlayMotion( BODO ,ruFUSION_ACTORSTATE_BUFF_SP01)
	Yell( BODO , "[SC_423358_8]" , 3 )							--波多：「很榮幸看到你！」對嗎？[$playername]！ 
	sleep(20)
	SetFlag( TargetID() , 544263 , 1 )							--給完成旗標
	CancelBuff(TargetID() , 507160)
	DelObj(OwnerID())
	WriteRoleValue( WATER , EM_RoleValue_Register+1 , 0 )
end

function LuaS_423358_11()
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
	local WATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	
	for i = 1, 30 , 1 do									--秒數配合劇情調整
		if  CheckID( player ) == false	or ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 or CheckAcceptQuest(player ,423358)==false	then
			CancelBuff(player , 507160)
			DelObj(OwnerID())
			WriteRoleValue( WATER , EM_RoleValue_Register+1 , 0 )
			break
		end
		sleep(10)
	end
end

function LuaS_423358_22()
	local WATERB=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
	for i = 1, 30 , 1 do									--秒數配合劇情調整
		if  CheckID( WATERB) == false	then
			DelObj(OwnerID())
			break
		end
		sleep(10)
	end
end


--423359--對河水使用祝福凝石
--使用物品前檢查：(任務、旗標、有無人在解、附近定位<有沒有相關物品>)
function LuaS_423359_0()	
	if	CheckAcceptQuest( OwnerID() , 423359 ) == true	then
		if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
				if	CheckFlag( OwnerID() , 544264 ) == true	then
					ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423359_0]" , 0 ) 	--你已經使用過祝福凝石
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423359_0]" , 0 ) 
					return false
				end
				if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 115805	then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--目標不正確
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
					return false 
				end

				local BWATER =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,115805, 70 )	
				if Type(BWATER) == "number" and CheckID(BWATER) == false	then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_0]" , 0 )	--你必須更靠近一點！
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_0]" , 0 ) 
					return false 
				end
				if	(CountBodyItem( OwnerID(),207718) >0) and CheckFlag( OwnerID() , 544264 ) ==false	then
					UseItemDestroy( OwnerID() , 207718 )
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 	--你不需要使用此物品
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
					return false 
				end
		else
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0) --目標正在忙碌中
			return false
		end
		
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 			--你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
		return false 
	end
end

--初始劇情
function LuaS_115805()
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP , true )				-- 不顯示血條
end


--成功使用物品
function LuaS_423359_1()
	if	CheckID( TargetID() ) == true then
		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
		local WATERB = LuaFunc_CreateObjByObj (116009, TargetID())			--116006沼澤水源B
			SetModeEx( WATERB , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
		 AddBuff( OwnerID() , 507161, 1 , 60 )						--CLIENT判斷用507161
		WriteRoleValue( WATERB ,EM_RoleValue_Register+2,TargetID())			--把WATER寫進WATERB
		WriteRoleValue( WATERB ,EM_RoleValue_Register+3,OwnerID())			--把玩家寫進WATERB
		BeginPlot( WATERB , "LuaS_423359_11" , 0 )					--掛WATERB迴圈檢查--玩家不在就刪除WATERB
		BeginPlot( WATERB , "LuaS_423359_2" , 0 )							
	end
end
	
function LuaS_423359_2()	
		local WATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )
	
		local BODO = Lua_DW_CreateObj("flag" ,115806,780691,5,1)			--115806波多、旗子編號5
		DisableQuest( BODO , true )							--開關NPC頭上的任務提示以及對話劇情(true關閉)
		MoveToFlagEnabled(BODO , false )
		WriteRoleValue( BODO ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( BODO,EM_RoleValue_Register+3,OwnerID())			--把BWATER寫進波多
		BeginPlot( BODO	, "LuaS_423359_22" , 0 )					--掛波多迴圈檢查--玩家不在就刪除波多
		AddBuff( OwnerID() , 505067, 1 , 5)	
		local NOF = Lua_DW_CreateObj("flag" ,115881,780691,4,1)			--115881諾芙、旗子編號4--種出半透明的諾芙
		DisableQuest( NOF , true )							--開關NPC頭上的任務提示以及對話劇情(true關閉)
		MoveToFlagEnabled(NOF , false )
		WriteRoleValue( NOF ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( NOF,EM_RoleValue_Register+3,OwnerID())			--把BWATER寫進諾芙
		BeginPlot( NOF, "LuaS_423359_22" , 0 )					--掛諾芙迴圈檢查--BWATER不在就刪除諾芙
		sleep(20)
		PlayMotion( NOF ,ruFUSION_ACTORSTATE_BUFF_BEGIN)
		CastSpell( NOF , NOF , 495975)						--出現特效
		sleep(20)
		PlayMotion( NOF ,ruFUSION_ACTORSTATE_BUFF_END)
		sleep(10)
		DelObj(NOF)
		sleep(20)
		ScriptMessage( TargetID() , TargetID() , 2 , "[SC_423359_1]" , 0 ) 			--河面突然出現一個半透明身影，隨即瞬間消逝......
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423359_1]" , 0 ) 
		sleep(10)
		PlayMotion( BODO ,ruFUSION_ACTORSTATE_BUFF_SP01)
		Yell( BODO , "[SC_423359_2]" , 3 )						--波多：啊！喀喀噠眼花了嗎？
		SetFlag( TargetID() , 544264 , 1 )						--給旗標
		sleep(20)
		--PlayMotion( BODO ,ruFUSION_ACTORSTATE_BUFF_END)
		Yell( BODO , "[SC_423359_3]" , 3 )						--波多：好傢伙也有看見？剛剛好神出現了！
		sleep(20)
		PlayMotion( BODO ,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Yell( BODO , "[SC_423359_4]" , 3 )						--波多：可是馬上消失了～
		sleep(20)
		CancelBuff(TargetID() , 507161)
		DelObj(OwnerID())
		WriteRoleValue( WATER  , EM_RoleValue_Register+1 , 0 )
end

function LuaS_423359_11()
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
	local WATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	
	for i = 1, 30 , 1 do														--秒數配合劇情調整
		if	CheckID( player ) == false or ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 or CheckAcceptQuest(player ,423359)==false	then
			CancelBuff(player , 507161)
			DelObj(OwnerID())
			WriteRoleValue(WATER , EM_RoleValue_Register+1 , 0 )
			break
		end
		sleep(10)
	end
end

function LuaS_423359_22()	
	local BWATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
	for i = 1, 30 , 1 do														--秒數配合劇情調整
		if	CheckID( BWATER ) == false  then
			DelObj(OwnerID())
			break
		end
		sleep(10)
	end
end

--423361
function LuaS_423361_0()--(點擊波多，演戲)
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423361)==true )and( CheckCompleteQuest( OwnerID(),423361)==false) and	CheckFlag( OwnerID() , 544265) ==false	then
		if	 CountBodyItem(OwnerID(),207719) > 0 	then
			if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423361_0]","LuaS_423361_1",0)	--我們要把物品送進去給伊利雅爾了？
				else
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423361_0]","LuaS_423361_2",0)	--我們要把物品送進去給伊利雅爾了？
			end
		else
		ScriptMessage(OwnerID() , OwnerID() , 1 , "[SC_423361_16]" , 0 )	--你身上沒有[207719]
		ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423361_16]" , 0 )	
		return false 
		end
	end
end

function LuaS_423361_2()
	SetSpeakDetail(OwnerID(),"[SC_423361_1]")	--波多：嗯...喀喀噠想不透，這麼近的距離，好精靈為什麼不自己進去？     
end

function LuaS_423361_1()
	closespeak(OwnerID())
	if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
		WriteRoleValue ( TargetID() , EM_RoleValue_Register+1,1 )
		BeginPlot(TargetID(), "LuaS_423361_3" , 0 )
	end
end

function LuaS_423361_3()
	if 	CheckAcceptQuest( TargetID() , 423361) == true		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(TargetID() , 544299, 1 )					--544299判斷距離用		
		AddBuff(TargetID() , 507162 , 1 , 180 )  						
	end
	local BODOB = LuaFunc_CreateObjByOBj(115882, OwnerID() )				--出現演戲的波多
--	local BODOB = Lua_DW_CreateObj("flag" ,115882,780691,6,1)				--115882波多、旗子編號6
	DisableQuest( BODOB , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(BODOB , false )
	WriteRoleValue( BODOB ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( BODOB,EM_RoleValue_Register+2,TargetID())				--把玩家寫進波多
	WriteRoleValue( BODOB,EM_RoleValue_Register+3,OwnerID())				--把原波多寫進演戲波多
	BeginPlot(BODOB, "LuaS_423361_Range_CHECK" , 0 )					--距離檢查！！
	BeginPlot(BODOB, "LuaS_423361_4" , 0 )
end

function LuaS_423361_4()
--OwnerID是BODOB 
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local QBODO  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	
	local ELY = Lua_DW_CreateObj("flag" ,115883,780692,1,1)			--115883伊利雅爾、旗子編號780692、1
	DisableQuest(  ELY , true )							--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( ELY , false )
	WriteRoleValue(  ELY ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  ELY,EM_RoleValue_Register+3,OwnerID())			--把演戲波多寫進演戲伊利雅爾
	BeginPlot(ELY, "LuaS_423361_MO_CHECK" , 0 )				

	sleep(10)
	AdjustFaceDir(OwnerID(), ELY, 0 )
	Yell( OwnerID() , "[SC_423361_2]" , 3 )					--波多：嗯！～		
	sleep(10)
	Tell(player ,OwnerID(),"[SC_423361_3]")					--悄悄話密玩家：好精靈和裡面的精靈吵架了嗎？
	sleep(20)
	Tell(player ,OwnerID(),"[SC_423361_4]")					--悄悄話密玩家：在嘩追村
	sleep(30)
	LuaFunc_MoveToFlag(OwnerID(), 780691,7,0)
	LuaFunc_MoveToFlag(OwnerID(), 780691,8,0)
	AdjustFaceDir(ELY, OwnerID(), 0 )
	sleep(10)
	PlayMotion(ELY,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(  ELY , "[SC_423361_5]" , 3 )						--伊利雅爾：...小波多？怎麼會出現在這裡？
	sleep(20)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  ELY , "[SC_423361_6]" , 3 )						--伊利雅爾：莫非...又是幻影？
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
	Yell( OwnerID() , "[SC_423361_7]" , 3 )					--波多：波多不是幻影，喀喀噠是真的！
	sleep(20)
	Yell( OwnerID() , "[SC_423361_8]" , 3 )					--波多：好精靈在外面，他請喀喀噠拿物品給妳。
	sleep(20)
	DelBodyItem(player  , 207719, 1 )
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  ELY , "[SC_423361_9]" , 3 )						--伊利雅爾：紫晶樹藤...這是...我為安特克羅...
	sleep(20)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  ELY , "[SC_423361_10]" , 3 )						--伊利雅爾：沒有錯...之前那次，是安特克羅...但是，怎麼會...
	sleep(20)
	Yell( OwnerID() , "[SC_423361_11]" , 3 )					--波多：精靈...生病了嗎？
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( OwnerID() , "[SC_423361_12]" , 3 )					--波多：生病了，所以才會跟好精靈吵架？
	sleep(30)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)		--<伊利雅爾搖頭>
	Yell(  ELY , "[SC_423361_13]" , 3 )						--伊利雅爾：不...我們沒有...
	sleep(20)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  ELY , "[SC_423361_14]" , 3 )						--伊利雅爾：小波多，讓我見他。
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( OwnerID() , "[SC_423361_15]" , 3 )					--波多：好！等等，喀喀噠去請好精靈進來！
	sleep(20)
	LuaFunc_MoveToFlag(OwnerID(), 780693,3,0)
	sleep(10)
	BeginPlot( OwnerID() , "LuaS_423361_Finish" , 0 )	
	sleep(20)
	Delobj( ELY )
	writerolevalue(QBODO, EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
	CancelBuff(player  , 507162)
end

function LuaS_423361_Range_CHECK()
	local QBODO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local play  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 100 , 1 do
		Num = 0
			if	CheckAcceptQuest( play, 423361) == true	and
				CheckFlag( play , 544299) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QBODO, EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
end

function LuaS_423361_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423361)==false )	then
		if 	CheckBuff( OwnerID(), 507162) == true	then
			CancelBuff( OwnerID() , 507162)  
		end
		return false
	end
	local BODO= {}
	BODO= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(BODO)-1 do
		if	ReadRoleValue(BODO[i] , EM_RoleValue_OrgID) == 115882	then
			return false
		end
		if	i == table.getn(BODO)	then
			return true
		end
	end
end

function LuaS_423361_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507162)
	DelBodyItem(OwnerID(), 207719, 1 )
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544299, 0 )
end

function LuaS_423361_Finish()
	local play = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	if	CheckAcceptQuest( play , 423361) == true	and
		CheckFlag( play  , 544299) == true		then
		SetFlag(play  , 544265, 1 )
		CancelBuff( play  , 507162)
	end
end

function LuaS_423361_MO_CHECK()	
	local BODO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--演戲波多
	for i = 0 , 100 , 1 do
		if	CheckID(BODO) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end