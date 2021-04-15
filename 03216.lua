--背景介紹
function Lua_na_124129()
	local Owner = OwnerID()
	local Target = TargetID()
	AdjustFaceDir(Target, Owner, 0 )
	SetSpeakDetail( Owner , "[SC_PHANTOM_STORY1]")
	AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION7]", "Lua_na_Phantom_Story1" , 0 )
	if CheckCompleteQuest( Owner , 427354 ) == false then
		AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION6]", "Lua_na_124129_1" , 0 ) --準備接任務
	end
	if CheckFlag( Owner , 540033) == true then
		AddSpeakOption( Owner , Owner , "[SC_PHANTOM_OPTION8]", "Lua_na_phantom_type" , 0 ) --關於幻靈類型
	end
		
end

function Lua_na_Phantom_Story1()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_PHANTOM_STORY2]")
	AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION4]", "Lua_na_Phantom_Story2" , 0 )
end

function Lua_na_Phantom_Story2()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_PHANTOM_STORY3]")
	AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION5]", "Lua_na_Phantom_Story3" , 0 )
	AddSpeakOption( Owner, Owner , "[SO_110068_2]", "Lua_na_Phantom_Story1" , 0 )
end

function Lua_na_Phantom_Story3()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_PHANTOM_STORY4]")
	if CheckCompleteQuest( Owner , 427354 ) == false then
		AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION6]", "Lua_na_124129_1" , 0 ) --準備接任務
	end
	AddSpeakOption( Owner, Owner , "[SO_110068_2]", "Lua_na_Phantom_Story2" , 0 )
end

function Lua_na_124129_1()
	local Owner = OwnerID()
	SetFlag( Owner , 540033 , 1 ) --給予接任務用旗標
	SetSpeakDetail( Owner , "[SC_PHANTOM_NPC_SPEAK7]") --現在就去找[124126]，她會告訴你進入鏡世界的方式。
end

function Lua_na_phantom_type()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_PHANTOM_TYPE_00]")  --幻靈的介紹　「幻靈」來自於維若蒂斯透過畫筆注入能量的圖卡
	if CheckCompleteQuest( Owner , 427354 ) == false then
		AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION6]", "Lua_na_124129_1" , 0 ) --準備接任務
	end
end


----------------------------------------------------------------
--隱密商人[124125]
function Lua_na_121270() --隱密商人中控器
	local Owner = OwnerID()
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	local ShopGuy
	local FlagGroup = 12
	local R = DW_Rand(FlagGroup)
	ShopGuy = CreateObjByFlag( 124125 , 781454, R , 1 ) --隨機位置產生NPC
	WriteRoleValue( Owner , EM_RoleValue_PID , R ) --避免重複在同一個位置出現，讓中控器記住旗標位置，寫入PID
	SetModeEx(ShopGuy, EM_SetModeType_Mark, true )--標記
	AddToPartition( ShopGuy, Room )
	while true do
		local hour = GetSystime(1) --時
		local min = GetSystime(2) --分
		if hour%2 == 0 then
			if min == 0 then
				local R1 = DW_Rand(11)
				local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
				DelObj( ShopGuy )
				Sleep(10)
				if R1 == PID then
					ShopGuy = CreateObjByFlag( 124125 , 781454, R1+1 , 1 ) --隨機位置產生NPC
					WriteRoleValue( Owner , EM_RoleValue_PID , R1+1 ) --避免重複在同一個位置出現，所以將目前旗標位置寫入PID
				else
					ShopGuy = CreateObjByFlag( 124125 , 781454, R1 , 1 ) --隨機位置產生NPC
					WriteRoleValue( Owner , EM_RoleValue_PID , R1 ) --避免重複在同一個位置出現，所以將目前旗標位置寫入PID
				end
				SetModeEx(ShopGuy, EM_SetModeType_Mark, true )--標記
				AddToPartition( ShopGuy, Room )
			end			
		end
		sleep(600)
	end
end


function Lua_na_124125_TALK()
	local Owner = OwnerID() --PLAYER
	local Target = TargetID() -- NPC
	if CheckQuest( Owner , 427355 , 0 ) == true or CountBodyItem( Owner , 243289) >= 1 or CheckFlag( Owner , 549361) == true or CheckFlag( Owner , 549372 ) == true then --玩家已購買過
		SetSpeakDetail( Owner, "[SC_PHANTOM_NPC_SPEAK6]")  --我這裡沒有你需要的東西！
	else
		SetSpeakDetail( Owner , "[SC_PHANTOM_NPC_SPEAK1]")
		AddSpeakOption( Owner, Owner , "[SC_PHANTOM_NPC_SPEAK5]" , "Lua_na_124125_OPTION" , 0 )
	end
end


function Lua_na_124125_OPTION()
	local Owner = OwnerID()
	if CheckFlag( Owner , 549361) == false then
		if CheckFlag( Owner , 549360) == true then
			SetSpeakDetail( Owner, "[SC_PHANTOM_NPC_SPEAK4]")  --你真夠死纏爛打的了！	
			AddSpeakOption( Owner , Owner, "[SO_OPENSHOP]" , "Lua_na_124125_Shop" , 0 )	--商店對話選項	
		elseif CheckFlag( Owner , 549359) == true then
			SetSpeakDetail( Owner, "[SC_PHANTOM_NPC_SPEAK3]")  --你怎麼又來了! 
			SetFlag( Owner , 549361 , 1 ) --每日
			SetFlag( Owner , 549360 , 1 ) --第二天
		else
			SetSpeakDetail( Owner, "[SC_PHANTOM_NPC_SPEAK2]")  --梵塞亞的工藝品？我不知道那是什麼！
			SetFlag( Owner , 549361 , 1 ) --每日
			SetFlag( Owner , 549359 , 1 ) --第一天
		end
	end
end

	
function Lua_na_124125_Shop()	--開啟梵塞亞飾品販售
	SetShop( TargetID() , 600586 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end


----------------------------------------------------------------------------------------------
--[任務劇情
function Lua_na_243290_open()
	local Owner = OwnerID()
	local Target = TargetID()
	Setflag ( Target , 549372, 1 ) --給予進入鏡世界的旗標
	ScriptMessage( Target, Target , 3 , "[SC_243290_USE]" , 0 ) --粉碎的梵塞爾銀葉，閃亮的粉末灑落身邊
	CastSpell( Owner, Target, 852232) --施放特效
end


function Lua_na_243291_use()
	BeginPlot( OwnerID() , "Lua_na_243291_use1", 0)
end


function Lua_na_243291_use1()
	local Owner =  OwnerID()
	local Phantom = { 104472 , 104482 , 104526 }	--繆思、琣朵、路金斐斯
	
	DialogCreate( Owner , EM_LuaDialogType_Select , "[SC_PHANTOM_TYPE_04]" )
	DialogSelectStr( Owner , "[SC_PHANTOM_OPTION1]" )  --浮動型幻靈
	DialogSelectStr( Owner , "[SC_PHANTOM_OPTION2]" )  --平穩型幻靈
	DialogSelectStr( Owner , "[SC_PHANTOM_OPTION3]" )  --深奧型幻靈

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --資料送出有問題
		return 0
	end

	local SelectID = Hsiang_GetDialogResoult( Owner );--企劃包起來的等待回覆用function

	if SelectID == 0 then 
		SetFlag( Owner , 549372, 1)
		GiveBodyItem( Owner , 200023 , 50)	--開啟幻靈指令，待置換 104526 路金斐斯
		delbodyitem( Owner , 243291 , 1)
	elseif SelectID == 1 then
		SetFlag( Owner , 549372, 1)
		GiveBodyItem( Owner , 200024 , 50)	--開啟幻靈指令，待置換 104482 琣朵
		delbodyitem( Owner , 243291 , 1)
	elseif SelectID == 2 then
		SetFlag( Owner , 549372, 1)
		GiveBodyItem( Owner , 200025 , 50)	--開啟幻靈指令，待置換 104472 繆恩
		delbodyitem( Owner , 243291 , 1)
	end
	DialogClose( Owner )
end


function Lua_na_243291_close()
	local Owner = OwnerID()
	DelBodyItem( Owner , 243291 , 1 )
	return false
end
----------------------------------------------------------------------------------------------
--鏡幻徽印商人 - 設定小地圖Icon
function LuaS_124126_0()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Magic)
end

--鏡幻徽印商人 - 對話
function YoYo_MirrorShopSpace_NPC124129()
	SetSpeakDetail( OwnerID() , "[SC_NPC124129_TALK]" )
	AddSpeakOption( OwnerID() , TargetID() , "[SC_240181_SHOP_02]" , "YoYo_OpenMirrorShop" , 5 )	--開啟商店選項
end

function YoYo_OpenMirrorShop()
	SetShop( TargetID() , 600559 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end
----------------------------------------------------------------------------------------------
--鏡世界與幻靈系統 - 前導任務登入提示訊息
function YoYo_Phantom_Remind()
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV ) >= 90 then	--玩家主職等級已滿90
		if CheckFlag( OwnerID() , 540033 ) == false then	--玩家尚未進入幻靈導引任務串
			ScriptMessage( OwnerID() , OwnerID() , 3 , "[SC_PHANTOM_REMIND]" , 0 )
		end
	end
end