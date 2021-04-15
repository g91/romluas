--702374  2011愛樂節物品,npc

Function LuaI_201388() 
	local itemset = { 13 ,""	, { 211833,1 }
                         	        , 26 ,""	, { 211834,1 }
		      , 39 ,""	, { 211835,1 }
		      , 52 ,""	, { 211836,1 }
		      , 64 ,""	, { 211837,1 } 
		      , 76 ,"" 	, { 211838,1 }
		      , 88 ,"" 	, { 211839,1 } 
		     , 100,""	, { 211840,1 } }

	return BaseTressureProc(   itemset , 1  )
end

---------------------------------------------------------------------------------------------------
function lua_mika_music_z15npc_0()	 --Z15  活動管理員  114948
	SetSpeakDetail(OwnerID(), "[SC_DAN_112698_1]" )                                   --活動管理員對話內容
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_2]", "lua_mika_music_z15npc_1", 0) --關於愛樂節背景
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112589_2]", "lua_mika_music_z15npc_2", 0) --關於禮品兌換方式     
end
---------------------------------------------------------------------------------------------------

function lua_mika_music_z15npc_1()  
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_5]") 				      --愛樂節背景內文
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_16]", "lua_mika_music_z15npc_11", 0) --更多愛樂節背景
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_0", 0)             --回到上一頁
end

function lua_mika_music_z15npc_11()
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_17]") 				   --愛樂節背景內文2
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_0", 0)          --回到上一頁
end
---------------------------------------------------------------------------------------------------
function lua_mika_music_z15npc_2()
	SetSpeakDetail(OwnerID(), "[SC_DAN_112589_6]" )	 --禮品兌換規則
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112589_3]", "lua_mika_music_z15npc_21", 0) --我要兌換茱莉雅禮盒 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_0", 0)         --回到上一頁
end

function lua_mika_music_z15npc_21() --兌換 茱莉雅禮盒
	local PlayerID = OwnerID()
	local Score = CountBodyItem( OwnerID() , 204457) --樂譜
	local Note  = CountBodyItem( OwnerID() , 204428) --音符
	if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
		if Score >= 15 and Note >= 15 then 
                       		SetSpeakDetail (OwnerID(), "[SC_111584_YU_27]" ) --謝謝你的幫忙！請收下這個禮物吧！
			DelBodyItem( OwnerID() , 204457 , 15 ) --刪掉樂譜15個
			DelBodyItem( OwnerID() , 204428 , 15 ) --刪掉音符15個
			GiveBodyItem( OwnerID() , 204427  , 1) --茱莉雅禮盒
			DesignLog( OwnerID() , 112698 , "exchage reward" ) -- 兌換獎勵
			----------------  額外有20% 機率給 公會資源 --------------
			local Random = rand(100)+1
			if Random > 80 then
				GiveBodyItem( PlayerID , 725449 , 1 )
			end
			-------------------------------------------------------------

			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_2", 0)--回到上一頁
		 else
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。			  	
			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_2", 0)--回到上一頁
		 end 
	else
       		 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_21]")  --您的背包空間不足，請清理一下再來吧。	
      		 AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "lua_mika_music_z15npc_2", 0 ) --回到上一頁       
	end
end