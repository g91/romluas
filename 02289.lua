-- Z13 任務  NPC劇情

function lua_mika_z13_117692touch()
	SetPlot( OwnerID() , "Touch" , "lua_mika_z13_117692touch2" , 50 )
end

function lua_mika_z13_117692touch2()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if BeginCastBarEvent( O_ID, T_ID,"[SC_117692_1]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_mika_z13_117692touch3" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
		return
	end
end

function lua_mika_z13_117692touch3(O_ID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	 -- 玩家
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
		--	ScriptMessage(O_ID, O_ID , 1 , "OK" , "0xffffff00" )  --BeginCastBar成功了。
		--	ScriptMessage(O_ID, O_ID , 0 , "OK" , "0xffffff00" )  

			local  buff = Checkbuff(OwnerID(), 509139 ) --buff
			local  Count = CountBodyItem(OwnerID(), 209217 ) --道具數量
			
			if buff == true then --有buff
				if Count  >= 10 then
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_117692_2]" , C_SYSTEM )	--畫面中間訊息  你已經採集到足夠數量的[209217]。
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_117692_2]" , C_SYSTEM )	--訊息欄
				else
					GiveBodyItem(OwnerID(), 209217, 1)  --回音元素
					Beginplot(TargetID(), "lua_mika_z13_117692touch4" , 0 )
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_117692_3]" , 0 )	--畫面中間訊息  周圍的[209217]似乎不足，無法採集。
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SSC_117692_3]" , 0 )	--訊息欄
			end

		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		--	ScriptMessage(O_ID, O_ID , 1 , "Fail" , "0xffffff00" )  --BeginCastBar失敗了。
		--	ScriptMessage(O_ID, O_ID , 0 , "Fail" , "0xffffff00" )  
		end
	end
end

function lua_mika_z13_117692touch4()
--	Say(OwnerID(), "11")  --npc
--	Say(TargetID(), "21")  --plyaer
	Hide(OwnerID() )
	local ran = rand(100)   
	if ran <= 30  then   -- 30
		Sleep(70)  --
	elseif ran >= 31 and ran <= 65  then   -- 35
		Sleep(100)  --
	elseif ran >= 66 and ran <= 85  then   -- 20
		Sleep(130)  --
	elseif ran >= 85 then   -- 15
		Sleep(150)  --
	end
	Show(OwnerID(), 0)
end



--z13支線(米佳) 荒原調查營地
--questid : 424001 / 相關npc : 117924

--字串
--測試訊息say

function lua_mika_z13_117924_0()
	LoadQuestOption( OwnerID() ) --讀取npc任務
	if CheckFlag(OwnerID(), 544953 ) == false and CheckAcceptQuest( OwnerID(), 424001 ) == true  then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_08]" , "lua_mika_z13_117924_00", 0 ) --試著阻止暴走
	end
end

function lua_mika_z13_117924_00()
	SetSpeakDetail( OwnerID(), "[SC_Z13_117924_00]"   )   -- (控制器上有許多按鈕...，要按哪一個好呢？)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_01]" , "lua_mika_z13_117924_1", 0 ) --上
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_02]" , "lua_mika_z13_117924_2", 0 ) --下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_03]" , "lua_mika_z13_117924_1", 0 ) --左
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_04]" , "lua_mika_z13_117924_2", 0 ) --右
end

function lua_mika_z13_117924_1()
	local Key1 = CheckFlag(OwnerID(), 544951 )
	local Key2 = CheckFlag(OwnerID(), 544952 )
--	Say(OwnerID(), "OwnerID2" )   --player
--	Say(TargetID(), "TargetID2" )  --米拉克
--	Say( OwnerID(), "1" )
	if Key2 == TRUE then
	--	Say( OwnerID(), "key2" )
		local R =  RAND(100)+1
		if R <= 85 then  -------失敗
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --似乎選擇了錯誤的按鈕，沒有任何反應！
		else  --成功
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			BeginPlot(TargetID(), "lua_mika_z13_117924_ok" , 0 )  --成功事件
		end
	elseif Key1 == TRUE then
	--	Say( OwnerID(), "key1" )
		local R =  RAND(100)+1
		if R <= 75 then  -------失敗
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --似乎選擇了錯誤的按鈕，沒有任何反應！
		else  --成功
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			SetFlag( OwnerID(), 544952, 1 ) --KEY2
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_062]" , C_SYSTEM )  --你選擇的按鈕是正確的！還剩下1次就能成功解除。
		end
	else
	--	Say( OwnerID(), "key0" )
		local R =  RAND(100)+1
		if R <= 50 then  -------失敗
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --似乎選擇了錯誤的按鈕，沒有任何反應！
		else  --成功
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			SetFlag( OwnerID(), 544951, 1 ) --KEY1
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_061]" , C_SYSTEM )  --你選擇的按鈕是正確的！還剩下2次就能成功解除。
		end
	end
end

function lua_mika_z13_117924_2()  --set2
	local Key1 = CheckFlag(OwnerID(), 544951 )
	local Key2 = CheckFlag(OwnerID(), 544952 )
--	Say( OwnerID(), "2" )
	if Key2 == TRUE then
	--	Say( OwnerID(), "key2" )
		local R =  RAND(100)+1
		if R <= 80 then  -------失敗
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --似乎選擇了錯誤的按鈕，沒有任何反應！
		else  --成功
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			BeginPlot(TargetID(), "lua_mika_z13_117924_ok" , 0 )  --成功事件
		end
	elseif Key1 == TRUE then   -- 2nd
	--	Say( OwnerID(), "key1" )
		local R =  RAND(100)+1
		if R <= 70 then  -------失敗
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --似乎選擇了錯誤的按鈕，沒有任何反應！
		else  --成功
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			SetFlag( OwnerID(), 544952, 1 ) --KEY2
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_062]" , C_SYSTEM )  --你選擇的按鈕是正確的！還剩下1次就能成功解除。
		end
	else
--		Say( OwnerID(), "key0" )
		local R =  RAND(100)+1
		if R <= 60 then  -------失敗
	--		Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --似乎選擇了錯誤的按鈕，沒有任何反應！
		else  --成功
	--		Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --關閉視窗
			SetFlag( OwnerID(), 544951, 1 ) --KEY1
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_061]" , C_SYSTEM )  --你選擇的按鈕是正確的！還剩下2次就能成功解除。
		end
	end
end

function lua_mika_z13_117924_ok()
--	Say(OwnerID(), "OwnerID" )   ---米拉克
--	Say(TargetID(), "TargetID" )  ---playe
	ScriptMessage( TargetID() ,  TargetID(), 1, "[SC_Z13_117924_09]" , C_SYSTEM )  
	SetFlag( TargetID(), 544953, 1 ) --KEY

end

function lua_mika_424001_finish()
	CastSpell(TargetID(), TargetID(), 494640 ) --CastSpell 爆炸
	SetFlag( TargetID(), 544954, 1 ) --KEY
	ScriptMessage( TargetID() ,  TargetID(), 1, "[SC_Z13_117924_07]" , C_SYSTEM )  
end

function lua_mika_423992_finish() -- 完成  叫醒這傢伙 任務劇情
	Setflag(TargetID(), 544948 ,1 ) -- 給予 看不見損壞制裁者KEY
end

function lua_mika_423994_finish() -- 完成  缺少的零件 任務劇情
	Setflag(TargetID(), 544949 ,1 ) -- 給予 看得見米拉克 KEY
end

function lua_mika_423998_finish() -- 完成  太荒唐了！ 任務劇情
	Setflag(TargetID(), 544949 ,0  ) -- 刪除 看得見米拉克 KEY
end

function lua_mika_424002_finish()
	Setflag(TargetID(), 544954 ,0 ) -- 刪除 看得見殘骸的key
end
