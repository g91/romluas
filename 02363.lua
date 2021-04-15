--LuaS_424086_  伺機而動;決戰劇情

function LuaS_424086_TalkPlot()		--居尼爾斯對話劇情
	local Obj = OwnerID()
	if	(CheckCompleteQuest(Obj,424085)==true and CheckCompleteQuest(Obj,424086)==false)	then		
		if	CheckAcceptQuest(Obj,424086)==true	then
			if	CheckFlag(Obj,544901)==true	then
				LoadQuestOption(Obj)
			end
			if	ZONE14_PE04_Count>19	then
				SetSpeakDetail( Obj,"[SC_424086_2]")	--你還在等什麼？現在就是使用最好的時機，快使用[209414]！
			else
				SetSpeakDetail( Obj,"[SC_424086_1]")	--受到聚靈法陣的牽制，[209414]是無法發揮作用的，快去找[117735]，他將會指引你進行削弱的行動，立刻動身吧！
			end
		else
			LoadQuestOption(Obj)
		end
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424086_ItemCheckBefoUse()	--物品使用前檢查
	local Obj = OwnerID()
	local Area = LuaS_111256_ZoneID( ReadRoleValue( Obj , EM_RoleValue_ZoneID ) )
	if	Area ~=14	then										--不在14
		ScriptMessage( Obj, Obj, 1, "[SC_424086_7]", 0 )		--警告訊息：你現在還不能使用！
		return false
	end
	if	DW_CheckDis(Obj,780755,1,70)==false	then				--離得太遠
		ScriptMessage( Obj, Obj, 1, "[SC_424086_8]", 0 )		--警告訊息：你現在還不能使用！
		return false
	end
	
	if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)~=0	then	--正在施法
		ScriptMessage( Obj, Obj, 1, "[SC_424086_9]", 0 )		--警告訊息：你現在還不能使用！
		return false
	end
	if	CheckAcceptQuest(Obj,424086)==false	then				--沒接任務
		ScriptMessage( Obj, Obj, 1, "[SC_424086_10]", 0 )		--警告訊息：你現在還不能使用！
		return false
	end
	
	if	CheckFlag(Obj,544979)==true	then						--已經用過
		ScriptMessage( Obj, Obj, 1, "[SC_424086_11]", 0 )		--警告訊息：你現在還不能使用！
		return false
	end
	if	ZONE14_PE04_Count >7	then							--成功
		return true
	else														--完成PE次數還沒達到20次
		ScriptMessage( Obj, Obj, 1, "[SC_424086_1]", 0 )		--警告訊息：你現在還不能使用！
		return false
	end
end


function LuaS_424086_ItesExecute()	--物品使用後

	local Obj = OwnerID()
	AddBuff(Obj,508160,1,30)
	BeginPlot(Obj,"LuaS_424086_ShowPlot",0)
end

function LuaS_424086_ShowPlot()		--表演劇情

	local Obj = OwnerID()
	CastSpell(Obj,Obj,497569)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_12]", 0 )
	sleep(30)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_13]", 0 )
	sleep(25)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_14]", 0 )
	sleep(5)
	local BigSnake = DW_CreateObjEX("obj",117993,obj)
	local FireTarget = DW_CreateObjEX("flag",113568,780755,1)
	AdjustFaceDir(BigSnake,FireTarget,0)
	AddBuff(FireTarget,505455,1,-1)
	WriteRoleValue(BigSnake,EM_RoleValue_Register1,Obj)
	local HandleArray = {BigSnake,FireTarget}
	for a,b in pairs(HandleArray) do
		Lua_ObjDontTouch( b )
		CallPlot(b,"LuaS_424086_ProtectBreak",Obj)
	end
	sleep(20)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_15]", 0 )
	CastSpell(BigSnake,FireTarget,497563)
	sleep(15)
	CallPlot(BigSnake,"LuaS_424086_AutoFire",BigSnake,FireTarget)
end

function LuaS_424086_AutoFire(BigSnake,FireTarget)	--持續施放特效
	while true do
		for i=0,2,1 do
			SysCastSpellLv(BigSnake,FireTarget,497564+i,1)
		end
		sleep(10)
	end
end

function LuaS_424086_SpellCheck()	--海德拉衝出去之前
	local Obj = OwnerID()
	local Player = ReadRoleValue(Obj,EM_RoleValue_Register1)
	ScriptMessage( Player, Player, 2, "[SC_424086_16]", 0 )
	return true
end

function LuaS_424086_SpellExecute()	--自爆劇情
	local Obj = OwnerID()
	local Target = TargetID()
	SysCastSpellLv(Target,Target,497568,0)
	WriteRoleValue(Target,EM_RoleValue_LiveTime,3)
	local Player = ReadRoleValue(Obj,EM_RoleValue_Register1)
	--544979  強行開啟通道
	--544901  任務完成條件
	SetFlag(Player,544979,1)
	SetFlag(Player,544901,1)
	BeginPlot(Player,"LuaS_424086_EndMessage",0)
	DelObj(Obj)
end


function LuaS_424086_ProtectBreak(Obj) --防止玩家斷線的清除劇情
	while true	do
		if	Obj == nil	then
			DelObj(OwnerID())
		end
		if	CheckID(Obj)==false	then
			DelObj(OwnerID())
		end
		sleep(10)
	end
end

function LuaS_424086_EndMessage()	--秀後的收尾訊息
	local Obj = OwnerID()
	sleep(30)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_6]", 0 )
	CancelBuff(Obj,508160)
end

--14PE02對話劇情

function LuaS_424207_TalkPlot_1()	--湯米
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424208)==true	then
		SetSpeakDetail( Obj,"[SC_424207_00]")
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424207_TalkPlot_2()	--彼得
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424208)==true	then
		SetSpeakDetail( Obj,"[SC_424207_01]")
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424208_TalkPlot_1()	--傑克森
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424207)==true	then
		SetSpeakDetail( Obj,"[SC_424207_02]")
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424208_TalkPlot_2()	--洛伊
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424207)==true	then
		SetSpeakDetail( Obj,"[SC_424207_03]")
	else
		LoadQuestOption(Obj)
	end
end

--14PE02初始劇情
function LuaPE1402_DWInitial()
	local Obj = OwnerID()
	local OrgID_Obj = ReadRoleValue(Obj,EM_RoleValue_OrgID)

	local InitFuncTable = {
				--走散的馬匹
				[117528] = 	function ()
						local Obj = OwnerID()
						SetModeEx(Obj,EM_SetModeType_HideName,false) 
						SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
					end,
				--死去多時的冒險者
				[117530] = 	function ()
						local Obj = OwnerID()
						SetModeEx(Obj,EM_SetModeType_HideName,false) 
						SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
						WriteRoleValue(Obj,EM_RoleValue_HP,1)
						AddBuff(Obj,507532,1,-1)
						AddBuff(Obj,507514,1,-1)
						SetDefIdleMotion(Obj,ruFUSION_MIME_DEATH_LOOP)
						AddBuff(Obj,506823,0,-1)			--酸水
					end,
				--遺落的糧草
				[117529] = 	function ()
						local Obj = OwnerID()
						SetModeEx(Obj,EM_SetModeType_HideName,true) 
						SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
					end,
				--受重傷的冒險者
				[117534] = 	function ()
						local Obj = OwnerID()
						local HP = ReadRoleValue(Obj,EM_RoleValue_MaxHP)
						SetModeEx(Obj,EM_SetModeType_HideName,false) 
						SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
						WriteRoleValue(Obj,EM_RoleValue_HP,0.4*HP)
						AddBuff(Obj,507532,1,-1)
						AddBuff(Obj,507514,1,-1)
						if	GetModeEx( obj , EM_SetModeType_NotShowHPMP ) == false	then
							SetDefIdleMotion(Obj,ruFUSION_MIME_SIT_LOOP)
						end
						while true do
							sleep(70)
							SysCastSpellLv(Obj,Obj,492667,0)	--流血
						end
					end
					}
	InitFuncTable[OrgID_Obj]()
end