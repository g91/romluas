----------------弟弟
function LuaS_InSideWorld_0()
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
local PlayerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_INSIDEWORLD_DIALOG") , "LuaS_InSideWorld_1", 0 ) --我想了要進入「裏世界」
	if PlayerLV >= 50 then
		if PlayerMaxLv == 50 then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_MAXLVUP") , "LuaS_InSideWorld_2", 0 ) --我想要解除能力封印
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD") , "LuaS_InSideWorld_3", 0 ) --我想兌換職業套裝
	end
end
-----------------
function LuaS_InSideWorld_1()
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if PlayerLV < 45 then
	SetSpeakDetail( OwnerID(), GetString("SC_INSIDEWORLD_DIALOG_LVERROR")   )--你的實力不足以承受空間魔法，等你的實力強一點再來找我吧！
	else
		if ChangeZone( OwnerID() , 52 , 0 , 3214, 44, 157 , 270 ) then		--傳到52
		end
	end
end
-----------------
function LuaS_InSideWorld_2()
	WriteRoleValue(OwnerID(),EM_RoleValue_MaxLv, 60)
	SetSpeakDetail( OwnerID(), GetString("SC_MAXLVUP_1")   )--我已經將你被封印的能力解開了，快去提升你的實力吧！
	ScriptMessage( OwnerID(), OwnerID() , 1, GetString("SC_MAXLVUP_2"), "0xFFFFF266" )--恭喜你！你的最高等級限制提升到60級。
end
-----------------哥哥
function LuaS_InSideWorldBlack_0()
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
local PlayerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_INSIDEWORLD_DIALOG") , "LuaS_InSideWorldBlack_1", 0 ) --我想了要進入「裏世界」
	if PlayerLV >= 50 then
		if PlayerMaxLv == 50 then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_MAXLVUP") , "LuaS_InSideWorld_2", 0 ) --我想要解除能力封印
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD") , "LuaS_InSideWorld_3", 0 ) --我想兌換職業套裝
	end
end
-----------------
function LuaS_InSideWorldBlack_1()
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if PlayerLV < 45 then
	SetSpeakDetail( OwnerID(), GetString("SC_INSIDEWORLD_DIALOG_LVERROR")   )--你的實力不足以承受空間魔法，等你的實力強一點再來找我吧！
	else
		if ChangeZone( OwnerID() , 56 , 0 , -21108, -177, 5922 , 270 ) then		--傳到56
		end
	end
end
----------------弟弟出
function LuaS_OutSideWorld_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OUTSIDEWORLD_DIALOG") , "LuaS_OutSideWorld_1", 0 ) --我想要離開「裏世界」
end
-----------------
function LuaS_OutSideWorld_1()
	if ChangeZone( OwnerID() , 2 , 0 , 3214, 44, 157 , 270 ) then		--傳到2
	end
end
-----------------哥哥出
function LuaS_OutSideWorldBlack_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OUTSIDEWORLD_DIALOG") , "LuaS_OutSideWorldBlack_1", 0 ) --我想要離開「裏世界」
end
-----------------
function LuaS_OutSideWorldBlack_1()
	if ChangeZone( OwnerID() , 6 , 0 , -21108, -177, 5922 , 270 ) then		--傳到6
	end
end

----------------爸爸出
function LuaS_OutSideWorlddady_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OUTSIDEWORLD_DIALOG") , "LuaS_OutSideWorld_1", 0 ) --我想要離開「裏世界」
end
-----------------
function LuaS_OutSideWorlddady_1()
	if ChangeZone( OwnerID() , 2 , 0 , 3214, 44, 157 , 270 ) then		--傳到2
	end
end
---------------------------------
function LuaS_InSideWorld_3()
--我想兌換極品套裝
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_0")   )--請問你要兌換哪一種。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_1") , "LuaS_InSideWorld_3_1", 0 ) --我要兌換戰士套裝
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_2") , "LuaS_InSideWorld_3_2", 0 ) --我要兌換遊俠套裝
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_3") , "LuaS_InSideWorld_3_3", 0 ) --我要兌換盜賊套裝
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_4") , "LuaS_InSideWorld_3_4", 0 ) --我要兌換法師套裝
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_5") , "LuaS_InSideWorld_3_5", 0 ) --我要兌換祭司套裝
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_6") , "LuaS_InSideWorld_3_6", 0 ) --我要兌換騎士套裝
end
