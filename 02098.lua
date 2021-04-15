
--==============================================================--

function Zone18_CropSet()--魔鬼爪
	local obj = OwnerID()
	Hide( obj )
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Obj , EM_SetModeType_Obstruct , true )			-- 阻擋
	SetModeEx( Obj , EM_SetModeType_Gravity , true )			-- 重力
	SetModeEx( Obj , EM_SetModeType_Mark , true )				-- 標記
	SetModeEx( Obj , EM_SetModeType_Move , false )				-- 移動
	SetModeEx( Obj , EM_SetModeType_Save , true )				-- 存檔
	SetModeEx( Obj , EM_SetModeType_Searchenemy , true )		-- 索敵
	SetModeEx( Obj , EM_SetModeType_HideName , true )			-- 名稱
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- 頭像框
	SetModeEx( Obj , EM_SetModeType_Fight , false )				-- 可砍殺攻擊
	Show( obj, 0 )
	AddBuff( obj, 507899, 0, -1 )--不可物理攻擊
end

function Zone18_StoneSet()--裝飾用共鳴石
	local obj = OwnerID()
	Hide( obj )
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Obj , EM_SetModeType_Obstruct , true )			-- 阻擋
	SetModeEx( Obj , EM_SetModeType_Gravity , true )			-- 重力
	SetModeEx( Obj , EM_SetModeType_Mark , false )				-- 標記
	SetModeEx( Obj , EM_SetModeType_Move , false )				-- 移動
	SetModeEx( Obj , EM_SetModeType_Save , true )				-- 存檔
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false )		-- 索敵
	SetModeEx( Obj , EM_SetModeType_HideName , true )			-- 名稱
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- 頭像框
	SetModeEx( Obj , EM_SetModeType_Fight , false )				-- 可砍殺攻擊
	Show( obj, 0 )
end

--===============================================================--

function Zone18_Lymun_Set()
	local obj = OwnerID()
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Obj , EM_SetModeType_Mark , false )				-- 標記
	SetModeEx( Obj , EM_SetModeType_Save , true )				-- 存檔
	SetModeEx( Obj , EM_SetModeType_HideName , true )			-- 名稱
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- 頭像框
end


--==============================================================--
--		地泉村						--
--===============================================================--

function Lua_116436_0()--伯克．泰德
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115038_010]","Lua_116436_1",0) --詢問發生什麼事
end

function Lua_116436_1()
	SetSpeakDetail(OwnerID(),"[SC_116436_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116436_0",0) --回上一頁
end

--===========================================================--

function Lua_116147_0()--達西姆．尤基里諾(委託NPC)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116147_0]","Lua_116147_1",0) --詢問亞基丁的肉塊
end

function Lua_116147_1()
	SetSpeakDetail(OwnerID(),"[SC_116147_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116147_0",0) --回上一頁
end

--===========================================================--

function Lua_116146_0()--凱莉．諾伊爾(委託NPC)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116146_00]","Lua_116146_1",0) --詢問黃金棺的傳說
end

function Lua_116146_1()
	SetSpeakDetail(OwnerID(),"[SC_116146_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116146_01]","Lua_116146_2",0) --詢問卡沃克之墓
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116146_0",0) --回上一頁
end

function Lua_116146_2()
	SetSpeakDetail(OwnerID(),"[SC_116146_1]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116146_1",0) --回上一頁
end

--===========================================================--

function Lua_116447_0()--湯姆‧霍特曼
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_ASK]","Lua_116447_1",0) --詢問原因
end

function Lua_116447_1()
	SetSpeakDetail(OwnerID(),"[SC_116447_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116447_00]","Lua_116447_2",0)--詢問共鳴石
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116447_0",0) --回上一頁
end

function Lua_116447_2()
	SetSpeakDetail(OwnerID(),"[SC_116447_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116447_1",0) --回上一頁
end

--===========================================================--

function Lua_116439_0()--伊米．馮恩
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116439_00]","Lua_116439_1",0) --詢問地泉村的由來
end

function Lua_116439_1()
	SetSpeakDetail(OwnerID(),"[SC_116439_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116439_01]","Lua_116439_2",0) --詢問湧泉上的祭壇
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116439_0",0) --回上一頁
end

function Lua_116439_2()
	SetSpeakDetail(OwnerID(),"[SC_116439_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116439_1",0) --回上一頁
end

--===========================================================--

function Lua_116450_0()--克林‧利爾
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_ASK]","Lua_116450_1",0) --詢問原因
end

function Lua_116450_1()
	SetSpeakDetail(OwnerID(),"[SC_116450_0]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116450_0",0) --回上一頁
end

--===========================================================--

function Lua_116452_0()--克林姆‧利齒
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116452_00]","Lua_116452_1",0) --詢問盜賊團
end

function Lua_116452_1()
	SetSpeakDetail(OwnerID(),"[SC_116452_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116452_01]","Lua_116452_2",0) --詢問腐眼一族
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116452_0",0) --回上一頁
end

function Lua_116452_2()
	SetSpeakDetail(OwnerID(),"[SC_116452_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116452_1",0) --回上一頁
end

--===========================================================--

function Lua_116441_0()--嘉里雅．安亞
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115038_010]","Lua_116441_1",0) --詢問發生什麼事
end

function Lua_116441_1()
	SetSpeakDetail(OwnerID(),"[SC_116441_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116441_0",0) --回上一頁
end


--==============================================================--
--		萊慕恩王國					--
--===============================================================--

function Lua_116621_0()--希爾斯．利爪
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116621_0]","Lua_116621_1",0) --詢問消失的原因
end

function Lua_116621_1()
	SetSpeakDetail(OwnerID(),"[SC_116621_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116621_0",0) --回上一頁
end

--===============================================================--

function Lua_116622_0()--密拉．捲毛
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116622_0]","Lua_116622_1",0) --詢問消失的原因
end

function Lua_116622_1()
	SetSpeakDetail(OwnerID(),"[SC_116622_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116622_00]", "Lua_116622_2",0) --繼續聆聽
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116622_0",0) --回上一頁
end

function Lua_116622_2()
	SetSpeakDetail(OwnerID(),"[SC_116622_2]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116622_1",0) --回上一頁
end

--===============================================================--

function Lua_116623_0()--米米斯．短尾
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_ASK]","Lua_116623_1",0) --詢問原因
end

function Lua_116623_1()
	SetSpeakDetail(OwnerID(),"[SC_116623_0]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116623_0",0) --回上一頁
end

--===============================================================--

