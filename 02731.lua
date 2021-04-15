
--SC_FAIRYTALE2012_SASA_01~06
--241639--牛搖鈴
--850370--畜牧
--623324--被畜牧中
--121266--傑克．喬斯
--121267--牛
--781181--旗標1~15 = 生牛 , 16 = 到達處 , 17 = 生柵欄
--546877--牛隻順利回到牛圈
--546901--完成牧牛任務
--546902--拿過牛搖鈴
--107205--木柵欄
--106823--水槽
--107209--帶回的牛隻
-----------------------------------------------對話

--※ NPC ※--

function sasa_Fairytale_npc01()
	LoadQuestOption(OwnerID())
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Ok = CheckFlag( OID , 546901 )		--完成任務旗標
	if Ok == false then							--如果沒有完成任務旗標
		--SetSpeakDetail( OID , "HELP" )   --對話
		--AddSpeakOption( OID , OID , "[SC_0908SEANSON_60]" , "LuaN_mika_09summerlove_good_story" , 0 )
		--SC_FAIRYTALE2012_SASA_01
		--我想知道<CB>童話節</CB>的由來
		AddSpeakOption( OID , OID , "[SC_FAIRYTALE2012_SASA_02]" , "sasa_Fairytale_npc02" , 0 )
		--如何驅趕牛隻
	elseif Ok == true then
		--SetSpeakDetail( OID , "HELP" )   --對話
		--AddSpeakOption( OID , OID , "[SC_0908SEANSON_60]" , "LuaN_mika_09summerlove_good_story" , 0 )
		--SC_FAIRYTALE2012_SASA_01
		--我想知道<CB>童話節</CB>的由來
		AddSpeakOption( OID , OID , "[SC_FAIRYTALE2012_SASA_02]" , "sasa_Fairytale_npc02" , 0 )
		--如何驅趕牛隻

		-- 2013. 07.23 6.0.1 版本起 新增台版需求 - 遮蔽重置選項 -----------
		local Language = GetServerDataLanguage() 
	--	if Language ~= "rw" then  -- 沒有重置選項 測試用
		if Language ~= "tw" then  -- 沒有重置選項 正式版
			AddSpeakOption( OID , TID , "[SC_FAIRYTALE2012_SASA_04]" , "sasa_Fairytale_again01" , 0 )  --我想再幫你一次
		end
	end
end

function sasa_Fairytale_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	SetSpeakDetail( OID , "[SC_FAIRYTALE2012_SASA_03]" )   --如何趕牛
	--1. 首先，必須先對牛使用鈴鐺，讓牛隻辨別主人。
	--2. 站在牛的背後附近移動。（勿距離太遠，以免牛不肯移動或亂走。）
	--3. 將牛趕進牛圈內即可。
	
	--<CS>注意：牛身上的鈴聲必須時時刻刻保持，以免牛隻跑掉。</CS>
	AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Fairytale_npc01" , 0 )    --back
	--回上一頁
end

function sasa_Fairytale_again01()	--我想兌換童話節重置券
	SetSpeakDetail( OwnerID(), "[SC_FAIRYTALE2012_SASA_05]"   )
	--謝謝你願意幫我，可是鈴鐺內的特殊鈴石剛剛摔壞了…可以請你拿<CN>[203784]</CN>來給我嗎？我馬上做一個新的！
	AddSpeakOption( OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "sasa_Fairytale_again02" , 0 ) 
	--確定
end

function sasa_Fairytale_again02()	--確定重置
	CloseSpeak(OwnerID())
	local item = CountBodyItem( OwnerID() , 203784 )  --公會城堡傳送石
	if item >= 1 then
		SetFlag( OwnerID() , 546901 , 0 )		--重置
		--GiveBodyItem( OwnerID() , 240043 , 1 )	--重置券
		DelBodyItem( OwnerID() , 203784 , 1 )	--公會城堡傳送石
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FAIRYTALE2012_SASA_08]" , C_YELLOW )
		--鈴鐺修好了，你真的要幫我嗎？
	else
		ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_112503_NO]" , 0 )  --你所持的物品數量不足喔！
		ScriptMessage( OwnerID() ,  OwnerID() , 0 , "[SC_112503_NO]" , 0 )  --你所持的物品數量不足喔！
	end
end

function sasa_121267_Bullsay()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	SetSpeakDetail( OID , "[SC_FAIRYTALE2012_SASA_06]" )
	--哞哞…
end

function sasa_Fairytale_npcgive()	--當接下任務執行劇情
	local Getring = CheckFlag( TargetID() , 546902 )	--牛搖鈴FLAG
	if Getring == false then							--如果沒有牛搖鈴FLAG
		GiveBodyItem( TargetID() , 241639 , 1 )			--牛搖鈴
		Setflag( TargetID() , 546902 , 1 )				--給FLAG
	end
end

function sasa_Fairytale_reward()	--完成任務
	local Player = TargetID()
	Setflag( Player , 546901 , 1 )		--完成任務KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 121266 , "Fairytale Farm Boy Lv"..Lv )
	Sleep(20)
	Lua_Festival_08_All(Player)
	--[[local TID = Player  
	--< OID後方請請填入該活動中是"玩家"的變數,  例如 Local OID = player
	-- 如果此段的OwnerID 為玩家則不需更改
	local allcount = 3	--所有新活動數量
	local count = 0
	local keylist =  {
		546901,	--牧牛少年
		541322,	--話劇大賞
		546907	--討伐巨龍
			}
	for i = 1 , table.getn(keylist) do
		if Checkflag( Player , keylist[i] )  == true then
			count = count + 1
		end
		if i == table.getn(keylist) then
			if count == allcount then	--如果完成全部
				lua_mika_festivalbuffgive( Player , 0 )		--2012. 8月童話節活動為等級0
			end
		end
	end]]--
end

------------------------------以上---------任務區-----

-----控制器-----------以下----------------------------

function sasa_Fairytale_BullandCtrl()	--生牛+柵欄生成器+達陣區
	--Say( OwnerID() , "Come the Bull!" )
	Beginplot( OwnerID() , "sasa_Fairytale_BullBorn" , 0 )		--牛
--	Sleep(10)
	--Say( OwnerID() , "Ctrl to live!" )
	--Beginplot( OwnerID() , "sasa_Fairytale_CtrlRange" , 0 )		--控制距離
	--Sleep(10)
	--Say( OwnerID() , "Get done!" )
	--Beginplot( OwnerID() , "sasa_Fairytale_GetDone" , 0 )		--達陣
end

--※ 柵欄生成器 ※--
--[[function sasa_Fairytale_CtrlRange()
	local Ctrl = CreateObjByFlag( 121268 , 781181 , 17 , 1 )
	Beginplot( Ctrl , "sasa_107205_wood" , 0 )
end]]--

--※ 柵欄+水槽 ※--
function sasa_107205_wood()
	Lua_Hao_Round_wall( OwnerID() , 107205 , 12 , 120 , 0 )		--實際11
	Sleep(10)
	Lua_Hao_Round_wall( OwnerID() , 106823 , 12 , 95 , 0 )		--實際7
end

-- 2015.08.28 阿浩，新增適用於此 Script 編號的全域(其他編號無法存取)，防呆機制，避免乳牛無故消失的問題
local g_CowList = {};	-- 當前乳牛清單

-------------------------------------------------------------------
--※ 生牛區 ※--
function sasa_Fairytale_BullBorn()

	-- 2015.08.28 阿浩：防呆機制，避免乳牛無故消失的問題
	local Zone = ReadRoleValue( OwnerID(), EM_RoleValue_RealZoneID );	-- 真實區域(不去分流)
	g_CowList[Zone] = {};
	--

	local Control = CreateObjByFlag( 121268 , 781181 , 17 , 1 )		--達陣區
	SetModeEx( Control , EM_SetModeType_Searchenemy , false )	--索敵
	SetModeEx( Control , EM_SetModeType_Mark , false )			--標記
	SetModeEx( Control , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Control , EM_SetModeType_Move , false )	--移動
	SetModeEx( Control , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( Control , EM_SetModeType_Strikback , false )	--反擊
	SetModeEx( Control , EM_SetModeType_Show , false )		--不秀出
	AddToPartition( Control , 0 )

	-- 2015.08.28 阿浩：防呆機制，避免乳牛無故消失的問題
	for i = 1 , 15 do
		sasa_Fairytale_BullBorn2( i , Control );
	end
	CallPlot( Control, "Hao_CheckCowCount", Control )
	Beginplot( Control, "sasa_Check5_OverOK" , 0 )
	-- 

end

-- 2015.08.28 阿浩，新增適用於此 Script 編號的全域(其他編號無法存取)，防呆機制，避免乳牛無故消失的問題
function Hao_CheckCowCount( Control )

	local Zone = ReadRoleValue( Control, EM_RoleValue_RealZoneID );	-- 真實區域(不去分流)

	while true do
		local CowList = #g_CowList[Zone];
		for i = 1, CowList do
			if not CheckID( g_CowList[Zone][i] ) then
			--	DebugMsg( 0, 0, "CowCount = "..CowList..", Born = "..i );
				sasa_Fairytale_BullBorn2( i , Control );
			end
		end
		Sleep(100);	-- 每 10 秒檢查一次牧牛是否有無故消失的問題，有的話將消失編號的牧牛重生
	end
end

function sasa_Fairytale_BullBorn2( Number , Control )
	local Bull = CreateObjByFlag( 121267 , 781181 , Number , 1 )
	SetModeEx( Bull , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Bull , EM_SetModeType_SearchenemyIgnore , false )		--被搜尋
	SetModeEx( Bull , EM_SetModeType_Obstruct , false )		--阻擋
	SetModeEx( Bull , EM_SetModeType_Fight , false )			--可砍殺攻擊
	SetModeEx( Bull , EM_SetModeType_Searchenemy , false )	--索敵
	SetModeEx( Bull , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Bull , EM_SetModeType_Move , true )			--移動
	SetModeEx( Bull , EM_SetModeType_HideName , true )		--名稱
	SetModeEx( Bull , EM_SetModeType_ShowRoleHead , true )	--頭像框
	AddToPartition( Bull , 0 )
	WriteRoleValue( Bull , EM_RoleValue_PID , Number )
	WriteRoleValue( Bull , EM_RoleValue_register10 , Control )

	-- 2015.08.28 阿浩：防呆機制，避免乳牛無故消失的問題
	local Zone = ReadRoleValue( Bull, EM_RoleValue_RealZoneID );	-- 真實區域(不去分流)
	g_CowList[Zone][Number] = Bull;
	--
	Beginplot( Bull , "sasa_Fairytale_BullAI" , 0 )
end

function sasa_Fairytale_BullAI()
	local MO = OwnerID()	--牛
	local Check = ReadRoleValue( MO , EM_RoleValue_register10 )	--判斷箱
	local MOGO = 623324		--被畜牧中
	local X = ReadRoleValue( MO , EM_RoleValue_X )
	local Y = ReadRoleValue( MO , EM_RoleValue_Y )
	local Z = ReadRoleValue( MO , EM_RoleValue_Z )
	local D = ReadRoleValue( MO , EM_RoleValue_Dir )
	local IsTamed = 0		--是否有被畜牧過	
	
	while 1 do
		if GetDistance( MO , Check ) >= 600 then
			ScriptMessage( MO , 0 , 1 , "[SC_FAIRYTALE2012_SASA_09]" , 0 )
			--你已經超過正常的牧牛範圍
			sasa_Fairytale_runaway();
		end
		if CheckBuff( MO , MOGO ) == true then	--有被畜牧中BUFF
			if IsTamed == 0 then
				IsTamed = 1
			end
		else								--身上沒有被畜牧中的buff
			local Range = 20 + rand(6)		--亂數移動範圍
			WriteRoleValue( MO  , EM_RoleValue_IsWalk , 2 )		--用走的
			--say( MO , "MO range = "..range )
			--sleep(30) 
			local Time = MoveDirect( MO , X+math.random(-Range,Range) , Y , Z+math.random(-Range,Range) );
			Sleep(Time);
			if IsTamed ~= 0 then			--有被畜牧過
				IsTamed = 0;
				sasa_Fairytale_runaway();
			end
		end
		sleep(10)
	end
end

--※ 牛跑+消失 ※--
function sasa_Fairytale_runaway()
	local FlagNum = ReadRoleValue( OwnerID() , EM_RoleValue_PID )   --讀取這隻牛是在幾號棋子出生的 
	local Check = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )	--判斷箱
	Npcsay( OwnerID() , "[SC_FAIRYTALE2012_SASA_06]" )
	--哞哞…
	--AdjustFaceDir( OwnerID() , Player , 180 )	--面向背對
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )	--用跑的
	WriteRoleValue( OwnerID() , EM_RoleValue_register1 , 0 )
	sleep(5)
	Lua_MoveLine( OwnerID() , 50 )	--參考物件，向前移動到Dis距離的位置(Dis填負數為向後移動)
	sleep(10)
	Hide(OwnerID())			
	sleep(50)	--5秒後出現
	sasa_Fairytale_BullBorn2(FlagNum , Check)
	Delobj(OwnerID())
	--Show( OwnerID() , 0 ) 
end

function sasa_Fairytale_Bull_Go()		--叫牛跑
	local Self = OwnerID()
	local MO = TargetID()	--牛
	local MOGO = 623324		--被畜牧中	
	local dis = Rand( 50 )    --有玩家則移動距離20-50
	if dis < 30 then
		dis = 30
	end
	--Say( MO , "go ="..dis )	
	AdjustFaceDir( MO , Self , 180 )			--面向背對
	WriteRoleValue( MO , EM_RoleValue_IsWalk , 1 )	--用走的
	sleep(5)
	Lua_MoveLine( MO , Dis )	--參考物件，向前移動到Dis距離的位置(Dis填負數為向後移動)
	sleep(10)	
end

function sasa_Fairytale_623324_Check()		--放在623324的檢查Lua
	local Self = OwnerID()
	local MO = TargetID()	--牛
	local MOGO = 623324		--被畜牧中
	local TakeMo = 107209	--帶回的牛隻
	local IsMyMo = 623341	--判斷是否是自己放牧的牛

	if CheckBuff( MO , MOGO ) == true then		--有被畜牧中BUFF
		local MOGO_Owner = star_BuffInfo( MO , MOGO , EM_BuffInfoType_OwnerID )		--檢查牛身上被畜牧中是誰放的
		if MOGO_Owner == Self then		--如果牛身上的被畜牧中是自己放的
			if CheckBuff( MO , 623329 ) == true then	--如果牛到達目的地
				if DW_CheckQuestAccept( "or" , Self , 425687 ) == true then	--任務QUEST
					DW_QietKillOne( Self , TakeMo )		--假象殺隱形物件取得牛隻條件
				end
				AddBuff( MO , 507956 , 0 , 10 )			--定住牛
				ScriptMessage( Self , Self , 1 , "[SC_FAIRYTALE2012_SASA_07]" , C_YELLOW )
				--牛隻在你的協助下回到了牛圈。
				return false
			else
				sasa_Fairytale_Bull_Go()	--叫牛跑
				return true
			end	
		else	
			return false
		end
	elseif CheckBuff( MO , IsMyMo ) == true then		--檢查是否是被自己放牧過的牛
		local IsMyMo_Owner = star_BuffInfo( MO , IsMyMo , EM_BuffInfoType_OwnerID )
		if IsMyMo_Owner == Self then
			return true
		else
			ScriptMessage( MO , 0 , 1 , "[SC_FAIRYTALE2012_SASA_10]" , 0 )
			--有人正在放牧這隻牛
			return false	
		end
	else
		sasa_Fairytale_Bull_Go()	--叫牛跑
		return true
	end
end

function sasa_Fairytale_623341_Check()		--放在623341的檢查Lua
	local Self = OwnerID()
	local MO = TargetID()	--牛
	local IsMyMo = 623341	--判斷是否是自己放牧的牛
	if CheckBuff( MO , IsMyMo ) == true then		--檢查是否是被自己放牧過的牛
		local IsMyMo_Owner = star_BuffInfo( MO , IsMyMo , EM_BuffInfoType_OwnerID )
		if IsMyMo_Owner == Self then
			return true
		else
			return false
		end	
	else
		return true
	end
end

function sasa_Fairytale_850370_Check()		--放在850370的檢查Lua
	local GID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )	--檢查施法目標的ID
	if GID == 121267 then		--是牛才可以施放
		return true
	elseif GID ~= 121267 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FAIRYTALE2012_SASA_01]" , 0 )
		--搖鈴時要對著牛使用…
		return false
	end
end

function sasa_Fairytale_Buff_623246()		--玩家畜牧中判定
	AddBuff( OwnerID() , 623246 , 0 , 6 )
end

--※ 達陣區 ※--
--已合併至生牛區裡

--※ 是否滿5隻 ※--
function sasa_Check5_OverOK()
	local ball = OwnerID()
	while 1 do
		sleep(10)
		CastSpellLV( ball , ball , 850380 , 0 )
	end
end