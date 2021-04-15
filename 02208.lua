function lua_fireday_ev2_npc()
local key = CheckFlag (OwnerID(), 544706)
local key2 = CheckFlag(OwnerID(), 544704)
local key3 = CheckFlag(OwnerID(), 544705)
	if  key == FALSE and key2 == FALSE then
	SetSpeakDetail (OwnerID(), "[SC_FIREDAY_EV2_NPC]" )--忙翻天了，到了詠火節總是這麼忙碌...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_FIREDAY_EV2_01]","lua_fireday_ev2_01",0 )--廚師的請託
	AddSpeakOption(OwnerID(),TargetID(), "[SC_FIREDAY_04]","lua_fireday_changegoods",0)
	elseif key2 == TRUE and key3 == FALSE then
	SetSpeakDetail ( OwnerID(), "[SC_FIREDAY_EV2_07]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_FIREDAY_EV2_16]", "lua_fireday_ev2_00", 0)
	elseif key3 == TRUE and key == FALSE then
	SetSpeakDetail ( OwnerID(), "[SC_FIREDAY_EV2_07]" )	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_FIREDAY_EV2_08]", "lua_fireday_ev2_03", 0 )
	elseif key == TRUE then
	SetSpeakDetail(OwnerID(), "[SC_FIREDAY_EV2_05]" )
	AddSpeakOption(OwnerID(),TargetID(), "[SC_FIREDAY_04]","lua_fireday_changegoods",0)
	end

end
function lua_fireday_ev2_00()
	CloseSpeak(OwnerID() )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	ChangeZone(OwnerID(), 2, 0, 3190.4, 44.9, 163.7, 0)
end

function lua_fireday_ev2_01()
--	Say(OwnerID(), " 1 " )
--	Say(TargetID(), " 2 ")
	SetSpeakDetail (OwnerID(),"[SC_FIREDAY_EV2_02]" )--請玩家幫忙清除老鼠
	AddSpeakOption(OwnerID(), TargetID(), "[SC_FIREDAY_EV2_03]", "lua_fireday_ev2_02",0 )--清除老鼠
	AddSpeakOption(OwnerID(), TargetID(),"[SC_111352_2]" , "lua_fireday_ev2_npc", 0 ) --回到上一層
end

function lua_fireday_ev2_04()
	SetSpeakDetail (OwnerID(), "[SC_FIREDAY_EV2_14]" )
	AddSpeakOption (OwnerID(),TargetID(),"[SC_FIREDAY_EV2_16]", "lua_fireday_ev2_00",0)
end
function lua_fireday_ev2_02()
	local x=CheckFlag(OwnerID(), 544706)
	local y= CheckFlag ( OwnerID(), 544704)
	if x==TRUE then
			SetSpeakDetail(OwnerID(), "[SC_FIREDAY_EV2_05]" )
			AddSpeakOption(OwnerID(), TargetID(),"[SC_111352_2]" , "lua_fireday_ev2_npc", 0 ) 
	end
	if y == FALSE then
		SetSpeakDetail(OwnerID(), "[SC_FIREDAY_EV2_04]")--現在去取火趕走老鼠吧	
		SetFlag(OwnerID(), 544704, 1 ) --有KEY才能找祭壇點火。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_FIREDAY_EV2_13]","lua_fireday_ev2_04",0)
	end	
end

function lua_fireday_ev2_fire0()
	SetPlot(OwnerID(), "touch", "lua_fireday_ev2_fire", 50 )
end
--------火祭壇給火---------------	
function lua_fireday_ev2_fire()
local key=CheckFlag (OwnerID(), 544704)--驗證使用可能
local key2 = CheckFlag(OwnerID(),544705)
local FIN=CheckFlag(OwnerID(), 544706)
local l = FN_CountBuffLevel(OwnerID(), 508510)
	if key == FALSE then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_FIREDAY_EV2_09]" , C_SYSTEM )
	end
	if key == TRUE and key2 == FALSE then
		i=(l+10)
		CancelBuff(OwnerID(), 508510)
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_FIREDAY_EV2_15]" , C_SYSTEM )
		AddBuff(OwnerID(), 508510, i ,-1)
		AddBuff(OwnerID(), 508508,1,-1)
		i=0	
	elseif FIN == FALSE and key2 == TRUE then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_FIREDAY_EV2_10]" , C_SYSTEM )
	elseif key == TRUE and fin == TRUE then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_FIREDAY_EV2_09]" , C_SYSTEM )
	end
	BeginPlot(OwnerID(),"lua_fireday_ev2_firebuff",0)
end
-----------火焰BUFF遞減------------------
function lua_fireday_ev2_firebuff()
local i = CheckBuff(OwnerID(), 508510)
	while i~=FALSE do
		local x=FN_CountBuffLevel(OwnerID(), 508510 )
			x=(x-1)
			CancelBuff(OwnerID(), 508510)
			AddBuff(OwnerID(),508510,x,-1)
			Sleep(30)
				if x<= 0 then
				CancelBuff(OwnerID(), 508508)
				AttachCastMotionTool(OwnerID(), 212076)
					break
				end
		if i==FALSE then 
			break
		end
	end
	CancelBuff(OwnerID(), 508510)
end
---------------老鼠BUFF遞減、變動-----------
function lua_fireday_ev2_mouse0()
	local lv= Rand(50)+Rand(50)
	AddBuff(OwnerID(), 508509, lv ,-1)
	SetRandMove(OwnerID(), 200, 90,50)
	local x = CheckBuff(OwnerID(), 508509)
		while x ~= FALSE do
			local lv = Rand(50)+Rand(50)
			local time = RandRange(60, 200)
				CancelBuff(OwnerID(), 508509)
				AddBuff(OwnerID(), 508509,lv ,-1)
				Sleep(time)	
		end 
		if x == FALSE then
		AddBuff(OwnerID(), 508509, 1 ,-1)
		end
end
---------技能使用--------------------
function lua_fireday_ev2_mouse1()
local d= FN_CountBuffLevel(TargetID(),508509)
local f =FN_CountBuffLevel(OwnerID(), 508510)
local s = FN_CountBuffLevel(OwnerID(), 508614)

		if d>=f then
			AddBuff(OwnerID(), 508511,1, 5)
			CancelBuff (OwnerID(), 508510)
			SetRandMove(OwnerID(), 250, 90,90)
		end
		if d< f then
		local r=s+1
			CancelBuff(OwnerID(), 508614)
			AddBuff(OwnerID(), 508614,r,-1)
			NpcSay(TargetID(),"[SC_FIREDAY_EV2_12]")
			SetRandMove(TargetID(), 250, 90,90)
			BeginPlot(TargetID(),"lua_fireday_ev2_hideshow",0)
		local w = r+1
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_FIREDAY_EV2_11]"..w.."/10" , C_SYSTEM )
		local z=f-d
			CancelBuff (OwnerID(), 508510)	
			AddBuff(OwnerID(), 508510, z, -1)
			BeginPlot(OwnerID(),"lua_fireday_ev2_firebuff", 0)
		end
local lv = FN_CountBuffLevel(OwnerID(), 508614)
		if lv >= 9 then
			CancelBuff(OwnerID(), 508510)
			CancelBuff(OwnerID(), 508614)
			SetFlag(OwnerID(), 544705, 1 )
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_FIREDAY_EV2_10]" , C_SYSTEM )
		end

end

function lua_fireday_ev2_hideshow()
	Hide(OwnerID())
	Sleep(50)
	Show(OwnerID(),0 )
end
-----------獎勵部分------------------------
function lua_fireday_ev2_03()
	local FIN=CheckFlag(OwnerID(), 544705)--確認是否殺過10隻了
	local key = CheckFlag(OwnerID(), 544706)--確認是否完成過
	if FIN == TRUE and key == FALSE then
			SetSpeakDetail ( OwnerID(), "[SC_FIREDAY_EV2_06]" )
			GiveBodyItem ( OwnerID(), 208918 ,1)--給年菜
			GiveBodyItem  ( OwnerID(),  720310 ,1)--
			CancelBuff(OwnerID(), 508510)
			CancelBuff(OwnerID(), 508614)
			SetFlag(OwnerID(),544706, 1 )--給完成證明
		elseif FIN == FALSE then
			SetSpeakDetail ( OwnerID(), "[SC_FIREDAY_EV2_07]" )--還沒趕跑老鼠
		elseif FIN==TRUE and key== TRUE then
			SetSpeakDetail(OwnerID(), "[SC_FIREDAY_EV2_05]" )
	end
end
