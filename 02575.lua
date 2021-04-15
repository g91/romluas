function Lua_ying_fireday_begin() --活動隱形物件

	local BOX = OwnerID()
	local ZoneID = ReadRoleValue( BOX , EM_RoleValue_RealZoneID ) --讀取隱藏物件位於哪個Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( BOX , 119551 , 100 , 0 ) --以隱藏物件114041為中心，向周圍100碼搜尋NPC伊桑119551
										       --(最後的0為Type，Type 0 的話會在只找到一個目標時回傳該目標，適用於已知數量目標)
										       --(1 的話則是無論找到幾個，都回傳整個群組，適用於未知數量目標)
	while true do

		local Hour = GetSystime(1) --取得現在時間：時
		local Min = GetSystime(2) --取得現在時間：分
		local PID

		if Hour == 12 or Hour== 15 or Hour == 18 or Hour == 21 then
			if Min == 0 then
				if ZoneID < 1000 then --(若ZoneID大於1000則為分流)
					RunningMsgEx( BOX , 2 , 3 , "[SC_FIREDAY_2012_1]" ) --銀湧之野上有許多動物正受到不明疫病侵害！凡瑞娜絲城門口的伊桑，正在徵求勇敢的冒險者前往協助動物們遠離疫情…
				end
				BeginPlot( BOX , "Lua_ying_fireday_monsterborn" , 0 )
				WriteRoleValue( NPC , EM_RoleValue_PID , 1 ) --可領取物品pid=1
--				PID = ReadRoleValue ( NPC , EM_RoleValue_PID )
--				Say( BOX , "PID = "..PID )
			elseif Min == 15 then
				if ZoneID < 1000 then
					RunningMsgEx( BOX , 2 , 3 , "[SC_FIREDAY_2012_2]" ) --因冒險者們的協助，散佈在動物們身上的不明疫病暫時獲得了緩和…
				end
				BeginPlot( BOX , "Lua_ying_fireday_delmonster" , 0 )
				WriteRoleValue( NPC , EM_RoleValue_PID , 0 ) --活動結束pid=0
--				PID = ReadRoleValue ( NPC , EM_RoleValue_PID )
--				Say( BOX , "PID = "..PID )
			end
		end
		Sleep(600) --1分鐘跑一次迴圈
	end
end
----------建立怪物------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_monsterborn()

	local Flag = 781068
	local Monster = { 103006 , 103007 , 103008 , 103009 }
	local Ani

	for j = 1 , 4 , 1 do
		for i = 0 , 9 , 1 do
			if j == 1 then
				Ani = CreateObjByFlag( Monster[j] , Flag , i , 1 ) --參照指定旗子的位置來產生物件(NPC編號、旗子代號、第幾號旗子、物件數量 )
			elseif j == 2 then
				Ani = CreateObjByFlag( Monster[j] , Flag , i+10 , 1 )
			elseif j == 3 then
				Ani = CreateObjByFlag( Monster[j] , Flag , i+20 , 1 )
			else
				local Random = DW_Rand(5)
				Ani = CreateObjByFlag( Monster[j] , Flag , 29+Random , 1 )
				SetModeEx( Ani , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
				SetModeEx( Ani , EM_SetModeType_Show , true ) --顯示
				SetFlag( Ani , 544801 , 1 )--關閉帕奇鼠
				AddToPartition( Ani , 0 )
				break
			end

			local X = ReadRoleValue( Ani , EM_RoleValue_X )
			local Y = ReadRoleValue( Ani , EM_RoleValue_Y )
			local Z = ReadRoleValue( Ani , EM_RoleValue_Z )

			WriteRoleValue( Ani , EM_RoleValue_Register1 , X )
			WriteRoleValue( Ani , EM_RoleValue_Register2 , Y )
			WriteRoleValue( Ani , EM_RoleValue_Register3 , Z )
			SetModeEx( Ani , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
			SetModeEx( Ani , EM_SetModeType_Revive , true )--可重生
			SetModeEx( Ani , EM_SetModeType_Show , true ) --顯示
			SetFlag( Ani , 544801 , 1 )--關閉帕奇鼠
			AddToPartition( Ani , 0 )
		end
	end
end
----------活動時間到刪除動物----------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_delmonster()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 103006 , 103007 , 103008 , 103009 }
	local Number = 0

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
		--	Obj=Role:New(ID)
		--	if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj(ID)
					end
				end
		--	end
		end
	end
end
----------小動物的物件產生劇情--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_add621299()

	local Monster = OwnerID()
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )
	local X = ReadRoleValue( Monster , EM_RoleValue_X )
	local Y = ReadRoleValue( Monster , EM_RoleValue_Y )
	local Z = ReadRoleValue( Monster , EM_RoleValue_Z )
	local MonsterID ={ }
	MonsterID[103006] = 1
	MonsterID[103007] = 3
	MonsterID[103008] = 5
	MonsterID[103009] = 10

	CancelBuff_NoEvent( Monster , 621299 )
	SetModeEx( Monster , EM_SetModeType_Move , true ) ---移動
	AddBuff( Monster , 621299 , MonsterID[OrgID]-1 , -1 ) --病毒感染BUFF
	WriteRoleValue( Monster , EM_RoleValue_PID , 0 ) --PID寫入0
	WriteRoleValue( Monster , EM_RoleValue_Register6 , 0 )
	WriteRoleValue( Monster , EM_RoleValue_Register7 , 0 )

	if OrgID == 103008 then
		AddBuff( Monster , 621807 , 0 , -1 ) --熊快跑
	end

	while true do
		local Reg = ReadRoleValue( Monster , EM_RoleValue_Register6 )
--		Say( Monster , "Reg="..Reg )
		if Reg == 0 then
			local Range = 70 +  rand(6) --亂數移動範圍
			local Random = Rand(6)+1 --1~6
			Sleep( Random*10 )
			MoveDirect( Monster , X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )
		else --Reg6 = 1
			break
		end
	end
end
----------戰鬥開始----------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_fight()

	local Monster = OwnerID()
	WriteRoleValue( Monster , EM_RoleValue_Register6 , 1 ) --Register6寫入，判斷是否戰鬥中
end
---------戰鬥結束------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_exitfight()

	CallPlot( OwnerID() , "Lua_ying_fireday_add621299" , 0 )
end
----------使用火焰粉末240509檢查LUA------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_240509check()

	local Monster = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )
	local PID = ReadRoleValue( Monster , EM_RoleValue_PID )
	local RegM = ReadRoleValue( Monster , EM_RoleValue_Register7 ) --怪物的Register7值
	local DBID = ReadRoleValue( Player , EM_RoleValue_DBID ) --玩家的DBID

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬
	if CheckID( Monster ) == true and ReadRoleValue( Monster , EM_RoleValue_IsDead ) == 0 then --目標存在
		if PID == 0 then --沒死
			if OrgID == 103006 or OrgID == 103007 or OrgID == 103008 or OrgID == 103009 then
				if RegM == 0 or RegM == DBID then
					if CheckBuff( Monster , 621299 ) == true then --有病毒BUFF
						return true
					else --沒有病毒BUFF
						ScriptMessage( Player , Player , 1 , "[SC_FIREDAY_2012_6]" ,  C_SYSTEM ) --此目標已淨化完成！
						return false
					end
				elseif RegM~= 0 and RegM ~= DBID then
					ScriptMessage( Player , Player , 1 , "[SC_FIREDAY_2012_7]" ,  C_SYSTEM ) --此目標正被淨化中！
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
				return false
			end
		elseif PID== 1 then --已死亡
			ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
			return false
		end
	else --目標不存在
		ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
		WriteRoleValue( Monster , EM_RoleValue_PID , 1 ) --死亡時PID寫入1
		return false
	end
end
---------使用火焰粉末240509後執行LUA----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_240509use()

	local Monster = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )
	local DBID = ReadRoleValue( Player , EM_RoleValue_DBID )
	local BuffLV = FN_CountBuffLevel( Monster , 621299 ) --動物身上病毒的層數
	local Ani = { 103007 , 103008 }
	local MonsterID ={ }
	MonsterID[103006] = 1 --分數 --松鼠
	MonsterID[103007] = 5 --狐狸
	MonsterID[103008] = 10 --熊
	MonsterID[103009] = 20 --帶原

	WriteRoleValue( Monster , EM_RoleValue_Register7 , DBID )
	CancelBuff( Monster , 621299 )
	if BuffLV > 0 then
		AddBuff( Monster , 621299 , BuffLV-1 , -1 )
	else
		WriteRoleValue( Monster , EM_RoleValue_Register7 , 0 )
		AddBuff( Player , 621298 , MonsterID[OrgID]-1 , 7200 )
		ScriptMessage( Player , Player , 0 , "[SC_FIREDAY_2012_8]" ,  C_SYSTEM ) --淨化完成！
		ScriptMessage( Player , Player , 1 , "[SC_FIREDAY_2012_8]" ,  C_SYSTEM ) --淨化完成！
		if OrgID == 103009 then
			if CountBodyItem( Player , 530865 ) < 1 then
				GiveBodyItem( Player , 530865 , 1 ) --噁心的綠色生物
			end
		end
--		AddBuff( Player , 621879 , 0 , 3 ) --脫離戰鬥
		Sleep(40)
		Hide( Monster )
		SetModeEx( Monster , EM_SetModeType_Move , true ) ---移動
		AddBuff( Player , 621879 , 0 , 3 ) --脫離戰鬥
		if OrgID == 103009 then
			DelObj( Monster )
		else
			KillID( Monster , Monster )
--			BeginPlot( Monster , "Lua_ying_fireday_createmoster" , 0 )
		end
	end

	if OrgID == 103007 or 103008 or 103009 then
		CastSpell( Player , Monster , 498402 )
	end
end
------------------------------------
function Lua_ying_fireday_createmoster()

	local Monster = OwnerID()
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )
	local X = ReadRoleValue( Monster , EM_RoleValue_Register1 )
	local Y = ReadRoleValue( Monster , EM_RoleValue_Register2 )
	local Z = ReadRoleValue( Monster , EM_RoleValue_Register3 )
	local Ani
--	Say( Monster , "X="..X.."Y="..Y.."Z="..Z )
	Ani = CreateObj( OrgID , X , Y , Z , 0 , 1 )
	SetModeEx( Ani , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
	SetModeEx( Ani , EM_SetModeType_Revive , true )--可重生
	SetFlag( Ani , 544801 , 1 )--關閉帕奇鼠
	Sleep(150)
	AddToPartition( Ani , 0 )
	DelObj( Monster )
end
----------498401淨化中_法術集合_使用檢查LUA--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_mot498401()
	local OID = OwnerID()
	local Type = GameObjInfo_Int( 498401, "ColdownType" ) -- 抓這個法術的冷卻類別(法術集合-施法冷卻次分類)

	if ReadRoleValue( OID, EM_RoleValue_Coldown_Item+Type ) == 0 then
		CallPlot( OID, "PlayMotion" , OID, ruFUSION_ACTORSTATE_CRAFTING_BEGIN ) --採集動作
		return true
	end
	return false
end
----------498973符文陷阱效果_法術集合_使用檢查LUA------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_498973check()

	local Trap = OwnerID()
	local Monster = TargetID()

	while true do
		local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )

		if OrgID == 103006 or 103007 or 103008 or 103009 then
			return true
		end
		Sleep(5)
	end
end
----------498467放陷阱_法術集合_使用檢查LUA-----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_mot498467()

	local OID = OwnerID()

	CallPlot( OID, "PlayMotion" , OID, ruFUSION_ACTORSTATE_CROUCH_BEGIN ) --蹲下動作
	CallPlot( OID , "Lua_ying_fireday_mot498467_01", 0 )
	return true
end
----------結束蹲下動作------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_mot498467_01()

	local OID = OwnerID()

	for i = 1 , 5 do
		if ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 0  then --未在施法中
			PlayMotion( OID , 150 ) --蹲下動作結束
			break
		end
		sleep(2)
	end
	PlayMotion( OID , 150 ) --蹲下動作結束
end
----------621819定身動物----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_621819()

	local Trap = OwnerID()
	local Monster = TargetID()

	SetModeEx( Monster , EM_SetModeType_Move , false ) ---不移動
	return true
end
----------621819結束時觸發------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_621819over()

	local Monster = OwnerID()

	SetModeEx( Monster , EM_SetModeType_Move , true ) ---移動
	return true
end
----------NPC伊桑(119551)對話劇情----------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_119551talk()

	local Player = OwnerID()
	local NPC = TargetID()
	local PID = ReadRoleValue ( NPC , EM_RoleValue_PID )

	AdjustFaceDir( NPC , Player , 0 ) --NPC面向玩家
	if PID == 1 then --活動開始可領取道具
		LoadQuestOption( Player )
		AddSpeakOption( Player , NPC , "[SC_FIREDAY_2012_4]" , "Lua_ying_fireday_guntrap" , 0 ) --請給我火焰粉末和符文陷阱！
	else --活動未開始
		LoadQuestOption( Player )
	end
	AddSpeakOption( Player , NPC , "[SC_FIREDAY_02]" , "Lua_ying_fireday_story", 0 ) --我想知道詠火節的由來
	AddSpeakOption( Player , NPC , "[SC_FIREDAY_2012_3]" , "Lua_ying_fireday_gamestory" , 0 ) --關於「淨化驅疫」選項
	AddSpeakOption( Player , NPC , "[SO_110111_2]" , "Lua_ying_fireday_givegift" , 0 ) --領取報酬
end
-------領取報酬----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_givegift()

	local Player = OwnerID()
	local Buff = CheckBuff( Player , 621298 ) --淨化值
	local BuffLV = FN_CountBuffLevel( Player , 621298 )

	if Buff == true then
		if BuffLV < 5 then -- 0~4 --遊戲中1~5
			GiveBodyItem( Player , 725654 , 1 ) --必爾汀藥水
		elseif BuffLV >= 5 and BuffLV < 15 then --5~14 --6~15
			GiveBodyItem( Player , 208918 , 1 ) --詠火節獎券
		elseif BuffLV >= 15 and BuffLV < 35 then --15~34 --16~35
			GiveBodyItem( Player , 208918 , 1 )
			GiveBodyItem( Player , 240377 , 1 ) --壁壘魔藥
		elseif BuffLV >= 35 and BuffLV < 60 then --35~59 --36~60
			GiveBodyItem( Player , 208918 , 2 )
		else --61以上
			GiveBodyItem( Player , 208918 , 2 )
			GiveBodyItem( Player , 208932 , 1 ) --能量5點
		end
		GiveBodyItem( Player , 240996 , 2 ) --冰冷符文
		CancelBuff( Player , 621298 ) --刪除淨化值
		CancelBuff( Player , 621833 ) --刪除好心人(報名BUFF)
	else
		ScriptMessage( TargetID() , Player , 1 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --你並不符合可領取條件！
		ScriptMessage( TargetID() , Player , 0 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --你並不符合可領取條件！
	end
	CloseSpeak( Player )
end
-------報名BUFF消失執行劇情---------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_aftercel621833()

	local Player = OwnerID()
	local Count = CountBodyItem( Player , 240510 ) --符文陷阱數量

	DelBodyItem( Player , 240509 , 1 ) --火焰粉末
	DelBodyItem( Player , 240510 , Count ) --符文陷阱
end
-------關於「淨化驅疫」-------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_gamestory()

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_FIREDAY_2012_9]" ) --每年的這個時候，銀湧之野上的動物們，總會被詭異綠色病毒纏身，經過長時間的研究，事情總算有點眉目了...
end
-------請給我火焰粉末和符文陷阱！-------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_guntrap()

	local Player = OwnerID()
	local Gun = CountBodyItem( Player , 240509 ) --火焰粉末
	local Trap = CountBodyItem( Player , 240510 ) --符文陷阱
	local Buff = CheckBuff( Player , 621833 ) --報名BUFF
	local Key = CheckFlag( Player , 546014 ) --已參加key

	if Buff == false and Key == true then
		SetSpeakDetail( Player , "[SC_THANKS_2011_5]" ) --你今天已經報名參與過此活動囉，請明天再繼續報名吧。
	elseif Buff == false and Key == false then
		GiveBodyItem( Player , 240510 , 20 )
		GiveBodyItem( Player , 240509 , 1 )
		SetFlag( Player , 546014 , 1 ) --給予參加key
		AddBuff( Player , 621833 , 0 ,  630 ) --報名BUFF
		CancelBuff_NoEvent( Player , 502030 ) --清除最終救贖BUFF
		CloseSpeak( Player ) --關閉對話視窗
	elseif Buff == true and Key == true then
		if Gun < 1 then
			GiveBodyItem( Player , 240509 , 1 )
			CloseSpeak( Player ) --關閉對話視窗
		elseif Gun >= 1 and Trap >= 1 then
			SetSpeakDetail( Player , "[SC_FIREDAY_2012_5]" ) --你已持有足夠的火焰粉末和符文陷阱！時間緊迫，趕緊前去淨化那些小動物吧～
		elseif Trap < 1 then
			SetSpeakDetail( Player , "[SC_FIREDAY_2012_10]" ) --你已領取過符文陷阱囉！
		end
	end
end
--------我想知道詠火節的由來--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_story()

	local Player = OwnerID()

	SetSpeakDetail( Player , "[SC_FIREDAY_01]" ) --從前，當霜雪紛飛、月光消失之際....
end
----------測試指令------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_test_gamebegin( Select ) -- Select 為0時，活動開始，Select 為1時，活動結束。

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID ) --讀取隱藏物件位於哪個Zone
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	local Reg
	local NPC = {}
	NPC[1] = LuaFunc_SearchNPCbyOrgID( Player , 114041 , 200 , 0 ) --BOX
	NPC[2] = LuaFunc_SearchNPCbyOrgID( Player , 119551 , 200 , 0 )
	
	if Select == 0 then
		if CheckID(NPC[1]) == true and CheckID(NPC[2]) == true then
			BeginPlot( NPC[1] , "Lua_ying_fireday_monsterborn" , 0 )
			WriteRoleValue( NPC[2] , EM_RoleValue_PID , 1 ) --可領取物品pid=1	
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷			
				RunningMsgEx( Player , 2 , 3 , "[SC_FIREDAY_2012_1]" ) --銀湧之野上有許多動物正受到不明疫病侵害！凡瑞娜絲城門口的伊桑，正在徵求勇敢的冒險者前往協助動物們遠離疫情…
			end
		else
			DebugMsg( Player , Room , "Error" )
		end
	elseif Select == 1 then
		if CheckID(NPC[1]) == true and CheckID(NPC[2]) == true then
			BeginPlot( NPC[1] , "Lua_ying_fireday_delmonster" , 0 )
			WriteRoleValue( NPC[2] , EM_RoleValue_PID , 0 ) --活動結束pid=0
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsgEx( Player , 2 , 3 , "[SC_FIREDAY_2012_2]" ) --因冒險者們的協助，散佈在動物們身上的不明疫病暫時獲得了緩和…
			end
		else
			DebugMsg( Player , Room , "Error" )
		end
	else
		DebugMsg( Player , Room , "Error" )
	end
end

function Lua_ying_test_621298add(BuffLV)

	CancelBuff( OwnerID() , 621298 )
	AddBuff( OwnerID() , 621298 , BuffLV-1 , 7200 )
end