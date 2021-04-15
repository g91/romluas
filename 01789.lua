
function Hsiang_DebugSay( ID , Str  )
	Say( ID , Str );
end

--設定buff
function Hsiang_AssistMagic(  MagicBaseID , Time  )
	AssistMagic( OwnerID()  , MagicBaseID , Time )
end

--招喚寵物時的劇情
function lua_mika_pettest01() --基本法術 506407 執行
	BeginPlot(OwnerID(), "Hao_Pet_SetModeEx", 0 )
	AssistMagic( OwnerID()  , 506591 ,  3600000 )
--	Say(OwnerID(), "OwnerID") --玩家
--	Say(TargetID(), "TargetID") --寵物
end

function Hsiang_PetOntimeScript() --掛在法術集合 495585 檢查法術 使用檢查Lua
--	Say( OwnerID() , "TEST"  )
	Hsiang_GuildPetProc() --事件觸發
	return false;
end

--產生新手指導寵物
function Hsiang_CreateGuildPet()
	SysCastSpellLv( OwnerID() , OwnerID() , 495393 , 0  )
end

--新手寵物 角色登入處理劇情
function Hsiang_GuildPetProc_PlayerLogin()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV ) --讀取玩家的主職等級
	if PlayerLV <= 30 then
		Beginplot( OwnerID() , GuildPetProc_PlayerLogin_Language , 300 )
		Addbuff( OwnerID(), 622704, 0 , -1 )  -- 給予贖罪券判斷用 BUFF 5.0.0 新增
	end
end

--各語系觸發劇情
function Hsiang_GuildPetProc_PlayerLogin_None()
--	Tell ( OwnerID() ,  TargetID(),  "Hsiang_GuildPetProc_PlayerLogin_None" )	
end

function Hsiang_GuildPetProc_PlayerLogin_rw() --runewaker內部使用
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Cn()  --簡體中文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Tw()  --繁體中文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Eneu() -- 歐洲英文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

Function Hsiang_GuildPetProc_PlayerLogin_Enus()  --北美英文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_De()  --德文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Fr()  --法文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Es() --西班牙文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Pl() --波蘭文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

-------------------

function Hsiang_GuildPetProc_PlayerLogin_Ru()  --俄羅斯文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Kr()  --韓文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Jp()  --日文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Tr()  --土耳其文
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

--function Hsiang_GuildPetProc_PlayerLogin_Saes()  --中南美洲(西班牙)
function Hsiang_GuildPetProc_PlayerLogin_Sa()  --中南美洲(西班牙)
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Sapt()  --中南美洲(葡萄牙
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Id()  --印尼
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Ae()  --中東
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end


function Hsiang_GuildPetProc_PlayerLogin_Vn()  --越南
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Ph()  --菲律賓
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Th()  --泰國
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Sg()  --新加坡
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- 沒有新手寵物道具
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --歡迎你加入遊戲，背包內提供的[207051]可用於召喚或收回[113199]。
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]能在遊戲初期提供你各種有用的協助。
			SetFlag(OwnerID(), 543807,1)
		end
	end
end



function lua_mika_serverlanguage() --顯示目前server的語系
	local Language = GetServerDataLanguage() 
	say(OwnerID(), Language)
end

--新手指導寵物事件資料標準化
function Hsiang_GuildPet_Init()

		--GuildPetProc_PlayerLogin_Language 全域登入事件

		local Language = GetServerDataLanguage() 		           --抓取目前server的語系
		local LanguageFunc = {}
		LanguageFunc[ "rw"]  = "Hsiang_GuildPetProc_PlayerLogin_rw";
		LanguageFunc[ "cn"]  = "Hsiang_GuildPetProc_PlayerLogin_Cn";
		LanguageFunc[ "tw"]  = "Hsiang_GuildPetProc_PlayerLogin_Tw";
		LanguageFunc[ "eneu"] = "Hsiang_GuildPetProc_PlayerLogin_Eneu";
		LanguageFunc[ "enus"]  = "Hsiang_GuildPetProc_PlayerLogin_Enus";
		LanguageFunc[ "de"]  = "Hsiang_GuildPetProc_PlayerLogin_De";
		LanguageFunc[ "fr"]  = "Hsiang_GuildPetProc_PlayerLogin_Fr";
		LanguageFunc[ "es"]  = "Hsiang_GuildPetProc_PlayerLogin_Es";
		LanguageFunc[ "pl"]  = "Hsiang_GuildPetProc_PlayerLogin_Pl";
		LanguageFunc[ "jp"]  = "Hsiang_GuildPetProc_PlayerLogin_Jp";
		LanguageFunc[ "id"]  = "Hsiang_GuildPetProc_PlayerLogin_Id";
		LanguageFunc[ "ae"]  = "Hsiang_GuildPetProc_PlayerLogin_Ae";
		LanguageFunc[ "vn"]  = "Hsiang_GuildPetProc_PlayerLogin_Vn";
		LanguageFunc[ "th"]  = "Hsiang_GuildPetProc_PlayerLogin_Th";
		LanguageFunc[ "ph"]  = "Hsiang_GuildPetProc_PlayerLogin_Ph";
		LanguageFunc[ "sg"]  = "Hsiang_GuildPetProc_PlayerLogin_Sg";
		LanguageFunc[ "kr"]  = "Hsiang_GuildPetProc_PlayerLogin_Kr";
		LanguageFunc[ "tr"]  = "Hsiang_GuildPetProc_PlayerLogin_Tr";
		LanguageFunc[ "sa"]  = "Hsiang_GuildPetProc_PlayerLogin_Sa";
		LanguageFunc[ "sapt"]  = "Hsiang_GuildPetProc_PlayerLogin_Sapt";
--		LanguageFunc[ "ru"]  = "Hsiang_GuildPetProc_PlayerLogin_Ru";


		if (LanguageFunc[Language ] ~= null ) then
			GuildPetProc_PlayerLogin_Language  = LanguageFunc[Language ];
		else
			GuildPetProc_PlayerLogin_Language = Hsiang_GuildPetProc_PlayerLogin_None;
		end


	--{Minlv , maxlv,  ZoneID , MapID , 需求任務 , KeyItemID , Function }
-- example 	
--	local NormalEvent = {  {2, 2, 1, 10 , -1, 543833, lua_mika_newpet_event01 } 		
--		    ,{2,10,1 , 10 , 420666, 543841, lua_mika_newpet_qevent01 }  }
	local NormalEvent = {  {2, 2, -1, -1 , -1, 543833, lua_mika_newpet_event01 }, 
		    {4,4,-1 , -1 , -1, 543859, lua_mika_newpet_event06 } ,
		    {5,5,-1 , -1 , -1, 543834, lua_mika_newpet_event02 } ,
		    {7,7,-1 , -1 , -1, 543835, lua_mika_newpet_event03 }, 
		    {8,8,-1 , -1 , -1, 543836, lua_mika_newpet_event04 } ,
		    {11,11,-1 , -1 , -1, 543837, lua_mika_newpet_event05 }, 
		    {1,50,1 , -1 , 420666, 543841, lua_mika_newpet_event_hq01 },   --人類q1 初試身手
		    {1,50,1 , -1 , 421435, 543843, lua_mika_newpet_event_hq03 },   --人類q3 愛唱歌的伍德
		    {1,50,1 , -1 , 421437, 543844, lua_mika_newpet_event_hq04 },   --人類q4 受不了的愛麗絲
		    {1,50,1 , -1 , 420479, 543845, lua_mika_newpet_event_hq05 },   --人類q5 召喚魔物之血
		    {1,50,1 , -1 , 421449, 543846, lua_mika_newpet_event_hq06 },   --人類q6 懸賞:奇布卡的亡靈
		    {1,50,1 , -1 , 421448, 543847, lua_mika_newpet_event_hq06 },   --人類q7 懸賞:皮爾拉諾克的僕役
		    {1,50,1 , -1 , 421347, 543848, lua_mika_newpet_event_hq06 },   --人類q8 懸賞:貪吃鬼卡魯德
		    {1,50,-1 , -1 , 422242, 543849, lua_mika_newpet_event_eq01 } }  --精靈q1 精靈學院

	--[lv][index]={ ZoneID , MapID , 需求任務 , KeyItemID , Function }
	ToutorialPetLvEvent = {}
	
	for i = 1 , table.getn( NormalEvent ) do
		for j = NormalEvent[i][1] , NormalEvent[i][2]   do
			if ToutorialPetLvEvent[ j ] == nil then
				ToutorialPetLvEvent[ j ] = {}
	--			Hsiang_DebugSay( OwnerID() ,  "ToutorialPetLvEvent( "..j..") = {}")
			end
			
			local EventCount = table.getn( ToutorialPetLvEvent[ j ] );

	--		Hsiang_DebugSay( OwnerID() ,  "push ToutorialPetLvEvent( ".. j .. " )( " .. EventCount+1 .. ")"  )
			ToutorialPetLvEvent[ j ][ EventCount+1 ] = { NormalEvent[i][3] , NormalEvent[i][4] , NormalEvent[i][5] ,NormalEvent[i][6] ,NormalEvent[i][7] }
		end
	end	

end


function  lua_mika_newpetspeak()  --hp低於20% 寵物說話
--	Say(OwnerID(), "O")  
--	Say(TargetID(), "T") 
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID ); --主人
	local PlayerRace = ReadRoleValue( MasterGUID , EM_RoleValue_RACE ) --主人的種族
	Tell ( MasterGUID , OwnerID() , GetString("SC_NEWPLAYERPET_PETHEAL") );	-- 主人，請讓我幫助你吧！
end

function Hsiang_GuildPetProc()  --事件觸發

	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	local MasterObj = Role:new( MasterGUID )
	local OwnerObj = Role:new( OwnerID() )
	local Level = MasterObj:Level();
	local ZoneID = MasterObj:ZoneID();
	local MapID = FindMapID( MasterObj:X() , MasterObj:Y() , MasterObj:Z() );
--	Hsiang_DebugSay( OwnerID() ,  "Master Lv  =" .. Level .. "  ZoneID=" .. ZoneID .. "  MapID=" .. MapID )
--	Say(OwnerID(), "PET")
--	Say(MasterGUID , "Master")

	local Lv =     ReadRoleValue( MasterGUID , EM_RoleValue_LV  ) --角色等級
	local NowHP = ReadRoleValue( MasterGUID , EM_RoleValue_HP ) --目前HP
	local MaxHP = ReadRoleValue( MasterGUID , EM_RoleValue_MaxHP) --最大HP
	local HPPercent = NowHP / MaxHP

	if Lv <= 10 then
		AddBuff(MasterGUID,509705,0,10)
		if ReadRoleValue(MasterGUID,EM_RoleValue_IsAttackMode) == 1 then
			AddBuff(MasterGUID,509706,0,10)
		end
	end

	if Lv <= 30 then
--		Say( OwnerID(), "HP = "..(HPPercent*100).."%" )
			if (  HPPercent  <= 0.2 ) then  
				CastSpell( OwnerID() , MasterGUID , 495664 )	-- 放法術(施法者,對象id,法術id) 
			end
			--2011 FN新增降低新手流失提案所增加檢查Buff
	end

	--等級事件
	local Event = ToutorialPetLvEvent[ Level ]

	if Event ~= nil then	
	--	Hsiang_DebugSay( OwnerID() ,  "Event Check Count= " ..  table.getn( Event ) )
		for i = 1 , table.getn( Event ) do
			if Hsiang_CheckGuildPetEvent( MasterGUID , Event[i]  , ZoneID , MapID  ) == true then

	--			Hsiang_DebugSay( OwnerID() ,  "Event OK QuestID=" .. Event[i][3]  )

				--執行事件
				Event[i][5]();
				--設定已處理旗標
				SetScriptFlag( MasterGUID , Event[i][4] , 1 );
			end	
		end
	end

	--升級檢查
	local LastProcLv = ReadRoleValue( MasterGUID , EM_LuaValueFlag_UseItem26 )

--	Hsiang_DebugSay( OwnerID() ,  "LastProcLv  =" .. LastProcLv )

	if LastProcLv < Level  then
		Hsiang_RoleLevelUp( Level  )
		WriteRoleValue( MasterGUID , EM_LuaValueFlag_UseItem26 , Level )
	end
end
function Hsiang_CheckGuildPetEvent( MasterGUID , Event , ZoneID , MapID )
	--Event{} = ZoneID , MapID , 需求任務 , KeyItemID , Function
	-- 區域檢查
	if Event[1] ~= -1 and Event[1] ~= ZoneID then
		return false
	end
	--檢查MapID
	if Event[2] ~= -1 and  Event[2] ~= MapID then
		return false;
	end
		
	--檢查重要物品
	if Event[4] ~= -1 and  CheckScriptFlag( MasterGUID , Event[4] ) == true then
--		say(MasterGUID, "Event[4]="..Event[4])
		return false;
	end
				
	--檢查需求任務
	if Event[3] ~= -1 and GetQuestState( MasterGUID , Event[3] ) == -1 then
	--	say(MasterGUID, "Event[3]="..Event[3])
		return false;
	end
	return true;
end

--升級事件
function Hsiang_RoleLevelUp( Lv )	
--	if Lv == 1 then
--		Say( OwnerID() , "Level 1" );
--	elseif Lv== 2 then
--		Say( OwnerID() , "Level 2" );
--	elseif Lv == 3 then 
--		Say( OwnerID() , "Level 3" );
--	end
--	Say(OwnerID(), "O")  --pet
--	Say(TargetID(), "T")  --pet

	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID ); --主人
	local PlayerRace = ReadRoleValue( MasterGUID , EM_RoleValue_RACE ) --主人的種族

	local MyZoneID =  ReadRoleValue(  MasterGUID , EM_RoleValue_ZoneID )  -- 主人的zone id (未處理分流)
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )  --主人的zone id (處理分流)
--	Say(OwnerID(), MyZoneID)
--	Say(OwnerID(), MyZone)

	if MyZone == 31 then
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106557]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106556]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106562]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106558]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106560]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106565]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106564]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[106566]][$SETVAR2=[106563]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106567]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[106670]][$SETVAR2=[106667]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[106666]][$SETVAR2=[106669]][$SETVAR3="..Lv.."]"  );
		-- 13之後和人類一樣
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
		end

	elseif MyZone == 13 then
	--	Say(OwnerID(), "zone 13")
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[105390]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[105390]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[105390]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105144]][$SETVAR2=[105140]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105144]][$SETVAR2=[105140]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105144]][$SETVAR2=[105140]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105143]][$SETVAR2=[105139]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105143]][$SETVAR2=[105139]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105139]][$SETVAR2=[105141]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105141]][$SETVAR2=[105193]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105141]][$SETVAR2=[105193]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105145]][$SETVAR2=[105142]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105145]][$SETVAR2=[105142]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105151]][$SETVAR2=[105150]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105151]][$SETVAR2=[105150]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105148]][$SETVAR2=[105147]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105148]][$SETVAR2=[105147]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105149]][$SETVAR2=[105146]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105149]][$SETVAR2=[105146]][$SETVAR3="..Lv.."]"  );
		end
	elseif  MyZone == 1 then -- 01-10 
	--	Say(OwnerID(), "zone 1")
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100054]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100146]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100061]][$SETVAR2=[100030]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100152]][$SETVAR2=[100203]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100055]][$SETVAR2=[100063]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100132]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100211]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
		end
	elseif MyZone == 12 then -- 01-10
--		Say(OwnerID(), "zone 12")
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101925]][$SETVAR2=[101924]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101926]][$SETVAR2=[101924]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101929]][$SETVAR2=[101926]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101932]][$SETVAR2=[101933]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101935]][$SETVAR2=[101936]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101936]][$SETVAR2=[101938]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101939]][$SETVAR2=[101937]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101942]][$SETVAR2=[101943]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101942]][$SETVAR2=[101943]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100132]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100211]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
		end
	elseif MyZone == 2 then  -- 11-20
	--	Say(OwnerID(), "zone 2")
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100054]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100146]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100061]][$SETVAR2=[100030]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100152]][$SETVAR2=[100203]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100055]][$SETVAR2=[100063]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100132]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100211]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
		end
	end
end