function LuaPG_GUICKKILL_z21()
	ic__MOB_BUFF_21()
	AddBuff ( OwnerID() , 620855 , 1 , -1 )
end

---------------------------------------------------------------------------
function secret_people_start_beach()				--村民對話劇情
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if	CheckCompleteQuest(player,424515) == true then
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_people_say_beach",0)
		else 
			LoadQuestOption(player)
		end
end

function secret_people_say_beach()
	local player=OwnerID()
	local sentence = {
			[1]="[SC_SECRET_PEOPLE01]",
			[2]="[SC_SECRET_PEOPLE02]",
			[3]="[SC_SECRET_PEOPLE03]",
			[4]="[SC_SECRET_PEOPLE04]",
			}
	local sentenceRand = Rand(4)+1
	SetSpeakDetail(player,sentence[sentenceRand])
end

---------------------------------------------------------------------------
function LuaPG_z21_01()
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_05]")
	Sleep(30)
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_06]")
	Sleep(50)
end

---------------------------------------------------------------------------
function LuaPG_z21_02()
	Sleep(80)
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_07]")
	Sleep(30)
end

---------------------------------------------------------------------------
function LuaPG_z21_03()
	Sleep(80)
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_07]")
	Sleep(30)
end

---------------------------------------------------------------------------
function LuaPG_z21_04()
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_EMOTE_IDLE2)
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_04]")
	Sleep(30)
end


---------------------------------------------------------------------------
function LuaPG_z21_05()
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_01]")
	Sleep(30)
end

---------------------------------------------------------------------------
function LuaPG_z21_06()
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_02]")
	Sleep(30)
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_03]")
end

---------------------------------------------------------------------------
function LuaPG_z21_07()
	for i=1,2 do
		NPCSAY(OwnerID(),"[SC_Z21_CHARACER_08]")
		Sleep(30)
	end
end

---------------------------------------------------------------------------
function LuaPG_z21_08()
	NPCSAY(OwnerID(),"[SC_Z21_CHARACER_09]")
	Sleep(30)
end

---------------------------------------------------------------------------
function LuaPG_z21_09()
	secret_rebel_start()
	LuaS_ComShop()
end

---------------------------------------------------------------------------
function LuaPG_z21_10()
	secret_people_start_beach()
	LuaS_ComShop()
end