-- 702083 德國特殊觀賞寵
------------------------------------------

--灰狼特殊寵物 (2010.11.09德國需求)

function CheckSpSummonPet(MonsterID,Keyitem)  --召喚怪ID
	local Obj
	local Count = SetSearchRangeInfo( OwnerID(), 200 )
	for i = 1 , Count , 1 do --有PET
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:OrgID() == MonsterID and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and ReadRoleValue( ID , EM_RoleValue_OwnerDBID ) == ReadRoleValue( OwnerID() , EM_RoleValue_DBID ) then
			DelObj(ID)
		--	CancelBuff(OwnerID(), BuffID)
			local Name = Obj:OrgID()
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--你回收了寵物
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--你回收了寵物
			return false
		end
	end
	if CheckFlag( OwnerID() , Keyitem ) == true then  --今天召喚過
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_PETSP_TODAY]", C_SYSTEM )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PETSP_TODAY]", C_SYSTEM )
		return false
	else  --今天還沒召喚
		SetFlag( OwnerID()  , Keyitem , 1 )
		return true
	end
end

--===========================
--		德國寵物蛋
--===========================
function Germany_PetCheck_208530_to_208537()
	if CheckFlag(OwnerID(),544684) == TRUE then
		return
	else
		SetFlag(OwnerID(),544684,1)
		AddBuff(OwnerID(),508449,0,7200)
	end
end

function German_PetBuff_20110210()	--2011/02/10新作的Buff寵物
	if CheckFlag(OwnerID(),544724) == FALSE then
		SetFlag(OwnerID(),544724,1)
		AddBuff(OwnerID(),508368,0,7200)
	end
end


-----------------------------------------------------------
--2011 春雨節商城特殊寵物蛋

--靈月拉比
function Lua_208742_use()  
	Setflag(OwnerID(), 543905, 1 )   -- 靈月拉比  給予每日keyitem 
	AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
--	Say(OwnerID(), "Give key ")
end

--蛋殼雛雞
function Lua_208743_use()  
	Setflag(OwnerID(), 543906, 1 )   -- 靈月拉比  給予每日keyitem 
	AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
--	Say(OwnerID(), "Give key ")
end


-----------------------------------------------------------
--2011/06/07 特殊寵物蛋  --


function Lua_240182_use()   --惡靈寶貝熊
	if CheckFlag( OwnerID(), 545455 ) == true then
		return false
	else
		Setflag(OwnerID(), 545455, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end


function Lua_240183_use()   --攝魂小丑
	if CheckFlag( OwnerID(), 545456 ) == true then
		return false
	else
		Setflag(OwnerID(), 545456, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end


function Lua_240184_use()   --男矮人
	if CheckFlag( OwnerID(), 545457 ) == true then
		return false
	else
		Setflag(OwnerID(), 545457, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end


function Lua_240185_use()   --女矮人
	if CheckFlag( OwnerID(), 545458 ) == true then
		return false
	else
		Setflag(OwnerID(), 545458, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

function Lua_240512_use()   --小丑
	if CheckFlag( OwnerID(), 545472 ) == true then
		return false
	else
		Setflag(OwnerID(), 545472, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

function Lua_240513_use()   --殭屍
	if CheckFlag( OwnerID(), 545473 ) == true then
		return false
	else
		Setflag(OwnerID(), 545473, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

-------------2011/08/10 ?國GAMESCOM寵物------------
function Lua_240728_use()   --寵物蘑菇人
	if CheckFlag( OwnerID(), 545750 ) == true then
		return false
	else
		Setflag(OwnerID(), 545750, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

function LuaI_240729() -- 德國 寵物磨菇人 2011/08/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240728 , 1 } }
	-- 
	return BaseTressureProc(   itemset , 1 )
end

-------------2011/10/17 波蘭設計寵物-------------------
function Lua_209642_use()   --Darkmurmur每日
	if CheckFlag( OwnerID(), 546081 ) == true then
		return false
	else
		Setflag(OwnerID(), 546081, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

function Lua_209643_use()   --Darkmurmur_P每日
	if CheckFlag( OwnerID(), 546082 ) == true then
		return false
	else
		Setflag(OwnerID(), 546082, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

function Lua_209644_use()   --pizza Domino每日
	if CheckFlag( OwnerID(), 546083 ) == true then
		return false
	else
		Setflag(OwnerID(), 546083, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

------------2011/10/17 ?國萬聖寵物----------------

function Lua_240913_use()   --月影黑貓每日
	if CheckFlag( OwnerID(), 546085 ) == true then
		return false
	else
		Setflag(OwnerID(), 546085, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

function Lua_240914_use()	--南瓜死神每日
	if CheckFlag( OwnerID(), 546086 ) == true then
		return false
	else
		Setflag(OwnerID(), 546086, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

function Lua_240915_use()	--小惡魔每日
	if CheckFlag( OwnerID(), 546087 ) == true then
		return false
	else
		Setflag(OwnerID(), 546087, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end

-----------2012/1/04 ----三周年

--迷你希蕊花兒寵物

function Lua_241173_use()	--迷你希蕊花兒每日
	if CheckFlag( OwnerID(), 546208 ) == true then
		return false
	else
		Setflag(OwnerID(), 546208, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- 給效果buff 靈性之伴 
	end
end


--寵物給予BUFF共用劇情-- 2012/05/07更新 4.0.11之後推出BUFF寵物請共用此函式


function Lua_BuffPet_use()	--相輔之心BUFF
	if CheckFlag( OwnerID(), 544726 ) == true then
		return false
	else
		Setflag(OwnerID(), 544726, 1 )   --   給予每日keyitem 
		AddBuff(OwnerID(), 622851, 0,7200)  -- 給效果buff 相輔之心
	end
end