------423806
function LuaS_423806()	--阿信包的函式 可判斷多人劇情
	local T_ID = TargetID() --宣告該NPC為TargetID
	local O_ID = OwnerID() --玩家	
	LoadQuestOption( O_ID )
	if CheckAcceptQuest( O_ID, 423806 ) == true and CheckFlag( O_ID, 544763 ) == false then
		--否則進行第二判斷  有任務 沒有旗標
		AddSpeakOption( O_ID, T_ID, "[SC_423806_08]", "Lua_423806_1",0) --我準備好了。
	end
end

function Lua_423806_1()
	local T_ID = TargetID() 
	local O_ID = OwnerID() 
	if	ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0	then
		SetSpeakDetail( O_ID, "[SC_423806_09]" ) --請稍等我一下。
	else
		CloseSpeak( O_ID )	--關閉所有對話視窗
		WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )	--讓NPC變忙碌
		BeginPlot( T_ID, "Lua_423806_2", 0 )	--呼叫下一段函式
	end
end

function Lua_423806_2()						--注意 這是迴圈 將自動上BUFF 自動判斷玩家有無離開劇情範圍
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423806 			--任務編號 (只要改動此編號)
		local FinishFlagID = 544763			--完成任務獲得的旗標	(只要改動此編號)
		local CheckBuffID = 508904			--檢查是否正在演戲的BUFF(只要改動此編號) 507178為演戲BUFF 503977為棟住BUFF
		local CheckRange = 150				--演戲的檢查範圍(只要改動此範圍)
		local DoScript = "Lua_423806_break"	--當劇情結束或者沒人在看戲時作的處理	(423519要改為自己的任務編號)
				
		--演戲中
		local father = LuaFunc_CreateObjByObj ( 117503 , O_ID ) --依崔妮假人		
		local son = Lua_DW_CreateObj("flag" ,117504,780878,1)	--將116206物件在780727的第一根旗子上種出來 並宣告為BK
		ks_ActSetMode( father )
		ks_ActSetMode( son )
		Sleep(5)
		CallPlot( O_ID, "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式(要加入 呼應檢查函式)
		Sleep(10)
		Yell(son,"[SC_423806_01]",3)
		CallPlot(son,"MK_MoveToFlag_Face",son , 780878 , 2, 0 , 1 ,father)
		sleep(5)
		CallPlot(father,"LuaS_face_someone", son ,8)
		sleep(20)
		PlayMotion(father,ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(3)
		Yell(father,"[SC_423806_02]",3)	
		sleep(30)
		PlayMotion(son, ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
		Yell(son,"[SC_423806_03]",3)	
		sleep(40)
		PlayMotion(father,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
		Yell(father,"[SC_423806_04]",3)
		sleep(30)
		PlayMotion(father,ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(3)
		Yell(father,"[SC_423806_05]",3)
		sleep(40)
		PlayMotion(son, ruFUSION_ACTORSTATE_EMOTE_THINK)
		Yell(son,"[SC_423806_06]",3)
		sleep(30)
		AdjustFaceDir ( son, father ,180 )		
		sleep(5)
		WriteRoleValue( son ,EM_RoleValue_IsWalk , 0  )
		Yell(son,"[SC_423806_07]",3)
		sleep(20)
		DW_MoveToFlag(son,780878,3,0,1)
		CallPlot(son,"DW_MoveToFlag",son,780878,4,0,1)
		sleep(20)
		DelObj(son)
		DelObj(father)
		sleep(5)
		CallPlot( O_ID, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 自動給予旗標(要加入 呼應函式)
end

function Lua_423806_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local O_ID = OwnerID()	
	local son = LuaFunc_SearchNPCbyOrgID( O_ID, 117504, 150, 0 )--搜尋附近參加的NPC演員
	local father = LuaFunc_SearchNPCbyOrgID( O_ID, 117503, 100, 0 )
	
	if son ~= nil then delobj(son) end							--如果存在 則刪除
	if father ~= nil then delobj(father) end
	ks_resetObj( O_ID, nil )
end

------423807
function LuaS_423807()			--掛在117613任務NPC的物品下
	ks_SetController( OwnerID() )--設定隱形控制物件
	SetPlot( OwnerID(), "range","LuaS_423807_1", 700 )
end
	
function LuaS_423807_1()--  OwnerID是玩家  演出劇情不可在玩家身上執行
	local O_ID = OwnerID()
	local T_ID = TargetID()
	if	CheckAcceptQuest( O_ID ,423807 ) == true	and 	CheckFlag( O_ID , 544764 ) == false	then		--有任務無旗標
		if	ReadRoleValue( T_ID, EM_RoleValue_Register+1 ) == 0 then						--還沒開始
			WriteRoleValue( T_ID,EM_RoleValue_Register+1, 1 )	--讓NPC忙
			ScriptMessage( O_ID , O_ID , 1 , "[SC_423807_13]" , "0xFFFFFF00"  ) 
			ScriptMessage(O_ID , O_ID , 0 , "[SC_423807_13]" , "0xFFFFFF00"  )
			AddBuff( O_ID, 508905 , 0 , 40 )
			BeginPlot( T_ID, "LuaS_423807_2", 0 )
		elseif	ReadRoleValue( T_ID, EM_RoleValue_Register+1 ) == 1	then						--仍再戰鬥
			if	CheckBuff( O_ID ,  508905) == false	then
				ScriptMessage( O_ID , O_ID , 1 , "[SC_423807_13]" , "0xFFFFFF00"  ) 
				ScriptMessage(O_ID , O_ID , 0 , "[SC_423807_13]" , "0xFFFFFF00"  )
				AddBuff( O_ID, 508905 , 0 , 40 )
			end
		else														--戰鬥結束正在演戲
				ScriptMessage( O_ID , O_ID , 1 , "[SC_423807_12]" , "0xFFFFFF00"  ) 
				ScriptMessage(O_ID , O_ID , 0 , "[SC_423807_12]" , "0xFFFFFF00"  )			
		end
	end	
end

function LuaS_423807_2()					
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423807				--任務編號
		local FinishFlagID = 544764			--完成任務獲得的旗標
		local CheckBuffID = 508906			--檢查是否正在演戲的BUFF
		local CheckRange = 200				--演戲的檢查範圍	
		local DoScript = "Lua_423807_break"		
		local snake = Lua_DW_CreateObj("flag" ,105341,780879,1)
		local son= Lua_DW_CreateObj("flag" ,117630,780879,2)	
		MoveToFlagEnabled(snake,false)
		MoveToFlagEnabled(son,false)
		DisableQuest(son,true)
		SetModeEx( son , EM_SetModeType_Strikback , true )	-- 反擊
		SetModeEx( son , EM_SetModeType_Fight, true )		-- 可砍殺攻擊
		SetModeEx( son , EM_SetModeType_Searchenemy , true )	-- 索敵
		SetPlot(snake , "Dead","LuaS_423807_snake_dead",100)
		WriteRoleValue( snake,EM_RoleValue_Register+1, O_ID )
		SetRoleCamp( son , "SNPC" )
		SetRoleCamp( snake , "Monster" )
		SetAttack(son,snake)	
		SetAttack(snake,son)
		while 1 do
			if	ReadRoleValue( O_ID, EM_RoleValue_Register+2) == 1	then
				WriteRoleValue(O_ID,EM_RoleValue_Register+1,2)
			 	break
			elseif	HateListCount( snake ) > 1	or	ReadRoleValue(son,EM_RoleValue_HP)/ReadRoleValue(son,EM_RoleValue_MaxHP) < 0.5	then
				break
			end
			sleep(10)
		end
		local father = Lua_DW_CreateObj("flag" ,117629,780879,3)
		DisableQuest(father,true)
		Hide(father)
		WriteRoleValue( father , EM_RoleValue_IsWalk , 0 )
		SetRoleCamp( father , "Visitor" )
		Show(father,0)
		SetRoleCamp( son , "Visitor" )
		sleep(5)
		yell(son,"[SC_423807_01]",3)
		AdjustFaceDir ( son, father ,0 )	
		sleep(5)	
		SetRoleCamp( son , "SNPC" )		
		DW_MoveToFlag(father,780879 , 4 ,0 ,1)
		AdjustFaceDir ( father, son ,0 )
		PlayMotion(father,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	
		sleep(5)
		yell(father,"[SC_423807_02]",3)
		if	ReadRoleValue( O_ID, EM_RoleValue_Register+2) ~= 1	then	
			SetRoleCamp( father, "SNPC" )
			SetAttack(father,snake)	
			CastSpell(father,snake,496266)
			SetAttack(snake,father)
		yell(father,"[SC_423807_16]",3)
		end
	
		sleep(30)
		while 1 do
			if	ReadRoleValue( O_ID, EM_RoleValue_Register+2) == 1	then
				WriteRoleValue(O_ID,EM_RoleValue_Register+1,2)
			 	break
			end
			sleep(10)
		end
		sleep(10)
		CallPlot(O_ID,"LuaS_423807_Check",QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript)
		SetRoleCamp( son , "Visitor" )
		SetRoleCamp( father , "Visitor" )
		ks_ActSetMode( son )	--演員專用函式  阿信包的(關閉移動劇情 保持走路狀態 無法反擊'攻擊'索敵'點選'隱藏血條'顯示名稱)
		ks_ActSetMode( father )
		sleep(10)
		AdjustFaceDir ( father, son ,0 )
		AdjustFaceDir ( son, father ,0 )
		sleep(5)
		PlayMotion(father,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Yell(father,"[SC_423807_03]",3)
		sleep(40)
		local mage= Lua_DW_CreateObj("flag" ,117505,780879,5)
		sleep(10)	
		ks_ActSetMode( mage )
		sleep(10)
		Yell(mage,"[SC_423807_04]",3)	
		sleep(5)
		CallPlot(father,"LuaS_face_someone", mage,8)
		CallPlot(son,"LuaS_face_someone", mage,8)
		callplot(mage,"MK_MoveToFlag_Face",mage,780879 ,6 ,0 ,1,father)	
		sleep(20)		
		PlayMotion(father,ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(3)
		Yell(father,"[SC_423807_05]",3)	
		sleep(40)
		PlayMotion(mage, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Yell(mage,"[SC_423807_06]",3)	
		sleep(60)
		PlayMotion(mage, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		Yell(mage,"[SC_423807_07]",3)
		sleep(40)
		PlayMotion(mage, ruFUSION_ACTORSTATE_EMOTE_THINK)
		Yell(father,"[SC_423807_08]",3)		
		sleep(10)
		AdjustFaceDir ( son, father ,0 )
		sleep(5)
		yell(son,"[SC_423807_09]",3)
		sleep(10)
		AdjustFaceDir ( father, son ,0 )
		sleep(20)		
		Yell(father,"[SC_112212_6]",3)
		sleep(30)
		PlayMotion(father,ruFUSION_ACTORSTATE_EMOTE_POINT)
		Yell(father,"[SC_423807_10]",3)
		sleep(40)
		WriteRoleValue( father , EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( son , EM_RoleValue_IsWalk , 1 )
		PlayMotion(son, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		Yell(son,"[SC_423807_11]",3)
		sleep(40)	
		PlayMotion(father, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Yell(father,"[SC_423807_14]",3)
		sleep(30)
		Yell(father,"[SC_423807_15]",3)
		local count = 0
		local player = SearchRangePlayer ( O_ID, CheckRange )	
		for i= 0, table.getn(player)-1 do
			if	CheckBuff( player[i], 508906 ) == true	then
				AdjustFaceDir ( father, player[i] ,0 )
				count = count +1			
			end
			sleep(7)
		end
		if	count < 6	then
			sleep(40-count*5)
		end							
		CallPlot(mage,"DW_MoveToFlag",mage,780879,7,20,1)
		CallPlot(father,"DW_MoveToFlag",father,780879,7,20,1)
		sleep(10)
		CallPlot(son,"DW_MoveToFlag",son,780879,7,20,1)
		sleep(40)
		delobj(mage)
		delobj(father)
		sleep(10)
		delobj(son)
		CallPlot( O_ID, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) 					
end

function LuaS_423807_snake_dead()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local PlayerTeam = HateListCount( O_ID )
	for i = 1 , PlayerTeam, 1 do
		local ID = HateListInfo(O_ID  ,i-1 , EM_HateListInfoType_GItemID );
		if CheckAcceptQuest( ID, 423807) == true	and	CheckDistance(ReadRoleValue( O_ID,EM_RoleValue_Register+1),ID,200) == true	then
			AddBuff( ID , 508906 , 0 , -1 )
		end 
	end 
	WriteRoleValue( ReadRoleValue( O_ID,EM_RoleValue_Register+1),EM_RoleValue_Register+2, 1 )
	return true	
end

function LuaS_423807_Check(QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript)
	local O_ID = OwnerID()	
	local player = SearchRangePlayer ( O_ID, CheckRange )		
	while true do
		local Count = 0
		--debugmsg( 0,0, "PlayerNum = "..table.getn(player) )
		for i= 0, table.getn(player)-1 do
			--debugmsg( 0,0, player[i].." Check" )
			if CheckID(player[i]) == true and  CheckAcceptQuest( player[i], QuestID ) ~= true or --檢查有無任務
				CheckBuff( player[i], CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player[i], FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player[i], O_ID, CheckRange ) ~= true then --檢查是否超過檢查範圍
				Count = Count + 1
				CancelBuff( player[i], CheckBuffID )
				--debugmsg( 0,0, player[i].." TableRemove" )
				--table.remove( player, i )				
			end
		end
		if Count == table.getn(player) then
			debugmsg( 0,0, "break "..  Count .. " = "..table.getn(player))
			if DoScript ~= nil then
				BeginPlot( O_ID, DoScript, 0 )
			end
			break
		end		
		sleep(20)
	end	
end

function Lua_423807_break()
	local O_ID = OwnerID()	
	local son = LuaFunc_SearchNPCbyOrgID( O_ID, 117630, 250, 0 )--搜尋附近參加的NPC演員
	local father = LuaFunc_SearchNPCbyOrgID( O_ID, 117629, 250, 0 )
	local mage = LuaFunc_SearchNPCbyOrgID( O_ID, 117505, 250, 0 )
	
	if son ~= nil then delobj(son) end							--如果存在 則刪除
	if father ~= nil then delobj(father) end
	if mage ~= nil then delobj(mage) end
	local ctrl = ks_resetObj( O_ID, nil )

end

------423814

function Lua_423814_1()
	local T_ID = TargetID() 
	local O_ID = OwnerID() 
	SetSpeakDetail( O_ID, "[SC_423814_SP_02]" ) --請稍等我一下。
	if CheckAcceptQuest( O_ID, 423814 ) == true and CheckFlag( O_ID, 544766 ) == false then
		--否則進行第二判斷  有任務 沒有旗標
		AddSpeakOption( O_ID, T_ID, "[SC_423814_SP_03]", "Lua_423814_2",0) --我準備好了。
	end
end

function Lua_423814_2()
	local T_ID = TargetID() 
	local O_ID = OwnerID() 
	if	ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0	or	CheckAcceptQuest( O_ID, 423814 ) == false	then
		SetSpeakDetail( O_ID, "[SC_423814_SP_04]" ) --請稍等我一下。
	else
		CloseSpeak( O_ID )	--關閉所有對話視窗
		WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )	--讓NPC變忙碌
		BeginPlot( T_ID, "Lua_423814_3", 0 )	--呼叫下一段函式
	end
end

function Lua_423814_3()						--注意 這是迴圈 將自動上BUFF 自動判斷玩家有無離開劇情範圍
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423814 			--任務編號 (只要改動此編號)
		local FinishFlagID = 544766			--完成任務獲得的旗標	(只要改動此編號)
		local CheckBuffID = 509013			--檢查是否正在演戲的BUFF(只要改動此編號) 507178為演戲BUFF 503977為棟住BUFF
		local CheckRange = 300				--演戲的檢查範圍(只要改動此範圍)
		local DoScript = "Lua_423814_break"	--當劇情結束或者沒人在看戲時作的處理	(423519要改為自己的任務編號)
				
		--演戲中
		local aqa = LuaFunc_CreateObjByObj ( 117644 , O_ID ) 		
		local als = Lua_DW_CreateObj("flag" ,117463,780881,1)
		local also = LuaFunc_SearchNPCbyOrgID( O_ID, 117460, 800, 0 )	
		local dead = LuaFunc_SearchNPCbyOrgID( O_ID, 117459, 800, 0 )
	
		local aqao = LuaFunc_SearchNPCbyOrgID( O_ID, 117643, 800, 0 )

		local aqa_X = ReadRoleValue(aqao,EM_RoleValue_X)
		local aqa_Y = ReadRoleValue(aqao,EM_RoleValue_Y)
		local aqa_Z = ReadRoleValue(aqao,EM_RoleValue_Z)
		local als_X = ReadRoleValue(also,EM_RoleValue_X)
		local als_Y = ReadRoleValue(also,EM_RoleValue_Y)
		local als_Z = ReadRoleValue(also,EM_RoleValue_Z)		
		ks_ActSetMode( aqa )
		ks_ActSetMode( als )
		Sleep(5)
		CallPlot( O_ID, "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式(要加入 呼應檢查函式)
		Sleep(10)
		Yell(als,"[SC_423814_AC_01]",3)
		AdjustFaceDir ( aqa, als ,0 )		
		DW_MoveToFlag(als , 780881 , 2, 0 , 1 ,aqa)
		sleep(5)
		AdjustFaceDir ( als, aqa ,0 )
		AdjustFaceDir ( aqa, als ,0 )
		sleep(5)
		PlayMotion(als, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Yell(als,"[SC_423814_AC_02]",3)
		sleep(30)
		PlayMotion(aqa, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		Yell(aqa,"[SC_423814_AC_03]",3)
		sleep(20)
		DW_MoveToFlag(aqa,780881,3,0,1)
		CallPlot(als,"DW_WaitMoveTo",als,als_X,als_Y,als_Z)
		DW_WaitMoveTo(aqa,aqa_X,aqa_Y,aqa_Z)
		sleep(5)
		AdjustFaceDir ( als, dead ,0 )
		AdjustFaceDir ( aqa, dead ,0 )		
		sleep(5)
		PlayMotion( aqa ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	  			
		sleep(20)
		Yell(aqa,"[SC_423814_AC_04]",3)		
		sleep(20)
		PlayMotion( aqa ,ruFUSION_ACTORSTATE_CROUCH_END)	   	
		sleep(30)	
		CallPlot( O_ID, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 自動給予旗標(要加入 呼應函式)
end

function Lua_423814_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local O_ID = OwnerID()	
	local aqa = LuaFunc_SearchNPCbyOrgID( O_ID, 117644, 800, 0 )--搜尋附近參加的NPC演員
	local als = LuaFunc_SearchNPCbyOrgID( O_ID, 117463, 800, 0 )
	if aqa ~= nil then delobj(aqa) end							--如果存在 則刪除
	if als ~= nil then delobj(als) end
	ks_resetObj( O_ID, nil )
end

function Lua_117643()
	if CheckAcceptQuest( OwnerID() , 423815 ) == true and CheckFlag( OwnerID() , 544762 ) == false then
		SetSpeakDetail(OwnerID(), "[SC_423815_Q2]")	-- [playername]，就請你暫時權充我的醫療助手了劈哩啪啦總之請幫忙
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_423815_Q1]" ,  "LuaS_117279_1",  0 );	-- 我願意幫忙急救傷患！
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_117279_0()
	local O_ID = OwnerID()
	local T_ID = TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest( O_ID, 423814 ) == true and CheckFlag( O_ID, 544766 ) == false then
		--否則進行第二判斷  有任務 沒有旗標
		AddSpeakOption( O_ID, T_ID, "[SC_423814_SP_01]", "Lua_423814_1",0) --我準備好了。
	end	
end

function LuaS_117404()
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_IDLE_DEAD)
	setplot(OwnerID(),"range","LuaS_117404_1",200)
end

function LuaS_117404_1()
	local O_ID = OwnerID()
	if	CheckAcceptQuest( O_ID , 423816 ) == true	and	 CountBodyItem(O_ID,209037) < 1  	then
		setflag(O_ID,544767,1)
		ScriptMessage( O_ID , O_ID , 1 , "[SC_423816_01]" , "0xFFFFFF00"  ) 
		ScriptMessage( O_ID , O_ID , 0 , "[SC_423816_01]" , "0xFFFFFF00"  )		
	end
end