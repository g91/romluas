
-- 節慶npc

-- 初始物件產生劇情
function Lua_mika_starpet_npcset()

	local NPC = OwnerID()

	local Orgid = ReadRoleValue(NPC, EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID )

	local Npcid = {
		120926, 120927, 120928, 120929, 120930, 120931,
		120932, 120933, 120934, 120935, 120936, 120937, 121913
			}

	local flagid = 781149

	local petlv2 = { 
		120938, 120939, 120940, 120941, 120942, 120943, 
		120944, 120945, 120946, 120947, 120948, 120949 , 121914
			}

	local petlv3 = {
		120950, 120951, 120952, 120953, 120954, 120955, 
		120956, 120957, 120958, 120959, 120960, 120961 , 121915
		}
 
	AddBuff(  NPC,  503217, 1, -1)   -- npc 節慶標誌

	for i = 1 , table.getn(petlv2) do 
		if npcid[i] == orgid then
		--	say(NPC, "month ="..i..", petid ="..petlv2[i] )
			local pet = CreateObjByFlag( petlv2[i], flagid, 0 , 1 );       
			SetModeEx( pet  , EM_SetModeType_HideName, true )--名稱
			SetModeEx( pet  , EM_SetModeType_Mark, true )--標記
			SetModeEx( pet  , EM_SetModeType_ShowRoleHead, true )--頭像框
			SetModeEx( pet  , EM_SetModeType_Move, false )--移動
			SetModeEx( pet  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( pet  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( pet  , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( pet  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( pet  , EM_SetModeType_Fight , false )--可砍殺攻擊
			AddToPartition( pet , RoomID )
			WriteRoleValue(pet, EM_RoleValue_Register, 0 )
			SetPlot( pet , "Touch" , "lua_mika_starpet_petpoint" , 30 );
			break
		end
	end
end

-- 點擊地圖上寵物npc劇情
function lua_mika_starpet_petpoint()
	local OID = OwnerID()   -- player
	local TID = TargetID()  -- npc
	local point = ReadRoleValue(TID, EM_RoleValue_Register )
	local Orgid = ReadRoleValue(TID, EM_RoleValue_OrgID )

	local Npcid = {
		120926, 120927, 120928, 120929, 120930, 120931,
		120932, 120933, 120934, 120935, 120936, 120937, 121913
			}

	local petlv2 = { 
		120938, 120939, 120940, 120941, 120942, 120943, 
		120944, 120945, 120946, 120947, 120948, 120949 , 121914
			}

	local petlv3 = {
		120950, 120951, 120952, 120953, 120954, 120955, 
		120956, 120957, 120958, 120959, 120960, 120961 , 121915
		}
 


	if point <= 9 then
	--	say(TID, "Less ")
		AddRoleValue(TID, EM_RoleValue_Register, 1 )	
		local point = ReadRoleValue(TID, EM_RoleValue_Register )
	--	say(TID, "point = "..point )

		local R = rand(100)+1  --  100
		if R < 41 then
			NPCSAY(TID, "[SC_STARPET_PETSAY01]")
		elseif R >= 41 and R >= 70 then
			NPCSAY(TID, "[SC_STARPET_PETSAY02]")
		else
			NPCSAY(TID, "[SC_STARPET_PETSAY03]")
		end
		Setplot(TID, "touch", "" , 0 )
		sleep(50)
		SetPlot( TID , "Touch" , "lua_mika_starpet_petpoint" , 30 );
	else
		Setplot(TID, "touch", "" , 0 )
		WriteRoleValue(TID, EM_RoleValue_Register, 0  )

		for i = 1, 12 do
			if petlv2[i] == Orgid then
				CastSpell(TID, TID, 499363 )  -- 效果
				ChangeObjID(TID, petlv3[i] )
				break
			end

		end
		sleep(50)

		for i = 1, 12 do
			if petlv2[i] == Orgid then
				CastSpell(TID, TID, 499362 )  -- 效果
				ChangeObjID(TID, petlv2[i] )
				break
			end
		end

		SetPlot( TID , "Touch" , "lua_mika_starpet_petpoint" , 30 );
	end



end

-- 星座寵物npc - 初始對話劇情 120926 ~ 120937 共用
function Lua_mika_starpet_npc01()

	local OID = OwnerID()  --player
	local TID = TargetID()
	local Key = Checkflag (OID, 541795 )  -- 檢查是否有魔幻寶盒功能開啟key

	SetSpeakDetail( OID , "[SC_STARPET_NPC01]" )   -- 對話
	-- 嗨，冒險者，你好，你看起來對我身邊的寵物龍似乎有興趣？    

	if Key == false then
		AddSpeakOption( OID , OID , "[SC_STARPET_NPC_OP01]" , "Lua_mika_starpet_npc02" , 0)   -- 魔幻寶盒是什麼
	end
	AddSpeakOption( OID , OID , "[SC_STARPET_NPC_OP02]" , "Lua_mika_starpet_npc03" , 0)   -- 如何使元素材料升階
	AddSpeakOption( OID , OID , "[SC_STARPET_NPC_OP03]" , "Lua_mika_starpet_npc04" , 0)   -- 如何進行星座寵物合成
	AddSpeakOption( OID , OID , "[SC_STARPET_NPC_OP04]" , "Lua_na_starpet_NO13" , 0)   -- 如何獲得特殊星座龍
	AddSpeakOption( OID , OID , "[SC_STARPET_EX_NPC]" , "Lua_na_StarPet_EX1" , 0)  --兌換幻獸結晶	
end


-- 星座寵物npc - 選項 - 魔幻寶盒是什麼
function Lua_mika_starpet_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()

	SetSpeakDetail( OID , "[SC_STARPET_NPC02]" )   
	-- 什麼？你竟然還沒使用過魔幻寶盒！ ...
	AddSpeakOption( OID, TID, "[SO_BACK]" , "Lua_mika_starpet_npc01", 0 ) --回到上一頁

end

-- 星座寵物npc - 選項 - 如何使元素材料升階
function Lua_mika_starpet_npc03()
	local OID = OwnerID()  --player
	local TID = TargetID()

	SetSpeakDetail( OID , "[SC_STARPET_NPC03]" )   
	-- <CS>元素</CS>可合成為<CS>星塵</CS>....
	AddSpeakOption( OID, TID, "[SO_BACK]" , "Lua_mika_starpet_npc01", 0 ) --回到上一頁

end

-- 星座寵物npc - 選項 - 如何進行星座寵物合成
function Lua_mika_starpet_npc04()
	local OID = OwnerID()  --player
	local TID = TargetID()

	SetSpeakDetail( OID , "[SC_STARPET_NPC04]" )   
	-- 首先你需要知道各[SC_STARPET_05]的對應屬性： ...
	AddSpeakOption( OID, TID, "[SO_BACK]" , "Lua_mika_starpet_npc01", 0 ) --回到上一頁

end

------------------ test command ----------------------

-- 清除所有星座寵相關keyitem
function lua_mika_starpet_test00()
	local OID = OwnerID()
	lua_mika_starpet_test01()
	lua_mika_starpet_test02()
	lua_mika_starpet_test03()
	Say(OID, "Delete ALL starpet keyitem OK !")
end


-- 清除所有lv2 星座寵紀錄技能的key x 72
function lua_mika_starpet_test01()
	local OID = OwnerID()
	local keylist = {
		546301, 546302, 546303, 546304, 546305, 546306, 546307, 546308, 546309, 546310, 
		546311, 546312, 546313, 546314, 546315, 546316, 546317, 546318, 546319, 546320, 
		546321, 546322, 546323, 546324, 546325, 546326, 546327, 546328, 546329, 546330, 
		546331, 546332, 546333, 546334, 546335, 546336, 546337, 546338, 546339, 546340, 
		546341, 546342, 546343, 546344, 546345, 546346, 546347, 546348, 546349, 546350, 
		546351, 546352, 546353, 546354, 546355, 546356, 546357, 546358, 546359, 546360, 
		546361, 546362, 546363, 546364, 546365, 546366, 546367, 546368, 546369,546370, 
		546371, 546372, 547543, 547544, 547545, 547546, 547547, 547548 
		}

	for i = 1, table.getn(keylist) do
		Setflag(OID, keylist[i], 0 )
	end
	Say(OID, "Delete all starpet LV2 skill keyitem OK !")	
end

-- 清除所有lv3 星座寵紀錄技能的key x108
function lua_mika_starpet_test02()
	local OID = OwnerID()
	local keylist = {
		546373, 546374, 546375, 546376, 546377, 546378, 546379, 546380, 
		546381, 546382, 546383, 546384, 546385, 546386, 546387, 546388, 546389, 546390, 
		546391, 546392, 546393, 546394, 546395, 546396, 546397, 546398, 546399, 546400,
		546401, 546402, 546403, 546404, 546405, 546406, 546407, 546408, 546409, 546410, 
		546411, 546412, 546413, 546414, 546415, 546416, 546417, 546418, 546419, 546420, 
		546421, 546422, 546423, 546424, 546425, 546426, 546427, 546428, 546429, 546430, 
		546431, 546432, 546433, 546434, 546435, 546436, 546437, 546438, 546439, 546440, 
		546441, 546442, 546443, 546444, 546445, 546446, 546447, 546448, 546449, 546450, 
		546451, 546452, 546453, 546454, 546455, 546456, 546457, 546458, 546459, 546460,
		546461, 546462, 546463, 546464, 546465, 546466, 546467, 546468, 546469, 546470, 
		546471, 546472, 546473, 546474, 546475, 546476, 546477, 546478, 546479, 546480,
		547549, 547550, 547551, 547552, 547553, 547554, 547555, 547556, 547557, 547532     
		}

	for i = 1, table.getn(keylist) do
		Setflag(OID, keylist[i], 0 )
	end
	Say(OID, "Delete all starpet LV3 skill keyitem OK !")	
end

-- 清除lv1 lv2 lv3 星座寵物每日使用keyitem x3
function lua_mika_starpet_test03()
	local OID = OwnerID()
	local keylist = { 546481, 546482, 546483 }

	for i = 1, table.getn(keylist) do
		Setflag(OID, keylist[i], 0 )
	end
	Say(OID, "Delete all starpet Everyday keyitem OK !")	
	
end