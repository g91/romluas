
--============================================================================
--接過任務422836，未接422837，且未得到重要旗標<初遇卡蓮543465>的玩家，卡蓮走路旗子780495
--在經過卡蓮方圓50內，開啟表演劇情
--關閉範圍劇情
--卡蓮攻擊玩家
--卡蓮跑走
--刺客出現，演戲，離開
--============================================================================

function LuaS_422836_1()	--掛在卡蓮113944的物件產生劇情
	Setplot(OwnerID(),"range","LuaS_422836_2",100)	
end

function LuaS_422836_2()
	Beginplot(TargetID(),"LuaS_422836_3",0)
end

function LuaS_422836_3()
	Setplot(OwnerID(),"range","",0)		--關閉卡蓮的範圍劇情
--	Say(OwnerID(),"0..03")
--	Say(TargetID(),"T_T3")

	if 	(CheckAcceptQuest(TargetID(),422836)== true ) 		and
	 	(CheckCompleteQuest(TargetID(),422836)==  false)  	and
		(CheckAcceptQuest(TargetID(),422837)== false)		and 
		(CheckFlag(TargetID(), 543465 )==false) 		then		--玩家自己接過任務422836，未接422837，且未得到重要旗標<初遇卡蓮543465>
			
		CastSpell(OwnerID(),TargetID(),494805)	--讓卡蓮對玩家丟石頭
		Sleep(20)
--		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KICK)
		Sleep(10)
		Yell(OwnerID() , "[SC_422837_0]" , 3 )

		local A= SearchRangePlayer (OwnerID(), 150 )		--宣告陣列Ａ是搜尋卡蓮範圍內150碼的所有玩家
		local B={}						--宣告陣列Ｂ的存在
									


		for i=0,table.getn(A),1 do				--迴圈的基本格式 for i=起始值,最大值（迴圈運算次數判斷）,累積值 do
									--例：for i=0,3,1 do　即從０開始跑第１次，０加上累積值１=1＜３，跑第二次....直到起始值加累積值大於最大值３，即不執行
									--table.getn(A)會自動算出（）中陣列包含物的總數

			if 	(CheckAcceptQuest(A[i],422836)== true ) 	and 
				(CheckAcceptQuest(A[i],422837)== false ) 	and 
				(CheckFlag(A[i], 543465 )==false)		then 

				B[table.getn(B)+1]=A[i]			--B[位置]要設為遞增+1，故用table.getn(B)算出總數，一開始是空的，故為0，+1後為B[1]，依序為B[2],B[3]....視A[i]有多少	
			end	
		end
	
		Beginplot(OwnerID(),"LuaS_422836_10",1)
					
		Sleep(20)
		Hide( OwnerID() )

		for i=1,table.getn(B),1 do				--給看完的玩家旗標
			setflag(B[i],543465,1)
		end

		local KillerA = Lua_DW_CreateObj("flag" ,113953,780491,1 )		--種出殺甲
		local KillerB = Lua_DW_CreateObj("flag" ,113954,780492,1 )		--種出殺乙

		Beginplot(KillerA,"LuaS_422836_5",1)
		Beginplot(KillerB,"LuaS_422836_6",1)					--讓甲乙移動到旗子2
	
--		While 	(ReadRoleValue (KillerA , EM_RoleValue_PID)~=1) or  
--			(ReadRoleValue (KillerB , EM_RoleValue_PID)~=1) do		--當A的PID值不等於1，或B的PID值不等於1 ，執行	
--											--A、B中任一的PID不等於1，都會執行此迴圈，所以A與B的PID都是1後，才會跳開此迴圈	
--			sleep(10)
--		end

		Sleep(30)
		Yell(KillerA,"[SC_422837_1]",1)			--甲說話
		PlayMotion(KillerA ,ruFUSION_ACTORSTATE_EMOTE_POINT)
		Sleep(20)											
		Beginplot(KillerA,"LuaS_422836_8",0)
		Beginplot(KillerB,"LuaS_422836_9",0)			--讓甲乙移動到旗子3
	end

	
		Sleep(100)
		Show(OwnerID(),0)					--顯示卡蓮
		SetPosByFlag(OwnerID(),780495,2)			--傳送卡蓮回到原位#####不能在隱藏時使用此指令！！！				
		Setplot(OwnerID(),"range","LuaS_422836_2",100)		--開啟卡蓮的範圍劇情
	
end
		


function LuaS_422836_5()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 1)
--	PlayMotion( OwnerID() ,ruFUSION_MIME_SNEAK_FORWARD)
--	Sleep(20)
	DW_MoveToFlag(OwnerID(),780491,2,0,1)
	WriteRoleValue (OwnerID(), EM_RoleValue_PID, 1 )	
end

function LuaS_422836_6()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 1 )
--	PlayMotion( OwnerID() ,ruFUSION_MIME_SNEAK_FORWARD)
--	Sleep(20)
	DW_MoveToFlag(OwnerID(),780492,2,0,1)	
	WriteRoleValue (OwnerID() , EM_RoleValue_PID, 1 )	
end


function LuaS_422836_8()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 0 )
	DW_MoveToFlag(OwnerID(),780491,3,0,1)
	Delobj(OwnerID())
end

function LuaS_422836_9()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 0 )
	DW_MoveToFlag(OwnerID(),780492,3,0,1)
	Delobj(OwnerID())
end

function LuaS_422836_10()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 0 )
	DW_MoveToFlag(OwnerID(),780495,1,0,1)		--讓卡蓮移動到旗子(flag)
						--隱藏卡蓮
end




--=========================================================================
--接下422837任務，但未完成422837任務，且未得旗標(已與殺手交手)的玩家，殺手甲102897(旗子780493)、殺手乙102898(旗子780494)
--殺手跳出，攻擊玩家和卡蓮
--只要交手，無論勝負，都給重要旗標(已與殺手交手543528)
--戰勝殺手，直接與卡蓮對話
--戰不勝，當卡蓮血量低於1/5時，卡蓮傳送消失
--10秒後，殺手消失
--得到與殺手交手旗標543528，還任務422837
--重生卡蓮，與卡蓮對話，得到543429卡蓮說不能說，還任務
--=========================================================================

function LuaS_422837_2()	--掛在任務422837接受
	local KillerA = Lua_DW_CreateObj("flag" ,102897,780493,1 )		--種出殺甲
	local KillerB = Lua_DW_CreateObj("flag" ,102898,780494,1 )		--種出殺乙
	local Check = "NotOK"
	Sleep(20)

	SetFollow(KillerA , TargetID())			--跑向玩家
	SetFollow(KillerB , TargetID())	
	SetAttack(KillerA , TargetID())			--讓殺手甲攻擊目標玩家
	SetAttack(KillerB , TargetID())			--讓殺手乙攻擊玩家
	
	ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_422837_16]" , 0 ) 		--殺手突然殺出！
	
	local Calen = Lua_DW_CreateObj("flag" , 102896 ,780494,2 )			--種出卡蓮二號
	Hide(OwnerID())
	SetPlot( Calen , "dead" , "LuaS_422837_2_Dead" , 0 )
	SetAttack(Calen,KillerA)
	SetAttack(KillerA , Calen )
	SetFollow(KillerA , Calen )

	for i= 1,600,1 do
		if 	( CheckID(KillerA) == false or ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 1 ) and 
			( CheckID(KillerB) == false or ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 1 ) then
			Check = "OK"
			break
		end
		if ReadRoleValue(Calen,EM_RoleValue_HP)/ReadRoleValue(Calen,EM_RoleValue_MaxHP) < 0.25 then
			break
		end
		if CheckID(TargetID()) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead)  == 1 then
			break
		end
		if CheckID(Calen ) == false or ReadRoleValue( Calen , EM_RoleValue_IsDead)  == 1 then
			break
		end
		sleep( 10 )
	end

	if Check == "NotOK" then
			if CheckID(Calen ) == true and ReadRoleValue( Calen , EM_RoleValue_IsDead)  == 0 then
				if CheckID( TargetID() ) and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then
					Tell(TargetID() ,Calen,"[SC_422837_8]")			--卡蓮2對玩家悄悄話:情況不妙，我先把人引走，再回來找你	
				end
				SetRoleCamp( Calen , "Visitor" )
				SetStopAttack(Calen)
				Sleep(20)
				Yell(Calen, "[SC_422837_9]", 3 )			--大笨驢，想抓我，你得先追上我！！
				Sleep(50)
				if CheckID(KillerA) == true and ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 0 then
					Lua_CancelAllBuff( KillerA )
					SetStopAttack( KillerA )
					SetRoleCamp( KillerA , "Visitor" )
					SetFollow(KillerA ,Calen)			--讓殺手甲攻擊卡蓮2
				end
				if CheckID(KillerB) == true and ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 0 then
					Lua_CancelAllBuff( KillerB )
					SetStopAttack( KillerB )
					SetRoleCamp( KillerB , "Visitor" )
					SetFollow(KillerB ,Calen)			--讓殺手甲攻擊卡蓮2
				end

				Beginplot(Calen,"LuaS_422837_3",0)		--讓卡蓮2跑到遠處，消失
	
				if CheckID(KillerB) == true and ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 0 then
					if CheckID(KillerA) == true and ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 0 then			
						SetFollow(KillerB , KillerA )			--殺手乙跟隨殺手甲
					else
						DW_MoveToFlag(KillerB,780493,2,0,1)		--讓殺手甲移動
						Delobj(KillerB)
					end
				end

				if CheckID(KillerA) == true and ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 0 then
			 		SetStopAttack(KillerA)				--讓殺手甲停止攻
					Yell(KillerA , "[SC_422837_10]" , 3 )
					DW_MoveToFlag(KillerA,780493,2,0,1)		--讓殺手甲移動
					if CheckID(KillerB) == true and ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 0 then
						Delobj(KillerB)
					end
					Delobj(KillerA)
				end
				Sleep(20)
				Show( Calen , 0 )
				DW_MoveToFlag(Calen,780494,2,0,1)
				Delobj(Calen)
			else
				if CheckID(KillerA) == true and ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 0 then
					Delobj(KillerA)
				end
				if CheckID(KillerB) == true and ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 0 then
					Delobj(KillerB)
				end
			end

			if CheckID( TargetID() ) == true then
				ScriptMessage(TargetID(), TargetID() , 1 , "[SC_422813_22]" , 0 )	--任務失敗
			end
	else
			Sleep(20)					
			if 	CheckID( TargetID() ) == true and (CheckFlag( TargetID() , 543528 )==false) then			
				Setflag( TargetID() ,543528,1)	--給目標玩家旗標(已與殺手交手)
			end
			if CheckID( Calen) == true then
				DW_MoveToFlag(Calen,780494,2,0,1)
				Delobj(Calen)
			end
	end
	Show( OwnerID() , 0 )
end


function LuaS_422837_3()	--卡蓮2跑走				
	DW_MoveToFlag(OwnerID(),780494,3,0,1)			--讓卡蓮2移動到旗子(flag)
	Hide(OwnerID())
end

function LuaS_422837_2_Dead()
	return false
end
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------


function LuaS_422837_0()		--掛在卡蓮初始對話劇情，OwnerID是玩家
	LoadQuestOption(OwnerID())

	if 	(CheckAcceptQuest(OwnerID(),422837)==true ) 		and 		--接下422837任務，但未完成422837任務，且未得旗標(已與殺手交手)的玩家
		(CheckCompleteQuest( OwnerID() , 422837) == false ) 	and
		(CheckFlag( OwnerID(), 543528 )==false)			then
		SetSpeakDetail(OwnerID(),"[SC_422837_14]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422837_15]","LuaS_422837_9",0)
		
	end

	if	(CheckFlag( OwnerID(), 543528 )==true) and CheckAcceptQuest( OwnerID() , 422837) == true	then			--if自己接了422837任務，未完成422837任務者，得旗標(已與殺手交手)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422837_13]","LuaS_422837_8",0) 	--在目標身上執行LuaS_422837_8 「小姐你怎麼一個人在這裡，不回綠之塔呢？」
	end

end


function LuaS_422837_8()	
	SetSpeakDetail(OwnerID(),"[SC_422837_3]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422837_4]","LuaS_422837_6",0)			--「也許我可以幫你......」
end

function LuaS_422837_6()	
	SetSpeakDetail(OwnerID(),"[SC_422837_5]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422837_6]","LuaS_422837_7",0)			--「如果又有人前來襲?你呢？這樣太危險了。」
end

function LuaS_422837_7()	
	SetSpeakDetail(OwnerID(),"[SC_422837_7]")
	Setflag(OwnerID(),543429,1)
end

function LuaS_422837_9()
	CloseSpeak(OwnerID())	
	Beginplot(TargetID(),"LuaS_422837_2",0)
end


