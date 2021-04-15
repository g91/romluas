--    Zone 134 看門狗_古薩拉
--      /gm ? zone 134 0 1662.1 891.5 -1710.4

-----解石術 解除化石術用
function lua_Dy_Z18Boss_1_Del()
	CancelBuff( TargetID(), 507619 )
end

function AP_Zone134_104458_hole()   ---石頭狗頭人
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ---讀出控制器
	local Boss = ReadRoleValue( AI , EM_RoleValue_Register1 ) ---讀出Boss
	local Counter = 0
	local Firt_attack = 0 ---第一次的攻擊
	local Check_No_Atk = 0 ----目標身上有不可攻擊之Buff 判斷
	local Attackplayer ----小狗頭人攻擊之玩家
	local Check_allattack = 0 ---判斷全場玩家都是石化狀態下
	while 1 do
		sleep(10)
		Counter = Counter + 1
		for i = 1 , 500 , 1 do
			Attackplayer = Lua_AP_HateTargetID( Boss )
			if i == 500 and CheckBuff(Attackplayer , 507619) == true then
				Check_allattack = 1
				SetAttack( OwnerID() ,Attackplayer  )
				break
			elseif CheckBuff(Attackplayer , 507619) == false then
				SetAttack( OwnerID() ,Attackplayer  )
				break
			end
		end
		
		--say(OwnerID(),"Counter ="..Counter)
		if Firt_attack == 0 then
			SetAttack( OwnerID() ,Attackplayer  )
			Firt_attack = 1
		end
		
		if CheckBuff(Attackplayer , 507619) == true and Check_allattack == 0 then --如果正在追擊的目標身上有此Buff則判斷值改變。
			Check_No_Atk = 1
		end
		
		if Counter >= 10 or Check_No_Atk == 1 then 
			SetAttack( OwnerID() ,Attackplayer  )
			Check_allattack = 0
			Counter = 0
			Check_No_Atk = 0
		end
	end
end

-------------以下開始為Boss門口的對話劇情-------------------
function AP_Zone134_bone()
	SetPlot( OwnerID(),"touch","AP_Zone134_bone_1",20 )
end

function AP_Zone134_bone_1()
	SetPlot(TargetID(), "touch" ,"" , 0) 
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Dog_NPC = star_CreateObj( TargetID() , 116435 , 0 , 0 , 0 , Room , 0) --生出給予Buff的NPC
	playMotion(Dog_NPC,ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	Say(Dog_NPC,"[SC_116435_8]")
end

function AP_Zone134_bone_2()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_0_0]" , "AP_Zone134_bone_2_0", 0 ) --開場白
	
end

function AP_Zone134_bone_2_0()
	if CheckBuff( OwnerID() , 507704) == true then --被誤認成手下的開場白
		SetSpeakDetail( OwnerID(), "[SC_116435_5]"   ) --被誤認成手下的開場白
		AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_5_1]" , "AP_Zone134_bone_2_3", 0 ) --尋求幫助
	elseif CheckBuff( OwnerID() , 507723 ) == true and CheckBuff ( OwnerID() , 507618 ) == false then --滅團且已成功拿過Buff
		SetSpeakDetail( OwnerID(), "[SC_116435_6]"   ) --還需要幫助嗎
		AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_3]" , "AP_Zone134_bone_2_2", 0 ) --接受，英靈對該玩家施法。
	elseif CheckBuff( OwnerID() , 507618 ) == true then --已拿到枯骨之殞
		SetSpeakDetail( OwnerID(), "[SC_116435_7]"   ) 
	elseif CheckBuff( OwnerID() , 507704) == false then
		SetSpeakDetail( OwnerID(), "[SC_116435_0_1]"   )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_0]" , "AP_Zone134_bone_2_1", 0 ) --開場白
	end
end

function AP_Zone134_bone_2_1() --問英靈怎麼會在這裡
	SetSpeakDetail( OwnerID(), "[SC_116435_1]"   )--英靈說明自己在這裡的原因
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_1_1]" , "AP_Zone134_bone_2_1_1", 0 ) --繼續聽下去。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_1_2]" , "AP_Zone134_bone_2_1_N", 0 ) --不繼續聽下去
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "AP_Zone134_bone_2_0", 0 ) --回到上一頁
end

function AP_Zone134_bone_2_1_N() --不繼續聽下去的對話
	SetSpeakDetail( OwnerID(), "[SC_116435_1_2_N]"   )--不繼續聽下去的對話
end

function AP_Zone134_bone_2_1_1() --繼續聽下去的對話
	SetSpeakDetail( OwnerID(), "[SC_116435_2]"   )--英靈說明自己可以幫助冒險者
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_3]" , "AP_Zone134_bone_2_2", 0 ) --接受，英靈對該玩家施法。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_4]" , "AP_Zone134_bone_2_1_1_N", 0 ) --拒絕
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "AP_Zone134_bone_2_1", 0 ) --回到上一頁
end

function AP_Zone134_bone_2_1_1_N() --誤認英靈是古薩拉手下的對話
	SetSpeakDetail( OwnerID(), "[SC_116435_4_N]"   )--拒絕幫助 
	Addbuff( OwnerID() ,507704,0, -1 ) ---上一個檢查用的空Buff
end

function AP_Zone134_bone_2_3() --表示歉意並尋求幫助
	SetSpeakDetail( OwnerID(), "[SC_116435_5_2]"   )--接受道歉並幫助玩家
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_5_3]" , "AP_Zone134_bone_2_2", 0 ) --無奈的接受幫助
end

function AP_Zone134_bone_2_2()
	CastSpellLV( TargetID() , OwnerID()  , 496155 , 1 )
	Addbuff( OwnerID() ,507723,0, -1 ) ---不需要再繁複對話的檢查 換ZONE消失
	CloseSpeak( OwnerID() )
	if CheckBuff( OwnerID() , 507704) == true then
		CancelBuff( OwnerID(), 507704 )
	end
end