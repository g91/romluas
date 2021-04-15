--主線2
------任務423554說服黑洛卡----
function Luas_423554()	--掛在黑洛卡身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423554 ) == true and	checkFlag( OwnerID() , 544368 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423554_1]", "LuaS_423554_1", 0 )--你想做什麼？為什麼不跟著離開？
	end
end

function LuaS_423554_1()
	SetSpeakDetail(	OwnerID() , "[SC_423554_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423554_3]", "LuaS_423554_2" , 0 )
end

function LuaS_423554_2()
	SetSpeakDetail( OwnerID() , "[SC_423554_4]" )
	AddSpeakOption( OwnerID() ,TargetID(),  "[SC_423554_5]" , "LuaS_423554_3" , 0 )
end

function LuaS_423554_3()
	SetSpeakDetail( OwnerID() , "[SC_423554_6]" )
	SetFlag( OwnerID() , 544368 , 1 )
end

--------------------------------------------

------任務423561螢火的身份----
function Luas_423561()	--掛在116267螢火身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423561 ) == true and	checkFlag( OwnerID() , 544369 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423561_1]", "LuaS_423561_1", 0 )--你想做什麼？為什麼不跟著離開？
	end
end

function LuaS_423561_1()
	SetSpeakDetail(	OwnerID() , "[SC_423561_2]" )
	AddSpeakOption( OwnerID() ,TargetID(), "[SC_423561_3]", "LuaS_423561_2" , 0 )
end

function LuaS_423561_2()
	SetSpeakDetail( OwnerID() , "[SC_423561_4]" )
	AddSpeakOption( OwnerID() ,TargetID(), "[SC_423561_5]" , "LuaS_423561_3" , 0 )
end

function LuaS_423561_3()
	SetSpeakDetail( OwnerID() , "[SC_423561_6]" )
	AddSpeakOption( OwnerID() , TargetID(),"[SC_423561_7]" , "LuaS_423561_4" , 0 )
end

function LuaS_423561_4()
	SetSpeakDetail( OwnerID() , "[SC_423561_8]" )
	SetFlag( OwnerID() , 544369 , 1 )
end
---------------------------------------------------------------------------------
function LuaS_423561_9()	--423561任務完成後執行
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423561_9]" , "0xFFFFFF00"  ) 
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423561_9]" , "0xFFFFFF00"  )
end

------------------------------423562揭發真相----------------------------------

--/GM ? createflag 780732 1
--116271真的黑洛卡 
--116278真的依崔妮

--116273假的黑洛卡       旗子:780728
-- 116274假的依崔妮       旗子:780731

--116275達蒙克．瞎眼       旗子:780732
--116276巴沙札．烏鬃       旗子:780733
--116277剛提寇．斷牙       旗子:780734
--116279看戲的鄉民      旗子:780735

--揭發真相檢查點116281		完成旗標編號：544392    看戲BUFF:507178
function LuaS_423562()			--掛在116281任務NPC的物品下
	SetPlot( OwnerID(), "range","LuaS_423562_1", 150 )
end
	
function LuaS_423562_1()--  OwnerID是玩家  演出劇情不可在玩家身上執行
	if	CheckAcceptQuest( OwnerID() ,423562 ) == true	and 	CheckFlag( OwnerID() , 544392 ) == false and CheckBuff( OwnerID(), 507178 ) == false and
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )	--讓NPC忙
		BeginPlot( TargetID(), "LuaS_423562_2", 0 )
	elseif	CheckAcceptQuest( OwnerID() ,423562 ) == true	and 	CheckFlag( OwnerID() , 544392 ) == false and CheckBuff( OwnerID(), 507178 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423562_0]" , "0xFFFFFF00"  ) --告訴玩家，讓玩家等等再來
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423562_0]" , "0xFFFFFF00"  )
	end	
end

function LuaS_423562_2()
	while true do							--注意 這是迴圈
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423562				--任務編號
		local FinishFlagID = 544392			--完成任務獲得的旗標
		local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
		local CheckRange = 200				--演戲的檢查範圍
		local DoScript = "Lua_423562_break"	--當劇情結束或者沒人在看戲時作的處理	
		
		local BK = Lua_DW_CreateObj("flag" ,116273,780728,1)
		local DM = Lua_DW_CreateObj("flag" ,116275,780732,1)	--將達蒙克．瞎眼在第一根旗子上種出來 並宣告
		local BS = Lua_DW_CreateObj("flag" ,116276,780733,1)	--將巴沙札．烏鬃在第一根旗子上種出來 並宣告     
		local GT = Lua_DW_CreateObj("flag" ,116277,780734,1)	--將剛提寇．斷牙 在第一根旗子上種出來 並宣告
		local icl = Lua_DW_CreateObj("flag" ,116274,780731,1)	--將依崔妮物件在第一根旗子上種出來 並宣告
		local SM1 =Lua_DW_CreateObj("flag" ,116279,780735,1)	--將看戲的鄉民在第一根旗子上種出來
		local SM2 =Lua_DW_CreateObj("flag" ,116279,780735,2)	--將看戲的鄉民在第一根旗子上種出來
		local SM3 =Lua_DW_CreateObj("flag" ,116279,780735,3)	--將看戲的鄉民在第一根旗子上種出來
		local SM4 =Lua_DW_CreateObj("flag" ,116279,780735,4)	--將看戲的鄉民在第一根旗子上種出來
		local SM5 =Lua_DW_CreateObj("flag" ,116279,780735,5)	--將看戲的鄉民在第一根旗子上種出來
		ks_ActSetMode( DM )	--將達蒙克．瞎眼
		ks_ActSetMode( BS )	--將巴沙札．烏鬃
		ks_ActSetMode( GT )	--將剛提寇．斷牙
		ks_ActSetMode( BK )	--黑洛卡
		ks_ActSetMode( icl )--依崔妮
		ks_ActSetMode( SM1 )--鄉民
		ks_ActSetMode( SM2 )--鄉民
		ks_ActSetMode( SM3 )--鄉民
		ks_ActSetMode( SM4 )--鄉民
		ks_ActSetMode( SM5 )--鄉民
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式
		Sleep(10)
		--演戲中
		AdjustFaceDir ( DM, BK ,0 )	--使1面對2
		AdjustFaceDir ( BS, BK ,0 )
		AdjustFaceDir ( GT, BK ,0 )
		AdjustFaceDir ( SM1, BK ,0 )
		AdjustFaceDir ( SM2, BK ,0 )
		AdjustFaceDir ( SM3, BK ,0 )
		AdjustFaceDir ( SM4, BK ,0 )
		AdjustFaceDir ( SM5, BK ,0 )
		Sleep(5)
		Say(DM,"[SC_423562_1]")	--達蒙克:可恥的盜墓賊！如果你沒有盜墓，為什麼我父親的陪葬戒指會在你的手上？
		PlayMotion ( DM, ruFUSION_ACTORSTATE_ATTACK_2H )
		Sleep(3)
		AdjustFaceDir ( BK, DM ,0 )
		Sleep(20)
		Say(BS,"[SC_423562_2]")	--巴沙札:其他墓穴裡的屍體也都不見了，你到底做了什麼？
		Sleep(3)
		AdjustFaceDir ( BK, BS ,0 )
		Sleep(20)
		Say(BK,"[SC_423562_3]")	--黑洛卡:我說過了，他們被[116220]變成了傀儡戰士，現在全都被藏在吐庫克熱泉地裡。
		PlayMotion ( BK, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
		Sleep(40)
		Say(GT,"[SC_423562_4]")	--剛提寇:雖然我們都不滿[116218]，但那也不代表我們會這麼簡單就被煽動
		Sleep(3)
		AdjustFaceDir ( BK, GT ,0 )
		Sleep(20)
		Say(icl,"[SC_423562_5]")	--依崔妮"各位，他說的都是真的
		Sleep(5)
		AdjustFaceDir ( DM, icl ,0 )	--使1面對2
		AdjustFaceDir ( BS, icl ,0 )
		AdjustFaceDir ( GT, icl ,0 )
		AdjustFaceDir ( SM1, icl ,0 )
		AdjustFaceDir ( SM2, icl ,0 )
		AdjustFaceDir ( SM3, icl ,0 )
		AdjustFaceDir ( SM4, icl ,0 )
		AdjustFaceDir ( SM5, icl ,0 )
		Sleep(40)
		Say(GT,"[SC_423562_6]")	--剛提寇:沙卡巴攻打贊卡是為了給將軍報仇。
		Sleep(3)
		AdjustFaceDir ( GT, icl ,0 )
		Sleep(20)
		Say(icl,"[SC_423562_7]")	--依崔妮:那只是他的徵兵藉口
		Sleep(3)
		AdjustFaceDir ( icl, GT ,0 )
		Sleep(40)
		Say(BS,"[SC_423562_8]")	--巴沙札:說謊，偉大的戰士是死在戰場上，而不是陰謀之下
		Sleep(3)
		AdjustFaceDir ( BS, icl ,0 )
		Sleep(20)
		Say(icl,"[SC_423562_9]")	--依崔妮:我有沒有說謊，你們最清楚了
		Sleep(3)
		AdjustFaceDir ( icl, BS ,0 )
		Sleep(20)
		Say(DM,"[SC_423562_10]")	--:的確，她沒有說謊，我確實感覺不到她有心跳加快或是其他疑似說謊時會出現的生理反應。
		Sleep(5)
		AdjustFaceDir ( icl, DM ,0 )	--使1面對2
		AdjustFaceDir ( BK, DM ,0 )
		AdjustFaceDir ( BS, DM ,0 )
		AdjustFaceDir ( GT, DM ,0 )
		AdjustFaceDir ( SM1, DM ,0 )
		AdjustFaceDir ( SM2, DM ,0 )
		AdjustFaceDir ( SM3, DM ,0 )
		AdjustFaceDir ( SM4, DM ,0 )
		AdjustFaceDir ( SM5, DM ,0 )
		Sleep(30)
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423562_11]" , "0xFFFFFF00" )	--(眾人議論紛紛)
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423562_11]" , "0xFFFFFF00" )	
		Sleep(20)
		Say(DM,"[SC_423562_12]")	--達蒙克:但我不明白，為什麼沙卡巴要這麼多的傀儡戰士為他作戰？
		Sleep(20)
		Say(icl,"[SC_423562_13]")	--依崔妮:關於原因，也許等一切真相大白之後，你們就會瞭解了。
		Sleep(20)
		Say(DM,"[SC_423562_14]")	--那好吧，我們也只好等到真相大白的那天。
		Sleep(3)
		AdjustFaceDir ( DM, icl ,0 )
		Sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 給予旗標
		break								--在最後面記得加break中斷
	end
end

function Lua_423562_break()					--這段戲中斷/結束時要作的事情
	local DM = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116275, 150, 0 )--搜尋附近參加的NPC演員
	local BS = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116276, 150, 0 )
	local GT = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116277, 150, 0 )
	local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116274, 150, 0 )
	local SM1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116279, 150, 0 )
	local BK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116273, 150, 0 )
	
	if DM ~= nil then delobj(DM) end							--如果存在 則刪除
	if BS ~= nil then delobj(BS) end
	if GT ~= nil then delobj(GT) end
	if icl ~= nil then delobj(icl) end
	if SM1 ~= nil then 
		for i=0, table.getn(SM1) do
			delobj(SM1[i]) end
		end
	if BK ~= nil then delobj(BK) end
	local obj = ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
	ks_SetController( obj )--設定隱形控制物件
end

------------------------------------------------------------------------------------------------