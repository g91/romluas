-- 史詩
function LuaS_421537_Check()
	if CountBodyItem( OwnerID() , 203354 ) < 1 then		-- 諾芙的小花頭飾
	 	return false
	end
	if CountBodyItem( OwnerID() , 203357 ) < 1 then		-- 諾芙的洋娃娃
	 	return false
	end
	if CountBodyItem( OwnerID() , 203368 ) < 1 then		-- 諾芙的項鍊
	 	return false
	end

	return true

end

function LuaS_421539_CHECK()	-- 不能重複拿寶箱
	if CheckFlag( OwnerID() , 542292 ) == true or CountBodyItem( OwnerID() , 203372 ) > 0 then
		--ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421539_1]" , 0 )	--  你沒有發現任何物品！！
		return false
	else
		return true
	end
end

function LuaS_421533_Complete()
	if CountBodyItem( TargetID() , 203355 ) >= 1 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_421533_1]" , C_SYSTEM )		--  牛皮紙上的尋寶線索更新了！！
		DelBodyItem( TargetID() , 203355 , 1 )
	else
	end
	return true
end

function LuaS_421536_Complete()
	if CountBodyItem( TargetID() , 203358 ) >= 1 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_421533_1]" , C_SYSTEM )		--  牛皮紙上的尋寶線索更新了！！
		DelBodyItem( TargetID() , 203358 , 1 )
	else
	end
	return true
end

function LuaS_421538_Complete()
	if CountBodyItem( TargetID() , 203369 ) >= 1 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_421533_1]" , C_SYSTEM )		--  牛皮紙上的尋寶線索更新了！！
		DelBodyItem( TargetID() , 203369 , 1 )
	else
	end
	return true
end

function LuaS_421539_Complete()
	if CountBodyItem( TargetID() , 203371 ) >= 1 then
		DelBodyItem( TargetID() , 203371 , 1 )
	else
	end
	return true
end

function LuaS_421537_Do()
	if DelBodyItem( OwnerID() , 203354 , 1 ) and DelBodyItem( OwnerID() , 203357 , 1 ) and DelBodyItem( OwnerID() , 203368 , 1 ) then		-- 諾芙的小花頭飾、 諾芙的洋娃娃、 諾芙的項鍊
		BeginPlot( OwnerID() , "LuaS_421537_Do_01" , 0 )
		CastSpell( TargetID() , TargetID() , 492217 )	-- 表演特效 水波
	end

	return true

end

function LuaS_421537_Do_01()
	Sleep( 20 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421537_01]" , C_SYSTEM )		-- 你聽到一聲自虛空傳來的低吼！！
end

function LuaS_421543_Complete()

	DisableQuest( OwnerID() , true )

	local NPC1 = CreateObjByFlag( 111818 , 780214 , 0 , 1 )
	AddToPartition( NPC1 , 0 )
	WriteRoleValue( NPC1 , EM_RoleValue_IsWalk , 0 )
	local X3 , Y3 , Z3
	X3 = GetMoveFlagValue( 780214 , 3 , EM_RoleValue_X )
	Y3 = GetMoveFlagValue( 780214 , 3 , EM_RoleValue_Y )
	Z3 = GetMoveFlagValue( 780214 , 3 , EM_RoleValue_Z )
	local Obj1 = Role:new( NPC1 )
	Obj1:Move(  X3 , Y3 , Z3  )
	Sleep( 5 )

	local NPC2 = CreateObjByFlag( 111819 , 780214 , 1 , 1 )
	AddToPartition( NPC2 , 0 )
	WriteRoleValue( NPC2 , EM_RoleValue_IsWalk , 0 )
	local X4 , Y4 , Z4
	X4 = GetMoveFlagValue( 780214 , 4 , EM_RoleValue_X )
	Y4 = GetMoveFlagValue( 780214 , 4 , EM_RoleValue_Y )
	Z4 = GetMoveFlagValue( 780214 , 4 , EM_RoleValue_Z )
	local Obj2 = Role:new( NPC2 )
	Obj2:Move(  X4 , Y4 , Z4  )
	Sleep( 5 )

	local NPC3 = CreateObjByFlag( 111822 , 780214 , 2 , 1 )
	AddToPartition( NPC3 , 0 )
	WriteRoleValue( NPC3 , EM_RoleValue_IsWalk , 0 )
	local X5 , Y5 , Z5
	X5 = GetMoveFlagValue( 780214 , 5 , EM_RoleValue_X )
	Y5 = GetMoveFlagValue( 780214 , 5 , EM_RoleValue_Y )
	Z5 = GetMoveFlagValue( 780214 , 5 , EM_RoleValue_Z )
	local Obj3 = Role:new( NPC3 )
	Obj3:Move(  X5 , Y5 , Z5  )

	Sleep( 70 )

	SetPosByFlag( NPC1 , 780214 , 3 )
	SetPosByFlag( NPC2 , 780214 , 4 )
	SetPosByFlag( NPC3 , 780214 , 5 )

	SetPosByFlag( OwnerID() , 780214 , 6 )

	Say( NPC1 , "[SC_421543_1]" )				-- 令人敬愛的議長大人，關於上次請求您一定要通過的議案...
	Sleep( 15 )
	Say( OwnerID() , "[SC_421543_2]" )				-- 十分抱歉，藍道斯，不是我不願意幫你這個忙，而是提案的通過，必須依靠整個議會投票表決，這也是議會存在的意義，不是嗎？
	Sleep( 30 )
	Say( NPC1 , "[SC_421543_3]" )				-- 我當然明白，但是議長大人，如果您能運用一下您議長的權力...
	Sleep( 30 )
	Say( OwnerID() , "[SC_421543_4]" )				-- 這我恐怕辦不到...
	Sleep( 20 )
	Say( NPC1 , "[SC_421543_5]" )				-- .........
	Sleep( 20 )
	Say( NPC1 , "[SC_421543_6]" )				-- 沒關係，但是對於這次的談話與接下來可能會發生的事情，在此，我先表達我的遺憾。
	Sleep( 30 )

	local X1 , Y1 , Z1
	X1 = GetMoveFlagValue( 780214 , 1 , EM_RoleValue_X )
	Y1 = GetMoveFlagValue( 780214 , 1 , EM_RoleValue_Y )
	Z1 = GetMoveFlagValue( 780214 , 1 , EM_RoleValue_Z )
	local Obj4 = Role:new( NPC2 )
	Obj4:Move(  X1 , Y1 , Z1  )
	Sleep( 5 )

	local X2 , Y2 , Z2
	X2 = GetMoveFlagValue( 780214 , 2 , EM_RoleValue_X )
	Y2 = GetMoveFlagValue( 780214 , 2 , EM_RoleValue_Y )
	Z2 = GetMoveFlagValue( 780214 , 2 , EM_RoleValue_Z )
	local Obj5 = Role:new( NPC3 )
	Obj5:Move(  X2 , Y2 , Z2  )
	Sleep( 5 )

	local X , Y , Z
	X = GetMoveFlagValue( 780214 , 0 , EM_RoleValue_X )
	Y = GetMoveFlagValue( 780214 , 0 , EM_RoleValue_Y )
	Z = GetMoveFlagValue( 780214 , 0 , EM_RoleValue_Z )
	local Obj6 = Role:new( NPC1 )
	Obj6:Move(  X , Y , Z  )

	Sleep( 55 )

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end
	if CheckID( NPC2 ) == true then DelObj( NPC2 ) end
	if CheckID( NPC3 ) == true then DelObj( NPC3 ) end

	DisableQuest( OwnerID() , false )
	Sleep( 5 )

	LuaFunc_ResetObj( OwnerID() )

	return true

end

function LuaS_111669()
	LoadQuestOption( OwnerID() )	--載入任務模板
	if CheckAcceptQuest( OwnerID() , 421544 ) == true and CheckFlag(OwnerID() , 542186 ) == false then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_421544_6]" , "LuaS_421544_About_1" , 0 )		-- 選項，關於藍道斯議員......
	end
end

function LuaS_421544_About_1()
	SetSpeakDetail( OwnerID() , "[SC_421544_7]" )		--是哈金議長要你過來調查的嗎？藍道斯議員應該在還在議會桌那邊，你可以過去看看。如果有人問起你的身份，你就說是來打掃的人就行了。
	AddSpeakOption( OwnerID() , TargetID() , "[SC_421544_8]" , "LuaS_421544_About_2" , 0 )		-- 選項，謝謝，我明白了！
end

function LuaS_421544_About_2()

	CloseSpeak( OwnerID() )
	SetFlag( OwnerID() , 542186 , 1 )
	Sleep( 10 )
	BeginPlot( TargetID() , "LuaS_421544_Complete" , 0 )

end

function LuaS_421544_Complete()

	DisableQuest( OwnerID() , true )

	local NPC1 = CreateObjByFlag( 111818 , 780215 , 0 , 1 )
	AddToPartition( NPC1 , 0 )

	local NPC2 = CreateObjByFlag( 111819 , 780215 , 1 , 1 )
	AddToPartition( NPC2 , 0 )

	local NPC3 = CreateObjByFlag( 111822 , 780215 , 2 , 1 )
	AddToPartition( NPC3 , 0 )

	Sleep( 20 )

	Say( NPC2 , "[SC_421544_1]" )				-- 藍道斯議員，我想該讓您明白一點，如果您無法順利讓這個提案通過的話，對於我們所給予您的資助，恐怕得暫停了！
	Sleep( 15 )
	Say( NPC1 , "[SC_421544_2]" )				-- 千萬別這麼說，目前只是稍微遭遇一些小挫折罷了，我會想法辦讓提案通過的。
	Sleep( 40 )
	Say( NPC3 , "[SC_421544_3]" )				-- 那麼，期待聽到您的好消息，如果真的不行，我想，我們會另外再找有能力的議員來合作。
	Sleep( 15 )
	Say( NPC2 , "[SC_421544_4]" )				-- 沒錯，您是知道的，有非常多的議員正期待著接受我們的資助。
	Sleep( 20 )
	Say( NPC1 , "[SC_421544_5]" )				-- .........我明白了。
	Sleep( 30 )

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end
	if CheckID( NPC2 ) == true then DelObj( NPC2 ) end
	if CheckID( NPC3 ) == true then DelObj( NPC3 ) end

	Sleep( 30 )

	DisableQuest( OwnerID() , false )

	return true

end

function LuaS_203380()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111679 , 44 )
	--local OBJ = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	--if OBJ == 111679 then
	--Say(OwnerID() , Tomb )
	if Tomb ~= -1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203380]" , 0 )	--  這附近沒有弗朗斯特隊長的墳墓！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203380]" , C_SYSTEM )	
		return false
	end
end

function LuaS_203380_1()
	SetFlag(OwnerID() , 542251 , 1 )
	UseItemDestroy()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111679 , 44 )
	BeginPlot( Tomb , "LuaS_421548_Complete" , 0 )
	return true
end

function LuaS_421548_Complete()

	Hide( OwnerID())

	local NPC1 = CreateObjByFlag( 111823 , 780216 , 3 , 1 )
	AddToPartition( NPC1 , 0 )

	local NPC2 = CreateObjByFlag( 111819 , 780216 , 1 , 1 )
	AddToPartition( NPC2 , 0 )

	local NPC3 = CreateObjByFlag( 111822 , 780216 , 2 , 1 )
	AddToPartition( NPC3 , 0 )

	Sleep( 20 )

	Say( NPC1 , "[SC_421548_1]" )				-- 是你們說那個飲料只會讓人昏迷，我才答應幫你們試驗藥效的！
	Sleep( 30 )
	Say( NPC1 , "[SC_421548_2]" )				-- 結果現在我的隊員們全部中毒身亡，你們說該怎麼辦！
	Sleep( 15 )
	Say( NPC2 , "[SC_421548_3]" )				-- 可能是劑量下得太重才會...
	Sleep( 30 )
	Say( NPC3 , "[SC_421548_4]" )				-- 事情已經發生了，你也不想讓這件事的真相傳出去吧？
	Sleep( 20 )
	Say( NPC3 , "[SC_421548_5]" )				-- 燒了吧！把這些屍體燒了。
	Sleep( 15 )
	Say( NPC1 , "[SC_421548_6]" )				-- 燒...！你要我燒了我的伙伴？！
	Sleep( 30 )
	Say( NPC2 , "[SC_421548_7]" )				-- 等等，有人來了，快離開這裡。
	Sleep( 30 )

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end
	if CheckID( NPC2 ) == true then DelObj( NPC2 ) end
	if CheckID( NPC3 ) == true then DelObj( NPC3 ) end

	Sleep( 30 )

	Show( OwnerID() , 0 )

	return true
end

function LuaS_421555_Complete()

	DisableQuest( OwnerID() , true )

	local NPC1 = CreateObjByFlag( 111699 , 780218 , 3 , 1 )
	AddToPartition( NPC1 , 0 )
	DisableQuest( NPC1 , true )

	local X1 , Y1 , Z1
	X1 = GetMoveFlagValue( 780218 , 1 , EM_RoleValue_X )
	Y1 = GetMoveFlagValue( 780218 , 1 , EM_RoleValue_Y )
	Z1 = GetMoveFlagValue( 780218 , 1 , EM_RoleValue_Z )
	local Obj1 = Role:new( NPC1 )
	Obj1:Move(  X1 , Y1 , Z1  )

	Sleep( 50 )

	SetPosByFlag( NPC1 , 780218 , 1 )
	SetPosByFlag( OwnerID() , 780218 , 2 )

	Sleep( 5 )
	Say( NPC1 , "[SC_421555_1]" )				-- 阿爾法特，你又再碰魔法了！
	Sleep( 15 )
	Say( OwnerID() , "[SC_421555_2]" )				-- 這不是魔法，這是薩倫德老師給我的新的符文力量！
	Sleep( 20 )
	Say( NPC1 , "[SC_421555_3]" )				-- 薩倫德！又是薩倫德！不是告訴你不要再跟他學東西了嗎？
	Sleep( 15 )
	Say( OwnerID() , "[SC_421555_4]" )				-- 可是，荷莉...
	Sleep( 10 )
	Say( NPC1 , "[SC_421555_5]" )				-- 我不想再聽你解釋！如果你再繼續無止盡的追求這些可怕力量，就永遠都別想再跟我說話！
	Sleep( 50 )

	local X , Y , Z
	X = GetMoveFlagValue( 780218 , 3 , EM_RoleValue_X )
	Y = GetMoveFlagValue( 780218 , 3 , EM_RoleValue_Y )
	Z = GetMoveFlagValue( 780218 , 3 , EM_RoleValue_Z )
	local Obj2 = Role:new( NPC1 )
	Obj2:Move(  X , Y , Z  )

	Sleep( 30 )

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end

	DisableQuest( NPC1 , false )
	DisableQuest( OwnerID() , false )
	Sleep( 5 )

	LuaFunc_ResetObj( OwnerID() )

	return true

end

function LuaS_421563_Complete()
	DisableQuest( OwnerID() , true )

	local NPC2 = CreateObjByFlag( 111819 , 780219 , 1 , 1 )
	AddToPartition( NPC2 , 0 )

	local NPC1 = CreateObjByFlag( 111822 , 780219 , 3 , 1 )
	AddToPartition( NPC1 , 0 )

	local NPC3 = CreateObjByFlag( 111819 , 780219 , 2 , 1 )
	AddToPartition( NPC3 , 0 )

	Say( NPC1 , "[SC_421563_1]" )				-- 就是他！！
	Sleep( 10 )
	Say( NPC2 , "[SC_421563_2]" )				-- 別讓他活著離開這裡！！
	Sleep( 10 )
	Say( NPC3 , "[SC_421563_3]" )				-- 殺了他！！
	Sleep( 10 )

	CastSpell( NPC1 , OwnerID() , 492224 )	-- 表演特效 火球術
	Sleep( 5 )
	CastSpell( NPC2 , OwnerID() , 492224 )	-- 表演特效 火球術
	Sleep( 5 )
	CastSpell( NPC3 , OwnerID() , 492224 )	-- 表演特效 火球術

	Sleep( 10 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )

	Sleep( 10 )

	Say( NPC1 , "[SC_421563_4]" )				-- 任務完成，離開！

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end
	if CheckID( NPC2 ) == true then DelObj( NPC2 ) end
	if CheckID( NPC3 ) == true then DelObj( NPC3 ) end

	Sleep( 50 )

	DisableQuest( OwnerID() , false )
	Sleep( 5 )

	LuaFunc_ResetObj( OwnerID() )

	return true

end

function LuaS_421571_Complete()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421571]" , 0 )	--  你因水神之力，呼喚出神使留存於此地的記憶。
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421571]" , C_SYSTEM )
	BeginPlot( TargetID() , "LuaS_421571_Show" , 0 )
	return 1
end

function LuaS_421571_Show()
	Sleep( 10 )
	local WaterElf = CreateMonsterByBOSSBatch( 111752 , OwnerID() , 3 , -20 )	-- 水神使者

	Say( WaterElf , "[SC_421571_1]" )		-- 遠古時期，有些人類使用符文改造自己的身體以獲得力量，這些改造自己的人類，後來被稱為魔族。
	Sleep( 30 )
	Say( WaterElf , "[SC_421571_2]" )		-- 不久後，世界正式進入由魔族所組成的領導階層統治的時代，魔族開始大規模討伐異己及鎮壓反抗勢力。
	Sleep( 30 )
	Say( WaterElf , "[SC_421571_3]" )		-- 爾後，由人王卡薩姆所統領的魔族反抗軍，由北方大陸開始展開反擊，並拯救許多人們脫離魔族的迫害。
	Sleep( 30 )
	Say( WaterElf , "[SC_421571_4]" )		-- 但是，在擁有「符文劍-血之禮讚」的鮮血之王出現之後，反抗軍面臨前所未有的危機......
	Sleep( 30 )

	Sleep( 30 )
	if CheckID( WaterElf ) == true then DelObj( WaterElf ) end
end


function LuaI_111762()

	while true do
		Sleep( 1800 )
		DisableQuest( OwnerID() , true )
		local P = Rand( 5 ) + 1
		if P == 1 then
			SetPosByFlag( OwnerID(), 780220 , 1 )
		elseif P == 2 then
			SetPosByFlag( OwnerID(), 780220 , 2 )
		elseif P == 3 then
			SetPosByFlag( OwnerID(), 780220 , 3 )
		elseif P == 4 then
			SetPosByFlag( OwnerID(), 780220 , 4 )
		else
			SetPosByFlag( OwnerID(), 780220 , 5 )
		end
		DisableQuest( OwnerID() , false )
	end

end

function LuaS_421572_CHECK()
	if CountBodyItem( OwnerID(), 203409 ) >= 1 then	-- 羅盤
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421572_1]" , 0 )	--  你沒有可以注入林木精華的物品！！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421572_1]" , C_DEFAULT )
		return false
	end
end

function LuaS_421572_Complete()
	if DelBodyItem( OwnerID(), 203409 , 1 ) then 
		BeginPlot( OwnerID() , "LuaS_421572_Show" , 0 )
	end
	return true
end

function LuaS_421572_Show()
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local BaseRoom = Obj:RoomID()
	local Goblin = CreateObj( 111825 , BaseX -5 , BaseY, BaseZ + 5 , BaseDir + 180 , 1 )	-- 哥布林
	AddToPartition( Goblin , BaseRoom )
	Sleep( 10 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421572_2]" , 0 )		-- 突然出現一隻哥布林搶走了你身上的羅盤！！
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421572_2]" , C_SYSTEM )
	PlayMotionEX( Goblin , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	Sleep( 20 )
	if CheckID( Goblin ) == true then DelObj( Goblin ) end
end

function LuaS_421574_Complete()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421571]" , 0 )	--  你因水神之力，呼喚出神使留存於此地的記憶。
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421571]" , C_SYSTEM )
	BeginPlot( TargetID() , "LuaS_421574_Show" , 0 )
	return true
end

function LuaS_421574_Show()
	Sleep( 10 )
	DisableQuest( OwnerID() , true )

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local BaseRoom = Obj:RoomID()
	local WaterElf = CreateObj( 111824 , BaseX +20 , BaseY + 5 , BaseZ + 35 , BaseDir , 1 )	-- 神使諾芙
	SetModeEx( WaterElf , EM_SetModeType_Gravity , false )		-- 取消重力
	AddToPartition( WaterElf , BaseRoom )

	Sleep( 10 )
	Say( WaterElf , "[SC_421574_1]" )		-- 我最不樂見的情形發生了......
	Sleep( 30 )
	Say( WaterElf , "[SC_421574_2]" )		-- 魔族與人類之間的激烈衝突，造成許多的傷亡與裂痕，然而我卻無能為力。
	Sleep( 30 )
	Say( WaterElf , "[SC_421574_3]" )		-- 縱使在我極力勸說之下，依舊無法讓安德薩斯打消征戰的念頭。
	Sleep( 30 )
	Say( WaterElf , "[SC_421574_4]" )		-- 不得已，我只好答應卡薩姆，幫助人類進行封印之戰......
	Sleep( 30 )

	Sleep( 30 )
	if CheckID( WaterElf ) == true then DelObj( WaterElf ) end
	DisableQuest( OwnerID() , false )
end

function LuaP_Goblin_Dead()
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )
end

function LuaS_111763_ShowFire()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111763 then
		CastSpell( TargetID() , TargetID() , 492269 )	-- 表演特效 火燒
	end
	return true
end

function LuaS_111764_Do()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111764 then
		local Monster = CreateMonsterByBOSSBatch( 101443 , TargetID() , 0 , 0 )	-- 索雷爾頓追殺者
		SetAttack( Monster , OwnerID() )
		Say( Monster , "[SC_111764_1]" )		-- 休想拿走羅盤！
		BeginPlot( Monster , "LuaS_101368_Monster" , 0 )
	end
	return true
end

function LuaS_101368_Monster()
	local Monster = OwnerID()
	while true do
		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --檢查是否離開戰鬥
			Sleep( 10 )	-- 一秒檢查一次	
		else
			if CheckID( Monster ) == true then	DelObj( Monster )	end 
			break
		end
	end
end