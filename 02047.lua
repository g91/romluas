
--===========================================================================================================================
--423601
--===========================================================================================================================

function LuaWS_423601_116526_0()
LoadQuestOption(OwnerID())
		if 		(CheckAcceptQuest(OwnerID(),423601)== true )			and
				(CheckCompleteQuest(OwnerID(),423601)== false ) 		and
				CheckFlag(OwnerID(),544405)==false						then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_0]","LuaWS_423601_116526_1",0)
					--朋友，這裡的神賜之果汁是配給的嗎？
		end
end

function LuaWS_423601_116526_1()
	SetSpeakDetail(OwnerID(),"[SC_423601_1]")
	--哈哈哈，你也來一杯吧！乾杯！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_2]","LuaWS_423601_116526_2",0)
	--你手上的那杯可以給我嗎？
end

function LuaWS_423601_116526_2()
	SetSpeakDetail(OwnerID(),"[SC_423601_3]")
	--給我？給我什麼？管他的，哈哈，一會兒搬一桶果汁回家喝！
	SetFlag(OwnerID(),544405,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_4]","LuaWS_423601_close",0)
	--（你們的談話完全沒有交集）
end

---=*=---

function LuaWS_423601_116527_0()
	LoadQuestOption(OwnerID())
		if 		(CheckAcceptQuest(OwnerID(),423601)== true )			and
				(CheckCompleteQuest(OwnerID(),423601)== false ) 		and
				CheckFlag(OwnerID(),544406)==false						then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_5]","LuaWS_423601_116527_1",0)
					--你是葛林小鎮的人？還是從坎貝爾過來的？
		end
end

function LuaWS_423601_116527_1()
	SetSpeakDetail(OwnerID(),"[SC_423601_6]")
	--你說什麼？坎貝爾只有神賜之果，老子到這裡是享福來的！今天已經喝了十五杯神賜之果汁了，等肚子裡的消化了，我要接著喝！
	SetFlag(OwnerID(),544406,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_7]","LuaWS_423601_close",0)
	--（他似乎完全聽不懂你這個簡單問題）
end

---=*=---

function LuaWS_423601_116528_0()
LoadQuestOption(OwnerID())
		if 		(CheckAcceptQuest(OwnerID(),423601)== true )			and
				(CheckCompleteQuest(OwnerID(),423601)== false ) 		and
				CheckFlag(OwnerID(),544407)==false						then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_8]","LuaWS_423601_116528_1",0)
					--這裡的神賜之果汁可以任你想喝就喝？
		end
end

function LuaWS_423601_116528_1()
	SetSpeakDetail(OwnerID(),"[SC_423601_9]")
	--當然，感謝格拉夫領主，賜給我們這些享用不盡的神賜之果汁，啊哈哈......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_10]","LuaWS_423601_116528_2",0)
	--拉法埃爾會過來選人？
end

function LuaWS_423601_116528_2()
	SetSpeakDetail(OwnerID(),"[SC_423601_11]")
	--是啊，被選進城裡可好了，那裡有功效更神奇的神賜之果汁
	SetFlag(OwnerID(),544407,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_12]","LuaWS_423601_close",0)
	--......（他從剛才到現在都認錯人？)
end

---=*=---116529登韋．威佛

function LuaWS_423601_116529_0()
LoadQuestOption(OwnerID())
		if 		(CheckAcceptQuest(OwnerID(),423601)== true )			and
				(CheckCompleteQuest(OwnerID(),423601)== false ) 		and
				CheckFlag(OwnerID(),544572)==false						then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_13]","LuaWS_423601_116529_1",0)
					--你看起來很掙扎的樣子......
		end
		
		if 		(CheckAcceptQuest(OwnerID(),423607)== true )			and
				(CheckCompleteQuest(OwnerID(),423607)== false ) 		then
				if		(CountBodyItem(OwnerID(),208285))<1				then
							AddSpeakOption(OwnerID(),TargetID(),"[SC_423607_0]","LuaWS_423607_116529_0",0)
							--為了調配幫助你們的藥劑，請給我一些頭髮和血液。
				else
							CloseSpeak( OwnerID() )
							
				end		
		end
				
end



function LuaWS_423601_116529_1()
	SetSpeakDetail(OwnerID(),"[SC_423601_14]")
	--是啊，我總是忍不住想喝神賜之果汁的慾望......你、你是誰
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_15]","LuaWS_423601_116529_2",0)
	--你在擔心我？
end

function LuaWS_423601_116529_2()
	SetSpeakDetail(OwnerID(),"[SC_423601_16]")
	--.....不，我真蠢，既然你有辦法進來，當然有足夠的能力
	SetFlag(OwnerID(),544572,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_17]","LuaWS_423601_close",0)
	--好的，我懂了。(他仍保有理智，而且察覺有異)
end


function LuaWS_423601_close()
	CloseSpeak( OwnerID() )
end




--===========================================================================================================================
--423604
--===========================================================================================================================


--(1)先有觸碰劇情
function LuaWS_BeginCastBar_423604()--觸碰劇情115623
	SetPlot( OwnerID(),"touch","LuaWS_BeginCastBar_423604_1",30 )
end


--(2)執行BeginCastBar判斷
function LuaWS_BeginCastBar_423604_1() --
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum 輸入想解除的buff 類型
	--68 騎乘
	--58 變身
	--ObjID 輸入想解除的目標  若不填 預設為 OwnerID()
	--填1 則預設為 TargetID()
	if	CheckAcceptQuest(OwnerID(),423604)==true			and
		CheckCompleteQuest(OwnerID(),423604)==false			and
		CheckFlag(O_ID,544389)==false						then	
		if		CountBodyItem( OwnerID(), 208284)>2				then
			if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423604_0]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaWS_BeginCastBar_423604_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			end
		else
				ScriptMessage( O_ID, O_ID, 0,"[SC_423604_3]", 0 )
				ScriptMessage( O_ID, O_ID, 2,"[SC_423604_3]", 0 )	
				--你缺少
		end
	end
end


--(3)執行BeginCastBar後之結果

function LuaWS_BeginCastBar_423604_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- 成功
						EndCastBar( O_ID, CheckStatus );	
						DelBodyItem(O_ID,208284,3)
						SetFlag(O_ID,544389,1)
						Beginplot(T_ID,"LuaWS_423604_1",0)
						AddBuff(T_ID,504352,1,10)
						--放特效
					else
						-- 失敗
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	


function LuaWS_423604_1()
	DisableQuest(OwnerID(), true )
		Sleep(30)
		Local Cri=LuaFunc_CreateObjByObj( 116913 , OwnerID() )
		Adjustfacedir(Cri,TargetID(),0)
		PlayMotion(Cri,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		Say(Cri,"[SC_423604_2]")
		--謝謝你，告訴蜜榭兒，她曾經為我做的一切，我永遠記在心中。
		Sleep(20)
		AddBuff(OwnerID(),507554,1,10)
		Sleep(30)
		Delobj(Cri)
		ScriptMessage( TargetID(), TargetID(), 0,"[SC_423604_1]", 0 )
		--這個可憐的人已經獲得安息。
	
	DisableQuest(OwnerID(), false )
end

	


--===========================================================================================================================
--423605	任務結束後小劇情 
--===========================================================================================================================

function LuaWS_423605_END()
	DisableQuest(OwnerID(), true )
		MoveToFlagEnabled( OwnerID(), false )
		sleep(10)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		sleep( 30 )
		Say(OwnerID(),"[SC_423605_0]")
		--荒唐、太荒唐了，這不可能是真的。
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
		sleep( 30 )
		Adjustfacedir(OwnerID(),TargetID(),0)
		Say(OwnerID(),"[SC_423605_1]")
		MoveToFlagEnabled( OwnerID(), true )
	DisableQuest(OwnerID(), false )
end



--===========================================================================================================================
--423607	對話後給髮及血
--===========================================================================================================================

function LuaWS_423607_116529_0()
	SetSpeakDetail(OwnerID(),"[SC_423607_1]")
	--你們願意幫助我們？太好了，請稍等一下。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_13]","LuaWS_423607_116529_1",0)
	--好的
end

function LuaWS_423607_116529_1()
	Beginplot(TargetID(),"LuaWS_423607_116529_2",0)
	CloseSpeak( OwnerID() )
end

function LuaWS_423607_116529_2()
	DisableQuest(OwnerID(), true )
		MoveToFlagEnabled( OwnerID(), false )
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		sleep( 20 )
		Adjustfacedir(OwnerID(),TargetID(),0)
		GiveBodyItem( TargetID() , 208285 , 1 )
		Say(OwnerID(),"[SC_423607_2]")
		--這是你要的物品。
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
		sleep( 50 )
		MoveToFlagEnabled( OwnerID(), true )
	DisableQuest(OwnerID(), false )
end


--===========================================================================================================================
--423609	
--===========================================================================================================================

function LuaWS_208418_0()-----掛在物品208418使用下的<檢查lua>之下。103498
	local OrgID = 0
	if 	CheckAcceptQuest( OwnerID() , 423609 ) == false or CountBodyItem( OwnerID() ,208419) >= 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if 	CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	
	if   OrgID ~= 104721 then								-------檢查是否是目標怪物
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423609_0]", 0 ); 
		-----這個[208418]似乎只能對[104721]使用。。
		return false
	end

	if 	GetDistance(TargetID(), OwnerID() ) > 120  then 	-------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423609_1]", 0 ); 
		-----距離太過遙遠，無法使用[208418]。
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422113_7]", 0 ); ----目標奮力掙扎中，你無法順利捉住你的目標！
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --目標已經死了。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
		return false
	end
	return true
end

function LuaWS_208418_1()	--掛在<使用效果類型:server端劇情>下的使用效果下
	if 	GiveBodyItem( OwnerID() , 208419 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---正在使用的物品
	end
	Hide(TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423609_2]", 0 ); 
	-------你抓到[104721]了！
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())

end







--任務完成後
function LuaWS_423609()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP	 )
	Sleep(50)
	PlayMoteion (OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END	)
	Setflag(TargetID(),544399,1)
	--給旗標，判斷看得見野狐116535
end

--===========================================================================================================================
--423510
--===========================================================================================================================

function LuaWS_423610_116537_0()
	LoadQuestOption( OwnerID() )

	if 	(CheckAcceptQuest(OwnerID(),423610)==true )and( CheckCompleteQuest( OwnerID(),423610)==false)	and
		CheckFlag(OwnerID(),544573)==false then

		if	CountBodyItem(OwnerID(),208286) >0 and CountBodyItem(OwnerID(),208287)<1		then

				if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)		then
					return true
				else
					ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			
					--目標正在忙碌中
					return false
				end
		else

				if	CountBodyItem(OwnerID(),208286) <1					then
					ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423610_0]",0)
					--你沒有神賜果汁	
				end
				return false
		end
	end
end
	
function LuaWS_423610_116537_1()

	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 1 )
	
	GiveBodyItem( OwnerID() , 208287 , 1 )
	DelBodyItem(OwnerID(),208286,1)
	SetFlag(OwnerID(),544573,1)
	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 )
	
end



--(1)先有觸碰劇情
function LuaWS_BeginCastBar_116537()--觸碰劇情115623
	SetPlot( OwnerID(),"touch","LuaWS_BeginCastBar_116537_1",30 )
end

--(2)執行BeginCastBar判斷
function LuaWS_BeginCastBar_116537_1() --
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum 輸入想解除的buff 類型
	--68 騎乘
	--58 變身
	--ObjID 輸入想解除的目標  若不填 預設為 OwnerID()
	--填1 則預設為 TargetID()
	if	CheckAcceptQuest(OwnerID(),423610)==true		and
		CheckCompleteQuest(OwnerID(),423610)==false		and
		CheckFlag(O_ID,544573)==false				then
		if	CountBodyItem(OwnerID(),208286) <1		then
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423610_0]",0)
			--你沒有神賜果汁
		end
		
		if	CountBodyItem(OwnerID(),208286) >0 and CountBodyItem(OwnerID(),208287)<1	then
			if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423610_208413]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaWS_BeginCastBar_116537_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			end
		end
	end
end

--(3)執行BeginCastBar後之結果

function LuaWS_BeginCastBar_116537_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- 成功
						EndCastBar( O_ID, CheckStatus );
						SetFlag(O_ID,544573,1)
						GiveBodyItem( OwnerID() , 208287 , 1 )
						DelBodyItem(OwnerID(),208286,1)
					else
						-- 失敗
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	
	

----OAo----

--(1)先有觸碰劇情
function LuaWS_BeginCastBar_116538()--觸碰劇情115623
	SetPlot( OwnerID(),"touch","LuaWS_BeginCastBar_116538_1",30 )
end

--(2)執行BeginCastBar判斷
function LuaWS_BeginCastBar_116538_1() --
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum 輸入想解除的buff 類型
	--68 騎乘
	--58 變身
	--ObjID 輸入想解除的目標  若不填 預設為 OwnerID()
	--填1 則預設為 TargetID()
	if	CheckAcceptQuest(OwnerID(),423610)==true		and
		CheckCompleteQuest(OwnerID(),423610)==false		and
		CheckFlag(O_ID,544574)==false				then
		if	CountBodyItem(OwnerID(),208413) <1		then
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423610_13]",0)
			--你沒有加工果汁
		end
		
		if	CountBodyItem(OwnerID(),208413) >0 and CountBodyItem(OwnerID(),208414)<1	then
			if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423610_208413]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaWS_BeginCastBar_116538_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			end
		end
	end
end

--(3)執行BeginCastBar後之結果

function LuaWS_BeginCastBar_116538_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- 成功
						EndCastBar( O_ID, CheckStatus );
						SetFlag(O_ID,544574,1)
						GiveBodyItem( OwnerID() , 208414 , 1 )
						DelBodyItem(OwnerID(),208413,1)
					else
						-- 失敗
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	
		
----OAo----
		
function LuaWS_116423_0()
--康葛斯．多瑞安

	LoadQuestOption(OwnerID())		
		if 	(CheckAcceptQuest(OwnerID(),423610)== true )		and 
			(CheckCompleteQuest(OwnerID(),423610)==false)		then
					if  		Checkflag(OwnerID(),544573) ==false		and
							CountBodyItem(OwnerID(),208286)<1		and 
							CountBodyItem(OwnerID(),208287)<1		then
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_1]","LuaWS_116423_1",0)
								--可以再給我一瓶[208286]嗎？
					end
				
					if  		Checkflag(OwnerID(),544574) ==false		and
							CountBodyItem(OwnerID(),208413)<1		and 
							CountBodyItem(OwnerID(),208414)<1		then
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_2]","LuaWS_116423_1",0)
								--可以再給我一瓶[208413]嗎？
					end
					
					if 		Checkflag(OwnerID(),544573) ==true		and
							Checkflag(OwnerID(),544574) ==false		and
							CountBodyItem(OwnerID(),208413)>0		then
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_3]","LuaWS_116423_3",0)
								--我忘記現在要做什麼了？
					end
					
					if		Checkflag(OwnerID(),544573) ==true		and
							Checkflag(OwnerID(),544574) ==true		and
							CountBodyItem(OwnerID(),208415)<1		then
							if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+2 ) == 0)	then
								
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_5]","LuaWS_116423_4",0)
								--我已經照你吩咐餵完兩瓶果汁，接下來呢？
							else
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_10]","LuaWS_116423_4",0)
								--狐狸又狂暴了，現在怎麼辦？
							end

					end
		end
end
		
		
function LuaWS_116423_1()
	Beginplot( TargetID() , "LuaWS_116423_2" , 0 )
	CloseSpeak(OwnerID())
end

function LuaWS_116423_2()
	Adjustfacedir(OwnerID(),TargetID(),0)
	Say(OwnerID(),"[SC_423610_4]")	
	--不見了？還好我先見之明保留了些，凡事都得設想周到，我容易嗎我？拿去，別再搞丟了。
		if 		Checkflag(TargetID(),544573) ==false			and
				CountBodyItem(TargetID(),208286)<1			and 
				CountBodyItem(TargetID(),208287)<1			then
						GiveBodyItem( TargetID() , 208286 , 1 )
		end

		if  	Checkflag(OwnerID(),544574) ==false			and
				CountBodyItem(OwnerID(),208413)<1		and 
				CountBodyItem(OwnerID(),208414)<1		then
						GiveBodyItem( TargetID() , 208413 , 1 )
		end
end
		
function LuaWS_116423_3()		
	SetSpeakDetail(OwnerID(),"[SC_423610_6]")	
	--拿[208413]給你面前那隻小狐狸喝啊。
end
		
function LuaWS_116423_4()	
	if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)		then
		if		(ReadRoleValue( TargetID() , EM_RoleValue_Register+2 ) == 0)		then
				SetSpeakDetail(OwnerID(),"[SC_423610_7]")
				--殺了小狐狸，現在流淌於牠體內的血液，正是你的新朋友所需要的藥劑。

					AddSpeakOption(OwnerID(),TargetID(),"[SC_421544_5]","LuaWS_116423_5",0)
					--......我明白了
		else
				SetSpeakDetail(OwnerID(),"[SC_423610_11]")
				--沒關係，這只是短暫的，我保證牠很快就再次恢復鎮靜，你就可以放心去取血啦！
					AddSpeakOption(OwnerID(),TargetID(),"[SC_421544_5]","LuaWS_116423_5",0)
					--......我明白了
		end
	else
			SetSpeakDetail(OwnerID(),"[SC_423610_8]", 0 );		
			--別急，讓我再觀察那小狐狸一會兒，等一下再問我。
	end
end		

function LuaWS_116423_5()	
	Beginplot(TargetID(),"LuaWS_116423_6",0)
	CloseSpeak(OwnerID())
end

function LuaWS_116423_6()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 1 )
	DisableQuest(OwnerID(), true )
	local Fox=Lua_DW_CreateObj("flag" ,104862,780741,1)
	AddBuff(TargetID(),507516,1,300)
	--上buff，使狂暴的狐看不見 
	DW_MoveToFlag(Fox,780741 , 2 ,0 ,1)
	--BeginPlot(Fox,"LuaS_Discowood_CheckPeace",0) --8.5秒內未進入戰鬥狀態就會消失
	
	local player="here"
	local Monster="NotDead"
	local quest="in"
	local wait="time"
	local G=0
	local AttackTarget = ReadRoleValue(TargetID() , EM_RoleValue_AttackTargetID )
	
		while 1 do
				G=G+1
				
				if (G==20	and  ReadRoleValue(TargetID() , EM_RoleValue_AttackTargetID ) == 0 )	or
					G==80	then
					wait="timeover"
					break
				end
				
				if 	CheckAcceptQuest(TargetID(),423610)== false				then
					quest="out"
					break
				end
				
				if	ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 		or
					CheckID(TargetID()) == false							or
					GetDistance( TargetID(), OwnerID()) >300 				then
					player="Nothere"
					break	
				end
				
				if 	(ReadRoleValue(Fox, EM_RoleValue_IsDead)==1 or  CheckID(Fox)== false)		then
					Monster="IsDead"
					break
				end
			Sleep(10)
		end
	
				if quest=="out" 	then		
						--Sleep(30)
						CancelBuff(TargetID(),507516)
						Delobj(Fox)
				end
					
				if player=="Nothere" or wait=="timeover"	then	
			
						
						ScriptMessage(TargetID(), TargetID() , 1 , "[SC_423610_12]" , 0 )		--任務失敗，請放棄重接
						ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423610_12]" , 0 )		--任務失敗，請放棄重接
						ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423610_12]" , 0 )
						Sleep(30)
						ScriptMessage(TargetID(), TargetID() , 1 , "[SC_423610_12]" , 0 )		--任務失敗，請放棄重接
						ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423610_12]" , 0 )		--任務失敗，請放棄重接
						ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423610_12]" , 0 )
						Sleep(30)
						CancelBuff(TargetID(),507516)
						Delobj(Fox)	
						Yell(OwnerID(),"[SC_423610_14]",1)
						--你的動作太慢了
				end
				
				if  wait=="timeover"	then
						DisableQuest(OwnerID(), false )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
						return false
				end
					
					
		if  	(CheckAcceptQuest(TargetID(),423610)== true ) 			and
				(CheckCompleteQuest(TargetID(),423610)==  false)  		and
				Checkflag(TargetID(),544573)== true						and
				Checkflag(TargetID(),544574)== true						and
				CountBodyItem(TargetID(),208415)<1						then
									if	Monster=="IsDead" or CheckID(Fox)== false			then
										Yell(OwnerID(),"[SC_423610_9]",1)
										--快接取狐狸的血啊！
										Sleep(30)		
									end
		end

	
						local Blood="NotGet"
						local h=0
						local PET="NotDead"
						local fin="time"
							
								while 1 do
								h=h+1
				
											if 	h==20	then
												fin="timeover"
												break
											end
				
											if 	CheckAcceptQuest(TargetID(),423610)== false				then
												quest="out"
												break
											end
											
											if	ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 		or
												CheckID(TargetID()) == false	or
												GetDistance( TargetID(), OwnerID()) >150 				then
												player="Nothere"
												break	
											end
											
											if 	(CountBodyItem(TargetID(),208415))>0					then
												Blood="Got"
												break
											end
											
											if 	CheckID(Fox)== false	then	
												PET="IsDead"	
												break
											end
											Sleep(10)
								end
							
							if 	quest=="out" 	or 	Blood=="Got"		then		
									--CancelBuff(TargetID(),507516)
									Delobj(FOX)
							end
								
							if player=="Nothere"  or fin=="timeover" then	
									ScriptMessage(TargetID(), TargetID() , 1 , "[SC_423610_12]" , 0 )		--任務失敗，請放棄重接
									ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423610_12]" , 0 )		--任務失敗，請放棄重接
									Sleep(30)
									ScriptMessage(TargetID(), TargetID() , 1 , "[SC_423610_12]" , 0 )		--任務失敗，請放棄重接
									ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423610_12]" , 0 )		--任務失敗，請放棄重接
									Sleep(30)
									CancelBuff(TargetID(),507516)
									Delobj(FOX)
									Yell(OwnerID(),"[SC_423610_14]",1)
							--你的動作太慢了
							end
							
							if 	fin=="timeover" or PET=="IsDead"	then
								DisableQuest(OwnerID(), false )
								WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
							end
							
							if 	Blood=="NotGet" and 	(fin=="timeover" or PET=="IsDead"	or ReadRoleValue(FOX, EM_RoleValue_IsDead)==1)	then
								CancelBuff(TargetID(),507516)
								Delobj(FOX)
								Yell(OwnerID(),"[SC_423610_14]",1)
							end
							
							
							
say(FOX,"open")
	DisableQuest(OwnerID(), false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
end	




-----***------

function LuaWS_CrazyFox()
	while true do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
		sleep(20)	
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_2H)
		Sleep(20)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DODGE )
		Sleep(20)
	end
end

-----***------

	
function LuaWS_423610_end()
	DisableQuest(OwnerID(), true )
	CancelBuff(TargetID(),507516)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
	AddBuff(TargetID(),507550,1,400)	

		local NPC =SearchRangeNPC ( OwnerID() , 400 )				
			--搜尋玩家身邊 200範圍內的npc，放入npc的陣列內
			local S1	
			for i=0,table.getn(NPC),1 do
				if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 116422 then
					S1= NPC[i]	--艾可
				end
			end
		Local Star  = LuaFunc_CreateObjByObj( 116915 , S1 )
		Hide(Star)
		DisableQuest(Star, true )
		Show(Star,0)

	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	WriteRoleValue(Star, EM_RoleValue_IsWalk, 1)

	DW_MoveToFlag(Star,780739,10,0,1)
	Hide(Star)
	Sleep(20)
	Delobj(Star)	
	CancelBuff( TargetID()  , 507550  ) 
	DisableQuest(OwnerID(), false )
end
		

function LuaWS_423610_ACCEPT()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
	CancelBuff(TargetID(),507516)
	if 	CountBodyItem(TargetID(),208415)>0	or
		CountBodyItem(TargetID(),208414)>0	or
		CountBodyItem(TargetID(),208287)>0	then
			if	CountBodyItem(TargetID(),208286)>0	and
				CountBodyItem(TargetID(),208413)>0	then
				DelBodyItem(TargetID(),208415,1)
				DelBodyItem(TargetID(),208414,1)
				DelBodyItem(TargetID(),208287,1)
			end
	end
end

				
	
		
		
		
		
		
		
		
		
		