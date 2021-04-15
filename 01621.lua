--test
function Lua_mika_losttreasure_test4()  --燭臺著火
	PlayMotion(OwnerID(), ruFUSION_MIME_CROUCH_BEGIN) 
end

function Lua_mika_losttreasure_test5() --燭臺關 
	PlayMotion(OwnerID(), ruFUSION_MIME_CROUCH_END )
end

function Lua_mika_losttreasure_test6()  --
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE) 
end

function Lua_mika_losttreasure_test7()  --開門動作
	PlayMotion(OwnerID(), 145) 
end

function Lua_mika_losttreasure_test8()  --關門動作
	PlayMotion(OwnerID(), 147) 
end

function Lua_mika_losttreasure_test9()  --關門靜態
	PlayMotion(OwnerID(), 148) 
end

function Lua_mika_losttreasure_magictest1()
	AddBuff(OwnerID() , 505278 , 1, 900)  --15分鐘
	AddBuff(OwnerID() , 505279 , 1, 900)  --15分鐘  
	AddBuff(OwnerID() , 505280 , 1, 900)  --15分鐘 
	AddBuff(OwnerID() , 505281 , 1, 900)  --15分鐘
	AddBuff(OwnerID() , 505282 , 1, 900)  --15分鐘
	AddBuff(OwnerID() , 505283 , 1, 900)  --15分鐘  
	AddBuff(OwnerID() , 505284 , 1, 900)  --15分鐘 
	AddBuff(OwnerID() , 505285 , 1, 900)  --15分鐘
end

function Lua_mika_losttreasure_magictest2()
	AddBuff(OwnerID() , 505296 , 1, 900)  --15分鐘
end

function Lua_mika_losttreasure_magictest3()
	AddBuff(OwnerID() , 505297 , 1, 900)  --15分鐘
end

function Lua_mika_losttreasure_magictest4()
	AddBuff(OwnerID() , 505445 , 1, 900)  --15分鐘
end

function Lua_mika_losttreasure_delkey()
	SetFlag(OwnerID(),543491 , 0)
	SetFlag(OwnerID(),543492 , 0)
	SetFlag(OwnerID(),543493 , 0)
	SetFlag(OwnerID(),543494 , 0)
	SetFlag(OwnerID(),543495 , 0)
	SetFlag(OwnerID(),543496 , 0)
	SetFlag(OwnerID(),543497 , 0)
	SetFlag(OwnerID(),543487 , 0) -- candle 1
	SetFlag(OwnerID(),543488 , 0) -- candle 2
	SetFlag(OwnerID(),543489 , 0) -- candle 3
	SetFlag(OwnerID(),543572 , 0) -- 可看見傳送術選項
	SetFlag(OwnerID(),543490 , 0) -- 今天已使用過傳送
	SetFlag(OwnerID(),543406 , 0) -- 今天已參加過古代秘寶
	SetFlag(OwnerID(),543573 , 0 ) -- 刪 古代秘寶進行中
	Say(OwnerID(), "Del all keyitem.")
end


function Lua_mika_ResetColdown_trasure(ObjID,MagicID)  -- 清除特定法術CD時間

	local Class = GameObjInfo_Int( MagicID ,"ColdownClass")  -- 抓這個法術的施法冷卻欄位 - 分類
	local Type = GameObjInfo_Int( MagicID ,"ColdownType")  -- 抓這個法術的施法冷卻欄位次分類 - 冷卻類型
	local CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- 抓這個法術的施法冷卻欄位次分類 - 冷卻時間

	if CD > 0 then
		if Class == 3 then
			if Type == 26 or Type == 27 or Type == 28 or Type == 29 then  --26~29
				WriteRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type ,  0 ) 
--				Say( ObjID , ReadRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type ) )
				CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- 抓這個法術的施法冷卻欄位次分類 - 冷卻時間
--				Say( ObjID , "Class = "..Class )
--				Say( ObjID , "Type = "..Type )
--				Say( ObjID , "CD = "..CD )
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function lua_mika_ResetColdown_trasure01() -- 清除法術的CD時間
	lua_mika_ResetColdown_trasure( OwnerID() , 494772) --CD歸零
	lua_mika_ResetColdown_trasure( OwnerID() , 494773) --CD歸零
 	lua_mika_ResetColdown_trasure( OwnerID() , 494774) --CD歸零
	lua_mika_ResetColdown_trasure( OwnerID() , 494777) --CD歸零
end

