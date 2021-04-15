--z27佈置=======================================
--=======================================
function Lua_PG_BanishtheCat()	--驅逐貓鼬
	local NPC = OwnerID()
	local Target = SearchRangeNPC( NPC, 70 )	
	local Num = table.getn(Target)		
	local OrgID
	local j
--	NPCSay(Ya, Percent)

	for i = 0,Num do
		OrgID = ReadRoleValue(Target[i], EM_RoleValue_OrgID)
			if OrgID == 107908 then
				j=i
				break
			end
	end

	if OrgID == 107908  then
		PlayMotion(NPC, ruFUSION_ACTORSTATE_ATTACK_1H)
		NPCSay(NPC, "[SC_Z27_DC_01]")
		Sleep(25)
		MoveToFlagEnabled(NPC, true)
	end
end

--z28佈置=======================================
--=======================================
function Lua_PG_Z28_NPC_1()			--醉醺醺海盜
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
--	NPCSay(NPC, "[SC_Z28_DC_1]")	--大夥乾杯！
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_LAUGH)
--	NPCSay(NPC, "[SC_Z28_DC_2]")	--讓我們把不爽推落海裡！擁著寶藏高唱！
	for  i=1,3 do
		PlayMotion(NPC,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Sleep(10)
	end
end

----------------------------------------------------------------------
--大聲叫賣
function Lua_PG_Z28_NPC_2()
	SetPlot( OwnerID(), "range", "Lua_PG_Z28_NPC_2_1", 50 )
end

function Lua_PG_Z28_NPC_2_1()
	local Player=OwnerID()
	local NPC=TargetID()
	local Num=DW_Rand(2)
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 and Num==1 then
		CallPlot( NPC, "Lua_PG_Z28_NPC_2_2", NPC, Player )
	end
end

function Lua_PG_Z28_NPC_2_2( NPC, Player )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
	AdjustFaceDir( NPC, Player, 0 )
	local Num = DW_Rand(3)
	NpcSay( NPC, "[SC_Z28_DC_"..(Num+2).."]" )	
	--3. 這裡的商品應有盡有！
	--4. 好東西全在這！走過路過千萬不要錯過！
	--5. 不要吝嗇！買件好東西，讓你尋寶更便利！
	Sleep(25)
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
end

----------------------------------------------------------------------
--小雞啄米
function Lua_PG_Z28_NPC_3()
	local NPC = OwnerID()
	local RandAct = {}
	RandAct[1] = ruFUSION_ACTORSTATE_EMOTE_IDLE1
	RandAct[2] = ruFUSION_ACTORSTATE_EMOTE_IDLE2
	local Num = DW_Rand(2)
	PlayMotion(NPC, RandAct[Num])
end

----------------------------------------------------------------------
--圍觀群眾
function Lua_PG_Z28_NPC_4()
	local NPC = OwnerID()

	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	NPCSay(NPC, "[SC_Z28_DC_6]")	--打
end

----------------------------------------------------------------------
--嗆聲
function Lua_PG_Z28_NPC_5()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSay(NPC, "[SC_Z28_DC_7]")	--臭小子！別以為我不敢在這裡動手！
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSay(NPC, "[SC_Z28_DC_8]")	--我只是給老闆一個面子！
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSay(NPC, "[SC_Z28_DC_9]")	--外面再遇到就砍死你！
	Sleep(25)
end

function Lua_PG_Z28_NPC_6()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSay(NPC, "[SC_Z28_DC_10]")	--「老賊」手下果然都是些「小賊」。
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSay(NPC, "[SC_Z28_DC_11]")	--沒本事還敢大聲。
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSay(NPC, "[SC_Z28_DC_12]")	--不如趁早離開島上吧！
	Sleep(25)
end